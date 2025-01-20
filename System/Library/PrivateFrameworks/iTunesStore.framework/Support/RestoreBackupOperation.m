@interface RestoreBackupOperation
+ (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4;
+ (BOOL)cancelApplicationRestoresWithBundleIDs:(id)a3;
+ (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4;
- (BOOL)isFailed;
- (NSString)bundleIdentifier;
- (RestoreBackupOperation)initWithBundleIdentifier:(id)a3 withPriority:(int64_t)a4 isFailed:(BOOL)a5;
- (int64_t)priority;
- (void)cancel;
- (void)dealloc;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didFailRestoreWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidFinishBackup:(id)a3;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)run;
@end

@implementation RestoreBackupOperation

- (RestoreBackupOperation)initWithBundleIdentifier:(id)a3 withPriority:(int64_t)a4 isFailed:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RestoreBackupOperation;
  v8 = -[RestoreBackupOperation init](&v10, "init");
  if (v8)
  {
    v8->_bundleID = (NSString *)[a3 copy];
    v8->_priority = a4;
    v8->_isFailed = a5;
    v8->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  }

  return v8;
}

- (void)dealloc
{
  semaphore = (dispatch_object_s *)self->_semaphore;
  if (semaphore) {
    dispatch_release(semaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RestoreBackupOperation;
  -[RestoreBackupOperation dealloc](&v4, "dealloc");
}

+ (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"MBManager", 18LL));
  unsigned __int8 v7 = [v6 cancelApplicationRestoreWithBundleID:a3 error:a4];

  return v7;
}

+ (BOOL)cancelApplicationRestoresWithBundleIDs:(id)a3
{
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v3 = [a3 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v41;
  BOOL v6 = 1;
  while (2)
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v41 != v5) {
        objc_enumerationMutation(a3);
      }
      uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
      unsigned __int8 v9 = +[ApplicationWorkspace keepSafeHarborDataForBundleID:]( &OBJC_CLASS___ApplicationWorkspace,  "keepSafeHarborDataForBundleID:",  v8,  v34);
      id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      id v11 = v10;
      if ((v9 & 1) != 0)
      {
        if (!v10) {
          id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v27 = [v11 shouldLog];
        else {
          LODWORD(v28) = v27;
        }
        v29 = (os_log_s *)[v11 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v28 = v28;
        }
        else {
          v28 &= 2u;
        }
        if ((_DWORD)v28)
        {
          uint64_t v30 = objc_opt_class(a1);
          int v44 = 138412546;
          uint64_t v45 = v30;
          __int16 v46 = 2112;
          uint64_t v47 = v8;
          LODWORD(v36) = 22;
          uint64_t v31 = _os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  0LL,  "%@: Could not cancel application restore with bundle ID: %@ because it is a MID based restore to save for later.",  &v44,  v36);
          if (v31)
          {
            v32 = (void *)v31;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v31, 4LL);
            free(v32);
            SSFileLog(v11, @"%@");
          }
        }

        return 0;
      }

      if (!v10) {
        id v11 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v12) = [v11 shouldLog];
      v13 = (os_log_s *)[v11 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        uint64_t v12 = v12;
      }
      else {
        v12 &= 2u;
      }
      if ((_DWORD)v12)
      {
        uint64_t v14 = objc_opt_class(a1);
        int v44 = 138412546;
        uint64_t v45 = v14;
        __int16 v46 = 2112;
        uint64_t v47 = v8;
        LODWORD(v36) = 22;
        uint64_t v15 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  1LL,  "%@: Cancel application restore: %@",  &v44,  v36);
        if (v15)
        {
          v16 = (void *)v15;
          v17 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v15, 4LL);
          free(v16);
          v35 = v17;
          SSFileLog(v11, @"%@");
        }
      }

      uint64_t v39 = 0LL;
      if (!+[RestoreBackupOperation cancelApplicationRestoreWithBundleID:error:]( &OBJC_CLASS___RestoreBackupOperation,  "cancelApplicationRestoreWithBundleID:error:",  v8,  &v39,  v35))
      {
        id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v18) {
          id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v19 = [v18 shouldLog];
        else {
          unsigned int v20 = v19;
        }
        v21 = (os_log_s *)[v18 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v22 = v20;
        }
        else {
          uint64_t v22 = v20 & 2;
        }
        if ((_DWORD)v22)
        {
          uint64_t v23 = objc_opt_class(a1);
          int v44 = 138412802;
          uint64_t v45 = v23;
          __int16 v46 = 2112;
          uint64_t v47 = v8;
          __int16 v48 = 2112;
          uint64_t v49 = v39;
          LODWORD(v36) = 32;
          uint64_t v24 = _os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Could not cancel application restore for bundle ID: %@ error: %@",  &v44,  v36);
          if (v24)
          {
            v25 = (void *)v24;
            v26 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL);
            free(v25);
            v34 = v26;
            SSFileLog(v18, @"%@");
          }
        }

        BOOL v6 = 0;
      }
    }

    id v4 = [a3 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v4) {
      continue;
    }
    break;
  }

  return v6;
}

