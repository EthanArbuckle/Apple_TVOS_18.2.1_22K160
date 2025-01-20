void sub_100005C5C(uint64_t a1)
{
  NSUserDefaults *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.osanalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"SymbolicateCrashes"));
  v4 = v3;
  if (v3) {
    v5 = [v3 intValue];
  }
  else {
    v5 = 1;
  }
  dword_10003EE88 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"ExcDiagToolTimeout"));

  v7 = [v6 intValue];
  if (v7 >= 1) {
    v8 = v7;
  }
  else {
    v8 = 20;
  }
  dword_10003EE8C = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"ExcDiagToolExtras"));

  v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v26 = v9;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 16000);
    *(void *)(v12 + 16000) = v11;
  }

  else
  {
    v14 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v14) & 1) != 0) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16000LL), v9);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getTaskingKey:@"disableDiagInfo"]);

  byte_10003EE90 = [v16 BOOLValue];
  if ((byte_10003EE90 & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 getTaskingKey:@"enableMemoryGraph"]);

    byte_10003EE91 = [v18 BOOLValue];
    if (v18) {
      [v18 BOOLValue];
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 getTaskingKey:@"enableReportMemoryException"]);

    if (v20) {
      v21 = [v20 BOOLValue];
    }
    else {
      v21 = 1;
    }
    byte_10003EE92 = v21;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 getTaskingKey:@"saveExtHangLogs"]);
  byte_10003EE93 = [v23 BOOLValue];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 getTaskingKey:@"disableLogQuery"]);
  byte_10003EE94 = [v25 BOOLValue];
}
}

LABEL_34:
        v25 = v19;
        v24 = (unint64_t)v20;
      }
    }

    if (v26 - v19 < v22) {
      goto LABEL_40;
    }
    if (-[OSACrashReport _regionInfoAtAddress:regionInfo:regionAddress:regionSize:]( self,  "_regionInfoAtAddress:regionInfo:regionAddress:regionSize:",  v26,  &v48,  &v43,  &v42))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100021400();
      }
      goto LABEL_39;
    }

    if (v43 <= v26)
    {
      if ((v48 & 4) != 0)
      {
LABEL_40:
        v27 = mach_vm_read(self->_task, v25, v23, &data, &dataCnt);
        if (v27)
        {
          v28 = v27;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v47 = v28;
            *(_WORD *)&v47[4] = 2048;
            *(void *)&v47[6] = v23;
            *(_WORD *)&v47[14] = 2048;
            *(void *)&v47[16] = v25;
            v9 = "Error %d reading 0x%zx bytes at 0x%llx from remote task";
            v10 = buf;
            v21 = 28;
            goto LABEL_23;
          }
        }

        else
        {
          if (v24 <= dataCnt)
          {
            v38 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, v24));
            pc_bytes_before = self->_pc_bytes_before;
            self->_pc_bytes_before = v38;

            v40 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  data + v24,  dataCnt - v24));
            pc_bytes = self->_pc_bytes;
            self->_pc_bytes = v40;
          }

          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100021384((uint64_t)&dataCnt, v24, v29, v30, v31, v32, v33, v34);
          }

          mach_vm_deallocate(mach_task_self_, data, dataCnt);
        }

        return;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v47 = v43;
        *(_WORD *)&v47[8] = 2048;
        *(void *)&v47[10] = v26;
        v37 = "region 0x%llx after crashing pc 0x%llx was not executable";
        goto LABEL_61;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v47 = v43;
      *(_WORD *)&v47[8] = 2048;
      *(void *)&v47[10] = v26;
      v37 = "VM region 0x%llx after crashing pc 0x%llx was unmapped";
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);
    }

LABEL_39:
    v23 = v22 + v19 - v25;
    goto LABEL_40;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v48 = 134217984;
    v49 = v7;
    v9 = "Invalid crashing program counter 0x%llx could not be dumped";
    v10 = (uint8_t *)&v48;
LABEL_22:
    v21 = 12;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, v10, v21);
  }

LABEL_99:
  -[OSACrashReport stashStatus:note:](self, "stashStatus:note:", @"Capture Complete", 0LL);
}

void sub_100007D84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100007DB0(id a1, NSMutableDictionary *a2)
{
  v3 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"path"));
  if (v2) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v2, @"path");
  }
}

void sub_100007E0C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.osanalytics.diagnosticInfo", 0LL);
  v2 = (void *)qword_10003EEA0;
  qword_10003EEA0 = (uint64_t)v1;
}

void sub_100007E38(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)]);
  if (v8 && ([*(id *)(a1 + 48) timeIntervalSinceDate:v8], v2 < 3600.0))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    unsigned int v4 = [v3 appleInternal];

    if (v4)
    {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
      uint64_t v6 = *(void *)(a1 + 56);
      v7 = *(void **)(v6 + 15896);
      *(void *)(v6 + 15896) = v5;

      objc_msgSend( *(id *)(*(void *)(a1 + 56) + 15896),  "setObject:forKeyedSubscript:",  @"To mitigate the CPU impact of repeated ExcResource events for this process, vmmap and heap were excluded. Please check an older report within the hour for those diagnostics.",  @"Important Note");
    }
  }

  else
  {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  }
}

uint64_t sub_100008164(uint64_t a1)
{
  int v1 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 0xFFFFFFF0) == 0x20) {
    int v1 = 17;
  }
  if (v1 <= 2309)
  {
    if (v1 == 17 || v1 == 19) {
      return *(unsigned int *)(a1 + 4);
    }
LABEL_18:
    unsigned int v4 = *(_DWORD *)(a1 + 4);
    goto LABEL_19;
  }

  if (v1 != 2310)
  {
    if (v1 == 2312)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 4);
      if (v4 == 32)
      {
        if ((*(_BYTE *)(a1 + 8) & 0x8F) == 0) {
          return 24LL;
        }
        unsigned int v4 = 32;
      }

      goto LABEL_19;
    }

    goto LABEL_18;
  }

  unsigned int v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 112)
  {
    if ((*(_BYTE *)(a1 + 8) & 0x8F) == 0) {
      return 104LL;
    }
    unsigned int v4 = 112;
  }

LABEL_19:
  BOOL v5 = v4 >= (*(_DWORD *)(a1 + 8) & 0xFu);
  unsigned int v6 = v4 - (*(_DWORD *)(a1 + 8) & 0xF);
  if (v5) {
    return v6;
  }
  else {
    return 0LL;
  }
}

  *(NDR_record_t *)(a2 + 24) = v13;
  return result;
}

LABEL_298:
          v11 = v64;
          goto LABEL_299;
        }

        if (v13 == 4097 && -[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 20LL))
        {
          v62 = *v7;
          if ((*v7 & 0xFFFFFFF0) == 0x20) {
            v62 = 17;
          }
          if (v62 <= 2309)
          {
            if (v62 == 17 || v62 == 19)
            {
              v63 = v7[1];
              goto LABEL_330;
            }

LABEL_327:
            v130 = v7[1];
            goto LABEL_328;
          }

          if (v62 == 2310)
          {
            v130 = v7[1];
            if (v130 != 112) {
              goto LABEL_328;
            }
            if ((v7[2] & 0x8F) != 0)
            {
              v130 = 112;
              goto LABEL_328;
            }

            v63 = 104;
          }

          else
          {
            if (v62 != 2312) {
              goto LABEL_327;
            }
            v130 = v7[1];
            if (v130 != 32)
            {
LABEL_328:
              v31 = v130 >= (v7[2] & 0xF);
              v63 = v130 - (v7[2] & 0xF);
              if (!v31) {
                v63 = 0;
              }
              goto LABEL_330;
            }

            if ((v7[2] & 0x8F) != 0)
            {
              v130 = 32;
              goto LABEL_328;
            }

            v63 = 24;
          }

LABEL_330:
          self->_exit_snapshot_length = v63;
          v137 = v63;
          v138 = (exit_reason_snapshot *)malloc(v63);
          self->_exit_snapshot = v138;
          if (v138) {
            memcpy(v138, v7 + 4, v137);
          }
        }
      }

      else
      {
        switch(v13)
        {
          case 2561:
LABEL_124:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL))
            {
              v64 = v11;
              self->_proc_id = v7[4];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                proc_id = self->_proc_id;
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = proc_id;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Parsing corpse data for pid %d",  buf,  8u);
              }

              v66 = sub_100009B9C();
              v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
              if (os_signpost_enabled(v67))
              {
                v68 = self->_proc_id;
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v68;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v67,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CorpseReceived",  "pid %d enableTelemetry=YES ",  buf,  8u);
              }

              goto LABEL_297;
            }

            break;
          case 2562:
LABEL_129:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL))
            {
              v41 = v7[4];
              v42 = 15792LL;
              goto LABEL_255;
            }

            break;
          case 2563:
LABEL_133:
            if (self->_procName) {
              break;
            }
            v163[0] = 0LL;
            v163[1] = 0LL;
            v164 = 0;
            v72 = *v7;
            if ((*v7 & 0xFFFFFFF0) == 0x20) {
              v72 = 17;
            }
            if (v72 <= 2309)
            {
              if (v72 == 17 || v72 == 19)
              {
                v73 = v7[1];
                goto LABEL_318;
              }

LABEL_315:
              v126 = v7[1];
              goto LABEL_316;
            }

            if (v72 == 2310)
            {
              v126 = v7[1];
              if (v126 == 112)
              {
                if ((v7[2] & 0x8F) == 0)
                {
                  v73 = 104;
                  goto LABEL_318;
                }

                v126 = 112;
              }
            }

            else
            {
              if (v72 != 2312) {
                goto LABEL_315;
              }
              v126 = v7[1];
              if (v126 == 32)
              {
                if ((v7[2] & 0x8F) == 0)
                {
                  v73 = 24;
                  goto LABEL_318;
                }

                v126 = 32;
              }
            }

LABEL_316:
            v31 = v126 >= (v7[2] & 0xF);
            v73 = v126 - (v7[2] & 0xF);
            if (!v31) {
              v73 = 0;
            }
LABEL_318:
            if (v73 >= 0x10) {
              v131 = 16LL;
            }
            else {
              v131 = v73;
            }
            __memcpy_chk(v163, v7 + 4, v131, 17LL);
            v132 = sub_100009B9C();
            v133 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);
            if (os_signpost_enabled(v133))
            {
              v134 = self->_proc_id;
              *(_DWORD *)buf = 136446466;
              *(void *)&buf[4] = v163;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v134;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v133,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "CorpseReceived",  "process: %{public}s [pid %d] enableTelemetry=YES ",  buf,  0x12u);
            }

            v135 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v163));
            procName = self->_procName;
            self->_procName = v135;

            -[OSACrashReport stashStatus:note:](self, "stashStatus:note:", @"Parsing KCData", 0LL);
            break;
          case 2564:
LABEL_148:
            if (v13 == 2312)
            {
              if ((_DWORD)v12 == 32)
              {
                v79 = *((void *)v7 + 1);
                if ((v79 & 0x8F) != 0) {
                  goto LABEL_217;
                }
                goto LABEL_292;
              }
            }

            else if (v13 == 2310 && (_DWORD)v12 == 112)
            {
              v79 = *((void *)v7 + 1);
              if ((v79 & 0x8F) == 0) {
                goto LABEL_222;
              }
LABEL_217:
              v79 = *((void *)v7 + 1);
LABEL_219:
              if (v13 != 2312)
              {
                if (v13 == 2310 && (_DWORD)v12 == 112)
                {
LABEL_222:
                  if ((v79 & 0x8F) == 0)
                  {
                    v64 = v11;
                    v106 = 104;
                    goto LABEL_295;
                  }
                }

LABEL_293:
                v64 = v11;
                v106 = v12 - (v79 & 0xF);
LABEL_295:
                *((_BYTE *)v7 + (v106 - 1) + 16) = 0;
                v127 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
                procPath = self->_procPath;
                self->_procPath = v127;

                v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_procPath, "lastPathComponent"));
                if (-[os_log_s length](v67, "length")) {
                  objc_storeStrong((id *)&self->_procName, v67);
                }
LABEL_297:

                goto LABEL_298;
              }

              if ((_DWORD)v12 != 32) {
                goto LABEL_293;
              }
LABEL_292:
              if ((v79 & 0x8F) == 0)
              {
                v64 = v11;
                v106 = 24;
                goto LABEL_295;
              }

              goto LABEL_293;
            }

            v79 = *((void *)v7 + 1);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "proc path string is NULL or malformed",  buf,  2u);
            }

            break;
          case 2565:
LABEL_153:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
              break;
            }
            v41 = v7[4];
            v42 = 15796LL;
            goto LABEL_255;
          case 2566:
          case 2572:
          case 2573:
          case 2574:
          case 2575:
          case 2576:
          case 2577:
          case 2578:
          case 2579:
          case 2580:
          case 2581:
          case 2582:
          case 2583:
          case 2584:
          case 2585:
          case 2586:
          case 2587:
          case 2588:
          case 2589:
          case 2590:
          case 2591:
          case 2596:
          case 2597:
          case 2598:
          case 2599:
            break;
          case 2567:
LABEL_155:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL))
            {
              v80 = 100LL;
              v81 = (*((unsigned __int8 *)v7 + 16) >> 2) & 1;
LABEL_236:
              self->OSAReport_opaque[v80] = v81;
            }

            break;
          case 2568:
LABEL_159:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
              break;
            }
            v41 = v7[4];
            v42 = 96LL;
            goto LABEL_255;
          case 2569:
LABEL_140:
            v74 = *((void *)v7 + 1);
            v75 = v74 & 0xF;
            v31 = v12 >= v75;
            v76 = v12 - v75;
            if (!v31) {
              v76 = 0;
            }
            self->_exceptionCodeCount = v76 >> 3;
            v77 = *v7;
            if ((*v7 & 0xFFFFFFF0) == 0x20) {
              v77 = 17;
            }
            if (v77 <= 2309)
            {
              if (v77 == 17 || v77 == 19)
              {
                v78 = v7[1];
                goto LABEL_263;
              }

LABEL_260:
              v101 = v7[1];
              goto LABEL_261;
            }

            if (v77 == 2310)
            {
              v101 = v7[1];
              if (v101 == 112)
              {
                if ((v74 & 0x8F) == 0)
                {
                  v78 = 104;
                  goto LABEL_263;
                }

                v101 = 112;
              }
            }

            else
            {
              if (v77 != 2312) {
                goto LABEL_260;
              }
              v101 = v7[1];
              if (v101 == 32)
              {
                if ((v74 & 0x8F) == 0)
                {
                  v78 = 24;
                  goto LABEL_263;
                }

                v101 = 32;
              }
            }

LABEL_261:
            v31 = v101 >= v75;
            v78 = v101 - v75;
            if (!v31) {
              v78 = 0;
            }
LABEL_263:
            if (v78 <= 0x10) {
              v119 = 16LL;
            }
            else {
              v119 = v78;
            }
            v120 = (int64_t *)calloc(1uLL, v119);
            self->_exceptionCode = v120;
            v121 = *v7;
            if ((*v7 & 0xFFFFFFF0) == 0x20) {
              v121 = 17;
            }
            if (v121 <= 2309)
            {
              if (v121 == 17 || v121 == 19)
              {
                v122 = v7[1];
                goto LABEL_283;
              }

LABEL_280:
              v123 = v7[1];
              v124 = *((void *)v7 + 1);
              goto LABEL_281;
            }

            if (v121 == 2310)
            {
              v123 = v7[1];
              v124 = *((void *)v7 + 1);
              if (v123 == 112)
              {
                if ((v124 & 0x8F) == 0)
                {
                  v122 = 104;
                  goto LABEL_283;
                }

                v123 = 112;
              }
            }

            else
            {
              if (v121 != 2312) {
                goto LABEL_280;
              }
              v123 = v7[1];
              v124 = *((void *)v7 + 1);
              if (v123 == 32)
              {
                if ((v124 & 0x8F) == 0)
                {
                  v122 = 24;
                  goto LABEL_283;
                }

                v123 = 32;
              }
            }

LABEL_281:
            v125 = v124 & 0xF;
            v31 = v123 >= v125;
            v122 = v123 - v125;
            if (!v31) {
              v122 = 0;
            }
LABEL_283:
            memcpy(v120, v7 + 4, v122);
            break;
          case 2570:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
              break;
            }
            v41 = v7[4];
            v42 = 16360LL;
            goto LABEL_255;
          case 2571:
LABEL_131:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 96LL))
            {
              v69 = *((_OWORD *)v7 + 4);
              *(_OWORD *)&buf[32] = *((_OWORD *)v7 + 3);
              *(_OWORD *)&buf[48] = v69;
              v70 = *((_OWORD *)v7 + 6);
              *(_OWORD *)&buf[64] = *((_OWORD *)v7 + 5);
              *(_OWORD *)&buf[80] = v70;
              v71 = *((_OWORD *)v7 + 2);
              *(_OWORD *)buf = *((_OWORD *)v7 + 1);
              *(_OWORD *)&buf[16] = v71;
              uuid_unparse_lower(buf, self->_slice_uuid);
              *(_OWORD *)&self->_proc_start_abstime = *(_OWORD *)&buf[80];
            }

            break;
          case 2592:
LABEL_157:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8LL))
            {
              v82 = *((void *)v7 + 2);
              self->_threadId = v82;
              threadPortPedigree = self->_threadPortPedigree;
              v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"override via KCDATA ID(0x%llX)",  v82));
              -[NSMutableArray addObject:](threadPortPedigree, "addObject:", v84);
            }

            break;
          case 2593:
            v87 = v7[2] & 0xF;
            v88 = v12 >= v87;
            v89 = v12 - v87;
            if (v89 == 0 || !v88) {
              break;
            }
            if (!v88) {
              v89 = 0;
            }
            *((_BYTE *)v7 + (v89 - 1) + 16) = 0;
            if (!*((_BYTE *)v7 + 16)) {
              break;
            }
            v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
            v91 = OSASanitizePath(v90, 0LL);
            v92 = objc_claimAutoreleasedReturnValue(v91);

            goto LABEL_214;
          case 2594:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8LL)) {
              break;
            }
            v64 = v11;
            v93 = *((void *)v7 + 2);
            v94 = HIDWORD(v93);
            if (HIDWORD(v93) < 0x511)
            {
              *(void *)&self->_threadStateFlavor = v93;
              goto LABEL_298;
            }

            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              goto LABEL_298;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = v94;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = 5184LL;
            v95 = "Unexpected count for TASK_BTINFO_THREAD_STATE %u > %lu";
            goto LABEL_187;
          case 2595:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8LL)) {
              break;
            }
            v64 = v11;
            v96 = v7[5];
            if (v96 < 0x511)
            {
              self->_exceptionStateCount = v96;
            }

            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v96;
              *(_WORD *)&buf[8] = 2048;
              *(void *)&buf[10] = 5184LL;
              v95 = "Unexpected count for TASK_BTINFO_THREAD_EXCEPTION_STATE %u > %lu";
LABEL_187:
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  v95,  buf,  0x12u);
            }

            goto LABEL_298;
          case 2600:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
              break;
            }
            v41 = v7[4];
            v42 = 16148LL;
            goto LABEL_255;
          case 2601:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 24LL)) {
              break;
            }
            v97 = v7[9];
            *(void *)&v165[0] = v7[4];
            *((void *)&v165[1] + 1) = v97;
            v98 = *(_OWORD *)(v7 + 5);
            goto LABEL_194;
          case 2602:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 32LL)) {
              break;
            }
            v99 = *((void *)v7 + 5);
            *(void *)&v165[0] = *((void *)v7 + 2);
            *((void *)&v165[1] + 1) = v99;
            v98 = *(_OWORD *)(v7 + 6);
LABEL_194:
            *(_OWORD *)((char *)v165 + 8) = v98;
            break;
          default:
            if (v13 != 2389) {
              break;
            }
            v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v7 + 2)));
            v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *((void *)v7 + 3)));
            -[OSAExclaveContainer setThreadId:withScId:](self->_exclaveContainer, "setThreadId:withScId:", v85, v58);

            goto LABEL_163;
        }
      }
    }

    else
    {
      if (v13 > 2049)
      {
        switch(v13)
        {
          case 2050:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 56LL)) {
              self->_uniqId = *((void *)v7 + 4);
            }
            goto LABEL_299;
          case 2051:
          case 2052:
          case 2055:
          case 2058:
          case 2060:
          case 2061:
          case 2065:
          case 2067:
          case 2068:
          case 2070:
          case 2073:
            goto LABEL_299;
          case 2053:
            goto LABEL_124;
          case 2054:
            goto LABEL_129;
          case 2056:
            goto LABEL_131;
          case 2057:
            goto LABEL_133;
          case 2059:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 16LL)) {
              self->_proc_starttime = (timeval)*((_OWORD *)v7 + 1);
            }
            goto LABEL_299;
          case 2062:
            goto LABEL_140;
          case 2063:
            goto LABEL_148;
          case 2064:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
              goto LABEL_299;
            }
            v41 = v7[4];
            v42 = 160LL;
            break;
          case 2066:
            goto LABEL_153;
          case 2069:
            goto LABEL_155;
          case 2071:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 16LL))
            {
              *(_OWORD *)buf = *((_OWORD *)v7 + 1);
              -[OSACrashReport _extractWorkQueueLimitsFromData:](self, "_extractWorkQueueLimitsFromData:", buf);
            }

            goto LABEL_299;
          case 2072:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL))
            {
              self->_responsible_pid = v7[4];
              v107 = (NSString *)objc_claimAutoreleasedReturnValue(-[OSACrashReport nameFromPid:](self, "nameFromPid:"));
              responsibleProc = self->_responsibleProc;
              self->_responsibleProc = v107;
            }

            goto LABEL_299;
          case 2074:
            goto LABEL_157;
          default:
            switch(v13)
            {
              case 2102:
                if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 640LL))
                {
                  memcpy(buf, v7 + 4, 0x280uLL);
                  v48 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v47);
                  if (buf[0])
                  {
                    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  buf));
                    [v48 addObject:v49];
                  }

                  if (buf[128])
                  {
                    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &buf[128]));
                    [v48 addObject:v50];
                  }

                  if (buf[256])
                  {
                    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &buf[256]));
                    [v48 addObject:v51];
                  }

                  if (buf[384])
                  {
                    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &buf[384]));
                    [v48 addObject:v52];
                  }

                  if (buf[512])
                  {
                    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &buf[512]));
                    [v48 addObject:v53];
                  }

                  v54 = (NSString *)objc_claimAutoreleasedReturnValue([v48 componentsJoinedByString:&stru_100031928]);
                  ktriage_info = self->_ktriage_info;
                  self->_ktriage_info = v54;
                }

                goto LABEL_299;
              case 2103:
                if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4LL)) {
                  goto LABEL_299;
                }
                LOBYTE(v81) = v7[4] != 0;
                v80 = 16353LL;
                goto LABEL_236;
              case 2105:
                v41 = v7[4];
                v42 = 16364LL;
                goto LABEL_255;
              case 2106:
                v41 = v7[4];
                v42 = 16368LL;
                if (v41 == 0x7FFFFFFF) {
                  v41 = 0;
                }
                goto LABEL_255;
              case 2107:
                v109 = v7[2] & 0xF;
                v31 = v12 >= v109;
                v110 = v12 - v109;
                if (v31) {
                  v111 = v110;
                }
                else {
                  v111 = 0LL;
                }
                v112 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7 + 4));
                v113 = 16288LL;
                goto LABEL_251;
              case 2108:
                v114 = v7[2] & 0xF;
                v31 = v12 >= v114;
                v115 = v12 - v114;
                if (v31) {
                  v116 = v115;
                }
                else {
                  v116 = 0LL;
                }
                v112 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7 + 4));
                v113 = 16296LL;
