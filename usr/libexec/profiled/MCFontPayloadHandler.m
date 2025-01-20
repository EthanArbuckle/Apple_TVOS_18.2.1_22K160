@interface MCFontPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_errorFontAlreadyInstalled;
- (id)_errorFontCollection;
- (id)_errorFontInvalid;
- (id)_errorFontUnknownWithUnderlyingError:(id)a3;
- (void)remove;
@end

@implementation MCFontPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v81 = a4;
  id v80 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  CFTypeRef cf = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fontData]);

  if (!v11)
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    v21 = 0LL;
    v16 = 0LL;
    v22 = 0LL;
    v23 = 0LL;
    FontDescriptorsFromURL = 0LL;
LABEL_20:
    if (cf) {
      CFRelease(cf);
    }
    if (v19)
    {
      os_log_t v28 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue([v19 MCVerboseDescription]);
        *(_DWORD *)buf = 138543362;
        *(void *)v95 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Cannot install font. Error: %{public}@",  buf,  0xCu);
      }

      LOBYTE(v25) = 0;
      if (a6) {
        *a6 = [v19 MCCopyAsPrimaryError];
      }
    }

    else
    {
      LOBYTE(v25) = 1;
    }

    goto LABEL_28;
  }

  v12 = NSTemporaryDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:v14]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));

  v17 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v95 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Writing font to temporary URL %{public}@",  buf,  0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v10 fontData]);
  id v88 = 0LL;
  [v18 writeToURL:v16 options:268435457 error:&v88];
  id v19 = v88;

  id v78 = v9;
  if (v19) {
    goto LABEL_5;
  }
  FontDescriptorsFromURL = (void *)MCCTFontManagerCreateFontDescriptorsFromURL(v16);
  if (![FontDescriptorsFromURL count])
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    goto LABEL_11;
  }

  if ((unint64_t)[FontDescriptorsFromURL count] >= 2)
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontCollection](self, "_errorFontCollection"));
LABEL_11:
    id v19 = (id)v24;
    goto LABEL_12;
  }

  uint64_t v32 = MCCGDataProviderCreateWithURL(v16);
  if (!v32)
  {
    v42 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "Could not specify font as data provider.",  buf,  2u);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
LABEL_5:
    FontDescriptorsFromURL = 0LL;
LABEL_12:
    v23 = 0LL;
    v22 = 0LL;
    v21 = 0LL;
    v25 = 0LL;
    v26 = 0LL;
LABEL_13:
    if (v16)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v27 removeItemAtURL:v16 error:0];
    }

    if (v26) {
      CFRelease(v26);
    }
    if (v25) {
      CFRelease(v25);
    }
    id v9 = v78;
    goto LABEL_20;
  }

  v26 = (const void *)v32;
  uint64_t v33 = MCCGFontCreateWithDataProvider();
  if (!v33)
  {
    v43 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Could not create font for introspection.",  buf,  2u);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    FontDescriptorsFromURL = 0LL;
    v23 = 0LL;
    v22 = 0LL;
    v21 = 0LL;
    v25 = 0LL;
    goto LABEL_13;
  }

  v25 = (const void *)v33;
  v21 = (void *)MCCGFontCopyFullName();
  uint64_t v34 = GSFontCopyPersistentPostscriptURL(v16, 0LL);
  if (!v34)
  {
    v44 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Could not create persistent URL for font.",  buf,  2u);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontInvalid](self, "_errorFontInvalid"));
    FontDescriptorsFromURL = 0LL;
    v23 = 0LL;
    v22 = 0LL;
    goto LABEL_13;
  }

  v22 = (void *)v34;
  [v10 setPersistentURL:v34];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v70 = kMCDMFontURLToProfileIdentifierKey;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "parentsInDomain:"));

  v36 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
  unsigned int v37 = [v23 containsObject:v36];

  v38 = _MCLogObjects[0];
  if (v37)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v95 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "The font “%{public}@” has already been installed. Not installing again.",  buf,  0xCu);
    }

    id v19 = 0LL;
LABEL_39:
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([v10 profile]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v71 identifier]);
    [v74 addDependent:v39 ofParent:v40 inDomain:kMCDMProfileIdentifierToFontURLKey reciprocalDomain:v70];

    v41 = v74;