+ (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4
{
  id v6 = objc_alloc_init((Class)ISWeakLinkedClassForString(@"MBManager", 18LL));
  unsigned __int8 v7 = [v6 restoreDataExistsForApplicationWithBundleID:a3 size:a4];

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleID;
}

- (BOOL)isFailed
{
  return self->_isFailed;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RestoreBackupOperation;
  -[RestoreBackupOperation cancel](&v3, "cancel");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)run
{
  if ([(id)objc_opt_class(self) restoreDataExistsForApplicationWithBundleID:self->_bundleID size:0])
  {
    id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v4 = [v3 shouldLog];
    else {
      LODWORD(v5) = v4;
    }
    id v6 = (os_log_s *)[v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      uint64_t v5 = v5;
    }
    else {
      v5 &= 2u;
    }
    if ((_DWORD)v5)
    {
      uint64_t v7 = objc_opt_class(self);
      bundleID = self->_bundleID;
      BOOL isFailed = self->_isFailed;
      int v87 = 138412802;
      uint64_t v88 = v7;
      __int16 v89 = 2112;
      unint64_t v90 = (unint64_t)bundleID;
      __int16 v91 = 1024;
      LODWORD(v92) = isFailed;
      uint64_t v10 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Restore data does not exist for bundleIdentifier: %@ after failure: %d",  &v87,  28);
      if (v10)
      {
        id v11 = (void *)v10;
        uint64_t v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
        free(v11);
        v79 = v12;
        SSFileLog(v3, @"%@");
      }
    }

    unint64_t v13 = 0LL;
    uint64_t v85 = SSErrorDomain;
    do
    {
      id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", v79);
      if (!v14) {
        id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v15 = [v14 shouldLog];
      v16 = (os_log_s *)[v14 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        uint64_t v17 = v15;
      }
      else {
        uint64_t v17 = v15 & 2;
      }
      if ((_DWORD)v17)
      {
        uint64_t v18 = objc_opt_class(self);
        unsigned int v19 = self->_bundleID;
        BOOL v20 = self->_isFailed;
        int v87 = 138413058;
        uint64_t v88 = v18;
        __int16 v89 = 2048;
        unint64_t v90 = v13;
        __int16 v91 = 2112;
        v92 = v19;
        __int16 v93 = 1024;
        BOOL v94 = v20;
        LODWORD(v84) = 38;
        uint64_t v21 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Starting data restore attempt: %ld for: %@ after failure: %d",  &v87,  v84);
        if (v21)
        {
          uint64_t v22 = (void *)v21;
          uint64_t v23 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
          free(v22);
          v80 = v23;
          SSFileLog(v14, @"%@");
        }
      }

      id v24 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"MBManager", 18)),  "initWithDelegate:",  self);
      unint64_t v86 = 0LL;
      id v25 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v25) {
        id v25 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      LODWORD(v26) = objc_msgSend(v25, "shouldLog", v80);
      unsigned int v27 = [v25 shouldLogToDisk];
      uint64_t v28 = (os_log_s *)[v25 OSLogObject];
      v29 = v28;
      if (v27) {
        LODWORD(v26) = v26 | 2;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
        uint64_t v26 = v26;
      }
      else {
        v26 &= 2u;
      }
      if ((_DWORD)v26)
      {
        uint64_t v30 = objc_opt_class(self);
        int64_t priority = self->_priority;
        int v87 = 138412546;
        uint64_t v88 = v30;
        __int16 v89 = 2048;
        unint64_t v90 = priority;
        LODWORD(v84) = 22;
        v32 = _os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v29,  1LL,  "%@: Starting restore with int64_t priority = %ld",  &v87,  v84);
        if (v32)
        {
          v33 = (void *)v32;
          v34 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v32, 4LL);
          free(v33);
          v81 = v34;
          SSFileLog(v25, @"%@");
        }
      }

      if (self->_priority == 1)
      {
        id v35 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v35) {
          id v35 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        LODWORD(v36) = objc_msgSend(v35, "shouldLog", v81);
        unsigned int v37 = [v35 shouldLogToDisk];
        v38 = (os_log_s *)[v35 OSLogObject];
        uint64_t v39 = v38;
        if (v37) {
          LODWORD(v36) = v36 | 2;
        }
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
          uint64_t v36 = v36;
        }
        else {
          v36 &= 2u;
        }
        if ((_DWORD)v36)
        {
          uint64_t v41 = objc_opt_class(self);
          int64_t v42 = self->_priority;
          int v87 = 138412546;
          uint64_t v88 = v41;
          __int16 v89 = 2048;
          unint64_t v90 = v42;
          LODWORD(v84) = 22;
          uint64_t v43 = _os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  1LL,  "%@:Starting Restore User Initiated, Priority = %ld",  &v87,  v84);
          if (v43)
          {
            int v44 = (void *)v43;
            uint64_t v45 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v43,  4LL);
            free(v44);
            v82 = v45;
            *(void *)&double v40 = SSFileLog(v35, @"%@").n128_u64[0];
          }
        }

        unsigned __int8 v46 = objc_msgSend( v24,  "restoreApplicationWithBundleID:failed:withQOS:context:error:",  self->_bundleID,  self->_isFailed,  25,  0,  &v86,  v40,  v82);
      }

      else
      {
        id v47 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v47) {
          id v47 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        LODWORD(v48) = objc_msgSend(v47, "shouldLog", v81);
        unsigned int v49 = [v47 shouldLogToDisk];
        v50 = (os_log_s *)[v47 OSLogObject];
        v51 = v50;
        if (v49) {
          LODWORD(v48) = v48 | 2;
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO)) {
          uint64_t v48 = v48;
        }
        else {
          v48 &= 2u;
        }
        if ((_DWORD)v48)
        {
          uint64_t v53 = objc_opt_class(self);
          int64_t v54 = self->_priority;
          int v87 = 138412546;
          uint64_t v88 = v53;
          __int16 v89 = 2048;
          unint64_t v90 = v54;
          LODWORD(v84) = 22;
          uint64_t v55 = _os_log_send_and_compose_impl( v48,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  1LL,  "%@: Starting Restore Discretionary, Priority = %ld",  &v87,  v84);
          if (v55)
          {
            v56 = (void *)v55;
            v57 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v55,  4LL);
            free(v56);
            v83 = v57;
            *(void *)&double v52 = SSFileLog(v47, @"%@").n128_u64[0];
          }
        }

        unsigned __int8 v46 = objc_msgSend( v24,  "restoreApplicationWithBundleID:failed:error:",  self->_bundleID,  self->_isFailed,  &v86,  v52,  v83);
      }

      if ((v46 & 1) != 0)
      {
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
      }

      else
      {
        id v58 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v58) {
          id v58 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        LODWORD(v59) = [v58 shouldLog];
        unsigned int v60 = [v58 shouldLogToDisk];
        v61 = (os_log_s *)[v58 OSLogObject];
        v62 = v61;
        if (v60) {
          LODWORD(v59) = v59 | 2;
        }
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v59 = v59;
        }
        else {
          v59 &= 2u;
        }
        if ((_DWORD)v59)
        {
          uint64_t v64 = objc_opt_class(self);
          int v87 = 138412546;
          uint64_t v88 = v64;
          __int16 v89 = 2112;
          unint64_t v90 = v86;
          LODWORD(v84) = 22;
          uint64_t v65 = _os_log_send_and_compose_impl( v59,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  0LL,  "%@: Could not begin restore: %@",  &v87,  v84);
          if (v65)
          {
            v66 = (void *)v65;
            v67 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v65,  4LL);
            free(v66);
            v79 = v67;
            *(void *)&double v63 = SSFileLog(v58, @"%@").n128_u64[0];
          }
        }

        -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 0LL, v63, v79);
        if (!v86) {
          SSError(v85, 100LL, 0LL, 0LL);
        }
        -[RestoreBackupOperation setError:](self, "setError:");
      }

      [v24 setDelegate:0];

      if ((-[RestoreBackupOperation success](self, "success") & 1) != 0
        || -[RestoreBackupOperation error](self, "error"))
      {
        break;
      }

      unsigned __int8 v68 = -[RestoreBackupOperation isCancelled](self, "isCancelled");
      char v69 = v13++ > 3 ? 1 : v68;
    }

    while ((v69 & 1) == 0);
  }

  else
  {
    -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 1LL);
    id v70 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v70) {
      id v70 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v71 = [v70 shouldLog];
    else {
      LODWORD(v72) = v71;
    }
    v73 = (os_log_s *)[v70 OSLogObject];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO)) {
      uint64_t v72 = v72;
    }
    else {
      v72 &= 2u;
    }
    if ((_DWORD)v72)
    {
      uint64_t v74 = objc_opt_class(self);
      v75 = self->_bundleID;
      BOOL v76 = self->_isFailed;
      int v87 = 138412802;
      uint64_t v88 = v74;
      __int16 v89 = 2112;
      unint64_t v90 = (unint64_t)v75;
      __int16 v91 = 1024;
      LODWORD(v92) = v76;
      uint64_t v77 = _os_log_send_and_compose_impl( v72,  0LL,  0LL,  0LL,  &_mh_execute_header,  v73,  1LL,  "%@: Restore data exists for bundleIdentifier: %@ after failure: %d",  &v87,  28);
      if (v77)
      {
        v78 = (void *)v77;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v77, 4LL);
        free(v78);
        SSFileLog(v70, @"%@");
      }
    }
  }

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3);
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  unsigned __int8 v9 = (os_log_s *)[v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if ((_DWORD)v8)
  {
    uint64_t v11 = objc_opt_class(self);
    bundleID = self->_bundleID;
    int v17 = 138412802;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    BOOL v20 = bundleID;
    __int16 v21 = 2112;
    id v22 = a4;
    uint64_t v13 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%@: Data backup failed: %@: %@",  &v17,  32);
    if (v13)
    {
      id v14 = (void *)v13;
      unsigned int v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
      free(v14);
      v16 = v15;
      *(void *)&double v10 = SSFileLog(v6, @"%@").n128_u64[0];
    }
  }

  if (!a4) {
    a4 = (id)SSError(SSErrorDomain, 100LL, 0LL, 0LL);
  }
  -[RestoreBackupOperation setError:](self, "setError:", a4, v10, v16);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3);
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  unsigned __int8 v9 = (os_log_s *)[v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if ((_DWORD)v8)
  {
    uint64_t v11 = objc_opt_class(self);
    bundleID = self->_bundleID;
    int v17 = 138412802;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    BOOL v20 = bundleID;
    __int16 v21 = 2112;
    id v22 = a4;
    uint64_t v13 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%@: Data restore failed: %@: %@",  &v17,  32);
    if (v13)
    {
      id v14 = (void *)v13;
      unsigned int v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
      free(v14);
      v16 = v15;
      *(void *)&double v10 = SSFileLog(v6, @"%@").n128_u64[0];
    }
  }

  if (!a4) {
    a4 = (id)SSError(SSErrorDomain, 100LL, 0LL, 0LL);
  }
  -[RestoreBackupOperation setError:](self, "setError:", a4, v10, v16);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3, a5);
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v8 = [v7 shouldLog];
  else {
    LODWORD(v9) = v8;
  }
  double v10 = (os_log_s *)[v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    uint64_t v9 = v9;
  }
  else {
    v9 &= 2u;
  }
  if ((_DWORD)v9)
  {
    int v17 = 138412546;
    uint64_t v18 = objc_opt_class(self);
    __int16 v19 = 2048;
    double v20 = a4;
    uint64_t v12 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  2LL,  "%@: Data restore did update progress: %.2f",  &v17,  22);
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      id v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      v16 = v14;
      *(void *)&double v11 = SSFileLog(v7, @"%@").n128_u64[0];
    }
  }

  -[RestoreBackupOperation lock](self, "lock", v11, v16);
  uint64_t v15 = OBJC_IVAR___ISOperation__progress;
  objc_msgSend( *(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress],  "setCurrentValue:",  (uint64_t)(float)((float)(uint64_t)objc_msgSend( *(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress],  "maxValue")
                   * a4));
  [*(id *)&self->ISOperation_opaque[v15] snapshot];
  -[RestoreBackupOperation unlock](self, "unlock");
  -[RestoreBackupOperation sendProgressToDelegate](self, "sendProgressToDelegate");
}

- (void)managerDidFinishBackup:(id)a3
{
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3);
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  id v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    uint64_t v9 = objc_opt_class(self);
    bundleID = self->_bundleID;
    int v15 = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = bundleID;
    uint64_t v11 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Data restore finished: %@",  &v15,  22);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      id v14 = v13;
      *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
    }
  }

  -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 1LL, v8, v14);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)managerDidFinishRestore:(id)a3
{
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3);
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  id v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    uint64_t v9 = objc_opt_class(self);
    bundleID = self->_bundleID;
    int v15 = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = bundleID;
    uint64_t v11 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Data restore finished: %@",  &v15,  22);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
      free(v12);
      id v14 = v13;
      *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
    }
  }

  -[RestoreBackupOperation setSuccess:](self, "setSuccess:", 1LL, v8, v14);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3);
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  id v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    uint64_t v8 = objc_opt_class(self);
    bundleID = self->_bundleID;
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    int v15 = bundleID;
    uint64_t v10 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%@: Data restore lost connection: %@",  &v12,  22);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      SSFileLog(v4, @"%@");
    }
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (int64_t)priority
{
  return self->_priority;
}

@end