LABEL_251:
                v117 = *(void **)&self->OSAReport_opaque[v113];
                *(void *)&self->OSAReport_opaque[v113] = v112;

                break;
              case 2109:
                v41 = v7[4];
                v42 = 16304LL;
                goto LABEL_255;
              case 2110:
                v41 = v7[4];
                v42 = 16308LL;
                goto LABEL_255;
              case 2111:
                goto LABEL_159;
              case 2112:
                v118 = *((void *)v7 + 3);
                self->_jit_start_address = *((void *)v7 + 2);
                self->_jit_end_address = v118;
                goto LABEL_299;
              default:
                goto LABEL_299;
            }

            goto LABEL_299;
        }

LABEL_255:
        *(_DWORD *)&self->OSAReport_opaque[v42] = v41;
        goto LABEL_299;
      }

      switch(v13)
      {
        case 17:
          v43 = *((void *)v7 + 1);
          if (SHIDWORD(v43) > 2074)
          {
            if (HIDWORD(v43) == 2572 || HIDWORD(v43) == 2075)
            {
              if ((_DWORD)v43)
              {
                if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8LL))
                {
                  v56 = *((void *)v7 + 2);
                  self->_coalition_id = v56;
                  if (v56)
                  {
                    v57 = (void *)xpc_coalition_copy_info();
                    v58 = v57;
                    if (v57)
                    {
                      if (xpc_get_type(v57) == (xpc_type_t)&_xpc_type_dictionary)
                      {
                        string = xpc_dictionary_get_string(v58, key);
                        if (string || (string = xpc_dictionary_get_string(v58, v157)) != 0LL)
                        {
                          v60 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  string));
                          coalition_name = self->_coalition_name;
                          self->_coalition_name = v60;
                        }
                      }
                    }

LABEL_163:
                  }
                }
              }

              break;
            }

LABEL_168:
            if ((HIDWORD(v43) & 0xFFFFFFFE) == 0xA24)
            {
              if (v43 <= sub_100008164((uint64_t)v7) >> 3)
              {
                v10 = (uint64_t *)(v7 + 4);
                v161 = v43;
              }

              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  v139 = sub_100008164((uint64_t)v7);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v43;
                  *(_WORD *)&buf[8] = 2048;
                  *(void *)&buf[10] = v139 >> 3;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected count for TASK_BTINFO_BACKTRACE %u > %lu",  buf,  0x12u);
                }

                v161 = 0;
              }
            }

            break;
          }

          if (HIDWORD(v43) == 48)
          {
            if (v12 / 0x14 < v43)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                break;
              }
              v86 = sub_100008164((uint64_t)v7);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v43;
              *(_WORD *)&buf[8] = 2048;
              *(void *)&buf[10] = v86 / 0x14uLL;
              v45 = "Unexpected count for TASK_BTINFO_DYLD_LOADINFO %u > %lu";
              goto LABEL_167;
            }

            if ((_DWORD)v43)
            {
              v92 = (uint64_t)v11;
              v104 = 0LL;
              v105 = 20LL * *((void *)v7 + 1);
              do
              {
                -[NSMutableArray addImage:address:size:]( self->_taskImages,  "addImage:address:size:",  &v7[v104 / 4 + 5],  v7[v104 / 4 + 4],  0LL);
                v104 += 20LL;
              }

              while (v105 != v104);
              goto LABEL_214;
            }
          }

          else
          {
            if (HIDWORD(v43) != 49) {
              goto LABEL_168;
            }
            if (v12 / 0x18 < v43)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                break;
              }
              v44 = sub_100008164((uint64_t)v7);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v43;
              *(_WORD *)&buf[8] = 2048;
              *(void *)&buf[10] = v44 / 0x18uLL;
              v45 = "Unexpected count for TASK_BTINFO_DYLD_LOADINFO64 %u > %lu";
LABEL_167:
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  v45,  buf,  0x12u);
              break;
            }

            if ((_DWORD)v43)
            {
              v92 = (uint64_t)v11;
              v102 = 0LL;
              v103 = 24LL * *((void *)v7 + 1);
              do
              {
                -[NSMutableArray addImage:address:size:]( self->_taskImages,  "addImage:address:size:",  &v7[v102 / 4 + 6],  *(void *)&v7[v102 / 4 + 4],  0LL);
                v102 += 24LL;
              }

              while (v103 != v102);
LABEL_214:
              v11 = (void *)v92;
            }
          }

          break;
        case 19:
          if (v7[4] == 2377)
          {
            v7 = (unsigned int *)-[OSAExclaveContainer parseKCdata:](self->_exclaveContainer, "parseKCdata:", v7, v5);
            BOOL v5 = v46;
          }

          break;
        case 56:
          v14 = v7 + 4;
          v15 = v7[2] & 0xF;
          v31 = v12 >= v15;
          LODWORD(v16) = v12 - v15;
          v16 = v31 ? v16 : 0LL;
          v17 = (unint64_t)v14 + v16;
          v18 = v7 + 8;
          if (v7 + 8 <= (_DWORD *)((char *)v14 + v16))
          {
            v159 = v11;
            v160 = v10;
            while (1)
            {
              v19 = v14[1];
              if ((unint64_t)v18 + v19 > v17)
              {
LABEL_76:
                v11 = v159;
                goto LABEL_299;
              }

              v20 = *v14;
              if (*v14 == -242132755)
              {
                v11 = v159;
                goto LABEL_299;
              }

              if ((v20 & 0xFFFFFFF0) == 0x20) {
                v20 = 17;
              }
              if (v20 > 4097) {
                break;
              }
              if (v20 == 54)
              {
                if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v14, v17, 4LL)) {
                  self->_terminator_pid = v14[4];
                }
                goto LABEL_75;
              }

              if (v20 != 55)
              {
LABEL_53:
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  if ((*v14 & 0xFFFFFFF0) == 0x20) {
                    v28 = 17;
                  }
                  else {
                    v28 = *v14;
                  }
                  v29 = sub_100008164((uint64_t)v14);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v28;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v29;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "unknown nested kcdata type: 0x%x, size: %d",  buf,  0xEu);
                }

                goto LABEL_75;
              }

              v25 = v14[2] & 0xF;
              else {
                v26 = 0LL;
              }
              if (strnlen((const char *)v14 + 16, v26) < v26 && v19 > v25)
              {
                *((_BYTE *)v14 + (v26 - 1) + 16) = 0;
                v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14 + 4));
                v39 = 15960LL;
LABEL_74:
                v40 = *(void **)&self->OSAReport_opaque[v39];
                *(void *)&self->OSAReport_opaque[v39] = v38;

                v10 = v160;
                goto LABEL_75;
              }

              v10 = v160;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v24 = "terminator proc string is NULL or malformed";
LABEL_51:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
              }

LABEL_75:
              v14 = (_DWORD *)((char *)v18 + v14[1]);
              v18 = v14 + 4;
            }

            switch(v20)
            {
              case 4098:
                v21 = v14[2] & 0xF;
                else {
                  v22 = 0LL;
                }
                if (strnlen((const char *)v14 + 16, v22) < v22 && v19 > v21)
                {
                  *((_BYTE *)v14 + (v22 - 1) + 16) = 0;
                  v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14 + 4));
                  v39 = 15952LL;
                  goto LABEL_74;
                }

                v10 = v160;
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_75;
                }
                *(_WORD *)buf = 0;
                v24 = "exit reason string is NULL or malformed";
                break;
              case 4099:
                v30 = v14[2] & 0xF;
                v31 = v19 >= v30;
                v32 = v19 - v30;
                if (v31) {
                  v33 = v32;
                }
                else {
                  v33 = 0LL;
                }
                self->_exit_payload_length = v33;
                if (v32 != 0 && v31)
                {
                  v34 = malloc((v33 + 1));
                  self->_exit_payload = v34;
                  if (v34)
                  {
                    v35 = v34;
                    memcpy(v34, v14 + 4, v33);
                    v35[v33] = 0;
                  }
                }

                goto LABEL_75;
              case 4100:
                goto LABEL_53;
              case 4101:
                if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v14, v17, 8LL)) {
                  goto LABEL_75;
                }
                v36 = *((void *)v14 + 2);
                v37 = 16048LL;
                goto LABEL_69;
              case 4102:
                if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v14, v17, 8LL)) {
                  goto LABEL_75;
                }
                v36 = *((void *)v14 + 2);
                v37 = 15880LL;
LABEL_69:
                *(void *)&self->OSAReport_opaque[v37] = v36;
                goto LABEL_75;
              default:
                if (v20 != 1403128064) {
                  goto LABEL_53;
                }
                goto LABEL_75;
            }

            goto LABEL_51;
          }

          break;
      }
    }

LABEL_299:
    v129 = (char *)v7 + v7[1];
    v7 = (unsigned int *)(v129 + 16);
    unsigned int v6 = (unint64_t)(v129 + 32);
  }

  while (v6 <= v5);
  if (self->_is_lightweight_corpse && (int)v161 >= 1)
  {
    v141 = objc_alloc_init(&OBJC_CLASS___OSABinaryImageCatalog);
    if (!uuid_is_null((const unsigned __int8 *)v165 + 8)) {
      [v141 targetSharedCache:(char *)v165 + 8 withSlide:*(void *)&v165[0] atBaseAddress:*((void *)&v165[1] + 1)];
    }
    -[NSMutableArray sortByAddressAndSetInferredSizes](self->_taskImages, "sortByAddressAndSetInferredSizes");
    v142 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
    threadInfos = self->_threadInfos;
    self->_threadInfos = v142;

    v144 = v161;
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v161));
    do
    {
      v148 = *v10++;
      v147 = v148;
      if (v148)
      {
        v149 = (void *)objc_claimAutoreleasedReturnValue([v141 searchFrame:v147 in:self->_taskImages regions:0 result:0]);
        v150 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport composeFrame:info:](self, "composeFrame:info:", v149, 0LL));
        [v146 addObject:v150];
      }

      --v144;
    }

    while (v144);
    self->_crashedThreadNumber = 0;
    v151 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v145);
    [v151 setObject:v146 forKeyedSubscript:@"frames"];
    v152 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_threadId));
    [v151 setObject:v152 forKeyedSubscript:@"id"];

    [v151 setObject:v11 forKeyedSubscript:@"name"];
    -[NSMutableArray addObject:](self->_threadInfos, "addObject:", v151);
    v153 = (NSArray *)objc_claimAutoreleasedReturnValue([v141 reportUsedImagesFullInfoUsingBlock:0]);
    usedImages = self->_usedImages;
    self->_usedImages = v153;

    v155 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[OSACrashReport decode_crashingThreadStateWithSymbolicator:usingCatalog:]( self,  "decode_crashingThreadStateWithSymbolicator:usingCatalog:",  0LL,  0LL,  v141));
    threadStateDecoded = self->_threadStateDecoded;
    self->_threadStateDecoded = v155;
  }

LABEL_342:
}

id sub_100009B9C()
{
  if (qword_10003EF58 != -1) {
    dispatch_once(&qword_10003EF58, &stru_100031140);
  }
  return (id)qword_10003EF50;
}

void sub_10000A624(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v7 = (void *)a1[4];
  id v8 = (void *)a1[5];
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 composeFrame:a2 info:a3]);
  [v7 addObject:v10];

  v11 = (void *)a1[5];
  id v12 = (id)objc_claimAutoreleasedReturnValue([v9 symbolInfo]);

  [v11 updateLogWritingSignatureWithSymbol:v12 address:a1[6]];
}

void *sub_10000AB34(vm_map_t a1, vm_address_t a2, vm_size_t a3)
{
  kern_return_t v6;
  kern_return_t v7;
  void *v8;
  void *v9;
  mach_msg_type_number_t dataCnt;
  vm_offset_t data;
  uint8_t buf[4];
  vm_map_t v14;
  __int16 v15;
  kern_return_t v16;
  __int16 v17;
  vm_address_t v18;
  __int16 v19;
  vm_size_t v20;
  unsigned int v6 = vm_read(a1, a2, a3, &data, &dataCnt);
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v14 = a1;
      v15 = 1024;
      v16 = v7;
      v17 = 2048;
      v18 = a2;
      v19 = 2048;
      v20 = a3 + a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "vm_read failed for task %u, kr=%d, start_address = %p, end_address = %p",  buf,  0x22u);
    }

    return 0LL;
  }

  else
  {
    id v9 = calloc(dataCnt + 1, 1uLL);
    id v8 = v9;
    if (v9) {
      memcpy(v9, (const void *)data, dataCnt);
    }
    vm_deallocate(mach_task_self_, data, dataCnt);
  }

  return v8;
}

id sub_10000AC64(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _isMemoryImmutableAtAddress:a2];
}

id sub_10000AC70(uint64_t a1, uint64_t a2)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _findContainingTextSegmentRegion:*(void *)(a1 + 40) address:a2]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return v3;
}

id sub_10000ACB4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _readStringAtTaskAddress:a2 maxLength:0 immutableCheck:0];
}

void sub_10000B1E4( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Attempting to read data: %@",  (uint8_t *)&buf,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x10000B188LL);
  }

  _Unwind_Resume(a1);
}

void sub_10000B604(id a1)
{
  int v1 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.ReportCrash");
  qword_10003EEA8 = -[NSUserDefaults integerForKey:](v1, "integerForKey:", @"AppSpecificBufferSize");
}

void sub_10000B650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v31 = 0;
  Name = (const char *)CSRegionGetName(a2, a3);
  if (!strncmp(Name, "__DATA", 6uLL) && strstr(Name, "__crash_info"))
  {
    uint64_t Range = CSRegionGetRange(a2, a3);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _readDataAtAddress:Range size:v8]);
    v10 = v9;
    if (v9)
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      memset(v28, 0, sizeof(v28));
      id v11 = v9;
      id v12 = [v11 bytes];
      id v13 = [v11 length];
      else {
        uint64_t v14 = (uint64_t)v13;
      }
      __memcpy_chk(v28, v12, v14, 64LL);
      uint64_t v15 = CSSymbolOwnerGetName(*(void *)(a1 + 40), *(void *)(a1 + 48));
      unint64_t v16 = *(void *)&v28[0];
      if (*(void *)&v28[0] && *((void *)&v28[0] + 1))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _readStringAtTaskAddress:*((void *)&v28[0] + 1) maxLength:qword_10003EEA8 immutableCheck:&v31]);
        v18 = *(void **)(a1 + 32);
        if (v15)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
          [v18 _addASILine:v17 fromOwner:v19 isSafe:v31];
        }

        else
        {
          [*(id *)(a1 + 32) _addASILine:v17 fromOwner:@"crash_info" isSafe:v31];
        }

        unint64_t v16 = *(void *)&v28[0];
      }

      if (v16 >= 2 && (void)v29)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _readStringAtTaskAddress:(void)v29 maxLength:qword_10003EEA8 immutableCheck:&v31]);
        v21 = *(void **)(a1 + 32);
        if (v15)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
          [v21 _addASILine:v20 fromOwner:v22 isSafe:v31];
        }

        else
        {
          [*(id *)(a1 + 32) _addASILine:v20 fromOwner:@"crash_info" isSafe:v31];
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
        if ([v23 appleInternal])
        {
          unsigned int v24 = [v20 isEqualToString:@"#TESTFLIGHT"];

          if (v24)
          {
            *(_BYTE *)(*(void *)(a1 + 32) + 16352LL) = 1;
            [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___OSAReport__logWritingOptions) setObject:@"beta" forKeyedSubscript:kOSALogOptionRouting];
          }
        }

        else
        {
        }

        unint64_t v16 = *(void *)&v28[0];
      }

      if (v16 >= 5 && *((void *)&v30 + 1))
      {
        *(void *)(*(void *)(a1 + 32) + 15912LL) = *((void *)&v30 + 1);
        v25 = *(void **)(a1 + 32);
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Abort Cause %lld",  *((void *)&v30 + 1)));
        if (v15)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
          [v25 _addASILine:v26 fromOwner:v27 isSafe:1];
        }

        else
        {
          [v25 _addASILine:v26 fromOwner:@"crash_info" isSafe:1];
        }
      }
    }
  }

void sub_10000BB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes(a2, a3);
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  uint64_t v25 = 0LL;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000BDA4;
  v17[3] = &unk_100030EE0;
  v17[4] = &v22;
  v17[5] = &v18;
  CSSymbolOwnerForeachSegment(a2, a3, v17);
  if (v23[3] || v19[3])
  {
    uint64_t Architecture = CSSymbolOwnerGetArchitecture(a2, a3);
    uint64_t v8 = macho_arch_name_for_cpu_type(Architecture, SHIDWORD(Architecture));
    id v9 = *(void **)(*(void *)(a1 + 32) + 104LL);
    uint64_t v10 = v23[3];
    uint64_t v11 = v19[3];
    uint64_t Name = CSSymbolOwnerGetName(a2, a3);
    objc_msgSend( v9,  "addImageLegacy:address:size:name:path:arch:",  CFUUIDBytes,  v10,  v11 - v10 + 1,  Name,  CSSymbolOwnerGetPath(a2, a3),  v8);
    uint64_t v13 = *(void *)(a1 + 32);
    unint64_t v14 = *(void *)(v13 + 16152);
    if (v23[3] < v14 || v19[3] >= *(void *)(v13 + 16160) + v14)
    {
      uint64_t v15 = *(void **)(a1 + 40);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
      [v15 addObject:v16];
    }
  }

  if (*(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) _extractCrashReporterAnnotationsFromSymbolOwner:a2 withMemory:a3];
  }
  objc_msgSend(*(id *)(a1 + 32), "_extractInfoPlistFromSymbolOwner:", a2, a3);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void sub_10000BD74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_10000BDA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Name = (const char *)CSRegionGetName(a2, a3);
  if (!strncmp(Name, "__TEXT", 6uLL) || (unint64_t result = strcmp(Name, "MACH_HEADER"), !(_DWORD)result))
  {
    unint64_t result = CSRegionGetRange(a2, a3);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(void *)(v9 + 24) - 1LL >= result) {
      *(void *)(v9 + 24) = result;
    }
    unint64_t v10 = v8 + result - 1;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v10 > *(void *)(v11 + 24)) {
      *(void *)(v11 + 24) = v10;
    }
  }

  return result;
}

void sub_10000C264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (dword_10003EE88 == 2 || (CSIsNull(a2, a3) & 1) != 0 || (uint64_t Name = CSSymbolGetName(a2, a3)) == 0)
  {
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v12 = Name;
    uint64_t v13 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v11);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v12));
    uint64_t v15 = OSASanitizePath(v14, 0LL);
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v13 setObject:v16 forKeyedSubscript:@"symbol"];

    v17 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40) - CSSymbolGetRange(a2, a3));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v13 setObject:v18 forKeyedSubscript:@"symbolLocation"];

    if ((CSIsNull(a4, a5) & 1) == 0)
    {
      uint64_t Filename = CSSourceInfoGetFilename(a4, a5);
      if (Filename)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", Filename));
        [v13 setObject:v20 forKeyedSubscript:@"sourceFile"];
      }

      uint64_t LineNumber = CSSourceInfoGetLineNumber(a4, a5);
      if ((_DWORD)LineNumber)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", LineNumber));
        [v13 setObject:v22 forKeyedSubscript:@"sourceLine"];
      }
    }
  }

  if ([*(id *)(a1 + 32) count])
  {
    if (!v13) {
      uint64_t v13 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v23);
    }
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"inline"];
  }

  uint64_t v24 = *(void **)(a1 + 32);
  id v25 = [v13 count];
  uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 40)));
  v27 = (void *)v26;
  if (v25)
  {
    uint64_t v32 = v26;
    v33 = v13;
    v28 = &v32;
    uint64_t v29 = 2LL;
  }

  else
  {
    uint64_t v31 = v26;
    v28 = &v31;
    uint64_t v29 = 1LL;
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v28,  v29,  v31,  v32,  v33));
  [v24 addObject:v30];
}

