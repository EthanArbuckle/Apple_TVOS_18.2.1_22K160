int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  id v5;
  os_log_s *v6;
  TRIServiceDelegate *v7;
  void *v8;
  int v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  v3 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.trial.TrialArchivingService") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v10 = *__error();
    v11 = 136315394;
    v12 = "com.apple.trial.TrialArchivingService";
    v13 = 1024;
    v14 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to set private sandbox for %s, errno: %d",  (uint8_t *)&v11,  0x12u);
  }

  v4 = NSTemporaryDirectory();
  v5 = TRILogCategory_Archiving();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TrialArchivingService started",  (uint8_t *)&v11,  2u);
  }

  v7 = objc_opt_new(&OBJC_CLASS___TRIServiceDelegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v8 setDelegate:v7];
  [v8 resume];

  objc_autoreleasePoolPop(v3);
  return 1;
}

id TRILogCategory_Server()
{
  if (qword_100010F70 != -1) {
    dispatch_once(&qword_100010F70, &stru_10000C500);
  }
  return (id)qword_100010F78;
}

void sub_10000149C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.triald", "server");
  v2 = (void *)qword_100010F78;
  qword_100010F78 = (uint64_t)v1;
}

id TRILogCategory_Archiving()
{
  if (qword_100010F80 != -1) {
    dispatch_once(&qword_100010F80, &stru_10000C520);
  }
  return (id)qword_100010F88;
}

void sub_10000150C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.triald", "archiving");
  v2 = (void *)qword_100010F88;
  qword_100010F88 = (uint64_t)v1;
}

LABEL_10:
    return 0LL;
  }

  return v3;
}

LABEL_7:
  if (archive_write_free(v3))
  {
    v8 = TRILogCategory_Archiving();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unable to free archive_write_disk (leaking)",  (uint8_t *)&v11,  2u);
    }
  }

  return 0LL;
}

void sub_100001E68(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x100001BB4LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_82:
LABEL_83:
        v78.var0 = 0;
        goto LABEL_96;
      }

      v13 = v112;
      v14 = v10;
      v15 = archive_entry_filetype(v13);
      v16 = v15;
      if (v15 != 0x4000 && v15 != 0x8000)
      {
        v83 = TRILogCategory_Archiving();
        v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          v101 = archive_entry_pathname(v13);
          *(_DWORD *)buf = 136315650;
          v127 = v101;
          v128 = 1024;
          *(_DWORD *)v129 = v16;
          *(_WORD *)&v129[4] = 2112;
          *(void *)&v129[6] = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "found file that is neither directory nor regular file. Aborting. Offending file: %s, file type: 0x%x, archiv e identifier: %@",  buf,  0x1Cu);
        }

        goto LABEL_83;
      }

      v17 = objc_autoreleasePoolPush();
      v18 = archive_entry_pathname_utf8(v13);
      if (v18)
      {
        v19 = (const char *)v18;
        v20 = 0LL;
        do
          v21 = *(unsigned __int8 *)(v18 + v20++);
        while (v21 == 47);
        if (v20 != 1)
        {
          v22 = TRILogCategory_Archiving();
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = strlen(v19);
            *(_DWORD *)buf = 134218240;
            v127 = v20 - 1;
            v128 = 2048;
            *(void *)v129 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.",  buf,  0x16u);
          }
        }

        v25 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", &v19[v20 - 1]);
        v26 = v25;
        if (!v25)
        {
          v36 = TRILogCategory_Archiving();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v127 = (uint64_t)&v19[v20 - 1];
            v31 = v30;
            v32 = "Unable to initialize entry path with string %s";
            v33 = 12;
            goto LABEL_70;
          }

LABEL_22:
          v28 = 0;
          v35 = 1;