LABEL_56:

    FontDescriptorsFromURL = 0LL;
    goto LABEL_13;
  }

  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v95 = v21;
    *(_WORD *)&v95[8] = 2114;
    *(void *)&v95[10] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Installing font “%{public}@” to URL %{public}@",  buf,  0x16u);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
  v66 = v45;
  LODWORD(v45) = [v45 fileExistsAtPath:v46];

  if ((_DWORD)v45) {
    [v66 removeItemAtURL:v22 error:0];
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v87 = 0LL;
  [v47 copyItemAtURL:v16 toURL:v22 error:&v87];
  id v19 = v87;

  if (v19) {
    goto LABEL_55;
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v92 = NSFileProtectionKey;
  NSFileProtectionType v93 = NSFileProtectionNone;
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
  id v86 = 0LL;
  [v75 setAttributes:v72 ofItemAtPath:v48 error:&v86];
  id v19 = v86;

  if (v19)
  {
LABEL_55:
    v41 = v66;
    goto LABEL_56;
  }

  v91 = v22;
  GSFontRegisterPersistentURLs( +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL),  &cf);
  if (!cf)
  {
    id v19 = 0LL;
    goto LABEL_84;
  }

  v49 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v95 = cf;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Results: %{public}@", buf, 0xCu);
  }

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id obj = (id)cf;
  id v65 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  id v19 = 0LL;
  if (!v65)
  {
LABEL_81:

LABEL_84:
    v58 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v95 = v21;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Installed font “%{public}@”.", buf, 0xCu);
    }

    goto LABEL_39;
  }

  uint64_t v64 = *(void *)v83;
  *(void *)&__int128 v50 = 67240450LL;
  __int128 v61 = v50;
LABEL_62:
  uint64_t v51 = 0LL;
  while (1)
  {
    if (*(void *)v83 != v64) {
      objc_enumerationMutation(obj);
    }
    uint64_t v73 = v51;
    v67 = *(void **)(*((void *)&v82 + 1) + 8 * v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", @"result", v61));
    unsigned int v76 = [v52 intValue];

    if (!v76 || v76 == 105)
    {
      v55 = _MCLogObjects[0];
      int v69 = 1;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        int v69 = 1;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Successfully installed font.", buf, 2u);
      }

      char v54 = 0;
    }

    else
    {
      if (v76 == 305)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"error"]);
        v59 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v95 = v77;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "Failed to install font with 305 'Font Already Installed' error: %{public}@",  buf,  0xCu);
        }

        uint64_t v60 = objc_claimAutoreleasedReturnValue(-[MCFontPayloadHandler _errorFontAlreadyInstalled](self, "_errorFontAlreadyInstalled"));

        id v19 = (id)v60;
        goto LABEL_55;
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:@"error"]);
      v53 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v61;
        *(_DWORD *)v95 = v76;
        *(_WORD *)&v95[4] = 2114;
        *(void *)&v95[6] = v68;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Failed to install font with %{public}d error: %{public}@",  buf,  0x12u);
      }

      uint64_t v63 = objc_claimAutoreleasedReturnValue( -[MCFontPayloadHandler _errorFontUnknownWithUnderlyingError:]( self,  "_errorFontUnknownWithUnderlyingError:",  v68));

      int v69 = 0;
      char v54 = 1;
      id v19 = (id)v63;
    }

    if (v76 != 105 && v76 != 0) {
      break;
    }
    uint64_t v51 = v73 + 1;
    if (v65 == (id)(v73 + 1))
    {
      id v65 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
      if (v65) {
        goto LABEL_62;
      }
      goto LABEL_81;
    }
  }

  char v57 = v54;

  if (v69) {
    goto LABEL_84;
  }

  FontDescriptorsFromURL = 0LL;
  if ((v57 & 1) != 0) {
    goto LABEL_13;
  }
  id v9 = v78;
LABEL_28:

  return v25 & 1;
}

- (void)remove
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentURL]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v7 profile]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  [v2 removeDependent:v4 fromParent:v6 inDomain:kMCDMProfileIdentifierToFontURLKey reciprocalDomain:kMCDMFontURLToProfileIdentifierKey];
}

- (id)_errorFontInvalid
{
  uint64_t v2 = MCFontErrorDomain;
  uint64_t v3 = MCErrorArray(@"FONT_ERROR_INVALID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  35000LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorFontCollection
{
  uint64_t v2 = MCFontErrorDomain;
  uint64_t v3 = MCErrorArray(@"FONT_ERROR_COLLECTION");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  35002LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorFontAlreadyInstalled
{
  uint64_t v2 = MCFontErrorDomain;
  uint64_t v3 = MCErrorArray(@"FONT_ERROR_ALREADY_INSTALLED");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  35003LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)_errorFontUnknownWithUnderlyingError:(id)a3
{
  uint64_t v3 = MCFontErrorDomain;
  id v4 = a3;
  uint64_t v5 = MCErrorArray(@"FONT_ERROR_UNKNOWN");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v3,  35001LL,  v6,  v4,  MCErrorTypeFatal,  0LL));

  return v7;
}

@end