void sub_10000CC34(_Unwind_Exception *a1)
{
}

void sub_10000CC88(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"symbol"]);
  uint64_t v11 = v10;
  if (v10)
  {
    if (!*(_DWORD *)(a1 + 72) && *(_DWORD *)(*(void *)(a1 + 32) + 15776LL) == *(_DWORD *)(a1 + 76))
    {
      if ([v10 isEqualToString:@"___NEW_PROCESS_COULD_NOT_BE_EXECD___"])
      {
        [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___OSAReport__notes) addObject:@"process could not be executed"];
      }

      else if ([v11 isEqualToString:@"objc_msgSend"])
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _objcSelectorNameForMessenger:v11]);
        if ([v12 length])
        {
          uint64_t v13 = *(void **)(a1 + 32);
          unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"objc_msgSend() selector name: %@",  v12));
          [v13 _addASILine:v14 fromOwner:@"objc" isSafe:1];
        }
      }
    }

    if (*(_DWORD *)(*(void *)(a1 + 32) + 188LL) == 6
      && (([v11 isEqualToString:@"abort"] & 1) != 0
       || [v11 isEqualToString:@"__abort"]))
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 15776LL) = *(_DWORD *)(a1 + 76);
      uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 16248LL);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"override via abort 0x%x ID(0x%llX)",  *(unsigned int *)(a1 + 80),  *(void *)(a1 + 56)));
      [v15 addObject:v16];

      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = *(_DWORD *)(a1 + 80);
      *(void *)(*(void *)(a1 + 32) + 15768LL) = *(void *)(a1 + 56);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *(_DWORD *)(*(void *)(a1 + 32) + 15776LL);
        *(_DWORD *)buf = 67109120;
        int v23 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Forcing thread index %d (SIGABRT)",  buf,  8u);
      }
    }
  }

  uint64_t v18 = *(_DWORD **)(a1 + 32);
  if (v18[3944] == *(_DWORD *)(a1 + 76))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 symbolInfo]);
    [v18 updateLogWritingSignatureWithSymbol:v19 address:*(void *)(a1 + 64)];

    uint64_t v18 = *(_DWORD **)(a1 + 32);
  }

  uint64_t v20 = *(void **)(a1 + 40);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 composeFrame:v7 info:v8]);
  [v20 addObject:v21];
}

BOOL sub_10000D024(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 range];
  BOOL result = v5 - (uint64_t)v6 < v7;
  *a4 = result;
  return result;
}

BOOL sub_10000D0F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = v3;
  if ((*((_BYTE *)v3 + OBJC_IVAR___VMUVMRegion_is_submap) & 1) != 0
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 type]),
        unsigned int v6 = [v5 isEqualToString:@"__TEXT"],
        v5,
        !v6))
  {
    BOOL v10 = 0LL;
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v4 range];
    BOOL v10 = v7 - (uint64_t)v8 < v9;
  }

  return v10;
}

void sub_10000D630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) composeFrame:a2 info:a3]);
  [v3 addObject:v4];
}

void sub_10000DFE8(int a1, void *a2)
{
}

void sub_10000F9C8(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1LL);
  double v2 = (void *)qword_10003EEB8;
  qword_10003EEB8 = (uint64_t)v1;
}

NSMutableString *sub_10000F9EC(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v6 = (1000 * a3);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001A438;
  v11[3] = &unk_100031168;
  uint64_t v14 = a1;
  id v12 = a2;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  uint64_t v13 = v7;
  uint64_t v15 = a4;
  id v8 = v12;
  if (+[OSAReport executeWithTimeout:Code:](&OBJC_CLASS___OSAReport, "executeWithTimeout:Code:", v6, v11))
  {
    unint64_t v9 = (NSMutableString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Timeout executing '%s'",  a1));
  }

  else
  {

    unint64_t v9 = v7;
  }

  return v9;
}

LABEL_136:
          int v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown GUARD_TYPE_MACH_PORT flavor %d",  HIDWORD(v14) & 0x1FFFFFFF));
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v71 = HIDWORD(v14) & 0x1FFFFFFF;
            *(_WORD *)&v71[4] = 2048;
            *(void *)&v71[6] = v14;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown GUARD_TYPE_MACH_PORT flavor %d in code %lld",  buf,  0x12u);
          }

          goto LABEL_138;
        case 2uLL:
          [v3 setObject:@"GUARD_TYPE_FD" forKeyedSubscript:@"subtype"];
          uint64_t v29 = HIDWORD(v14) & 0x1FFFFFFF;
          if ((HIDWORD(v14) & 0x1FFFFFFFu) > 0xF)
          {
            switch((_DWORD)v29)
            {
              case 0x10:
                int v17 = @"FILEPORT";
                break;
              case 0x20:
                int v17 = @"MISMATCH";
                break;
              case 0x40:
                int v17 = @"WRITE";
                break;
              default:
LABEL_93:
                int v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown GUARD_TYPE_FD flavor %d",  HIDWORD(v14) & 0x1FFFFFFF));
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v71 = HIDWORD(v14) & 0x1FFFFFFF;
                  *(_WORD *)&v71[4] = 2048;
                  *(void *)&v71[6] = v14;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown GUARD_TYPE_FD flavor %d in code %lld",  buf,  0x12u);
                }

                break;
            }
          }

          else
          {
            int v17 = @"CLOSE";
            switch((int)v29)
            {
              case 1:
                break;
              case 2:
                int v17 = @"DUP";
                break;
              case 4:
                int v17 = @"NOCLOEXEC";
                break;
              case 8:
                int v17 = @"SOCKET_IPC";
                break;
              default:
                goto LABEL_93;
            }
          }

          v73 = v17;
          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v73,  1LL));
          [v3 setObject:v42 forKeyedSubscript:@"violations"];

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
          [v3 setObject:v43 forKeyedSubscript:@"fd"];

          v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
          [v3 setObject:v44 forKeyedSubscript:@"guardId"];

          v41 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" %@ on file descriptor %u (guarded with 0x%016qx)",  v17,  v14,  self->_exceptionCode[1]);
          goto LABEL_142;
        case 3uLL:
          [v3 setObject:@"GUARD_TYPE_USER" forKeyedSubscript:@"subtype"];
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
          [v3 setObject:v30 forKeyedSubscript:@"namespc"];

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
          [v3 setObject:v31 forKeyedSubscript:@"reason"];

          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"namespc %u reason_code 0x%016qx",  v14,  self->_exceptionCode[1],  v63);
          goto LABEL_68;
        case 4uLL:
          [v3 setObject:@"GUARD_TYPE_VN" forKeyedSubscript:@"subtype"];
          buf[0] = 0;
          proc_name(v14, buf, 0x400u);
          uint64_t v32 = HIDWORD(v14) & 0x1FFFFFFF;
          if ((HIDWORD(v14) & 0x1FFFFFFFu) > 0xF)
          {
            if ((HIDWORD(v14) & 0x1FFFFFFFu) > 0x3F)
            {
              if ((_DWORD)v32 == 64)
              {
                int v17 = @"VNG_EXCHDATA";
                goto LABEL_112;
              }

              if ((_DWORD)v32 == 128)
              {
                int v17 = @"VNG_PERMISSIONS";
                goto LABEL_112;
              }
            }

            else
            {
              if ((_DWORD)v32 == 16)
              {
                int v17 = @"VNG_TRUNC_OTHER";
                goto LABEL_112;
              }

              if ((_DWORD)v32 == 32)
              {
                int v17 = @"VNG_LINK";
                goto LABEL_112;
              }
            }

LABEL_110:
            int v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown GUARD_TYPE_VN flavor %d",  HIDWORD(v14) & 0x1FFFFFFF));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v66 = 67109376;
              v67 = HIDWORD(v14) & 0x1FFFFFFF;
              v68 = 2048;
              v69 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown GUARD_TYPE_VN flavor %d in code %lld",  v66,  0x12u);
            }
          }

          else
          {
            int v17 = @"VNG_RENAME_TO";
            switch((int)v32)
            {
              case 1:
                break;
              case 2:
                int v17 = @"VNG_RENAME_FROM";
                break;
              case 4:
                int v17 = @"VNG_UNLINK";
                break;
              case 8:
                int v17 = @"VNG_WRITE_OTHER";
                break;
              default:
                goto LABEL_110;
            }
          }

LABEL_112:
          v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"id=0x%016qx, pid=%u",  self->_exceptionCode[1],  v14));
          v46 = v45;
          if (buf[0])
          {
            objc_msgSend(v45, "appendFormat:", @", process=%s", buf);
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
            [v3 setObject:v47 forKeyedSubscript:@"process"];
          }

          objc_msgSend(v46, "appendFormat:", @", flavor=0x%08x", HIDWORD(v14) & 0x1FFFFFFF);
          [v46 appendFormat:@" (%@)", v17];
          v65 = v17;
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v65,  1LL));
          [v3 setObject:v48 forKeyedSubscript:@"flavors"];

          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
          [v3 setObject:v49 forKeyedSubscript:@"pid"];

          v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
          [v3 setObject:v50 forKeyedSubscript:@"guardId"];

          [v3 setObject:v46 forKeyedSubscript:@"message"];
LABEL_143:

          goto LABEL_144;
        case 5uLL:
          [v3 setObject:@"GUARD_TYPE_VIRT_MEMORY" forKeyedSubscript:@"subtype"];
          v33 = HIDWORD(v14) & 0x1FFFFFFF;
          v34 = v33 - 1;
          if ((v33 - 1) < 8 && ((0x8Bu >> v34) & 1) != 0)
          {
            int v17 = *(&off_100031248 + v34);
          }

          else
          {
            int v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown GUARD_TYPE_VIRT_MEMORY flavor %d",  HIDWORD(v14) & 0x1FFFFFFF));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v71 = HIDWORD(v14) & 0x1FFFFFFF;
              *(_WORD *)&v71[4] = 2048;
              *(void *)&v71[6] = v14;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unknown GUARD_TYPE_VIRT_MEMORY flavor %d in code %lld",  buf,  0x12u);
            }
          }

          v64 = v17;
          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v64,  1LL));
          [v3 setObject:v39 forKeyedSubscript:@"flavors"];

          v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
          [v3 setObject:v40 forKeyedSubscript:@"offset"];

          v41 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"offset=0x%016qx, flavor=0x%08x (%@)",  self->_exceptionCode[1],  v33,  v17);
LABEL_142:
          v54 = (void *)objc_claimAutoreleasedReturnValue(v41);
          [v3 setObject:v54 forKeyedSubscript:@"message"];

          goto LABEL_143;
        case 6uLL:
          [v3 setObject:@"GUARD_TYPE_REJECTED_SC" forKeyedSubscript:@"subtype"];
          if ((_DWORD)v14)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
            [v3 setObject:v35 forKeyedSubscript:@"machTrap"];

            v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
            [v3 setObject:v36 forKeyedSubscript:@"number"];

            uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"mach_trap %u number 0x%016qx",  v14,  self->_exceptionCode[1],  v63);
          }

          else
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[1]));
            [v3 setObject:v38 forKeyedSubscript:@"syscall"];

            uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"syscall 0x%016qx",  self->_exceptionCode[1],  v62,  v63);
          }

          goto LABEL_68;
        default:
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GUARD_TYPE_0x%llX",  v14 >> 61));
          [v3 setObject:v28 forKeyedSubscript:@"subtype"];

          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unknown guard type (0x%016qx, 0x%016qx)",  v14,  self->_exceptionCode[1],  v63);
LABEL_68:
          uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v21);
          goto LABEL_69;
      }

    case 11:
      uint64_t v18 = *self->_exceptionCode;
      v19 = (v18 >> 58) & 7;
      switch(v18 >> 61)
      {
        case 1uLL:
          if (v19 == 2) {
            uint64_t v20 = @"CPU_FATAL";
          }
          else {
            uint64_t v20 = @"CPU";
          }
          [v3 setObject:v20 forKeyedSubscript:@"subtype"];
          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (Limit %u%%) Observed %u%% over %u secs",  *(_DWORD *)self->_exceptionCode & 0x7F,  self->_exceptionCode[1] & 0x7F,  *(_DWORD *)self->_exceptionCode >> 7);
          goto LABEL_68;
        case 2uLL:
          [v3 setObject:@"WAKEUPS" forKeyedSubscript:@"subtype"];
          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (Limit %u/sec) Observed %u/sec over %u secs",  *self->_exceptionCode & 0xFFF,  self->_exceptionCode[1] & 0xFFFFF,  ((unint64_t)*self->_exceptionCode >> 20) & 0xFFFFF);
          goto LABEL_68;
        case 3uLL:
          [v3 setObject:@"MEMORY" forKeyedSubscript:@"subtype"];
          if (v19 == 1)
          {
            v37 = @" (Limit %u MB) Crossed High Water Mark";
          }

          else
          {
            if (v19 != 2)
            {
              uint64_t v26 = @"Unknown memory exception type";
LABEL_69:
              v27 = @"message";
              goto LABEL_70;
            }

            v37 = @" (Threshold %u MB) Crossed Threshold For Diagnostic Log Generation (this log does not indicate a memory limit violation)";
          }

          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v37,  *(_DWORD *)self->_exceptionCode & 0x1FFF,  v62,  v63);
          goto LABEL_68;
        case 4uLL:
          [v3 setObject:@"IO" forKeyedSubscript:@"subtype"];
          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (Limit %u MB) Observed %u MB over %u secs",  *(_DWORD *)self->_exceptionCode & 0x7FFF,  self->_exceptionCode[1] & 0x7FFF,  *(_DWORD *)self->_exceptionCode >> 15);
          goto LABEL_68;
        case 5uLL:
          [v3 setObject:@"THREADS" forKeyedSubscript:@"subtype"];
          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (Limit %u threads) Crossed Thread Limit",  *(_DWORD *)self->_exceptionCode & 0x7FFF,  v62,  v63);
          goto LABEL_68;
        case 6uLL:
          [v3 setObject:@"PORTS" forKeyedSubscript:@"subtype"];
          uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (Limit %u ports) Crossed system-wide per-process Port Limit",  *(_DWORD *)self->_exceptionCode & 0xFFFFFF,  v62,  v63);
          goto LABEL_68;
        default:
          goto LABEL_144;
      }

    case 1:
      exceptionCode = self->_exceptionCode;
      id v8 = exceptionCode[1];
      self->_crashingAddress = v8;
      unint64_t v9 = exceptionCode[1];
      BOOL v10 = sub_100010CFC(*exceptionCode);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      id v12 = (void *)v11;
      if (v8 == v9) {
        uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ at 0x%016qx",  v11,  self->_exceptionCode[1],  v63);
      }
      else {
        uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ at 0x%016qx -> 0x%016qx (possible pointer authentication failure)",  v11,  self->_exceptionCode[1],  self->_crashingAddress);
      }
      int v23 = (void *)objc_claimAutoreleasedReturnValue(v13);
      [v3 setObject:v23 forKeyedSubscript:@"subtype"];

      if (*self->_exceptionCode == 10)
      {
        if (self->_pageinStateCount)
        {
          uint64_t v24 = self->_pageinState[0];
          if ((_DWORD)v24)
          {
            id v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" FS pagein error: %d %s",  v24,  strerror(self->_pageinState[0]));
            uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(v25);
            v27 = @"subtype";
LABEL_70:
            [v3 setObject:v26 forKeyedSubscript:v27];
          }
        }
      }

      break;
    default:
      exit_snapshot = self->_exit_snapshot;
      if (exit_snapshot && exit_snapshot->ers_namespace == 7 && exit_snapshot->ers_code == 3)
      {
        [v3 setObject:@"LAUNCH_HANG" forKeyedSubscript:@"subtype"];
        [v3 setObject:@"The extension took too much time to initialize" forKeyedSubscript:@"message"];
      }

      break;
  }

LABEL_144:
  if (self->_exceptionCodeCount)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (self->_exceptionCodeCount)
    {
      v57 = 0LL;
      do
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_exceptionCode[v57]));
        [v55 addObject:v58];

        v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%016qx",  self->_exceptionCode[v57]));
        [v56 addObject:v59];

        ++v57;
      }

      while (v57 < self->_exceptionCodeCount);
    }

    [v3 setObject:v55 forKeyedSubscript:@"rawCodes"];
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "componentsJoinedByString:", @", "));
    [v3 setObject:v60 forKeyedSubscript:@"codes"];
  }

  return v3;
}

id sub_100010CFC(uint64_t a1)
{
  v8[0] = &off_1000380F0;
  v8[1] = &off_1000380D8;
  v9[0] = @"KERN_PROTECTION_FAILURE";
  v9[1] = @"KERN_INVALID_ADDRESS";
  v8[2] = &off_1000381B0;
  v9[2] = @"KERN_MEMORY_ERROR";
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a1));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"UNKNOWN_0x%llX", a1));
  }
  uint64_t v6 = v5;

  return v6;
}

LABEL_11:
  if ([v8 count]) {
    [v3 setObject:v8 forKeyedSubscript:@"details"];
  }

  return v3;
}

      v19 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v9);
      objc_msgSend(*(id *)(a1 + 32), "capture_time");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v19 setObject:v20 forKeyedSubscript:@"lastCheckTime"];

      if (objc_opt_class(&OBJC_CLASS___TRIAllocationStatus))
      {
        uint64_t v22 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v21);
        int v23 = (void *)objc_claimAutoreleasedReturnValue(+[TRIAllocationStatus defaultProvider](&OBJC_CLASS___TRIAllocationStatus, "defaultProvider"));
        id v25 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v24);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 crashReporterKey]);
        v48 = 0LL;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_10001592C;
        v46[3] = &unk_1000310B8;
        v28 = v25;
        v47 = v28;
        uint64_t v29 = [v23 enumerateSampledActiveExperimentsForEnvironment:0 correlationID:v27 error:&v48 block:v46];
        __int128 v30 = v48;

        if (v29)
        {
          [v19 setObject:v28 forKeyedSubscript:@"experiments"];
        }

        else
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v30 localizedDescription]);
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"experiments query returned: %@",  v32));
          [v22 addObject:v33];
        }

        v34 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 crashReporterKey]);
        v45 = v30;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100015A54;
        v43[3] = &unk_1000310E0;
        v37 = v34;
        v44 = v37;
        v38 = [v23 enumerateSampledActiveRolloutsForCorrelationID:v36 error:&v45 block:v43];
        v39 = v45;

        if (v38)
        {
          [v19 setObject:v37 forKeyedSubscript:@"rollouts"];
        }

        else
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedDescription]);
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"rollout query returned: %@",  v40));
          [v22 addObject:v41];
        }

        if ([v22 count]) {
          [v19 setObject:v22 forKeyedSubscript:@"errors"];
        }
        CFPreferencesSetAppValue(@"TrialCache", v19, @"com.apple.ReportCrash");
        CFPreferencesAppSynchronize(@"com.apple.ReportCrash");
      }

      else
      {
        [v19 setObject:&off_1000385E8 forKeyedSubscript:@"errors"];
      }

      v42 = (void *)qword_10003EEC8;
      qword_10003EEC8 = (uint64_t)v19;

      return;
    }

  __break(1u);
}

LABEL_9:
    AnalyticsSendEventLazy(@"com.apple.stability.payloadProblem", v7);
  }

  unint64_t v9 = 0LL;
  return v9;
}

  if (self->_exit_snapshot)
  {
    [v3 setObject:v4 forKeyedSubscript:@"namespace"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_code));
    [v3 setObject:v12 forKeyedSubscript:@"code"];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_exit_snapshot->ers_flags));
    [v3 setObject:v13 forKeyedSubscript:@"flags"];

    exit_snapshot = self->_exit_snapshot;
    if ((exit_snapshot->ers_flags & 0x10) != 0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100014168;
      v21[3] = &unk_100031048;
      uint64_t v22 = v4;
      AnalyticsSendEventLazy(@"com.apple.stability.payloadProblem", v21);

      exit_snapshot = self->_exit_snapshot;
    }

    switch(exit_snapshot->ers_namespace)
    {
      case 2u:
        uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  strsignal(exit_snapshot->ers_code));
        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v3 setObject:v16 forKeyedSubscript:@"indicator"];
        goto LABEL_32;
      case 3u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonCodeSigning](self, "decode_reasonCodeSigning"));
        goto LABEL_31;
      case 6u:
        -[OSACrashReport decode_reasonDyldWithInfo:](self, "decode_reasonDyldWithInfo:", v3);
        break;
      case 7u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonLibxpc](self, "decode_reasonLibxpc"));
        goto LABEL_31;
      case 9u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonExec](self, "decode_reasonExec"));
        goto LABEL_31;
      case 0xAu:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonCarousel](self, "decode_reasonCarousel"));
        goto LABEL_31;
      case 0xBu:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonTcc](self, "decode_reasonTcc"));
        goto LABEL_31;
      case 0xDu:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonCoreAnimation](self, "decode_reasonCoreAnimation"));
        goto LABEL_31;
      case 0x12u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonLibSystem](self, "decode_reasonLibSystem"));
        goto LABEL_31;
      case 0x14u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonWatchdog](self, "decode_reasonWatchdog"));
        goto LABEL_31;
      case 0x15u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonMetal](self, "decode_reasonMetal"));
        goto LABEL_31;
      case 0x16u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonWatchKit](self, "decode_reasonWatchKit"));
        goto LABEL_31;
      case 0x19u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonSandbox](self, "decode_reasonSandbox"));
        goto LABEL_31;
      case 0x1Du:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonBTC](self, "decode_reasonBTC"));
        goto LABEL_31;
      case 0x1Eu:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonPortSpace](self, "decode_reasonPortSpace"));
        goto LABEL_31;
      case 0x20u:
        int v17 = objc_claimAutoreleasedReturnValue(-[OSACrashReport decode_reasonBacklightServices](self, "decode_reasonBacklightServices"));
LABEL_31:
        unint64_t v16 = (void *)v17;
        [v3 addEntriesFromDictionary:v17];