LABEL_43:

          goto LABEL_44;
        }

        v27 = -[NSString length](v25, "length");
        v28 = v27 == 0;
        if (v16 != 0x4000 && !v27)
        {
          v29 = TRILogCategory_Archiving();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v31 = v30;
            v32 = "archive_entry with no path after sanitization encountered.";
            v33 = 2;
LABEL_70:
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
            goto LABEL_22;
          }

          goto LABEL_22;
        }

        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v26, "lastPathComponent"));
        if ((unint64_t)-[os_log_s length](v30, "length") < 0x81)
        {
          v106 = v11;
          v107 = v10;
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSString pathComponents](v26, "pathComponents"));
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v38 = v39;
          v40 = [v38 countByEnumeratingWithState:&v114 objects:v118 count:16];
          if (v40)
          {
            v41 = v40;
            v42 = *(void *)v115;
            while (2)
            {
              for (i = 0LL; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v115 != v42) {
                  objc_enumerationMutation(v38);
                }
                if ([*(id *)(*((void *)&v114 + 1) + 8 * (void)i) isEqualToString:@".."])
                {
                  v46 = TRILogCategory_Archiving();
                  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v127 = (uint64_t)v26;
                  }

                  v45 = (os_log_s *)v38;
                  v11 = v106;
                  v10 = v107;
                  goto LABEL_40;
                }
              }

              v41 = [v38 countByEnumeratingWithState:&v114 objects:v118 count:16];
              if (v41) {
                continue;
              }
              break;
            }
          }

          if ((unint64_t)[v38 count] < 0x11)
          {
            v35 = 0;
            v11 = v106;
            v10 = v107;
            goto LABEL_42;
          }

          v44 = TRILogCategory_Archiving();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          v11 = v106;
          v10 = v107;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v127 = (uint64_t)v26;
            v128 = 2112;
            *(void *)v129 = v107;
            _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Directory depth more than maximum allowable depth. Stopping unarchival. Offending file: %@, archive identifier: %@",  buf,  0x16u);
          }

LABEL_40:
        }

        else
        {
          v37 = TRILogCategory_Archiving();
          v38 = (id)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            v127 = 128LL;
            v128 = 2112;
            *(void *)v129 = v30;
            *(_WORD *)&v129[8] = 2112;
            *(void *)&v129[10] = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v38,  OS_LOG_TYPE_ERROR,  "Encountered fileName greater that %ld characters. Offending fileName: %@, archive identifier: %@",  buf,  0x20u);
          }
        }

        v35 = 1;
LABEL_42:

        goto LABEL_43;
      }

      v34 = TRILogCategory_Archiving();
      v26 = (NSString *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "archive_entry with no path encountered.",  buf,  2u);
      }

      v28 = 0;
      v35 = 1;
LABEL_44:

      objc_autoreleasePoolPop(v17);
      if (v35) {
        goto LABEL_83;
      }
      if (v16 == 0x4000) {
        v48 = 448;
      }
      else {
        v48 = 384;
      }
      v49 = v112;
      v50 = archive_entry_perm(v112);
      archive_entry_set_perm(v49, v50 & v48);
    }

    while (v28);
    v51 = objc_alloc(&OBJC_CLASS___NSString);
    v52 = archive_entry_pathname_utf8(v112);
    if (!v52)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v75 handleFailureInMethod:a2, v109, @"TRIArchiveExtractor.m", 358, @"Expression was unexpectedly nil/false: %@", @"archive_entry_pathname_utf8(entry)" object file lineNumber description];
    }

    v53 = -[NSString initWithUTF8String:](v51, "initWithUTF8String:", v52);
    if (!v53)
    {
      v85 = TRILogCategory_Archiving();
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
      if (!os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
        goto LABEL_82;
      }
      v102 = archive_entry_pathname_utf8(v112);
      *(_DWORD *)v118 = 136315138;
      v119 = v102;
      v82 = "unable to convert path to UTF-8: %s";
LABEL_107:
      _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, v82, v118, 0xCu);
      goto LABEL_82;
    }

    v54 = v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v54, "lastPathComponent"));
    v56 = [v55 hasPrefix:@"._"];
    v57 = v54;
    if (v16 != 0x4000)
    {
      v57 = v54;
      if (v56)
      {
        v58 = objc_opt_new(&OBJC_CLASS___NSUUID);
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v58, "UUIDString"));
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 stringByAppendingString:v55]);

        v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](v54, "stringByDeletingLastPathComponent"));
        v62 = (void *)objc_claimAutoreleasedReturnValue([v61 stringByAppendingPathComponent:v60]);

        v63 = v112;
        v57 = v62;
        archive_entry_set_pathname_utf8(v63, -[NSString fileSystemRepresentation](v57, "fileSystemRepresentation"));
        v64 = TRILogCategory_Archiving();
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v118 = 138412290;
          v119 = (uint64_t)v54;
          _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "warning: extracting AppleDouble path as regular file: %@",  v118,  0xCu);
        }
      }
    }

    if (!archive_entry_size_is_set(v112) || archive_entry_size(v112) >= 1)
    {
      v66 = [v109 _copyDataFromReadArchive:a4 toWriteDiskArchive:v110 remainingQuota:&v113 archiveIdentifier:v14 shouldDefer:v11];
      if (v66 == 2)
      {
        v78.var0 = v66;
        goto LABEL_95;
      }

      if (!v66)
      {
        v90 = TRILogCategory_Archiving();
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          goto LABEL_94;
        }
        v91 = archive_error_string(v110);
        *(_DWORD *)v118 = 136315138;
        v119 = v91;
        v88 = "error copying data to write archive - %s";
LABEL_91:
        v92 = v70;
        v93 = 12;
LABEL_92:
        _os_log_error_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, v88, v118, v93);
        goto LABEL_94;
      }
    }

    v67 = archive_write_finish_entry(v110);
    v68 = TRILogCategory_Archiving();
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    v70 = v69;
    if (v67)
    {
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        goto LABEL_94;
      }
      v89 = archive_error_string(v110);
      *(_DWORD *)v118 = 136315138;
      v119 = v89;
      v88 = "archive_write_finish_entry failed - %s";
      goto LABEL_91;
    }

    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      v71 = archive_entry_pathname(v112);
      *(_DWORD *)v118 = 136315138;
      v119 = v71;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "finished writing archive entry %s", v118, 0xCu);
    }

    if (!-[NSString isEqualToString:](v57, "isEqualToString:", v54))
    {
      v72 = v57;
      v73 = -[NSString fileSystemRepresentation](v72, "fileSystemRepresentation");
      v74 = v54;
      if (rename(v73, -[NSString fileSystemRepresentation](v74, "fileSystemRepresentation")))
      {
        v94 = TRILogCategory_Archiving();
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
        if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          goto LABEL_94;
        }
        v103 = __error();
        v104 = strerror(*v103);
        v105 = *__error();
        *(_DWORD *)v118 = 138413058;
        v119 = (uint64_t)v72;
        v120 = 2112;
        v121 = v74;
        v122 = 2080;
        v123 = v104;
        v124 = 1024;
        v125 = v105;
        v88 = "unable to rename munged AppleDouble path %@ --> %@: %s (%d)";
        v92 = v70;
        v93 = 38;
        goto LABEL_92;
      }
    }
  }

  v86 = TRILogCategory_Archiving();
  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    v87 = archive_error_string(v110);
    *(_DWORD *)v118 = 136315138;
    v119 = v87;
    v88 = "archive_write_header failed - %s";
    goto LABEL_91;
  }

