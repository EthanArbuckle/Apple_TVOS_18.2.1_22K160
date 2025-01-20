id getUMUserManagerClass()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  v4 = 0LL;
  v5 = &v4;
  v6 = 0x2050000000LL;
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_189D48720;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_183D243DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183D24840( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}
}

void sub_183D24A88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183D24DA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_183D25268( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3 = 0LL;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    __int128 v4 = xmmword_189D48740;
    uint64_t v5 = 0LL;
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (!UserManagementLibraryCore_frameworkLibrary) {
    __getUMUserManagerClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    __getUMUserManagerClass_block_invoke_cold_2();
  }
  getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

__CFString *MICopyProcessNameForPid()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1) {
    return @"Unknown Process Name";
  }
  v2 = (void *)[objc_alloc(NSString) initWithBytes:buffer length:v1 encoding:4];
  [v2 lastPathComponent];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v3;
}

id MIFetchInfoForUsername(const char *a1, uid_t *a2, gid_t *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (sysconf(71) == -1) {
    MIFetchInfoForUsername_cold_1(&v15, v20);
  }
  uint64_t v8 = MEMORY[0x1895F8858]();
  v14 = 0LL;
  id result = (id)getpwnam_r(a1, &v15, (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v9, &v14);
  if ((_DWORD)result)
  {
    v13[1] = 0LL;
    memset(v20, 0, sizeof(v20));
    int v11 = (int)result;
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    v12 = strerror(v11);
    int v16 = 136315394;
    uint64_t v17 = a1;
    __int16 v18 = 2080;
    v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_13:
    MIFetchInfoForUsername_cold_2(&v16, v20);
  }

  if (!v14) {
    goto LABEL_13;
  }
  if (a2) {
    *a2 = v15.pw_uid;
  }
  if (a3) {
    *a3 = v15.pw_gid;
  }
  if (a4)
  {
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v15.pw_dir isDirectory:1 relativeToURL:0];
    id result = (id)objc_claimAutoreleasedReturnValue();
    *a4 = result;
  }

  return result;
}

uint64_t MIFetchInfoForUID(uint64_t a1, void *a2, gid_t *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (sysconf(71) == -1)
  {
    int v19 = *__error();
    v20 = (void *)*MEMORY[0x189607688];
    uint64_t v21 = v19;
    v22 = strerror(v19);
    _CreateError( (uint64_t)"MIFetchInfoForUID",  140LL,  v20,  v21,  0LL,  0LL,  @"Failed to get home dir path size: %s",  v23,  (uint64_t)v22);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0LL;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  uint64_t v10 = MEMORY[0x1895F8858]();
  v26 = 0LL;
  int v12 = getpwuid_r(a1, &v27, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), v11, &v26);
  if (v12)
  {
    v14 = (void *)*MEMORY[0x189607688];
    uint64_t v15 = v12;
    strerror(v12);
    _CreateError( (uint64_t)"MIFetchInfoForUID",  150LL,  v14,  v15,  0LL,  0LL,  @"getpwuid_r failed for uid %d : %s",  v16,  a1);
LABEL_4:
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0LL;
    goto LABEL_5;
  }

  if (!v26)
  {
    _CreateError( (uint64_t)"MIFetchInfoForUID",  155LL,  (void *)*MEMORY[0x189607688],  2LL,  0LL,  0LL,  @"getpwuid_r succeeded but no user was found with uid %d",  v13,  a1);
    goto LABEL_4;
  }

  if (a2)
  {
    [NSString stringWithUTF8String:v27.pw_name];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a3) {
    *a3 = v27.pw_gid;
  }
  if (a4)
  {
    uint64_t v18 = 1LL;
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v27.pw_dir isDirectory:1 relativeToURL:0];
    uint64_t v17 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 1LL;
  }

LABEL_5:
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if ((v18 & 1) == 0) {
    *a5 = v17;
  }
LABEL_10:

  return v18;
}

    v7 = v7;
    uint64_t v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }

  v14 = 0LL;
  uint64_t v6 = -[MIContainer setInfoValue:forKey:error:]( self,  "setInfoValue:forKey:error:",  MEMORY[0x189604A88],  @"com.apple.MobileContainerManager.StagedUpdateContainer",  &v14);
  v7 = v14;
  if (!v6)
  {
    -[MIContainer identifier](self, "identifier");
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    size_t v11 = _CreateAndLogError( (uint64_t)"-[MIContainer markContainerAsStagedUpdateContainer:]",  933LL,  @"MIInstallerErrorDomain",  4LL,  v7,  0LL,  @"Failed to set staged update container attribute for identifier %@ ",  v10,  (uint64_t)v9);

    v7 = (id)v11;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

    v7 = v7;
    uint64_t v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }

  v14 = 0LL;
  uint64_t v6 = -[MIContainer setInfoValue:forKey:error:]( self,  "setInfoValue:forKey:error:",  0LL,  @"com.apple.MobileContainerManager.StagedUpdateContainer",  &v14);
  v7 = v14;
  if (!v6)
  {
    -[MIContainer identifier](self, "identifier");
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    size_t v11 = _CreateAndLogError( (uint64_t)"-[MIContainer clearStagedUpdateContainerStatusWithError:]",  957LL,  @"MIInstallerErrorDomain",  4LL,  v7,  0LL,  @"Failed to clear staged update container attribute for identifier %@ ",  v10,  (uint64_t)v9);

    v7 = (id)v11;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

      uint64_t v13 = 1;
LABEL_13:
      int v19 = v41;
LABEL_14:
      self->_bundleType = v13;

      goto LABEL_15;
    }
  }

  else
  {
    bundleType = 0;
  }

    v14 = 0;
    goto LABEL_98;
  }

  if (-[MIBundle isWatchApp](self, "isWatchApp")) {
    v68 = -[MIBundle isApplicableToOSVersion:error:](self, "isApplicableToOSVersion:error:", @"2.9.9", 0LL);
  }
  else {
    v68 = 0;
  }
  if (!-[MIBundle isPlaceholder](self, "isPlaceholder") && v5 && ![v8 count])
  {
    -[MIBundle identifier](self, "identifier");
    obj = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  772LL,  @"MIInstallerErrorDomain",  122LL,  0LL,  &unk_189D63F48,  @"The app extension stub app %@ must have at least one app extension, but none were found.",  v46,  (uint64_t)obj);
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    v76 = 0LL;
    v77 = 0LL;
    uint64_t v10 = 0LL;
    v75 = 0LL;
    uint64_t v13 = 0LL;
LABEL_95:

LABEL_96:
    size_t v9 = v15;
    size_t v11 = (void *)v75;
    int v12 = (void *)v76;
    if (a3) {
      goto LABEL_97;
    }
    goto LABEL_5;
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v8;
  v69 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
  if (!v69)
  {
    v76 = 0LL;
    v77 = 0LL;
    uint64_t v10 = 0LL;
    v74 = 0LL;
    v75 = 0LL;
    uint64_t v15 = v9;
    goto LABEL_75;
  }

  v76 = 0LL;
  v77 = 0LL;
  uint64_t v10 = 0LL;
  v74 = 0LL;
  v75 = 0LL;
  v72 = *(void *)v88;
  v71 = v5 & v7;
  v70 = !v5 | v7;
  uint64_t v15 = v9;
  while (2)
  {
    for (i = 0LL; i != v69; ++i)
    {
      uint64_t v17 = v15;
      if (*(void *)v88 != v72) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v87 + 1) + 8 * i);
      v86 = v15;
      int v19 = objc_msgSend(v18, "validateBundleMetadataWithError:", &v86, v63);
      uint64_t v15 = v86;

      if (!v19)
      {
        uint64_t v13 = (void *)v74;
        goto LABEL_96;
      }

      if ([v18 isFileProviderNonUIExtension])
      {
        if (v74)
        {
          [v18 identifier];
          size_t v9 = (id)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  786LL,  @"MIInstallerErrorDomain",  62LL,  0LL,  &unk_189D63F70,  @"Multiple file provider app extensions found in app but only one is allowed (found %@ ; already found %@)",
            v51,
          v52 = (uint64_t)v9);

          uint64_t v15 = (id)v52;
          uint64_t v13 = (void *)v74;
          goto LABEL_95;
        }

        v74 = [v18 identifier];
      }

      if (v71)
      {
        if (([v18 isMapsGeoServicesExtension] & 1) == 0)
        {
          v20 = -[MIBundle identifier](self, "identifier");
          uint64_t v21 = [v20 isEqualToString:@"com.apple.MapsExternalComponents"];

          if ((v21 & 1) == 0)
          {
            -[MIBundle identifier](self, "identifier");
            size_t v9 = (id)objc_claimAutoreleasedReturnValue();
            [v18 extensionPointIdentifier];
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  794LL,  @"MIInstallerErrorDomain",  59LL,  0LL,  &unk_189D63F98,  @"App %@ is forbidden from providing an extension of type %@",  v58,  (uint64_t)v9);

            uint64_t v15 = (id)v59;
            goto LABEL_94;
          }
        }
      }

      if ((v70 & 1) == 0 && ([v18 isMessagePayloadProviderExtension] & 1) == 0)
      {
        [v18 identifier];
        size_t v9 = (id)objc_claimAutoreleasedReturnValue();
        [v18 extensionPointIdentifier];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  801LL,  @"MIInstallerErrorDomain",  123LL,  0LL,  &unk_189D63FC0,  @"Messages stub apps may only have a single message payload provider app extension, but this stub app has an extension %@ of type %@",  v54,  (uint64_t)v9);
        v57 = LABEL_88:;

        goto LABEL_93;
      }

      if ([v18 isMessagePayloadProviderExtension])
      {
        if (v75)
        {
          [v18 identifier];
          size_t v9 = (id)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  810LL,  @"MIInstallerErrorDomain",  121LL,  0LL,  &unk_189D63FE8,  @"Multiple message payload provider extensions found in app but only one is allowed (found %@ ; already found %@)",
            v55,
            (uint64_t)v9);
          v57 = LABEL_85:;

          goto LABEL_93;
        }

        v75 = [v18 identifier];
      }

      if (![v18 isWatchKitExtension])
      {
        if (v68)
        {
          [v18 bundleParentSubdirectory];
          passwd v27 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v28 = [v27 isEqualToString:@"PlugIns"];

          if (v28)
          {
            [v18 bundleURL];
            size_t v9 = (id)objc_claimAutoreleasedReturnValue();
            [v9 path];
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  853LL,  @"MIInstallerErrorDomain",  118LL,  0LL,  &unk_189D640B0,  @"WatchKit 2 app contains a non-WatchKit extension at %@. WatchKit apps specifying a MinimumOSVersion earlier than 3.0 must have non-WatchKit extensions embedded within the WatchKit extension.",  v60,  (uint64_t)v53);
            goto LABEL_88;
          }
        }

        if ([v18 isSiriIntentsExtension])
        {
          if (!v10) {
            uint64_t v10 = (void *)objc_opt_new();
          }
          [v18 extensionAttributes];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          size_t v9 = v29;
          if (!v29) {
            goto LABEL_70;
          }
          v66 = a3;
          v67 = v8;
          [v29 objectForKeyedSubscript:@"IntentsSupported"];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v31 = v30;
          v32 = [v31 countByEnumeratingWithState:&v82 objects:v93 count:16];
          if (v32)
          {
            v33 = v32;
            v34 = *(void *)v83;
            while (2)
            {
              for (j = 0LL; j != v33; ++j)
              {
                if (*(void *)v83 != v34) {
                  objc_enumerationMutation(v31);
                }
                if ([v10 containsObject:*(void *)(*((void *)&v82 + 1) + 8 * j)])
                {
                  v47 = -[MIBundle identifier](self, "identifier");
                  _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  871LL,  @"MIInstallerErrorDomain",  117LL,  0LL,  &unk_189D640D8,  @"More than one Siri Intents app extension in the app %@ declares the value %@ in the IntentsSupported array in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist.",  v48,  (uint64_t)v47);
                  goto LABEL_79;
                }
              }

              v33 = [v31 countByEnumeratingWithState:&v82 objects:v93 count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }

          v36 = v10;
        }

        else
        {
          if (!v77) {
            v77 = (void *)objc_opt_new();
          }
          [v18 extensionAttributes];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          size_t v9 = v37;
          if (!v37) {
            goto LABEL_70;
          }
          v66 = a3;
          v67 = v8;
          [v37 objectForKeyedSubscript:@"IntentsSupported"];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v31 = v38;
          v39 = [v31 countByEnumeratingWithState:&v78 objects:v92 count:16];
          if (v39)
          {
            v40 = v39;
            v41 = *(void *)v79;
            while (2)
            {
              for (k = 0LL; k != v40; ++k)
              {
                if (*(void *)v79 != v41) {
                  objc_enumerationMutation(v31);
                }
                if ([v77 containsObject:*(void *)(*((void *)&v78 + 1) + 8 * k)])
                {
                  v47 = -[MIBundle identifier](self, "identifier");
                  _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  891LL,  @"MIInstallerErrorDomain",  117LL,  0LL,  &unk_189D64100,  @"More than one Siri Intents UI app extension in the app %@ declares the value %@ in the IntentsSupported array in the ExtensionAttributes dictionary in the NSExtensionDictionary in its Info.plist.",  v49,  (uint64_t)v47);
                  v50 = LABEL_79:;

                  uint64_t v15 = (id)v50;
                  a3 = v66;
                  uint64_t v8 = v67;
                  goto LABEL_94;
                }
              }

              v40 = [v31 countByEnumeratingWithState:&v78 objects:v92 count:16];
              if (v40) {
                continue;
              }
              break;
            }
          }

          v36 = v77;
        }

        [v36 addObjectsFromArray:v31];

        a3 = v66;
        uint64_t v8 = v67;
LABEL_70:

        continue;
      }

      if (v76)
      {
        [v18 identifier];
        size_t v9 = (id)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  821LL,  @"MIInstallerErrorDomain",  82LL,  0LL,  &unk_189D64010,  @"Multiple WatchKit app extensions found in app but only one is allowed (found %@ ; already found %@)",
          v56,
          (uint64_t)v9);
        goto LABEL_85;
      }

      v76 = [v18 identifier];
      if (-[MIBundle isPlaceholder](self, "isPlaceholder")) {
        continue;
      }
      if (-[MIBundle isWatchApp](self, "isWatchApp"))
      {
        [v18 extensionAttributes];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  841LL,  @"MIInstallerErrorDomain",  93LL,  0LL,  &unk_189D64088,  @"WatchKit 2 app extension's NSExtension.NSExtensionAttributes dictionary is not present. It must contain a WKAppBundleIdentifier key set to the WatchKit app's bundle ID.",  v23,  v63);
          size_t v9 = v15;
          uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_94;
        }

        size_t v9 = v22;
        [v22 objectForKeyedSubscript:@"WKAppBundleIdentifier"];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        uint64_t v25 = v24;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          v26 = v25;
        }
        else {
          v26 = 0LL;
        }

        if (!v26)
        {
          v57 = _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  834LL,  @"MIInstallerErrorDomain",  93LL,  0LL,  &unk_189D64038,  @"WatchKit 2 app extension's NSExtension.NSExtensionAttributes.WKAppBundleIdentifier value is missing (should be WatchKit app's bundle ID).",  v43,  v63);
          goto LABEL_92;
        }
        v44 = -[MIBundle identifier](self, "identifier");
        v45 = [v26 isEqualToString:v44];

        if ((v45 & 1) == 0)
        {
          v65 = -[MIBundle identifier](self, "identifier");
          _CreateAndLogError( (uint64_t)"-[MIBundle validatePluginKitMetadataWithError:]",  837LL,  @"MIInstallerErrorDomain",  93LL,  0LL,  &unk_189D64060,  @"WatchKit 2 app extension's NSExtension.NSExtensionAttributes.WKAppBundleIdentifier value does not match WatchKit app's bundle ID (found %@; expected %@).",
            v61,
          v57 = (uint64_t)v26);

          uint64_t v15 = (id)v65;
LABEL_92:

LABEL_93:
          uint64_t v15 = (id)v57;
LABEL_94:
          uint64_t v13 = (void *)v74;
          goto LABEL_95;
        }

        goto LABEL_70;
      }

      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        v63 = v76;
        MOLogWrite();
      }
    }

    v69 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
    if (v69) {
      continue;
    }
    break;
  }

  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    size_t v9 = 0LL;
    uint64_t v10 = 1;
    goto LABEL_20;
  }

  v14 = v5;
  uint64_t v15 = open((const char *)[v14 fileSystemRepresentation], 256);
  if ((v15 & 0x80000000) != 0)
  {
    uint64_t v21 = *__error();
    v22 = (void *)*MEMORY[0x189607688];
    uint64_t v23 = v14;
    v24 = [v23 fileSystemRepresentation];
    strerror(v21);
    _CreateError( (uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]",  181LL,  v22,  v21,  0LL,  0LL,  @"Failed to open %s: %s",  v25,  v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 path];
    passwd v27 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle _validateDelegateClassWithError:]",  181LL,  @"MIInstallerErrorDomain",  73LL,  v26,  &unk_189D64650,  @"Failed to open executable %@ to validate sections.",  v28,  (uint64_t)v27);
    size_t v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    uint64_t v10 = 0;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  uint64_t v16 = v15;
  v31 = 0LL;
  uint64_t v17 = -[MIExtensionKitBundle _validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:]( self,  "_validatePresenceOfSwiftEntrySectionInFile:shouldHaveSwiftEntry:withError:",  v15,  v7 == 0LL,  &v31);
  uint64_t v18 = v31;
  int v19 = v18 == 0LL;
  uint64_t v10 = v17 && v19;
  if (v17 && v19) {
    size_t v9 = 0LL;
  }
  else {
    size_t v9 = v18;
  }
  close(v16);
  if (a3)
  {
LABEL_18:
    if ((v10 & 1) == 0)
    {
      size_t v9 = v9;
      uint64_t v10 = 0;
      *a3 = v9;
    }
  }

  return v9;
}

    uint64_t v10 = 0LL;
    uint64_t v8 = 0LL;
    if (!a3) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }

  v35 = 0LL;
  uint64_t v10 = v12;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 42, (uint64_t)&v35);
  if (v13 == -42031)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      [v9 path];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    v35 = 0LL;
  }

  else if (v13)
  {
    [v9 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]",  1917LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not get MID-based SINF status from SINF at %@: %ld",  v15,  (uint64_t)v14);
LABEL_28:
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = 0LL;
LABEL_29:
    size_t v11 = v7;
    if (!a3) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }

  v34 = 0LL;
  uint64_t v10 = v10;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 1, (uint64_t)&v34);
  if (v18)
  {
    [v9 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]",  1929LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not get purchaser DSID from SINF at %@: %ld",  v19,  (uint64_t)v14);
    goto LABEL_28;
  }

  v33 = 0LL;
  uint64_t v10 = v10;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 41, (uint64_t)&v33);
  if (v20)
  {
    [v9 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]",  1937LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not get family ID from SINF at %@: %ld",  v21,  (uint64_t)v14);
    goto LABEL_28;
  }

  v32 = 0LL;
  uint64_t v10 = v10;
  hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), 40, (uint64_t)&v32);
  if (v22)
  {
    [v9 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]",  1945LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Could not get downloader DSID from SINF at %@: %ld",  v23,  (uint64_t)v14);
    goto LABEL_28;
  }

  v26 = v35 != 0;
  uint64_t v8 = (void *)objc_opt_new();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v34];
  passwd v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setApplicationDSID:v27];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:v33];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setFamilyID:v28];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:v32];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setDownloaderDSID:v29];

  [v8 setHasMIDBasedSINF:v26];
  [v8 setIsMissingRequiredSINF:0];
  if (!a3) {
    goto LABEL_32;
  }
LABEL_30:
  if (!v8) {
    *a3 = v11;
  }
LABEL_32:
  v24 = v8;

  return v24;
}

  return v6;
}

  if (!a5) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v10 = v10;
  v14 = 0LL;
  *a5 = v10;
LABEL_13:

  return v14;
}

    uint64_t v16 = 0;
    goto LABEL_8;
  }

  [v7 bundleName];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 URLByAppendingPathComponent:v10];
  size_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 bundleURL];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 0LL;
  v14 = [v12 moveItemAtURL:v13 toURL:v11 error:&v21];
  uint64_t v15 = v21;

  if ((v14 & 1) == 0)
  {
    [v7 bundleURL];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer captureBundleByMoving:withError:]",  568LL,  @"MIInstallerErrorDomain",  20LL,  v15,  &unk_189D64A10,  @"Failed to move application at %@ into container path %@",  v18,  (uint64_t)v17);

    uint64_t v15 = (id)v19;
    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  objc_storeStrong((id *)&self->_bundle, a3);
  [v7 setBundleParentDirectoryURL:v9];
  [v7 setBundleContainer:self];
  uint64_t v16 = 1;
LABEL_8:

  return v16;
}

void MIGetCurrentMobileUserInfo(_DWORD *a1, _DWORD *a2)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1) {
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global);
  }
  *a1 = MIGetCurrentMobileUserInfo_uid;
  *a2 = MIGetCurrentMobileUserInfo_gid;
}

id __MIGetCurrentMobileUserInfo_block_invoke()
{
  return MIFetchInfoForUsername( "mobile",  (uid_t *)&MIGetCurrentMobileUserInfo_uid,  (gid_t *)&MIGetCurrentMobileUserInfo_gid,  0LL);
}

uint64_t MIAssumeIdentityOfUsername(const char *a1, void *a2)
{
  uint64_t v4 = 0LL;
  MIFetchInfoForUsername(a1, (uid_t *)&v4 + 1, (gid_t *)&v4, 0LL);
  return MIAssumeIdentity(HIDWORD(v4), v4, a2);
}

uint64_t MIAssumeIdentity(uint64_t a1, gid_t a2, void *a3)
{
  if (!(a2 | a1))
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v6) {
      MIAssumeIdentity_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  id v27 = 0LL;
  id v28 = 0LL;
  int v14 = MIFetchInfoForUID(a1, &v28, 0LL, 0LL, &v27);
  id v15 = v28;
  id v16 = v27;
  if (v14)
  {
    if (pthread_setugid_np(a1, a2))
    {
      uint64_t v17 = __error();
      uint64_t v18 = (void *)*MEMORY[0x189607688];
      uint64_t v26 = *v17;
      strerror(*v17);
      _CreateAndLogError( (uint64_t)"MIAssumeIdentity",  228LL,  v18,  v26,  0LL,  0LL,  @"pthread_setugid_np failed for uid %d gid %d; error %d (%s)",
        v19,
        a1);
    }

    else
    {
      if (!initgroups((const char *)[v15 UTF8String], a2))
      {
        uint64_t v24 = 1LL;
        goto LABEL_16;
      }

      uint64_t v20 = *__error();
      MIRestoreIdentity();
      uint64_t v21 = (void *)*MEMORY[0x189607688];
      strerror(v20);
      _CreateAndLogError( (uint64_t)"MIAssumeIdentity",  238LL,  v21,  v20,  0LL,  0LL,  @"SYS_initgroups failed; error %d (%s)",
        v22,
        v20);
    }
    uint64_t v23 = ;

    id v16 = (id)v23;
  }

  if (a3)
  {
    id v16 = v16;
    uint64_t v24 = 0LL;
    *a3 = v16;
  }

  else
  {
    uint64_t v24 = 0LL;
  }

LABEL_16:
  return v24;
}

  return bundleType;
}

  return v10;
}

  return v8;
}

  return v17;
}

uint64_t MIRestoreIdentity()
{
  uid_t v0 = getuid();
  if (!(v0 | getgid()))
  {
    BOOL v1 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v1) {
      MIRestoreIdentity_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

  uint64_t result = pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if ((_DWORD)result)
  {
    int v10 = *__error();
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    strerror(v10);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }

  return result;
}

uint64_t MIAssumeMobileIdentity(void *a1)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1) {
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global);
  }
  return MIAssumeIdentity(MIGetCurrentMobileUserInfo_uid, MIGetCurrentMobileUserInfo_gid, a1);
}

id MILoadInfoPlist(void *a1, void *a2)
{
  return MILoadInfoPlistWithError(a1, a2, 0LL);
}

id MILoadInfoPlistWithError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v24 = 0LL;
  uint64_t v7 = (__CFBundle *)_CreateCFBundle(v5, 0LL, &v24);
  id v8 = v24;
  if (v7)
  {
    if (v6)
    {
      uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
      if (FilteredInfoPlist)
      {
        uint64_t v11 = (const void *)FilteredInfoPlist;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v11))
        {
          [MEMORY[0x189603FC8] dictionaryWithDictionary:v11];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v11);
        }

        else
        {
          CFTypeID v17 = CFGetTypeID(v11);
          CFStringRef v18 = CFCopyTypeIDDescription(v17);
          uint64_t v20 = _CreateAndLogError( (uint64_t)"MILoadInfoPlistWithError",  363LL,  @"MIInstallerErrorDomain",  3LL,  0LL,  0LL,  @"Object returned from _CFBundleCreateFilteredInfoPlist was not a dictionary, was type %@",  v19,  (uint64_t)v18);

          if (v18) {
            CFRelease(v18);
          }
          CFRelease(v11);
          uint64_t v13 = 0LL;
          id v8 = (id)v20;
        }

        goto LABEL_17;
      }

      uint64_t v16 = _CreateAndLogError( (uint64_t)"MILoadInfoPlistWithError",  357LL,  @"MIInstallerErrorDomain",  3LL,  0LL,  0LL,  @"Failed to get filtered Info.plist with keys %@ from bundle %@",  v10,  (uint64_t)v6);
    }

    else
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v7);
      if (InfoDictionary)
      {
        [MEMORY[0x189603FC8] dictionaryWithDictionary:InfoDictionary];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = v15;
        if (v15) {
          [v15 removeObjectForKey:@"CFBundleInfoPlistURL"];
        }
LABEL_17:
        CFRelease(v7);
        if (!a3) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }

      [v5 path];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = _CreateAndLogError( (uint64_t)"MILoadInfoPlistWithError",  378LL,  @"MIInstallerErrorDomain",  35LL,  0LL,  0LL,  @"CFBundleGetInfoDictionary failed for bundle at %@",  v22,  (uint64_t)v21);
    }

    uint64_t v13 = 0LL;
    id v8 = (id)v16;
    goto LABEL_17;
  }

  uint64_t v13 = 0LL;
  if (!a3) {
    goto LABEL_20;
  }
LABEL_18:
  if (!v13) {
    *a3 = v8;
  }
LABEL_20:

  return v13;
}

const void *_CreateCFBundle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    [v5 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"_CreateCFBundle",  296LL,  @"MIInstallerErrorDomain",  3LL,  0LL,  0LL,  @"Failed to create CFBundle for %@",  v13,  (uint64_t)v12);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = 0LL;
    if (!a3)
    {
LABEL_23:
      uint64_t v7 = 0LL;
      goto LABEL_24;
    }

LABEL_11:
    id v11 = v11;
    uint64_t v7 = 0LL;
    *a3 = v11;
    goto LABEL_24;
  }

  uint64_t v7 = (const void *)Unique;
  id v8 = (id)_CFBundleCopyInfoPlistURL();
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      uint64_t v26 = v7;
      MOLogWrite();
    }

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", @"Info.plist", 0, v26);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v28 = 0LL;
  char v10 = [v9 itemIsFileAtURL:v8 error:&v28];
  id v11 = v28;

  if ((v10 & 1) == 0)
  {
    [v11 domain];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = *MEMORY[0x189607688];
    if ([v14 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v16 = [v11 code];

      if (v16 == 2)
      {
        [v8 path];
        CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"_CreateCFBundle",  310LL,  @"MIInstallerErrorDomain",  35LL,  v11,  0LL,  @"Info.plist missing at %@",  v18,  (uint64_t)v17);
        goto LABEL_22;
      }
    }

    else
    {
    }

    [v11 domain];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v19 isEqualToString:v15])
    {
      uint64_t v20 = [v11 code];

      if (v20 == 22)
      {
        [v8 path];
        CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = (uint64_t)v17;
        uint64_t v22 = @"Expected Info.plist file at %@ but found something that was not a file.";
        uint64_t v23 = 312LL;
LABEL_21:
        _CreateAndLogError( (uint64_t)"_CreateCFBundle",  v23,  @"MIInstallerErrorDomain",  3LL,  v11,  0LL,  v22,  v21,  v27);
        uint64_t v24 = LABEL_22:;

        CFRelease(v7);
        id v11 = (id)v24;
        if (!a3) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
    }

    else
    {
    }

    [v8 path];
    CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = (uint64_t)v17;
    uint64_t v22 = @"Error when introspecting %@";
    uint64_t v23 = 314LL;
    goto LABEL_21;
  }

  if (a2)
  {
    id v8 = v8;
    *a2 = v8;
  }

  return v11;
}

      *a3 = v13;
      goto LABEL_12;
    }

    _CreateAndLogError( (uint64_t)"-[MIContainer isStagedUpdateContainer:withError:]",  988LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Value of key %@ on %@ was not a number",  v14,  (uint64_t)@"com.apple.MobileContainerManager.StagedUpdateContainer");
    id v11 = v8;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

  [v7 domain];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v11 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
LABEL_14:

    goto LABEL_15;
  }

  uint64_t v12 = [v8 code];

  if (v12 == 24)
  {

    char v10 = 0LL;
    uint64_t v13 = 0;
    id v8 = 0LL;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  return v11;
}

    goto LABEL_12;
  }

  uint64_t v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError( (uint64_t)"-[MIBundle _validateAppNSPrivacyTrackingDomainsWithError:]",  1828LL,  @"MIInstallerErrorDomain",  193LL,  0LL,  0LL,  @"The NSPrivacyTrackingDomains key in the app's Info.plist must have an array value. An entry was found of non-array type %@.",  v15,  (uint64_t)v14);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
LABEL_16:
    uint64_t v12 = 0;
    goto LABEL_17;
  }

  _CreateAndLogError( (uint64_t)"-[MIFilesystemScanner _scanAppsDirectory:withError:]",  76LL,  @"MIInstallerErrorDomain",  27LL,  v8,  0LL,  @"Failed to enumerate %@",  v11,  (uint64_t)v6);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v8 = v13;
    uint64_t v12 = 0;
    *a4 = v8;
  }

  else
  {
    uint64_t v12 = 0;
    id v8 = v13;
  }

  _CreateAndLogError( (uint64_t)"-[MIFilesystemScanner _scanFrameworkDirectory:withError:]",  159LL,  @"MIInstallerErrorDomain",  27LL,  v8,  0LL,  @"Failed to enumerate %@",  v11,  (uint64_t)v6);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v8 = v13;
    uint64_t v12 = 0;
    *a4 = v8;
  }

  else
  {
    uint64_t v12 = 0;
    id v8 = v13;
  }

  _CreateAndLogError( (uint64_t)"-[MIFilesystemScanner _scanExtensionKitDirectory:withError:]",  227LL,  @"MIInstallerErrorDomain",  27LL,  v8,  0LL,  @"Failed to enumerate %@",  v11,  (uint64_t)v6);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    id v8 = v13;
    uint64_t v12 = 0;
    *a4 = v8;
  }

  else
  {
    uint64_t v12 = 0;
    id v8 = v13;
  }

    uint64_t v16 = v14;
    CFTypeID v17 = 0;
    *a5 = v16;
    goto LABEL_18;
  }

  CFTypeID v17 = 1;
LABEL_18:

  return v17;
}

  return v11;
}

  return v11;
}
}

  return v21;
}

LABEL_12:
  v30 = 0LL;
  CFTypeID v17 = -[MIExecutableBundle updateSinfWithData:error:](self, "updateSinfWithData:error:", v8, &v30, v25, v26, v27);
  uint64_t v18 = v30;
  uint64_t v19 = v18;
  if (!v17)
  {
    uint64_t v22 = 0LL;
    uint64_t v21 = v18;
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  v29 = v18;
  uint64_t v20 = -[MIExecutableBundle validateSinfWithError:](self, "validateSinfWithError:", &v29);
  uint64_t v21 = v29;

  if (v20)
  {
    id v28 = v21;
    -[MIExecutableBundle fairPlaySinfInfoWithError:](self, "fairPlaySinfInfoWithError:", &v28);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v28;

    uint64_t v21 = v23;
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  if (v6) {
    -[MIExecutableBundle bestEffortRollbackSinfData:](self, "bestEffortRollbackSinfData:", v11);
  }
  uint64_t v22 = 0LL;
  if (a5)
  {
LABEL_21:
    if (!v22) {
      *a5 = v21;
    }
  }

  uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    uint64_t v20 = v20;
    uint64_t v21 = 0;
    *a3 = v20;
  }

  else
  {
    uint64_t v21 = 0;
  }

  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v29;
}

LABEL_24:
  return v7;
}

  if (cf)
  {
    CFRelease(cf);
    cf = 0LL;
  }

  if (v25)
  {
    CFRelease(v25);
    uint64_t v25 = 0LL;
  }

  uint64_t v21 = v12;

  return v21;
}

  return v29;
}

  return v13;
}

  return v26;
}

id MILoadRawInfoPlist(void *a1, void *a2)
{
  id v11 = 0LL;
  id v12 = 0LL;
  uint64_t v3 = _CreateCFBundle(a1, &v12, &v11);
  id v4 = v12;
  id v5 = v11;
  if (v3)
  {
    id v10 = v5;
    objc_msgSend(MEMORY[0x189603F68], "MI_dictionaryWithContentsOfURL:options:error:", v4, 0, &v10);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v10;

    id v8 = (void *)[v6 mutableCopy];
    CFRelease(v3);
    id v5 = v7;
    if (!a2) {
      goto LABEL_7;
    }
  }

  else
  {
    id v8 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
  }

  if (!v8) {
    *a2 = v5;
  }
LABEL_7:

  return v8;
}

void MIRecordCurrentBuildVersion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)_CFCopySystemVersionDictionary();
  id v7 = 0LL;
  char v3 = objc_msgSend(v2, "MI_writeToURL:format:options:error:", v1, 200, 268435457, &v7);
  id v4 = v7;
  if ((v3 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      [v2 objectForKeyedSubscript:*MEMORY[0x189604B60]];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 objectForKeyedSubscript:@"ReleaseType"];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

LABEL_8:
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    [v1 path];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    goto LABEL_8;
  }
}

uint64_t MIIsBuildUpgrade(uint64_t a1, void *a2)
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (!v3)
  {
LABEL_15:
    MOLogWrite();
LABEL_16:
    id v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v9 = 0LL;
    id v11 = 0LL;
    id v7 = 0LL;
    goto LABEL_26;
  }

  uint64_t v5 = *MEMORY[0x189604B60];
  uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x189604B60]];
  if (!v6)
  {
    goto LABEL_15;
  }

  id v7 = (id)v6;
  id v8 = (void *)_CFCopySystemVersionDictionary();
  if (!v8)
  {
    id v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_25;
  }

  uint64_t v9 = v8;
  uint64_t v10 = [v8 objectForKeyedSubscript:v5];
  if (!v10)
  {
    id v12 = 0LL;
    uint64_t v13 = 0LL;
LABEL_25:
    id v11 = 0LL;
    goto LABEL_26;
  }

  id v11 = (void *)v10;
  [v4 objectForKeyedSubscript:@"ReleaseType"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"ReleaseType"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqual:v11])
  {
    uint64_t v14 = 0LL;
    goto LABEL_29;
  }

LABEL_26:
  if (a2)
  {
    id v7 = v7;
    *a2 = v7;
  }

  uint64_t v14 = 1LL;
LABEL_29:

  return v14;
}

  uint64_t v22 = v20;
  if ((v5 & 0x800) == 0)
  {
LABEL_19:
    uint64_t v23 = v22;
    goto LABEL_29;
  }

  return v30;
}

id MILoadFilteredPlist(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeRef v25 = 0LL;
  CFTypeRef cf = 0LL;
  id v24 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfURL:v5 options:3 error:&v24];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v24;
  if (!v7)
  {
    [v5 path];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  502LL,  @"MIInstallerErrorDomain",  4LL,  v8,  0LL,  @"Failed to read plist from %@",  v15,  (uint64_t)v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }

  if (!v6)
  {
    id v23 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v7 options:0 format:0 error:&v23];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v23;

    if (!v10)
    {
      [v5 path];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  520LL,  @"MIInstallerErrorDomain",  4LL,  v13,  0LL,  @"Failed to decode plist from %@",  v20,  (uint64_t)v12);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }

    id v8 = v13;
    goto LABEL_12;
  }

  int Filtered = _CFPropertyListCreateFiltered();
  uint64_t v10 = (void *)v25;
  if (Filtered) {
    BOOL v11 = v25 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    CFTypeRef v25 = 0LL;
LABEL_12:
    objc_opt_class();
    id v12 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v17 = v12;
    }
    else {
      id v17 = 0LL;
    }

    if (v17)
    {
      id v16 = v8;
      goto LABEL_24;
    }

    uint64_t v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  526LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Object returned from _CFPropertyListCreateFiltered was not a dictionary, was type %@",  v19,  (uint64_t)v13);
    goto LABEL_18;
  }

  id v12 = (id)cf;
  CFTypeRef cf = 0LL;
  [v5 path];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError( (uint64_t)"MILoadFilteredPlist",  511LL,  @"MIInstallerErrorDomain",  4LL,  v12,  0LL,  @"Failed to decode plist from %@",  v14,  (uint64_t)v13);
LABEL_18:
  id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  id v8 = v13;
LABEL_21:

  if (a3)
  {
    id v16 = v16;
    id v12 = 0LL;
    *a3 = v16;
  }

  else
  {
    id v12 = 0LL;
  }

id MICopyCurrentBuildVersion()
{
  if (MICopyCurrentBuildVersion_onceToken != -1) {
    dispatch_once(&MICopyCurrentBuildVersion_onceToken, &__block_literal_global_72);
  }
  return (id)MICopyCurrentBuildVersion_buildVersion;
}

void __MICopyCurrentBuildVersion_block_invoke()
{
  uid_t v0 = (void *)_CFCopySystemVersionDictionaryValue();
  objc_opt_class();
  id v1 = v0;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  char v3 = (void *)MICopyCurrentBuildVersion_buildVersion;
  MICopyCurrentBuildVersion_buildVersion = (uint64_t)v2;
}

uint64_t MIAssertHighResourceUsage()
{
  do
    unsigned int v0 = __ldaxr((unsigned int *)&sResourceExpectationCount);
  while (__stlxr(v0 + 1, (unsigned int *)&sResourceExpectationCount));
  if (!v0)
  {
    getpid();
    return proc_disable_cpumon();
  }

  return result;
}

uint64_t MIClearResourceAssertion()
{
  do
  {
    unsigned int v0 = __ldaxr((unsigned int *)&sResourceExpectationCount);
    unsigned int v1 = v0 - 1;
  }

  while (__stlxr(v1, (unsigned int *)&sResourceExpectationCount));
  if (!v1)
  {
    getpid();
    return proc_set_cpumon_defaults();
  }

  return result;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_2()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void _InitTraversalState(void *a1)
{
}

void *_DestroyTraversalState(uint64_t a1)
{
  for (i = *(void **)a1; *(void *)a1; i = *(void **)a1)
  {
    *(void *)a1 = *i;
    --*(_BYTE *)(a1 + 1051);
    _FreeContinuation(a1, (uint64_t)i);
  }

  while (1)
  {
    char v3 = *(void **)(a1 + 8);
    if (!v3) {
      break;
    }
    *(void *)(a1 + _Block_object_dispose((const void *)(v9 - 96), 8) = *v3;
    free(v3);
  }

  while (1)
  {
    uint64_t result = *(void **)(a1 + 16);
    if (!result) {
      break;
    }
    *(void *)(a1 + 16) = *result;
    free(result);
  }

  return result;
}

void *_PopContinuation(uint64_t a1)
{
  uint64_t result = *(void **)a1;
  if (result)
  {
    *(void *)a1 = *result;
    --*(_BYTE *)(a1 + 1051);
  }

  return result;
}

uint64_t _FreeContinuation(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a2 + 8);
  if (v4)
  {
    *id v4 = *(void *)(a1 + 8);
    *(void *)(a1 + _Block_object_dispose((const void *)(v9 - 96), 8) = v4;
  }

  uint64_t result = *(unsigned int *)(a2 + 24);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a2 + 24) = -1;
  }

  *(void *)a2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2;
  return result;
}

void *_CreateAndPushContinuation(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 16) = *v2;
  }

  else
  {
    id v2 = malloc(0x20uLL);
    if (!v2)
    {
      return 0LL;
    }
  }

  AttrBuffer = _GetAttrBuffer(a1);
  v2[1] = AttrBuffer;
  if (!AttrBuffer)
  {
    free(v2);
    return 0LL;
  }

  v2[2] = 0LL;
  v2[3] = 0xFFFFFFFFLL;
  void *v2 = *(void *)a1;
  *(void *)a1 = v2;
  ++*(_BYTE *)(a1 + 1051);
  return v2;
}

void *_GetAttrBuffer(uint64_t a1)
{
  unsigned int v1 = *(void **)(a1 + 8);
  if (v1)
  {
    *(void *)(a1 + _Block_object_dispose((const void *)(v9 - 96), 8) = *v1;
    return v1;
  }

  unsigned int v3 = *(unsigned __int8 *)(a1 + 1050);
  if (v3 >= 0x10)
  {
    id v4 = *(void **)a1;
    if (*(void *)a1 && v4[1])
    {
      while (1)
      {
        id v5 = v4;
        id v4 = (void *)*v4;
        if (!v4) {
          break;
        }
        if (!v4[1])
        {
          if (!v5) {
            goto LABEL_13;
          }
          break;
        }
      }

      unsigned int v1 = (void *)v5[1];
      v5[1] = 0LL;
      *((_DWORD *)v5 + 7) = 0;
      *((_DWORD *)v5 + 5) = 0;
      int v6 = *((_DWORD *)v5 + 6);
      if ((v6 & 0x80000000) == 0)
      {
        close(v6);
        *((_DWORD *)v5 + 6) = -1;
      }
    }

    else
    {
LABEL_13:
      return 0LL;
    }

    return v1;
  }

  *(_BYTE *)(a1 + 1050) = v3 + 1;
  return malloc(0x4000uLL);
}

uint64_t _PushContinuation(uint64_t result, void *a2)
{
  *a2 = *(void *)result;
  *(void *)uint64_t result = a2;
  ++*(_BYTE *)(result + 1051);
  return result;
}

BOOL _PushPathBuf(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 1048);
  unint64_t v4 = a3 + v3 + 1;
  if (v4 <= 0x3FF)
  {
    uint64_t v6 = a1 + 24;
    *(_BYTE *)(a1 + 24 + v3) = 47;
    memcpy((void *)(*(unsigned __int16 *)(a1 + 1048) + a1 + 24 + 1), a2, a3);
    *(_WORD *)(a1 + 104_Block_object_dispose((const void *)(v9 - 96), 8) = v4;
    *(_BYTE *)(v6 + v4) = 0;
  }

  return v4 < 0x400;
}

uint64_t _PopPathBuf(uint64_t result)
{
  uint64_t v1 = *(unsigned __int16 *)(result + 1048);
  if (*(_WORD *)(result + 1048))
  {
    do
    {
      BOOL v2 = *(_BYTE *)(result + 23 + v1) == 47 || v1 == 1;
      --v1;
    }

    while (!v2);
  }

  *(_BYTE *)(result + 24 + (unsigned __int16)v1) = 0;
  *(_WORD *)(result + 104_Block_object_dispose((const void *)(v9 - 96), 8) = v1;
  return result;
}

uint64_t _LastPathElement(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = a1 + a2;
  while (1)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4 + v3;
    int v7 = *(unsigned __int8 *)(v6 - 1);
    if (v6 - 1 <= a1) {
      break;
    }
    uint64_t v3 = v5 - 1;
    if (v7 == 47) {
      goto LABEL_6;
    }
  }

  if (v7 == 47)
  {
LABEL_6:
    *a3 = -v5;
    return v4 + v5;
  }

  return 0LL;
}

uint64_t TraverseDirectory(uint64_t a1, char a2, unsigned int a3, void *a4, void *a5)
{
  return TraverseDirectoryWithPostTraversal(a1, a2, a3, a4, a5, 0LL);
}

uint64_t TraverseDirectoryWithPostTraversal( uint64_t a1, char a2, unsigned int a3, void *a4, void *a5, void *a6)
{
  uint64_t v127 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  id v12 = a6;
  uint64_t v104 = 0LL;
  uint64_t v105 = 0LL;
  uint64_t v103 = 5LL;
  if ((a3 & 1) != 0) {
    int v13 = -1610579959;
  }
  else {
    int v13 = -1610612727;
  }
  LODWORD(v105) = (a3 >> 6) & 4 | (a3 >> 7) & 1;
  HIDWORD(v103) = v13 & 0xBDB8FFFF | (((a3 >> 1) & 7) << 16) & 0xBDBFFFFF | (((a3 >> 5) & 1) << 22) & 0xBDFFFFFF | (((a3 >> 4) & 1) << 30) | (((a3 >> 6) & 1) << 25);
  HIDWORD(v104) = 6;
  bzero(&v121, 0x420uLL);
  if (!a1)
  {
    _CreateAndLogError( (uint64_t)"TraverseDirectoryWithPostTraversal",  891LL,  @"MIInstallerErrorDomain",  25LL,  0LL,  0LL,  @"%s was called with a NULL path parameter.",  v14,  (uint64_t)"_Bool TraverseDirectoryWithPostTraversal(const char *, TraverseDirectoryOptions, TraverseDirectoryAdditio nalFetchProperties, NSError *__autoreleasing *, __strong TraverseDirectoryItemBlock, __strong TraverseDir ectoryPostTraversalBlock)");
    goto LABEL_15;
  }

  unint64_t v15 = __strlcpy_chk();
  if (v15 >= 0x400)
  {
    _CreateAndLogError( (uint64_t)"TraverseDirectoryWithPostTraversal",  898LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Attempted to iterate directories starting at a path that was too long: %s",  v16,  a1);
LABEL_15:
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }

  unsigned __int16 v125 = v15;
  id v17 = _CreateAndPushContinuation((uint64_t)&v121);
  if (!v17)
  {
    _CreateAndLogError( (uint64_t)"TraverseDirectoryWithPostTraversal",  906LL,  (void *)*MEMORY[0x189607688],  12LL,  0LL,  0LL,  @"Failed to create a continuation",  v18,  v97);
    goto LABEL_15;
  }

  if ((a2 & 1) == 0)
  {
    uint64_t v19 = (uint64_t)v17;
    char v20 = a2;
    id v21 = v11;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v109 = 0u;
    *(_OWORD *)__errnum = 0u;
    uint64_t v120 = 0LL;
    __int128 v118 = 0u;
    __int128 v119 = 0u;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    __int128 v115 = 0u;
    id v107 = 0LL;
    v108 = 0LL;
    char v106 = 0;
    int ContinuationFD = _GetContinuationFD((uint64_t)&v121, v19, 0, &v107);
    id v23 = v107;
    if (ContinuationFD == -1)
    {
      a2 = v20;
    }

    else
    {
      if (!fgetattrlist(ContinuationFD, &v103, *(void **)(v19 + 8), 0x4000uLL, 0))
      {
        _ParseAttributeBuf((uint64_t)v124, *(void *)(v19 + 8), (uint64_t)&v109, &v108, 0LL, &v106);
        a2 = v20;
        if (DWORD1(v111) != 2)
        {
          int v69 = *(_DWORD *)(v19 + 24);
          if ((v69 & 0x80000000) == 0)
          {
            close(v69);
            *(_DWORD *)(v19 + 24) = -1;
          }
        }

        uint64_t v70 = 0LL;
        while (1)
        {
          uint64_t v71 = v70;
          v72 = (char *)&v121 + v125 + v70;
          int v73 = v72[23];
          if (v72 + 23 <= v124) {
            break;
          }
          uint64_t v70 = v71 - 1;
          if (v73 == 47) {
            goto LABEL_102;
          }
        }

        if (v73 != 47)
        {
          uint64_t v28 = _CreateAndLogError( (uint64_t)"_CallBlockForBaseItem",  839LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to locate last path element in %s",  v68,  (uint64_t)v124);
          goto LABEL_13;
        }

LABEL_102:
        BOOL v74 = _CallClientBlock( v20,  (uint64_t)v124,  v125,  (uint64_t)&v124[v125 + v71],  -v71,  0,  (uint64_t)&v109,  (uint64_t)&v115,  (uint64_t)v108,  v21)
            - 1 < 2;
        int v75 = DWORD1(v111) != 2 || v74;
        if (v106) {
          int v65 = 1;
        }
        else {
          int v65 = v75;
        }
        id v64 = 0LL;
        int v66 = 1;
        goto LABEL_89;
      }

      int v24 = *__error();
      CFTypeRef v25 = (void *)*MEMORY[0x189607688];
      uint64_t v26 = v24;
      strerror(v24);
      uint64_t v28 = _CreateAndLogError( (uint64_t)"_CallBlockForBaseItem",  823LL,  v25,  v26,  0LL,  0LL,  @"fgetattrlist for %s failed: %s",  v27,  (uint64_t)v124);
      a2 = v20;
LABEL_13:

      id v23 = (id)v28;
    }

    id v64 = v23;
    int v65 = 0;
    int v66 = 0;
    id v23 = v64;
LABEL_89:

    id v29 = v64;
    if (!v66) {
      goto LABEL_16;
    }
    if (v65) {
      goto LABEL_91;
    }
    goto LABEL_21;
  }

  id v29 = 0LL;
LABEL_21:
  v32 = v121;
  if (!v121) {
    goto LABEL_91;
  }
  v98 = a4;
  char v99 = a2;
  while (1)
  {
    v121 = (int32x2_t *)*v32;
    --v126;
    if (!*(void *)&v32[1])
    {
      AttrBuffer = _GetAttrBuffer((uint64_t)&v121);
      v32[1] = (int32x2_t)AttrBuffer;
      if (!AttrBuffer) {
        break;
      }
    }

    while (1)
    {
      id v102 = v11;
      id v101 = v12;
      uint64_t v120 = 0LL;
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      __int128 v116 = 0u;
      __int128 v117 = 0u;
      __int128 v114 = 0u;
      __int128 v115 = 0u;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      *(_OWORD *)__errnum = 0u;
      __int128 v111 = 0u;
      __int128 v109 = 0u;
      unsigned int v36 = v32[3].u16[2];
      if (!v32[3].i16[2]) {
        goto LABEL_62;
      }
      unsigned __int32 v37 = v32[2].u32[0];
      unsigned __int32 v38 = v32[2].u32[1];
      unsigned int v39 = v37 - v38;
      if (v37 < v38)
      {
        _CreateAndLogError( (uint64_t)"_ProcessContinuation",  650LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Internal error: totalProcessedEntryCount (%u) was less than reprocessCount (%u)",  v35,  v32[2].u32[0]);
LABEL_93:
        v67 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_117:
        id v82 = v67;

LABEL_118:
        id v83 = v82;

        v84 = (void *)v32[1];
        if (v84)
        {
          void *v84 = v122;
          v122 = v84;
        }

        int v85 = v32[3].i32[0];
        if ((v85 & 0x80000000) == 0)
        {
          close(v85);
          v32[3].i32[0] = -1;
        }

        int32x2_t *v32 = (int32x2_t)v123;
        v123 = v32;
        id v29 = v83;
        goto LABEL_123;
      }

      if (v37 == v38)
      {
        uint64_t v40 = v32[3].u16[3];
      }

      else
      {
        if (v39 >= v36)
        {
          v32[2].i32[1] = v38 + v36;
          v32[3].i16[3] = v36;
          goto LABEL_62;
        }

        uint64_t v40 = (unsigned __int16)(v37 - v38);
        v32[3].i16[3] = v39;
        v32[2].i32[1] = v37;
      }

      int32x2_t v41 = v32[1];
      if ((_DWORD)v40)
      {
        int v42 = 0;
        unint64_t v43 = 0LL;
        while (1)
        {
          uint64_t v44 = *(unsigned int *)(*(void *)&v41 + v43);
          v43 += v44;
          if (v43 > 0x4000) {
            break;
          }
        }

        _CreateAndLogError( (uint64_t)"_ProcessContinuation",  685LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Read entry length %u for entry %hu but that put us off the end of the buffer",  v35,  v44);
        goto LABEL_93;
      }

      unint64_t v43 = 0LL;
LABEL_37:
      id v100 = v11;
      if (v40 < v36)
      {
        while (1)
        {
          id v107 = 0LL;
          v108 = 0LL;
          char v106 = 0;
          _ParseAttributeBuf((uint64_t)v124, *(void *)&v41 + v43, (uint64_t)&v109, &v107, &v108, &v106);
          uint64_t v46 = (uint64_t)v108;
          if (!v108) {
            break;
          }
          v43 += v109;
          if (v43 > 0x4000)
          {
            v76 = @"MIInstallerErrorDomain";
            uint64_t v97 = v109;
            v77 = @"Read entry length %u for entry %hu but that put us off the end of the buffer";
            uint64_t v78 = 709LL;
            goto LABEL_112;
          }

          uint64_t v47 = __errnum[2];
          if (__errnum[2])
          {
            v80 = (void *)*MEMORY[0x189607688];
            strerror(__errnum[2]);
            _CreateAndLogError( (uint64_t)"_ProcessContinuation",  716LL,  v80,  v47,  0LL,  0LL,  @"got error while processing entry %hu in %s : %s",  v81,  v40);
            goto LABEL_116;
          }

          size_t v48 = (v111 - 1);
          if (!_PushPathBuf((uint64_t)&v121, v108, v48))
          {
            v76 = (__CFString *)*MEMORY[0x189607688];
            uint64_t v97 = v46;
            v77 = @"Could not append element %s of length %zd to path %s because it would make the path longer than MAXPATHLEN";
            uint64_t v78 = 723LL;
            uint64_t v79 = 63LL;
            goto LABEL_115;
          }

          int v49 = _CallClientBlock( v99,  (uint64_t)v124,  v125,  v46,  v48,  v126 + 1,  (uint64_t)&v109,  (uint64_t)&v115,  (uint64_t)v107,  v102);
          if (v49 == 2)
          {
            char v106 = 1;
          }

          else if (v49 == 1)
          {
            goto LABEL_127;
          }

          ++v32[3].i16[3];
          v32[2] = vadd_s32(v32[2], (int32x2_t)0x100000001LL);
          if (DWORD1(v111) == 2)
          {
            if (!v106)
            {
              int32x2_t *v32 = (int32x2_t)v121;
              v121 = v32;
              ++v126;
              if (_CreateAndPushContinuation((uint64_t)&v121))
              {

                id v11 = v100;
                goto LABEL_85;
              }

              v76 = (__CFString *)*MEMORY[0x189607688];
              v77 = @"Failed to create a continuation";
              uint64_t v78 = 753LL;
              uint64_t v79 = 12LL;
LABEL_115:
              _CreateAndLogError((uint64_t)"_ProcessContinuation", v78, v76, v79, 0LL, 0LL, v77, v45, v97);
LABEL_116:
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              id v11 = v100;
              goto LABEL_117;
            }

            if (v12)
            {
              v50 = (void *)MEMORY[0x186E26FA4]();
              int v51 = (*((uint64_t (**)(id, _BYTE *))v12 + 2))(v101, v124);
              objc_autoreleasePoolPop(v50);
              if (!v51)
              {
LABEL_127:

                v92 = (void *)v32[1];
                id v11 = v100;
                if (v92)
                {
                  void *v92 = v122;
                  v122 = v92;
                }

                int v93 = v32[3].i32[0];
                if ((v93 & 0x80000000) == 0)
                {
                  close(v93);
                  v32[3].i32[0] = -1;
                }

                int32x2_t *v32 = (int32x2_t)v123;
                v123 = v32;
                goto LABEL_91;
              }
            }
          }

          uint64_t v52 = v125;
          if (v125)
          {
            id v11 = v100;
            do
            {
              unsigned __int16 v53 = v52 - 1;
              BOOL v54 = v124[v52 - 1] == 47 || v52 == 1;
              --v52;
            }

            while (!v54);
            uint64_t v52 = v53;
          }

          else
          {
            id v11 = v100;
          }

          uint64_t v40 = (v40 + 1);
          v124[v52] = 0;
          unsigned __int16 v125 = v52;
        }

        v76 = @"MIInstallerErrorDomain";
        uint64_t v97 = v40;
        v77 = @"Entry %hu in %s did not include name information even though we requested it.";
        uint64_t v78 = 702LL;
LABEL_112:
        uint64_t v79 = 4LL;
        goto LABEL_115;
      }

LABEL_62:
      *(void *)&__int128 v109 = 0LL;
      int v55 = _GetContinuationFD((uint64_t)&v121, (uint64_t)v32, 1, &v109);
      id v56 = (id)v109;
      if (v55 == -1) {
        goto LABEL_125;
      }
      int v57 = getattrlistbulk(v55, &v103, *(void **)&v32[1], 0x4000uLL, 0LL);
      if (!v57) {
        break;
      }
      if (v57 == -1)
      {
        int v86 = *__error();
        v87 = (void *)*MEMORY[0x189607688];
        uint64_t v88 = v86;
        uint64_t v89 = v32[2].u32[0];
        strerror(v86);
        uint64_t v91 = _CreateAndLogError( (uint64_t)"_PopulateAttrBuf",  410LL,  v87,  v88,  0LL,  0LL,  @"getattrlistbulk failed on entry %u in %s : %s",  v90,  v89);

        id v56 = (id)v91;
LABEL_125:
        id v82 = v56;

        goto LABEL_118;
      }

      v32[3].i16[2] = v57;
      v32[3].i16[3] = 0;
    }

    if (!v12 || (v99 & 1) != 0 && !v121) {
      goto LABEL_71;
    }
    v58 = (void *)MEMORY[0x186E26FA4]();
    if (!(*((unsigned int (**)(id, _BYTE *))v12 + 2))(v101, v124))
    {
      v95 = (void *)v32[1];
      if (v95)
      {
        void *v95 = v122;
        v122 = v95;
      }

      int v96 = v32[3].i32[0];
      if ((v96 & 0x80000000) == 0)
      {
        close(v96);
        v32[3].i32[0] = -1;
      }

      int32x2_t *v32 = (int32x2_t)v123;
      v123 = v32;
      objc_autoreleasePoolPop(v58);
      goto LABEL_91;
    }

    objc_autoreleasePoolPop(v58);
LABEL_71:
    uint64_t v59 = v125;
    if (v125)
    {
      do
      {
        unsigned __int16 v60 = v59 - 1;
        BOOL v61 = v124[v59 - 1] == 47 || v59 == 1;
        --v59;
      }

      while (!v61);
      uint64_t v59 = v60;
    }

    v124[v59] = 0;
    unsigned __int16 v125 = v59;
    v62 = (void *)v32[1];
    if (v62)
    {
      void *v62 = v122;
      v122 = v62;
    }

    int v63 = v32[3].i32[0];
    if ((v63 & 0x80000000) == 0)
    {
      close(v63);
      v32[3].i32[0] = -1;
    }

    int32x2_t *v32 = (int32x2_t)v123;
    v123 = v32;
LABEL_85:
    v32 = v121;
    if (!v121)
    {
LABEL_91:
      _DestroyTraversalState((uint64_t)&v121);
      uint64_t v30 = 1LL;
      goto LABEL_19;
    }
  }

  uint64_t v94 = _CreateAndLogError( (uint64_t)"TraverseDirectoryWithPostTraversal",  931LL,  (void *)*MEMORY[0x189607688],  12LL,  0LL,  0LL,  @"Failed to locate an attrBuf",  v34,  v97);

  id v29 = (id)v94;
LABEL_123:
  a4 = v98;
LABEL_16:
  _DestroyTraversalState((uint64_t)&v121);
  if (a4)
  {
    id v29 = v29;
    uint64_t v30 = 0LL;
    *a4 = v29;
  }

  else
  {
    uint64_t v30 = 0LL;
  }

LABEL_19:
  return v30;
}

  return v21;
}

  return 1LL;
}

  return v15;
}

  return v6;
}

uint64_t _GetContinuationFD(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v4 == -1)
  {
    if (a3) {
      int v8 = 1048832;
    }
    else {
      int v8 = 0x200000;
    }
    uint64_t v9 = a1 + 24;
    uint64_t v10 = open((const char *)(a1 + 24), v8);
    if ((v10 & 0x80000000) == 0)
    {
      uint64_t v4 = v10;
      id v5 = 0LL;
      *(_DWORD *)(a2 + 24) = v4;
      goto LABEL_14;
    }

    id v11 = __error();
    uint64_t v12 = *v11;
    int v13 = (void *)*MEMORY[0x189607688];
    if ((_DWORD)v12 == 2)
    {
      strerror(2);
      _CreateError((uint64_t)"_GetContinuationFD", 301LL, v13, 2LL, 0LL, 0LL, @"Failed to open %s : %s", v14, v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_13;
      }
    }

    else
    {
      strerror(*v11);
      _CreateAndLogError( (uint64_t)"_GetContinuationFD",  303LL,  v13,  v12,  0LL,  0LL,  @"Failed to open %s : %s",  v15,  v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_13:
        uint64_t v4 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
    }

    id v5 = v5;
    *a4 = v5;
    goto LABEL_13;
  }

  id v5 = 0LL;
LABEL_14:

  return v4;
}

uint64_t _ParseAttributeBuf(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, _BYTE *a6)
{
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 4_Block_object_dispose((const void *)(v9 - 96), 8) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = *(_DWORD *)a2;
  int v9 = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a3 + 4) = *(_OWORD *)(a2 + 4);
  *(_DWORD *)(a3 + 20) = v9;
  int v10 = *(_DWORD *)(a3 + 4);
  if ((v10 & 0x20000000) == 0)
  {
    id v11 = (uint64_t *)(a2 + 24);
    if ((v10 & 1) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    int v13 = 0LL;
    if ((v10 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  *(_DWORD *)(a3 + 24) = *(_DWORD *)(a2 + 24);
  id v11 = (uint64_t *)(a2 + 28);
  if ((v10 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v12 = *v11;
  *(void *)(a3 + 2_Block_object_dispose((const void *)(v9 - 96), 8) = *v11;
  int v13 = (char *)v11++ + (int)v12;
  if ((v10 & 8) != 0)
  {
LABEL_7:
    int v14 = *(_DWORD *)v11;
    id v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 36) = v14;
  }

LABEL_8:
  if ((v10 & 0x8000) != 0)
  {
    int v16 = *(_DWORD *)v11;
    id v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 40) = v16;
    if ((v10 & 0x10000) == 0)
    {
LABEL_10:
      if ((v10 & 0x20000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }

  else if ((v10 & 0x10000) == 0)
  {
    goto LABEL_10;
  }

  int v17 = *(_DWORD *)v11;
  id v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 44) = v17;
  if ((v10 & 0x20000) == 0)
  {
LABEL_11:
    if ((v10 & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }

  int v14 = v11 != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

  return v11;
}

  return v12;
}

  return v10;
}

  return v13;
}

      uint64_t v26 = 0LL;
      int v27 = 1;
LABEL_14:
      close(v13);
      v31 = v27;
      goto LABEL_15;
    }

    int v14 = fcntl(v12, 63);
    if ((v14 & 0x80000000) == 0)
    {
      if (!v10[2](v10, v14)) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }

    int v19 = (void *)*MEMORY[0x189607688];
    uint64_t v20 = *__error();
    int v28 = [v11 fileSystemRepresentation];
    id v29 = __error();
    v33 = v28;
    strerror(*v29);
    int v24 = @"Failed to getclass of file %s: %s";
    int v25 = 1694LL;
  }

  _CreateError( (uint64_t)"-[MIFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]",  v25,  v19,  v20,  0LL,  0LL,  v24,  v23,  v33);
LABEL_11:
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = v30;
  if (a6) {
    *a6 = v30;
  }
  int v27 = 0;
  v31 = 0;
  if ((v13 & 0x80000000) == 0) {
    goto LABEL_14;
  }
LABEL_15:

  return v31;
}

LABEL_17:
  int v18 = *(_DWORD *)v11;
  id v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 4_Block_object_dispose((const void *)(v9 - 96), 8) = v18;
  if ((v10 & 0x40000) == 0)
  {
LABEL_12:
    if ((v10 & 0x400000) == 0) {
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v20 = *v11;
    *(void *)(a3 + 56) = *v11;
    uint64_t v15 = (char *)v11++ + (int)v20;
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  int v23 = v11;

  return v23;
}

  return v13;
}

  int v23 = v11;

  return v23;
}

  return v10;
}

  return v12;
}

  int v14 = 1;
LABEL_18:

  return v14;
}

  return v10;
}

LABEL_18:
  int v19 = *(_DWORD *)v11;
  id v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 52) = v19;
  if ((v10 & 0x400000) != 0) {
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v15 = 0LL;
  if ((v10 & 0x2000000) != 0)
  {
LABEL_20:
    uint64_t v21 = *v11++;
    *(void *)(a3 + 64) = v21;
  }

  return v15;
}

  return v17;
}

  return v32;
}

LABEL_21:
  if ((v10 & 0x40000000) != 0)
  {
    int v22 = *(_DWORD *)v11;
    id v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 72) = v22;
  }

  if (*(_DWORD *)(a3 + 36) == 2)
  {
    int v23 = *(_DWORD *)(a3 + 12);
    if ((v23 & 2) != 0)
    {
      int v24 = *(_DWORD *)v11;
      id v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v24;
      if (!v24) {
        *a6 = 1;
      }
    }

    if ((v23 & 4) != 0)
    {
      int v25 = *(_DWORD *)v11;
      *(_DWORD *)(a3 + 84) = v25;
      if ((v25 & 3) != 0)
      {
        *a6 = 1;
      }
    }
  }

  else
  {
    int v27 = *(_DWORD *)(a3 + 16);
    if ((v27 & 1) != 0)
    {
      int v28 = *(_DWORD *)v11;
      id v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v28;
    }

    if ((v27 & 4) != 0) {
      *(void *)(a3 + 8_Block_object_dispose((const void *)(v9 - 96), 8) = *v11;
    }
  }

  if (a5) {
    *a5 = v13;
  }
  if (a4) {
    *a4 = v15;
  }
  return result;
}

  return 1LL;
}

    uint64_t v26 = 0LL;
    if (!a5) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }

  uint64_t v26 = 0LL;
  int v16 = v33;
  a5 = v34;
  int v10 = v18;
  if (!v34) {
    goto LABEL_24;
  }
LABEL_22:
  if (!v26) {
    *a5 = v16;
  }
LABEL_24:
  int v27 = v26;

  return v27;
}

      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v19);
      LOBYTE(v10) = 1;
      goto LABEL_17;
    }

    [v20 userInfo];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 objectForKeyedSubscript:*MEMORY[0x189607798]];
    int v27 = (void *)objc_claimAutoreleasedReturnValue();

    [v27 domain];
    int v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v28 isEqualToString:*MEMORY[0x189607460]])
    {
      id v29 = [v27 code];

      if (v29 == 260)
      {

        uint64_t v20 = 0LL;
        goto LABEL_21;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v13 path];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    _CreateAndLogError( (uint64_t)"-[MIBundleContainer captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]",  652LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to get container URL",  v14,  v30);
    uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
  }

  int v19 = 0LL;
  LOBYTE(v10) = 0;
  if (!a7) {
    goto LABEL_17;
  }
LABEL_15:
  if ((v10 & 1) == 0)
  {
    uint64_t v20 = v20;
    LOBYTE(v10) = 0;
    *a7 = v20;
  }

  return v24;
}

          int v14 = 0LL;
LABEL_22:
          close(v7);
          goto LABEL_23;
        }

        v31 = *__error();
        v32 = (void *)*MEMORY[0x189607688];
        [v5 path];
        int v28 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v31);
        _CreateError( (uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]",  1608LL,  v32,  v31,  0LL,  0LL,  @"Failed to malloc %zd bytes for extended attribute list for %@: %s",  v33,  v9);
      }

      else
      {
        [v5 path];
        int v28 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError( (uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]",  1601LL,  @"MIInstallerErrorDomain",  140LL,  0LL,  0LL,  @"No extended attributes found on %@",  v30,  (uint64_t)v28);
      }
    }

    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0LL;
    goto LABEL_21;
  }

  int v22 = *__error();
  int v23 = (void *)*MEMORY[0x189607688];
  [v5 path];
  int v24 = (void *)objc_claimAutoreleasedReturnValue();
  strerror(v22);
  _CreateError( (uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]",  1592LL,  v23,  v22,  0LL,  0LL,  @"Failed to open %@: %s",  v25,  (uint64_t)v24);
  uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();

  int v14 = 0LL;
  id v11 = 0LL;
LABEL_23:
  free(v11);
  if (a4 && !v14) {
    *a4 = v15;
  }

  return v14;
}

          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          {
            id v11 = 0LL;
          }

          else
          {
            uint64_t v20 = v33.st_mode;
            uint64_t v21 = (void *)v33.st_uid;
            int v22 = (char *)v33.st_gid;
            objc_msgSend(v9, "path", v24, v25);
            int v17 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = v20;
            int v27 = v17;
            int v24 = v21;
            int v25 = v22;
            MOLogWrite();
            id v11 = 0LL;
LABEL_24:

            uint64_t v3 = v30;
          }

uint64_t _CallClientBlock( char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  int v18 = a10;
  int v19 = *(_DWORD *)(a7 + 36);
  if ((a1 & 2) != 0 && v19 == 2)
  {
    uint64_t v20 = 0LL;
  }

  else
  {
    BOOL v21 = a9;
    *(void *)a8 = *(void *)(a7 + 64);
    *(void *)(a8 + _Block_object_dispose((const void *)(v9 - 96), 8) = *(void *)(a7 + 88);
    *(void *)(a8 + 16) = a2;
    *(void *)(a8 + 24) = a3;
    *(void *)(a8 + 32) = a4;
    uint64_t v22 = *(unsigned int *)(a7 + 52);
    *(void *)(a8 + 40) = a5;
    *(void *)(a8 + 4_Block_object_dispose((const void *)(v9 - 96), 8) = v22;
    *(_DWORD *)(a8 + 56) = v19;
    int v23 = *(_DWORD *)(a7 + 72);
    *(_DWORD *)(a8 + 60) = *(_DWORD *)(a7 + 80);
    *(_DWORD *)(a8 + 64) = v23;
    *(void *)(a8 + 6_Block_object_dispose((const void *)(v9 - 96), 8) = *(void *)(a7 + 40);
    *(_DWORD *)(a8 + 76) = *(_DWORD *)(a7 + 80);
    __int16 v24 = *(_WORD *)(a7 + 48) & 0xFFF;
    *(_WORD *)(a8 + 80) = v24;
    unsigned int v25 = v19 - 1;
    if (v25 <= 6) {
      *(_WORD *)(a8 + 80) = word_183DC1388[v25] | v24;
    }
    if (a9) {
      BOOL v21 = *(_DWORD *)(a9 + 36) != -1;
    }
    *(_BYTE *)(a8 + 82) = v21;
    *(_BYTE *)(a8 + 83) = a6;
    uint64_t v26 = (void *)MEMORY[0x186E26FA4]();
    char v28 = 1;
    if (v18[2](v18, a8, &v28)) {
      uint64_t v20 = 2 * (v28 == 0);
    }
    else {
      uint64_t v20 = 1LL;
    }
    objc_autoreleasePoolPop(v26);
  }

  return v20;
}

LABEL_53:
      id v29 = v27;
      uint64_t v30 = (v30 + 1);
      int v27 = v33;
      if ((_DWORD)v30 == ncmds) {
        goto LABEL_59;
      }
    }

    if (v34 == 25)
    {
      if (strncmp(v27 + 8, "__LINKEDIT", 0xAuLL))
      {
        if (v14 && !strncmp(v27 + 8, "__DATA", 6uLL))
        {
          uint64_t v104 = v12;
          unsigned __int32 v37 = *((unsigned int *)v27 + 16);
          if (v37 > 0x1000)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 path];
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  150LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"__DATA segment has too many sections in %@",  v83,  (uint64_t)v47);
            goto LABEL_71;
          }

          if (80 * (unint64_t)v37 + 72 > v32)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 path];
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  155LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"__DATA segment exceeds bounds in %@",  v85,  (uint64_t)v47);
LABEL_71:
            int v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_72:
            __int16 v24 = 0LL;
            goto LABEL_73;
          }

          if ((_DWORD)v37)
          {
            unsigned __int32 v38 = v27 + 72;
            while (strncmp(v38, v14, 0x10uLL))
            {
              v38 += 80;
              if (!--v37) {
                goto LABEL_56;
              }
            }
    }

    int32x2_t v41 = [v39 countByEnumeratingWithState:&v89 objects:v107 count:16];
  }

  while (v41);
LABEL_55:
  uint64_t v52 = v23;

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  unsigned __int16 v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 cryptexExtensionKitExtensionsDirectories];
  BOOL v54 = (void *)objc_claimAutoreleasedReturnValue();
  int v86 = v23;
  int v55 = -[MIFilesystemScanner _scanExtensionKitLocations:withError:]( v79,  "_scanExtensionKitLocations:withError:",  v54,  &v86);
  int v23 = v86;

  if (!v55) {
    [v80 errorOccurred:v23];
  }

  LOBYTE(v5) = v77;
LABEL_58:
  if ((v5 & 4) != 0)
  {
    uint64_t v78 = v4;
    [MEMORY[0x189603FA8] array];
    id v56 = (void *)objc_claimAutoreleasedReturnValue();
    MIDiskImageManagerProxy();
    int v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 diskMountPaths];
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v104 = 0u;
    uint64_t v105 = 0u;
    id v102 = 0u;
    uint64_t v103 = 0u;
    uint64_t v59 = v58;
    unsigned __int16 v60 = [v59 countByEnumeratingWithState:&v102 objects:v108 count:16];
    if (v60)
    {
      BOOL v61 = v60;
      v62 = *(void *)v103;
      do
      {
        for (j = 0LL; j != v61; ++j)
        {
          if (*(void *)v103 != v62) {
            objc_enumerationMutation(v59);
          }
          [MEMORY[0x189604030] fileURLWithPath:*(void *)(*((void *)&v102 + 1) + 8 * j) isDirectory:1];
          id v64 = (void *)objc_claimAutoreleasedReturnValue();
          [v64 URLByAppendingPathComponent:@"Applications" isDirectory:1];
          int v65 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 addObject:v65];
        }

        BOOL v61 = [v59 countByEnumeratingWithState:&v102 objects:v108 count:16];
      }

      while (v61);
    }

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v76 = v56;
      MOLogWrite();
    }

    int v66 = (void *)objc_msgSend(v56, "copy", v76);

    id v82 = 0u;
    id v83 = 0u;
    v84 = 0u;
    int v85 = 0u;
    v67 = v66;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v82 objects:v106 count:16];
    if (v68)
    {
      int v69 = v68;
      uint64_t v70 = *(void *)v83;
      do
      {
        uint64_t v71 = 0LL;
        v72 = v23;
        do
        {
          if (*(void *)v83 != v70) {
            objc_enumerationMutation(v67);
          }
          int v73 = *(void *)(*((void *)&v82 + 1) + 8 * v71);
          uint64_t v81 = v72;
          BOOL v74 = -[MIFilesystemScanner _scanAppsDirectory:withError:](v79, "_scanAppsDirectory:withError:", v73, &v81);
          int v23 = v81;

          if (!v74) {
            [v80 errorOccurred:v23];
          }
          ++v71;
          v72 = v23;
        }

        while (v69 != v71);
        int v69 = [v67 countByEnumeratingWithState:&v82 objects:v106 count:16];
      }

      while (v69);
    }

    uint64_t v4 = v78;
  }

  return 1;
}

LABEL_55:
            v110 = 1;
          }

LABEL_56:
          int v27 = v29;
          uint64_t v12 = v104;
          goto LABEL_53;
        }

        goto LABEL_52;
      }

      __int128 v114 = v27 + 32;
      __int128 v115 = v27 + 48;
      __int128 v112 = 8LL;
      unsigned int v39 = 8LL;
    }

    else
    {
      if (v34 != 1)
      {
LABEL_52:
        int v27 = v29;
        goto LABEL_53;
      }

      if (strncmp(v27 + 8, "__LINKEDIT", 0xAuLL))
      {
        if (v14 && !strncmp(v27 + 8, "__DATA", 6uLL))
        {
          uint64_t v104 = v12;
          uint64_t v35 = *((unsigned int *)v27 + 12);
          if (v35 > 0x1000)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 path];
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  121LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"__DATA segment has too many sections in %@",  v82,  (uint64_t)v47);
            goto LABEL_71;
          }

          if (68 * (unint64_t)v35 + 56 > v32)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 path];
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  126LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"__DATA segment exceeds bounds in %@",  v84,  (uint64_t)v47);
            goto LABEL_71;
          }

          if ((_DWORD)v35)
          {
            unsigned int v36 = v27 + 56;
            while (strncmp(v36, v14, 0x10uLL))
            {
              v36 += 68;
              if (!--v35) {
                goto LABEL_56;
              }
            }

            goto LABEL_55;
          }

          goto LABEL_56;
        }

        goto LABEL_52;
      }

      __int128 v114 = v27 + 28;
      __int128 v115 = v27 + 36;
      __int128 v112 = 4LL;
      unsigned int v39 = 4LL;
    }

    __int128 v113 = v39;
    goto LABEL_52;
  }

  __int128 v112 = 0LL;
  __int128 v113 = 0LL;
  __int128 v114 = 0LL;
  __int128 v115 = 0LL;
  v110 = 0;
  id v29 = 0LL;
LABEL_59:
  if (!v114 || !v113 || !v115 || !v112)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 path];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  178LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Failed to find __LINKEDIT segment in %@",  v43,  (uint64_t)v47);
    goto LABEL_71;
  }

  if (!v29)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 path];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  183LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Failed to find LC_CODE_SIGNATURE load command in %@",  v44,  (uint64_t)v47);
    goto LABEL_71;
  }

  if (v114 > v29 || v115 > v29)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 path];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  188LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"__LINKEDIT segment found after LC_CODE_SIGNATURE load command in %@",  v45,  (uint64_t)v47);
    goto LABEL_71;
  }

  int32x2_t v41 = *((unsigned int *)v29 + 2);
  if (v41 < v109)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 path];
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  193LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"LC_CODE_SIGNATURE command's data offset is less than the size of the mach header in %@",  v42,  (uint64_t)v47);
    goto LABEL_71;
  }

  v117[0] = &v114[v107] - v106;
  v117[1] = v113;
  v117[2] = &v115[v107] - v106;
  v117[3] = v112;
  int v49 = *((unsigned int *)v29 + 3);
  v117[4] = &v29[v107 + 12] - v106;
  v117[5] = 4LL;
  v117[6] = v41;
  v117[7] = v49;
  CC_SHA1_Init(&c);
  if (lseek(-[MISignatureAgnosticHasher fd](v12, "fd"), v108, 0) == -1)
  {
    int v63 = *__error();
    id v64 = (void *)*MEMORY[0x189607688];
    strerror(v63);
    _CreateError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  218LL,  v64,  v63,  0LL,  0LL,  @"lseek to %lld failed: %s",  v65,  v108);
    int v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[MISignatureAgnosticHasher url](v12, "url");
    [v67 path];
    id v101 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v63);
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  218LL,  @"MIInstallerErrorDomain",  73LL,  v66,  0LL,  @"Failed to seek to %lld in %@ : %s",  v68,  v108);
    int v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_72;
  }

  v50 = malloc(0x4000uLL);
  a7 = v111;
  if (!v50)
  {
    int v69 = *__error();
    uint64_t v70 = (void *)*MEMORY[0x189607688];
    strerror(v69);
    _CreateError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  225LL,  v70,  v69,  0LL,  0LL,  @"Failed to allocate %lld bytes : %s",  v71,  0x4000LL);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = strerror(v69);
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  225LL,  @"MIInstallerErrorDomain",  73LL,  v20,  0LL,  @"Failed to allocate hash read buffer: %s",  v73,  (uint64_t)v72);
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  __int16 v24 = v50;
  int v51 = 0LL;
  uint64_t v52 = 0LL;
  do
  {
    unsigned __int16 v53 = v117[v51];
    BOOL v54 = v53 - v52;
    if (v54 >= 1)
    {
      while (1)
      {
        if (v54 >= 0x4000) {
          int v55 = 0x4000LL;
        }
        else {
          int v55 = v54;
        }
        id v56 = read(-[MISignatureAgnosticHasher fd](v12, "fd"), v24, v55);
        if (v56 < 0)
        {
          BOOL v74 = *__error();
          int v75 = (void *)*MEMORY[0x189607688];
          strerror(v74);
          _CreateError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  238LL,  v75,  v74,  0LL,  0LL,  @"Failed to read %zu bytes : %s",  v76,  v55);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[MISignatureAgnosticHasher url](v12, "url");
          uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
          [v78 path];
          uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v74);
          _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  238LL,  @"MIInstallerErrorDomain",  73LL,  v77,  0LL,  @"Failed to read file at %@: %s",  v80,  (uint64_t)v79);
          int v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_95;
        }

        if (v56 != v55) {
          break;
        }
        CC_SHA1_Update(&c, v24, v55);
        int v57 = v54 <= v55;
        v54 -= v55;
        if (v57) {
          goto LABEL_86;
        }
      }
      v77 = -[MISignatureAgnosticHasher url](v12, "url");
      [v77 path];
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  241LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Expected to read %zu bytes but got %ld bytes when reading %@",  v81,  v55);
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_95;
    }

LABEL_86:
    v58 = *(void *)((char *)v117 + ((8 * v51) | 8));
    if (lseek(-[MISignatureAgnosticHasher fd](v12, "fd"), v58, 1) == -1)
    {
      int v86 = *__error();
      v87 = (void *)*MEMORY[0x189607688];
      strerror(v86);
      _CreateError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  253LL,  v87,  v86,  0LL,  0LL,  @"lseek to %lld from current offset failed: %s",  v88,  v58);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[MISignatureAgnosticHasher url](v12, "url");
      uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
      [v78 path];
      id v102 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v86);
      _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  253LL,  @"MIInstallerErrorDomain",  73LL,  v77,  0LL,  @"Failed to seek to %lld from current offset in %@ : %s",  v89,  v58);
      int v17 = (void *)objc_claimAutoreleasedReturnValue();

      a7 = v111;
LABEL_95:

      goto LABEL_15;
    }

    uint64_t v52 = v53 + v58;
    uint64_t v59 = v51 >= 6;
    v51 += 2LL;
  }

  while (!v59);
  unsigned __int16 v60 = v105 - v52;
  if (v105 < v52)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    BOOL v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v61 path];
    uint64_t v103 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  261LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Hashed more (%lld) than slice length %llu in %@",  v62,  v52);
    int v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }

  if (v60 < 1)
  {
LABEL_109:
    CC_SHA1_Final(md, &c);
    if ((v110 & 1) != 0) {
      -[MISignatureAgnosticHasher setCountOfSlicesWithNamedSection:]( v12,  "setCountOfSlicesWithNamedSection:",  -[MISignatureAgnosticHasher countOfSlicesWithNamedSection](v12, "countOfSlicesWithNamedSection") + 1);
    }
    [MEMORY[0x189603F48] dataWithBytes:md length:20];
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 0LL;
  }

  else
  {
    while (1)
    {
      if (v60 >= 0x4000) {
        uint64_t v90 = 0x4000LL;
      }
      else {
        uint64_t v90 = v60;
      }
      uint64_t v91 = read(-[MISignatureAgnosticHasher fd](v12, "fd"), v24, v90);
      if (v91 < 0)
      {
        v92 = *__error();
        int v93 = (void *)*MEMORY[0x189607688];
        strerror(v92);
        _CreateError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  271LL,  v93,  v92,  0LL,  0LL,  @"Failed to read %zu bytes : %s",  v94,  v90);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[MISignatureAgnosticHasher url](v12, "url");
        int v96 = (void *)objc_claimAutoreleasedReturnValue();
        [v96 path];
        uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v92);
        _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  271LL,  @"MIInstallerErrorDomain",  73LL,  v95,  0LL,  @"Failed to read file at %@: %s",  v98,  (uint64_t)v97);
        int v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_114;
      }

      if (v91 != v90) {
        break;
      }
      CC_SHA1_Update(&c, v24, v90);
      int v57 = v60 <= v90;
      v60 -= v90;
      if (v57) {
        goto LABEL_109;
      }
    }
    v95 = -[MISignatureAgnosticHasher url](v12, "url");
    [v95 path];
    int v96 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]",  274LL,  @"MIInstallerErrorDomain",  73LL,  0LL,  0LL,  @"Expected to read %zu bytes but got %ld bytes when reading %@",  v99,  v90);
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_114:

LABEL_73:
    unsigned int v25 = 0LL;
  }

  a7 = v111;
LABEL_16:
  free(v24);
  if (a7 && !v25) {
    *a7 = v17;
  }

  return v25;
}

void sub_183D297C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_13:
  id v29 = 0LL;
LABEL_14:

  return v29;
}

  uint64_t v12 = (id)v22;
LABEL_14:
  if (a6)
  {
    uint64_t v12 = v12;
    int v13 = 0LL;
    *a6 = v12;
  }

  else
  {
    int v13 = 0LL;
  }

    [v3 path];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

LABEL_14:
    int v9 = (id)objc_opt_new();
    goto LABEL_15;
  }

  int v7 = objc_opt_class();
  int v8 = objc_opt_class();
  if ((MIDictionaryContainsOnlyClasses(v4, v7, v8) & 1) == 0)
  {
    goto LABEL_13;
  }

  int v9 = v4;
LABEL_15:
  int v13 = v9;

  return v13;
}

      return v10;
  }

    MOLogWrite();
    goto LABEL_14;
  }

  if ((MIArrayContainsOnlyClass(v4) & 1) == 0)
  {
    goto LABEL_13;
  }

  uint64_t v6 = v4;
LABEL_7:
  [MEMORY[0x189604010] setWithArray:v6];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 allObjects];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v8;
}
  }

  return a3;
}

    int v16 = 0;
    goto LABEL_14;
  }

  int v16 = 1;
LABEL_14:

  return v16;
}

  return (NSString *)v12;
}

uint64_t MIUpdateSinfWithData(void *a1, void *a2, void *a3, unsigned int a4, unsigned int a5, void *a6)
{
  id v11 = a1;
  uint64_t v15 = 0LL;
  _sinfURLsForBundle(a2, a3, &v15);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    uint64_t v13 = _writeSinfData(v11, v12, a4, a5, a6);
  }
  else {
    uint64_t v13 = 0LL;
  }

  return v13;
}

id _sinfURLsForBundle(void *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  [MEMORY[0x189603FE0] setWithCapacity:1];
  unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 URLByAppendingPathComponent:@"SC_Info/Manifest.plist" isDirectory:0];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v48 = 0LL;
  objc_msgSend(MEMORY[0x189603F68], "MI_dictionaryWithContentsOfURL:options:error:", v7, 0, &v48);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v48;
  int v10 = v9;
  if (!v8)
  {
    [v9 domain];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v15 isEqualToString:*MEMORY[0x189607460]])
    {
      uint64_t v16 = [v10 code];

      if (v16 == 260) {
        goto LABEL_20;
      }
    }

    else
    {
    }

    [v7 path];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v36 = v17;
    unsigned __int32 v37 = v10;
LABEL_19:
    MOLogWrite();

LABEL_20:
    id v13 = 0LL;
    int v42 = 0LL;
    goto LABEL_28;
  }

  uint64_t v11 = [v8 objectForKeyedSubscript:@"SinfReplicationPaths"];
  if (!v11)
  {
    [v7 path];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v36 = v17;
    goto LABEL_19;
  }

  uint64_t v12 = (void *)v11;
  objc_opt_class();
  id v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0LL;
  }

  if (v14)
  {
    objc_opt_class();
    if ((MIArrayContainsOnlyClass(v13) & 1) != 0)
    {
      id v13 = v13;
      int v42 = v13;
      goto LABEL_28;
    }
  }

  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
  {
    goto LABEL_27;
  }

  [v7 path];
  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue();
  MOLogWrite();

LABEL_27:
  int v42 = 0LL;
LABEL_28:

  _rootSinfURLForBundle(v5, v6);
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  int v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 realPathForURL:v18 ifChildOfURL:v5];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    _CreateAndLogError( (uint64_t)"_sinfURLsForBundle",  76LL,  @"MIInstallerErrorDomain",  61LL,  0LL,  &unk_189D63E08,  @"Root sinf URL points outside of bundle",  v21,  (uint64_t)v36);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v42;
    if (a3) {
      goto LABEL_50;
    }
    goto LABEL_52;
  }

  [v43 addObject:v18];
  uint64_t v22 = v42;
  if (!v42) {
    goto LABEL_41;
  }
  uint64_t v40 = v18;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v42;
  uint64_t v23 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v23)
  {
LABEL_40:

    uint64_t v22 = v42;
    int v18 = v40;
LABEL_41:
    uint64_t v20 = (void *)objc_msgSend(v43, "copy", v36);
    uint64_t v34 = 0LL;
    if (a3) {
      goto LABEL_50;
    }
    goto LABEL_52;
  }

  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v45;
  unsigned __int32 v38 = a3;
  id v39 = v6;
LABEL_32:
  uint64_t v26 = 0LL;
  while (1)
  {
    if (*(void *)v45 != v25) {
      objc_enumerationMutation(obj);
    }
    int v27 = *(void **)(*((void *)&v44 + 1) + 8 * v26);
    if (objc_msgSend(v27, "containsDotDotPathComponents", v36, v37))
    {
      _CreateAndLogError( (uint64_t)"_sinfURLsForBundle",  84LL,  @"MIInstallerErrorDomain",  61LL,  0LL,  &unk_189D63E30,  @"sinf subpath %@ contains illegal '..' segment",  v28,  (uint64_t)v27);
LABEL_47:
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }

    if ([v27 hasPrefix:@"/"])
    {
      _CreateAndLogError( (uint64_t)"_sinfURLsForBundle",  89LL,  @"MIInstallerErrorDomain",  61LL,  0LL,  &unk_189D63E58,  @"sinf subpath %@ is absolute",  v29,  (uint64_t)v27);
      goto LABEL_47;
    }

    [v5 URLByAppendingPathComponent:v27 isDirectory:0];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    [v31 realPathForURL:v30 ifChildOfURL:v5];
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32) {
      break;
    }
    [v43 addObject:v32];

    if (v24 == ++v26)
    {
      uint64_t v24 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      a3 = v38;
      id v6 = v39;
      if (v24) {
        goto LABEL_32;
      }
      goto LABEL_40;
    }
  }

  _CreateAndLogError( (uint64_t)"_sinfURLsForBundle",  98LL,  @"MIInstallerErrorDomain",  61LL,  0LL,  &unk_189D63E80,  @"sinf subpath %@ points outside of bundle",  v33,  (uint64_t)v27);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_49:
  uint64_t v20 = 0LL;
  a3 = v38;
  id v6 = v39;
  uint64_t v22 = v42;
  int v18 = v40;
  if (!v38) {
    goto LABEL_52;
  }
LABEL_50:
  if (!v20) {
    *a3 = v34;
  }
LABEL_52:

  return v20;
}

uint64_t _writeSinfData(void *a1, void *a2, unsigned int a3, unsigned int a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v34 = a1;
  id v7 = a2;
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    uint64_t v28 = (void *)[v34 length];
    id v29 = v7;
    MOLogWrite();
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v30 = a5;
    id v11 = 0LL;
    uint64_t v12 = *(void *)v39;
    id obj = v8;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v28, v29);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 URLByDeletingLastPathComponent];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v37 = v11;
        char v17 = [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 mode:493 error:&v37];
        id v18 = v37;

        if ((v17 & 1) != 0)
        {
          id v36 = v18;
          char v19 = [v34 writeToURL:v14 options:1 error:&v36];
          id v20 = v36;

          if ((v19 & 1) == 0)
          {
            [v14 path];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"_writeSinfData",  130LL,  @"MIInstallerErrorDomain",  24LL,  v20,  &unk_189D63EA8,  @"Failed to write sinf to %@ : %@",  v26,  (uint64_t)v25);
            id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
            id v8 = obj;

            if (v30)
            {
              id v11 = v11;
              uint64_t v24 = 0LL;
              *uint64_t v30 = v11;
            }

            else
            {
              uint64_t v24 = 0LL;
            }

            goto LABEL_26;
          }

          +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          id v35 = v20;
          int v22 = [v21 setOwnerOfURL:v14 toUID:a3 gid:a4 error:&v35];
          id v11 = v35;

          if (!v22) {
            goto LABEL_23;
          }
        }

        else
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            [v14 URLByDeletingLastPathComponent];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v23 path];
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
            id v29 = v18;
            MOLogWrite();
          }

          id v11 = v18;
        }
      }

      id v8 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  uint64_t v24 = 1LL;
LABEL_26:

  return v24;
}

uint64_t MIReplicateRootSinf(void *a1, void *a2, unsigned int a3, unsigned int a4, void *a5)
{
  id v9 = a2;
  id v10 = a1;
  _rootSinfURLForBundle(v10, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = 0LL;
  _sinfURLsForBundle(v10, v9, &v26);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  id v13 = v26;
  id v14 = (void *)[v12 mutableCopy];

  if (v14)
  {
    [v14 removeObject:v11];
    if (![v14 count])
    {
      uint64_t v17 = 1LL;
      goto LABEL_20;
    }

    id v25 = v13;
    [MEMORY[0x189603F48] dataWithContentsOfURL:v11 options:2 error:&v25];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = v25;

    if (v15)
    {
      id v24 = v16;
      uint64_t v17 = _writeSinfData(v15, v14, a3, a4, &v24);
      id v18 = v24;
    }

    else
    {
      [v16 domain];
      char v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v19 isEqualToString:*MEMORY[0x189607460]])
      {
        uint64_t v20 = [v16 code];

        if (v20 == 260)
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
          {
            uint64_t v17 = 1LL;
LABEL_17:

            id v13 = v16;
            if (!a5) {
              goto LABEL_20;
            }
            goto LABEL_18;
          }

          [v11 path];
          int v22 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
          uint64_t v17 = 1LL;
LABEL_16:

          goto LABEL_17;
        }
      }

      else
      {
      }

      _CreateAndLogError( (uint64_t)"MIReplicateRootSinf",  181LL,  @"MIInstallerErrorDomain",  24LL,  v16,  &unk_189D63DE0,  @"Failed to read sinf at %@ : %@",  v21,  (uint64_t)v11);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = 0LL;
    }

    int v22 = v16;
    id v16 = v18;
    goto LABEL_16;
  }

  uint64_t v17 = 0LL;
  if (!a5) {
    goto LABEL_20;
  }
LABEL_18:
  if ((v17 & 1) == 0)
  {
    id v13 = v13;
    uint64_t v17 = 0LL;
    *a5 = v13;
  }

LABEL_20:
  return v17;
}

  return v10 & 1;
}

    uint64_t v12 = v12;
    uint64_t v20 = 0;
    char v19 = 0LL;
    *a3 = v12;
    goto LABEL_29;
  }

  if (!v5)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    int v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  225LL,  @"MIInstallerErrorDomain",  182LL,  0LL,  &unk_189D64678,  @"Appex bundle at %@ with id %@ does not define an EXAppExtensionAttributes dictionary in its Info.plist",  v23,  (uint64_t)v22);

    id v16 = 0LL;
    uint64_t v12 = (id)v24;
    goto LABEL_27;
  }

  uint64_t v50 = v12;
  id v13 = -[MIExtensionKitBundle _validateDelegateClassWithError:](self, "_validateDelegateClassWithError:", &v50);
  id v10 = v50;

  if (!v13)
  {
LABEL_17:
    id v16 = 0LL;
    uint64_t v12 = v10;
    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }

  id v14 = [v5 objectForKeyedSubscript:@"EXExtensionPointIdentifier"];
  if (!v14)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    int v42 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  258LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  &unk_189D64718,  @"Appex bundle at %@ with id %@ does not define the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist.",  v26,  (uint64_t)v25);
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = 0LL;
    goto LABEL_27;
  }

  uint64_t v15 = (void *)v14;
  objc_opt_class();
  id v16 = v15;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  254LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  &unk_189D646F0,  @"Appex bundle at %@ with id %@ defines an EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist with a value that is not a string.",  v29,  (uint64_t)v27);
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }

  if ((MIIsValidRDNSString(v16) & 1) == 0)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 path];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = -[MIBundle identifier](self, "identifier");
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  240LL,  @"MIInstallerErrorDomain",  46LL,  0LL,  &unk_189D646A0,  @"Appex bundle at %@ with id %@ does not have a legal value for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@",
      v30,
      (uint64_t)v28);
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();

    id v10 = (id)v43;
    uint64_t v21 = v16;
    goto LABEL_25;
  }

  int v49 = 0;
  id v48 = v10;
  uint64_t v17 = -[MIExtensionKitBundle getMayTargetThirdPartyExtensionPoint:withError:]( self,  "getMayTargetThirdPartyExtensionPoint:withError:",  &v49,  &v48);
  uint64_t v12 = v48;

  if (!v17)
  {
LABEL_31:
    uint64_t v21 = v16;
    goto LABEL_27;
  }

  if (v49) {
    id v18 = 1;
  }
  else {
    id v18 = v7;
  }
  if ((v18 & 1) == 0)
  {
    v32 = -[MIBundle bundleURL](self, "bundleURL");
    [v32 path];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  250LL,  @"MIInstallerErrorDomain",  59LL,  0LL,  &unk_189D646C8,  @"Appex bundle at %@ with id %@ does not specify an Apple extension point as the value of the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist; found: %@",
      v34,
    id v35 = (uint64_t)v33);

    uint64_t v12 = (id)v35;
    goto LABEL_31;
  }

  if (!v6)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v38 = _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  264LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  &unk_189D64740,  @"Appex bundle at %@ with id %@ does not define an extension point in its Info.plist",  v37,  (uint64_t)v36);

    uint64_t v12 = (id)v38;
LABEL_27:

    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_20;
  }

  if (v7
    && !-[MIExecutableBundle allowsAppleAppExtensionsNotInExtensionCache]( self,  "allowsAppleAppExtensionsNotInExtensionCache"))
  {
    __int128 v47 = v12;
    -[MIAppExtensionBundle extensionCacheEntryWithError:](self, "extensionCacheEntryWithError:", &v47);
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v39 = v47;

    if (v19)
    {
      uint64_t v20 = 1;
      uint64_t v12 = v39;
      goto LABEL_29;
    }

    -[MIBundle bundleURL](self, "bundleURL");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 path];
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIExtensionKitBundle validateBundleMetadataWithError:]",  272LL,  @"MIInstallerErrorDomain",  59LL,  v39,  &unk_189D64768,  @"Appex bundle at %@ with id %@ specifies a value (%@) for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist that does not correspond to a known extension point.",  v40,  (uint64_t)v27);
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_26;
  }

  char v19 = 0LL;
  uint64_t v20 = 1;
LABEL_29:

  return v20;
}

  return v15;
}

  return v21;
}

      id v18 = 0;
      goto LABEL_21;
    }

    uint64_t v33 = v16;
    uint64_t v17 = -[MIExecutableBundle _hasNoConflictWithSystemAppsForSigningInfo:error:]( self,  "_hasNoConflictWithSystemAppsForSigningInfo:error:",  v8,  &v33);
    id v13 = v33;

    if (v17) {
      goto LABEL_6;
    }
LABEL_17:
    if (a5) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }

  if ((v11 - 7) >= 3)
  {
    if (v11 == 6)
    {
      -[MIBundle identifier](self, "identifier");
      char v19 = (void *)objc_claimAutoreleasedReturnValue();
      id v36 = 0LL;
      uint64_t v20 = _checkIdentifierForConflict(v19, (uint64_t)v9, 2LL, @"App", v10, &v36);
      id v13 = v36;

      if (v20)
      {
        id v35 = v13;
        uint64_t v21 = -[MIExecutableBundle _hasNoConflictWithSystemAppsForSigningInfo:error:]( self,  "_hasNoConflictWithSystemAppsForSigningInfo:error:",  v8,  &v35);
        int v22 = v35;

        if (!v21)
        {
          id v13 = v22;
          if (a5) {
            goto LABEL_18;
          }
          goto LABEL_20;
        }

        uint64_t v23 = -[MIBundle identifier](self, "identifier");
        id v24 = v10;
        +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 builtInApplicationBundleIDs];
        id v26 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)v23;
        int v27 = [v26 containsObject:v23];
        id v29 = v27;
        uint64_t v30 = v22;
        if (v27)
        {
          uint64_t v30 = _CreateAndLogError( (uint64_t)"_hasNoConflictWithNonContainerizedSystemApp",  1272LL,  @"MIInstallerErrorDomain",  81LL,  0LL,  &unk_189D648A8,  @"%@ with identifier %@ is already installed, so we can't install %@ with that same identifier.",  v28,  (uint64_t)@"App");
        }

        id v13 = v30;
        if ((v29 & 1) == 0) {
          goto LABEL_6;
        }
      }
    }

    else
    {
      _CreateAndLogError( (uint64_t)"-[MIExecutableBundle hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:forPersona:error:]",  1467LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Don't know how to check bundle %@ for conflicts.",  v12,  (uint64_t)self);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_17;
  }

  id v13 = 0LL;
LABEL_6:
  id v18 = 1;
LABEL_21:

  return v18;
}

  if (a8 && !v18) {
    *a8 = v19;
  }

  return v18;
}
}

id _rootSinfURLForBundle(void *a1, void *a2)
{
  id v3 = a2;
  [a1 URLByAppendingPathComponent:@"SC_Info" isDirectory:1];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@.sinf", v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 URLByAppendingPathComponent:v5 isDirectory:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void MIRemoveSinf(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v20 = 0LL;
  _sinfURLsForBundle(a1, a2, &v20);
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v20;
  if (v2)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          id v9 = v3;
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v13, v14);
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          id v15 = v3;
          char v12 = [v11 removeItemAtURL:v10 error:&v15];
          id v3 = v15;

          if ((v12 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
          {
            [v10 path];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            id v14 = v3;
            MOLogWrite();
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v6);
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }
}

uint64_t MIGetSinfDataType(void *a1, _DWORD *a2, void *a3)
{
  id v5 = a1;
  unsigned int v18 = -1;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  [v6 dataForExtendedAttributeNamed:@"com.apple.managed_drm_id" length:4 fromURL:v5 error:&v17];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v17;

  if (v7)
  {
    if ([v7 length] != 4)
    {
      [v5 path];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 length];
      _CreateAndLogError( (uint64_t)"MIGetSinfDataType",  229LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Got value for %s extended attribute on %@ with unexpected length %lu",  v14,  (uint64_t)"com.apple.managed_drm_id");
      goto LABEL_12;
    }

    [v7 getBytes:&v18 length:4];
    uint64_t v9 = v18;
    if (v18 >= 2)
    {
      [v5 path];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"MIGetSinfDataType",  242LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Got unknown value %u for %s extended attribute on %@",  v11,  v9);
      uint64_t v15 = LABEL_12:;

      id v8 = (id)v15;
      goto LABEL_13;
    }
  }

  else
  {
    [v8 domain];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v10 isEqualToString:*MEMORY[0x189607688]])
    {
LABEL_13:

LABEL_14:
      if (a3)
      {
        id v8 = v8;
        uint64_t v13 = 0LL;
        *a3 = v8;
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      goto LABEL_17;
    }

    uint64_t v12 = [v8 code];

    if (v12 != 93) {
      goto LABEL_14;
    }
    unsigned int v18 = 0;

    id v8 = 0LL;
    LODWORD(v9) = 0;
  }

  if (a2) {
    *a2 = v9;
  }
  uint64_t v13 = 1LL;
LABEL_17:

  return v13;
}

uint64_t MISetSinfDataType(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  int v16 = a2;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (a2 < 2)
  {
    if ((_DWORD)a2)
    {
      [MEMORY[0x189603F48] dataWithBytes:&v16 length:4];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = 0LL;
      uint64_t v10 = [v7 setData:v11 forExtendedAttributeNamed:@"com.apple.managed_drm_id" onURL:v5 error:&v14];
      id v9 = v14;

      if (!a3) {
        goto LABEL_10;
      }
    }

    else
    {
      id v15 = 0LL;
      uint64_t v10 = [v6 removeExtendedAttributeNamed:@"com.apple.managed_drm_id" fromURL:v5 error:&v15];
      id v9 = v15;
      if (!a3) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    [v5 path];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"MISetSinfDataType",  267LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Got unknown value %u for Sinf data type to set on %@",  v8,  a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = 0LL;
    if (!a3) {
      goto LABEL_10;
    }
  }

  if ((v10 & 1) == 0) {
    *a3 = v9;
  }
LABEL_10:

  return v10;
}

id _GenerateBuiltInAppInstallSessionID(void *a1)
{
  id v1 = a1;
  BOOL v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  id v3 = v2;
  id v4 = 0LL;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }

  [NSString stringWithFormat:@"%@/%@", v4, v1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  _HashForString(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id _GenerateBuiltInAppInstallID(void *a1)
{
  uint64_t v1 = _GenerateBuiltInAppInstallID_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_GenerateBuiltInAppInstallID_onceToken, &__block_literal_global_0);
  }
  [NSString stringWithFormat:@"%@/%@", v2, _GenerateBuiltInAppInstallID_osVersion];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  _HashForString(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _IdentifierStorageLocationForBundle(void *a1)
{
  id v1 = a1;
  else {
    [v1 executableURL];
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _HashForString(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  id v2 = (const void *)[v1 UTF8String];
  CC_LONG v3 = [v1 length];

  CC_SHA256(v2, v3, md);
  [MEMORY[0x189603F48] dataWithBytes:md length:16];
  return (id)objc_claimAutoreleasedReturnValue();
}

id _UUIDData()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  MEMORY[0x186E274CC](v1);
  [MEMORY[0x189603F48] dataWithBytes:v1 length:16];
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ICLSetLoggingHandle(uint64_t result)
{
  gLogHandle = result;
  return result;
}

LABEL_60:
  return v10;
}

LABEL_7:
  return v12;
}

LABEL_29:
  id v15 = v43;
  id v14 = v44;
  int v16 = v42;
LABEL_32:
  if (a9 && !v35) {
    *a9 = v25;
  }
  __int128 v38 = v35;

  return v38;
}

  return v11;
}

      goto LABEL_30;
    }

    -[MIBundle relativePath](self, "relativePath");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = (uint64_t)v9;
    uint64_t v12 = @"The app extension at %@ targets the extension point %@ but is missing the corresponding required %@ = TRUE (BOOLean) entitlement.";
    uint64_t v13 = 346LL;
LABEL_19:
    id v15 = 206LL;
    goto LABEL_22;
  }

  if (v8 != 2)
  {
    -[MIBundle relativePath](self, "relativePath");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIAppExtensionBundle extensionPointIdentifier](self, "extensionPointIdentifier");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = (uint64_t)v9;
    uint64_t v12 = @"The app extension at %@ has the entitlement %@ which is not allowed for an extension targeting the extension point %@.";
    uint64_t v13 = 341LL;
    goto LABEL_21;
  }

  MICopyMemoryTransferSendEntitlement(v6);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v14;
  -[MIBundle relativePath](self, "relativePath");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = (uint64_t)v11;
  uint64_t v12 = @"The app extension at %@ specifies the entitlement %@ = %@ where the value does not match the parent app bundle's CFBundleIdentifier, %@. This entitlement, if set, must have a value that matches the bundle identifier of the parent app.";
  uint64_t v13 = 365LL;
LABEL_33:
  id v15 = 207LL;
LABEL_22:
  _CreateAndLogError( (uint64_t)"-[MIAppExtensionBundle validateHasCorrespondingEntitlements:error:]",  v13,  @"MIInstallerErrorDomain",  v15,  0LL,  0LL,  v12,  v10,  v20);
  int v16 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    int v16 = v16;
    id v17 = 0;
    *a4 = v16;
  }

  else
  {
    id v17 = 0;
  }

LABEL_15:
  if ((v7 & 0xA) != 0)
  {
    [*(id *)(v18 + 2792) sharedInstance];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 systemAppBundleIDToInfoMap];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    [v25 objectForKeyedSubscript:v10];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      [*(id *)(v18 + 2792) sharedInstance];
      int v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 internalAppBundleIDToInfoMap];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v28 = [v26 objectForKeyedSubscript:v10];
      if (!v28)
      {
        MIDiskImageManagerProxy();
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v29 diskImageAppInfoForBundleID:v10];

        if (!v28)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            int v49 = v10;
            MOLogWrite();
          }

          v31 = 0LL;
LABEL_35:

          id v17 = (void *)v31;
          if ((v7 & 2) == 0)
          {
LABEL_7:
            if (!v17) {
              goto LABEL_8;
            }
            goto LABEL_39;
          }

  if (a4)
  {
    uint64_t v8 = v8;
    uint64_t v10 = 0LL;
    id v15 = 0;
    *a4 = v8;
  }

  else
  {
    uint64_t v10 = 0LL;
    id v15 = 0;
  }

  return v14;
}

  return v10;
}

  return v2;
}

    uint64_t v10 = 28LL;
    goto LABEL_16;
  }

  if ((_DWORD)__buf == -822415874)
  {
    uint64_t v7 = bswap32(DWORD1(v19));
    uint64_t v8 = bswap32(v19);
    goto LABEL_15;
  }

  if ((_DWORD)__buf != -805638658) {
    goto LABEL_23;
  }
  uint64_t v7 = bswap32(DWORD1(v19));
  uint64_t v8 = bswap32(v19);
LABEL_12:
  if (v6 != 32)
  {
    syslog(3, "Got 64-bit magic but didn't read size of 64-bit mach header");
    goto LABEL_26;
  }

  uint64_t v10 = 32LL;
LABEL_16:
  uint64_t v11 = v7;
  if (8 * (unint64_t)v8 > v7)
  {
    syslog(3, "Space required for total size of load commands (%llu) is greater than indicated size of commands (%u).");
    goto LABEL_26;
  }

  if ((uint64_t)(v10 + v7 + a2) >= a3)
  {
    syslog(3, "File is not large enough to contain commands with length %u");
    goto LABEL_26;
  }

  uint64_t v12 = (char *)malloc(v10 + v7);
  uint64_t v13 = v12;
  if (!v12)
  {
    int v16 = __error();
    strerror(*v16);
    syslog(3, "Failed to allocate %llu bytes: %s");
    goto LABEL_27;
  }

  memcpy(v12, &__buf, v10);
  id v14 = pread(a1, &v13[v10], v11, v10 + a2);
  if (v14 < 0)
  {
    id v17 = __error();
    strerror(*v17);
    syslog(3, "Failed to read %u bytes at offset %lld : %s");
    goto LABEL_27;
  }

  if (v14 != v11)
  {
    syslog(3, "Expected to read %u bytes of commands but only got %zd bytes");
LABEL_27:
    free(v13);
    return 0LL;
  }

  return v13;
}

LABEL_36:
          +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]( &OBJC_CLASS___MIDataContainer,  "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:",  v10,  0LL,  2LL,  v11,  0LL,  0LL,  0LL,  v50);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33) {
            [v12 addObjectsFromArray:v33];
          }

          if (!v17)
          {
LABEL_8:
            if ((v7 & 8) == 0) {
              goto LABEL_64;
            }
LABEL_54:
            BOOL v54 = v15;
            __int128 v41 = a6;
            uint64_t v59 = 0u;
            unsigned __int16 v60 = 0u;
            int v57 = 0u;
            v58 = 0u;
            int v42 = v56;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v43)
            {
              __int128 v44 = v43;
              __int128 v45 = *(void *)v58;
              do
              {
                for (uint64_t i = 0LL; i != v44; ++i)
                {
                  if (*(void *)v58 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]( &OBJC_CLASS___MIGroupContainer,  "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:",  *(void *)(*((void *)&v57 + 1) + 8 * i),  0LL,  7LL,  v11,  0LL,  0LL,  0LL);
                  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47) {
                    [v12 addObjectsFromArray:v47];
                  }
                }

                __int128 v44 = [v42 countByEnumeratingWithState:&v57 objects:v66 count:16];
              }

              while (v44);
            }

            a6 = v41;
            id v15 = v54;
            goto LABEL_64;
          }

LABEL_39:
          if ((v7 & 0xA) == 0) {
            goto LABEL_64;
          }
          unsigned __int16 v53 = v15;
          int v51 = a6;
          if ((v7 & 8) != 0) {
            [v56 addObject:v10];
          }
          uint64_t v52 = v17;
          objc_msgSend(v17, "appExtensionBundlesPerformingPlatformValidation:withError:", 0, 0, v49);
          id v34 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v61 = 0u;
          v62 = 0u;
          int v63 = 0u;
          id v64 = 0u;
          id v35 = [v34 countByEnumeratingWithState:&v61 objects:v67 count:16];
          if (v35)
          {
            id v36 = v35;
            id v37 = *(void *)v62;
            do
            {
              for (j = 0LL; j != v36; ++j)
              {
                if (*(void *)v62 != v37) {
                  objc_enumerationMutation(v34);
                }
                [*(id *)(*((void *)&v61 + 1) + 8 * j) identifier];
                __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
                +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]( &OBJC_CLASS___MIPluginDataContainer,  "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:",  v39,  0LL,  4LL,  v11,  0LL,  0LL,  0LL);
                __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
                if (v40) {
                  [v12 addObjectsFromArray:v40];
                }
                if ((v7 & 8) != 0) {
                  [v56 addObject:v39];
                }
              }

              id v36 = [v34 countByEnumeratingWithState:&v61 objects:v67 count:16];
            }

            while (v36);
          }

          a6 = v51;
          id v17 = v52;
          id v15 = v53;
          if ((v7 & 8) == 0) {
            goto LABEL_64;
          }
          goto LABEL_54;
        }
      }

      id v26 = (void *)v28;
    }

    [v26 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExecutableBundle, "bundleForURL:error:", v30, 0LL);
      if (v31)
      {
LABEL_34:

        goto LABEL_35;
      }

      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_33:
        v31 = 0LL;
        goto LABEL_34;
      }

      int v49 = v10;
      uint64_t v50 = v30;
    }

    else
    {
      int v49 = v10;
    }

    MOLogWrite();
    goto LABEL_33;
  }

  id v17 = 0LL;
LABEL_64:
  v32 = (void *)objc_msgSend(v12, "copy", v49);
  int v16 = v55;
LABEL_65:
  if (a6 && !v32) {
    *a6 = v16;
  }
  __int128 v19 = v32;

LABEL_69:
  return v19;
}

unint64_t MIReserveMemoryForValidation(unint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (sAvailableMemoryOnceToken != -1) {
      dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
    }
    if (sMaxAvailableMemoryForResourceValidation < a1)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        MIReserveMemoryForValidation_cold_1((uint64_t)v3, a1, v4, v5, v6, v7, v8, v9);
      }
      a1 = sMaxAvailableMemoryForResourceValidation;
    }

    pthread_mutex_lock(&sAvailableMemoryForResourceValidationMutex);
    for (uint64_t i = sAvailableMemoryForResourceValidation;
          sAvailableMemoryForResourceValidation < a1;
          uint64_t i = sAvailableMemoryForResourceValidation)
    {
      pthread_cond_wait(&sAvailableMemoryForResourceValidationCondition, &sAvailableMemoryForResourceValidationMutex);
    }

    sAvailableMemoryForResourceValidation = i - a1;
    pthread_mutex_unlock(&sAvailableMemoryForResourceValidationMutex);
  }

  return a1;
}

unint64_t MIReturnMemoryUsedForValidation(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (sAvailableMemoryOnceToken != -1) {
      dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
    }
    uint64_t v2 = v1;
    if (sMaxAvailableMemoryForResourceValidation < v1)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        MIReturnMemoryUsedForValidation_cold_2();
      }
      uint64_t v2 = sMaxAvailableMemoryForResourceValidation;
    }

    pthread_mutex_lock(&sAvailableMemoryForResourceValidationMutex);
    unint64_t v3 = sAvailableMemoryForResourceValidation + v2;
    if (v3 > sMaxAvailableMemoryForResourceValidation)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        MIReturnMemoryUsedForValidation_cold_1();
      }
      unint64_t v3 = sMaxAvailableMemoryForResourceValidation;
    }

    sAvailableMemoryForResourceValidation = v3;
    pthread_cond_broadcast(&sAvailableMemoryForResourceValidationCondition);
    return pthread_mutex_unlock(&sAvailableMemoryForResourceValidationMutex);
  }

  return result;
}

void *MIReduceAvailableMemoryForValidationForTesting()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (sAvailableMemoryOnceToken != -1) {
    dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
  }
  unint64_t v0 = sMaxAvailableMemoryForResourceValidation - 10485760;
  MIReserveMemoryForValidation(v0, @"Testing");
  sReservedMemoryForTesting = v0;
  sReservedMemoryForTestingAllocation = (uint64_t)malloc(v0);
  return memset((void *)sReservedMemoryForTestingAllocation, 120, v0);
}

uint64_t MIRestoreAvailableMemoryForValidationAfterTesting()
{
  if (sAvailableMemoryOnceToken != -1) {
    dispatch_once(&sAvailableMemoryOnceToken, &__block_literal_global_1);
  }
  unint64_t v0 = sReservedMemoryForTesting;
  sReservedMemoryForTesting = 0LL;
  MIReturnMemoryUsedForValidation(v0);
  free((void *)sReservedMemoryForTestingAllocation);
  sReservedMemoryForTestingAllocation = 0LL;
  uint64_t result = gLogHandle;
  return result;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_183D3468C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_183D35938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

LABEL_40:
LABEL_26:
          goto LABEL_38;
        }
      }

    case 7:
      int v42 = 0u;
      uint64_t v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      v32 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", 0LL);
      [v32 allFrameworksDirectories];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v33 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (!v33) {
        goto LABEL_35;
      }
      id v34 = v33;
      id v35 = *(void *)v41;
      break;
    default:
      goto LABEL_38;
  }

  while (2)
  {
    for (j = 0LL; j != v34; ++j)
    {
      if (*(void *)v41 != v35) {
        objc_enumerationMutation(v6);
      }
      [*(id *)(*((void *)&v40 + 1) + 8 * j) path];
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v38 = [v3 hasPrefix:v37];

      if ((v38 & 1) != 0)
      {
LABEL_36:

LABEL_37:
        LOBYTE(v6) = 1;
        goto LABEL_38;
      }
    }

    id v34 = [v6 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v34) {
      continue;
    }
    break;
  }

LABEL_35:
  LOBYTE(v6) = 0;
LABEL_38:

  return (char)v6;
}

void sub_183D36C3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_9:
    uint64_t v8 = 0;
LABEL_11:

    goto LABEL_12;
  }

  if (v3 != 1
    || (+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 allowDeletableSystemApps],
        v6,
        !v7))
  {
    uint64_t v8 = 0;
    goto LABEL_12;
  }

  if (!-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp"))
  {
    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 systemAppsDirectory];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 path];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v5 isEqualToString:v11] & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

    id v14 = v14;
    int v16 = 0;
    *a4 = v14;
    goto LABEL_14;
  }

  self->_isNew = container_is_new();
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  is_transient = container_is_transient();
  if (is_transient != 1)
  {
    id v17 = is_transient;
    error_description = container_get_error_description();
    id v20 = "(container_get_error_description returned NULL)";
    if (error_description) {
      id v20 = (const char *)error_description;
    }
    uint64_t v21 = _CreateError( (uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]",  141LL,  @"MIContainerManagerErrorDomain",  v17,  0LL,  0LL,  @"%s",  v19,  (uint64_t)v20);

    id v14 = (id)v21;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }

  self->_isTransient = v25;
  int v16 = 1;
LABEL_14:

  return v16;
}

  return v6;
}

      uint64_t v12 = 0;
      uint64_t v7 = v9;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }

  uint64_t v12 = 0;
  if (!a3) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v12) {
    *a3 = v7;
  }
LABEL_12:

  return v12;
}

  int v16 = v13 != 0;

  _Block_object_dispose(&v20, 8);
  return v16;
}

  return v11;
}

    uint64_t v7 = 0LL;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  if (v6 != 8)
  {
    uint64_t v12 = [v5 fileSystemRepresentation];
    _CreateAndLogError( (uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]",  2302LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"getxattr for installType EA on %s returned %zd (expected %zu)",  v13,  v12);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  [MEMORY[0x189607968] numberWithUnsignedLongLong:value];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = 0LL;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_10:
  if (!v7) {
    *a4 = v8;
  }
LABEL_12:

  return v7;
}

LABEL_6:
  uint64_t v8 = 1;
LABEL_12:

  return v8;
}

  return v12;
}

  return v10;
}

  return v10;
}

LABEL_14:
      ++v10;
    }

    while (v8 != v10);
    int v16 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v8 = v16;
  }

  while (v16);
LABEL_21:

  id v17 = (id)[v5 copy];
  uint64_t v4 = v20;
LABEL_23:

  return v17;
}

  return v12;
}

  uint64_t v11 = v11;
  uint64_t v12 = 0;
  *a3 = v11;
LABEL_17:

  return v12;
}

  _Block_object_dispose(v17, 8);
  return v12;
}

  _Block_object_dispose(v17, 8);
  return v12;
}

  _Block_object_dispose(v17, 8);
  return v12;
}

  id v24 = 0LL;
  id v17 = -[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]( self,  "_populateBundleRecordValues:signingInfo:error:",  v6,  v11,  &v24);
  unsigned int v18 = v24;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[MIInstalledInfoGatherer _populateAppRecordValues:](self, "_populateAppRecordValues:", v6);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[MIInstalledInfoGatherer _populateAppExtensionRecordValues:](self, "_populateAppExtensionRecordValues:", v6);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[MIInstalledInfoGatherer _populatePlaceholderRecordValues:signingInfo:]( self,  "_populatePlaceholderRecordValues:signingInfo:",  v6,  v11);
    }
  }

  if (MILogHandleForSignpost_onceToken != -1) {
    dispatch_once(&MILogHandleForSignpost_onceToken, &__block_literal_global_3);
  }
  __int128 v19 = (os_log_s *)MILogHandleForSignpost_logHandle;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle))
  {
    id v20 = @"[FAIL] ";
    if (v17) {
      id v20 = &stru_189D525C8;
    }
    *(_DWORD *)buf = 138412546;
    int v27 = v20;
    uint64_t v28 = 2112;
    id v29 = v8;
    _os_signpost_emit_with_name_impl( &dword_183D22000,  v19,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "GenerateDict",  "%@Done generating ICL bundle record for %@",  buf,  0x16u);
  }

  if (a4) {
    uint64_t v21 = v17;
  }
  else {
    uint64_t v21 = 1;
  }
  if ((v21 & 1) == 0) {
    *a4 = v18;
  }

  return v17;
}

  return v14;
}

  return v13;
}

  return v21;
}

LABEL_23:
  id v24 = v18;
  return v24;
}

    uint64_t v12 = v12;
    uint64_t v23 = 0;
    *a4 = v12;
    goto LABEL_27;
  }

  uint64_t v23 = 1;
  uint64_t v10 = v29;
LABEL_27:

  return v23;
}

    uint64_t v13 = 0;
    goto LABEL_24;
  }

  int v42 = 0LL;
  uint64_t v13 = -[MIMCMContainer _doInitWithContainer:error:](v8, "_doInitWithContainer:error:", single_result, &v42);
  id v14 = v42;
LABEL_24:
  MEMORY[0x186E26AC4](v11);
  container_query_free();
  if (a5 && !v13) {
    *a5 = v14;
  }

  return v8;
}

  return v16;
}

          [v13 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            int v66 = 0LL;
            v32 = +[MIBundle bundleForURL:error:](&OBJC_CLASS___MIExecutableBundle, "bundleForURL:error:", v31, &v66);
            id v14 = v66;
            if (v32)
            {
              uint64_t v33 = (void *)objc_opt_new();
              v62 = 0u;
              int v63 = 0u;
              id v64 = 0u;
              int v65 = 0u;
              -[MIInstalledInfoGatherer personaUniqueStrings](self, "personaUniqueStrings");
              id v34 = (MIBundleContainer *)objc_claimAutoreleasedReturnValue();
              id v35 = -[MIBundleContainer countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
              if (v35)
              {
                id v36 = v35;
                uint64_t v59 = v33;
                int v57 = v31;
                id v37 = 0LL;
                __int128 v38 = *(void *)v63;
                id obj = v34;
                while (2)
                {
                  __int128 v39 = 0LL;
                  __int128 v40 = v37;
                  __int128 v41 = v14;
                  do
                  {
                    if (*(void *)v63 != v38) {
                      objc_enumerationMutation(obj);
                    }
                    int v42 = *(void *)(*((void *)&v62 + 1) + 8 * v39);
                    BOOL v61 = v41;
                    [v32 dataContainerForPersona:v42 error:&v61];
                    id v37 = (void *)objc_claimAutoreleasedReturnValue();
                    id v14 = v61;

                    if (v37)
                    {
                      [v59 addObject:v37];
                    }

                    else
                    {
                      [v14 domain];
                      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
                      if (![v43 isEqualToString:@"MIContainerManagerErrorDomain"])
                      {

LABEL_56:
                        v31 = v57;
                        bundleContainer = obj;
                        uint64_t v33 = v59;
                        goto LABEL_60;
                      }

                      __int128 v44 = [v14 code];

                      if (v44 != 21) {
                        goto LABEL_56;
                      }
                    }

                    ++v39;
                    __int128 v40 = v37;
                    __int128 v41 = v14;
                  }

                  while (v36 != v39);
                  id v34 = obj;
                  id v36 = -[MIBundleContainer countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
                  if (v36) {
                    continue;
                  }
                  break;
                }

                v31 = v57;
                uint64_t v33 = v59;
              }

              __int128 v45 = (NSArray *)[v33 copy];
              dataContainers = self->_dataContainers;
              self->_dataContainers = v45;

              -[MIInstalledInfoGatherer bundle](self, "bundle");
              __int128 v47 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
              id v48 = self->_builtInAppParallelPlaceholderBundle;
              self->_builtInAppParallelPlaceholderBundle = v47;

              objc_storeStrong((id *)&self->_bundle, v32);
              bundleContainer = self->_bundleContainer;
              self->_bundleContainer = 0LL;
LABEL_60:
            }

            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              [v31 path];
              int v55 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();
            }

            goto LABEL_62;
          }

    MICopyDataProtectionClassEntitlement(v3);
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = v16;
    if (v16)
    {
      uint64_t v7 = _ProtectionClassForString(v16);
      if (v7)
      {
LABEL_29:

        goto LABEL_30;
      }
    }

    uint64_t v7 = 0;
    goto LABEL_29;
  }

  uint64_t v7 = _ProtectionClassForString(v5);
  if (!v7) {
    goto LABEL_23;
  }
LABEL_30:

  return v7;
}

  return v22;
}

    mach_msg_destroy(&msg);
    return v12;
  }

  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

LABEL_75:
  id v14 = 1;
  uint64_t v9 = v15;
  uint64_t v13 = (void *)v74;
  uint64_t v11 = (void *)v75;
  uint64_t v12 = (void *)v76;
LABEL_98:

  return v14;
}

LABEL_41:
  if (a3 && !v26) {
    *a3 = v7;
  }

  return v26;
}

  objc_msgSend( MEMORY[0x189604030],  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v13,  0,  0,  v44,  v46,  v47,  v48);
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  int v55 = 0LL;
  [v9 createTemporaryDirectoryInDirectoryURL:v10 error:&v55];
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v38 = v55;
  __int128 v39 = v38;
  if (!v37)
  {
    __int128 v41 = v36;
    uint64_t v28 = v38;
    id v26 = v9;
    goto LABEL_45;
  }

  [v36 lastPathComponent];
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v54 = v39;
  LODWORD(v45) = v6;
  int v51 = [v9 _stageURLByCopying:v36 toItemName:v40 inStagingDir:v37 stagingMode:2 settingUID:v5 gid:v50 dataProtectionClass:v45 hasSymlink:&v56 error:&v54];
  __int128 v41 = v36;
  uint64_t v28 = v54;

  id v26 = v9;
  if ((v51 & 1) == 0)
  {
LABEL_45:
    id v15 = v52;

    goto LABEL_27;
  }

  [v41 lastPathComponent];
  int v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 URLByAppendingPathComponent:v42 isDirectory:0];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = v52;
  [v52 setObject:v41 forKeyedSubscript:v43];

  id v29 = 0LL;
  id v14 = v56;
  id v25 = 1LL;
LABEL_29:
  close(v17);
LABEL_30:

  uint64_t v30 = v29;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v29);
  if (v14) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

  return v25;
}

        unsigned int v18 = *__error();
        uint64_t v33 = 5;
        cputype = (char *)a1;
        cpusubtype = (uint64_t)strerror(v18);
        uint64_t v9 = "Failed to read mach header from input file %s: %s";
        goto LABEL_54;
      }
    }

    uint64_t v33 = 10;
    cputype = (char *)a1;
    uint64_t v9 = "Unknown binary format for input file %s.";
    goto LABEL_54;
  }

  uint64_t v10 = *__error();
  uint64_t v33 = 2;
  uint64_t v11 = strerror(v10);
  syslog(3, "Can't open input file %s: %s", a1, v11);
LABEL_59:
  *a2 = v32;
LABEL_60:
  id v25 = v33;
  if (a3) {
    *a3 = v33;
  }
  return v25 == 0;
}

void sub_183D3ADBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183D3B1F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183D3B7A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_10:
  return 1LL;
}

  if (a6 && !v17)
  {
    *a6 = (id) v28[5];
    id v17 = v38[5];
  }

  unsigned int v18 = v17;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v18;
}

    uint64_t v21 = 0;
    *a4 = (id) v51[5];
    goto LABEL_11;
  }

  if (v16)
  {
    uint64_t v30 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]",  906LL,  @"MIInstallerErrorDomain",  4LL,  v16,  0LL,  @"Failed to enumerate stashed container",  v17,  v39);
    unsigned int v18 = 0LL;
    __int128 v19 = 0LL;
    id v20 = 0LL;
LABEL_14:
    uint64_t v23 = (void *)v51[5];
    v51[5] = v30;
LABEL_9:

    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }

  id v20 = -[MIBundleContainer initForAppContainerWithURL:]( objc_alloc(&OBJC_CLASS___MIStashedBundleContainer),  "initForAppContainerWithURL:",  v15);
  if (!v20)
  {
    [v15 path];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]",  913LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to create MIStashedBundleContainer instance for %@",  v38,  (uint64_t)v23);
    goto LABEL_8;
  }

  v31 = (id *)(v51 + 5);
  uint64_t v43 = (id)v51[5];
  [v6 bundleMetadataWithError:&v43];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, v43);
  if (!v19)
  {
    uint64_t v30 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]",  920LL,  @"MIInstallerErrorDomain",  4LL,  (void *)v51[5],  0LL,  @"Failed to read bundle metadata from %@",  v32,  (uint64_t)v6);
    int v16 = 0LL;
    unsigned int v18 = 0LL;
    __int128 v19 = 0LL;
    goto LABEL_14;
  }

  unsigned int v18 = (void *)[v20 newStashMetadata];
  [MEMORY[0x189603F50] date];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setDateStashed:v33];

  [v19 installDate];
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setDateOriginallyInstalled:v34];

  id v35 = (id *)(v51 + 5);
  int v42 = (id)v51[5];
  __int128 v41 = [v20 saveStashMetadata:v18 withError:&v42];
  objc_storeStrong(v35, v42);
  if ((v41 & 1) == 0)
  {
    uint64_t v30 = _CreateAndLogError( (uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]",  929LL,  @"MIInstallerErrorDomain",  4LL,  (void *)v51[5],  0LL,  @"Failed to save stash metadata",  v36,  v39);
    int v16 = 0LL;
    goto LABEL_14;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    -[MIBundleContainer bundle](self, "bundle");
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 identifier];
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  int v16 = 0LL;
  uint64_t v21 = 1;
LABEL_11:

  _Block_object_dispose(&v50, 8);
  return v21;
}

  return v9;
}

  uint64_t v23 = v22;

  return v23;
}

LABEL_27:
  -[MIFilesystemScanner builtInExtensionKitExtensionsDirectories](self, "builtInExtensionKitExtensionsDirectories");
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v22;
  uint64_t v28 = -[MIFilesystemScanner _scanExtensionKitLocations:withError:]( self,  "_scanExtensionKitLocations:withError:",  v27,  &v95);
  uint64_t v23 = v95;

  if (!v28) {
    [v80 errorOccurred:v23];
  }
LABEL_29:
  if ((v5 & 0x200) != 0)
  {
    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 cryptexAppsDirectory];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v94 = v23;
    [v4 realPathForURL:v30 allowNonExistentPathComponents:0 isDirectory:1 error:&v94];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v94;

    if (v31)
    {
      int v93 = v32;
      uint64_t v33 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v31, &v93);
      id v34 = v93;

      v32 = v34;
      if (v33) {
        goto LABEL_38;
      }
    }

    else
    {
      [v32 domain];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v35 isEqualToString:*MEMORY[0x189607688]])
      {
        id v36 = [v32 code];

        if (v36 == 2) {
          goto LABEL_38;
        }
      }

      else
      {
      }
    }

    [v80 errorOccurred:v32];
LABEL_38:

    uint64_t v23 = v32;
  }

  if ((v5 & 0x100) == 0) {
    goto LABEL_58;
  }
  v77 = v5;
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 cryptexFrameworksDirectories];
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v91 = 0u;
  v92 = 0u;
  uint64_t v89 = 0u;
  uint64_t v90 = 0u;
  __int128 v39 = v38;
  __int128 v40 = [v39 countByEnumeratingWithState:&v89 objects:v107 count:16];
  if (!v40) {
    goto LABEL_55;
  }
  __int128 v41 = v40;
  int v42 = *(void *)v90;
  uint64_t v43 = *MEMORY[0x189607688];
  do
  {
    for (uint64_t i = 0LL; i != v41; ++i)
    {
      if (*(void *)v90 != v42) {
        objc_enumerationMutation(v39);
      }
      __int128 v45 = *(void *)(*((void *)&v89 + 1) + 8 * i);

      uint64_t v88 = 0LL;
      [v4 realPathForURL:v45 allowNonExistentPathComponents:0 isDirectory:1 error:&v88];
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v47 = v88;
      uint64_t v23 = v47;
      if (v46)
      {
        v87 = v47;
        id v48 = -[MIFilesystemScanner _scanAppsDirectory:withError:](v79, "_scanAppsDirectory:withError:", v46, &v87);
        int v49 = v87;

        uint64_t v23 = v49;
        if (!v48) {
          goto LABEL_52;
        }
      }

      else
      {
        [v47 domain];
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v50 isEqualToString:v43] & 1) == 0)
        {

LABEL_52:
          [v80 errorOccurred:v23];
          goto LABEL_53;
        }

        int v51 = [v23 code];

        if (v51 != 2) {
          goto LABEL_52;
        }
      }

          uint64_t v8 = 0LL;
          if (!v14) {
            return v8;
          }
LABEL_28:
          free(v14);
          return v8;
        }

        syslog(3, "File is not large enough to contain %u fat arch headers and their referenced slices.");
      }

      else
      {
        syslog(3, "Number of fat archs %u exceeds the maximum %u");
      }
    }

    else
    {
      uint64_t v13 = __error();
      strerror(*v13);
      syslog(3, "Failed to read fat header of %s : %s");
    }

    id v14 = 0LL;
    goto LABEL_27;
  }

  if ((__buf + 17958194) >= 2)
  {
    uint64_t v6 = -805638658;
LABEL_15:
    if (__buf != v6)
    {
      syslog(3, "Unknown binary with magic 0x%08x at %s");
      return 0LL;
    }
  }

  uint64_t v10 = _read_macho_header_and_load_commands(a1, 0LL, v24.st_size);
  if (v10)
  {
    uint64_t v11 = v10;
    (*(void (**)(uint64_t, void, char *))(a3 + 16))(a3, 0LL, v10);
    free(v11);
    return 1LL;
  }

  syslog(3, "Failed to read macho header and load commands in %s at %u");
  return 0LL;
}

LABEL_4:
  v2->_installQOSOverride = 0;
LABEL_25:
  if (objc_msgSend(v3, "BOOLForKey:", @"SkipDeviceFamilyCheck", v14))
  {
    uint64_t v6 = 1;
  }

  else
  {
    uint64_t v6 = 0;
  }

  v2->_skipDeviceFamilyCheck = v6;
  if ([v3 BOOLForKey:@"SkipThinningCheck"])
  {
    uint64_t v7 = 1;
  }

  else
  {
    uint64_t v7 = 0;
  }

  v2->_skipThinningCheck = v7;
  if ([v3 BOOLForKey:@"AllowPatchInstallationWithoutSinf"])
  {
    uint64_t v8 = 1;
  }

  else
  {
    uint64_t v8 = 0;
  }

  v2->_allowPatchWithoutSinf = v8;
  v2->_nSimultaneousInstallations = 5LL;
  uint64_t v9 = [v3 integerForKey:@"SimultaneousInstallsNumber"];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      id v15 = v9;
      MOLogWrite();
    }

    v2->_nSimultaneousInstallations = v10;
  }

  v2->_requireEligibilityChecksForAppsInDevelopment = objc_msgSend( v3,  "BOOLForKey:",  @"RequireEligibilityForInDevelopmentApps",  v15);
  v17.receiver = v2;
  v17.super_class = (Class)&OBJC_CLASS___MIDaemonConfiguration;
  uint64_t v11 = -[MIGlobalConfiguration installdJetsamLimit](&v17, sel_installdJetsamLimit);
  v2->_estimatedAvailableMemoryForValidation = (unint64_t)v11 - 12582912;
  if (-[MIGlobalConfiguration isSharediPad](v2, "isSharediPad") || (MGGetBoolAnswer() & 1) != 0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = os_variant_uses_ephemeral_storage() ^ 1;
  }
  v2->_deviceHasPersonas = v12;

  return v2;
}

void sub_183D3F5AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_4()
{
  return _os_crash_msg();
}

LABEL_28:
    int v16 = v12;
    goto LABEL_29;
  }

  [v13 bundle];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      uint64_t v23 = v13;
      MOLogWrite();
    }

    id v15 = 0LL;
    __int128 v19 = v17;
    if (a8) {
      goto LABEL_29;
    }
    goto LABEL_23;
  }

  if (!v12 || !v11) {
    goto LABEL_8;
  }
  uint64_t v33 = v16;
  unsigned int v18 = [v15 makeContainerLiveWithError:&v33];
  __int128 v19 = v33;

  if ((v18 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      MOLogWrite();
    }

    -[MIBundle identifier](self, "identifier", v29, v31);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0LL;
    id v26 = [v15 removeUnderlyingContainerWaitingForDeletion:0 error:&v32];
    int v27 = v32;

    if (!a8) {
      goto LABEL_23;
    }
LABEL_29:
    __int128 v19 = v19;
    id v20 = 0LL;
    *a8 = v19;
    goto LABEL_30;
  }

  id v17 = v19;
LABEL_8:
  id v20 = v15;
  id v15 = v20;
  __int128 v19 = v17;
LABEL_30:

  return v20;
}

        v32 = v19;
        goto LABEL_29;
      }

      uint64_t v33 = (void *)*MEMORY[0x189607688];
      strerror(*v16);
      _CreateError( (uint64_t)"-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]",  368LL,  v33,  v17,  0LL,  0LL,  @"stat of %s failed: %s",  v34,  (uint64_t)v13);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }

  if (rename(v13, v15))
  {
    id v20 = __error();
    uint64_t v21 = *v20;
    if ((_DWORD)v21 != 30)
    {
      if ((_DWORD)v21 != 18)
      {
        id v35 = (void *)*MEMORY[0x189607688];
        strerror(*v20);
        _CreateError( (uint64_t)"-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]",  388LL,  v35,  v21,  0LL,  0LL,  @"rename of %s to %s failed: %s",  v36,  (uint64_t)v13);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v1_Block_object_dispose(va, 8) = 0;
        if (!a6) {
          goto LABEL_28;
        }
        goto LABEL_25;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:].cold.1( (uint64_t)v13,  (uint64_t)v15,  v22,  v23,  v24,  v25,  v26,  v27);
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        __int128 v38 = v13;
        __int128 v39 = v15;
        MOLogWrite();
      }
    }

    objc_msgSend(v12, "path", v38, v39);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    id v29 = [v28 containsString:@"/System/Library/AppPlaceholders"];

    __int128 v41 = 0LL;
    unsigned int v18 = -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]( self,  "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:",  v12,  v14,  1LL,  0LL,  0LL,  &v41);
    uint64_t v30 = v41;
    __int128 v19 = v30;
    if (!v18 || (_DWORD)v21 == 30 || (v29 & 1) != 0)
    {
LABEL_24:
      if (!a6) {
        goto LABEL_28;
      }
      goto LABEL_25;
    }

    __int128 v40 = v30;
    v31 = -[MIFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v12, &v40);
    v32 = v40;
  }

  else
  {
    v32 = 0LL;
  }

  LOBYTE(v1_Block_object_dispose(va, 8) = 1;
LABEL_29:

  return v18;
}

  id v35 = -[MIFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v7,  0LL);
  if (!v35)
  {
    [v7 path];
    int v42 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
LABEL_53:

LABEL_54:
    __int128 v39 = 0LL;
    __int128 v38 = 0LL;
    id v36 = 0LL;
    goto LABEL_39;
  }

  id v36 = (void *)v35;
  -[MIFileManager _realPathForURL:allowNonExistentPathComponents:]( self,  "_realPathForURL:allowNonExistentPathComponents:",  v6,  1LL);
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    __int128 v38 = v37;
    if (!_CheckRealpathHasBasePrefix(v37, v36))
    {
LABEL_71:
      __int128 v39 = 0LL;
      goto LABEL_39;
    }

    if (v26 != -1)
    {
LABEL_32:
      __int128 v39 = v38;
      __int128 v38 = v39;
      goto LABEL_39;
    }

    [v38 pathComponents];
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 pathComponents];
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v45 = [v72 count];
    int v73 = v44;
    __int128 v46 = [v44 count];
    if (v46 < 2 || v45 <= 1)
    {
    }

    else
    {
      __int128 v47 = v46;
      id v48 = 1LL;
      [v72 objectAtIndexedSubscript:1];
      int v49 = (void *)objc_claimAutoreleasedReturnValue();

      [v73 objectAtIndexedSubscript:1];
      v67 = v45;
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        int v51 = 1LL;
      }

      if (v67 - v48 <= v47 - v51)
      {
        if (v67 <= v48)
        {
LABEL_75:

          goto LABEL_32;
        }

        while (1)
        {
          [v72 objectAtIndexedSubscript:v48];
          int v57 = (void *)objc_claimAutoreleasedReturnValue();
          [v73 objectAtIndexedSubscript:v51];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v71 = [v57 isEqualToString:v58];

          if ((v71 & 1) == 0) {
            break;
          }
          ++v48;
          ++v51;
          if (v67 == v48) {
            goto LABEL_75;
          }
        }

        int v69 = v51;
        uint64_t v59 = [v6 path];
        int v66 = [v7 path];
        [v38 path];
        uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
        unsigned __int16 v60 = [v36 path];
        [v72 objectAtIndexedSubscript:v48];
        int v65 = (void *)objc_claimAutoreleasedReturnValue();
        [v73 objectAtIndexedSubscript:v69];
        id v64 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v68 = (void *)v60;
        id v56 = (void *)v59;
        MOLogWrite();

        int v55 = (void *)v66;
        goto LABEL_69;
      }
    }

    uint64_t v52 = [v6 path];
    unsigned __int16 v53 = [v7 path];
    BOOL v54 = [v38 path];
    [v36 path];
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v70 = (void *)v54;
    int v55 = (void *)v53;
    id v56 = (void *)v52;
    MOLogWrite();
LABEL_69:

LABEL_70:
    goto LABEL_71;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    [v6 path];
    BOOL v61 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  __int128 v39 = 0LL;
  __int128 v38 = 0LL;
LABEL_39:
  __int128 v40 = v39;

  return v40;
}

LABEL_25:
    id v26 = v12;
    objc_msgSend(v7, "personaForBundleID:error:", v6, &v26, v23, v24, v25);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v26;

    uint64_t v12 = v21;
    if (!a4) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_25;
  }
  int v27 = v12;
  -[MIAppIdentity resolvePersonaUsingModuleSpecificLogicWithError:]( self,  "resolvePersonaUsingModuleSpecificLogicWithError:",  &v27);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = v27;

  if (!v11)
  {
    [v16 domain];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 isEqualToString:@"MIInstallerErrorDomain"])
    {
      unsigned int v18 = [v16 code];

      if (v18 == 161)
      {
LABEL_24:

        uint64_t v12 = 0LL;
        goto LABEL_25;
      }
    }

    else
    {
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      id v24 = v13;
      id v25 = v16;
      uint64_t v23 = v6;
      MOLogWrite();
    }

    goto LABEL_24;
  }

          goto LABEL_26;
        }

        uint64_t v10 = *__error();
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          objc_msgSend(v9, "path", v24, v25);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          id v24 = v11;
          id v25 = strerror(v10);
          MOLogWrite();
LABEL_26:
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v23 = [v3 countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v5 = v23;
    }

    while (v23);
  }
}

id _ErrorDict()
{
  v5[1] = *MEMORY[0x1895F89C0];
  uint64_t path = container_error_get_path();
  if (path)
  {
    [NSString stringWithFileSystemRepresentation:path];
    unint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v1 = @"Failed to read container error path";
  }

  uint64_t v4 = *MEMORY[0x1896074F8];
  v5[0] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *_RawContainerDescription()
{
  unint64_t v0 = (void *)container_copy_unlocalized_description();
  if (v0)
  {
    [NSString stringWithUTF8String:v0];
    unint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v1 = @"<No container description>";
  }

  free(v0);
  return v1;
}

LABEL_33:
  container_query_free();
  __int128 v41 = (id)v54[5];
  _Block_object_dispose(&v53, 8);

  return v41;
}

void sub_183D41DCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_183D42164( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t MIInstallProfileAtURL(void *a1)
{
  id v1 = a1;
  [v1 path];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = (const void *)MISProfileCreateWithFile();

  if (v3)
  {
    uint64_t v4 = _InstallProvisioningProfile();
    CFRelease(v3);
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v1 path];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

uint64_t _InstallProvisioningProfile()
{
  uint64_t v0 = MISInstallProvisioningProfile();
  uint64_t v1 = v0;
  if ((_DWORD)v0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MIErrorStringForMISError(v0);
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  return v1;
}

uint64_t MIInstallProfileWithData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MISProfileCreateWithData();
  if (v2)
  {
    unint64_t v3 = (const void *)v2;
    uint64_t v4 = _InstallProvisioningProfile();
    CFRelease(v3);
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v1 length];
      MOLogWrite();
    }

    uint64_t v4 = 0LL;
  }

  return v4;
}

void MIUninstallProfilesForAppIdentifier(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  uint64_t v3 = MISEnumerateMatchingProfilesUnauthoritative();
  if ((_DWORD)v3 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MIErrorStringForMISError(v3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }
}

uint64_t __MIUninstallProfilesForAppIdentifier_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  if (!a7) {
    return 1LL;
  }
  uint64_t result = MISRemoveProvisioningProfile();
  if ((_DWORD)result)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MIErrorStringForMISError(result);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    return 0LL;
  }

  return result;
}

id MIErrorStringForMISError(uint64_t a1)
{
  unsigned int v1 = (a1 >> 14) & 0xFFF;
  if (a1 >> 26 == 58 && v1 == 2)
  {
    id v2 = (void *)MISCopyErrorStringForErrorCode();
  }

  else
  {
    else {
      objc_msgSend( NSString,  "stringWithFormat:",  @"POSIX error %d (%s)",  a1 & 0x3FFF,  strerror(a1 & 0x3FFF));
    }
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id MIFetchSignatureVersionForExecutableURL(void *a1, _DWORD *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = MISValidationCopySignatureVersion();

  if (v4 && a2) {
    *a2 = v4;
  }
  return 0LL;
}

uint64_t MIIsFatalMISProfileInstallationError(int a1, unsigned int a2)
{
  if (a1) {
    unsigned int v2 = a2;
  }
  else {
    unsigned int v2 = 0;
  }
  if (a1 == -402620383) {
    return 1LL;
  }
  else {
    return v2;
  }
}

LABEL_51:
        id v14 = 0LL;
        goto LABEL_62;
      }

      switch(v6)
      {
        case 5u:
          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 coreServicesAppBundleIDToInfoMap];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          id v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 identifier];
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 objectForKeyedSubscript:v26];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13) {
            goto LABEL_23;
          }
          break;
        case 2u:
          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          int v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 internalAppBundleIDToInfoMap];
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          id v29 = (void *)objc_claimAutoreleasedReturnValue();
          [v29 identifier];
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v28 objectForKeyedSubscript:v30];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13) {
            goto LABEL_23;
          }
          break;
        case 1u:
          +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 systemAppBundleIDToInfoMap];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 identifier];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 objectForKeyedSubscript:v12];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            break;
          }

LABEL_43:
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
LABEL_50:

          goto LABEL_51;
        default:
          goto LABEL_43;
      }

      -[MIInstalledInfoGatherer bundle](self, "bundle");
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
      [v50 identifier];
      int v51 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

      goto LABEL_50;
    }
  }

  return v40;
}

LABEL_48:
  -[MIInstalledInfoGatherer owningBundleIdentifier](v112, "owningBundleIdentifier");
  BOOL v54 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v109 = v43;
  if (!v54)
  {
    id v56 = v10;
    [v9 bundleURL];
    int v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 URLByAppendingPathComponent:@"Settings.bundle" isDirectory:1];
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v117 = 0LL;
    unsigned __int16 v60 = [v59 itemExistsAtURL:v58 error:&v117];
    BOOL v61 = v117;

    if (v60)
    {
      [v7 setHasSettingsBundle:1];
      uint64_t v10 = v56;
      goto LABEL_68;
    }

    [v61 domain];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v67 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v68 = [v61 code];

      int v85 = v68 == 2;
      uint64_t v10 = v56;
      if (v85) {
        goto LABEL_68;
      }
    }

    else
    {

      uint64_t v10 = v56;
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v98 = v58;
      char v99 = v61;
      MOLogWrite();
    }

  uint64_t v81 = *(void **)(a1 + 32);
  id v82 = *(void *)(a1 + 80);
  id v83 = *(unsigned int *)(a1 + 92);
  v84 = *(unsigned int *)(a1 + 96);
  int v85 = *(unsigned int *)(a1 + 100);
  v98 = 0LL;
  LOBYTE(v97) = 1;
  int v86 = [v81 bulkSetPropertiesForPath:v82 UID:v83 GID:v84 mode:v19 flags:v11 dataProtectionClass:v85 removeACL:v97 error:&v98];
  v87 = v98;
  uint64_t v78 = v98;
  if ((v86 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v87);
    goto LABEL_45;
  }

  if (*(_DWORD *)(a2 + 56) != 2)
  {
    uint64_t v88 = *(void *)(a1 + 80);
    uint64_t v89 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v90 = *(_WORD *)(v89 + 24);
    if (v90)
    {
      do
        uint64_t v91 = --v90;
      while (*(_BYTE *)(v88 + v90) != 47 && v90 != 0);
    }

    else
    {
      uint64_t v91 = 0LL;
    }

    *(_BYTE *)(v88 + v91) = 0;
    *(void *)(v89 + 24) = v91;
  }

  uint64_t v79 = 1LL;
LABEL_46:

  return v79;
}

LABEL_68:
    __int128 v40 = v107;
    uint64_t v43 = v109;
    if (v10) {
      goto LABEL_50;
    }
    goto LABEL_69;
  }

  if (v10)
  {
LABEL_50:
    -[MIInstalledInfoGatherer _staticDiskUsage](v112, "_staticDiskUsage", v98, v99);
    int v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setStaticDiskUsage:v55];

    goto LABEL_71;
  }

LABEL_69:
  if (v102 == 10) {
    [v7 setIsPlaceholder:1];
  }
LABEL_71:
  if (!v40)
  {
    __int128 v44 = 1;
    goto LABEL_95;
  }

  uint64_t v105 = v10;
  char v106 = v9;
  uint64_t v70 = (void *)objc_opt_new();
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  uint64_t v71 = v40;
  v72 = [v71 countByEnumeratingWithState:&v113 objects:v120 count:16];
  if (v72)
  {
    int v73 = v72;
    __int128 v111 = v70;
    id v100 = v19;
    id v101 = v8;
    uint64_t v103 = v7;
    BOOL v74 = 0LL;
    int v75 = 0LL;
    v76 = *(void *)v114;
    do
    {
      v77 = v71;
      uint64_t v78 = 0LL;
      uint64_t v79 = v75;
      do
      {
        if (*(void *)v114 != v76) {
          objc_enumerationMutation(v77);
        }
        v80 = *(void **)(*((void *)&v113 + 1) + 8 * v78);
        objc_msgSend(v80, "personaUniqueString", v98);
        uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIInstalledInfoGatherer _buildBundlePersonaRecordWithDataContainer:]( v112,  "_buildBundlePersonaRecordWithDataContainer:",  v80);
        int v75 = (id)objc_claimAutoreleasedReturnValue();

        if (v81) {
          [v111 setObject:v75 forKeyedSubscript:v81];
        }
        +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
        id v82 = (void *)objc_claimAutoreleasedReturnValue();
        [v82 primaryPersonaString];
        id v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = [v81 isEqualToString:v83];

        if (v81) {
          int v85 = v84 == 0;
        }
        else {
          int v85 = 0;
        }
        if (!v85)
        {
          int v86 = v75;

          BOOL v74 = v86;
        }

        ++v78;
        uint64_t v79 = v75;
      }

      while (v73 != v78);
      uint64_t v71 = v77;
      int v73 = [v77 countByEnumeratingWithState:&v113 objects:v120 count:16];
    }

    while (v73);

    uint64_t v8 = v101;
    uint64_t v7 = v103;
    __int128 v19 = v100;
    uint64_t v70 = v111;
    if (v74) {
      goto LABEL_91;
    }
  }

  else
  {

    int v75 = 0LL;
  }

  int v75 = v75;
  BOOL v74 = v75;
LABEL_91:
  objc_msgSend(v74, "dataContainerURL", v98);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setDataContainerURL:v87];

  [v74 environmentVariables];
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setEnvironmentVariables:v88];

  [v74 groupContainerURLs];
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setGroupContainers:v89];

  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v91 = [v90 deviceHasPersonas];

  uint64_t v43 = v109;
  if (v91) {
    v92 = [v70 copy];
  }
  else {
    v92 = objc_opt_new();
  }
  int v93 = (void *)v92;
  [v7 setPersonasRecordMap:v92];

  __int128 v44 = 1;
  uint64_t v10 = v105;
  uint64_t v9 = v106;
  __int128 v40 = v107;
LABEL_95:

  return v44;
}

    uint64_t v33 = v25;
    if (!v18) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }

void __MILogHandleForSignpost_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.installd", "Signpost");
  unsigned int v1 = (void *)MILogHandleForSignpost_logHandle;
  MILogHandleForSignpost_logHandle = (uint64_t)v0;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = [v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new();
  }
  id v20 = (void *)v19;
  if (v18)
  {
    uint64_t v21 = (void *)[objc_alloc(NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1896075E0]];
  }

  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x189607798]];
  }
  [NSString stringWithUTF8String:a1];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setObject:v22 forKeyedSubscript:@"FunctionName"];

  [MEMORY[0x189607968] numberWithInt:a2];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setObject:v23 forKeyedSubscript:@"SourceFileLine"];

  [MEMORY[0x189607870] errorWithDomain:v15 code:a4 userInfo:v20];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id _CreateError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogErrorV( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 userInfo];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = *MEMORY[0x1896075E0];
  [v17 objectForKeyedSubscript:*MEMORY[0x1896075E0]];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v15 domain];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 code];
      [v15 userInfo];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 objectForKeyedSubscript:v18];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  [v1 domain];
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"MIInstallerErrorDomain"]
    && [v1 code] == 12)
  {
    BOOL v3 = 1LL;
  }

  else
  {
    [v1 domain];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v4 isEqualToString:@"MIInstallerErrorDomain"]
      && [v1 code] == 11)
    {
      BOOL v3 = 1LL;
    }

    else
    {
      [v1 domain];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        BOOL v3 = 0LL;
      }
    }
  }

  return v3;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    [NSString stringWithUTF8String:v0];
    unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v1);
  }

  else
  {
    unsigned int v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

id _MIValidateObject(void *a1)
{
  id v1 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

LABEL_32:
  uint64_t v28 = -[MIPluginKitBundle extensionPointIdentifier](self, "extensionPointIdentifier");
  if (!v28)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 path];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    int v42 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  215LL,  @"MIInstallerErrorDomain",  45LL,  0LL,  &unk_189D64290,  @"Appex bundle at %@ with id %@ does not define an extension point in its Info.plist",  v38,  (uint64_t)v37);
    uint64_t v21 = v20;
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }

  id v29 = (void *)v28;
  __int128 v47 = v20;
  int v49 = 0LL;
  -[MIAppExtensionBundle extensionCacheEntryWithError:](self, "extensionCacheEntryWithError:", &v49);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v49;
  if (v30)
  {
    v31 = -[MIPluginKitBundle _overlayDictionary:onDictionary:](self, "_overlayDictionary:onDictionary:", v30, v8);
    -[MIPluginKitBundle setOverlaidInfoPlist:](self, "setOverlaidInfoPlist:", v31);
  }

  else
  {
    v31 = -[MIBundle bundleURL](self, "bundleURL");
    [v31 path];
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22) {
      _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  223LL,  @"MIInstallerErrorDomain",  59LL,  v6,  &unk_189D642B8,  @"Appex bundle at %@ with id %@ specifies a value (%@) for the EXExtensionPointIdentifier key in the EXAppExtensionAttributes dictionary in its Info.plist that does not correspond to a known extension point.",  v40,  (uint64_t)v46);
    }
    else {
    __int128 v45 = _CreateAndLogError( (uint64_t)"-[MIPluginKitBundle overlaidInfoPlistWithError:]",  225LL,  @"MIInstallerErrorDomain",  59LL,  v6,  &unk_189D642E0,  @"Appex bundle at %@ with id %@ specifies a value (%@) for the NSExtensionPointIdentifier key in the NSExtension dictionary in its Info.plist that does not correspond to a known extension point.",  v40,  (uint64_t)v46);
    }

    uint64_t v6 = (id)v45;
  }

  if (!v30)
  {
LABEL_23:
    uint64_t v7 = 0LL;
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }

    [v32 setSkipProfileIDValidation:1];
    goto LABEL_33;
  }

  -[MIBundle identifier](self, "identifier");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v16;
  MOLogWrite();
LABEL_25:

LABEL_26:
  -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo", v67);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  return v19;
}

LABEL_3:
  -[MIPluginKitBundle overlaidInfoPlist](self, "overlaidInfoPlist");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3) {
    goto LABEL_26;
  }
LABEL_24:
  if (!v7) {
    *a3 = v6;
  }
LABEL_26:

  return v7;
}

LABEL_61:
  return v51;
}

BOOL MIIsValidInstallationDomain(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

__CFString *MIStringForInstallationDomain(unint64_t a1)
{
  if (a1 < 5) {
    return off_189D48BA0[a1];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"Unknown MIInstallationDomain: %lu", a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id MIDiskImageManagerProxy()
{
  if (MIDiskImageManagerProxy_onceToken != -1) {
    dispatch_once(&MIDiskImageManagerProxy_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)MIDiskImageManagerProxy_miDiskImageManager;
  if (MIDiskImageManagerProxy_miDiskImageManager)
  {
    [(id)MIDiskImageManagerProxy_miDiskImageManager sharedInstance];
    uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v0;
}

Class __MIDiskImageManagerProxy_block_invoke()
{
  Class result = NSClassFromString(@"MIDiskImageManager");
  MIDiskImageManagerProxy_miDiskImageManager = (uint64_t)result;
  return result;
}

id MobileInstallerDelegateProtocolInterface()
{
  WeakRetained = objc_loadWeakRetained(&MobileInstallerDelegateProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6795C0];
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&MobileInstallerDelegateProtocolInterface_weakInterface, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  return WeakRetained;
}

id MobileInstallerProtocolInterface()
{
  WeakRetained = objc_loadWeakRetained(&MobileInstallerProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C679620];
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    ICLKnownBundleRecordClasses();
    id v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 setByAddingObject:objc_opt_class()];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v3 = (void *)MEMORY[0x189604010];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained setClasses:v7 forSelector:sel_checkCapabilities_withOptions_completion_ argumentIndex:0 ofReply:0];

    uint64_t v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained setClasses:v10 forSelector:sel_uninstallIdentifiers_withOptions_completion_ argumentIndex:0 ofReply:1];

    [WeakRetained setClasses:v2 forSelector:sel_installURL_identity_targetingDomain_options_returningResultInfo_completion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_fetchInfoForFrameworkAtURL_options_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_cancelUpdateForStagedUUID_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_finalizeStagedInstallForUUID_returningResultInfo_completion_ argumentIndex:1 ofReply:1];
    objc_storeWeak(&MobileInstallerProtocolInterface_weakInterface, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  return WeakRetained;
}

void sub_183D4BBC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_73:
  return v23 & 1;
}

LABEL_124:
  return v31;
}

void sub_183D51354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_183D51DDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_183D52098( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id getUMUserManagerClass_0()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)getUMUserManagerClass_softClass_0;
  uint64_t v7 = getUMUserManagerClass_softClass_0;
  if (!getUMUserManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getUMUserManagerClass_block_invoke_0;
    v3[3] = &unk_189D48720;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_183D523A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183D53C50(_Unwind_Exception *a1)
{
}

void sub_183D53CDC(_Unwind_Exception *a1)
{
}

void sub_183D53D68(_Unwind_Exception *a1)
{
}

void sub_183D53E68(_Unwind_Exception *a1)
{
}

void sub_183D53F48(_Unwind_Exception *a1)
{
}

void sub_183D540F4(_Unwind_Exception *a1)
{
}

void sub_183D541B8(_Unwind_Exception *a1)
{
}

void sub_183D54440(_Unwind_Exception *a1)
{
}

void sub_183D54688(_Unwind_Exception *a1)
{
}

Class __getUMUserManagerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  BOOL v3 = 0LL;
  if (!UserManagementLibraryCore_frameworkLibrary_0)
  {
    __int128 v4 = xmmword_189D48F10;
    uint64_t v5 = 0LL;
    UserManagementLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }

  if (!UserManagementLibraryCore_frameworkLibrary_0) {
    __getUMUserManagerClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    __getUMUserManagerClass_block_invoke_cold_2();
  }
  getUMUserManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t ICLKnownBundleRecordClasses()
{
  uint64_t v0 = (void *)MEMORY[0x189604010];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0LL;
          goto LABEL_11;
        }

        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
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

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  __int128 v9 = (void *)[v2 copy];
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_189D48F30;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_183D554D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __MIDictionaryContainsOnlyClasses_block_invoke(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v2 = v1;
    }

    else
    {
      [NSString stringWithFormat:@"%@", v1];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v3 = v2;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if (!v1) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      id v2 = v1;
LABEL_7:
      id v3 = v2;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = v1;
    [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    id v3 = 0LL;
    goto LABEL_12;
  }

  [v1 allObjects];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v3 = 0LL;
  }

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

id MICreateSHA256Digest(void *a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  memset(md, 0, sizeof(md));
  memset(&v48, 0, sizeof(v48));
  id v3 = a1;
  if (lstat((const char *)[v3 fileSystemRepresentation], &v48))
  {
    id v4 = __error();
    int v5 = *v4;
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:*v4 userInfo:0];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v3 fileSystemRepresentation];
    strerror(v5);
    _CreateAndLogError( (uint64_t)"MICreateSHA256Digest",  121LL,  @"MIInstallerErrorDomain",  4LL,  v6,  0LL,  @"Failed to stat path %s : %s",  v8,  v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }

  if (v48.st_size <= 0xFFFFFFF)
  {
    id v47 = 0LL;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v3 options:3 error:&v47];
    id v9 = v47;
    if (v11)
    {
      id v12 = v11;
      CC_SHA256((const void *)[v12 bytes], objc_msgSend(v12, "length"), (unsigned __int8 *)md);

LABEL_28:
      uint64_t v23 = (char *)calloc(1uLL, 0x41uLL);
      id v24 = v23;
      uint64_t v25 = 0LL;
      id v26 = (unsigned __int8 *)md;
      do
      {
        unsigned int v27 = *v26++;
        uint64_t v28 = &v23[v25];
        *uint64_t v28 = _HexToASCII_hex[(unint64_t)v27 >> 4];
        v25 += 2LL;
        v28[1] = _HexToASCII_hex[v27 & 0xF];
      }

      while (v25 != 64);
      v23[64] = 0;
      [NSString stringWithUTF8String:v23];
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      free(v24);
      if (!a2) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }

    goto LABEL_3;
  }

  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x8810000000LL;
  __int128 v45 = "";
  memset(&v46, 0, sizeof(v46));
  CC_SHA256_Init(&v46);
  id v13 = v3;
  __int128 v14 = (const char *)[v13 fileSystemRepresentation];
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  __int128 v39 = __MICreateSHA256Digest_block_invoke;
  __int128 v40 = &unk_189D48F60;
  __int128 v41 = &v42;
  id v15 = v38;
  int v16 = open(v14, 256);
  int v17 = v16;
  if (v16 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v21 = __error();
      strerror(*v21);
      MOLogWrite();
    }

    id v20 = 0LL;
LABEL_21:
    int v19 = 0;
  }

  else
  {
    if (fstat(v16, &v49))
    {
      goto LABEL_12;
    }

    off_t st_size = v49.st_size;
    if (v49.st_size >= 0x10000) {
      int64_t v31 = 0x10000LL;
    }
    else {
      int64_t v31 = v49.st_size;
    }
    v32 = malloc(v31);
    if (!v32)
    {
LABEL_12:
      uint64_t v18 = __error();
      strerror(*v18);
      MOLogWrite();
LABEL_13:
      int v19 = 0;
      id v20 = 0LL;
LABEL_23:
      close(v17);
      goto LABEL_24;
    }

    id v20 = v32;
    if (st_size < 1)
    {
      int v19 = 1;
      goto LABEL_23;
    }

    id v37 = v13;
    off_t v33 = 0LL;
    while (1)
    {
      if (v31 >= st_size - v33) {
        int64_t v31 = st_size - v33;
      }
      ssize_t v34 = read(v17, v20, v31);
      ssize_t v35 = v34;
      if (v34 == -1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v36 = __error();
          id v13 = v37;
          strerror(*v36);
          MOLogWrite();
          goto LABEL_21;
        }

        goto LABEL_58;
      }

      if (v34 <= 0) {
        break;
      }
      int v19 = v39((uint64_t)v15, v20, v34);
      if (v19)
      {
        v33 += v35;
        off_t st_size = v49.st_size;
        if (v33 < v49.st_size) {
          continue;
        }
      }

      goto LABEL_59;
    }

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      id v13 = v37;
      goto LABEL_21;
    }

LABEL_58:
    int v19 = 0;
LABEL_59:
    id v13 = v37;
  }

  if (v17 != -1) {
    goto LABEL_23;
  }
LABEL_24:
  if (v20) {
    free(v20);
  }

  CC_SHA256_Final((unsigned __int8 *)md, (CC_SHA256_CTX *)(v43 + 4));
  if (v19)
  {
    _Block_object_dispose(&v42, 8);
    id v9 = 0LL;
    goto LABEL_28;
  }

  _CreateAndLogError( (uint64_t)"MICreateSHA256Digest",  148LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to read %@",  v22,  (uint64_t)v13);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v42, 8);
LABEL_3:
  __int128 v10 = 0LL;
  if (!a2) {
    goto LABEL_33;
  }
LABEL_31:
  if (!v10) {
    *a2 = v9;
  }
LABEL_33:

  return v10;
}

          id v36 = 0;
          if (a6) {
            goto LABEL_60;
          }
          goto LABEL_59;
        }

        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          v67 = -[MIBundle identifier](self, "identifier");
          MOLogWrite();
        }

        objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
        [v32 setValidateResources:0];
        __int128 v40 = v32;
        __int128 v41 = 0LL;
      }

      [v40 setValidateUsingDetachedSignature:v41];
      [v32 setVerifyTrustCachePresence:1];
      goto LABEL_58;
    }

void sub_183D55D78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __MICreateSHA256Digest_block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  return 1LL;
}

void MIRunTransactionalTask(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = a1;
  BOOL v6 = (void *)os_transaction_create();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __MIRunTransactionalTask_block_invoke;
  v9[3] = &unk_189D48F88;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  dispatch_async(v5, v9);
}

uint64_t __MIRunTransactionalTask_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_183D56398( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void sub_183D566CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_183D56AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_183D56E30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_45:
    if (!v24) {
      *a5 = v29;
    }
    goto LABEL_47;
  }

  uint64_t v18 = v17;
  int v19 = 0LL;
  id v20 = (void *)*MEMORY[0x189604DE8];
  uint64_t v21 = (const void *)*MEMORY[0x189604DE0];
  while (1)
  {
    [v40 objectAtIndexedSubscript:v19];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    uint64_t v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v24 = v23;
    }
    else {
      id v24 = 0LL;
    }

    id v26 = v20;
    if (v10)
    {
      [v10 objectAtIndexedSubscript:v19];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v24) {
      break;
    }
    if (v16)
    {
      if (CFEqual(v20, v26)) {
        unsigned int v27 = v21;
      }
      else {
        unsigned int v27 = v20;
      }
      [v39 setObject:v27 forKeyedSubscript:v24];
    }

    else
    {
      uint64_t v28 = (const void *)MGCopyAnswer();
      if (!v28)
      {
        CFRetain(v21);
        uint64_t v28 = v21;
      }

      if (!CFEqual(v28, v26)) {
        [v39 setObject:v28 forKeyedSubscript:v24];
      }
      CFRelease(v28);
    }

    if (v18 == ++v19) {
      goto LABEL_34;
    }
  }

  _CreateAndLogError( (uint64_t)"-[MICapabilitiesManager checkCapabilities:withOptions:error:]",  92LL,  @"MIInstallerErrorDomain",  66LL,  0LL,  0LL,  @"UIRequiredDeviceCapabilties in Info.plist has a key that is not a string",  v25,  v36);
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v37;
  a5 = v38;
  uint64_t v9 = v39;
  if (v38) {
    goto LABEL_45;
  }
LABEL_47:

  return v24;
}

    id v24 = v24;
    v58 = 0;
    *id v56 = v24;
    goto LABEL_75;
  }

  [v23 objectForKeyedSubscript:*MEMORY[0x189615F80]];
  unsigned __int16 v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  BOOL v54 = v53;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    int v55 = (const __CFData *)v54;
  }
  else {
    int v55 = 0LL;
  }

  if (v55)
  {
    uint64_t v59 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x189604DB0], v55);
    if (v59)
    {
      unsigned __int16 v60 = v59;
      __int128 v40 = (void *)SecCertificateCopySubjectSummary(v59);
      unsigned int v27 = (void *)SecCertificateCopyOrganization();
      CFRelease(v60);
      if (v40)
      {
        int v57 = (void *)v96;
        if (v27 && [v27 count])
        {
          if ((unint64_t)[v27 count] >= 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
          {
            v84 = -[MICodeSigningVerifier bundle](self, "bundle");
            v87 = v27;
            MOLogWrite();
          }

          objc_msgSend(v27, "objectAtIndexedSubscript:", 0, v84, v87);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_62;
        }

        v107[0] = @"LegacyErrorString";
        v107[1] = @"LibMISErrorNumber";
        v108[0] = @"ApplicationVerificationFailed";
        v108[1] = &unk_189D64E58;
        [MEMORY[0x189603F68] dictionaryWithObjects:v108 forKeys:v107 count:2];
        id v64 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[MICodeSigningVerifier bundle](self, "bundle");
        _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier performValidationWithError:]",  432LL,  @"MIInstallerErrorDomain",  13LL,  0LL,  v64,  @"Could not extract signer organizations for %@",  v68,  v67);
        uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v109[0] = @"LegacyErrorString";
        v109[1] = @"LibMISErrorNumber";
        v110[0] = @"ApplicationVerificationFailed";
        v110[1] = &unk_189D64E58;
        [MEMORY[0x189603F68] dictionaryWithObjects:v110 forKeys:v109 count:2];
        id v64 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[MICodeSigningVerifier bundle](self, "bundle");
        _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier performValidationWithError:]",  427LL,  @"MIInstallerErrorDomain",  13LL,  0LL,  v64,  @"Could not extract signer identity for %@",  v69,  v67);
        uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
        int v57 = (void *)v96;
      }

      id v24 = (id)v67;
      goto LABEL_71;
    }

    v111[0] = @"LegacyErrorString";
    v111[1] = @"LibMISErrorNumber";
    v112[0] = @"ApplicationVerificationFailed";
    v112[1] = &unk_189D64E58;
    [MEMORY[0x189603F68] dictionaryWithObjects:v112 forKeys:v111 count:2];
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MICodeSigningVerifier bundle](self, "bundle");
    id v64 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier performValidationWithError:]",  419LL,  @"MIInstallerErrorDomain",  13LL,  0LL,  v27,  @"Could not create certificate from data for %@",  v65,  (uint64_t)v64);
LABEL_67:
    uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v40 = 0LL;
    int v57 = (void *)v96;
LABEL_71:

    goto LABEL_72;
  }

  if (!-[MICodeSigningVerifier allowAdhocSigning](self, "allowAdhocSigning"))
  {
    v113[0] = @"LegacyErrorString";
    v113[1] = @"LibMISErrorNumber";
    v114[0] = @"ApplicationVerificationFailed";
    v114[1] = &unk_189D64E58;
    [MEMORY[0x189603F68] dictionaryWithObjects:v114 forKeys:v113 count:2];
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MICodeSigningVerifier bundle](self, "bundle");
    id v64 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier performValidationWithError:]",  413LL,  @"MIInstallerErrorDomain",  13LL,  0LL,  v27,  @"Failed to extract signer identity from %@",  v66,  (uint64_t)v64);
    goto LABEL_67;
  }

  v95 = 0LL;
  __int128 v40 = 0LL;
  int v57 = (void *)v96;
LABEL_62:
  [v23 objectForKeyedSubscript:*MEMORY[0x189615F98]];
  BOOL v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v62 = v61;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    int v63 = v62;
  }
  else {
    int v63 = 0LL;
  }

  id v100 = 0;
  [v23 objectForKeyedSubscript:*MEMORY[0x189615F70]];
  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v72 = v71;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    int v73 = v72;
  }
  else {
    int v73 = 0LL;
  }
  uint64_t v97 = v12;

  uint64_t v91 = v63;
  if (v73)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      -[MICodeSigningVerifier bundle](self, "bundle");
      BOOL v74 = (void *)objc_claimAutoreleasedReturnValue();
      [v74 identifier];
      int v85 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else if ([v57 isRunningInTestMode:&v100 outError:0] && v100)
  {
    if ([v57 testFlagsAreSet:32])
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        -[MICodeSigningVerifier bundle](self, "bundle");
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
        [v78 identifier];
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
      }

      objc_msgSend( MEMORY[0x189603F48],  "dataWithBytes:length:",  "MOBILEINSTALLATION_TEST_LAUNCH_WARNING_DATA",  43,  v84);
      int v73 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v73 = 0LL;
    }
  }

  int v75 = objc_alloc(&OBJC_CLASS___MICodeSigningInfo);
  v76 = -[MICodeSigningInfo initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:]( v75,  "initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:sign erType:profileType:signingInfoSource:launchWarningData:",  v40,  v95,  v93,  v91,  v99,  v45,  v105,  v106,  2LL,  v73);
  signingInfo = self->_signingInfo;
  self->_signingInfo = v76;

  CC_SHA256_CTX v46 = v93;
  v58 = 1;
  uint64_t v12 = v97;
LABEL_75:

  return v58;
}

LABEL_22:
      return v4;
    case 2u:
    case 5u:
      if (v3)
      {
        [v3 entitlements];
        int v5 = (void *)objc_claimAutoreleasedReturnValue();
        id v4 = MIHasContainerRequiredEntitlement(v5);

        goto LABEL_22;
      }

      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        -[MIBundle identifier](self, "identifier");
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
      }

      goto LABEL_21;
    case 3u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
      goto LABEL_22;
    case 4u:
      id v8 = -[MIExecutableBundle _hasNonContainerizingEntitlement:checkSeatbeltProfiles:]( self,  "_hasNonContainerizingEntitlement:checkSeatbeltProfiles:",  v3,  0LL);
      goto LABEL_12;
    case 6u:
      goto LABEL_19;
    default:
      objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A58],  @"Unhandled bundle type %hhu",  -[MIBundle bundleType](self, "bundleType"));
      goto LABEL_21;
  }

uint64_t _ProtectionClassForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x189607508]])
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    if ([v1 isEqualToString:*MEMORY[0x189607510]]) {
      goto LABEL_4;
    }
    if ([v1 isEqualToString:*MEMORY[0x189607518]])
    {
      uint64_t v2 = 3LL;
      goto LABEL_15;
    }

    if ([v1 isEqualToString:*MEMORY[0x189607538]])
    {
      uint64_t v2 = 4LL;
      goto LABEL_15;
    }

    if ([v1 isEqualToString:*MEMORY[0x189607528]])
    {
      uint64_t v2 = 7LL;
      goto LABEL_15;
    }

    if ([v1 isEqualToString:*MEMORY[0x189607540]])
    {
LABEL_4:
      uint64_t v2 = 2LL;
    }

    else if ([v1 isEqualToString:*MEMORY[0x189607520]])
    {
      uint64_t v2 = 3LL;
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

LABEL_59:
              objc_msgSend(v32, "setVerifyTrustCachePresence:", 0, v67);
              goto LABEL_60;
            }

            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              v62 = -[MIBundle bundleURL](self, "bundleURL");
              [v62 path];
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();
            }

            objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
          }

uint64_t _hasNoConflictWithSystemAppBundleIDs(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  int v13 = [a1 containsObject:v9];
  if (v13)
  {
    _CreateAndLogError( (uint64_t)"_hasNoConflictWithSystemAppBundleIDs",  1290LL,  @"MIInstallerErrorDomain",  81LL,  0LL,  &unk_189D64858,  @"Identifier %@ is a %@, so we can't install %@ with that same identifier.",  v12,  (uint64_t)v9);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      id v14 = v14;
      *a5 = v14;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v13 ^ 1u;
}

uint64_t _checkIdentifierForConflict(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a4;
  id v13 = a5;
  id v23 = 0LL;
  +[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]( &OBJC_CLASS___MIContainer,  "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:",  v11,  a2,  a3,  0LL,  0LL,  &v23);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v23;

  if (v14)
  {
    _CreateAndLogError( (uint64_t)"_checkIdentifierForConflict",  1246LL,  @"MIInstallerErrorDomain",  81LL,  0LL,  &unk_189D64880,  @"%@ with identifier %@ is already installed, so we can't install %@ with that same identifier.",  v16,  (uint64_t)v12);
  }

  else
  {
    [v15 domain];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v17 isEqualToString:@"MIContainerManagerErrorDomain"])
    {
      uint64_t v18 = [v15 code];

      if (v18 == 21)
      {

        id v20 = 0LL;
        uint64_t v21 = 1LL;
        goto LABEL_11;
      }
    }

    else
    {
    }

    _CreateAndLogError( (uint64_t)"_checkIdentifierForConflict",  1249LL,  @"MIInstallerErrorDomain",  4LL,  v15,  0LL,  @"Unable to check if %@ with bundle identifier %@ is already installed.",  v19,  (uint64_t)v12);
  }

  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    id v20 = v20;
    uint64_t v21 = 0LL;
    *a6 = v20;
  }

  else
  {
    uint64_t v21 = 0LL;
  }

void sub_183D5C9B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t MIGetBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    [a1 objectForKeyedSubscript:v5];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a3 = [v6 BOOLValue];
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
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

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = a2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((MIGetBooleanEntitlement(v5, *(void **)(*((void *)&v13 + 1) + 8 * v10), a3) & 1) != 0)
        {
          uint64_t v11 = 1LL;
          goto LABEL_11;
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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

uint64_t MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0LL);
}

uint64_t MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.container-required", 1LL);
}

uint64_t MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-container", 0LL);
}

uint64_t MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-sandbox", 0LL);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

uint64_t MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"platform-application", 0LL);
}

uint64_t MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.security.system-container", 0LL);
}

uint64_t MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0LL);
}

uint64_t MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.system-application", 0LL);
}

uint64_t MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.webkit.pushbundle", 0LL);
}

uint64_t MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.marketplace.app-installation", 0LL);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v1];
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return _MICommonCopyGroupEntitlement(a1, @"com.apple.security.application-groups");
}

id _MICommonCopyGroupEntitlement(void *a1, void *a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [a1 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10[0] = v4;
      [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6) {
        goto LABEL_7;
      }
LABEL_15:
      uint64_t v8 = 0LL;
      goto LABEL_16;
    }

    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_14:
      id v6 = 0LL;
      goto LABEL_15;
    }

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1 = a1;
  _MICommonCopyGroupEntitlement(v1, @"com.apple.security.system-groups");
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2 || ![v2 count])
  {
    uint64_t v4 = _MICommonCopyGroupEntitlement(v1, @"com.apple.security.system-group-containers");

    id v3 = (void *)v4;
  }

  return v3;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

uint64_t MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.on-demand-install-capable", 0LL);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
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

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  MIArrayifyThing(v1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"beta-reports-active", 0LL);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
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

uint64_t MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.swift-playgrounds-app", 0LL);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
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

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = MIClassifyAppManagementDomainValue(v1);

  return v2;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
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

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
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

uint64_t MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.driverkit", 0LL);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  if (!v4)
  {
    [v1 objectForKeyedSubscript:@"data-protection-class"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0LL;

    if (!v4)
    {
      [v1 objectForKeyedSubscript:@"DataProtectionClass"];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v8 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        id v4 = v8;
      }
      else {
        id v4 = 0LL;
      }
    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
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
    objc_opt_class();
    id v5 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0LL;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class();
      MIArrayFilteredToContainOnlyClass(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

uint64_t MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.host", 0LL);
}

uint64_t MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.embedded-web-browser-engine", 0LL);
}

uint64_t MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.rendering", 0LL);
}

uint64_t MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.networking", 0LL);
}

uint64_t MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.webcontent", 0LL);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser", 0LL);
}

uint64_t MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.browser.app-installation", 0LL);
}

id MICopyExtensionCacheEntryWithPlatform(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  [(id)sExtensionPointCatalog extensionPointForIdentifier:v5 platform:a2];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 SDKDictionary];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    id v9 = 0LL;
  }

  else
  {
    _CreateAndLogError( (uint64_t)"MICopyExtensionCacheEntryWithPlatform",  46LL,  @"MIInstallerErrorDomain",  142LL,  0LL,  0LL,  @"Extension cache does not have an entry for %@",  v8,  (uint64_t)v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      id v9 = v9;
      *a3 = v9;
    }
  }

  return v7;
}

void _SetUpExtensionCacheOnce()
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000LL;
  uint64_t v0 = (void *)getEXExtensionPointCatalogClass_softClass;
  uint64_t v8 = getEXExtensionPointCatalogClass_softClass;
  if (!getEXExtensionPointCatalogClass_softClass)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __getEXExtensionPointCatalogClass_block_invoke;
    v4[3] = &unk_189D48720;
    v4[4] = &v5;
    __getEXExtensionPointCatalogClass_block_invoke((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  id v3 = (void *)sExtensionPointCatalog;
  sExtensionPointCatalog = (uint64_t)v2;
}

void sub_183D5E07C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id MICopyExtensionCacheEntry(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t active_platform = dyld_get_active_platform();
  MICopyExtensionCacheEntryWithPlatform(v3, active_platform, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

Class __getEXExtensionPointCatalogClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = 0LL;
  if (!ExtensionFoundationLibraryCore_frameworkLibrary)
  {
    __int128 v4 = xmmword_189D490B8;
    uint64_t v5 = 0LL;
    ExtensionFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (!ExtensionFoundationLibraryCore_frameworkLibrary) {
    __getEXExtensionPointCatalogClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("EXExtensionPointCatalog");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    __getEXExtensionPointCatalogClass_block_invoke_cold_2();
  }
  getEXExtensionPointCatalogClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

BOOL MIHasStringValueOfNonZeroLength(void *a1, uint64_t a2, BOOL a3)
{
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    a3 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 length];
  }

  return a3;
}

BOOL MIHasStringValueOfNonZeroLengthIfDefined(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 1LL);
}

BOOL MIHasStringValueOfNonZeroLengthIfDefinedCF(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 1LL);
}

BOOL MIHasRequiredStringValueOfNonZeroLength(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 0LL);
}

BOOL MIHasRequiredStringValueOfNonZeroLengthCF(void *a1, uint64_t a2)
{
  return MIHasStringValueOfNonZeroLength(a1, a2, 0LL);
}

uint64_t MIIsValidRDNSString(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  [a1 componentsSeparatedByString:@"."];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v1 count] >= 2)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "length", (void)v9))
          {
            uint64_t v2 = 0LL;
            goto LABEL_13;
          }

          ++v7;
        }

        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    uint64_t v2 = 1LL;
LABEL_13:
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

LABEL_31:
  return v17;
}

uint64_t MIIsCompatibleWithDeviceFamily(void *a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x189607968];
  id v4 = a1;
  [v3 numberWithInt:a2];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MIIsCompatibleWithAtLeastOneDeviceFamily(v4, v6, 0LL);

  return v7;
}

uint64_t MIIsCompatibleWithAtLeastOneDeviceFamily(void *a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = v5;
    a3 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (a3)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v7);
          }
          __int128 v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v11 = objc_msgSend(v10, "intValue", (void)v15);
            [MEMORY[0x189607968] numberWithInt:v11];
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
            char v13 = [v6 containsObject:v12];

            if ((v13 & 1) != 0)
            {
              a3 = 1LL;
              goto LABEL_13;
            }
          }

          ++v9;
        }

        while (a3 != v9);
        a3 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (a3) {
          continue;
        }
        break;
      }
    }

uint64_t MIIsApplicableToCurrentDeviceFamilyWithError(void *a1, void *a2)
{
  id v3 = a1;
  +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 skipDeviceFamilyCheck];

  if ((v5 & 1) != 0)
  {
    id v6 = 0LL;
    id v7 = 0LL;
    uint64_t v8 = 1LL;
    goto LABEL_16;
  }

  uint64_t v9 = (void *)MGCopyAnswer();
  objc_opt_class();
  id v10 = v9;
  id v6 = 0LL;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v10;
  }

  if (v6)
  {
    objc_opt_class();
    if ((MIArrayContainsOnlyClass(v6) & 1) == 0)
    {
      _CreateAndLogError( (uint64_t)"MIIsApplicableToCurrentDeviceFamilyWithError",  81LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Array of supported device families returned from MobileGestalt was not an array of numbers; got: %@",
        v12,
        (uint64_t)v6);
      goto LABEL_13;
    }

    [MEMORY[0x189604010] setWithArray:v6];
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = 1LL;
    char v14 = MIIsCompatibleWithAtLeastOneDeviceFamily(v3, v13, 1LL);

    if ((v14 & 1) != 0)
    {
      id v7 = 0LL;
      goto LABEL_16;
    }

    uint64_t v20 = (uint64_t)v3;
    __int128 v15 = &unk_189D649C0;
    __int128 v16 = @"This app was not built to support this device family; app is compatible with %@ but this device supports %@";
    uint64_t v17 = 86LL;
  }

  else
  {
    __int128 v15 = &unk_189D64998;
    __int128 v16 = @"Couldn't fetch list of supported device families.";
    uint64_t v17 = 76LL;
  }

  _CreateAndLogError( (uint64_t)"MIIsApplicableToCurrentDeviceFamilyWithError",  v17,  @"MIInstallerErrorDomain",  10LL,  0LL,  v15,  v16,  v11,  v20);
LABEL_13:
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v18;
  if (a2)
  {
    id v7 = v18;
    uint64_t v8 = 0LL;
    *a2 = v7;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

void sub_183D6262C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

uint64_t _ItemIsIgnoredContainerContentForStash(void *a1)
{
  id v1 = a1;
  if (([v1 hasPrefix:@"."] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.mobileinstallation.placeholder"] & 1) != 0)
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.mobileinstallation.stash"];
  }

  return v2;
}

void sub_183D62F4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t _removefile_error_callback(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  int dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    int dst = 2;
  }

  else if (dst != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    strerror(dst);
    MOLogWrite();
  }

  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0LL;
}

uint64_t _CopyfileStatusCallback(uint64_t a1, int a2, uint64_t a3, const char *a4, uint64_t a5, void *a6)
{
  if (a2 == 3)
  {
    id v8 = a6;
    uint64_t v9 = *__error();
    if ([v8 ignoreErrors])
    {
      if ((_DWORD)a1)
      {
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_17;
      }

      strerror(v9);
LABEL_16:
      MOLogWrite();
LABEL_17:
      uint64_t v10 = 1LL;
LABEL_28:

      return v10;
    }

    if ((_DWORD)v9 == 45)
    {
      memset(&v23, 0, sizeof(v23));
      if (lstat(a4, &v23))
      {
        uint64_t v12 = *__error();
        _CreateError( (uint64_t)"_CopyfileStatusCallback",  237LL,  (void *)*MEMORY[0x189607688],  v12,  0LL,  0LL,  @"lstat returned an error when trying to determine type for %s",  v13,  (uint64_t)a4);
LABEL_27:
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setError:v20];

        uint64_t v10 = 2LL;
        goto LABEL_28;
      }

      unsigned int v17 = v23.st_mode & 0xF000;
      if (v17 >= 0x6000)
      {
        if (v17 == 24576)
        {
          goto LABEL_16;
        }

        if (v17 == 49152)
        {
          goto LABEL_16;
        }
      }

      else
      {
        if (v17 == 4096)
        {
          goto LABEL_16;
        }

        if (v17 == 0x2000)
        {
          goto LABEL_16;
        }
      }

      __int128 v18 = (void *)*MEMORY[0x189607688];
      if ((_DWORD)a1)
      {
        uint64_t v22 = a1;
        __int128 v15 = @"copyfile hit ENOTSUP at %d while copying %s to %s; src mode: 0%o";
        uint64_t v16 = 258LL;
      }

      else
      {
        uint64_t v22 = (uint64_t)a4;
        __int128 v15 = @"copyfile hit ENOTSUP in source hierarchy while copying %s to %s; src mode: 0%o";
        uint64_t v16 = 256LL;
      }

      uint64_t v19 = 45LL;
    }

    else
    {
      char v14 = (void *)*MEMORY[0x189607688];
      strerror(v9);
      if ((_DWORD)a1)
      {
        uint64_t v22 = a1;
        __int128 v15 = @"copyfile failed at %d while copying %s to %s: %s (%d)";
        uint64_t v16 = 267LL;
      }

      else
      {
        uint64_t v22 = (uint64_t)a4;
        __int128 v15 = @"copyfile failed in source hierarchy while copying %s to %s: %s (%d)";
        uint64_t v16 = 265LL;
      }

      __int128 v18 = v14;
      uint64_t v19 = v9;
    }

    _CreateError((uint64_t)"_CopyfileStatusCallback", v16, v18, v19, 0LL, 0LL, v15, v11, v22);
    goto LABEL_27;
  }

  return 0LL;
}

void sub_183D64DC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_183D65760( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40, uint64_t a41, uint64_t a42, uint64_t a43, char a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

LABEL_47:
    uint64_t v19 = 420LL;
    goto LABEL_48;
  }

  if (v18 == 5)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
    uint64_t v43 = readlink(*(const char **)(a2 + 16), v99, 0x400uLL);
    if (v43 != -1)
    {
      v99[v43] = 0;
      if (symlink(v99, *(const char **)(a1 + 80)))
      {
        uint64_t v44 = *__error();
        __int128 v45 = (void *)*MEMORY[0x189607688];
        CC_SHA256_CTX v46 = v44;
        id v47 = *(void *)(a1 + 80);
        strerror(v44);
        _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionC lass:hasSymlink:error:]_block_invoke",  1032LL,  v45,  v46,  0LL,  0LL,  @"symlink failed for %s -> %s: %s",  v48,  v47);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionC lass:hasSymlink:error:]_block_invoke",  1032LL,  @"MIInstallerErrorDomain",  4LL,  v25,  &unk_189D64B28,  @"Failed to symlink %s -> %s",  v49,  *(void *)(a1 + 80));
        goto LABEL_35;
      }

      goto LABEL_47;
    }

    id v56 = *__error();
    int v57 = (void *)*MEMORY[0x189607688];
    v58 = v56;
    uint64_t v59 = *(void *)(a2 + 16);
    strerror(v56);
    _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass :hasSymlink:error:]_block_invoke",  1022LL,  v57,  v58,  0LL,  0LL,  @"readlink failed for %s: %s",  v60,  v59);
    BOOL v61 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass :hasSymlink:error:]_block_invoke",  1022LL,  @"MIInstallerErrorDomain",  4LL,  v61,  &unk_189D64B00,  @"Failed to readlink %s",  v62,  *(void *)(a2 + 16));
    int v75 = LABEL_43:;
    v76 = *(void *)(*(void *)(a1 + 56) + 8LL);
    v77 = *(void **)(v76 + 40);
    *(void *)(v76 + 40) = v75;

    goto LABEL_44;
  }

  if (v18 != 2)
  {
    _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass :hasSymlink:error:]_block_invoke",  1038LL,  @"MIInstallerErrorDomain",  3LL,  0LL,  &unk_189D64B50,  @"Unknown filesystem object type %u encountered at %s",  a8,  *(unsigned int *)(a2 + 56));
    unsigned __int16 v53 = LABEL_37:;
    BOOL v54 = *(void *)(*(void *)(a1 + 56) + 8LL);
    int v55 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v53;

    goto LABEL_44;
  }

  uint64_t v19 = 493LL;
  if (mkdir(*(const char **)(a1 + 80), 0x1EDu))
  {
    uint64_t v20 = *__error();
    uint64_t v21 = (void *)*MEMORY[0x189607688];
    uint64_t v22 = v20;
    stat v23 = *(void *)(a1 + 80);
    strerror(v20);
    _CreateError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass :hasSymlink:error:]_block_invoke",  951LL,  v21,  v22,  0LL,  0LL,  @"mkdir failed for %s: %s",  v24,  v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass :hasSymlink:error:]_block_invoke",  951LL,  @"MIInstallerErrorDomain",  4LL,  v25,  &unk_189D64A38,  @"Failed to mkdir %s",  v26,  *(void *)(a1 + 80));
    uint64_t v50 = LABEL_35:;
    uint64_t v51 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v52 = *(void **)(v51 + 40);
    *(void *)(v51 + 40) = v50;

LABEL_44:
    uint64_t v78 = 0LL;
LABEL_45:
    uint64_t v79 = 0LL;
    goto LABEL_46;
  }

void sub_183D66234( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_183D664B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183D66A74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id _dataForEAKey(char *name, int fd, void *a3)
{
  unint64_t v6 = fgetxattr(fd, name, 0LL, 0LL, 0, 32);
  if ((v6 & 0x8000000000000000LL) != 0)
  {
    int v11 = *__error();
    uint64_t v12 = (void *)*MEMORY[0x189607688];
    uint64_t v13 = v11;
    strerror(v11);
    _CreateError( (uint64_t)"_dataForEAKey",  1549LL,  v12,  v13,  0LL,  0LL,  @"Could not get data length for extended attribute key %s: %s",  v14,  (uint64_t)name);
LABEL_8:
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 0LL;
    goto LABEL_9;
  }

  size_t v8 = v6;
  if (!v6)
  {
    uint64_t v30 = name;
    uint64_t v9 = @"Data for extended attribute key %s was empty";
    uint64_t v10 = 1552LL;
    goto LABEL_7;
  }

  if (v6 > 0x1000)
  {
    uint64_t v30 = name;
    uint64_t v9 = @"Data length is more than 4 KB for extended attribute key %s: length is %zd bytes";
    uint64_t v10 = 1555LL;
LABEL_7:
    _CreateError((uint64_t)"_dataForEAKey", v10, @"MIInstallerErrorDomain", 4LL, 0LL, 0LL, v9, v7, (uint64_t)v30);
    goto LABEL_8;
  }

  uint64_t v19 = malloc(v6);
  if (!v19)
  {
    int v22 = *__error();
    stat v23 = (void *)*MEMORY[0x189607688];
    uint64_t v24 = v22;
    strerror(v22);
    _CreateError( (uint64_t)"_dataForEAKey",  1561LL,  v23,  v24,  0LL,  0LL,  @"Failed to malloc %zd bytes for extended attribute key %s: %s",  v25,  v8);
    goto LABEL_8;
  }

  uint64_t v16 = v19;
  ssize_t v20 = fgetxattr(fd, name, v19, v8, 0, 32);
  if (v20 < 0)
  {
    int v26 = *__error();
    unsigned int v27 = (void *)*MEMORY[0x189607688];
    uint64_t v28 = v26;
    strerror(v26);
    _CreateError( (uint64_t)"_dataForEAKey",  1567LL,  v27,  v28,  0LL,  0LL,  @"Failed to malloc %zd bytes for extended attribute key %s: %s",  v29,  v8);
  }

  else
  {
    if (v20)
    {
      [MEMORY[0x189603F48] dataWithBytesNoCopy:v16 length:v20 freeWhenDone:1];
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = 0LL;
      if (v17) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }

    _CreateError( (uint64_t)"_dataForEAKey",  1570LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Data for key %s returned length 0, expected length %zd",  v21,  (uint64_t)name);
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  free(v16);
  if (a3)
  {
    id v15 = v15;
    unsigned int v17 = 0LL;
    *a3 = v15;
  }

  else
  {
    unsigned int v17 = 0LL;
  }

LABEL_12:
  return v17;
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  bzero(v26, 0x400uLL);
  id v20 = v3;
  realpath_DARWIN_EXTSN((const char *)[v20 fileSystemRepresentation], v26);
  [NSString stringWithFileSystemRepresentation:v26];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 pathComponents];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  [v4 pathComponents];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0LL;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      uint64_t v12 = v4;
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v10 + i < (unint64_t)[v6 count])
        {
          [v6 objectAtIndexedSubscript:v10 + i];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          char v16 = [v14 isEqualToString:v15];

          if ((v16 & 1) != 0) {
            continue;
          }
        }

        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          uint64_t v17 = 0LL;
          id v4 = v12;
        }

        else
        {
          [v20 fileSystemRepresentation];
          id v4 = v12;
          [v12 path];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

          uint64_t v17 = 0LL;
        }

        goto LABEL_16;
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v10 += i;
      uint64_t v17 = 1LL;
      id v4 = v12;
      if (v9) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v17 = 1LL;
  }

void sub_183D6ACBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_34:
  id v47 = 0;
LABEL_39:

  return v47;
}

LABEL_66:
  return IsMalformedBundleError;
}

id _AllPersonasAssociatedWithIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  +[MIUserManagement sharedInstance](&OBJC_CLASS___MIUserManagement, "sharedInstance");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v4 personaForBundleID:v3 error:&v15];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v15;

  if (!v5)
  {
    uint64_t v11 = 0LL;
    goto LABEL_7;
  }

  if (!+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled"))
  {
    uint64_t v11 = (void *)objc_opt_new();
    goto LABEL_11;
  }

  Class Class = objc_getClass("MIAppReferenceManager");
  if (!Class)
  {
    uint64_t v11 = 0LL;
LABEL_11:
    [v11 addObject:v5];
    if (!a2) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  -[objc_class defaultManager](Class, "defaultManager");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v6;
  [v8 personaUniqueStringsForAppWithBundleID:v3 error:&v14];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v14;

  uint64_t v11 = (void *)[v9 mutableCopy];
  id v6 = v10;
  if (v11) {
    goto LABEL_11;
  }
LABEL_7:
  if (!a2) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v11) {
    *a2 = v6;
  }
LABEL_14:
  uint64_t v12 = (void *)[v11 copy];

  return v12;
}

LABEL_42:
    __int128 v40 = 0LL;
    goto LABEL_43;
  }

  objc_msgSend(MEMORY[0x189604010], "setWithObject:");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  uint64_t v44 = v15;
  __int128 v45 = v10;
  BOOL v54 = 0u;
  int v55 = 0u;
  uint64_t v52 = 0u;
  unsigned __int16 v53 = 0u;
  __int128 v23 = v20;
  int v26 = [v23 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v53;
    __int128 v24 = v19;
    uint64_t v43 = a6;
    while (2)
    {
      uint64_t v29 = 0LL;
      uint64_t v30 = v24;
      do
      {
        if (*(void *)v53 != v28) {
          objc_enumerationMutation(v23);
        }
        int64_t v31 = *(void *)(*((void *)&v52 + 1) + 8 * v29);
        v32 = (void *)objc_opt_class();
        uint64_t v51 = v30;
        [v32 _createDataContainerAndSetDataProtectionForBundle:v9 forPersona:v31 error:&v51];
        off_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v24 = v51;

        if (!v33)
        {

          uint64_t v19 = v23;
          id v15 = v44;
          id v10 = v45;
          a6 = v43;
          char v16 = v46;
          goto LABEL_21;
        }

        [v12 addObject:v33];

        ++v29;
        uint64_t v30 = v24;
      }

      while (v27 != v29);
      uint64_t v27 = [v23 countByEnumeratingWithState:&v52 objects:v58 count:16];
      a6 = v43;
      if (v27) {
        continue;
      }
      break;
    }
  }

  else
  {
    __int128 v24 = v19;
  }

  id v10 = v45;
  if (v46)
  {
    [v9 identifier];
    ssize_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    ssize_t v35 = [v47 containsObject:v34];

    if (v35)
    {
      [v9 dataContainerCreatingIfNeeded:0 forPersona:v46 makeLive:1 created:0 error:0];
      id v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36) {
        [v12 addObject:v36];
      }
    }
  }

  __int128 v21 = a6;

  uint64_t v11 = v48;
LABEL_30:

  __int128 v22 = v24;
LABEL_31:
  id v37 = objc_alloc(&OBJC_CLASS___MIInstalledInfoGatherer);
  __int128 v38 = (void *)[v12 copy];
  if (v10) {
    __int128 v39 = -[MIInstalledInfoGatherer initWithBundleContainer:dataContainers:]( v37,  "initWithBundleContainer:dataContainers:",  v10,  v38);
  }
  else {
    __int128 v39 = -[MIInstalledInfoGatherer initWithBundle:dataContainers:](v37, "initWithBundle:dataContainers:", v9, v38);
  }
  __int128 v23 = (id)v39;

  stat v49 = v22;
  [v23 bundleRecordWithError:&v49];
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v24 = v49;

  if (!v40)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      a6 = v21;
      if (v21) {
        goto LABEL_40;
      }
      goto LABEL_42;
    }

    [v9 identifier];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    a6 = v21;
    goto LABEL_38;
  }

void __MILogHandleForSignpost_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.installd", "Signpost");
  id v1 = (void *)MILogHandleForSignpost_logHandle_0;
  MILogHandleForSignpost_logHandle_0 = (uint64_t)v0;
}

uint64_t MIMachOFileMatchesMyArchitecture(const char *a1, void *a2)
{
  char v15 = 0;
  int v14 = 0;
  if (parse_macho_is_file_runnable_for_apps(a1, &v15, &v14) && v15)
  {
    id v5 = 0LL;
    uint64_t v6 = 1LL;
    goto LABEL_19;
  }

  if (v14)
  {
    _CreateAndLogError( (uint64_t)"MIMachOFileMatchesMyArchitecture",  58LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to determine if file matches arch for input file: %s because libparsemacho returned error code: %u",  v4,  (uint64_t)a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0LL;
    if (!a2) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }

  char v13 = 0;
  +[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  int v8 = [v7 isRunningInTestMode:&v13 outError:&v12];
  id v5 = v12;
  if (v8)
  {
    if (v13 && [v7 testFlagsAreSet:128])
    {
      uint64_t v6 = 1LL;
    }

    else
    {
      uint64_t v10 = _CreateAndLogError( (uint64_t)"MIMachOFileMatchesMyArchitecture",  56LL,  @"MIInstallerErrorDomain",  15LL,  0LL,  &unk_189D64CE0,  @"Failed to find matching arch for input file: %s",  v9,  (uint64_t)a1);

      uint64_t v6 = 0LL;
      id v5 = (id)v10;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  if (a2)
  {
LABEL_17:
    if ((v6 & 1) == 0)
    {
      id v5 = v5;
      uint64_t v6 = 0LL;
      *a2 = v5;
    }
  }

__CFString *MIMachOStringForPlatform(uint64_t a1)
{
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t MIMachOFileIterateImageVersions(const char *a1, void *a2, void *a3)
{
  id v5 = a3;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __MIMachOFileIterateImageVersions_block_invoke;
  v15[3] = &unk_189D49368;
  id v16 = v5;
  id v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x186E27154](v15);
  *__error() = 0;
  uint64_t v8 = parse_macho_iterate_slices(a1, (uint64_t)v7);
  if ((v8 & 1) != 0)
  {
    id v9 = 0LL;
  }

  else
  {
    uint64_t v10 = __error();
    _CreateError( (uint64_t)"MIMachOFileIterateImageVersions",  124LL,  (void *)*MEMORY[0x189607688],  *v10,  0LL,  0LL,  @"parse_macho_iterate_slices failed for %s",  v11,  (uint64_t)a1);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"MIMachOFileIterateImageVersions",  124LL,  @"MIInstallerErrorDomain",  73LL,  v12,  0LL,  @"Failed to iterate on macho slices for input file: %s",  v13,  (uint64_t)a1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a2)
    {
      id v9 = v9;
      *a2 = v9;
    }
  }

  return v8;
}

uint64_t __MIMachOFileIterateImageVersions_block_invoke(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  char v7 = 0;
  id v3 = *(id *)(a1 + 32);
  dyld_get_image_versions();
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_183D710B8(_Unwind_Exception *a1)
{
}

uint64_t __MIMachOFileIterateImageVersions_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id MIMachOFileImageSlices(const char *a1, void *a2)
{
  uint64_t v4 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __MIMachOFileImageSlices_block_invoke;
  v12[3] = &unk_189D49390;
  id v5 = v4;
  id v13 = v5;
  uint64_t v6 = (void *)MEMORY[0x186E27154](v12);
  id v11 = 0LL;
  int v7 = MIMachOFileIterateImageVersions(a1, &v11, v6);
  id v8 = v11;
  id v9 = 0LL;
  if (v7) {
    id v9 = (void *)[v5 copy];
  }
  if (a2 && !v9) {
    *a2 = v8;
  }

  return v9;
}

uint64_t __MIMachOFileImageSlices_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void **)(a1 + 32);
  int v7 = -[MIMachOImageSlice initWithCPUType:cpuSubtype:platform:sdkVersion:minOSVersion:]( objc_alloc(&OBJC_CLASS___MIMachOImageSlice),  "initWithCPUType:cpuSubtype:platform:sdkVersion:minOSVersion:",  a2,  a3,  a4,  a5,  a6);
  [v6 addObject:v7];

  return 1LL;
}

uint64_t MIMachOSimPlatformForPlatform(uint64_t a1)
{
  int v2 = a1 - 2;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
    MIMachOSimPlatformForPlatform_cold_1(a1);
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MIMachOStringForPlatform(a1);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  return 0LL;
}

uint64_t MIMachOActiveIOSPlatform()
{
  return 2LL;
}

BOOL MIDistributorTypeIsFirstPartyApple(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

BOOL MIDistributorTypeIsThirdParty(uint64_t a1)
{
  return a1 == -1;
}

LABEL_300:
  objc_msgSend(v4, "objectForKeyedSubscript:", gameCenterEnabled, v102);
  int v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGameCenterEnabled:](v5, "setGameCenterEnabled:", [v75 BOOLValue]);
  }

  else if (v75 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = gameCenterEnabled;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:gameCenterEverEnabled];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setGameCenterEverEnabled:](v5, "setGameCenterEverEnabled:", [v76 BOOLValue]);
  }

  else if (v76 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = gameCenterEverEnabled;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:isAutoDownload];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIsAutoDownload:](v5, "setIsAutoDownload:", [v77 BOOLValue]);
  }

  else if (v77 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = isAutoDownload;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:referrerURL];
  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setReferrerURL:](v5, "setReferrerURL:", v78);
  }

  else if (v78 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = referrerURL;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:referrerApp];
  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setReferrerApp:](v5, "setReferrerApp:", v79);
  }

  else if (v79 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = referrerApp;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:sideLoadedDeviceBasedVPP];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setSideLoadedDeviceBasedVPP:](v5, "setSideLoadedDeviceBasedVPP:", [v80 BOOLValue]);
  }

  else if (v80 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = sideLoadedDeviceBasedVPP;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:deviceBasedVPP];
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setDeviceBasedVPP:](v5, "setDeviceBasedVPP:", [v81 BOOLValue]);
  }

  else if (v81 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = deviceBasedVPP;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:isB2BCustomApp];
  id v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setIsB2BCustomApp:](v5, "setIsB2BCustomApp:", [v82 BOOLValue]);
  }

  else if (v82 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = isB2BCustomApp;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:enterpriseInstallURL];
  id v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setEnterpriseInstallURL:](v5, "setEnterpriseInstallURL:", v83);
  }

  else if (v83 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = enterpriseInstallURL;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:redownloadParams];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setRedownloadParams:](v5, "setRedownloadParams:", v84);
  }

  else if (v84 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = redownloadParams;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:factoryInstall];
  int v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setFactoryInstall:](v5, "setFactoryInstall:", [v85 BOOLValue]);
  }

  else if (v85 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = factoryInstall;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:md5];
  int v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setMd5:](v5, "setMd5:", v86);
  }

  else if (v86 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = md5;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:protectedMetadata];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setProtectedMetadata:](v5, "setProtectedMetadata:", v87);
  }

  else if (v87 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = protectedMetadata;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:hasOrEverHasHadIAP];
  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setHasOrEverHasHadIAP:](v5, "setHasOrEverHasHadIAP:", v88);
  }

  else if (v88 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v103 = hasOrEverHasHadIAP;
    MOLogWrite();
  }

  [v4 objectForKeyedSubscript:nameTranscriptions];
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v90 = v89;
  if (v89)
  {
    if (_IsDictionaryWithKeyStringAndValueArrayOfString(v89))
    {
      -[MIStoreMetadata setNameTranscriptions:](v5, "setNameTranscriptions:", v90);
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", ::distributorInfo, v103);
  uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v92 = v91;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    int v93 = v92;
  }
  else {
    int v93 = 0LL;
  }

  if (v93)
  {
    uint64_t v94 = -[MIStoreMetadataDistributor initWithDictionary:]( objc_alloc(&OBJC_CLASS___MIStoreMetadataDistributor),  "initWithDictionary:",  v92);
    distributorInfo = v5->_distributorInfo;
    v5->_distributorInfo = v94;
  }

  else if (v92 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    uint64_t v104 = v92;
    MOLogWrite();
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", managementDeclarationIdentifier, v104);
  int v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIStoreMetadata setManagementDeclarationIdentifier:](v5, "setManagementDeclarationIdentifier:", v96);
  }

  else if (v96 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MOLogWrite();
  }

LABEL_406:
  uint64_t v97 = v5;

  return v97;
}

BOOL _IsDictionaryWithKeyStringAndValueArrayOfString(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 1;
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  if (v3)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    void v6[2] = ___IsDictionaryWithKeyStringAndValueArrayOfString_block_invoke;
    v6[3] = &unk_189D49418;
    v6[4] = &v7;
    [v2 enumerateKeysAndObjectsUsingBlock:v6];
    BOOL v4 = *((_BYTE *)v8 + 24) != 0;
  }

  else
  {
    BOOL v4 = 0LL;
    *((_BYTE *)v8 + 24) = 0;
  }

  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_183D754D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_183D798F4(void *result)
{
  *uint64_t result = ++qword_18C66B588;
  return result;
}

uint64_t sub_183D79910( mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, void *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  int v30 = 1;
  uint64_t v31 = a4;
  int v32 = 16777472;
  int v33 = a5;
  uint64_t v34 = *MEMORY[0x1895F8468];
  int v17 = *a3;
  int v35 = a2;
  int v36 = v17;
  int v37 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v20 = 4294966988LL;
      }

      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v20 = 4294966996LL;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            int v21 = v33;
            if (v33 == v47)
            {
              uint64_t v20 = 0LL;
              int v22 = v34;
              *a3 = v38;
              __int128 v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              __int128 v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              __int128 v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              __int128 v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              int v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v20 = 4294966996LL;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port) {
              uint64_t v20 = 4294966996LL;
            }
            else {
              uint64_t v20 = HIDWORD(v31);
            }
          }
        }

        else
        {
          uint64_t v20 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v20 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v20;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v20;
}

uint64_t sub_183D79B68(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  __int128 v4 = a3[5];
  __int128 v19 = a3[4];
  __int128 v20 = v4;
  __int128 v5 = a3[7];
  __int128 v21 = a3[6];
  __int128 v22 = v5;
  __int128 v6 = a3[1];
  __int128 v15 = *a3;
  __int128 v16 = v6;
  __int128 v7 = a3[3];
  __int128 v17 = a3[2];
  uint64_t v13 = *MEMORY[0x1895F8468];
  unsigned int v14 = a2;
  __int128 v18 = v7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }

  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v10 = 4294966988LL;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }

  if (msg.msgh_id != 1301)
  {
    uint64_t v10 = 4294966995LL;
    goto LABEL_17;
  }

  uint64_t v10 = 4294966996LL;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v10 = v14;
  if (v14) {
    goto LABEL_17;
  }
  return v10;
}

uint64_t sub_183D79CF4( mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, void *a9, _DWORD *a10)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  int v18 = 1;
  uint64_t v19 = a6;
  int v20 = 16777472;
  int v21 = a7;
  uint64_t v22 = *MEMORY[0x1895F8468];
  *(_DWORD *)uint64_t v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  int v24 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            int v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              uint64_t v14 = 0LL;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&msg);
      return v14;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v14;
}

uint64_t sub_183D79EE0(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v12 = 4294966988LL;
    }

    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v12 = v18;
            if (!v18)
            {
              int v15 = v20;
              *a2 = v19;
              *a3 = v15;
              int v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }

            goto LABEL_23;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v18 == 0;
          }
          if (v13) {
            uint64_t v12 = 4294966996LL;
          }
          else {
            uint64_t v12 = v18;
          }
          goto LABEL_23;
        }
      }

      uint64_t v12 = 4294966996LL;
    }

    else
    {
      uint64_t v12 = 4294966995LL;
    }

uint64_t sub_183D7A058(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x67843F9A1244BAC7LL) - 1904020556;
  int v3 = *(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL) - 1904020556;
  int v4 = (v2 < 1999872368) ^ (v3 < 1999872368);
  BOOL v5 = v2 > v3;
  if (v4) {
    BOOL v5 = v2 < 1999872368;
  }
  int v1 = *(_DWORD *)a1 ^ (1374699841 * ((((2 * a1) | 0x4FD35BAC) - a1 + 1477857834) ^ 0xCA1DB5DF));
}

uint64_t sub_183D7A128(uint64_t a1)
{
  int v5 = v2 + 1847758434;
  BOOL v6 = v5 < 1456684062;
  BOOL v7 = v4 + 1847758434 < v5;
  if (v6 != v4 + 1847758434 < ((v3 - 1597) | 0x48) + 1456683830) {
    BOOL v7 = v6;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1
                                                               + 8LL
                                                               * ((2046 * (((v3 - 122) ^ v7) & 1)) ^ (v3 - 890)))
                                                   - 12LL))( a1,  603127195LL);
}

uint64_t sub_183D7A1A4@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v5 = 289 * (v3 ^ 0xEB);
  int v6 = v5 - v4 - 782149611;
  if (v4 + 391074372 < 0) {
    int v6 = v4;
  }
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v2 + 8LL * ((11 * (v6 - 1756409277 >= 0)) ^ v5)) - 12LL))( a1,  (a2 + 1));
}

uint64_t sub_183D7A244(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1
                                                               + 8LL
                                                               * ((((*(_DWORD *)(*v5 + 4LL * v7) ^ v2 ^ (v4 + 1720737139) & 0x996F9FFB) <= (*(_DWORD *)(*v6 + 4LL * v7) ^ (v2 + 178)))
                                                                 * (((v4 + 813) | 0x4D) ^ 0x139)) ^ v4))
                                                   - 12LL))( a1,  v3);
}

uint64_t sub_183D7A2B4(uint64_t a1, uint64_t a2, unsigned int a3)
{
}

uint64_t sub_183D7A2F8@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v2 + 8LL * ((11 * (v4 - 1756409277 >= 0)) ^ v3)) - 12LL))( a1,  (a2 + 1));
}

uint64_t sub_183D7A33C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2 - v2 + 1206253525;
  return result;
}

void sub_183D7A354(_DWORD *a1)
{
  unsigned int v1 = *a1 + 628203409 * ((-2 - ((~(_DWORD)a1 | 0x96C77CC6) + (a1 | 0x69388339))) ^ 0x144F70F5);
  __asm { BR              X9 }

uint64_t sub_183D7A438()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * (int)((((((v0 + 1627100427) & 0x9F046FCF) + 82) ^ 0x5EF) * (v1 == 0)) ^ v0)))();
}

uint64_t sub_183D7A48C@<X0>(uint64_t (*a1)(uint64_t *)@<X8>)
{
  unsigned int v5 = ((((2 * &v7) | 0x2769EF96) - &v7 + 1816856629) ^ 0x732895E0) * v1;
  uint64_t v9 = v4;
  uint64_t v7 = 0xC6562B2033A24D7LL;
  unsigned int v10 = 1449743216 - v5;
  int v11 = v2 - v5 - 1281;
  int v8 = v5 ^ 0x74A777DC;
  uint64_t result = a1(&v7);
  *(_DWORD *)(v3 + 4) = *(_DWORD *)(v4 - 0x749AC022234F2832LL);
  return result;
}

uint64_t sub_183D7ACD4(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580
                                                  + (int)(*(_DWORD *)a1 - 1225351577 * (a1 ^ 0x7EFF9A32) - 1040))
                                        + 8
                                        * (int)((313 * (*(void *)(a1 + 8) != 0x749AC022234F284ALL)) ^ (*(_DWORD *)a1 - 1225351577 * (a1 ^ 0x7EFF9A32)))
                                        - 12)
                            - 4LL))();
}

uint64_t sub_183D7AD44()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL * ((437 * (*(_DWORD *)(v1 - 0x749AC022234F2832LL) == -1224190382)) ^ v2))
                            - (v2 ^ 0x64u)
                            + 1034LL))();
}

uint64_t sub_183D7AD90()
{
  unsigned int v4 = *(_DWORD *)(v1 - 0x749AC022234F283ALL) + 130183690;
  unsigned int v5 = *(_DWORD *)(v1 - 0x749AC022234F283ELL) + ((v3 + 92) ^ 0xB40E7A50);
  BOOL v6 = v5 < 0x1456CDCD;
  BOOL v7 = v4 < v5;
  if (v4 < 0x1456CDCD != v6) {
    BOOL v7 = v6;
  }
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (((((v3 ^ v7) & 1) == 0) * v2) ^ v3)) - 4LL))();
}

uint64_t sub_183D7AE2C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  _DWORD *v2 = a2;
  *(_DWORD *)(result + 4) = 1224150375;
  return result;
}

void sub_183D7AE40(uint64_t a1)
{
  int v1 = 535753261 * (((a1 | 0x8E29127E) - a1 + (a1 & 0x71D6ED81)) ^ 0x84DD1C51);
  int v2 = *(_DWORD *)(a1 + 12) - v1;
  __asm { BR              X16 }

uint64_t sub_183D7AF04@<X0>(uint64_t a1@<X8>)
{
  unsigned int v7 = (((~v9 & 0x74D3750E) - (~v9 | 0x74D3750F)) ^ 0x7E277B20) * v3;
  uint64_t v10 = v2;
  v9[0] = v4 - v7 - 206;
  v9[1] = v7 - v1 - ((-2079587584 - v5) & 0xB71ACD88) + (v4 ^ v6) + 496199335;
  return ((uint64_t (*)(_DWORD *))(*(void *)(a1 + 8LL * (v4 - 536)) - 8LL))(v9);
}

uint64_t sub_183D7B048(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (108757529 * (((a1 | 0x6BA2B686) - (a1 & 0x6BA2B686)) ^ 0x8B3ED4AD));
  return (*(uint64_t (**)(void))((char *)*(&off_189D4D580 + (v1 ^ 0x116))
                              + 8
                              * ((28 * ((((3 * (v1 ^ 0xEA)) ^ (*(void *)a1 == *(void *)(a1 + 8))) & 1) == 0)) ^ v1)
                              - 12))();
}

uint64_t sub_183D7B0D4@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(v2 - 0x67843F9A1244BAC7LL);
  int v5 = v4 - 1756409276;
  if (v4 - 1756409276 < 0) {
    int v5 = 1756409276 - v4;
  }
  *(_DWORD *)(v1 - 0x67843F9A1244BAC7LL) = v4;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((443
                                          * ((v5 ^ 0x6E7BFDFD) - 1073972304 + ((2 * v5) & 0xDCF7FBFA) == ((v3 - 1198) | 0x108) + 779647073)) ^ v3))
                            - ((v3 - 950503971) & 0x38A7877F ^ 0x247LL)))();
}

uint64_t sub_183D7B188@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 - 0x67843F9A1244BAC3LL) + 4LL * (v5 - 779647406)) = *(_DWORD *)(*(void *)(v2 - 0x67843F9A1244BAC3LL)
                                                                                           + 4LL * (v5 - 779647406));
  return (*(uint64_t (**)(void))(a1 + 8LL * ((771 * (v5 - 1 != v3 + 332)) ^ (v4 + 553308080) & 0x5F052F4Cu)))();
}

uint64_t sub_183D7B1FC@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*v1 + 4LL * (v7 + v5)) = *(_DWORD *)(*v2 + 4LL * (v7 + v5));
  return (*(uint64_t (**)(void))(a1 + 8LL * (((v7 - 1 != v3) * v6) ^ v4)))();
}

uint64_t sub_183D7B234(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x67843F9A1244BAC7LL);
  int v4 = v2 - 1756409276;
  BOOL v3 = v2 - 1756409276 < 0;
  int v5 = 1756409276 - v2;
  if (!v3) {
    int v5 = v4;
  }
  int v1 = (*(_DWORD *)(a1 + 4) - 460628867 * ((a1 & 0x873FB66C | ~(a1 | 0x873FB66C)) ^ 0x3456CBEE) + 164) | 0x80;
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + (v1 ^ 0x4EF))
                                        + 8
                                        * (((v1
                                           + (v5 ^ 0x7EDFFFFF)
                                           + ((v5 << (v1 + 76)) & 0xFDBFFFFE)
                                           - 177209602
                                           - 1951400883 < 0x7FFFFFFF)
                                          * ((v1 ^ 0x724) - 786)) ^ v1)
                                        - 12)
                            - 4LL))();
}

uint64_t sub_183D7B354@<X0>(int a1@<W2>, int a2@<W3>, unsigned int a3@<W4>, int a4@<W8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
}

void sub_183D7B38C()
{
}

_DWORD *sub_183D7B398(_DWORD *result)
{
  *uint64_t result = 845240498;
  return result;
}

uint64_t sub_183D7B3A8@<X0>(int a1@<W3>, int a2@<W4>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((((a2 ^ (a3 + 426) ^ (a1 - 275)) >= 0) * (((a1 + 244) | 0x30) ^ 0x461)) ^ (a1 - 275)))
                            - 4LL))();
}

uint64_t sub_183D7B3F8()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((((v2 >> v3) & 1) == 0) * v4) ^ v0)) - 4LL))();
}

_DWORD *sub_183D7B420@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *uint64_t result = ((a2 - 500542720) & 0x1DD5ABDB ^ 0xA8617B62) + v2;
  return result;
}

void sub_183D7B450(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  unsigned int v3 = 628203409 * (((v5 | 0x75E43ED) + (~v5 | 0xF8A1BC12)) ^ 0x85D64FDF);
  int v6 = &STACK[0x14F8B44E17D229AA];
  v5[0] = v3 + 1172345435;
  void v5[2] = v3 + 1252841699;
  sub_183DA2A04((uint64_t)v5);
  __asm { BR              X9 }

uint64_t sub_183D7B5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v12 = v9 + 1078100674;
  if (v12 <= 0x40) {
    unsigned int v12 = 64;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 8LL * ((1728 * (v11 - v7 - v8 + v12 > 0xE)) ^ 0xFCu))
                                                                                                - 4LL))( 1728LL,  a2,  4235699149LL,  a4,  a5,  a6,  a7);
}

uint64_t sub_183D7B664()
{
  int v7 = v2 + v1;
  int v8 = v7 + v0;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((511 * (v6 - v7 >= (v4 + v8))) ^ 0xFCu)) - 4LL))();
}

uint64_t sub_183D7B69C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return ((uint64_t (*)(void))(*(void *)(v15
                                        + 8LL
                                        * ((569
}

uint64_t sub_183D7B6D4@<X0>(int a1@<W8>)
{
  v6.i64[0] = 0x7E7E7E7E7E7E7E7ELL;
  v6.i64[1] = 0x7E7E7E7E7E7E7E7ELL;
  v7.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v7.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
  *(int8x16_t *)(v2 + (v1 + a1 + 6)) = vaddq_s8(vsubq_s8(*v5, vandq_s8(vaddq_s8(*v5, *v5), v6)), v7);
  return ((uint64_t (*)(int8x16_t *))(*(void *)(v4
                                                          + 8LL * ((845 * (((v3 + 1) & 0x1FFFFFFF0LL) == 16)) ^ 0x57Bu))
                                              - 12LL))(&v5[1]);
}

void sub_183D7B750()
{
}

uint64_t sub_183D7B75C@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((a1 ^ 0x349 ^ ((a1 - 244) | 2) ^ 0xC0) * (v1 == v2)) ^ a1)) - 4LL))();
}

uint64_t sub_183D7B794( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, int32x4_t a29, int32x4_t a30, int32x4_t a31, int32x4_t a32)
{
  __int128 v40 = (uint64_t (*)(__n128, __n128, __n128, __n128))(*(void *)(v34 + 8LL * v32) - 4LL);
  HIDWORD(v107) = HIDWORD(a12) - 165199026;
  LODWORD(v107) = 639817520;
  __int128 v41 = (const char *)(v39 - 220);
  __n128 v42 = (__n128)vdupq_n_s32(0x37085657u);
  v43.n128_u64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v43.n128_u64[1] = 0x3F3F3F3F3F3F3F3FLL;
  __n128 v44 = (__n128)vdupq_n_s32(0xB7085652);
  a21 = v38 - 16;
  v45.n128_u64[0] = 0x7E7E7E7E7E7E7E7ELL;
  v45.n128_u64[1] = 0x7E7E7E7E7E7E7E7ELL;
  unsigned int v47 = *(_DWORD *)(v39 - 148);
  unsigned int v46 = *(_DWORD *)(v39 - 144);
  unsigned int v49 = *(_DWORD *)(v39 - 140);
  unsigned int v48 = *(_DWORD *)(v39 - 136);
  unsigned int v50 = v48;
  int v51 = *(_BYTE *)(v39 - 124) ^ 0x2B;
  HIDWORD(a16) = *(unsigned __int8 *)(v39 - 124) ^ 0x2B;
  if (v51 == 2)
  {
    unint64_t v109 = __PAIR64__(v48, v49);
    v110 = v40;
    int8x16x4_t v112 = vld4q_s8(v41);
    uint64_t v83 = (a4 + a8 + 990);
    HIDWORD(a14) = *(_DWORD *)(v39 - 132);
    uint8x16_t v84 = (uint8x16_t)veorq_s8(v112.val[0], (int8x16_t)v43);
    uint16x8_t v85 = vmovl_u8(*(uint8x8_t *)v84.i8);
    uint16x8_t v86 = vmovl_high_u8(v84);
    uint8x16_t v87 = (uint8x16_t)veorq_s8(v112.val[1], (int8x16_t)v43);
    _Q21 = vmovl_u8(*(uint8x8_t *)v87.i8);
    _Q20 = vmovl_high_u8(v87);
    __asm
    {
      SHLL2           V22.4S, V20.8H, #0x10
      SHLL2           V23.4S, V21.8H, #0x10
    }

    uint8x16_t v92 = (uint8x16_t)veorq_s8(v112.val[2], (int8x16_t)v43);
    uint16x8_t v93 = vmovl_high_u8(v92);
    uint16x8_t v94 = vmovl_u8(*(uint8x8_t *)v92.i8);
    v112.val[0] = veorq_s8(v112.val[3], (int8x16_t)v43);
    v112.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v112.val[0]);
    v112.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v112.val[1]);
    v112.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v112.val[1].i8);
    v112.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v112.val[0].i8);
    v112.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v112.val[0]);
    v112.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v112.val[0].i8);
    int32x4_t v95 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v94.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v85.i8), 0x18uLL)),  v112.val[0]);
    int32x4_t v96 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v94, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v85), 0x18uLL)),  v112.val[3]);
    int32x4_t v97 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v93.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v86.i8), 0x18uLL)),  v112.val[1]);
    int32x4_t v98 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q22, (int8x16_t)vshll_high_n_u16(v93, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v86), 0x18uLL)),  v112.val[2]);
    v112.val[0] = veorq_s8( vandq_s8((int8x16_t)v95, (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)v112.val & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    v112.val[3] = veorq_s8( vandq_s8((int8x16_t)v96, (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v112.val[3] & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    v112.val[1] = veorq_s8( vandq_s8((int8x16_t)v97, (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v112.val[1] & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    v112.val[2] = veorq_s8( vandq_s8((int8x16_t)v98, (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v112.val[2] & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    a31 = vaddq_s32(vsubq_s32(v97, vaddq_s32((int32x4_t)v112.val[1], (int32x4_t)v112.val[1])), (int32x4_t)v44);
    a32 = vaddq_s32(vsubq_s32(v98, vaddq_s32((int32x4_t)v112.val[2], (int32x4_t)v112.val[2])), (int32x4_t)v44);
    a29 = vaddq_s32(vsubq_s32(v95, vaddq_s32((int32x4_t)v112.val[0], (int32x4_t)v112.val[0])), (int32x4_t)v44);
    a30 = vaddq_s32(vsubq_s32(v96, vaddq_s32((int32x4_t)v112.val[3], (int32x4_t)v112.val[3])), (int32x4_t)v44);
    uint64_t v99 = v83 ^ 0x7D5;
    id v100 = (_DWORD *)&a29 + v36 + 780171229;
    int v101 = *(v100 - 8) ^ *(v100 - 3);
    int v102 = v101 + v37 - (a5 & (2 * v101));
    int v103 = *(v100 - 16) ^ *((_DWORD *)&a29 + (v99 ^ (v36 + 741)) + 780171229);
    HIDWORD(v105) = v103 ^ v102 ^ 0x37085652;
    LODWORD(v105) = v103 ^ ~v102;
    int v104 = v105 >> 31;
    uint64_t v106 = a5 & (2 * v104);
    *id v100 = v104 + v37 - v106;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 + 8LL * (int)((262 * (v38 == 780171166)) ^ v83)) - 4LL))( v83,  v99,  262LL,  v106,  a5,  v46,  a21,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  v107,  __PAIR64__(v46, v47),  v109,  v110,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28);
  }

  else if (v51 == 1)
  {
    unint64_t v108 = __PAIR64__(v48, v49);
    int8x16x4_t v111 = vld4q_s8(v41);
    uint64_t v52 = (a4 + a8 + 1158);
    uint8x16_t v53 = (uint8x16_t)veorq_s8(v111.val[0], (int8x16_t)v43);
    uint16x8_t v54 = vmovl_u8(*(uint8x8_t *)v53.i8);
    int8x16_t v55 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v54.i8);
    int8x16_t v56 = (int8x16_t)vmovl_high_u16(v54);
    uint16x8_t v57 = vmovl_high_u8(v53);
    int8x16_t v58 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v57.i8);
    int8x16_t v59 = (int8x16_t)vmovl_high_u16(v57);
    uint8x16_t v60 = (uint8x16_t)veorq_s8(v111.val[1], (int8x16_t)v43);
    uint16x8_t v61 = vmovl_high_u8(v60);
    uint16x8_t v62 = vmovl_u8(*(uint8x8_t *)v60.i8);
    uint8x16_t v63 = (uint8x16_t)veorq_s8(v111.val[2], (int8x16_t)v43);
    _Q25 = (int8x16_t)vmovl_high_u8(v63);
    _Q24 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v63.i8);
    int8x16_t v66 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q24.i8, 0x10uLL);
    __asm { SHLL2           V24.4S, V24.8H, #0x10 }

    int8x16_t v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }

    v111.val[0] = veorq_s8(v111.val[3], (int8x16_t)v43);
    v111.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v111.val[0]);
    v111.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v111.val[1]);
    v111.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v111.val[0].i8);
    v111.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v111.val[0]);
    v111.val[0] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v111.val[0].i8), 0x18uLL), v66),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), v55));
    v111.val[3] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v111.val[3], 0x18uLL), _Q24),  vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v56));
    v111.val[1] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v111.val[1].i8), 0x18uLL), v71),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v61.i8, 8uLL), v58));
    v111.val[2] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v111.val[2], 0x18uLL), _Q25),  vorrq_s8((int8x16_t)vshll_high_n_u16(v61, 8uLL), v59));
    int32x4_t v72 = (int32x4_t)veorq_s8( vandq_s8(v111.val[0], (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v55 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    int32x4_t v73 = (int32x4_t)veorq_s8( vandq_s8(v111.val[3], (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v56 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    int32x4_t v74 = (int32x4_t)veorq_s8( vandq_s8(v111.val[1], (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v58 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    int32x4_t v75 = (int32x4_t)veorq_s8( vandq_s8(v111.val[2], (int8x16_t)v42),  (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    a31 = vaddq_s32(vsubq_s32((int32x4_t)v111.val[1], vaddq_s32(v74, v74)), (int32x4_t)v44);
    a32 = vaddq_s32(vsubq_s32((int32x4_t)v111.val[2], vaddq_s32(v75, v75)), (int32x4_t)v44);
    a29 = vaddq_s32(vsubq_s32((int32x4_t)v111.val[0], vaddq_s32(v72, v72)), (int32x4_t)v44);
    a30 = vaddq_s32(vsubq_s32((int32x4_t)v111.val[3], vaddq_s32(v73, v73)), (int32x4_t)v44);
    uint64_t v76 = 82 * (v52 ^ 0x59C);
    uint64_t v77 = (uint64_t)*(&off_189D4D580 + (int)(v52 ^ 0x546));
    int v78 = (v47 ^ v35)
        - 1832265140
        + ((v49 ^ (v35 + v76 - 984)) & (v46 ^ v35) | (v50 ^ v35) & (v46 ^ 0x8B2A4693))
        + *(_DWORD *)(v77 + 4 * (a21 + v36))
        + (a29.i32[(*((_BYTE *)*(&off_189D4D580 + (int)(v52 ^ 0x5CB)) + a21 + v36 - 8) - 56)] ^ v37);
    uint64_t v79 = (char *)*(&off_189D4D580 + (int)v52 - 1403) - 4;
    unsigned int v80 = (v78 + v35 - (v33 & (2 * v78))) ^ v35;
    int v81 = ((v80 << (v79[a21 + v36] - 75)) | (v80 >> (75 - v79[a21 + v36]))) + (v46 ^ v35);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8LL * (int)((1002 * (a21 + 1 != v38)) ^ v52)))( v77,  v79,  v52,  v76,  2462702156LL,  v81 + v35 - (v33 & (2 * v81)),  780171229LL,  &off_189D4D580,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  v107,  __PAIR64__(v46, v47),  v108,  v40,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28);
  }

  else
  {
    *(_DWORD *)(v39 - 14_Block_object_dispose(va, 8) = 2 * (v47 ^ v35) + v35 - (v33 & (4 * (v47 ^ v35)));
    *(_DWORD *)(v39 - 144) = 2 * (v46 ^ v35) + v35 - (v33 & (4 * (v46 ^ v35)));
    *(_DWORD *)(v39 - 140) = 2 * (v49 ^ v35) + v35 - (v33 & (4 * (v49 ^ v35)));
    *(_DWORD *)(v39 - 136) = v35 + 2 * (v48 ^ v35) - (v33 & (4 * (v48 ^ v35)));
    return v40(v42, v43, v44, v45);
  }

uint64_t sub_183D7C34C( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, unsigned int a17, unsigned int a18)
{
  else {
    BOOL v19 = a15 - 913294598 > a18;
  }
  return ((uint64_t (*)(void))(*(void *)(v18 + 8LL * ((953 * !v19) ^ (a4 + a8 + 1136))) - 12LL))();
}

uint64_t sub_183D7C3D8(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL
                                        * ((38 * (((4 * (a8 ^ (a8 + 159)) - a4 - 634) ^ 0xAB189DEE) + v8 < v8 + a2)) ^ (4 * (a8 ^ (a8 + 159)))))
                            - ((4 * (a8 ^ (a8 + 159)) - 516) | 0x222u)
                            + 926LL))();
}

uint64_t sub_183D7C438( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return ((uint64_t (*)(void))(*(void *)(v16
                                        + 8LL
                                        * ((1929
}

uint64_t sub_183D7C4AC( double a1, int8x16_t a2, double a3, int8x16_t a4, uint64_t a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  int8x16_t *v14 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v16 + (v12 + a6)),  vandq_s8( vaddq_s8(*(int8x16_t *)(v16 + (v12 + a6)), *(int8x16_t *)(v16 + (v12 + a6))),  a4)),  a2);
  return (*(uint64_t (**)(void))(v15
                              + 8LL * ((((v13 ^ (a12 - 9)) & 1) * a7) ^ (v13 + a8))))();
}

uint64_t sub_183D7C508@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v5 + a3) = *(_BYTE *)(v9 + (v3 + a1))
  return (*(uint64_t (**)(void))(v8 + 8LL * (((a3 + 1 != ((v4 + a2 - 209) ^ v6)) * v7) ^ (v4 + a2))))();
}

uint64_t sub_183D7C550( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v16 = v13 + 1788412948 < (a13 - 1758458712);
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (((2 * v16) | (16 * v16)) ^ v14)) - 8LL))();
}

uint64_t sub_183D7C5CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v20 = a5 ^ 0x32;
  int v15 = 3804331 * ((((v14 - 120) | 0xCE8FB339) - ((v14 - 120) & 0xCE8FB339)) ^ 0x3411406F);
  *(_DWORD *)(v14 - 120) = v15 + a5 + 958;
  *(_DWORD *)(v14 - 116) = (a13 - 413580798 + 899 * (a5 ^ 0x32)) ^ v15;
  *(void *)(v14 - 112) = a10;
  uint64_t v16 = sub_183D97840(v14 - 120);
  unsigned int v17 = *(_DWORD *)(v14 - 152) & 0x3F ^ (v20 + 41);
  *(_BYTE *)(v14 - 220 + v17) = -65;
  return ((uint64_t (*)(uint64_t))(*(void *)(v13 + 8LL * ((1112 * (v17 > 0x37)) ^ a5)) - 12LL))(v16);
}

uint64_t sub_183D7C6D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  return ((uint64_t (*)(void))(*(void *)(v21
                                        + 8LL
}

uint64_t sub_183D7C710()
{
}

uint64_t sub_183D7C760@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v5 - 220 + a1 + v3) = 0x3F3F3F3F3F3F3F3FLL;
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((1138 * ((v1 & 0x38) == 8LL)) ^ (v2 - 174)))
                            - 3 * ((v2 - 174) ^ 0x15Cu)
                            + 310LL))();
}

uint64_t sub_183D7C7B4@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  double *v3 = a2;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((v5 == 0) * v4) ^ v2)) - a1 + 310))();
}

uint64_t sub_183D7C7DC@<X0>(int a1@<W7>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v4
}

void sub_183D7C818()
{
}

uint64_t sub_183D7C828@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  *(_BYTE *)(v11 - 220 + (a4 + v8)) = *(_BYTE *)(v10 + (v5 + a2))
  unsigned int v12 = v5 + 1 + a3;
  int v13 = (v4 < v7) ^ (v12 < a1);
  BOOL v14 = v12 < v4;
  if (v13) {
    BOOL v14 = v4 < v7;
  }
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * (((2 * v14) | (16 * v14)) ^ v6)) - 8LL))();
}

uint64_t sub_183D7C8B0@<X0>(int a1@<W3>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((((a2 - 1647554679) > 0x37) * ((v3 - 583719336) & 0x1A54DBFD ^ 0x1B3)) ^ (a1 + v3 - 41))))();
}

uint64_t sub_183D7C904@<X0>(unsigned int a1@<W8>)
{
  uint64_t v4 = a1;
  unint64_t v5 = v2 + a1 + (v1 ^ 0x3FD) - 895;
  if (v5 <= 0x38) {
    unint64_t v5 = 56LL;
  }
  return (*(uint64_t (**)(void))(v3 + 8LL * ((217 * (v5 - v4 + 1647554679 < (unint64_t)(v1 + 548) - 665)) ^ v1)))();
}

uint64_t sub_183D7C960()
{
  *(void *)(v5 - 220 + v2 + v3) = 0x3F3F3F3F3F3F3F3FLL;
}

uint64_t sub_183D7C9A8(double a1)
{
  double *v2 = a1;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (((v4 == 0) * v3) ^ v1)) - 8LL))();
}

uint64_t sub_183D7C9CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v11 + 8LL * (int)(((((v10 + 1593835083) & 0xA975FF37) - a8 + 395) * (v8 == v9)) ^ v10)))();
}

uint64_t sub_183D7CA08@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v6 = (v2 - 377) | 7;
  *(_BYTE *)(a2 + v5 - 220 + (a1 + v6 - 303) - 1789505182) = 63;
  return (*(uint64_t (**)(void))(v4 + 8LL * ((910 * ((unint64_t)(a2 + 1 + v3) < 0x38)) ^ v6)))();
}

uint64_t sub_183D7CA58@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(v5 + v3 + v2 + a1) = v4;
  return (*(uint64_t (**)(void))(v8 + 8LL * ((((unint64_t)(v5 + 1 + v7) < 0x38) * v6) ^ v1)))();
}

void sub_183D7CA84(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  int v9 = *(unsigned __int8 *)(v8 - 124) ^ 0x2B;
  if (v9 == 1)
  {
    unsigned int v16 = *(_DWORD *)(v8 - 156);
    unsigned int v15 = *(_DWORD *)(v8 - 152);
    *(_BYTE *)(v8 - 164) = ((8 * v15) ^ 0x58) - ((((8 * v15) ^ 0x58) << (a4 + a8 - 9)) & 0x70) + 63;
    *(_BYTE *)(v8 - 163) = ((v15 >> 5) ^ 0x35) - 2 * (((v15 >> 5) ^ 0x35) & 0x3F) + 63;
    *(_BYTE *)(v8 - 162) = ((v15 >> 13) ^ 0xA4) - 2 * (((v15 >> 13) ^ 0xA4) & 0x3F) + 63;
    *(_BYTE *)(v8 - 161) = ((v15 >> 21) ^ 0x78) - 2 * (((v15 >> 21) ^ 0x78) & 0x3F) + 63;
    HIDWORD(v17) = v16 ^ 0xC;
    LODWORD(v17) = v15 ^ 0xA0000000;
    *(_BYTE *)(v8 - 160) = (v17 >> 29) - 2 * ((v17 >> 29) & 0x3F) + 63;
    *(_BYTE *)(v8 - 159) = ((v16 >> 5) ^ 0x57) - 2 * (((v16 >> 5) ^ 0x57) & 0x3F) + 63;
    *(_BYTE *)(v8 - 15_Block_object_dispose(va, 8) = ((v16 >> 13) ^ 0xB7) - 2 * (((v16 >> 13) ^ 0xB7) & 0x3F) + 63;
    unsigned int v14 = ((v16 >> 21) ^ 0xFFFFFFE6) - 2 * (((v16 >> 21) ^ 0xFFFFFFE6) & 0x3F) + 63;
  }

  else
  {
    if (v9 != 2) {
      goto LABEL_6;
    }
    unsigned int v10 = *(_DWORD *)(v8 - 156);
    unsigned int v11 = *(_DWORD *)(v8 - 152);
    *(_BYTE *)(v8 - 164) = ((v10 >> 21) ^ 0xE6) - 2 * (((v10 >> 21) ^ 0xE6) & 0x3F) + 63;
    char v12 = (91 * (a8 ^ (a8 - 3))) ^ (v10 >> 13) ^ 0xA6;
    *(_BYTE *)(v8 - 163) = v12 - 2 * (v12 & 0x3F) + 63;
    *(_BYTE *)(v8 - 162) = ((v10 >> 5) ^ 0x57) - 2 * (((v10 >> 5) ^ 0x57) & 0x3F) + 63;
    HIDWORD(v13) = v10 ^ 0xC;
    LODWORD(v13) = v11 ^ 0xA0000000;
    *(_BYTE *)(v8 - 161) = (v13 >> 29) - 2 * ((v13 >> 29) & 0x3F) + 63;
    *(_BYTE *)(v8 - 160) = ((v11 >> 21) ^ 0x78) - 2 * (((v11 >> 21) ^ 0x78) & 0x3F) + 63;
    *(_BYTE *)(v8 - 159) = ((v11 >> 13) ^ 0xA4) - 2 * (((v11 >> 13) ^ 0xA4) & 0x3F) + 63;
    *(_BYTE *)(v8 - 15_Block_object_dispose(va, 8) = ((v11 >> 5) ^ 0x35) - 2 * (((v11 >> 5) ^ 0x35) & 0x3F) + 63;
    LOBYTE(v14) = ((8 * v11) ^ 0x58) + (~(2 * ((8 * v11) ^ 0x58)) | 0x8F) + 64;
  }

  *(_BYTE *)(v8 - 157) = v14;
LABEL_6:
  JUMPOUT(0x183D7B810LL);
}

uint64_t sub_183D7CE8C@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  unsigned int v8 = *(_DWORD *)(v7 - 220 + ((v5 + a2) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a1 + (v5 + a2 + 1)) = (BYTE2(v8) ^ 0xD5) - 2 * ((BYTE2(v8) ^ 0xD5) & 0x3F) + 63;
  *(_BYTE *)(a1 + (v5 + a2 + 2)) = (BYTE1(v8) ^ 0xB9) - 2 * ((BYTE1(v8) ^ 0xB9) & 0x3F) + 63;
  *(_BYTE *)(a1 + (v5 + a2)) = (HIBYTE(v8) ^ 0x74)
                                           - (((HIBYTE(v8) ^ 0x74) << (((v3 - 9) & 0xF7) - 38)) & 0x7E)
                                           + 63;
  *(_BYTE *)(a1 + (v5 + a2 + 3)) = v8 ^ 0x53;
  unsigned int v9 = *(_DWORD *)(v7 - 128) + 1043561664;
  BOOL v10 = v9 < v2;
  BOOL v11 = v5 - 114119050 < v9;
  if (v5 - 114119050 < v2 != v10) {
    BOOL v11 = v10;
  }
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((v11 * v4) ^ v3)) - 12LL))();
}

void sub_183D7D030()
{
}

uint64_t sub_183D7D040()
{
  return 0LL;
}

void sub_183D7D080(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)a1 + 535753261 * ((a1 & 0x658A5D69 | ~(a1 | 0x658A5D69)) ^ 0x9081ACB9);
  uint64_t v3 = *(void *)(a1 + 8);
  v2[0] = v1 + 235795823 * ((v2 & 0xC687DC9D | ~(v2 | 0xC687DC9D)) ^ 0xADD56A3B) + 232;
  sub_183DB5978((uint64_t)v2);
  __asm { BR              X9 }

uint64_t sub_183D7D1C4@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = (((v4 - v3) >> 4) & 0x687DFFE ^ 0x480D66C) + (((v4 - v3) >> 5) ^ 0x5D9F84C9);
  BOOL v6 = v5 + 893983033 < v2 - 1869805256;
  if (v2 > 0x6F72F6C7 != v5 < 0x5B43EFFF) {
    BOOL v6 = v2 > 0x6F72F6C7;
  }
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (v1 ^ (124 * v6))) - ((v1 - 76414047) & 0x48DFFFF ^ 0x4DELL)))();
}

uint64_t sub_183D7D274@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8LL * ((15 * ((v1 & 0x1F ^ 4) != ((v2 - 958) | 0xA5) - 445)) ^ v2)))();
}

uint64_t sub_183D7D2AC@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8LL * ((v3 - 264) ^ (1488 * ((v2 + v1) < 0x7FFFFFFF)))))((v3 - 264));
}

uint64_t sub_183D7D300@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v9 = a1 ^ 0x2B0;
  int v10 = (v7 ^ 0x9A29E42E) + v3;
  BOOL v11 = (void *)(v8 - 0x67843F9A1244BAC3LL);
  unsigned int v12 = ((2 * (*(_DWORD *)(*v11 + 4LL * (v2 - 1531179006)) ^ v5)) << (v4 ^ 0x1F)) | (((103 * (v9 ^ 0x17D)) ^ (v5 - 269) ^ *(_DWORD *)(*v11 + 4LL * (v2 - 1531179007))) >> v4);
  *(_DWORD *)*BOOL v11 = v12 + v5 - (v6 & (2 * v12));
  BOOL v13 = v10 > 1055257886;
  if (v10 < v9 - 1092226145) {
    BOOL v13 = 1;
  }
  return (*(uint64_t (**)(void))(a2 + 8LL * ((179 * !v13) ^ (v9 + 511))))();
}

void sub_183D7D400()
{
}

void sub_183D7D408()
{
  *int v0 = 1756409276;
}

void sub_183D7D5D4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_183D7D644@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((83
                                          * (((a1 - 1534814542) ^ 0x5FBEBBD67FADC56FLL)
                                           + ((2 * (a1 - 1534814542)) & 0xFF5B8ADE)
                                           - 0x5FBEBBD5A257F522LL != 3713388621LL)) ^ 0x614u))
                            - 4LL))();
}

uint64_t sub_183D7D6E0()
{
  int v6 = *(unsigned __int8 *)(v3 + v4 - 0x5B5E8F43CDFD43F5LL) - *(unsigned __int8 *)(v1 + v4 - 0x5B5E8F43CDFD43F5LL);
  return (*(uint64_t (**)(uint64_t))(v5
                                            + 8LL
                                            * ((46
}

uint64_t sub_183D7D75C()
{
  BOOL v5 = v1 < v0;
  if (v5 == v2 - 0x5B5E8F42F0A773A7LL < v0) {
    BOOL v5 = v2 - 0x5B5E8F42F0A773A7LL < v1;
  }
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (v3 ^ (83 * v5))) - 4LL))();
}

uint64_t sub_183D7D7D4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8LL
}

uint64_t sub_183D7D830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6
                                                                                          + 8LL
                                                                                          * ((1431
                                                                                            * (((((2 * v5) ^ 0x300)
                                                                                               - 101918454) & (2 * (*v4 - 42)))
                                                                                             + ((*v4 - 42) ^ 0xFCF66DFD) == -50958851)) ^ v5))
                                                                              - 8LL))( a1,  a2,  a3,  a4,  1991289520LL);
}

uint64_t sub_183D7D8A0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0)
                                          * (((v3 + 312) | 0xC0) ^ 0x4F3)) | v3))
                            - 8LL))();
}

uint64_t sub_183D7D8EC()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0)
                                          * ((8 * v3) ^ 0x5D0)) ^ v3))
                            - 8LL))();
}

uint64_t sub_183D7D93C()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1642
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
}

uint64_t sub_183D7D98C()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1494
                                          * ((((*(unsigned __int8 *)(v2 + 4) - 247) << ((4 * v3) ^ 0xE1)) & v1)
}

uint64_t sub_183D7D9E4()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((549
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
}

uint64_t sub_183D7DA34()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1646
                                          * ((((*(unsigned __int8 *)(v2 + 6) - 1) << (v3 ^ 0xF9)) & v1)
}

uint64_t sub_183D7DA80()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1767
                                          * ((((*(unsigned __int8 *)(v2 + 7) - 1) << ((v3 - 8) ^ 0xF1)) & v1)
}

uint64_t sub_183D7DAD0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1653
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 4)))
}

uint64_t sub_183D7DB24(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v6 + 96) + 1428LL) = 969863787;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((*(_DWORD *)(a2 + 4) == v2 + 1534813443 + ((v4 - 175) | 0x140)) * v3) ^ v4))
                            - 8LL))();
}

uint64_t sub_183D7DB78(uint64_t a1, uint64_t a2)
{
  int v6 = ((v4 - 427) | 0x30) + **(unsigned __int8 **)(a2 + 8) - 415;
  return (*(uint64_t (**)(void))(v5 + 8LL * ((11 * ((v3 & (2 * v6)) + (v6 ^ v2) == v2)) | v4)))();
}

uint64_t sub_183D7DBB8()
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 1) - 134)))
                                 + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0
                                                                                + ((v2 - 993950451) & 0x3B3E7AE3)
                                                                                - 737)
                                * ((v2 - 379) ^ 0xA9)) ^ v2)))();
}

uint64_t sub_183D7DC10()
{
  int v5 = v3 + 15 + *(unsigned __int8 *)(v2 + 2) - 824;
  return (*(uint64_t (**)(void))(v4 + 8LL * ((((v1 & (2 * v5)) + (v5 ^ v0) != v0) * (v3 - 720)) ^ v3)))();
}

uint64_t sub_183D7DC4C()
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((1029
}

uint64_t sub_183D7DCAC()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((959
                                          * ((((*(unsigned __int8 *)(v3 + 4) - 247) << (((v2 + 82) | 0xA0) ^ 0xF1)) & v1)
}

uint64_t sub_183D7DD08()
{
  unsigned int v5 = ((v3 - 379) ^ 0xFFFFFE86) + *(unsigned __int8 *)(v2 + 5);
  return (*(uint64_t (**)(void))(v4 + 8LL * ((1944 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_183D7DD44()
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((31
}

uint64_t sub_183D7DD9C()
{
  int v5 = (v2 ^ 0x385) + *(unsigned __int8 *)(v3 + 7) - 374;
  return (*(uint64_t (**)(void))(v4 + 8LL * ((1631 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_183D7DDD8()
{
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((1684
                                * ((((v2 + 872818447) & 0xCBF9D6D3 ^ (v1 - 209)) & (2
}

uint64_t sub_183D7DE2C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v4 + 96) + 1428LL) = 969863791;
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((1325
                                          * (*(_DWORD *)(a2 + 4) == ((v2 + 162) ^ 0x5B7B6946 ^ ((v2 - 207) | 0x160)))) ^ v2))
                            - 8LL))();
}

uint64_t sub_183D7DE90(uint64_t a1, uint64_t a2)
{
  int v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL * ((1052 * (((v3 + v4 - 162 - 211) & (2 * v6)) + (v6 ^ v2) == v2)) ^ v4))
                            - 12LL))();
}

uint64_t sub_183D7DED8()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((535
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)) ^ v2))
                            - v4
                            + 199))();
}

uint64_t sub_183D7DF14()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)
                                          * (v4 ^ 0x68)) ^ v2))
                            - 12LL))();
}

uint64_t sub_183D7DF50()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1365
                                          * (((v1 + ((v2 - 229) | 0x43) - 211) & (2
                                                                                * (*(unsigned __int8 *)(v3 + 3) - 134)))
}

uint64_t sub_183D7DF98()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1245
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
}

uint64_t sub_183D7DFDC()
{
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((1022
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
}

uint64_t sub_183D7E018()
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((1328
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 6) - 1)))
}

uint64_t sub_183D7E050()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((1074
                                          * ((((*(unsigned __int8 *)(v3 + 7) - 1) << ((v2 - 126) & 0xDB ^ 0xD2)) & v1)
                                           + ((*(unsigned __int8 *)(v3 + 7) - 1) ^ v0) == v0)) ^ v2))
}

uint64_t sub_183D7E0B0()
{
  int v5 = (v3 ^ 0x1B8) + *(unsigned __int8 *)(v2 + 8) - 222;
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((30 * ((v1 & (2 * v5)) + (v5 ^ (v0 + ((v3 - 280) | 0x80) - 211)) != v0)) ^ v3))
                            - 12LL))();
}

uint64_t sub_183D7E100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v7
                                                      + 8LL
                                                      * (int)(((((v6 + 1304761641) & 0xB23AEB67) + 1156) * (v5 == 100)) ^ v6))
                                          + 2303678282LL
                                          - (v6 - a5 + 303)))(4294925278LL);
}

  ;
}

void sub_183D7E6AC()
{
}

void sub_183D7E924()
{
}

uint64_t sub_183D7E93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((91 * (v5 + 1 == v7 + 16)) ^ a5)) - 4LL))();
}

uint64_t sub_183D7EA2C()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((1650 * (v3 + 1 != v2 + 32)) ^ v1)) - 4LL))();
}

uint64_t sub_183D7EAFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v6 + 8LL * ((218 * (a2 + 1 != v7 + 48)) ^ a6)) - 4LL))(a3);
}

void sub_183D7EBD0()
{
}

uint64_t sub_183D7EDC8()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (((v0 + 1 != v3 + 4) | (16 * (v0 + 1 != v3 + 4))) ^ v1)) - 4LL))();
}

uint64_t sub_183D7EEA0@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1998 * (a1 + 1 != v3 + 24)) ^ a2)) - 4LL))();
}

uint64_t sub_183D7EF50@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1987 * (v1 + 1 == v3 + 44)) ^ a1)) - 4LL))();
}

uint64_t sub_183D7F02C(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((604 * (a1 + 1 == v3 + 64)) ^ v1)) - 4LL))();
}

void sub_183D7F0E4( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v12 = ((((v8 + 138810077) | 0x81094052) - 343514598) ^ a1) + (a8 ^ v9);
  *(_DWORD *)(v11 - 132) = v12 + v9 - (v10 & (2 * v12));
  JUMPOUT(0x183D7F148LL);
}

uint64_t sub_183D7F1C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, unsigned int a17)
{
  else {
    BOOL v18 = a14 + 926973454 > a17;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v17
                                                                        + 8LL
                                                                        * ((!v18
                                                                          * ((a6 + 2061700749) & 0xE6C47FF ^ 0x557)) ^ (a6 - 1991289164)))
                                                            - 8LL))( 2303678290LL,  2574732204LL,  36LL);
}

uint64_t sub_183D7F280(int a1, int a2)
{
}

uint64_t sub_183D7F2CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return ((uint64_t (*)(void))(*(void *)(v16
                                        + 8LL
                                        * (int)(((a13 + v15 - v14 >= ((v13 - 1452278114) & 0xDFDF5776 ^ 0x894F5742uLL))
                                               * (a6 + ((v13 - 270541123) & 0x996F7757) + 817)) ^ (v13 + 87)))
                            - 4LL))();
}

uint64_t sub_183D7F344( int a1, int a2, int8x16_t a3, double a4, double a5, int8x16_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  int8x16_t *v12 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v15 + (v10 + a2)),  vandq_s8( vaddq_s8(*(int8x16_t *)(v15 + (v10 + a2)), *(int8x16_t *)(v15 + (v10 + a2))),  a6)),  a3);
  return ((uint64_t (*)(void))(*(void *)(v13
                                        + 8LL
}

uint64_t sub_183D7F3A4@<X0>(int a1@<W1>, unsigned int a2@<W2>, int a3@<W5>, int a4@<W6>, uint64_t a5@<X8>)
{
  char v10 = *(_BYTE *)(v9 + a1 + v6 + ((a3 + v5 - 490) | a2) - 60);
  *(_BYTE *)(v7 + a5) = v10 - 2 * (v10 & 0x3F) + 63;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (((a5 == 63) * a4) ^ (a3 + v5 - 301))) - 8LL))();
}

uint64_t sub_183D7F3FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v16 = v13 + 1987483414 < (a13 - 1392265336);
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((120 * ((((v15 + 1516) ^ v16) & 1) == 0)) ^ v15)) - 8LL))();
}

uint64_t sub_183D7F474( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v15 = (a1 - 2130232226) | 0x8481452;
  int v16 = 3804331 * ((((v14 - 120) | 0x75EBD8D4) - (v14 - 120) + ((v14 - 120) & 0x8A142728)) ^ 0x8F752B82);
  *(_DWORD *)(v14 - 120) = v16 + a1 - 692;
  *(_DWORD *)(v14 - 116) = (a13 - 413579000) ^ v16;
  *(void *)(v14 - 112) = a10;
  uint64_t v18 = sub_183D97840(v14 - 120);
  uint64_t v19 = *(_DWORD *)(v14 - 152) & 0x3F;
  *(_BYTE *)(v14 - 220 + (v19 ^ 0x2B)) = -65;
  return ((uint64_t (*)(uint64_t))(*(void *)(v13
                                                      + 8LL
}

uint64_t sub_183D7F578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6
                                                                                          + 8LL
                                                                                          * ((v5 - 1423) | (4 * (v4 == 63)) | (8 * (v4 == 63))))
                                                                              - ((((v5 + 381451319) & 0xE9437D67)
                                                                                + 1497LL) ^ (v5 - 144))))( a1,  a2,  a3,  a4,  2303678290LL);
}

uint64_t sub_183D7F5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
}

uint64_t sub_183D7F624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(void *)(v10 - 220 + v6 + 1) = 0x3F3F3F3F3F3F3F3FLL;
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((201 * ((v7 & 0x38) == 8LL)) ^ (a6 + v8 + 105)))
}

void sub_183D7F680()
{
}

uint64_t sub_183D7F688@<X0>(int a1@<W1>, int a2@<W8>)
{
  BOOL v11 = v2 < v4;
  *(_BYTE *)(v10 - 220 + (a2 + v5)) = *(_BYTE *)(v8 + (v3 + a1))
  unsigned int v12 = v3 + 1 + v6;
  int v13 = v11 ^ (v12 < v4);
  BOOL v14 = v12 < v2;
  if (!v13) {
    BOOL v11 = v14;
  }
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((120 * !v11) ^ v9)) - 8LL))();
}

uint64_t sub_183D7F700@<X0>(int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL * ((21 * ((v3 + 1991289809 + a2 - 2113249799) < 0x38)) | (v3 + a1))))();
}

uint64_t sub_183D7F740@<X0>(unsigned int a1@<W8>)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 - 2113248995LL;
  if (v4 <= 0x38) {
    unint64_t v4 = 56LL;
  }
  return (*(uint64_t (**)(void))(v2 + 8LL * ((13 * (((v4 - v3 + 2113248996 < 8) ^ (v1 - 16)) & 1)) ^ v1)))();
}

uint64_t sub_183D7F7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(void *)(v8 - 2113248995 + v10 - 220 - 1) = 0x3F3F3F3F3F3F3F3FLL;
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL
                                        * ((((v6 & 0xFFFFFFFFFFFFFFF8LL) == 8)
                                          * ((((v7 - 1996472593) | 0x4F1540) - a5 + 514) ^ 0x6E6)) ^ (a6 + ((v7 - 1996472593) | 0x4F1540) + 233)))
                            - 12LL))();
}

uint64_t sub_183D7F830(double a1)
{
  *int v1 = a1;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (((v4 == 0) * v3) ^ v2)) - 12LL))();
}

uint64_t sub_183D7F854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6)
{
  return (*(uint64_t (**)(void))(v9
                              + 8LL
                              * (((((v6 == v7) ^ (v8 - a6 + 1)) & 1) * ((a5 + v8 - 514) ^ (a5 - 223))) | v8)))();
}

void sub_183D7F88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  int v7 = *(unsigned __int8 *)(v6 - 124) ^ 0x2B;
  if (v7 == 1)
  {
    unsigned int v15 = *(_DWORD *)(v6 - 156);
    unsigned int v14 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((8 * v14) ^ 0x58) + (~(2 * ((8 * v14) ^ 0x58)) | 0x8F) + 64;
    *(_BYTE *)(v6 - 163) = ((v14 >> 5) ^ 0x35) - 2 * (((v14 >> 5) ^ 0x35) & 0x3F) + 63;
    *(_BYTE *)(v6 - 162) = ((v14 >> 13) ^ 0xA4) - 2 * (((v14 >> 13) ^ 0xA4) & 0x3F) + 63;
    char v8 = -104;
    *(_BYTE *)(v6 - 161) = ((v14 >> 21) ^ 0x78) - 2 * (((v14 >> 21) ^ 0x78) & 0x3F) + 63;
    HIDWORD(v16) = v15 ^ 0xC;
    LODWORD(v16) = v14 ^ 0xA0000000;
    *(_BYTE *)(v6 - 160) = (v16 >> 29) - 2 * ((v16 >> 29) & 0x3F) + 63;
    *(_BYTE *)(v6 - 159) = ((v15 >> 5) ^ 0x57) - 2 * (((v15 >> 5) ^ 0x57) & 0x3F) + 63;
    *(_BYTE *)(v6 - 15_Block_object_dispose(va, 8) = ((v15 >> 13) ^ 0xB7) + (~(2 * ((v15 >> 13) ^ 0xB7)) | 0x81) + 64;
    char v12 = 126;
    unsigned int v13 = (v15 >> 21) ^ 0xFFFFFFE6;
  }

  else
  {
    if (v7 != 2) {
      goto LABEL_6;
    }
    char v8 = a6 + a5 - 106;
    unsigned int v9 = *(_DWORD *)(v6 - 156);
    unsigned int v10 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((v9 >> 21) ^ 0xE6) - 2 * (((v9 >> 21) ^ 0xE6) & 0x3F) + 63;
    *(_BYTE *)(v6 - 163) = ((v9 >> (v8 ^ 0x95)) ^ 0xB7) - 2 * (((v9 >> (v8 ^ 0x95)) ^ 0xB7) & 0x3F) + 63;
    *(_BYTE *)(v6 - 162) = ((v9 >> 5) ^ 0x57) - 2 * (((v9 >> 5) ^ 0x57) & 0x3F) + 63;
    HIDWORD(v11) = v9 ^ 0xC;
    LODWORD(v11) = v10 ^ 0xA0000000;
    *(_BYTE *)(v6 - 161) = (v11 >> 29) - 2 * ((v11 >> 29) & 0x3F) + 63;
    *(_BYTE *)(v6 - 160) = ((v10 >> 21) ^ 0x78) - 2 * (((v10 >> 21) ^ 0x78) & 0x3F) + 63;
    *(_BYTE *)(v6 - 159) = ((v10 >> 13) ^ 0xA4) + (~(2 * ((v10 >> 13) ^ 0xA4)) | 0x81) + 64;
    *(_BYTE *)(v6 - 15_Block_object_dispose(va, 8) = ((v10 >> 5) ^ 0x35) - 2 * (((v10 >> 5) ^ 0x35) & 0x3F) + 63;
    char v12 = 112;
    LOBYTE(v13) = (8 * v10) ^ 0x58;
  }

  *(_BYTE *)(v6 - 157) = v13 + ((v8 + 120) | 0x42) - (v12 & (2 * v13)) - 19;
LABEL_6:
  JUMPOUT(0x183D7E610LL);
}

uint64_t sub_183D7FC60()
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((((v2 ^ 0x15E) + 1731) * (v1 != v0)) ^ v2))
                            + 2303678282LL
                            - ((v2 + 4477681) | 0x890B0342)))();
}

void sub_183D7FCAC()
{
}

uint64_t sub_183D7FCCC@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  *(_BYTE *)(v4 - 220 + ((v2 - 1573902293) & 0xD48080C3 ^ 0xFFFFFFFF820A615DLL) + a2) = 63;
  return ((uint64_t (*)(void))(*(void *)(v3
}

uint64_t sub_183D7FDA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  int v14 = *(_DWORD *)(v13 - 220 + ((v11 + v7) & 0xFFFFFFFC) + 72);
  *(_BYTE *)(a7 + (v11 + v7 + 1)) = (BYTE2(v14) ^ 0xD5) - 2 * ((BYTE2(v14) ^ 0xD5) & 0x3F) + 63;
  *(_BYTE *)(a7 + (v11 + v7 + 2)) = (BYTE1(v14) ^ 0xB9) - 2 * ((BYTE1(v14) ^ 0xB9) & 0x3F) + 63;
  *(_BYTE *)(a7 + (v11 + v7)) = (HIBYTE(v14) ^ 0x74)
                                            - (((HIBYTE(v14) ^ 0x74) << ((v10 - a6 + 110) ^ 0x53)) & 0x7E)
                                            + 63;
  *(_BYTE *)(a7 + (v11 + v7 + 3)) = v14 ^ 0x53;
  unsigned int v15 = *(_DWORD *)(v13 - 128) + 1326079805;
  BOOL v16 = v15 < v8;
  BOOL v17 = v11 - 357928692 < v15;
  if (v11 - 357928692 < v8 != v16) {
    BOOL v17 = v16;
  }
  return ((uint64_t (*)(void))(*(void *)(v12 + 8LL * ((v17 * v9) ^ v10)) - 8LL))();
}

void sub_183D7FF40()
{
}

void sub_183D7FF48(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_183D7FFCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, unint64_t *))(v68 + 14552))( a1,  a2,  a3,  a4,  1871867261LL,  a6,  3971117330LL,  2765323490LL,  a9,  &a68,  a11,  &STACK[0x33291E09EA041E4B]);
}

uint64_t sub_183D80108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (((v5 - 1344) * (v6 != 1529643805)) ^ v5))
                            + a5
                            - ((v5 + 2145122835) & 0xEFB66DB9)))();
}

uint64_t sub_183D8015C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v24 = (v20 - 1871866683) | 0x11;
  int v25 = v23 + v20 + 914;
  BOOL v26 = a20 - 473735673 < (v21 - 1858664508);
  if (a20 - 473735673 < a7 != v21 - 1858664508 < (v24 ^ (a7 + 571))) {
    BOOL v26 = v21 - 1858664508 < (v24 ^ (a7 + 571));
  }
  return ((uint64_t (*)(void))(*(void *)(v22 + 8LL * ((1010 * v26) ^ v25)) - 8LL))();
}

uint64_t sub_183D803D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v22 = 628203409 * ((v21 - 152) ^ 0x82880C33);
  *(void *)(v21 - 144) = a12;
  *(void *)(v21 - 152) = a14;
  *(_DWORD *)(v21 - 136) = v18 - v22 + 428;
  *(_DWORD *)(v21 - 132) = v19 - v22 + (((v18 ^ (v17 + 589)) - 1369503517) ^ (v18 + 963));
  *(void *)(v21 - 12_Block_object_dispose(va, 8) = a15;
  *(void *)(v21 - 112) = a17;
  *(void *)(v21 - 104) = a13;
  uint64_t v23 = ((uint64_t (*)(uint64_t))(*(void *)(a4 + 8LL * (v18 ^ 0x226)) - 12LL))(v21 - 152);
  return (*(uint64_t (**)(uint64_t))(v20 + 8LL * ((1798 * (*(_DWORD *)(v21 - 120) == -1224190382)) ^ v18)))(v23);
}

uint64_t sub_183D804BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10
                                                                       + 8LL
                                                                       * (((*(_DWORD *)(v9 + 48LL * (v8 + a8)) == 490593810)
                                                                         * (((v12 - 1558) | 0x253) - 589)) ^ v12)))( a1,  a2,  a3,  v11);
}

uint64_t sub_183D80504@<X0>(int a1@<W2>, int a2@<W8>)
{
  if ((v2 + 1949378718) <= 0x1B && ((1 << (v2 - 98)) & 0x9014001) != 0) {
    __asm { BR              X10 }
  }

  return a1 ^ 0x48F70D8Cu;
}

void sub_183D80C28(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }

void sub_183D80CC8()
{
  *uint64_t v0 = -2035587146;
}

void sub_183D80F8C(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_183D81024@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1713 * (*v1 != a1 - 602)) ^ a1)) - 4LL))();
}

uint64_t sub_183D81060@<X0>(int a1@<W8>)
{
  unsigned int v5 = (a1 + 1536610661) & 0xA4692E7F;
  uint64_t v6 = v3(*v4);
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * (int)((121 * (*v1 != 0)) ^ v5)) - 12LL))(v6);
}

uint64_t sub_183D810A4()
{
  uint64_t result = v2(*v3);
  *int v1 = 0;
  *(_DWORD *)uint64_t v0 = 0;
  *(void *)(v0 + 344) = 0LL;
  *(void *)(v0 + 352) = 0LL;
  *(_DWORD *)(v0 + 360) = 552049642;
  *(_DWORD *)(v0 + 56) = 709283135;
  return result;
}

uint64_t sub_183D810E4@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((121 * (*v1 != 0)) ^ (a1 - 27))) - 12LL))();
}

void g9eargdzvoj3()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  sub_183DBA3C0(v0);
  __asm { BR              X8 }

uint64_t sub_183D811D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, unsigned int a14)
{
  a14 = 455 - 460628867 * ((&a12 & 0x11E81363 | ~(&a12 | 0x11E81363)) ^ 0xA2816EE1);
  a12 = &STACK[0x6F6532B723EC5DDD];
  sub_183DB3D3C((uint64_t)&a12);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15
                                                                                + 8LL
                                                                                * ((41 * (((a13 == v14) ^ 0xD1) & 1)) ^ 0x29E)))( v16,  v17,  v18,  v19,  v20);
}

uint64_t sub_183D81270( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, uint64_t a15)
{
  a14 = v15;
  a15 = a10;
  a12 = v17
      + 1178560073
  uint64_t v20 = ((uint64_t (*)(unsigned int *))(*(void *)(v18 + 8LL * (v17 ^ 0x496)) - 8LL))(&a12);
}

uint64_t sub_183D81320( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unint64_t a13, uint64_t a14, int a15)
{
  uint64_t v21 = 3804331 * (v20 ^ 0x698B7B55FA9EF356LL);
  a15 = v21 + v17 - 53;
  a13 = (v15 ^ 0x5F7F4E9EE9FDC3FBLL)
      + v21
      - 0x494C0A04083C0393LL
      + (((v17 - 1898279130) & 0xEBF ^ 0xBEFE9D3DD3FB8540LL) & (2 * v15));
  a14 = a10;
  uint64_t v22 = ((uint64_t (*)(int *))(*(void *)(v18 + 8LL * (int)(v17 - 1168)) - 12LL))(&a12);
  return ((uint64_t (*)(uint64_t))(*(void *)(v19 + 8LL * (((a12 == v16) | (2 * (a12 == v16))) ^ v17)) - 12LL))(v22);
}

uint64_t sub_183D813E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, int a15, unsigned int a16, unint64_t *a17)
{
  unsigned int v20 = 1759421093
      * (((&a12 | 0x805BE6CF) - &a12 + (&a12 & 0x7FA41930)) ^ 0x3326569B);
  a12 = 2017542727 - v20;
  a17 = &STACK[0x3F0B617C4F927BF5];
  a14 = a10;
  a15 = v20 ^ 0x5E7DBF4E;
  a16 = v20 + v18 + 2138962127;
  uint64_t v21 = sub_183DB9534((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(void *)(v19
                                                      + 8LL
                                                      * (((a13 == v17) * ((v18 + 879234542) & 0xFF7 ^ 0xAC)) ^ v18))
                                          - 12LL))(v21);
}

uint64_t sub_183D814B8()
{
  int v5 = (v2 + 1160979246) & 0xAB7;
  unsigned int v11 = (v2 - 37) ^ (1374699841
                   * (((&v11 ^ 0x134432AE) & 0x95A0AE03 | ~(&v11 ^ 0x134432AE | 0x95A0AE03)) ^ 0x14EF7B5B));
  uint64_t v13 = &STACK[0x130F29621C6D08AC];
  int v14 = v8;
  ((void (*)(unsigned int *))(*(void *)(v4 + 8LL * (v2 ^ 0x4B9u)) - 12LL))(&v11);
  uint64_t v13 = v8;
  unsigned int v11 = v2 + 1225351577 * (((&v11 | 0x4BC931BB) + (~&v11 | 0xB436CE44)) ^ 0x3536AB88) - 103;
  sub_183D7ACD4((uint64_t)&v11);
  if (v12 == v1 + v5 - 695) {
    unsigned int v6 = v10;
  }
  else {
    unsigned int v6 = v12;
  }
  uint64_t v13 = v8;
  unsigned int v12 = v2 + (&v11 ^ 0xAF40E2F) * v3 - 697;
  v0(&v11);
  uint64_t v13 = v9;
  unsigned int v12 = v5 + (((&v11 | 0x2E820EE1) - (&v11 & 0x2E820EE1)) ^ 0x247600CE) * v3 - 159;
  v0(&v11);
  return v6 ^ v1;
}

void sub_183D81668(uint64_t a1)
{
  int v1 = ((*(_DWORD *)(a1 + 16) ^ (235795823 * ((a1 + 1866794728 - 2 * (a1 & 0x6F4506E8)) ^ 0xFBE84FB1))) + 1073717846) & 0xC0005EF7;
  __asm { BR              X6 }

uint64_t sub_183D81868(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v8 + 8LL * (((a6 + 1 != (((v7 ^ v6) + 359) ^ a4)) * a5) ^ v7 ^ v6)))();
}

uint64_t sub_183D81898( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_DWORD *)(a12 - 0x7A1D52918E41680LL) = -1778018903 - v16;
  int v23 = 460628867 * ((((v22 - 136) | 0x6316D9D1) - (v22 - 136) + ((v22 - 136) & 0x9CE92628)) ^ 0x2F805BAC);
  *(void *)(v22 - 12_Block_object_dispose(va, 8) = v21;
  *(_DWORD *)(v22 - 120) = v23 + v20 - 1045;
  *(_DWORD *)(v22 - 136) = 1557934080 - v23;
  sub_183DAC950((_DWORD *)(v22 - 136));
  int v24 = 535753261 * ((2 * ((v22 - 136) & 0x59E62C60) - (v22 - 136) + 639226782) ^ 0x2CEDDDB1);
  *(void *)(v22 - 136) = v21;
  *(_DWORD *)(v22 - 12_Block_object_dispose(va, 8) = v24
                         + ((32 * v18) ^ 0xF786EDC5)
                         + ((v18 << (((v20 + 20) & 0x1F) - 8)) & 0xEF0DDB80)
                         + 1249842107;
  *(_DWORD *)(v22 - 124) = v24 + v20 - 829;
  sub_183D7AE40(v22 - 136);
  *(_DWORD *)(v22 - 120) = (v20 - 910) ^ (108757529
                                        * ((((v22 - 136) | 0x8BBB1853) - ((v22 - 136) & 0x8BBB1853)) ^ 0x6B277A78));
  *(void *)(v22 - 136) = a16;
  *(void *)(v22 - 12_Block_object_dispose(va, 8) = &STACK[0x67843F9A1244BB0B];
  sub_183D7B048(v22 - 136);
  *(_DWORD *)(v22 - 136) = (v20 + 515) ^ (1374699841
                                        * (((v22 - 136) & 0x864C299C | ~((v22 - 136) | 0x864C299C)) ^ 0x1447CE6A));
  *(void *)(v22 - 12_Block_object_dispose(va, 8) = v21;
  *(void *)(v22 - 120) = a16;
  uint64_t v25 = ((uint64_t (*)(uint64_t))(*(void *)(v19 + 8LL * (v20 - 1150)) - 12LL))(v22 - 136);
  return ((uint64_t (*)(uint64_t))(*(void *)(v17
                                                      + 8LL * ((485 * (*(_DWORD *)(v22 - 132) <= 0x23F2FD9Bu)) ^ v20))
                                          - 8LL))(v25);
}

uint64_t sub_183D81AE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_DWORD *)(v19 - 120) = (v18 + 193) ^ (108757529
                                        * ((1238286458 - ((v19 - 136) | 0x49CEC07A) + ((v19 - 136) | 0xB6313F85)) ^ 0x56AD5DAE));
  *(void *)(v19 - 136) = v17;
  *(void *)(v19 - 12_Block_object_dispose(va, 8) = a16;
  uint64_t v20 = sub_183D7B048(v19 - 136);
  return (*(uint64_t (**)(uint64_t))(v16 + 8LL * ((((v18 ^ 0x3E2) - 547) * (a12 < 1)) ^ v18)))(v20);
}

uint64_t sub_183D81B84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_DWORD *)(v20 - 120) = (v16 - 541) ^ (108757529
                                        * ((((2 * (v20 - 136)) | 0xAAF27EC8) - (v20 - 136) + 713474204) ^ 0x35E55D4F));
  *(void *)(v20 - 136) = a16;
  *(void *)(v20 - 12_Block_object_dispose(va, 8) = a10;
  sub_183D7B048(v20 - 136);
  int v21 = 535753261 * ((2 * ((v20 - 136) & 0x2859B5B8) - (v20 - 136) - 676967872) ^ 0xDD52446F);
  *(_DWORD *)(v20 - 12_Block_object_dispose(va, 8) = v21 + 1107689857;
  *(_DWORD *)(v20 - 124) = v21 + v16 - 460;
  *(void *)(v20 - 136) = v17;
  sub_183D7AE40(v20 - 136);
  *(_DWORD *)(v20 - 136) = (v16 + 884) ^ (1374699841
                                        * (((v20 - 136) & 0x5473D2EE | ~((v20 - 136) | 0x5473D2EE)) ^ 0xC6783518));
  *(void *)(v20 - 12_Block_object_dispose(va, 8) = v17;
  *(void *)(v20 - 120) = a16;
  uint64_t v22 = v18(v20 - 136);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8LL
                                            * (((*(_DWORD *)(v20 - 132) > 0x23F2FD9Bu)
                                              * (((v16 ^ 0x318) + 601) ^ (v16 - 123))) | (v16 - 87))))(v22);
}

uint64_t sub_183D81D28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  return ((uint64_t (*)(void))(*(void *)(v13
                                        + 8LL
                                        * ((507
                                          * (((v14 + 168489233) & 0xF5F50F69)
                                           - 69063057
                                           + (a13 ^ 0xDDDFFE2F)
                                           + v14
                                           - 550
                                           + ((2 * a13) & 0xBBBFFC5E)
                                           + 641584943 < 0x7FFFFFFE)) ^ v14))
                            - 4LL))();
}

  ;
}

void sub_183D82974(_DWORD *a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  unsigned int v2 = 1759421093 * ((((2 * (_DWORD)a1) | 0x1851ADD4) - (_DWORD)a1 - 204003050) ^ 0xBF5566BE);
  unsigned int v3 = a1[2] + v2;
  int v4 = a1[3] ^ v2;
  unsigned int v5 = 628203409 * ((2063153396 - (v40 | 0x7AF938F4) + (v40 | 0x8506C70B)) ^ 0x78ECB38);
  int v6 = a1[8];
  uint64_t v15 = 1759421093
      * ((((2LL * (void)a1) | 0x748E849A1851ADD4LL) - (void)a1 - 0x3A47424D0C28D6EALL) ^ 0x14F9831DBF5566BELL);
  int v7 = v6 + v2;
  v40[0] = v3 + v5 + 1172345383;
  v40[2] = v5 + 1252841699;
  int v21 = &STACK[0x14F8B44E17D22A0A];
  __int128 v41 = &STACK[0x14F8B44E17D22A0A];
  sub_183DA2A04((uint64_t)v40);
  int v8 = v4;
  int v30 = v7 - 1276608807;
  int v14 = v7 - 1379428723;
  int v17 = v7 - 27460017;
  int v16 = v7 - 1006120533;
  BOOL v26 = &v37;
  v12[0] = v38;
  v12[1] = (char *)&v12[-199159300] + 6;
  unsigned int v20 = (v3 + 966632637) & 0xC6625FBE;
  int32x4_t v24 = vdupq_n_s32(0xB7085652);
  int32x4_t v25 = vdupq_n_s32(0x37085657u);
  v12[2] = (v3 - 1358924253) & 0x50FF89EC;
  int v32 = 41 * (v3 ^ 0x27);
  unsigned int v22 = (v3 + 2115499) & 0xFFDFBB2B;
  unsigned int v23 = (v32 ^ 0xFFFFFDD2) + v22;
  uint64_t v31 = v23;
  uint64_t v27 = v23;
  int v28 = (v3 - 1724975422) & 0x66D10DFF;
  unsigned int v29 = v3;
  int v18 = a1;
  uint64_t v19 = v3 ^ 0x17C;
  int v13 = v3 ^ 0x6E;
  uint64_t v9 = (char *)*(&off_189D4D580 + (int)(v3 ^ 0x6E)) - 12;
  unsigned int v10 = v8 - (((v8 << (((v3 ^ 0x7C) - 127) ^ 0xC8)) - 1493107792) & 0xFD208ADC) - 770653370;
  char v33 = (HIBYTE(v10) ^ 0xFE) - 2 * ((HIBYTE(v10) ^ 0xFE) & 0x3F) + 63;
  char v34 = (BYTE2(v10) ^ 0x90) - 2 * ((BYTE2(v10) ^ 0x90) & 0x3F) + 63;
  char v35 = (BYTE1(v10) ^ 0x45) - 2 * ((BYTE1(v10) ^ 0x45) & 0x3F) + 63;
  char v36 = (v8 - ((((_BYTE)v8 << (((v3 ^ 0x7C) - 127) ^ 0xC8)) - 80) & 0xDC) + 70) ^ 0x51;
  BOOL v11 = ((2 * (v39 & 0xF)) ^ 0x16) + (v39 & 0x3F ^ 0xF57D0FE4) + 176353269 > 0xFFFFFFBF;
  __asm { BR              X14 }

uint64_t sub_183D82D74@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, int a39, char a40)
{
  *(_BYTE *)(a6 + (v41 + v40 + 22 - 480)) = a40;
  *(_BYTE *)(a6 + (a9 - 1954285132)) = *(&a40 + (v40 - 456));
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 + 8LL * ((v40 + 22) ^ 0x3B0)) - 4LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13);
}

uint64_t sub_183D82DFC@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  *(_BYTE *)(a1 + (v6 + a2 + 1)) = *(_BYTE *)(v7 + (v5 - 750264508));
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * (v4 ^ (1987 * ((v2 - 750264507) < 4)))) - (v3 ^ 0x30)))();
}

uint64_t sub_183D82E50@<X0>( uint64_t a1@<X5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t (*a14)(uint64_t), uint64_t a15)
{
  int v19 = (v15 - 1275558120) & 0x4C07773C;
  *(_BYTE *)(a1 + (a2 + 2)) = *(_BYTE *)(v17 + (v19 ^ 0xD347DF71) + v16);
  int v20 = 3804331 * ((v18 - 168) ^ 0xFA9EF356);
  *(_DWORD *)(v18 - 16_Block_object_dispose(va, 8) = v20 + v19 + 954;
  *(_DWORD *)(v18 - 164) = v20 ^ 0x1754DCEE;
  *(void *)(v18 - 160) = a15;
  uint64_t v21 = sub_183D97840(v18 - 168);
  return a14(v21);
}

uint64_t sub_183D82ED4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34)
{
  return ((uint64_t (*)(void))(*(void *)(v34
                                        + 8LL
                                        * ((1316
                                          * (a14
                                           + ((a20 - 1096) & (2 * LODWORD(STACK[0x2D8])) ^ 0x40)
                                           + (STACK[0x2D8] & 0x3F ^ 0xFEEB5DDF) < 0xFFFFFFC0)) ^ (a34 + 863)))
                            - 4LL))();
}

uint64_t sub_183D82F70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  unsigned int v23 = v21 + 18129421;
  if (v23 <= 0x40) {
    unsigned int v23 = 64;
  }
  return ((uint64_t (*)(void))(*(void *)(v22
                                        + 8LL
                                        * (((((a19 - 1120) | 0xAA) ^ 0x83) * (-v19 - 18129421 - v20 + v23 > 0xE)) ^ a19))
                            - 4LL))();
}

uint64_t sub_183D82FE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  unsigned int v23 = v20 + v19 + 18129421;
  if (v23 <= 0x40) {
    int v24 = 64;
  }
  else {
    int v24 = v23;
  }
  BOOL v25 = __CFADD__(v23 - 1, v21 + v24);
  return ((uint64_t (*)(void))(*(void *)(v22
                                        + 8LL
                                        * ((15
}

uint64_t sub_183D83074@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  *(int8x16_t *)(a1 + (a2 - 2080459888)) = vaddq_s8(vsubq_s8(*v6, vandq_s8(vaddq_s8(*v6, *v6), v7)), v8);
  return ((uint64_t (*)(uint64_t))(*(void *)(v5
                                                      + 8LL
                                                      * (int)((((((v3 ^ 0x197) + v2) & 0x1FFFFFFF0LL) != 16)
                                                             * ((v4 ^ 0x3EB) - 399)) ^ v4 ^ 7))
                                          - 4LL))((v4 ^ 0x6367EC29LL) + (((v3 ^ 0x197) + v2) & 0x1FFFFFFF0LL));
}

void sub_183D830F4()
{
}

uint64_t sub_183D83100(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v10 = v7 + a5;
  if (v10 <= 0x40) {
    unsigned int v10 = 64;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9
                                                                                 + 8LL
                                                                                 * ((62
                                                                                   * (v8 - v5 - v6 + v10 >= (((a1 - 264) | 0x432) ^ 0x47Du))) ^ a1))
                                                                     - 12LL))( 2340682163LL,  a2,  2627211692LL,  2340682164LL);
}

uint64_t sub_183D831A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  unsigned int v30 = v27 + v26 + a5;
  if (v30 <= 0x40) {
    int v31 = 64;
  }
  else {
    int v31 = v30;
  }
  BOOL v32 = __CFADD__(v30 - 1, v28 + v31);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 + 8LL * (int)((1815 * ((v32 ^ (a17 + 123)) & 1)) ^ a17)) - ((2 * (_DWORD)a17) ^ 0x6E2u) + 1126LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26);
}

uint64_t sub_183D83208@<X0>( int a1@<W0>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, arg33_183D83208 a33)
{
  *(_OWORD *)(a2 + (a3 + a1)) = *(_OWORD *)&a33.arr[4];
  return ((uint64_t (*)(void))(*(void *)(v35 + 8LL * ((678 * (((v34 + 1) & 0x1FFFFFFF0LL) - a12 == -312)) ^ v33)) - 4LL))();
}

uint64_t sub_183D8325C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_OWORD *)(a6 + (v8 + v9)) = *(_OWORD *)(a5 + v9);
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * (((v7 == v9) * v10) ^ v6)) - 4LL))();
}

uint64_t sub_183D83288( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 + 8LL * (v28 | (643 * (v26 == v27)))) - ((5 * (v28 ^ 0x14B)) ^ 0x47Du) + 1126LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26);
}

uint64_t sub_183D832E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, unint64_t a29)
{
  int v51 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 8LL * v29);
  int v34 = STACK[0x2E0];
  int v35 = STACK[0x2E0];
  int v36 = STACK[0x2E4];
  int v37 = STACK[0x2E8];
  int v38 = STACK[0x2E4];
  int v39 = STACK[0x2E8];
  uint64_t v40 = LOBYTE(STACK[0x2F4]) ^ 0x2Bu;
  if ((_DWORD)v40 == 2)
  {
    uint64_t v45 = (a2 + 1249);
    uint64_t v46 = (a2 - 52);
    uint64_t v47 = v46 | 0x540;
    BOOL v49 = (unint64_t)&STACK[0x294] < a29 && v30 < (unint64_t)&STACK[0x2D4];
    unsigned int v50 = (uint64_t (*)(uint64_t, void, uint64_t, uint64_t, unint64_t *, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 + 8LL * (int)((a2 + 1195) ^ (458 * v49))) - ((v47 - 39) ^ v45));
    return v50( v46,  LODWORD(STACK[0x2EC]),  v47,  v45,  &STACK[0x294],  v50,  1655471129LL,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27);
  }

  else if ((_DWORD)v40 == 1)
  {
    int v41 = a2 + 714;
    BOOL v43 = (unint64_t)&STACK[0x294] < a29 && v30 < (unint64_t)&STACK[0x2D4];
    return (*(uint64_t (**)(uint64_t))(v32 + 8LL * ((HIDWORD(a22) * v43) ^ v41)))(1655471129LL);
  }

  else
  {
    LODWORD(STACK[0x2DC]) = 2 * (LODWORD(STACK[0x2DC]) ^ v31) + v31 - (v33 & (4 * (LODWORD(STACK[0x2DC]) ^ v31)));
    LODWORD(STACK[0x2E0]) = (v35 ^ v31) + (v34 ^ v31) + v31 - (v33 & (2 * ((v35 ^ v31) + (v34 ^ v31))));
    LODWORD(STACK[0x2E4]) = (v38 ^ v31) + (v36 ^ v31) + v31 - (v33 & (2 * ((v38 ^ v31) + (v36 ^ v31))));
    LODWORD(STACK[0x2E8]) = (v39 ^ v31) + (v37 ^ v31) + v31 - (v33 & (2 * ((v39 ^ v31) + (v37 ^ v31))));
    return v51( v40,  a2,  a3,  43LL,  &STACK[0x294],  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27);
  }

uint64_t sub_183D8411C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, int a30, uint64_t a31, int a32, unsigned int a33)
{
  else {
    BOOL v34 = a30 - 1546806268 > a33;
  }
}

uint64_t sub_183D841B0( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL * (a8 ^ (487 * (v8 + a3 + 63 < (v8 + a3)))))
                            - ((a8 + 831064329) & 0xCE76F2EC)
                            + 232LL))();
}

uint64_t sub_183D841F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)(a6 + v7) = *(_BYTE *)(v11 + (v6 + a3))
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * (((v7 == 63) * v9) ^ v8)) - 12LL))();
}

uint64_t sub_183D84240( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int8x16_t *a6, uint64_t a7, int a8)
{
  *a6 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v12 + (v8 + a3)),  vandq_s8( vaddq_s8(*(int8x16_t *)(v12 + (v8 + a3)), *(int8x16_t *)(v12 + (v8 + a3))),  v13)),  v14);
}

uint64_t sub_183D842A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34)
{
  BOOL v35 = ((((_DWORD)a2 + 354) | 0x49) ^ 0xD347DEA2) + a34 > 0xFFFFFFFA;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34
                                                                       + 8LL * ((2 * v35) | (8 * v35) | ((int)a2 + 892))))( a1,  a2,  a3,  a4);
}

void sub_183D84300()
{
}

uint64_t sub_183D8432C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  BOOL v19 = a16 < 0x51AA098E;
  return (*(uint64_t (**)(void))(v18 + 8LL * ((79 * !v19) ^ v17)))();
}

uint64_t sub_183D84398@<X0>( unsigned int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, int a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, char a7@<W6>, int a8@<W8>)
{
  BOOL v14 = a2 < a1;
  *(_BYTE *)(a6 + (a8 + v11)) = *(_BYTE *)(v13 + (v8 + a3))
                                            + (a7 ^ a5)
                                            - 2 * (*(_BYTE *)(v13 + (v8 + a3)) & 0x3F);
  unsigned int v15 = v8 + 1 + v10;
  int v16 = v14 ^ (v15 < a1);
  BOOL v17 = v15 < a2;
  if (!v16) {
    BOOL v14 = v17;
  }
  return (*(uint64_t (**)(void))(v12 + 8LL * ((!v14 * a4) ^ v9)))();
}

uint64_t sub_183D843FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, unsigned int a32)
{
  int v38 = 10 * (a7 ^ 0x5F9);
  int v34 = 3804331 * ((~((v33 - 168) | 0x6760E8E7) + ((v33 - 168) & 0x6760E8E7)) ^ 0x6201E44E);
  *(void *)(v33 - 160) = a21;
  *(_DWORD *)(v33 - 16_Block_object_dispose(va, 8) = v34 + a7 - 362;
  *(_DWORD *)(v33 - 164) = v34 ^ a15;
  uint64_t v35 = sub_183D97840(v33 - 168);
  uint64_t v36 = STACK[0x2D8] & 0x3F;
  *((_BYTE *)&STACK[0x294] + (v36 ^ 0x2B)) = -65;
  return ((uint64_t (*)(uint64_t, void, uint64_t))(*(void *)(v32
                                                                       + 8LL
                                                                       * ((7 * ((v36 ^ 0x2B) <= v38 - 1555)) ^ a7))
                                                           - 12LL))( v35,  a32,  2627211692LL);
}

uint64_t sub_183D844FC()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((482 * (v0 + ((v1 + 98162634) & 0xFA262EB7 ^ 0xA1088BE4) < 0x38)) ^ (v1 + 673)))
                            - 8LL))();
}

uint64_t sub_183D84558@<X0>(int a1@<W8>)
{
  uint64_t v4 = v1;
  unint64_t v5 = (a1 ^ 0x682u ^ (unint64_t)(v2 + 20)) + v1;
  if (v5 <= 0x38) {
    unint64_t v5 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
}

uint64_t sub_183D845C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(a10 + v12) = v15;
  return ((uint64_t (*)(void))(*(void *)(v14 + 8LL * ((((v11 & 0xFFFFFFFFFFFFFFF8LL) == 8) * v13) ^ v10))
}

uint64_t sub_183D84600()
{
  *unsigned int v1 = v6;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (((v3 == 0) * v4) ^ v0)) - v2 + 713))();
}

uint64_t sub_183D84628()
{
}

uint64_t sub_183D84678@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 + v5 + a1 - 1) = v3;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((((unint64_t)(a2 + v5) < 0x38) * v4) ^ (v2 + 673))) - 8LL))();
}

void sub_183D846A8(uint64_t a1, char a2, uint64_t a3, int a4)
{
  int v4 = LOBYTE(STACK[0x2F4]) ^ a4;
  if (v4 == 1)
  {
    char v5 = a2 + 76;
    unsigned int v11 = STACK[0x2D8];
    unsigned int v12 = STACK[0x2D4];
    char v13 = (LODWORD(STACK[0x2D8]) >> 5) ^ 0x35;
    LOBYTE(STACK[0x2CC]) = ((a2 + 76) ^ (8 * LOBYTE(STACK[0x2D8])) ^ 0xD8)
                         - ((2 * ((a2 + 76) ^ (8 * LOBYTE(STACK[0x2D8])) ^ 0xD8)) & 0x70)
                         + 63;
    LOBYTE(STACK[0x2CD]) = v13 - 2 * (v13 & 0x3F) + 63;
    LOBYTE(STACK[0x2CE]) = ((v11 >> 13) ^ 0xA4) + (~(2 * ((v11 >> 13) ^ 0xA4)) | 0x81) + 64;
    LOBYTE(STACK[0x2CF]) = ((v11 >> 21) ^ 0x78) - 2 * (((v11 >> 21) ^ 0x78) & 0x3F) + 63;
    HIDWORD(v14) = v12 ^ 0xC;
    LODWORD(v14) = v11 ^ 0xA0000000;
    LOBYTE(STACK[0x2D0]) = (v14 >> 29) - 2 * ((v14 >> 29) & 0x3F) + 63;
    LOBYTE(STACK[0x2D1]) = ((v12 >> 5) ^ 0x57) - 2 * (((v12 >> 5) ^ 0x57) & 0x3F) + 63;
    LOBYTE(STACK[0x2D2]) = ((v12 >> 13) ^ 0xB7) - 2 * (((v12 >> 13) ^ 0xB7) & 0x3F) + 63;
    unsigned int v9 = (v12 >> 21) ^ 0xFFFFFFE6;
    char v10 = 126;
  }

  else
  {
    if (v4 != 2) {
      goto LABEL_6;
    }
    char v5 = a2 ^ 0xB4;
    unsigned int v9 = STACK[0x2D4];
    unsigned int v6 = STACK[0x2D8];
    LOBYTE(STACK[0x2CC]) = ((LODWORD(STACK[0x2D4]) >> 21) ^ 0xE6)
                         - 2 * (((LODWORD(STACK[0x2D4]) >> 21) ^ 0xE6) & 0x3F)
                         + 63;
    char v7 = a2 ^ 0xB4 ^ (v9 >> 13) ^ 0x37;
    LOBYTE(STACK[0x2CD]) = v7 - 2 * (v7 & 0x3F) + 63;
    LOBYTE(STACK[0x2CE]) = ((v9 >> 5) ^ 0x57) - 2 * (((v9 >> 5) ^ 0x57) & 0x3F) + 63;
    HIDWORD(v_Block_object_dispose(va, 8) = v9 ^ 0xC;
    LODWORD(v_Block_object_dispose(va, 8) = v6 ^ 0xA0000000;
    LOBYTE(STACK[0x2CF]) = (v8 >> 29) - 2 * ((v8 >> 29) & 0x3F) + 63;
    LOBYTE(STACK[0x2D0]) = ((v6 >> 21) ^ 0x78) - 2 * (((v6 >> 21) ^ 0x78) & 0x3F) + 63;
    LOBYTE(STACK[0x2D1]) = ((v6 >> 13) ^ 0xA4) - 2 * (((v6 >> 13) ^ 0xA4) & 0x3F) + 63;
    LOBYTE(STACK[0x2D2]) = ((v6 >> 5) ^ 0x35) - 2 * (((v6 >> 5) ^ 0x35) & 0x3F) + 63;
    LOBYTE(v9) = (8 * v6) ^ 0x58;
    char v10 = 112;
  }

  LOBYTE(STACK[0x2D3]) = ((v5 - 76) ^ 0xB) + v9 - (v10 & (2 * v9));
LABEL_6:
  JUMPOUT(0x183D8345CLL);
}

uint64_t sub_183D84A44()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
}

uint64_t sub_183D84A80@<X0>(int a1@<W8>)
{
  LOBYTE(STACK[0x294]) = *(_BYTE *)(v3 + v2);
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL * (((v1 - 750264509 >= ((a1 - 443) | 0x1D1u) - 475) * (a1 - 435)) ^ a1))
                            - 4LL))();
}

void sub_183D84ACC()
{
}

uint64_t sub_183D84AF4( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
  if (a33 == 2) {
    return (*(uint64_t (**)(unint64_t *))(v37
  }
                                                         + 8LL
                                                         * ((28 * (LODWORD(STACK[0x2F0]) != a2 + 356758221)) ^ (a2 + 982))))(&STACK[0x284]);
  if (a33 == 1) {
    return (*(uint64_t (**)(unint64_t *))(v37
  }
                                                         + 8LL
                                                         * (((LODWORD(STACK[0x2F0]) != 356758273) * (a2 ^ 0x1AB)) ^ (a2 + 982))))(&STACK[0x284]);
  uint64_t v39 = (a2 + 5) | 0x440u;
  unint64_t v40 = ((unint64_t)&a37 ^ 0x7FB56FFFFFFDF1AELL ^ v39)
      + ((2LL * (void)&a37) & 0xFF6ADFFFFFFBEBA0LL)
      - 0x4591020409098FD7LL;
  LOBYTE(STACK[0x2EF]) = (v40 ^ 0xBA) * (v40 + 17);
  return ((uint64_t (*)(unint64_t *))(*(void *)(v37
                                                                 + 8LL
                                                                 * (int)((473
}

void sub_183D84E34()
{
}

uint64_t sub_183D84E40@<X0>(void *a1@<X0>, int a2@<W8>)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = *v2;
  memset(a1, 63, 16);
  int v6 = 235795823 * (((v3 - 168) & 0x4A404AB8 | ~((v3 - 168) | 0x4A404AB8)) ^ 0x2112FC1E);
  *(void *)(v3 - 12_Block_object_dispose(va, 8) = &STACK[0x17594DE9181848C7];
  *(_DWORD *)(v3 - 160) = v6 + 1126269761;
  *(void *)(v3 - 16_Block_object_dispose(va, 8) = v4;
  *(_DWORD *)(v3 - 132) = (a2 + 1725) ^ v6;
  *(void *)(v3 - 152) = &v8;
  *(void *)(v3 - 144) = v5;
  uint64_t result = ((uint64_t (*)(uint64_t))((char *)*(&off_189D4D580 + a2 + 43) - 4))(v3 - 168);
  *((_DWORD *)v2 + 7) = *(_DWORD *)(v3 - 136);
  return result;
}

uint64_t sub_183D84F34(_DWORD *a1)
{
  unsigned int v1 = 1374699841 * ((-2 - ((a1 | 0xA88133EE) + (~(_DWORD)a1 | 0x577ECC11))) ^ 0x3A8AD418);
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + (int)((*a1 ^ v1) - 1113))
                                        + 8
                                        * (int)((((a1[4] ^ v1 ^ 0xB7085652) - 1 < 0x63)
                                               * ((((*a1 ^ v1) + 89) ^ 0x1F2) - 1199)) ^ *a1 ^ v1)
                                        - 12)
                            - 4LL))();
}

uint64_t sub_183D84FD0@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(*(void *)(result + 8) - 0x6A4735A87A2643E5LL) = (a2 ^ 0x48F7A9AD)
                                                              - ((((v2 + 923805863) & 0xC8EFD6FF) + 1846585329) & (2 * (a2 ^ 0x48F7A9AD) + 2147398450))
                                                              - 1224232981;
  return result;
}

void sub_183D850A8(uint64_t a1)
{
  BOOL v4 = *(void *)(a1 + 24) != 0x749AC022234F284ALL
    && *(void *)(a1 + 8) != 0x15227257BF786DCCLL
    && *(void *)(a1 + 40) != 0x3AC75C5FABFFD319LL;
  int v1 = *(_DWORD *)a1 - 1224239923 * ((-2 - ((~(_DWORD)a1 | 0x50890EB9) + (a1 | 0xAF76F146))) ^ 0xA23AF36E);
  __asm { BR              X9 }

uint64_t sub_183D851C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 8LL * ((1111 * (*(_DWORD *)(a8 - 0x749AC022234F2832LL) == ((v9 + 336) ^ 0xB70857C1))) ^ v9))
                                                                                                - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  3070776914LL);
}

uint64_t sub_183D85210@<X0>( uint64_t a1@<X0>, uint64_t a2@<X7>, int a3@<W8>, __n128 a4@<Q0>, __n128 a5@<Q1>, __n128 a6@<Q2>, __n128 a7@<Q3>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int v18 = (v15 - 264) | 0x160;
  else {
    int v19 = 1378892594;
  }
  v20.n128_u64[0] = 0x7E7E7E7E7E7E7E7ELL;
  v20.n128_u64[1] = 0x7E7E7E7E7E7E7E7ELL;
  v21.n128_u64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v21.n128_u64[1] = 0x3F3F3F3F3F3F3F3FLL;
  unsigned int v22 = *(_DWORD *)(a2 - 0x749AC022234F283ALL) + 779119933;
  BOOL v23 = v22 < v18 + 990168853;
  if (v22 >= v18 + 990168853) {
    BOOL v23 = v22 > 0x3B04C900;
  }
  *(_DWORD *)(v17 - 14_Block_object_dispose(va, 8) = 2094188121;
  *(_DWORD *)(v17 - 144) = v19;
  return v24(a1, 3127124125LL, a4, a5, a6, a7, v20, v21);
}

uint64_t sub_183D854DC()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (v0 - 60)) - 8LL))((((v0 + 205) | 0x64u) + 536870540) & *(_DWORD *)(v2 - 140));
}

uint64_t sub_183D86180( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  *(_BYTE *)(*v23 + (v20 + v24)) = -65;
  if ((v20 + 1408859373) < 0x956FF170 != a20 - 1914349656 < ((v21 + 1121903266) & 0xBD211C73)
                                                                         - 1787825875)
    BOOL v25 = a20 - 1914349656 < ((v21 + 1121903266) & 0xBD211C73) - 1787825875;
  else {
    BOOL v25 = v20 + 1408859373 < (a20 - 1914349656);
  }
  return ((uint64_t (*)(void))(*(void *)(v22 + 8LL * ((157 * v25) ^ v21)) - 4LL))();
}

uint64_t sub_183D86210()
{
  BOOL v10 = v4 < v5;
  *(_BYTE *)(*v8 + (v9 + v1 + 1)) = 63;
  unsigned int v11 = v2 + v1 + 1;
  int v12 = v10 ^ (v11 < v0);
  BOOL v13 = v11 < v4;
  if (!v12) {
    BOOL v10 = v13;
  }
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((v10 * v6) ^ v3)) - 4LL))();
}

void sub_183D86274(uint64_t a1@<X7>, int a2@<W8>)
{
  *(void *)(v5 - 0x15227257BF786DCCLL) = *v2;
  *(_DWORD *)(v6 - 0x3AC75C5FABFFD319LL) = a2;
  void *v2 = 0LL;
  *(void *)(a1 - 0x749AC022234F2842LL) = 0x60484F9360484F93LL;
  *unsigned int v4 = 211049411;
  unsigned int v3 = ((*(_DWORD *)(a1 - 0x749AC022234F2836LL) & 0xFFFFFFFE ^ 0x9C42F98A)
      - ((2 * (*(_DWORD *)(a1 - 0x749AC022234F2836LL) & 0xFFFFFFFE ^ 0x9C42F98A)) & 0xF9935E10)
      + 2093592328) ^ 0xBDE92DA8;
  *(_DWORD *)(a1 - 0x749AC022234F2836LL) = ((v3 | 0xF1EDDE6) - (v3 | 0xF0E12219) - 253681127) ^ 0x527CA6CC;
  *(_DWORD *)(v8 + 4_Block_object_dispose(va, 8) = *v7;
}

void sub_183D863AC()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  if (*(void *)v0) {
    BOOL v2 = *(void *)(v0 + 16) == 0x3F0B617C4F927BF5LL;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  int v1 = *(_DWORD *)(v0 + 24) + 1374699841 * ((~(_DWORD)v0 & 0x2CB30A96 | v0 & 0xD34CF569) ^ 0x4147129F);
  __asm { BR              X8 }

void sub_183D864C8()
{
  *(_DWORD *)(v1 + _Block_object_dispose(va, 8) = v0 | 4;
}

uint64_t sub_183D864D0()
{
  STACK[0x210] = v0;
  STACK[0x270] = (unint64_t)&STACK[0x4F9B0BF234890AED];
  *(void *)(v4 - 184) = &STACK[0x4F9B0BF234890AED];
  STACK[0x268] = (unint64_t)&STACK[0x41D57A3C79D93C43];
  *(void *)(v4 - 16_Block_object_dispose(va, 8) = &STACK[0x41D57A3C79D93C43];
  *(_DWORD *)(v4 - 192) = (v1 - 75) ^ (1224239923
                                     * ((v4 - 192 - 2 * ((v4 - 192) & 0x45CC53C4) + 1171018692) ^ 0xB77FAE13));
  *(_BYTE *)(v4 - 160) = (51 * ((v4 + 64 - 2 * ((v4 + 64) & 0xC4) - 60) ^ 0x13)) ^ 0x7A;
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v2 + 8LL * (v1 ^ 0x281));
  STACK[0x260] = (unint64_t)v5;
  uint64_t v6 = v5(v4 - 192);
  int v7 = *(_DWORD *)(v4 - 176);
  LODWORD(STACK[0x50C]) = v7;
  return ((uint64_t (*)(uint64_t))(*(void *)(v3
                                                      + 8LL
                                                      * ((247 * (v7 == ((v1 + 1223) ^ 0xB708538D) + v1 - 308)) ^ v1))
                                          - 12LL))(v6);
}

#error "183D86CBC: call analysis failed (funcsize=301)"
uint64_t sub_183D86CC0( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  ++*(_DWORD *)(a4 + 52);
  unsigned int v11 = (((v8 ^ 0xADu) + 1525) ^ 0xFFFFFFFFFFFFF0CELL) + v9;
  STACK[0x3C0] = v11;
  STACK[0x4D0] = v11;
  LODWORD(STACK[0x50C]) = a8;
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((432 * (STACK[0x590] != 0)) ^ v8)) - 4LL))();
}

uint64_t sub_183D86D20()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * (((v1 - 552049643 >= ((17 * (v0 ^ 0x643)) ^ 0xDFu)) * (v0 ^ 0x654)) ^ v0)))();
}

uint64_t sub_183D86D6C()
{
  STACK[0x470] = 0LL;
  int v4 = 235795823 * ((2 * ((v3 - 192) & 0xED72FD0) - (v3 - 192) + 1898500137) ^ 0xE5859970);
  *(_DWORD *)(v3 - 16_Block_object_dispose(va, 8) = v4 + v0 - 522;
  *(_DWORD *)(v3 - 184) = -1575466760 - v4;
  *(void *)(v3 - 192) = 0x65189E6E3DC2AB9BLL;
  *(void *)(v3 - 176) = STACK[0x278];
  *(void *)(v3 - 160) = STACK[0x280];
  uint64_t v5 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 8LL * (v0 - 563)) - 8LL);
  STACK[0x290] = (unint64_t)v5;
  uint64_t v6 = v5(v3 - 192);
  return ((uint64_t (*)(uint64_t))(*(void *)(v2
                                                      + 8LL
                                                      * (((*(_DWORD *)(v3 - 152) == -1224190382)
                                                        * (((v0 - 615) | 0x80) ^ 0xDF)) ^ v0))
                                          - 8LL))(v6);
}

uint64_t sub_183D86E44()
{
  STACK[0x250] = v1;
  BOOL v3 = LODWORD(STACK[0x56C]) - 1534816591 < (((v0 - 692) | 0x8D) ^ 0xFFFFF762);
}

uint64_t sub_183D86E9C()
{
  BOOL v3 = (unsigned int *)STACK[0x2C8];
  ((void (*)(void, unint64_t *, uint64_t))STACK[0x2D0])( *(unsigned int *)STACK[0x2C8],  &STACK[0x578],  2048LL);
  int v4 = (uint64_t (*)(void))(*(void *)(v2
                                     + 8LL
                                     * (((((unsigned int (*)(void, unint64_t *, void, uint64_t))*(&off_189D4D580 + (v0 ^ 0x50)))( *v3,  &STACK[0x3E8],  (LODWORD(STACK[0x56C]) + v1),  1LL) == ((v0 - 128) ^ 0x1D))
                                       * (((v0 - 128) | 0xC0) ^ 0x620)) ^ v0))
                         - 4LL);
  return v4();
}

uint64_t sub_183D86F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  STACK[0x578] = STACK[0x3E8];
  unsigned int v7 = LODWORD(STACK[0x56C]) - ((2 * LODWORD(STACK[0x56C]) + 1225338212) & 0x8CC14DC2) - 354075245;
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((94
                                          * (((89 * ((((v5 ^ 0x306) - 722) | 0x94) ^ 0xD4) + 1987009213) & (2 * v7) ^ 0x4414DC2)
                                           + (v7 ^ 0x7D57080E)
                                           - 134555148 != a5)) ^ ((((v5 ^ 0x306) - 722) | 0x94) - 64)))
                            - 4LL))();
}

uint64_t sub_183D8783C()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((30 * (v1 + v0 + ((v2 - 793) | 0xD5u) - 993504398 - 830 < 8)) | v2)))();
}

uint64_t sub_183D87894@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v3 + 8LL * (v2 ^ (1718 * ((unint64_t)(v1 - a1) > 0x1F)))))();
}

uint64_t sub_183D878BC()
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((54 * (v0 >= ((v1 - 610) ^ 0x517u) - 1450)) ^ (v1 + 146))))();
}

uint64_t sub_183D878F0@<X0>(uint64_t a1@<X8>)
{
  unsigned int v7 = v4 - 993505008 + v3;
  uint64_t v8 = v1 + v7;
  __int128 v9 = *(_OWORD *)(v8 - 31);
  uint64_t v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = *(_OWORD *)(v8 - 15);
  *(_OWORD *)(v10 - 31) = v9;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * ((1164 * ((v2 & 0xFFFFFFE0) == 32)) ^ (v5 + 132)))
}

void sub_183D87950()
{
}

uint64_t sub_183D8795C(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((92 * (((v1 == v2) ^ (a1 + 19)) & 1)) ^ a1))
}

uint64_t sub_183D87994(uint64_t a1, int a2)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((((a2 ^ 0x55A) - 1261) ^ 0xD8) * ((v2 & 0x18) != 0)) ^ a2)) - 4LL))();
}

uint64_t sub_183D879C8@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 - 7 + (v4 - 993505008 + v3 - v5)) = *(void *)(v1
                                                                             - 7
                                                                             + (v4 - 993505008 + v3 - v5));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((935 * (v5 - (v2 & 0xFFFFFFF8) == -8)) ^ v6))
                            - 277 * (v6 ^ 0x5C9u)
                            + 827LL))();
}

void sub_183D87A34()
{
}

uint64_t sub_183D87A40(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8LL * (int)((((17 * ((v2 - 818) & 0xFFFFFF2F)) ^ 0x668) * (v1 == a1)) ^ v2)))();
}

uint64_t sub_183D87A78@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W6>, uint64_t a4@<X8>)
{
  *(_BYTE *)(a4 + (v5 + a2)) = *(_BYTE *)(v4 + (v5 + a2));
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (((v5 - 1 == a1) * a3) ^ (v6 + 18))) - 4LL))();
}

uint64_t sub_183D87AAC()
{
  int v2 = (uint64_t (*)(void))(*(void *)(v1 + 8LL * ((v0 + 1069) | ((STACK[0x470] != 0) << 6))) - 4LL);
  STACK[0x2C0] = (unint64_t)*(&off_189D4D580 + (v0 ^ 0x3F));
  return v2();
}

uint64_t sub_183D87AF0()
{
  uint64_t v5 = v0();
  LODWORD(STACK[0x540]) = v2;
  return ((uint64_t (*)(uint64_t))(*(void *)(v4 + 8LL * ((v1 + 443) | v3 ^ 1 | (2 * (v3 ^ 1))))
                                          - (v1 ^ 0x2F0u)
                                          + 549LL))(v5);
}

uint64_t sub_183D87B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  LODWORD(STACK[0x540]) = v8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 8LL * ((v7 + 443) | v9 ^ 1 | (2 * (v9 ^ 1)))) - (v7 ^ 0x2F0u) + 549LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  3070776914LL);
}

uint64_t sub_183D87BB0()
{
  LODWORD(STACK[0x3F0]) = 2;
  STACK[0x440] = 0LL;
  LODWORD(STACK[0x4CC]) = 0;
  LODWORD(STACK[0x5AC]) = 0;
  return (*(uint64_t (**)(void))(v2 + 8LL * (int)((((v0 + 82) ^ 0x5FE) * ((v1 >> 1) & 1)) ^ v0)))();
}

uint64_t sub_183D87BEC@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, int a45, int a46, uint64_t a47)
{
  *(_DWORD *)(STACK[0x330] + 360) = 552049644;
  uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t *, unint64_t, void, uint64_t, unint64_t *, unint64_t *))(v50 + 8LL * ((a1 ^ 0x2A2) & 0x60B90069)))( v49,  2LL,  &STACK[0x3F0],  STACK[0x578],  (v48 - 1534814542),  v47,  &STACK[0x440],  &STACK[0x4CC]);
  int v57 = ((2 * v53) & 0xFFEFF7FA) + (v53 ^ 0xFFF7FBFD);
  uint64_t v58 = 110LL;
  if (v57 == 267910144)
  {
    LODWORD(STACK[0x540]) = 1224150378;
    unint64_t v65 = STACK[0x3C8];
  }

  else
  {
    if (v57 == -525315)
    {
      int v59 = 213 * (STACK[0x3C8] ^ 0xDE);
      STACK[0x340] = STACK[0x440];
      LODWORD(STACK[0x338]) = STACK[0x4CC];
      STACK[0x2A0] = STACK[0x250] + 2304;
      uint64_t v60 = (v59 + 1837260144) & 0x927DA3F4;
      LODWORD(STACK[0x51C]) = 1870597684;
      unint64_t v61 = STACK[0x3C0];
      unint64_t v62 = (unint64_t)&STACK[0x630] + STACK[0x3C0] - 0x42211A1EEA155E55LL;
      STACK[0x288] = STACK[0x3C0] + 4144;
      STACK[0x4D0] = v61 + 4144;
      *(void *)unint64_t v62 = 0x6370646600LL;
      *(_BYTE *)(v62 + _Block_object_dispose(va, 8) = 1;
      STACK[0x218] = v62;
      STACK[0x3B8] = STACK[0x588];
      STACK[0x368] = v62 + 1712 + ((v60 - 964) & (16 * (v62 + 1712) + 16)) + 16;
      STACK[0x370] = v62 + 9;
      STACK[0x378] = *(void *)(v50 + 8LL * ((int)v60 - 970));
      STACK[0x3A0] = *(void *)(v50 + 8LL * (int)(v60 ^ 0x35B));
      STACK[0x398] = *(void *)(v50 + 8LL * ((int)v60 - 952)) - 4LL;
      return v63((__n128)0);
    }

    unint64_t v65 = STACK[0x3C8];
    int v66 = STACK[0x3C8] + 982;
    int v67 = 1374699841 * ((159245090 - ((v52 - 192) | 0x97DE322) + ((v52 - 192) | 0xF6821CDD)) ^ 0x9B7604D4);
    *(void *)(v52 - 184) = a47;
    *(_DWORD *)(v52 - 176) = (v57 - 2 * (((_BYTE)v57 + 3) & 8 ^ (v57 + 525315) & a46) - 1223665067) ^ v67;
    *(_DWORD *)(v52 - 192) = v66 ^ v67;
    uint64_t v53 = sub_183D84F34((_DWORD *)(v52 - 192));
  }

  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, unint64_t *, unint64_t *, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 8LL * ((123 * (((v65 ^ 0x4ED ^ (STACK[0x440] == 0)) & 1) == 0)) ^ ((int)v65 + 851))))( v53,  STACK[0x440],  v54,  STACK[0x330],  v58,  v55,  v56,  3070776914LL,  &STACK[0x4C4],  &STACK[0x4A4],  &STACK[0x484],  &STACK[0x5AC],  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19);
}

uint64_t sub_183D8BEA0@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  int v3 = a2 + 190;
  uint64_t v4 = ((uint64_t (*)(void, uint64_t, void))STACK[0x2D0])( *(unsigned int *)STACK[0x2C8],  a1,  LODWORD(STACK[0x4CC]));
  return ((uint64_t (*)(uint64_t))(*(void *)(v2
                                                      + 8LL
                                                      * ((683
                                                        * ((((v3 - 1018) ^ (LODWORD(STACK[0x540]) == -1224190382)) & 1) == 0)) ^ v3))
                                          - ((13 * (v3 ^ 0x4FFu)) ^ 0xD5LL)))(v4);
}

uint64_t sub_183D8BF8C(unint64_t a1)
{
  STACK[0x4D0] = (((v1 - 556) | 0x50u) ^ 0xFFFFFFFFFFFFFC08LL) + STACK[0x338];
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8LL * ((v1 - 523) ^ (113 * (v2 <= a1))));
  STACK[0x488] = a1;
  return v4();
}

uint64_t sub_183D8C04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, char a8)
{
  uint64_t v19 = (v12 + a6);
  uint64_t v20 = ((v11 + v15) & v16 ^ a7) & v19;
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(v10 + v20) ^ *(_BYTE *)(v9 + v20) ^ *(_BYTE *)(v20 + v8 + 2) ^ (v20 * a8) ^ ((*(_BYTE *)(v17 + v19) ^ 6) + ((2 * *(_BYTE *)(v17 + v19)) & 0xC) - 31);
  return (*(uint64_t (**)(void))(v18 + 8LL * (((v12 - 1 == v14) * v13) ^ v11)))();
}

uint64_t sub_183D8C0BC(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, char a8)
{
  int v16 = (v11 + a3) & a4;
  char v17 = ((v11 + a3) & a4 ^ (v13 - 60)) + v12;
  return (*(uint64_t (**)(void))(v15 + 8LL * ((((v12 + v13) > 0x14F) * a5) ^ v11)))();
}

uint64_t sub_183D8C124@<X0>( unint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, int8x16_t a35)
{
  uint64_t v37 = (int8x16_t *)((char *)&STACK[0x630] + STACK[0x338] - 0x42211A1EEA1567D5LL);
  v37[-12] = veorq_s8(*v35, a35);
  STACK[0x5D0] += 32LL;
  STACK[0x5D8] = a1;
  STACK[0x5E0] = a1;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 + 8LL * (a6 ^ (1456 * (&v37[-12] == (int8x16_t *)a1))))
                                                                                                - (a6 - 586)
                                                                                                + 397LL))( a1,  251LL,  a2,  a3,  a4,  a5);
}

uint64_t sub_183D8C19C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  int v61 = (a3 - 1361911304) & 0x512D1BBD;
  unint64_t v62 = (char *)&STACK[0x18D0] + v57;
  char v63 = *(_BYTE *)a1;
  *(void *)(v62 + 17) = *(void *)(a1 + 1);
  *(_DWORD *)(v62 + 25) = *(_DWORD *)(a1 + 9);
  *(_WORD *)(v62 + 29) = *(_WORD *)(a1 + 13);
  v62[31] = *(_BYTE *)(a1 + 15);
  uint64_t v64 = *(void *)(a1 + 8);
  *(void *)unint64_t v62 = *(void *)a1;
  *((void *)v62 + 1) = v64;
  v62[16] = v63;
  unint64_t v65 = (unsigned __int8 *)&STACK[0x18D0] + v57 + 16;
  int v66 = (v61 - 1995131583) & 0x76EB4FAF;
  uint64_t v67 = *(void *)(v59 + 8LL * (v61 - 265)) - 12LL;
  unsigned __int8 v68 = (*((_BYTE *)&STACK[0x18D0] + v57 + 19) ^ 0xB8)
      + *(_BYTE *)(v67 + (*((_BYTE *)&STACK[0x18D0] + v57 + 19) ^ 0xD6 ^ ((_BYTE)v61 + 65) & 0xAFu))
      - 55;
  uint64_t v69 = *(void *)(v59 + 8LL * (v61 ^ 0x145)) - 12LL;
  uint64_t v70 = *(void *)(v59 + 8LL * (v61 - 343));
  LOBYTE(v64) = *(_BYTE *)(v70 + (*((unsigned __int8 *)&STACK[0x18D0] + v57 + 30) ^ 0x86LL));
  char v71 = *(_BYTE *)(v70 + (*((unsigned __int8 *)&STACK[0x18D0] + v57 + 26) ^ 0xCBLL));
  uint64_t v72 = *(void *)(v59 + 8LL * (v61 - 180)) - 8LL;
  unsigned int v73 = *(unsigned __int8 *)(v72 + (*((unsigned __int8 *)&STACK[0x18D0] + v57 + 17) ^ 0x1ALL));
  int v74 = (v73 >> 1) ^ (((((v73 ^ 0xE2) + (v73 & 0xD5 ^ 0x3F) + 1) ^ v73 & 0xDF) & 0xF0) >> 4) ^ 0x1A;
  int v75 = v68 | ((v73 ^ 0x59 ^ (v74 - ((2 * v74) & 0xF0) + 120)) << 16);
  int v76 = (((*(unsigned __int8 *)(v69 + (v65[8] ^ 0x65LL)) + (v65[8] ^ 0x34) - 91) ^ 0xF5) << 24) | (((v71 ^ (16 * ~v71)) ^ 0x28) << 8) | ((v65[11] ^ 0x3E) + *(_BYTE *)(v67 + (v65[11] ^ 0xD2LL)) - 55);
  LOBYTE(v73) = *(_BYTE *)(v70 + (v65[6] ^ 0x2ELL));
  unsigned int v77 = *(_BYTE *)(v72 + (v65[13] ^ 0x5BLL)) ^ 0x37;
  unsigned int v78 = ((v65[7] ^ 0x90) + *(_BYTE *)(v67 + (v65[7] ^ 0x7CLL)) - 55) | ((((v65[4] ^ 0x13)
  int v79 = *(unsigned __int8 *)(v72 + (v65[13] ^ 0x5BLL)) ^ 0x37 ^ (v77 >> 4) ^ (v77 >> 1);
  LODWORD(v64) = (((v64 ^ (16 * ~(_BYTE)v64)) ^ 0xE4) << 8) | ((v79
                                                                                                - ((2 * v79) & 0x2E)
                                                                                                + 23) << 16);
  int v80 = v75 | (((*(unsigned __int8 *)(v69 + (*v65 ^ 0x81LL)) + (*v65 ^ 0xD0) - 91) ^ 0x3C) << 24);
  LOBYTE(v75) = *(_BYTE *)(v72 + (v65[5] ^ 0xEDLL));
  int v81 = ((v75 ^ 0x37) >> 4) ^ ((v75 ^ 0x37) >> 1);
  uint64_t v341 = v72;
  uint64_t v343 = v69;
  uint64_t v344 = v67;
  unsigned int v82 = v76 & 0xFF00FFFF | (((*(_BYTE *)(v72 + (v65[9] ^ 0x38LL)) ^ ((*(_BYTE *)(v72 + (v65[9] ^ 0x38LL)) ^ 0x37) >> 4) ^ ((*(_BYTE *)(v72 + (v65[9] ^ 0x38LL)) ^ 0x37) >> 1)) ^ 0x9C) << 16);
  LODWORD(v64) = v64 & 0xFFFFFF00 | ((((v65[12] ^ 0x13) + *(unsigned __int8 *)(v69 + (v65[12] ^ 0x42LL)) - 91) ^ v58) << 24) | (*(_BYTE *)(v67 + (v65[15] ^ 0x38LL)) + (v65[15] ^ 0xD4) - 55);
  uint64_t v342 = v70;
  LOBYTE(v65) = *(_BYTE *)(v70 + (v65[2] ^ 0x22LL));
  LODWORD(STACK[0x390]) = v64 ^ 0x1C9F8877;
  LODWORD(STACK[0x340]) = (v80 & 0xFFFF00FF | (((v65 ^ (16 * ~(_BYTE)v65)) ^ 0x1A) << 8)) ^ 0x4DA6B357;
  LODWORD(STACK[0x2E0]) = (v78 & 0xFF00FFFF | ((v75 ^ 0x6C ^ (v81
                                                                                              - ((2 * v81) & 0xE8)
                                                                                              + 116)) << 16)) ^ 0x773BD0C;
  uint64_t v83 = (unsigned __int8 *)STACK[0x5D8];
  LODWORD(STACK[0x368]) = v82 ^ 0x8F8BF5D0;
  v339 = (_BYTE *)STACK[0x5E0];
  v340 = v83;
  STACK[0x388] = 14LL;
  uint8x16_t v84 = v83;
  uint64_t v85 = v70;
  LODWORD(v65) = *(unsigned __int8 *)(v70 + (v83[14] ^ 0xD9LL));
  LODWORD(v351) = (v66 - 1117371081) & 0x4299B5D7;
  unint64_t v86 = (v351 ^ 0xFFFFFE6A) & 0xAA288574 ^ 0xAA288574;
  STACK[0x290] = v86;
  HIDWORD(a12) = v66 - 1665;
  uint64_t v87 = v83[v86];
  LODWORD(STACK[0x3C0]) = ((((_DWORD)v65 << ((v66 + 127) ^ 5)) ^ 0x70)
                         - ((2 * (((_DWORD)v65 << ((v66 + 127) ^ 5)) ^ 0x70)) & 0x20)
                         + 23) ^ v65;
  uint64_t v88 = v69;
  LOBYTE(v65) = *(_BYTE *)(v69 + (v87 ^ v58));
  STACK[0x380] = 10LL;
  STACK[0x398] = 15LL;
  int v89 = v83[15];
  char v90 = (_BYTE)v65 + (v87 ^ 0xB7) - 91;
  uint64_t v91 = v83[10];
  if ((v89 & 0x20) != 0) {
    int v92 = -32;
  }
  else {
    int v92 = 32;
  }
  unsigned __int8 v93 = v90 ^ 0xE5;
  char v94 = *(_BYTE *)(v70 + (v91 ^ a2));
  int v355 = *(unsigned __int8 *)(v67 + ((v92 + v89) ^ 0xDDLL)) + ((v92 + v89) ^ 0x31);
  STACK[0x370] = 6LL;
  unsigned __int8 v95 = v94 ^ (16 * ~v94);
  int v96 = *(unsigned __int8 *)(v70 + (v84[6] ^ 0x51LL));
  STACK[0x288] = 12LL;
  STACK[0x258] = 0LL;
  HIDWORD(v97) = v96 ^ (((16 * v96) ^ 0x70) - ((2 * ((16 * v96) ^ 0x70)) & 0x20) + 23) ^ 0x3F;
  LODWORD(v97) = BYTE4(v97) & 0xF8;
  unint64_t v98 = ((v97 >> 3) | ((unint64_t)v93 << 13)) ^ 0x58F620A6;
  int v99 = (v98 >> 21) | ((_DWORD)v98 << 11);
  int v354 = *(unsigned __int8 *)(v88 + (v84[12] ^ 0xF7) - 2 * ((v84[12] ^ 0xF7) & 0xAEu) + 174) - (v84[12] ^ 0xF7);
  uint64_t v100 = *v84;
  STACK[0x328] = 3LL;
  uint64_t v101 = v84[3];
  int v102 = v66;
  int v103 = *(unsigned __int8 *)(v88 + (v100 ^ 0xD8)) + (v100 ^ 0x76) - 2 * (v100 ^ 0x76);
  STACK[0x338] = 8LL;
  int v352 = (v101 ^ 0xFFFFFFBB) + *(unsigned __int8 *)(v67 + (v101 ^ 0x57));
  LOBYTE(v100) = (v84[8] ^ 0xA7) + *(_BYTE *)(v88 + (v84[8] ^ 0xF6LL));
  char v104 = v100 - ((2 * v100 + 74) & 0x4E);
  STACK[0x2D8] = 7LL;
  LOBYTE(v101) = (v84[7] ^ 0xE9) + *(_BYTE *)(v67 + (v84[7] ^ 5LL));
  STACK[0x218] = 13LL;
  int v105 = *(unsigned __int8 *)(v72 + (v84[13] ^ 0x12LL));
  unsigned int v106 = v105 ^ ((((v105 ^ 0x37u) >> 3) & 4 ^ v105 & 0xA4 | ((v105 ^ 0x37u) >> 3) & 0xFFFFFFFB ^ (v105 ^ 0x37) & 0x5A) >> 1);
  LOBYTE(v105) = *(_BYTE *)(v72 + (v84[5] ^ 0x9CLL));
  int v107 = ((v105 ^ 0x37) >> 4) ^ ((v105 ^ 0x37) >> 1);
  int v108 = (v101 - 55) | ((v105 ^ 0xE6 ^ (v107
                                                                                         - ((2 * v107) & 0xE8)
                                                                                         + 116)) << 16);
  int v109 = *(unsigned __int8 *)(v72 + (v84[9] ^ 0x76LL));
  int v110 = (v109 & 8 ^ 0x7E) + 2 * (v109 & 8);
  unsigned int v111 = (v109 ^ 0x37u) >> 3;
  BOOL v112 = ((v110 + 2) & v111) == 0;
  char v113 = v110 - 104;
  char v114 = -108 - v110;
  if (v112) {
    char v114 = v113;
  }
  LODWORD(STACK[0x248]) = -1440184972;
  int v115 = *(unsigned __int8 *)(v72 + (v84[1] ^ 0xCFLL));
  unsigned int v116 = v115 & 0xFFFFFFBF ^ 0x34 ^ ((v115 | 0xFFFFFFBF) + 68);
  int v117 = v102;
  uint64_t v118 = *(void *)(v59 + 8LL * (v102 ^ 0x610));
  int v119 = v116 ^ (v116 >> 4) ^ (v116 >> 1);
  HIDWORD(v350) = v106;
  int v120 = *(_DWORD *)(v118 + 4LL * (v106 ^ 0x50));
  uint64_t v121 = *(void *)(v59 + 8LL * (v102 - 1624)) - 4LL;
  HIDWORD(v34_Block_object_dispose(va, 8) = v95 ^ 0x2E;
  int v122 = *(_DWORD *)(v121 + 4LL * (v95 ^ 0xA1u));
  HIDWORD(v123) = v122 ^ 0xA33E;
  LODWORD(v123) = v122 ^ 0xB6790000;
  LODWORD(v349) = v103 - 92;
  HIDWORD(v356) = v117;
  uint64_t v124 = v59;
  uint64_t v125 = *(void *)(v59 + 8LL * (v117 - 1565));
  int v126 = (v123 >> 16) ^ *(_DWORD *)(v125 + 4LL * ((v103 - 92) ^ 0xF9u)) ^ (16 * (v120 ^ 0x2821227F)
                                                                                          + 1926029066
                                                                                          - ((32 * (v120 ^ 0x2821227F)) & 0xE599BE00));
  unsigned int v127 = v120 ^ (v126 + 1745576844 - ((2 * v126) & 0xD016C718));
  LODWORD(v34_Block_object_dispose(va, 8) = v108 ^ v99;
  unsigned int v128 = v108 ^ v99 ^ 0xDD03A24B;
  uint64_t v129 = *(void *)(v124 + 8LL * (v117 - 1548)) - 4LL;
  unsigned int v130 = *(_DWORD *)(v129 + 4LL * (v128 ^ 0x33u)) ^ v127;
  int v131 = *(_DWORD *)(v121 + 4LL * (LODWORD(STACK[0x3C0]) ^ 0x71u));
  HIDWORD(v123) = v131 ^ 0xA33E;
  LODWORD(v123) = v131 ^ 0xB6790000;
  HIDWORD(v349) = v119;
  int v132 = *(_DWORD *)(v118 + 4LL * (v119 ^ 0xBFu)) ^ 0x2821227F;
  int v133 = (v123 >> 16) ^ (16 * v132 + 1926029066 - ((32 * v132) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * HIBYTE(v128));
  HIDWORD(v347) = (*(_BYTE *)(v344 + (v84[11] ^ 0x12LL)) + (v84[11] ^ 0xFE) - 55);
  unsigned int v134 = *(_DWORD *)(v129 + 4LL * (HIDWORD(v347) ^ 0xB9u)) ^ v132 ^ (v133 + 1745576844 - ((2 * v133) & 0xD016C718));
  int v135 = *(_DWORD *)(v118 + 4LL * BYTE2(v128)) ^ 0x2821227F;
  unsigned int v136 = *(unsigned __int8 *)(v85 + (v84[2] ^ 0x26LL)) ^ 0xFFFFFFAF;
  HIDWORD(v346) = v136 ^ (16 * v136);
  int v137 = *(_DWORD *)(v121 + 4LL * (BYTE4(v346) ^ 0xFBu));
  HIDWORD(v123) = v137 ^ 0xA33E;
  LODWORD(v123) = v137 ^ 0xB6790000;
  LODWORD(v346) = (v104 - 52);
  int v138 = (v123 >> 16) ^ *(_DWORD *)(v125 + 4LL * (v346 ^ 0x40)) ^ (16 * v135
                                                                               + 1926029066
                                                                               - ((32 * v135) & 0xE599BE00));
  LODWORD(v347) = v355 - 55;
  unsigned int v139 = *(_DWORD *)(v129 + 4LL * ((v355 - 55) ^ 0xEBu)) ^ v135 ^ (v138
                                                                                  + 1745576844
                                                                                  - ((2 * v138) & 0xD016C718));
  LODWORD(v350) = v109 ^ ((((v111 + v114 - 22) ^ (v109 ^ 0x37) & 0xF7) & 0xFE) >> 1);
  int v140 = *(_DWORD *)(v118 + 4LL * (v350 ^ 0x4B)) ^ 0x2821227F;
  int v141 = *(_DWORD *)(v121 + 4LL * (BYTE1(v99) ^ 0x31u));
  HIDWORD(v123) = v141 ^ 0xA33E;
  LODWORD(v123) = v141 ^ 0xB6790000;
  HIDWORD(v345) = v354 - 92;
  int v142 = (v123 >> 16) ^ *(_DWORD *)(v125 + 4LL * ((v354 - 92) ^ 0xF7u)) ^ (16 * v140
                                                                                          + 1926029066
                                                                                          - ((32 * v140) & 0xE599BE00));
  LODWORD(v345) = v352 - 55;
  unsigned int v143 = *(_DWORD *)(v129 + 4LL * ((v352 - 55) ^ 0x33u)) ^ v140 ^ (v142
                                                                                  + 1745576844
                                                                                  - ((2 * v142) & 0xD016C718));
  int v144 = *(_DWORD *)(v118 + 4LL * (BYTE2(v143) ^ 0xBBu)) ^ 0x2821227F;
  int v145 = *(_DWORD *)(v121 + 4LL * (BYTE1(v139) ^ 0xF4u));
  HIDWORD(v123) = v145 ^ 0xA33E;
  LODWORD(v123) = v145 ^ 0xB6790000;
  unsigned __int8 v146 = BYTE1(v134) ^ 0xAD;
  unsigned int v147 = v144 ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v130) ^ 0x7F)) ^ *(_DWORD *)(v129
                                                                            + 4LL * (v134 ^ 0xDBu)) ^ (16 * v144 + 1926029066 - ((32 * v144) & 0xE599BE00)) ^ (v123 >> 16);
  int v148 = *(_DWORD *)(v118 + 4LL * (BYTE2(v130) ^ 0xCDu));
  int v149 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v143 ^ 0x22E) >> 8));
  HIDWORD(v123) = v149 ^ 0xA33E;
  LODWORD(v123) = v149 ^ 0xB6790000;
  int v150 = (16 * (v148 ^ 0x2821227F) + 1926029066 - ((32 * (v148 ^ 0x2821227F)) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * ((v134 ^ 0xF15ADDB) >> 24)) ^ (v123 >> 16);
  unsigned int v151 = *(_DWORD *)(v129 + 4LL * (v139 ^ 0x80u)) ^ v148 ^ (v150
                                                                           + 1745576844
                                                                           - ((2 * v150) & 0xD016C718));
  int v152 = *(_DWORD *)(v118 + 4LL * (BYTE2(v134) ^ 0xD6u)) ^ 0x2821227F;
  unsigned int v153 = (16 * v152 + 1926029066 - ((32 * v152) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v139) ^ 0x19));
  int v154 = *(_DWORD *)(v121 + 4LL * (BYTE1(v130) ^ 0xC4u));
  HIDWORD(v123) = v154 ^ 0xA33E;
  LODWORD(v123) = v154 ^ 0xB6790000;
  unsigned int v155 = *(_DWORD *)(v129 + 4LL * (v143 ^ 0x2Eu)) ^ v152 ^ (v123 >> 16) ^ (v153
                                                                                          + 1745576844
                                                                                          - ((2 * v153) & 0xD016C718));
  int v156 = *(_DWORD *)(v121 + 4LL * v146);
  HIDWORD(v123) = v156 ^ 0xA33E;
  LODWORD(v123) = v156 ^ 0xB6790000;
  int v157 = *(_DWORD *)(v118 + 4LL * (BYTE2(v139) ^ 0x32u));
  int v158 = (v123 >> 16) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v143) ^ 0xBD)) ^ (16 * (v157 ^ 0x2821227F)
                                                                         + 1926029066
                                                                         - ((32 * (v157 ^ 0x2821227F)) & 0xE599BE00));
  unsigned int v159 = v157 ^ *(_DWORD *)(v129 + 4LL * (v130 ^ 0xDFu)) ^ 0x59E8F4BB ^ (v158
                                                                                        + 1745576844
                                                                                        - ((2 * v158) & 0xD016C718));
  unsigned int v160 = v159
       - ((2 * v159) & 0x5F186BF6)
       + 797718011
       - ((2 * (v159 - ((2 * v159) & 0x5F186BF6) + 797718011)) & 0xD087B460)
       + 1749277232;
  int v161 = *(_DWORD *)(v118 + 4LL * (BYTE2(v160) ^ 0x80u));
  BYTE2(v143) = BYTE2(v155) ^ 0xEB;
  int v162 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v155 ^ 0xDFF9) >> 8));
  unsigned int v163 = (16 * (v161 ^ 0x2821227F) + 1926029066 - ((32 * (v161 ^ 0x2821227F)) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v147) ^ 0xFE)) ^ (((v162 ^ 0xB679A33E) >> (v147 & 0x10) >> (v147 & 0x10 ^ 0x10)) + ((v162 << 16) ^ 0xA33E0000));
  unsigned int v164 = *(_DWORD *)(v129 + 4LL * (v151 ^ 0xA6u)) ^ v161 ^ (v163
                                                                           + 1745576844
                                                                           - ((2 * v163) & 0xD016C718));
  v147 ^= 0x1751B7ACu;
  int v165 = *(_DWORD *)(v118 + 4LL * BYTE2(v147)) ^ 0x2821227F;
  int v166 = *(_DWORD *)(v121 + 4LL * (BYTE1(v160) ^ 0x49u));
  HIDWORD(v123) = v166 ^ 0xA33E;
  LODWORD(v123) = v166 ^ 0xB6790000;
  int v167 = (16 * v165 + 1926029067 + ~((32 * v165) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v151) ^ 0x63)) ^ (v123 >> 16);
  unsigned int v168 = *(_DWORD *)(v129 + 4LL * (v155 ^ 0xF9u)) ^ v165 ^ (v167
                                                                           + 1745576844
                                                                           - ((2 * v167) & 0xD016C718));
  int v169 = *(_DWORD *)(v125 + 4LL * (HIBYTE(v155) ^ 5));
  HIDWORD(v123) = v169 ^ 0x30A;
  LODWORD(v123) = v169 ^ 0x72CCDC00;
  int v170 = *(_DWORD *)(v118 + 4LL * (BYTE2(v151) ^ 0x14u)) ^ 0x2821227F;
  unsigned int v171 = (((v123 >> 10) ^ 0x25EB099C) << 10) ^ (16 * v170) ^ (((v123 >> 10) ^ 0x25EB099C) >> 22);
  int v172 = *(_DWORD *)(v121 + 4LL * BYTE1(v147));
  HIDWORD(v123) = v172 ^ 0xA33E;
  LODWORD(v123) = v172 ^ 0xB6790000;
  int v173 = *(_DWORD *)(v121 + 4LL * (BYTE1(v151) ^ 0xEFu));
  int v174 = *(_DWORD *)(v129 + 4LL * (v160 ^ 3u)) ^ v170 ^ (v123 >> 16);
  HIDWORD(v123) = v173 ^ 0xA33E;
  LODWORD(v123) = v173 ^ 0xB6790000;
  int v175 = *(_DWORD *)(v118 + 4LL * BYTE2(v143)) ^ 0x2821227F;
  int v176 = (v123 >> 16) ^ (16 * v175 + 1926029066 - ((32 * v175) & 0xE599BE00)) ^ *(_DWORD *)(v125
                                                                                          + 4LL * (HIBYTE(v160) ^ 0x81));
  unsigned int v177 = *(_DWORD *)(v129 + 4LL * (v147 ^ 0x33u)) ^ v175 ^ (v176
                                                                           + 1745576844
                                                                           - ((2 * v176) & 0xD016C718));
  unsigned int v178 = v174 ^ (v171 + 1745576844 - ((2 * v171) & 0xD016C718));
  int v179 = *(_DWORD *)(v118 + 4LL * (BYTE2(v177) ^ 0x62u)) ^ 0x2821227F;
  unsigned int v180 = v178 ^ 0xF1F7E4A6;
  int v181 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v178 ^ 0xE4A6) >> 8));
  unsigned int v182 = (16 * v179 + 1926029066 - ((32 * v179) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v164) ^ 0xF5));
  HIDWORD(v123) = v181 ^ 0xA33E;
  LODWORD(v123) = v181 ^ 0xB6790000;
  int v183 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v177 ^ 0x2957) >> 8));
  unsigned int v184 = *(_DWORD *)(v129 + 4LL * (v168 ^ 0x68u)) ^ v179 ^ (v123 >> 16) ^ (v182
                                                                                          + 1745576844
                                                                                          - ((2 * v182) & 0xD016C718));
  HIDWORD(v123) = v183 ^ 0xA33E;
  LODWORD(v123) = v183 ^ 0xB6790000;
  int v185 = *(_DWORD *)(v118 + 4LL * (BYTE2(v164) ^ 0x7Au)) ^ 0x2821227F;
  int v186 = (16 * v185 + 1926029066 - ((32 * v185) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v168) ^ 0xCE)) ^ (v123 >> 16);
  unsigned int v187 = *(_DWORD *)(v129 + 4LL * (v178 ^ 0x15u)) ^ v185 ^ (v186
                                                                           + 1745576844
                                                                           - ((2 * v186) & 0xD016C718));
  int v188 = *(_DWORD *)(v118 + 4LL * (BYTE2(v168) ^ 0x60u)) ^ 0x2821227F;
  int v189 = *(_DWORD *)(v121 + 4LL * (BYTE1(v164) ^ 0xB9u));
  int v190 = (16 * v188 + 1926029066 - ((32 * v188) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * HIBYTE(v180)) ^ (__PAIR64__(v189 ^ 0xA33Eu, v189 ^ 0xB6790000) >> 16);
  unsigned int v191 = *(_DWORD *)(v129 + 4LL * (v177 ^ 0x57u)) ^ v188 ^ (v190
                                                                           + 1745576844
                                                                           - ((2 * v190) & 0xD016C718));
  if ((v168 & 0x1000) != 0) {
    int v192 = -16;
  }
  else {
    int v192 = 16;
  }
  int v193 = (BYTE1(v168) ^ 0xC) + v192;
  int v194 = *(_DWORD *)(v118 + 4LL * BYTE2(v180)) ^ 0x2821227F;
  unsigned int v195 = *(_DWORD *)(v121 + 4LL * (v193 ^ 0x83u));
  unsigned int v196 = *(_DWORD *)(v125 + 4LL * (HIBYTE(v177) ^ 0xA1)) ^ HIWORD(v195) ^ (v195 << 16) ^ (16 * v194
                                                                                        + 1926029066
                                                                                        - ((32 * v194) & 0xE599BE00)) ^ 0xA33EB679;
  int v197 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v191 ^ 0x8D48) >> 8));
  unsigned int v198 = *(_DWORD *)(v129 + 4LL * (v164 ^ 0x1Cu)) ^ v194 ^ (v196
                                                                           + 1745576844
                                                                           - ((2 * v196) & 0xD016C718));
  HIDWORD(v199) = v197 ^ 0xA33E;
  LODWORD(v199) = v197 ^ 0xB6790000;
  int v200 = *(_DWORD *)(v118 + 4LL * ((v198 ^ 0xEFBC3B44) >> 16)) ^ 0x2821227F;
  int v201 = (v199 >> 16) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v184) ^ 0xCC)) ^ (16 * v200
                                                                         + 1926029066
                                                                         - ((32 * v200) & 0xE599BE00));
  unsigned int v202 = *(_DWORD *)(v129 + 4LL * (v187 ^ 0xA9u)) ^ v200 ^ (v201
                                                                           + 1745576844
                                                                           - ((2 * v201) & 0xD016C718));
  int v203 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v198 ^ 0x3B44) >> 8));
  HIDWORD(v199) = v203 ^ 0xA33E;
  LODWORD(v199) = v203 ^ 0xB6790000;
  unsigned __int8 v204 = v184 ^ 0x83;
  int v205 = *(_DWORD *)(v118 + 4LL * (((v184 ^ 0x255FD583) >> 16) ^ 0xC3u)) ^ 0x2821227F;
  int v206 = (v199 >> 16) ^ *(_DWORD *)(v125 + 4LL * HIBYTE(v187)) ^ (16 * v205 + 1926029066 - ((32 * v205) & 0xE599BE00));
  unsigned int v207 = *(_DWORD *)(v129 + 4LL * (v191 ^ 0x48u)) ^ v205 ^ (v206
                                                                           + 1745576844
                                                                           - ((2 * v206) & 0xD016C718));
  int v208 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v184 ^ 0xD583) >> 8));
  HIDWORD(v199) = v208 ^ 0xA33E;
  LODWORD(v199) = v208 ^ 0xB6790000;
  int v209 = *(_DWORD *)(v118 + 4LL * ((v187 ^ 0xE93411A9) >> 16)) ^ 0x2821227F;
  int v210 = (16 * v209 + 1926029066 - ((32 * v209) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * ((v191 ^ 0x807D8D48) >> 24)) ^ (v199 >> 16);
  unsigned int v211 = *(_DWORD *)(v129 + 4LL * (v198 ^ 0x77u)) ^ v209 ^ (v210
                                                                           + 1745576844
                                                                           - ((2 * v210) & 0xD016C718));
  int v212 = *(_DWORD *)(v121 + 4LL * (BYTE1(v187) ^ 0x82u));
  HIDWORD(v199) = v212 ^ 0xA33E;
  LODWORD(v199) = v212 ^ 0xB6790000;
  int v213 = *(_DWORD *)(v118 + 4LL * (BYTE2(v191) ^ 0xBEu)) ^ 0x2821227F;
  int v214 = (v199 >> 16) ^ *(_DWORD *)(v125 + 4LL * ((v198 ^ 0xEFBC3B44) >> 24)) ^ (16 * v213
                                                                               + 1926029066
                                                                               - ((32 * v213) & 0xE599BE00));
  unsigned int v215 = *(_DWORD *)(v129 + 4LL * v204) ^ v213 ^ (v214 + 1745576844 - ((2 * v214) & 0xD016C718));
  int v216 = *(_DWORD *)(v118 + 4LL * ((v215 ^ 0x950DA39D) >> 16)) ^ 0x2821227F;
  unsigned int v217 = (16 * v216 + 1926029066 - ((32 * v216) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * ((v202 ^ 0x11521BCA) >> 24));
  int v218 = *(_DWORD *)(v121 + 4LL * (BYTE1(v211) ^ 0x89u));
  HIDWORD(v199) = v218 ^ 0xA33E;
  LODWORD(v199) = v218 ^ 0xB6790000;
  int v219 = *(_DWORD *)(v129 + 4LL * (v207 ^ 0x88u)) ^ v216 ^ (v199 >> 16) ^ 0x71C9D6C4 ^ (v217 + 1745576844 - ((2 * v217) & 0xD016C718));
  int v220 = *(_DWORD *)(v118 + 4LL * ((v202 ^ 0x11521BCA) >> 16));
  int v221 = v219 - ((2 * v219) & 0xFEACAB26);
  int v222 = *(_DWORD *)(v121 + 4LL * (BYTE1(v215) ^ 0x30u));
  HIDWORD(v199) = v222 ^ 0xA33E;
  LODWORD(v199) = v222 ^ 0xB6790000;
  int v223 = (16 * (v220 ^ 0x2821227F) + 1926029066 - ((32 * (v220 ^ 0x2821227F)) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v207) ^ 0xDF)) ^ (v199 >> 16);
  v211 ^= 0x7A851A70u;
  unsigned int v224 = *(_DWORD *)(v129 + 4LL * (v211 ^ 0x33u)) ^ v220 ^ (v223
                                                                           + 1745576844
                                                                           - ((2 * v223) & 0xD016C718));
  int v225 = *(_DWORD *)(v118 + 4LL * (BYTE2(v207) ^ 0xA7u)) ^ 0x2821227F;
  int v226 = *(_DWORD *)(v121 + 4LL * (BYTE1(v202) ^ 0x88u));
  HIDWORD(v199) = v226 ^ 0xA33E;
  LODWORD(v199) = v226 ^ 0xB6790000;
  int v227 = (16 * v225 + 1926029066 - ((32 * v225) & 0xE599BE00)) ^ *(_DWORD *)(v125
                                                                           + 4LL
                                                                           * ((HIBYTE(v211) ^ -HIBYTE(v211) ^ ((HIBYTE(v211) ^ 0xFFFFFF16) + 234))
                                                                            + 233)) ^ (v199 >> 16);
  unsigned int v228 = *(_DWORD *)(v129 + 4LL * (v215 ^ 0x9Du)) ^ v225 ^ (v227
                                                                           + 1745576844
                                                                           - ((2 * v227) & 0xD016C718));
  int v229 = *(_DWORD *)(v118 + 4LL * BYTE2(v211));
  int v230 = *(_DWORD *)(v121 + 4LL * (BYTE1(v207) ^ 0xD1u));
  HIDWORD(v199) = v230 ^ 0xA33E;
  LODWORD(v199) = v230 ^ 0xB6790000;
  int v231 = (v199 >> 16) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v215) ^ 0x7C)) ^ (16 * (v229 ^ 0x2821227F)
                                                                         + 1926029066
                                                                         - ((32 * (v229 ^ 0x2821227F)) & 0xE599BE00));
  unsigned int v232 = *(_DWORD *)(v129 + 4LL * (v202 ^ 0xF9u)) ^ v229 ^ (v231
                                                                           + 1745576844
                                                                           - ((2 * v231) & 0xD016C718));
  int v233 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v228 ^ 0xDE69) >> 8));
  HIDWORD(v199) = v233 ^ 0xA33E;
  LODWORD(v199) = v233 ^ 0xB6790000;
  int v234 = *(_DWORD *)(v118 + 4LL * (BYTE2(v232) ^ 0xA6u));
  int v235 = (v199 >> 16) ^ *(_DWORD *)(v125 + 4LL * (((11119212 - v221) >> 24) ^ 0x69)) ^ (16 * (v234 ^ 0x2821227F) + 1926029066 - ((32 * (v234 ^ 0x2821227F)) & 0xE599BE00));
  int v236 = *(_DWORD *)(v121 + 4LL * (BYTE1(v232) ^ 0x1Du));
  HIDWORD(v199) = v236 ^ 0xA33E;
  LODWORD(v199) = v236 ^ 0xB6790000;
  v221 -= 11119213;
  unsigned int v237 = *(_DWORD *)(v129 + 4LL * (v224 ^ 0xACu)) ^ v234 ^ (v235
                                                                           + 1745576844
                                                                           - ((2 * v235) & 0xD016C718));
  int v238 = *(_DWORD *)(v118 + 4LL * (BYTE2(v221) ^ 0x3Cu)) ^ 0x2821227F;
  unsigned int v239 = v238 ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v224) ^ 0xF5)) ^ *(_DWORD *)(v129
                                                                            + 4LL * (v228 ^ 0x69u)) ^ ((v199 >> 16) + 1745576844 - ((2 * (v199 >> 16)) & 0xD016C718)) ^ (16 * v238 + 1926029066 - ((32 * v238) & 0xE599BE00));
  int v240 = *(_DWORD *)(v118 + 4LL * (BYTE2(v224) ^ 0xDBu)) ^ 0x2821227F;
  unsigned int v241 = (16 * v240 + 1926029067 + ~((32 * v240) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * ((v228 ^ 0x5FEEDE69) >> 24));
  int v242 = *(_DWORD *)(v121 + 4LL * (BYTE1(v221) ^ 0x3Eu));
  HIDWORD(v199) = v242 ^ 0xA33E;
  LODWORD(v199) = v242 ^ 0xB6790000;
  LOBYTE(v233) = (HIBYTE(v232) ^ 0x3D) & 0x90 ^ 0x86 ^ (~(2 * (HIBYTE(v232) ^ 0x3D | 0x90))
                                                      + (HIBYTE(v232) ^ 0x3D | 0x90));
  int v243 = (v241 ^ (v199 >> 16)) + 1745576844 - ((2 * (v241 ^ (v199 >> 16))) & 0xD016C718);
  int v244 = *(_DWORD *)(v129
                   + 4LL
  int v245 = *(_DWORD *)(v118 + 4LL * (BYTE2(v228) ^ 0x2Du)) ^ 0x2821227F;
  int v246 = *(_DWORD *)(v121 + 4LL * (BYTE1(v224) ^ 0xFDu));
  HIDWORD(v199) = v246 ^ 0xA33E;
  LODWORD(v199) = v246 ^ 0xB6790000;
  int v247 = (v199 >> 16) ^ (16 * v245 + 1926029066 - ((32 * v245) & 0xE599BE00)) ^ *(_DWORD *)(v125
                                                                                          + 4LL * v233);
  unsigned int v248 = *(_DWORD *)(v129 + 4LL * (v221 ^ 0xC8u)) ^ v245 ^ (v247
                                                                           + 1745576844
                                                                           - ((2 * v247) & 0xD016C718));
  int v249 = v244 ^ v243;
  int v250 = *(_DWORD *)(v118 + 4LL * ((v248 ^ 0x59A5F4B7) >> 16)) ^ 0x2821227F;
  int v251 = *(_DWORD *)(v121 + 4LL * ((unsigned __int16)(v244 ^ v243 ^ 0x872B) >> 8));
  HIDWORD(v199) = v251 ^ 0xA33E;
  LODWORD(v199) = v251 ^ 0xB6790000;
  int v252 = (16 * v250 + 1926029066 - ((32 * v250) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v237) ^ 0xFA)) ^ (v199 >> 16);
  int v253 = *(_DWORD *)(v121 + 4LL * (BYTE1(v248) ^ 0x67u));
  unsigned int v254 = *(_DWORD *)(v129 + 4LL * (v239 ^ 0xEEu)) ^ v250 ^ (v252
                                                                           + 1745576844
                                                                           - ((2 * v252) & 0xD016C718));
  HIDWORD(v199) = v253 ^ 0xA33E;
  LODWORD(v199) = v253 ^ 0xB6790000;
  int v255 = *(_DWORD *)(v118 + 4LL * (BYTE2(v237) ^ 4u)) ^ 0x2821227F;
  int v256 = *(_DWORD *)(v121 + 4LL * (BYTE1(v237) ^ 0x99u));
  int v357 = v255 ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v239) ^ 0xD6)) ^ *(_DWORD *)(v129
                                                                            + 4LL * (v249 ^ 0x18u)) ^ (16 * v255 + 1926029066 - ((32 * v255) & 0xE599BE00)) ^ ((v199 >> 16) + 1745576844 - ((2 * (v199 >> 16)) & 0xD016C718));
  HIDWORD(v199) = v256 ^ 0xA33E;
  LODWORD(v199) = v256 ^ 0xB6790000;
  int v257 = *(_DWORD *)(v118 + 4LL * (BYTE2(v239) ^ 0x56u)) ^ 0x2821227F;
  int v258 = *(_DWORD *)(v125 + 4LL * ((v249 ^ 0x911B872B) >> 24)) ^ *(_DWORD *)(v118 + 4LL * (BYTE2(v239) ^ 0x56u)) ^ 0x45605001 ^ (16 * v257 + 1926029066 - ((32 * v257) & 0xE599BE00)) ^ (v199 >> 16);
  int v259 = *(_DWORD *)(v118 + 4LL * (BYTE2(v249) ^ 0xD8u)) ^ 0x2821227F;
  int v260 = *(_DWORD *)(v121 + 4LL * (BYTE1(v239) ^ 0xE4u));
  HIDWORD(v199) = v260 ^ 0xA33E;
  LODWORD(v199) = v260 ^ 0xB6790000;
  int v261 = (v199 >> 16) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v248) ^ 0xB0)) ^ (16 * v259
                                                                         + 1926029066
                                                                         - ((32 * v259) & 0xE599BE00));
  unsigned int v262 = *(_DWORD *)(v129 + 4LL * (v237 ^ 0xD9u)) ^ v259 ^ (v261
                                                                           + 1745576844
                                                                           - ((2 * v261) & 0xD016C718));
  HIDWORD(v199) = *(_DWORD *)(v129 + 4LL * (v248 ^ 0xB7u)) ^ 0x7483C736;
  LODWORD(v199) = HIDWORD(v199);
  int v263 = *(_DWORD *)(v121 + 4LL * (BYTE1(v262) ^ 0x66u));
  int v264 = (v199 >> 21) ^ __ROR4__(v258, 21);
  HIDWORD(v199) = v263 ^ 0xA33E;
  LODWORD(v199) = v263 ^ 0xB6790000;
  int v265 = *(_DWORD *)(v118 + 4LL * (BYTE2(v254) ^ 0x74u)) ^ 0x2821227F;
  int v266 = v357 ^ 0x177CD9D9;
  int v267 = *(_DWORD *)(v125 + 4LL * ((v357 ^ 0x177CD9D9u) >> 24)) ^ 0x6D41727E ^ v265 ^ (v199 >> 16) ^ (16 * v265 + 1926029066 - ((32 * v265) & 0xE599BE00));
  HIDWORD(v199) = v264 ^ 0x549BF9D9;
  LODWORD(v199) = v264 ^ 0x549BF9D9;
  int v268 = v199 >> 11;
  int v269 = *(_DWORD *)(v129 + 4LL * ((v199 >> 11) ^ 0xEFu));
  unsigned int v270 = (v267 & 0x200 ^ 0xF7E7EF63) + 2 * (v267 & 0x200);
  BOOL v112 = ((v270 + 135794845) & (v269 ^ 0x680B638C)) == 0;
  unsigned int v271 = v270 + 494853599;
  unsigned int v272 = 223263909 - v270;
  if (v112) {
    unsigned int v272 = v271;
  }
  unsigned int v273 = ((v269 ^ 0x7483C736) - 359058754 + v272) ^ v267 & 0xFFFFFDFF;
  int v274 = *(_DWORD *)(v118 + 4LL * BYTE2(v266)) ^ 0x2821227F;
  unsigned int v275 = (16 * v274 + 1926029066 - ((32 * v274) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * ((v268 ^ 0x1EA133EFu) >> 24));
  int v276 = *(_DWORD *)(v121 + 4LL * (((unsigned __int16)(v254 ^ 0x3D47) >> 8) ^ 0x93u));
  HIDWORD(v277) = v276 ^ 0xA33E;
  LODWORD(v277) = v276 ^ 0xB6790000;
  unsigned int v278 = *(_DWORD *)(v129 + 4LL * (v262 ^ 0xDu)) ^ v274 ^ (v277 >> 16) ^ (v275
                                                                                         + 1745576844
                                                                                         - ((2 * v275) & 0xD016C718));
  int v279 = *(_DWORD *)(v125 + 4LL * ((v254 ^ 0xD4B73D47) >> 24));
  int v280 = *(_DWORD *)(v118 + 4LL * (BYTE2(v268) ^ 0x62u)) ^ 0x2821227F;
  int v281 = *(_DWORD *)(v121 + 4LL * BYTE1(v266));
  HIDWORD(v277) = v281 ^ 0xA33E;
  LODWORD(v277) = v281 ^ 0xB6790000;
  int v282 = (16 * v280 + 1926029066 - ((32 * v280) & 0xE599BE00)) ^ *(_DWORD *)(v125 + 4LL * (HIBYTE(v262) ^ 0x32)) ^ (v277 >> 16);
  unsigned int v283 = *(_DWORD *)(v129 + 4LL * (v254 ^ 0x74u)) ^ v280 ^ (v282
                                                                           + 1745576844
                                                                           - ((2 * v282) & 0xD016C718));
  uint64_t v284 = (uint64_t)*(&off_189D4D580 + (v117 ^ 0x643));
  uint64_t v285 = (uint64_t)*(&off_189D4D580 + v117 - 1618);
  unsigned int v286 = v273 ^ 0xF137909F;
  unsigned int v287 = *(_DWORD *)(v285 + 4LL * ((v273 ^ 0xF137909F) >> 16)) ^ 0x2D713B21;
  unsigned int v288 = v287 ^ ((HIBYTE(v278) ^ 0x9FD52929) - 189525447 + *(_DWORD *)(v284 + 4LL * (HIBYTE(v278) ^ 0xB4))) ^ (v287 >> 2) ^ (v287 >> 4);
  unsigned int v289 = (v288 & 0x1000000 ^ 0xEFFDFB2B) + 2 * (v288 & 0x1000000);
  v290 = (char *)*(&off_189D4D580 + (v117 ^ 0x619)) - 12;
  int v291 = *(_DWORD *)&v290[4 * (v283 ^ 0x9E)];
  int v292 = *(_DWORD *)(v121 + 4LL * (BYTE1(v268) ^ 0xA0u));
  int v293 = *(_DWORD *)(v118 + 4LL * (BYTE2(v262) ^ 0x72u)) ^ 0x2821227F;
  HIDWORD(v277) = v292 ^ 0xA33E;
  LODWORD(v277) = v292 ^ 0xB6790000;
  int v294 = (v277 >> 16) ^ v279 ^ (16 * v293 + 1926029066 - ((32 * v293) & 0xE599BE00));
  unsigned int v295 = *(_DWORD *)(v129 + 4LL * (v357 ^ 0xEAu)) ^ v293 ^ (v294
                                                                           + 1745576844
                                                                           - ((2 * v294) & 0xD016C718));
  int v296 = v278 ^ 0xBC37B;
  unsigned int v297 = *(_DWORD *)(v285 + 4LL * (BYTE2(v295) ^ 0x99u)) ^ 0x2D713B21;
  unsigned int v298 = (*(_DWORD *)(v284 + 4LL * (((v273 ^ 0xF137909F) >> 24) ^ 0xB4))
        + (((v273 ^ 0xF137909F) >> 24) ^ 0x9FD52929)
        - 189525447) ^ ((v278 ^ 0x7B) + 1589313785 + ((2 * (v278 ^ 0xBC37B) + 224) & 0x110 ^ 0x3E7DDFFF)) ^ v297 ^ (v297 >> 2) ^ *(_DWORD *)&v290[4 * (v278 ^ 0x79)] ^ (v297 >> 4);
  v299 = (char *)*(&off_189D4D580 + (v117 ^ 0x637)) - 12;
  int v300 = v283 ^ 0x250E7C9C;
  unsigned int v301 = *(_DWORD *)&v299[4 * ((unsigned __int16)(v283 ^ 0x7C9C) >> 8)] ^ 0x97540F7D;
  uint64_t v302 = v295 ^ 0x6792B6A6;
  int v303 = *(_DWORD *)(v284 + 4LL * (BYTE3(v302) ^ 0xB4));
  int v304 = v298 ^ v301 ^ (1515496080 * v301);
  HIDWORD(v351) = (v283 ^ 0x250E7C9C) >> 24;
  LODWORD(v356) = *(_DWORD *)(v284 + 4LL * (HIDWORD(v351) ^ 0xB4u));
  int v305 = *(_DWORD *)(v285 + 4LL * (BYTE2(v283) ^ 5u));
  HIDWORD(v353) = *(_DWORD *)(v285 + 4LL * BYTE2(v296));
  LODWORD(v285) = *(_DWORD *)&v299[4 * BYTE1(v296)];
  int v306 = *(_DWORD *)&v299[4 * BYTE1(v302)];
  int v307 = *(_DWORD *)&v299[4 * (BYTE1(v273) ^ 0x5E)];
  int v308 = *(_DWORD *)&v290[4 * (v273 ^ 0x9D)];
  LODWORD(v353) = *(_DWORD *)&v290[4 * (v295 ^ 0xA4)];
  uint64_t v309 = (v304 + 125025548 - ((2 * v304) & 0xEE77A48u) + 24) ^ LODWORD(STACK[0x2E0]);
  uint64_t v310 = v309 ^ 0x5244C6B3;
  uint64_t v311 = (uint64_t)*(&off_189D4D580 + (v117 ^ 0x6E2));
  v339[5] = *(_BYTE *)(v311 + (BYTE2(v310) ^ 0x5ELL)) ^ BYTE2(v310) ^ 0x8A ^ ((BYTE2(v310) ^ 0x8A)
                                                                            - ((2 * (BYTE2(v310) ^ 0x8A) - 18) & 0xD0)
                                                                            - 33) ^ 0xB9;
  LODWORD(v290) = v305 ^ 0x2D713B21 ^ ((BYTE3(v302) ^ 0x9FD52929) - 189525447 + v303) ^ ((v305 ^ 0x2D713B21u) >> 2) ^ ((v305 ^ 0x2D713B21u) >> 4) ^ v285 ^ 0x97540F7D ^ v308 ^ (1515496080 * (v285 ^ 0x97540F7D)) ^ (v286 + 1589313785 + ((2 * v286 + 224) & 0x110 ^ 0x3E7DDFFF));
  uint64_t v312 = ((_DWORD)v290 + 1302770519 - ((2 * (_DWORD)v290) & 0x9B4D67D8) + 149) ^ LODWORD(STACK[0x340]);
  unsigned int v313 = v312 ^ 0x22A932A6;
  uint64_t v314 = (BYTE1(v313) | 0x88) ^ (v313 >> 8) & 0x88;
  uint64_t v315 = (uint64_t)*(&off_189D4D580 + (v117 ^ 0x6FE));
  v339[2] = (((unsigned __int16)(v312 ^ 0x32A6) >> 8) | 0x88) ^ ((unsigned __int16)(v312 ^ 0x32A6) >> 8) & 0x88 ^ 0x35 ^ ((*(_BYTE *)(v315 + (v314 ^ 0x14)) ^ 0xF3) + ((2 * *(_BYTE *)(v315 + (v314 ^ 0x14))) | 0xDF) - 111);
  v316 = (char *)*(&off_189D4D580 + v117 - 1663) - 4;
  LODWORD(v314) = v316[BYTE3(v309) ^ 0xEFLL];
  HIDWORD(v277) = v314 ^ 0xB;
  LODWORD(v277) = (_DWORD)v314 << 24;
  v339[STACK[0x290]] = (v277 >> 29) ^ 0x83;
  unsigned int v317 = v289 + 1610284501;
  if (((v289 + 268567765) & (v291 ^ 0xE1000000)) != 0) {
    unsigned int v317 = 1073148971 - v289;
  }
  unsigned int v318 = (v291 ^ (v300 + 1589313785 + ((2 * v300 + 224) & 0x110 ^ 0x3E7DDFFF))) - 1341716736 + v317;
  unsigned int v319 = v306 ^ 0x97540F7D;
  unsigned int v320 = 1515496080 * (v306 ^ 0x97540F7D);
  uint64_t v321 = v319 ^ LODWORD(STACK[0x368]) ^ ((v288 & 0xFEFFFFFF ^ v320 ^ v318)
                                       - 1886653034
                                       - ((2 * (v288 & 0xFEFFFFFF ^ v320 ^ v318)) & 0x1F17EB2C));
  uint64_t v322 = (v319 ^ LOBYTE(STACK[0x368]) ^ ((v288 ^ v320 ^ v318)
                                                        - 106
                                                        - ((2 * (v288 ^ v320 ^ v318)) & 0x2C))) ^ 0x28LL;
  v323 = (char *)*(&off_189D4D580 + v117 - 1598) - 12;
  v339[11] = v323[v322] ^ 0x6C;
  LODWORD(v322) = v316[BYTE3(v312) ^ 0xF9LL];
  HIDWORD(v324) = v322 ^ 0xB;
  LODWORD(v324) = (_DWORD)v322 << 24;
  unint64_t v325 = STACK[0x258];
  v339[STACK[0x258]] = (v324 >> 29) ^ 0xFB;
  v339[1] = BYTE2(v313) ^ 0x61 ^ ((BYTE2(v313) ^ 0x61) - ((2 * (BYTE2(v313) ^ 0x61) - 18) & 0xD0) - 33) ^ 0xB8 ^ *(_BYTE *)(v311 + (BYTE2(v313) ^ 0xB5LL));
  int v326 = (HIDWORD(v351) ^ 0x9FD52929) - 189525447 + v356;
  unsigned int v327 = HIDWORD(v353) ^ 0x2D713B21 ^ ((HIDWORD(v353) ^ 0x2D713B21u) >> 4) ^ ((HIDWORD(v353) ^ 0x2D713B21u) >> 2);
  int v328 = (v327 & 0x80000 ^ 0x1FBF3F3E) + 2 * (v327 & 0x80000);
  BOOL v112 = ((v328 - 532627262) & v326) == 0;
  int v329 = v328 - 285876736;
  int v330 = 779377788 - v328;
  if (v112) {
    int v330 = v329;
  }
  int v331 = v353 ^ ((v295 ^ 0xA6) + 2096205936) ^ (((v326 - 246750526 + v330) ^ v327 & 0xFFF7FFFF ^ (1515496080 * (v307 ^ 0x97540F7D)))
                                                               - 2
                                                               * (((v326 - 246750526 + v330) ^ v327 & 0xFFF7FFFF ^ (1515496080 * (v307 ^ 0x97540F7D))) & 0x61C9708B ^ ((v326 - 246750526 + v330) ^ v327 & 0xFFF7FFFF) & 3)
                                                               - 506892152);
  unsigned int v332 = v307 ^ LODWORD(STACK[0x390]) ^ (v331 + 480217159 - ((2 * v331) & 0x393F108E));
  v339[STACK[0x218]] = *(_BYTE *)(v311 + (BYTE2(v332) ^ 0xCF) + ((v332 >> 15) & 0x1A8 ^ 0xFFFFFE77) + 213) ^ BYTE2(v332) ^ ((BYTE2(v332) ^ 0xCF) - ((2 * (BYTE2(v332) ^ 0xCF) - 18) & 0xD0) - 33) ^ 0x49;
  int v333 = v316[HIBYTE(v332) ^ 0x6DLL];
  HIDWORD(v334) = v333 ^ 0xB;
  LODWORD(v334) = v333 << 24;
  v339[STACK[0x288]] = (v334 >> 29) ^ 0x50;
  v339[9] = ((v321 ^ 0xCFDDD967) >> 16) ^ 0x94 ^ ((((v321 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                              - ((2 * (((v321 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                                - 18) & 0xD0)
                                                              - 33) ^ *(_BYTE *)(v311
                                                                               + (((v321 ^ 0xCFDDD967) >> 16) ^ 0x40LL)) ^ 0xC;
  unsigned int v335 = (((v332 ^ 0xC8619D52) >> 4) & 0xF0 | ((unsigned __int16)(v332 ^ 0x9D52) >> 12)) ^ 0xE6;
  v339[STACK[0x388]] = *(_BYTE *)(v315 + (((v335 >> 4) & 0xFFFFFF0F | (16 * (v335 & 0xF))) ^ 0xAELL)) ^ (((v335 >> 4) & 0xF | (16 * (v335 & 0xF))) - ((2 * ((v335 >> 4) & 0xF | (16 * (v335 & 0xF)))) & 0xE7) - 13) ^ 0x2B;
  v339[STACK[0x380]] = (((unsigned __int16)(v321 ^ 0xD967) >> 8)
                      + (~((v321 ^ 0xCFDDD967) >> 7) | 0x19)
                      - 12) ^ 0xDB ^ *(_BYTE *)(v315
                                              + (((unsigned __int16)(v321 ^ 0xD967) >> 8) ^ 0xA0LL));
  v339[STACK[0x370]] = (BYTE1(v310) - ((v310 >> 7) & 0xE6) - 13) ^ *(_BYTE *)(v315 + (BYTE1(v310) ^ 0x75LL)) ^ 0x80;
  v339[STACK[0x328]] = v323[v312 ^ 0x95LL] ^ 0xC1;
  v339[STACK[0x2D8]] = v323[v309 ^ 0x7FLL] ^ 0x50;
  v339[STACK[0x398]] = ~v323[v332 ^ 0xFDLL];
  int v336 = v316[BYTE3(v321) ^ 0x49LL];
  int v337 = v325 - 1440184956 - 2 * ((v325 + 16) & 0x2A28857C ^ STACK[0x248] & 8);
  HIDWORD(v334) = v336 ^ 0xB;
  LODWORD(v334) = v336 << 24;
  v339[STACK[0x338]] = (v334 >> 29) ^ 0x2E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t (**)(int, int, int, int, int, int, int, int, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 + 8LL * ((7 * ((v337 ^ 0xAA288570) > 0x14F)) ^ v117)) - 4LL))( 80LL,  v302,  &off_189D4D580,  2538868605LL,  v321,  v312,  v309,  v310,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  v339,  v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v348,  v349,  v350,  v351,  v353,  v356,  2LL,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  11LL,  a42,  a43,  a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

void sub_183D8E574( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, unsigned __int8 a24, int a25, int a26, unsigned __int8 a27, __int16 a28, unsigned __int8 a29, int a30, int a31, int a32, int a33, char a34, int a35, int a36, char a37)
{
  LODWORD(STACK[0x340]) = (a24 | ((a33 ^ 0xC) << 24) | ((a27 ^ 0xEF) << 8) | (((119 * (a37 ^ 0x9F) + 16) ^ a34) << 16)) ^ 0xD526608C;
  LODWORD(STACK[0x2E0]) = a31 ^ 0xF2C9A7;
  LODWORD(STACK[0x368]) = ((a32 << 8) | (a26 << 24) | ((a35 ^ 0x32) << 16) | a30) ^ 0xA655DF29;
  LODWORD(STACK[0x390]) = ((((a36 ^ 0xFB) << 16) + ((a25 ^ 0x1A) << 24)) | a29 | ((LODWORD(STACK[0x3C0]) ^ v37) << 8)) ^ 0xF0E21D6;
  JUMPOUT(0x183D8C558LL);
}

uint64_t sub_183D8E668( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  unint64_t v19 = STACK[0x488];
  STACK[0x5D0] -= 32LL;
  uint64_t v20 = (((a18 | 0x120) + 496) ^ 0xF6F196FB) + 151939941;
  *(_BYTE *)(v19 + v20) = *(_BYTE *)(a13 + v20) ^ *((_BYTE *)*(&off_189D4D580 + ((a18 | 0x120) ^ 0x1A4))
                                                  + (v20 & 0xF)
                                                  - 12) ^ *((_BYTE *)*(&off_189D4D580 + ((a18 | 0x120) ^ 0x177))
                                                          + (v20 & 0xF)
                                                          - 2) ^ (99 * (v20 & 0xF)) ^ *((_BYTE *)*(&off_189D4D580
                                                                                                 + (a18 | 0x120)
                                                                                                 - 184)
                                                                                      + (v20 & 0xF)
                                                                                      - 9) ^ 0x3F;
  return ((uint64_t (*)(void))(*(void *)(v18 + 8LL * (a18 | 0x120)) - 12LL))();
}

void sub_183D8E73C()
{
}

uint64_t sub_183D8E744()
{
  STACK[0x4D0] = STACK[0x4D0] + (v0 ^ 0x3CCu) - 237;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (int)((v0 + 777197006) & 0xD1ACE7FD ^ v0 ^ 0x61E)) - 12LL))();
}

uint64_t sub_183D8E790@<X0>(int a1@<W8>)
{
  uint64_t v3 = (_BYTE *)STACK[0x4B0];
  unsigned int v4 = (~(1 << (((a1 - 85) | 0x14) ^ 0x9D)) | 0xE2DF7523) - 24099472;
  v1[12] = (HIBYTE(v4) ^ 0xFE) - 2 * ((HIBYTE(v4) ^ 0xFE) & 0x3F) + 63;
  v1[13] = (BYTE2(v4) ^ 0x90) - 2 * ((BYTE2(v4) ^ 0x90) & 0x3F) + 63;
  v1[14] = (BYTE1(v4) ^ 0x45) - 2 * ((BYTE1(v4) ^ 0x45) & 0x3F) + 63;
  v1[15] = ((~(1 << (((a1 - 85) | 0x14) ^ 0x9D)) | 0x23) + 112) ^ 0x51;
  v3[16] ^= *v1 ^ 0x3F;
  v3[17] ^= v1[1] ^ 0x3F;
  v3[18] ^= v1[2] ^ 0x3F;
  v3[19] ^= v1[3] ^ 0x3F;
  v3[20] ^= v1[4] ^ 0x3F;
  v3[21] ^= v1[5] ^ 0x3F;
  v3[22] ^= v1[6] ^ 0x3F;
  v3[23] ^= v1[7] ^ 0x3F;
  v3[24] ^= v1[8] ^ 0x3F;
  v3[25] ^= v1[9] ^ 0x3F;
  v3[26] ^= v1[10] ^ 0x3F;
  v3[27] ^= v1[11] ^ 0x3F;
  v3[28] ^= v1[12] ^ 0x3F;
  v3[29] ^= v1[13] ^ 0x3F;
  v3[30] ^= v1[14] ^ 0x3F;
  v3[31] ^= v1[15] ^ 0x3F;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 8LL * (a1 + 5)) - 12LL))( 3806295331LL,  4270867823LL);
}

void sub_183D8E9A4()
{
}

uint64_t sub_183D8E9AC()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((v0 + 358) | 0x81 | (16
                                                              * (LODWORD(STACK[0x464]) != (((((v0 + 358) | 0x81) - 638) | 0xD8) ^ 0x5B7B6993)))))
                            - 12LL))();
}

uint64_t sub_183D8EA2C@<X0>(unsigned int a1@<W3>, unsigned int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((*(_BYTE *)(v5 + a2) != 63) * v3) ^ v2)) - ((v2 + 629) ^ a1 ^ v4)))();
}

uint64_t sub_183D8EA6C()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v0 | (16 * (v1 != (((v0 - 638) | 0xD8) ^ 0x5B7B6993))))) - 12LL))();
}

uint64_t sub_183D8EAA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40)
{
  LODWORD(STACK[0x464]) = 1534814542;
  unint64_t v42 = STACK[0x4B0];
  STACK[0x428] = 335LL;
  *(_BYTE *)(v42 + 335) = (a40 ^ 0xBA) * (a40 + 17);
  return (*(uint64_t (**)(void))(v41
                              + 8LL * ((1931 * (STACK[0x428] == 499 * ((v40 + 478) ^ 0x2B9u) - 998LL)) ^ (v40 + 478))))();
}

void sub_183D8EF70()
{
}

uint64_t sub_183D8EF78()
{
  uint64_t v3 = ((uint64_t (*)(void))STACK[0x2C0])();
  LODWORD(STACK[0x5F0]) = v1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (((v1 == ((v0 - 777) ^ 0xB708568F)) * (v0 ^ 0x432)) ^ v0)))(v3);
}

uint64_t sub_183D8EFB8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = STACK[0x330];
  unint64_t v5 = STACK[0x3B8];
  unint64_t v7 = STACK[0x250];
  STACK[0x398] = STACK[0x250] + 2353;
  STACK[0x390] = v5 + 49;
  STACK[0x388] = v7 + 2333;
  STACK[0x380] = v5 + 29;
  STACK[0x378] = v7 + 2313;
  STACK[0x370] = v5 + 9;
  return v6(1862LL, a2, 1846586532LL, v4);
}

void sub_183D8F854()
{
  LODWORD(STACK[0x5E8]) = v0;
  JUMPOUT(0x183D8F7D8LL);
}

uint64_t sub_183D8F884()
{
  STACK[0x3C0] = v1;
  int v4 = STACK[0x4FC];
  *(_DWORD *)(STACK[0x618] + 4LL * ((LODWORD(STACK[0x4FC]) - 1964513979) >> ((v2 ^ 0xE8) - 51))) = v0;
  v4 += 4;
  LODWORD(STACK[0x4FC]) = v4;
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
}

uint64_t sub_183D90FC0@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W7>, uint64_t a5@<X8>)
{
  int v11 = a2 + v7;
  int v12 = *(_DWORD *)(a5 + 4LL * (a2 + v7 - 8)) ^ *(_DWORD *)(a5 + 4LL * (a2 + v7 - 3));
  int v13 = v12 + (v5 ^ v8 ^ (a4 + 351)) - (a3 & (2 * v12));
  int v14 = *(_DWORD *)(a5 + 4LL * (v11 - 16)) ^ *(_DWORD *)(a5 + 4LL * (v11 - 14));
  HIDWORD(v15) = v14 ^ (v9 - 5) ^ v13;
  LODWORD(v15) = v14 ^ ~v13;
  *(_DWORD *)(a5 + 4LL * (v6 + a2)) = (v15 >> 31) + a4 - (a3 & (2 * (v15 >> 31)));
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((((v6 + 1 + a2) > 0x4F) * a1) ^ v5)) - 8LL))();
}

uint64_t sub_183D91054()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * v0) - 8LL))();
}

void sub_183D91148()
{
}

uint64_t sub_183D91160()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                                     + 8LL
}

void sub_183D91228()
{
}

uint64_t sub_183D91240(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((((a1 + 1 + v6) > 0x3B) * a5) ^ v5)) - 8LL))();
}

uint64_t sub_183D91300(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((51 * ((a3 + 1 + v4) > 0x4F)) ^ v3)) - 8LL))();
}

void sub_183D913B0()
{
  char v9 = (v1 - 125) & 0xDD;
  LODWORD(STACK[0x524]) = v2;
  LODWORD(STACK[0x4DC]) = v4;
  LODWORD(STACK[0x544]) = v3;
  LODWORD(STACK[0x494]) = v5;
  LODWORD(STACK[0x4FC]) = v7 + 80;
  unint64_t v10 = STACK[0x608];
  int v11 = *(_DWORD *)(STACK[0x608] - 0x14F8B44E17D2271ELL);
  LODWORD(STACK[0x3E0]) = v0;
  *(_DWORD *)(v10 - 0x14F8B44E17D2271ELL) = (v11 ^ v8)
                                          + (v0 ^ v8)
                                          + v8
                                          - ((((v11 ^ v8) + (v0 ^ v8)) << (v9 ^ 0xDC)) & v6);
  JUMPOUT(0x183D9146CLL);
}

uint64_t sub_183D91548( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, int a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  unint64_t v63 = STACK[0x530];
  int v64 = *(unsigned __int8 *)(STACK[0x530] - 0x14F8B44E17D22716LL) ^ 0x2B;
  if (v64 == 2) {
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 + 8LL * (int)((104 * (*(_DWORD *)(v63 - 0x14F8B44E17D2271ALL) == 356758273)) ^ (STACK[0x3C8] + 1374)))
  }
                                                                                                  - ((22 * (STACK[0x3C8] ^ 0xCD)) ^ 0x16CLL)))( a1,  445LL,  369LL,  4294967253LL,  115LL,  4294967225LL,  83LL);
  unint64_t v65 = STACK[0x3C8];
  if (v64 == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v62
  }
                                                                                           + 8LL
                                                                                           * (int)((27
                                                                                                  * (((a51 ^ (*(_DWORD *)(v63 - 0x14F8B44E17D2271ALL) == 356758273)) & 1) == 0)) ^ (STACK[0x3C8] + 586))))( a1,  445LL,  4294967253LL,  4294967225LL,  115LL,  83LL);
  STACK[0x510] = 91LL;
  *(_BYTE *)(v63 - 0x14F8B44E17D2271BLL) = ((a62 - 12) ^ 0xBA) * (a62 + 5);
  return ((uint64_t (*)(void))(*(void *)(v62 + 8LL * ((445 * (STACK[0x510] != 0)) ^ ((int)v65 + 482))) - 8LL))();
}

void sub_183D91CF8()
{
}

uint64_t sub_183D91D04()
{
  return ((uint64_t (*)(void))STACK[0x4B8])();
}

uint64_t sub_183D91D34@<X0>(char a1@<W2>, char a2@<W3>, char a3@<W5>, char a4@<W6>, uint64_t a5@<X8>)
{
  unint64_t v10 = (_BYTE *)STACK[0x5B8];
  int v11 = *(_DWORD *)(a5 - 0x14F8B44E17D2272ELL);
  *unint64_t v10 = 13 * (v5 ^ a1) + (HIBYTE(v11) ^ 0x74) - 2 * ((HIBYTE(v11) ^ 0x74) & 0x3F) + 98;
  v10[1] = (a2 ^ BYTE2(v11)) - 2 * ((a2 ^ BYTE2(v11)) & 0x3F) + 63;
  void v10[2] = (a3 ^ BYTE1(v11)) - 2 * ((a3 ^ BYTE1(v11)) & 0x3F) + 63;
  v10[3] = v11 ^ a4;
  unsigned int v12 = *v6 + v8;
  BOOL v13 = v12 < 0x1B44C092;
  BOOL v14 = v7 + 1024156329 < v12;
  return (*(uint64_t (**)(void))(v9 + 8LL * ((583 * !v14) ^ v5)))();
}

void sub_183D91E1C()
{
}

uint64_t sub_183D91E24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, int a41, int a42)
{
  *(_DWORD *)(a4 + 52) = ((((LODWORD(STACK[0x5EC]) ^ a8) + (v42 ^ a8)) % 0x2710) ^ 0xFBFFFE77)
                       + 2145144764
                       + (a42 & (2 * (((LODWORD(STACK[0x5EC]) ^ a8) + (v42 ^ a8)) % 0x2710)));
  int v45 = STACK[0x5F4];
  LODWORD(STACK[0x540]) = STACK[0x5F4];
  return (*(uint64_t (**)(void))(v44 + 8LL * ((582 * (v45 == a8)) ^ (v43 + 16))))();
}

void sub_183D91EA4(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = STACK[0x5AC];
  a4[85] = STACK[0x51C];
  a4[86] = STACK[0x4C4];
  a4[87] = STACK[0x4A4];
  a4[88] = STACK[0x484];
  JUMPOUT(0x183D8BE5CLL);
}

void sub_183D91EDC()
{
  STACK[0x4D0] -= 1616LL;
  LODWORD(STACK[0x540]) = v0 - 38;
  JUMPOUT(0x183D8BE5CLL);
}

uint64_t sub_183D91EFC()
{
  return (*(uint64_t (**)(void))(v1 + 8LL * ((123 * (((v0 ^ 0x4ED ^ (STACK[0x440] == 0)) & 1) == 0)) ^ (v0 + 851))))();
}

uint64_t sub_183D91F90@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x50C]) = v1;
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL * (((2 * (STACK[0x318] == 0)) | (4 * (STACK[0x318] == 0))) ^ (a1 + 318)))
                            - ((a1 + 320) ^ ((a1 - 124) | 0x88u) ^ 0x2F8LL)))();
}

uint64_t sub_183D91F9C()
{
  STACK[0x318] = v0;
  LODWORD(STACK[0x50C]) = v3 + 50;
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL * (((2 * (STACK[0x318] == 0)) | (4 * (STACK[0x318] == 0))) ^ (v1 + 318)))
                            - ((v1 + 320) ^ ((v1 - 124) | 0x88u) ^ 0x2F8LL)))();
}

uint64_t sub_183D9212C()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((245
}

uint64_t sub_183D92178@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  LODWORD(STACK[0x50C]) = v2 + 50;
  unint64_t v4 = STACK[0x5C8];
  BOOL v5 = LODWORD(STACK[0x518]) == 0;
  STACK[0x4F0] = LODWORD(STACK[0x518]);
  return ((uint64_t (*)(uint64_t, unint64_t))(*(void *)(v3
                                                                        + 8LL
                                                                        * (int)((185
                                                                               * ((v5 ^ ((a2 & 0xDD) - 124)) & 1)) ^ ((a2 & 0xB17590DD) + 864)))
                                                            - 4LL))( a1,  v4);
}

uint64_t sub_183D92358@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  unint64_t v4 = ((unint64_t)&STACK[0x4F0] ^ 0xFFFED537FDABFB7FLL)
     + 0x5BAFFEE9AED5FFFBLL
     + ((2LL * (void)&STACK[0x4F0]) & 0xFFFDAA6FFB57F6F0LL);
  unint64_t v5 = a2 - 1;
  STACK[0x4F0] = v5;
  *(_BYTE *)(a1 + v5) = ((v4 - 122) ^ 0xBA) * (v4 - 105);
  return (*(uint64_t (**)(void))(v3 + 8LL * ((1307 * (STACK[0x4F0] == 0)) ^ (v2 + 642))))();
}

void sub_183D923F0()
{
}

void sub_183D923FC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_183D92520()
{
  STACK[0x318] = 0LL;
  unint64_t v1 = STACK[0x3C8];
  int v2 = (STACK[0x3C8] - 123) | 4;
  int v3 = *(_DWORD *)(STACK[0x330] + 56);
  *(_DWORD *)(STACK[0x330] + 56) = v3 + 1;
  unint64_t v4 = (uint64_t (*)(void))(*(void *)(v0
  LODWORD(STACK[0x2EC]) = 126523848;
  return v4();
}

void sub_183D92580()
{
  *(_DWORD *)(v1 - 192) = 1225351577 * (((v1 - 192) & 0x57DCECD1 | ~((v1 - 192) | 0x57DCECD1)) ^ 0xD6DC891C)
                        + 426522784
                        + v0
                        + 131;
  sub_183DB9850((_DWORD *)(v1 - 192));
  *(_BYTE *)(v1 - 160) = (51 * ((~(v1 + 64) & 0xE6 | (v1 + 64) & 0x19) ^ 0x31)) ^ 0x7B;
  *(void *)(v1 - 184) = STACK[0x270];
  *(void *)(v1 - 16_Block_object_dispose(va, 8) = STACK[0x268];
  *(_DWORD *)(v1 - 192) = (v0 + 364) ^ (1224239923 * ((~(v1 - 192) & 0xC031CAE6 | (v1 - 192) & 0x3FCE3519) ^ 0x32823731));
  ((void (*)(uint64_t))STACK[0x260])(v1 - 192);
  STACK[0x318] = 0LL;
  LODWORD(STACK[0x2EC]) = 126523848;
  JUMPOUT(0x183D9265CLL);
}

void sub_183D926A4(uint64_t a1@<X1>, int a2@<W8>)
{
  int v3 = (a2 - 436) | 0x80;
  ((void (*)(void, uint64_t, void))STACK[0x2D0])( *(unsigned int *)STACK[0x2C8],  a1,  (v3 ^ 0xF87566D1) + LODWORD(STACK[0x2EC]));
  *(_DWORD *)(v2 - 192) = 1225351577
                        * ((2 * (((v2 - 192) ^ 0x50DF5AAB) & 0x4A25CCB0) - ((v2 - 192) ^ 0x50DF5AAB) - 1243991221) ^ 0x9BFAF3D2)
                        + 426522784
                        + v3;
  sub_183DB9850((_DWORD *)(v2 - 192));
  JUMPOUT(0x183D92738LL);
}

uint64_t sub_183D92780(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL);
  if (v2 - 1756409276 < 0) {
    unsigned int v3 = 1756409276 - v2;
  }
  else {
    unsigned int v3 = v2 - 1756409276;
  }
  int v1 = 108757529 * ((((2 * a1) | 0xF677E1C4) - a1 - 2067525858) ^ 0x9BA792C9);
  return (*(uint64_t (**)(void))((char *)*(&off_189D4D580 + (*(_DWORD *)a1 ^ v1 ^ 0x530))
                              + 8
                              * ((((*(_DWORD *)(a1 + 4) + v1 - 908458790) >= 4 * (unint64_t)v3)
                                * (*(_DWORD *)a1 ^ v1 ^ 0x583)) ^ *(_DWORD *)a1 ^ v1)
                              - 12))();
}

uint64_t sub_183D92844(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1
                                                               + 8LL
                                                               * ((((v3 ^ 0x350) - 1590) * (v2 != 908458790)) | v3 ^ 0x350))
                                                   - ((6 * (v3 ^ 0x58Du)) ^ 0x566LL)))( a1,  101290452LL);
}

uint64_t sub_183D92898(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v1 + 11144) - 8LL))( a1,  (v3 - 1527) | 0x214u,  1677759979LL,  v2);
}

uint64_t sub_183D92918@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W3>, int a4@<W8>)
{
  *(_BYTE *)(*(void *)(a1 + 8) + (a3 + a4)) = ((a2 ^ v6) >> v7) - 2 * (((a2 ^ v6) >> v7) & 0x3F) + 63;
  return (*(uint64_t (**)(void))(v4 + 8LL * ((1653 * (a3 - 1 == ((v8 + 540961487) & 0xDFC1977B) + v5)) ^ v8)))();
}

uint64_t sub_183D9297C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3
                                                                                + 8LL
                                                                                * (((v5 == 24) * ((v6 - 200) ^ 0x571)) ^ (v6 - 200)))
                                                                    - 8LL))( a1,  (v6 - 200),  a3,  v4);
}

uint64_t sub_183D929B4(uint64_t a1, uint64_t a2)
{
  BOOL v7 = v5 + 2123208680 > ((a2 - 256460376) & 0xF49471F ^ 0x79C9BA0C) || v5 + 2123208680 < v4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2
                                                                                 + 8LL
                                                                                 * (int)(((2 * v7) | (32 * v7)) ^ a2))
                                                                     - 8LL))( a1,  a2,  1677759979LL,  v3);
}

uint64_t sub_183D92A18@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  return sub_183D92918(a1, *(_DWORD *)(*v4 + 4LL * (v5 - 2067539019 + 17 * (a2 ^ 0x278))), v3, a3);
}

uint64_t sub_183D92A4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

void sub_183D92A54(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X17 }

uint64_t sub_183D92BB0()
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8LL
                                            * ((107 * ((v1 ^ 0xCF4CF6DE) != ((v0 - 553) | 4) - 1228)) ^ (v0 - 437))))(593524734LL);
}

uint64_t sub_183D92C04(int a1)
{
  *(_BYTE *)(*(void *)(v10 - 120) + (a1 - 593524734)) = *(_BYTE *)(v1 + (a1 - 593524734)) ^ *(_BYTE *)(v3 + ((a1 - 593524734) & 0xFLL)) ^ *(_BYTE *)(v2 + ((a1 - 593524734) & 0xFLL)) ^ *(_BYTE *)(v4 + ((a1 - 593524734) & 0xFLL)) ^ (97 * ((a1 + 2) & 0xF)) ^ 0x3F;
  int v11 = (v6 ^ 0x60F) + a1;
  unsigned int v12 = a1 + 171074284;
  uint64_t v13 = (v11 - 1227);
  int v14 = (v7 > 0xD26D2516) ^ (v12 < v5 + 707);
  BOOL v15 = v12 < v8;
  if (v14) {
    BOOL v15 = v7 > 0xD26D2516;
  }
  return ((uint64_t (*)(uint64_t))(*(void *)(v9 + 8LL * ((1278 * v15) ^ v6)) - 4LL))(v13);
}

uint64_t sub_183D92CB0()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (int)(((307 * ((v0 + 231562042) & 0xF232A6EE ^ 0x4E8) - 2)
                                               * (((2 * v1) & 0xBF35D7DE ^ 0x9E11C59C) + (v1 ^ 0x90D61D31) - 1418905954 != 185082509)) ^ v0))
                            - 4LL))();
}

uint64_t sub_183D92D34(uint64_t a1, int a2, int a3, int a4)
{
}

uint64_t sub_183D92DA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
}

uint64_t sub_183D92DE8(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  uint64_t v12 = (a3 + a2 + a6);
  uint64_t v13 = v12 + v6;
  uint64_t v14 = v12 + *(void *)(v11 - 120);
  uint64_t v15 = (a3 + a2) & 0xF;
  unint64_t v16 = v15 + v8 - v14;
  unint64_t v17 = (v15 | v7) - v14;
  unint64_t v18 = (v15 | v9) - v14;
  BOOL v22 = (unint64_t)(v13 - v14) < 0x10
     || v16 < 0x10
     || v17 < 0x10
     || v18 < (unint64_t)((a4 + 947) | 0x2B0u) - 1761;
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL
}

uint64_t sub_183D92E78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9 + 8LL * ((149 * (v8 > 0xF)) ^ a8)) - 12LL))();
}

uint64_t sub_183D92EB4( uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  v60.val[1].i64[0] = v48 & 0xF;
  v60.val[1].i64[1] = (v48 - 1) & 0xF;
  v60.val[2].i64[0] = (v48 + 14) & 0xF;
  v60.val[2].i64[1] = (v48 + 13) & 0xF;
  v60.val[3].i64[0] = (v48 + 12) & 0xF;
  v60.val[3].i64[1] = (v48 + 11) & 0xF;
  v61.val[0].i64[0] = (v48 + 10) & 0xF;
  v61.val[0].i64[1] = (v48 + 9) & 0xF;
  v61.val[1].i64[0] = (v48 + 8) & 0xF;
  v61.val[1].i64[1] = (v48 + 7) & 0xF;
  unsigned int v51 = a3 + a2 + a6;
  v61.val[2].i64[0] = (v48 + 6) & 0xF;
  v61.val[2].i64[1] = (v48 + 5) & 0xF;
  v61.val[3].i64[0] = (v48 + 4) & 0xF;
  v61.val[3].i64[1] = (v48 + 3) & 0xF;
  unsigned int v52 = (v49 & 0xFFFFFFF0) - 16;
  v53.i64[0] = 0x6161616161616161LL;
  v53.i64[1] = 0x6161616161616161LL;
  v54.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v54.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
  uint64_t v55 = (((a8 + 149) | 0xC2) - 692) & v51;
  v60.val[0].i64[0] = v55;
  v60.val[0].i64[1] = (v48 + 1) & 0xF;
  v56.i64[0] = vqtbl4q_s8(v60, (int8x16_t)xmmword_183DC1520).u64[0];
  v56.i64[1] = vqtbl4q_s8(v61, (int8x16_t)xmmword_183DC1520).u64[0];
  int8x16_t v57 = vrev64q_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v44 - 15 + v51), *(int8x16_t *)(v46 + v55 - 15)),  veorq_s8(*(int8x16_t *)(v45 + v55 - 15), *(int8x16_t *)(v47 + v55 - 15))));
  int8x16_t v58 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v57, v57, 8uLL), v54), vmulq_s8(v56, v53)));
  *(int8x16_t *)(*(void *)(v50 - 120) - 15LL + v51) = vextq_s8(v58, v58, 8uLL);
  return ((uint64_t (*)(void))(*(void *)(a44 + 8LL * ((1532 * (v52 == 0)) ^ (a8 + 491))) - 8LL))();
}

void sub_183D9302C()
{
}

uint64_t sub_183D93038()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((27 * (((v0 == v3) ^ (v1 + 64)) & 1)) ^ v1))
                            - ((4 * v1) ^ 0xFC0u)
                            + 1224LL))();
}

uint64_t sub_183D93074()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((434
                                          * (((((((v1 - 705) | 0xDC) + 362) | 0x180) ^ 0x3C0) & v0) != ((((v1 - 705) | 0xDC) + 16377631) & 0xFF061EF3) - 1777)) ^ ((v1 - 705) | 0xDC)))
                            - 12LL))();
}

uint64_t sub_183D930D0( char a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  *(_DWORD *)(v52 - 152) = v51;
  int v54 = ((v50 ^ 0x79) - 953) & v51;
  *(void *)(v52 - 12_Block_object_dispose(va, 8) = v44 - 7;
  *(void *)(v52 - 144) = *(void *)(v52 - 120) - 7LL;
  *(_DWORD *)(v52 - 160) = v54;
  char v55 = a1 + a3 + a2;
  *(_DWORD *)(v52 - 132) = v50 ^ 0x79;
  uint64_t v56 = v49 - v53 + ((((v50 ^ 0x79) - 727) | 4) ^ (v48 + 58));
  v58.val[0].i64[0] = ((_BYTE)v49
                     - (_BYTE)v53
                     + ((((v50 ^ 0x79) + 41) | 4) ^ (v48 + 58))) & 0xF;
  v58.val[0].i64[1] = (v55 + 1 - (_BYTE)v53) & 0xF;
  v58.val[1].i64[0] = (v49 - v53) & 0xFLL;
  v58.val[1].i64[1] = (v55 + 15 - (_BYTE)v53) & 0xF;
  v58.val[2].i64[0] = (v55 + 14 - (_BYTE)v53) & 0xF;
  v58.val[2].i64[1] = (v55 + 13 - (_BYTE)v53) & 0xF;
  v58.val[3].i64[0] = (v55 + 12 - (_BYTE)v53) & 0xF;
  v58.val[3].i64[1] = (v55 + 11 - (_BYTE)v53) & 0xF;
  *(int8x8_t *)(*(void *)(v52 - 144) + v56) = vrev64_s8( veor_s8( veor_s8( vrev64_s8( veor_s8( veor_s8( *(int8x8_t *)(*(void *)(v52 - 128) + v56),  *(int8x8_t *)(v46 + (v56 & 0xF) - 7)),  veor_s8( *(int8x8_t *)(v45 + (v56 & 0xF) - 7),  *(int8x8_t *)(v47 + (v56 & 0xF) - 7)))),  (int8x8_t)0x3F3F3F3F3F3F3F3FLL),  vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8( v58,  (int8x16_t)xmmword_183DC1530),  (int8x8_t)0x6161616161616161LL)));
}

void sub_183D93230()
{
}

uint64_t sub_183D93254()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (v0 ^ (1443 * (*(_DWORD *)(v2 - 152) == *(_DWORD *)(v2 - 160)))))
                            - ((v0 + 340923393) & 0xEBADEFEC)
                            + 1216LL))();
}

uint64_t sub_183D932A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  *(_BYTE *)(*(void *)(v14 - 120) + (a5 + v12)) = *(_BYTE *)(v7 + (a5 + v12)) ^ *(_BYTE *)(v9 + ((a5 + v12) & 0xFLL)) ^ *(_BYTE *)(v8 + (((_BYTE)a5 + (_BYTE)v12) & 0xF)) ^ *(_BYTE *)(v10 + (((_BYTE)a5 + (_BYTE)v12) & 0xF)) ^ (97 * ((a5 + v12) & 0xF)) ^ 0x3F;
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * (((a5 - 1 == v11) * ((2 * a7) ^ 0x847)) ^ (a7 - 1561))) - 12LL))();
}

uint64_t sub_183D93314( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  uint64_t v39 = *(void *)(v36 + 24);
  *(int8x16_t *)(v38 - 112) = veorq_s8( *(int8x16_t *)(*(void *)(v36 + 40) - 0x17594DE9181849F3LL),  (int8x16_t)xmmword_183DC1540);
  if (*(void *)(v38 - 120)) {
    BOOL v40 = v39 == 0x35AD11BEDFA3F43ALL;
  }
  else {
    BOOL v40 = 1;
  }
  int v41 = !v40;
  HIDWORD(a12) = 2 * v35;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8LL * (int)((v41 * (((a6 - 1203) | 0x260) - 297)) ^ a6)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35);
}

uint64_t sub_183D93398( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  BOOL v38 = (((((a6 ^ 1) - 84) ^ 0xC) + (BYTE4(a12) & 0xD6) + (v35 ^ 0xEB)) & 0xF) == 0
     && (HIDWORD(a12) & 0xFE65EDD6) + (v35 ^ 0x7F32F6EB) != 2134046443;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8LL * (int)((365 * v38) ^ a6)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35);
}

uint64_t sub_183D933F8@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  int v41 = v39 + 804;
  uint64_t v42 = (uint64_t)*(&off_189D4D580 + (v39 ^ 0x317));
  int v43 = *(unsigned __int8 *)(v42 + (*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F439LL) ^ 0x85LL));
  HIDWORD(v44) = (v39 + 804) ^ v43 ^ 0x1C;
  LODWORD(v44) = ~v43 << 24;
  int v45 = (v44 >> 30) ^ 0x9F;
  uint64_t v46 = (char *)*(&off_189D4D580 + v39 - 774) - 8;
  int v47 = v46[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F42FLL) ^ 0xBFLL];
  HIDWORD(v44) = v47 ^ 0xC;
  LODWORD(v44) = (v47 ^ 0x20) << 24;
  LOBYTE(v47) = v44 >> 28;
  int v48 = *(unsigned __int8 *)(v42 + (*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F435LL) ^ 0x6FLL));
  HIDWORD(v44) = v48 ^ 0x2D;
  LODWORD(v44) = ~v48 << 24;
  int v49 = (char *)*(&off_189D4D580 + v39 - 750) - 8;
  int v50 = (char *)*(&off_189D4D580 + v39 - 926) - 8;
  char v51 = v50[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F42ELL) ^ 0xD8LL];
  int v52 = v46[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F42BLL) ^ 0xBCLL];
  int v53 = (((v44 >> 30) ^ 0x68) << 16) | ((v49[*(unsigned __int8 *)(v38
                                                                                                  - 0x35AD11BEDFA3F434LL) ^ 0xDFLL] ^ 0x4A) << 8);
  HIDWORD(v44) = v52 ^ 0xC;
  LODWORD(v44) = (v52 ^ 0x20) << 24;
  unsigned __int8 v54 = v44 >> 28;
  uint64_t v55 = v54 ^ 0x68LL;
  int v56 = v46[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F433LL) ^ 0x98LL];
  HIDWORD(v44) = v56 ^ 0xC;
  LODWORD(v44) = (v56 ^ 0x20) << 24;
  unsigned int v57 = v53 & 0xFFFFFF00 | ((v50[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F436LL) ^ 0xAFLL] ^ 0x63) << 24) | (v44 >> 28);
  int v58 = (v45 << 16) | ((v49[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F438LL) ^ 0x49LL] ^ 0xC0) << 8) | ((v50[*v37 ^ 0xFELL] ^ 0xBA) << 24);
  LODWORD(v46) = v46[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F437LL) ^ 0xD0LL];
  HIDWORD(v44) = v46 ^ 0xC;
  LODWORD(v44) = (v46 ^ 0x20) << 24;
  int v59 = *(unsigned __int8 *)(v42 + (*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F42DLL) ^ 0xB6LL));
  LOBYTE(v46) = (v44 >> 28) ^ 0x3C;
  HIDWORD(v44) = v59 ^ 0x2D;
  LODWORD(v44) = ~v59 << 24;
  uint64_t v60 = (v44 >> 30) ^ 0x21LL;
  LODWORD(v42) = *(unsigned __int8 *)(v42 + (*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F431LL) ^ 0xC8LL));
  HIDWORD(v44) = v42 ^ 0x2D;
  LODWORD(v44) = ~(_DWORD)v42 << 24;
  unint64_t v61 = (((v49[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F42CLL) ^ 0xC7LL] ^ 0x8BLL) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v51 ^ 0xB3u) << 24) | (v60 << 16) | v55) ^ 0x75F49EF4;
  uint64_t v62 = ((unsigned __int16)((((v49[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F42CLL) ^ 0xC7LL] ^ 0x8B) << 8) | v55) ^ 0x9EF4) >> 8);
  unsigned int v63 = v47 | ((v49[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F430LL) ^ 0xB7LL] ^ 0x6B) << 8) & 0xFF00FFFF | (((v44 >> 30) ^ 0x37) << 16) | ((v50[*(unsigned __int8 *)(v38 - 0x35AD11BEDFA3F432LL) ^ 0x18LL] ^ 0xFC) << 24);
  int v64 = (char *)*(&off_189D4D580 + (v39 ^ 0x3D6)) - 12;
  int v65 = (v62 - ((2 * (v61 >> 8)) & 0x34) - 961749734) ^ *(_DWORD *)&v64[4 * (v62 ^ 0xF5)];
  int v66 = (char *)*(&off_189D4D580 + (v39 ^ 0x395)) - 12;
  int v67 = *(_DWORD *)&v66[4 * (v51 ^ 0xAC)];
  HIDWORD(v44) = ~v67;
  LODWORD(v44) = v67 ^ 0xF475D84C;
  uint64_t v68 = (uint64_t)*(&off_189D4D580 + (v39 ^ 0x3C0));
  LODWORD(v60) = (v44 >> 2) ^ *(_DWORD *)(v68 + 4LL * (v60 ^ 0xDD)) ^ (v65
                                                                                   - ((2 * v65) & 0x9D3464B2)
                                                                                   + 1318728281);
  uint64_t v69 = (uint64_t)*(&off_189D4D580 + v39 - 880);
  unsigned int v238 = v58 & 0xFFFFFF00 | v46;
  int v70 = *(_DWORD *)(v69 + 4LL * (v54 ^ 0xD9u)) ^ v238 ^ (v60 - ((2 * v60) & 0xEAD79920) - 177484656);
  uint64_t v71 = v57;
  unsigned int v236 = v63;
  int v234 = v70 ^ v57 ^ 0x2789BBD4;
  int v72 = v63 ^ 0xE6 ^ v234;
  LODWORD(v46) = *(_DWORD *)&v66[4 * (((v72 ^ v61) >> 24) ^ 0x21)];
  HIDWORD(v44) = ~(_DWORD)v46;
  LODWORD(v44) = v46 ^ 0xF475D84C;
  LODWORD(v46) = ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xEAD79920) - 177484656) ^ *(_DWORD *)(v69
                                                                                        + 4LL
                                                                                        * ((v72 ^ v61) ^ 0xDEu));
  HIDWORD(v232) = v72 ^ v61;
  int v235 = v70;
  LODWORD(v232) = *(_DWORD *)&v64[4 * (((unsigned __int16)(v72 ^ v61) >> 8) ^ 0x1E)] ^ *(_DWORD *)(v68 + 4LL * (((v72 ^ v61) >> 16) ^ 0x8Fu)) ^ v70 ^ ((((unsigned __int16)(v72 ^ v61) >> 8) ^ 0xEB) - ((2 * (((v72 ^ v61) >> 8) ^ 0x4BA6EB)) & 0x34) - 961749734) ^ ((_DWORD)v46 - ((2 * (_DWORD)v46) & 0x9D3464B2) + 1318728281);
  int v73 = v232 ^ 0x76E748E2 ^ v70 ^ v57;
  int v237 = v61;
  int v74 = *(_DWORD *)&v66[4 * (((v73 ^ v61) >> 24) ^ 0xA2)];
  HIDWORD(v44) = ~v74;
  LODWORD(v44) = v74 ^ 0xF475D84C;
  unsigned int v75 = v73 ^ v61 ^ 0xC84590C6;
  int v76 = *(_DWORD *)&v64[4 * (BYTE1(v75) ^ 0xF5)] ^ *(_DWORD *)(v68
                                                             + 4LL
                                                             * (((v73 ^ v61) >> 16) ^ 0x6Cu)) ^ (BYTE1(v75) - ((v75 >> 7) & 0x34) - 961749734) ^ ((v44 >> 2) - ((2 * (v44 >> 2)) & 0x9D3464B2) + 1318728281);
  HIDWORD(v230) = v232 ^ 0x76E748E2 ^ *(_DWORD *)(v69 + 4LL * ((v73 ^ v61) ^ 0x83u)) ^ (v76 - ((2 * v76) & 0xEAD79920) - 177484656);
  LODWORD(v231) = v73 ^ v61;
  LODWORD(v60) = HIDWORD(v230) ^ 0x2789BBD4 ^ v73 ^ 0x8EDEEA78;
  int v233 = v72;
  HIDWORD(v231) = v73;
  HIDWORD(v229) = v73 ^ v72;
  LODWORD(v230) = HIDWORD(v230) ^ 0x2789BBD4 ^ v73;
  int v77 = v60 ^ v73 ^ v72;
  int v78 = *(_DWORD *)&v66[4 * (((v77 ^ v75) >> 24) ^ 0x67)];
  HIDWORD(v44) = ~v78;
  LODWORD(v44) = v78 ^ 0xF475D84C;
  int v79 = (v44 >> 2) ^ *(_DWORD *)&v64[4 * (((unsigned __int16)(v77 ^ v75) >> 8) ^ 0x97)] ^ ((((unsigned __int16)(v77 ^ v75) >> 8) ^ 0x62) - ((2 * (((v77 ^ v75) >> 8) ^ 0xD8B62)) & 0x34) - 961749734);
  unsigned int v80 = (v79 - ((2 * v79) & 0xEAD79920) - 177484656) ^ *(_DWORD *)(v69 + 4LL * ((v77 ^ v75) ^ 0xE1u));
  unsigned int v81 = HIDWORD(v230) ^ 0x2789BBD4 ^ *(_DWORD *)(v68 + 4LL * (((v77 ^ v75 ^ 0x2142BA5) >> 16) ^ 0xB6u)) ^ (v80 - ((2 * v80) & 0x9D3464B2) + 1318728281);
  HIDWORD(v22_Block_object_dispose(va, 8) = v77 ^ v75;
  LODWORD(v229) = v77;
  HIDWORD(v227) = v81 ^ v60;
  int v82 = v81 ^ v60 ^ 0x307C325C;
  LODWORD(v227) = v82 ^ v77 ^ 0x5EF1BA37;
  LODWORD(v46) = *(_DWORD *)&v66[4 * (((v227 ^ v77 ^ v75) >> 24) ^ 0xA4)];
  HIDWORD(v44) = ~(_DWORD)v46;
  LODWORD(v44) = v46 ^ 0xF475D84C;
  LODWORD(v46) = ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xEAD79920) - 177484656) ^ *(_DWORD *)(v69
                                                                                        + 4LL
                                                                                        * ((v227 ^ v77 ^ v75) ^ 0x18u));
  unsigned int v83 = v227 ^ v77 ^ v75 ^ 0xCEE37B5D;
  HIDWORD(v226) = v227 ^ v77 ^ v75;
  LODWORD(v22_Block_object_dispose(va, 8) = v81;
  unsigned int v84 = *(_DWORD *)(v68 + 4LL * (BYTE6(v226) ^ 0xCAu)) ^ *(_DWORD *)&v64[4 * (BYTE1(v83) ^ 0xF5)] ^ v81 ^ (BYTE1(v83) - ((v83 >> 7) & 0x34) - 961749734) ^ 0x1392323A ^ ((_DWORD)v46 - ((2 * (_DWORD)v46) & 0x9D3464B2) + 1318728281);
  int v85 = v84 ^ ((v77 ^ 0x5EF1BA37) - ((2 * (v77 ^ 0x5EF1BA37)) & 0x27246474) + 328348218);
  LODWORD(v60) = *(_DWORD *)&v66[4 * (((v85 ^ v83) >> 24) ^ 0x70)];
  HIDWORD(v44) = ~(_DWORD)v60;
  LODWORD(v44) = v60 ^ 0xF475D84C;
  LODWORD(v60) = ((v44 >> 2) - ((2 * (v44 >> 2)) & 0x9D3464B2) + 1318728281) ^ *(_DWORD *)(v68
                                                                                         + 4LL
                                                                                         * (((v85 ^ v83 ^ 0xF3443494) >> 16) ^ 0xE4u));
  LODWORD(v60) = (v60 - ((2 * v60) & 0xEAD79920) - 177484656) ^ *(_DWORD *)(v69
                                                                          + 4LL * ((v85 ^ v83) ^ 0x91u));
  LODWORD(v225) = v85 ^ v83;
  int v86 = v85 ^ v83 ^ 0x1A89BBD4;
  LODWORD(v60) = (v60 - ((2 * v60) & 0x8D59BA34) - 961749734) ^ *(_DWORD *)&v64[4 * (BYTE1(v86) ^ 0xF5)];
  int v87 = v84 ^ BYTE1(v86) ^ (v60 - ((2 * v60) & 0x27246474) + 328348218);
  HIDWORD(v225) = v85;
  LODWORD(v226) = v84;
  LODWORD(v224) = v84 ^ (v82 - ((2 * v82) & 0x27246474) + 328348218);
  HIDWORD(v223) = v87 ^ v224;
  LODWORD(v60) = v87 ^ v224 ^ 0xE6F58988;
  int v88 = v60 ^ v85;
  unsigned int v89 = v60 ^ v85 ^ v86;
  int v90 = *(_DWORD *)&v66[4 * (HIBYTE(v89) ^ 0x43)];
  HIDWORD(v44) = ~v90;
  LODWORD(v44) = v90 ^ 0xF475D84C;
  *(void *)((char *)&v223 + 4) = __PAIR64__(v60 ^ v85, v89);
  int v91 = v89 ^ 0x299B7ABE;
  int v92 = *(_DWORD *)&v64[4 * (((unsigned __int16)(v89 ^ 0x7ABE) >> 8) ^ 0xF5)] ^ *(_DWORD *)(v68 + 4LL * (((v89 ^ 0x4D501F31) >> 16) ^ 0xE2u)) ^ (((unsigned __int16)(v89 ^ 0x7ABE) >> 8) - (((v89 ^ 0x299B7ABE) >> 7) & 0x34) - 961749734) ^ ((v44 >> 2) - ((2 * (v44 >> 2)) & 0x9D3464B2) + 1318728281);
  HIDWORD(v224) = v87;
  unsigned int v93 = v87 ^ *(_DWORD *)(v69 + 4LL * (v89 ^ 0xFBu)) ^ (v92 - ((2 * v92) & 0xEAD79920) - 177484656);
  HIDWORD(v222) = v93 ^ v60;
  LODWORD(v60) = v93 ^ v60 ^ 0x5BF36347;
  LODWORD(v222) = v60 ^ v88;
  LODWORD(v46) = v60 ^ v88 ^ 0x2745D0FF;
  unsigned int v94 = v46 ^ v91 ^ 0x516EF336;
  unsigned int v95 = v46 ^ v91 ^ 0x3DCC6B2B;
  int v96 = (((unsigned __int16)((unsigned __int16)v46 ^ v91 ^ 0x6B2B) >> 8)
       - ((v95 >> 7) & 0x34)
       - 961749734) ^ *(_DWORD *)&v64[4
                                    * (((unsigned __int16)((unsigned __int16)v46 ^ v91 ^ 0x6B2B) >> 8) ^ 0xF5)];
  HIDWORD(v221) = v46 ^ v91;
  LODWORD(v61) = *(_DWORD *)&v66[4 * (((v46 ^ v91) >> 24) ^ 0x57)];
  unsigned int v97 = (v96 - ((2 * v96) & 0xEAD79920) - 177484656) ^ *(_DWORD *)(v69
                                                                 + 4LL * ((~(v60 ^ v88) ^ v91) ^ 0x6Eu));
  HIDWORD(v44) = ~(_DWORD)v61;
  LODWORD(v44) = v61 ^ 0xF475D84C;
  LODWORD(v223) = v93;
  LODWORD(v221) = (v44 >> 2) ^ *(_DWORD *)(v68 + 4LL * (BYTE2(v94) ^ 0x8Bu)) ^ v93 ^ (v97
                                                                                    - ((2 * v97) & 0x9D3464B2)
                                                                                    + 1318728281);
  int v98 = v221 ^ 0x930000ED ^ v60;
  LODWORD(v220) = v98 ^ 0x8D06EA22 ^ v46;
  unsigned int v99 = v220 ^ v95;
  int v100 = v220 ^ v95 ^ 0x9289BB39;
  LODWORD(v61) = ((unsigned __int16)(v99 ^ 0xAA41) >> 8);
  HIDWORD(v219) = v99;
  int v101 = *(_DWORD *)&v66[4 * (HIBYTE(v99) ^ 0x39)];
  HIDWORD(v44) = ~v101;
  LODWORD(v44) = v101 ^ 0xF475D84C;
  int v102 = *(_DWORD *)&v64[4 * (v61 ^ 0xF5)] ^ *(_DWORD *)(v69 + 4LL * (v100 ^ 0x3Du)) ^ (v44 >> 2);
  int v103 = *(_DWORD *)(v68 + 4LL * (BYTE2(v100) ^ 0x7Eu)) ^ v221 ^ 0x930000ED ^ v61 ^ 0xE906C3E5 ^ ((v102 ^ 0x33C7118A)
                                                                                                - 2
                                                                                                * ((v102 ^ 0x33C7118A) & 0x4E9A325D ^ v102 & 4)
                                                                                                + 1318728281);
  HIDWORD(v220) = v98;
  LODWORD(v46) = v103 ^ ((_DWORD)v46 - ((2 * (_DWORD)v46) & 0xD20D87CA) - 385432603);
  unsigned int v104 = v46 ^ v99 ^ 0x53DEAA41;
  LODWORD(v66) = *(_DWORD *)&v66[4 * (HIBYTE(v104) ^ 0x44)];
  HIDWORD(v44) = ~(_DWORD)v66;
  LODWORD(v44) = v66 ^ 0xF475D84C;
  LODWORD(v49) = (v98 ^ 0x8D06EA22) - 2 * ((v98 ^ 0x8D06EA22) & 0x6906C3F5 ^ v98 & 0x10);
  LODWORD(v60) = *(_DWORD *)&v64[4 * (BYTE1(v104) ^ 0xFD)] ^ *(_DWORD *)(v69
                                                                       + 4LL
                                                                       * (v46 ^ v99 ^ 0x41 ^ 0xC4u)) ^ ((BYTE1(v104) ^ 8) - 2 * ((BYTE1(v104) ^ 8) & 0x1F ^ (v104 >> 8) & 5) - 961749734) ^ ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xEAD79920) - 177484656);
  HIDWORD(a16) = v104 ^ 0xA568A5C2;
  LODWORD(v60) = (v60 - ((2 * v60) & 0x9D3464B2) + 1318728281) ^ *(_DWORD *)(v68 + 4LL * (BYTE2(v104) ^ 0x16u));
  int v105 = v60 - ((2 * v60) & 0xD20D87CA);
  unsigned int v106 = (char *)*(&off_189D4D580 + v39 - 786) - 4;
  LODWORD(v60) = v106[*(unsigned __int8 *)(v40 - 109) ^ 0xA5LL];
  HIDWORD(v44) = v60 ^ 0x32;
  LODWORD(v44) = ~(_DWORD)v60 << 24;
  int v107 = (char *)*(&off_189D4D580 + (v39 ^ 0x31E)) - 12;
  int v108 = (char *)*(&off_189D4D580 + (v39 ^ 0x3CB)) - 4;
  int v109 = (char *)*(&off_189D4D580 + v39 - 839) - 4;
  int v218 = v106;
  unsigned int v110 = (v106[*(unsigned __int8 *)(v40 - 97) ^ 0x7BLL] ^ 0x8D) & 0xFFFF00FF | ((((*(_BYTE *)(v40 - 98) ^ 0xD0) + v107[*(unsigned __int8 *)(v40 - 98) ^ 0xDFLL] + 62) ^ 0xE4) << 8) | ((v108[*(unsigned __int8 *)(v40 - 99) ^ 0xAALL] ^ 0xD3) << 16);
  unsigned int v217 = v107;
  unsigned int v215 = v109;
  int v216 = v108;
  unsigned int v111 = (v106[*(unsigned __int8 *)(v40 - 105) ^ 0x28LL] ^ 0xF8) & 0xFFFF00FF | ((((*(_BYTE *)(v40 - 106) ^ 0xAC) + v107[*(unsigned __int8 *)(v40 - 106) ^ 0xA3LL] + 62) ^ 0xF6) << 8) | ((v109[*(unsigned __int8 *)(v40 - 108) ^ 0xB2LL] ^ 0xD2) << 24) | ((v108[*(unsigned __int8 *)(v40 - 107) ^ 0x27LL] ^ 0x85) << 16);
  int v112 = (((((v44 >> 30) ^ 0xDB) >> 2) | (((v44 >> 30) ^ 0xDB) << 6)) | ((v108[*(unsigned __int8 *)(v40 - 111) ^ 0x7ALL] ^ 0xB0) << 16) | ((v109[*(unsigned __int8 *)(v40 - 112) ^ 0x78LL] ^ 0xD0) << 24) | (((v107[*(unsigned __int8 *)(v40 - 110) ^ 0x5DLL] + (*(_BYTE *)(v40 - 110) ^ 0x52) + 62) ^ 0x5D) << 8)) ^ 0x4D436D2C;
  LODWORD(v10_Block_object_dispose(va, 8) = ((v106[*(unsigned __int8 *)(v40 - 101) ^ 0x60LL] ^ 0x39) & 0xFFFF00FF | ((v108[*(unsigned __int8 *)(v40 - 103) ^ 5LL] ^ 0xE1) << 16) | (((v107[*(unsigned __int8 *)(v40 - 102) ^ 4LL] + (*(_BYTE *)(v40 - 102) ^ 0xB) + 62) ^ 0x33) << 8) | ((v109[*(unsigned __int8 *)(v40 - 104) ^ 0x1CLL] ^ 0x25) << 24)) ^ 0xB3F00D5C;
  unsigned int v113 = v111 ^ 0x8D560026;
  unsigned int v114 = (v110 | ((v109[*(unsigned __int8 *)(v40 - 100) ^ 0x45LL] ^ 0xEA) << 24)) ^ 0xC2E06911;
  HIDWORD(v214) = a1 - 2134046443;
  HIDWORD(v213) = v41 ^ 0x6A0;
  LODWORD(v213) = v41 ^ 0x6FE;
  LODWORD(v212) = v103 ^ ((_DWORD)v49 - 385432603);
  HIDWORD(v212) = v41 ^ 0x69B;
  HIDWORD(v211) = v41 ^ 0x6BE;
  *(_DWORD *)(v40 - 12_Block_object_dispose(va, 8) = v41;
  LODWORD(v219) = v103;
  HIDWORD(v210) = (v105 - 385432603) ^ v103;
  LODWORD(v211) = v41 ^ 0x65B;
  HIDWORD(a14) = v46 ^ 0x626A2240;
  LODWORD(v214) = ((_DWORD)v49 - 385432603) ^ 0x3DC8BA5D ^ (v105 - 385432603);
  LODWORD(v210) = v214 ^ v46 ^ 0x626A2240;
  int v115 = *(_DWORD *)(v40 - 128) ^ 0x488;
  *(void *)(v40 - 224) = 7LL;
  unsigned int v116 = *(unsigned __int8 **)(v40 - 120);
  uint64_t v117 = v116[7];
  *(void *)(v40 - 160) = 12LL;
  LODWORD(v62) = v106[v117 ^ 0x41];
  uint64_t v118 = v116[12] ^ 0x60LL;
  uint64_t v119 = v115 ^ 0x271u;
  *(void *)(v40 - 16_Block_object_dispose(va, 8) = v119;
  *(void *)(v40 - 144) = 1LL;
  int v120 = v109[v118] ^ 0x51;
  LODWORD(v66) = v109[v116[v119] ^ 0xC1LL] ^ 0xE5;
  LODWORD(v11_Block_object_dispose(va, 8) = v216[v116[1] ^ 0x66LL] ^ 0x5C;
  *(void *)(v40 - 152) = 15LL;
  int v121 = (_DWORD)v118 << 16;
  uint64_t v122 = v116[15] ^ 0xE9LL;
  *(void *)(v40 - 184) = 11LL;
  LODWORD(v122) = v106[v122] ^ 0x2F;
  int v123 = v106[v116[11] ^ 0xC3LL];
  *(void *)(v40 - 192) = 0LL;
  int v124 = v122 | (v120 << 24);
  int v125 = v121 | ((v109[*v116 ^ 0x30LL] ^ 0x61) << 24);
  LOBYTE(v120) = v123 ^ 0xE5;
  LODWORD(v66) = v123 ^ 0xE5 | ((_DWORD)v66 << 24);
  *(void *)(v40 - 176) = 2LL;
  unsigned int v126 = v125 & 0xFFFF00FF | (((v217[v116[2] ^ 0xC0LL] + (v116[2] ^ 0xCF) + 62) ^ 0xF9) << 8);
  unsigned int v127 = v109[v116[4] ^ 0xFCLL] ^ 0xFFFFFFDF;
  *(void *)(v40 - 240) = 4LL;
  *(void *)(v40 - 232) = 5LL;
  LODWORD(v62) = v62 ^ 0xFF | (v127 << 24);
  int v128 = v216[v116[5] ^ 0xA9LL] ^ 0x61;
  *(void *)(v40 - 24_Block_object_dispose(va, 8) = 9LL;
  LODWORD(v62) = v62 | (v128 << 16);
  int v129 = (v216[v116[9] ^ 0x5DLL] ^ 0x8F) << 16;
  *(void *)(v40 - 20_Block_object_dispose(va, 8) = 10LL;
  LODWORD(v66) = v129 & 0xFFFF00FF | (((v217[v116[10] ^ 0xD5LL] + (v116[10] ^ 0xDA) + 62) ^ 0xCF) << 8) | v66;
  *(void *)(v40 - 200) = 14LL;
  int v130 = (v217[v116[14] ^ 0xE4LL] + (v116[14] ^ 0xEB) - 66);
  *(void *)(v40 - 256) = 3LL;
  *(_DWORD *)(v40 - 212) = -1110119047;
  int v131 = v106[v116[3] ^ 0xDCLL] ^ 0x3B;
  int v132 = (v130 << 8) | ((v216[v116[13] ^ 0x92LL] ^ 0xB2) << 16) | v124;
  LODWORD(v66) = (_DWORD)v66 + 172602597 - 2 * (v66 & 0xA49B4ED ^ v120 & 8);
  LODWORD(v62) = v62 & 0xFFFF00FF | (((v217[v116[6] ^ 0x4FLL] + (v116[6] ^ 0x40) + 62) ^ 0xB7) << 8);
  unsigned int v133 = v112 ^ v238 ^ ((v131 | v126) - 2 * ((v131 | v126) & 0x74FAD41F ^ v131 & 0xA) - 184888299);
  unsigned int v134 = v113 ^ v71 ^ (v62 - ((2 * v62) & 0x69DF733E) + 888125855);
  LODWORD(v60) = v114 ^ v237 ^ (v132 + 2069483688 - 2 * (v132 & 0x7B59D0BA ^ v122 & 0x12));
  LODWORD(v122) = v108 ^ v236 ^ v66;
  int v135 = (char *)*(&off_189D4D580 + (v41 ^ 0x69B)) - 8;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v122) ^ 0x3F)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  unsigned int v136 = (char *)*(&off_189D4D580 + (v41 ^ 0x6A0)) - 12;
  LODWORD(v62) = (v44 >> 1) ^ *(_DWORD *)&v136[4 * (BYTE2(v60) ^ 0x34)] ^ ((BYTE2(v60) ^ 0x68)
                                                                         + 487988419
                                                                         - 2
                                                                         * ((WORD1(v60) ^ 0xB768) & 0xC7 ^ WORD1(v60) & 4));
  uint64_t v137 = (uint64_t)*(&off_189D4D580 + (v41 ^ 0x6FE));
  LODWORD(v66) = *(_DWORD *)(v137
                           + 4LL * ((v108 ^ v236 ^ v66) ^ 0xC6u)) ^ ((BYTE2(v133) ^ 0xD5) + 487988419 - ((2 * (HIWORD(v133) ^ 0x6CD5)) & 0x186)) ^ (((v108 ^ v236 ^ v66) ^ 0xAB) - 385529750 + ((2 * ((v108 ^ v236 ^ v66) ^ 0xAB) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)&v136[4 * (BYTE2(v133) ^ 0x89)];
  unsigned int v138 = *(_DWORD *)&v136[4 * (BYTE2(v134) ^ 0x8C)] ^ *(_DWORD *)(v137 + 4LL * (v60 ^ 0xB6u)) ^ ((BYTE2(v134) ^ 0xD0) + 487988419 - ((2 * (HIWORD(v134) ^ 0xC8D0)) & 0x186)) ^ ((v60 ^ 0xDB) - 385529750 + ((2 * (v60 ^ 0xDB) + 254) & 0x3D4 ^ 0xEDF2FFFF));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v134) ^ 0xC8)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v61) = v62 + 1794188113 - ((2 * v62) & 0xD5E246A2);
  LODWORD(v62) = ((BYTE2(v122) ^ 0xAD) + 487988419 - 2 * ((WORD1(v122) ^ 0x3FAD) & 0xD3 ^ WORD1(v122) & 0x10)) ^ *(_DWORD *)(v137 + 4LL * (v133 ^ 0x1Cu)) ^ ((v133 ^ 0x71) - 385529750 + ((2 * (v133 ^ 0x71) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ (v44 >> 1) ^ *(_DWORD *)&v136[4 * (BYTE2(v122) ^ 0xF1)];
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v133) ^ 0x6C)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v139 = v44 >> 1;
  int v140 = v62 + 1794188113 - ((2 * v62) & 0xD5E246A2);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0xB7)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v141 = (char *)*(&off_189D4D580 + *(_DWORD *)(v40 - 128) - 1741) - 4;
  LODWORD(v106) = *(_DWORD *)&v141[4 * (BYTE1(v133) ^ 0xDE)] ^ v233 ^ ((v134 ^ 0x10)
                                                                     - 385529750
                                                                     + ((2 * (v134 ^ 0x10) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137 + 4LL * (v134 ^ 0x7Du));
  int v142 = ((_DWORD)v66 + 1794188113 - ((2 * (_DWORD)v66) & 0xD5E246A2)) ^ *(_DWORD *)&v141[4 * (BYTE1(v134) ^ 0x2F)] ^ (v44 >> 1);
  LODWORD(v62) = v142 - ((2 * v142) & 0x70E1AA76);
  unsigned int v143 = v106 ^ v61;
  LODWORD(v122) = *(_DWORD *)&v141[4 * (BYTE1(v122) ^ 0x29)] ^ v235 ^ v139 ^ (v138
                                                                            + 1794188113
                                                                            - ((2 * v138) & 0xD5E246A2));
  LODWORD(v60) = *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0x66)] ^ v234 ^ v140;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * ((v106 ^ ~(_DWORD)v61) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v144 = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v122) ^ 0x91)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v145 = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0xA3)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v109) = v145 ^ *(_DWORD *)&v136[4 * (BYTE2(v60) ^ 0xF0)] ^ ((BYTE2(v60) ^ 0xAC)
                                                                    + 487988419
                                                                    - ((2 * (WORD1(v60) ^ 0xA3AC)) & 0x186));
  LODWORD(v106) = (v44 >> 1) ^ *(_DWORD *)&v136[4 * (BYTE2(v143) ^ 0x15)] ^ *(_DWORD *)(v137
                                                                                      + 4LL
                                                                                      * (v122 ^ 0x7Bu)) ^ ((BYTE2(v143) ^ 0x49) + 487988419 - ((2 * (HIWORD(v143) ^ 0xFF49)) & 0x186)) ^ ((v122 ^ 0x16) - 385529750 + ((2 * (v122 ^ 0x16) + 254) & 0x3D4 ^ 0xEDF2FFFF));
  unsigned int v146 = (_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2);
  LODWORD(v62) = (v62 - 1200564933) ^ HIDWORD(v232);
  LODWORD(v109) = ((_DWORD)v109 + 1794188113 - ((2 * (_DWORD)v109) & 0xD5E246A2)) ^ *(_DWORD *)&v141[4 * (BYTE1(v143) ^ 0x2C)];
  LODWORD(v106) = v144 ^ *(_DWORD *)(v137 + 4LL * (v60 ^ 3u)) ^ ((v60 ^ 0x6E)
                                                                                - 385529750
  LODWORD(v66) = *(_DWORD *)&v136[4 * (BYTE2(v122) ^ 0x2E)] ^ ((BYTE2(v122) ^ 0x72)
                                                             + 487988419
                                                             - 2 * ((WORD1(v122) ^ 0x9172) & 0xC7 ^ WORD1(v122) & 4));
  *(_DWORD *)(v40 - 132) = -385529751;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v62) ^ 0xD6)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v147 = ((v143 ^ 0xFC) - 385529751 - ((2 * (v143 ^ 0xFC) + 306021630) & 0x120D03D4)) ^ *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0xBD)] ^ *(_DWORD *)(v137 + 4LL * (v143 ^ 0x91u)) ^ ((_DWORD)v66 + 1794188113 - ((2 * (_DWORD)v66) & 0xD5E246A2)) ^ (v44 >> 1);
  LODWORD(v60) = ((v62 ^ 0x76) - 1726037377) ^ v232 ^ *(_DWORD *)(v137
                                                                                 + 4LL * (v62 ^ 0x1Bu)) ^ ((_DWORD)v109 + 1340507626 - ((2 * (_DWORD)v109) & 0x9FCD0BD4));
  LODWORD(v122) = *(_DWORD *)&v141[4 * (BYTE1(v122) ^ 0x57)] ^ HIDWORD(v229) ^ ((_DWORD)v106
                                                                              + 1794188113
                                                                              - ((2 * (_DWORD)v106) & 0xD5E246A2));
  unsigned int v148 = (v147 - ((2 * v147) & 0xE908D056) - 192649173) ^ v231;
  unsigned int v149 = *(_DWORD *)&v141[4 * (BYTE1(v62) ^ 0x4E)] ^ HIDWORD(v231) ^ v146;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v148) ^ 0x19)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v109) = ((v149 ^ 0xA1)
                 - 385529750
                 + ((2 * (v149 ^ 0xA1) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137
                                                                                                  + 4LL * (v149 ^ 0xCCu));
  LODWORD(v106) = *(_DWORD *)&v136[4 * (BYTE2(v60) ^ 0xDB)] ^ ((BYTE2(v60) ^ 0x87)
                                                             + 487988419
                                                             - ((2 * (WORD1(v60) ^ 0x3A87)) & 0x186)) ^ (v44 >> 1);
  LODWORD(v109) = ((_DWORD)v109 + 1794188113 - ((2 * (_DWORD)v109) & 0xD5E246A2)) ^ *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0xDE)];
  LODWORD(v62) = ((v60 ^ 0x9E)
                - 385529750
                + ((2 * (v60 ^ 0x9E) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137
                                                                                                + 4LL
                                                                                                * (v60 ^ 0xF3u));
  int v150 = v62 + 1794188113 - ((2 * v62) & 0xD5E246A2);
  LODWORD(v106) = ((_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2)) ^ *(_DWORD *)&v141[4 * (BYTE1(v149) ^ 0x57)];
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v122) ^ 0x37)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v62) = v44 >> 1;
  int v151 = ((v122 ^ 0x740CBC3A) >> 16);
  LODWORD(v61) = v151 + 487988419 - ((v122 >> 15) & 0x186);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0x3A)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v60) = *(_DWORD *)&v141[4 * ((unsigned __int16)(v122 ^ 0xBC3A) >> 8)] ^ BYTE2(v149) ^ *(_DWORD *)&v136[4 * (BYTE2(v149) ^ 0xF6)] ^ (v44 >> 1);
  LODWORD(v60) = ((v148 ^ 0x3B) - 1726037377) ^ HIDWORD(v230) ^ *(_DWORD *)(v137
                                                                                           + 4LL
                                                                                           * (v148 ^ 0x56u)) ^ ((v60 ^ 0x77E73F38) + 1340507626 - 2 * ((v60 ^ 0x77E73F38) & 0x4FE685EE ^ v60 & 4));
  LODWORD(v122) = ((v122 ^ 0x3A) - 1726037377) ^ HIDWORD(v228) ^ *(_DWORD *)(v137
                                                                                            + 4LL
                                                                                            * (v122 ^ 0x57u)) ^ ((_DWORD)v106 + 1340507626 - ((2 * (_DWORD)v106) & 0x9FCD0BD4));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v149) ^ 0x7C)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v109) = *(_DWORD *)&v136[4 * (BYTE2(v148) ^ 2)] ^ v229 ^ BYTE2(v148) ^ v62 ^ ((_DWORD)v109
                                                                                      + 487988419
                                                                                      - ((2 * (_DWORD)v109) & 0x3A2C3986));
  unsigned int v152 = *(_DWORD *)&v141[4 * (BYTE1(v148) ^ 0x88)] ^ v230 ^ v61 ^ *(_DWORD *)&v136[4 * (v151 ^ 0x5C)] ^ (v44 >> 1) ^ v150;
  LODWORD(v106) = ((v109 ^ 0x9D)
                 - 385529750
                 + ((2 * (v109 ^ 0x9D) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137
                                                                                                  + 4LL * (v109 ^ 0xF0u));
  unsigned int v153 = (_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0x5B)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v106) = (v44 >> 1) ^ *(_DWORD *)(v137 + 4LL * (v122 ^ 0x1Fu)) ^ ((v122 ^ 0x72)
                                                                                          - 385529750
                                                                                          + ((2
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v122) ^ 0x28)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v61) = v44 >> 1;
  LODWORD(v62) = (_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * ((v109 >> 24) ^ 0xB9)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v106) = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v152) ^ 0xB4)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v106) = v106 ^ *(_DWORD *)(v137 + 4LL * (v152 ^ 0x8Bu)) ^ ((v152 ^ 0xE6)
                                                                                                  - 385529750
                                                                                                  + ((2 * (v152 ^ 0xE6) + 254) & 0x3D4 ^ 0xEDF2FFFF));
  int v154 = BYTE2(v60) ^ 0x95;
  unsigned int v155 = v154 + 487988419 - 2 * ((WORD1(v60) ^ 0x5B95) & 0xCB ^ WORD1(v60) & 8);
  unsigned int v156 = ((BYTE2(v122) ^ 0x14) + 487988419 - ((v122 >> 15) & 0x186)) ^ v227 ^ *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0x1F)] ^ *(_DWORD *)&v136[4 * (BYTE2(v122) ^ 0x48)] ^ ((_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2));
  unsigned int v157 = *(_DWORD *)&v141[4 * ((unsigned __int16)((unsigned __int16)v109 ^ 0xA59D) >> 8)] ^ v228 ^ ((BYTE2(v152) ^ 0x59) + 487988419 - ((2 * (HIWORD(v152) ^ 0xB459)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v152) ^ 5)] ^ v62;
  LODWORD(v60) = (((v109 ^ 0xFA64A59D) >> 16)
                + 487988419
                - (((v109 ^ 0xFA64A59D) >> 15) & 0x186)) ^ HIDWORD(v227) ^ ((v44 >> 1)
                                                                                        + 1794188113
                                                                                        - ((2 * (v44 >> 1)) & 0xD5E246A2)) ^ *(_DWORD *)(v137 + 4LL * (v60 ^ 0x99u)) ^ *(_DWORD *)&v141[4 * (BYTE1(v122) ^ 0x12)] ^ ((v60 ^ 0xF4) - 385529750 + ((2 * (v60 ^ 0xF4) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)&v136[4 * (((v109 ^ 0xFA64A59D) >> 16) ^ 0x5C)];
  unsigned int v158 = *(_DWORD *)&v141[4 * (BYTE1(v152) ^ 0x34)] ^ HIDWORD(v226) ^ *(_DWORD *)&v136[4 * (v154 ^ 0x5C)] ^ v155 ^ v153 ^ v61;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v158) ^ 0xEB)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v159 = (v44 >> 1) + 1794188113 - ((2 * (v44 >> 1)) & 0xD5E246A2);
  LODWORD(v106) = ((BYTE2(v60) ^ 0x81) + 487988419 - ((2 * (WORD1(v60) ^ 0x1481)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v60) ^ 0xDD)];
  LODWORD(v62) = ((v60 ^ 0x51)
                - 385529750
                + ((2 * (v60 ^ 0x51) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137
                                                                                                + 4LL
                                                                                                * (v60 ^ 0x3Cu));
  LODWORD(v119) = *(_DWORD *)&v136[4 * (BYTE2(v156) ^ 0xDB)] ^ ((BYTE2(v156) ^ 0x87)
                                                              + 487988419
                                                              - 2
                                                              * ((HIWORD(v156) ^ 0x7787) & 0xD3 ^ HIWORD(v156) & 0x10));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0x14)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v49) = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v157) ^ 0x9A)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v160 = *(_DWORD *)&v136[4 * (((v158 ^ 0xA87CE98B) >> 16) ^ 0x5C)] ^ ((v158 ^ 0xA87CE98B) >> 16) ^ (v62 + 487988419 - ((2 * v62) & 0x3A2C3986));
  LODWORD(v106) = *(_DWORD *)(v137 + 4LL * (v158 ^ 0xE6u)) ^ *(_DWORD *)&v141[4 * (BYTE1(v156) ^ 0xDE)] ^ ((v158 ^ 0x8B) - 385529750 + ((2 * (v158 ^ 0x8B) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ ((_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2)) ^ (v44 >> 1);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v156) ^ 0x77)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  uint64_t v161 = *(void *)(v40 - 120);
  LODWORD(v122) = *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0x34)] ^ v225 ^ ((BYTE2(v157) ^ 0xE9)
                                                                    + 487988419
                                                                    - ((2 * (HIWORD(v157) ^ 0x9AE9)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v157) ^ 0xB5)] ^ ((v156 ^ 0x9E) - 385529750 + ((2 * (v156 ^ 0x9E) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ v159 ^ *(_DWORD *)(v137 + 4LL * (v156 ^ 0xF3u));
  LODWORD(v109) = *(_DWORD *)&v141[4 * (BYTE1(v158) ^ 0xB)] ^ v224 ^ ((v157 ^ 0xA8)
                                                                    - 385529750
                                                                    + ((2 * (v157 ^ 0xA8) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137 + 4LL * (v157 ^ 0xC5u)) ^ v49 ^ (v119 + 1794188113 - ((2 * v119) & 0xD5E246A2));
  LODWORD(v60) = *(_DWORD *)&v141[4 * (BYTE1(v157) ^ 0x2D)] ^ HIDWORD(v225) ^ (v44 >> 1) ^ (v160
                                                                                          + 1794188113
                                                                                          - ((2 * v160) & 0xD5E246A2));
  BYTE1(v156) = ((unsigned __int16)(*(_WORD *)&v141[4 * (BYTE1(v158) ^ 0xB)] ^ v224 ^ ((v157 ^ 0xA8)
                                                                                     + 18538
                                                                                     + ~((2
  int v162 = ((v109 ^ 0x2E0E654A) >> 16);
  LODWORD(v62) = v162 + 487988419 - (((v109 ^ 0x2E0E654A) >> 15) & 0x186);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * ((v109 >> 24) ^ 0x6D)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v119) = v44 >> 1;
  unsigned int v163 = ((_DWORD)v106 + 328348218 - ((2 * (_DWORD)v106) & 0x27246474)) ^ v226;
  LODWORD(v106) = *(_DWORD *)&v136[4 * (v162 ^ 0x5C)];
  unsigned int v164 = *(_DWORD *)&v135[4 * (HIBYTE(v163) ^ 0xFD)];
  LODWORD(v106) = v106 ^ (v164 << 31) ^ (v164 >> 1) ^ v62 ^ 0x4ED95D8A;
  int v165 = *(_DWORD *)(v40 - 132);
  int v166 = (v165 + (v109 ^ 0x4A) - ((2 * (v109 ^ 0x4A) + 306021630) & 0x120D03D4)) ^ *(_DWORD *)(v137 + 4LL * (v109 ^ 0x27u));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0xAE)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  unsigned int v167 = (_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2);
  LODWORD(v106) = (v44 >> 1) ^ *(_DWORD *)&v141[4 * (BYTE1(v163) ^ 0xA4)] ^ (v166
                                                                           + 1794188113
                                                                           - ((2 * v166) & 0xD5E246A2));
  LODWORD(v62) = (_DWORD)v106 + 487988419 - ((2 * (_DWORD)v106) & 0x3A2C3986);
  LODWORD(v106) = *(_DWORD *)&v136[4 * (BYTE2(v60) ^ 0x3A)] ^ v119 ^ *(_DWORD *)(v137
                                                                               + 4LL * (v163 ^ 0x4Du)) ^ ((BYTE2(v60) ^ 0x66) + 487988419 - ((2 * (WORD1(v60) ^ 0xAE66)) & 0x186)) ^ ((v163 ^ 0x20) - 385529750 + ((2 * (v163 ^ 0x20) + 254) & 0x3D4 ^ 0xEDF2FFFF));
  unsigned int v168 = ((v60 ^ 0xB3) + 68150737 + ((2 * (v60 ^ 0xB3) + 254) & 0x2A2 ^ 0xEFDFFBFF)) ^ *(_DWORD *)&v141[4 * BYTE1(v156)];
  unsigned int v169 = (v168 + 1340507626 - ((2 * v168) & 0x9FCD0BD4)) ^ *(_DWORD *)(v137 + 4LL * (v60 ^ 0xDEu));
  LODWORD(v119) = *(_DWORD *)&v136[4 * (BYTE2(v163) ^ 0x40)] ^ ((BYTE2(v163) ^ 0x1C) + 487988419 - ((v163 >> 15) & 0x186));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * ((v122 ^ 0x3F162902) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v119) = (v119 ^ 0xD9E215AF ^ -(v119 ^ 0xD9E215AF) ^ ((v119 ^ 0x431D28D3 ^ v169) + (v169 ^ 0x6500C283) + 1))
                + (v169 ^ 0x6500C283);
  unsigned int v170 = ((v122 ^ 0x3F162902) >> 16) ^ DWORD2(v223) ^ *(_DWORD *)&v136[4 * (((v122 ^ 0x3F162902) >> 16) ^ 0x5C)] ^ v62;
  unsigned int v171 = (v44 >> 1) ^ DWORD1(v223) ^ v119;
  unsigned int v172 = *(_DWORD *)&v141[4 * (BYTE1(v122) ^ 0xCB)] ^ HIDWORD(v223) ^ ((_DWORD)v106
                                                                     + 1794188113
                                                                     - ((2 * (_DWORD)v106) & 0xD5E246A2));
  LODWORD(v122) = *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0x7C)] ^ HIDWORD(v224) ^ (v165
                                                                             + (v122 ^ 2)
  LODWORD(v106) = ((BYTE2(v122) ^ 0xE9) + 487988419 - ((2 * (WORD1(v122) ^ 0xB8E9)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v122) ^ 0xB5)];
  unsigned int v173 = (_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v170) ^ 0x9D)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v62) = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v172) ^ 0x61)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v106) = *(_DWORD *)(v137 + 4LL * (v122 ^ 0xC5u)) ^ *(_DWORD *)&v136[4 * (BYTE2(v170) ^ 0x28)] ^ ((v122 ^ 0xA8) - 385529750 + ((2 * (v122 ^ 0xA8) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ ((BYTE2(v170) ^ 0x74) + 487988419 - ((2 * (HIWORD(v170) ^ 0x9D74)) & 0x186)) ^ (v44 >> 1);
  int v174 = v62 ^ ((BYTE2(v171) ^ 0xE6) + 487988419 - ((2 * (HIWORD(v171) ^ 0xB0E6)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v171) ^ 0xBA)];
  LODWORD(v62) = v170;
  LODWORD(v109) = (v170 ^ 0xD9)
                - 385529750
                + ((2 * (v170 ^ 0xD9) + 254) & 0x3D4 ^ 0xEDF2FFFF);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v122) ^ 0xB8)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v119) = ((BYTE2(v172) ^ 8) + 487988419 + (~(v172 >> 15) | 0xFFFFFE79) + 1) ^ *(_DWORD *)&v136[4 * (BYTE2(v172) ^ 0x54)] ^ *(_DWORD *)(v137 + 4LL * (v171 ^ 0x29u)) ^ ((v171 ^ 0x44) - 385529750 + ((2 * (v171 ^ 0x44) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ (v44 >> 1);
  LODWORD(v60) = *(_DWORD *)&v141[4 * (BYTE1(v171) ^ 0xDD)] ^ HIDWORD(v222) ^ ((_DWORD)v106
                                                                             + 1794188113
                                                                             - ((2 * (_DWORD)v106) & 0xD5E246A2));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v171) ^ 0xB0)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  unsigned int v175 = *(_DWORD *)&v141[4 * (BYTE1(v170) ^ 0xBD)] ^ v223 ^ (v119 + 1794188113 - ((2 * v119) & 0xD5E246A2));
  unsigned int v176 = *(_DWORD *)&v141[4 * (BYTE1(v172) ^ 0x8F)] ^ HIDWORD(v221) ^ *(_DWORD *)(v137 + 4LL
                                                                                       * (v62 ^ 0xB4)) ^ v109 ^ (v44 >> 1) ^ v173;
  unsigned int v177 = ((v172 ^ 0x85) - 385529750 + ((2 * (v172 ^ 0x85) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ v222 ^ *(_DWORD *)(v137 + 4LL * (v172 ^ 0xE8u)) ^ *(_DWORD *)&v141[4 * (BYTE1(v122) ^ 0x2D)] ^ (v174 + 1794188113 - ((2 * v174) & 0xD5E246A2));
  LODWORD(v122) = ((BYTE2(v177) ^ 0x66) + 487988419 - ((2 * (HIWORD(v177) ^ 0xAE66)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v177) ^ 0x3A)];
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v176) ^ 0x18)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v106) = (v44 >> 1) + 487988419 - ((2 * (v44 >> 1)) & 0x3A2C3986);
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v175) ^ 0xEF)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v106) = v106 ^ *(_DWORD *)&v136[4 * (BYTE2(v175) ^ 0x40)];
  int v178 = *(_DWORD *)(v40 - 132);
  int v179 = (v44 >> 1) ^ *(_DWORD *)(v137 + 4LL * (v176 ^ 0x90u)) ^ ((v176 ^ 0xFD)
                                                                                 + v178
  LODWORD(v62) = v122 + 1794188113 - ((2 * v122) & 0xD5E246A2);
  LODWORD(v122) = v179 + 1794188113 - ((2 * v179) & 0xD5E246A2);
  int v180 = *(_DWORD *)(v137 + 4LL * (v60 ^ 0x27u)) ^ ((v60 ^ 0x4A)
                                                                   + v178
                                                                   - ((2 * (v60 ^ 0x4A) + 306021630) & 0x120D03D4));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v177) ^ 0xAE)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v181 = (v44 >> 1) ^ *(_DWORD *)&v136[4 * (BYTE2(v176) ^ 0xF)] ^ (v180 + 487988419 - ((2 * v180) & 0x3A2C3986));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (BYTE3(v60) ^ 0xDC)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v122) = ((BYTE2(v60) ^ 0xE) + 487988419 - 2 * ((WORD1(v60) ^ 0xDC0E) & 0xD3 ^ WORD1(v60) & 0x10)) ^ v221 ^ *(_DWORD *)&v141[4 * (BYTE1(v177) ^ 0x7C)] ^ *(_DWORD *)&v136[4 * (BYTE2(v60) ^ 0x52)] ^ v122;
  LODWORD(v119) = v177;
  LODWORD(v49) = (v177 ^ 0xB3)
               - 385529750
               + ((2 * (v177 ^ 0xB3) + 254) & 0x3D4 ^ 0xEDF2FFFF);
  unsigned int v182 = *(_DWORD *)&v141[4 * (BYTE1(v176) ^ 0x1B)] ^ HIDWORD(v220) ^ *(_DWORD *)(v137
                                                                                + 4LL * (v175 ^ 0x4Du)) ^ ((v175 ^ 0x20) + v178 - ((2 * (v175 ^ 0x20) + 306021630) & 0x120D03D4)) ^ (v44 >> 1) ^ v62;
  LODWORD(v60) = v49 ^ HIDWORD(v219) ^ *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0x65)] ^ *(_DWORD *)(v137 + 4LL * (v119 ^ 0xDE)) ^ ((_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2));
  int v183 = v60 ^ BYTE2(v175);
  unsigned int v184 = *(_DWORD *)&v141[4 * (BYTE1(v175) ^ 0xA4)] ^ v220 ^ (v181 + 1794188113 - ((2 * v181) & 0xD5E246A2));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * ((v183 ^ 0x7641388Bu) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  LODWORD(v109) = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v135[4 * ((v122 ^ 0xF7E9CFA8) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v185 = v44 >> 1;
  LODWORD(v49) = (((v183 ^ 0x7641388Bu) >> 16) + 487988419 - (((v183 ^ 0x7641388Bu) >> 15) & 0x186)) ^ *(_DWORD *)&v136[4 * (((v183 ^ 0x7641388Bu) >> 16) ^ 0x5C)];
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v184) ^ 0xE7)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  int v186 = v44 >> 1;
  LODWORD(v106) = v109 ^ *(_DWORD *)(v137 + 4LL * ((v184 ^ BYTE2(v176)) ^ 0x18u)) ^ (((v122 ^ 0xF7E9CFA8) >> 16) + 487988419 - (((v122 ^ 0xF7E9CFA8) >> 15) & 0x186)) ^ *(_DWORD *)&v136[4 * (((v122 ^ 0xF7E9CFA8) >> 16) ^ 0x5C)] ^ (((v184 ^ BYTE2(v176)) ^ 0x75) - 385529750 + ((2 * ((v184 ^ BYTE2(v176)) ^ 0x75) + 254) & 0x3D4 ^ 0xEDF2FFFF));
  LODWORD(v106) = ((_DWORD)v106 + 1794188113 - ((2 * (_DWORD)v106) & 0xD5E246A2)) ^ *(_DWORD *)&v141[4 * (BYTE1(v182) ^ 0xEC)];
  unsigned int v187 = v185 ^ *(_DWORD *)&v136[4 * (BYTE2(v182) ^ 0xA7)] ^ ((BYTE2(v182) ^ 0xFB)
                                                            + 487988419
                                                            - ((2 * (HIWORD(v182) ^ 0x57FB)) & 0x186)) ^ ((v183 ^ 0x8B) - 385529750 + ((2 * (v183 ^ 0x8B) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137 + 4LL * (v183 ^ 0xE6u));
  HIDWORD(v44) = *(_DWORD *)&v135[4 * (HIBYTE(v182) ^ 0x57)];
  LODWORD(v44) = HIDWORD(v44) ^ 0x9DB2BB14;
  unsigned int v188 = (v187 + 1794188113 - ((2 * v187) & 0xD5E246A2)) ^ *(_DWORD *)&v141[4 * (BYTE1(v184) ^ 0x6D)];
  LODWORD(v62) = *(_DWORD *)&v141[4 * (BYTE1(v122) ^ 0x2D)];
  LODWORD(v109) = ((v122 ^ 0xA8)
                 - 385529750
                 + ((2 * (v122 ^ 0xA8) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ *(_DWORD *)(v137
                                                                                                  + 4LL * (v122 ^ 0xC5u)) ^ ((BYTE2(v184) ^ 0x31) + 487988419 - ((2 * (HIWORD(v184) ^ 0xE731)) & 0x186)) ^ *(_DWORD *)&v136[4 * (BYTE2(v184) ^ 0x6D)] ^ (v44 >> 1);
  LODWORD(v122) = v212 ^ *(_DWORD *)&v141[4 * (BYTE1(v60) ^ 0xDA)] ^ ((_DWORD)v109
                                                                    + 1794188113
                                                                    - ((2 * (_DWORD)v109) & 0xD5E246A2));
  LODWORD(v60) = (v188 - 385432603 - ((2 * v188) & 0xD20D87CA)) ^ v219;
  LODWORD(v141) = ((_DWORD)v106 - 1957188285 - ((2 * (_DWORD)v106) & 0x16AF5A86)) ^ HIDWORD(a16);
  unsigned int v189 = v62 ^ HIDWORD(a14) ^ ((v182 ^ 0x2F)
                             - 385529750
                             + ((2 * (v182 ^ 0x2F) + 254) & 0x3D4 ^ 0xEDF2FFFF)) ^ v186 ^ *(_DWORD *)(v137 + 4LL * (v182 ^ 0x42u)) ^ ((_DWORD)v49 + 1794188113 - ((2 * (_DWORD)v49) & 0xD5E246A2));
  LODWORD(v106) = (v62 ^ BYTE4(a14) ^ ((v182 ^ 0x2F) + 106 + ~((2 * (v182 ^ 0x2F) - 2) & 0xD4)) ^ v186 ^ *(_BYTE *)(v137 + 4LL * (v182 ^ 0x42u)) ^ ((_BYTE)v49 + 81 - ((2 * (_BYTE)v49) & 0xA2))) ^ 0xC9;
  int v190 = (char *)*(&off_189D4D580 + SHIDWORD(v211)) - 4;
  LODWORD(v61) = *(_DWORD *)(v40 - 128);
  uint64_t v191 = (uint64_t)*(&off_189D4D580 + (int)v61 - 1674);
  BYTE2(v62) = BYTE2(v122) ^ 0x8C;
  uint64_t v192 = (uint64_t)*(&off_189D4D580 + (int)v211);
  int v193 = *(_DWORD *)&v190[4 * (v122 ^ 0xC8)];
  LODWORD(v106) = (*(_DWORD *)(v192 + 4LL * (BYTE2(v60) ^ 0x9Eu)) - 1827562456) ^ (*(_DWORD *)&v190[4 * v106]
                                                                                 + 1880275048);
  LODWORD(v119) = v193 - 2 * ((v193 + 1880275048) & 0x4427A0BF ^ v193 & 2);
  LODWORD(v66) = (*(_DWORD *)(v192 + 4LL * (BYTE2(v189) ^ 0x38u)) - 1827562456) ^ (*(_DWORD *)(v191
                                                                                             + 4LL
                                                                                             * ((v122 ^ 0x898C5DC8) >> 24))
                                                                                 - 229597850) ^ (*(_DWORD *)&v190[4 * (v60 ^ 0xA2)]
                                                                                               + 1880275048);
  unsigned int v194 = v141 ^ 0x351D74B9;
  int v195 = *(_DWORD *)&v190[4 * (v141 ^ 0xB9)];
  uint64_t v196 = *(unsigned int *)(v191 + 4LL * (BYTE3(v60) ^ 0xE7));
  LODWORD(v190) = *(_DWORD *)(v191 + 4LL * (HIBYTE(v189) ^ 0xB8));
  LODWORD(v191) = *(_DWORD *)(v191 + 4LL * ((v141 >> 24) ^ 0x65));
  int v197 = (char *)*(&off_189D4D580 + (int)v61 - 1697) - 8;
  LODWORD(v122) = *(_DWORD *)&v197[4 * (BYTE1(v122) ^ 0x61)] ^ (v191 - 229597850);
  LODWORD(v191) = BYTE1(v189);
  int v198 = *(_DWORD *)&v197[4 * (BYTE1(v60) ^ 0xA0)];
  uint64_t v199 = *(unsigned int *)&v197[4 * (v191 ^ 0xE9)];
  LODWORD(v106) = ((_DWORD)v106 + 1143447741 - ((2 * (_DWORD)v106) & 0x884F417A)) ^ v122;
  LODWORD(v62) = *(_DWORD *)(v192 + 4LL * BYTE2(v62));
  unsigned int v200 = *(_DWORD *)&v197[4 * BYTE1(v194)] ^ v214 ^ ((_DWORD)v66 + 1143447741 - ((2 * (_DWORD)v66) & 0x884F417A));
  LODWORD(v60) = v210 ^ HIDWORD(a16) ^ ((_DWORD)v106 - 1957188285 - ((2 * (_DWORD)v106) & 0x16AF5A86));
  uint64_t v201 = ((unsigned __int16)(*(_WORD *)&v197[4 * BYTE1(v194)] ^ v214 ^ ((_WORD)v66
                                                                                       - 24387
                                                                                       - ((2 * (_WORD)v66) & 0x417A))) >> 8) ^ 0x99LL;
  uint64_t v202 = (uint64_t)*(&off_189D4D580 + (int)v61 - 1726);
  LOBYTE(v191) = *(_BYTE *)(v202 + v201);
  LODWORD(v201) = v198 ^ v210 ^ (v119 - 1271244507) ^ ((_DWORD)v190 - 229597850) ^ (*(_DWORD *)(v192 + 4LL * BYTE2(v194))
                                                                                  - 1827562456);
  *(_BYTE *)(v161 + 6) = v191 ^ 0xD9;
  int v203 = (char *)*(&off_189D4D580 + (int)v61 - 1716) - 4;
  *(_BYTE *)(v161 + 13) = (v203[BYTE2(v60) ^ 0xADLL] - 26) ^ 0xC5;
  uint64_t v204 = (uint64_t)*(&off_189D4D580 + (int)v61 - 1743);
  *(_BYTE *)(v161 + *(void *)(v40 - 224)) = *(_BYTE *)(v204 + (v200 ^ 0xFCLL)) ^ 0xFB;
  *(_BYTE *)(v161 + *(void *)(v40 - 248)) = (v203[BYTE2(v201) ^ 0x8CLL] - 26) ^ 0x47;
  uint64_t v205 = (uint64_t)*(&off_189D4D580 + (int)v61 - 1717);
  *(_BYTE *)(v161 + *(void *)(v40 - 240)) = (*(_BYTE *)(v205 + (HIBYTE(v200) ^ 0xDELL)) - 29) ^ 0x1B;
  LODWORD(v190) = v203[BYTE2(v200) ^ 0x15LL];
  *(_BYTE *)(v161 + *(void *)(v40 - 232)) = (((_BYTE)v190 + (((_BYTE)v190 - 26) ^ 0xDA) - 25) ^ 0xFE)
                                            + (_BYTE)v190
                                            - 26;
  uint64_t v206 = (v195 + 1880275048);
  uint64_t v207 = HIDWORD(v210) ^ v199 ^ ((_DWORD)v62 - 1827562456) ^ v206 ^ ((_DWORD)v196
                                                                                               - ((2 * (_DWORD)v196
                                                                                                 - 459195700) & 0x884F417A)
                                                                                               + 913849891);
  *(_BYTE *)(v161 + *(void *)(v40 - 256)) = *(_BYTE *)(v204
                                                       + ((BYTE4(v210) ^ v199 ^ (v62 + 40) ^ v206 ^ (v196 - ((2 * v196 - 52) & 0x7A) + 35)) ^ 5LL)) ^ 9;
  *(_BYTE *)(v161 + *(void *)(v40 - 160)) = (*(_BYTE *)(v205 + (BYTE3(v60) ^ 0x4ELL)) - 29) ^ 0xE6;
  *(_BYTE *)(v161 + *(void *)(v40 - 168)) = (*(_BYTE *)(v205 + (BYTE3(v201) ^ 0x9CLL)) - 29) ^ 0xB8;
  uint64_t v208 = *(void *)(v40 - 192);
  *(_BYTE *)(v161 + v20_Block_object_dispose(va, 8) = (*(_BYTE *)(v205 + (BYTE3(v207) ^ 0x67LL)) - 29) ^ 0x91;
  *(_BYTE *)(v161 + *(void *)(v40 - 184)) = *(_BYTE *)(v204 + (v201 ^ 0xF2LL)) ^ 3;
  *(_BYTE *)(v161 + *(void *)(v40 - 208)) = *(_BYTE *)(v202 + (BYTE1(v201) ^ 0x1ELL)) ^ 0x7A;
  *(_BYTE *)(v161 + *(void *)(v40 - 176)) = *(_BYTE *)(v202 + (BYTE1(v207) ^ 0x33LL)) ^ 0x63;
  *(_BYTE *)(v161 + *(void *)(v40 - 200)) = *(_BYTE *)(v202 + (BYTE1(v60) ^ 0xBCLL)) ^ 0xAD;
  *(_BYTE *)(v161 + *(void *)(v40 - 152)) = *(_BYTE *)(v204 + (v60 ^ 0x9FLL)) ^ 0xFB;
  *(_BYTE *)(v161 + *(void *)(v40 - 144)) = (v203[BYTE2(v207) ^ 0xDLL] - 26) ^ 0x8E;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a37 + 8LL * ((510 * ((((_DWORD)v208 - 1110119031 - 2 * (((_DWORD)v208 + 16) & 0x3DD4ED7D ^ *(_DWORD *)(v40 - 212) & 4)) ^ 0xBDD4ED79) < HIDWORD(v214))) ^ ((int)v61 - 549))))( v206,  v202,  v207,  ((_DWORD)v190 - 26) ^ 0xDAu,  173LL,  v196,  v199,  v61,  a2,  a3,  a4,  a5,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  v217,  a14,  v218,  a16,  v219,  v220,  v221,  v222,  v223,  *((void *)&v223 + 1),  v224,  v225,  v226,  v227,  v228,  v229,  v230,  v231,  v232);
}

void sub_183D963F8()
{
}

uint64_t sub_183D9642C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, int a45, int a46)
{
  return ((uint64_t (*)(void))(*(void *)(v46
                                        + 8LL
                                        * (a46 ^ (2017
                                                * (((2 * (a11 - (a14 & 0xA2BAA0D4) - 1908683463)) & 0xFE7FBAFE ^ 0xA23AA0D4)
                                                 + ((a11 - (a14 & 0xA2BAA0D4) - 1908683463) ^ 0xAE628D15)
                                                 - 68338034 != 2066553869))))
                            - 12LL))();
}

uint64_t sub_183D964E8(int a1, int a2)
{
  BOOL v4 = a2 + a1 - 2134891903 >= (((v2 - 641) | 0x281) ^ 0x6F9u);
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((4 * v4) | (8 * v4)) ^ (v2 - 1295))) - 4LL))();
}

uint64_t sub_183D96570(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)(v7
                                                                                         + 8LL
                                                                                         * ((a3 - 30) ^ (1161 * (a6 >> 4 == 133430744))))
                                                                             - ((a3 - 1006936547) & 0x3C04A6F1)
                                                                             + 1765LL))( a1,  a2,  (a3 - 30),  a4,  v6);
}

uint64_t sub_183D965BC(int a1, int a2, int a3, int a4)
{
  uint64_t v9 = (a2 + a1 + a4);
  unint64_t v10 = *(void *)(v8 - 120);
  unint64_t v11 = v9 + v10 + 1;
  uint64_t v12 = (a2 + a1) & 0xF;
  uint64_t v13 = v12 - v9;
  unint64_t v14 = v4 + v13;
  unint64_t v15 = v12 + ((3 * (a3 ^ 0xEA) + 807) | 0x40u) + v4 - 1776;
  unint64_t v16 = v13 + v5 + 2;
  unint64_t v17 = v12 + v5 + 3;
  unint64_t v18 = v13 + v6 + 4;
  unint64_t v19 = v12 + v6 + 5;
  BOOL v21 = v17 > v10 && v16 < v11;
  int v23 = v14 < v11 && v15 > v10 || v21;
  if (v19 <= v10 || v18 >= v11) {
    int v25 = v23;
  }
  else {
    int v25 = 1;
  }
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((1940 * (v25 ^ 1)) ^ a3)) - 12LL))();
}

uint64_t sub_183D96660( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v9
                                                                       + 8LL
                                                                       * (((v8 < ((a8 - 2105281675) & 0x7D7C0DFFu)
                                                                               - 1263)
                                                                         * ((a8 - 426) ^ 0x18B)) ^ a8))
                                                           - 4LL))( a1,  a2,  0LL);
}

uint64_t sub_183D966A8( int a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  v56.val[1].i64[0] = v47 & 0xF;
  v56.val[1].i64[1] = ((_BYTE)v47 - 1) & 0xF;
  v56.val[2].i64[0] = ((_BYTE)v47 + 14) & 0xF;
  v56.val[2].i64[1] = ((_BYTE)v47 + 13) & 0xF;
  v56.val[3].i64[0] = ((_BYTE)v47 + 12) & 0xF;
  v56.val[3].i64[1] = ((_BYTE)v47 + 11) & 0xF;
  unsigned int v50 = a2 + a1 + a4;
  v51.i64[0] = 0x7777777777777777LL;
  v51.i64[1] = 0x7777777777777777LL;
  uint64_t v52 = v50 & ((a5 - 384) ^ 0x6FLL);
  v56.val[0].i64[0] = v52;
  v56.val[0].i64[1] = ((_BYTE)v47 + 1) & 0xF;
  v53.i64[0] = vqtbl4q_s8(v56, (int8x16_t)xmmword_183DC1520).u64[0];
  v57.val[0].i64[1] = ((_BYTE)v47 + 9) & 0xF;
  v57.val[1].i64[1] = ((_BYTE)v47 + 7) & 0xF;
  v57.val[2].i64[1] = (v47 + 5) & 0xF;
  v57.val[3].i64[1] = ((_BYTE)v47 + 3) & 0xF;
  v57.val[0].i64[0] = ((_BYTE)v47 + 10) & 0xF;
  v57.val[1].i64[0] = ((_BYTE)v47 + 8) & 0xF;
  v57.val[2].i64[0] = ((_BYTE)v47 + 6) & 0xF;
  v57.val[3].i64[0] = (v47 + 4) & 0xF;
  v53.i64[1] = vqtbl4q_s8(v57, (int8x16_t)xmmword_183DC1520).u64[0];
  int8x16_t v54 = vrev64q_s8(vmulq_s8(v53, v51));
  *(int8x16_t *)(*(void *)(v49 - 120) - 15LL + v50) = veorq_s8( veorq_s8( veorq_s8( *(int8x16_t *)(v44 + v52 - 15),  *(int8x16_t *)(*(void *)(v49 - 120) - 15LL + v50)),  veorq_s8( *(int8x16_t *)(v52 + v45 - 13),  *(int8x16_t *)(v52 + v46 - 11))),  vextq_s8(v54, v54, 8uLL));
  return ((uint64_t (*)(void))(*(void *)(a44 + 8LL * ((2040 * ((v48 & 0xFFFFFFF0) == 16)) ^ a5)) - 8LL))();
}

void sub_183D96808()
{
}

uint64_t sub_183D96814(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * (v4 ^ (319 * (v3 != a3))))
                            - ((v4 + 100) | 0x100u)
                            - ((v4 - 1490935907) & 0x58DDE6F3 ^ 0xFFFFFFFFFFFFF8B1LL)))();
}

uint64_t sub_183D96860(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL
                                             * ((983 * ((((a4 + 613627183) & 0xDB6CCFFD ^ 0x6F9) & v4) != 0)) ^ a4))
                            - ((a4 + 954910267) & 0xC7153CFF)
                            + 1267LL))();
}

uint64_t sub_183D968C0( char a1, char a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  *(_DWORD *)(v52 - 132) = v49;
  *(_DWORD *)(v52 - 12_Block_object_dispose(va, 8) = v51;
  uint64_t v53 = *(void *)(v52 - 120) - 7LL;
  *(_DWORD *)(v52 - 144) = v49 & 0xFFFFFFF8;
  int v54 = -8 - a3;
  char v55 = v50 + a2 + a1;
  int v56 = v48 + v54 + 8;
  uint64_t v57 = v56 + (((a6 - 1019) | 0xC0) ^ v44);
  v59.val[0].i64[0] = ((_BYTE)v56 + (((a6 + 5) | 0xC0) ^ v44)) & 0xF;
  v59.val[0].i64[1] = (v55 + 1 + (_BYTE)v54 + 8) & 0xF;
  v59.val[1].i64[0] = v56 & 0xF;
  v59.val[1].i64[1] = (v55 + 15 + (_BYTE)v54 + 8) & 0xF;
  v59.val[2].i64[0] = (v55 + 14 + (_BYTE)v54 + 8) & 0xF;
  v59.val[2].i64[1] = (v55 + 13 + (_BYTE)v54 + 8) & 0xF;
  v59.val[3].i64[0] = (v55 + 12 + (_BYTE)v54 + 8) & 0xF;
  v59.val[3].i64[1] = (v55 + 11 + (_BYTE)v54 + 8) & 0xF;
  *(int8x8_t *)(v53 + v57) = veor_s8( veor_s8( veor_s8(*(int8x8_t *)(v45 + (v57 & 0xF) - 7), *(int8x8_t *)(v53 + v57)),  veor_s8(*(int8x8_t *)((v57 & 0xF) + v46 - 5), *(int8x8_t *)((v57 & 0xF) + v47 - 3))),  vrev64_s8( vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v59, (int8x16_t)xmmword_183DC1530),  (int8x8_t)0x7777777777777777LL)));
  return ((uint64_t (*)(__n128))(*(void *)(a44 + 8LL * ((496 * (-(v49 & 0xFFFFFFF8) == v54)) ^ a6)) - 8LL))((__n128)xmmword_183DC1530);
}

void sub_183D96A04()
{
}

uint64_t sub_183D96A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v7 + 8LL * (((((v6 + 1197) | 0x80) ^ 0x54C) * (*(_DWORD *)(v8 - 132) == *(_DWORD *)(v8 - 144))) ^ v6))
                                                                                               - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  (v6 + 1325));
}

uint64_t sub_183D96A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v14 = (v8 + a5 + 444);
  *(_BYTE *)(*(void *)(v13 - 120) + v14) ^= *(_BYTE *)(v9 + (v14 & 0xF)) ^ *(_BYTE *)((v14 & 0xF) + v10 + 2) ^ *(_BYTE *)((v14 & 0xF) + v11 + 4) ^ (119 * (v14 & 0xF));
  return ((uint64_t (*)(void))(*(void *)(v12 + 8LL * ((90 * (a5 - 1 == v7)) ^ (a7 - 1719))) - 4LL))();
}

void sub_183D96AB0()
{
  if (v0 == 539915761) {
    int v1 = -1224190382;
  }
  else {
    int v1 = 1224150410;
  }
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_183D96B14(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1759421093 * ((-870162447 - (a1 | 0xCC225FF1) + (a1 | 0x33DDA00E)) ^ 0x80A0105A);
  __asm { BR              X10 }

uint64_t sub_183D96BE8(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((56
                                          * (*(_DWORD *)(*(void *)(a1 + 8) + v3) == ((((v4 + 287) | 0x100) + 456) ^ v1))) ^ v4))
                            - 8LL))();
}

uint64_t sub_183D96C24@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v7 = (a1 - 602) ^ (108757529
                   * ((&v5 - 1176851783 - 2 * ((unint64_t)&v5 & 0xB9DAAAB9)) ^ 0x5946C892));
  uint64_t v5 = a2;
  uint64_t v6 = v2;
  uint64_t result = sub_183D7B048((uint64_t)&v5);
  _DWORD *v3 = -782148744 - *v3;
  return result;
}

void sub_183D96DB4(uint64_t a1)
{
  int v1 = 1178560073 * ((2 * (a1 & 0x78F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8);
  unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 8) - 0x749AC022234F283ELL) + 956239655;
  unsigned int v4 = *(_DWORD *)(a1 + 4) - v1 + 1964640531;
  int v5 = (v4 < 0x99475EBA) ^ (v3 < 0x99475EBA);
  BOOL v6 = v3 < v4;
  if (v5) {
    BOOL v6 = v4 < 0x99475EBA;
  }
  int v2 = *(_DWORD *)(a1 + 16) ^ v1;
  __asm { BR              X10 }

uint64_t sub_183D96EDC()
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL * ((1841 * (((v2 == 908467202) ^ ((v0 ^ 0xF4) + 0x80)) & 1)) ^ v0)))();
}

uint64_t sub_183D96F14()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((*(_DWORD *)(v1 - 0x749AC022234F283ALL) != (((v0 + 52) | 0x4C) ^ 0xC945D8E))
                                          * ((v0 ^ 0x41) - 1387)) ^ v0))
                            - 12LL))();
}

uint64_t sub_183D96F6C@<X0>(int a1@<W8>)
{
  int v6 = (v2 - 292714517) & 0x117277BD;
  *(_BYTE *)(*(void *)(v3 - 0x749AC022234F284ALL) + (v6 ^ 0xBD458D0F) + v5 + v1) = *(_BYTE *)(*(void *)(v3 - 0x749AC022234F284ALL)
                                                                                              + ((v6 - 1153824088) & 0x44C5F66F ^ 0xF36BA271)
                                                                                              + v1);
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((185 * (v1 - 1 != a1)) ^ v6)) - 4LL))();
}

void sub_183D97004()
{
}

uint64_t sub_183D9700C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((478
                                * (((((v0 + 470080781) & 0x63FB23DF) - 966) & *(_DWORD *)(v1 - 0x749AC022234F2836LL)) != v0 - 730)) ^ v0)))();
}

uint64_t sub_183D97060@<X0>(int a1@<W8>, uint64_t a2, ...)
{
  BOOL v5 = (*(uint64_t (**)(void, char *, void, uint64_t))(v3 + 8LL * (v4 - 762)))( **(unsigned int **)(v3 + 8LL * (v4 - 929)),  va,  (v4 ^ 0x17E)
       - 1918497400
       + (((a1 - 606946728) << (2 * (v4 ^ 0x7A) - 121)) & 0xE4B3C000)
       + ((a1 - 606946728) & 0xFFFFF000 ^ 0x7259EFBF),
         1LL) != 0;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v4 | (8 * v5))) - 12LL))();
}

uint64_t sub_183D970F0()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (((((v2 + 63) ^ (*(void *)(v0 - 0x749AC022234F284ALL) == 0LL)) & 1)
                                          * ((v2 ^ 0x6F8) - 1159)) ^ v2))
                            - 12LL))();
}

uint64_t sub_183D9714C()
{
  int v3 = *(_DWORD *)(v1 - 0x749AC022234F283ALL)
     - ((2 * *(_DWORD *)(v1 - 0x749AC022234F283ALL) + 1725384826) & 0x478A1AF8)
     - 1758416455;
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((831
                                * (((2 * v3) & 0xD64FFAFE ^ 0x460A1AF8)
                                 + 1056470974
                                 + ((v0 + 959470205) & 0xC6CFA37A ^ v3 ^ 0x48E2F379) != 706770237)) ^ v0)))();
}

uint64_t sub_183D971FC()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (((v2 + v1 + ((v0 - 967192213) & 0x39A62F5F ^ 0x14D804CCu) < 8)
                                          * ((v0 - 929) ^ 0x20D)) ^ (v0 - 929)))
                            - 8LL))();
}

uint64_t sub_183D97268(int a1, uint64_t a2)
{
}

uint64_t sub_183D972B0(int a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (int)(((((a1 - 1377639182) & 0x521D1BCB) + ((a1 + 1088) ^ 0xFFFFFB0B))
                                               * (v1 > 0x1F)) ^ (a1 + 34)))
                            - 8LL))();
}

uint64_t sub_183D972FC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v9 = v5 + v6 + v7 + ((a3 - 1101) | 0x120u);
  __int128 v10 = *(_OWORD *)(a2 + v9 - 15);
  __int128 v11 = *(_OWORD *)(a2 + v9 - 31);
  uint64_t v12 = v3 + v9;
  *(_OWORD *)(v12 - 15) = v10;
  *(_OWORD *)(v12 - 31) = v11;
  return (*(uint64_t (**)(void))(v8 + 8LL * ((1161 * ((v4 & 0xFFFFFFE0) == 32)) | (a3 - 1053))))();
}

void sub_183D97354()
{
}

void sub_183D97360()
{
  *(_DWORD *)(v0 - 0x749AC022234F2832LL) = 1224150406;
}

uint64_t sub_183D97564(_DWORD *a1, uint64_t a2)
{
  return off_189D494D0[(1008 * ((*a1 + *(_DWORD *)(a2 + 4) + 871781357) > 0xC8)) ^ 0x1D9u]();
}

uint64_t sub_183D975AC()
{
  return 4294925278LL;
}

uint64_t sub_183D975B4@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((1516 * (v1 != 1534814542)) ^ 0x18Cu)) - 12LL))();
}

uint64_t sub_183D975E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(a1 + (v3 - 1888371398) + 4) = **(_BYTE **)(a2 + 8) + 111;
  unsigned int v4 = *(_DWORD *)(a2 + 4) + 1373080944;
  BOOL v5 = v4 < 0xAD52F6BE;
  BOOL v6 = v4 > 0xAD52F6BF;
  if (v5) {
    BOOL v6 = v5;
  }
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * ((61 * v6) ^ 0x18C)) - 12LL))();
}

void sub_183D97694()
{
}

uint64_t sub_183D9769C(_DWORD *a1)
{
  *((_BYTE *)a1 + v1 + ((v2 + 23723801) | 0xE941E80u) + 213828338_Block_object_dispose(va, 8) = 111;
  *a1 = v1;
  return 0LL;
}

void sub_183D976DC(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 + 108757529 * (((a1 ^ 0x1E96025E | 0x16634A81) - ((a1 ^ 0x1E96025E) & 0x16634A81)) ^ 0xE8692AF4);
  uint64_t v2 = *(void *)(a1 + 8);
  ((void (*)(char *, void (*)()))*(&off_189D4D580 + (v1 & 0x2F2F2BE0)))( (char *)*(&off_189D4D580 + v1 - 1232) - 8,  sub_183DBA478);
  __asm { BR              X11 }

uint64_t sub_183D977C4@<X0>(unsigned int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((41 * (*(void *)(*(void *)(v2 + 8LL * (a1 ^ 0x4B3)) - 4LL) != 0LL)) | a1))
                            - ((13 * (a1 ^ 0x4A5)) ^ 0x4E1LL)))();
}

uint64_t sub_183D97810()
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (v0 ^ 0x457)))(v1);
}

  ;
}

uint64_t sub_183D97840(uint64_t a1)
{
  int v1 = 3804331 * (((a1 ^ 0x9A32C815 | 0x394EC663) - ((a1 ^ 0x9A32C815) & 0x394EC663)) ^ 0x59E2FD20);
  int v2 = *(_DWORD *)a1 - v1;
  uint64_t v3 = *(void *)(a1 + 8);
  unsigned int v4 = (*(_DWORD *)(a1 + 4) ^ v1) - 391437546;
  unsigned int v5 = v4
     + (*(_DWORD *)(v3 - 0x14F8B44E17D22732LL) ^ 0xAF1486AB)
     - ((2 * (v4 + (*(_DWORD *)(v3 - 0x14F8B44E17D22732LL) ^ 0xAF1486AB))) & 0x5E290D56)
     - 1357609301;
  *(_DWORD *)(v3 - 0x14F8B44E17D22732LL) = v5;
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + (v2 ^ 0x3B4))
                                        + 8 * ((31 * ((v5 ^ 0xAF1486AB) < v4)) ^ v2)
                                        - 12)
                            - 12LL))();
}

void sub_183D97914(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x14F8B44E17D22736LL) = (*(_DWORD *)(a1 - 0x14F8B44E17D22736LL) ^ 0xFCD6EAEC)
                                         - 53024020
                                         - ((2 * (*(_DWORD *)(a1 - 0x14F8B44E17D22736LL) ^ 0xFCD6EAEC) + 2) & 0xF9ADD5D8)
                                         + 1;
}

void mm0Euuzhc()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  v0[0] = 108757529 * ((2 * (v0 & 0x3E399E8) - v0 - 65247726) ^ 0x1C800439) + 1695027452;
  sub_183DBA3C0(v0);
  __asm { BR              X8 }

uint64_t sub_183D97A1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, unsigned int a14)
{
  a14 = 455 - 460628867 * (((&a12 | 0xD3E63AA1) + (~&a12 | 0x2C19C55E)) ^ 0x9F70B8DD);
  a12 = &STACK[0x6F6532B723EC5DE5];
  sub_183DB3D3C((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15
                                                                                          + 8LL
                                                                                          * ((13 * (a13 == -1224190382)) ^ v14))
                                                                              - 12LL))( v16,  v17,  v18,  v19,  v20);
}

uint64_t sub_183D97ABC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, uint64_t a15)
{
  a12 = 1178560073
  a14 = v15;
  a15 = a11;
  uint64_t v19 = ((uint64_t (*)(unsigned int *))(*(void *)(v17 + 568) - 8LL))(&a12);
  return (*(uint64_t (**)(uint64_t))(v18 + 8LL * ((125 * (a13 != v16)) ^ 0x5BEu)))(v19);
}

uint64_t sub_183D97B5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, uint64_t a14, int a15, unsigned int a16, unint64_t *a17)
{
  int v20 = (v19 - 126) | 0x83;
  unsigned int v21 = 1759421093 * (&a12 ^ 0xB37DB054);
  a17 = &STACK[0x3F0B617C4F927BF5];
  a12 = 2017542726 - v21;
  a15 = v21 ^ 0x5E7DBF4E;
  a16 = v21 + v20 + 2138961885;
  a14 = a11;
  uint64_t v22 = sub_183DB9534((uint64_t)&a12);
  return (*(uint64_t (**)(uint64_t))(v18 + 8LL * (((a13 == v17) * ((6 * (v20 ^ 0x535)) ^ 0x715)) ^ v20)))(v22);
}

uint64_t sub_183D97C14()
{
  unsigned int v10 = (v4 - 279) ^ (1374699841 * (&v10 ^ 0x6DF41809));
  uint64_t v12 = &STACK[0x130F29621C6D08B4];
  uint64_t v13 = v7;
  ((void (*)(unsigned int *))(*(void *)(v3 + 8LL * (v4 ^ 0x5AB)) - 12LL))(&v10);
  unsigned int v10 = v4 + 1225351577 * ((&v10 & 0x201E3399 | ~(&v10 | 0x201E3399)) ^ 0xA11E5654) - 345;
  uint64_t v12 = v7;
  sub_183D7ACD4((uint64_t)&v10);
  if (v11 == v1 + v4 + 1 - 1476) {
    unsigned int v5 = v8;
  }
  else {
    unsigned int v5 = v11;
  }
  unsigned int v11 = v4 + (((&v10 | 0x648109B1) - (&v10 & 0x648109B1)) ^ 0x6E75079E) * v2 - 939;
  uint64_t v12 = v7;
  v0(&v10);
  uint64_t v12 = v9;
  unsigned int v11 = v4 + 1 + ((2 * (&v10 & 0x7163F060) - &v10 + 245108637) ^ 0x46801B2) * v2 - 940;
  v0(&v10);
  return v5 ^ v1;
}

void sub_183D97DA8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20) - 235795823 * (((a1 | 0xEB3D4C35) - (a1 | 0x14C2B3CA) + 348304330) ^ 0x7F90056C);
  __asm { BR              X10 }

uint64_t sub_183D97EF8()
{
  if (*(void *)(v2 + 56) | *(void *)(v2 + 32)) {
    BOOL v4 = *(_DWORD *)(v2 + 16) + v0 == ((17 * (v1 ^ 0x71D)) ^ 0xBEAFFF1) + ((v1 - 1282) | 0x21);
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (v1 + 40 * v5)) - 12LL))();
}

uint64_t sub_183D97F5C()
{
  BOOL v4 = v1[1] == 0x239318B13B5CAFF7LL || (*v1 | v1[5]) == 0LL;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((46 * v4) ^ v0)) - ((v0 ^ 0x120u) - 270) + 541LL))();
}

uint64_t sub_183D97FB4(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4
                                                                        + 8LL
                                                                        * ((((v3 + 439) ^ 0x4F3) * (v2 == 0)) ^ v3))
                                                            - (v3 ^ 0x7C9u)
                                                            + 1250LL))( a1,  a2,  108757529LL);
}

uint64_t sub_183D980C8@<X0>( int a1@<W2>, uint64_t a2@<X4>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v30 = (v22 - 1246) | 0x602;
  int v31 = (((((v29 - 144) | 0xFFA7A518) ^ 0xFFFFFFFE) - (~(v29 - 144) | 0x585AE7)) ^ 0xE0C438CC) * a1;
  *(void *)(v29 - 144) = a2;
  *(void *)(v29 - 12_Block_object_dispose(va, 8) = v20;
  *(_DWORD *)(v29 - 136) = v22 - v31 + 150;
  *(_DWORD *)(v29 - 116) = v23 - v31 + 1547372625 + v30;
  uint64_t v47 = a3 + v21;
  ((void (*)(uint64_t))(*(void *)(v28 + 8LL * (v22 - 1100)) - 8LL))(v29 - 144);
  HIDWORD(a10) = (v30 - 1002) | 1;
  *(_DWORD *)(v29 - 12_Block_object_dispose(va, 8) = (v30 - 673) ^ ((((v29 - 144) & 0x9C773357 | ~((v29 - 144) | 0x9C773357)) ^ 0xF72585F1) * v25);
  *(void *)(v29 - 144) = a19;
  *(void *)(v29 - 136) = a20;
  uint64_t v46 = (void (*)(uint64_t))(*(void *)(v28 + 8LL * (v30 ^ 0x689)) - 8LL);
  v46(v29 - 144);
  LODWORD(a7) = v30 - 306;
  *(void *)(v29 - 112) = a19;
  *(_DWORD *)(v29 - 120) = v30
                         - 306
                         + 1224239923 * ((((v29 - 144) | 0x9417ED12) - ((v29 - 144) & 0x9417ED12)) ^ 0x66A410C5);
  *(void *)(v29 - 136) = v24;
  *(void *)(v29 - 12_Block_object_dispose(va, 8) = a2;
  *(void *)(v29 - 144) = a20;
  uint64_t v45 = (void (*)(uint64_t))(*(void *)(v28 + 8LL * (v30 - 1409)) - 12LL);
  v45(v29 - 144);
  HIDWORD(v44) = v30 - 1371;
  *(_DWORD *)(v29 - 104) = (v30 - 1371) ^ (1759421093
                                         * ((1760010739 - ((v29 - 144) | 0x68E7A1F3) + ((v29 - 144) | 0x97185E0C)) ^ 0x2465EE58));
  *(void *)(v29 - 12_Block_object_dispose(va, 8) = a19;
  *(void *)(v29 - 120) = v27;
  *(void *)(v29 - 112) = v24;
  *(void *)(v29 - 144) = a20;
  *(void *)(v29 - 136) = v24;
  uint64_t v33 = (void (*)(uint64_t))(*(void *)(v28 + 8LL * (v30 - 1407)) - 8LL);
  v33(v29 - 144);
  LODWORD(v44) = v30 - 1256;
  *(_DWORD *)(v29 - 12_Block_object_dispose(va, 8) = (v30 - 1256) ^ (3804331 * ((v29 - 1072966065 - 2 * ((v29 - 144) & 0xC00BD6DF)) ^ 0x3A952589));
  *(void *)(v29 - 112) = v24;
  *(void *)(v29 - 104) = a12;
  *(void *)(v29 - 144) = a19;
  *(void *)(v29 - 136) = v24;
  *(void *)(v29 - 120) = a20;
  int v34 = (void (*)(uint64_t))(*(void *)(v28 + 8LL * (v30 - 1490)) - 4LL);
  v34(v29 - 144);
  *(_DWORD *)(v29 - 12_Block_object_dispose(va, 8) = (v30 - 673) ^ (235795823 * ((v29 - 144) ^ 0x94AD4959));
  *(void *)(v29 - 144) = a14;
  *(void *)(v29 - 136) = a20;
  v46(v29 - 144);
  *(_DWORD *)(v29 - 120) = v30
                         - 306
                         + 1224239923
                         * ((341731514 - ((v29 - 144) | 0x145E68BA) + ((v29 - 144) | 0xEBA19745)) ^ 0x19126A92);
  *(void *)(v29 - 12_Block_object_dispose(va, 8) = a2;
  *(void *)(v29 - 144) = a20;
  *(void *)(v29 - 136) = a11;
  *(void *)(v29 - 112) = a14;
  v45(v29 - 144);
  *(void *)(v29 - 120) = v27;
  *(void *)(v29 - 112) = a11;
  *(_DWORD *)(v29 - 104) = (v30 - 1371) ^ (1759421093
                                         * (((v29 - 144) & 0x2EBFC556 | ~((v29 - 144) | 0x2EBFC556)) ^ 0x623D8AFD));
  *(void *)(v29 - 136) = a11;
  *(void *)(v29 - 12_Block_object_dispose(va, 8) = a14;
  *(void *)(v29 - 144) = a20;
  v33(v29 - 144);
  *(_DWORD *)(v29 - 12_Block_object_dispose(va, 8) = (v30 - 1256) ^ (3804331
                                         * ((((v29 - 144) | 0xA7E21245) - (v29 - 144) + ((v29 - 144) & 0x581DEDB8)) ^ 0x5D7CE113));
  *(void *)(v29 - 112) = a11;
  *(void *)(v29 - 104) = a15;
  *(void *)(v29 - 144) = a14;
  *(void *)(v29 - 136) = a11;
  *(void *)(v29 - 120) = a20;
  v34(v29 - 144);
  *(void *)(v29 - 144) = v24;
  *(void *)(v29 - 136) = a11;
  *(_DWORD *)(v29 - 12_Block_object_dispose(va, 8) = v30
                         + 1759421093 * (((v29 - 144) & 0xE1564B03 | ~((v29 - 144) | 0xE1564B03)) ^ 0xADD404A8)
                         - 612;
  ((void (*)(uint64_t))((char *)*(&off_189D4D580 + (v30 ^ 0x6BC)) - 8))(v29 - 144);
  *(void *)(v29 - 136) = a11;
  *(_DWORD *)(v29 - 144) = v30
                         + 535753261 * (((~(v29 - 144) & 0x3699B15C) - (~(v29 - 144) | 0x3699B15D)) ^ 0x3C6DBF72)
                         - 246;
  sub_183DA2F4C(v29 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), char *, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 + 8LL * (((*(_DWORD *)(v29 - 128) == 764407772) * (HIDWORD(a10) ^ 0x226)) ^ v30)) - 8LL))( v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  a4,  v44,  v45,  a7,  v46,  (char *)*(&off_189D4D580 + v30 - 1358) - 4,  a10,  a11,  v33,  v47,  a14,  v24,  a16,  a17,  a18);
}

uint64_t sub_183D985CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void (*a14)(uint64_t), uint64_t a15, uint64_t a16, void (*a17)(uint64_t), uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31)
{
  *(void *)(v36 - 12_Block_object_dispose(va, 8) = v32;
  *(void *)(v36 - 144) = v35;
  *(_DWORD *)(v36 - 136) = v34
                         - 3804331 * ((((v36 - 144) | 0x544C886D) + (~(v36 - 144) | 0xABB37792)) ^ 0xAED27B3A)
                         - 257;
  v31(v36 - 144);
  *(_DWORD *)(v36 - 104) = (v34 - 370) ^ (1759421093
                                        * ((((v36 - 144) | 0x21EF9EB5) - (v36 - 144) + ((v36 - 144) & 0xDE106148)) ^ 0x92922EE1));
  *(void *)(v36 - 12_Block_object_dispose(va, 8) = v32;
  *(void *)(v36 - 120) = a31;
  *(void *)(v36 - 112) = v35;
  *(void *)(v36 - 144) = a25;
  *(void *)(v36 - 136) = v35;
  a17(v36 - 144);
  *(_DWORD *)(v36 - 104) = (v34 - 370) ^ (1759421093 * ((v36 - 144) ^ 0xB37DB054));
  *(void *)(v36 - 120) = v35;
  *(void *)(v36 - 112) = v35;
  *(void *)(v36 - 144) = a25;
  *(void *)(v36 - 136) = a18;
  *(void *)(v36 - 12_Block_object_dispose(va, 8) = v32;
  a17(v36 - 144);
  *(void *)(v36 - 144) = a24;
  *(_DWORD *)(v36 - 136) = v34
                         + 1755732067 * (((~(v36 - 144) & 0xFCEE7674) - (~(v36 - 144) | 0xFCEE7675)) ^ 0x2228CBAE)
                         - 1882358009;
  *(void *)(v36 - 12_Block_object_dispose(va, 8) = v35;
  sub_183DB9E2C(v36 - 144);
  *(_DWORD *)(v36 - 136) = v34
                         - 3804331
                         * ((((v36 - 144) ^ 0x51617891) - 134039118 - 2 * (((v36 - 144) ^ 0x51617891) & 0xF802B9B2)) ^ 0x53FD3275)
                         - 257;
  *(void *)(v36 - 144) = v35;
  *(void *)(v36 - 12_Block_object_dispose(va, 8) = a20;
  a14(v36 - 144);
  *(_DWORD *)(v36 - 12_Block_object_dispose(va, 8) = (v34 - 213) ^ (108757529
                                        * ((((v36 - 144) | 0x9729A46D) + (~(v36 - 144) | 0x68D65B92)) ^ 0x77B5C647));
  *(void *)(v36 - 144) = v35;
  *(void *)(v36 - 136) = a20;
  uint64_t v37 = sub_183D7B048(v36 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v33 + 8LL * ((91 * (a21 != 0)) ^ (v34 - 117)))
}

uint64_t sub_183D9881C()
{
  unsigned int v6 = (v2 + 252761246) & 0xF0EF2DFA;
  int v7 = (((v5 - 144) & 0x5969F8ED | ~((v5 - 144) | 0x5969F8ED)) ^ 0x460A6539) * v1;
  *(void *)(v5 - 136) = v4;
  *(void *)(v5 - 12_Block_object_dispose(va, 8) = v3;
  *(_DWORD *)(v5 - 144) = (v6 + 176) ^ v7;
  *(_DWORD *)(v5 - 140) = v10 - v7 + ((v6 - 665) ^ 0x2A3AF926);
  uint64_t result = ((uint64_t (*)(uint64_t))((char *)*(&off_189D4D580 + (int)(v6 - 1094)) - 8))(v5 - 144);
  *(_DWORD *)(v9 - 0x239318B13B5CAFF7LL) = v10;
  *(_DWORD *)(v0 + 4_Block_object_dispose(va, 8) = -1224190382;
  return result;
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }

uint64_t sub_183D989C4()
{
  return 4294925273LL;
}

uint64_t sub_183D989D0@<X0>(uint64_t a1@<X8>)
{
  return 0LL;
}

void sub_183D989E4(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 - 235795823 * ((-969832657 - (a1 | 0xC631872F) + (a1 | 0x39CE78D0)) ^ 0xAD633189);
  uint64_t v2 = *(void *)(a1 + 8);
  ((void (*)(char *, void (*)()))*(&off_189D4D580 + v1 - 704))( (char *)*(&off_189D4D580 + (v1 ^ 0x3BD)) - 8,  sub_183DBA478);
  __asm { BR              X11 }

uint64_t sub_183D98AA4@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (((*(void *)(*(void *)(v2 + 8LL * (a1 ^ 0x203)) - 4LL) != 0LL)
                                          * ((a1 ^ 0x1D4) - 474)) ^ a1))
                            - 4LL))();
}

uint64_t sub_183D98AE0()
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (v0 - 487)))(v1);
}

  ;
}

void sub_183D98B0C()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  unint64_t v0 = (unint64_t)&v2[qword_18C66B2A8 - qword_18C66B310];
  qword_18C66B310 = 1045096823 * v0 - 0x1159CE8E9813C2FLL;
  qword_18C66B2A8 = 1045096823 * (v0 ^ 0xFEEA6317167EC3D1LL);
  *(_DWORD *)*(&off_189D4D580
  uint64_t v1 = ((uint64_t (*)(uint64_t))*(&off_189D4D580
  *(void *)*(&off_189D4D580
  __asm { BR              X8 }

void sub_183D98CB0()
{
  *uint64_t v1 = v0;
}

void sub_183DA0144(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 535753261 * (((a1 | 0x882D0BB0) - a1 + (a1 & 0x77D2F44F)) ^ 0x82D9059F);
  __asm { BR              X9 }

uint64_t sub_183DA0200()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t))(v0 + 8LL * (v1 - 476)))(200LL) != 0;
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL * ((((((v1 - 372) | 0x131) ^ 0x7A5) + ((v1 - 470) | 0x193)) * v3) ^ v1))
                            - 8LL))();
}

uint64_t sub_183DA0260(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(v6 + 8LL * (v7 - 310)))(a1, 0LL);
  if ((_DWORD)result == 16)
  {
    --v3;
    goto LABEL_7;
  }

  if ((_DWORD)result == 12)
  {
LABEL_7:
    uint64_t result = (*(uint64_t (**)(uint64_t))(v6 + 8LL * (v4 - 209)))(a1);
    int v10 = v3;
    goto LABEL_8;
  }

  if ((_DWORD)result)
  {
    v3 -= 2;
    goto LABEL_7;
  }

  *uint64_t v5 = a1;
  int v10 = 886111136;
LABEL_8:
  *(_DWORD *)(v1 + 12) = v10 ^ v2;
  return result;
}

void sub_183DA02DC(uint64_t a1)
{
  __asm { BR              X8 }

void sub_183DA0404(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = 77 * (((((v5 + 1348160430) ^ 0x49C) - 261) | 0x18) ^ 0x351u);
  int v10 = **(unsigned __int8 **)(v8 + 80)
      - (*(unsigned __int8 *)(*(void *)(a5 + 8LL * (a3 ^ (a3 + 49))) - 1LL) ^ (77
                                                                                                * (((((v5 - 82) ^ 0x9C) - 5) | 0x18) ^ 0x51)
                                                                                                - v5
                                                                                                + 29));
  BOOL v12 = (v10 ^ 0xFCF66DFD) + ((2 * v10) & 0xF9ECDBFA) + 2077095616 == v6
     && a2 - 0x3ADD2DA476CD56F4LL + (v9 ^ 0x3ADD2DA4700BBD71LL) != 0;
  __asm { BR              X15 }

uint64_t sub_183DA1468@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v3 + (v5 + a2 + 821)) = *(_BYTE *)(a3 + (v5 + a2 + 821));
  return (*(uint64_t (**)(void))(v6 + 8LL * (((a2 - 1 == v4) * (a1 - 205)) ^ a1)))();
}

uint64_t sub_183DA14A0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 + 127962867 - 2 * (a1 & 0x7A08EF3)) ^ 0xD9663328));
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + v1 - 381)
                                        + 8 * ((1097 * (*(void *)(a1 + 8) != 0x749AC022234F284ALL)) ^ v1)
                                        - 12)
                            - 8LL))();
}

uint64_t sub_183DA1524@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL * ((1871 * (*(_DWORD *)(v2 - 0x749AC022234F2832LL) == -1224190382)) ^ v1))
                            - ((v1 + 405) ^ 0x364LL)))();
}

uint64_t sub_183DA1570@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *(_DWORD *)(v1 - 0x749AC022234F283ALL) + 2053896195;
  unsigned int v4 = *(_DWORD *)(v1 - 0x749AC022234F283ELL) + 649593899;
  BOOL v5 = v3 < 0x870053BE;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((((v2 + 1651670123) & 0x9D8D81FF) - 2030021582) ^ (v2 + 587))) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((185 * !v7) ^ v2)) - 8LL))();
}

uint64_t sub_183DA1624@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *(void *)(v3 - 0x749AC022234F284ALL);
  int v6 = *(unsigned __int8 *)(v5 + (v2 - 211049408)) ^ 0x3F;
  int v7 = ((*(unsigned __int8 *)(v5 + v2 - 211050785 + ((v4 - 992) ^ 0x489u)) ^ 0x3F) << 24) | ((*(unsigned __int8 *)(v5 + (v2 - 211049410)) ^ 0x3F) << 16) | ((*(unsigned __int8 *)(v5 + (v2 - 211049409)) ^ 0x3F) << 8) | v6;
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((98 * (((v7 + v1 - 2 * (v7 & 0x37085657 ^ v6 & 5)) & 0xFFFFFF) != 15945482)) ^ v4)))();
}

void sub_183DA16D4()
{
  *uint64_t v0 = 1224150375;
}

uint64_t sub_183DA18D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(*a1 - 0xB36971A36B56DBCLL) = 0LL;
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * ((1868 * (*v2 == v3)) ^ v4)) - 8LL))();
}

void sub_183DA1910(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 24) - 0x76D4F6DCACF2CD9ELL) = v3;
  *int v1 = v2;
  JUMPOUT(0x183DA18CCLL);
}

void sub_183DA1930(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_183DA1990()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((v1 == 1534814542) | (2 * (v1 == 1534814542)) | 0x1A4u)) - 12LL))();
}

uint64_t sub_183DA19C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)(*(void *)(a1 + 96) + 800LL) = 2126260673;
  *(_DWORD *)(*(void *)(a1 + 96) + 804LL) = 1756409276;
  *(void *)(*(void *)(a1 + 96) + 808LL) = *(void *)(a1 + 96) + 816LL;
  uint64_t v4 = *(void *)(a1 + 96) + 0x67843F9A1244BDEBLL;
  uint64_t v5 = *(void *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - (v3 + 101));
  unsigned int v6 = 108757529 * (((&v8 | 0x23923E10) - (&v8 & 0x23923E10)) ^ 0xC30E5C3B);
  int v12 = v3 + 101 - v6 + 212509996;
  uint64_t v8 = v4;
  uint64_t v10 = v5;
  unsigned int v9 = 1404 - v6;
  ((void (*)(uint64_t *))(*(void *)(a3 + 1232) - 8LL))(&v8);
  return (v11 - 1945922183);
}

uint64_t sub_183DA1B10(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)((char *)&unk_189D494DC
                                        + 8 * ((809 * (*(_DWORD *)(a2 + 4) == 1534814543)) ^ 0x54Bu)
                                        - 12)
                            - 8LL))();
}

uint64_t sub_183DA1B50(uint64_t a1, uint64_t a2)
{
  if (**(_BYTE **)(a2 + 8)) {
    char v2 = -64;
  }
  else {
    char v2 = -66;
  }
  *(_BYTE *)(a1 + 8_Block_object_dispose(va, 8) = ((**(_BYTE **)(a2 + 8) != 0) ^ 0x57) + v2;
  return 0LL;
}

uint64_t sub_183DA1B9C()
{
  return 4294925278LL;
}

void sub_183DA1BA4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) ^ (1225351577 * ((-2 - ((~(_DWORD)a1 | 0x83317A5F) + (a1 | 0x7CCE85A0))) ^ 0xFDCEE06D));
  __asm { BR              X10 }

uint64_t sub_183DA1C80@<X0>( uint64_t a1@<X8>, uint64_t a2, unint64_t *a3, int a4, uint64_t a5, unsigned int a6, int a7)
{
  unsigned int v10 = 108757529
      * (((&a3 | 0x5B589B14) - &a3 + (&a3 & 0xA4A764E8)) ^ 0xBBC4F93F);
  a5 = v8;
  a3 = &STACK[0xC6562B2033A24D7];
  a6 = 1449743220 - v10;
  a7 = v7 - v10 - 421;
  a4 = v10 ^ 0x7403AE0C;
  uint64_t v11 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v7 ^ 0x25A)) - 8LL))(&a3);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8LL
                                            * (((16 * (*(_DWORD *)(v8 - 0x749AC022234F2832LL) == -1224190382)) | ((*(_DWORD *)(v8 - 0x749AC022234F2832LL) == -1224190382) << 10)) ^ v7)))(v11);
}

void sub_183DA1D58(_DWORD *a1@<X8>)
{
  unsigned int v3 = -1465264311 * (*v1 + v2) - ((1364438674 * (*v1 + v2) - 1263450070) & 0xFD208ADC) + 1491659139;
  *uint64_t v4 = (HIBYTE(v3) ^ 0xFE) - 2 * ((HIBYTE(v3) ^ 0xFE) & 0x3F) + 63;
  v4[1] = (BYTE2(v3) ^ 0x90) - 2 * ((BYTE2(v3) ^ 0x90) & 0x3F) + 63;
  v4[2] = (BYTE1(v3) ^ 0x45) - 2 * ((BYTE1(v3) ^ 0x45) & 0x3F) + 63;
  v4[3] = v3 ^ 0x51;
  v1[4] = *a1;
}

uint64_t sub_183DA1E30(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)((char *)&unk_189D494DC
                                        + 8 * ((23 * (*(_DWORD *)(a2 + 4) == 1534814543)) ^ 0x242u)
                                        - 12)
                            - 8LL))();
}

uint64_t sub_183DA1E70(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xBDD86ECF)
                       + 1878512960
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0xFF9F);
  return 0LL;
}

uint64_t sub_183DA1EA8()
{
  return 4294925278LL;
}

void sub_183DA1EB0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v1 = 1224239923 * (((a1 | 0x53DFEB40) - (a1 & 0x53DFEB40)) ^ 0xA16C1697);
  int v2 = *(_DWORD *)a1 ^ v1;
  int v3 = (*(_BYTE *)(a1 + 32) ^ v1);
  ((void (*)(char *, void (*)()))*(&off_189D4D580 + v2 - 242))( (char *)*(&off_189D4D580 + v2 - 427) - 4,  sub_183DB9F2C);
  uint64_t v5 = *(void *)((char *)*(&off_189D4D580 + v2 - 346) - 4);
  unsigned int v4 = v2
  sub_183D989E4((uint64_t)&v4);
  __asm { BR              X9 }

uint64_t sub_183DA2008()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (((**(_DWORD **)(v2 + 8LL * (v0 ^ 0x4B4)) == 0) * (((v0 ^ 6) - 711) ^ 0x3AA)) ^ v0))
                            - 12LL))();
}

uint64_t sub_183DA20C0@<X0>(int a1@<W8>)
{
  uint64_t v8 = *(unsigned int **)(v6 + 8LL * (a1 - 300));
  uint64_t v9 = *v8;
  uint64_t v10 = *(void *)(v6 + 8LL * (a1 - 413));
  uint64_t v11 = *(_BYTE **)(v10 - 4);
  v23[0] = *v11 - 96;
  v23[1] = v11[1] - 96;
  v23[2] = v11[2] - 96;
  v23[3] = v11[3] - 96;
  v23[4] = v11[4] - 96;
  v23[5] = v11[5] - 96;
  v23[6] = v11[6] - 96;
  v23[7] = v11[7] - 96;
  v23[8] = v11[8] - 96;
  v23[9] = v11[9] - 96;
  v23[10] = v11[10] - 96;
  v23[11] = v11[11] - 96;
  v23[12] = v11[12] - 96;
  v23[13] = v11[13] - 96;
  v23[14] = v11[14] - 96;
  v23[15] = v11[15] - 96;
  v23[16] = v11[16] - 96;
  v23[17] = v11[17] - 96;
  v23[18] = v11[18] - 96;
  v23[19] = v11[19] - 96;
  v23[20] = v11[20] - 96;
  v23[21] = v11[21] - 96;
  int v12 = *(_BYTE **)(v10 - 4);
  v23[22] = v12[22] - 96;
  v23[23] = v12[23] - 96;
  v23[24] = v12[24] - 96;
  v23[25] = v12[25] - 96;
  v23[26] = v12[26] - 96;
  v23[27] = v12[27] - 96;
  _BYTE v23[28] = v12[28] - 96;
  v23[29] = v12[29] - 96;
  uint64_t v13 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v6 + 8LL * (a1 ^ 0x11E));
  int v14 = v13(v9, v23, v2);
  int v15 = ((2 * v14) & 0x7D5FBFF6) + (v14 ^ 0x3EAFDFFB);
  if (v15 != 1051713531)
  {
    if (v15 == 1051714633)
    {
      uint64_t v16 = *v8;
      int v17 = **(_BYTE ***)(v6 + 8LL * (v4 - 259));
      v24[0] = *v17 - 125;
      v24[1] = v17[1] - 125;
      v24[2] = v17[2] - 125;
      v24[3] = v17[3] - 125;
      v24[4] = v17[4] - 125;
      v24[5] = v17[5] - 125;
      v24[6] = v17[6] - 125;
      v24[7] = v17[7] - 125;
      v24[8] = v17[8] - 125;
      v24[9] = v17[9] - 125;
      v24[10] = v17[10] - 125;
      v24[11] = v17[11] - 125;
      v24[12] = v17[12] - 125;
      v24[13] = v17[13] - 125;
      v24[14] = v17[14] - 125;
      v24[15] = v17[15] - 125;
      v24[16] = v17[16] - 125;
      v24[17] = v17[17] - 125;
      v24[18] = v17[18] - 125;
      v24[19] = v17[19] - 125;
      int v18 = v13(v16, v24, v2);
      int v19 = (2 * v18) & 0x6EE7FDE6;
      int v15 = (v18 ^ 0x3773FEF3) - 55584960;
    }

    else
    {
      int v19 = -176949704;
    }

    BOOL v21 = v15 + v19 == ((v4 - 441) | 0x480) + 874762650;
    __asm { BR              X8 }
  }

  *(_DWORD *)(v7 + 356) |= v4 - 456;
  *(_DWORD *)(v7 + 56) = 709283135;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8LL * (v4 - 359)))( *v2,  v7 + 344,  v7 + 348,  v7 + 352,  v3);
  uint64_t v22 = *(void *)(v1 + 24);
  *(_DWORD *)(*(void *)(v1 + 8) - 0x4F9B0BF2348906C9LL) = *v2;
  *(_DWORD *)(v22 - 0x41D57A3C79D937EFLL) = *v3;
  *(_DWORD *)(v1 + 16) = -1224190382;
  return result;
}

void sub_183DA24D8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 3804331 * ((a1 & 0x618DD5DA | ~(a1 | 0x618DD5DA)) ^ 0x64ECD973);
  __asm { BR              X10 }

uint64_t sub_183DA2590(void *a1)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (int)(((*(_DWORD *)(*a1 + v4) != v1)
                                               * ((v3 + 391270937) & 0xE8ADA7F9 ^ ((v3 ^ 0x4A8) - 629))) | v3))
                            - 12LL))();
}

uint64_t sub_183DA25DC()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((19
                                          * (((((((v3 - 901) | 0x100) ^ 0x974F5364) + v0)
                                             * (((v3 - 645) ^ 0x974F5364) + v2)) & 0x80000000) == 0)) ^ v3))
                            - 4LL))();
}

uint64_t sub_183DA2624@<X0>(uint64_t a1@<X8>)
{
  unsigned int v7 = v3 + 460628867 * ((2 * (v5 & 0x3CFA7870) - v5 + 1124435849) ^ 0xF9305F4) + 639;
  v5[1] = a1;
  uint64_t v6 = v2;
  v5[0] = v2;
  return (*(uint64_t (**)(void *))(v1 + 8LL * (v3 ^ 0x1BE)))(v5);
}

uint64_t sub_183DA275C(uint64_t a1)
{
  int v1 = 535753261 * ((((2 * a1) | 0x48BC2786) - a1 - 610145219) ^ 0x2EAA1DEC);
  int v2 = *(_DWORD *)a1 - v1;
  int v3 = *(_DWORD *)(a1 + 16) + v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) - 0x67843F9A1244BAC7LL);
  unsigned int v6 = v4 - 1756409276;
  BOOL v5 = v4 - 1756409276 < 0;
  unsigned int v7 = 1756409276 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return (*(uint64_t (**)(void))((char *)*(&off_189D4D580 + v2 - 1537)
                              + 8
                              * ((((v3 - 992697854) < 4 * (unint64_t)v7)
                                * ((175 * (v2 ^ 0x652)) ^ 0x6A7)) | v2)
                              - 12))();
}

uint64_t sub_183DA2830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4
                                                                                 + 8LL * ((91 * (v3 != 992697854)) ^ v5))
                                                                     - 8LL))( a1,  a2,  a3,  1071398615LL);
}

uint64_t sub_183DA2868(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))(*(void *)(v2
                                                                                                 + 8LL
                                                                                                 * ((((v3 - 1570) | 0xE0) + 602) ^ ((v3 - 1570) | 0xE0)))
                                                                                     - 4LL))( a1,  1286746118LL,  (v3 - 1570) | 0xE0u,  ((v3 - 1570) | 0xE0u) + 42,  1677759979LL,  v1);
}

uint64_t sub_183DA28E4@<X0>(uint64_t a1@<X0>, int a2@<W3>, int a3@<W4>, int a4@<W5>, int a5@<W8>)
{
  *(_BYTE *)(*(void *)(a1 + 24) + (a4 + a5)) = (a3 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(void *)(v5 + 8LL * ((1832 * (a4 - 1 == (a2 ^ v6 ^ (a2 - 42)))) ^ a2)) - 8LL))();
}

uint64_t sub_183DA2930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)(v6
                                                                                                  + 8LL * (int)(((v7 == 24) * (a3 + 602)) ^ a3))
                                                                                      - 4LL))( a1,  a2,  a3,  (a3 + 42),  a5,  v5);
}

uint64_t sub_183DA295C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v8 = v3 > v7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)(v5
                                                                                                  + 8LL * (int)(((a3 ^ 0x5FB) * v8) ^ a3))
                                                                                      - 4LL))( a1,  a2,  a3,  a3 ^ 0x1EA,  1677759979LL,  v4);
}

uint64_t sub_183DA29C8@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  return sub_183DA28E4(a1, (a3 + 32) | 0xAu, *(_DWORD *)(*v5 + 4LL * (a2 - 1286746389 + ((a3 + 32) | 0xA))), v4, a4);
}

uint64_t sub_183DA29FC(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(result + 32) = a4;
  return result;
}

uint64_t sub_183DA2A04(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  __int16 v2 = *(_DWORD *)(result + 8) - -24687 * (((result | 0xEC2B) - (result & 0xEC2B)) ^ 0xE018);
  *(_DWORD *)(v1 - 0x14F8B44E17D22716LL) = ((v2 & 0x1FF ^ 0x1D2 | 0x5AB31BCF)
                                          - (v2 & 0x1FF ^ 0x1D2 | 0x254CE430)
                                          + 625796144) ^ 0xB5C766D7;
  *(void *)(v1 - 0x14F8B44E17D22736LL) = 0xAF1486ABFCD6EAECLL;
  *(_DWORD *)(v1 - 0x14F8B44E17D2271ALL) = 356758273;
  int v3 = v2 ^ 0xE1;
  if (v3 == 1)
  {
    int v4 = 356758289;
    goto LABEL_5;
  }

  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x14F8B44E17D2271ELL) = -1224255332;
    int v4 = 356758293;
LABEL_5:
    *(void *)(v1 - 0x14F8B44E17D2272ELL) = 0x9B1812E513909A6DLL;
    *(void *)(v1 - 0x14F8B44E17D22726LL) = 0x64E7ED1AEC6F6592LL;
    *(_DWORD *)(v1 - 0x14F8B44E17D2271ALL) = v4;
  }

  *(_DWORD *)(result + 4) = 1180309136;
  return result;
}

void sub_183DA2B6C(uint64_t a1)
{
  int v1 = 108757529 * (a1 ^ 0xE09C622B);
  __asm { BR              X9 }

uint64_t sub_183DA2BEC@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * (((((a1 == 1747324538) ^ (7 * (v2 ^ 9))) & 1)
                                          * ((v2 ^ 0x509) + 100)) | v2))
                            - 8LL))();
}

uint64_t sub_183DA2C4C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((55 * (11 * ((v1 + 720) ^ 0x281) == 1256)) ^ (11 * ((v1 + 720) ^ 0x281))))
                            - 4LL))();
}

uint64_t sub_183DA2D48@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * (((v4 == ((7 * (v5 ^ a1)) ^ v3)) * a2) ^ v5)) - 4LL))();
}

uint64_t sub_183DA2D78@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
}

uint64_t sub_183DA2DA4@<X0>(int a1@<W1>, int a2@<W7>, uint64_t a3@<X8>)
{
  int v6 = (a2 - 25076346) & 0x17EA2F7;
  int v7 = v4 + v3;
  int v8 = (v6 ^ 0xE6) + v4;
  *(_DWORD *)(*(void *)(v5 - 0x67843F9A1244BAC3LL) + 4LL * v7) = a1;
  *(_DWORD *)(v5 - 0x67843F9A1244BAC7LL) = v8;
  int v9 = v8 + v3;
  if (v8 + v3 < 0) {
    int v9 = -v9;
  }
  return ((uint64_t (*)(void))(*(void *)(a3
                                        + 8LL
                                        * ((894
                                          * ((int)((v9 ^ 0xFEBCFFFF)
                                                 + ((v9 << (((v6 - 103) | 0x50) + 49)) & 0xFD79FFFE)
                                                 + 21168128) >= 0)) ^ ((v6 - 103) | 0x50)))
                            - 156 * (((v6 - 103) | 0x50) ^ 0xD9u)
                            + 1396LL))();
}

uint64_t sub_183DA2E98@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL * (((*(_DWORD *)(*v3 + 4LL * v4) == v1) * (54 * (v2 ^ 0xCA) - 1349)) ^ v2))
                            - 8LL))();
}

uint64_t sub_183DA2ED0@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((894 * (v2 - 1 >= 0)) ^ v1)) - 156 * (v1 ^ 0xD9u) + 1396LL))();
}

uint64_t sub_183DA2F10(uint64_t result)
{
  else {
    int v6 = v5;
  }
  *unsigned int v4 = v6;
  *(_DWORD *)(result + 24) = 1945922183;
  return result;
}

void sub_183DA2F4C(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)a1 - 535753261 * ((a1 + 317168069 - 2 * (a1 & 0x12E799C5)) ^ 0x181397EA);
  uint64_t v2 = *(void *)(a1 + 8);
  v3[0] = v1 + 235795823 * (((v3 | 0xCFB44D7) - (v3 & 0xCFB44D7)) ^ 0x98560D8E) - 686;
  uint64_t v4 = v2;
  sub_183DB5978((uint64_t)v3);
  __asm { BR              X8 }

void sub_183DA3040()
{
  else {
    int v3 = v1 + 2;
  }
  *(_DWORD *)(v0 + 16) = v3;
}

void sub_183DA30AC(uint64_t a1)
{
  int v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 24) - 0x76DC35A7F08F6A42LL) + 1744723139;
  unsigned int v3 = *(_DWORD *)(a1 + 20) + v1 - 142567887;
  BOOL v4 = v2 < 0x70ED6FCD;
  BOOL v5 = v2 > v3;
  if (v3 < 0x70ED6FCD != v4) {
    BOOL v5 = v4;
  }
  __asm { BR              X9 }

uint64_t sub_183DA31A0(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((301
                                          * (((*(unsigned __int8 *)(*(void *)(a1 + 40) + (v2 - 149885707))
                                             - ((*(unsigned __int8 *)(*(void *)(a1 + 40)
                                                                    + (v2 - 149885707)) << (v3 - 123)) & (((v3 + 704900987) & 0xD5FC0F6E) - 650))
                                             - 1949378706) & 0x1F) != 17)) ^ v3))
                            - 8LL))();
}

uint64_t sub_183DA3218()
{
  else {
    BOOL v4 = v2 + 440757728 > (v0 - 1446533299);
  }
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((v4 * (((v3 - 1912680295) & 0x72012CFE) - 237)) ^ v3)) - 4LL))();
}

uint64_t sub_183DA32A8(uint64_t a1)
{
  unsigned int v5 = *(unsigned __int8 *)(v1 + (v3 + 1));
  return (*(uint64_t (**)(uint64_t, void, void))(v2 + 8LL * ((406 * (v5 >> 7)) ^ v4)))( a1,  ((v5 << (((v4 + 6) | 0x80) ^ 0x85)) & 0x1BE) + (v5 ^ 0xDFFFFBDF) + 2071686511,  (v4 + 781));
}

uint64_t sub_183DA3320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
                                        * ((37
                                          * (((((a7 - 377) | 0x400) ^ 0x474) & (v8 + 33) ^ 0x27FFD7CE)
                                           + ((2 * (v8 + 33)) & 0x9Cu)
                                           - 671078351 > 3)) ^ a7))
                            - 12LL))();
}

uint64_t sub_183DA3384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v11 = v9 + v10 + 1502291480;
  BOOL v12 = v11 < 0x8A7A10EF;
  BOOL v13 = v11 > v7 + 286078803;
  if (v12 != v7 + 286078803 < ((a7 + 647) ^ 0x8A7A14E4)) {
    BOOL v13 = v12;
  }
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((230 * !v13) ^ (a7 + 760))) - 8LL))();
}

uint64_t sub_183DA3408(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v11 = *(unsigned __int8 *)(v5 + (v8 + v7 + 2));
  return (*(uint64_t (**)(uint64_t, void, void))(v6 + 8LL * (v10 ^ (807 * (v9 != 671078351)))))( a1,  (v11 ^ (a5 + 8392704)) + a4 + ((2 * v11) & 0xDEu),  (v10 + 781));
}

uint64_t sub_183DA3488(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  int v13 = *(unsigned __int8 *)(v8 + (a7 + v11 + 1035)) | (a2 << 8);
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v9 + 8LL * ((229 * (v10 - 1 == a8)) ^ v12)) - 8LL))( a1,  ((v13 - 2070498816) ^ 0xFF7F694F)
         + 1543241727
         + (((v13 - 2070498816) << (15 * (v12 ^ 0x72) - 10)) & 0xFEFED29E));
}

uint64_t sub_183DA3508(uint64_t a1, int a2, int a3)
{
  int v8 = v5 + v7 + v6 + 543805977;
  uint64_t v9 = 139 * (a3 ^ 0x408u);
  int v10 = a3 - 618;
  unsigned int v11 = a2 + v8 + 1771467054;
  unsigned int v12 = v3 - 1661092400;
  int v13 = (v12 < 0x166A976C) ^ (v11 < 0x166A976C);
  BOOL v14 = v11 > v12;
  if (v13) {
    BOOL v14 = v11 < 0x166A976C;
  }
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * ((738 * !v14) ^ v10)) - v9 + 405))();
}

uint64_t *sub_183DA35A0@<X0>(uint64_t *result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v8 = result[6];
  uint64_t v10 = *result;
  uint64_t v9 = result[1];
  *a3 = v6 + 1545268429;
  *(_DWORD *)(v10 - 0x1B326768DCF9E3AALL) = v4;
  *(_DWORD *)(v8 - 0x238671FDFC4B0A84LL) = a2;
  *(void *)(v9 - 0x33291E09EA041E03LL) = v3 + v7 - 1364771067 + (v5 ^ 0x5AAu);
  *((_DWORD *)result + _Block_object_dispose(va, 8) = -1224190382;
  return result;
}

uint64_t sub_183DA3628(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))((char *)off_189D494D0[(297
                                                                 * ((*(_DWORD *)(a2 + 4) - 1534814542) < 0x15)) | 0x602u]
                                          - 12))(4294925278LL);
}

uint64_t sub_183DA3674@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(*(void *)(a2 + 96) + 24LL) = v3;
  unsigned int v4 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 1225338212) & 0x8CC14DC2) - 354075245;
  return ((uint64_t (*)(void))(*(void *)(v2
                                                     + 8LL
                                                     * ((1022
                                                       * (((2 * v4) & 0x766F5DDE ^ 0x4414DC2)
                                                        + (v4 ^ 0x7D57080E)
                                                        - 134555148 == 858949859)) ^ 0x5FCu))
                                         - 12LL))(0LL);
}

uint64_t sub_183DA370C()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((26 * ((v2 + v1 - 993505007) >= 8)) ^ 0x54Cu)))();
}

uint64_t sub_183DA3770(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v1
                                                              + 8LL
                                                              * ((((((v4 & 0x16FF) - 1221156890) & 0x1FBF) - 1205)
                                                                * ((unint64_t)(v2 - v3 - 4) < 0x20)) ^ v4 & 0x16FF))
                                                  - 8LL))( a1,  (v4 & 0x16FFu) - 1306);
}

uint64_t sub_183DA37BC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                                     + 8LL
                                                     * (((32 * (v4 < ((a3 + 2135873576) & 0x3F46B97E) - 1061591084)) | ((v4 < ((a3 + 2135873576) & 0x3F46B97E) - 1061591084) << 6)) ^ a3))
                                         - 12LL))(((a3 + 2135873576) & 0x3F46B97E) - 1061590565);
}

uint64_t sub_183DA3814@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = v3 + ((9 * (v7 ^ 0x3F46987F)) ^ v6);
  __int128 v9 = *(_OWORD *)(v2 + v8 - 15);
  __int128 v10 = *(_OWORD *)(v2 + v8 - 31);
  uint64_t v11 = a1 + v8;
  *(_OWORD *)(v11 - 15) = v9;
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((62 * ((v4 & 0xFFFFFFE0) == 32)) ^ (v7 + v5))))();
}

void sub_183DA3874()
{
}

uint64_t sub_183DA3880(uint64_t a1, int a2, int a3)
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((((((a3 + a2) ^ (v4 == v5)) & 1) == 0) * (a3 + 516)) ^ a3)))(0LL);
}

uint64_t sub_183DA38B0(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((a3 + 1274) ^ (469 * ((v4 & 0x18) == 0))))
                            - (((a3 + 1274) ^ 0x4E2u)
                             - 66)
                            + 473LL))();
}

uint64_t sub_183DA38E8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 7 + (v7 + v4 - v6 + 69)) = *(void *)(v3 - 7 + (v7 + v4 - v6 + 69));
}

uint64_t sub_183DA3940(uint64_t a1, int a2, int a3)
{
  return (*(uint64_t (**)(void, void))(v3
                                                   + 8LL
                                                   * (((((v4 == a2) ^ (a3 + 44)) & 1)
                                                     * (v5 + ((a3 + 268732033) | 0x2F421000) + 819)) ^ a3)))( 0LL,  (a3 + 484960300) & 0xE31817ED);
}

uint64_t sub_183DA399C@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 + ((a1 + 1061590631) ^ 0xF38BEF50) + v5) = *(_BYTE *)(v4 + ((a1 + 1061590631) ^ 0xF38BEF50) + v5);
  return (*(uint64_t (**)(void))(v2 + 8LL * ((46 * (v5 - 1 != v3)) ^ (a1 - 26))))(0LL);
}

uint64_t sub_183DA39E8@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v5 + v7)) = *(_BYTE *)(v3 + (v5 + v7));
  return (*(uint64_t (**)(void))(v1 + 8LL * (((v7 - 1 != v2) * v6) ^ v4)))(0LL);
}

uint64_t sub_183DA3A18(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))((char *)off_189D494D0[(1822 * (*(_DWORD *)(a2 + 4) == 1534814555)) ^ 0x2F9u]
                                          - 4))(4294925278LL);
}

uint64_t sub_183DA3A60@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_BYTE *)(*(void *)(a2 + 96) + 468LL) = *(_BYTE *)(*(void *)(a1 + 8) + 12LL);
  return ((uint64_t (*)(void))(*(void *)(v2 + 3536) - 4LL))(0LL);
}

uint64_t sub_183DA3AB8@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v7 + v4)) = *(_BYTE *)(v3 + (v7 + v4));
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((v7 - 1 == v2) * v5) ^ v6)) - 4LL))(0LL);
}

void sub_183DA3AEC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  char v2 = (*(void *)(a1 + 32) > *(void *)a1) ^ (v1 - 31 + v1 + 93 + 1);
  __asm { BR              X11 }

uint64_t sub_183DA3BF8()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((((v0 | 0x402) ^ 0x686)
                                          * (((v1 << ((v0 | 2) - 21)) & 0x3E6FEE36 ^ 0x26240632)
                                           + (v1 ^ 0xAC6DF4A2)
                                           + 1778371318 == 154649105)) ^ (v0 | 0x402)))
                            - 4LL))();
}

uint64_t sub_183DA3C70@<X0>(int a1@<W1>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((1502
                                          * ((((a1 + a2 + 1623722213) < 8) ^ (-41 * ((v2 + 117) ^ 0x8E))) & 1)) ^ (v2 - 651)))
                            - ((v2 - 651) ^ 0x729u)
                            + 1178LL))();
}

uint64_t sub_183DA3D04(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
                                        * (((a3 + a5 + 43 * (a8 ^ 0x4BBu) - 1091 < 0xFFFFFFF0)
                                          * (((a8 - 513) | 0x54) - 636)) ^ a8))
                            - 4LL))();
}

uint64_t sub_183DA3D50@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W8>)
{
  uint64_t v10 = (a1 + a4 + a2);
  uint64_t v11 = v10 + v9;
  uint64_t v12 = ((a3 + 318) ^ 0x43C) & v10;
  uint64_t v13 = v6 - v11;
  uint64_t v14 = (v12 | v7) - v11;
  uint64_t v15 = (v12 | v5) - v11;
  unint64_t v16 = v13 + v12;
  BOOL v20 = (unint64_t)(v4 - v9) < 0x10
     || v16 < 0x10
     || (unint64_t)(v14 + 2) < 0x10
     || (unint64_t)(v15 + 1) < 0x10;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((382 * v20) ^ a3)) - 8LL))();
}

uint64_t sub_183DA3DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void))(*(void *)(v8
                                                                                        + 8LL
                                                                                        * (((v7 >= (a7 ^ 0x423u))
                                                                                          * (a7 ^ 0x730)) ^ a7 ^ 0x1AC))
                                                                            - 12LL))( a1,  a2,  a3,  0LL,  a7 ^ 0x53Du);
}

uint64_t sub_183DA3E04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  int v62 = ((a6 ^ 0x632) - 173) | 0x8E;
  *(_DWORD *)(v61 - 120) = v59 + 6;
  *(_DWORD *)(v61 - 124) = v59 + 5;
  v68.val[1].i64[0] = ((_BYTE)v59 + 12) & 0xF;
  v68.val[1].i64[1] = ((_BYTE)v59 + 11) & 0xF;
  v68.val[2].i64[0] = ((_BYTE)v59 + 10) & 0xF;
  v68.val[2].i64[1] = ((v62 ^ 7) + (_BYTE)v59) & 0xF;
  v68.val[3].i64[0] = ((_BYTE)v59 + 8) & 0xF;
  v68.val[3].i64[1] = ((_BYTE)v59 + 7) & 0xF;
  v69.val[0].i64[0] = *(_DWORD *)(v61 - 120) & 0xF;
  v69.val[0].i64[1] = *(_DWORD *)(v61 - 124) & 0xF;
  v69.val[1].i64[0] = ((_BYTE)v59 + 4) & 0xF;
  v69.val[1].i64[1] = ((_BYTE)v59 + 3) & 0xF;
  v69.val[2].i64[0] = ((_BYTE)v59 + 2) & 0xF;
  v69.val[2].i64[1] = ((_BYTE)v59 + 1) & 0xF;
  v69.val[3].i64[0] = v59 & 0xF;
  v69.val[3].i64[1] = ((_BYTE)v59 - 1) & 0xF;
  v63.i64[0] = 0xD1D1D1D1D1D1D1D1LL;
  v63.i64[1] = 0xD1D1D1D1D1D1D1D1LL;
  uint64_t v64 = (v59 + v55);
  v68.val[0].i64[0] = ((_BYTE)v59 + (_BYTE)v55) & 0xF;
  v68.val[0].i64[1] = ((_BYTE)v59 + 13) & 0xF;
  v65.i64[0] = vqtbl4q_s8(v68, (int8x16_t)xmmword_183DC1520).u64[0];
  v65.i64[1] = vqtbl4q_s8(v69, (int8x16_t)xmmword_183DC1520).u64[0];
  int8x16_t v66 = vrev64q_s8(vmulq_s8(v65, v63));
  *(int8x16_t *)(a52 - 15 + v64) = veorq_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v57 + (v64 & 0xF) - 15), *(int8x16_t *)(v54 - 15 + v64)),  veorq_s8( *(int8x16_t *)((v64 & 0xF) + v58 - 13),  *(int8x16_t *)((v64 & 0xF) + v56 - 14))),  vextq_s8(v66, v66, 8uLL));
  return (*(uint64_t (**)(void))(a54 + 8LL * ((35 * (((8 * v62) ^ 0x1DE0) - 384 != (v60 & 0xFFFFFFF0))) ^ v62)))();
}

uint64_t sub_183DA3F84()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((752 * (((v0 == 0x335A03B9) ^ (v1 + 68 + v1 + 124 + 1)) & 1)) ^ v1)))();
}

uint64_t sub_183DA3FD8()
{
  BOOL v9 = v3 > 0x7B533F06;
  if (v9 == v5 + 714637630 < v1) {
    BOOL v9 = v5 + 714637630 < v4;
  }
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((v9 * ((v2 - 968) ^ 0x225)) | v2)) - 12LL))();
}

uint64_t sub_183DA409C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8LL
                              * (((((v4 == a4) ^ v5 ^ 0xF) & 1) * ((131 * (v5 ^ 0x194)) ^ 0x22E)) | v5)))();
}

uint64_t sub_183DA40E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL
                                        * (int)((((215 * ((a8 + 1754510240) & 0x976C47CE ^ 0x10B)) ^ 0x44F)
                                               * ((v8 & 8) == 0)) ^ a8))
                            - 12LL))();
}

uint64_t sub_183DA4134@<X0>( int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W4>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51)
{
  *(_DWORD *)(v58 - 12_Block_object_dispose(va, 8) = v56;
  unsigned int v60 = v56 & 0xFFFFFFF8;
  *(void *)(v58 - 120) = v59 - 7;
  *(_DWORD *)(v58 - 132) = v60;
  *(_DWORD *)(v58 - 124) = -v60;
  int v61 = -8 - a3;
  char v62 = v57 + a1 + a5;
  uint64_t v63 = (a1 + a5 + a2 + v61 + 8);
  v65.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)a5 + (_BYTE)a2 + (_BYTE)v61 + 8) & 0xF;
  v65.val[0].i64[1] = (v62 + 13 + (_BYTE)v61 + 8) & 0xF;
  v65.val[1].i64[0] = (v62 + 12 + (_BYTE)v61 + 8) & 0xF;
  v65.val[1].i64[1] = (v62 + 11 + (_BYTE)v61 + 8) & 0xF;
  v65.val[2].i64[0] = (v62 + 10 + (_BYTE)v61 + 8) & 0xF;
  v65.val[2].i64[1] = (v62 + 9 + (_BYTE)v61 + 8) & 0xF;
  v65.val[3].i64[0] = (v62 + 8 + (_BYTE)v61 + 8) & 0xF;
  v65.val[3].i64[1] = (v55 + (_BYTE)v61 + ((a4 + 125) ^ 0xC) + 8) & 0xF;
  *(int8x8_t *)(*(void *)(v58 - 120) + v63) = veor_s8( veor_s8( veor_s8( *(int8x8_t *)(v53 + (v63 & 0xF) - 7),  *(int8x8_t *)(v51 - 7 + v63)),  veor_s8( *(int8x8_t *)((v63 & 0xF) + v54 - 5),  *(int8x8_t *)((v63 & 0xF) + v52 - 6))),  vrev64_s8( vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8( v65,  (int8x16_t)xmmword_183DC1530),  (int8x8_t)0xD1D1D1D1D1D1D1D1LL)));
}

void sub_183DA4294()
{
}

uint64_t sub_183DA429C( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v21
                                                      + 8LL
                                                      * (a3 ^ (1491 * (*(_DWORD *)(v22 - 128) == *(_DWORD *)(v22 - 132)))))
                                          - ((a3 + 897059436) & 0xCA87F63B ^ (2 * a3) ^ 0x51A ^ 0x637LL)))(a21);
}

uint64_t sub_183DA42FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  *(_BYTE *)(v14 + (a6 + v9)) = *(_BYTE *)(v11 + ((a6 + v9) & 0xFLL)) ^ *(_BYTE *)(v7
                                                                                               + (a6 + v9)) ^ *(_BYTE *)((((_BYTE)a6 + (_BYTE)v9) & 0xF) + v12 + 2) ^ *(_BYTE *)((((_BYTE)a6 + (_BYTE)v9) & 0xF) + v10 + 1) ^ (-47 * ((a6 + v9) & 0xF));
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * (((a6 - 1 == v8) * ((a7 - 551) ^ 0x2AF)) ^ (a7 + 324))) - 12LL))();
}

uint64_t sub_183DA4368( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45)
{
  uint64_t v48 = *(void *)(a1 + 24);
  *(int8x16_t *)(v46 - 112) = veorq_s8( *(int8x16_t *)(*(void *)(a1 + 16) - 0x39E8CCF6252BBBF8LL),  (int8x16_t)xmmword_183DC1550);
  if (v47) {
    BOOL v49 = v48 == 0x35AD11BEDFA3F43ALL;
  }
  else {
    BOOL v49 = 1;
  }
  int v50 = !v49;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 8LL * (int)((1825 * v50) ^ a5)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45);
}

uint64_t sub_183DA43E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45)
{
  int v47 = v45 - 885;
  int v48 = v45 - 1342;
  int v49 = (v45 - 1342) ^ 0x53E;
  int v50 = v48 | 0x84;
  BOOL v52 = ((BYTE4(a22) + 9) & 0xF) != 0 || HIDWORD(a22) == 540105255;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8LL * ((((v49 - 1213) ^ v50) * v52) ^ v47)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45);
}

uint64_t sub_183DA4438( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int a22, int a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54)
{
  return ((uint64_t (*)(void))(*(void *)(v55
                                        + 8LL
                                        * (v54 ^ (232
                                                * (((2 * (a23 - ((2 * a54) & 0x32FF45AA) + 2035173550)) & 0xF73FFF7E ^ 0x323F452A)
                                                 + ((a23 - ((2 * a54) & 0x32FF45AA) + 2035173550) ^ 0x62E05D6A)
                                                 + 2113317082 != 2039916697))))
                            - 12LL))();
}

uint64_t sub_183DA44F0()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((1459
}

uint64_t sub_183DA457C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, unsigned int a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void))(v7
                                                                              + 8LL
                                                                              * ((((a6 ^ 0x30) + 500)
                                                                                * (a7 >> 4 == 263847932)) ^ a6)))( a1,  a2,  a6 ^ 0x30u,  a2,  (a6 ^ 0x30u) + 733);
}

uint64_t sub_183DA45AC(int a1, uint64_t a2, int a3)
{
  uint64_t v10 = a1 + ((a3 - 1538679387) & 0x5BB66537u) + v7 + v6 - 1075;
  unint64_t v11 = ((a3 - 1538679387) ^ 0xA4499D6D) + v9 + v10 - 917;
  uint64_t v12 = (v7 + v6) & 0xF;
  uint64_t v13 = v12 - v10;
  unint64_t v14 = v3 + v13;
  ++v12;
  unint64_t v15 = v3 + v12;
  unint64_t v16 = v4 + v13;
  unint64_t v17 = v4 + v12;
  unint64_t v18 = v5 + v13;
  unint64_t v19 = v5 + v12;
  BOOL v21 = v15 > v9 && v14 < v11;
  if (v17 > v9 && v16 < v11) {
    BOOL v21 = 1;
  }
  int v24 = v19 > v9 && v18 < v11 || v21;
  return (*(uint64_t (**)(void))(v8 + 8LL * (((16 * v24) | (32 * v24)) ^ a3)))();
}

uint64_t sub_183DA4648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(uint64_t, uint64_t, void))(*(void *)(v8
                                                                       + 8LL
                                                                       * ((1714
                                                                         * (((v7 < 0x10) ^ ((a7 ^ 0xB5) - 48)) & 1)) ^ a7))
                                                           - 12LL))( a1,  a2,  0LL);
}

uint64_t sub_183DA4680( int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  v69.val[1].i64[0] = ((_BYTE)a2 + 4) & 0xF;
  v69.val[1].i64[1] = ((_BYTE)a2 + 3) & 0xF;
  v69.val[2].i64[0] = ((_BYTE)a2 + 2) & 0xF;
  v69.val[2].i64[1] = ((_BYTE)a2 + 1) & 0xF;
  v69.val[3].i64[0] = a2 & 0xF;
  v69.val[3].i64[1] = ((_BYTE)a2 - 1) & 0xF;
  v70.val[0].i64[0] = ((_BYTE)a2 + 14) & 0xF;
  v70.val[0].i64[1] = ((_BYTE)a2 + 13) & 0xF;
  unsigned int v61 = v59 + v58 + a1;
  v70.val[1].i64[0] = ((_BYTE)a2 + 12) & 0xF;
  v70.val[1].i64[1] = ((_BYTE)a2 + 11) & 0xF;
  v70.val[2].i64[0] = (a2 + 10) & 0xF;
  v70.val[2].i64[1] = (a2 + 9) & 0xF;
  v70.val[3].i64[0] = ((_BYTE)a2 + 8) & 0xF;
  v70.val[3].i64[1] = ((_BYTE)a2 + 7) & 0xF;
  v62.i64[0] = 0x505050505050505LL;
  v62.i64[1] = 0x505050505050505LL;
  v63.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v63.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
  uint64_t v64 = v61 & ((a4 ^ 0x1B3u) - 561LL);
  v69.val[0].i64[0] = v64;
  v69.val[0].i64[1] = ((_BYTE)a2 + 5) & 0xF;
  v65.i64[0] = vqtbl4q_s8(v69, (int8x16_t)xmmword_183DC1520).u64[0];
  v65.i64[1] = vqtbl4q_s8(v70, (int8x16_t)xmmword_183DC1520).u64[0];
  int8x16_t v66 = vrev64q_s8( veorq_s8( veorq_s8(*(int8x16_t *)(v60 - 15 + v61), *(int8x16_t *)(v54 + v64 - 15)),  veorq_s8(*(int8x16_t *)(v55 + v64 - 15), *(int8x16_t *)(v56 + v64 - 15))));
  int8x16_t v67 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v66, v66, 8uLL), v63), vmulq_s8(v65, v62)));
  *(int8x16_t *)(v60 - 15 + v61) = vextq_s8(v67, v67, 8uLL);
  return ((uint64_t (*)(void))(*(void *)(a54 + 8LL * ((1705 * ((v57 & 0xFFFFFFF0) == 16)) ^ a4)) - 12LL))();
}

void sub_183DA47E4()
{
}

uint64_t sub_183DA47F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,unsigned __int8 *a52,unsigned int a53,uint64_t a54)
{
  uint64_t v59 = *(void *)(v57 + 8LL * (v56 - 122)) - 12LL;
  uint64_t v60 = *v55 ^ 0xB1LL;
  uint64_t v61 = *(void *)(v57 + 8LL * (v56 - 99));
  int v62 = v56;
  uint64_t v63 = *(void *)(v57 + 8LL * (v56 + 2)) - 8LL;
  int v64 = ((*(unsigned __int8 *)(v61 + v60) ^ 0x33) << (v56 + 84)) | ((*(unsigned __int8 *)(v59
                                                                                        + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F438LL) ^ 0xD7LL)) ^ 0xB3) << 8);
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F42DLL) ^ 0x49LL));
  LODWORD(v66) = (HIDWORD(v66) ^ 0xC8) << 24;
  unsigned __int8 v65 = v66 >> 26;
  uint64_t v67 = *(void *)(v57 + 8LL * (v56 ^ 0xF3)) - 8LL;
  LODWORD(v60) = *(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F42ELL) ^ 0xB8LL));
  int v68 = v64 | (*(_BYTE *)(v67 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F437LL) ^ 0xECLL)) - 115) ^ 9;
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F431LL) ^ 0x6BLL));
  LODWORD(v66) = (HIDWORD(v66) ^ 0xC8) << 24;
  int v69 = ((v66 >> 26) ^ 0x53) << 16;
  LOBYTE(v64) = *(_BYTE *)(v59 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F42CLL) ^ 0x2ELL));
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F439LL) ^ 0x47LL));
  LODWORD(v66) = (HIDWORD(v66) ^ 0xC8) << 24;
  int v70 = v68 | (((v66 >> 26) ^ 0x1E) << 16);
  int v71 = v69 | ((*(unsigned __int8 *)(v59 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F430LL) ^ 0x77LL)) ^ 0x7C) << 8);
  unsigned int v72 = (*(_BYTE *)(v67 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F42BLL) ^ 0x36LL)) - 115) ^ 0x2A | ((v64 ^ 0x76) << 8) | ((v65 ^ 0xFB) << 16) | ((v60 ^ 0x8B) << 24);
  HIDWORD(v66) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F435LL) ^ 0xCBLL));
  LODWORD(v66) = (HIDWORD(v66) ^ 0xC8) << 24;
  char v73 = *(_BYTE *)(v67 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F42FLL) ^ 0xB5LL));
  unsigned int v74 = ((*(_BYTE *)(v67 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F433LL) ^ 0xA9LL)) - 115) | ((*(unsigned __int8 *)(v59 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F434LL) ^ 0x30LL)) ^ 0x86) << 8)) & 0xFF00FFFF | (((v66 >> 26) ^ 0xBA) << 16) | ((*(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F436LL) ^ 0x35LL)) ^ 0xFC) << 24);
  int v75 = v71 | ((*(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v54 - 0x35AD11BEDFA3F432LL) ^ 0xBFLL)) ^ 0xE5) << 24);
  uint64_t v76 = *(void *)(v57 + 8LL * (v62 - 179)) - 4LL;
  uint64_t v77 = v65 ^ 0x61u;
  uint64_t v78 = *(void *)(v57 + 8LL * (v62 - 35)) - 8LL;
  LODWORD(v59) = *(_DWORD *)(v76
                           + 4LL
                           * ((*(_BYTE *)(v67
  *(_DWORD *)(v58 - 140) = v62;
  uint64_t v79 = *(void *)(v57 + 8LL * (v62 ^ 0xC1));
  LODWORD(v59) = (v59 - ((2 * v59) & 0x906CBB42) - 935961183) ^ *(_DWORD *)(v79 + 4LL * (v60 ^ 0x1Eu));
  uint64_t v80 = *(void *)(v57 + 8LL * (v62 - 137)) - 4LL;
  unint64_t v515 = __PAIR64__(v70, v72);
  LOBYTE(v71) = (v73 - 115) ^ 0xA8;
  unsigned int v81 = v75 & 0xFFFFFF00 | v71;
  int v424 = *(_DWORD *)(v80 + 4LL * (v64 ^ 0x4Eu)) ^ v70 ^ (v59 - ((2 * v59) & 0x5D2481CE) + 781336807);
  int v82 = v424 ^ v74 ^ 0x4D;
  int v83 = v424 ^ v74;
  *(_DWORD *)(v58 - 184) = v424 ^ v74;
  *(_DWORD *)(v58 - 120) = v82 ^ v81;
  unsigned __int8 v422 = v424 ^ v74 ^ 0x4D;
  LODWORD(v59) = v82 ^ v81 ^ (v72 - ((2 * v72) & 0x98F44CFE) + 1283073663);
  int v453 = BYTE1(v59);
  int v439 = BYTE2(v59);
  int v84 = *(_DWORD *)(v78 + 4LL * (BYTE2(v59) ^ 0xC4u)) ^ *(_DWORD *)(v80 + 4LL * (BYTE1(v59) ^ 0xDCu));
  unsigned int v85 = v59 ^ 0xF68D0BD6;
  int v451 = v59;
  LODWORD(v59) = ((v84 ^ 0xCB07FF6A) - 2 * ((v84 ^ 0xCB07FF6A) & 0xB0FF5F ^ v84 & 0x14) + 11599691) ^ *(_DWORD *)(v76 + 4LL * (v59 ^ 0x56u));
  unsigned int v445 = HIBYTE(v85);
  int v86 = v424 ^ *(_DWORD *)(v79 + 4LL * (HIBYTE(v85) ^ 0x65)) ^ (v59 - ((2 * v59) & 0x906CBB42) - 935961183);
  unint64_t v514 = __PAIR64__(v74, v81);
  *(_DWORD *)(v58 - 124) = v86 ^ 0xD48E4E47;
  *(_DWORD *)(v58 - 176) = v86;
  unsigned int v87 = v86 ^ 0xD48E4E47 ^ (v81 - 2 * (v81 & 0x548E4E4F ^ v71 & 8) - 728871353);
  unsigned int v88 = v87 ^ v85;
  *(_DWORD *)(v58 - 152) = v87;
  int v461 = ((unsigned __int16)(v87 ^ v85) >> 8);
  int v464 = ((v87 ^ v85) >> 16);
  LODWORD(v59) = *(_DWORD *)(v80 + 4LL * (v461 ^ 0x9Bu)) ^ *(_DWORD *)(v78 + 4LL * (v464 ^ 0x2Eu));
  int v534 = (v87 ^ v85);
  LODWORD(v59) = ((v59 ^ 0xCB07FF6A) + 11599692 + ~(2 * ((v59 ^ 0xCB07FF6A) & 0xB0FF5B ^ v59 & 0x10))) ^ *(_DWORD *)(v76 + 4LL * (v534 ^ 0xD2u));
  int v89 = v59 - ((2 * v59) & 0x906CBB42);
  LODWORD(v59) = v88 ^ 0x27F36551;
  *(_DWORD *)(v58 - 200) = HIBYTE(v88);
  int v90 = (v89 - 935961183) ^ *(_DWORD *)(v79 + 4LL * (HIBYTE(v88) ^ 0x69));
  unsigned int v91 = v90 ^ v82 ^ 0xCFEF2C12;
  *(_DWORD *)(v58 - 16_Block_object_dispose(va, 8) = v90 ^ v82;
  *(_DWORD *)(v58 - 160) = v91 ^ v87;
  int v92 = ((v91 ^ v87 ^ 0x556921F8) - 2 * ((v91 ^ v87 ^ 0x556921F8) & 0x5354C41B ^ (v91 ^ v87) & 3) + 1398064152) ^ v88 ^ 0x27F36551;
  int v500 = ((v92 ^ 0x9547167F) >> 16);
  int v516 = ((unsigned __int16)(v92 ^ 0x167F) >> 8);
  unsigned int v93 = *(_DWORD *)(v78 + 4LL * (v500 ^ 0x89u)) ^ *(_DWORD *)(v80 + 4LL * (v516 ^ 0x3Au)) ^ 0xCB07FF6A;
  int v504 = v92;
  int v94 = (v93 - ((2 * v93) & 0x161FE96) + 11599691) ^ *(_DWORD *)(v76 + 4LL * (v92 ^ 0xE4u));
  unsigned int v520 = (v92 ^ 0x9547167F) >> 24;
  unsigned int v95 = (v94 - ((2 * v94) & 0x906CBB42) - 935961183) ^ *(_DWORD *)(v79 + 4LL * (v520 ^ 0x1D));
  unsigned int v471 = v90 ^ v86;
  int v529 = (v95 - ((2 * v95) & 0x672BE79C) - 1282018354) ^ v90 ^ v86;
  *(_DWORD *)(v58 - 232) = v529 ^ 0xB395F3CE;
  unsigned int v536 = v529 ^ 0xB395F3CE ^ v90 ^ v82;
  unsigned int v96 = ((v536 ^ 0xFE25CD6D) - ((2 * (v536 ^ 0xFE25CD6D)) & 0xA6A98830) + 1398064152) ^ v59;
  LODWORD(v59) = ((unsigned __int16)(((v536 ^ 0xCD6D) - ((2 * (v536 ^ 0xCD6D)) & 0x8830) - 15336) ^ v59) >> 8);
  *(_DWORD *)(v58 - 204) = v59;
  LODWORD(v59) = *(_DWORD *)(v80 + 4LL * (v59 ^ 0x6F));
  unsigned int v97 = (v83 ^ 0xBAF72DE4) - ((2 * (v83 ^ 0xBAF72DE4)) & 0xA91C9C8E) - 728871353;
  *(_DWORD *)(v58 - 216) = BYTE2(v96);
  unsigned int v98 = v96;
  LODWORD(v59) = v59 ^ *(_DWORD *)(v78 + 4LL * (BYTE2(v96) ^ 0xA8u)) ^ 0xCB07FF6A;
  *(_DWORD *)(v58 - 240) = HIBYTE(v96);
  LODWORD(v59) = (v59 - ((2 * v59) & 0x906CBB42) - 935961183) ^ *(_DWORD *)(v79 + 4LL * (HIBYTE(v96) ^ 0x85));
  *(_DWORD *)(v58 - 256) = v96;
  LODWORD(v59) = (v59 - ((2 * v59) & 0x161FE96) + 11599691) ^ *(_DWORD *)(v76 + 4LL * (v96 ^ 0x25u));
  int v527 = v536 ^ v91 ^ v87;
  unsigned int v401 = (v59 - ((2 * v59) & 0xEA300376) + 1964507579) ^ v91 ^ v527;
  unsigned int v99 = (v59 - ((2 * v59) & 0xEA300376) + 1964507579) ^ v91;
  unsigned int v406 = v99;
  unsigned int v100 = v96 ^ v401 ^ 0xDED83C20;
  *(_DWORD *)(v58 - 24_Block_object_dispose(va, 8) = v96;
  unsigned int v436 = (v100 ^ 0x9CC5AADB) >> 24;
  int v418 = ((v100 ^ 0x9CC5AADB) >> 16);
  int v101 = *(_DWORD *)(v79 + 4LL * (v436 ^ 0x1D)) ^ *(_DWORD *)(v78 + 4LL * (v418 ^ 0x89u)) ^ 0x2DA3E22C;
  int v427 = ((unsigned __int16)(v100 ^ 0xAADB) >> 8);
  int v102 = (v101 - ((2 * v101) & 0x5D2481CE) + 781336807) ^ *(_DWORD *)(v80 + 4LL * (v427 ^ 0x3Au));
  *(_DWORD *)(v58 - 192) = v529 ^ 0xB395F3CE ^ v59;
  int v522 = (v96 ^ v401 ^ 0x20);
  unsigned __int8 v435 = BYTE2(v99) ^ 0x16;
  int v103 = v529 ^ 0xB395F3CE ^ v59 ^ *(_DWORD *)(v76 + 4LL * (v522 ^ 0x40u)) ^ (v102 - ((2 * v102) & 0x161FE96) + 11599691) ^ v99 ^ 0x7C166C11;
  int v104 = v529 ^ 0xB395F3CE ^ v59 ^ *(_DWORD *)(v76 + 4LL * (v522 ^ 0x40u)) ^ (v102 - ((2 * v102) & 0x161FE96) + 11599691);
  int v497 = v104;
  unsigned int v105 = (v103 ^ v96) >> 24;
  *(_DWORD *)(v58 - 224) = v105;
  int v507 = (v103 ^ v98);
  unsigned int v106 = *(_DWORD *)(v79 + 4LL * (v105 ^ 0x9B)) ^ *(_DWORD *)(v76 + 4LL * (v507 ^ 0x31u)) ^ 0xC886A2EA;
  unsigned int v485 = ((v103 ^ v98) >> 8) ^ 0x86839A;
  int v487 = ((unsigned __int16)(v103 ^ v98) >> 8) ^ 0x9A;
  int v107 = (v106 - ((2 * v106) & 0x5D2481CE) + 781336807) ^ *(_DWORD *)(v80
                                                                    + 4LL
                                                                    * (((unsigned __int16)(v103 ^ v98) >> 8) ^ 0xA0u));
  int v108 = v103 ^ v98 ^ 0x55FAB6BF;
  int v491 = ((v103 ^ v98) >> 16);
  unsigned int v109 = (v107 - ((2 * v107) & 0xCB2B7F1A) - 443170931) ^ *(_DWORD *)(v78 + 4LL * (v491 ^ 0xAu));
  unsigned int v110 = (v109 - ((2 * v109) & 0xF809A778) - 66792516) ^ v104;
  *(_DWORD *)(v58 - 12_Block_object_dispose(va, 8) = v110;
  v110 ^= 0x1874916u;
  int v447 = v110 ^ v103;
  unsigned int v111 = v110;
  __int16 v430 = v110;
  unsigned int v495 = v103 ^ v401 ^ 0xDED83C20;
  int v112 = v103;
  int v478 = v103;
  *(_DWORD *)(v58 - 132) = v495 ^ 0x3201F5AE;
  int v113 = ((v110 ^ v103 ^ 0x5A137D54) - ((2 * (v110 ^ v103 ^ 0x5A137D54)) & 0x32774354) + 423338410) ^ v495 ^ 0x3201F5AE;
  *(_DWORD *)(v58 - 136) = v113;
  unsigned int v114 = ((v113 ^ 0xF43125C5) - 2 * ((v113 ^ 0xF43125C5) & 0x53792C17 ^ v113 & 2) - 747033579) ^ v108 ^ 0x479AB031;
  int v532 = ((unsigned __int16)(((v113 ^ 0x25C5) - 2 * ((v113 ^ 0x25C5) & 0x2C17 ^ v113 & 2) + 11285) ^ v108 ^ 0xB031) >> 8);
  int v518 = (((v113 ^ 0xC5) - 2 * ((v113 ^ 0xC5) & 0x17 ^ v113 & 2) + 21) ^ v108);
  int v115 = *(_DWORD *)(v76 + 4LL * (v518 ^ 0xAAu)) ^ *(_DWORD *)(v80 + 4LL * (v532 ^ 0x3Au));
  int v116 = BYTE2(v114);
  int v117 = ((v115 ^ 0x2E22BFAC) - 2 * ((v115 ^ 0x2E22BFAC) & 0x6595BF9D ^ v115 & 0x10) - 443170931) ^ *(_DWORD *)(v78 + 4LL * (BYTE2(v114) ^ 0x89u));
  unsigned int v441 = HIBYTE(v114);
  LODWORD(v77) = (v117 - ((2 * v117) & 0x906CBB42) - 935961183) ^ *(_DWORD *)(v79 + 4LL * (HIBYTE(v114) ^ 0x1D));
  unsigned int v118 = v77 ^ v112;
  unsigned int v119 = ((v77 ^ v112 ^ 0xA6C48CD5) - 2 * ((v77 ^ v112 ^ 0xA6C48CD5) & 0x53792C1F ^ (v77 ^ v112) & 0xA) - 747033579) ^ v108;
  unsigned int v120 = HIBYTE(v119);
  int v121 = BYTE1(v119);
  LODWORD(v67) = *(_DWORD *)(v79 + 4LL * (HIBYTE(v119) ^ 5)) ^ *(_DWORD *)(v80 + 4LL * (BYTE1(v119) ^ 0x6Fu)) ^ 0xE6A41D46;
  int v492 = v119;
  LODWORD(v67) = (v67 - ((2 * v67) & 0x161FE96) + 11599691) ^ *(_DWORD *)(v76 + 4LL * (v119 ^ 0x25u));
  int v122 = v67 - ((2 * v67) & 0xCB2B7F1A);
  int v123 = v77 ^ v111;
  LODWORD(v67) = BYTE2(v119);
  unsigned int v124 = (v122 - 443170931) ^ *(_DWORD *)(v78 + 4LL * (BYTE2(v119) ^ 0xA8u)) ^ v77 ^ v111;
  int v468 = v113 ^ 0x73AEFDC5 ^ v124;
  int v525 = ((unsigned __int16)(v468 ^ v119) >> 8);
  LODWORD(v80) = *(_DWORD *)(v80 + 4LL * (v525 ^ 0x44u));
  unsigned int v397 = (v468 ^ v119) >> 24;
  LODWORD(v79) = *(_DWORD *)(v79 + 4LL * (v397 ^ 0x47));
  *(_DWORD *)(v58 - 124) ^= v97;
  int v408 = (v468 ^ v119);
  int v125 = ((v80 ^ v79 ^ 0xE6A41D46) + 11599692 + (~(2 * (v80 ^ v79 ^ 0xE6A41D46)) | 0xFE9E0169)) ^ *(_DWORD *)(v76 + 4LL * (v408 ^ 0xD5u));
  int v394 = ((v468 ^ v119) >> 16);
  LODWORD(v59) = (v125 - ((2 * v125) & 0xCB2B7F1A) - 443170931) ^ *(_DWORD *)(v78 + 4LL * (v394 ^ 0xCBu));
  HIDWORD(v513) = v124 ^ 0x8787603 ^ (v59 - ((2 * v59) & 0x111EB754) - 2003870806);
  int v396 = v124 ^ v77 ^ v112;
  LODWORD(v513) = v396 ^ 0x73AB34AC ^ (HIDWORD(v513) - ((2 * HIDWORD(v513)) & 0xAE13F770) + 1460272056);
  LODWORD(v59) = v513 ^ v468 ^ 0x42632BF0;
  HIDWORD(v512) = v59 ^ 0x4662A266;
  LODWORD(v512) = ((v59 ^ 0x4662A266) - 2 * ((v59 ^ 0x4662A266) & 0x11614C9C ^ v59 & 0x10) + 291589260) ^ v468 ^ v119;
  LODWORD(v76) = *(_DWORD *)(v58 - 140);
  unsigned int v126 = (char *)*(&off_189D4D580 + (int)(v76 ^ 0xC8)) - 4;
  LODWORD(v59) = (((v123 ^ 0x1B9155BDu) >> 16)
                - 120243103
                + ((2 * ((v123 ^ 0x1B9155BDu) >> 16) + 88) & 0x68 ^ 0xF7F37BFF)) ^ *(_DWORD *)&v126[4 * (((v123 ^ 0x1B9155BDu) >> 16) ^ 0x2D)];
  LODWORD(v80) = ((v67 ^ 0x89) - 120243104 - ((2 * (v67 ^ 0x89) + 160207960) & 0x80C8468)) ^ *(_DWORD *)&v126[4 * (v67 ^ 0xA4)];
  unsigned int v127 = (char *)*(&off_189D4D580 + (int)(v76 ^ 0x66)) - 4;
  LODWORD(v7_Block_object_dispose(va, 8) = (v59 - ((2 * v59) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (BYTE1(v123) ^ 0x47)];
  LODWORD(v59) = v80 - ((2 * v80) & 0x3AF66B6C);
  int v128 = (char *)*(&off_189D4D580 + (int)(v76 ^ 0xC5)) - 8;
  LODWORD(v77) = (v59 - 1652869706) ^ *(_DWORD *)&v128[4 * (v120 ^ 0xCC)];
  int v129 = (char *)*(&off_189D4D580 + (int)(v76 ^ 0x7C)) - 12;
  int v130 = *(_DWORD *)&v129[4 * (v113 ^ 0xC5 ^ v118 ^ 0x53)];
  LODWORD(v59) = 181304767 * v130 - ((362609534 * v130 + 679768980) & 0x3AF66B6C);
  unsigned __int8 v384 = ((unsigned __int16)(v113 ^ 0xFDC5) >> 8) ^ BYTE1(v118);
  int v131 = ((v113 ^ 0x73AEFDC5 ^ v118) >> 16);
  LODWORD(v59) = *(_DWORD *)&v126[4 * (v131 ^ 0xAA)] ^ *(_DWORD *)&v128[4 * (((v113 ^ 0x73AEFDC5 ^ v118) >> 24) ^ 0x3E)] ^ ((v131 ^ 0x87) - 120243103 + ((2 * (((v131 ^ 0x87) + 44) & 0x35 ^ (v131 ^ 0x87 | 0x7FFFFFFE))) ^ 0x80C8403)) ^ (v59 + 297627520);
  LODWORD(v76) = *(_DWORD *)&v129[4 * (v118 ^ 0x74)];
  int v132 = (181304767 * v76 - ((362609534 * v76 + 679768980) & 0x37B43BF6) - 1877190715) ^ *(_DWORD *)&v127[4 * (BYTE1(v118) ^ 0x5A)];
  int v510 = v132 - ((2 * v132) & 0x3AF66B6C);
  unsigned int v502 = HIBYTE(v118) ^ 0xB2;
  int v473 = BYTE2(v118);
  int v531 = (BYTE2(v118) ^ 0x4C)
       - 120243103
       + ((2 * (((BYTE2(v118) ^ 0x4C) + 44) & 0x35 ^ (HIWORD(v118) | 0x7FFFFFFE))) ^ 0x80C8403);
  unsigned int v476 = v121 ^ 0xB0;
  int v482 = v77 - ((2 * v77) & 0x37B43BF6);
  int v480 = v59 - ((2 * v59) & 0x37B43BF6);
  HIDWORD(v517) = (v78 - ((2 * v78) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * ((v123 ^ 0x1B9155BDu) >> 24)] ^ (181304767 * *(_DWORD *)&v129[4 * (v123 ^ 0x7D)] + 1950497226);
  LODWORD(v59) = *(_DWORD *)(v58 - 124) ^ 0xE9B45E6C;
  LODWORD(v77) = *(_DWORD *)&v126[4 * (BYTE2(v59) ^ 0xF5)] ^ ((BYTE2(v59) ^ 0xD8)
                                                            - 120243103
                                                            + ((2 * (BYTE2(v59) ^ 0xD8) + 88) & 0x68 ^ 0xF7F37BFF));
  unsigned int v133 = *(_DWORD *)(v58 - 152) ^ 0x31676F78;
  int v134 = *(_DWORD *)&v126[4 * (BYTE2(v133) ^ 0x7B)] ^ ((BYTE2(v133) ^ 0x56)
                                                     - 120243103
                                                     + ((2
                                                       * (((BYTE2(v133) ^ 0x56) + 44) & 0x37 ^ (BYTE2(v133) ^ 0x56 | 0x7FFFFFFC))) ^ 0x80C8407));
  int v135 = (v134 - ((2 * v134) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * HIBYTE(v133)];
  unsigned int v136 = *(_DWORD *)&v126[4 * (v464 ^ 0x34)] ^ ((v464 ^ 0x19)
                                              - 120243103
                                              + ((2 * (v464 ^ 0x19) + 88) & 0x68 ^ 0xF7F37BFF));
  int v137 = (v136 - ((2 * v136) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (v461 ^ 5)];
  int v462 = v135 - ((2 * v135) & 0x37B43BF6);
  int v465 = v137 - ((2 * v137) & 0x3AF66B6C);
  int v138 = *(_DWORD *)&v129[4 * (*(_DWORD *)(v58 - 176) ^ 0xDF)];
  unsigned int v139 = *(_DWORD *)(v58 - 176) ^ 0x5A18571F;
  int v140 = *(_DWORD *)&v128[4 * HIBYTE(v139)] ^ ((BYTE2(v139) ^ 0xC1)
                                             - 120243104
                                             - ((2 * (BYTE2(v139) ^ 0xC1) + 160207960) & 0x80C8468)) ^ *(_DWORD *)&v126[4 * (BYTE2(v139) ^ 0xEC)] ^ (181304767 * v138 - ((362609534 * v138 + 679768980) & 0x3AF66B6C) + 297627520);
  int v458 = v140 - ((2 * v140) & 0x37B43BF6);
  LODWORD(v59) = *(_DWORD *)&v128[4 * BYTE3(v59)] ^ (v77 - ((2 * v77) & 0x3AF66B6C) - 1652869706);
  int v456 = v59 - ((2 * v59) & 0x37B43BF6);
  LOWORD(v59) = v447 ^ 0x8EA4;
  LODWORD(v77) = v447 ^ 0x35C48CD5;
  unsigned int v141 = *(_DWORD *)&v126[4 * (v116 ^ 0xDE)] ^ ((v116 ^ 0xF3)
                                              - 120243103
                                              + ((2 * (v116 ^ 0xF3) + 88) & 0x68 ^ 0xF7F37BFF));
  unsigned int v142 = *(_DWORD *)&v126[4 * (((v447 ^ 0x35C48CD5u) >> 16) ^ 0xFE)] ^ ((((v447 ^ 0x35C48CD5u) >> 16) ^ 0xD3)
                                                                                       - 120243103
                                                                                       + ((2
  int v143 = (v141 - ((2 * v141) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * (v441 ^ 0x36)];
  int v144 = BYTE2(*(_DWORD *)(v58 - 128));
  unsigned int v145 = *(_DWORD *)&v126[4 * (v144 ^ 0xAB)] ^ ((v144 ^ 0x86)
                                              - 120243103
                                              + ((2 * (v144 ^ 0x86) + 88) & 0x68 ^ 0xF7F37BFF));
  int v146 = (v145 - ((2 * v145) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (HIBYTE(v430) ^ 0x8B)];
  int v442 = v143 - ((2 * v143) & 0x37B43BF6);
  int v448 = v146 - ((2 * v146) & 0x3AF66B6C);
  int v147 = *(_DWORD *)(v58 - 136) ^ 0x113125C5;
  unsigned int v148 = *(_DWORD *)&v127[4 * (BYTE1(v147) ^ 0x20)] ^ ((BYTE2(v147) ^ 0xD7)
                                                     - 120243103
                                                     + ((2 * (BYTE2(v147) ^ 0xD7) + 88) & 0x68 ^ 0xF7F37BFF)) ^ *(_DWORD *)&v126[4 * (BYTE2(v147) ^ 0xFA)] ^ (181304767 * *(_DWORD *)&v129[4 * v113] - ((362609534 * *(_DWORD *)&v129[4 * v113] + 679768980) & 0x37B43BF6) - 1877190715);
  LODWORD(v77) = (v142 - ((2 * v142) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * BYTE3(v77)] ^ (181304767 * *(_DWORD *)&v129[4 * (v59 ^ 0x99)] + 1950497226);
  unsigned int v411 = BYTE1(v59) ^ 0x14;
  unsigned int v385 = v430 ^ 0xA3;
  int v416 = v77 - ((2 * v77) & 0x37B43BF6);
  unsigned int v431 = v148 - ((2 * v148) & 0x3AF66B6C);
  int v149 = *(_DWORD *)(v58 - 120);
  unsigned int v403 = BYTE1(v149) ^ 0xF5;
  unsigned int v413 = v424 ^ 0x2BEAE26B;
  LODWORD(v59) = *(_DWORD *)&v126[4 * (((v424 ^ 0x2BEAE26Bu) >> 16) ^ 0xEC)] ^ ((((v424 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                               - 120243103
                                                                                               + ((2
                                                                                                 * ((v424 ^ 0x2BEAE26Bu) >> 16)
                                                                                                 + 88) & 0x68 ^ 0xF7F37BFF)) ^ (181304767 * *(_DWORD *)&v129[4 * (v424 ^ 0x1E)] + 1950497226);
  LODWORD(v59) = (v59 - ((2 * v59) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (BYTE1(v424) ^ 8)];
  LODWORD(v77) = *(_DWORD *)&v126[4 * (v439 ^ 0x5A)] ^ ((v439 ^ 0x77)
                                                      - 120243103
                                                      + ((2 * (v439 ^ 0x77) + 88) & 0x68 ^ 0xF7F37BFF));
  int v150 = 181304767 * *(_DWORD *)&v129[4 * (v422 ^ 0x55)];
  int v440 = v59 - ((2 * v59) & 0x3AF66B6C);
  int v392 = BYTE2(v149);
  int v425 = (BYTE2(v149) ^ 0xA7) - 120243104 - ((2 * (BYTE2(v149) ^ 0xA7) + 160207960) & 0x80C8468);
  LODWORD(v59) = (v77 - ((2 * v77) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (v453 ^ 0xB6)] ^ (181304767 * *(_DWORD *)&v129[4 * (v451 ^ 0x25)] + 1950497226);
  int v423 = v59 - 1652869706 + (~(2 * v59) | 0xC5099493);
  unsigned int v151 = *(_DWORD *)(v58 - 184);
  LODWORD(v59) = (v150 - 2 * ((v150 + 339884490) & 0x1D7B35B7 ^ v150 & 1) + 297627520) ^ ((BYTE2(v151) ^ 0xBA)
                                                                                        - 120243103
                                                                                        + ((2 * (BYTE2(v151) ^ 0xBA) + 88) & 0x68 ^ 0xF7F37BFF)) ^ *(_DWORD *)&v128[4 * (HIBYTE(v151) ^ 0x2F)] ^ *(_DWORD *)&v126[4 * (BYTE2(v151) ^ 0x97)];
  int v391 = v59 - ((2 * v59) & 0x37B43BF6);
  LODWORD(v59) = *(_DWORD *)&v126[4 * (BYTE2(v401) ^ 0xEA)] ^ ((BYTE2(v401) ^ 0xC7)
                                                             - 120243103
                                                             + ((2
                                                               * (((BYTE2(v401) ^ 0xC7) + 44) & 0x36 ^ (BYTE2(v401) ^ 0xCF | 0xFFFFFFFD))) ^ 0x80C8405));
  unsigned int v152 = *(_DWORD *)(v58 - 192);
  unsigned int v153 = *(_DWORD *)&v126[4 * (BYTE2(v152) ^ 0x56)] ^ ((BYTE2(v152) ^ 0x7B)
                                                     - 120243103
                                                     + ((2
                                                       * (((BYTE2(v152) ^ 0x7B) + 44) & 0x36 ^ (BYTE2(v152) ^ 0x7B | 0xFFFFFFFD))) ^ 0x80C8405));
  LODWORD(v59) = (v59 - ((2 * v59) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4
                                                                               * (((unsigned __int16)(v401 ^ 0x3C20) >> 8) ^ 0xEA)] ^ (181304767 * *(_DWORD *)&v129[4 * (v401 ^ 0x88)] + 1950497226);
  int v154 = *(_DWORD *)&v129[4 * (v406 ^ 0xFB)];
  unsigned int v155 = ((~(362609534 * v154 + 679768980) | 0xC84BC409) + 181304767 * v154 - 1877190714) ^ *(_DWORD *)&v127[4 * (BYTE1(v406) ^ 0xEF)];
  unsigned int v386 = HIBYTE(v401) ^ 0xD;
  int v402 = v59 - ((2 * v59) & 0x3AF66B6C);
  LODWORD(v395) = v155 - ((2 * v155) & 0x3AF66B6C);
  LODWORD(v59) = (v153 - ((2 * v153) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * (HIBYTE(v152) ^ 0xD9)] ^ (181304767 * *(_DWORD *)&v129[4 * (v152 ^ 0x79)] + 1950497226);
  unsigned int v156 = *(_DWORD *)&v126[4 * (v418 ^ 0x86)] ^ ((v418 ^ 0xAB)
                                              - 120243103
                                              + ((2 * (v418 ^ 0xAB) + 88) & 0x68 ^ 0xF7F37BFF));
  int v157 = (v156 - ((2 * v156) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * v436];
  unsigned int v419 = v427 ^ 0xEE;
  int v428 = v157 - ((2 * v157) & 0x37B43BF6);
  int v454 = v59 + 467279355 + (~(2 * v59) | 0xC84BC409);
  int v433 = v435;
  unsigned int v452 = (v433 ^ 0x65) - 120243103 + ((2 * (v433 ^ 0x65) + 88) & 0x68 ^ 0xF7F37BFF);
  LODWORD(v59) = *(_DWORD *)&v126[4 * (v394 ^ 0x8B)] ^ ((v394 ^ 0xA6)
                                                      - 120243103
                                                      + ((2 * (v394 ^ 0xA6) + 88) & 0x68 ^ 0xF7F37BFF));
  int v437 = (BYTE2(v468) ^ 0x8F) - 120243104 - ((2 * (BYTE2(v468) ^ 0x8F) + 160207960) & 0x80C8468);
  unsigned int v158 = v397 ^ 0x22;
  unsigned int v159 = *(_DWORD *)&v126[4 * (BYTE2(v124) ^ 0xE8)] ^ ((BYTE2(v124) ^ 0xC5)
                                                     - 120243103
                                                     + ((2 * (BYTE2(v124) ^ 0xC5) + 88) & 0x68 ^ 0xF7F37BFF));
  int v160 = (181304767 * *(_DWORD *)&v129[4 * (v124 ^ 0xCA)] + 1950497226) ^ *(_DWORD *)&v128[4 * (HIBYTE(v124) ^ 0x8E)] ^ (v159 - ((2 * v159) & 0x3AF66B6C) - 1652869706);
  unsigned int v398 = v124 ^ v118 ^ 0x44039AAA;
  unsigned int v161 = (181304767 * *(_DWORD *)&v129[4 * (v396 ^ 0xDB)] + 1950497226) ^ (((v396 ^ 0x44039AAAu) >> 16)
                                                                                          - 120243103
                                                                                          + ((2
                                                                                            * ((v396 ^ 0x44039AAAu) >> 16)
                                                                                            + 88) & 0x68 ^ 0xF7F37BFF)) ^ *(_DWORD *)&v126[4 * (((v396 ^ 0x44039AAAu) >> 16) ^ 0x2D)];
  unsigned int v382 = BYTE1(v124) ^ 0x16;
  int v389 = v160 - ((2 * v160) & 0x37B43BF6);
  int v162 = (v161 - ((2 * v161) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4
                                                                         * (((unsigned __int16)(v124 ^ v118) >> 8) ^ 0xC0)];
  LODWORD(v59) = *(_DWORD *)&v128[4 * v158] ^ (181304767 * *(_DWORD *)&v129[4 * (v408 ^ 0xFE)] + 1950497226) ^ (v59 - ((2 * v59) & 0x3AF66B6C) - 1652869706);
  int v409 = v162 - ((2 * v162) & 0x3AF66B6C);
  HIDWORD(v395) = v59 - ((2 * v59) & 0x37B43BF6);
  LODWORD(v59) = 181304767 * *(_DWORD *)&v129[4 * (v471 ^ 0xEC)];
  unsigned int v163 = *(_DWORD *)&v126[4 * (v500 ^ 0x32)] ^ ((v500 ^ 0x1F)
                                              - 120243103
                                              + ((2 * (v500 ^ 0x1F) + 88) & 0x68 ^ 0xF7F37BFF));
  int v164 = 181304767 * *(_DWORD *)&v129[4 * (*(_DWORD *)(v58 - 168) ^ 0xE6)];
  LODWORD(v59) = *(_DWORD *)&v128[4 * (HIBYTE(v471) ^ 0xCA)] ^ ((BYTE2(v471) ^ 0x2F)
                                                              - 120243103
                                                              + ((2 * (BYTE2(v471) ^ 0x2F) + 88) & 0x68 ^ 0xF7F37BFF)) ^ *(_DWORD *)&v126[4 * (BYTE2(v471) ^ 2)] ^ (v59 - 2 * ((v59 + 339884490) & 0x1D7B35B7 ^ v59 & 1) + 297627520);
  int v165 = (v163 - ((2 * v163) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (v516 ^ 0x8C)] ^ (181304767
                                                                                               * *(_DWORD *)&v129[4 * (v504 ^ 0xD9)]
                                                                                               + 1950497226);
  unsigned int v166 = *(_DWORD *)(v58 - 168) ^ 0x49A657C7;
  unsigned int v167 = *(_DWORD *)&v128[4 * HIBYTE(v166)] ^ ((BYTE2(v166) ^ 0x35)
                                             - 120243103
                                             + ((2 * (BYTE2(v166) ^ 0x35) + 88) & 0x68 ^ 0xF7F37BFF)) ^ *(_DWORD *)&v126[4 * (BYTE2(v166) ^ 0x18)] ^ (v164 - 2 * ((v164 + 339884490) & 0x1D7B35B7 ^ v164 & 1) + 297627520);
  LODWORD(v76) = *(_DWORD *)(v58 - 160);
  unsigned int v168 = *(_DWORD *)&v126[4 * (((v76 ^ 0x6B943787) >> 16) ^ 0x2D)] ^ (((v76 ^ 0x6B943787) >> 16) - 120243103 + ((2 * ((((v76 ^ 0x6B943787) >> 16) + 44) & 0x37 ^ (((v76 ^ 0x6B943787) >> 16) | 0x7FFFFFFC))) ^ 0x80C8407));
  unsigned int v505 = v520 ^ 0xAA;
  LODWORD(v517) = (v59 - ((2 * v59) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (BYTE1(v471) ^ 0x2E)];
  int v501 = v165 - ((2 * v165) & 0x3AF66B6C);
  LODWORD(v59) = (v168 - ((2 * v168) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4
                                                                                  * ((v76 ^ 0x6B943787) >> 24)] ^ (181304767 * *(_DWORD *)&v129[4 * (v76 ^ 0x17)] + 1950497226);
  unsigned int v388 = v167 - ((2 * v167) & 0x37B43BF6);
  int v380 = v59 - ((2 * v59) & 0x37B43BF6);
  unsigned int v169 = *(_DWORD *)&v126[4 * (v491 ^ 0xC1)] ^ ((v491 ^ 0xEC)
                                              - 120243103
                                              + ((2 * (v491 ^ 0xEC) + 88) & 0x68 ^ 0xF7F37BFF));
  LODWORD(v59) = (v169 - ((2 * v169) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4
                                                                                 * ((v487 - ((2 * v485) & 0x166) + 179) ^ 0x54)] ^ (181304767 * *(_DWORD *)&v129[4 * (v507 ^ 0xE2)] + 1950497226);
  unsigned int v488 = BYTE1(v497) ^ 0x77;
  int v170 = *(_DWORD *)&v129[4 * (*(_DWORD *)(v58 - 132) ^ 0x3B)];
  int v171 = (181304767 * v170 - ((362609534 * v170 + 679768980) & 0x3AF66B6C) + 297627520) ^ *(_DWORD *)&v128[4 * (HIBYTE(v495) ^ 0xCF)];
  int v508 = v59 - ((2 * v59) & 0x3AF66B6C);
  int v486 = v171 - ((2 * v171) & 0x37B43BF6);
  LODWORD(v59) = ((v478 ^ 0xEEA2BFA8) >> 16);
  LODWORD(v59) = *(_DWORD *)&v126[4 * (v59 ^ 0x86)] ^ ((v59 ^ 0xAB)
                                                                   - 120243103
                                                                   + ((2
                                                                     * (((v59 ^ 0xAB) + 44) & 0x36 ^ (v59 ^ 0xAB | 0xFFFFFFFD))) ^ 0x80C8405));
  LODWORD(v77) = (181304767 * *(_DWORD *)&v129[4 * (v478 ^ 0x68)] + 1950497226) ^ *(_DWORD *)&v127[4 * (BYTE1(v478) ^ 0x55)] ^ (v59 - ((2 * v59) & 0x37B43BF6) + 467279355);
  unsigned int v172 = v497 ^ 0x231B9DB5;
  int v173 = ((v497 ^ 0x231B9DB5u) >> 16);
  unsigned int v378 = v173 ^ 0xEC;
  unsigned int v521 = (v173 ^ 0xC1) - 120243103 + ((2 * ((v497 ^ 0x231B9DB5u) >> 16) + 88) & 0x68 ^ 0xF7F37BFF);
  unsigned int v376 = BYTE2(v495) ^ 0xAC;
  unsigned int v472 = (BYTE2(v495) ^ 0x81) - 120243103 + ((2 * HIWORD(v495) + 88) & 0x68 ^ 0xF7F37BFF);
  int v174 = *(_DWORD *)&v129[4 * (v492 ^ 0x60)];
  unsigned int v175 = v529 ^ 0x22373CDA;
  int v176 = *(_DWORD *)&v129[4 * (v534 ^ 0xFB)];
  int v177 = *(_DWORD *)(v58 - 152);
  int v178 = *(_DWORD *)&v129[4 * (v177 ^ 0xB8)];
  int v179 = *(_DWORD *)&v129[4 * (*(_DWORD *)(v58 - 124) ^ 0xAC)];
  LODWORD(v67) = *(_DWORD *)&v129[4 * v385];
  int v180 = *(_DWORD *)&v129[4 * (v518 ^ 0xF0)];
  LODWORD(v76) = *(_DWORD *)&v129[4 * (*(_DWORD *)(v58 - 120) ^ 0x57)];
  LODWORD(v7_Block_object_dispose(va, 8) = *(_DWORD *)&v129[4 * (v522 ^ 0xE6)];
  unsigned int v181 = v468;
  int v182 = *(_DWORD *)&v129[4 * (v468 ^ 0x78)];
  int v183 = *(_DWORD *)&v129[4 * (v497 ^ 0x75)];
  int v184 = *(_DWORD *)&v129[4 * (*(_DWORD *)(v58 - 256) ^ 0x74)];
  int v185 = *(_DWORD *)&v129[4 * (v527 ^ 0xBA)];
  int v186 = *(_DWORD *)&v129[4 * (v536 ^ 0x2A)];
  LODWORD(v129) = *(_DWORD *)&v129[4 * (v529 ^ 0xE3)];
  unsigned int v187 = *(_DWORD *)(v58 - 240) ^ 0x7B;
  int v493 = 181304767 * v174 + 1950497226;
  *(_DWORD *)(v58 - 256) = 181304767 * v176 + 1950497226;
  int v530 = 181304767 * v178 + 1950497226;
  int v535 = 181304767 * v179 + 1950497226;
  HIDWORD(v379) = 181304767 * v67 + 1950497226;
  LODWORD(v379) = 181304767 * v180 + 1950497226;
  *(_DWORD *)(v58 - 240) = 181304767 * v76 + 1950497226;
  int v523 = 181304767 * v78 + 1950497226;
  int v498 = 181304767 * v182 + 1950497226;
  HIDWORD(v383) = 181304767 * v183 + 1950497226;
  int v519 = 181304767 * (_DWORD)v129 + 1950497226;
  LODWORD(v129) = (181304767 * v184
                 - 2 * ((181304767 * v184 + 339884490) & 0x1D7B35B7 ^ (181304767 * v184) & 1)
                 + 297627520) ^ *(_DWORD *)&v128[4 * v187];
  LODWORD(v7_Block_object_dispose(va, 8) = BYTE1(*(_DWORD *)(v58 - 124)) ^ 0xB4;
  LODWORD(v67) = *(_DWORD *)&v126[4 * (BYTE2(v527) ^ 0xB4)] ^ ((BYTE2(v527) ^ 0x99)
                                                             - 120243103
                                                             + ((2 * (BYTE2(v527) ^ 0x99) + 88) & 0x68 ^ 0xF7F37BFF)) ^ (181304767 * v185 + 1950497226);
  LODWORD(v67) = (v67 - ((2 * v67) & 0x37B43BF6) + 467279355) ^ *(_DWORD *)&v127[4 * (BYTE1(v527) ^ 0x85)];
  unsigned int v188 = *(_DWORD *)&v126[4 * (BYTE2(v175) ^ 0x3C)] ^ ((BYTE2(v175) ^ 0x11)
                                                     - 120243103
                                                     + ((2 * (BYTE2(v175) ^ 0x11) + 88) & 0x68 ^ 0xF7F37BFF));
  int v189 = (181304767 * v186 + 1950497226) ^ ((BYTE2(v536) ^ 0x37)
                                          - 120243103
                                          + ((2
                                            * (((BYTE2(v536) ^ 0x37) + 44) & 0x35 ^ (BYTE2(v536) ^ 0x37 | 0x7FFFFFFE))) ^ 0x80C8403)) ^ *(_DWORD *)&v126[4 * (BYTE2(v536) ^ 0x1A)];
  int v190 = (_DWORD)v129 - ((2 * (_DWORD)v129) & 0x37B43BF6);
  int v191 = (v189 - ((2 * v189) & 0x3AF66B6C) - 1652869706) ^ *(_DWORD *)&v128[4 * (HIBYTE(v536) ^ 0xF9)];
  int v528 = *(_DWORD *)&v126[4 * (v473 ^ 0x61)];
  unsigned int v192 = v532 ^ 0x1A;
  int v533 = *(_DWORD *)&v126[4 * (v392 ^ 0x8A)];
  LODWORD(v59) = *(_DWORD *)(v58 - 216);
  int v467 = *(_DWORD *)&v126[4 * (v433 ^ 0x48)];
  int v496 = *(_DWORD *)&v126[4 * (BYTE2(v468) ^ 0xA2)];
  HIDWORD(v377) = *(_DWORD *)&v126[4 * v378];
  int v474 = *(_DWORD *)&v126[4 * v376];
  *(_DWORD *)(v58 - 216) = *(_DWORD *)&v126[4 * (v59 ^ 0x1A)];
  LODWORD(v126) = ((*(_DWORD *)(v58 - 248) >> 15) & 0x58 ^ 0x48) + (v59 ^ 0x4C64A1B);
  *(_DWORD *)(v58 - 24_Block_object_dispose(va, 8) = (_DWORD)v126 - 200347083 + ((2 * (_DWORD)v126) & 0x68 ^ 0xF7F37BFF);
  LODWORD(v377) = *(_DWORD *)&v127[4 * v476];
  int v477 = *(_DWORD *)&v127[4 * (v384 ^ 0x8E)];
  int v434 = *(_DWORD *)&v127[4 * (BYTE1(v177) ^ 0x85)];
  LODWORD(v393) = *(_DWORD *)&v127[4 * (BYTE1(*(_DWORD *)(v58 - 176)) ^ 0xBD)];
  HIDWORD(v393) = *(_DWORD *)&v127[4 * v78];
  LODWORD(v383) = *(_DWORD *)&v127[4 * v192];
  int v412 = *(_DWORD *)&v127[4 * v411];
  *(_DWORD *)(v58 - 176) = *(_DWORD *)&v127[4 * v403];
  *(_DWORD *)(v58 - 184) = *(_DWORD *)&v127[4 * (BYTE1(*(_DWORD *)(v58 - 184)) ^ 0xD6)];
  int v420 = *(_DWORD *)&v127[4 * v419];
  *(_DWORD *)(v58 - 192) = *(_DWORD *)&v127[4 * (BYTE1(*(_DWORD *)(v58 - 192)) ^ 0xD7)];
  int v469 = *(_DWORD *)&v127[4 * (BYTE1(v468) ^ 0x76)];
  LODWORD(v129) = *(_DWORD *)&v127[4 * v382];
  HIDWORD(v374) = *(_DWORD *)&v127[4 * (v525 ^ 0xBE)];
  *(_DWORD *)(v58 - 16_Block_object_dispose(va, 8) = *(_DWORD *)&v127[4 * (BYTE1(*(_DWORD *)(v58 - 168)) ^ 0xB9)];
  LODWORD(v59) = *(_DWORD *)(v58 - 160);
  unsigned int v193 = v536 ^ ~(_DWORD)v59;
  *(_DWORD *)(v58 - 160) = *(_DWORD *)&v127[4 * (BYTE1(v59) ^ 0xB7)];
  HIDWORD(v375) = *(_DWORD *)&v127[4 * v488];
  LODWORD(v375) = *(_DWORD *)&v127[4 * (BYTE1(*(_DWORD *)(v58 - 132)) ^ 0x88)];
  *(_DWORD *)(v58 - 204) = *(_DWORD *)&v127[4 * (*(_DWORD *)(v58 - 204) ^ 0x84)];
  int v404 = *(_DWORD *)&v127[4 * (BYTE1(v536) ^ 0x2E)];
  LODWORD(v7_Block_object_dispose(va, 8) = *(_DWORD *)&v127[4 * (BYTE1(*(_DWORD *)(v58 - 232)) ^ 0xC8)];
  int v489 = v482 + 467279355;
  int v483 = v480 + 467279355;
  *(_DWORD *)(v58 - 232) = v462 + 467279355;
  HIDWORD(v381) = v458 + 467279355;
  int v537 = v456 + 467279355;
  int v481 = v442 + 467279355;
  LODWORD(v374) = v416 + 467279355;
  int v526 = v391 + 467279355;
  int v463 = v428 + 467279355;
  LODWORD(v59) = v389 + 467279355;
  HIDWORD(v373) = HIDWORD(v395) + 467279355;
  unsigned int v443 = v388 + 467279355;
  int v429 = v380 + 467279355;
  int v459 = v486 + 467279355;
  HIDWORD(v390) = v190 + 467279355;
  int v457 = v191 - ((2 * v191) & 0x37B43BF6) + 467279355;
  *(_DWORD *)(v58 - 152) = *(_DWORD *)&v128[4 * v502];
  *(_DWORD *)(v58 - 200) = *(_DWORD *)&v128[4 * (*(_DWORD *)(v58 - 200) ^ 7)];
  LODWORD(v373) = *(_DWORD *)&v128[4 * (HIBYTE(*(_DWORD *)(v58 - 128)) ^ 0xED)];
  LODWORD(v381) = *(_DWORD *)&v128[4 * (HIBYTE(*(_DWORD *)(v58 - 136)) ^ 0x66)];
  HIDWORD(v395) = *(_DWORD *)&v128[4 * (HIBYTE(*(_DWORD *)(v58 - 120)) ^ 0xB8)];
  int v417 = *(_DWORD *)&v128[4 * HIBYTE(v413)];
  int v414 = *(_DWORD *)&v128[4 * (v445 ^ 0x4B)];
  LODWORD(v7_Block_object_dispose(va, 8) = v78 ^ (v188 - ((2 * v188) & 0x37B43BF6) + 467279355);
  LODWORD(v390) = *(_DWORD *)&v128[4 * v386];
  HIDWORD(v387) = *(_DWORD *)&v128[4 * (HIBYTE(v406) ^ 0xE8)];
  int v194 = *(_DWORD *)&v128[4 * (HIBYTE(v181) ^ 0xA6)];
  int v195 = *(_DWORD *)&v128[4 * HIBYTE(v398)];
  int v446 = *(_DWORD *)&v128[4 * v505];
  int v196 = *(_DWORD *)&v128[4 * HIBYTE(v172)];
  LODWORD(v372) = *(_DWORD *)&v128[4 * (*(_DWORD *)(v58 - 224) ^ 0x38)];
  *(_DWORD *)(v58 - 224) = *(_DWORD *)&v128[4 * ((v478 ^ 0xEEA2BFA8) >> 24)];
  LODWORD(v387) = *(_DWORD *)&v128[4 * HIBYTE(v193)];
  HIDWORD(v372) = *(_DWORD *)&v128[4 * HIBYTE(v175)];
  *(_DWORD *)(v58 - 120) = v510 - 1652869706;
  int v399 = v465 - 1652869706;
  int v197 = v448 - 1652869706;
  int v407 = v440 - 1652869706;
  int v198 = v402 - 1652869706;
  int v449 = v501 - 1652869706;
  int v199 = v508 - 1652869706;
  int v200 = v77 - ((2 * v77) & 0x3AF66B6C) - 1652869706;
  int v201 = v67 - ((2 * v67) & 0x3AF66B6C) - 1652869706;
  int v202 = v78 - ((2 * v78) & 0x3AF66B6C) - 1652869706;
  int v203 = HIDWORD(v517) ^ v517 ^ 0x6285F181;
  int v204 = v59 ^ v129 ^ v203;
  int v205 = *(_DWORD *)(v58 - 140);
  uint64_t v206 = (char *)*(&off_189D4D580 + (v205 ^ 4)) - 12;
  uint64_t v207 = (char *)*(&off_189D4D580 + v205 - 111) - 8;
  uint64_t v208 = (char *)*(&off_189D4D580 + v205 - 164) - 12;
  int v209 = (char *)*(&off_189D4D580 + v205 - 118) - 8;
  unsigned int v210 = (v209[*(unsigned __int8 *)(v58 - 109) ^ 0x41LL] ^ 0xE3) & 0xFF00FFFF | (((v208[*(unsigned __int8 *)(v58 - 111) ^ 0x40LL] - 107) ^ 0x5A) << 16) | ((v207[*(unsigned __int8 *)(v58 - 110) ^ 0xBBLL] ^ 0xC5) << 8) | ((v206[*(unsigned __int8 *)(v58 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v58 - 112) + (~(2 * *(unsigned __int8 *)(v58 - 112)) | 0x37) + 101) ^ 0x84) << 24);
  v509 = v207;
  v511 = v206;
  int v211 = v209[*(unsigned __int8 *)(v58 - 97) ^ 0x74LL] ^ 0x44 | (((v208[*(unsigned __int8 *)(v58 - 99) ^ 0xF3LL] - 107) ^ 2) << 16) | ((v207[*(unsigned __int8 *)(v58 - 98) ^ 0x20LL] ^ 0x2F) << 8) | ((v206[*(unsigned __int8 *)(v58 - 100) ^ 0xF3LL] ^ (*(unsigned __int8 *)(v58 - 100) - ((2 * *(unsigned __int8 *)(v58 - 100)) & 0xC8) + 100) ^ 0x85) << 24);
  v503 = v209;
  v506 = v208;
  unsigned int v212 = (v209[*(unsigned __int8 *)(v58 - 105) ^ 0xE4LL] ^ 0xD5) & 0xFF00FFFF | ((v206[*(unsigned __int8 *)(v58 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v58 - 108) - ((2 * *(unsigned __int8 *)(v58 - 108)) & 0xC8) + 100) ^ 0xFFFFFFE1) << 24) | (((v208[*(unsigned __int8 *)(v58 - 107) ^ 0x27LL] - 107) ^ 0x96) << 16) | ((v207[*(unsigned __int8 *)(v58 - 106) ^ 9LL] ^ 0xC0) << 8);
  unsigned int v213 = (v209[*(unsigned __int8 *)(v58 - 101) ^ 0xF2LL] ^ 0x6C) & 0xFF00FFFF | ((v206[*(unsigned __int8 *)(v58 - 104) ^ 0xD3LL] ^ (*(unsigned __int8 *)(v58 - 104) - ((2 * *(unsigned __int8 *)(v58 - 104)) & 0xC8) + 100) ^ 0xE0) << 24) | ((v207[*(unsigned __int8 *)(v58 - 102) ^ 0xBELL] ^ 0x67) << 8) & 0xFF00FFFF | (((v208[*(unsigned __int8 *)(v58 - 103) ^ 0xE9LL] - 107) ^ 0x8A) << 16);
  if ((v204 & 0x80) != 0) {
    int v214 = -128;
  }
  else {
    int v214 = 128;
  }
  *(_DWORD *)(v58 - 124) = v211 ^ 0x6A2A1273;
  *(_DWORD *)(v58 - 12_Block_object_dispose(va, 8) = v210 ^ 0x1F4AAAB7;
  *(_DWORD *)(v58 - 132) = v212 ^ 0xCA26A433;
  *(_DWORD *)(v58 - 136) = v213 ^ 0x8BDA7BBB;
  HIDWORD(v499) = HIDWORD(v373) ^ HIDWORD(v374);
  LODWORD(v499) = v194 ^ v437 ^ v469 ^ v496 ^ v498;
  HIDWORD(v494) = (v409 - 1652869706) ^ v195;
  LODWORD(v494) = v493 ^ v377 ^ v489;
  HIDWORD(v490) = v483 ^ v477;
  LODWORD(v490) = v374 ^ v412;
  HIDWORD(v484) = v481 ^ v383 ^ v379;
  LODWORD(v484) = v197 ^ v373 ^ HIDWORD(v379);
  HIDWORD(v479) = (v431 - 1652869706) ^ v381;
  LODWORD(v479) = HIDWORD(v375) ^ v521 ^ v196 ^ HIDWORD(v377) ^ HIDWORD(v383);
  HIDWORD(v475) = v375 ^ v472 ^ v474 ^ v459;
  LODWORD(v475) = v200 ^ *(_DWORD *)(v58 - 224);
  HIDWORD(v470) = v199 ^ v372;
  LODWORD(v470) = (v454 + 1) ^ *(_DWORD *)(v58 - 192);
  HIDWORD(v466) = HIDWORD(v387) ^ v452 ^ v467 ^ (v395 - 1652869706);
  LODWORD(v466) = v198 ^ v390;
  HIDWORD(v460) = v523 ^ v420 ^ v463;
  LODWORD(v460) = v519 ^ HIDWORD(v372) ^ v202;
  HIDWORD(v455) = v457 ^ v404;
  LODWORD(v455) = v201 ^ v387;
  HIDWORD(v450) = *(_DWORD *)(v58 - 204) ^ *(_DWORD *)(v58 - 216) ^ *(_DWORD *)(v58 - 248) ^ HIDWORD(v390);
  LODWORD(v450) = v449 ^ v446;
  HIDWORD(v444) = v443 ^ *(_DWORD *)(v58 - 168);
  LODWORD(v444) = v429 ^ *(_DWORD *)(v58 - 160);
  HIDWORD(v43_Block_object_dispose(va, 8) = HIDWORD(v381) ^ v393;
  LODWORD(v43_Block_object_dispose(va, 8) = *(_DWORD *)(v58 - 232) ^ v434 ^ v530;
  HIDWORD(v432) = v535 ^ HIDWORD(v393) ^ v537;
  LODWORD(v432) = *(_DWORD *)(v58 - 256) ^ *(_DWORD *)(v58 - 200) ^ v399;
  HIDWORD(v426) = v526 ^ *(_DWORD *)(v58 - 184);
  LODWORD(v426) = *(_DWORD *)(v58 - 176) ^ v425 ^ HIDWORD(v395) ^ v533 ^ *(_DWORD *)(v58 - 240);
  HIDWORD(v421) = (v423 + 1) ^ v414;
  LODWORD(v421) = v407 ^ v417;
  HIDWORD(v415) = (v214 + (v204 ^ 0x2497E332)) ^ v203;
  LODWORD(v415) = *(_DWORD *)(v58 - 152) ^ v531 ^ v528 ^ *(_DWORD *)(v58 - 120);
  HIDWORD(v410) = (v205 + 879) ^ 0x4B4;
  LODWORD(v410) = (v205 + 879) ^ 0x43B;
  HIDWORD(v405) = (v205 + 879) ^ 0x44C;
  LODWORD(v405) = (v205 + 879) ^ 0x496;
  HIDWORD(v400) = (v205 + 879) ^ 0x4B2;
  *(_DWORD *)(v58 - 120) = v205 + 879;
  LODWORD(v400) = (v205 + 879) & 0xF160E296;
  int v216 = 2 * *(_DWORD *)(v58 - 120);
  int v217 = *(_DWORD *)(v58 - 120);
  *(_DWORD *)(v58 - 140) = v216;
  *(void *)(v58 - 16_Block_object_dispose(va, 8) = 13LL;
  unsigned __int8 v218 = v208[a52[13] ^ 0xF3LL] - 107;
  uint64_t v219 = (v216 ^ 0xFFFFF798) & 0x5FEAD41 ^ 0x5FEAD41;
  *(void *)(v58 - 152) = v219;
  int v220 = (v218 ^ 2) << 16;
  uint64_t v221 = a52[v219] ^ 0x57LL;
  *(void *)(v58 - 160) = 10LL;
  uint64_t v222 = a52[10] ^ 0xB6LL;
  int v223 = ((v208[v221] - 107) ^ 0xF6) << 16;
  *(void *)(v58 - 184) = 4LL;
  LODWORD(v221) = v509[v222] ^ 0x4A;
  uint64_t v224 = a52[4];
  int v225 = v511[v224 ^ 0x9A];
  *(void *)(v58 - 240) = 7LL;
  LODWORD(v224) = v225 ^ (v224 - ((2 * v224) & 0xC8) + 100);
  uint64_t v226 = a52[7] ^ 0xD6LL;
  *(void *)(v58 - 224) = 2LL;
  LODWORD(v224) = v503[v226] ^ 0x86 | ((v224 ^ 0xFFFFFFCF) << 24);
  LODWORD(v226) = v509[a52[2]] ^ 0x58;
  *(void *)(v58 - 192) = 3LL;
  int v227 = v223 | ((_DWORD)v226 << 8);
  LODWORD(v226) = v503[a52[3] ^ 0x74LL];
  *(void *)(v58 - 176) = 12LL;
  int v228 = v227 | v226 ^ 0x44;
  int v229 = v511[a52[12] ^ 0x6ELL] ^ (a52[12] - ((2 * a52[12]) & 0xC8) + 100) ^ 0x51;
  *(void *)(v58 - 200) = 0LL;
  int v230 = v220 | (v229 << 24);
  uint64_t v231 = *a52;
  LODWORD(v226) = v511[v231 ^ 0x15];
  *(_DWORD *)(v58 - 204) = 100576585;
  unsigned int v232 = v228 | ((v226 ^ ((_DWORD)v231 + (~(2 * (_DWORD)v231) | 0x37) + 101) ^ 0xAE) << 24);
  LODWORD(v221) = ((_DWORD)v221 << 8) | ((v511[a52[8] ^ 0x46LL] ^ (a52[8] - ((2 * a52[8]) & 0xC8) + 100) ^ 0xFFFFFFE7) << 24);
  *(void *)(v58 - 216) = 14LL;
  int v233 = v230 | ((v509[a52[14] ^ 0xD5LL] ^ 0xD0) << 8);
  *(void *)(v58 - 256) = 11LL;
  *(void *)(v58 - 24_Block_object_dispose(va, 8) = 5LL;
  LODWORD(v224) = v224 & 0xFF00FFFF | (((v506[a52[5] ^ 0x9DLL] - 107) ^ 0xF7) << 16);
  unsigned int v234 = (v503[a52[11] ^ 0xC2LL] ^ 0x61 | v221) & 0xFF00FFFF | (((v506[a52[9] ^ 0x3ELL]
                                                                                                  - 107) ^ 0xDF) << 16);
  int v235 = v509[a52[6] ^ 0xA4LL];
  *(void *)(v58 - 232) = 15LL;
  int v236 = v503[a52[15] ^ 0x47LL] ^ 0x44 | v233;
  int v524 = v224 | ((v235 ^ 0x80) << 8);
  int v237 = (char *)*(&off_189D4D580 + SHIDWORD(v410)) - 4;
  LODWORD(v221) = *(_DWORD *)&v237[4 * (((unsigned __int16)(v524 ^ v513) >> 8) ^ 0x21)] ^ ((((unsigned __int16)(v524 ^ v513) >> 8) ^ 0x4C) - 243618108 - ((2 * (((v524 ^ v513) >> 8) ^ 0xB71C4C)) & 0x188));
  unsigned int v238 = (char *)*(&off_189D4D580 + v217 - 962) - 12;
  unsigned int v239 = v232 ^ HIDWORD(v513);
  unsigned int v240 = v232 ^ HIDWORD(v513) ^ 0x730032AA;
  int v241 = (v221 - 312721661 - ((2 * v221) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4
                                                                         * ((v232 ^ BYTE4(v513)) ^ 0xAA)];
  unsigned int v242 = *(_DWORD *)&v237[4 * (((unsigned __int16)(v512 ^ v236) >> 8) ^ 0x40)] ^ ((((unsigned __int16)(v512 ^ v236) >> 8) ^ 0x2D)
                                                                                                 - 243618108
                                                                                                 - ((2 * (((v512 ^ v236) >> 8) ^ 0x47912D)) & 0x188));
  int v243 = (char *)*(&off_189D4D580 + SHIDWORD(v405)) - 4;
  int v244 = *(_DWORD *)&v243[4 * (((v234 ^ HIDWORD(v512)) >> 16) ^ 0x68)];
  HIDWORD(v246) = v244 ^ 0xD56;
  LODWORD(v246) = v244 ^ 0x86729000;
  int v245 = v246 >> 12;
  int v247 = *(_DWORD *)&v243[4 * ((v232 ^ HIDWORD(v513)) >> 16)];
  HIDWORD(v246) = v247 ^ 0xD56;
  LODWORD(v246) = v247 ^ 0x86729000;
  uint64_t v248 = (uint64_t)*(&off_189D4D580 + (int)v410);
  int v249 = (v242 + 1271828296 - ((2 * v242) & 0x979D1E90)) ^ *(_DWORD *)(v248
                                                                     + 4LL
                                                                     * (((v524 ^ v513) >> 24) ^ 0xB7)) ^ (v246 >> 12);
  int v250 = *(_DWORD *)&v243[4 * (((v512 ^ v236) >> 16) ^ 0x91)];
  HIDWORD(v246) = v250 ^ 0xD56;
  LODWORD(v246) = v250 ^ 0x86729000;
  int v251 = *(_DWORD *)&v238[4 * ((v524 ^ v513) ^ 0xFB)] ^ (BYTE1(v234) ^ BYTE5(v512)) ^ *(_DWORD *)&v237[4 * ((BYTE1(v234) ^ BYTE5(v512)) ^ 0x23)] ^ 0x1C269189 ^ (v246 >> 12);
  LODWORD(v231) = *(_DWORD *)&v243[4 * (((v524 ^ v513) >> 16) ^ 0x1C)];
  HIDWORD(v246) = v231 ^ 0xD56;
  LODWORD(v246) = v231 ^ 0x86729000;
  int v252 = *(_DWORD *)(v248 + 4LL * (((v234 ^ HIDWORD(v512)) >> 24) ^ 0xF6)) ^ (BYTE1(v240)
                                                                            - 243618108
                                                                            - ((v239 >> 7) & 0x188)) ^ *(_DWORD *)&v237[4 * (BYTE1(v240) ^ 0x6D)] ^ ((v246 >> 12) + 1271828296 - ((2 * (v246 >> 12)) & 0x979D1E90));
  LODWORD(v231) = v249 - 312721661 - ((2 * v249) & 0xDAB87E06);
  unsigned int v253 = HIDWORD(v373) ^ HIDWORD(v374) ^ *(_DWORD *)(v248 + 4LL * (((v512 ^ v236) >> 24) ^ 0x47)) ^ v245 ^ (v241 + 1271828296 - ((2 * v241) & 0x979D1E90));
  unsigned int v254 = v499 ^ *(_DWORD *)&v238[4 * ((v512 ^ v236) ^ 0xC3)] ^ (v252
                                                                               - 312721661
                                                                               - ((2 * v252) & 0xDAB87E06));
  LODWORD(v231) = HIDWORD(v494) ^ *(_DWORD *)&v238[4 * ((v234 ^ BYTE4(v512)) ^ 0x5F)] ^ v231;
  unsigned int v255 = HIDWORD(v415) ^ *(_DWORD *)(v248 + 4LL * HIBYTE(v240)) ^ (v251 + 1271828296 - ((2 * v251) & 0x979D1E90));
  LODWORD(v226) = v253 ^ 0xF9388C2F;
  LODWORD(v221) = *(_DWORD *)&v243[4 * ((v253 ^ 0xF9388C2F) >> 16)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  LODWORD(v221) = v246 >> 12;
  int v256 = *(_DWORD *)&v243[4 * (BYTE2(v254) ^ 0xD9)];
  HIDWORD(v246) = v256 ^ 0xD56;
  LODWORD(v246) = v256 ^ 0x86729000;
  int v257 = v246 >> 12;
  int v258 = *(_DWORD *)&v243[4 * (BYTE2(v231) ^ 0x66)];
  HIDWORD(v246) = v258 ^ 0xD56;
  LODWORD(v246) = v258 ^ 0x86729000;
  int v259 = (v246 >> 12) ^ *(_DWORD *)&v237[4 * (BYTE1(v255) ^ 5)] ^ ((BYTE1(v255) ^ 0x68)
                                                                 - 243618108
                                                                 - ((2 * ((v255 >> 8) ^ 0x42BD68)) & 0x188));
  int v260 = (v221 - 312721661 - ((2 * v221) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v231 ^ 0xB6)];
  unsigned int v261 = (v259 - 312721661 - ((2 * v259) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v253 ^ 0x61)];
  unsigned int v262 = (((unsigned __int16)(v253 ^ 0x8C2F) >> 8) - 243618108 - (((v253 ^ 0xF9388C2F) >> 7) & 0x188)) ^ 0xD678EAEF ^ *(_DWORD *)&v237[4 * (((unsigned __int16)(v253 ^ 0x8C2F) >> 8) ^ 0x6D)];
  unsigned int v263 = *(_DWORD *)(v248 + 4LL * (BYTE3(v231) ^ 0x43)) ^ 0xE9D4D4F6;
  int v264 = v262 + v263 - 2 * (v262 & v263);
  int v265 = *(_DWORD *)&v243[4 * (BYTE2(v255) ^ 0xBD)];
  HIDWORD(v246) = v265 ^ 0xD56;
  LODWORD(v246) = v265 ^ 0x86729000;
  unsigned int v266 = *(_DWORD *)(v248 + 4LL * BYTE3(v226)) ^ (v257 + 1271828296 - ((2 * v257) & 0x979D1E90));
  unsigned int v267 = (v266 - 312721661 - ((2 * v266) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v255 ^ 0xAB)];
  unsigned int v268 = *(_DWORD *)(v248 + 4LL * (HIBYTE(v255) ^ 0x42)) ^ HIDWORD(v517) ^ *(_DWORD *)&v237[4 * (BYTE1(v254) ^ 0xDE)] ^ ((BYTE1(v254) ^ 0xB3) - 243618108 - ((2 * ((v254 >> 8) ^ 0x53D9B3)) & 0x188)) ^ (v260 + 1271828296 - ((2 * v260) & 0x979D1E90));
  LOBYTE(v226) = BYTE1(v231) ^ 0x54;
  LODWORD(v231) = v494 ^ *(_DWORD *)&v237[4 * (BYTE1(v231) ^ 0x39)] ^ (v267 - 243618108 - ((2 * v267) & 0xE2F55D88));
  LODWORD(v221) = *(_DWORD *)(v248 + 4LL * (HIBYTE(v254) ^ 0x53));
  unsigned int v269 = v415 ^ *(_DWORD *)&v238[4 * (v254 ^ 0x25)] ^ ((v264 ^ (v246 >> 12))
                                                                      - 312721661
                                                                      - ((2 * (v264 ^ (v246 >> 12))) & 0xDAB87E06));
  int v270 = *(_DWORD *)&v243[4 * (BYTE2(v269) ^ 0x79)];
  int v271 = HIDWORD(v490) ^ v221 ^ (v261 + 1271828297 + ~((2 * v261) & 0x979D1E90));
  HIDWORD(v246) = v270 ^ 0xD56;
  LODWORD(v246) = v270 ^ 0x86729000;
  BYTE1(v255) = ((unsigned __int16)(WORD2(v490) ^ v221 ^ (v261 - 28855 + ~((2 * v261) & 0x1E90))) >> 8) ^ 0x68;
  LODWORD(v221) = ((v246 >> 12) + 1271828296 - ((2 * (v246 >> 12)) & 0x979D1E90)) ^ *(_DWORD *)(v248
                                                                                              + 4LL
                                                                                              * ((v271 ^ 0x2261685Eu) >> 24));
  int v272 = ((BYTE1(v269) ^ 0xD0) - 243618108 - 2 * (((v269 >> 8) ^ 0x679D0) & 0xC6 ^ (v269 >> 8) & 2)) ^ *(_DWORD *)&v237[4 * (BYTE1(v269) ^ 0xBD)];
  unsigned int v273 = (v272 - 312721661 - ((2 * v272) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v268 ^ 0x76)];
  unsigned int v274 = ((BYTE1(v231) ^ 0xEC) - 243618108 - ((2 * ((v231 >> 8) ^ 0xE5FEC)) & 0x188)) ^ *(_DWORD *)&v237[4 * (BYTE1(v231) ^ 0x81)];
  int v275 = *(_DWORD *)&v243[4 * (BYTE2(v231) ^ 0x5F)];
  HIDWORD(v246) = v275 ^ 0xD56;
  LODWORD(v246) = v275 ^ 0x86729000;
  int v276 = v246 >> 12;
  HIDWORD(v246) = *(_DWORD *)&v238[4 * (v271 ^ 0x5E)] ^ 0x44B188B;
  LODWORD(v246) = HIDWORD(v246);
  int v277 = (v246 >> 28) ^ __ROR4__( *(_DWORD *)(v248 + 4LL * (HIBYTE(v269) ^ 6)) ^ 0x7462B151 ^ (v274 + 1271828296 - ((2 * v274) & 0x979D1E90)),  28);
  unsigned int v278 = (v276 + 1271828296 - ((2 * v276) & 0x979D1E90)) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v268) ^ 0xD2));
  unsigned int v279 = (v278 - 312721661 - ((2 * v278) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v269 ^ 0x4C)];
  int v280 = *(_DWORD *)&v243[4 * (BYTE2(v271) ^ 0x1B)];
  HIDWORD(v246) = v280 ^ 0xD56;
  LODWORD(v246) = v280 ^ 0x86729000;
  int v281 = v246 >> 12;
  int v282 = v221 - 312721661 - ((2 * v221) & 0xDAB87E06);
  LODWORD(v221) = *(_DWORD *)&v243[4 * (BYTE2(v268) ^ 0xCC)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  int v283 = v490 ^ (v246 >> 12) ^ __ROR4__(v277 ^ 0x78071371, 4);
  LOBYTE(v277) = v231 ^ v226;
  LODWORD(v221) = HIDWORD(v484) ^ *(_DWORD *)(v248 + 4LL * (BYTE3(v231) ^ 0xE)) ^ v281 ^ (v273
                                                                                        + 1271828296
                                                                                        - ((2 * v273) & 0x979D1E90));
  int v284 = BYTE1(v255);
  LODWORD(v226) = v484 ^ *(_DWORD *)&v237[4 * (BYTE1(v255) ^ 0x6D)] ^ (v279 - 243618108 - ((2 * v279) & 0xE2F55D88));
  unsigned int v285 = HIDWORD(v479) ^ ((BYTE1(v268) ^ 0xC0) - 243618108 - 2 * (((v268 >> 8) ^ 0xD2CCC0) & 0xD6 ^ (v268 >> 8) & 0x12)) ^ *(_DWORD *)&v238[4 * (v277 ^ 0xCA)] ^ *(_DWORD *)&v237[4 * (BYTE1(v268) ^ 0xAD)] ^ v282;
  unsigned int v286 = v284 ^ 0x4552953C ^ v226;
  LODWORD(v231) = *(_DWORD *)&v243[4 * BYTE2(v286)];
  HIDWORD(v246) = v231 ^ 0xD56;
  LODWORD(v246) = v231 ^ 0x86729000;
  int v287 = v246 >> 12;
  LODWORD(v231) = v283 ^ 0x99FEE750;
  int v288 = *(_DWORD *)&v243[4 * ((v283 ^ 0x99FEE750) >> 16)];
  HIDWORD(v246) = v288 ^ 0xD56;
  LODWORD(v246) = v288 ^ 0x86729000;
  int v289 = BYTE1(v221);
  unsigned int v290 = (BYTE1(v221) ^ 0x29) - 243618108 - ((v221 >> 7) & 0x188);
  LODWORD(v219) = (BYTE1(v286) - 243618108 - ((v286 >> 7) & 0x188)) ^ *(_DWORD *)&v238[4
                                                                                     * (v221 ^ 0x72)] ^ *(_DWORD *)&v237[4 * (BYTE1(v286) ^ 0x6D)] ^ ((v246 >> 12) - 312721661 - ((2 * (v246 >> 12)) & 0xDAB87E06));
  int v291 = *(_DWORD *)&v243[4 * (BYTE2(v285) ^ 2)];
  HIDWORD(v246) = v291 ^ 0xD56;
  LODWORD(v246) = v291 ^ 0x86729000;
  int v292 = *(_DWORD *)(v248 + 4LL * (BYTE3(v221) ^ 0xA7)) ^ (v246 >> 12);
  LODWORD(v221) = *(_DWORD *)&v243[4 * (BYTE2(v221) ^ 0x3B)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  unsigned int v293 = *(_DWORD *)&v238[4 * v286] ^ v292 ^ 0xA692B04B;
  unsigned int v294 = v479 ^ ((BYTE1(v285) ^ 0xD9) - 243618108 - ((2 * ((v285 >> 8) ^ 0x9802D9)) & 0x188)) ^ *(_DWORD *)&v238[4 * (v283 ^ 0x1E)] ^ *(_DWORD *)&v237[4 * (BYTE1(v285) ^ 0xB4)] ^ (v246 >> 12) ^ *(_DWORD *)(v248 + 4LL * (BYTE3(v226) ^ 0x61));
  unsigned int v295 = HIDWORD(v475) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v285) ^ 0x98)) ^ (v219 + 1271828296 - ((2 * v219) & 0x979D1E90));
  unsigned int v296 = v475 ^ *(_DWORD *)&v238[4 * (v285 ^ 0x3D)] ^ v290 ^ *(_DWORD *)(v248 + 4LL * BYTE3(v231)) ^ *(_DWORD *)&v237[4 * (v289 ^ 0x44)] ^ v287;
  unsigned int v297 = HIDWORD(v470) ^ *(_DWORD *)&v237[4 * (BYTE1(v231) ^ 0x6D)] ^ (v293 - 243618107 + ~((2 * v293) & 0xE2F55D88));
  LODWORD(v219) = *(_DWORD *)&v243[4 * (BYTE2(v294) ^ 0xD5)];
  HIDWORD(v246) = v219 ^ 0xD56;
  LODWORD(v246) = v219 ^ 0x86729000;
  LODWORD(v219) = v246 >> 12;
  LODWORD(v221) = *(_DWORD *)&v243[4 * (BYTE2(v296) ^ 0x7A)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  int v298 = *(_DWORD *)&v238[4 * ((v297 ^ BYTE1(v231)) ^ 0x41)] ^ (BYTE1(v294)
                                                                               - 243618108
                                                                               - ((v294 >> 7) & 0x188)) ^ *(_DWORD *)&v237[4 * (BYTE1(v294) ^ 0x6D)] ^ ((v246 >> 12) - 312721661 - ((2 * (v246 >> 12)) & 0xDAB87E06));
  unsigned int v299 = v298 + 1271828296 - ((2 * v298) & 0x979D1E90);
  int v300 = *(_DWORD *)&v243[4 * (BYTE2(v297) ^ 0x81)];
  HIDWORD(v246) = v300 ^ 0xD56;
  LODWORD(v246) = v300 ^ 0x86729000;
  unsigned __int8 v301 = v294 ^ 0xA6;
  int v302 = ((v246 >> 12) + 1271828296 - ((2 * (v246 >> 12)) & 0x979D1E90)) ^ *(_DWORD *)(v248
                                                                                     + 4LL * ((v294 ^ 0xB6AF00A6) >> 24));
  unsigned int v303 = (v302 - 312721661 - ((2 * v302) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v296 ^ 0x4E)];
  unsigned int v304 = *(_DWORD *)&v243[4 * (BYTE2(v295) ^ 0xC6)];
  LODWORD(v219) = ((BYTE1(v297) ^ 0xA0) - 243618108 - 2 * (((v297 >> 8) ^ 0x6881A0) & 0xDC ^ (v297 >> 8) & 0x18)) ^ (v219 - 312721661 - ((2 * v219) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v295 ^ 0xFC)] ^ *(_DWORD *)&v237[4 * (BYTE1(v297) ^ 0xCD)];
  LODWORD(v246) = __ROR4__((v304 >> 12) ^ 0x265BA0B, 17) ^ 0xEE910136;
  HIDWORD(v246) = v246;
  unsigned int v305 = v470 ^ *(_DWORD *)&v237[4 * (BYTE1(v295) ^ 0x75)] ^ (v303 - 243618108 - ((2 * v303) & 0xE2F55D88));
  LODWORD(v231) = HIDWORD(v466) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v296) ^ 0x73)) ^ (v219
                                                                                   + 1271828297
                                                                                   + ~((2 * v219) & 0x979D1E90));
  int v306 = v198 ^ v390 ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v295) ^ 0x5A)) ^ v299;
  unsigned int v307 = HIDWORD(v460) ^ ((BYTE1(v296) ^ 0x4F) - 243618108 - 2 * (((v296 >> 8) ^ 0x737A4F) & 0xD4 ^ (v296 >> 8) & 0x10)) ^ *(_DWORD *)&v238[4 * v301] ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v297) ^ 0x68)) ^ *(_DWORD *)&v237[4 * (BYTE1(v296) ^ 0x22)] ^ ((v246 >> 15) + (v304 << 20));
  LODWORD(v219) = ((BYTE1(v305) ^ 0x9D) - 243618107 + (~(2 * ((v305 >> 8) ^ 0xC2489D)) | 0xFFFFFE77)) ^ *(_DWORD *)&v237[4 * (BYTE1(v305) ^ 0xF0)];
  unsigned int v308 = *(_DWORD *)&v243[4 * (BYTE2(v231) ^ 0x8F)];
  LODWORD(v219) = *(_DWORD *)&v238[4 * (v307 ^ 0xC1)] ^ (v308 << 20) ^ (v308 >> 12) ^ 0xD5686729 ^ (v219 - 312721661 - ((2 * v219) & 0xDAB87E06));
  int v309 = *(_DWORD *)&v243[4 * ((v306 ^ 0xCFB8D782) >> 16)];
  HIDWORD(v246) = v309 ^ 0xD56;
  LODWORD(v246) = v309 ^ 0x86729000;
  int v310 = ((v246 >> 12) - 312721661 - ((2 * (v246 >> 12)) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4
                                                                                         * ((v305 ^ BYTE1(v295)) ^ 0x3F)];
  int v311 = v219 + 1271828296 - ((2 * v219) & 0x979D1E90);
  unsigned int v312 = v310 + 1271828296 - ((2 * v310) & 0x979D1E90);
  int v313 = BYTE1(v231) ^ 0xD9;
  LODWORD(v219) = v313 - 243618108 - ((2 * ((v231 >> 8) ^ 0xC78FD9)) & 0x188);
  int v314 = *(_DWORD *)&v243[4 * (BYTE2(v305) ^ 0x48)];
  HIDWORD(v246) = v314 ^ 0xD56;
  LODWORD(v246) = v314 ^ 0x86729000;
  int v315 = ((BYTE1(v307) ^ 0xD0) - 243618108 - 2 * (((v307 >> 8) ^ 0x5579D0) & 0xC7 ^ (v307 >> 8) & 3)) ^ *(_DWORD *)&v238[4 * (v306 ^ 0xCC)] ^ *(_DWORD *)&v237[4 * (BYTE1(v307) ^ 0xBD)] ^ ((v246 >> 12) - 312721661 - ((2 * (v246 >> 12)) & 0xDAB87E06));
  int v316 = *(_DWORD *)&v243[4 * (BYTE2(v307) ^ 0x79)];
  HIDWORD(v246) = v316 ^ 0xD56;
  LODWORD(v246) = v316 ^ 0x86729000;
  unsigned int v317 = v460 ^ (((unsigned __int16)(v306 ^ 0xD782) >> 8)
               - 243618108
               - (((v306 ^ 0xCFB8D782) >> 7) & 0x188)) ^ *(_DWORD *)&v238[4 * (v231 ^ 0x50)] ^ *(_DWORD *)&v237[4 * (((unsigned __int16)(v306 ^ 0xD782) >> 8) ^ 0x6D)] ^ (v246 >> 12) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v305) ^ 0xC2));
  unsigned int v318 = HIDWORD(v455) ^ *(_DWORD *)(v248 + 4LL * (BYTE3(v231) ^ 0xC7)) ^ (v315 + 1271828296 - ((2 * v315) & 0x979D1E90));
  LODWORD(v231) = v455 ^ *(_DWORD *)(v248 + 4LL * ((v306 ^ 0xCFB8D782) >> 24)) ^ v311;
  unsigned int v319 = HIDWORD(v450) ^ v219 ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v307) ^ 0x55)) ^ *(_DWORD *)&v237[4 * (v313 ^ 0x6D)] ^ v312;
  LODWORD(v221) = *(_DWORD *)&v243[4 * (BYTE2(v318) ^ 0xE6)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  int v320 = v246 >> 12;
  int v321 = *(_DWORD *)&v243[4 * (BYTE2(v231) ^ 0x1C)];
  HIDWORD(v246) = v321 ^ 0xD56;
  LODWORD(v246) = v321 ^ 0x86729000;
  unsigned int v322 = (((unsigned __int16)(v319 ^ 0xCCA2) >> 8) - 243618108 - (((v319 ^ 0x33C8CCA2) >> 7) & 0x188)) ^ *(_DWORD *)&v237[4 * (((unsigned __int16)(v319 ^ 0xCCA2) >> 8) ^ 0x6D)];
  LODWORD(v219) = (v246 >> 12) ^ *(_DWORD *)&v237[4 * (BYTE1(v318) ^ 0xD9)] ^ ((BYTE1(v318) ^ 0xB4)
                                                                             - 243618108
                                                                             - ((2 * ((v318 >> 8) ^ 0x4FE6B4)) & 0x188));
  LODWORD(v219) = (v219 - 312721661 - ((2 * v219) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v317 ^ 0xA1)];
  unsigned int v323 = (v322 - 312721661 - ((2 * v322) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4
                                                                         * ((v455 ^ *(_BYTE *)(v248 + 4LL * ((v306 ^ 0xCFB8D782) >> 24)) ^ v311) ^ 0x3A)];
  int v324 = *(_DWORD *)&v238[4 * (v318 ^ 0x96)];
  HIDWORD(v246) = v324 ^ 0xD5C3F03;
  LODWORD(v246) = ~v324;
  HIDWORD(v246) = (v246 >> 29) ^ 0x6615DA09;
  LODWORD(v246) = HIDWORD(v246);
  unsigned int v325 = *(_DWORD *)&v238[4 * (v319 ^ 0xA2)] ^ (((unsigned __int16)(v317 ^ 0xA4A1) >> 8)
                                                               - 243618108
                                                               - (((v317 ^ 0xBFA1A4A1) >> 7) & 0x188)) ^ *(_DWORD *)&v237[4 * (((unsigned __int16)(v317 ^ 0xA4A1) >> 8) ^ 0x6D)] ^ (v320 - 312721661 - ((2 * v320) & 0xDAB87E06));
  int v326 = (v246 >> 3) - 243618108 - ((2 * (v246 >> 3)) & 0xE2F55D88);
  int v327 = *(_DWORD *)&v243[4 * ((v317 ^ 0xBFA1A4A1) >> 16)];
  HIDWORD(v246) = v327 ^ 0xD56;
  LODWORD(v246) = v327 ^ 0x86729000;
  int v328 = v246 >> 12;
  LODWORD(v221) = *(_DWORD *)&v243[4 * ((v319 ^ 0x33C8CCA2) >> 16)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  unsigned int v329 = v450 ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v319) ^ 0x17)) ^ (v219 + 1271828296 - ((2 * v219) & 0x979D1E90));
  LODWORD(v221) = BYTE1(v231);
  LODWORD(v219) = v326 ^ *(_DWORD *)&v237[4 * (BYTE1(v231) ^ 0xD1)] ^ (v246 >> 12);
  unsigned int v330 = HIDWORD(v444) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v318) ^ 0x4F)) ^ v328 ^ (v323
                                                                                 + 1271828296
                                                                                 - ((2 * v323) & 0x979D1E90));
  LODWORD(v231) = v444 ^ *(_DWORD *)(v248 + 4LL * (BYTE3(v231) ^ 0x1B)) ^ (v325 + 1271828296 - ((2 * v325) & 0x979D1E90));
  int v331 = *(_DWORD *)&v243[4 * (BYTE2(v231) ^ 0x7E)];
  HIDWORD(v246) = v331 ^ 0xD56;
  LODWORD(v246) = v331 ^ 0x86729000;
  int v332 = v246 >> 12;
  int v333 = *(_DWORD *)&v243[4 * (BYTE2(v330) ^ 1)];
  HIDWORD(v246) = v333 ^ 0xD56;
  LODWORD(v246) = v333 ^ 0x86729000;
  unsigned int v334 = *(_DWORD *)(v248 + 4LL * (HIBYTE(v317) ^ 0x9B)) ^ v517 ^ (v219 + 1271828296 - ((2 * v219) & 0x979D1E90));
  LODWORD(v219) = ((v246 >> 12) - 312721661 - ((2 * (v246 >> 12)) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v329 ^ 0xC6)];
  int v335 = ((BYTE1(v329) ^ 0x71) - 243618108 - ((2 * ((v329 >> 8) ^ 0xF25B71)) & 0x188)) ^ *(_DWORD *)&v237[4 * (BYTE1(v329) ^ 0x1C)];
  unsigned int v336 = (v335 + 1271828296 - ((2 * v335) & 0x979D1E90)) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v330) ^ 0x1F));
  int v337 = *(_DWORD *)&v243[4 * (BYTE2(v329) ^ 0x5B)];
  HIDWORD(v246) = v337 ^ 0xD56;
  LODWORD(v246) = v337 ^ 0x86729000;
  int v338 = v246 >> 12;
  LODWORD(v221) = v221 ^ 0x73F4E0AF ^ v334;
  int v339 = *(_DWORD *)&v243[4 * BYTE2(v221)];
  HIDWORD(v246) = v339 ^ 0xD56;
  LODWORD(v246) = v339 ^ 0x86729000;
  int v340 = v246 >> 12;
  HIDWORD(v246) = v332 ^ ((BYTE1(v330) ^ 0x81) - 243618108 - ((2 * ((v330 >> 8) ^ 0x1F0181)) & 0x188)) ^ 0xD678EAEF ^ *(_DWORD *)&v237[4 * (BYTE1(v330) ^ 0xEC)];
  LODWORD(v246) = HIDWORD(v246);
  LODWORD(v246) = (v246 >> 11) ^ __ROR4__(*(_DWORD *)(v248 + 4LL * (HIBYTE(v329) ^ 0xF2)) ^ 0xE9D4D4F6, 11) ^ 0xD490839A;
  HIDWORD(v246) = v246;
  unsigned int v341 = HIDWORD(v381) ^ v393 ^ *(_DWORD *)&v238[4 * (v330 ^ 0xB8)] ^ ((BYTE1(v231) ^ 0xAA)
                                                                                      - 243618107
                                                                                      + ~(2
                                                                                        * (((v231 >> 8) ^ 0x967EAA) & 0xD5 ^ (v231 >> 8) & 0x11))) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v334) ^ 0x57)) ^ v338 ^ *(_DWORD *)&v237[4 * (BYTE1(v231) ^ 0xC7)];
  LODWORD(v226) = *(_DWORD *)&v238[4 * (v231 ^ 0x88)];
  LODWORD(v231) = v438 ^ *(_DWORD *)(v248 + 4LL * (BYTE3(v231) ^ 0x96)) ^ (BYTE1(v221)
                                                                         - 243618108
                                                                         - ((v221 >> 7) & 0x188)) ^ *(_DWORD *)&v237[4 * (BYTE1(v221) ^ 0x6D)] ^ (v219 + 1271828296 - ((2 * v219) & 0x979D1E90));
  LODWORD(v219) = HIDWORD(v432) ^ v226 ^ v340 ^ (v336 - 312721661 - ((2 * v336) & 0xDAB87E06));
  unsigned int v342 = v432 ^ *(_DWORD *)&v238[4 * v221] ^ ((v246 >> 21)
                                                             - 312721661
                                                             - ((2 * (v246 >> 21)) & 0xDAB87E06));
  LODWORD(v226) = *(_DWORD *)&v243[4 * (BYTE2(v341) ^ 0x79)];
  HIDWORD(v246) = v226 ^ 0xD56;
  LODWORD(v246) = v226 ^ 0x86729000;
  LODWORD(v226) = v246 >> 12;
  unsigned int v343 = *(_DWORD *)&v237[4 * (BYTE1(v231) ^ 0x96)] ^ ((BYTE1(v231) ^ 0xFB)
                                                     - 243618108
                                                     - ((2 * ((v231 >> 8) ^ 0x3EA2FB)) & 0x188));
  unsigned int v344 = (v343 - 312721661 - ((2 * v343) & 0xDAB87E06)) ^ *(_DWORD *)&v238[4 * (v219 ^ 0x75)];
  int v345 = *(_DWORD *)&v243[4 * (BYTE2(v231) ^ 0xA2)];
  HIDWORD(v246) = v345 ^ 0xD56;
  LODWORD(v246) = v345 ^ 0x86729000;
  int v346 = (((unsigned __int16)(v219 ^ 0xF075) >> 8)
        - 243618108
        - (((v219 ^ 0xB54AF075) >> 7) & 0x188)) ^ (v246 >> 12) ^ *(_DWORD *)&v237[4
                                                                                              * (((unsigned __int16)(v219 ^ 0xF075) >> 8) ^ 0x6D)];
  unsigned int v347 = (v346 + 1271828296 - ((2 * v346) & 0x979D1E90)) ^ *(_DWORD *)(v248 + 4LL * (HIBYTE(v342) ^ 0xED));
  int v348 = *(_DWORD *)(v248 + 4LL * (BYTE3(v231) ^ 0x3E));
  int v349 = *(_DWORD *)(v248 + 4LL * (HIBYTE(v341) ^ 0x61));
  v342 ^= 0xC9AF1D8F;
  int v350 = *(_DWORD *)&v238[4 * v342];
  LODWORD(v231) = *(_DWORD *)&v238[4 * (v231 ^ 0x9A)];
  LODWORD(v23_Block_object_dispose(va, 8) = *(_DWORD *)&v238[4 * (v341 ^ 0x24)];
  LODWORD(v221) = *(_DWORD *)&v243[4 * (BYTE2(v219) ^ 0x4A)];
  HIDWORD(v246) = v221 ^ 0xD56;
  LODWORD(v246) = v221 ^ 0x86729000;
  v341 >>= 8;
  int v351 = *(_DWORD *)&v237[4 * (v341 ^ 0x1D)];
  LODWORD(v237) = HIDWORD(v426) ^ v231 ^ v226 ^ *(_DWORD *)(v248 + 4LL * (BYTE3(v219) ^ 0x91)) ^ (BYTE1(v342)
                                                                                                - 243618108
                                                                                                - ((v342 >> 7) & 0x188)) ^ *(_DWORD *)&v237[4 * (BYTE1(v342) ^ 0x6D)];
  LODWORD(v226) = v426 ^ ((v341 ^ 0x70) - 243618108 - 2 * ((v341 ^ 0x617970) & 0xC6 ^ v341 & 2)) ^ v348 ^ v351 ^ v350 ^ (v246 >> 12);
  LODWORD(v231) = HIDWORD(v421) ^ v238 ^ (v347 - 312721661 - ((2 * v347) & 0xDAB87E06));
  unsigned int v352 = v421 ^ v349 ^ (*(_DWORD *)&v243[4 * BYTE2(v342)] >> 12) ^ (*(_DWORD *)&v243[4 * BYTE2(v342)] << 20) ^ (v344 + 1271828296 - ((2 * v344) & 0x979D1E90));
  uint64_t v353 = (char *)*(&off_189D4D580 + (int)v405) - 12;
  int v354 = (char *)*(&off_189D4D580 + SHIDWORD(v400)) - 8;
  LODWORD(v23_Block_object_dispose(va, 8) = *(_DWORD *)&v353[4
                                 * ((BYTE4(v421) ^ v238 ^ (v347 + 3 - ((2 * v347) & 6))) ^ 7)] ^ *(_DWORD *)&v354[4 * (((unsigned __int16)(v421 ^ v349 ^ (*(_DWORD *)&v243[4 * BYTE2(v342)] >> 12) ^ (v344 - 28856 - ((2 * v344) & 0x1E90))) >> 8) ^ 0x44)] ^ 0x780CEFA6;
  int v355 = *(_DWORD *)(v58 - 120);
  uint64_t v356 = (char *)*(&off_189D4D580 + v355 - 902) - 12;
  int v357 = *(_DWORD *)&v356[4 * (BYTE3(v226) ^ 0xDE)] ^ ((_DWORD)v238 - 1931009435 - ((2 * (_DWORD)v238) & 0x19CE44CA));
  LODWORD(v23_Block_object_dispose(va, 8) = *(_DWORD *)&v354[4 * (BYTE1(v237) ^ 0xC1)];
  LODWORD(v221) = *(_DWORD *)&v354[4 * ((unsigned __int16)(v231 ^ 0x6F07) >> 8)];
  LODWORD(v243) = *(_DWORD *)&v354[4 * (BYTE1(v226) ^ 0xDD)];
  int v358 = *(_DWORD *)&v356[4 * (BYTE3(v231) ^ 0xEF)];
  int v359 = *(_DWORD *)&v356[4 * (HIBYTE(v352) ^ 0x48)];
  int v360 = *(_DWORD *)&v356[4 * ((v237 >> 24) ^ 0x97)];
  v361 = (char *)*(&off_189D4D580 + (int)v400) - 8;
  LODWORD(v354) = *(_DWORD *)&v361[4 * (BYTE2(v352) ^ 0xD4)];
  int v362 = *(_DWORD *)&v361[4 * (BYTE2(v231) ^ 0x2A)];
  LODWORD(v231) = *(_DWORD *)&v361[4 * (BYTE2(v226) ^ 0xB9)];
  LODWORD(v361) = *(_DWORD *)&v361[4 * (BYTE2(v237) ^ 0x19)] ^ (v357 + 1891546005 - ((2 * v357) & 0xE17D672A));
  uint64_t v363 = *(unsigned int *)&v353[4 * (v237 ^ 0x97)];
  uint64_t v364 = *(unsigned int *)&v353[4 * (v226 ^ 0x21)];
  LODWORD(v353) = *(_DWORD *)&v353[4 * (v352 ^ 0xF2)];
  uint64_t v365 = *(_DWORD *)(v58 - 136) ^ v514 ^ ((_DWORD)v361 - ((2 * (_DWORD)v361) & 0x12B1F272) + 156825913);
  v366 = (char *)*(&off_189D4D580 + v355 - 869) - 12;
  a52[8] = v366[BYTE3(v365) ^ 0xD7LL] ^ 0xD1;
  LODWORD(v354) = ((v354 ^ 0x99E6FCD1 ^ v221)
                 - 1931009435
                 - ((2 * (v354 ^ 0x99E6FCD1 ^ v221)) & 0x19CE44CA)) ^ v360;
  LODWORD(v354) = ((_DWORD)v354 - 1856724766 - ((2 * (_DWORD)v354) & 0x22A941C4)) ^ v364;
  LODWORD(v354) = *(_DWORD *)(v58 - 132) ^ HIDWORD(v514) ^ ((_DWORD)v354 - ((2 * (_DWORD)v354) & 0x91484D62) + 1218717361);
  v367 = (char *)*(&off_189D4D580 + v355 - 1005) - 4;
  a52[*(void *)(v58 - 240)] = (v367[v354 ^ 0xC7LL] + 99) ^ 0x5F;
  v368 = (char *)*(&off_189D4D580 + v355 - 1051) - 12;
  LODWORD(v221) = v368[BYTE1(v354) ^ 0x13LL];
  HIDWORD(v246) = v221 ^ 8;
  LODWORD(v246) = ~(_DWORD)v221 << 24;
  a52[6] = (v246 >> 30) ^ 0x40;
  LODWORD(v221) = ((v363 ^ 0xE1EA1377 ^ v362) - 1931009435 - ((2 * (v363 ^ 0xE1EA1377 ^ v362)) & 0x19CE44CA)) ^ v359;
  LODWORD(v221) = (v221 - ((2 * v221) & 0xD2B09E88) - 380088508) ^ v243;
  LODWORD(v361) = *(_DWORD *)(v58 - 128) ^ HIDWORD(v515) ^ (v221 - ((2 * v221) & 0x3B90506A) - 1647826891);
  LODWORD(v221) = v368[(unsigned __int16)(*(_WORD *)(v58 - 128) ^ WORD2(v515) ^ (v221
                                                                                                - ((2 * v221) & 0x506A)
                                                                                                + 10293)) >> 8];
  HIDWORD(v246) = v221 ^ 8;
  LODWORD(v246) = ~(_DWORD)v221 << 24;
  a52[*(void *)(v58 - 224)] = (v246 >> 30) ^ 0x7E;
  v369 = (char *)*(&off_189D4D580 + v355 - 958) - 8;
  a52[9] = v369[BYTE2(v365) ^ 0xFBLL] ^ 0x9A;
  LODWORD(v221) = ((v358 ^ v238 ^ 0x65BF6D21)
                 + 1891546005
                 - 2 * ((v358 ^ v238 ^ 0x65BF6D21) & 0x70BEB39D ^ (v358 ^ v238) & 8)) ^ v231;
  LODWORD(v221) = (v221 - 1856724766 - ((2 * v221) & 0x22A941C4)) ^ v353;
  LODWORD(v221) = *(_DWORD *)(v58 - 124) ^ v515 ^ (v221 - ((2 * v221) & 0xD15120A4) - 391606190);
  a52[*(void *)(v58 - 168)] = v369[BYTE2(v221) ^ 0xB8LL] ^ 0x49;
  a52[*(void *)(v58 - 256)] = (v367[v365 ^ 0x1BLL] + 99) ^ 0x7D;
  a52[*(void *)(v58 - 248)] = v369[BYTE2(v354) ^ 3LL] ^ 0x37;
  a52[*(void *)(v58 - 184)] = v366[(v354 >> 24) ^ 0x6DLL] ^ 0x29;
  LODWORD(v354) = v368[BYTE1(v365) ^ 0x92LL];
  HIDWORD(v246) = v354 ^ 8;
  LODWORD(v246) = ~(_DWORD)v354 << 24;
  a52[*(void *)(v58 - 160)] = (v246 >> 30) ^ 0xD2;
  uint64_t v370 = *(void *)(v58 - 200);
  a52[v370] = v366[(v361 >> 24) ^ 0x53LL] ^ 0xC5;
  a52[*(void *)(v58 - 192)] = (v367[v361 ^ 0x95LL] + 99) ^ 0xAF;
  a52[*(void *)(v58 - 232)] = (v367[v221 ^ 0x64LL] + 99) ^ 0x27;
  a52[*(void *)(v58 - 176)] = v366[BYTE3(v221) ^ 0x6ELL] ^ 0x53;
  LODWORD(v354) = v368[BYTE1(v221) ^ 0x1FLL];
  HIDWORD(v246) = v354 ^ 8;
  LODWORD(v246) = ~(_DWORD)v354 << 24;
  a52[*(void *)(v58 - 216)] = (v246 >> 30) ^ 0x58;
  a52[*(void *)(v58 - 152)] = v369[BYTE2(v361) ^ 0xC8LL] ^ 0x18;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, unsigned __int8 *))(a54 + 8LL * ((1918 * ((((_DWORD)v370 + 100576593 - 2 * (((_DWORD)v370 + 16) & *(_DWORD *)(v58 - 204))) ^ 0x5FEAD41u) < a53)) ^ (v355 - 551))))( v364,  109LL,  2438242530LL,  v368,  v363,  1891546005LL,  v365,  581517764LL,  v372,  v373,  v374,  v375,  v377,  v379,  v381,  v383,  v387,  v390,  v393,  v395,  a21,  a22,  v400,  v405,  v410,  v415,  v421,  v426,  v432,  v438,  v444,  v450,  v455,  v460,  v466,  v470,  v475,  v479,  v484,  v490,  v494,  v499,  v503,  v506,  v509,  v511,  v512,  v513,  v514,
           v515,
           v517,
           a52);
}

void sub_183DA9048( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,int a57,int a58)
{
  *(_DWORD *)(v58 - 124) = a55 ^ 0x339ACB7E;
  *(_DWORD *)(v58 - 136) = a57 ^ 0xB2019896;
  *(_DWORD *)(v58 - 12_Block_object_dispose(va, 8) = a58 ^ 0xE9DEE1CD;
  *(_DWORD *)(v58 - 132) = a56 ^ 0xB1F8B9AD;
  JUMPOUT(0x183DA7334LL);
}

uint64_t sub_183DA909C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8 + 8LL * ((1900 * ((((a7 - 320) ^ (v7 == a3)) & 1) == 0)) ^ a7)))();
}

uint64_t sub_183DA90C8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v5
                                                                                + 8LL
                                                                                * (int)((((((a4 | 0x296) + 1342085929) & 0xB0016363)
                                                                                        - 484)
                                                                                       * ((v4 & 8) == 0)) ^ (a4 | 0x296)))
                                                                    - 25 * ((a4 | 0x296) ^ 0x3BDu)
                                                                    + 1063LL))( a1,  a2,  a3,  (a2 - a3));
}

uint64_t sub_183DA9120( int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  *(_DWORD *)(v61 - 124) = v57 & 0xFFFFFFF8;
  *(_DWORD *)(v61 - 120) = v57;
  unsigned int v63 = a3 - (v57 & 0xFFFFFFF8) + 8;
  int v64 = v60 + v59;
  char v65 = v60 + v59 + v58;
  char v66 = v65 - a3;
  char v67 = v65 + a6 - a3 - 20;
  unsigned int v68 = v64 + a1 - a3;
  *(_DWORD *)(v61 - 12_Block_object_dispose(va, 8) = a6 - 189;
  v70.val[0].i64[0] = v68 & 0xF;
  v70.val[0].i64[1] = (v66 + 5) & 0xF;
  v70.val[1].i64[0] = (v66 + 4) & 0xF;
  v70.val[1].i64[1] = (v66 + 3) & 0xF;
  v70.val[2].i64[0] = (v66 + 2) & 0xF;
  v70.val[2].i64[1] = (v66 + 1) & 0xF;
  v70.val[3].i64[0] = v66 & 0xF;
  v70.val[3].i64[1] = v67 & 0xF;
  *(int8x8_t *)(v62 - 7 + v6_Block_object_dispose(va, 8) = vrev64_s8( veor_s8( veor_s8( vrev64_s8( veor_s8( veor_s8( *(int8x8_t *)(v62 - 7 + v68),  *(int8x8_t *)(v54 + v70.val[0].i64[0] - 7)),  veor_s8( *(int8x8_t *)(v55 + v70.val[0].i64[0] - 7),  *(int8x8_t *)(v56 + v70.val[0].i64[0] - 7)))),  (int8x8_t)0x3F3F3F3F3F3F3F3FLL),  vmul_s8( (int8x8_t)*(_OWORD *)&vqtbl4q_s8(v70, (int8x16_t)xmmword_183DC1530),  (int8x8_t)0x505050505050505LL)));
  return ((uint64_t (*)(__n128))(*(void *)(a54 + 8LL * ((11 * (v63 == 0)) ^ a6)) - 12LL))((__n128)xmmword_183DC1530);
}

void sub_183DA925C()
{
}

uint64_t sub_183DA9264()
{
  return (*(uint64_t (**)(void))(v0
                              + 8LL
                              * (int)((((((*(_DWORD *)(v1 - 128) ^ 0x17F) + 1050) ^ 0xFFFFFAC0)
                                      + 43 * (*(_DWORD *)(v1 - 128) ^ 0x17F))
                                     * (*(_DWORD *)(v1 - 120) == *(_DWORD *)(v1 - 124))) ^ *(_DWORD *)(v1 - 128))))();
}

uint64_t sub_183DA92A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v11 = (a4 - 2039916698);
  *(_BYTE *)(v10 + v11) ^= *(_BYTE *)(v6 + (v11 & 0xF)) ^ *(_BYTE *)(v7 + (v11 & 0xF)) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ (5 * (v11 & 0xF)) ^ 0x3F;
  return (*(uint64_t (**)(void))(v9 + 8LL * ((118 * (a4 - 1 == v5)) ^ (a5 - 509))))();
}

void sub_183DA9308()
{
  if (v0 == 654237896) {
    int v1 = -1224190382;
  }
  else {
    int v1 = 1224150410;
  }
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_183DA936C(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int v1 = 3804331 * ((a1 & 0x499EDE0F | ~(a1 | 0x499EDE0F)) ^ 0x4CFFD2A6);
  int v2 = *(_DWORD *)(a1 + 32) + v1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  int v5 = *(_DWORD *)(a1 + 68) - v1;
  int v9 = 2126260673;
  int v10 = 1756409276;
  uint64_t v11 = &v18;
  int v14 = 2126260610;
  int v15 = 1756409276;
  unint64_t v16 = &v8;
  uint64_t v12 = 0x68B0ADBC7EBC2A03LL;
  uint64_t v13 = &v17;
  if (v4 | v3) {
    BOOL v6 = v5 == 381856459;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;
  __asm { BR              X8 }

uint64_t sub_183DA94C0()
{
  BOOL v4 = v1[7] != 0x17980B1E60F15496LL && (v1[3] | v1[6]) != 0LL;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((v4 * (331 * (v0 ^ 0x2AA) - 598)) ^ v0))
}

uint64_t sub_183DA9520@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, char a23)
{
  uint64_t v27 = *v25;
  *(_DWORD *)(v23 - 0x17980B1E60F15496LL) = 0;
  return ((uint64_t (*)(char *, char *, char *, char *))(*(void *)(v26
                                                                             + 8LL
                                                                             * ((878 * (v27 == 0x67843F9A1244BACBLL)) ^ a1))
                                                                 - (a1 + 1166)
                                                                 - (((a1 ^ 0x1ECu) * v24) ^ 0xFFFFFFFFFFFFFFE2LL)))( &a21,  &a15,  &a23,  &a13);
}

uint64_t sub_183DA95CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, char a30, uint64_t a31, char a32)
{
  int v38 = ((2 * (((v37 - 144) ^ 0x16D8BC94) & 0x7EE300A8) - ((v37 - 144) ^ 0x16D8BC94) + 18677589) ^ 0x5B52C1BC) * v32;
  *(_DWORD *)(v37 - 144) = 1557999616 - v38;
  *(void *)(v37 - 136) = &a32 + v34;
  *(_DWORD *)(v37 - 12_Block_object_dispose(va, 8) = v38 + v33 - 1458;
  sub_183DAC950((_DWORD *)(v37 - 144));
  return ((uint64_t (*)(char *, char *, char *, char *))(*(void *)(v35
                                                                             + 8LL * ((v33 + 111) ^ (27 * (v36 == 0))))
                                                                 - 5 * (v33 ^ 0x714u)
                                                                 + 1763LL))( &a28,  &a22,  &a30,  &a20);
}

uint64_t sub_183DA96E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v28 = v22 ^ 0x98;
  int v29 = v22 ^ 0x18;
  int v30 = ((((2 * (v27 - 144)) | 0xFCF84B5C) - (v27 - 144) + 25418322) ^ 0x1EE04785) * v18;
  *(void *)(v27 - 12_Block_object_dispose(va, 8) = v24;
  *(_DWORD *)(v27 - 136) = v28 - v30 - 371;
  *(_DWORD *)(v27 - 116) = v21 - v30 + (v28 ^ 0x51636540);
  *(void *)(v27 - 144) = v19;
  BOOL v31 = v20 != 0;
  ((void (*)(uint64_t))(*(void *)(v25 + 8LL * (v28 - 1621)) - 8LL))(v27 - 144);
  *(void *)(v27 - 144) = v23;
  *(void *)(v27 - 136) = a15;
  *(_DWORD *)(v27 - 12_Block_object_dispose(va, 8) = (v29 - 774) ^ (235795823
                                        * ((((v27 - 144) | 0xB1470161) - (v27 - 144) + ((v27 - 144) & 0x4EB8FE98)) ^ 0x25EA4838));
  ((void (*)(uint64_t))(*(void *)(v25 + 8LL * (v29 ^ 0x6EC)) - 8LL))(v27 - 144);
  *(_DWORD *)(v27 - 120) = v29
                         + 1374699841 * (((v27 - 144) & 0x8FF7030B | ~((v27 - 144) | 0x8FF7030B)) ^ 0x1DFCE4FD)
                         - 758;
  *(void *)(v27 - 112) = a15;
  *(void *)(v27 - 104) = a18;
  *(void *)(v27 - 144) = v23;
  *(void *)(v27 - 136) = a17;
  *(void *)(v27 - 12_Block_object_dispose(va, 8) = a14;
  uint64_t v32 = ((uint64_t (*)(uint64_t))(*(void *)(v25 + 8LL * (v29 - 1638)) - 12LL))(v27 - 144);
}

uint64_t sub_183DA98E8()
{
  int v6 = 108757529 * ((((v5 - 144) | 0x2D06D1B1) - ((v5 - 144) & 0x2D06D1B1)) ^ 0xCD9AB39A);
  *(void *)(v5 - 136) = v8;
  *(void *)(v5 - 12_Block_object_dispose(va, 8) = v4;
  *(_DWORD *)(v5 - 144) = (v3 + 64) ^ v6;
  *(_DWORD *)(v5 - 140) = v1 - v6 + 526601644 + v3 - 635;
  uint64_t result = ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * (v3 - 1206)) - 8LL))(v5 - 144);
  *int v10 = v9;
  *(_DWORD *)(v0 + 64) = -1224190382;
  return result;
}

void sub_183DA9A24(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) ^ (1759421093 * ((-746607788 - (a1 | 0xD37FAB54) + (a1 | 0x2C8054AB)) ^ 0x9FFDE4FF));
  __asm { BR              X15 }

uint64_t sub_183DA9B54()
{
  int v4 = v2 & 0x55470DBF;
  int v5 = (v2 & 0x55470DBF) - 1296;
  if (v1 >= 0) {
    unsigned int v6 = v1;
  }
  else {
    unsigned int v6 = -v1;
  }
  if (v0 >= 0) {
    unsigned int v7 = v0;
  }
  else {
    unsigned int v7 = -v0;
  }
  return (*(uint64_t (**)(void))(v3 + 8LL * (int)((((((v4 + 568567808) & 0xDE1C52EF) + 664) ^ v5) * (v6 > v7)) ^ v4)))();
}

uint64_t sub_183DA9BAC()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((278 * (v1 <= v0 - 45)) ^ (v0 + 451))) - 8LL))();
}

void sub_183DA9BD8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + v2) = 1756409276;
}

void sub_183DAAAD4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((2 * (a1 & 0x5E99CC2A) - a1 - 1587137579) ^ 0xAB923DFA);
  if (*(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL) - 1756409276 >= 0) {
    unsigned int v2 = *(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL) - 1756409276;
  }
  else {
    unsigned int v2 = 1756409276 - *(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL);
  }
  if (*(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL) - 1756409276 >= 0) {
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL) - 1756409276;
  }
  else {
    unsigned int v3 = 1756409276 - *(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL);
  }
  uint64_t v6 = *(void *)a1;
  unsigned int v5 = v1 + 535753261 * (((&v5 | 0x96489038) - (&v5 & 0x96489038)) ^ 0x9CBC9E17) + 648;
  sub_183DA2F4C((uint64_t)&v5);
  if (v2 >= v3) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = v2;
  }
  __asm { BR              X13 }

uint64_t sub_183DAAC4C()
{
  int v4 = v1 + 144 + v2 - 1602371374;
  BOOL v6 = v4 <= ((v1 - 512) ^ 0x299622DC) && v4 >= v3 - 1449778402;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((43 * v6) ^ v1)) - 8LL))();
}

uint64_t sub_183DAACA0()
{
  BOOL v5 = v2 - 1584126565 > 34 * (v1 ^ 0x446) + 715948167 || v2 - 1584126565 < v3 - 1431534698;
  return (*(uint64_t (**)(void))(v0
                              + 8LL
                              * ((4 * (((v1 - 6) ^ v5) & 1)) & 0xDF | (32
                                                                                      * (((v1 - 6) ^ v5) & 1)) | v1)))();
}

uint64_t sub_183DAAD00()
{
  BOOL v3 = v1 == ((2 * v2) ^ 0x6B1FA4C9B8D7DA5DLL);
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (((8 * v3) | (16 * v3)) ^ v2)) - ((v2 - 42) ^ 0x2E8LL)))();
}

uint64_t sub_183DAAD4C()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * (int)((((((2 * v1) ^ 0x744) + 990577740) & 0xC4F4FDBE ^ 0x3F1)
}

uint64_t sub_183DAAD9C@<X0>(uint64_t a1@<X8>)
{
  BOOL v6 = v4 - 427094189 < 1872981326;
  unsigned int v7 = (**(_DWORD **)(a1 - 0x67843F9A1244BAC3LL) ^ 0x9BFF6A14) + 1;
  **(_DWORD **)(a1 - 0x67843F9A1244BAC3LL) = v7 + ((v2 + 1356137234) & 0xAF2AFEF9 ^ (v3 - 1144)) - (v5 & (2 * v7));
  if (v4 - 427094189 < 1872981326) {
    BOOL v6 = v4 - 427094189 > -274502321;
  }
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((54 * !v6) ^ (v2 + 70))) - 12LL))();
}

void sub_183DAAE78()
{
}

uint64_t sub_183DAAE84@<X0>(uint64_t a1@<X8>)
{
  int v10 = v2 - 1410374826;
  int v11 = v3 - 777;
  uint64_t v12 = 4LL * (v6 + v4);
  int v13 = (*(_DWORD *)(*(void *)(v9 - 0x67843F9A1244BAC3LL) + v12) ^ v5)
      - (*(_DWORD *)(*(void *)(v8 - 0x67843F9A1244BAC3LL) + v12) ^ v5);
  *(_DWORD *)(*(void *)(a1 - 0x67843F9A1244BAC3LL) + v12) = v5
                                                            + ((v11 - 1899377359) & 0x713633D3)
                                                            + v13
                                                            - (v7 & (2 * v13))
                                                            - 961;
  BOOL v15 = v6 - 1562966692 > 737108821 || v6 - 1562966692 < v10;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((1913 * v15) ^ v11)))();
}

uint64_t sub_183DAAFA8@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  uint64_t v12 = 4LL * (v9 + v7);
  int v13 = v3 + 1193812926 + (*(_DWORD *)(*(void *)(v11 - 0x67843F9A1244BAC3LL) + v12) ^ (v8 + 65 * (v5 ^ 0x1D0) - 1105));
  *(_DWORD *)(*(void *)(a2 - 0x67843F9A1244BAC3LL) + v12) = v13 + v8 - (v10 & (2 * v13));
  int v14 = v4 + v9 + 1106;
  BOOL v16 = v14 <= a1 + 65 && v14 >= v6;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((555 * v16) ^ v5)) - 8LL))();
}

uint64_t sub_183DAB088@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  uint64_t v12 = 4LL * (v9 + v7);
  unsigned int v13 = v3 + 1193812927 + (*(_DWORD *)(*(void *)(v11 - 0x67843F9A1244BAC3LL) + v12) ^ 0x9BFF6A14);
  *(_DWORD *)(*(void *)(a2 - 0x67843F9A1244BAC3LL) + v12) = v13 + v8 - (v10 & (2 * v13));
  int v14 = v9 + 1 + v4;
  BOOL v16 = v14 <= a1 + 782 && v14 >= v6;
  return (*(uint64_t (**)(void))(v2 + 8LL * ((1342 * v16) ^ v5)))();
}

uint64_t sub_183DAB168()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_183DAB1D8@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((1500
                                          * (*(_DWORD *)(*(void *)(a1 - 0x67843F9A1244BAC3LL)
                                                       + 4LL * (v3 + v5 + ((((v2 - 520) | 0x201) - 237) | 8u) - 653)) == v4)) ^ ((v2 - 520) | 0x201)))
                            - 12LL))();
}

uint64_t sub_183DAB234()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * (v1 ^ (((v3 + v2 - 2) < 0x7FFFFFFF) | (8
}

uint64_t sub_183DAB26C()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((1500 * (*(_DWORD *)(v2 + 4LL * (v4 + v6 + (v3 | 8u) - 653)) == v5)) ^ v1))
                            - 12LL))();
}

void sub_183DAB2A4(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x67843F9A1244BAC7LL) = (((v3 + v2) * (v1 - 764407773)) ^ 0xEAF5FDBE)
                                         + 2109386750
                                         + ((2 * (v3 + v2) * (v1 - 764407773)) & 0xD5EBFB7C);
}

void sub_183DAB330(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_183DAB398()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((11 * (v1 != 1534814542)) ^ 0x134u)) - 8LL))();
}

uint64_t sub_183DAB3CC@<X0>(uint64_t a1@<X8>)
{
  int v4 = v1 - (**(_BYTE **)(v3 + 8) == 0);
  *(_DWORD *)(*(void *)(v2 + 96) + 528LL) = 2126260673;
  *(_DWORD *)(*(void *)(v2 + 96) + 532LL) = 1756409276;
  *(void *)(*(void *)(v2 + 96) + 536LL) = *(void *)(v2 + 96) + 544LL;
  uint64_t v5 = *(void *)(v2 + 96) + 0x67843F9A1244BCDBLL;
  uint64_t v6 = *(void *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  unsigned int v7 = 108757529 * ((&v10 & 0xE05670F8 | ~(&v10 | 0xE05670F8)) ^ 0xFF35ED2C);
  unsigned int v11 = 1404 - v7;
  int v14 = v4 - v7 + 212509996;
  uint64_t v12 = v6;
  uint64_t v10 = v5;
  ((void (*)(uint64_t *))(*(void *)(a1 + 1232) - 8LL))(&v10);
  int v8 = v13;
  *(void *)(*(void *)(v2 + 96) + 512LL) = *(void *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  return (v8 - 1945922183);
}

void sub_183DAB534()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  int v1 = *(_DWORD *)(v0 + 16) ^ (3804331 * (v0 ^ 0xFA9EF356));
  __asm { BR              X13 }

uint64_t sub_183DAB698@<X0>( uint64_t *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, char a28, uint64_t a29, char a30, uint64_t a31, char a32, uint64_t a33, char a34, uint64_t a35, char a36)
{
  uint64_t v42 = &a30 + v36;
  int v57 = &a32 + v36;
  uint64_t v56 = &a26 + v36;
  uint64_t v55 = &a22 + v36;
  uint64_t v54 = &a28 + v36;
  uint64_t v53 = &a36 + v36;
  BOOL v52 = &a20 + v36;
  int v43 = &a34 + v36;
  uint64_t v44 = *a1;
  uint64_t v60 = a1[5];
  uint64_t v45 = a1[3];
  uint64_t v46 = *(void *)(v45 - 0x7A1D52918E41688LL);
  int v58 = v38 - 53;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = *a1;
  *(void *)(v41 - 120) = v46;
  *(_DWORD *)(v41 - 104) = (v38 - 53) ^ (1759421093
                                       * ((((v41 - 144) | 0x90533A3F) + (~(v41 - 144) | 0x6FACC5C0)) ^ 0x232E8A6A));
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = a2;
  *(void *)(v41 - 112) = v42;
  int v59 = (void (*)(uint64_t))(*(void *)(v37 + 8LL * (v38 ^ 0x6F)) - 8LL);
  uint64_t v47 = (8 * v38) ^ 0x6E0u;
  int v48 = v38;
  v59(v41 - 144);
  *(void *)(v41 - 144) = v44;
  *(void *)(v41 - 136) = v42;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v45;
  *(void *)(v41 - 112) = v43;
  *(_DWORD *)(v41 - 120) = v48
                         + 535753261 * (((v41 - 144) & 0xC0CD3BC0 | ~((v41 - 144) | 0xC0CD3BC0)) ^ 0x35C6CA10)
                         + 1474;
  ((void (*)(uint64_t))((char *)*(&off_189D4D580 + (v48 ^ 0x3D)) - 12))(v41 - 144);
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = v43;
  *(void *)(v41 - 120) = v42;
  *(void *)(v41 - 112) = v57;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093
                                * ((2042783795 - ((v41 - 144) | 0x79C26833) + ((v41 - 144) | 0x863D97CC)) ^ 0x35402798));
  v59(v41 - 144);
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093
                                * ((-1338916292 - ((v41 - 144) | 0xB031C23C) + ((v41 - 144) | 0x4FCE3DC3)) ^ 0xFCB38D97));
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = v43;
  *(void *)(v41 - 120) = v57;
  *(void *)(v41 - 112) = v56;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  v59(v41 - 144);
  *(void *)(v41 - 120) = v56;
  *(void *)(v41 - 112) = v55;
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = v43;
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093
                                * ((((v41 - 144) ^ 0xE55F5312 | 0x3F0CA017)
                                  - ((v41 - 144) ^ 0xE55F5312)
                                  + (((v41 - 144) ^ 0xE55F5312) & 0xC0F35FE8)) ^ 0x692E4351));
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  v59(v41 - 144);
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  *(void *)(v41 - 120) = v55;
  *(void *)(v41 - 112) = v54;
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093
                                * (((((v41 - 144) ^ 0x4410A060 | 0xB8EC0A9A) ^ 0xFFFFFFFE)
                                  - ((v41 - 144) ^ 0xB068020A | 0x4713F565)) ^ 0xB8FAEDC1));
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = v43;
  v59(v41 - 144);
  int v49 = 2 * (v41 - 144);
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093 * (((v49 | 0x61EEB7B6) - (v41 - 144) + 1325966373) ^ 0x38AEB8F));
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = v43;
  *(void *)(v41 - 120) = v54;
  *(void *)(v41 - 112) = v53;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  v59(v41 - 144);
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093 * (((v49 | 0xFE53413A) - (v41 - 144) - 2133434525) ^ 0xCC5410C9));
  *(void *)(v41 - 144) = v45;
  *(void *)(v41 - 136) = v43;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  *(void *)(v41 - 120) = v53;
  *(void *)(v41 - 112) = v52;
  v59(v41 - 144);
  *(void *)(v41 - 120) = v52;
  *(void *)(v41 - 112) = v43;
  *(void *)(v41 - 136) = v43;
  *(void *)(v41 - 12_Block_object_dispose(va, 8) = v44;
  *(_DWORD *)(v41 - 104) = v58 ^ (1759421093 * (((v41 - 144) & 0xE555CBF3 | ~((v41 - 144) | 0xE555CBF3)) ^ 0xA9D78458));
  *(void *)(v41 - 144) = v45;
  v59(v41 - 144);
  *(void *)(v41 - 144) = *(void *)(v45 - 0x7A1D52918E41690LL);
  *(void *)(v41 - 136) = v39;
  *(_DWORD *)(v41 - 12_Block_object_dispose(va, 8) = (v48 + 104) ^ (108757529
                                        * ((((v41 - 144) | 0x21D9D694) - (v41 - 144) + ((v41 - 144) & 0xDE262968)) ^ 0xC145B4BF));
  sub_183D7B048(v41 - 144);
  *(void *)(v41 - 136) = v60;
  *(_DWORD *)(v41 - 140) = v48 + 460628867 * ((v41 - 522470134 - 2 * ((v41 - 144) & 0xE0DBBD9A)) ^ 0xAC4D3FE7) + 685;
  uint64_t v50 = sub_183D7B234(v41 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v40
                                                      + 8LL
                                                      * ((((*(_DWORD *)(v41 - 144) - 845240499) < 0x7FFFFFFF)
                                                        * (v48 - 203)) | v48))
                                          - (v47 ^ 0x1C4)))(v50);
}

uint64_t sub_183DABBFC()
{
  int v5 = 460628867 * ((((v4 - 144) | 0x2522441F) - ((v4 - 144) & 0x2522441F)) ^ 0x69B4C662);
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = v5 + v1 - 192;
  *(_DWORD *)(v4 - 144) = 1557934080 - v5;
  *(void *)(v4 - 136) = v8;
  sub_183DAC950((_DWORD *)(v4 - 144));
  *(void *)(v4 - 120) = v0;
  *(void *)(v4 - 112) = v0;
  *(void *)(v4 - 144) = v3;
  *(void *)(v4 - 136) = v8;
  *(_DWORD *)(v4 - 104) = (v1 - 214) ^ (1759421093
                                      * ((((v4 - 144) | 0x5FD26FEB) + (~(v4 - 144) | 0xA02D9014)) ^ 0xECAFDFBE));
  *(void *)(v4 - 12_Block_object_dispose(va, 8) = v2;
  v9(v4 - 144);
  *(void *)(v4 - 144) = v0;
  *(void *)(v4 - 136) = v7;
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = (58 * (v1 ^ 0x180) + 42) ^ (108757529
                                                    * ((2 * ((v4 - 144) & 0x10B13918) - (v4 - 144) + 1867433699) ^ 0x8FD2A4C8));
  return sub_183D7B048(v4 - 144);
}

uint64_t sub_183DAC950(_DWORD *a1)
{
  unsigned int v1 = 460628867 * ((2 * (a1 & 0x1FF5D3B4) - (_DWORD)a1 - 536204213) ^ 0xAC9CAE36);
  unsigned int v2 = a1[4] - v1;
  unsigned int v3 = v1 + *a1;
  unsigned int v5 = v3 - 1557934079;
  BOOL v4 = (int)(v3 - 1557934079) < 0;
  LODWORD(v6) = 1557934079 - v3;
  if (v4) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = v5;
  }
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + (int)(v2 ^ 0x9F))
                                        + 8 * (int)((461 * (v6 != ((2 * (_DWORD)v6) & 0xA9D664B4))) ^ v2)
                                        - 12)
                            - 4LL))();
}

void sub_183DACA08(int a1@<W8>)
{
  **(_DWORD **)(v1 - 0x67843F9A1244BAC3LL) = (v2 + 1424699994) ^ 0x30EBA7B1;
  *(_DWORD *)(v1 - 0x67843F9A1244BAC7LL) = a1 + 1;
}

void sub_183DACA60(uint64_t a1)
{
  unint64_t v2 = (qword_18C66B2A8 - qword_18C66B2B0) ^ (unint64_t)&v3;
  qword_18C66B2B0 = 1045096823 * (v2 + 0x1159CE8E9813C2FLL);
  qword_18C66B2A8 = 1045096823 * (v2 ^ 0xFEEA6317167EC3D1LL);
  ((void (*)(char *, void (*)()))*(&off_189D4D580
                                            + ((119
                                                                             * ((qword_18C66B2A8 - qword_18C66B2B0) ^ 0xD1)) ^ byte_183DC8FC0[byte_183DC5780[(119 * ((qword_18C66B2A8 - qword_18C66B2B0) ^ 0xD1))] ^ 0xE5])
                                            + 38))( (char *)*(&off_189D4D580 + ((119 * ((qword_18C66B2A8 + qword_18C66B2B0) ^ 0xD1)) ^ byte_183DC91C0[byte_183DC5980[(119 * ((qword_18C66B2A8 + qword_18C66B2B0) ^ 0xD1))] ^ 0xE3])
            - 197)
  - 8,
    sub_183DBA478);
  __asm { BR              X9 }

uint64_t sub_183DACB84@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL * ((1743 * (*(void *)(*(void *)(v1 + 952) - 4LL) != 0LL)) ^ 0x211u))
                            - 4LL))();
}

uint64_t sub_183DACBC4()
{
  return (*(uint64_t (**)(uint64_t))(v1 + 1608))(v0);
}

  ;
}

void sub_183DACBEC(_DWORD *a1)
{
  unsigned int v1 = 1224239923 * (((a1 | 0xC16B5AED) - (a1 & 0xC16B5AED)) ^ 0x33D8A73A);
  unsigned int v2 = *a1 + v1;
  __asm { BR              X14 }

uint64_t sub_183DACCAC@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = 1178560073 * (&v7 ^ 0xBA947862);
  int v7 = v3 - v5 + 540;
  int v9 = v5 - v2 - ((((v3 + 1894818124) & 0xF0F5FB9 ^ 0x1185F413) - v4) & 0x10657DF6) + 1626716880;
  uint64_t v8 = v1;
  return ((uint64_t (*)(int *))(*(void *)(a1 + 8LL * (v3 - 519)) - 8LL))(&v7);
}

void sub_183DACE08(_DWORD *a1)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  unsigned int v2 = a1[7] + 3804331 * ((((2 * (_DWORD)a1) | 0x5B2BA828) - (_DWORD)a1 - 764793876) ^ 0xD70B2742);
  unsigned int v30 = a1[8] ^ (3804331 * ((((2 * (_DWORD)a1) | 0x5B2BA828) - (_DWORD)a1 - 764793876) ^ 0xD70B2742));
  int v3 = a1[2];
  unint64_t v20 = 3804331
      * ((((2LL * (void)a1) | 0xC140CD485B2BA828LL) - (void)a1 + 0x1F5F995BD26A2BECLL) ^ 0x892B1DF1D70B2742LL);
  int v4 = v3 + 3804331 * ((((2 * (_DWORD)a1) | 0x5B2BA828) - (_DWORD)a1 - 764793876) ^ 0xD70B2742);
  unsigned int v5 = 628203409 * ((v36 - 571354846 - 2 * (v36 & 0xDDF1D122)) ^ 0x5F79DD11);
  uint64_t v29 = v2 ^ 0x6FC;
  v36[0] = v2 + v5 + 1172345356;
  v36[2] = v5 + 1252841699;
  uint64_t v24 = &STACK[0x14F8B44E17D22862];
  uint64_t v37 = &STACK[0x14F8B44E17D22862];
  sub_183DA2A04((uint64_t)v36);
  unsigned int v6 = v30;
  int v7 = a1;
  uint64_t v8 = (char *)*(&off_189D4D580 + (int)(v2 + 11)) - 12;
  uint64_t v26 = *(void *)&v8[8 * v2] - 12LL;
  int v16 = v4 + 1030429907;
  int v15 = -1122899019;
  int v19 = v4 - 2132422401;
  int v13 = v4 - 2133379408;
  int v11 = v4 - 1750200824;
  int v12 = v29 + 8257247;
  uint64_t v10 = (char *)&v10 - 667602245;
  unsigned int v14 = v2 - 1911001176;
  unsigned int v18 = v2 + 754409068;
  uint64_t v17 = v2 + 754409068;
  uint64_t v28 = v17;
  int v21 = v7;
  unsigned int v27 = v2;
  int32x4_t v22 = vdupq_n_s32(0xB7085652);
  int32x4_t v23 = vdupq_n_s32(0x37085657u);
  uint64_t v25 = *((void *)v7 + 2);
  int v9 = v6 - ((2 * v6 + 1781265950) & (v29 - 48200663)) - 1280950147;
  char v31 = (HIBYTE(v9) ^ 0xFE) - ((((v2 ^ 0xFC) + 71) ^ 0x84) & (2 * (HIBYTE(v9) ^ 0xFE))) + 63;
  char v32 = (BYTE2(v9) ^ 0x90) - 2 * ((BYTE2(v9) ^ 0x90) & 0x3F) + 63;
  LOBYTE(v6) = ((unsigned __int16)(v6 - ((2 * v6 - 2530) & ((v2 ^ 0x6FC) - 31703)) + 16509) >> 8) ^ 0x45;
  char v33 = v6 - 2 * (v6 & 0x3F) + 63;
  char v34 = v9 ^ 0x51;
  __asm { BR              X13 }

uint64_t sub_183DAD1B8(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v9 = v7 + ((v4 + 286) ^ 0xC005610A);
  if (v9 <= 0x40) {
    unsigned int v9 = 64;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 8LL * (((a1 - v5 - v6 + v9 + 172 > 0xE) * (((v4 - 760) | 0x260) - 99)) ^ v4))
                                                                                       - 8LL))( 4294967216LL,  3221577994LL,  3446643619LL,  a4,  1073388098LL,  848323677LL);
}

uint64_t sub_183DAD248(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v11 = a2 + v6 + v5;
  int v12 = v11 + 1032;
  BOOL v13 = __CFADD__(v11 + 1031, v9 + v8 + ((v7 + 893921749) & 0xCAB7D2BE ^ a5) + v12);
  return (*(uint64_t (**)(void))(v10 + 8LL * (v7 | (4 * v13))))();
}

uint64_t sub_183DAD2B4@<X0>( uint64_t a1@<X3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, arg24_183DAD2B4 a24)
{
  *(_OWORD *)(a1 + a2 + ((v24 + 436) ^ v26)) = *(_OWORD *)&a24.arr[4];
  return ((uint64_t (*)(void))(*(void *)(v27
                                        + 8LL
                                        * (((((v25 + 1) & 0x1FFFFFFF0LL) == 16) << 6) | ((((v25 + 1) & 0x1FFFFFFF0LL) == 16) << 8) | v24))
                            - 4LL))();
}

void sub_183DAD308()
{
}

uint64_t sub_183DAD31C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X6>, int a3@<W8>)
{
  int v8 = 35 * ((v6 - 1301) ^ 0x18F);
  *(_BYTE *)(a1 + (v8 ^ (v4 + 1592)) + v5) = v3;
  *(_BYTE *)(a1 + (a3 - 1039175822)) = *(_BYTE *)(a2 + 1);
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * ((v8 - 516) ^ 0x4B0 ^ v8)) - 8LL))();
}

uint64_t sub_183DAE8B4@<X0>(uint64_t a1@<X3>, uint64_t a2@<X6>, int a3@<W8>)
{
  *(_BYTE *)(a1 + (a3 - 1039175821)) = *(_BYTE *)(a2 + ((v4 ^ 0xFFFFFDACLL) & (v5 + 3446643621LL)));
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (int)(v4 ^ (1912 * ((v3 + 3) < 4)))) - 8LL))();
}

uint64_t sub_183DAE914@<X0>( uint64_t a1@<X3>, uint64_t a2@<X6>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t (*a20)(uint64_t))
{
  *(_BYTE *)(a1 + (a3 + 2)) = *(_BYTE *)(a2 + ((v21 ^ 0xFFFFFFB0LL) & (v20 + 2)));
  int v24 = 3804331 * ((2 * ((v23 - 168) & 0x80D3920) - (v23 - 168) + 2012399321) ^ 0x8D6C358F);
  *(_DWORD *)(v23 - 16_Block_object_dispose(va, 8) = v24 + v21 + 927;
  *(_DWORD *)(v23 - 164) = v24 ^ 0x1754DCEE;
  *(void *)(v22 + 384) = a18;
  uint64_t v25 = sub_183D97840(v23 - 168);
  return a20(v25);
}

uint64_t sub_183DAE9A0()
{
  return ((uint64_t (*)(uint64_t))(*(void *)(v1
                                                      + 8LL
                                                      * (int)((((v0 - 667602481) > 0x37)
                                                             * ((v2 + 1503017887) & 0xA669C53D ^ 0x136)) ^ (v2 + 156)))
                                          - 4LL))(50LL);
}

uint64_t sub_183DAE9FC@<X0>(int a1@<W8>)
{
  unint64_t v4 = (a1 ^ 0x163u ^ (unint64_t)(v2 - 48)) + v1;
  if (v4 <= 0x38) {
    unint64_t v4 = 56LL;
  }
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((31 * (v4 - v1 + 667602481 >= ((a1 + 1656128963) & 0x9D497D7E ^ 0x466uLL))) ^ a1))
                            - 4LL))();
}

uint64_t sub_183DAEA78( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a9 + v10) = v13;
}

uint64_t sub_183DAEACC(int a1, uint64_t a2)
{
  *(void *)(v4 + v6) = v8;
  return ((uint64_t (*)(void))(*(void *)(v7 + 8LL * (((v5 != v6) * a1) ^ v2)) - (v3 ^ a2)))();
}

uint64_t sub_183DAEAF4()
{
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((477 * (((v0 == v1) ^ v2) & 1)) ^ v2)) - 4LL))();
}

uint64_t sub_183DAEB34@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a1 + a2 + v4) = v3;
}

void sub_183DAEB64()
{
}

uint64_t sub_183DAEDA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, int a49, __int16 a50,char a51,char a52,int a53)
{
  if (a28 == 2) {
    return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v53 + 8LL
  }
                                                                       * ((15 * (a53 == 356758273)) ^ (v54 + 1203)))
                                                     - ((641 * (v54 ^ 0x4Du)) ^ 0x50ELL)))( a18,  a14);
  if (a28 == 1) {
    return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v53
  }
                                                                 + 8LL
                                                                 * (((a53 != 356758273) * ((431 * (v54 ^ 0x4C)) ^ 0x56C)) ^ (v54 + 1214)))
                                                     - 12LL))( a18,  a14);
  uint64_t v56 = (v54 - 43) | 0x310u;
  unint64_t v57 = ((unint64_t)&a31 ^ 0x5FF9EFF7C67D3EC3LL ^ v56)
      + ((2LL * (void)&a31) & 0xBFF3DFEF8CFA7BE0LL)
      - 0xF880960022833F7LL;
  a52 = ((((v54 - 43) | 0x10) - 41) ^ v57 ^ 0xB1) * (v57 + 17);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8LL * (int)v56))(a18, a14);
}

void sub_183DAF0F4()
{
}

uint64_t sub_183DAF0FC( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34, uint64_t a35, int a36, char a37)
{
  uint64_t v43 = *a1;
  int v44 = 235795823 * ((379724816 - ((v41 - 168) | 0x16A22410) + ((v41 - 168) | 0xE95DDBEF)) ^ 0x7DF092B6);
  v37[47] = &a37;
  v37[52] = &STACK[0x17594DE918184AAB];
  v37[49] = &a34;
  v37[50] = v43;
  *(_DWORD *)(v41 - 160) = v44 + 1126269761;
  *(_DWORD *)(v41 - 132) = (v40 + 1510) ^ v44;
  uint64_t v45 = ((uint64_t (*)(uint64_t))(*(void *)(v42 + 8LL * (v40 - 172)) - 4LL))(v41 - 168);
}

uint64_t sub_183DAF204()
{
  uint64_t v7 = v0 + 1;
  int v9 = (v6 ^ (((v4 - 1583) | 0xD) - 8421510)) + 2147024767 + ((2 * v6) & 0xFEFEFF92) != 2138603336 || v7 == v2 + 16;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((v9 | (v9 << 7)) ^ v4)) - 8LL))();
}

uint64_t sub_183DAF290@<X0>(int a1@<W8>)
{
  uint64_t v5 = 1759421093 * ((v4 - 168 - 2 * ((v4 - 168) & 0x3CEE76D65605C96LL) + 0x3CEE76D65605C96LL) ^ 0x2D70263DD61DECC2LL);
  *(void *)(v2 + 400) = v1 - v5;
  *(_DWORD *)(v4 - 160) = a1 - v5 + 2021363698;
  *(_DWORD *)(v4 - 156) = ((a1 + 1051201844) ^ 0x37) - v5;
  *(_DWORD *)(v4 - 16_Block_object_dispose(va, 8) = ((a1 + 1051201844) | 0x7C) + v5;
  *(_DWORD *)(v4 - 164) = a1 + 1051201844 - v5;
  *(void *)(v2 + 416) = 2138603336 - v5;
  *(_DWORD *)(v4 - 152) = v5;
  uint64_t v6 = ((uint64_t (*)(uint64_t))((char *)*(&off_189D4D580 + a1 + 20) - 12))(v4 - 168);
  return (*(uint64_t (**)(uint64_t))(v3 + 8LL * *(int *)(v4 - 136)))(v6);
}

void sub_183DAF35C()
{
  *(_DWORD *)(v0 + 12) = -1224190382;
}

void sub_183DAF3A8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }

uint64_t sub_183DAF3EC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v2 + 8LL * ((1832 * (**(_BYTE **)(a2 + 8) == 0)) ^ v3)))();
}

uint64_t sub_183DAF414()
{
  int v2 = v1 - ((2 * v1 + 151596386) & 0x2BFCC076) - 1165822228;
  return (*(uint64_t (**)(void))(v0
                              + 8LL
                              * ((1374
                                * (((2 * v2) & 0xFE7AFFF2 ^ 0x2A78C072) + (v2 ^ 0x6AC31FC2) - 621565440 != 1513171449)) ^ 0x183u)))();
}

uint64_t sub_183DAF4C8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((298 * (a4 + v5 + ((v6 + 307524433) & 0xEDAB8F7D) - 2134737766 > 7)) ^ v6))
                            - ((v6 + 1281750749) & 0xB39A0DF7)
                            + 1391LL))();
}

uint64_t sub_183DAF548(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((232
                                          * (v6 - a5 + ((a3 - 1823858049) & 0x6CB5DEFF ^ 0xFFFFFFFFFFFFFD83LL) >= ((a3 - 824678788) & 0x3127977D ^ 0x34DuLL))) ^ a3))
                            - 12LL))();
}

uint64_t sub_183DAF5B4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  BOOL v6 = v5 < (((a4 - 962) | 8) ^ 0x318);
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((4 * (((a4 ^ v6) & 1) == 0)) & 0xF7 | (8
                                                                      * ((a4 ^ ~v6) & 1)) | a4)))();
}

uint64_t sub_183DAF5F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v10 = v9 + (((a4 ^ 0x4C061D4E) - 1275467144) ^ (v6 - 1492));
  __int128 v11 = *(_OWORD *)(v5 + v10 - 15);
  __int128 v12 = *(_OWORD *)(v5 + v10 - 31);
  uint64_t v13 = v7 + v10;
  *(_OWORD *)(v13 - 15) = v11;
  *(_OWORD *)(v13 - 31) = v12;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4
                                                               + 8LL
                                                               * ((586 * ((v8 & 0xFFFFFFE0) == 32)) ^ ((a4 ^ 0x4C061D4E) - 1275467562)))
                                                   - 8LL))( a1,  a2);
}

void sub_183DAF660()
{
}

uint64_t sub_183DAF66C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(a1 + 96) + 1424LL) = v2 - 1617910126 + ((v3 - 811599473) & 0x7C661FBF);
  *(void *)(*(void *)(a1 + 96) + 520LL) = *(void *)(a2 + 8) + 1LL;
  return 0LL;
}

void sub_183DAF83C(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 24) - 460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86);
  uint64_t v3 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL) - 1756409276 >= 0) {
    unsigned int v4 = *(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL) - 1756409276;
  }
  else {
    unsigned int v4 = 1756409276 - *(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL);
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v2 - 0x67843F9A1244BAC7LL) - 1756409276 >= 0) {
    unsigned int v5 = *(_DWORD *)(v2 - 0x67843F9A1244BAC7LL) - 1756409276;
  }
  else {
    unsigned int v5 = 1756409276 - *(_DWORD *)(v2 - 0x67843F9A1244BAC7LL);
  }
  unsigned int v7 = v1 + 535753261 * (((&v7 | 0xD1164399) - (&v7 & 0xD1164399)) ^ 0xDBE24DB6) + 373;
  uint64_t v8 = v3;
  sub_183DA2F4C((uint64_t)&v7);
  if (v4 >= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  __asm { BR              X13 }

uint64_t sub_183DAF9DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v21 = 3 * (v13 ^ 0x2D6);
  uint64_t v22 = 4LL * (v18 + v14);
  unsigned int v23 = v17
      + 1132050804
      + (*(_DWORD *)(*(void *)(v16 - 0x67843F9A1244BAC3LL) + v22) ^ v19)
      + ((v21 + 83110416) & 0xFB0BD2FD ^ (v19 - 165) ^ *(_DWORD *)(*(void *)(a11 - 0x67843F9A1244BAC3LL) + v22));
  *(_DWORD *)(*(void *)(v20 - 0x67843F9A1244BAC3LL) + v22) = v23 + v19 - (v15 & (2 * v23));
  BOOL v24 = v18 + 1850643768 < (int)(v12 + 2022682432);
  if (v12 > 0x77050BF != v18 + 1850643768 < -124801216) {
    BOOL v24 = v12 > 0x77050BF;
  }
  return (*(uint64_t (**)(void))(v11 + 8LL * ((124 * v24) ^ v21)))();
}

uint64_t sub_183DAFB08()
{
  BOOL v4 = v2 + 710410702 < (int)(v3 + v1 + 754 + 882448440);
  return (*(uint64_t (**)(void))(v0 + 8LL * ((28 * !v4) ^ v1)))();
}

uint64_t sub_183DAFB88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  BOOL v15 = v13 - 1770035188 > 549487124 || v13 - 1770035188 < a11 + ((v12 + 252) | 0x181) - 240 - 1597997750;
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((127 * v15) ^ v12)) - 8LL))();
}

uint64_t sub_183DAFBE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v23 = v16 - 397;
  uint64_t v24 = 4LL * (v20 + v17);
  int v25 = v19 + v12 + v23 + 637 + (*(_DWORD *)(*(void *)(a11 - 0x67843F9A1244BAC3LL) + v24) ^ v21) - 1467;
  *(_DWORD *)(*(void *)(v22 - 0x67843F9A1244BAC3LL) + v24) = v25 + v21 - (v18 & (2 * v25));
  int v26 = v20 + 1 + v13;
  BOOL v28 = v26 > v14 || v26 < v15;
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((2037 * v28) ^ v23)) - 8LL))();
}

uint64_t sub_183DAFCA8()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * (((v1 != 0x6C7801764379B974LL) * (309 * (v2 ^ 0x5B8) - 803)) ^ v2)))();
}

void sub_183DAFCE4()
{
  *(_DWORD *)(*(void *)(v5 - 0x67843F9A1244BAC3LL) + 4LL * (v4 + v2)) = v0
                                                                        - ((2 * v0 + 2030865688) & v3)
                                                                        + v1
                                                                        + 545707708;
  *(_DWORD *)(v5 - 0x67843F9A1244BAC7LL) = (((v4 + 1 + v2) * (v6 - 764407773)) ^ 0xFAB3FDFE)
                                         + 1845276606
                                         + ((2 * (v4 + 1 + v2) * (v6 - 764407773)) & 0xF567FBFC);
}

void sub_183DAFE8C(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_183DAFED0(uint64_t a1)
{
  int v3 = (*(uint64_t (**)(void))(v1 + 1352))();
  if (v3 == 16) {
    unsigned int v4 = -42029;
  }
  else {
    unsigned int v4 = -42030;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  (*(void (**)(uint64_t))(v1 + 1808))(a1);
  return v5;
}

void sub_183DAFF18(uint64_t a1)
{
  int v1 = 235795823 * (((a1 | 0xDF39865F) - a1 + (a1 & 0x20C679A0)) ^ 0x4B94CF06);
  int v2 = *(_DWORD *)(a1 + 24) - v1;
  int v3 = *(_DWORD *)(a1 + 8) + v1;
  BOOL v5 = (v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 570425344;
  __asm { BR              X11 }

uint64_t sub_183DAFFFC@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, unint64_t *a7, char a8, unsigned int a9, unint64_t *a10, unint64_t *a11, int a12, uint64_t a13)
{
  unsigned int v17 = 1374699841 * ((((2 * &a6) | 0xEF076246) - &a6 + 142364381) ^ 0x9A77A92A);
  a13 = *v14;
  a8 = (65 * ((((2 * &a6) | 0x46) - &a6 - 35) ^ 0x2A)) | 6;
  a10 = &STACK[0x27EFF0CD9F36B473];
  a11 = &STACK[0x3AA4CED55BA13F99];
  a12 = v16 - v17 + 848;
  a9 = (v13 ^ 0x8EBD3711) - v17 - 92278278 + ((v13 << ((v16 - 24) & 0xE0 ^ 0x81)) & 0x5B4AFFDE ^ 0x420091DC);
  a7 = &STACK[0x42E48BBDD224DE5C];
  uint64_t v18 = (*(uint64_t (**)(int *))(a1 + 8LL * (v16 ^ 0xAB)))(&a6);
  return ((uint64_t (*)(uint64_t))(*(void *)(v15 + 8LL * ((13 * (a6 != -1224190382)) ^ v16)) - 12LL))(v18);
}

uint64_t sub_183DB0140()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * (((((v2 ^ 0x93) + 1193) ^ (63 * (v2 ^ 0x93))) * (v1 == 570425344)) | v2)))();
}

uint64_t sub_183DB0178( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v12 + 8LL * ((120 * (a11 + 4 < a11)) ^ v11))
                                                   - ((v11 - 439) | 0x101u)
                                                   + 1003LL))( a1,  a2);
}

uint64_t sub_183DB01E8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * (((((v0 - 1069) ^ 0x2E9) - 141)
                                * ((((v0 + 936576702) & 0xC82CF596 ^ 0xFE7E4B54) & (2 * v1) ^ 0xF22C0842)
                                 + (v1 ^ 0x6E9B14E)
                                 - 301998344 != 1832846371)) ^ (v0 - 1069))))();
}

uint64_t sub_183DB0268()
{
  return (*(uint64_t (**)(void))(v3 + 8LL * ((((v0 + v1 + v2 - 2134844973) < 0xC) * (v2 - 247)) ^ v2)))();
}

uint64_t sub_183DB02AC(int a1, int a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((((31 * (a1 ^ 0x301)) ^ 0xF6)
                                          * (((a2 + a4 - (v4 & 3) + 771) & 0xFFFFFFFC) <= a2 + a4 + 774)) ^ a1))
                            - ((a1 ^ 0x301u)
                             + 157)
                            + 155LL))();
}

uint64_t sub_183DB0308@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  a3.i32[0] = *(_DWORD *)(a2 + a1 + 1);
  *(_DWORD *)(a2 - 3 + v3 + v5 + (v4 ^ 0x23u) - 12_Block_object_dispose(va, 8) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  return (*(uint64_t (**)(void))(v7 + 8LL * (((2 * (v6 == 4)) | (4 * (v6 == 4))) ^ v4)))();
}

uint64_t sub_183DB0360()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
}

uint64_t sub_183DB03E0@<X0>(uint64_t a1@<X8>)
{
  BOOL v9 = v4 > v7;
  *(_BYTE *)(a1 + (v6 - 1215744028)) = *(_BYTE *)(v1 + (v6 - 1215744028));
  if (v9 == v6 - 514341693 < v2) {
    BOOL v9 = v6 - 514341693 < v5;
  }
  return (*(uint64_t (**)(void))(v8 + 8LL * ((v9 * ((v3 - 1083183251) & 0x4090127B ^ 0x4CF)) ^ v3)))();
}

uint64_t sub_183DB0458@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 - 3 + (v4 + v3)) = *(_DWORD *)(v2 - 3 + (v4 + v3));
  return (*(uint64_t (**)(void))(v6 + 8LL * ((1275 * ((((a1 - 186) | 0x80) ^ 0x84) != v5)) ^ (a1 - 21))))();
}

uint64_t sub_183DB04AC(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8LL * (((v1 != v2) * (((a1 - 55) | 0x220) ^ 0x3E0)) ^ a1)))();
}

uint64_t sub_183DB04E4@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(a1 + (v4 + v3)) = *(_BYTE *)(v1 + (v4 + v3));
}

uint64_t sub_183DB0524()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((*(void *)(v1 + 16) != 0x399DE98F08C0F0A4LL) * ((v0 - 431) ^ 0x53)) ^ v0))
                            - 4LL))();
}

uint64_t sub_183DB0560@<X0>(uint64_t a1@<X8>, uint64_t a2, int a3, int a4)
{
  *(_DWORD *)(a1 - 0x399DE98F08C0F0A4LL) = a4;
  return ((uint64_t (*)(void))(*(void *)(v6
                                        + 8LL
                                        * ((883 * (*(void *)(v5 + 32) != 0x70459CB0620F0DF9LL)) ^ (v4 - 1372962927) & 0x51D5BEBF))
                            - 12LL))();
}

void sub_183DB05CC(uint64_t a1@<X8>)
{
  *(void *)(a1 - 0x70459CB0620F0DF9LL) = v2;
  *(_DWORD *)(v1 + 40) = -1224190382;
}

uint64_t sub_183DB0660(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (unint64_t)&v8[qword_18C66B2A8 ^ qword_18C66B2B8];
  qword_18C66B2B8 = 1045096823 * v2 + 0x1159CE8E9813C2FLL;
  qword_18C66B2A8 = 1045096823 * (v2 ^ 0xFEEA6317167EC3D1LL);
  int v3 = *(_DWORD *)(a2 + 4);
  unsigned __int8 v4 = 119 * ((qword_18C66B2A8 + 119 * v2 + 47) ^ 0xD1);
  if (v3 == 1534814545) {
    __asm { BR              X17 }
  }

  if (v3 == 1534814552)
  {
    int v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X1 }
  }

  return 4294925278LL;
}

uint64_t sub_183DB0D60(uint64_t a1)
{
  int v1 = 1225351577 * ((-1431559688 - (a1 ^ 0x3E1E26E0 | 0xAAAC21F8) + (a1 ^ 0x3E1E26E0 | 0x5553DE07)) ^ 0x15B262D5);
  int v2 = *(_DWORD *)(a1 + 4) ^ v1;
  int v3 = *(_DWORD *)(a1 + 16) ^ v1;
  if (v3 < 0) {
    int v3 = -v3;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) - 0x67843F9A1244BAC7LL);
  unsigned int v6 = v4 - 1756409276;
  BOOL v5 = v4 - 1756409276 < 0;
  unsigned int v7 = 1756409276 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + v2 - 51)
                                        + 8 * ((81 * (v3 >> 5 < v7)) ^ v2)
                                        - 12)
                            - 4LL))();
}

unsigned int *sub_183DB0E30@<X0>(unsigned int *result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = ((*(_DWORD *)(*(void *)(a2 - 0x67843F9A1244BAC3LL) + 4LL * v3) ^ 0x640095EBu) >> v2) ^ 0xF95A1503;
  unsigned int v5 = (((2 * (v4 & 0x7D0A4543)) | 0xEB5C68F0) - (v4 & 0x7D0A4543) - 1974350968) ^ v4 & 0x7D0A4542;
  *uint64_t result = ((v5 & 0x7A49E2C4 ^ 0x7249C285) + (v5 & 0x85B61D3B) - 1) ^ 0x303F986F;
  return result;
}

_DWORD *sub_183DB0ED8(_DWORD *result)
{
  *uint64_t result = 936930962;
  return result;
}

void sub_183DB0EE8(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_183DB0F88()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * (((((v0 - 33) | 0x20) + ((2 * v0) ^ 0x750) - 747) * (*(void *)(v1 + 8) == 0LL)) ^ v0)))();
}

uint64_t sub_183DB1004@<X0>(int a1@<W8>)
{
  unsigned int v6 = ((((&v8 | 0x5F7CCEDC) ^ 0xFFFFFFFE) - (~&v8 | 0xA0833123)) ^ 0x401F5308) * v2;
  uint64_t v10 = v5;
  int v9 = v6 ^ a1;
  uint64_t v8 = 0xC6562B2033A24D7LL;
  unsigned int v11 = 1449743216 - v6;
  int v12 = v3 - v6 - 315;
  uint64_t result = v1(&v8);
  *(_DWORD *)(v4 + 4) = *(_DWORD *)(v5 - 0x749AC022234F2832LL);
  return result;
}

void sub_183DB12CC(uint64_t a1)
{
  unint64_t v2 = (unint64_t)&v6[qword_18C66B2A8 - qword_18C66B118];
  unint64_t v3 = (1045096823 * v2) ^ 0xFEEA6317167EC3D1LL;
  unint64_t v4 = 1045096823 * (v2 ^ 0xFEEA6317167EC3D1LL);
  qword_18C66B118 = v3;
  unsigned __int8 v5 = 119 * ((v4 - v3) ^ 0xD1);
  LOBYTE(v3) = byte_183DC5880[byte_183DD08A0[v5] ^ 0xBA];
  qword_18C66B2A8 = v4;
  ((void (*)(char *, void (*)()))*(&off_189D4D580 + (v5 ^ v3) - 31))( (char *)*(&off_189D4D580 + (v5 ^ byte_183DC8FC0[byte_183DC5780[v5] ^ 0xAE]) - 128)
  - 8,
    sub_183DBA478);
  __asm { BR              X11 }

uint64_t sub_183DB13E4@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((1329 * (*(void *)(*(void *)(v3 + 952) - 4LL) == 0LL)) ^ v1))
                            - (a1 ^ 0x26425820u)
                            + 641883357LL))();
}

  ;
}

uint64_t sub_183DB1434@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8LL * (a1 ^ 0x456u)))(v1);
}

void tbttItCTp3MZ(uint64_t a1)
{
  __asm { BR              X9 }

uint64_t sub_183DB14A0@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  BOOL v3 = (*(uint64_t (**)(void))(a2 + 208))(a1) == 0;
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * ((2 * v3) ^ 0x2C0)) - 8LL))(4294925268LL);
}

uint64_t sub_183DB14EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = 0LL;
  *uint64_t v1 = a1;
  return result;
}

void sub_183DB1504(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) - 1224239923 * (((a1 | 0xDD953B90) - (a1 & 0xDD953B90)) ^ 0x2F26C647);
  __asm { BR              X15 }

uint64_t sub_183DB1630@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v16 = v14 - 1726331730;
  *(_DWORD *)(a11 + 4LL * (v11 + a1)) = *(_DWORD *)(*(void *)(v13 - 0x67843F9A1244BAC3LL) + 4LL * (v11 + a1));
  BOOL v18 = v11 + 1664397869 > 421151917 || v11 + 1664397869 < v16;
  return (*(uint64_t (**)(void))(v15 + 8LL * ((1543 * (((v12 + 1) ^ v18) & 1)) ^ (v12 - 505))))();
}

uint64_t sub_183DB16B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v9 = v5 + 1430501825 > 187255874 || v5 + 1430501825 < a5 - 1960227773;
  return ((uint64_t (*)(void, uint64_t, uint64_t))(*(void *)(v7 + 8LL * ((v9 * ((v6 - 547) ^ 0x2E0)) ^ v6))
                                                           - 8LL))( (v6 - 547) ^ 0x2E0u,  1677759979LL,  0x67843F9A1244BACBLL);
}

uint64_t sub_183DB1728@<X0>( int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(a12 + 4LL * (v12 + a2)) = a1;
  int v18 = v12 + v14 + ((v13 - 1524714745) & 0x5AE14AD5);
  BOOL v20 = v18 > v15 || v18 < v16;
  return ((uint64_t (*)(void))(*(void *)(v17 + 8LL * ((117 * v20) ^ v13)) - 8LL))();
}

uint64_t sub_183DB177C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 8LL * (v7 ^ (61 * (v6 != 0))))
                                                                                       - (((3 * (v7 ^ 0x220) - 543) | 0x200u) ^ 0x208LL)))( a1,  a2,  a3,  a4,  a5,  a6);
}

uint64_t sub_183DB17C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _DWORD *a19)
{
  int v22 = (*(_DWORD *)(*a13 - 0x7A1D52918E41680LL) - 1578365111) * (*a19 ^ 0x640095EB);
  int v23 = 1225351577 * ((((v21 - 128) | 0x3C75FBC3) - ((v21 - 128) & 0x3C75FBC3)) ^ 0x428A61F1);
  *(_DWORD *)(v21 - 104) = ((v19 + 31) ^ 0x428B0337) + 640003220 + v23;
  *(void *)(v21 - 120) = a15;
  *(void *)(v21 - 112) = a14;
  *(_DWORD *)(v21 - 12_Block_object_dispose(va, 8) = (v22 ^ 0xCEB6BD3F) - v23 + ((2 * v22) & 0x9D6D7A7E) + 1936293886;
  *(_DWORD *)(v21 - 124) = v23 + v19 + 389;
  uint64_t v24 = ((uint64_t (*)(uint64_t))*(&off_189D4D580 + (v19 ^ 0x202)))(v21 - 128);
}

void sub_183DB1914()
{
}

uint64_t sub_183DB191C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  int v18 = 1224239923 * ((((v17 - 128) | 0x20D4BCCD) - ((v17 - 128) & 0x20D4BCCD)) ^ 0xD267411A);
  *(void *)(v17 - 120) = a15;
  *(_DWORD *)(v17 - 112) = (((a12 << 6) & 0xB3B5FF80) + ((32 * a12) ^ 0x59DAFFD7) - 18351106) ^ v18;
  *(_DWORD *)(v17 - 12_Block_object_dispose(va, 8) = v16 - v18 + 410;
  sub_183DACBEC((_DWORD *)(v17 - 128));
  return ((uint64_t (*)(void))(*(void *)(v15
                                        + 8LL
                                        * (int)((((*a10 - 1756409277) < 0x7FFFFFFF)
                                               * ((v16 + 1206319584) & 0xB81905FF ^ 0x681)) ^ v16))
                            - 12LL))();
}

uint64_t sub_183DB1A00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(_DWORD *)(v16 - 112) = (v15 - 179) ^ (108757529
                                        * ((((v16 - 128) | 0x3E78ACD8) - (v16 - 128) + ((v16 - 128) & 0xC1875320)) ^ 0xDEE4CEF3));
  *(void *)(v16 - 12_Block_object_dispose(va, 8) = a13;
  *(void *)(v16 - 120) = &STACK[0x67843F9A1244BAFB];
  sub_183D7B048(v16 - 128);
  *(void *)(v16 - 120) = v14;
  *(void *)(v16 - 112) = a13;
  *(_DWORD *)(v16 - 12_Block_object_dispose(va, 8) = (v15 + 1246) ^ (1374699841
                                         * ((((v16 - 128) | 0xC863ADDB) + (~(v16 - 128) | 0x379C5224)) ^ 0xA597B5D3));
  uint64_t v17 = ((uint64_t (*)(uint64_t))((char *)*(&off_189D4D580 + v15 - 419) - 12))(v16 - 128);
  return ((uint64_t (*)(uint64_t))(*(void *)(v13
                                                      + 8LL
                                                      * (((*(_DWORD *)(v16 - 124) <= ((v15 - 587641368) & 0x2306B2BF ^ 0x23F2FF3Cu))
                                                        * (((v15 + 523) | 0x81) ^ 0x76B)) ^ v15))
                                          - 12LL))(v17);
}

uint64_t sub_183DB1B34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  int v20 = a18 - 1756409276;
  if (a18 - 1756409276 < 0) {
    int v20 = 1756409276 - a18;
  }
  return ((uint64_t (*)(void))(*(void *)(v18
                                        + 8LL
                                        * (int)((((int)((v19 ^ 0xF9B5BF1A ^ v20)
                                                      + ((2 * v20) & 0xF36B7B7A)
                                                      + 105529243
                                                      + 7 * (v19 ^ 0x2C6)) >= 0)
                                               * (((v19 ^ 0x71) + 851225093) & 0xCD4357FC ^ 0x87)) ^ v19 ^ 0x71))
                            - 4LL))();
}

uint64_t sub_183DB1C04( uint64_t a1, int a2, unsigned int a3, unint64_t a4, uint64_t a5, int a6, unsigned int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * (((*(_DWORD *)(v8 + 4LL * a7) != v9) * v7) ^ a6))
}

void sub_183DB1C38()
{
}

uint64_t sub_183DB1C48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v20 = 7 * (v16 ^ 0x181);
  int v21 = 535753261 * ((((2 * (v19 - 128)) | 0x31C6BFF6) - (v19 - 128) + 1729929221) ^ 0x921751D4);
  *(_DWORD *)(v19 - 120) = v21 + v13 + v20 + 457162507;
  *(_DWORD *)(v19 - 116) = v21 + v16 - 43;
  *(void *)(v19 - 12_Block_object_dispose(va, 8) = v17;
  sub_183D7AE40(v19 - 128);
  *(_DWORD *)(v19 - 12_Block_object_dispose(va, 8) = (v20 + 1246) ^ (1374699841
                                         * ((((v19 - 128) | 0x5428CE33) + (~(v19 - 128) | 0xABD731CC)) ^ 0x39DCD63B));
  *(void *)(v19 - 120) = v15;
  *(void *)(v19 - 112) = a13;
  uint64_t v22 = v18(v19 - 128);
  return ((uint64_t (*)(uint64_t))(*(void *)(v14
                                                      + 8LL
                                                      * (int)(((*(_DWORD *)(v19 - 124) <= 0x23F2FD9Bu)
                                                             * ((((v20 + 1035019216) & 0xC24EDEBB) - 836) ^ (v20 + 854836408) & 0xCD0C3BEF)) ^ v20))
                                          - 12LL))(v22);
}

uint64_t sub_183DB1D84( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v19 - 120) = a14;
  *(void *)(v19 - 112) = v17;
  *(_DWORD *)(v19 - 12_Block_object_dispose(va, 8) = (v14 + 594) ^ ((((((v19 - 128) ^ 0x60944128 | 0xF4B9EC4) ^ 0xFFFFFFFE)
                                          - ((v19 - 128) ^ 0x5099404 | 0xF0B4613B)) ^ 0xF79632DA)
                                        * v16);
  uint64_t v20 = v18(v19 - 128);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8LL
                                            * (((*(_DWORD *)(v19 - 124) > ((13 * (v14 ^ 0x4DC)) ^ 0x23F2F9F0u))
                                              * ((v14 ^ 0x4DC) + 603)) ^ v14)))(v20);
}

uint64_t sub_183DB1E3C()
{
  *(_DWORD *)(v5 - 112) = v2
                        + 1759421093
                        * ((-1639370089 - ((v5 - 128) | 0x9E493297) + ((v5 - 128) | 0x61B6CD68)) ^ 0xD2CB7D3C)
                        - 197;
  *(void *)(v5 - 12_Block_object_dispose(va, 8) = v4;
  *(void *)(v5 - 120) = v3;
  uint64_t v6 = ((uint64_t (*)(uint64_t))((char *)*(&off_189D4D580 + (v2 ^ 0x4DD)) - 8))(v5 - 128);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8LL
                                            * ((224 * (((v0 == 650526839) ^ ((v2 ^ 0xA3) + 1)) & 1)) ^ v2)))(v6);
}

uint64_t sub_183DB1EF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(_DWORD *)(v17 - 12_Block_object_dispose(va, 8) = (v14 + 1301) ^ (1374699841 * ((v17 - 128) ^ 0x6DF41809));
  *(void *)(v17 - 120) = v15;
  *(void *)(v17 - 112) = a13;
  uint64_t v18 = v16(v17 - 128);
  return (*(uint64_t (**)(uint64_t))(v13
                                            + 8LL
                                            * ((1443 * (*(_DWORD *)(v17 - 124) > ((73 * (v14 ^ 0x1CF)) ^ 0x23F2FC63u))) ^ v14)))(v18);
}

uint64_t sub_183DB1F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v7 = *(void *)(v9 + 8);
  *(_DWORD *)(v6 - 112) = (a5 - 908) ^ (108757529 * ((2 * ((v6 - 128) & 0x3146E90) - (v6 - 128) - 51670674) ^ 0x1C77F345));
  *(void *)(v6 - 12_Block_object_dispose(va, 8) = v5;
  *(void *)(v6 - 120) = v7;
  return sub_183D7B048(v6 - 128);
}

void sub_183DB2020(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)a1 + 1178560073 * ((1579988138 - (a1 | 0x5E2CB4AA) + (a1 | 0xA1D34B55)) ^ 0x1B473337);
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x67843F9A1244BAC7LL);
  uint64_t v4 = *(void *)(a1 + 8);
  unsigned int v3 = v1 + 535753261 * (((~&v3 & 0xB6F64278) - (~&v3 | 0xB6F64279)) ^ 0xBC024C56) + 69;
  sub_183DA2F4C((uint64_t)&v3);
  __asm { BR              X9 }

uint64_t sub_183DB214C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
}

uint64_t sub_183DB21B8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((1297
                                * ((v3 ^ 0x377E797F) - 19939597 + (v1 & 0x6EFCF2FE) - 911095923 > (int)((v2 - 809) ^ 0xFFFFFF7D))) ^ v2)))();
}

uint64_t sub_183DB2250@<X0>(int a1@<W0>, int a2@<W7>, uint64_t a3@<X8>)
{
  unsigned int v10 = (v8 - 972537477) & 0x39F7BC8A ^ (v5 - 130) ^ *(_DWORD *)(*(void *)(v9 - 0x67843F9A1244BAC3LL)
                                                               + 4LL * (a1 + v7));
  *(_DWORD *)(*(void *)(v9 - 0x67843F9A1244BAC3LL) + 4LL * (v3 + v4)) = ((v10 >> (32 - v6)) | a2 ^ v5)
                                                                        + v5
                                                                        - ((2 * ((v10 >> (32 - v6)) | a2 ^ v5)) & 0xC8012BD6);
  return (*(uint64_t (**)(void))(a3 + 8LL * (int)((471 * ((a1 - 1 + v7) >> 31)) ^ v8)))();
}

uint64_t sub_183DB2304@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((1395
                                * ((v1 & 0xD9EFFFE4) + (v3 ^ (v2 - 1399) ^ 0xECF7FEDA) + 319291405 < ((v2 + 2147481591) ^ (v2 - 1334)))) ^ (v2 - 1399))))();
}

uint64_t sub_183DB2378@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v5 - 0x67843F9A1244BAC3LL) + 4LL * (v1 - 1826744992 + v3)) = *(_DWORD *)(*(void *)(v5 - 0x67843F9A1244BAC3LL)
                                                                                                 + 4LL
                                                                                                 * (v3 + v2));
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1
                                                     + 8LL
                                                     * ((41
                                                       * ((((v3 - 1 + v2) < 0x7FFFFFFF) ^ (v4 - 45)) & 1)) ^ (v4 - 39))))( 3864282477LL,  0x7FFFFFFFLL);
}

void sub_183DB23F8()
{
}

uint64_t sub_183DB2400@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  *(_DWORD *)(*(void *)(v5 - 0x67843F9A1244BAC3LL) + 4LL * (v4 + v2)) = a1;
  return (*(uint64_t (**)(void))(a2 + 8LL * (((v4 + v2 > 0) * (v3 - 116)) ^ v3)))();
}

uint64_t sub_183DB2440@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*v4 + 4LL * (v1 + v5 - 1)) = v2;
  return (*(uint64_t (**)(void))(a1 + 8LL * (((v1 + v5 - 2 >= 0) * v6) ^ v3)))();
}

void sub_183DB2470()
{
  BOOL v7 = *(_DWORD *)(*v5 + 4LL * (v0 + v2)) == v3;
  *int v6 = v1 + v1 * (v2 + v0 - v7) + (v0 - v7) * ((v4 ^ 0x4A3) - 764409004) + 2028959636;
}

void sub_183DB25FC(uint64_t a1)
{
  BOOL v2 = *(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL) == 1756409276;
  int v1 = *(_DWORD *)(a1 + 4) - 1225351577 * (((a1 | 0x1B35D24) - (a1 | 0xFE4CA2DB) - 28532005) ^ 0x7F4CC716);
  __asm { BR              X16 }

uint64_t sub_183DB26FC@<X0>(int a1@<W2>, int a2@<W8>)
{
  int v8 = 20 * (v5 ^ 0x392) + 955;
  BOOL v9 = v4 > 0x79855024;
  if (v9 == v2 - 1647705569 < -2038779941) {
    BOOL v9 = v2 - 1647705569 < (int)(v4 + 108703707);
  }
  return (*(uint64_t (**)(uint64_t, void, void, void))(v3 + 8LL * ((972 * v9) ^ v8)))( 0x7410E9D44A770784LL,  0LL,  a1 + v6 - a2 - 444 + (v8 ^ 0x43B),  (v7 - 1477743493));
}

uint64_t sub_183DB2848@<X0>( uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, int a4@<W3>, void *a5@<X6>, unsigned int a6@<W7>, int a7@<W8>)
{
  int v18 = (v12 - 1111) | 0x8C;
  unint64_t v19 = a1 + v13 + (*(_DWORD *)(v10 + 4 * a3) ^ v11) + a6 * (unint64_t)(*(_DWORD *)(*a5 + 4LL * a2) ^ v11);
  *(_DWORD *)(v10 + 4 * a3) = v19 + v11 - (((v18 + v15) & v16 ^ 0xC801288D) & (2 * v19));
  unint64_t v20 = ((v19 >> (((((v12 - 87) | 0x8C) + 74) | v14) - 103)) ^ v17)
      + v9
      + ((2 * (v19 >> (((((v12 - 87) | 0x8C) + 74) | v14) - 103))) & a7);
  BOOL v22 = a2 - 1477743492 > v7 || a2 - 1477743492 < a4;
  return (*(uint64_t (**)(unint64_t))(v8 + 8LL * (v18 ^ (112 * v22))))(v20);
}

uint64_t sub_183DB28FC(uint64_t a1)
{
}

uint64_t sub_183DB2958()
{
  int v4 = *v3 - 1073132905;
  int v5 = (v0 - 1073132905 < -1464207277) ^ (v4 < -1464207277);
  BOOL v6 = v0 - 1073132905 > v4;
  if (v5) {
    BOOL v6 = v0 - 1073132905 < -1464207277;
  }
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((v6 * ((v2 - 457) ^ 0x304)) | v2)) - (v2 ^ 0x6CBu) + 889LL))();
}

void sub_183DB29C4()
{
  *uint64_t v1 = v0;
}

uint64_t sub_183DB29E8@<X0>(int a1@<W8>)
{
  if (v3 > 0x52897A5F != v1 - 993667100 < -1384741472) {
    BOOL v4 = v3 > 0x52897A5F;
  }
  else {
    BOOL v4 = v1 - 993667100 < (int)((a1 ^ 0x2D768045) + v3);
  }
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((v4 * (((a1 ^ 0x4B6) + 562) ^ 0x354)) ^ a1 ^ 0x4B6)) - 12LL))();
}

uint64_t sub_183DB2AC8@<X0>(uint64_t a1@<X0>, int a2@<W6>, unsigned int a3@<W7>, int a4@<W8>)
{
  unint64_t v15 = a1 - 0x7410E9D44A770784LL + (*(_DWORD *)(v6 + 4 * v8) ^ v9);
  *(_DWORD *)(v6 + 4 * v_Block_object_dispose(va, 8) = v15 + v9 - (((_DWORD)v15 << ((((v11 + a2) & a4) - 55) ^ v4)) & 0xC8012BD6);
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((((((v11 + a2) & a4 ^ a3) * v7) ^ HIDWORD(v15) ^ v10)
                                           + (v12 & (v15 >> 31))
                                           + v13 != 0x7410E9D44A770784LL)
                                          * v14) ^ (v11 + a2) & a4))
                            - 8LL))();
}

void sub_183DB2B74(uint64_t a1)
{
  BOOL v3 = *(_DWORD *)(*(void *)a1 - 0x67843F9A1244BAC7LL) == 1756409276
    || *(_DWORD *)(*(void *)(a1 + 16) - 0x67843F9A1244BAC7LL) == 1756409276;
  int v1 = *(_DWORD *)(a1 + 8) + 1178560073 * ((2 * (a1 & 0x4FE31186) - a1 + 807202425) ^ 0x8A88961B);
  __asm { BR              X14 }

uint64_t sub_183DB2C78@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (((((v2 + 1475047077) ^ 0x57EB695A) - 1444)
                                          * ((v3 + a1 - 133) > 0x7FFFFF7C)) ^ v2))
                            - ((v2 + 1475047077) & 0xA81493B5)
                            + 780LL))();
}

uint64_t sub_183DB2CCC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 8LL * (v5 ^ (38 * (a1 < 1))))
                                                                     - 8LL))( 38LL,  a2,  a3,  a4);
}

uint64_t sub_183DB2D2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_DWORD *)(a14 + 4LL * (v18 - 297100030)) = v15;
  BOOL v20 = v18 + 1700640976 > -149742644 && v18 + 1700640976 < v17;
  return (*(uint64_t (**)(void))(v14 + 8LL * ((v20 * (((v16 - 686643525) & 0x28ED574D) - 736)) ^ v16)))();
}

uint64_t sub_183DB2D90()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * (((((v1 == 0) ^ (v2 + 6)) & 1)
                                          * ((v2 + 503577033) & 0x61FC076F ^ 0x479)) ^ v2))
                            - 8LL))();
}

uint64_t sub_183DB2DD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(void))(v11
                              + 8LL
                              * (((**(_DWORD **)(a11 - 0x67843F9A1244BAC3LL) == v12)
                                * (((((v13 - 514) | 0xC0) + 887) | 0x84) - 1480)) ^ ((v13 - 514) | 0xC0))))();
}

uint64_t sub_183DB2EBC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  int v11 = a8 - 703;
  int v12 = a7 + 539259013 + v11 + 313;
  BOOL v14 = v12 > 388542078 || v12 < a2;
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((v14 * (((v11 + v10) & v9) - 435)) ^ v11)) - 8LL))();
}

void sub_183DB3078()
{
}

void sub_183DB3084()
{
  *uint64_t v0 = v1;
}

void sub_183DB32E4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 28) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X11 }

uint64_t sub_183DB33C0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8)
{
  int v15 = v8 ^ v9;
  int v16 = *(_DWORD *)(a1 + 24) + v14 + *(_DWORD *)(v10 - 0x749AC022234F283ALL) - 1449743208;
  int v17 = 1178560073 * ((&a5 + 1663869989 - 2 * ((unint64_t)&a5 & 0x632CA425)) ^ 0xD9B8DC47);
  a8 = (v15 + 1272) ^ v17;
  a6 = v17 + 395901412 + v16;
  a5 = v17 + 908467202;
  a7 = v10;
  uint64_t v18 = (*(uint64_t (**)(int *))(a2 + 8LL * (v15 - 296)))(&a5);
  return (*(uint64_t (**)(uint64_t))(v13
                                            + 8LL
                                            * ((1185 * (*v11 == ((v15 + 705184938) & 0xD5F7BADF ^ (v12 + 400)))) ^ v15)))(v18);
}

uint64_t sub_183DB34B4()
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * (int)(((*v0 == 0xC6562B2033A24D7LL) * ((v2 ^ 0xFFFFFE8C) + v2 - 190)) ^ (v2 + 1385))))();
}

uint64_t sub_183DB3500()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((((v1 == 1449743216) ^ (v0 - 56)) & 1)
                                          * ((v0 - 2037161468) & 0x796C9FEE ^ 0x2B3)) ^ v0))
                            - 12LL))();
}

void sub_183DB3558()
{
  *int v0 = 1224150411;
}

void sub_183DB37B0(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 24) - 1374699841 * ((-2 - ((a1 | 0x5548FCDC) + (~(_DWORD)a1 | 0xAAB70323))) ^ 0xC7431B2A);
  uint64_t v2 = *(unint64_t **)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 32);
  int v3 = *(unint64_t **)(a1 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(v4 - 0x7A1D52918E41688LL);
  unsigned int v12 = (1759421093 * ((&v7 - 2090829170 - 2 * (&v7 & 0x83607A8E)) ^ 0x301DCADA)) ^ (v1 - 714);
  uint64_t v7 = v4;
  int v8 = v2;
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  int v11 = &STACK[0x67843F9A1244BAFB];
  ((void (*)(uint64_t *))((char *)*(&off_189D4D580 + (v1 ^ 0x3F2)) - 8))(&v7);
  uint64_t v7 = *(void *)(v4 - 0x7A1D52918E41690LL);
  int v8 = &STACK[0x67843F9A1244BAEB];
  LODWORD(v9) = (108757529
               * ((2090754283 - (&v7 | 0x7C9E60EB) + (&v7 | 0x83619F14)) ^ 0x63FDFD3F)) ^ (v1 - 557);
  sub_183D7B048((uint64_t)&v7);
  int v8 = v3;
  HIDWORD(v7) = v1
              + 460628867
  sub_183D7B234((uint64_t)&v7);
  __asm { BR              X8 }

uint64_t sub_183DB3A14( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t), uint64_t a11)
{
  *(void *)(v18 - 12_Block_object_dispose(va, 8) = v15;
  *(void *)(v18 - 120) = v13;
  *(void *)(v18 - 144) = v14;
  *(void *)(v18 - 136) = a11;
  *(void *)(v18 - 112) = v13;
  *(_DWORD *)(v18 - 104) = (v16 - 839) ^ (1759421093
                                        * ((~((v18 - 144) | 0x757597B1) + ((v18 - 144) & 0x757597B1)) ^ 0x39F7D81A));
  uint64_t v19 = a10(v18 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v11
                                                      + 8LL
                                                      * (int)((236
                                                             * (((((v16 + 758017929) & 0xD2D18FF9) + 125) ^ (v12 - 659))
                                                              + v17 < 0x7FFFFFFF)) ^ (v16 + 758017929) & 0xD2D18FF9))
                                          - 12LL))(v19);
}

uint64_t sub_183DB3AC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v19 - 120) = v17
                         + 535753261 * ((((v19 - 144) | 0x256726A7) + (~(v19 - 144) | 0xDA98D958)) ^ 0x2F932889)
                         + 688;
  *(void *)(v19 - 112) = v14;
  *(void *)(v19 - 144) = v16;
  *(void *)(v19 - 136) = v14;
  *(void *)(v19 - 12_Block_object_dispose(va, 8) = v15;
  ((void (*)(uint64_t))((char *)*(&off_189D4D580 + (v17 ^ 0x32F)) - 12))(v19 - 144);
  int v20 = 1225351577 * ((v19 - 144) ^ 0x7EFF9A32);
  *(void *)(v19 - 136) = a12;
  *(_DWORD *)(v19 - 140) = (v17 - 873) ^ v20;
  *(_DWORD *)(v19 - 12_Block_object_dispose(va, 8) = (v18 + v13) ^ v20;
  uint64_t v21 = sub_183DB0D60(v19 - 144);
  return ((uint64_t (*)(uint64_t))(*(void *)(v12
                                                      + 8LL * ((2046 * (*(_DWORD *)(v19 - 144) != 936930962)) ^ v17))
                                          - ((v17 - 125) ^ 0x371LL)))(v21);
}

uint64_t sub_183DB3BB0()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_183DB3BE8()
{
  uint64_t v5 = *(void *)(v8 + 8);
  int v6 = 460628867 * ((((v4 - 144) | 0x329A340E) - ((v4 - 144) & 0x329A340E)) ^ 0x7E0CB673);
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = v6 + v0 - 692;
  *(void *)(v4 - 136) = v10;
  *(_DWORD *)(v4 - 144) = 1557934080 - v6;
  sub_183DAC950((_DWORD *)(v4 - 144));
  *(void *)(v4 - 144) = v2;
  *(void *)(v4 - 136) = v10;
  *(void *)(v4 - 120) = v1;
  *(void *)(v4 - 112) = v1;
  *(void *)(v4 - 12_Block_object_dispose(va, 8) = v3;
  *(_DWORD *)(v4 - 104) = (v0 - 714) ^ (1759421093
                                      * ((2 * ((v4 - 144) & 0x7AB93DF8) - (v4 - 144) + 88523270) ^ 0xB63B7252));
  v9(v4 - 144);
  *(_DWORD *)(v4 - 12_Block_object_dispose(va, 8) = (v0 - 557) ^ (108757529
                                      * ((((v4 - 144) | 0x1013C975) - (v4 - 144) + ((v4 - 144) & 0xEFEC3688)) ^ 0xF08FAB5E));
  *(void *)(v4 - 144) = v1;
  *(void *)(v4 - 136) = v5;
  return sub_183D7B048(v4 - 144);
}

void sub_183DB3D3C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  uint64_t v2 = *(void *)((char *)*(&off_189D4D580 + v1 - 365)
  __asm { BR              X8 }

uint64_t sub_183DB3DCC(uint64_t result)
{
  uint64_t v2 = *v1;
  *(void *)uint64_t result = 0LL;
  *(void *)(result + _Block_object_dispose(va, 8) = 0x60484F9360484F93LL;
  *(void *)(result + 16) = 0x7F603B2B0C945BC3LL;
  *(_DWORD *)(result + 24) = -1224190382;
  *(void *)(v2 - 0x6F6532B723EC5DD5LL) = result + 0x749AC022234F284ALL;
  *((_DWORD *)v1 + 2) = -1224190382;
  return result;
}

void hZZRqgZwI(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  __asm { BR              X8 }

uint64_t sub_183DB3EC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int a14, int a15)
{
  a14 = 108757529 * (&a14 ^ 0xE09C622B) + 1695027452;
  uint64_t v18 = sub_183DBA3C0(&a14);
  return ((uint64_t (*)(uint64_t))(*(void *)(v16 + 8LL * ((897 * (a15 == ((v15 + 42) ^ 0x2E))) ^ v17)) - 8LL))(v18);
}

uint64_t sub_183DB3F34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, int a15, unsigned int a16)
{
  a16 = v17 - 460628867 * ((&a14 & 0xED49C18B | ~(&a14 | 0xED49C18B)) ^ 0x5E20BC09) + 409;
  a14 = &STACK[0x6F6532B723EC5DDD];
  sub_183DB3D3C((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 8LL * ((232 * (a15 != (v17 ^ 0x25C) - 1224190382 + 2 * (v17 ^ 0x25C) - 1878)) ^ v17))
                                                                                                - 8LL))( v18,  v19,  v20,  v21,  v22,  v23,  v24);
}

uint64_t sub_183DB3FEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, unsigned int a17, uint64_t a18)
{
  unsigned int v25 = 628203409
      * (((&a14 ^ 0x8A2ABAE8) & 0xC01153FA | ~(&a14 ^ 0x8A2ABAE8 | 0xC01153FA)) ^ 0x374C1ADE);
  a14 = v23 - v25 + 252;
  a16 = v19;
  a18 = a10;
  a17 = (v20 ^ 0x35F9DF1F) + (v23 ^ 0x5ECDD87A) + (((v23 - 1) ^ 0x6BF3BADC) & (2 * v20)) + 1823609441 + v25;
  (*(void (**)(int *))(v24 + 8LL * (int)(v23 - 1241)))(&a14);
  unsigned int v26 = 1225351577 * ((&a14 - 1814971634 - 2 * (&a14 & 0x93D1BB0E)) ^ 0xED2E213C);
  a16 = a10;
  a14 = 830393081 * v18 - v26 + 1727649171;
  a15 = (v23 - 608) ^ v26;
  sub_183DA1BA4((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 + 8LL * ((474 * (a17 == v21)) ^ v23)) - 4LL))( v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  a9);
}

uint64_t sub_183DB4144( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, unsigned int a17, int a18, unint64_t *a19)
{
  int v22 = 1759421093 * ((&a14 + 291676884 - 2 * ((unint64_t)&a14 & 0x1162A2D4)) ^ 0xA21F1280);
  a16 = a10;
  a14 = 2017542726 - v22;
  a19 = &STACK[0x3F0B617C4F927C05];
  a17 = v22 ^ 0x9779A656;
  a18 = v22 + v21 + 2138962109;
  uint64_t v23 = sub_183DB9534((uint64_t)&a14);
}

uint64_t sub_183DB4234( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, uint64_t a13, unsigned int a14, int a15, unint64_t *a16, unint64_t *a17)
{
  a14 = (v17 + 863) ^ (1374699841
                     * ((2 * (&a14 & 0x7EABDED0) - &a14 + 22290732) ^ 0x6CA03925));
  a16 = &STACK[0x130F29621C6D095C];
  a17 = a11;
  int v19 = (void (*)(unsigned int *))((char *)*(&off_189D4D580 + v17 - 229) - 12);
  v19(&a14);
  a14 = (v17 + 863) ^ (1374699841 * ((&a14 + 10095937 - 2 * (&a14 & 0x9A0D41)) ^ 0x6D6E1548));
  a16 = &STACK[0x130F29621C6D0954];
  a17 = a11;
  v19(&a14);
  a14 = (v17 + 863) ^ (1374699841 * ((&a14 & 0xC1F6A691 | ~(&a14 | 0xC1F6A691)) ^ 0x53FD4167));
  a16 = &STACK[0x130F29621C6D0958];
  a17 = a11;
  v19(&a14);
  a16 = a11;
  a14 = v17
      + 1225351577
  uint64_t v20 = sub_183D7ACD4((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
                                                      * ((1355 * (a15 == ((v17 + 1509983057) | 0x4CD5800) + 1480227252)) ^ v17))
                                          - 12LL))(v20);
}

uint64_t sub_183DB440C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * ((1011 * (a13 == v14)) ^ v13))
                            - ((v13 + 1354777413) | 0xE0D980Cu)
                            + 1590549650LL))();
}

uint64_t sub_183DB4454()
{
  unsigned int v4 = (v2 + 2129648785) & 0xDFDDFEBF;
  *int v0 = v4 ^ v8 ^ 0xE9C58ACC | ((unint64_t)(v9 ^ v3) << 32);
  uint64_t v12 = v7;
  int v11 = 535753261 * ((v10 - 369372444 - 2 * ((unint64_t)v10 & 0xE9FBD2E4)) ^ 0xE30FDCCB)
      - 1590549126
      + v4;
  v1(v10);
  uint64_t v12 = v6;
  int v11 = 535753261 * ((v10 + 957040592 - 2 * ((unint64_t)v10 & 0x390B47D0)) ^ 0x33FF49FF)
      - 1590549126
      + v4;
  v1(v10);
  return v3 ^ 0xB7085652;
}

void sub_183DB4580(uint64_t a1)
{
  int v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(void *)(a1 + 24)) {
    BOOL v2 = *(_DWORD *)(a1 + 20) - v1 == 1615351699;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  __asm { BR              X8 }

uint64_t sub_183DB4628()
{
  BOOL v3 = (*(uint64_t (**)(uint64_t))(v0 + 8LL * (v2 ^ 0xB1)))(32LL) == 0;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((1325 * ((v3 ^ (v2 + 103 + v2)) & 1)) ^ v2)))();
}

uint64_t sub_183DB4674()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((((38 * ((v3 | 0x1A8) ^ 0x5BE)) ^ 0x263) + 38 * ((v3 | 0x1A8) ^ 0x5BE))
                                          * (v0 != v1)) ^ (v3 | 0x1A8)))
                            - 4LL))();
}

uint64_t sub_183DB46CC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v11 = v2 - 1615351700;
  int v12 = v2 - 1;
  int v13 = *(unsigned __int8 *)(v5 + v11);
  if (v13 == 63) {
    __asm { BR              X11 }
  }

  if (v13 == 191)
  {
    int v14 = -1224190382;
    uint64_t v15 = *(void *)(v3 + 8);
    int v16 = *(unsigned __int8 *)(v3 + 16) ^ v4;
    *(void *)uint64_t result = v5;
    *(_DWORD *)(result + _Block_object_dispose(va, 8) = v6;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 29) {
      int v17 = 2137013032;
    }
    else {
      int v17 = 2137013033;
    }
    *(_DWORD *)(result + 16) = 211049411;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = -1224190382;
    *(void *)(v15 - 0x36BFEA2E21032E05LL) = a2;
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(void))(v9 + 8LL * (v8 ^ 0x7A)))();
    int v14 = 1224150411;
  }

  *(_DWORD *)uint64_t v3 = v14;
  return result;
}

void sub_183DB47B0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) - 535753261 * (((a1 | 0xB23F3C90) - (a1 & 0xB23F3C90)) ^ 0xB8CB32BF);
  __asm { BR              X14 }

uint64_t sub_183DB48CC@<X0>(int a1@<W8>)
{
  if (v1 + a1 >= 0) {
    unsigned int v4 = v1 + a1;
  }
  else {
    unsigned int v4 = -(v1 + a1);
  }
}

uint64_t sub_183DB491C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, _DWORD *a23)
{
  int v24 = a2 - 513473878;
  uint64_t v25 = (a2 - 944);
  *a23 = 1677759979;
  BOOL v27 = v24 > 1634011470 || v24 <= a17 - 513472177;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v23
                                                                        + 8LL * (int)(((2 * v27) | (8 * v27)) ^ v25))
                                                            - 4LL))( a1,  v25,  1634011470LL);
}

uint64_t sub_183DB49A4@<X0>( int a1@<W1>, int a2@<W2>, int a3@<W3>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  *(_DWORD *)(a19 + 4LL * a3) = a4;
  BOOL v23 = v20 + a3 > a2 || v20 + a3 <= v19;
  return ((uint64_t (*)(void))(*(void *)(v21 + 8LL * (((2 * v23) | (8 * v23)) ^ a1)) - 4LL))();
}

uint64_t sub_183DB49D8(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(v4
                                                               + 8LL
                                                               * (((v2 != ((v3 - 772) ^ 0x11B)) * (v3 - 915)) ^ v3))
                                                   - 8LL))( a1,  a2);
}

uint64_t sub_183DB4A30@<X0>( uint64_t a1@<X4>, uint64_t a2@<X5>, unsigned int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  int v22 = (*a18 ^ a3)
      + ((v20 + 1003) ^ (a3 - 1278) ^ **(_DWORD **)(v18 - 0x67843F9A1244BAC3LL))
      * (**(_DWORD **)(v18 - 0x67843F9A1244BAC3LL) ^ a3);
  unsigned int v23 = v22 - 1550837704 - (((v20 + 795) ^ 0x47203446) & (2 * v22));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v21 + 8LL * ((v20 + 1003) ^ (16 * (v19 > 1)))))( 0x211E14E747203070LL,  2744129592LL,  2425293427LL,  4247974974LL,  a1,  a2,  v18 - 0x67843F9A1244BAC3LL,  (v23 ^ 0xA3901838LL)
         + (v23 ^ 0xA3901838)
         * (*(_DWORD *)(a5 - 0x7A1D52918E41680LL) - 1578365111)
         * (unint64_t)(**(_DWORD **)(a14 - 0x67843F9A1244BAC3LL) ^ a3),
           a4);
}

uint64_t sub_183DB4BC8@<X0>( unint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, void *a4@<X6>, unint64_t a5@<X7>, unsigned int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  uint64_t v37 = 4LL * (v30 + 1 + a3);
  unint64_t v38 = (*(_DWORD *)(a21 + v37) ^ a6)
      + (a2 ^ HIDWORD(v36))
      + v35 * (unint64_t)(v26 ^ (a6 - 1038) ^ *(_DWORD *)(*a4 + v37));
  unint64_t v39 = HIDWORD(a5)
  *(_DWORD *)(a21 + 4LL * (v30 + a3)) = v39 + a6 - (v22 & (2 * v39));
  BOOL v40 = v24 > v29;
  if (v40 == v30 + v23 < v31) {
    BOOL v40 = v30 + v23 < v34;
  }
  return (*(uint64_t (**)(void))(v32 + 8LL * (v21 | (16 * v40))))();
}

uint64_t sub_183DB4C74()
{
  BOOL v5 = v1 - 1064934235 <= (((v0 - 1054) | 0x103) ^ 0x4353717E) && v1 - 1064934235 >= v3;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((98 * v5) ^ v0)) - 8LL))();
}

uint64_t sub_183DB4CD0@<X0>( unint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, unint64_t a4@<X7>, unsigned int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v34 = v27 + a3;
  int v35 = v27 + 1;
  uint64_t v36 = 4LL * (v35 + a3);
  unint64_t v37 = (v23 ^ v26 ^ (a5 - 251) ^ *(_DWORD *)(a20 + v36)) + (a2 ^ HIDWORD(v32));
  unint64_t v38 = HIDWORD(a4)
  *(_DWORD *)(a20 + 4LL * v34) = v38 + a5 - (v20 & (2 * v38));
  BOOL v40 = v35 + v22 <= v33 && v35 + v22 >= v31;
  return ((uint64_t (*)(void))(*(void *)(v29 + 8LL * ((v40 * v21) ^ v23)) - 8LL))();
}

uint64_t sub_183DB4D60@<X0>( uint64_t a1@<X2>, unint64_t a2@<X7>, unsigned int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  unint64_t v23 = (a2 >> ((-125 * (v21 ^ 0x19)) ^ 0x26u)) + (a1 ^ HIDWORD(v22)) + (*(_DWORD *)(a19 + a7) ^ a3);
  *(_DWORD *)(a19 + 4 * a_Block_object_dispose(va, 8) = v23 + a3 - (v19 & (2 * v23));
  *(_DWORD *)(a19 + a7) = HIDWORD(v23) + a3 - ((2 * HIDWORD(v23)) & 0x48012BDE);
  BOOL v25 = a14 + 881512051 < 602814229 && a14 + 881512051 >= a12;
  return ((uint64_t (*)(void))(*(void *)(v20 + 8LL * (v21 ^ (894 * v25))) - 12LL))();
}

void sub_183DB4E14()
{
}

void sub_183DB4E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + v4) = v3;
}

void sub_183DB5680(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) - 3804331 * (((a1 | 0x841A70C4) - (a1 & 0x841A70C4)) ^ 0x7E848392);
  __asm { BR              X10 }

uint64_t sub_183DB5744@<X0>( uint64_t a1@<X8>, uint64_t a2, unint64_t *a3, int a4, uint64_t a5, int a6, int a7)
{
  int v10 = 108757529 * ((&a3 + 1471139878 - 2 * ((unint64_t)&a3 & 0x57AFD026)) ^ 0xB733B20D);
  a3 = &STACK[0xC6562B2033A24D7];
  a5 = v8;
  a4 = v10 ^ 0x7403AE0C;
  a6 = 1449743224 - v10;
  a7 = v7 - v10 - 957;
  uint64_t v11 = ((uint64_t (*)(unint64_t **))(*(void *)(a1 + 8LL * (v7 ^ 0x442)) - 8LL))(&a3);
  return ((uint64_t (*)(uint64_t))(*(void *)(v9
                                                      + 8LL
                                                      * ((763 * (*(_DWORD *)(v8 - 0x749AC022234F2832LL) == -1224190382)) ^ v7))
                                          - 12LL))(v11);
}

void sub_183DB581C(_DWORD *a1@<X8>)
{
  unint64_t v3 = *(void *)(v1 + 8)
     - v2
     - ((2 * (*(void *)(v1 + 8) - v2) - 0x2C668935C38380D0LL) & 0x9FB458340C8A03B6LL)
     + 0x39A6E77F24834173LL;
  *uint64_t v4 = (HIBYTE(v3) ^ 0x4F) - 2 * ((HIBYTE(v3) ^ 0x4F) & 0x3F) + 63;
  v4[1] = (BYTE6(v3) ^ 0xDA) + (~(2 * (BYTE6(v3) ^ 0xDA)) | 0x81) + 64;
  v4[2] = (BYTE5(v3) ^ 0x2C) - 2 * ((BYTE5(v3) ^ 0x2C) & 0x3F) + 63;
  v4[3] = (BYTE4(v3) ^ 0x1A) - 2 * ((BYTE4(v3) ^ 0x1A) & 0x3F) + 63;
  v4[4] = (BYTE3(v3) ^ 6) - 2 * ((BYTE3(v3) ^ 6) & 0x3F) + 63;
  void v4[5] = (BYTE2(v3) ^ 0x45) + (~(2 * (BYTE2(v3) ^ 0x45)) | 0x81) + 64;
  v4[6] = (BYTE1(v3) ^ 1) - 2 * ((BYTE1(v3) ^ 1) & 0x3F) + 63;
  v4[7] = v3 ^ 0xE4;
  *(_DWORD *)uint64_t v1 = *a1;
}

uint64_t sub_183DB5978(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x67843F9A1244BAC7LL);
  int v4 = v2 - 1756409276;
  BOOL v3 = v2 - 1756409276 < 0;
  int v5 = 1756409276 - v2;
  if (!v3) {
    int v5 = v4;
  }
  unsigned int v1 = *(_DWORD *)a1 - 235795823 * ((a1 - 590343418 - 2 * (a1 & 0xDCD01306)) ^ 0x487D5A5F);
  return ((uint64_t (*)(void))(*(void *)((char *)*(&off_189D4D580 + (int)((v1 + 291) ^ 0x3D3))
                                        + 8
                                        * (int)((((v5 ^ 0xFFE9DDD2) + 1450541 + ((v5 << (v1 - 101)) & 0xFFD3BBA4) < 0x7FFFFFFF)
                                               * ((v1 + 291) ^ 0x483)) ^ (v1 + 291))
                                        - 12)
                            - v1
                            + 606LL))();
}

uint64_t sub_183DB5A88(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * (((((*(_DWORD *)(*v2 + 4LL * v4) == v6) ^ ((v3 ^ v5) - 93)) & 1)
                                          * v5) ^ v3 ^ v5))
                            - 8LL))();
}

void sub_183DB5AC4()
{
}

uint64_t sub_183DB5AD0(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 4) = a3;
  return result;
}

void sub_183DB5AD8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_183DB5B64@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((730 * (**(_BYTE **)(a1 + 8) == 0)) ^ a2)) - 4LL))();
}

uint64_t sub_183DB5BB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  *(void *)(*(void *)(a16 + 96) + 504LL) = v18 + 1;
  *(_DWORD *)(*(void *)(a16 + 96) + 496LL) = a18 - 1;
  int v21 = 628203409 * ((((v20 - 152) | 0xE511188F) + (~(v20 - 152) | 0x1AEEE770)) ^ 0x679914BD);
  *(_DWORD *)(v20 - 144) = v21 + 1252841699;
  *(_DWORD *)(v20 - 152) = v21 + 1172345435;
  *(void *)(v20 - 136) = v20 + 0x14F8B44E17D2267ALL;
  uint64_t v22 = sub_183DA2A04(v20 - 152);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8LL
                                            * ((104
                                              * (a18
                                               + 1222433042
                                               + ((2 * (*(_DWORD *)(v20 - 184) & 0x1F)) ^ 0x16)
                                               + (*(_DWORD *)(v20 - 184) & 0x3F ^ 0x5BA7BD74u) > 0xFFFFFFBF)) ^ 0x139u)))(v22);
}

uint64_t sub_183DB5DA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  BOOL v21 = v18 + 508541193 < (a18 + 525562002);
  return ((uint64_t (*)(void))(*(void *)(v20 + 8LL * ((v21 * ((v19 - 824) ^ 0xFC)) ^ v19)) - 12LL))();
}

uint64_t sub_183DB5E10( int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  int v20 = (a1 + 310) ^ (a5 + 271);
  int v21 = 3804331 * ((((v19 - 152) | 0x332C2F75) - ((v19 - 152) & 0x332C2F75)) ^ 0xC9B2DC23);
  *(_DWORD *)(v19 - 152) = v21 + a1 + 945;
  *(_DWORD *)(v19 - 14_Block_object_dispose(va, 8) = (a18 - 1143376997) ^ v21;
  *(void *)(v19 - 144) = a15;
  uint64_t v22 = sub_183D97840(v19 - 152);
  uint64_t v23 = *(_DWORD *)(v19 - 184) & 0x3F;
  *(_BYTE *)(v19 - 252 + (v23 ^ 0x2B)) = -65;
  return ((uint64_t (*)(uint64_t))(*(void *)(v18
                                                      + 8LL
}

uint64_t sub_183DB5F00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, int a26, int a27)
{
}

uint64_t sub_183DB5F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL * ((47 * (((a6 + ((v7 - 2082497056) & 0xFFF2E9B6) - 495) ^ v6) > 7)) ^ v7))
                            - ((v7 + 885) | 0x14Du)
                            + 1365LL))();
}

uint64_t sub_183DB5F9C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v4 - 252 + a1 - 1704761610) = 0x3F3F3F3F3F3F3F3FLL;
  return (*(uint64_t (**)(void))(v3 + 8LL * ((58 * ((v2 ^ 0x5C6u) - 147LL == (v1 & 0x38))) ^ v2)))();
}

uint64_t sub_183DB5FEC@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)(v3 + a1 + v6) = a2;
  return (*(uint64_t (**)(void))(v8 + 8LL * (((v6 + v4 - 147 == v5) * v7) ^ v2)))();
}

uint64_t sub_183DB6014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
}

uint64_t sub_183DB6054( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int32x4_t a33, int32x4_t a34, int32x4_t a35, int32x4_t a36)
{
  uint64_t v45 = (uint64_t (*)(__n128, __n128, __n128, __n128))(*(void *)(v41 + 8LL * (a6 + v36 - 454)) - 12LL);
  HIDWORD(v107) = HIDWORD(a17) - 2094210994;
  LODWORD(v107) = -559396451;
  uint64_t v46 = (const char *)(v44 - 252);
  v47.n128_u64[0] = 0x3F3F3F3F3F3F3F3FLL;
  v47.n128_u64[1] = 0x3F3F3F3F3F3F3F3FLL;
  __n128 v48 = (__n128)vdupq_n_s32(0x37085657u);
  __n128 v49 = (__n128)vdupq_n_s32(0xB7085652);
  a27 = v40 - 16;
  v50.n128_u64[0] = 0x7E7E7E7E7E7E7E7ELL;
  v50.n128_u64[1] = 0x7E7E7E7E7E7E7E7ELL;
  HIDWORD(a26) = 214;
  LODWORD(a25) = 21;
  unsigned int v51 = *(_DWORD *)(v44 - 180);
  unsigned int v52 = *(_DWORD *)(v44 - 176);
  unsigned int v54 = *(_DWORD *)(v44 - 172);
  unsigned int v53 = *(_DWORD *)(v44 - 168);
  uint64_t v55 = v54;
  uint64_t v56 = v53;
  int v57 = *(_BYTE *)(v44 - 156) ^ 0x2B;
  HIDWORD(a20) = *(unsigned __int8 *)(v44 - 156) ^ 0x2B;
  if (v57 == 2)
  {
    unint64_t v108 = __PAIR64__(v52, v51);
    unint64_t v110 = __PAIR64__(v53, v54);
    int8x16x4_t v113 = vld4q_s8(v46);
    LODWORD(a20) = *(_DWORD *)(v44 - 164);
    uint8x16_t v84 = (uint8x16_t)veorq_s8(v113.val[0], (int8x16_t)v47);
    uint16x8_t v85 = vmovl_u8(*(uint8x8_t *)v84.i8);
    uint16x8_t v86 = vmovl_high_u8(v84);
    uint8x16_t v87 = (uint8x16_t)veorq_s8(v113.val[1], (int8x16_t)v47);
    _Q21 = vmovl_u8(*(uint8x8_t *)v87.i8);
    _Q20 = vmovl_high_u8(v87);
    __asm
    {
      SHLL2           V22.4S, V20.8H, #0x10
      SHLL2           V23.4S, V21.8H, #0x10
    }

    uint8x16_t v92 = (uint8x16_t)veorq_s8(v113.val[2], (int8x16_t)v47);
    uint16x8_t v93 = vmovl_high_u8(v92);
    uint16x8_t v94 = vmovl_u8(*(uint8x8_t *)v92.i8);
    v113.val[0] = veorq_s8(v113.val[3], (int8x16_t)v47);
    v113.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v113.val[0]);
    v113.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v113.val[1]);
    v113.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v113.val[1].i8);
    v113.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v113.val[0].i8);
    v113.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v113.val[0]);
    v113.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v113.val[0].i8);
    int32x4_t v95 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v94.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v85.i8), 0x18uLL)),  v113.val[0]);
    int32x4_t v96 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v94, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v85), 0x18uLL)),  v113.val[3]);
    int32x4_t v97 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v93.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v86.i8), 0x18uLL)),  v113.val[1]);
    int32x4_t v98 = (int32x4_t)vorrq_s8( vorrq_s8( vorrq_s8(_Q22, (int8x16_t)vshll_high_n_u16(v93, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v86), 0x18uLL)),  v113.val[2]);
    v113.val[0] = veorq_s8( vandq_s8((int8x16_t)v95, (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)v113.val & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    v113.val[3] = veorq_s8( vandq_s8((int8x16_t)v96, (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v113.val[3] & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    v113.val[1] = veorq_s8( vandq_s8((int8x16_t)v97, (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v113.val[1] & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    v113.val[2] = veorq_s8( vandq_s8((int8x16_t)v98, (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v113.val[2] & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    a35 = vaddq_s32(vsubq_s32(v97, vaddq_s32((int32x4_t)v113.val[1], (int32x4_t)v113.val[1])), (int32x4_t)v49);
    a36 = vaddq_s32(vsubq_s32(v98, vaddq_s32((int32x4_t)v113.val[2], (int32x4_t)v113.val[2])), (int32x4_t)v49);
    a33 = vaddq_s32(vsubq_s32(v95, vaddq_s32((int32x4_t)v113.val[0], (int32x4_t)v113.val[0])), (int32x4_t)v49);
    a34 = vaddq_s32(vsubq_s32(v96, vaddq_s32((int32x4_t)v113.val[3], (int32x4_t)v113.val[3])), (int32x4_t)v49);
    unsigned int v99 = (_DWORD *)&a33 + v42 + 207859078;
    int v100 = *(v99 - 8) ^ *(v99 - 3);
    int v101 = v100 + v39 - (v37 & (2 * v100));
    int v102 = *(v99 - 16) ^ *(v99 - 14);
    uint64_t v103 = v102 ^ 0x37085652 ^ v101;
    HIDWORD(v104) = v102 ^ 0x37085652 ^ v101;
    LODWORD(v104) = v102 ^ ~v101;
    uint64_t v105 = (v104 >> 31) + v39 - (v37 & (2 * (v104 >> 31)));
    *unsigned int v99 = v105;
    unsigned int v106 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 + 8LL * (int)((19 * (v40 != 207859015)) ^ a5 ^ (a5 + 651))) - 12LL);
    return v106( v106,  v105,  a27,  v103,  a5,  v55,  v52,  v56,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  v107,  v108,  v110,  v45,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32);
  }

  else if (v57 == 1)
  {
    unint64_t v109 = __PAIR64__(v53, v54);
    unsigned int v111 = v45;
    int8x16x4_t v112 = vld4q_s8(v46);
    uint8x16_t v58 = (uint8x16_t)veorq_s8(v112.val[0], (int8x16_t)v47);
    uint16x8_t v59 = vmovl_u8(*(uint8x8_t *)v58.i8);
    int8x16_t v60 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v59.i8);
    int8x16_t v61 = (int8x16_t)vmovl_high_u16(v59);
    uint16x8_t v62 = vmovl_high_u8(v58);
    int8x16_t v63 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v62.i8);
    int8x16_t v64 = (int8x16_t)vmovl_high_u16(v62);
    uint8x16_t v65 = (uint8x16_t)veorq_s8(v112.val[1], (int8x16_t)v47);
    uint16x8_t v66 = vmovl_high_u8(v65);
    uint16x8_t v67 = vmovl_u8(*(uint8x8_t *)v65.i8);
    uint8x16_t v68 = (uint8x16_t)veorq_s8(v112.val[2], (int8x16_t)v47);
    _Q25 = (int8x16_t)vmovl_high_u8(v68);
    _Q24 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v68.i8);
    int8x16_t v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q24.i8, 0x10uLL);
    __asm { SHLL2           V24.4S, V24.8H, #0x10 }

    int8x16_t v76 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }

    v112.val[0] = veorq_s8(v112.val[3], (int8x16_t)v47);
    v112.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v112.val[0]);
    v112.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v112.val[1]);
    v112.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v112.val[0].i8);
    v112.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v112.val[0]);
    v112.val[0] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v112.val[0].i8), 0x18uLL), v71),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v67.i8, 8uLL), v60));
    v112.val[3] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v112.val[3], 0x18uLL), _Q24),  vorrq_s8((int8x16_t)vshll_high_n_u16(v67, 8uLL), v61));
    v112.val[1] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v112.val[1].i8), 0x18uLL), v76),  vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v66.i8, 8uLL), v63));
    v112.val[2] = vorrq_s8( vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v112.val[2], 0x18uLL), _Q25),  vorrq_s8((int8x16_t)vshll_high_n_u16(v66, 8uLL), v64));
    int32x4_t v77 = (int32x4_t)veorq_s8( vandq_s8(v112.val[0], (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v60 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    int32x4_t v78 = (int32x4_t)veorq_s8( vandq_s8(v112.val[3], (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v61 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    int32x4_t v79 = (int32x4_t)veorq_s8( vandq_s8(v112.val[1], (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v63 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    int32x4_t v80 = (int32x4_t)veorq_s8( vandq_s8(v112.val[2], (int8x16_t)v48),  (int8x16_t)(*(_OWORD *)&v64 & __PAIR128__(0xFFFFFF05FFFFFF05LL, 0xFFFFFF05FFFFFF05LL)));
    a35 = vaddq_s32(vsubq_s32((int32x4_t)v112.val[1], vaddq_s32(v79, v79)), (int32x4_t)v49);
    a36 = vaddq_s32(vsubq_s32((int32x4_t)v112.val[2], vaddq_s32(v80, v80)), (int32x4_t)v49);
    a33 = vaddq_s32(vsubq_s32((int32x4_t)v112.val[0], vaddq_s32(v77, v77)), (int32x4_t)v49);
    a34 = vaddq_s32(vsubq_s32((int32x4_t)v112.val[3], vaddq_s32(v78, v78)), (int32x4_t)v49);
    unsigned int v81 = (v51 ^ v38)
        - 1832265140
        + ((v53 ^ v38) & (v52 ^ 0x8B2A4693) | (v52 ^ v38) & ((v38 + 320) ^ 0x3C0 ^ v54))
        + *((_DWORD *)*(&off_189D4D580 + HIDWORD(a26)) + a27 + v42)
        + (a33.i32[(byte_183DC8D61[a27 + v42] - 56)] ^ v39);
    int v82 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 8LL * ((1167 * (a27 + 1 == v40)) ^ 0x152u));
    return v82( a27 + 1,  v82,  207859078LL,  960LL,  v55,  ((v81 + v38 - (v43 & (2 * v81))) ^ v38) << (*((_BYTE *)*(&off_189D4D580 + a25) + a27 + v42 - 4)
                                                       - 75),
             v52,
             v53,
             a9,
             a10,
             a11,
             a12,
             a13,
             a14,
             a15,
             a16,
             a17,
             a18,
             a19,
             a20,
             v107,
             __PAIR64__(v52, v51),
             v109,
             v111,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32);
  }

  else
  {
    *(_DWORD *)(v44 - 180) = 2 * (v51 ^ v38) + v38 - (v43 & (4 * (v51 ^ v38)));
    *(_DWORD *)(v44 - 176) = 2 * (v52 ^ v38) + v38 - (v43 & (4 * (v52 ^ v38)));
    *(_DWORD *)(v44 - 172) = 2 * (v54 ^ v38) + v38 - (v43 & (4 * (v54 ^ v38)));
    *(_DWORD *)(v44 - 16_Block_object_dispose(va, 8) = 2 * (v53 ^ v38) + v38 - (v43 & (4 * (v53 ^ v38)));
    a28 = 0LL;
    return v45(v47, v48, v49, v50);
  }

uint64_t sub_183DB6F00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20, unsigned int a21, unsigned int a22)
{
  else {
    BOOL v23 = a19 - 2111231739 > a22;
  }
  return (*(uint64_t (**)(BOOL))(v22 + 8LL * ((!v23 | (!v23 << 10)) ^ (a6 - 2083354752))))(a19 - 2111231739 > a22);
}

uint64_t sub_183DB6F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL
                                        * ((1718 * (v8 + 531519285 + ((v7 - 1744861717) & 0x83D28EBA) >= v8 + a7)) ^ v7))
                            - ((v7 - 1410401295) & 0x3DE ^ 0x358LL)))();
}

uint64_t sub_183DB7014( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return ((uint64_t (*)(void))(*(void *)(v19
                                        + 8LL
                                        * (((a6 + ((a2 - 2138012508) | 0x3420032) - 307)
                                          * ((unint64_t)(~a18 + v18 - a3) < 0x10)) ^ a2))
                            + 2211612718LL
                            - ((a2 - 2092958508) | 0x928802u)))();
}

uint64_t sub_183DB708C@<X0>(int a1@<W5>, int a2@<W6>, uint64_t a3@<X8>)
{
  *(_BYTE *)(v4 + a3) = *(_BYTE *)(v7 + (v3 + a2))
  return ((uint64_t (*)(void))(*(void *)(v8
}

uint64_t sub_183DB70D8( int a1, int8x16_t a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12)
{
  *int v13 = vaddq_s8( vsubq_s8( *(int8x16_t *)(v14 + (v12 + a11)),  vandq_s8( vaddq_s8( *(int8x16_t *)(v14 + (v12 + a11)),  *(int8x16_t *)(v14 + (v12 + a11))),  a5)),  a2);
  return ((uint64_t (*)(void))(*(void *)(v15 + 8LL * (a12 ^ (a10 + a1 - 135))) - (a1 - a9 + 88) + 76LL))();
}

uint64_t sub_183DB7138@<X0>(int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * (int)((((a2 - 1704761610) < 0x38) * (v2 ^ 0x83D28BDE)) ^ (a1 + v2 - 29))))();
}

uint64_t sub_183DB717C@<X0>(int a1@<W4>, unsigned int a2@<W8>)
{
  uint64_t v4 = a2;
  unint64_t v5 = a2 - 3916374331LL + (a1 + v2 - 1129);
  if (v5 <= 0x38) {
    unint64_t v5 = 56LL;
  }
}

uint64_t sub_183DB71E4()
{
  *(void *)(v4 - 252 + v1 - 1704761610) = 0x3F3F3F3F3F3F3F3FLL;
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((((((v2 ^ 0x74u) - 1085LL) & v0) != 8) * ((((v2 ^ 0x74) + 51) | 1) ^ 0x41D)) ^ v2 ^ 0x74))
                            - 8LL))();
}

uint64_t sub_183DB724C(double a1)
{
  *(double *)(v2 + v5) = a1;
  return ((uint64_t (*)(void))(*(void *)(v6 + 8LL * (((v3 != v5) * v4) ^ v1)) - 8LL))();
}

uint64_t sub_183DB7270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v9
                                        + 8LL * (((((v8 - a6 - 34605688) | 0x2100812) ^ (a5 + 397)) * (v6 == v7)) ^ v8))
                            - 8LL))();
}

void sub_183DB72BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  int v7 = *(unsigned __int8 *)(v6 - 156) ^ 0x2B;
  if (v7 == 1)
  {
    unsigned int v15 = *(_DWORD *)(v6 - 188);
    unsigned int v14 = *(_DWORD *)(v6 - 184);
    *(_BYTE *)(v6 - 196) = ((8 * v14) ^ 0x58) - ((2 * ((8 * v14) ^ 0x58)) & 0x70) + 63;
    *(_BYTE *)(v6 - 195) = ((v14 >> 5) ^ 0x35) - ((((v14 >> 5) ^ 0x35) << (((a5 - 67) ^ 0xEE) & 0xF7)) & 0x7E) + 63;
    *(_BYTE *)(v6 - 194) = ((v14 >> 13) ^ 0xA4) - 2 * (((v14 >> 13) ^ 0xA4) & 0x3F) + 63;
    *(_BYTE *)(v6 - 193) = ((v14 >> 21) ^ 0x78) - 2 * (((v14 >> 21) ^ 0x78) & 0x3F) + 63;
    HIDWORD(v16) = v15 ^ 0xC;
    LODWORD(v16) = v14 ^ 0xA0000000;
    *(_BYTE *)(v6 - 192) = (v16 >> 29) - 2 * ((v16 >> 29) & 0x3F) + 63;
    *(_BYTE *)(v6 - 191) = ((v15 >> 5) ^ 0x57) - 2 * (((v15 >> 5) ^ 0x57) & 0x3F) + 63;
    *(_BYTE *)(v6 - 190) = ((v15 >> 13) ^ 0xB7) - 2 * (((v15 >> 13) ^ 0xB7) & 0x3F) + 63;
    char v11 = (a5 - 67) & 0xF7;
    char v12 = 126;
    unsigned int v13 = (v15 >> 21) ^ 0xFFFFFFE6;
  }

  else
  {
    if (v7 != 2) {
      goto LABEL_6;
    }
    unsigned int v8 = *(_DWORD *)(v6 - 188);
    unsigned int v9 = *(_DWORD *)(v6 - 184);
    *(_BYTE *)(v6 - 196) = ((v8 >> 21) ^ 0xE6) + ~((a6 + a5 + 123) & (2 * ((v8 >> 21) ^ 0xE6))) + 64;
    *(_BYTE *)(v6 - 195) = ((v8 >> 13) ^ 0xB7) - 2 * (((v8 >> 13) ^ 0xB7) & 0x3F) + 63;
    *(_BYTE *)(v6 - 194) = ((v8 >> 5) ^ 0x57) - 2 * (((v8 >> 5) ^ 0x57) & 0x3F) + 63;
    HIDWORD(v10) = v8 ^ 0xC;
    LODWORD(v10) = v9 ^ 0xA0000000;
    *(_BYTE *)(v6 - 193) = (v10 >> 29) - 2 * ((v10 >> 29) & 0x3F) + 63;
    *(_BYTE *)(v6 - 192) = ((v9 >> 21) ^ 0x78) + (~(2 * ((v9 >> 21) ^ 0x78)) | 0x81) + 64;
    *(_BYTE *)(v6 - 191) = ((v9 >> 13) ^ 0xA4) - 2 * (((v9 >> 13) ^ 0xA4) & 0x3F) + 63;
    *(_BYTE *)(v6 - 190) = ((v9 >> 5) ^ 0x35) - 2 * (((v9 >> 5) ^ 0x35) & 0x3F) + 63;
    char v11 = a6 + a5 - 28;
    char v12 = 112;
    LOBYTE(v13) = (8 * v9) ^ 0x58;
  }

  *(_BYTE *)(v6 - 189) = v13 - (((_BYTE)v13 << (((v11 + 15) ^ 0xF7) & 0x3B)) & v12) + 63;
LABEL_6:
  JUMPOUT(0x183DB63C4LL);
}

uint64_t sub_183DB7734( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = (v12 + v8);
  int v16 = *(_DWORD *)(v14 - 252 + v15 + 72);
  *(_BYTE *)(a8 + (v15 + 1)) = (BYTE2(v16) ^ 0xD5) - 2 * ((BYTE2(v16) ^ 0xD5) & 0x3F) + 63;
  *(_BYTE *)(a8 + (v15 + 2)) = (BYTE1(v16) ^ 0xB9) - 2 * ((BYTE1(v16) ^ 0xB9) & 0x3F) + 63;
  *(_BYTE *)(a8 + v15) = (HIBYTE(v16) ^ 0x74) - (((v9 - a6) ^ 0x4C) & (2 * (HIBYTE(v16) ^ 0x74))) + 63;
  *(_BYTE *)(a8 + (v15 + 3)) = v16 ^ 0x53;
  LODWORD(v15) = *(_DWORD *)(v14 - 160) + 67315112;
  BOOL v17 = v15 < v11;
  BOOL v18 = v12 - 412566183 < v15;
  if (v12 - 412566183 < v11 != v17) {
    BOOL v18 = v17;
  }
  return ((uint64_t (*)(void))(*(void *)(v13 + 8LL * ((v18 * v10) ^ v9)) - 8LL))();
}

void sub_183DB78A4()
{
}

uint64_t sub_183DB78AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
  *(_DWORD *)(&a33 + a2_Block_object_dispose(va, 8) = 227975378;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 + 8LL * ((v33 + 294) ^ 0x20C)) - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24);
}

uint64_t sub_183DB795C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * (((v1 == (((v0 + 9568013) | 0x83408830) ^ 0xF1750172)) * (((4 * v0) ^ 0x248) + 87)) ^ v0)))();
}

uint64_t sub_183DB79B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  return ((uint64_t (*)(void))(*(void *)(v19
                                        + 8LL
                                        * ((42
                                          * (((((v18 - 2009951133) & 0x77CD6E91 ^ 0xA4849224) + a5) & 0xFFFFFFFC) - a18 == -1534814543)) ^ v18))
                            - 4LL))();
}

uint64_t sub_183DB7A10@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (v1 + 32 * (a1 != ((v1 + 26379135) | 0x82400022) - 1983637344)))
}

uint64_t sub_183DB7A5C( uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, int a32, int a33)
{
  int v35 = 52 * (v33 ^ (a4 + 5));
  unsigned int v36 = (v33 - 876472893) & 0xB06B67DB;
  int v37 = a6 + v33 + 13;
  BOOL v38 = a33 + 1113504403 < (a5 - 271424432);
  return ((uint64_t (*)(void))(*(void *)(v34 + 8LL * ((v38 * (v35 ^ 0x120)) | v37)) - 8LL))();
}

uint64_t sub_183DB7C0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v18 = 628203409 * ((((2 * (v17 - 152)) | 0x18198006) - (v17 - 152) - 202162179) ^ 0x8E84CC30);
  *(void *)(v17 - 12_Block_object_dispose(va, 8) = a13;
  *(void *)(v17 - 112) = v14;
  *(void *)(v17 - 104) = a11;
  *(_DWORD *)(v17 - 136) = v16 - v18 + 775;
  *(_DWORD *)(v17 - 132) = a5 - v18 + ((v16 + 1191) ^ 0x1DF175E5);
  *(void *)(v17 - 152) = a12;
  *(void *)(v17 - 144) = a10;
  uint64_t v20 = v13;
  ((void (*)(uint64_t))((char *)*(&off_189D4D580 + (v16 ^ 0x17D)) - 12))(v17 - 152);
  return ((uint64_t (*)(uint64_t))(*(void *)(v15
                                                      + 8LL
                                                      * ((1136
                                                        * (*(_DWORD *)(v17 - 120) == ((v16 + 12582670) | 0x83128820)
                                                                                   + 859164192)) ^ v16))
                                          - 4LL))(v20);
}

uint64_t sub_183DB7D1C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
                                        * (((*(_DWORD *)(a1 + 48LL * (v5 + v4)) != ((a4 + v6 - 1451) ^ 0x8923A90D))
                                          * (v6 ^ 0x601)) ^ v6))
                            - 12LL))();
}

uint64_t sub_183DB7D74@<X0>(int a1@<W3>, int a2@<W5>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * ((105
                                          * ((a3 ^ 0x8BCED76E) == (v4 ^ 0x13A ^ (a1 + 1137) ^ 0xF40EDEC1 ^ ((v4 ^ 0x13A) - a2 - 654))
                                                                + v3)) ^ v4 ^ 0x13A))
                            - 8LL))();
}

void sub_183DB7DD4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  __asm { BR              X10 }

uint64_t sub_183DB7EB4@<X0>( uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, int a28)
{
  *(_DWORD *)(v28 + 392) = a3;
  *(_DWORD *)(v28 + 396) = a27;
  *(void *)(v28 + 400) = a25;
  *(_DWORD *)(v28 + 40_Block_object_dispose(va, 8) = a28 - a2 + 805016546;
  *(void *)(v28 + 416) = v29 + (a2 - 149885707);
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 48LL * v32 + 8))(a11, a20);
  return ((uint64_t (*)(uint64_t))(*(void *)(v31
                                                      + 8LL
                                                      * ((2023
                                                        * (v34
                                                         + v30
                                                         - ((((v33 - 2092955890) | 0x928020) - 365026190) & (2 * v34)) == v30 + v33 - 20 - 240)) ^ v33))
                                          - 4LL))(a22);
}

uint64_t sub_183DB7F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                + 8LL
                                                                                * (((v4 < (((v5 - 240) | 0x104u) ^ 0x107uLL))
                                                                                  * ((v5 ^ 0x1F4) + 1313)) ^ v5)))( a1,  a2,  a3,  a4,  v7);
}

uint64_t sub_183DB7FD8@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((((a2 + 223901990 + *(_DWORD *)(a1 + 48LL * v3 + 36) - 875) < 0x80000003)
                                          * (a2 ^ 0x1B7)) ^ a2))
                            - 4LL))();
}

uint64_t sub_183DB8034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return ((uint64_t (*)(void))(*(void *)(v8
                                        + 8LL
                                        * ((605 * (*v7 - 227975378 < a6 + ((v6 - 673538822) & 0xABF7EA33) - 499)) ^ v6))
                            - 4LL))();
}

uint64_t sub_183DB8090@<X0>( uint64_t a1@<X0>, int a2@<W4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, int a28)
{
  int v35 = &v30[6 * v29];
  v35[2] = v32;
  v35[3] = a2;
  *((void *)v35 + 2) = v31;
  v35[6] = a28;
  *int v30 = a3 + 1;
  return ((uint64_t (*)(void))(2211612718LL
                            - (v28 + 1229)
                            - ((v28 - 2116911346) | 0x2000820u)
                            + *(void *)(v33
                                        + 8LL
                                        * ((509
}

uint64_t sub_183DB812C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W5>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, unsigned int a30)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v31
                                                                                         + 8LL
                                                                                         * (int)(((v30 != -1224190382)
                                                                                                * (a5
                                                                                                 + ((5 * (a6 ^ 0x57E) - 1613252852) & 0xE3FACDBA)
                                                                                                 + 1527)) ^ (5 * (a6 ^ 0x57E))))
                                                                             - ((5 * (a6 ^ 0x57Eu) + 294) ^ 0x499LL)))( a1,  a2,  a3,  a4,  a30);
}

uint64_t sub_183DB81A0()
{
  BOOL v5 = v2 != 1923582272 || *v1 != ((v0 - 1343036126) & 0xD3DF9E7E ^ 0x8E4417EF) + v0 - 924;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * ((524 * v5) ^ v0)) - 8LL))();
}

void sub_183DB8204()
{
}

void sub_183DB8284(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X11 }

uint64_t sub_183DB836C@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v12 = v8 & 0x688747A3;
  unsigned int v13 = 1755732067 * ((&a4 & 0xA96767C1 | ~(&a4 | 0xA96767C1)) ^ 0x885E25E5);
  a8 = v13 ^ 0x5C6474CC;
  a6 = ((v8 & 0x688747A3) - 713) ^ v13;
  a7 = &STACK[0x76D4F6DCACF2CDA2];
  a4 = &STACK[0xB36971A36B56DC4];
  a5 = v11;
  uint64_t v14 = (*(uint64_t (**)(unint64_t **))(a1 + 8LL * ((v8 & 0x688747A3) - 1154)))(&a4);
  return ((uint64_t (*)(uint64_t))(*(void *)(v10
                                                      + 8LL
                                                      * (((4
}

uint64_t sub_183DB845C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  return (*(uint64_t (**)(void))(v11
                              + 8LL
}

void sub_183DB84B4(_DWORD *a1@<X8>)
{
  int v3 = v5[3] ^ 0x3F;
  int v4 = ((*v5 ^ 0x3F) << 24) | ((v5[1] ^ 0x3F) << 16) | ((v5[2] ^ 0x3F) << 8) | v3;
  *(_DWORD *)(*(void *)(v1 + 8) - 0x130F29621C6D0938LL) = v4 + v2 - 2 * (v4 & 0x37085657 ^ v3 & 5);
  *(_DWORD *)(v1 + 4) = *a1;
}

void sub_183DB856C(uint64_t a1)
{
  int v1 = 460628867 * ((((2 * a1) | 0x69ED4642) - a1 - 888578849) ^ 0x7860215C);
  __asm { BR              X9 }

uint64_t sub_183DB8628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(uint64_t, void))(*(void *)(a2
                                                              + 8LL
                                                              * ((1551
                                                                * (((v2 == 713101540) ^ (v3 + 112)) & 1)) ^ v3))
                                                  - 8LL))( a1,  (v3 - 1137261500) & 0x43C93BF6);
}

uint64_t sub_183DB8690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 + 8LL * ((2 * (v4 ^ 0x11E)) ^ 6)) - 4LL))( a1,  v3 - 0x67843F9A1244BAC3LL,  311LL,  11LL,  4294966888LL,  (v2 - 243),  939447337LL,  402LL);
}

uint64_t sub_183DB874C@<X0>(int a1@<W4>, unsigned int a2@<W7>, uint64_t a3@<X8>)
{
}

uint64_t sub_183DB87B8(uint64_t result)
{
  *(_DWORD *)(result + 12) = -743333648;
  return result;
}

uint64_t sub_183DB89B4(uint64_t a1, uint64_t a2)
{
  return off_189D494D0[(29 * (*(_DWORD *)(a2 + 4) == 1534814555)) ^ 0x2CDu]();
}

uint64_t sub_183DB89F4(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(a1 + 96) + 448LL) = *(_BYTE *)(*(void *)(a2 + 8) + 12LL);
  return (*(uint64_t (**)(void))(v2 + 5856))();
}

void sub_183DB8A6C()
{
}

uint64_t sub_183DB8A74@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void sub_183DB8A7C(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)a1 ^ (1759421093 * ((a1 - 2 * (a1 & 0xF4FD5159) - 184725159) ^ 0x4780E10D));
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 48) ^ (1759421093 * ((a1 - 2 * (a1 & 0xF4FD5159) - 184725159) ^ 0x4780E10D));
  unsigned int v5 = 1224239923 * ((&v7 & 0x6D369F0D | ~(&v7 | 0x6D369F0D)) ^ 0x607A9D25);
  int v6 = *(_DWORD *)(a1 + 24) - 1759421093 * ((a1 - 2 * (a1 & 0xF4FD5159) - 184725159) ^ 0x4780E10D) - v5;
  uint64_t v14 = *(void *)(a1 + 8);
  int v13 = v6 + 24461804;
  uint64_t v7 = v3;
  uint64_t v11 = v3;
  uint64_t v12 = v2;
  int v9 = v5 ^ (v1 + 368399033);
  int v10 = v4 - v5 - 2 * ((v4 + 1095813150) & 0x70AC1E37 ^ v4 & 1) - 1308826028;
  sub_183DBA1C4((uint64_t)&v7);
  __asm { BR              X8 }

uint64_t sub_183DB8BF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unint64_t *a12, char a13, int a14, uint64_t a15, int a16)
{
  char v24 = *(_BYTE *)(v16 + 28) - v23;
  unsigned int v25 = ((((2 * &a11) | 0xDC826EDC) - &a11 + 297715858) ^ 0x5D3C873A) * v20;
  a12 = &STACK[0x36BFEA2E21032E0D];
  a15 = v22;
  a14 = v21 + v25 + 563681201;
  a16 = v19 - v25 - 992;
  a13 = ((v24 ^ 0x87) + ((v19 - 84) ^ 0xD4 ^ (2 * v24) & 0xFB) - 96) ^ (((((2 * &a11) | 0xDC)
                                                                        - &a11
                                                                        - 110) ^ 0x3A)
                                                                      * v20);
  uint64_t v26 = ((uint64_t (*)(int *))(*(void *)(v17 + 8LL * (v19 - 1103)) - 4LL))(&a11);
  return ((uint64_t (*)(uint64_t))(*(void *)(v18 + 8LL * ((461 * (a11 == -1224190382)) ^ v19)) - 8LL))(v26);
}

uint64_t sub_183DB8CDC()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((((((v0 - 991670952) < 0xFFFFFFFE) ^ (v2 - 4) ^ 0x21) & 1)
                                          * (((v2 + 508) | 0x58) - 1130)) ^ v2))
                            - 4LL))();
}

void sub_183DB8D28(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x130F29621C6D0938LL) = v1 + 1;
  *(_DWORD *)(v2 + 4) = -1224190382;
}

void sub_183DB8E98(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v2 = 1374699841 * (((a1 | 0xEA022A98) - (a1 & 0xEA022A98)) ^ 0x87F63291);
  int v3 = *(_DWORD *)(a1 + 40) + v2;
  unsigned int v4 = v3 + 460628867 * (((&v4 | 0x45D3A2CF) + (~&v4 | 0xBA2C5D30)) ^ 0x94520B3) - 231789821;
  nullsub_1(&v4);
  __asm { BR              X17 }

uint64_t sub_183DB9008()
{
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v4 ^ ((((v1 + 1) & 0x7FFFFFFC) != v3) * v0))) - 12LL))();
}

void sub_183DB9030()
{
}

uint64_t sub_183DB903C@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (int)(((((v4 + 113) ^ v5) & 1)
                                               * ((v4 - 608778639) ^ 0xDBB6C992)) ^ v4))
                            - 12LL))();
}

uint64_t sub_183DB90A0()
{
  unsigned int v3 = v1 - ((((v2 & 0x244937EF) + 1899733874) & 0x8EC45BD8 ^ 0xE8658CA0) & (2 * v1 + 1225338212)) - 1732813458;
  BOOL v4 = (((v2 & 0x244937EF) + 66) ^ 0xE8658FBF ^ (2 * v3) & 0xFFF7FF76) + (v3 ^ 0x8BC93907) - 1520440464 == 626780971;
  return (*(uint64_t (**)(void))(v0 + 8LL * ((v4 | (2 * v4)) ^ v2 & 0x244937EFu)))();
}

uint64_t sub_183DB914C()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((1049
}

uint64_t sub_183DB9190@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 - 0x42E48BBDD224DE3DLL) = v2;
  uint64_t v5 = *(void *)(v3 + 32);
  *(void *)(*(void *)(v3 + 24) - 0x27EFF0CD9F36B463LL) = result;
  *(_DWORD *)(v5 - 0x3AA4CED55BA13F8DLL) = v4;
  *(_DWORD *)uint64_t v3 = -1224190382;
  return result;
}

uint64_t sub_183DB9534(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v2 = 1759421093 * (((a1 | 0x72C27792) - (a1 & 0x72C27792)) ^ 0xC1BFC7C6);
  int v3 = *(_DWORD *)(a1 + 20) - v2;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 24);
  unsigned int v6 = v2 ^ *(_DWORD *)(a1 + 16) ^ 0x9B6D4F7C;
  int v7 = 1374699841 * ((&v10 + 1172917496 - 2 * ((unint64_t)&v10 & 0x45E94CF8)) ^ 0x281D54F1);
  int v8 = v2 + *(_DWORD *)a1 + v7 - 388784521;
  int v13 = v3 - v7 - 2138963139;
  int v14 = v8;
  int v15 = v6 - v7;
  uint64_t v12 = v5;
  uint64_t v10 = v4;
  uint64_t result = ((uint64_t (*)(uint64_t *))*(&off_189D4D580 + (v3 ^ 0x7F7DFD3D)))(&v10);
  *(_DWORD *)(a1 + 4) = v11;
  return result;
}

uint64_t sub_183DB9674(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v2 = 1755732067 * (a1 ^ 0xDEC6BDDB);
  int v3 = *(_DWORD *)(a1 + 20) - v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 16) - v2;
  v3 += 2024873178;
  unsigned int v9 = 235795823 * ((&v11 & 0x3A4B01DF | ~(&v11 | 0x3A4B01DF)) ^ 0x5119B779);
  int v16 = v9 ^ (v3 + 1682);
  uint64_t v11 = v7;
  uint64_t v17 = v5;
  uint64_t v13 = v6;
  uint64_t v14 = v4;
  unsigned int v12 = v9 + (v8 ^ 0xC4417E70) + 1139511232 + ((2 * v8) & 0xFE6BE6E2 ^ 0x76690202);
  uint64_t result = ((uint64_t (*)(uint64_t *))((char *)*(&off_189D4D580 + v3) - 4))(&v11);
  *(_DWORD *)(a1 + 40) = v15;
  return result;
}

uint64_t sub_183DB97B0(uint64_t result)
{
  uint64_t v1 = 235795823 * ((((2 * result) | 0xAE1C50A9AAB8544LL) - result - 0x570E2854D55C2A2LL) ^ 0xDC0587BD9F88BFBLL);
  int v2 = *(_DWORD *)(result + 40) - v1;
  int v3 = *(_DWORD *)(result + 20) - v1;
  unint64_t v4 = *(void *)(result + 8) ^ v1;
  int v5 = *(_DWORD *)(result + 36) ^ v1;
  unint64_t v6 = *(void *)(result + 24) - v1;
  int v7 = *(_DWORD *)(result + 32) ^ v1;
  BOOL v8 = v4 == v6;
  BOOL v9 = v4 > v6;
  int v10 = v8;
  if ((v5 & 1) == 0) {
    BOOL v9 = v10;
  }
  if (v9) {
    int v7 = v3;
  }
  *(_DWORD *)uint64_t result = v7 ^ v2;
  return result;
}

void sub_183DB9850(_DWORD *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  signed int v1 = *a1 - 1225351577 * (((a1 | 0x8B357C10) - (a1 & 0x8B357C10)) ^ 0xF5CAE622) - 426522897;
  uint64_t v2 = *(void *)((char *)*(&off_189D4D580 + v1) - 4);
  unsigned int v3 = v1
  uint64_t v4 = v2;
  sub_183D976DC((uint64_t)&v3);
}

uint64_t sub_183DB9938(char a1, unsigned int a2)
{
  return byte_183DC8EC0[(byte_183DC5680[a2] ^ a1)] ^ a2;
}

uint64_t sub_183DB9964(unsigned int a1)
{
  return byte_183DC8EC0[byte_183DC5680[a1] ^ 0x69] ^ a1;
}

uint64_t sub_183DB9990(char a1, unsigned int a2)
{
  return byte_183DC8FC0[(byte_183DC5780[a2] ^ a1)] ^ a2;
}

uint64_t sub_183DB99BC(unsigned int a1)
{
  return byte_183DC8FC0[byte_183DC5780[a1] ^ 0xE5] ^ a1;
}

uint64_t sub_183DB99E8(char a1, unsigned int a2)
{
  return byte_183DC5880[(byte_183DD08A0[a2] ^ a1)] ^ a2;
}

uint64_t sub_183DB9A14(unsigned int a1)
{
  return byte_183DC5880[byte_183DD08A0[a1] ^ 0xBA] ^ a1;
}

uint64_t sub_183DB9A40(char a1, unsigned int a2)
{
  return byte_183DD09A0[(byte_183DCCF90[a2] ^ a1)] ^ a2;
}

uint64_t sub_183DB9A6C(unsigned int a1)
{
  return byte_183DD09A0[byte_183DCCF90[a1] ^ 6] ^ a1;
}

uint64_t sub_183DB9A94(char a1, unsigned int a2)
{
  return byte_183DCD090[(byte_183DC90C0[a2] ^ a1)] ^ a2;
}

uint64_t sub_183DB9AC0(unsigned int a1)
{
  return byte_183DCD090[byte_183DC90C0[a1] ^ 0xD5] ^ a1;
}

uint64_t sub_183DB9AEC(char a1, unsigned int a2)
{
  return byte_183DC91C0[(byte_183DC5980[a2] ^ a1)] ^ a2;
}

uint64_t sub_183DB9B18(unsigned int a1)
{
  return byte_183DD09A0[byte_183DCCF90[a1] ^ 0x6A] ^ a1;
}

uint64_t sub_183DB9B44(unsigned int a1)
{
  return byte_183DC8FC0[byte_183DC5780[a1] ^ 0xAE] ^ a1;
}

uint64_t sub_183DB9B70(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1;
  unsigned int v3 = 435 - 535753261 * ((((2 * &v2) | 0xCA73AF1A) - &v2 + 449194099) ^ 0xEFCDD9A2);
  sub_183DA0144((uint64_t)&v2);
  return v4;
}

void sub_183DB9C04(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  unsigned int v1 = 235795823
  uint64_t v2 = a1;
  sub_183D989E4((uint64_t)&v1);
}

uint64_t sub_183DB9C98(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_183DB9CB0(uint64_t result)
{
  unint64_t v1 = 1224239923
     * ((-2LL - ((~result | 0xA9794F52C0023E71LL) + (result | 0x5686B0AD3FFDC18ELL))) ^ 0x8123FA3B32B1C3A6LL);
  int v2 = *(_DWORD *)(result + 40) - v1;
  int v3 = *(_DWORD *)(result + 8) ^ v1;
  unint64_t v4 = *(void *)(result + 24) + v1;
  int v5 = *(_DWORD *)(result + 4) - v1;
  int v6 = *(_DWORD *)(result + 12) ^ v1;
  unint64_t v7 = *(void *)(result + 32) - v1;
  BOOL v8 = (uint64_t)v7 < (uint64_t)v4;
  BOOL v9 = v7 < v4;
  int v10 = v8;
  if ((v2 & 1) != 0) {
    BOOL v9 = v10;
  }
  if (v9) {
    int v11 = v5;
  }
  else {
    int v11 = v3;
  }
  *(_DWORD *)uint64_t result = v6 ^ v11;
  return result;
}

uint64_t sub_183DB9D54(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 32) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_183DB9D6C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + _Block_object_dispose(va, 8) = *(void *)(a2 + 24);
  return 0LL;
}

uint64_t sub_183DB9D84(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 64) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_183DB9D9C(uint64_t result)
{
  uint64_t v1 = 1178560073 * (((result | 0x1F8F921A8C67E875LL) - (result & 0x1F8F921A8C67E875LL)) ^ 0x473C2F236F39017LL);
  unint64_t v2 = *(void *)(result + 16) + v1;
  unint64_t v3 = *(void *)result ^ v1;
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 > v3;
  int v6 = v4;
  if (((*(_DWORD *)(result + 12) + (_DWORD)v1) & 1) == 0) {
    BOOL v5 = v6;
  }
  BOOL v4 = !v5;
  uint64_t v7 = 36LL;
  if (!v4) {
    uint64_t v7 = 32LL;
  }
  *(_DWORD *)(result + 2_Block_object_dispose(va, 8) = *(_DWORD *)(result + v7) ^ v1 ^ (*(_DWORD *)(result + 8) - v1);
  return result;
}

uint64_t sub_183DB9E2C(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((-2 - ((a1 | 0x71A11D05) + (~(_DWORD)a1 | 0x8E5EE2FA))) ^ 0x50985F21);
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  unsigned int v6 = v1
  uint64_t v7 = v3;
  uint64_t v5 = v2;
  return ((uint64_t (*)(uint64_t *))*(&off_189D4D580 + (int)(v1 ^ 0x8FCD81A6)))(&v5);
}

void sub_183DB9F2C()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v0 = (qword_18C66B2A8 ^ qword_18C66A6F8) - (void)&v2;
  qword_18C66A6F8 = 1045096823 * (v0 + 0x1159CE8E9813C2FLL);
  qword_18C66B2A8 = 1045096823 * (v0 ^ 0xFEEA6317167EC3D1LL);
  unsigned int v4 = 435 - 535753261 * ((&v3 + 504105154 - 2 * (&v3 & 0x1E0C08C2)) ^ 0x14F806ED);
  uint64_t v3 = (char *)*(&off_189D4D580
               + ((119 * (qword_18C66A6F8 ^ 0xD1 ^ qword_18C66B2A8)) ^ byte_183DD09A0[byte_183DCCF90[(119 * (qword_18C66A6F8 ^ 0xD1 ^ qword_18C66B2A8))] ^ 0x6A])
               + 101)
     - 4;
  sub_183DA0144((uint64_t)&v3);
  unsigned int v4 = 435
     - 535753261
     * (((&v3 | 0x942CFDEE) - &v3 + (&v3 & 0x6BD30210)) ^ 0x9ED8F3C1);
  uint64_t v3 = (char *)*(&off_189D4D580
  sub_183DA0144((uint64_t)&v3);
  unsigned int v1 = 3804331 * ((&v3 - 2 * (&v3 & 0x9C3CB51) + 163826513) ^ 0xF35D3807);
  BYTE4(v3) = 3 - v1;
  LODWORD(v3) = v1 ^ 0x23F;
  sub_183D80F8C((uint64_t)&v3);
}

uint64_t sub_183DBA144(unsigned int a1)
{
  return byte_183DC91C0[byte_183DC5980[a1] ^ 0x1E] ^ a1;
}

uint64_t sub_183DBA16C(unsigned int a1)
{
  return byte_183DC5880[byte_183DD08A0[a1] ^ 0x1A] ^ a1;
}

uint64_t sub_183DBA198(unsigned int a1)
{
  return byte_183DC91C0[byte_183DC5980[a1] ^ 0xE3] ^ a1;
}

uint64_t sub_183DBA1C4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v2 = 1224239923 * (((a1 | 0x54F5E249) - a1 + (a1 & 0xAB0A1DB6)) ^ 0xA6461F9E);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)a1;
  unsigned int v7 = 1224239923 * ((&v10 & 0x3D29F54D | ~(&v10 | 0x3D29F54D)) ^ 0x3065F765);
  int v8 = (*(_DWORD *)(a1 + 12) ^ v2) - 368400140;
  unsigned int v11 = ((*(_DWORD *)(a1 + 16) + v2) ^ 0x899561D1)
      - v7
      - 1493706176
      + ((2 * (*(_DWORD *)(a1 + 16) + v2)) & 0xF272FFCE ^ 0xE0503C4C);
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  uint64_t v10 = v6;
  int v16 = v8 + v7 + 1038;
  uint64_t v14 = v5;
  uint64_t result = ((uint64_t (*)(uint64_t *))*(&off_189D4D580 + v8))(&v10);
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v15;
  return result;
}

uint64_t sub_183DBA310(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 8_Block_object_dispose(va, 8) = 21;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 80) = *(void *)(a2 + 8);
  return 0LL;
}

uint64_t sub_183DBA330(uint64_t result)
{
  unint64_t v1 = 1759421093 * ((result - 2 * (result & 0xCE10C030FCF42454LL) - 0x31EF3FCF030BDBACLL) ^ 0xE0AE01604F899400LL);
  int v2 = *(_DWORD *)result - v1;
  int v3 = *(_DWORD *)(result + 16) ^ v1;
  uint64_t v4 = *(void *)(result + 24);
  unint64_t v5 = v4 + v1;
  int v6 = *(_DWORD *)(result + 12) + v1;
  int v7 = *(_DWORD *)(result + 4) + v1;
  uint64_t v8 = *(void *)(result + 40);
  BOOL v9 = v4 != v8;
  BOOL v10 = v5 >= v8 + v1;
  if ((v3 & 1) == 0) {
    BOOL v10 = v9;
  }
  if (v10) {
    int v11 = v7;
  }
  else {
    int v11 = v2;
  }
  *(_DWORD *)(result + 32) = v11 ^ v6;
  return result;
}

uint64_t sub_183DBA3C0(_DWORD *a1)
{
  unsigned int v2 = *a1 - 108757529 * ((a1 & 0x3E324894 | ~(a1 | 0x3E324894)) ^ 0x2151D540);
  uint64_t result = ((uint64_t (*)(void, char *))*(&off_189D4D580 + (int)(v2 - 1695027228)))( *(&off_189D4D580 + (int)(v2 ^ 0x65081045)),  (char *)*(&off_189D4D580 + (int)(v2 - 1695027255)) - 4);
  int v4 = *(_DWORD *)*(&off_189D4D580 + (int)(v2 ^ 0x65081070));
  if ((_DWORD)result) {
    int v4 = 1224150252;
  }
  a1[1] = v4;
  return result;
}

void sub_183DBA478()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  unint64_t v0 = (qword_18C66B2A8 - qword_18C66B318) ^ (unint64_t)&v1;
  qword_18C66B318 = 1045096823 * v0 + 0xF4347460D903F27LL;
  qword_18C66B2A8 = 1045096823 * (v0 ^ 0xFEEA6317167EC3D1LL);
  unsigned int v2 = (char *)*(&off_189D4D580
               + ((119 * ((qword_18C66B2A8 - qword_18C66B318) ^ 0xD1)) ^ byte_183DCD090[byte_183DC90C0[(119 * ((qword_18C66B2A8 - qword_18C66B318) ^ 0xD1))] ^ 0xD5])
               - 18)
     - 4;
  unsigned int v3 = 435
     - 535753261
     * (((&v2 | 0x19ACA3E5) - &v2 + (&v2 & 0xE6535C18)) ^ 0x1358ADCA);
  sub_183DA0144((uint64_t)&v2);
}

void sub_183DBA5A4(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  unsigned int v1 = 1261 - 108757529 * ((2 * (&v1 & 0x79B1DF38) - &v1 - 2041700159) ^ 0x66D242EA);
  uint64_t v2 = a1;
  sub_183D976DC((uint64_t)&v1);
}

_BYTE *sub_183DBA638(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }

  unint64_t v4 = a3 - v3;
  unint64_t v6 = v4;
  unint64_t v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *uint64_t result = a2;
      break;
    default:
      uint64_t result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_183DBA6C8 + 4 * byte_183DCD197[(v5 >> 3) & 7]))();
      break;
  }

  return result;
}

uint64_t sub_183DBA72C(unsigned int a1)
{
  return byte_183DD09A0[byte_183DCCF90[a1] ^ 0xA7] ^ a1;
}

uint64_t rosetta_is_current_process_translated()
{
  return 0LL;
}

uint64_t parse_macho_iterate_slices(const char *a1, uint64_t a2)
{
  int v4 = open(a1, 256);
  if (v4 < 0)
  {
    uint64_t v8 = __error();
    BOOL v9 = strerror(*v8);
    syslog(3, "Failed to open macho file at %s for reading: %s", a1, v9);
    return 0LL;
  }

  else
  {
    int v5 = v4;
    uint64_t v6 = parse_macho_iterate_slices_fd(v4, (uint64_t)a1, a2);
    close(v5);
    return v6;
  }

uint64_t parse_macho_iterate_slices_fd(int a1, uint64_t a2, uint64_t a3)
{
  int __buf = 0;
  memset(&v24, 0, sizeof(v24));
  if (fstat(a1, &v24))
  {
    int v5 = __error();
    strerror(*v5);
    syslog(3, "Failed to stat %s : %s");
    return 0LL;
  }

  if (v24.st_size <= 8)
  {
    syslog(3, "File at %s is not a valid mach-o (too small to contain a valid header)");
    return 0LL;
  }

  *__error() = 0;
  if (pread(a1, &__buf, 4uLL, 0LL) != 4)
  {
    int v7 = __error();
    strerror(*v7);
    syslog(3, "Failed to read magic from %s : %s");
    return 0LL;
  }

  if (__buf <= -805638659)
  {
    if (__buf != -1095041334 && __buf != -889275714)
    {
      int v6 = -822415874;
      goto LABEL_15;
    }

    *__error() = 0;
    if (pread(a1, &fat_header, 8uLL, 0LL) == 8)
    {
      uint32_t magic = fat_header.magic;
      if (fat_header.magic == -1095041334)
      {
        swap_fat_header(&fat_header, NX_LittleEndian);
        uint32_t magic = fat_header.magic;
      }

      syslog(7, "Got fat header with magic 0x%08x and %u archs", magic, fat_header.nfat_arch);
      if (fat_header.nfat_arch < 0x401)
      {
        size_t v15 = 20LL * fat_header.nfat_arch;
        if (v24.st_size > (uint64_t)(v15 + 8))
        {
          uint64_t v14 = (fat_arch *)malloc(20LL * fat_header.nfat_arch);
          if (v15 == pread(a1, v14, v15, 8LL))
          {
            swap_fat_arch(v14, fat_header.nfat_arch, NX_LittleEndian);
            if (!fat_header.nfat_arch)
            {
LABEL_37:
              uint64_t v8 = 1LL;
              if (!v14) {
                return v8;
              }
              goto LABEL_28;
            }

            uint64_t v16 = 0LL;
            uint64_t v17 = v14;
            while (1)
            {
              syslog( 7,  "Evaluating fat slice with cputype %d; subtype %d; offset %u; size %u; align %u",
                v17->cputype,
                v17->cpusubtype,
                v17->offset,
                v17->size,
                v17->align);
              off_t offset = v17->offset;
              if (v24.st_size <= offset)
              {
                syslog(3, "Fat arch %u in %s specifies offset which is beyond the end of the file");
                goto LABEL_27;
              }

              macho_header_and_load_commands = _read_macho_header_and_load_commands(a1, offset, v24.st_size);
              if (!macho_header_and_load_commands) {
                break;
              }
              int v20 = macho_header_and_load_commands;
              char v21 = (*(uint64_t (**)(uint64_t, fat_arch *, char *))(a3 + 16))( a3,  v17,  macho_header_and_load_commands);
              free(v20);
              if (++v16 < (unint64_t)fat_header.nfat_arch)
              {
                ++v17;
                if ((v21 & 1) != 0) {
                  continue;
                }
              }

              goto LABEL_37;
            }

            syslog(3, "Failed to read macho header and load commands in %s at %u");
          }

          else
          {
            uint64_t v22 = __error();
            strerror(*v22);
            syslog(3, "Failed to read fat archs from %s : %s");
          }

char *_read_macho_header_and_load_commands(int a1, off_t a2, uint64_t a3)
{
  __int128 __buf = 0u;
  __int128 v19 = 0u;
  ssize_t v6 = pread(a1, &__buf, 0x20uLL, a2);
  if (v6 < 0)
  {
    BOOL v9 = __error();
    strerror(*v9);
    syslog(3, "Failed to read mach header at offset %lld : %s");
LABEL_26:
    uint64_t v13 = 0LL;
    goto LABEL_27;
  }

  if (v6 != 28 && v6 != 32)
  {
    syslog(3, "Expected to read at least sizeof(struct mach_header) but only got %zd bytes");
    goto LABEL_26;
  }

  unsigned int v8 = v19;
  unsigned int v7 = DWORD1(v19);
  if ((int)__buf > -17958195)
  {
    if ((_DWORD)__buf != -17958194)
    {
      if ((_DWORD)__buf == -17958193) {
        goto LABEL_12;
      }
LABEL_23:
      syslog(3, "Unknown magic in macho header at offset %llu: 0x%08x");
      goto LABEL_26;
    }

uint64_t get_highest_sdk_version_for_any_slice(const char *a1)
{
  uint64_t v5 = 0LL;
  ssize_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = __get_highest_sdk_version_for_any_slice_block_invoke;
  v4[3] = &unk_189D4DCC8;
  v4[4] = &v5;
  void v4[5] = a1;
  if ((parse_macho_iterate_slices(a1, (uint64_t)v4) & 1) != 0)
  {
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }

  else
  {
    syslog(3, "Failed to iterate macho file at %s", a1);
    uint64_t v2 = 0LL;
  }

  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke(uint64_t a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 0;
  dyld_get_image_versions();
  int v2 = *((_DWORD *)v7 + 6);
  if (!v2)
  {
    syslog(3, "Failed to get SDK version from slice in %s", *(const char **)(a1 + 40));
    int v2 = *((_DWORD *)v7 + 6);
  }

  syslog(7, "Slice had version 0x%08x", v2);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v3 > *(_DWORD *)(v4 + 24)) {
    *(_DWORD *)(v4 + 24) = v3;
  }
  _Block_object_dispose(&v6, 8);
  return 1LL;
}

uint64_t __get_highest_sdk_version_for_any_slice_block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a3;
  return result;
}

BOOL parse_macho_is_cpu_type_runnable_for_apps(int a1, int a2, char *a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    syslog(3, "Error: Argument pointer must not be null");
    int v12 = 13;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 13);
    BOOL v9 = 0LL;
    if (!a4) {
      return v9;
    }
    goto LABEL_12;
  }

  v17[0] = a1;
  v17[1] = a2;
  int v16 = 0;
  size_t v15 = 4LL;
  int v8 = sysctlbyname("kern.grade_cputype", &v16, &v15, v17, 8uLL);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    size_t v10 = __error();
    size_t v11 = strerror(*v10);
    syslog(3, "Error calling kern.grade_cputype for CPU type 0x%x and subtype 0x%x: %s", a1, a2, v11);
    int v12 = 12;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 12);
    char v13 = 0;
  }

  else if (v16 < 1 || a1 != 16777228 || (a2 & 0xFFFFFE) != 0)
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are not runnable", a1, a2);
    int v12 = 0;
    char v13 = 0;
  }

  else
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are runnable", 16777228, a2);
    int v12 = 0;
    char v13 = 1;
  }

  *a3 = v13;
  if (a4) {
LABEL_12:
  }
    *a4 = v12;
  return v9;
}

BOOL parse_macho_is_file_runnable_for_apps(const char *a1, _BYTE *a2, _DWORD *a3)
{
  int v33 = 0;
  char v32 = 0;
  memset(&v31, 0, sizeof(v31));
  int v30 = 0;
  if (!a1)
  {
    int v33 = 1;
    syslog(3, "Input path is NULL");
    goto LABEL_58;
  }

  if (!a2)
  {
    int v33 = 13;
    syslog(3, "Error: Argument pointer must not be null");
    goto LABEL_60;
  }

  int v6 = open(a1, 256);
  if (v6 != -1)
  {
    int v7 = v6;
    if (fstat(v6, &v31) == -1)
    {
      int v12 = *__error();
      int v33 = 3;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v12);
      BOOL v9 = "Can't stat input file %s: %s";
      goto LABEL_54;
    }

    unint64_t st_size = v31.st_size;
    if (read(v7, &v30, 4uLL) != 4)
    {
      int v13 = *__error();
      int v33 = 5;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v13);
      BOOL v9 = "Failed to read header for file %s: %s";
      goto LABEL_54;
    }

    if (lseek(v7, 0LL, 0) == -1)
    {
      int v14 = *__error();
      int v33 = 4;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v14);
      BOOL v9 = "Can't seek input file %s: %s";
      goto LABEL_54;
    }

    if (st_size >= 8 && v30 == -1095041334)
    {
      *(void *)&fat_header.uint32_t magic = 0LL;
      if (read(v7, &fat_header, 8uLL) != 8)
      {
        int v16 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v16);
        BOOL v9 = "Failed to read fat header from input file %s: %s";
        goto LABEL_54;
      }

      swap_fat_header((fat_header *)&fat_header, NX_LittleEndian);
      if (fat_header.cputype >= 0x401u)
      {
        int v33 = 7;
        cputype = (char *)fat_header.cputype;
        uint64_t cpusubtype = 1024LL;
        BOOL v9 = "Number of fat archs %u exceeds the maximum %u";
LABEL_54:
        int v15 = 3;
        goto LABEL_55;
      }

      size_t v17 = 20LL * fat_header.cputype;
      if (v17 + 8 > st_size)
      {
        int v33 = 8;
        cputype = (char *)a1;
        BOOL v9 = "Malformed fat file: %s";
        goto LABEL_54;
      }

      __int128 v19 = (fat_arch *)malloc(v17);
      if (v19)
      {
        if (v17 == read(v7, v19, v17))
        {
          swap_fat_arch(v19, fat_header.cputype, NX_LittleEndian);
          if (fat_header.cputype)
          {
            uint64_t v20 = 0LL;
            p_uint64_t cpusubtype = &v19->cpusubtype;
            while (parse_macho_is_cpu_type_runnable_for_apps(*(p_cpusubtype - 1), *p_cpusubtype, &v32, &v33))
            {
              if (v32) {
                goto LABEL_64;
              }
              p_cpusubtype += 5;
            }

            char v23 = "Failed to check if cpu type is runnable";
          }

          else
          {
            if (v32)
            {
LABEL_64:
              syslog(7, "FAT matching_arch cpu_type: 0x%x cpu_subtype: 0x%x");
              goto LABEL_56;
            }

LABEL_65:
            cputype = (char *)a1;
            char v23 = "Failed to find matching arch for FAT input file %s";
          }
        }

        else
        {
          int v24 = *__error();
          int v33 = 6;
          cputype = (char *)a1;
          uint64_t cpusubtype = (uint64_t)strerror(v24);
          char v23 = "Failed to read fat arch(s) from input file %s: %s";
        }
      }

      else
      {
        int v22 = *__error();
        int v33 = 9;
        cputype = strerror(v22);
        char v23 = "Failed to allocate memory for fat arch(s): %s";
      }

      syslog(3, v23, cputype, cpusubtype);
LABEL_56:
      free(v19);
      if ((v7 & 0x80000000) == 0) {
        close(v7);
      }
LABEL_58:
      if (!a2) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }

    if (st_size >= 0x1C)
    {
      if (v30 == -17958194 || v30 == -822415874)
      {
        memset(&fat_header, 0, 28);
        if (read(v7, &fat_header, 0x1CuLL) == 28)
        {
          if (v30 == -822415874) {
            swap_mach_header((mach_header *)&fat_header, NX_LittleEndian);
          }
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 32-bit Mach-O input file %s";
              goto LABEL_54;
            }

            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "32-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
LABEL_27:
            int v15 = 7;
LABEL_55:
            syslog(v15, v9, cputype, cpusubtype);
            __int128 v19 = 0LL;
            goto LABEL_56;
          }

          goto LABEL_50;
        }

        goto LABEL_41;
      }

      if (st_size >= 0x20 && (v30 == -17958193 || v30 == -805638658))
      {
        memset(&fat_header, 0, sizeof(fat_header));
        if (read(v7, &fat_header, 0x20uLL) == 32)
        {
          if (v30 == -805638658) {
            swap_mach_header_64(&fat_header, NX_LittleEndian);
          }
          if (parse_macho_is_cpu_type_runnable_for_apps(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 64-bit Mach-O input file %s";
              goto LABEL_54;
            }

            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "64-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
            goto LABEL_27;
          }

LABEL_50:
          BOOL v9 = "Failed to check if cpu type is runnable";
          goto LABEL_54;
        }

void __getUMUserManagerClass_block_invoke_cold_1(void *a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"void *UserManagementLibrary(void)"];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"ICLSoftLinking.h",  38,  @"%s",  *a1);

  __break(1u);
}

void __getUMUserManagerClass_block_invoke_cold_2()
{
  unint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"Class getUMUserManagerClass(void)_block_invoke"];
  unsigned int v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"ICLSoftLinking.h",  39,  @"Unable to find class %s",  "UMUserManager");

  __break(1u);
}

void MIFetchInfoForUsername_cold_1(void *a1, _OWORD *a2)
{
  int v4 = *__error();
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  strerror(v4);
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void MIFetchInfoForUsername_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void MIAssumeIdentity_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MIRestoreIdentity_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MIReserveMemoryForValidation_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void MIReturnMemoryUsedForValidation_cold_1()
{
  OUTLINED_FUNCTION_0_0( &dword_183D22000,  MEMORY[0x1895F8DA0],  v0,  "Got memory size to return, %zu, which would result in %zu available, which is more than the maximum of %zu bytes; ca"
    "pping at max available",
    v1,
    v2,
    v3,
    v4,
    v5);
}

void MIReturnMemoryUsedForValidation_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = v0;
  _os_log_fault_impl( &dword_183D22000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Got memory size to return %zu which is greater than our available memory of %zu bytes; capping at max available",
    v1,
    0x16u);
}

void MIReduceAvailableMemoryForValidationForTesting_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __getEXExtensionPointCatalogClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"void *ExtensionFoundationLibrary(void)"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"ICLSoftLinking.h",  47,  @"%s",  *a1);

  __break(1u);
}

void __getEXExtensionPointCatalogClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"Class getEXExtensionPointCatalogClass(void)_block_invoke"];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"ICLSoftLinking.h",  48,  @"Unable to find class %s",  "EXExtensionPointCatalog");

  __break(1u);
}

void MIMachOSimPlatformForPlatform_cold_1(uint64_t a1)
{
  int v1 = a1;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  MIMachOStringForPlatform(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = 136315650;
  uint64_t v4 = "MIMachOSimPlatformForPlatform";
  __int16 v5 = 2112;
  int v6 = v2;
  __int16 v7 = 1024;
  int v8 = v1;
  _os_log_fault_impl( &dword_183D22000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "%s: Platform %@ (%u) does not have a simulator equivalent; returning PLATFORM_UNKNOWN",
    (uint8_t *)&v3,
    0x1Cu);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x189602820](locArray, prefArray);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1896028D8](bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x189602A38](type_id);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x189615ED8]();
}

uint64_t MISEntitlementDictionaryAllowsEntitlementValue()
{
  return MEMORY[0x189615EE8]();
}

uint64_t MISEnumerateMatchingProfilesUnauthoritative()
{
  return MEMORY[0x189615EF8]();
}

uint64_t MISInstallProvisioningProfile()
{
  return MEMORY[0x189615F00]();
}

uint64_t MISProfileCreateWithData()
{
  return MEMORY[0x189615F10]();
}

uint64_t MISProfileCreateWithFile()
{
  return MEMORY[0x189615F18]();
}

uint64_t MISRemoveProvisioningProfile()
{
  return MEMORY[0x189615F40]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x189615F48]();
}

uint64_t MISValidationCopySignatureVersion()
{
  return MEMORY[0x189615F50]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x189611778]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x189607568](table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t SecCertificateCopyOrganization()
{
  return MEMORY[0x18960B2A0]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x18960B2D0](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x18960B2E8](allocator, data);
}

uint64_t SecItemDeleteAllWithAccessGroups()
{
  return MEMORY[0x18960B410]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x18960B630](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x18960B640](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x18960B668](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x189604128]();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x189604160]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x189604168]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x189604238]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x189604240]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1896044C8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1895F9368](buf_p, acl, size);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1895F9390](obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1895F93B8](path_p, *(void *)&type);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1895F9400](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1895F9408](*(void *)&fd, acl);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x1895F9450](acl);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x1895F9458](acl, len_p);
}

uint64_t amfi_interface_query_bootarg_state()
{
  return MEMORY[0x18960D4B0]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x189614100](atoken);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1895FA580](a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

uint64_t container_copy_code_signing_info_for_identifier()
{
  return MEMORY[0x1895FA6E8]();
}

uint64_t container_copy_object()
{
  return MEMORY[0x1895FA700]();
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1895FA710]();
}

uint64_t container_copy_unlocalized_description()
{
  return MEMORY[0x1895FA718]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1895FA760]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x1895FA778]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1895FA788]();
}

uint64_t container_error_free()
{
  return MEMORY[0x1895FA798]();
}

uint64_t container_error_get_path()
{
  return MEMORY[0x1895FA7A8]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1895FA7B0]();
}

uint64_t container_error_get_type()
{
  return MEMORY[0x1895FA7B8]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x1895FA7C0]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1895FA7D0]();
}

uint64_t container_get_class()
{
  return MEMORY[0x1895FA7F0]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1895FA7F8]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1895FA800]();
}

uint64_t container_get_info_value_for_key()
{
  return MEMORY[0x1895FA808]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1895FA810]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1895FA818]();
}

uint64_t container_invalidate_code_signing_cache()
{
  return MEMORY[0x1895FA840]();
}

uint64_t container_is_equal()
{
  return MEMORY[0x1895FA848]();
}

uint64_t container_is_new()
{
  return MEMORY[0x1895FA850]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x1895FA858]();
}

uint64_t container_operation_delete_array()
{
  return MEMORY[0x1895FA8D0]();
}

uint64_t container_operation_delete_reclaim_disk_space()
{
  return MEMORY[0x1895FA8D8]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1895FA8F8]();
}

uint64_t container_query_create_from_container()
{
  return MEMORY[0x1895FA900]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1895FA908]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1895FA910]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1895FA918]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1895FA920]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1895FA930]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1895FA940]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x1895FA948]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1895FA950]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1895FA958]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1895FA960]();
}

uint64_t container_query_set_transient()
{
  return MEMORY[0x1895FA968]();
}

uint64_t container_recreate_structure()
{
  return MEMORY[0x1895FA980]();
}

uint64_t container_regenerate_uuid()
{
  return MEMORY[0x1895FA988]();
}

uint64_t container_replace()
{
  return MEMORY[0x1895FA990]();
}

uint64_t container_serialize_copy_deserialized_reference()
{
  return MEMORY[0x1895FA9A8]();
}

uint64_t container_serialize_copy_serialized_reference()
{
  return MEMORY[0x1895FA9B0]();
}

uint64_t container_set_code_signing_info_for_identifier()
{
  return MEMORY[0x1895FA9B8]();
}

uint64_t container_set_data_protection_for_current_user()
{
  return MEMORY[0x1895FA9C0]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x1895FA9C8]();
}

uint64_t container_subdirectories_for_class()
{
  return MEMORY[0x1895FA9D0]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1895FA9D8]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1895FAA68]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1895FAA70](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1895FAA78](s, *(void *)&flag, src);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1895FAAD8](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FAFD8]();
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1895FAFE8]();
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB270](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB278](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FB2E8](*(void *)&fd, namebuff, size, *(void *)&options);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1895FB3C8](*(void *)&fd, name, *(void *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB430](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1895FB4C0](*(void *)&a1, a2);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1895FB500](*(void *)&a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

gid_t getgid(void)
{
  return MEMORY[0x1895FB550]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB668](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB678](*(void *)&a1, a2, a3, a4, a5);
}

uint8_t *__cdecl getsectiondata( const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FB6A0](mhp, segname, sectname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

int initgroups(const char *a1, int a2)
{
  return MEMORY[0x1895FB848](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB9B8](a1, *(void *)&a2, *(void *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1895FB9E8](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FBE98]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF00](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1895FC6E8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x1895FC898]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1895FC910]();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return MEMORY[0x1895FCB50](*(void *)&a1, *(void *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1895FCD18]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1895FCD20](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1895FCD28](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1895FCD38](path, name, *(void *)&options);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1895FCD60](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FCD80](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FCE50](a1, a2, a3, a4, *(void *)&a5);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD240](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void uuid_generate(uuid_t out)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1895FD5F8](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1895FE050](string);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_);
}

uint64_t objc_msgSend__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error_);
}

uint64_t objc_msgSend__bulkSetPropertiesForPath_existingFD_UID_GID_mode_flags_dataProtectionClass_removeACL_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__bulkSetPropertiesForPath_existingFD_UID_GID_mode_flags_dataProtectionClass_removeACL_error_);
}

uint64_t objc_msgSend__bundleIDMapForBundlesInDirectory_withExtension_loadingAdditionalKeys_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__bundleIDMapForBundlesInDirectory_withExtension_loadingAdditionalKeys_);
}

uint64_t objc_msgSend__containerForIdentifier_contentClass_forPersona_transient_create_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__containerForIdentifier_contentClass_forPersona_transient_create_error_);
}

uint64_t objc_msgSend__copyItemAtURL_toURL_failIfSrcMissing_alwaysClone_ignoreErrors_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__copyItemAtURL_toURL_failIfSrcMissing_alwaysClone_ignoreErrors_error_);
}

uint64_t objc_msgSend__dataContainerCreatingIfNeeded_forPersona_makeLive_checkIfNeeded_created_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__dataContainerCreatingIfNeeded_forPersona_makeLive_checkIfNeeded_created_error_);
}

uint64_t objc_msgSend__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock_);
}

uint64_t objc_msgSend__getMICodeSignerTypeFromMISInfoDict_codeSignerType_profileType_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__getMICodeSignerTypeFromMISInfoDict_codeSignerType_profileType_error_);
}

uint64_t objc_msgSend__hashSliceAtOffset_withSize_machHeaderAndCommands_dictionaryKey_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__hashSliceAtOffset_withSize_machHeaderAndCommands_dictionaryKey_error_);
}

uint64_t objc_msgSend__insecureCachedAppIdentifierIfMarkedWithEAFlag_bundleURL_allowPlaceholders_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__insecureCachedAppIdentifierIfMarkedWithEAFlag_bundleURL_allowPlaceholders_error_);
}

uint64_t objc_msgSend__scanBundle_inContainer_addingToBundleSet_enumeratingEntry_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__scanBundle_inContainer_addingToBundleSet_enumeratingEntry_withError_);
}

uint64_t objc_msgSend__scanBundleContainersWithClass_withError_ignoredErrorOccurredOnOneOrMoreItems_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__scanBundleContainersWithClass_withError_ignoredErrorOccurredOnOneOrMoreItems_);
}

uint64_t objc_msgSend__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error_);
}

uint64_t objc_msgSend__validateBundleExecutable_againstStubAt_trustedHashes_sectionName_signingIdentifier_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__validateBundleExecutable_againstStubAt_trustedHashes_sectionName_signingIdentifier_error_);
}

uint64_t objc_msgSend__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__validatePresenceOfSwiftEntrySectionInFile_shouldHaveSwiftEntry_withError_);
}

uint64_t objc_msgSend_bulkSetPropertiesForPath_UID_GID_mode_flags_dataProtectionClass_removeACL_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_bulkSetPropertiesForPath_UID_GID_mode_flags_dataProtectionClass_removeACL_error_);
}

uint64_t objc_msgSend_bulkSetPropertiesForPath_withOpenFD_UID_GID_mode_flags_dataProtectionClass_removeACL_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_bulkSetPropertiesForPath_withOpenFD_UID_GID_mode_flags_dataProtectionClass_removeACL_error_);
}

uint64_t objc_msgSend_bundleRecordsForLaunchServicesWithWrapperURL_forBundleIdentifier_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_bundleRecordsForLaunchServicesWithWrapperURL_forBundleIdentifier_withError_);
}

uint64_t objc_msgSend_bundlesInParentBundle_overrideParentBundleIDForValidation_subDirectory_matchingPredicate_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_bundlesInParentBundle_overrideParentBundleIDForValidation_subDirectory_matchingPredicate_error_);
}

uint64_t objc_msgSend_captureStoreDataFromDirectory_toDirectory_doCopy_failureIsFatal_includeiTunesMetadata_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_captureStoreDataFromDirectory_toDirectory_doCopy_failureIsFatal_includeiTunesMetadata_withError_);
}

uint64_t objc_msgSend_codeSigningInfoByValidatingResources_performingOnlineAuthorization_ignoringCachedSigningInfo_checkingTrustCacheIfApplicable_skippingProfileIDValidation_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_codeSigningInfoByValidatingResources_performingOnlineAuthorization_ignoringCachedSigningInfo_checkingTrustCacheIfApplicable_skippingProfileIDValidation_error_);
}

uint64_t objc_msgSend_containerWithIdentifier_forPersona_ofContentClass_createIfNeeded_created_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_containerWithIdentifier_forPersona_ofContentClass_createIfNeeded_created_error_);
}

uint64_t objc_msgSend_containersForBundleIdentifier_contentClass_forPersona_create_fetchTransient_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_containersForBundleIdentifier_contentClass_forPersona_create_fetchTransient_error_);
}

uint64_t objc_msgSend_containersForGroupIdentifier_forPersona_create_fetchTransient_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_containersForGroupIdentifier_forPersona_create_fetchTransient_error_);
}

uint64_t objc_msgSend_containersForIdentifier_groupContainerIdentifier_ofContentClass_forPersona_fetchTransient_createIfNeeded_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_containersForIdentifier_groupContainerIdentifier_ofContentClass_forPersona_fetchTransient_createIfNeeded_error_);
}

uint64_t objc_msgSend_dataContainerForExecutableBundle_forPersona_createIfNeeded_temporary_created_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_dataContainerForExecutableBundle_forPersona_createIfNeeded_temporary_created_error_);
}

uint64_t objc_msgSend_enumerateAppExtensionsInBundle_forPersona_updatingAppExtensionParentID_ensureAppExtensionsAreExecutable_installProfiles_error_enumerator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_enumerateAppExtensionsInBundle_forPersona_updatingAppExtensionParentID_ensureAppExtensionsAreExecutable_installProfiles_error_enumerator_);
}

uint64_t objc_msgSend_enumerateContainersWithClass_forPersona_isTransient_identifiers_groupIdentifiers_usingBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_enumerateContainersWithClass_forPersona_isTransient_identifiers_groupIdentifiers_usingBlock_);
}

uint64_t objc_msgSend_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_);
}

uint64_t objc_msgSend_initWithSignerIdentity_signerOrganization_codeInfoIdentifier_teamIdentifier_signatureVersion_entitlements_signerType_profileType_signingInfoSource_launchWarningData_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithSignerIdentity_signerOrganization_codeInfoIdentifier_teamIdentifier_signatureVersion_entitlements_signerType_profileType_signingInfoSource_launchWarningData_);
}

uint64_t objc_msgSend_makeContainerLiveReplacingContainer_reason_waitForDeletion_withError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_makeContainerLiveReplacingContainer_reason_waitForDeletion_withError_);
}

uint64_t objc_msgSend_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error_);
}

uint64_t objc_msgSend_transientContainerForIdentifier_contentClass_forPersona_create_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_transientContainerForIdentifier_contentClass_forPersona_create_error_);
}

uint64_t objc_msgSend_triggerRegistrationForContainerizedContentForOptions_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_triggerRegistrationForContainerizedContentForOptions_withCompletion_);
}