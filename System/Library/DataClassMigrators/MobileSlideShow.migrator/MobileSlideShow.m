}

LABEL_58:
            v179 = NSFileProtectionKey;
            v180 = NSFileProtectionCompleteUntilFirstUserAuthentication;
            v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v180,  &v179,  1LL));
            v160 = 0LL;
            v54 = [v48 setAttributes:v53 ofItemAtPath:v46 error:&v160];
            v55 = v160;

            if ((v54 & 1) == 0)
            {
              v56 = PLMigrationGetLog();
              v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v183 = v46;
                v184 = 2114;
                v185 = v55;
                _os_log_impl( &dword_0,  v57,  OS_LOG_TYPE_ERROR,  "Unable to assign data protection to %{public}@: %{public}@",  buf,  0x16u);
              }
            }

            v159 = 0LL;
            v58 = [v145 moveItemAtPath:v46 toPath:v47 error:&v159];
            v59 = v159;
            v60 = v59;
            if ((v58 & 1) == 0 && v59)
            {
              v61 = PLMigrationGetLog();
              v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v183 = v46;
                v184 = 2114;
                v185 = v47;
                v186 = 2114;
                v187 = v60;
                _os_log_impl( &dword_0,  v62,  OS_LOG_TYPE_ERROR,  "Failed to move %{public}@ to %{public}@ [Migration will fail.] Error: %{public}@",  buf,  0x20u);
              }
            }

            v4 = v140;
            v5 = v141;
            if ((v58 & 1) == 0)
            {

              LODWORD(v14) = 0;
              goto LABEL_85;
            }
          }

          else if ([v145 fileExistsAtPath:v46])
          {
            v162 = 0LL;
            v63 = [v145 removeItemAtPath:v46 error:&v162];
            v64 = v162;
            v52 = v64;
            if ((v63 & 1) != 0 || !v64)
            {
              v5 = v141;
            }

            else
            {
              v65 = PLMigrationGetLog();
              v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
              v5 = v141;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v183 = v46;
                v184 = 2114;
                v185 = v52;
                v67 = v66;
                v68 = "Failed to remove empty %{public}@. Error: %{public}@";
                v69 = 22;
                goto LABEL_78;
              }

LABEL_79:
            }