LABEL_94:
  v78.var0 = 0;
LABEL_95:

LABEL_96:
  v95 = archive_write_close(v110);
  if (v78.var0 == 1 && v95)
  {
    v96 = TRILogCategory_Archiving();
    v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_ERROR,  "unable to close archive_write_disk",  v118,  2u);
    }

    v78.var0 = 0;
  }

  if (archive_write_free(v110))
  {
    v98 = TRILogCategory_Archiving();
    v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_ERROR,  "unable to free archive_write_disk",  v118,  2u);
    }
  }

LABEL_105:
  return v78;
}

void sub_100002CD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

BOOL sub_100002CE8(id a1)
{
  return 0;
}

void sub_100002CF0(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 64) _createReadArchive];
  if (!v4)
  {
    id v11 = TRILogCategory_Archiving();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v1_Block_object_dispose(va, 8) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error creating archive for reading.",  (uint8_t *)&v18,  2u);
    }

    unsigned __int8 v13 = 0;
    uint64_t v14 = a1 + 56;
    goto LABEL_18;
  }

  id v5 = v4;
  if (archive_read_open_fd(v4, [*(id *)(a1 + 32) fileDescriptor], 0x80000))
  {
    id v6 = TRILogCategory_Archiving();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      uint64_t v19 = archive_error_string(v5);
      v8 = "unable to open archive_read - %s.";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_21:
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v18, v10);
    }
  }

  else
  {
    notify_post("com.apple.trial.TrialArchivingService.test.beginExtract");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = [*(id *)(a1 + 64) _withLockWitness:a2 performExtractionIn toCurrentDirectoryFromArchive:v5 maxUna rchivedSize:*(void *)(a1 + 72) archiveIdentifier:*(void *)(a1 + 40) shouldDefer:*(void *)(a1 + 48)];
    id v15 = TRILogCategory_Archiving();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v1_Block_object_dispose(va, 8) = 0;
      v8 = "unable to close archive_read";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_21;
    }
  }

