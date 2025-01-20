@interface MCNewWebClipPayloadHandler
- (BOOL)_addWebClip:(id)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (id)_findInstalledClipWithIdentifier:(id)a3;
- (id)_installedWebClip;
- (id)_webclipFailedToCreateOnDiskError;
- (id)savedWebClipIdentifier;
- (void)_removeWebClip:(id)a3;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewWebClipPayloadHandler

- (id)savedWebClipIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 savedIdentifier]);
  if (!v3)
  {
    unsigned int v4 = [v2 fullScreen];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
    v3 = v5;
    if (v4)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1000C4568]);

      v3 = (void *)v6;
    }

    os_log_t v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue([v2 friendlyName]);
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2114;
      v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler missing saved ID for payload '%{public}@'. Falling back to identifier: %{public}@",  (uint8_t *)&v11,  0x16u);
    }
  }

  return v3;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);

  unsigned int v11 = [v10 BOOLValue];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](&OBJC_CLASS___NSString, "MCMakeUUID"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1000C4568]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIWebClip webClipWithIdentifier:](&OBJC_CLASS___UIWebClip, "webClipWithIdentifier:", v13));
  objc_msgSend(v14, "setFullScreen:", objc_msgSend(v9, "fullScreen"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
  [v14 setPageURL:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 label]);
  [v14 setTitle:v16];

  objc_msgSend(v14, "setRemovalDisallowed:", objc_msgSend(v9, "isRemovable") ^ 1);
  if ((objc_opt_respondsToSelector(v14, "setConfigurationIsManaged:") & 1) != 0) {
    [v14 setConfigurationIsManaged:1];
  }
  if ((objc_opt_respondsToSelector(v14, "setIgnoreManifestScope:") & 1) != 0) {
    objc_msgSend(v14, "setIgnoreManifestScope:", objc_msgSend(v9, "ignoreManifestScope"));
  }
  if ((objc_opt_respondsToSelector(v14, "setContentModeWithString:") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 contentMode]);
    [v14 setContentModeWithString:v17];
  }

  if (v11)
  {
    if ((objc_opt_respondsToSelector(v14, "setApplicationBundleIdentifier:") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 targetApplicationBundleIdentifier]);
      [v14 setApplicationBundleIdentifier:v18];
    }
  }

  else
  {
    v19 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "WebClipHandler ignoring target application identifier because the profile is not being installed by MDM",  buf,  2u);
    }

    [v9 setTargetApplicationBundleIdentifier:0];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 iconData]);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v9 iconData]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v21));
    objc_msgSend(v14, "setIconImage:isPrecomposed:", v22, objc_msgSend(v9, "precomposed"));
  }

  if (-[MCNewWebClipPayloadHandler _addWebClip:](self, "_addWebClip:", v14))
  {
    [v9 setSavedIdentifier:v13];

LABEL_23:
    os_log_t v35 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue([v9 friendlyName]);
      *(_DWORD *)buf = 138543362;
      v40 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler successfully installed web clip for payload '%{public}@'",  buf,  0xCu);
    }

    BOOL v34 = 1;
    goto LABEL_26;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewWebClipPayloadHandler _webclipFailedToCreateOnDiskError]( self,  "_webclipFailedToCreateOnDiskError"));

  if (!v23) {
    goto LABEL_23;
  }
  uint64_t v24 = MCInstallationErrorDomain;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 friendlyName]);
  uint64_t v27 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v24,  4001LL,  v28,  v23,  MCErrorTypeFatal,  v26,  0LL));

  if (a6) {
    *a6 = v29;
  }
  os_log_t v30 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 friendlyName]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v29 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    v40 = v32;
    __int16 v41 = 2114;
    v42 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "WebClipHandler cannot install webclip for payload '%{public}@' with error: %{public}@",  buf,  0x16u);
  }

  BOOL v34 = 0;
LABEL_26:

  return v34;
}