LABEL_32:

        break;
      default:
        break;
    }
  }

  if (self->_terminator_pid)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
    [v3 setObject:v18 forKeyedSubscript:@"byPid"];

    terminator_proc = self->_terminator_proc;
    if (terminator_proc) {
      [v3 setObject:terminator_proc forKeyedSubscript:@"byProc"];
    }
  }

  return v3;
}

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "trial data initial fetch",  buf,  2u);
    }

    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "trial data cache valid",  buf,  2u);
  }

NSDictionary *__cdecl sub_100013C20(id a1)
{
  return (NSDictionary *)&off_100037F80;
}

NSDictionary *__cdecl sub_100013C2C(id a1)
{
  return (NSDictionary *)&off_100037FA8;
}

id sub_100014168(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = @"namespace";
  v3[1] = @"problem";
  v4[0] = v1;
  v4[1] = @"truncated";
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
}

LABEL_16:
  if (!v17)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v10));
    [0 setObject:v46 forKeyedSubscript:@"flavor"];
  }

LABEL_18:
  return v17;
}
}

LABEL_12:
    }
  }

LABEL_14:
  return v9;
}

void sub_100015058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

uint64_t sub_100015078(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015088(uint64_t a1)
{
}

void *sub_100015090(void *result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(*(void *)(result[4] + 8) + 40), "addEntriesFromDictionary:");
  }
  return result;
}

void sub_1000151B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000151E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = CSRegionGetName(a2, a3);
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = result == 0;
  }
  if (!v7)
  {
    uint64_t result = strncmp((const char *)result, "__OBJC_RO", 9uLL);
    if (!(_DWORD)result)
    {
      uint64_t result = CSRegionGetRange(a2, a3);
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
      *(void *)(v8 + 32) = result;
      *(void *)(v8 + 40) = v9;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

void sub_100015390(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.ReportCrash.trialQueue", v4);
  id v3 = (void *)qword_10003EED0;
  qword_10003EED0 = (uint64_t)v2;
}

void sub_1000153E4(uint64_t a1)
{
  if (!qword_10003EEC8)
  {
    CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"TrialCache", @"com.apple.ReportCrash");
    id v3 = (void *)qword_10003EEC8;
    qword_10003EEC8 = (uint64_t)v2;

    if (!qword_10003EEC8) {
      goto LABEL_9;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "capture_time");
  double v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003EEC8 objectForKeyedSubscript:@"lastCheckTime"]);
  [v6 doubleValue];
  double v8 = v5 - v7;

  if (v8 > 86400.0)
  {
    if (qword_10003EEC8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "capture_time");
        uint64_t v11 = v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003EEC8 objectForKeyedSubscript:@"lastCheckTime"]);
        [v12 doubleValue];
        uint64_t v14 = v13;
        objc_msgSend(*(id *)(a1 + 32), "capture_time");
        double v16 = v15;
        int v17 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10003EEC8 objectForKeyedSubscript:@"lastCheckTime"]);
        [v17 doubleValue];
        *(_DWORD *)buf = 134218752;
        uint64_t v50 = v11;
        __int16 v51 = 2048;
        uint64_t v52 = v14;
        __int16 v53 = 2048;
        double v54 = v16 - v18;
        __int16 v55 = 2048;
        uint64_t v56 = 0x40F5180000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "trial data cache expired (%.1f - %.1f = %.1f [%.1f])",  buf,  0x2Au);
      }

void sub_10001592C(uint64_t a1, void *a2)
{
  CFPropertyListRef v2 = *(void **)(a1 + 32);
  v9[0] = @"experimentId";
  id v3 = a2;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 experimentId]);
  v10[0] = v4;
  v9[1] = @"deploymentId";
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deploymentId]));
  v10[1] = v5;
  v9[2] = @"treatmentId";
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 treatmentId]);

  double v7 = @"<unknown>";
  if (v6) {
    double v7 = v6;
  }
  v10[2] = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  [v2 addObject:v8];
}

void sub_100015A54(uint64_t a1, void *a2)
{
  CFPropertyListRef v2 = *(void **)(a1 + 32);
  v8[0] = @"rolloutId";
  id v3 = a2;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 rolloutId]);
  v9[0] = v4;
  v8[1] = @"deploymentId";
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deploymentId]));
  v9[1] = v5;
  v8[2] = @"factorPackIds";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 factorPackIds]);

  v9[2] = v6;
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  [v2 addObject:v7];
}

LABEL_139:
  if (!v210) {
    goto LABEL_185;
  }
  if ((!self->_is_simulated || self->_is_lightweight_corpse) && self->_exceptionType != 11)
  {
    v160 = objc_autoreleasePoolPush();
    if (byte_10003EE94 || -[NSString isEqualToString:](self->_procName, "isEqualToString:", @"ReportCrash"))
    {
LABEL_176:
      objc_autoreleasePoolPop(v160);
      goto LABEL_177;
    }

    v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(processID == 0) AND (senderImagePath CONTAINS '/Sandbox')"));
    v230[0] = v161;
    v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"subsystem == 'com.apple.sandbox.reporting'"));
    v230[1] = v162;
    v163 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v230, 2LL));

    if (self->_signal == 6) {
      v164 = (void *)objc_claimAutoreleasedReturnValue([&__NSArray0__struct arrayByAddingObject:@"hangtracerd"]);
    }
    else {
      v164 = &__NSArray0__struct;
    }
    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"wifid"))
    {
LABEL_151:
      v165 = @"kernel";
LABEL_163:
      v166 = objc_claimAutoreleasedReturnValue([v164 arrayByAddingObject:v165]);
LABEL_164:
      v167 = v166;

      v168 = (void *)v167;
LABEL_165:
      v211 = v168;
      if (self->_is_driverkit)
      {
        v169 = &off_1000386A8;
      }

      else
      {
        v170 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_proc_id));
        v229 = v170;
        v169 = (_UNKNOWN **)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v229,  1LL));
      }

      v171 = (void *)objc_claimAutoreleasedReturnValue( -[OSACrashReport getSyslogForPids:andOptionalSenders:additionalPredicates:]( self,  "getSyslogForPids:andOptionalSenders:additionalPredicates:",  v169));
      v172 = v171;
      v227[0] = @"filteredLog";
      v203 = (void *)v163;
      if (v171)
      {
        if ([v171 count])
        {
          v209 = objc_claimAutoreleasedReturnValue([v172 reverseObjectEnumerator]);
          v173 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([(id)v209 allObjects]);
          v174 = 1;
        }

        else
        {
          v174 = 0;
          v173 = &off_1000386D8;
        }
      }

      else
      {
        v174 = 0;
        v173 = &off_1000386C0;
      }

      v227[1] = &off_100038498;
      v228[0] = v173;
      v228[1] = &off_1000380D8;
      v175 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v228,  v227,  2LL));
      v5[2](v5, v175);

      if (v174)
      {
      }

      uint64_t v20 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
      goto LABEL_176;
    }

    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"Camera")) {
      goto LABEL_153;
    }
    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"SpringBoard"))
    {
      v165 = @"backboardd";
      goto LABEL_163;
    }

    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"backboardd"))
    {
      v165 = @"SpringBoard";
      goto LABEL_163;
    }

    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"tzd"))
    {
      v165 = @"mobileassetd";
      goto LABEL_163;
    }

    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"Carousel")
      || -[NSString isEqualToString:](self->_procName, "isEqualToString:", @"nanotimekitd"))
    {
      v165 = @"assetsd";
      goto LABEL_163;
    }

    if (-[NSString isEqualToString:]( self->_procName,  "isEqualToString:",  @"com.apple.photos.ImageConversionService")
      || -[NSString isEqualToString:]( self->_procName,  "isEqualToString:",  @"com.apple.photos.VideoConversionService"))
    {
LABEL_153:
      v165 = @"mediaserverd";
      goto LABEL_163;
    }

    if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"mediaserverd"))
    {
      v195 = &off_100038618;
    }

    else if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"audiomxd"))
    {
      v195 = &off_100038630;
    }

    else if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"mediaplaybackd"))
    {
      v195 = &off_100038648;
    }

    else if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"mediaparserd"))
    {
      v195 = &off_100038660;
    }

    else if (-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"videocodecd"))
    {
      v195 = &off_100038678;
    }

    else
    {
      if (!-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"airplayd"))
      {
        if (!-[NSString isEqualToString:](self->_procName, "isEqualToString:", @"zprint"))
        {
          v168 = v164;
          goto LABEL_165;
        }

        goto LABEL_151;
      }

      v195 = &off_100038690;
    }

    v166 = objc_claimAutoreleasedReturnValue([v164 arrayByAddingObjectsFromArray:v195]);
    goto LABEL_164;
  }

LABEL_177:
  if (self->_proc_id && (-[NSMutableDictionary count](self->_spewage_diag, "count") || self->_memgraph_filename))
  {
    v225 = &off_1000384B0;
    v226 = @"diagnosticOutput";
    v176 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:&v226 forKeys:&v225 count:1]);
    v5[2](v5, v176);

    if (-[NSMutableDictionary count](self->_spewage_diag, "count")) {
      v5[2](v5, self->_spewage_diag);
    }
    memgraph_filename = self->_memgraph_filename;
    v178 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    if (memgraph_filename)
    {
      v223 = @"memgraph/vmmap";
      v179 = sub_10000F9EC((uint64_t)"/usr/bin/vmmap", memgraph_filename, dword_10003EE8C, 0LL);
      v180 = (void *)objc_claimAutoreleasedReturnValue(v179);
      v222 = v180;
      v181 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v222, 1LL));
      v224 = v181;
      v182 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v224,  &v223,  1LL));
      v5[2](v5, v182);

      v220 = @"memgraph/heap";
      v183 = sub_10000F9EC((uint64_t)"/usr/bin/heap", self->_memgraph_filename, dword_10003EE8C, 0LL);
      v184 = (void *)objc_claimAutoreleasedReturnValue(v183);
      v219 = v184;
      v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v219, 1LL));
      v221 = v185;
      v186 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v221,  &v220,  1LL));
      v5[2](v5, v186);

      v217 = @"memgraph/leaks";
      v178 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
      v187 = sub_10000F9EC((uint64_t)"/usr/bin/leaks", self->_memgraph_filename, dword_10003EE8C, 0LL);
      v188 = (void *)objc_claimAutoreleasedReturnValue(v187);
      v216 = v188;
      v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v216, 1LL));
      v218 = v189;
      v190 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v218,  &v217,  1LL));
      v5[2](v5, v190);
    }

    v214 = &off_1000384C8;
    v215 = &stru_100031928;
    v191 = (void *)objc_claimAutoreleasedReturnValue([v178[131] dictionaryWithObjects:&v215 forKeys:&v214 count:1]);
    v5[2](v5, v191);

    uint64_t v20 = v178;
  }

LABEL_185:
  v192 = OBJC_IVAR___OSAReport__notes;
  if ([*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] count])
  {
    v193 = *(void *)&self->OSAReport_opaque[v192];
    v212[0] = @"reportNotes";
    v212[1] = &off_100038498;
    v213[0] = v193;
    v213[1] = &off_1000380D8;
    v194 = (void *)objc_claimAutoreleasedReturnValue([v20[131] dictionaryWithObjects:v213 forKeys:v212 count:2]);
    v5[2](v5, v194);
  }
}

LABEL_17:
      uint64_t v9 = (char *)v9 + 1;
    }

    while (v7 != v9);
    double v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7) {
      continue;
    }
    break;
  }

LABEL_21:
  return v3;
}

void sub_100019110(id a1)
{
  if (!qword_10003EF60)
  {
    *(_OWORD *)buf = off_100031188;
    v33 = 0LL;
    qword_10003EF60 = _sl_dlopen(buf, 0LL);
  }

  if (!qword_10003EF60) {
    goto LABEL_34;
  }
  if (!qword_10003EF68)
  {
    *(_OWORD *)buf = off_1000311A0;
    v33 = 0LL;
    qword_10003EF68 = _sl_dlopen(buf, 0LL);
  }

  if (qword_10003EF68)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "loading MetricKit",  buf,  2u);
    }

    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    dispatch_queue_attr_t v1 = (void *)qword_10003EF70;
    uint64_t v31 = qword_10003EF70;
    if (!qword_10003EF70)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001A6C8;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001A6C8((uint64_t)buf);
      dispatch_queue_attr_t v1 = (void *)v29[3];
    }

    id v2 = v1;
    _Block_object_dispose(&v28, 8);
    qword_10003EEE0 = (uint64_t)v2;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    id v3 = (void *)qword_10003EF78;
    uint64_t v31 = qword_10003EF78;
    if (!qword_10003EF78)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001A7C8;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001A7C8((uint64_t)buf);
      id v3 = (void *)v29[3];
    }

    id v4 = v3;
    _Block_object_dispose(&v28, 8);
    qword_10003EEE8 = (uint64_t)v4;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    double v5 = (void *)qword_10003EF80;
    uint64_t v31 = qword_10003EF80;
    if (!qword_10003EF80)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001A8C8;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001A8C8((uint64_t)buf);
      double v5 = (void *)v29[3];
    }

    id v6 = v5;
    _Block_object_dispose(&v28, 8);
    qword_10003EEF0 = (uint64_t)v6;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    double v7 = (void *)qword_10003EF88;
    uint64_t v31 = qword_10003EF88;
    if (!qword_10003EF88)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001A91C;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001A91C((uint64_t)buf);
      double v7 = (void *)v29[3];
    }

    id v8 = v7;
    _Block_object_dispose(&v28, 8);
    qword_10003EEF8 = (uint64_t)v8;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    uint64_t v9 = (void *)qword_10003EF90;
    uint64_t v31 = qword_10003EF90;
    if (!qword_10003EF90)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001A970;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001A970((uint64_t)buf);
      uint64_t v9 = (void *)v29[3];
    }

    id v10 = v9;
    _Block_object_dispose(&v28, 8);
    qword_10003EF00 = (uint64_t)v10;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    uint64_t v11 = (void *)qword_10003EF98;
    uint64_t v31 = qword_10003EF98;
    if (!qword_10003EF98)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001A9C4;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001A9C4((uint64_t)buf);
      uint64_t v11 = (void *)v29[3];
    }

    id v12 = v11;
    _Block_object_dispose(&v28, 8);
    qword_10003EF08 = (uint64_t)v12;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    uint64_t v13 = (void *)qword_10003EFA0;
    uint64_t v31 = qword_10003EFA0;
    if (!qword_10003EFA0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001AA18;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001AA18((uint64_t)buf);
      uint64_t v13 = (void *)v29[3];
    }

    id v14 = v13;
    _Block_object_dispose(&v28, 8);
    qword_10003EF10 = (uint64_t)v14;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    double v15 = (void *)qword_10003EFA8;
    uint64_t v31 = qword_10003EFA8;
    if (!qword_10003EFA8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001AA6C;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001AA6C((uint64_t)buf);
      double v15 = (void *)v29[3];
    }

    id v16 = v15;
    _Block_object_dispose(&v28, 8);
    qword_10003EF18 = (uint64_t)v16;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    int v17 = (void *)qword_10003EFB0;
    uint64_t v31 = qword_10003EFB0;
    if (!qword_10003EFB0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001AAC0;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001AAC0((uint64_t)buf);
      int v17 = (void *)v29[3];
    }

    id v18 = v17;
    _Block_object_dispose(&v28, 8);
    qword_10003EF20 = (uint64_t)v18;
    uint64_t v28 = 0LL;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2050000000LL;
    uint64_t v26 = (void *)qword_10003EFB8;
    uint64_t v31 = qword_10003EFB8;
    if (!qword_10003EFB8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      v33 = sub_10001AB14;
      v34 = &unk_1000311C0;
      v35 = &v28;
      sub_10001AB14((uint64_t)buf, v19, v20, v21, v22, v23, v24, v25, v28);
      uint64_t v26 = (void *)v29[3];
    }

    id v27 = v26;
    _Block_object_dispose(&v28, 8);
    qword_10003EF28 = (uint64_t)v27;
  }

  else
  {
LABEL_34:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MetricKit is not available",  buf,  2u);
    }
  }

void sub_100019718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id sub_100019B34(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, a2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v4 + 16364))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    [v3 setObject:v5 forKeyedSubscript:@"consecutiveCrashCount"];

    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(_DWORD *)(v4 + 16368))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
    [v3 setObject:v6 forKeyedSubscript:@"throttleTimeout"];
  }

  return v3;
}

void sub_10001A344(id a1)
{
  dispatch_queue_attr_t v1 = dlopen("/usr/lib/libMemoryResourceException.dylib", 5);
  qword_10003EF38 = (uint64_t)v1;
  if (!v1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v2 = "EXC_RESOURCE: libMemoryResourceException not found";
    id v3 = buf;
    goto LABEL_7;
  }

  off_10003EF40 = dlsym(v1, "ReportMemoryExceptionFromTask");
  if (!off_10003EF40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v4 = 0;
    id v2 = "EXC_RESOURCE: ReportMemoryExceptionFromTask not found in libMemoryResourceException";
    id v3 = (uint8_t *)&v4;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  }

void sub_10001A408(id a1)
{
  os_log_t v1 = os_log_create("com.apple.osanalytics.ReportCrash", "performance");
  id v2 = (void *)qword_10003EF50;
  qword_10003EF50 = (uint64_t)v1;
}

void sub_10001A438(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = v2;
    __int16 v20 = 2112;
    uint64_t v21 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "invoking %s %@",  buf,  0x16u);
  }

  id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%s %@", *(void *)(a1 + 48), *(void *)(a1 + 32)));
  double v5 = popen((const char *)[v4 UTF8String], "r");
  if (!v5)
  {
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to open '%s' (errno %d)",  *(void *)(a1 + 48),  *__error());
LABEL_17:
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v12 setString:v17];

    goto LABEL_18;
  }

  id v6 = v5;
  fflush(__stdoutp);
  size_t v7 = fread(buf, 1uLL, 0x1000uLL, v6);
  if (v7)
  {
    id v8 = @"\n===> TRUNCATED due to error converting diag output to NSString";
    while (1)
    {
      buf[v7] = 0;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
      if (!v9) {
        break;
      }
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = (char *)[*(id *)(a1 + 40) length] + v10;
      if ((char *)[v9 length] + (unint64_t)v11 >= (char *)0xE1000)
      {
        id v8 = @"\n===> TRUNCATED due to max allowable diagnostic output";
        break;
      }

      [*(id *)(a1 + 40) appendString:v9];

      size_t v7 = fread(buf, 1uLL, 0x1000uLL, v6);
      if (!v7) {
        goto LABEL_13;
      }
    }

    [*(id *)(a1 + 40) appendString:v8];
  }

LABEL_13:
  if (ferror(v6))
  {
    id v14 = *(void **)(a1 + 40);
    double v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nError reading output from '%s' (errno %d)",  *(void *)(a1 + 48),  *__error());
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v14 setString:v16];
  }

  if (pclose(v6) == -1)
  {
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nError closing pipe of '%s' (errno %d)",  *(void *)(a1 + 48),  *__error());
    goto LABEL_17;
  }

    uint64_t result = sub_100020BBC(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    id v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  id v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

void sub_10001A6C8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MXSourceUtilities");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EF70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_1000219E4();
    sub_10001A71C();
  }

void sub_10001A71C()
{
  os_log_t v1 = 0LL;
  if (!qword_10003EF68)
  {
    __int128 v2 = off_1000311A0;
    uint64_t v3 = 0LL;
    qword_10003EF68 = _sl_dlopen(&v2, &v1);
  }

  v0 = v1;
  if (!qword_10003EF68)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }

  if (v1) {
LABEL_7:
  }
    free(v0);
}

void sub_10001A7C8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MXCallStackThread");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EF78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_100021A08();
    sub_10001A81C();
  }

void sub_10001A81C()
{
  os_log_t v1 = 0LL;
  if (!qword_10003EF60)
  {
    __int128 v2 = off_100031188;
    uint64_t v3 = 0LL;
    qword_10003EF60 = _sl_dlopen(&v2, &v1);
  }

  v0 = v1;
  if (!qword_10003EF60)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }

  if (v1) {
LABEL_7:
  }
    free(v0);
}

Class sub_10001A8C8(uint64_t a1)
{
  Class result = objc_getClass("MXCallStackFrame");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EF80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021A2C();
    return (Class)sub_10001A91C(v3);
  }

  return result;
}

Class sub_10001A91C(uint64_t a1)
{
  Class result = objc_getClass("MXMetaData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EF88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021A50();
    return (Class)sub_10001A970(v3);
  }

  return result;
}

Class sub_10001A970(uint64_t a1)
{
  Class result = objc_getClass("MXCallStackTree");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EF90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021A74();
    return (Class)sub_10001A9C4(v3);
  }

  return result;
}

Class sub_10001A9C4(uint64_t a1)
{
  Class result = objc_getClass("MXCrashDiagnostic");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EF98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021A98();
    return (Class)sub_10001AA18(v3);
  }

  return result;
}

Class sub_10001AA18(uint64_t a1)
{
  Class result = objc_getClass("MXReportCrashData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EFA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021ABC();
    return (Class)sub_10001AA6C(v3);
  }

  return result;
}

Class sub_10001AA6C(uint64_t a1)
{
  Class result = objc_getClass("MXSourceManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EFA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021AE0();
    return (Class)sub_10001AAC0(v3);
  }

  return result;
}

Class sub_10001AAC0(uint64_t a1)
{
  Class result = objc_getClass("MXSignpostRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EFB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = sub_100021B04();
    return (Class)sub_10001AB14(v3);
  }

  return result;
}