LABEL_11:
  if (archive_read_free(v5))
  {
    id v16 = TRILogCategory_Archiving();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1_Block_object_dispose(va, 8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "unable to free archive_read (leaking)",  (uint8_t *)&v18,  2u);
    }
  }

  uint64_t v14 = a1 + 56;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 32LL) == 1 && *(void *)(a1 + 80) == 1LL)
  {
    notify_post("com.apple.trial.TrialArchivingService.test.beginCompress");
    unsigned __int8 v13 = [*(id *)(a1 + 64) _compressFilesInCurrentDirectoryWithLockWitness:a2 shouldDefer:*(void *)(a1 + 48)];
LABEL_18:
    *(_BYTE *)(*(void *)(*(void *)v14 + 8LL) + 32LL) = v13;
  }
}

LABEL_8:
  return ($A5A652246548B43F8BC05201A1C72A70)v23;
}

LABEL_48:
}

void sub_10000394C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
  if (a2)
  {
    _Block_object_dispose(&a26, 8);
    objc_begin_catch(exception_object);
    if (!v26) {
      JUMPOUT(0x100003724LL);
    }
    JUMPOUT(0x10000372CLL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000039E0(uint64_t a1)
{
  id v1 = TRILogCategory_Archiving();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "com.apple.trial.TrialArchivingService.shouldDefer";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "received notification: %s",  (uint8_t *)&v3,  0xCu);
  }
}

uint64_t sub_100003A98(uint64_t a1)
{
  if (*(double *)(a1 + 40) > 0.0)
  {
    id v2 = TRILogCategory_Archiving();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Test config: pausing for %g sec before deferral check",  (uint8_t *)&v9,  0xCu);
    }

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", *(double *)(a1 + 40));
    id v4 = TRILogCategory_Archiving();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Test config: deferral check executing",  (uint8_t *)&v9,  2u);
    }
  }

  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  return v6 & 1;
}

void sub_100004008(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x100003E74LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_38:
      break;
    case 2u:
      v38 = TRILogCategory_Archiving();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v40 = "directory patching deferred";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
        goto LABEL_38;
      }

      goto LABEL_38;
  }

  if (v21) {
    v21[2](v21, v37, v55);
  }

  _Block_object_dispose(v58, 8);
  if (!v50) {
    notify_cancel(out_token);
  }
  if (v51 != -1) {
    sandbox_extension_release(v51);
  }
  if (v52 != -1) {
    sandbox_extension_release(v52);
  }
  if (v53 != -1) {
    sandbox_extension_release(v53);
  }
LABEL_49:
}

void sub_1000046FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
  if (a2)
  {
    _Block_object_dispose(&a27, 8);
    objc_begin_catch(exception_object);
    JUMPOUT(0x100004548LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_10000478C(uint64_t a1)
{
  id v1 = TRILogCategory_Archiving();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "com.apple.trial.TrialArchivingService.shouldDefer";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "received notification: %s",  (uint8_t *)&v3,  0xCu);
  }
}

uint64_t sub_100004844(uint64_t a1)
{
  if (*(double *)(a1 + 40) > 0.0)
  {
    id v2 = TRILogCategory_Archiving();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Test config: pausing for %g sec before deferral check",  (uint8_t *)&v9,  0xCu);
    }

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", *(double *)(a1 + 40));
    id v4 = TRILogCategory_Archiving();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Test config: deferral check executing",  (uint8_t *)&v9,  2u);
    }
  }

  unsigned __int8 v6 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  return v6 & 1;
}

LABEL_61:
        __break(1u);
      }

      v35 = TRILogCategory_Archiving();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Skipping purge, ANE runtime not available on device",  buf,  2u);
      }

      if (!v9)
      {
LABEL_35:
        v29 = 0LL;
        v37 = 0;
LABEL_46:
        objc_autoreleasePoolPop(v17);
        if (v37)
        {
          if (v29)
          {
            v47 = TRILogCategory_Archiving();
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v7;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v29;
              _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "Failed to purge ANE segments for model at URL %@: %@",  buf,  0x16u);
            }
          }

          else
          {
            v49 = TRILogCategory_Archiving();
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Successfully purged ANE segments for model at URL %@",  buf,  0xCu);
            }
          }

          if (v9) {
            v9[2](v9, v29);
          }
        }

        if (v14 != -1) {
          sandbox_extension_release(v14);
        }
        goto LABEL_56;
      }
    }

    else
    {
      v33 = TRILogCategory_Archiving();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Skipping purge, Espresso runtime not available",  buf,  2u);
      }

      if (!v9) {
        goto LABEL_35;
      }
    }

    v9[2](v9, 0LL);
    goto LABEL_35;
  }

  v30 = objc_alloc(&OBJC_CLASS___NSError);
  v65 = NSLocalizedDescriptionKey;
  v66 = @"nil parameter provided to removeCachedANESegmentsForModelAtURL";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
  v32 = -[NSError initWithDomain:code:userInfo:]( v30,  "initWithDomain:code:userInfo:",  @"TRIGeneralErrorDomain",  2LL,  v31);

  if (v9) {
    v9[2](v9, v32);
  }