LABEL_80:
          }

          continue;
        }

        v40 = -[os_log_s countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v163,  v181,  16LL);
        if (!v40)
        {
          LODWORD(v14) = 1;
LABEL_85:
          v7 = v128;
          v3 = v130;
LABEL_90:

          v72 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Info.plist"]);
          v73 = v145;
          v144 = v72;
          v8 = v134;
          if ([v145 fileExistsAtPath:v72])
          {
            v74 = objc_claimAutoreleasedReturnValue( +[PLSimpleDCIMDirectory cameraRollPlistName]( &OBJC_CLASS___PLSimpleDCIMDirectory,  "cameraRollPlistName"));
            v75 = v5;
            v76 = (void *)v74;
            v77 = (void *)objc_claimAutoreleasedReturnValue([v75 stringByAppendingPathComponent:v74]);

            if (([v145 fileExistsAtPath:v77] & 1) == 0)
            {
              v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v72));
              v79 = (void *)objc_claimAutoreleasedReturnValue( +[PLSimpleDCIMDirectory migrateOldPlistToNewPlist:]( &OBJC_CLASS___PLSimpleDCIMDirectory,  "migrateOldPlistToNewPlist:",  v78));
              if (v79)
              {
                v80 = v7;
                v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v79,  100LL,  0LL,  0LL));
                [v81 writeToFile:v77 options:1073741825 error:0];
                v158 = 0LL;
                v82 = +[PLFileUtilities changeFileOwnerToMobileAtPath:error:]( &OBJC_CLASS___PLFileUtilities,  "changeFileOwnerToMobileAtPath:error:",  v77,  &v158);
                v83 = v158;
                if ((v82 & 1) == 0)
                {
                  v84 = PLMigrationGetLog();
                  v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    v183 = v77;
                    v184 = 2114;
                    v185 = v83;
                    _os_log_impl( &dword_0,  v85,  OS_LOG_TYPE_ERROR,  "Unable to change owner of file at path: %{public}@, reason: %{public}@",  buf,  0x16u);
                  }

                  v4 = v140;
                }

                v7 = v80;
                v8 = v134;
                v72 = v144;
              }
            }

            v73 = v145;
            [v145 removeItemAtPath:v72 error:0];

            v5 = v141;
          }

          if (([v73 fileExistsAtPath:v8] & 1) == 0)
          {
            v157 = 0LL;
            v86 = +[PLFileUtilities createDirectoryAtPath:error:]( &OBJC_CLASS___PLFileUtilities,  "createDirectoryAtPath:error:",  v8,  &v157);
            v87 = v157;
            if ((v86 & 1) != 0)
            {

              if ((_DWORD)v14)
              {
                v156 = 0LL;
                v88 = (void *)objc_claimAutoreleasedReturnValue([v145 subpathsOfDirectoryAtPath:v7 error:&v156]);
                v126 = v156;
                if (!v88)
                {
                  if ([v145 fileExistsAtPath:v7 isDirectory:0])
                  {
                    v118 = PLMigrationGetLog();
                    v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v183 = v7;
                      v184 = 2114;
                      v185 = v126;
                      _os_log_impl( &dword_0,  v119,  OS_LOG_TYPE_ERROR,  "Failed to enumerate old iTunes videos paths at %{public}@ [Migration will continue.] Error: %{public}@",  buf,  0x16u);
                    }
                  }

                  v89 = 0LL;
                  LOBYTE(v14) = 1;
                  goto LABEL_157;
                }

                v154 = 0u;
                v155 = 0u;
                v152 = 0u;
                v153 = 0u;
                v89 = v88;
                v139 = [v89 countByEnumeratingWithState:&v152 objects:v178 count:16];
                if (!v139)
                {
                  LOBYTE(v14) = 1;
                  goto LABEL_156;
                }

                v131 = v3;
                v138 = *(void *)v153;
                *(void *)&v90 = 138543874LL;
                v125 = v90;
                v136 = v89;
LABEL_106:
                v91 = 0LL;
                while (1)
                {
                  if (*(void *)v153 != v138) {
                    objc_enumerationMutation(v89);
                  }
                  v92 = *(void *)(*((void *)&v152 + 1) + 8LL * (void)v91);
                  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v92, v125));
                  v151 = 0;
                  else {
                    v93 = 1;
                  }
                  if (v93)
                  {
                    if (!v151) {
                      goto LABEL_131;
                    }
                  }

                  else
                  {
                    v94 = (void *)objc_claimAutoreleasedReturnValue([v14 pathExtension]);
                    v95 = [v94 isEqualToString:@"MISC"];

                    if ((v95 & 1) == 0) {
                      goto LABEL_131;
                    }
                  }

                  v96 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v92]);
                  v97 = (void *)objc_claimAutoreleasedReturnValue([v96 stringByDeletingLastPathComponent]);
                  if ([v145 fileExistsAtPath:v97])
                  {
                    v150 = 0LL;
                    v98 = [v145 removeItemAtPath:v97 error:&v150];
                    v99 = v150;
                    v100 = v99;
                    if ((v98 & 1) == 0)
                    {
                      v5 = v141;
                      v3 = v131;
                      if (v99)
                      {
                        v122 = PLMigrationGetLog();
                        v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
                        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v183 = v97;
                          v184 = 2114;
                          v185 = v100;
                          _os_log_impl( &dword_0,  v123,  OS_LOG_TYPE_ERROR,  "Failed to remove %{public}@ to replace it with the current version [Migration will fail.] Error: %{public}@",  buf,  0x16u);
                        }

                        v89 = v136;
                      }

                      goto LABEL_155;
                    }
                  }

                  v149 = 0LL;
                  v101 = +[PLFileUtilities createDirectoryAtPath:error:]( &OBJC_CLASS___PLFileUtilities,  "createDirectoryAtPath:error:",  v97,  &v149);
                  v102 = v149;
                  v103 = v102;
                  if ((v101 & 1) == 0)
                  {
                    v5 = v141;
                    v3 = v131;
                    if (v102)
                    {
                      v120 = PLMigrationGetLog();
                      v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
                      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v183 = v97;
                        v184 = 2114;
                        v185 = v103;
                        _os_log_impl( &dword_0,  v121,  OS_LOG_TYPE_ERROR,  "Failed to create %{public}@ to hold the video's metadata [Migration will fail.] Error: %{public}@",  buf,  0x16u);
                      }

                      v89 = v136;
                    }

                    v4 = v140;
LABEL_155:

                    LOBYTE(v14) = 0;
                    v72 = v144;
                    goto LABEL_156;
                  }

                  v104 = v8;
                  v105 = v7;
                  v176 = NSFileProtectionKey;
                  v177 = NSFileProtectionCompleteUntilFirstUserAuthentication;
                  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v177,  &v176,  1LL));
                  v148 = 0LL;
                  v107 = [v145 setAttributes:v106 ofItemAtPath:v14 error:&v148];
                  v108 = v148;

                  if ((v107 & 1) == 0)
                  {
                    v109 = PLMigrationGetLog();
                    v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
                    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v183 = v14;
                      v184 = 2114;
                      v185 = v108;
                      _os_log_impl( &dword_0,  v110,  OS_LOG_TYPE_ERROR,  "Unable to assign data protection to %{public}@: %{public}@",  buf,  0x16u);
                    }
                  }

                  v147 = 0LL;
                  v111 = [v145 moveItemAtPath:v14 toPath:v96 error:&v147];
                  v112 = v147;
                  v113 = v112;
                  if ((v111 & 1) == 0 && v112)
                  {
                    v114 = PLMigrationGetLog();
                    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
                    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = v125;
                      v183 = v14;
                      v184 = 2114;
                      v185 = v96;
                      v186 = 2114;
                      v187 = v113;
                      _os_log_impl( &dword_0,  v115,  OS_LOG_TYPE_ERROR,  "Failed to move %{public}@ to %{public}@ [Migration will continue.] Error: %{public}@",  buf,  0x20u);
                    }
                  }

                  v4 = v140;
                  v7 = v105;
                  v8 = v104;
                  v72 = v144;
                  v89 = v136;