void sub_10001AB14( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("MXCrashDiagnosticObjectiveCExceptionReason");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003EFB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v10 = (void *)sub_100021B28();
    sub_10001AB68(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }

void sub_10001AB68( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001AB78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001AB88( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10001ABA8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10001ABB8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_10001AE98()
{
  mach_msg_return_t v1;
  mach_error_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _opaque_pthread_t *v11;
  _opaque_pthread_t *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  void *v32;
  id v33;
  __CFString *v34;
  __CFString *v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  CFStringRef v41;
  CFStringRef v42;
  CFStringRef v43;
  id v44;
  void *v45;
  id v46;
  __CFString *v47;
  qos_class_t v48;
  char v49;
  __CFNotificationCenter *DistributedCenter;
  CFDictionaryRef v51;
  __CFNotificationCenter *v52;
  CFDictionaryRef v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  id v64;
  uint64_t v65;
  __CFString *v66;
  id v67;
  id v68;
  __CFString *v69;
  void *v70;
  id v71;
  unint64_t v72;
  id v73;
  unsigned __int8 v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  unsigned int v87;
  __CFString *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  __CFString *v96;
  unsigned int v97;
  void *v98;
  id v99;
  qos_class_t v100[2];
  uint64_t v101;
  id (*v102)(void *);
  void *v103;
  __CFString *v104;
  __CFString *v105;
  unint64_t v106;
  id v107;
  qos_class_t __qos_class[2];
  __int128 v109;
  void *v110;
  __CFString *v111;
  id v112;
  id v113;
  id v114;
  id v115;
  CFStringRef v116;
  id v117;
  void v118[2];
  void v119[2];
  uint8_t buf[8];
  __int128 v121;
  void *v122;
  __CFString *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  __CFString *v129;
  __CFString *v130;
  __CFString *v131;
  id v132;
  id v133;
  void v134[5];
  int __relative_priority[2];
  CFStringRef v136;
  CFStringRef v137;
  CFStringRef v138;
  __CFString *v139;
  v0 = objc_autoreleasePoolPush();
  os_log_t v1 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_10001BA88,  0x8000u,  dword_10003EFD8,  50331648);
  if (v1)
  {
    __int128 v2 = v1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v2;
      LOWORD(v121) = 2080;
      *(void *)((char *)&v121 + 2) = mach_error_string(v2);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "mach_msg_server_once() failed with error %d: %s",  buf,  0x12u);
    }

    goto LABEL_77;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 threadDictionary]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"OSACrashReport"]);
  id v6 = v5;
  if (v5)
  {
    [v5 loadBundleInfo];
    size_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getNotificationInfo]);
    id v8 = v7;
    if (v7)
    {
      if (([v7 urgentSubmission] & 1) != 0
        || (objc_msgSend(v6, "is_simulated") & 1) == 0
        && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 visibleName]), v9, v9))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "maintaining thread qos for (possibly) time-sensitive report",  buf,  2u);
        }

        goto LABEL_15;
      }
    }
  }

  else
  {
    id v8 = 0LL;
  }

  __relative_priority[0] = 0;
  uint64_t v11 = pthread_self();
  pthread_get_qos_class_np(v11, __qos_class, __relative_priority);
  pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0);
  uint64_t v12 = pthread_self();
  pthread_get_qos_class_np(v12, v100, __relative_priority);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(qos_class_t *)&uint8_t buf[4] = __qos_class[0];
    LOWORD(v121) = 1024;
    *(qos_class_t *)((char *)&v121 + 2) = v100[0];
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "post-exception thread qos drop %d -> %d",  buf,  0xEu);
  }

  if (!v6) {
    goto LABEL_74;
  }
LABEL_15:
  uint64_t v13 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
  if (qword_10003EFC8) {
    objc_msgSend(v6, "setApplicationSpecificInformation:", objc_msgSend((id)qword_10003EFC8, "bytes"));
  }
  if (qword_10003EFC0) {
    [v13 setObject:qword_10003EFC0 forKeyedSubscript:kOSALogOptionOverridePath];
  }
  v98 = v8;
  v84 = v4;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 getObserverInfo]);
  if (v14) {
    [v13 setObject:v14 forKeyedSubscript:kOSALogOptionObserverInfo];
  }
  v82 = (void *)v14;
  v83 = v13;
  uint64_t v15 = [v6 saveWithOptions:v13];
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decode_reason"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:@"namespace"]);
  [v6 donateToBiome];
  v74 = objc_msgSend(v6, "is_simulated");
  v87 = [v6 exceptionType];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 procName]);
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundle_id"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "short_vers"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decode_exceptionCodes"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v79 allValues]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v78 componentsJoinedByString:&stru_100031928]);
  v80 = (void *)v16;
  if (v16) {
    uint64_t v19 = (__CFString *)v16;
  }
  else {
    uint64_t v19 = @"<none>";
  }
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 terminationReasonExceptionCode]);
  v97 = v15;
  v85 = v0;
  if (v15) {
    v94 = (void *)objc_claimAutoreleasedReturnValue([v6 logfile]);
  }
  else {
    v94 = 0LL;
  }
  v72 = (unint64_t)[v6 crashingAddress];
  v67 = [v6 sharedCacheAddress];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 incidentID]);
  v77 = objc_claimAutoreleasedReturnValue([v6 responsibleProc]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 coalitionName]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 logWritingSignature]);
  if (v97) {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 oldLogFile]);
  }
  else {
    uint64_t v24 = 0LL;
  }
  uint64_t v25 = v17;
  v93 = v92;
  v91 = v95;
  v86 = v18;
  v96 = v19;
  uint64_t v26 = v20;
  id v27 = v94;
  v90 = v21;
  uint64_t v28 = v22;
  unsigned int v29 = v98;
  uint64_t v30 = v23;
  v89 = v24;
  if (v87 == 11) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v74;
  }
  v99 = v29;
  v70 = v24;
  if ((v31 & 1) == 0)
  {
    v69 = v25;
    if (OSARTCIsProcessOfInterest(v25))
    {
      v134[0] = @"crk";
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
      unsigned int v38 = objc_claimAutoreleasedReturnValue([v37 crashReporterKey]);
      id v39 = v29;
      v40 = (void *)v38;
      v41 = @"<unknown>";
      v42 = v86;
      if (!v86) {
        v42 = @"<unknown>";
      }
      *(void *)__relative_priority = v38;
      v136 = v42;
      v134[1] = @"exceptionCodes";
      v134[2] = @"process";
      if (v25) {
        v43 = v25;
      }
      else {
        v43 = @"<unknown>";
      }
      if (v26) {
        v41 = v26;
      }
      v137 = v43;
      v138 = v41;
      v134[3] = @"terminationReasonExceptionCode";
      v134[4] = @"terminationReasonNamespace";
      v139 = v96;
      id v44 = v27;
      id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  __relative_priority,  v134,  5LL));
      rtcsc_send(2005LL, 2005LL, v45);

      id v27 = v44;
      uint64_t v25 = v69;

      unsigned int v29 = v39;
    }

    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&v121 = 3221225472LL;
    *((void *)&v121 + 1) = sub_10001D130;
    v122 = &unk_100031310;
    v66 = v25;
    v123 = v66;
    v46 = v27;
    v124 = v46;
    v76 = v90;
    v125 = v76;
    v68 = v93;
    v126 = v68;
    v127 = v91;
    v71 = v29;
    v128 = v71;
    id v47 = v86;
    v129 = v47;
    v130 = v26;
    v131 = v96;
    v64 = v28;
    v132 = v64;
    v133 = v30;
    AnalyticsSendEventLazyHighPriority(@"com.apple.stability.crash", buf);
    if (v87 == 1 && (v72 & 0xFFFFFFFFFFFFFFLL) - 0x180000000LL <= (unint64_t)&_mh_execute_header)
    {
      *(void *)v100 = _NSConcreteStackBlock;
      v101 = 3221225472LL;
      v102 = sub_10001D2A8;
      v103 = &unk_100031338;
      v104 = v66;
      v106 = v72;
      v107 = v67;
      v105 = v47;
      AnalyticsSendEventLazy(@"com.apple.ReportCrash.sharedCache", v100);
    }

    id v48 = objc_msgSend(v71, "isBeta", v64);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __qos_class[0] = 67240450;
      __qos_class[1] = v48;
      LOWORD(v109) = 2114;
      *(void *)((char *)&v109 + 2) = v46;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "recordCrashEvent; isBeta %{public}d, log: '%{public}@'",
        (uint8_t *)__qos_class,
        0x12u);
    }

    if ([v46 length])
    {
      if ([v71 urgentSubmission])
      {
        v49 = v48 ^ 1;
        if (!v68) {
          v49 = 1;
        }
        if ((v49 & 1) == 0)
        {
          DistributedCenter = CFNotificationCenterGetDistributedCenter();
          v118[0] = @"bundleID";
          v118[1] = @"incidentID";
          v119[0] = v68;
          v119[1] = v76;
          __int16 v51 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v119,  v118,  2LL));
          CFNotificationCenterPostNotification( DistributedCenter,  @"com.apple.ReportCrash.beta.bulletin",  0LL,  v51,  1u);
        }

        if (qword_10003EFF8 != -1) {
          dispatch_once(&qword_10003EFF8, &stru_100031358);
        }
        dispatch_async((dispatch_queue_t)qword_10003EFF0, &stru_100031378);
      }

      uint64_t v52 = CFNotificationCenterGetDistributedCenter();
      v116 = @"logfiles";
      v117 = v46;
      __int16 v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v117,  &v116,  1LL));
      CFNotificationCenterPostNotification(v52, @"com.apple.ReportCrash.crash", 0LL, v53, 1u);
    }

    v73 = v30;
    v75 = v28;
    v88 = v26;
    v34 = v86;
    v35 = v69;
    if (v68)
    {
      if (qword_10003F008 != -1) {
        dispatch_once(&qword_10003F008, &stru_1000313D8);
      }
      double v54 = qword_10003F000;
      *(void *)__qos_class = _NSConcreteStackBlock;
      *(void *)&v109 = 3221225472LL;
      *((void *)&v109 + 1) = sub_10001D550;
      v110 = &unk_100031400;
      v111 = v66;
      __int16 v55 = v68;
      v112 = v55;
      v113 = v89;
      v114 = v46;
      v115 = v71;
      OSAStabilityMonitorEvaluateStabilityForBundleID(v55, v65, v54, __qos_class);
    }

    else
    {
      if (v89) {
        uint64_t v56 = v89;
      }
      else {
        uint64_t v56 = v46;
      }
      [v56 length];
    }

    v36 = v99;
    goto LABEL_69;
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 faultingImage]);
  v33 = [v32 length];

  v34 = v86;
  if (v33)
  {
    v73 = v30;
    v75 = v28;
    v88 = v26;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&v121 = 3221225472LL;
    *((void *)&v121 + 1) = sub_10001D5D8;
    v122 = &unk_100031428;
    v35 = v25;
    v123 = v25;
    v36 = v29;
    v124 = v29;
    AnalyticsSendEventLazy(@"com.apple.ReportCrash.os_log_fault", buf);
LABEL_69:

    uint64_t v25 = v35;
    uint64_t v26 = v88;
    uint64_t v30 = v73;
    uint64_t v28 = v75;
    unsigned int v29 = v36;
  }

  v57 = v90;
  v58 = v34;

  v59 = v25;
  if (v97)
  {

    uint64_t v30 = v28;
    uint64_t v28 = (id)v77;
    v60 = v94;
  }

  else
  {
    v60 = v90;
    v57 = (void *)v77;
  }

  [v6 sendToCoreAnalytics];
  id v8 = v99;
  id v4 = v84;
  v0 = v85;
LABEL_74:
  v61 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"OSAGPUEventReport"]);
  v62 = v61;
  if (v61) {
    [v61 saveWithOptions:0];
  }

LABEL_77:
  [(id)qword_10003EFD0 decrement:"complete"];
  objc_autoreleasePoolPop(v0);
  return 0LL;
}

uint64_t sub_10001BA88(uint64_t a1, _DWORD *a2)
{
  if (*(_DWORD *)(a1 + 20) != 1091) {
    return sub_10001DD84((_DWORD *)a1, (uint64_t)a2);
  }
  sub_10001BB2C();
  uint64_t audit_trailer = os_mach_msg_get_audit_trailer(a1);
  __int128 v5 = *(_OWORD *)(audit_trailer + 36);
  *(_OWORD *)v7.val = *(_OWORD *)(audit_trailer + 20);
  *(_OWORD *)&v7.val[4] = v5;
  if (audit_token_to_pid(&v7)) {
    return 0LL;
  }
  *a2 = 0;
  a2[2] = 0;
  [(id)qword_10003EFD0 increment:"gpu_event"];
  return sub_10001BBE0((const char *)(a1 + 24), *(_DWORD *)(a1 + 4) - 24);
}

BOOL sub_10001BB2C()
{
  int v0 = pthread_attr_init(&v13);
  int v1 = pthread_attr_setdetachstate(&v13, 2) | v0;
  int v2 = v1 | pthread_create(&v12, &v13, (void *(__cdecl *)(void *))sub_10001AE98, 0LL);
  pthread_attr_destroy(&v13);
  if (v2)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_100021B4C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v2 == 0;
}

uint64_t sub_10001BBE0(const char *a1, unsigned int a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2 >= 4)
  {
    int v5 = *(_DWORD *)a1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v17[0]) = v5;
      WORD2(v17[0]) = 1024;
      *(_DWORD *)((char *)v17 + 6) = a2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Handling GPU event version %u, %d bytes",  buf,  0xEu);
    }

    if (v5 == 101)
    {
      if ((int)a2 - 8LL >= (unint64_t)*((unsigned int *)a1 + 1))
      {
        uint64_t v9 = objc_autoreleasePoolPush();
        CFStringRef errorString = 0LL;
        uint64_t v10 = (void *)IOCFUnserializeBinary(a1 + 8, *((unsigned int *)a1 + 1), kCFAllocatorDefault, 0LL, &errorString);
        if (v10)
        {
          uint64_t v11 = -[OSAGPUEventReport initWithDictionary:]( objc_alloc(&OBJC_CLASS___OSAGPUEventReport),  "initWithDictionary:",  v10);
          pthread_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
          pthread_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 threadDictionary]);

          [v13 setObject:v11 forKeyedSubscript:@"OSAGPUEventReport"];
          uint64_t v2 = 1LL;
        }

        else
        {
          uint64_t v2 = 0LL;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17[0] = errorString;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unable to deserialize event: %@",  buf,  0xCu);
            uint64_t v2 = 0LL;
          }
        }

        objc_autoreleasePoolPop(v9);
      }

      else
      {
        uint64_t v2 = 0LL;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = *((_DWORD *)a1 + 1);
          *(_DWORD *)buf = 67109376;
          LODWORD(v17[0]) = v6;
          WORD2(v17[0]) = 1024;
          *(_DWORD *)((char *)v17 + 6) = a2;
          uint64_t v7 = "invalid event length %d vs size %d";
          uint32_t v8 = 14;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
          return 0LL;
        }
      }
    }

    else
    {
      uint64_t v2 = 0LL;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17[0]) = v5;
        uint64_t v7 = "unrecognized version %d";
        uint32_t v8 = 8;
        goto LABEL_11;
      }
    }
  }

  return v2;
}

uint64_t sub_10001BE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "catch_sync_request(%lld, %lld)",  (uint8_t *)&v11,  0x16u);
  }

  if (a2 == 1)
  {
    dword_10003EFDC = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(id)qword_10003EFD0 condition];
      int v11 = 67109120;
      LODWORD(v12) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "external sync request, waiting for %d active threads",  (uint8_t *)&v11,  8u);
    }

    [(id)qword_10003EFD0 waitForAll];
    dword_10003EFDC = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = objc_msgSend((id)qword_10003EFD0, "total_count");
      int v11 = 67109120;
      LODWORD(v12) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "sync complete after %d total events",  (uint8_t *)&v11,  8u);
    }

    uint64_t v9 = (int)objc_msgSend((id)qword_10003EFD0, "total_count");
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unknown request",  (uint8_t *)&v11,  2u);
    }

    uint64_t v9 = -1LL;
  }

  *a4 = v9;
  sub_10001BB2C();
  return 0LL;
}

uint64_t sub_10001C060()
{
  BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v0) {
    sub_100021B80(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return 5LL;
}

uint64_t sub_10001C090()
{
  BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v0) {
    sub_100021BB4(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return 5LL;
}

uint64_t sub_10001C0C0( mach_port_t a1, task_id_token_t a2, uint64_t a3, uint64_t a4, mach_port_name_t a5, int a6, uint64_t *a7, unsigned int a8, unsigned int a9, uint64_t a10, int a11, _OWORD *a12)
{
  kern_return_t v38;
  int v39;
  BOOL v40;
  const char *v41;
  mach_error_t v42;
  void *v43;
  OSACrashReport *v44;
  const char *v45;
  unsigned int v46;
  void *v47;
  OSACrashReport *v48;
  OSACrashReport *v49;
  const char *v50;
  unsigned int v51;
  void *v52;
  char *v53;
  uint64_t v54;
  void *v55;
  mach_vm_size_t kcd_size;
  int x[2];
  unsigned int object_addr;
  unsigned int object_type;
  mach_port_t task_port;
  _BYTE atoken[38];
  uint64_t v20 = (uint64_t)[(id)qword_10003EFD0 increment:"event"];
  if (!dword_10003EFDC) {
    sub_10001BB2C();
  }
  __int128 v21 = a12[1];
  *(_OWORD *)atoken = *a12;
  *(_OWORD *)&atoken[16] = v21;
  task_port = 0;
  if (audit_token_to_pid((audit_token_t *)atoken))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)atoken = 0;
      uint64_t v22 = "Will not report from invalid source";
      uint32_t v23 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v22, atoken, v23);
      return 5LL;
    }

    return 5LL;
  }

  if (a6 != 13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)atoken = 67240192;
      *(_DWORD *)&atoken[4] = a6;
      uint64_t v22 = "Will not write report for unsupported exception: %{public}i";
      uint32_t v23 = 8;
      goto LABEL_16;
    }

    return 5LL;
  }

  object_addr = 0;
  object_type = 0;
  if (a2)
  {
    if (a1) {
      sub_100021C6C();
    }
    uint64_t v24 = 5LL;
    if (!mach_port_kernel_object(mach_task_self_, a2, &object_type, &object_addr) && object_type == 50)
    {
      uint64_t v24 = task_identity_token_get_task_port(a2, 0, &task_port);
      if ((_DWORD)v24)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100021BE8(v24);
        }
      }
    }

    goto LABEL_36;
  }

  if (!a5)
  {
    if (mach_port_kernel_object(mach_task_self_, a1, &object_type, &object_addr)) {
      BOOL v27 = 0;
    }
    else {
      BOOL v27 = object_type == 2;
    }
    if (v27 && !mach_port_kernel_object(mach_task_self_, a3, &object_type, &object_addr) && object_type == 1)
    {
      task_port = a1;
      uint64_t v24 = 5LL;
      if (!a1) {
        return v24;
      }
LABEL_37:
      if (v20 < 6)
      {
        int v26 = 0;
        goto LABEL_39;
      }

      x[0] = -1;
      goto LABEL_45;
    }

    uint64_t v24 = 5LL;
LABEL_36:
    a1 = task_port;
    if (!task_port) {
      return v24;
    }
    goto LABEL_37;
  }

  uint64_t v24 = mach_port_kernel_object(mach_task_self_, a5, &object_type, &object_addr);
  if ((_DWORD)v24 || object_type != 52)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = mach_error_string(v24);
      *(_DWORD *)atoken = 67109634;
      *(_DWORD *)&atoken[4] = v24;
      *(_WORD *)&atoken[8] = 2080;
      *(void *)&atoken[10] = v29;
      *(_WORD *)&atoken[18] = 1024;
      *(_DWORD *)&atoken[20] = object_type;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "object check returned 0x%x (%s) type %u (expected IKOT_KCDATA)",  atoken,  0x18u);
    }

    goto LABEL_36;
  }

  if (v20 < 6)
  {
    uint64_t v24 = 0LL;
    int v26 = 1;
LABEL_39:
    __int16 v55 = objc_autoreleasePoolPush();
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 threadDictionary]);

    if (task_port)
    {
      if (a8 < 2)
      {
        uint64_t v33 = a10;
        v34 = v55;
        if (a8) {
          uint64_t v32 = *a7;
        }
        else {
          uint64_t v32 = 13LL;
        }
        v35 = v31;
        int v37 = a11;
        uint64_t v36 = a9;
      }

      else
      {
        uint64_t v32 = *a7;
        uint64_t v33 = a10;
        v34 = v55;
        v35 = v31;
        int v37 = a11;
        uint64_t v36 = a9;
        if (*a7 == 10)
        {
          if (a7[1] == 0x100000007LL) {
            uint64_t v32 = 11LL;
          }
          else {
            uint64_t v32 = 10LL;
          }
        }
      }

      id v48 = objc_alloc(&OBJC_CLASS___OSACrashReport);
      LODWORD(v54) = v37;
      v49 = -[OSACrashReport initWithTask:exceptionType:thread:threadId:threadStateFlavor:threadState:threadStateCount:]( v48,  "initWithTask:exceptionType:thread:threadId:threadStateFlavor:threadState:threadStateCount:",  task_port,  v32,  a3,  a4,  v36,  v33,  v54);
      -[OSACrashReport autopsyCorpse](v49, "autopsyCorpse");
      if (v49)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (-[OSACrashReport is_simulated](v49, "is_simulated")) {
            uint64_t v50 = "simulated";
          }
          else {
            uint64_t v50 = "fatal";
          }
          __int16 v51 = -[OSACrashReport proc_id](v49, "proc_id");
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport procName](v49, "procName"));
          *(_DWORD *)atoken = 136446978;
          *(void *)&atoken[4] = v50;
          *(_WORD *)&atoken[12] = 2080;
          *(void *)&atoken[14] = "corpse";
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v51;
          *(_WORD *)&atoken[28] = 2114;
          *(void *)&atoken[30] = v52;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Formulating %{public}s 309 report for %s[%d] %{public}@",  atoken,  0x26u);
        }

        [v35 setObject:v49 forKeyedSubscript:@"OSACrashReport"];
      }

      uint64_t v24 = 0LL;
    }

    else if (v26)
    {
      kcd_size = 0LL;
      *(void *)x = 0LL;
      v42 = task_map_kcdata_object_64(mach_task_self_, a5, (mach_vm_address_t *)x, &kcd_size);
      v35 = v31;
      if (*(void *)x && kcd_size)
      {
        if (qword_10003EFE8 != -1) {
          dispatch_once(&qword_10003EFE8, &stru_1000312E8);
        }
        v34 = v55;
        if (byte_10003EFE0)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)x,  kcd_size));
          [v43 writeToFile:@"/tmp/lw_kcdata.bin" atomically:1];

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = *(void *)x;
            *(_WORD *)&atoken[12] = 2048;
            *(void *)&atoken[14] = kcd_size;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "*** saved lightweight corpse at 0X%llX size %llu as /tmp/lw_kcdata.bin",  atoken,  0x16u);
          }
        }

        LODWORD(v54) = a11;
        id v44 = -[OSACrashReport initWithTask:exceptionType:thread:threadId:threadStateFlavor:threadState:threadStateCount:]( objc_alloc(&OBJC_CLASS___OSACrashReport),  "initWithTask:exceptionType:thread:threadId:threadStateFlavor:threadState:threadStateCount:",  0LL,  13LL,  0LL,  -1LL,  a9,  a10,  v54);
        -[OSACrashReport autopsyLightweightCorpse:size:](v44, "autopsyLightweightCorpse:size:", *(void *)x, kcd_size);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (-[OSACrashReport is_simulated](v44, "is_simulated")) {
            id v45 = "simulated";
          }
          else {
            id v45 = "fatal";
          }
          v46 = -[OSACrashReport proc_id](v44, "proc_id");
          id v47 = (void *)objc_claimAutoreleasedReturnValue(-[OSACrashReport procName](v44, "procName"));
          *(_DWORD *)atoken = 136446978;
          *(void *)&atoken[4] = v45;
          *(_WORD *)&atoken[12] = 2080;
          *(void *)&atoken[14] = "corpse";
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v46;
          *(_WORD *)&atoken[28] = 2114;
          *(void *)&atoken[30] = v47;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Formulating %{public}s 308 report for %s[%d] %{public}@",  atoken,  0x26u);
        }

        [v31 setObject:v44 forKeyedSubscript:@"OSACrashReport"];
        mach_vm_deallocate(mach_task_self_, *(mach_vm_address_t *)x, kcd_size);
      }

      else
      {
        v34 = v55;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v53 = mach_error_string(v42);
          *(_DWORD *)atoken = 67109378;
          *(_DWORD *)&atoken[4] = v42;
          *(_WORD *)&atoken[8] = 2080;
          *(void *)&atoken[10] = v53;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "unable to map kcdata object 0x%x (%s)",  atoken,  0x12u);
        }
      }
    }

    else
    {
      v34 = v55;
      v35 = v31;
    }

    objc_autoreleasePoolPop(v34);
    goto LABEL_82;
  }

  a1 = task_port;
  x[0] = -1;
  if (!task_port)
  {
    uint64_t v24 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)atoken = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Too many events in rapid succession! (pid unavailable for lw-corpse)",  atoken,  2u);
      uint64_t v24 = 0LL;
    }

    goto LABEL_82;
  }

  uint64_t v24 = 0LL;