LABEL_56:
}

void sub_10000522C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2)
  {
    _Block_object_dispose(&a19, 8);
    objc_begin_catch(exception_object);
    JUMPOUT(0x100005008LL);
  }

  _Unwind_Resume(exception_object);
}

void *sub_1000052B4()
{
  id v4 = 0LL;
  if (!qword_100010F90)
  {
    __int128 v5 = off_10000C5F8;
    uint64_t v6 = 0LL;
    qword_100010F90 = _sl_dlopen(&v5, &v4);
  }

  v0 = (void *)qword_100010F90;
  if (!qword_100010F90)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *EspressoLibrary(void)"));
    objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"TrialArchivingService.m",  29,  @"%s",  v4);

    __break(1u);
    goto LABEL_7;
  }

  id v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

BOOL sub_1000058D4(id a1)
{
  return 0;
}

BOOL sub_1000058DC(id a1)
{
  return 0;
}

BOOL sub_100005C38(id a1)
{
  return 0;
}

void sub_100006118( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_10000615C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000616C(uint64_t a1)
{
}

void sub_100006174(uint64_t a1)
{
  unsigned int v2 = atomic_load((unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  if (v2 == 1)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))())
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = 0LL;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      id v5 = TRILogCategory_Archiving();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Deferring during AFSC stream write.",  (uint8_t *)&v14,  2u);
      }

      atomic_store(2u, (unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
    }

    else
    {
      uint64_t v9 = ParallelCompressionAFSCStreamWrite( *(void *)(a1 + 64), [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) bytes], objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "length"));
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0LL;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      if (v9 < 0)
      {
        id v12 = TRILogCategory_Archiving();
        unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 134217984;
          uint64_t v15 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "AFSC stream failed to write with error (%zu)",  (uint8_t *)&v14,  0xCu);
        }

        atomic_store(0, (unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
      }
    }
  }

  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0LL;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

void sub_100006628( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

BOOL sub_10000664C(id a1)
{
  return 0;
}

void sub_100006654(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))())
  {
    id v6 = TRILogCategory_Archiving();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Deferred during AFSC directory pass.",  (uint8_t *)&v15,  2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL) = 2;
LABEL_5:
    *a3 = 1;
    goto LABEL_6;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = [*(id *)(a1 + 32) inPlaceCompressFile:v5 shouldDefer:*(void *)(a1 + 40)];
  int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  if (v8 == 2)
  {
    id v11 = TRILogCategory_Archiving();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Deferred during compression of %@",  (uint8_t *)&v15,  0xCu);
    }

    *a3 = 1;
  }

  else
  {
    if (v8 != 1)
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL)) {
        goto LABEL_6;
      }
      id v9 = TRILogCategory_Archiving();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v5;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Error: compression failed for %@",  (uint8_t *)&v15,  0xCu);
      }

      goto LABEL_5;
    }

    id v13 = TRILogCategory_Archiving();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished compressing %@", (uint8_t *)&v15, 0xCu);
    }
  }

LABEL_6:
}

uint64_t sub_100006A34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

LABEL_13:
  return v8;
}

id objc_msgSend__copyDataFromReadArchive_toWriteDiskArchive_remainingQuota_archiveIdentifier_shouldDefer_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyDataFromReadArchive:toWriteDiskArchive:remainingQuota:archiveIdentifier:shouldDefer:");
}

id objc_msgSend__withLockWitness_performExtractionIntoCurrentDirectoryFromArchive_maxUnarchivedSize_archiveIdentifier_shouldDefer_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_withLockWitness:performExtractionIntoCurrentDirectoryFromArchive:maxUnarchivedSize:archiveIdentifier:shouldDefer:");
}

id objc_msgSend_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyPatchWithFilename:toSrcDir:writingToEmptyDestDir:postPatchCompression:error:");
}

id objc_msgSend_extractArchiveFromHandle_toDestinationDirectoryURL_maxUnarchivedSize_archiveIdentifier_postExtractionCompression_shouldDefer_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "extractArchiveFromHandle:toDestinationDirectoryURL:maxUnarchivedSize:archiveIdentifier:postExtractionCompress ion:shouldDefer:");
}

id objc_msgSend_trialRootDir(void *a1, const char *a2, ...)
{
  return [a1 trialRootDir];
}