LABEL_131:

                  v91 = (char *)v91 + 1;
                  v5 = v141;
                  if (v139 == v91)
                  {
                    v139 = [v89 countByEnumeratingWithState:&v152 objects:v178 count:16];
                    if (v139) {
                      goto LABEL_106;
                    }
                    LOBYTE(v14) = 1;
                    v3 = v131;
LABEL_156:

LABEL_157:
                    v117 = v126;
                    goto LABEL_158;
                  }
                }
              }
            }

            else
            {
              if (v87)
              {
                v126 = v87;
                v116 = PLMigrationGetLog();
                v89 = (id)objc_claimAutoreleasedReturnValue(v116);
                if (os_log_type_enabled((os_log_t)v89, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v183 = v8;
                  v184 = 2114;
                  v185 = v126;
                  _os_log_impl( &dword_0,  (os_log_t)v89,  OS_LOG_TYPE_ERROR,  "Failed to create %{public}@ [Migration will fail.] Error: %{public}@",  buf,  0x16u);
                }

                LOBYTE(v14) = 0;
                goto LABEL_157;
              }

              v117 = 0LL;
              LOBYTE(v14) = 0;
LABEL_158:
            }
          }

          goto LABEL_160;
        }
      }
    }

    v174 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v145 contentsOfDirectoryAtPath:v146 error:&v174]);
    v16 = v174;
    if ([v15 count])
    {
      v173 = 0LL;
      v17 = +[PLFileUtilities createDirectoryAtPath:error:]( &OBJC_CLASS___PLFileUtilities,  "createDirectoryAtPath:error:",  v5,  &v173);
      v18 = v173;
      if ((v17 & 1) == 0)
      {
        v19 = PLMigrationGetLog();
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v183 = v5;
          v184 = 2114;
          v185 = v18;
          _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "Failed to create directory %{public}@ Error: %{public}@",  buf,  0x16u);
        }
      }

      v135 = (os_log_s *)v18;
      v137 = v16;
      v127 = v7;
      v129 = v3;
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      v21 = v15;
      v22 = [v21 countByEnumeratingWithState:&v169 objects:v188 count:16];
      if (v22)
      {
        v23 = v22;
        v24 = *(void *)v170;
        do
        {
          v25 = 0LL;
          do
          {
            if (*(void *)v170 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v169 + 1) + 8LL * (void)v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v146 stringByAppendingPathComponent:v26]);
            v28 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v26]);
            if ([v21 count] == (char *)&dword_0 + 1
              && [v26 isEqualToString:@"Info.plist"]
              && ([v145 fileExistsAtPath:v28] & 1) != 0
              || ([v26 isEqualToString:@"Incoming"] & 1) != 0
              || ([v26 isEqualToString:@"Timelapse"] & 1) != 0
              || ([v26 isEqualToString:@"LastTimelapse"] & 1) != 0
              || ([v26 isEqualToString:@"Iris"] & 1) != 0
              || ([v26 isEqualToString:@"nebuladkeepalive"] & 1) != 0)
            {
              v29 = 0LL;
            }

            else
            {
              v168 = 0LL;
              v30 = [v145 moveItemAtPath:v27 toPath:v28 error:&v168];
              v31 = v168;
              v29 = v31;
              if ((v30 & 1) == 0 && v31)
              {
                v32 = PLMigrationGetLog();
                v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v183 = v27;
                  v184 = 2114;
                  v185 = v28;
                  v186 = 2114;
                  v187 = v29;
                  _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_ERROR,  "Failed to move %{public}@ to %{public}@ [Migration will continue.] Error: %{public}@",  buf,  0x20u);
                }
              }

              v5 = v141;
            }

            v25 = (char *)v25 + 1;
          }

          while (v23 != v25);
          v34 = [v21 countByEnumeratingWithState:&v169 objects:v188 count:16];
          v23 = v34;
        }

        while (v34);
      }

      v7 = v127;
      v3 = v129;
      v13 = v145;
      v16 = v137;
      v35 = v135;
    }

    else
    {
      if (!v16) {
        goto LABEL_41;
      }
      v71 = PLMigrationGetLog();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v183 = v146;
        v184 = 2114;
        v185 = v5;
        v186 = 2114;
        v187 = v16;
        _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_ERROR,  "Failed to enumerate %{public}@. Its files won't be moved to %{public}@. Error %{public}@",  buf,  0x20u);
      }
    }

LABEL_41:
    goto LABEL_42;
  }

  LOBYTE(v14) = 1;
LABEL_160:

  return (char)v14;
}

id objc_msgSend_createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager:error:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}