LABEL_45:
  unsigned int v38 = pid_for_task(a1, x);
  id v39 = x[0];
  v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v38 || v39 == -1)
  {
    if (v40)
    {
      *(_DWORD *)atoken = 67109120;
      *(_DWORD *)&atoken[4] = v38;
      v41 = "Too many events in rapid succession! (pid retrieval failed: %d)";
      goto LABEL_51;
    }
  }

  else if (v40)
  {
    *(_DWORD *)atoken = 67109120;
    *(_DWORD *)&atoken[4] = x[0];
    v41 = "Too many events in rapid succession! pid %d";
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v41, atoken, 8u);
  }

LABEL_82:
  if (a2 && task_port) {
    mach_port_deallocate(mach_task_self_, task_port);
  }
  return v24;
}

void sub_10001C944(id a1)
{
  uint64_t v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.osanalytics");
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned int v2 = [v1 appleInternal];
  if (v2) {
    LOBYTE(v2) = -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", @"PersistLWCorpse");
  }
  byte_10003EFE0 = v2;
}

uint64_t sub_10001C9BC( uint64_t a1, uint64_t a2, mach_port_t a3, int a4, uint64_t *a5, unsigned int a6, unsigned int *a7, uint64_t a8, unsigned int a9, uint64_t a10, int *a11, _OWORD *a12)
{
  BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v19) {
    sub_100021D20(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  unsigned int v27 = *a7;
  __int128 v28 = a12[1];
  v33[0] = *a12;
  v33[1] = v28;
  uint64_t v29 = sub_10001C0C0(a3, 0, a2, -1LL, 0, a4, a5, a6, v27, a8, a9, v33);
  if (!(_DWORD)v29)
  {
    if (*a11 == a9)
    {
      unsigned int v30 = a9;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100021C94(a11, a9);
      }
      unsigned int v30 = *a11;
    }

    if (v30 >= a9) {
      unsigned int v30 = a9;
    }
    *a11 = v30;
    if (v30)
    {
      unint64_t v31 = 0LL;
      do
      {
        *(_DWORD *)(a10 + 4 * v31) = *(_DWORD *)(a8 + 4 * v31);
        ++v31;
      }

      while (v31 < *a11);
    }

    mach_port_deallocate(mach_task_self_, a2);
    mach_port_deallocate(mach_task_self_, a3);
  }

  return v29;
}

uint64_t sub_10001CB1C( uint64_t a1, uint64_t a2, task_id_token_t a3, int a4, uint64_t *a5, unsigned int a6, _OWORD *a7)
{
  BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v13) {
    sub_100021D54(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  __int128 v21 = a7[1];
  v24[0] = *a7;
  v24[1] = v21;
  uint64_t v22 = sub_10001C0C0(0, a3, 0LL, a2, 0, a4, a5, a6, 1u, 0LL, 0, v24);
  if (!(_DWORD)v22) {
    mach_port_deallocate(mach_task_self_, a3);
  }
  return v22;
}

uint64_t sub_10001CBE4(uint64_t a1, mach_port_name_t a2, int a3, uint64_t *a4, unsigned int a5, _OWORD *a6)
{
  BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v11) {
    sub_100021D88(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  __int128 v19 = a6[1];
  v22[0] = *a6;
  v22[1] = v19;
  uint64_t v20 = sub_10001C0C0(0, 0, 0LL, -1LL, a2, a3, a4, a5, 1u, 0LL, 0, v22);
  if (!(_DWORD)v20) {
    mach_port_deallocate(mach_task_self_, a2);
  }
  return v20;
}

BOOL sub_10001CCA8(const char *a1)
{
  kern_return_t v11;
  kern_return_t v12;
  if (!strcmp(a1, "agent"))
  {
    uint64_t v10 = "com.apple.ReportCrash";
  }

  else
  {
    if (strcmp(a1, "daemon"))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100021E40(result, v3, v4, v5, v6, v7, v8, v9);
        return 0LL;
      }

      return result;
    }

    uint64_t v10 = "com.apple.ReportCrash.DirectoryService";
  }

  BOOL v11 = bootstrap_check_in(bootstrap_port, v10, (mach_port_t *)&dword_10003EFD8);
  if (!v11) {
    return 1LL;
  }
  uint64_t v12 = v11;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100021DBC(v12);
  }
  BOOL result = 0LL;
  dword_10003EFD8 = 0;
  return result;
}

void start(int a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (a1 == 2) {
      uint64_t v4 = *(const char **)(a2 + 8);
    }
    else {
      uint64_t v4 = "unsupported";
    }
    mach_port_t buf = 136446210;
    uint64_t v36 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ReportCrash (unified) launched in %{public}s mode",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v5 = objc_autoreleasePoolPush();
  if (a1 == 2 && sub_10001CCA8(*(const char **)(a2 + 8)))
  {
    CRCreateDirectoryStructure();
    uint64_t v6 = getpid();
    proc_disable_cpumon(v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[OSAReport bootArgs](&OBJC_CLASS___OSAReport, "bootArgs"));
    if (([v7 containsString:@"-restore"] & 1) != 0
      || [v7 containsString:@"-upgrade"])
    {
      uint64_t v8 = (void *)qword_10003EFC0;
      qword_10003EFC0 = (uint64_t)@"/private/var/logs/ramrod";

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v9 = [&off_1000386F0 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v9) {
        goto LABEL_25;
      }
      id v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(&off_1000386F0);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          LODWORD(v13) = [v14 fileExistsAtPath:v13];

          if ((_DWORD)v13)
          {
            uint64_t v16 = (void *)qword_10003EFC0;
            qword_10003EFC0 = (uint64_t)@"/private/var/logs/restored";

            goto LABEL_25;
          }
        }

        id v10 = [&off_1000386F0 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v10);
LABEL_25:
      if (!IOMainPort(bootstrap_port, &buf))
      {
        io_registry_entry_t v17 = IORegistryEntryFromPath(buf, "IODeviceTree:/options");
        if (v17)
        {
          io_object_t v18 = v17;
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v17, @"ota-uuid", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            uint64_t v20 = (void *)CFProperty;
            CFTypeID v21 = CFGetTypeID(CFProperty);
            if (v21 == CFDataGetTypeID())
            {
              id v22 = [v20 mutableCopy];
              [v22 appendBytes:&unk_100026510 length:1];
              uint64_t v23 = (void *)qword_10003EFC8;
              qword_10003EFC8 = (uint64_t)v22;
            }

            CFRelease(v20);
          }

          IOObjectRelease(v18);
        }
      }
    }

    objc_autoreleasePoolPop(v5);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    else {
      int BoolValue = 0;
    }
    dword_10003EFDC = BoolValue;

    if (dword_10003EFDC && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SingleShot mode, will exit immediately after handling one exception",  (uint8_t *)&buf,  2u);
    }

    uint64_t v26 = objc_alloc_init(&OBJC_CLASS___RCEventTracker);
    unsigned int v27 = (void *)qword_10003EFD0;
    qword_10003EFD0 = (uint64_t)v26;

    if (sub_10001BB2C())
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v28 run];

      int v15 = 0;
LABEL_21:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ReportCrash is exiting",  (uint8_t *)&buf,  2u);
      }

      exit(v15);
    }
  }

  else
  {
    objc_autoreleasePoolPop(v5);
  }

  int v15 = 1;
  goto LABEL_21;
}

NSMutableDictionary *sub_10001D130(uint64_t a1)
{
  unsigned int v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 32),  @"process");
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = &off_1000384E0;
  }
  else {
    uint64_t v3 = &off_1000384F8;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"logwritten");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 48),  @"incidentID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 56),  @"bundleID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 64),  @"appVersion");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) bundleVersion]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, @"bundleVersion");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 80),  @"exceptionCodes");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 88),  @"terminationReasonExceptionCode");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 96),  @"terminationReasonNamespace");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 104),  @"coalitionName");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 112),  @"logWritingSignature");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  LODWORD(v4) = [v5 isComputeController];

  if ((_DWORD)v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"isComputeController");
  }
  return v2;
}

id sub_10001D2A8(void *a1)
{
  v8[0] = a1[4];
  v7[0] = @"process";
  v7[1] = @"exceptionAddress";
  unsigned int v2 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%llx",  a1[6],  @"process",  @"exceptionAddress");
  v8[1] = v2;
  v7[2] = @"sharedCache";
  uint64_t v3 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%llx", a1[7]);
  v7[3] = @"exceptionDescription";
  uint64_t v4 = a1[5];
  v8[2] = v3;
  void v8[3] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));

  return v5;
}

void sub_10001D3B0(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.osanalytics.urgentSubmissions", 0LL);
  unsigned int v2 = (void *)qword_10003EFF0;
  qword_10003EFF0 = (uint64_t)v1;
}

void sub_10001D3DC(id a1)
{
  dispatch_queue_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue([v1 internalKey]);

  v10[0] = @"mode";
  v10[1] = @"event";
  v11[0] = @"urgent";
  v11[1] = @"urgentCrash";
  v10[2] = @"legacy-homePath";
  uint64_t v3 = NSHomeDirectory();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 stringByStandardizingPath]);
  uint64_t v6 = (void *)v5;
  void v10[3] = @"legacy-internalKey";
  uint64_t v7 = &stru_100031928;
  if (v2) {
    uint64_t v7 = v2;
  }
  v11[2] = v5;
  v11[3] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));

  if (objc_opt_class(&OBJC_CLASS___OSASubmissionClient))
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___OSASubmissionClient);
    [v9 submitWithOptions:v8 resultsCallback:&stru_1000313B8];
  }
}

void sub_10001D524(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.osanalytics.stabilityMonitorReply", 0LL);
  unsigned int v2 = (void *)qword_10003F000;
  qword_10003F000 = (uint64_t)v1;
}

void sub_10001D550(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = OSAStabilityMonitorLogDomain();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Skipping alerting because rollback was recommended.",  v5,  2u);
    }
  }

  else
  {
    uint64_t v4 = *(void **)(a1 + 48);
    if (!v4) {
      uint64_t v4 = *(void **)(a1 + 56);
    }
    [v4 length];
  }

id sub_10001D5D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v1 = *(void **)(a1 + 40);
  v6[0] = @"process";
  v6[1] = @"image";
  v7[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 faultingImage]);
  v7[1] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

  ;
}

uint64_t sub_10001D684(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_10001D6B8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }

  unsigned int v5 = *(_DWORD *)(result + 64);
  if (v5 <= 2 && v5 <= (v4 - 68) >> 3 && (_DWORD)v4 == 8 * v5 + 68)
  {
    uint64_t v6 = (_DWORD *)(((v4 + 3) & 0x1FFFFFFFCLL) + result);
    if (!*v6 && v6[1] > 0x1Fu)
    {
      BOOL result = sub_10001C060();
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }

    int v3 = -309;
  }

  else
  {
LABEL_2:
    int v3 = -304;
  }

LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10001D7CC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  uint64_t v3 = result[1];
  BOOL v4 = v3 < 0x30 || v3 > 0x1480;
  if (v4
    || (unsigned int v5 = result[9], v5 > 2)
    || ((unsigned int v6 = 2 * v5, v5 <= (v3 - 48) >> 3) ? (v7 = v3 >= 8 * v5 + 48) : (v7 = 0),
        !v7
     || (uint64_t v8 = &result[v6], v9 = v8[11], v9 > 0x510)
     || ((v10 = v3 - v6 * 4, v9 <= (v10 - 48) >> 2) ? (BOOL v11 = v10 == 4 * v9 + 48) : (BOOL v11 = 0), !v11)))
  {
LABEL_17:
    int v12 = -304;
LABEL_18:
    *(_DWORD *)(a2 + 32) = v12;
    NDR_record_t v13 = NDR_record;
    goto LABEL_19;
  }

  uint64_t v14 = (_DWORD *)((char *)result + ((v3 + 3) & 0x1FFFFFFFCLL));
  if (*v14 || v14[1] <= 0x1Fu)
  {
    int v12 = -309;
    goto LABEL_18;
  }

  *(_DWORD *)(a2 + 40) = 1296;
  int v15 = v8 + 10;
  BOOL result = (_DWORD *)sub_10001C090();
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v13 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v15;
    *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
    return result;
  }

uint64_t sub_10001D920(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }

  unsigned int v7 = *(_DWORD *)(result + 64);
  if (v7 > 2) {
    goto LABEL_2;
  }
  int v3 = -304;
  unsigned int v8 = 8 * v7;
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(v9 + 72);
  if (v10 > 0x510 || (int v11 = v5 - v8, v10 > (v11 - 76) >> 2) || v11 != 4 * v10 + 76)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_4;
  }

  uint64_t v12 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v12 || *(_DWORD *)(v12 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }

  uint64_t v13 = v9 - 16;
  *(_DWORD *)(a2 + 40) = 1296;
  uint64_t v14 = *(unsigned int *)(result + 12);
  uint64_t v15 = *(unsigned int *)(result + 28);
  mach_port_t v16 = *(_DWORD *)(result + 40);
  int v17 = *(_DWORD *)(result + 60);
  io_object_t v18 = (_DWORD *)(v13 + 84);
  __int128 v19 = *(_OWORD *)(v12 + 36);
  v20[0] = *(_OWORD *)(v12 + 20);
  v20[1] = v19;
  BOOL result = sub_10001C9BC( v14,  v15,  v16,  v17,  (uint64_t *)(result + 68),  v7,  (unsigned int *)(v13 + 84),  v13 + 92,  v10,  a2 + 44,  (int *)(a2 + 40),  v20);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v18;
    *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
    return result;
  }

LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_10001DAC8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }

  unsigned int v5 = *(_DWORD *)(result + 60);
  if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && (_DWORD)v4 == 8 * v5 + 64)
  {
    uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
    if (!*(_DWORD *)v6 && *(_DWORD *)(v6 + 4) > 0x1Fu)
    {
      uint64_t v7 = *(unsigned int *)(result + 12);
      uint64_t v8 = *(void *)(result + 48);
      task_id_token_t v9 = *(_DWORD *)(result + 28);
      int v10 = *(_DWORD *)(result + 56);
      __int128 v11 = *(_OWORD *)(v6 + 36);
      v12[0] = *(_OWORD *)(v6 + 20);
      v12[1] = v11;
      BOOL result = sub_10001CB1C(v7, v8, v9, v10, (uint64_t *)(result + 64), v5, v12);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }

    int v3 = -309;
  }

  else
  {
LABEL_2:
    int v3 = -304;
  }

