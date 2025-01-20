@interface IXGlobalConfiguration
+ (id)sharedInstance;
- (BOOL)isiPad;
- (IXGlobalConfiguration)init;
- (NSURL)daemonUserHome;
- (NSURL)dataStorageHome;
- (NSURL)frameworkURL;
- (NSURL)rootPath;
- (NSURL)userVolumeURL;
- (id)_dataStorageHomeURLWithError:(id *)a3;
- (id)_userTempDirURLWithError:(id *)a3;
- (id)dataDirectoryAbortingOnError;
- (id)dataDirectoryWithError:(id *)a3;
- (id)extractedInstallableStagingDirectory:(id *)a3;
- (id)iconStagingDirectoryWithError:(id *)a3;
- (id)promiseStagingRootDirectoryAbortingOnError;
- (id)promiseStagingRootDirectoryWithError:(id *)a3;
- (id)remoteInstallationStagingDirectory:(id *)a3;
- (id)removabilityDirectoryAbortingOnError;
- (id)removabilityDirectoryWithError:(id *)a3;
- (unsigned)daemonGID;
- (unsigned)daemonUID;
- (void)createDirectories;
@end

@implementation IXGlobalConfiguration

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008D98;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E28 != -1) {
    dispatch_once(&qword_1000E8E28, block);
  }
  return (id)qword_1000E8E20;
}

- (IXGlobalConfiguration)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IXGlobalConfiguration;
  v2 = -[IXGlobalConfiguration init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_dynamicPropertyLock._os_unfair_lock_opaque = 0;
    size_t v4 = sysconf(71);
    if (v4 == -1LL) {
      sub_100079774(&v14, v16);
    }
    v13 = 0LL;
    else {
      BOOL v5 = v13 == 0LL;
    }
    if (v5) {
      sub_100079820(&v12, v16);
    }
    pw_dir = v14.pw_dir;
    v3->_daemonUID = v14.pw_uid;
    v3->_daemonGID = v14.pw_gid;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  pw_dir,  1LL,  0LL));
    daemonUserHome = v3->_daemonUserHome;
    v3->_daemonUserHome = (NSURL *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  "/",  1LL,  0LL));
    rootPath = v3->_rootPath;
    v3->_rootPath = (NSURL *)v9;
  }

  return v3;
}

- (BOOL)isiPad
{
  v2 = (void *)MGGetStringAnswer(@"DeviceClass", a2);
  unsigned __int8 v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (void)createDirectories
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v50 = 0LL;
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration _dataStorageHomeURLWithError:](self, "_dataStorageHomeURLWithError:", &v50));
  id v5 = v50;
  v6 = v5;
  if (!v4) {
    sub_1000798E0(&v51, buf);
  }
  id v49 = v5;
  unsigned __int8 v7 = [v4 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v49];
  id v8 = v49;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to set backup exclusion on %@ : %@",  buf,  0x20u);
    }
  }

  id v48 = v8;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", &v48));
  id v13 = v48;

  if (!v12) {
    sub_100079948(&v51, buf);
  }
  id v47 = v13;
  unsigned __int8 v14 = [v3 createDirectoryAtURL:v12 withIntermediateDirectories:1 mode:489 class:4 error:&v47];
  id v15 = v47;

  if ((v14 & 1) == 0)
  {
    uint64_t v46 = 0LL;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    memset(buf, 0, sizeof(buf));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v33 = 3LL;
    }
    else {
      uint64_t v33 = 2LL;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    int v51 = 138412546;
    v52 = v34;
    __int16 v53 = 2112;
    id v54 = v15;
    uint64_t v35 = _os_log_send_and_compose_impl(v33, &v46, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

    _os_crash_msg(v46, v35);
    __break(1u);
    goto LABEL_25;
  }

  v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Created %@", buf, 0x16u);
  }

  id v45 = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue( -[IXGlobalConfiguration promiseStagingRootDirectoryWithError:]( self,  "promiseStagingRootDirectoryWithError:",  &v45));
  id v20 = v45;

  if (!v19) {
LABEL_25:
  }
    sub_1000799B0(&v51, buf);
  id v44 = v20;
  unsigned __int8 v21 = [v3 createDirectoryAtURL:v19 withIntermediateDirectories:1 mode:489 class:4 error:&v44];
  id v22 = v44;

  if ((v21 & 1) == 0)
  {
    uint64_t v46 = 0LL;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    memset(buf, 0, sizeof(buf));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v36 = 3LL;
    }
    else {
      uint64_t v36 = 2LL;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
    int v51 = 138412546;
    v52 = v37;
    __int16 v53 = 2112;
    id v54 = v22;
    uint64_t v38 = _os_log_send_and_compose_impl(v36, &v46, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

    _os_crash_msg(v46, v38);
    __break(1u);
    goto LABEL_30;
  }

  v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: Created %@", buf, 0x16u);
  }

  id v43 = v22;
  v26 = (void *)objc_claimAutoreleasedReturnValue( -[IXGlobalConfiguration removabilityDirectoryWithError:]( self,  "removabilityDirectoryWithError:",  &v43));
  id v27 = v43;

  if (!v26) {
LABEL_30:
  }
    sub_100079A18(&v51, buf);
  id v42 = v27;
  unsigned __int8 v28 = [v3 createDirectoryAtURL:v26 withIntermediateDirectories:1 mode:489 class:4 error:&v42];
  id v29 = v42;

  if ((v28 & 1) == 0)
  {
    uint64_t v46 = 0LL;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    memset(buf, 0, sizeof(buf));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      uint64_t v39 = 3LL;
    }
    else {
      uint64_t v39 = 2LL;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
    int v51 = 138412546;
    v52 = v40;
    __int16 v53 = 2112;
    id v54 = v29;
    uint64_t v41 = _os_log_send_and_compose_impl(v39, &v46, buf, 80LL, &_mh_execute_header, &_os_log_default, 16LL);

    _os_crash_msg(v46, v41);
    __break(1u);
  }

  v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[IXGlobalConfiguration createDirectories]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: Created %@", buf, 0x16u);
  }
}