- (id)_findInstalledClipWithIdentifier:(id)a3
{
  id v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIWebClip webClips](&OBJC_CLASS___UIWebClip, "webClips"));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier", (void)v12));
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if ((v10 & 1) != 0)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (id)_installedWebClip
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler savedWebClipIdentifier](self, "savedWebClipIdentifier"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _findInstalledClipWithIdentifier:](self, "_findInstalledClipWithIdentifier:", v3));
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      __int128 v15 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler found webclip for saved ID: %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    id v7 = v5;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);

    id v7 = (id)objc_claimAutoreleasedReturnValue( -[MCNewWebClipPayloadHandler _findInstalledClipWithIdentifier:]( self,  "_findInstalledClipWithIdentifier:",  v9));
    unsigned __int8 v10 = _MCLogObjects[0];
    BOOL v11 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        int v14 = 138543362;
        __int128 v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler found webclip for payload UUID: %{public}@",  (uint8_t *)&v14,  0xCu);
      }

      id v12 = v7;
    }

    else if (v11)
    {
      int v14 = 138543618;
      __int128 v15 = v3;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler could not find webclip for saved ID '%{public}@' or payload UUID '%{public}@'",  (uint8_t *)&v14,  0x16u);
    }
  }

  return v7;
}

- (void)remove
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v4 = [v3 isSetAside];

  if (v4)
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler ignoring remove because profile is set aside.",  buf,  2u);
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _installedWebClip](self, "_installedWebClip"));
    if (v6)
    {
      -[MCNewWebClipPayloadHandler _removeWebClip:](self, "_removeWebClip:", v6);
    }

    else
    {
      id v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler ignoring remove because webclip is not installed.",  v8,  2u);
      }
    }
  }

- (BOOL)isInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _installedWebClip](self, "_installedWebClip"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)setAside
{
  BOOL v3 = (UIWebClip *)objc_claimAutoreleasedReturnValue(-[MCNewWebClipPayloadHandler _installedWebClip](self, "_installedWebClip"));
  setAsideClip = self->_setAsideClip;
  self->_setAsideClip = v3;

  if (self->_setAsideClip)
  {
    -[MCNewWebClipPayloadHandler _removeWebClip:](self, "_removeWebClip:");
  }

  else
  {
    id v5 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler ignoring set aside because webclip is not installed.",  v6,  2u);
    }
  }

- (void)unsetAside
{
  setAsideClip = self->_setAsideClip;
  if (setAsideClip
    && (unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIWebClip identifier](setAsideClip, "identifier")),
        v4,
        v4))
  {
    if (-[MCNewWebClipPayloadHandler _addWebClip:](self, "_addWebClip:", self->_setAsideClip))
    {
      id v5 = self->_setAsideClip;
      self->_setAsideClip = 0LL;
    }
  }

  else
  {
    uint64_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "WebClipHandler ignoring unset aside because webclip is not set aside.",  v7,  2u);
    }
  }

- (id)_webclipFailedToCreateOnDiskError
{
  uint64_t v2 = MCWebClipErrorDomain;
  uint64_t v3 = MCErrorArray(@"WEBCLIP_PAYLOAD_CANNOT_INSTALL");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  8000LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (BOOL)_addWebClip:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  unsigned int v5 = [v3 createOnDisk];

  if (v5)
  {
    uint64_t v6 = MCSBSSpringBoardServerPort();
    id v7 = v4;
    MCSBAddWebClipToHomeScreen(v6, [v7 UTF8String]);
    os_log_t v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v7;
      v9 = "WebClipHandler added webclip with identifier: %{public}@";
      unsigned __int8 v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, 0xCu);
    }
  }

  else
  {
    os_log_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v4;
      v9 = "WebClipHandler failed to create webclip on disk with identifier: %{public}@";
      unsigned __int8 v10 = v12;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  return v5;
}

- (void)_removeWebClip:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = MCSBSSpringBoardServerPort();
  id v6 = v4;
  MCSBRemoveWebClipFromHomeScreen(v5, [v6 UTF8String]);
  LODWORD(v5) = [v3 removeFromDisk];

  os_log_t v7 = _MCLogObjects[0];
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      os_log_t v8 = "WebClipHandler removed webclip with identifier: %{public}@";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    }
  }

  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543362;
    id v12 = v6;
    os_log_t v8 = "WebClipHandler failed to remove webclip from disk with identifier: %{public}@";
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
}

@end