uint64_t sub_10001DBCC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }

  unsigned int v5 = *(_DWORD *)(result + 52);
  if (v5 <= 2 && v5 <= (v4 - 56) >> 3 && (_DWORD)v4 == 8 * v5 + 56)
  {
    uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
    if (!*(_DWORD *)v6 && *(_DWORD *)(v6 + 4) > 0x1Fu)
    {
      uint64_t v7 = *(unsigned int *)(result + 12);
      mach_port_name_t v8 = *(_DWORD *)(result + 28);
      int v9 = *(_DWORD *)(result + 48);
      __int128 v10 = *(_OWORD *)(v6 + 36);
      v11[0] = *(_OWORD *)(v6 + 20);
      v11[1] = v10;
      BOOL result = sub_10001CBE4(v7, v8, v9, (uint64_t *)(result + 56), v5, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }

    int v3 = -309;
  }

  else
  {
LABEL_2:
    int v3 = -304;
  }

uint64_t sub_10001DCCC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 48) || *(_DWORD *)(result + 52) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  BOOL result = sub_10001BE80( *(unsigned int *)(result + 12),  *(void *)(result + 32),  *(void *)(result + 40),  (uint64_t *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

LABEL_8:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_10001DD84(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(&a9, 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2412) >= 0xFFFFFFF9
    && (unsigned int v5 = (void (*)(void))*(&off_100031448 + 5 * (v4 - 2405) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t sub_10001DE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v18, *(void *)(a3 + 40));
    String.hash(into:)(v18, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      __int128 v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1LL;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
      {
        while (1)
        {
          mach_port_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

id sub_10001DFBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppGroup();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of GenerativeModelsState.currentState()
{
  return 0LL;
}

void *variable initialization expression of GenerativeModelsState.reasons()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t type metadata accessor for AppGroup()
{
  return objc_opt_self(&OBJC_CLASS____TtC11ReportCrash8AppGroup);
}

uint64_t GenerativeModelsState.currentState.getter()
{
  int v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
  swift_beginAccess(v0 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState, v4, 0LL, 0LL);
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t GenerativeModelsState.currentState.setter(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = (void *)(v2 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
  swift_beginAccess(v5, v8, 1LL, 0LL);
  uint64_t v6 = v5[1];
  *unsigned int v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

void *GenerativeModelsState.currentState.modify(uint64_t a1)
{
  return &j__swift_endAccess;
}

uint64_t GenerativeModelsState.reasons.getter()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
  swift_beginAccess(v0 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons, v3, 0LL, 0LL);
  return swift_bridgeObjectRetain(*v1);
}

uint64_t GenerativeModelsState.reasons.setter(uint64_t a1)
{
  int v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
  swift_beginAccess(v3, v6, 1LL, 0LL);
  uint64_t v4 = *v3;
  uint64_t *v3 = a1;
  return swift_bridgeObjectRelease(v4);
}

void *GenerativeModelsState.reasons.modify(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

id static GenerativeModelsState.sharedInstance.getter()
{
  if (qword_10003ED00 != -1) {
    swift_once(&qword_10003ED00, sub_10001F0F0);
  }
  return (id)qword_10003ED38;
}

id GenerativeModelsState.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id GenerativeModelsState.init()()
{
  uint64_t v1 = sub_10001F11C(&qword_10003ED50);
  __chkstk_darwin(v1);
  int v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = &v0[OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState];
  *(void *)uint64_t v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons] = &_swiftEmptyArrayStorage;
  unsigned int v5 = (objc_class *)type metadata accessor for GenerativeModelsState();
  v12.receiver = v0;
  v12.super_class = v5;
  id v6 = objc_msgSendSuper2(&v12, "init");
  sub_10001E3AC();
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v3, 1LL, 1LL, v7);
  uint64_t v8 = swift_allocObject(&unk_100031628, 24LL, 7LL);
  swift_unknownObjectWeakInit(v8 + 16, v6);
  uint64_t v9 = (void *)swift_allocObject(&unk_100031650, 40LL, 7LL);
  v9[2] = 0LL;
  void v9[3] = 0LL;
  v9[4] = v8;
  uint64_t v10 = sub_10001EDBC((uint64_t)v3, (uint64_t)&unk_10003ED60, (uint64_t)v9);

  swift_release(v10);
  return v6;
}

size_t sub_10001E3AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v63 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  objc_super v12 = (char *)&v63 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v15 = sub_10001F11C(&qword_10003EDD0);
  uint64_t v16 = swift_allocObject(v15, 64LL, 7LL);
  *(_OWORD *)(v16 + 16) = xmmword_100026530;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 32) = 0x7474616D79657267LL;
  *(void *)(v16 + 40) = 0xEA00000000007265LL;
  sub_100020030();
  BOOL v17 = (void *)NSSet.init(arrayLiteral:)(v16);
  io_object_t v18 = (void *)AnalyticsQueryValuesFor(arguments:)();

  xpc_type_t type = xpc_get_type(v18);
  uint64_t v20 = XPC_TYPE_DICTIONARY.getter();
  if (type != (xpc_type_t)v20)
  {
    uint64_t v21 = Logger.init()(v20);
    id v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "Analytics query xpc_object is not of type dictionary",  v24,  2u);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_11:
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    v34 = (char *)&_swiftEmptyArrayStorage;
LABEL_12:
    v35 = (uint64_t *)(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
    swift_beginAccess(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState, v68, 1LL, 0LL);
    uint64_t v36 = v35[1];
    uint64_t *v35 = v32;
    v35[1] = v33;
    swift_bridgeObjectRelease(v36);
    int v37 = (char **)(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
    swift_beginAccess(v37, v67, 1LL, 0LL);
    unsigned int v38 = *v37;
    *int v37 = v34;
    swift_unknownObjectRelease(v18);
    return swift_bridgeObjectRelease(v38);
  }

  xpc_object_t v25 = xpc_dictionary_get_dictionary(v18, "greymatter");
  if (!v25)
  {
LABEL_8:
    uint64_t v28 = Logger.init()(v25);
    char v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      __int128 v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)__int128 v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Failed to query generative models dictionary", v31, 2u);
      swift_slowDealloc(v31, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    goto LABEL_11;
  }

  uint64_t v26 = v25;
  xpc_type_t v27 = xpc_get_type(v25);
  if (v27 != (xpc_type_t)XPC_TYPE_DICTIONARY.getter())
  {
    xpc_object_t v25 = (xpc_object_t)swift_unknownObjectRelease(v26);
    goto LABEL_8;
  }

  string = xpc_dictionary_get_string(v26, "availability");
  v66 = v26;
  uint64_t v64 = v1;
  if (string)
  {
    uint64_t v32 = String.init(cString:)();
    uint64_t v33 = v41;
  }

  else
  {
    uint64_t v42 = ((uint64_t (*)(void))Logger.init())();
    v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      id v45 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "GM availability string not found", v45, 2u);
      v46 = v45;
      uint64_t v26 = v66;
      swift_slowDealloc(v46, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v2);
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
  }

  xpc_object_t v47 = xpc_dictionary_get_value(v26, "reasons");
  if (!v47) {
    goto LABEL_21;
  }
  id v48 = v47;
  xpc_type_t v49 = xpc_get_type(v47);
  if (v49 != (xpc_type_t)XPC_TYPE_ARRAY.getter())
  {
    xpc_object_t v47 = (xpc_object_t)swift_unknownObjectRelease(v48);
LABEL_21:
    uint64_t v50 = Logger.init()(v47);
    __int16 v51 = (os_log_s *)Logger.logObject.getter(v50);
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      __int16 v53 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)__int16 v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed to get reasons array", v53, 2u);
      double v54 = v53;
      uint64_t v26 = v66;
      swift_slowDealloc(v54, -1LL, -1LL);
    }

    swift_unknownObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
LABEL_24:
    v34 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v1 = v64;
    goto LABEL_12;
  }

  size_t result = xpc_array_get_count(v48);
  if ((result & 0x8000000000000000LL) == 0)
  {
    size_t v55 = result;
    if (result)
    {
      size_t v56 = 0LL;
      v34 = (char *)&_swiftEmptyArrayStorage;
      v65 = v48;
      do
      {
        if (xpc_array_get_string(v48, v56))
        {
          uint64_t v58 = String.init(cString:)();
          uint64_t v60 = v59;
          if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0) {
            v34 = sub_10001F324(0LL, *((void *)v34 + 2) + 1LL, 1, v34);
          }
          unint64_t v62 = *((void *)v34 + 2);
          unint64_t v61 = *((void *)v34 + 3);
          if (v62 >= v61 >> 1) {
            v34 = sub_10001F324((char *)(v61 > 1), v62 + 1, 1, v34);
          }
          *((void *)v34 + 2) = v62 + 1;
          v57 = &v34[16 * v62];
          *((void *)v57 + 4) = v58;
          *((void *)v57 + 5) = v60;
          id v48 = v65;
          uint64_t v26 = v66;
        }

        ++v56;
      }

      while (v55 != v56);
      swift_unknownObjectRelease(v26);
      swift_unknownObjectRelease(v48);
      uint64_t v1 = v64;
      goto LABEL_12;
    }

    swift_unknownObjectRelease(v26);
    swift_unknownObjectRelease(v48);
    goto LABEL_24;
  }

  __break(1u);
  return result;
}

uint64_t sub_10001E954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 4_Block_object_dispose(&a9, 8) = a4;
  return swift_task_switch(sub_10001E96C, 0LL, 0LL);
}

uint64_t sub_10001E96C()
{
  uint64_t v1 = *(void *)(v0 + 48) + 16LL;
  swift_beginAccess(v1, v0 + 16, 0LL, 0LL);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    if (&type metadata accessor for GenerativeModelsAvailability) {
      BOOL v3 = &type metadata for GenerativeModelsAvailability == 0LL;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3 && &nominal type descriptor for GenerativeModelsAvailability != 0LL)
    {
      uint64_t v5 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator(0LL);
      *(void *)(v0 + 64) = v5;
      uint64_t v6 = *(void *)(v5 - 8);
      *(void *)(v0 + 72) = v6;
      *(void *)(v0 + 80) = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v7 = type metadata accessor for GenerativeModelsAvailability(0LL);
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = type metadata accessor for GenerativeModelsAvailability.Parameters(0LL);
      uint64_t v11 = *(void *)(v10 - 8);
      uint64_t v12 = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)(&_swiftEmptyArrayStorage);
      static GenerativeModelsAvailability.current(parameters:)(v12);
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
      swift_task_dealloc(v12);
      uint64_t v13 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence(0LL);
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      GenerativeModelsAvailability.changes.getter();
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
      GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()(v16);
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v13);
      swift_task_dealloc(v15);
      swift_task_dealloc(v9);
      uint64_t v17 = sub_10001F11C(&qword_10003EDB8);
      uint64_t v18 = swift_task_alloc((*(void *)(*(void *)(v17 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
      *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = v18;
      unint64_t v19 = sub_10001FFAC();
      *(void *)(v0 + 96) = v19;
      uint64_t v20 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
      *(void *)(v0 + 104) = v20;
      void *v20 = v0;
      v20[1] = sub_10001EBB0;
      return dispatch thunk of AsyncIteratorProtocol.next()(v18, v5, v19);
    }
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001EBB0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 104));
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    BOOL v3 = sub_10001ECF8;
  }

  else
  {
    BOOL v3 = sub_10001EC14;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10001EC14()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = type metadata accessor for GenerativeModelsAvailability.Availability(0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(v1, 1LL, v2) == 1)
  {
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v4 = *(void **)(v0 + 56);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 72) + 8LL))(v3, *(void *)(v0 + 64));

    swift_task_dealloc(v1);
    swift_task_dealloc(v3);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    sub_10001E3AC();
    sub_10001FFF4(v1, &qword_10003EDB8);
    uint64_t v6 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(void *)(v0 + 120) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_10001ED58;
    return dispatch thunk of AsyncIteratorProtocol.next()( *(void *)(v0 + 88),  *(void *)(v0 + 64),  *(void *)(v0 + 96));
  }

uint64_t sub_10001ECF8()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 112);
  uint64_t v1 = sub_10001F11C(&qword_10003EDC8);
  uint64_t v2 = swift_dynamicCast(v1, v0 + 40, v1, &type metadata for Never, 7LL);
  return swift_willThrowTypedImpl(v2, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_10001ED58()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 120));
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    uint64_t v3 = sub_10001ECF8;
  }

  else
  {
    uint64_t v3 = sub_10001EC14;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10001EDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10001FFF4(a1, &qword_10003ED50);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_100031678, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10003EDB0, v16);
}

unint64_t sub_10001EF0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10001F11C(&qword_10003ED98);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001FED0(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_10001F430(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10001FE64(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id GenerativeModelsState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsState();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_10001F0F0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for GenerativeModelsState()) init];
  qword_10003ED38 = (uint64_t)result;
  return result;
}

uint64_t sub_10001F11C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for GenerativeModelsState()
{
  return objc_opt_self(&OBJC_CLASS____TtC11ReportCrash21GenerativeModelsState);
}

uint64_t sub_10001F17C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001F1A0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10001F1CC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_10003ED5C);
  *(void *)(v1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10001F22C;
  v3[6] = v2;
  return swift_task_switch(sub_10001E96C, 0LL, 0LL);
}

uint64_t sub_10001F22C()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001F274(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001F2D8;
  return v6(a1);
}

uint64_t sub_10001F2D8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_10001F324(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10001F11C(&qword_10003EDE0);
      char v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      BOOL v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      char v11 = (char *)&_swiftEmptyArrayStorage;
      BOOL v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10001FBEC(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

unint64_t sub_10001F430(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_10001F928(a1, a2, v5);
}

uint64_t sub_10001F494(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10001F11C(&qword_10003ED98);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              uint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v36 = -1LL << v33;
                }
                *(void *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

LABEL_24:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      id v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      xpc_object_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_10001FE64(v25, v38);
      }

      else
      {
        sub_10001FE94((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      uint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *uint64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_10001FE64(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

_OWORD *sub_10001F790(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10001F430(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        int64_t v19 = (void *)(v18[7] + 32 * v12);
        sub_10001FE74(v19);
        return sub_10001FE64(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001FA08();
      goto LABEL_7;
    }

    sub_10001F494(v15, a4 & 1);
    unint64_t v21 = sub_10001F430(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10001F8C0(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_10001F8C0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10001FE64(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_10001F928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

void *sub_10001FA08()
{
  uint64_t v1 = v0;
  sub_10001F11C(&qword_10003ED98);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }

  xpc_object_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10001FE94(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_10001FE64(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10001FBEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

unint64_t _s11ReportCrash21GenerativeModelsStateC17getGMAvailabilitySDySSypGyFZ_0()
{
  unint64_t v0 = sub_10001EF0C((uint64_t)&_swiftEmptyArrayStorage);
  if (qword_10003ED00 != -1) {
    swift_once(&qword_10003ED00, sub_10001F0F0);
  }
  uint64_t v1 = (uint64_t *)(qword_10003ED38 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
  swift_beginAccess(qword_10003ED38 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState, v13, 0LL, 0LL);
  uint64_t v2 = v1[1];
  if (v2)
  {
    uint64_t v3 = *v1;
    uint64_t v11 = &type metadata for String;
    *(void *)&__int128 v10 = v3;
    *((void *)&v10 + 1) = v2;
    sub_10001FE64(&v10, v9);
    swift_bridgeObjectRetain(v2);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v0);
    v12[0] = v0;
    sub_10001F790(v9, 0x6574617473LL, 0xE500000000000000LL, isUniquelyReferenced_nonNull_native);
    unint64_t v0 = v12[0];
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  unint64_t v5 = (uint64_t *)(qword_10003ED38 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
  swift_beginAccess(qword_10003ED38 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons, v12, 0LL, 0LL);
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16))
  {
    uint64_t v11 = (void *)sub_10001F11C(&qword_10003ED90);
    *(void *)&__int128 v10 = v6;
    sub_10001FE64(&v10, v9);
    swift_bridgeObjectRetain(v6);
    char v7 = swift_isUniquelyReferenced_nonNull_native(v0);
    sub_10001F790(v9, 0x736E6F73616572LL, 0xE700000000000000LL, v7);
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  return v0;
}

_OWORD *sub_10001FE64(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001FE74(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001FE94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001FED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001F11C(&qword_10003EDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001FF18()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10001FF3C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_10003EDAC);
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10001F22C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003EDA8 + dword_10003EDA8))(a1, v4);
}

unint64_t sub_10001FFAC()
{
  unint64_t result = qword_10003EDC0;
  if (!qword_10003EDC0)
  {
    uint64_t v1 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator(255LL);
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for GenerativeModelsAvailability.ChangeSequence.Iterator,  v1);
    atomic_store(result, (unint64_t *)&qword_10003EDC0);
  }

  return result;
}

uint64_t sub_10001FFF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001F11C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_100020030()
{
  unint64_t result = qword_10003EDD8;
  if (!qword_10003EDD8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSSet);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003EDD8);
  }

  return result;
}

uint64_t sub_100020074()
{
  uint64_t v0 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static DispatchQoS.unspecified.getter(v1);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = &_swiftEmptyArrayStorage;
  unint64_t v7 = sub_100021038();
  uint64_t v8 = sub_10001F11C(&qword_10003EE08);
  unint64_t v9 = sub_100021080();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v16, v8, v9, v4, v7);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void))(v13 + 104))( v12,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000002BLL,  0x800000010002EA90LL,  v3,  v6,  v12,  0LL);
  qword_10003EDE8 = result;
  return result;
}

uint64_t sub_1000201F0()
{
  id v1 = [v0 problemType];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  if (v5)
  {
    if (v3 == 3747891 && v5 == 0xE300000000000000LL)
    {
      swift_bridgeObjectRelease(v5);
    }

    else
    {
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, 3747891LL, 0xE300000000000000LL, 0LL);
      swift_bridgeObjectRelease(v5);
      uint64_t v5 = 0LL;
      if ((v7 & 1) == 0) {
        return v5;
      }
    }

    if (([(id)objc_opt_self(OSACrashReport) isInLDM] & 1) == 0)
    {
      id v8 = [v0 procName];
      if (!v8) {
        goto LABEL_25;
      }
      unint64_t v9 = v8;
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      if (v10 == 0xD000000000000018LL && v12 == 0x800000010002EB00LL)
      {
        swift_bridgeObjectRelease(0x800000010002EB00LL);
        return 1LL;
      }

      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, 0xD000000000000018LL, 0x800000010002EB00LL, 0LL);
      swift_bridgeObjectRelease(v12);
      if ((v13 & 1) == 0)
      {
LABEL_25:
        if ([v0 throttleTimeout] < 0xB
          || [v0 throttleTimeout] > 0x4AF
          || (NSString v14 = String._bridgeToObjectiveC()(),
              char v15 = OSARandomSelection(1000LL, v14),
              v14,
              (v15 & 1) == 0))
        {
          NSString v16 = String._bridgeToObjectiveC()();
          uint64_t v5 = OSARandomSelection(10LL, v16);

          return v5;
        }
      }
    }

    return 1LL;
  }

  return v5;
}

uint64_t sub_1000203F8()
{
  unsigned __int8 v14 = 0;
  if ((sub_1000201F0() & 1) == 0)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
    uint64_t v4 = 0LL;
LABEL_10:
    sub_10002089C((uint64_t)v3, (uint64_t)v4);
    return v2;
  }

  else {
    unint64_t v1 = 10LL;
  }
  if (qword_10003ED08 != -1) {
    swift_once(&qword_10003ED08, sub_100020074);
  }
  uint64_t v5 = (dispatch_queue_s *)qword_10003EDE8;
  uint64_t v4 = (void *)swift_allocObject(&unk_1000316A0, 40LL, 7LL);
  void v4[2] = v1;
  v4[3] = &v14;
  v4[4] = v0;
  uint64_t v6 = swift_allocObject(&unk_1000316C8, 32LL, 7LL);
  *(void *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = sub_1000208D0;
  *(void *)(v6 + 24) = v4;
  aBlock[4] = sub_1000208EC;
  uint64_t v13 = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10002084C;
  aBlock[3] = &unk_1000316E0;
  char v7 = _Block_copy(aBlock);
  uint64_t v8 = v13;
  id v9 = v0;
  swift_retain(v6);
  swift_release(v8);
  dispatch_sync(v5, v7);
  _Block_release(v7);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v6, "", 76LL, 41LL, 55LL, 1LL);
  uint64_t result = swift_release(v6);
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    uint64_t v3 = sub_1000208D0;
    uint64_t v2 = v14;
    goto LABEL_10;
  }

  __break(1u);
  return result;
}

void sub_1000205A8(unint64_t a1, _BYTE *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v10 = objc_allocWithZone(&OBJC_CLASS___OSADateCounter);
  NSString v11 = String._bridgeToObjectiveC()();
  id v26 = [v10 initWithIdentifier:v11];

  if ((unint64_t)[v26 count] >= a1)
  {
  }

  else
  {
    *a2 = 1;
    Logger.init()([v26 increment]);
    id v12 = a3;
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v25 = v6;
      char v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v24 = swift_slowAlloc(32LL, -1LL);
      uint64_t v28 = v24;
      *(_DWORD *)char v15 = 136446210;
      id v16 = [v12 procName];
      if (v16)
      {
        uint64_t v18 = v16;
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);
        unint64_t v21 = v20;

        uint64_t v27 = sub_100020934(v19, v21, &v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v15 + 4, v15 + 12);

        swift_bridgeObjectRelease(v21);
        _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Triggering urgent submission for process %{public}s",  v15,  0xCu);
        uint64_t v22 = v24;
        swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1LL, -1LL);
        swift_slowDealloc(v15, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
      }

      else
      {

        __break(1u);
      }
    }

    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }

uint64_t sub_10002084C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10002089C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_1000208AC()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_1000208D0()
{
}

uint64_t sub_1000208DC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000208EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002090C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002091C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100020924(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  _BYTE *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100020934(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100020A04(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001FE94((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001FE94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10001FE74(v12);
  return v7;
}

uint64_t sub_100020A04(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_100020BBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100020C50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100020E28(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100020E28(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_unknownObjectWeakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100020C50(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100020DC4(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100020DC4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10001F11C(&qword_10003EDF0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100020E28(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10001F11C(&qword_10003EDF0);
    NSString v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    NSString v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

unint64_t sub_100020F74(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0LL;
    swift_stdlib_random(&v3, 8LL);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0LL;
          swift_stdlib_random(&v3, 8LL);
        }

        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

unint64_t sub_100020FFC()
{
  unint64_t result = qword_10003EDF8;
  if (!qword_10003EDF8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003EDF8);
  }

  return result;
}

unint64_t sub_100021038()
{
  unint64_t result = qword_10003EE00;
  if (!qword_10003EE00)
  {
    uint64_t v1 = type metadata accessor for OS_dispatch_queue.Attributes(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10003EE00);
  }

  return result;
}

unint64_t sub_100021080()
{
  unint64_t result = qword_10003EE10;
  if (!qword_10003EE10)
  {
    uint64_t v1 = sub_1000210CC(&qword_10003EE08);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003EE10);
  }

  return result;
}

uint64_t sub_1000210CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

void sub_100021110(void *a1, unint64_t a2)
{
  unint64_t v3 = v2;
  if (a1)
  {
    if (a2 < (unint64_t)[a1 start])
    {
      __break(1u);
      goto LABEL_11;
    }

    id v5 = objc_msgSend(a1, "get_uuid");
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      int64_t v9 = v8;

      goto LABEL_8;
    }

    uint64_t v7 = 4144959LL;
  }

  else
  {
    uint64_t v7 = 4144959LL;
  }

  int64_t v9 = (void *)0xE300000000000000LL;
LABEL_8:
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 43LL;
  v11._object = (void *)0xE100000000000000LL;
  String.append(_:)(v11);
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for UInt64,  &protocol witness table for UInt64);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  id v14 = [v3 logWritingSignatureFrames];
  if (v14)
  {
    char v15 = v14;
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(0xE000000000000000LL);
    [v15 appendString:v16];

    return;
  }

void sub_1000212DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021350( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021384( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021400()
{
}

void sub_100021468()
{
}

void sub_1000214D0()
{
}

void sub_100021544()
{
}

void sub_1000215AC(uint8_t *a1, void *a2, void *a3)
{
  id v5 = [a2 unsignedLongLongValue];
  *(_DWORD *)a1 = 134217984;
  *a3 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Thread %llu has only exclave frames",  a1,  0xCu);
}

void sub_10002160C(int *a1, uint64_t a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109632;
  if ((v3 & 0xFFFFFFF0) == 0x20) {
    int v3 = 17;
  }
  v4[1] = v3;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unexpected kcdata item size for type 0x%x: %lu < %lu ",  (uint8_t *)v4,  0x1Cu);
}

void sub_1000216B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000216E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021718( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002174C()
{
}

void sub_1000217B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021828( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002185C(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 count];
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "found %d buildInfo items",  (uint8_t *)v1,  8u);
  sub_10001ABA0();
}

void sub_1000218D8()
{
}

void sub_100021940( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021974( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_1000219E4()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXSourceUtilities");
  return sub_100021A08(v0);
}

uint64_t sub_100021A08()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXCallStackThread");
  return sub_100021A2C(v0);
}

uint64_t sub_100021A2C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXCallStackFrame");
  return sub_100021A50(v0);
}

uint64_t sub_100021A50()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXMetaData");
  return sub_100021A74(v0);
}

uint64_t sub_100021A74()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXCallStackTree");
  return sub_100021A98(v0);
}

uint64_t sub_100021A98()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXCrashDiagnostic");
  return sub_100021ABC(v0);
}

uint64_t sub_100021ABC()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXReportCrashData");
  return sub_100021AE0(v0);
}

uint64_t sub_100021AE0()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXSourceManager");
  return sub_100021B04(v0);
}

uint64_t sub_100021B04()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXSignpostRecord");
  return sub_100021B28(v0);
}

uint64_t sub_100021B28()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "MXCrashDiagnosticObjectiveCExceptionReason");
  return sub_100021B4C(v0);
}

void sub_100021B4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021B80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021BB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021BE8(mach_error_t a1)
{
}

void sub_100021C6C()
{
  __assert_rtn("process_exception_identity", "ReportCrash.m", 615, "task == MACH_PORT_NULL");
}

void sub_100021C94(int *a1, int a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Mismatch between new state count %u and old state count %u",  (uint8_t *)v3,  0xEu);
}

void sub_100021D20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021D54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021D88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021DBC(kern_return_t a1)
{
}

void sub_100021E40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_Crash(void *a1, const char *a2, ...)
{
  return _[a1 Crash];
}

id objc_msgSend_OSAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 OSAnalytics];
}