- (id)_dataStorageHomeURLWithError:(id *)a3
{
  p_dynamicPropertyLock = &self->_dynamicPropertyLock;
  os_unfair_lock_lock(&self->_dynamicPropertyLock);
  dataStorageHome = self->_dataStorageHome;
  if (dataStorageHome)
  {
    unsigned __int8 v7 = 0LL;
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v8 = container_system_group_path_for_identifier(0LL, "systemgroup.com.apple.installcoordinationd", &v18);
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v8,  1LL,  0LL));
      v11 = self->_dataStorageHome;
      self->_dataStorageHome = v10;

      free(v9);
      unsigned __int8 v7 = 0LL;
    }

    else
    {
      uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100079A80(&v18, v13);
      }

      id v15 = sub_10003556C( (uint64_t)"-[IXGlobalConfiguration _dataStorageHomeURLWithError:]",  230LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_group_path_for_identifier returned %llu",
              v14,
              v18);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v15);
    }

    dataStorageHome = self->_dataStorageHome;
  }

  v16 = dataStorageHome;
  os_unfair_lock_unlock(p_dynamicPropertyLock);
  if (a3 && !v16) {
    *a3 = v7;
  }

  return v16;
}

- (id)dataDirectoryWithError:(id *)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration _dataStorageHomeURLWithError:](self, "_dataStorageHomeURLWithError:", a3));
  size_t v4 = v3;
  if (v3) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 urlByAppendingPathComponents:&off_1000D6DF0 lastIsDirectory:1]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)dataDirectoryAbortingOnError
{
  id v6 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", &v6));
  id v3 = v6;
  if (!v2) {
    sub_100079B18(&v5, v7);
  }

  return v2;
}

- (id)promiseStagingRootDirectoryWithError:(id *)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", a3));
  size_t v4 = v3;
  if (v3) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"PromiseStaging" isDirectory:1]);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)promiseStagingRootDirectoryAbortingOnError
{
  id v6 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IXGlobalConfiguration promiseStagingRootDirectoryWithError:]( self,  "promiseStagingRootDirectoryWithError:",  &v6));
  id v3 = v6;
  if (!v2) {
    sub_100079B80(&v5, v7);
  }

  return v2;
}

- (id)removabilityDirectoryWithError:(id *)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", a3));
  size_t v4 = v3;
  if (v3) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"Removability" isDirectory:1]);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)removabilityDirectoryAbortingOnError
{
  id v6 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration removabilityDirectoryWithError:](self, "removabilityDirectoryWithError:", &v6));
  id v3 = v6;
  if (!v2) {
    sub_100079A18(&v5, v7);
  }

  return v2;
}

- (id)remoteInstallationStagingDirectory:(id *)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", a3));
  size_t v4 = v3;
  if (v3) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"RemoteInstallStaging" isDirectory:1]);
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)_userTempDirURLWithError:(id *)a3
{
  if (confstr(65537, v11, 0x400uLL))
  {
    size_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v11,  1LL,  0LL));
    uint64_t v5 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    id v6 = __error();
    unint64_t v7 = *v6;
    strerror(*v6);
    id v9 = sub_10003556C( (uint64_t)"-[IXGlobalConfiguration _userTempDirURLWithError:]",  321LL,  NSPOSIXErrorDomain,  v7,  0LL,  0LL,  @"Failed to initialize temporary directory: error = %d (%s)",  v8,  v7);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
    size_t v4 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v4) {
    *a3 = v5;
  }
LABEL_7:

  return v4;
}

- (id)iconStagingDirectoryWithError:(id *)a3
{
  id v8 = 0LL;
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration _userTempDirURLWithError:](self, "_userTempDirURLWithError:", &v8));
  id v5 = v8;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"TempIcons" isDirectory:1]);
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    id v6 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v6) {
    *a3 = v5;
  }
LABEL_7:

  return v6;
}

- (id)extractedInstallableStagingDirectory:(id *)a3
{
  id v8 = 0LL;
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration _userTempDirURLWithError:](self, "_userTempDirURLWithError:", &v8));
  id v5 = v8;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"ExtractedApps" isDirectory:1]);
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    id v6 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v6) {
    *a3 = v5;
  }
LABEL_7:

  return v6;
}

- (NSURL)frameworkURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration rootPath](self, "rootPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlByAppendingPathComponents:&off_1000D6E08 lastIsDirectory:1]);

  return (NSURL *)v3;
}

- (NSURL)userVolumeURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXGlobalConfiguration rootPath](self, "rootPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlByAppendingPathComponents:&off_1000D6E20 lastIsDirectory:1]);

  return (NSURL *)v3;
}

- (NSURL)dataStorageHome
{
  return self->_dataStorageHome;
}

- (unsigned)daemonUID
{
  return self->_daemonUID;
}

- (unsigned)daemonGID
{
  return self->_daemonGID;
}

- (NSURL)daemonUserHome
{
  return self->_daemonUserHome;
}

- (NSURL)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
}

@end