id objc_msgSend_Stability(void *a1, const char *a2, ...)
{
  return _[a1 Stability];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__addASILine_fromOwner_isSafe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addASILine:fromOwner:isSafe:");
}

id objc_msgSend__copyStringFromTask_atAddress_maxLength_immutableCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyStringFromTask:atAddress:maxLength:immutableCheck:");
}

id objc_msgSend__extractBacktraceInfoUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractBacktraceInfoUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractBinaryImageInfoUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractBinaryImageInfoUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractCrashReporterAnnotationsFromSymbolOwner_withMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractCrashReporterAnnotationsFromSymbolOwner:withMemory:");
}

id objc_msgSend__extractExceptionReasonUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractExceptionReasonUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractInfoPlistFromSymbolOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractInfoPlistFromSymbolOwner:");
}

id objc_msgSend__extractLastExceptionBacktraceUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractLastExceptionBacktraceUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractMallocTraceInfo_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:");
}

id objc_msgSend__extractMemoryErrorReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractMemoryErrorReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractPGMLibpasReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractPGMLibpasReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractPGMReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractPGMReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractSanitizerReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractSanitizerReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractVMMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractVMMap:");
}

id objc_msgSend__extractWorkQueueLimitsFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractWorkQueueLimitsFromData:");
}

id objc_msgSend__findContainingRegion_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findContainingRegion:address:");
}

id objc_msgSend__findContainingTextSegmentRegion_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findContainingTextSegmentRegion:address:");
}

id objc_msgSend__findMallocZone_usingSymbolicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMallocZone:usingSymbolicator:");
}

id objc_msgSend__getObjCReadOnlyRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getObjCReadOnlyRange:");
}

id objc_msgSend__getSymbolicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSymbolicator:");
}

id objc_msgSend__isMTECrash(void *a1, const char *a2, ...)
{
  return _[a1 _isMTECrash];
}

id objc_msgSend__isPGMCrashType(void *a1, const char *a2, ...)
{
  return _[a1 _isPGMCrashType];
}

id objc_msgSend__objcSelectorAddressForMessenger_memory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objcSelectorAddressForMessenger:memory:");
}

id objc_msgSend__objcSelectorNameForMessenger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objcSelectorNameForMessenger:");
}

id objc_msgSend__readAddressFromMemory_atAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readAddressFromMemory:atAddress:");
}

id objc_msgSend__readAddressFromMemory_atSymbol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readAddressFromMemory:atSymbol:");
}

id objc_msgSend__readDataAtAddress_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readDataAtAddress:size:");
}

id objc_msgSend__readIndirectImmutableStringFromSymbol_symbolOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readIndirectImmutableStringFromSymbol:symbolOwner:");
}

id objc_msgSend__readMallocZoneArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readMallocZoneArray:");
}

id objc_msgSend__readMallocZoneArrayFromMemory_usingSymbolicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readMallocZoneArrayFromMemory:usingSymbolicator:");
}

id objc_msgSend__readStringAtTaskAddress_maxLength_immutableCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readStringAtTaskAddress:maxLength:immutableCheck:");
}

id objc_msgSend__regionAtAddress_immutableCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionAtAddress:immutableCheck:");
}

id objc_msgSend__regionInfoAtAddress_regionInfo_regionAddress_regionSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionInfoAtAddress:regionInfo:regionAddress:regionSize:");
}

id objc_msgSend__symbolicateRegister_inRange_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addImage_address_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImage:address:size:");
}

id objc_msgSend_addImageLegacy_address_size_name_path_arch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImageLegacy:address:size:name:path:arch:");
}

id objc_msgSend_addLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLines:");
}

id objc_msgSend_addLines_fromOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLines:fromOwner:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendNotesTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendNotesTo:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleInternal(void *a1, const char *a2, ...)
{
  return _[a1 appleInternal];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 automatedDeviceGroup];
}

id objc_msgSend_autopsyCorpse(void *a1, const char *a2, ...)
{
  return _[a1 autopsyCorpse];
}

id objc_msgSend_autopsyLightweightCorpse_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autopsyLightweightCorpse:size:");
}

id objc_msgSend_backtrace(void *a1, const char *a2, ...)
{
  return _[a1 backtrace];
}

id objc_msgSend_backtraceLength(void *a1, const char *a2, ...)
{
  return _[a1 backtraceLength];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_betaVersionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 betaVersionIdentifier];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootArgs(void *a1, const char *a2, ...)
{
  return _[a1 bootArgs];
}

id objc_msgSend_bootSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 bootSessionUUID];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_bundle_id(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundle_id");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_captureDiagInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureDiagInfo:");
}

id objc_msgSend_captureLSInfo(void *a1, const char *a2, ...)
{
  return _[a1 captureLSInfo];
}

id objc_msgSend_capture_time(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capture_time");
}

id objc_msgSend_characterSetWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithRange:");
}

id objc_msgSend_checkIfNeedsUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 checkIfNeedsUrgentSubmission];
}

id objc_msgSend_coalitionName(void *a1, const char *a2, ...)
{
  return _[a1 coalitionName];
}

id objc_msgSend_codeSigningMonitor(void *a1, const char *a2, ...)
{
  return _[a1 codeSigningMonitor];
}

id objc_msgSend_codeZeroForGuardException(void *a1, const char *a2, ...)
{
  return _[a1 codeZeroForGuardException];
}

id objc_msgSend_commonFieldsForBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonFieldsForBody:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compose:");
}

id objc_msgSend_composeFrame_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composeFrame:info:");
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _[a1 condition];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crashReporterKey(void *a1, const char *a2, ...)
{
  return _[a1 crashReporterKey];
}

id objc_msgSend_crashingAddress(void *a1, const char *a2, ...)
{
  return _[a1 crashingAddress];
}

id objc_msgSend_create_os_fault_section(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "create_os_fault_section");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decode_cpuType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_cpuType");
}

id objc_msgSend_decode_crashingThreadStateWithSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_crashingThreadStateWithSymbolicator:usingCatalog:");
}

id objc_msgSend_decode_esr_exceptionStateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_esr:exceptionStateCount:");
}

id objc_msgSend_decode_exceptionCodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_exceptionCodes");
}

id objc_msgSend_decode_exceptionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_exceptionType");
}

id objc_msgSend_decode_os_log_fault_payload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_os_log_fault_payload");
}

id objc_msgSend_decode_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reason");
}

id objc_msgSend_decode_reasonBTC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonBTC");
}

id objc_msgSend_decode_reasonBacklightServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonBacklightServices");
}

id objc_msgSend_decode_reasonCarousel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonCarousel");
}

id objc_msgSend_decode_reasonCodeSigning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonCodeSigning");
}

id objc_msgSend_decode_reasonCoreAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonCoreAnimation");
}

id objc_msgSend_decode_reasonDyldWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonDyldWithInfo:");
}

id objc_msgSend_decode_reasonExec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonExec");
}

id objc_msgSend_decode_reasonLibSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonLibSystem");
}

id objc_msgSend_decode_reasonLibxpc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonLibxpc");
}

id objc_msgSend_decode_reasonMetal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonMetal");
}

id objc_msgSend_decode_reasonNamespace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonNamespace");
}

id objc_msgSend_decode_reasonPortSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonPortSpace");
}

id objc_msgSend_decode_reasonSandbox(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonSandbox");
}

id objc_msgSend_decode_reasonTcc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonTcc");
}

id objc_msgSend_decode_reasonWatchKit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonWatchKit");
}

id objc_msgSend_decode_reasonWatchdog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonWatchdog");
}

id objc_msgSend_decode_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_signal");
}

id objc_msgSend_decode_threadState_threadStateCount_threadStateFlavor_threadPort_exceptionState_exceptionStateCount_withSymbolicator_usingCatalog_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbo licator:usingCatalog:");
}

id objc_msgSend_decode_threadState_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_threadState:withSymbolicator:usingCatalog:");
}

id objc_msgSend_decode_ubsanCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_ubsanCode:");
}

id objc_msgSend_decode_versionCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_versionCodes:");
}

id objc_msgSend_decrement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decrement:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProvider(void *a1, const char *a2, ...)
{
  return _[a1 defaultProvider];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return _[a1 deploymentId];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionForRegionTotalsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForRegionTotalsWithOptions:");
}

id objc_msgSend_descriptionOfRegionsAroundAddress_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOfRegionsAroundAddress:options:");
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return _[a1 developerType];
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifierForVendor];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithValuesForKeys:");
}

id objc_msgSend_dispatchQueueNameForSerialNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueueNameForSerialNumber:");
}

id objc_msgSend_dispatchQueueSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueueSerialNumber];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return _[a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return _[a1 distributorInfo];
}

id objc_msgSend_donateToBiome(void *a1, const char *a2, ...)
{
  return _[a1 donateToBiome];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dumpProgramCounterBytes(void *a1, const char *a2, ...)
{
  return _[a1 dumpProgramCounterBytes];
}

id objc_msgSend_enumerateSampledActiveExperimentsForEnvironment_correlationID_error_block_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSampledActiveExperimentsForEnvironment:correlationID:error:block:");
}

id objc_msgSend_enumerateSampledActiveRolloutsForCorrelationID_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSampledActiveRolloutsForCorrelationID:error:block:");
}

id objc_msgSend_etlKey(void *a1, const char *a2, ...)
{
  return _[a1 etlKey];
}

id objc_msgSend_exceptionType(void *a1, const char *a2, ...)
{
  return _[a1 exceptionType];
}

id objc_msgSend_executeWithTimeout_Code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithTimeout:Code:");
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return _[a1 experimentId];
}

id objc_msgSend_extractArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractArguments:");
}

id objc_msgSend_extractThreadStateInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractThreadStateInfo:");
}

id objc_msgSend_factorPackIds(void *a1, const char *a2, ...)
{
  return _[a1 factorPackIds];
}

id objc_msgSend_faultingImage(void *a1, const char *a2, ...)
{
  return _[a1 faultingImage];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_filterOutSensitiveStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterOutSensitiveStrings:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findBundleAtPath_withKeys_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBundleAtPath:withKeys:bundleURL:");
}

id objc_msgSend_finishExtractionUsingCorpse(void *a1, const char *a2, ...)
{
  return _[a1 finishExtractionUsingCorpse];
}

id objc_msgSend_formatString(void *a1, const char *a2, ...)
{
  return _[a1 formatString];
}

id objc_msgSend_formatStringOriginatingModulePath(void *a1, const char *a2, ...)
{
  return _[a1 formatStringOriginatingModulePath];
}

id objc_msgSend_getFramesForThread_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFramesForThread:usingCatalog:");
}

id objc_msgSend_getGMAvailability(void *a1, const char *a2, ...)
{
  return _[a1 getGMAvailability];
}

id objc_msgSend_getNotificationInfo(void *a1, const char *a2, ...)
{
  return _[a1 getNotificationInfo];
}

id objc_msgSend_getObserverInfo(void *a1, const char *a2, ...)
{
  return _[a1 getObserverInfo];
}

id objc_msgSend_getSignpostDataforPid_forClient_andEventTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSignpostDataforPid:forClient:andEventTimestamp:");
}

id objc_msgSend_getSyslogForPids_andOptionalSenders_additionalPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSyslogForPids:andOptionalSenders:additionalPredicates:");
}

id objc_msgSend_getTaskingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTaskingKey:");
}

id objc_msgSend_getTrialCache(void *a1, const char *a2, ...)
{
  return _[a1 getTrialCache];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadata];
}

id objc_msgSend_incidentID(void *a1, const char *a2, ...)
{
  return _[a1 incidentID];
}

id objc_msgSend_increment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "increment:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initPayloadDataWithDiagnostics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPayloadDataWithDiagnostics:");
}

id objc_msgSend_initWithBinaryName_binaryUUID_address_binaryOffset_sampleCount_withDepth_subFrameArray_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBinaryName:binaryUUID:address:binaryOffset:sampleCount:withDepth:subFrameArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCode_namespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:namespaceName:");
}

id objc_msgSend_initWithCodes_type_signal_subtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCodes:type:signal:subtype:");
}

id objc_msgSend_initWithComposedMessage_formatString_arguments_type_className_exceptionName_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithComposedMessage:formatString:arguments:type:className:exceptionName:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIncidentID_processName_bundleID_appVersion_bundleVersion_exception_terminationReason_responsibleApp_coalitionName_isFirstParty_isBeta_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:c oalitionName:isFirstParty:isBeta:");
}

id objc_msgSend_initWithMetaData_applicationVersion_signpostData_pid_terminationReason_applicationSpecificInfo_virtualMemoryRegionInfo_exceptionType_exceptionCode_exceptionReason_signal_stackTrace_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithMetaData:applicationVersion:signpostData:pid:terminationReason:applicationSpecificInfo:virtualMemoryR egionInfo:exceptionType:exceptionCode:exceptionReason:signal:stackTrace:");
}

id objc_msgSend_initWithPID_task_processName_is64Bit_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPID:task:processName:is64Bit:options:");
}

id objc_msgSend_initWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:");
}

id objc_msgSend_initWithRegionFormat_osVersion_deviceType_appBuildVersion_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:bundleID:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTask_exceptionType_thread_threadId_threadStateFlavor_threadState_threadStateCount_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:exceptionType:thread:threadId:threadStateFlavor:threadState:threadStateCount:");
}

id objc_msgSend_initWithTask_pid_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:pid:options:");
}

id objc_msgSend_initWithThreadArray_aggregatedByProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithThreadArray:aggregatedByProcess:");
}

id objc_msgSend_initWithTopCallStackFrames_isAttributedThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopCallStackFrames:isAttributedThread:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_internalKey(void *a1, const char *a2, ...)
{
  return _[a1 internalKey];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isComputeController(void *a1, const char *a2, ...)
{
  return _[a1 isComputeController];
}

id objc_msgSend_isComputeNode(void *a1, const char *a2, ...)
{
  return _[a1 isComputeNode];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExceptionNonFatal(void *a1, const char *a2, ...)
{
  return _[a1 isExceptionNonFatal];
}

id objc_msgSend_isInLDM(void *a1, const char *a2, ...)
{
  return _[a1 isInLDM];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMetricKitClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMetricKitClient:");
}

id objc_msgSend_is_simulated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "is_simulated");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadBuildInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadBuildInfo:");
}

id objc_msgSend_loadBundleInfo(void *a1, const char *a2, ...)
{
  return _[a1 loadBundleInfo];
}

id objc_msgSend_loadStoreInfo_atURL_forPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadStoreInfo:atURL:forPlatform:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockWhenCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWhenCondition:");
}

id objc_msgSend_logWritingSignature(void *a1, const char *a2, ...)
{
  return _[a1 logWritingSignature];
}

id objc_msgSend_logWritingSignatureFrames(void *a1, const char *a2, ...)
{
  return _[a1 logWritingSignatureFrames];
}

id objc_msgSend_logfile(void *a1, const char *a2, ...)
{
  return _[a1 logfile];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_modelCode(void *a1, const char *a2, ...)
{
  return _[a1 modelCode];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameFromPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameFromPid:");
}

id objc_msgSend_needsUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 needsUrgentSubmission];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldLogFile(void *a1, const char *a2, ...)
{
  return _[a1 oldLogFile];
}

id objc_msgSend_optIn3rdParty(void *a1, const char *a2, ...)
{
  return _[a1 optIn3rdParty];
}

id objc_msgSend_osTrain(void *a1, const char *a2, ...)
{
  return _[a1 osTrain];
}

id objc_msgSend_parentBundleURLForAppExtensionBundleURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentBundleURLForAppExtensionBundleURL:error:");
}

id objc_msgSend_parse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parse:");
}

id objc_msgSend_parseCorpse_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseCorpse:size:");
}

id objc_msgSend_parseKCdata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseKCdata:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_problemType(void *a1, const char *a2, ...)
{
  return _[a1 problemType];
}

id objc_msgSend_procName(void *a1, const char *a2, ...)
{
  return _[a1 procName];
}

id objc_msgSend_proc_id(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proc_id");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_productNameVersionBuildString(void *a1, const char *a2, ...)
{
  return _[a1 productNameVersionBuildString];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _[a1 range];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_reduceToTwoSigFigures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reduceToTwoSigFigures:");
}

id objc_msgSend_regions(void *a1, const char *a2, ...)
{
  return _[a1 regions];
}

id objc_msgSend_releaseType(void *a1, const char *a2, ...)
{
  return _[a1 releaseType];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_reportUsedImagesFullInfoUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportUsedImagesFullInfoUsingBlock:");
}

id objc_msgSend_responsibleProc(void *a1, const char *a2, ...)
{
  return _[a1 responsibleProc];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rolloutId(void *a1, const char *a2, ...)
{
  return _[a1 rolloutId];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sRouteID(void *a1, const char *a2, ...)
{
  return _[a1 sRouteID];
}

id objc_msgSend_safe_encoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safe_encoder:");
}

id objc_msgSend_sampleAllThreadsOnce(void *a1, const char *a2, ...)
{
  return _[a1 sampleAllThreadsOnce];
}

id objc_msgSend_saveWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveWithOptions:");
}

id objc_msgSend_searchFrame_in_regions_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchFrame:in:regions:result:");
}

id objc_msgSend_searchFrame_in_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchFrame:in:result:");
}

id objc_msgSend_sendDiagnostic_forDate_andSourceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDiagnostic:forDate:andSourceID:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendToCoreAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sendToCoreAnalytics];
}

id objc_msgSend_sendToMetricKit(void *a1, const char *a2, ...)
{
  return _[a1 sendToMetricKit];
}

id objc_msgSend_setApplicationSpecificInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationSpecificInformation:");
}

id objc_msgSend_setBundleVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleVersion:");
}

id objc_msgSend_setFaultingImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaultingImage:");
}

id objc_msgSend_setIsBeta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBeta:");
}

id objc_msgSend_setLogWritingSignatureFrames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogWritingSignatureFrames:");
}

id objc_msgSend_setModulePathForImmutableMemoryPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModulePathForImmutableMemoryPointer:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPointerPointsToImmutableMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPointerPointsToImmutableMemory:");
}

id objc_msgSend_setReadCStringFromTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadCStringFromTarget:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setThreadId_withScId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadId:withScId:");
}

id objc_msgSend_setUrgentSubmission_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrgentSubmission:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedCacheAddress(void *a1, const char *a2, ...)
{
  return _[a1 sharedCacheAddress];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_short_vers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "short_vers");
}

id objc_msgSend_shouldEnableUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 shouldEnableUrgentSubmission];
}

id objc_msgSend_slice_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slice_uuid");
}

id objc_msgSend_sortByAddressAndSetInferredSizes(void *a1, const char *a2, ...)
{
  return _[a1 sortByAddressAndSetInferredSizes];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_stashStatus_note_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stashStatus:note:");
}

id objc_msgSend_storeCohortWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCohortWithError:");
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeItemIdentifier];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_submitWithOptions_resultsCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithOptions:resultsCallback:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_symbolInfo(void *a1, const char *a2, ...)
{
  return _[a1 symbolInfo];
}

id objc_msgSend_symbolicateFrame_adjusted_withSymbolicator_usingCatalog_andBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:");
}

id objc_msgSend_systemId(void *a1, const char *a2, ...)
{
  return _[a1 systemId];
}

id objc_msgSend_targetSharedCache_withSlide_atBaseAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetSharedCache:withSlide:atBaseAddress:");
}

id objc_msgSend_terminationReasonExceptionCode(void *a1, const char *a2, ...)
{
  return _[a1 terminationReasonExceptionCode];
}

id objc_msgSend_thread(void *a1, const char *a2, ...)
{
  return _[a1 thread];
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return _[a1 threadDictionary];
}

id objc_msgSend_threadIdToScId(void *a1, const char *a2, ...)
{
  return _[a1 threadIdToScId];
}

id objc_msgSend_threadNameForThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "threadNameForThread:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_total_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "total_count");
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return _[a1 treatmentId];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unpackExceptionCodes(void *a1, const char *a2, ...)
{
  return _[a1 unpackExceptionCodes];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateLogWritingSignatureWithSymbol_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLogWritingSignatureWithSymbol:address:");
}

id objc_msgSend_urgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 urgentSubmission];
}

id objc_msgSend_validKcdataItem_min_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validKcdataItem:min_size:");
}

id objc_msgSend_validateProcName(void *a1, const char *a2, ...)
{
  return _[a1 validateProcName];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_variantID(void *a1, const char *a2, ...)
{
  return _[a1 variantID];
}

id objc_msgSend_versionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 versionIdentifier];
}

id objc_msgSend_visibleName(void *a1, const char *a2, ...)
{
  return _[a1 visibleName];
}

id objc_msgSend_waitForAll(void *a1, const char *a2, ...)
{
  return _[a1 waitForAll];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}