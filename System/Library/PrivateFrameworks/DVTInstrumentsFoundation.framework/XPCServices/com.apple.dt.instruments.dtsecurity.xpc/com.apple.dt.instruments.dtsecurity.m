int main(int argc, const char **argv, const char **envp)
{
  os_log_s *v3;
  uint8_t v4[16];
  if (qword_100019610 != -1) {
    dispatch_once(&qword_100019610, &stru_100014920);
  }
  v3 = (os_log_s *)qword_100019618;
  if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "dtsecurity started.", v4, 2u);
  }

  xpc_main((xpc_connection_handler_t)sub_100002B7C);
}

id sub_100002B3C()
{
  if (qword_100019610 != -1) {
    dispatch_once(&qword_100019610, &stru_100014920);
  }
  return (id)qword_100019618;
}

void sub_100002B7C(void *a1)
{
  v1 = a1;
  if (qword_100019610 != -1) {
    dispatch_once(&qword_100019610, &stru_100014920);
  }
  v2 = (void *)qword_100019618;
  if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    *(_DWORD *)buf = 67109376;
    pid_t pid = xpc_connection_get_pid(v1);
    __int16 v12 = 2048;
    v13 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Peer connected (%d : %p)", buf, 0x12u);
  }

  v4 = (void *)xpc_connection_copy_entitlement_value(v1, "com.apple.private.dt.instrumentsxpc.allowed");
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100002D84;
    handler[3] = &unk_100014948;
    v6 = v1;
    v9 = v6;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
  }

  else
  {
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v7 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_ERROR)) {
      sub_10000E0DC(v7, v1);
    }
    xpc_connection_cancel(v1);
  }
}

void sub_100002D54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.Instruments", "dtsecurity");
  v2 = (void *)qword_100019618;
  qword_100019618 = (uint64_t)v1;
}

void sub_100002D84(uint64_t a1, void *a2)
{
  kern_return_t v51;
  os_log_s *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  void *v57;
  const char *v58;
  const char *v59;
  os_log_s *v60;
  unsigned int v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  int v65;
  const uint8_t *uuid;
  _BYTE *v67;
  uint64_t v68;
  uint64_t current;
  uint64_t v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  NSMutableDictionary *v75;
  uint64_t v76;
  DTCPUClusterInfo *v77;
  void *v78;
  id v79;
  uint64_t memory;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  os_log_s *v85;
  pid_t pid;
  unsigned int v87;
  const void *data;
  uint64_t v89;
  uint64_t v90;
  id v91;
  os_log_s *v92;
  uint64_t v93;
  const void *v94;
  void *v95;
  NSSet *v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  os_log_s *v101;
  unsigned __int8 v102;
  id v103;
  os_log_s *v104;
  int v105;
  int v106;
  uint64_t v107;
  DTCPUClusterInfo *v108;
  DTCPUClusterInfo *v109;
  DTCPUClusterInfo *v110;
  _xpc_connection_s *v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  os_log_s *v116;
  void *v117;
  id v118;
  const void *stackshot_buffer;
  unsigned int stackshot_size;
  const char *v121;
  _xpc_connection_s *v122;
  _xpc_connection_s *v123;
  int v124;
  int v125;
  xpc_object_t v126;
  xpc_object_t v127;
  id v128;
  mach_port_name_t name[2];
  __int16 v130;
  _xpc_connection_s *v131;
  __int16 v132;
  int v133;
  _BYTE buf[46];
  __int16 v135;
  const char *v136;
  __int16 v137;
  const char *v138;
  id v3 = a2;
  v4 = &selRef_targetWithPid_;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    __int16 v12 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v13 = v3;
    xpc_object_t reply = xpc_dictionary_create_reply(v13);
    string = xpc_dictionary_get_string(v13, "Message");
    if (!string)
    {
      if (qword_100019610 != -1) {
        dispatch_once(&qword_100019610, &stru_100014920);
      }
      v38 = (os_log_s *)qword_100019618;
      if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_ERROR)) {
        sub_10000E178(v38);
      }
      goto LABEL_106;
    }

    v16 = string;
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v17 = &selRef_targetWithPid_;
    v18 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = xpc_connection_get_pid(v12);
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v12;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Event from peer (%d : %p): %s", buf, 0x1Cu);
    }

    if (strcmp(v16, "task_for_pid"))
    {
      if (!strcmp(v16, "debug_xpc_process") && xpc_message_has_privileges(v12))
      {
        v20 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v13, "name"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        id archived_object = xpc_dictionary_get_archived_object(v13, "archived_dictionary", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(archived_object);
        uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray);
        id v26 = xpc_dictionary_get_archived_object(v13, "archived_array", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        id v29 = xpc_dictionary_get_archived_object(v13, "archived_options", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[DTXPCServiceController sharedInstance](&OBJC_CLASS___DTXPCServiceController, "sharedInstance"));
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_100004034;
        *(void *)&buf[24] = &unk_100014970;
        *(void *)&buf[32] = v12;
        [v31 registerClient:*(void *)&buf[32] forXPCService:v21 environment:v24 arguments:v27 options:v30 handler:buf];

        v17 = &selRef_targetWithPid_;
        int v32 = 0;
LABEL_100:
        v84 = v17[195];
        if (os_log_type_enabled((os_log_t)v84, OS_LOG_TYPE_INFO))
        {
          v85 = v84;
          pid_t pid = xpc_connection_get_pid(v12);
          name[0] = 67109632;
          name[1] = pid;
          v130 = 2048;
          v131 = v12;
          v132 = 1024;
          v133 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_INFO,  "Operation status (%d : %p): %d",  (uint8_t *)name,  0x18u);
        }

        if (reply)
        {
          xpc_dictionary_set_int64(reply, "status", v32);
          xpc_connection_send_message(v12, reply);
        }

LABEL_106:
        goto LABEL_107;
      }

      if (!strcmp(v16, "process_watcher_connect") && xpc_message_has_privileges(v12))
      {
        char v39 = xpc_dictionary_get_BOOL(v13, "track_expired");
        if (xpc_dictionary_get_BOOL(v13, "send_updates"))
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = sub_100004108;
          *(void *)&buf[24] = &unk_100014998;
          *(void *)&buf[32] = v12;
          v40 = objc_retainBlock(buf);
        }

        else
        {
          v40 = 0LL;
        }

        int v32 = sub_100007498((uint64_t)v12, v39, (uint64_t)v40);
        goto LABEL_99;
      }

      if (!strcmp(v16, "symbolicate_pid"))
      {
        int int64 = xpc_dictionary_get_int64(v13, "pid");
        char v49 = xpc_dictionary_get_BOOL(v13, "enable_dyld_notifications");
        v50 = (_BYTE *)sub_100007394((uint64_t)v12, int64, v49);
      }

      else
      {
        if (strcmp(v16, "deep_symbol_owner"))
        {
          if (!strcmp(v16, "process_watcher_copy_signatures"))
          {
            *(void *)buf = 0LL;
            name[0] = 0;
            int v32 = sub_1000075BC((uint64_t)v12, (uint64_t)buf, (uint64_t)name);
            if (!v32)
            {
              xpc_dictionary_set_data(reply, "signatures_data", *(const void **)buf, name[0]);
              if (*(void *)buf) {
                vm_deallocate(mach_task_self_, *(vm_address_t *)buf, name[0]);
              }
            }

            goto LABEL_100;
          }

          if (!strcmp(v16, "vfs_trace_paths") && xpc_message_has_privileges(v12))
          {
            if (sysctlbyname("vfs.generic.trace_paths", 0LL, 0LL, 0LL, 0LL))
            {
LABEL_39:
              int64_t v41 = *__error();
              int v32 = 5;
              goto LABEL_139;
            }

LABEL_138:
            int64_t v41 = 0LL;
            int v32 = 0;
LABEL_139:
            if (reply) {
              xpc_dictionary_set_int64(reply, "errno_status", v41);
            }
            goto LABEL_100;
          }

          if (!strcmp(v16, "ktrace_bless") && xpc_message_has_privileges(v12))
          {
            if (xpc_dictionary_get_BOOL(v13, "bless")) {
              v68 = xpc_connection_get_pid(v12);
            }
            else {
              v68 = 0xFFFFFFFFLL;
            }
            goto LABEL_138;
          }

          if (!strcmp(v16, "ktrace_machine_core_info") && xpc_message_has_privileges(v12))
          {
            current = ktrace_machine_create_current();
            if (!current)
            {
              v79 = 0LL;
              goto LABEL_182;
            }

            v70 = current;
            if ((ktrace_machine_cpu_type() & 0xFFFFFF) == 7)
            {
              v71 = ktrace_machine_physical_cpus(v70);
              v72 = ktrace_machine_max_cpus(v70);
              if (v72 <= v71)
              {
                v75 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                v79 = 0LL;
LABEL_178:

                goto LABEL_179;
              }

              v73 = v72;
              v74 = v72 / v71;
              v75 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              if (v74 < 2)
              {
                v79 = 0LL;
                v4 = &selRef_targetWithPid_;
                goto LABEL_178;
              }

              v123 = v12;
              v76 = 0LL;
              do
              {
                v77 = -[DTCPUClusterInfo initWithClusterID:flags:]( objc_alloc(&OBJC_CLASS___DTCPUClusterInfo),  "initWithClusterID:flags:",  v76 / v74,  (unint64_t)(v76 % v74 != 0) << 14);
                v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v76));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", v77, v78);

                v76 = (v76 + 1);
              }

              while ((_DWORD)v76 != v73);
              v79 = -[NSMutableDictionary copy](v75, "copy");
              __int16 v12 = v123;
            }

            else
            {
              if (!&ktrace_machine_max_clusters)
              {
                v79 = 0LL;
                v4 = &selRef_targetWithPid_;
LABEL_179:
                ktrace_machine_destroy(v70);
                if (v79)
                {
                  v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v79,  1LL,  0LL));
                  if (v117)
                  {
                    v118 = v117;
                    xpc_dictionary_set_data( reply,  "ktrace_machine_cores_data",  [v118 bytes],  (size_t)objc_msgSend(v118, "length"));

                    int v32 = 0;
LABEL_183:

                    goto LABEL_100;
                  }
                }

LABEL_182:
                int v32 = 46;
                goto LABEL_183;
              }

              v75 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              v105 = ktrace_machine_max_cpus(v70);
              if (v105)
              {
                v106 = v105;
                v107 = 0LL;
                v127 = reply;
                do
                {
                  if (&ktrace_machine_max_clusters)
                  {
                    if (!ktrace_machine_cpu_cluster(v70, v107, name)
                      && !ktrace_machine_cluster_flags(v70, name[0], buf))
                    {
                      v108 = objc_alloc(&OBJC_CLASS___DTCPUClusterInfo);
                      v109 = -[DTCPUClusterInfo initWithClusterID:flags:]( v108,  "initWithClusterID:flags:",  name[0],  buf[0] & 3);
                      if (v109)
                      {
                        v110 = v109;
                        v111 = v12;
                        v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v107));
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v75,  "setObject:forKeyedSubscript:",  v110,  v112);

                        __int16 v12 = v111;
                        xpc_object_t reply = v127;
                      }
                    }
                  }

                  v107 = (v107 + 1);
                }

                while (v106 != (_DWORD)v107);
              }

              v79 = -[NSMutableDictionary copy](v75, "copy");
            }

            v4 = &selRef_targetWithPid_;
            v17 = &selRef_targetWithPid_;
            goto LABEL_178;
          }

          if (!strcmp(v16, "ktrace_file_message") && xpc_message_has_privileges(v12))
          {
            memory = ktrace_file_create_memory(0LL, &stru_1000149D8, &stru_100014A18);
            if (memory)
            {
              v81 = memory;
              v82 = ktrace_config_create_current();
              if (v82)
              {
                v83 = v82;
                if (ktrace_config_append(v82, v81)
                  && (*(void *)buf = 0LL, *(void *)name = 0LL, !ktrace_file_get_memory(v81, buf, name)))
                {
                  xpc_dictionary_set_data(reply, "ktrace_config_data", *(const void **)buf, *(size_t *)name);
                  int v32 = 0;
                }

                else
                {
                  int v32 = 5;
                }

                ktrace_config_destroy(v83);
              }

              else
              {
                int v32 = 5;
              }

              ktrace_file_close(v81);
            }

            else
            {
              int v32 = 5;
            }

            goto LABEL_100;
          }

          if (!strcmp(v16, "coreprofile_core_control") && xpc_message_has_privileges(v12))
          {
            v87 = xpc_dictionary_get_int64(v13, "coreCount");
            *(void *)buf = 0LL;
            data = xpc_dictionary_get_data(v13, "coreEnableArray", (size_t *)buf);
            int v32 = coresSetEnabled((uint64_t)data, v87);
            goto LABEL_100;
          }

          if (!strcmp(v16, "stackshot") && xpc_message_has_privileges(v12))
          {
            v89 = stackshot_config_create();
            if (v89)
            {
              v90 = v89;
              if (stackshot_config_set_flags(v89, 102965259LL))
              {
                v91 = sub_100002B3C();
                v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
                  sub_10000E270();
                }

                int v32 = 4;
                goto LABEL_189;
              }

              if (stackshot_capture_with_config(v90))
              {
                v115 = sub_100002B3C();
                v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
                if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
                  sub_10000E1F8();
                }
              }

              else
              {
                stackshot_buffer = (const void *)stackshot_config_get_stackshot_buffer(v90);
                stackshot_size = stackshot_config_get_stackshot_size(v90);
                if (stackshot_buffer)
                {
                  xpc_dictionary_set_data(reply, "stackshot", stackshot_buffer, stackshot_size);
                  int v32 = 0;
                  goto LABEL_189;
                }
              }

              int v32 = 5;
LABEL_189:
              stackshot_config_dealloc(v90);
              goto LABEL_100;
            }

LABEL_129:
            int v32 = 8;
            goto LABEL_100;
          }

          if (strcmp(v16, "ktrace_start_file") || !xpc_message_has_privileges(v12))
          {
            if (!strcmp(v16, "ktrace_stop_file"))
            {
              int v32 = 8;
              *(void *)buf = 0LL;
              v102 = [(id)ktrace_current_session stopWithError:buf];
              v79 = *(id *)buf;
              if (dword_100019480 == -1)
              {
                int v32 = 0;
              }

              else if (kperf_bless_set(dword_100019480))
              {
                int v32 = 5;
              }

              else
              {
                int v32 = 0;
              }

              if ((v102 & 1) == 0)
              {
                if (v79)
                {
                  v113 = objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v79, 1LL, 0LL));
                  xpc_dictionary_set_data( reply,  "ns_error",  [v113 bytes],  (size_t)objc_msgSend(v113, "length"));
                }

                int v32 = 5;
              }

              v114 = (void *)ktrace_current_session;
              ktrace_current_session = 0LL;

              dword_100019480 = -1;
              goto LABEL_183;
            }

            goto LABEL_129;
          }

          v93 = xpc_dictionary_dup_fd(v13, "ktrace_file_fd");
          *(void *)buf = 0LL;
          v94 = xpc_dictionary_get_data(v13, "ktrace_session_config", (size_t *)buf);
          name[0] = -1;
          if (v94)
          {
            v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v94,  *(void *)buf,  0LL));
            v96 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___DVTKTraceSessionConfiguration),  0LL);
            v97 = (void *)objc_claimAutoreleasedReturnValue(v96);
            v128 = 0LL;
            v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v97,  v95,  &v128));
            v99 = v128;

            if (v99)
            {
              v100 = sub_100002B3C();
              v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
              if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
                sub_10000E328(v99);
              }
            }

            v17 = &selRef_targetWithPid_;
            if (v98)
            {
              if (sub_1000041E0(v98, v93, (int *)name))
              {
                int v32 = 0;
LABEL_151:

                goto LABEL_100;
              }

              int v32 = 5;
              if (name[0] == -1 || !reply) {
                goto LABEL_151;
              }
              xpc_dictionary_set_int64(reply, "errno_status", (int)name[0]);
LABEL_150:
              int v32 = 5;
              goto LABEL_151;
            }
          }

          else
          {
            v103 = sub_100002B3C();
            v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
              sub_10000E2E8(v104);
            }
          }

          xpc_dictionary_set_int64(reply, "errno_status", -1LL);
          v98 = 0LL;
          goto LABEL_150;
        }

        v65 = xpc_dictionary_get_int64(v13, "pid");
        uuid = xpc_dictionary_get_uuid(v13, "uuid");
        v50 = (_BYTE *)sub_100007294((uint64_t)v12, v65, (uint64_t)uuid);
      }

      v40 = v50;
      if (v50)
      {
        v67 = v50;
        xpc_dictionary_set_data( reply,  "signatures_data",  [v67 bytes],  (size_t)objc_msgSend(v67, "length"));
        int v32 = 0;
      }

      else
      {
        int v32 = 8;
      }

LABEL_99:
      goto LABEL_100;
    }

    v126 = reply;
    v42 = v12;
    id v43 = v13;
    int v44 = xpc_dictionary_get_int64(v43, "pid");
    v125 = DVTIUUidForPid(v44);
    pid_t v45 = xpc_connection_get_pid(v42);
    int v46 = DVTIUUidForPid(v45);
    if (v46) {
      unsigned int v47 = xpc_message_has_privileges(v42);
    }
    else {
      unsigned int v47 = 1;
    }
    name[0] = 0;
    v51 = task_for_pid(mach_task_self_, v44, name);
    if (v51)
    {
      int v32 = v51;
      if (qword_100019610 != -1) {
        dispatch_once(&qword_100019610, &stru_100014920);
      }
      v52 = (os_log_s *)qword_100019618;
      if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v45;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v46;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v125;
        _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "Caller: {%u:%u} failed to get task_control_t for Target: %u",  buf,  0x14u);
      }
    }

    else
    {
      v122 = v12;
      v53 = DVTIsProcessDebuggable(name[0]);
      v54 = DVTIsSimulatorProcess();
      v55 = v54;
      if (v125 == v46) {
        v56 = 1;
      }
      else {
        v56 = v47;
      }
      v124 = v56 & (v53 | v54);
      if (qword_100019610 != -1) {
        dispatch_once(&qword_100019610, &stru_100014920);
      }
      v57 = (void *)qword_100019618;
      if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
      {
        v58 = "non-debuggable";
        if (v53) {
          v58 = "debuggable";
        }
        v121 = v58;
        if (v55) {
          v59 = ", simulated";
        }
        else {
          v59 = (const char *)&unk_10001189D;
        }
        v60 = v57;
        v61 = xpc_message_has_privileges(v42);
        *(_DWORD *)buf = 67110914;
        v62 = "UserProcess";
        *(_DWORD *)&uint8_t buf[4] = v45;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v46;
        if (v61) {
          v62 = "AnyProcess";
        }
        *(_WORD *)&buf[14] = 1024;
        v63 = "success";
        *(_DWORD *)&buf[16] = v44;
        if (!v124) {
          v63 = "fail";
        }
        *(_WORD *)&buf[20] = 1024;
        *(_DWORD *)&buf[22] = v125;
        *(_WORD *)&buf[26] = 2080;
        *(void *)&buf[28] = v121;
        *(_WORD *)&buf[36] = 2080;
        *(void *)&buf[38] = v59;
        v135 = 2080;
        v136 = v62;
        v137 = 2080;
        v138 = v63;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_INFO,  "Caller: {%u:%u} requesting task_control_t for Target: {%u:%u} (%s%s) [Authorization: %s] - %s",  buf,  0x42u);
      }

      if ((v124 & 1) != 0)
      {
        v64 = name[0];

        xpc_object_t reply = v126;
        xpc_dictionary_set_mach_send(v126, "task", v64);
        mach_port_deallocate(mach_task_self_, v64);
        int v32 = 0;
        __int16 v12 = v122;
        v4 = &selRef_targetWithPid_;
LABEL_77:
        v17 = &selRef_targetWithPid_;
        goto LABEL_100;
      }

      mach_port_deallocate(mach_task_self_, name[0]);
      int v32 = 8;
      __int16 v12 = v122;
    }

    xpc_object_t reply = v126;
    v4 = &selRef_targetWithPid_;

    goto LABEL_77;
  }

  if (v3 == &_xpc_error_connection_interrupted || v3 == &_xpc_error_connection_invalid)
  {
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v6 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
    {
      v7 = *(_xpc_connection_s **)(a1 + 32);
      v8 = v6;
      pid_t v9 = xpc_connection_get_pid(v7);
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Peer disconnected (%d : %p)", buf, 0x12u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[DTXPCServiceController sharedInstance](&OBJC_CLASS___DTXPCServiceController, "sharedInstance"));
    [v11 unregisterClient:*(void *)(a1 + 32) withIdentifier:0 parent:0];

    sub_1000076BC(*(void *)(a1 + 32));
  }

  else
  {
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v33 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
    {
      v34 = *(_xpc_connection_s **)(a1 + 32);
      v35 = v33;
      pid_t v36 = xpc_connection_get_pid(v34);
      uint64_t v37 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v36;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Unexpected event %@ (%d : %p)", buf, 0x1Cu);
    }
  }

LABEL_107:
}

void sub_100004034(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  id v9 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v10 = v9;
  v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(xdict, "name", v11);
  xpc_dictionary_set_int64(xdict, "pid", a3);
  xpc_dictionary_set_int64(xdict, "host_pid", a4);
  xpc_dictionary_set_fd(xdict, "outputfd", a5);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), xdict);
}

void sub_100004108(uint64_t a1, int a2, int a3, const __CFData *a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t xdict = v8;
  if (a3 == 256) {
    id v9 = "dyld_load";
  }
  else {
    id v9 = "dyld_unload";
  }
  xpc_dictionary_set_string(v8, "Message", v9);
  xpc_dictionary_set_int64(xdict, "pid", a2);
  BytePtr = CFDataGetBytePtr(a4);
  size_t Length = CFDataGetLength(a4);
  xpc_dictionary_set_data(xdict, "signatures_data", BytePtr, Length);
}

void *__cdecl sub_1000041CC(id a1, void *a2, unint64_t a3, unint64_t a4)
{
  return realloc(a2, a4);
}

void sub_1000041D8(id a1, void *a2, unint64_t a3)
{
}

BOOL sub_1000041E0(void *a1, uint64_t a2, int *a3)
{
  id v5 = a1;
  unsigned int v15 = -1;
  kperf_bless_get(&v15);
  uint64_t v6 = getpid();
  if (kperf_bless_set(v6))
  {
    BOOL v7 = 0LL;
    if (a3) {
      *a3 = *__error();
    }
  }

  else
  {
    id v14 = 0LL;
    xpc_object_t v8 = -[DTKTraceSessionCreator initWithFD:configuration:error:]( objc_alloc(&OBJC_CLASS___DTKTraceSessionCreator),  "initWithFD:configuration:error:",  a2,  v5,  &v14);
    id v9 = v14;
    id v10 = v9;
    BOOL v7 = v8 != 0LL;
    if (v8)
    {
      unsigned int v11 = [v5 useExisting];
      int v12 = v15;
      if (v11)
      {
        kperf_bless_set(v15);
      }

      else
      {
        objc_storeStrong((id *)&ktrace_current_session, v8);
        dword_100019480 = v12;
      }
    }

    else if (a3)
    {
      *a3 = [v9 code];
    }
  }

  return v7;
}

void sub_1000042F0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100004478(uint64_t a1, uint64_t a2, dispatch_object_t object)
{
  *(void *)a1 = a2;
  *(_BYTE *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = object;
  dispatch_retain(object);
  return a1;
}

uint64_t sub_1000044AC(uint64_t a1)
{
  return a1;
}

void sub_1000044D4(uint64_t a1, int a2)
{
  v4 = (mach_port_name_t *)sub_100006B08();
  if (qword_100019620 != -1) {
    dispatch_once(&qword_100019620, &stru_100014A78);
  }
  id v5 = (os_log_s *)qword_100019628;
  if (os_log_type_enabled((os_log_t)qword_100019628, OS_LOG_TYPE_INFO))
  {
    int v6 = *(unsigned __int8 *)(a1 + 8);
    *(_DWORD *)buf = 67109376;
    int v12 = v6;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing tracking state: %d->%d", buf, 0xEu);
  }

  if (!*(_BYTE *)(a1 + 8) || (a2 & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 8) && a2)
    {
      *(_BYTE *)(a1 + 8) = a2;
      sub_100006B6C(v4, (mach_port_name_t *)buf);
      if ((*(_DWORD *)buf - 1) > 0xFFFFFFFD)
      {
        *(void *)(a1 + 16) = 0LL;
        if (qword_100019620 != -1) {
          dispatch_once(&qword_100019620, &stru_100014A78);
        }
        xpc_object_t v8 = (os_log_s *)qword_100019628;
        if (os_log_type_enabled((os_log_t)qword_100019628, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to connect to host port", v9, 2u);
        }

        *(_BYTE *)(a1 + 8) = 0;
      }

      else
      {
        mach_port_set_context(mach_task_self_, *(mach_port_name_t *)buf, *(void *)a1);
        BOOL v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  *(unsigned int *)buf,  0LL,  *(dispatch_queue_t *)(a1 + 24));
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000LL;
        handler[2] = sub_1000046F8;
        handler[3] = &unk_100014A38;
        void handler[4] = v4;
        dispatch_source_set_event_handler(v7, handler);
        *(void *)(a1 + 16) = v7;
        dispatch_resume(v7);
      }
    }
  }

  else
  {
    *(_BYTE *)(a1 + 8) = a2;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
    dispatch_release(*(dispatch_object_t *)(a1 + 16));
    sub_100006DFC((uint64_t)v4);
  }
}

void sub_1000046F8(uint64_t a1)
{
}

void sub_100004700(id a1)
{
  qword_100019628 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
}

LABEL_19:
      ktrace_session_destroy(v16);
      goto LABEL_20;
    }

    if ([v8 useExisting])
    {
      v24 = ktrace_set_use_existing(v16);
      if ((_DWORD)v24)
      {
        if (!v13)
        {
          v60 = NSLocalizedDescriptionKey;
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"error: %d",  v24));
          v61 = v25;
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
          *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTKTraceSessionCreator",  -1LL,  v26));
        }

        goto LABEL_19;
      }
    }

    else
    {
      v27 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      char v49 = 0LL;
      v50 = &v49;
      v51 = 0x3032000000LL;
      v52 = sub_100005388;
      v53 = sub_100005398;
      v54 = 0LL;
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 providers]);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1000053A0;
      v45[3] = &unk_100014B00;
      unsigned int v47 = &v49;
      v48 = v16;
      v42 = v27;
      int v46 = v42;
      [v28 enumerateKeysAndObjectsUsingBlock:v45];

      id v29 = v50[5];
      if (v29)
      {
        v58 = NSLocalizedDescriptionKey;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to instantiate data providers"));
        v59 = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
        providerLoggers = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dt.ktrace_recording.provider",  1LL,  v31));

        if (!v13) {
          *a5 = providerLoggers;
        }
        ktrace_session_destroy(v16);
      }

      else
      {
        v33 = v42;
        providerLoggers = v9->_providerLoggers;
        v9->_providerLoggers = v33;
      }

      _Block_object_dispose(&v49, 8);
      if (v29) {
        goto LABEL_20;
      }
    }

    v34 = dispatch_semaphore_create(0LL);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000054B8;
    v43[3] = &unk_100014B28;
    v35 = v34;
    int v44 = v35;
    ktrace_set_completion_handler(v16, v43);
    objc_storeStrong((id *)&v9->_stoppingSemaphore, v34);
    started = ktrace_start_writing_fd(v16, v6, 0LL, 0LL, 0LL);
    if ((_DWORD)started)
    {
      if (!v13)
      {
        v56 = NSLocalizedDescriptionKey;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"error: %d",  started));
        v57 = v37;
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTKTraceSessionCreator",  -1LL,  v38));
      }

      goto LABEL_20;
    }

    if ([v8 useExisting])
    {
      dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
      ktraceSession = v9->_ktraceSession;
      if (ktraceSession) {
        ktrace_session_destroy(ktraceSession);
      }
      stoppingSemaphore = v9->_stoppingSemaphore;
      v9->_ktraceSession = 0LL;
      v9->_stoppingSemaphore = 0LL;
    }

    v9->_ktraceSession = (ktrace_session *)v16;

LABEL_41:
    v23 = v9;
    goto LABEL_42;
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 bitmap]);
  int v12 = [v11 length] == (id)0x2000;

  __int16 v13 = a5 == 0LL;
  if (a5) {
    int v14 = v12;
  }
  else {
    int v14 = 1;
  }
  if ((v14 & 1) != 0) {
    goto LABEL_9;
  }
  v64 = NSLocalizedDescriptionKey;
  v65 = @"Invalid tracing configuration bitmap";
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
  *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTKTraceSessionCreator",  -1LL,  v15));

LABEL_20:
  v23 = 0LL;
LABEL_42:

  return v23;
}

    v101 = 0LL;
    if (v23)
    {
      v111 = 0LL;
      if (v108)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v23;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: Error retrieving LSApplicationRecord for %@, %@",  buf,  0x16u);
        }

        v101 = 0LL;
        v111 = 0LL;
      }
    }

    else
    {
      v111 = 0LL;
    }

void sub_10000535C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_100005388(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005398(uint64_t a1)
{
}

void sub_1000053A0(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = -[DVTProviderLogger initWithProviderName:]( objc_alloc(&OBJC_CLASS___DVTProviderLogger),  "initWithProviderName:",  v7);
  [*(id *)(a1 + 32) addObject:v9];
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = v7;
  LODWORD(v10) = ktrace_session_provide(v10, [v11 UTF8String], v8, v9, 1);

  if ((_DWORD)v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v11);
    if (qword_100019638 != -1) {
      dispatch_once(&qword_100019638, &stru_100014B48);
    }
    int v12 = (os_log_s *)qword_100019630;
    if (os_log_type_enabled((os_log_t)qword_100019630, OS_LOG_TYPE_ERROR)) {
      sub_10000E40C((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }
    *a4 = 1;
  }
}

uint64_t sub_1000054B8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000059B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.Instruments", "dtktracehelpers");
  v2 = (void *)qword_100019630;
  qword_100019630 = (uint64_t)v1;
}

void sub_1000059E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_1000059F8(uint64_t a1, id a2, int a3)
{
  *(_OWORD *)(a1 + _Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_DWORD *)(a1 + 4_Block_object_dispose(va, 8) = a3;
  *(void *)(a1 + 56) = objc_retainBlock(a2);
  *(void *)a1 = CFDictionaryCreateMutable(0LL, 0LL, 0LL, &kCSTypeDictionaryValueCallBacks);
  return a1;
}

void sub_100005A64(_Unwind_Exception *a1)
{
  sub_1000063D8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100005A84(uint64_t a1)
{
  sub_1000063D8(a1 + 8);
  return a1;
}

void sub_100005AC0(void *a1)
{
}

uint64_t *sub_100005AD4(uint64_t *result, unsigned int a2)
{
  unsigned int v10 = a2;
  if (*((_DWORD *)result + 12))
  {
    uint64_t v2 = (uint64_t)(result + 1);
    result = sub_100006420(result + 1, (int *)&v10);
    if (!result)
    {
      uint64_t v3 = CSSymbolicatorCreateWithPid(v10);
      uint64_t v5 = v4;
      if (qword_100019640 != -1) {
        dispatch_once(&qword_100019640, &stru_100014B88);
      }
      int v6 = (os_log_s *)(id)qword_100019648;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t AOutSymbolOwner = CSSymbolicatorGetAOutSymbolOwner(v3, v5);
        uint64_t Name = CSSymbolOwnerGetName(AOutSymbolOwner);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = Name;
        __int16 v12 = 1024;
        unsigned int v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Created symbolicator for %s[%u]\n", buf, 0x12u);
      }

      uint64_t Signature = CSSymbolicatorCreateSignature(v3, v5, 0LL);
      if (Signature)
      {
        *(void *)buf = &v10;
        sub_1000064D4(v2, (int *)&v10, (uint64_t)&unk_100010620, (_DWORD **)buf)[3] = Signature;
      }

      return (uint64_t *)CSRelease(v3, v5);
    }
  }

  return result;
}

void sub_100005C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t Signature = CSSymbolOwnerCreateSignature(a2, a3, 0LL);
  if (Signature)
  {
    id v9 = (const void *)Signature;
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, const void *))(v10 + 16))(v10, a4, a5, v9);
    }
    CFRelease(v9);
  }

  else
  {
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    id v11 = (os_log_s *)qword_100019648;
    if (os_log_type_enabled((os_log_t)qword_100019648, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "failed to create signature for %d\n",  (uint8_t *)v12,  8u);
    }
  }

uint64_t sub_100005D90(CFDictionaryRef *a1, int a2, uint64_t a3)
{
  Value = CFDictionaryGetValue(*a1, (const void *)a2);
  if (a3
    && Value
    && (SymbolOwnerWithCFUUIDBytesAtTime = CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime( *Value,  Value[1],  a3,  0x8000000000000000LL),  uint64_t v7 = v6,  (CSIsNull() & 1) == 0))
  {
    return CSSymbolOwnerCreateSignature(SymbolOwnerWithCFUUIDBytesAtTime, v7, 5LL);
  }

  else
  {
    return 0LL;
  }

uint64_t sub_100005E00(CFDictionaryRef *a1, uint64_t a2, int a3)
{
  uint64_t v6 = (const void *)(int)a2;
  uint64_t v7 = CFDictionaryGetValue(*a1, (const void *)(int)a2);
  if (v7)
  {
    id v8 = v7;
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    id v9 = (os_log_s *)(id)qword_100019648;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t AOutSymbolOwner = CSSymbolicatorGetAOutSymbolOwner(*v8, v8[1]);
      *(_DWORD *)buf = 136315394;
      uint64_t Name = CSSymbolOwnerGetName(AOutSymbolOwner);
      __int16 v28 = 1024;
      LODWORD(v29) = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Returning cached live symbolicator for %s[%u]",  buf,  0x12u);
    }

    return CSSymbolicatorCreateSignature(*v8, v8[1], 0LL);
  }

  else
  {
    if (getpid() == (_DWORD)a2) {
      int v12 = 0;
    }
    else {
      int v12 = a3;
    }
    if ((v12 & 1) != 0)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000060AC;
      v22[3] = &unk_100014B68;
      v22[4] = a1;
      int v23 = a2;
      uint64_t v13 = CSSymbolicatorCreateWithPidFlagsAndNotification(a2, 1LL, v22);
    }

    else
    {
      uint64_t v13 = CSSymbolicatorCreateWithPidFlagsAndNotification(a2, 4LL, 0LL);
    }

    uint64_t v15 = v13;
    uint64_t v16 = v14;
    uint64_t value = v13;
    uint64_t v25 = v14;
    uint64_t v11 = ((uint64_t (*)(void))CSSymbolicatorCreateSignature)();
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    uint64_t v17 = (os_log_s *)(id)qword_100019648;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (v12) {
        uint64_t v18 = "tracking ";
      }
      else {
        uint64_t v18 = (const char *)&unk_10001189D;
      }
      uint64_t v19 = CSSymbolicatorGetAOutSymbolOwner(v15, v16);
      uint64_t v20 = CSSymbolOwnerGetName(v19);
      *(_DWORD *)buf = 136315650;
      uint64_t Name = (uint64_t)v18;
      __int16 v28 = 2080;
      uint64_t v29 = v20;
      __int16 v30 = 1024;
      int v31 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Created live %ssymbolicator for %s[%u]",  buf,  0x1Cu);
    }

    CFDictionarySetValue(*a1, v6, &value);
    CSRelease(value, v25);
  }

  return v11;
}

void sub_100006088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000060AC(uint64_t a1, uint64_t a2, void *a3)
{
  if ((a2 & 0xFFFFFFFE) == 0x100)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = a3[2];
    uint64_t v8 = a3[3];
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    id v9 = (os_log_s *)(id)qword_100019648;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = "unload";
      if ((_DWORD)a2 == 256) {
        uint64_t v10 = "load";
      }
      uint64_t v17 = v10;
      uint64_t AOutSymbolOwner = CSSymbolicatorGetAOutSymbolOwner(*a3, a3[1]);
      uint64_t Name = CSSymbolOwnerGetName(AOutSymbolOwner);
      int v13 = *(_DWORD *)(a1 + 40);
      uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress(v7, v8);
      uint64_t v15 = CSSymbolOwnerGetName(v7);
      if ((_DWORD)a2 == 256) {
        uint64_t LoadTimestamp = CSSymbolOwnerGetLoadTimestamp(v7, v8);
      }
      else {
        uint64_t LoadTimestamp = CSSymbolOwnerGetUnloadTimestamp(v7, v8);
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v17;
      __int16 v20 = 2080;
      uint64_t v21 = Name;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = BaseAddress;
      __int16 v26 = 2080;
      uint64_t v27 = v15;
      __int16 v28 = 2048;
      uint64_t v29 = LoadTimestamp;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Sending %s notification for %s[%u]: %#llx %s at time %llu",  buf,  0x3Au);
    }

    sub_100005C58(v6, v7, v8, *(unsigned int *)(a1 + 40), a2);
  }

void sub_100006278(_Unwind_Exception *exception_object)
{
}

__CFArray *sub_100006290(void *a1)
{
  if (qword_100019640 != -1) {
    dispatch_once(&qword_100019640, &stru_100014B88);
  }
  uint64_t v2 = (os_log_s *)qword_100019648;
  if (os_log_type_enabled((os_log_t)qword_100019648, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "Returning %lu symbolicator signatures",  (uint8_t *)&v7,  0xCu);
  }

  Mutable = CFArrayCreateMutable(0LL, a1[4], &kCFTypeArrayCallBacks);
  for (i = (uint64_t **)a1[3]; i; i = (uint64_t **)*i)
  {
    CFArrayAppendValue(Mutable, i[3]);
    CFRelease(i[3]);
  }

  sub_100006950(a1 + 1);
  return Mutable;
}

void sub_1000063A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
  uint64_t v2 = (void *)qword_100019648;
  qword_100019648 = (uint64_t)v1;
}

uint64_t sub_1000063D8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t *sub_100006420(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }

      else
      {
        v8 &= *(void *)&v2 - 1LL;
      }

      if (v8 != v5) {
        return 0LL;
      }
    }
  }

  return result;
}

void *sub_1000064D4(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          uint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v11 = operator new(0x20uLL);
  void *v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_10000671C(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  __int16 v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }

  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    __int16 v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_1000066E0(_Unwind_Exception *a1)
{
}

void sub_1000066F4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  os_log_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10000671C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_1000067F8(a1, prime);
  }

void sub_1000067F8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1000066F4();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v_Block_object_dispose(va, 8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

void *sub_100006950(void *result)
{
  if (result[3])
  {
    os_log_t v1 = result;
    result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        result = v2;
      }

      while (v2);
    }

    v1[2] = 0LL;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0LL;
    }

    v1[3] = 0LL;
  }

  return result;
}

uint64_t coresSetEnabled(uint64_t a1, unsigned int a2)
{
  uint64_t result = 4LL;
  if (a1 && a2)
  {
    mach_port_t v5 = mach_host_self();
    mach_msg_type_number_t host_info_outCnt = 12;
    if (host_info(v5, 1, host_info_out, &host_info_outCnt)) {
      return 5LL;
    }
    if (host_info_out[0] >= a2)
    {
      if (host_processors(v5, &out_processor_list, &out_processor_listCnt)) {
        return 5LL;
      }
      if (a2 >= 2)
      {
        uint64_t v6 = 1LL;
        do
        {
          processor_t v7 = out_processor_list[v6];
          if (*(_BYTE *)(a1 + v6)) {
            processor_start(v7);
          }
          else {
            processor_exit(v7);
          }
          ++v6;
        }

        while (a2 != v6);
      }

      return 0LL;
    }

    else
    {
      return 4LL;
    }
  }

  return result;
}

BOOL DTProcessShouldCaptureOutputWithOptions(void *a1)
{
  id v1 = a1;
  int8x8_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:DTProcessControlServiceOption_CaptureOutputKey[0]]);
  unsigned __int8 v3 = [v2 BOOLValue];

  if ((v3 & 1) != 0)
  {
    BOOL v4 = 1LL;
  }

  else
  {
    mach_port_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"iODestinationKey"]);
    unsigned int v6 = [v5 intValue];

    BOOL v4 = v6 == 0;
  }

  return v4;
}

uint64_t sub_100006B08()
{
  if (qword_100019650 != -1) {
    dispatch_once(&qword_100019650, &stru_100014BC8);
  }
  return qword_100019658;
}

void sub_100006B48(id a1)
{
  id v1 = operator new(0xA8uLL);
  v1[20] = 0LL;
  qword_100019658 = (uint64_t)v1;
}

void sub_100006B6C(mach_port_name_t *name, mach_port_name_t *a2)
{
  kern_return_t inserted;
  mach_port_t v8;
  os_log_s *v9;
  mach_port_name_t v10;
  _DWORD *exception;
  uint8_t buf[4];
  mach_port_name_t v13;
  mach_port_t v4 = mach_task_self_;
  unsigned int v6 = name + 41;
  mach_port_name_t v5 = name[41];
  if (v5 + 1 >= 2)
  {
    mach_port_mod_refs(mach_task_self_, v5, 1u, -1);
    mach_port_name_t *v6 = 0;
  }

  inserted = mach_port_allocate(v4, 1u, v6);
  if (inserted
    || (inserted = mach_port_insert_right(v4, *v6, *v6, 0x14u)) != 0
    || (unint64_t v8 = mach_host_self(),
        name[40] = 10,
        (inserted = host_swap_exception_ports( v8,  0x200u,  name[41],  -2147483644,  5,  name,  name + 40,  name + 10,  (exception_behavior_array_t)name + 20,  (exception_flavor_array_t)name + 30)) != 0))
  {
    exception = __cxa_allocate_exception(4uLL);
    std::bad_array_new_length *exception = inserted;
  }

  if (qword_100019660 != -1) {
    dispatch_once(&qword_100019660, &stru_100014C08);
  }
  uint8x8_t v9 = (os_log_s *)qword_100019668;
  if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *v6;
    *(_DWORD *)buf = 67174657;
    float v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Connected to host exception port, listening on %{private}#x",  buf,  8u);
  }

  *a2 = *v6;
}

uint64_t sub_100006DFC(uint64_t result)
{
  unsigned int v1 = *(_DWORD *)(result + 160);
  if (v1)
  {
    if (v1 >= 0xB) {
      sub_10000E49C();
    }
    uint64_t v2 = result;
    mach_port_t v3 = mach_task_self_;
    mach_port_t v4 = mach_host_self();
    if (*(_DWORD *)(v2 + 160))
    {
      host_priv_t v5 = v4;
      for (unint64_t i = 0LL; i < *(unsigned int *)(v2 + 160); ++i)
      {
        uint64_t v7 = v2 + 4 * i;
        if (host_set_exception_ports( v5,  *(_DWORD *)v7,  *(_DWORD *)(v7 + 40),  *(_DWORD *)(v7 + 80),  *(_DWORD *)(v7 + 120)))
        {
          if (qword_100019660 != -1) {
            dispatch_once(&qword_100019660, &stru_100014C08);
          }
          uint64_t v8 = qword_100019668;
          if (!os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          int v9 = *(_DWORD *)(v2 + 4 * i);
          *(_DWORD *)buf = 67109120;
          int v16 = v9;
          uint64_t v10 = (os_log_s *)v8;
          os_log_type_t v11 = OS_LOG_TYPE_ERROR;
          unint64_t v12 = "Failed to restore a host port exception handler: 0x%x";
          uint32_t v13 = 8;
        }

        else
        {
          if (qword_100019660 != -1) {
            dispatch_once(&qword_100019660, &stru_100014C08);
          }
          uint64_t v14 = qword_100019668;
          if (!os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO)) {
            goto LABEL_15;
          }
          *(_WORD *)buf = 0;
          uint64_t v10 = (os_log_s *)v14;
          os_log_type_t v11 = OS_LOG_TYPE_INFO;
          unint64_t v12 = "Restored previous host exception port";
          uint32_t v13 = 2;
        }

        _os_log_impl((void *)&_mh_execute_header, v10, v11, v12, buf, v13);
LABEL_15:
        mach_port_deallocate(v3, *(_DWORD *)(v7 + 40));
      }
    }

    *(_DWORD *)(v2 + 160) = 0;
    uint64_t result = mach_port_mod_refs(v3, *(_DWORD *)(v2 + 164), 1u, -1);
    *(_DWORD *)(v2 + 164) = 0;
  }

  return result;
}

uint64_t sub_100006FD8(mach_port_name_t a1, uint64_t a2, mach_port_name_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(unsigned int *)(a5 + 8);
  if (qword_100019660 != -1) {
    dispatch_once(&qword_100019660, &stru_100014C08);
  }
  uint64_t v8 = (os_log_s *)qword_100019668;
  if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Observed process termination for pid: %u", buf, 8u);
  }

  *(void *)buf = 0LL;
  if (!mach_port_get_context(mach_task_self_, a1, (mach_port_context_t *)buf)) {
    (***(void (****)(void, uint64_t))buf)(*(void *)buf, v7);
  }
  if (qword_100019660 != -1) {
    dispatch_once(&qword_100019660, &stru_100014C08);
  }
  int v9 = (os_log_s *)qword_100019668;
  if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109120;
    v11[1] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Handled process termination for pid: %u",  (uint8_t *)v11,  8u);
  }

  mach_port_deallocate(mach_task_self_, a3);
  return 0LL;
}

void sub_100007168()
{
}

void sub_100007174(uint64_t a1)
{
  mach_msg_return_t v1;
  mach_error_t v2;
  os_log_s *v3;
  int v4;
  char *v5;
  __int16 v6;
  mach_error_t v7;
  unsigned int v1 = mach_msg_server_once( (BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))mach_exc_server,  0x40000u,  *(_DWORD *)(a1 + 164),  0);
  if (v1)
  {
    uint64_t v2 = v1;
    if (qword_100019660 != -1) {
      dispatch_once(&qword_100019660, &stru_100014C08);
    }
    mach_port_t v3 = (os_log_s *)qword_100019668;
    if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_ERROR))
    {
      mach_port_t v4 = 136315394;
      host_priv_t v5 = mach_error_string(v2);
      unsigned int v6 = 1024;
      uint64_t v7 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Failure processing exception: %s (%#x)",  (uint8_t *)&v4,  0x12u);
    }
  }

void sub_100007268(id a1)
{
  qword_100019668 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
}

uint64_t sub_100007294(uint64_t a1, int a2, uint64_t a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  return sub_1000072FC((uint64_t)off_1000195F8, a1, a2, a3);
}

uint64_t sub_1000072FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  uint64_t v12 = 0LL;
  mach_port_t v4 = *(dispatch_queue_s **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100007A20;
  block[3] = &unk_100014CE0;
  block[4] = &v9;
  block[5] = a1;
  int v8 = a3;
  block[6] = a2;
  block[7] = a4;
  dispatch_sync(v4, block);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_100007394(uint64_t a1, int a2, char a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  return sub_1000073FC((uint64_t)off_1000195F8, a1, a2, a3);
}

uint64_t sub_1000073FC(uint64_t a1, uint64_t a2, int a3, char a4)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  mach_port_t v4 = *(dispatch_queue_s **)(a1 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000LL;
  v7[2] = sub_100007DBC;
  v7[3] = &unk_100014D48;
  v7[4] = &v10;
  v7[5] = a1;
  v7[6] = a2;
  int v8 = a3;
  char v9 = a4;
  dispatch_sync(v4, v7);
  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t sub_100007498(uint64_t a1, char a2, uint64_t a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  return sub_100007500((uint64_t)off_1000195F8, a1, a2, a3);
}

uint64_t sub_100007500(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  int v8 = *(dispatch_queue_s **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100008804;
  block[3] = &unk_100014E08;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync(v8, block);
  char v9 = *(dispatch_queue_s **)(a1 + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000LL;
  v11[2] = sub_100007EB8;
  v11[3] = &unk_100014D70;
  v11[5] = a1;
  v11[6] = a2;
  _DWORD v11[4] = a4;
  char v12 = a3;
  dispatch_sync(v9, v11);
  return 0LL;
}

uint64_t sub_1000075BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  return sub_100007624((uint64_t)off_1000195F8, a1, a2, a3);
}

uint64_t sub_100007624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 0LL;
  char v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  int v11 = 0;
  mach_port_t v4 = *(dispatch_queue_s **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000849C;
  block[3] = &unk_100014DE8;
  block[4] = &v8;
  block[5] = a1;
  void block[6] = a2;
  block[7] = a3;
  void block[8] = a4;
  dispatch_sync(v4, block);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1000076BC(uint64_t a1)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  uint64_t v2 = (dispatch_queue_s *)*((void *)off_1000195F8 + 1);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_100008804;
  v3[3] = &unk_100014E08;
  v3[4] = off_1000195F8;
  v3[5] = a1;
  dispatch_sync(v2, v3);
}

void sub_10000774C(id a1)
{
  unsigned int v1 = operator new(0x70uLL);
  sub_100007790((uint64_t)v1);
  off_1000195F8 = v1;
}

void sub_10000777C(_Unwind_Exception *a1)
{
}

uint64_t sub_100007790(uint64_t a1)
{
  *(void *)a1 = off_100014C78;
  dispatch_queue_t v2 = dispatch_queue_create("pid_tracking_service", 0LL);
  *(void *)(a1 + _Block_object_dispose(va, 8) = v2;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 1065353216;
  *(void *)(a1 + 64) = 0LL;
  *(_DWORD *)(a1 + 72) = 0;
  sub_100004478(a1 + 80, a1, v2);
  signal(15, (void (__cdecl *)(int))1);
  mach_port_t v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  *(dispatch_queue_t *)(a1 + 8));
  *(void *)(a1 + 16) = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_1000078A0;
  handler[3] = &unk_100014C90;
  void handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 16));
  return a1;
}

void sub_10000787C(_Unwind_Exception *a1)
{
}

uint64_t sub_1000078A0(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64LL) = 0LL;
  return result;
}

void sub_1000078AC(uint64_t a1, unsigned int a2)
{
}

void sub_1000078F4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000079D4(a1);
  operator delete(v1);
}

uint64_t sub_100007908(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_100007940(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      mach_port_t v3 = (void *)*v2;
      sub_10000797C((uint64_t)(v2 + 3));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

uint64_t sub_10000797C(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

uint64_t sub_1000079D4(uint64_t a1)
{
  *(void *)a1 = off_100014C78;
  dispatch_release(*(dispatch_object_t *)(a1 + 8));
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
  sub_1000044AC(a1 + 80);
  sub_100007908(a1 + 24);
  return a1;
}

uint64_t sub_100007A20(uint64_t a1)
{
  uint64_t result = sub_100007A58(*(void *)(a1 + 40), *(void *)(a1 + 48), *(_DWORD *)(a1 + 64), *(void *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100007A58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (v13) {
    uint64_t v8 = sub_100005D90(v13, a3, a4);
  }
  else {
    uint64_t v8 = 0LL;
  }
  char v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  return v8;
}

void sub_100007B04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100007B18(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v12 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v5 = sub_100007CA4((void *)(a1 + 24), &v12);
  if (v5)
  {
    unsigned int v6 = v5;
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v7 = (os_log_s *)qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found client %p", buf, 0xCu);
    }

    uint64_t v8 = v6[4];
    *a3 = v6[3];
    a3[1] = v8;
    if (v8)
    {
      char v9 = (unint64_t *)(v8 + 8);
      do
        unint64_t v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
  }

  else
  {
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    unint64_t v11 = (os_log_s *)qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to find client %p", buf, 0xCu);
    }

    *a3 = 0LL;
    a3[1] = 0LL;
  }

void *sub_100007CA4(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69LL * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1LL);
  }

  uint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0LL;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }

      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }

        else
        {
          v10 &= *(void *)&v2 - 1LL;
        }

        if (v10 != v7) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void sub_100007D90(id a1)
{
  qword_100019678 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
}

uint64_t sub_100007DBC(uint64_t a1)
{
  uint64_t result = sub_100007DF8( *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(unsigned int *)(a1 + 56),  *(unsigned __int8 *)(a1 + 60));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100007DF8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (v13) {
    uint64_t v8 = sub_100005E00(v13, a3, a4);
  }
  else {
    uint64_t v8 = 0LL;
  }
  char v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  return v8;
}

void sub_100007EA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100007EB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (qword_100019670 != -1) {
    dispatch_once(&qword_100019670, &stru_100014D20);
  }
  unint64_t v3 = (os_log_s *)qword_100019678;
  if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v12[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Added client %p", buf, 0xCu);
  }

  sub_1000080D8((id *)(a1 + 32), buf);
  if (!*(void *)(v2 + 48)) {
    *(void *)(v2 + 64) = os_transaction_create("com.apple.dt.Instruments.process-watcher");
  }
  if (*(_BYTE *)(a1 + 56))
  {
    int v5 = *(_DWORD *)(v2 + 72);
    *(_DWORD *)(v2 + 72) = v5 + 1;
    if (!v5) {
      sub_1000044D4(v2 + 80, 1);
    }
  }

  unint64_t v10 = (uint64_t *)(a1 + 48);
  uint8x8_t v6 = sub_1000081C4(v2 + 24, (void *)(a1 + 48), (uint64_t)&unk_1000106B9, &v10);
  sub_100008060(v6 + 3, (uint64_t *)buf);
  unint64_t v7 = *(std::__shared_weak_count **)((char *)v12 + 4);
  if (*(void *)((char *)v12 + 4))
  {
    uint64_t v8 = (unint64_t *)(*(void *)((char *)v12 + 4) + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

void sub_100008044( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void *sub_100008060(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3)
  {
    int v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  unint64_t v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return a1;
}

void *sub_1000080D8@<X0>(id *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x58uLL);
  uint64_t result = sub_100008138(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_100008124(_Unwind_Exception *a1)
{
}

void *sub_100008138(void *a1, id *a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_100014DA0;
  sub_100005A80((_DWORD)a1 + 24, *a2);
  return a1;
}

void sub_100008174(_Unwind_Exception *a1)
{
}

void sub_100008188(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014DA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100008198(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014DA0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1000081B8(uint64_t a1)
{
  return sub_100005AD0(a1 + 24);
}

void *sub_1000081C4(uint64_t a1, void *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69LL * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69LL * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }

    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }

    uint64_t v12 = *(void **)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      uint64_t v13 = (void *)*v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v9)
          {
            if (v13[2] == *a2) {
              return v13;
            }
          }

          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= v10) {
                v14 %= v10;
              }
            }

            else
            {
              v14 &= v10 - 1;
            }

            if (v14 != v4) {
              break;
            }
          }

          uint64_t v13 = (void *)*v13;
        }

        while (v13);
      }
    }
  }

  uint64_t v15 = a1 + 16;
  int v16 = operator new(0x28uLL);
  v27[0] = v16;
  v27[1] = a1 + 16;
  void *v16 = 0LL;
  v16[1] = v9;
  uint64_t v17 = **a4;
  v16[3] = 0LL;
  v16[4] = 0LL;
  v16[2] = v17;
  char v28 = 1;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v10 || (float)(v19 * (float)v10) < v18)
  {
    BOOL v20 = 1LL;
    if (v10 >= 3) {
      BOOL v20 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v10);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    sub_10000671C(a1, v23);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }

    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }

  __int16 v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    void *v24 = v27[0];
  }

  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = v15;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8LL);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v25 >= v10) {
          v25 %= v10;
        }
      }

      else
      {
        v25 &= v10 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }

  uint64_t v13 = (void *)v27[0];
  v27[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_100008458((uint64_t)v27, 0LL);
  return v13;
}

void sub_100008440(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100008458(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_10000797C((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }

uint64_t sub_10000849C(uint64_t a1)
{
  uint64_t result = sub_1000084D4( *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(vm_address_t **)(a1 + 56),  *(unsigned int **)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_1000084D4(uint64_t a1, uint64_t a2, vm_address_t *a3, unsigned int *a4)
{
  if (!v26)
  {
    uint64_t v12 = 5LL;
    goto LABEL_28;
  }

  vm_address_t dest_address = 0LL;
  CFErrorRef error = 0LL;
  unint64_t v8 = sub_100006290(v26);
  unint64_t v9 = CFPropertyListCreateData(0LL, v8, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
  unint64_t v10 = v9;
  if (!v9 || !v8)
  {
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    int v16 = (os_log_s *)qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to create a plist to return to client",  buf,  2u);
    }

    if (error)
    {
      CFShow(error);
      CFRelease(error);
    }

    uint64_t v12 = 5LL;
    if (!v10) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  unsigned int Length = CFDataGetLength(v9);
  uint64_t v12 = vm_allocate(mach_task_self_, &dest_address, Length, 1);
  if ((_DWORD)v12)
  {
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v13 = (os_log_s *)qword_100019678;
    if (!os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    unint64_t v14 = mach_error_string(v12);
    *(_DWORD *)buf = 136315138;
    uint64_t v29 = v14;
    uint64_t v15 = "Failed to allocate: %s";
  }

  else
  {
    vm_map_t v17 = mach_task_self_;
    BytePtr = CFDataGetBytePtr(v10);
    uint64_t v12 = vm_copy(v17, (vm_address_t)BytePtr, Length, dest_address);
    if (!(_DWORD)v12)
    {
      *a3 = dest_address;
      *a4 = Length;
      goto LABEL_25;
    }

    vm_deallocate(mach_task_self_, dest_address, Length);
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v13 = (os_log_s *)qword_100019678;
    if (!os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    float v19 = mach_error_string(v12);
    *(_DWORD *)buf = 136315138;
    uint64_t v29 = v19;
    uint64_t v15 = "Failed to copy: %s";
  }

  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_25:
  CFRelease(v10);
LABEL_26:
  if (v8) {
    CFRelease(v8);
  }
LABEL_28:
  BOOL v20 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v12;
}

void sub_1000087DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_100008804(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = sub_100007CA4((void *)(v1 + 24), (void *)(a1 + 40));
  if (v3)
  {
    unint64_t v4 = v3;
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    int v5 = (os_log_s *)qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *v2;
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removed client %p", (uint8_t *)&v8, 0xCu);
    }

    if (*(_DWORD *)(v4[3] + 48LL))
    {
      int v7 = *(_DWORD *)(v1 + 72) - 1;
      *(_DWORD *)(v1 + 72) = v7;
      if (!v7) {
        sub_1000044D4(v1 + 80, 0);
      }
    }

    sub_100008948((void *)(v1 + 24), v4, (uint64_t)&v8);
    sub_100008458((uint64_t)&v8, 0LL);
  }

  if (!*(void *)(v1 + 48)) {
    *(void *)(v1 + 64) = 0LL;
  }
}

void *sub_100008948@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    int v7 = v6;
    uint64_t v6 = (void *)*v6;
  }

  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }

  else
  {
    v8 &= *(void *)&v3 - 1LL;
  }

  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }

    else
    {
      v9 &= *(void *)&v3 - 1LL;
    }

    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0LL;
  }

  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }

    else
    {
      v11 &= *(void *)&v3 - 1LL;
    }

    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }

  void *v7 = v10;
  *a2 = 0LL;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + _Block_object_dispose(va, 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t DVTIUIsAppleInternalOSEnvironment()
{
  if (qword_100019688 != -1) {
    dispatch_once(&qword_100019688, &stru_100014E28);
  }
  return byte_100019680;
}

void sub_100008ABC(id a1)
{
  byte_100019680 = os_variant_has_internal_ui("com.apple.dt");
}

uint64_t DVTIUUidForPid(int a1)
{
  *(void *)int v7 = 0xE00000001LL;
  int v8 = 1;
  int v9 = a1;
  size_t v4 = 648LL;
  int v1 = sysctl(v7, 4u, v5, &v4, 0LL, 0LL);
  if (v4) {
    BOOL v2 = v1 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2) {
    return v6;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100008B78(task_name_t a1)
{
  kern_return_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int x;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[8];
  int v14;
  uint64_t v15;
  uint64_t v16;
  if (a1 - 1 > 0xFFFFFFFD) {
    return 0LL;
  }
  uint64_t v15 = v1;
  int v16 = v2;
  int has_internal_content = os_variant_has_internal_content("com.apple.dt.instruments");
  unint64_t v14 = 2048;
  task_info_outCnt = 8;
  if (task_info(a1, 0xFu, task_info_out, &task_info_outCnt)) {
    return 0LL;
  }
  x = 0;
  unsigned int v6 = pid_for_task(a1, &x);
  uint64_t result = 0LL;
  if (!v6)
  {
    uint64_t v10 = 0;
    int v7 = proc_pidinfo(x, 30, 0LL, &v10, 4);
    uint64_t result = 0LL;
    if (v7 == 4)
    {
      int v8 = csops_audittoken(x, 0LL, &v14, 4LL, task_info_out);
      uint64_t result = 0LL;
      if (!v8)
      {
        if ((v14 & 4) == 0)
        {
          if ((v14 & 0x800) != 0)
          {
            return geteuid() == 0;
          }

          else
          {
            if ((v14 & 0x20000000) != 0) {
              int v9 = has_internal_content;
            }
            else {
              int v9 = 1;
            }
            if (v9) {
              return 3LL;
            }
            else {
              return 2LL;
            }
          }
        }

        return 3LL;
      }
    }
  }

  return result;
}

uint64_t DVTIsProcessDebuggable(task_name_t a1)
{
  return sub_100008B78(a1) & 1;
}

uint64_t DVTIsSimulatorProcess()
{
  return 0LL;
}

void sub_100008DB4(id a1)
{
  uint64_t v1 = objc_opt_new(&OBJC_CLASS___DTXPCServiceController);
  uint64_t v2 = (void *)qword_100019698;
  qword_100019698 = (uint64_t)v1;
}

id sub_100008F68()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v1 = [v0 BOOLForKey:@"DTXPCServiceControllerLog"];

  return v1;
}

LABEL_45:
LABEL_46:
    v38 = [v16 containsString:@"LaunchDaemons"];
    char v39 = [v16 containsString:@"LaunchAgents"];
    v40 = (void *)objc_claimAutoreleasedReturnValue([v16 pathExtension]);
    int64_t v41 = [v40 isEqualToString:@"plist"];

    if (!v41)
    {
      v106 = 0LL;
      int v46 = 0LL;
      goto LABEL_55;
    }

    if ((DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
    {
      v184 = NSLocalizedDescriptionKey;
      v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Daemon profiling is not supported on customer installations."));
      *(void *)buf = v54;
      v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v184,  1LL));
      pid_t v45 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v55));

LABEL_111:
      if (v45)
      {
        v114[2](v114, v16, 0LL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v45);
        goto LABEL_113;
      }

      v113 = 0xFFFFFFFFLL;
      pid_t v45 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v16));
      int v46 = (id)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"Label"]);

      v93 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"Program"]);
      v94 = v93;
      if (v93)
      {
        v106 = v93;
      }

      else
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:@"ProgramArguments"]);
        v106 = (id)objc_claimAutoreleasedReturnValue([v95 firstObject]);
      }

      if (!v46)
      {
        v196 = NSLocalizedDescriptionKey;
        v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to load plist for launchd job with path: %@",  0LL));
        v197 = v96;
        v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v197,  &v196,  1LL));
        v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v97));
        v114[2](v114, 0LL, 0LL, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v98);

        int v16 = v106;
        goto LABEL_113;
      }

      int v16 = v46;
LABEL_55:
      if ([v16 hasPrefix:@"com.apple."]
        && (DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
      {
        v194 = NSLocalizedDescriptionKey;
        v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC service is restricted: %@",  v16));
        v195 = v79;
        v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v195,  &v194,  1LL));
        v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v80));
        v114[2](v114, v16, 0LL, v113, 0xFFFFFFFFLL, v81);

        pid_t v45 = v46;
LABEL_113:

        uint64_t v15 = v114;
        goto LABEL_114;
      }

      if ((_DWORD)v113 == -1) {
        unsigned int v47 = 3;
      }
      else {
        unsigned int v47 = 1;
      }
      v102 = v14;
      if (sub_100008F68() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&uint8_t buf[4] = v47;
        *(_WORD *)&uint8_t buf[8] = 2112;
        *(void *)&buf[10] = v16;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v113 & ~((int)v113 >> 31);
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: calling xpc_service_create: serviceType=%d, identifier=%@, pid %d",  buf,  0x18u);
      }

      *(void *)buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v191 = sub_10000A5C4;
      v192 = sub_10000A5D4;
      v193 = 0LL;
      v184 = 0LL;
      v185 = &v184;
      v186 = 0x3032000000LL;
      v187 = sub_10000A5C4;
      v188 = sub_10000A5D4;
      v189 = 0LL;
      v180 = 0LL;
      v181 = &v180;
      v182 = 0x2020000000LL;
      v183 = 0;
      guard = (dispatch_queue_s *)v109->_guard;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000A5DC;
      block[3] = &unk_100014E98;
      block[4] = v109;
      int v16 = v16;
      v149 = v16;
      v156 = v113;
      char v49 = v118;
      v150 = v49;
      v153 = &v180;
      v158 = 1;
      v159 = v38;
      v160 = v39;
      v50 = v114;
      v152 = v50;
      pid_t v45 = v46;
      v151 = v45;
      v154 = buf;
      v157 = v47;
      v155 = &v184;
      v161 = v107;
      dispatch_sync(guard, block);
      if (*((_BYTE *)v181 + 24))
      {
        v178 = NSLocalizedDescriptionKey;
        unint64_t v14 = v102;
        v51 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC service name %@ already under observation for pid: %d",  v16,  v113));
        v179 = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v179,  &v178,  1LL));
        v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v52));
        v50[2](v50, v16, 0LL, v113, 0xFFFFFFFFLL, v53);

LABEL_107:
        _Block_object_dispose(&v180, 8);
        _Block_object_dispose(&v184, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_113;
      }

      unint64_t v14 = v102;
      if (!*(void *)(*(void *)&buf[8] + 40LL) && !v185[5])
      {
        v176 = NSLocalizedDescriptionKey;
        v51 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to create xpc registration object."));
        v177 = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v177,  &v176,  1LL));
        v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v52));
        v50[2](v50, v16, 0LL, v113, 0xFFFFFFFFLL, v90);

        goto LABEL_107;
      }

      v51 = objc_retainBlock(v50);
      v56 = v49;
      if (v107)
      {
        v143[0] = _NSConcreteStackBlock;
        v143[1] = 3221225472LL;
        v143[2] = sub_10000AB0C;
        v143[3] = &unk_100014EE8;
        v146 = v50;
        v143[4] = v109;
        v144 = v49;
        v145 = v16;
        v147 = v113;
        v57 = objc_retainBlock(v143);

        v51 = v57;
      }

      v58 = v113;
      v59 = *(void *)(*(void *)&buf[8] + 40LL);
      if (!v59)
      {
        v170 = NSLocalizedDescriptionKey;
        v82 = v16;
        v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Unable to register for xpc-based launch: %s (parent: %d)",  [v82 UTF8String],  v113));
        v171 = v52;
        v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v171,  &v170,  1LL));
        v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v83));
        (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v51 + 2))( v51,  v82,  0LL,  v113,  0xFFFFFFFFLL,  v84);

        goto LABEL_107;
      }

      v60 = v104;
      if ((v60 & 1) == 0)
      {
        v138[0] = _NSConcreteStackBlock;
        v138[1] = 3221225472LL;
        v139 = sub_10000ABD0;
        v140 = &unk_100014F10;
        v141 = v106;
        v142 = v16;
        v61 = v138;
        v169 = 0LL;
        *(_DWORD *)&v199[8] = 0;
        *(void *)v199 = 0xE00000001LL;
        sysctl((int *)v199, 3u, 0LL, &v169, 0LL, 0LL);
        v169 += 50LL;
        v62 = (char *)calloc(1uLL, v169);
        if (!sysctl((int *)v199, 3u, v62, &v169, 0LL, 0LL) && (int)(v169 / 0x288) >= 1)
        {
          v63 = (v169 / 0x288);
          v64 = v62 + 243;
          do
          {
            v65 = objc_autoreleasePoolPush();
            ((void (*)(void *, void, char *, void, void))v139)( v61,  *(unsigned int *)(v64 - 203),  v64,  *(unsigned int *)(v64 + 153),  *(unsigned int *)(v64 + 161));
            objc_autoreleasePoolPop(v65);
            v64 += 648;
            --v63;
          }

          while (v63);
        }

        free(v62);

        v59 = *(void *)(*(void *)&buf[8] + 40LL);
        v58 = v113;
      }

      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472LL;
      v126[2] = sub_10000AD40;
      v126[3] = &unk_100014F88;
      v135 = v108;
      v66 = v16;
      v127 = v66;
      v128 = v102;
      v136 = v103;
      v67 = v56;
      v129 = v67;
      v130 = v109;
      v131 = v115;
      v132 = v116;
      v51 = v51;
      v133 = v51;
      v134 = v58;
      v137 = v104 ^ 1;
      xpc_service_set_attach_handler(v59, v126);
      if (v111)
      {
        if (v108 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v199 = 138412290;
          *(void *)&v199[4] = v66;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: ExtensionAssertion Release Start %@",  v199,  0xCu);
        }

        v68 = (void *)objc_claimAutoreleasedReturnValue(+[PKManager defaultManager](&OBJC_CLASS___PKManager, "defaultManager"));
        v125 = 0LL;
        [v68 releaseHold:v111 withError:&v125];
        v69 = v125;

        v70 = v108;
        if (!v69) {
          v70 = 0;
        }
        if (v70 == 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v199 = 138412290;
          *(void *)&v199[4] = v69;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: ExtensionAssertion Release Error: %@",  v199,  0xCu);
        }

        v58 = v113;
      }

      if (v45)
      {
        if (v104) {
          v71 = 1LL;
        }
        else {
          v71 = 3LL;
        }
        v72 = xpc_service_kickstart_with_flags(*(void *)(*(void *)&buf[8] + 40LL), v71);
        if (!(_DWORD)v72) {
          goto LABEL_105;
        }
        if (v108)
        {
          v73 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            v74 = xpc_strerror(v72);
            *(_DWORD *)v199 = 136315138;
            *(void *)&v199[4] = v74;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "xpc_service_kickstart_with_flags error: %s",  v199,  0xCu);
          }

          v58 = v113;
        }

        v174 = NSLocalizedDescriptionKey;
        v75 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to launch: %@ (parent: %d) Error: %s",  v66,  v58,  xpc_strerror(v72));
        v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
        v175 = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v175,  &v174,  1LL));
        v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  3LL,  v77));
        (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v51 + 2))( v51,  v66,  0LL,  v58,  0xFFFFFFFFLL,  v78);
      }

      else
      {
        if (![v66 length] || !v110) {
          goto LABEL_105;
        }
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[PKHost defaultHost](&OBJC_CLASS___PKHost, "defaultHost"));
        v172 = PKIdentifierAttribute;
        v173 = v66;
        v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v173,  &v172,  1LL));
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472LL;
        v122[2] = sub_10000B69C;
        v122[3] = &unk_100014FB0;
        v87 = v66;
        v123 = v87;
        v124 = v110;
        v88 = (void *)objc_claimAutoreleasedReturnValue([v85 continuouslyDiscoverPlugInsForAttributes:v86 flags:512 found:v122]);

        v120[0] = _NSConcreteStackBlock;
        v120[1] = 3221225472LL;
        v120[2] = sub_10000B864;
        v120[3] = &unk_100014FD8;
        v89 = v88;
        v121 = v89;
        -[DTXPCServiceController _registryModify:identifier:parent:client:block:]( v109,  "_registryModify:identifier:parent:client:block:",  1LL,  v87,  v113,  v67,  v120);

        v76 = v123;
      }

LABEL_105:
      v52 = v127;
      goto LABEL_107;
    }

    *(void *)buf = 1024LL;
    v42 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 1024LL);
    if (sysctlbyname("kern.bootargs", -[NSMutableData mutableBytes](v42, "mutableBytes"), (size_t *)buf, 0LL, 0LL))
    {
      perror("sysctlbyname(kern.bootargs,...)");
      int v44 = 0LL;
    }

    else
    {
      -[NSMutableData setLength:](v42, "setLength:", *(void *)buf);
      id v43 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v42, 4LL);
      int v44 = v43;
      if (v43
        && (-[NSString rangeOfString:](v43, "rangeOfString:", @"amfi_unrestrict_task_for_pid=1") != (id)0x7FFFFFFFFFFFFFFFLL
         || -[NSString rangeOfString:](v44, "rangeOfString:", @"amfi=3") != (id)0x7FFFFFFFFFFFFFFFLL
         || -[NSString rangeOfString:](v44, "rangeOfString:", @"amfi_get_out_of_my_way=1") != (id)0x7FFFFFFFFFFFFFFFLL))
      {
        pid_t v45 = 0LL;
LABEL_110:

        goto LABEL_111;
      }
    }

    v180 = NSLocalizedDescriptionKey;
    v91 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"amfi_unrestrict_task_for_pid=1 is required in your boot-args to profile daemons or agents."));
    v184 = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v184,  &v180,  1LL));
    pid_t v45 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v92));

    goto LABEL_110;
  }

LABEL_114:
}

void sub_10000A574(_Unwind_Exception *a1)
{
}

uint64_t sub_10000A5C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A5D4(uint64_t a1)
{
}

void sub_10000A5DC(uint64_t a1)
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000AA10;
  v23[3] = &unk_100014E70;
  uint64_t v2 = *(void **)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  int v27 = *(_DWORD *)(a1 + 96);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 72);
  id v25 = v3;
  uint64_t v26 = v4;
  [v2 _matchRemove:v23];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    uint8x8_t v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96)));
    int v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

    if (!v7)
    {
      int v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      int v8 = *(void **)(*(void *)(a1 + 32) + 8LL);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 96)));
      [v8 setObject:v7 forKeyedSubscript:v9];
    }

    if (*(_BYTE *)(a1 + 104))
    {
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      *(_OWORD *)__str = 0u;
      __int128 v31 = 0u;
      if (*(_BYTE *)(a1 + 105) || *(_BYTE *)(a1 + 106))
      {
        if ((+[NSProcessInfo isAppleInternal](&OBJC_CLASS___NSProcessInfo, "isAppleInternal") & 1) == 0)
        {
          uint64_t v11 = *(void *)(a1 + 64);
          uint64_t v12 = *(void *)(a1 + 40);
          uint64_t v13 = *(unsigned int *)(a1 + 96);
          NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
          unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Launching a Daemon or Agent is not supported on iOS devices."));
          uint64_t v29 = v14;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
          int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v15));
          (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, void *))(v11 + 16))( v11,  v12,  0LL,  v13,  0xFFFFFFFFLL,  v16);

LABEL_28:
          goto LABEL_29;
        }

        snprintf( __str, 0x200uLL, "system/%s", (const char *)[*(id *)(a1 + 56) UTF8String]);
        uint64_t v10 = xpc_service_create_from_specifier(__str, *(void *)(*(void *)(a1 + 32) + 16LL));
      }

      else
      {
        uint64_t v10 = xpc_service_create( *(unsigned int *)(a1 + 100), [*(id *)(a1 + 40) UTF8String], *(_DWORD *)(a1 + 96) & ~(*(int *)(a1 + 96) >> 31), *(void *)(*(void *)(a1 + 32) + 16));
      }

      uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8LL);
      float v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v10;
    }

    if (sub_100008F68())
    {
      if (*(_BYTE *)(a1 + 104)) {
        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&__str[4] = "com.apple.dt.instruments.dtsecurity.xpc";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: calling xpc_connection_create: serviceName=%s",  (uint8_t *)__str,  0xCu);
      }
    }

    if (!*(_BYTE *)(a1 + 104))
    {
      xpc_connection_t v20 = xpc_connection_create("com.apple.dt.instruments.dtsecurity.xpc", 0LL);
      int v19 = 1;
      goto LABEL_19;
    }

LABEL_17:
    int v19 = 0;
    xpc_connection_t v20 = 0LL;
LABEL_19:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL), v20);
    if (v19) {

    }
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL)
      || *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL))
    {
      unint64_t v21 = objc_opt_new(&OBJC_CLASS___DTXPCRegistration);
      -[DTXPCRegistration setServiceIdentifier:](v21, "setServiceIdentifier:", *(void *)(a1 + 40));
      -[DTXPCRegistration setClient:](v21, "setClient:", *(void *)(a1 + 48));
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL);
      if (!v22) {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 40LL);
      }
      -[DTXPCRegistration setXpcObject:](v21, "setXpcObject:", v22);
      if (*(_BYTE *)(a1 + 107)) {
        -[DTXPCRegistration setOneshotHandler:](v21, "setOneshotHandler:", *(void *)(a1 + 64));
      }
      -[NSMutableArray addObject:](v7, "addObject:", v21);
    }

    goto LABEL_28;
  }

  xpc_connection_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assertionForPid:", *(unsigned int *)(a1 + 56), *(_OWORD *)v24, *(void *)&v24[16]));
  unint64_t v21 = v20;
  if (v20)
  {
    uint64_t v22 = *(void **)(a1 + 48);
    size_t v23 = objc_retainBlock(v20);
    [v22 addObject:v23];
  }

LABEL_20:
}

LABEL_29:
}

uint64_t sub_10000AA10(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = 1LL;
  if (*(id *)(a1 + 40) != v7)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
LABEL_4:
    uint64_t v8 = 0LL;
  }

  return v8;
}

uint64_t sub_10000AA84(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([v7 length]
    && [v8 length]
    && ![v7 isEqualToString:v8])
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    if (a3) {
      BOOL v9 = a4 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v11 = v9 || a3 == a4;
  }

  return v11;
}

void sub_10000AB0C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000ABA4;
  v3[3] = &unk_100014EC0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  [v2 _matchRemove:v3];
}

uint64_t sub_10000ABA4(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  if (*(void *)(a1 + 32) == a4) {
    return sub_10000AA84(*(void **)(a1 + 40), a2, *(_DWORD *)(a1 + 48), a3);
  }
  else {
    return 0LL;
  }
}

void sub_10000ABD0(uint64_t a1, pid_t pid)
{
  if (proc_pidpath(pid, buffer, 0x400u) >= 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingLastPathComponent]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"Info.plist"]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6, 0LL));
    if (v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v7,  0LL,  &v11,  0LL));
    }
    else {
      id v8 = 0LL;
    }
    if (*(void *)(a1 + 32) && (objc_msgSend(v4, "isEqualToString:") & 1) != 0
      || *(void *)(a1 + 40)
      && (BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CFBundleIdentifier"]),
          unsigned int v10 = [v9 isEqual:*(void *)(a1 + 40)],
          v9,
          v10))
    {
      kill(pid, 9);
    }
  }

void sub_10000AD40(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: xpc attach handler entered",  buf,  2u);
  }

  uint64_t pid = xpc_service_instance_get_pid(v3);
  if (*(_BYTE *)(a1 + 92))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int128 v39 = pid;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: xpc attach handler, uint64_t pid = %d",  buf,  8u);
    }

    if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      else {
        id v5 = "non-";
      }
      id v6 = [*(id *)(a1 + 32) UTF8String];
      *(_DWORD *)buf = 136315650;
      *(void *)__int128 v39 = v5;
      *(_WORD *)&v39[8] = 2080;
      *(void *)&v39[10] = v6;
      __int16 v40 = 1024;
      int v41 = pid;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "invoked for %sconfigurable service: %s pid: %d\n",  buf,  0x1Cu);
    }
  }

  if ((_DWORD)pid)
  {
    id v7 = [*(id *)(a1 + 40) mutableCopy];
    id v8 = v7;
    if (!*(_BYTE *)(a1 + 93)) {
      [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:DTAssertionManagerOptions_DontRemoveMemoryLimitsKey];
    }
    [v8 removeObjectForKey:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]];
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)pid, 0x80000000uLL, 0LL);
    if (v9)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10000B354;
      handler[3] = &unk_100014F38;
      char v35 = *(_BYTE *)(a1 + 92);
      int v34 = pid;
      id v32 = *(id *)(a1 + 48);
      unsigned int v10 = v9;
      __int128 v33 = v10;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume(v10);
    }

    else if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)__int128 v39 = pid;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "DTXPCServiceController: Failed to start observing process with pid %i",  buf,  8u);
    }

    if (xpc_service_instance_is_configurable(v3))
    {
      unsigned int v11 = [*(id *)(a1 + 56) _configureInstance:v3 identifier:*(void *)(a1 + 32) servicePid:pid environment:*(void *)(a1 + 64) arguments:*(void *)(a1 + 72) options:*(void *)(a1 + 40)];
      if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v12 = [*(id *)(a1 + 32) UTF8String];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)__int128 v39 = pid;
        *(_WORD *)&v39[4] = 2080;
        *(void *)&v39[6] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Watching pid %d '%s' for exec",  buf,  0x12u);
      }

      dispatch_source_t v13 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  (int)pid,  0xA0000000uLL,  *(dispatch_queue_t *)(*(void *)(a1 + 56) + 24LL));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10000B438;
      v21[3] = &unk_100014F60;
      unint64_t v14 = v13;
      uint64_t v22 = v14;
      char v30 = *(_BYTE *)(a1 + 92);
      int v27 = pid;
      id v23 = *(id *)(a1 + 32);
      id v24 = *(id *)(a1 + 48);
      id v25 = v8;
      id v26 = *(id *)(a1 + 80);
      int v28 = *(_DWORD *)(a1 + 88);
      unsigned int v29 = v11;
      dispatch_source_set_event_handler(v14, v21);
      dispatch_activate(v14);
      if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Calling xpc_service_instance_run",  buf,  2u);
      }

      xpc_service_instance_run(v3);
    }

    else
    {
      if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "xpc_service_instance_is_configurable(): false, existing service",  buf,  2u);
      }

      if (*(_BYTE *)(a1 + 94) && (int)pid >= 1)
      {
        if (*(_BYTE *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "killing service because we were instructed to kill existing services",  buf,  2u);
        }

        kill(pid, 9);
      }

      else
      {
        uint64_t v15 = *(void *)(a1 + 80);
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(unsigned int *)(a1 + 88);
        NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
        float v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"attempted to attach to an existing process (pid=%d) for XPC service '%@' using DTXPCServiceController - should use generic attach instead",  pid,  v16));
        __int128 v37 = v18;
        int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        xpc_connection_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  2LL,  v19));
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v15 + 16))( v15,  v16,  pid,  v17,  0xFFFFFFFFLL,  v20);
      }
    }
  }
}

void sub_10000B354(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 52) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = *(_DWORD *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    v5[0] = 67109378;
    v5[1] = v2;
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: pid %d died, releasing claims on assertions taken on behalf of client %@",  (uint8_t *)v5,  0x12u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[DTAssertionManager sharedInstance](&OBJC_CLASS___DTAssertionManager, "sharedInstance"));
  [v4 removeAssertionsForPid:*(unsigned int *)(a1 + 48) onBehalfOfClient:*(void *)(a1 + 32)];

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_10000B438(uint64_t a1)
{
  int v2 = *(dispatch_source_s **)(a1 + 32);
  int data = dispatch_source_get_data(v2);
  dispatch_source_cancel(v2);
  if ((data & 0x20000000) != 0)
  {
    if (*(_BYTE *)(a1 + 84) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v14 = *(_DWORD *)(a1 + 72);
      id v15 = [*(id *)(a1 + 40) UTF8String];
      *(_DWORD *)buf = 67109378;
      int v20 = v14;
      __int16 v21 = 2080;
      id v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Service pid %d '%s' exec-ed",  buf,  0x12u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[DTAssertionManager sharedInstance](&OBJC_CLASS___DTAssertionManager, "sharedInstance"));
    [v16 takeAssertionsForPid:*(unsigned int *)(a1 + 72) onBehalfOfClient:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 56)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else if (data < 0)
  {
    if (*(_BYTE *)(a1 + 84))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v4 = *(_DWORD *)(a1 + 72);
        id v5 = [*(id *)(a1 + 40) UTF8String];
        *(_DWORD *)buf = 67109378;
        int v20 = v4;
        __int16 v21 = 2080;
        id v22 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Service pid %d '%s'  exited before exec",  buf,  0x12u);
      }
    }

    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(unsigned int *)(a1 + 72);
    uint64_t v9 = *(unsigned int *)(a1 + 76);
    uint64_t v10 = *(unsigned int *)(a1 + 80);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Service exited before exec %d '%@'. ",  v8,  v7,  NSLocalizedDescriptionKey));
    float v18 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    dispatch_source_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  2LL,  v12));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8, v9, v10, v13);
  }

void sub_10000B69C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 count];
  if (!a3 && v6)
  {
    if ((unint64_t)[v5 count] >= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) UTF8String];
      id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
      *(_DWORD *)buf = 136315394;
      id v21 = v7;
      __int16 v22 = 2080;
      id v23 = [v8 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "warning: multiple plugins discovered for identifier '%s': { %s }\n",  buf,  0x16u);
    }

    [v5 count];
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (unint64_t i = 0LL; i != v11; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if (*(_BYTE *)(a1 + 40))
          {
            int v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v11);
    }
  }
}

void sub_10000B864(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v7 pkHandle]);
  int v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v3 || (v6 = v3 == v5, uint64_t v5 = v3, v6)) {
    [v7 setPkHandle:v5];
  }
}

void sub_10000BB8C(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (const char *)[v5 UTF8String];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);

  id v9 = v8;
  id v10 = (const char *)[v9 UTF8String];

  if (v7)
  {
    if (v10) {
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), v7, v10);
    }
  }

void sub_10000BE64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 88) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: daemon launch xpc attach handler entered",  (uint8_t *)&v6,  2u);
  }

  if (xpc_service_instance_is_configurable(v3))
  {
    uint64_t pid = xpc_service_instance_get_pid(v3);
    if (*(_BYTE *)(a1 + 88) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v6 = 67109120;
      int v7 = pid;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: daemon launch xpc attach handler, uint64_t pid = %d",  (uint8_t *)&v6,  8u);
    }

    unsigned int v5 = [*(id *)(a1 + 32) _configureInstance:v3 identifier:*(void *)(a1 + 40) servicePid:pid environment:*(void *)(a1 + 48) arguments:*(void *)(a1 + 56) options:&__NSDictionary0__struct];
    if (*(_BYTE *)(a1 + 88) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v6 = 67109120;
      int v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTXPCServiceController: daemon launch outputFD = %d",  (uint8_t *)&v6,  8u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16LL))();
    xpc_service_instance_set_path(v3, [*(id *)(a1 + 64) UTF8String]);
    xpc_service_instance_run(v3);
    xpc_service_set_attach_handler(*(void *)(a1 + 72), 0LL);
  }
}

void sub_10000C14C(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000C1EC;
  v4[3] = &unk_100015050;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  int v8 = *(_DWORD *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_10000C1EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
        if (!*(void *)(a1 + 32)
          || (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v16 + 1)
                                                                                 + 8LL * (void)v10), "client")),
              dispatch_source_t v13 = *(void **)(a1 + 32),
              v12,
              v12 == v13))
        {
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceIdentifier]);
          int v15 = sub_10000AA84(v14, *(void **)(a1 + 40), (int)[v5 intValue], *(_DWORD *)(a1 + 56));

          if (v15) {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }
}

void sub_10000C3E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000C4C4;
  v11[3] = &unk_1000150A0;
  id v8 = *(id *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v12 = v5;
  id v9 = v7;
  id v10 = v5;
  [v6 enumerateObjectsUsingBlock:v11];
  [v6 removeObjectsAtIndexes:v9];
}

void sub_10000C4C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceIdentifier]);
  id v8 = [*(id *)(a1 + 32) intValue];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 client]);
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, id, void *))(v6 + 16))(v6, v7, v8, v9);

  if ((_DWORD)v6)
  {
    [*(id *)(a1 + 40) addIndex:a3];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 pkHandle]);
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PKHost defaultHost](&OBJC_CLASS___PKHost, "defaultHost"));
      [v11 cancelPlugInDiscovery:v10];
    }

    id v12 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue([v5 oneshotHandler]);
    if (v12)
    {
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"XPC Service observer canceled or superceded."));
      __int128 v17 = v13;
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DTXPCServiceController",  1LL,  v14));
      ((void (**)(void, void, void, void, uint64_t, void *))v12)[2]( v12,  0LL,  0LL,  0LL,  0xFFFFFFFFLL,  v15);
    }
  }
}

void sub_10000C740(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000C7CC;
  v3[3] = &unk_100014EC0;
  int v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  [v2 _matchRemove:v3];
}

uint64_t sub_10000C7CC(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  if (*(void *)(a1 + 32) == a4) {
    return sub_10000AA84(*(void **)(a1 + 40), a2, *(_DWORD *)(a1 + 48), a3);
  }
  else {
    return 0LL;
  }
}

id sub_10000CA34()
{
  if (qword_1000196A8 != -1) {
    dispatch_once(&qword_1000196A8, &stru_100015138);
  }
  return (id)qword_1000196A0;
}

id sub_10000CA74(uint64_t a1)
{
  id v2 = sub_10000CA34();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "releasing assertion for pid %d", (uint8_t *)v6, 8u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000CB20(id a1)
{
  os_log_t v1 = os_log_create("com.apple.dt.Instruments", "RBSAssertion");
  id v2 = (void *)qword_1000196A0;
  qword_1000196A0 = (uint64_t)v1;
}

void sub_10000CED0(uint64_t a1, void *a2)
{
  id v2 = a2;
  v2[2]();
}

void sub_10000D0C0(id a1)
{
  os_log_t v1 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v2 = (void *)qword_1000196B8;
  qword_1000196B8 = (uint64_t)v1;

  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v4 = (void *)qword_1000196C0;
  qword_1000196C0 = (uint64_t)v3;

  id v5 = (void *)qword_1000196B8;
  int v6 = objc_opt_new(&OBJC_CLASS___DTBKSWatchdogAssertionFactory);
  [v5 addObject:v6];

  [(id)qword_1000196C0 addObject:DTProcessControlServiceOption_DisableWatchdogAssertionKey[0]];
  id v7 = (void *)qword_1000196B8;
  id v8 = objc_opt_new(&OBJC_CLASS___DTMemlimitAssertionFactory);
  [v7 addObject:v8];

  [(id)qword_1000196C0 addObject:DTAssertionManagerOptions_DontRemoveMemoryLimitsKey];
}

void sub_10000D1BC(id a1)
{
  os_log_t v1 = objc_opt_new(&OBJC_CLASS___DTAssertionManager);
  id v2 = (void *)qword_1000196D0;
  qword_1000196D0 = (uint64_t)v1;
}

void sub_10000D3E8(uint64_t a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 56)));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:"));
  id v3 = v2;
  if (v2)
  {
    [v2 addClaimForClient:*(void *)(a1 + 40)];
  }

  else
  {
    int v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000D520;
    v11[3] = &unk_1000151C8;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = v6;
    uint64_t v13 = v7;
    int v15 = *(_DWORD *)(a1 + 56);
    id v14 = v4;
    id v8 = v4;
    [v5 enumerateObjectsUsingBlock:v11];
    id v9 = -[DTAssertionPidInfo initForPid:withRemoveBlocks:onBehalfOfClient:]( objc_alloc(&OBJC_CLASS___DTAssertionPidInfo),  "initForPid:withRemoveBlocks:onBehalfOfClient:",  *(unsigned int *)(a1 + 56),  v8,  *(void *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v9 forKeyedSubscript:v10];
  }
}

void sub_10000D520(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 16LL);
  if (!v7) {
    goto LABEL_17;
  }
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:a3]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);
  if (!v11)
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    unsigned __int8 v13 = [v11 BOOLValue];
    goto LABEL_9;
  }

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v24 = 138412546;
      *(void *)&v24[4] = objc_opt_class(v11);
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v11;
      id v19 = *(id *)&v24[4];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "DTAssertionManager: options dictionary specified item of class %@ (%@) as disable value, don't know how to inter pret so leaving enabled",  v24,  0x16u);
    }

    goto LABEL_15;
  }

  unsigned __int8 v13 = [v11 integerValue] != 0;
LABEL_9:

  if ((v13 & 1) != 0)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v16 = [v15 BOOLForKey:@"DTAssertionManagerLog"];

    if (v16 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v17 = *(_DWORD *)(a1 + 56);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) objectAtIndex:a3]);
      *(_DWORD *)id v24 = 67109378;
      *(_DWORD *)&v24[4] = v17;
      *(_WORD *)&v24[8] = 2112;
      *(void *)&v24[10] = v18;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "DTAssertionManager: skipping taking of assertion for pid %d due to option %@ being set",  v24,  0x12u);
    }

    goto LABEL_20;
  }

void sub_10000D854(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:"));
  id v3 = v2;
  if (v2
    && [v2 removeClaimFromClient:*(void *)(a1 + 40)]
    && [v3 hasNoMoreClients])
  {
    [v3 removeAssertions];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v4];
  }
}

void sub_10000D968(uint64_t a1)
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 32LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10000DA18;
  v6[3] = &unk_100015218;
  id v7 = v3;
  id v8 = v2;
  id v5 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsForKeys:v5];
}

void sub_10000DA18(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 removeClaimFromClient:*(void *)(a1 + 32)]
    && [v5 hasNoMoreClients])
  {
    [v5 removeAssertions];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

_xpc_connection_s *xpc_message_has_privileges(_xpc_connection_s *result)
{
  if (result) {
    return (_xpc_connection_s *)(xpc_connection_get_euid(result) == 0);
  }
  return result;
}

id xpc_dictionary_get_archived_object(void *a1, const char *a2, uint64_t a3)
{
  id v5 = a1;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v5, a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    bytes_ptr = xpc_data_get_bytes_ptr(v8);
    id v10 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  bytes_ptr,  xpc_data_get_length(v8),  0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  a3,  objc_opt_class(&OBJC_CLASS___NSMutableString),  0LL);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v13,  v11,  0LL));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

uint64_t mach_exc_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_10000DC44(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0)
  {
LABEL_2:
    int v2 = -304;
    goto LABEL_3;
  }

  int v2 = -304;
  if (*(_DWORD *)(result + 24) == 2)
  {
    unsigned int v3 = *(_DWORD *)(result + 4);
    if (v3 >= 0x44 && v3 <= 0x54)
    {
      if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
      {
        int v2 = -300;
        goto LABEL_3;
      }

      unsigned int v4 = *(_DWORD *)(result + 64);
      if (v4 <= 2 && v4 <= (v3 - 68) >> 3 && v3 == 8 * v4 + 68) {
        sub_100007168();
      }
      goto LABEL_2;
    }
  }

LABEL_3:
  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000DD14(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0)
  {
    unsigned int v2 = result[1];
    if (v2 >= 0x30 && v2 <= 0x1480)
    {
      unsigned int v4 = result[9];
      if (v4 <= 2)
      {
        unsigned int v5 = 2 * v4;
        if (v4 <= (v2 - 48) >> 3 && v2 >= 8 * v4 + 48)
        {
          unsigned int v7 = result[v5 + 11];
          if (v7 <= 0x510)
          {
            unsigned int v8 = v2 - v5 * 4;
            if (v7 <= (v8 - 48) >> 2 && v8 == 4 * v7 + 48)
            {
              *(_DWORD *)(a2 + 40) = 1296;
              sub_100007168();
            }
          }
        }
      }
    }
  }

  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000DDF8(int a1)
{
  *(_DWORD *)(v3 - _Block_object_dispose(&STACK[0x350], 8) = a1;
  if (!a1)
  {
    *(NDR_record_t *)(v1 + 24) = NDR_record;
    *(_DWORD *)(v1 + 36) = *v2;
    *(_DWORD *)(v1 + 4) = 4 * *(_DWORD *)(v1 + 40) + 44;
    JUMPOUT(0x10000DDACLL);
  }

  JUMPOUT(0x10000DDA8LL);
}

uint64_t sub_10000DE2C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0)
  {
LABEL_2:
    int v2 = -304;
    goto LABEL_3;
  }

  int v2 = -304;
  if (*(_DWORD *)(result + 24) == 2)
  {
    unsigned int v3 = *(_DWORD *)(result + 4);
    if (v3 >= 0x4C && v3 <= 0x149C)
    {
      if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
      {
        int v2 = -300;
        goto LABEL_3;
      }

      unsigned int v5 = *(_DWORD *)(result + 64);
      if (v5 > 2) {
        goto LABEL_2;
      }
      int v2 = -304;
      if (v5 <= (v3 - 76) >> 3)
      {
        unsigned int v6 = 8 * v5;
        if (v3 >= 8 * v5 + 76)
        {
          unsigned int v7 = *(_DWORD *)(result + v6 + 72);
          if (v7 <= 0x510)
          {
            unsigned int v8 = v3 - v6;
            if (v7 <= (v8 - 76) >> 2 && v8 == 4 * v7 + 76)
            {
              *(_DWORD *)(a2 + 40) = 1296;
              sub_100007168();
            }
          }

          goto LABEL_2;
        }
      }
    }
  }

uint64_t sub_10000DF94(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    unsigned int v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x40 || v4 > 0x50) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }

    unsigned int v5 = *(_DWORD *)(result + 60);
    if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && v4 == 8 * v5 + 64)
    {
      uint64_t result = sub_100006FD8( *(_DWORD *)(result + 12),  *(void *)(result + 48),  *(_DWORD *)(result + 28),  *(unsigned int *)(result + 56),  result + 64);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }

  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t mach_exc_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x350], 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2411) >= 0xFFFFFFFA
    && (unsigned int v5 = (void (*)(void))*(&catch_mach_exc_subsystem + 5 * (v4 - 2405) + 5)) != 0LL)
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

void sub_10000E0DC(void *a1, _xpc_connection_s *a2)
{
  int v3 = a1;
  v4[0] = 67109376;
  v4[1] = xpc_connection_get_pid(a2);
  __int16 v5 = 2048;
  unsigned int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Denying connection from process (%d : %p) because it is missing an entitlement.",  (uint8_t *)v4,  0x12u);

  sub_100004304();
}

void sub_10000E178(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "Message";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "xpc caller did not provide a value for the required %s key",  (uint8_t *)&v1,  0xCu);
}

void sub_10000E1F8()
{
  v0 = __error();
  strerror(*v0);
  sub_1000042F0((void *)&_mh_execute_header, v1, v2, "stackshot failed (%s)", v3, v4, v5, v6, 2u);
  sub_100004304();
}

void sub_10000E270()
{
  v0 = __error();
  strerror(*v0);
  sub_1000042F0((void *)&_mh_execute_header, v1, v2, "failed to set flags on stackshot config (%s)", v3, v4, v5, v6, 2u);
  sub_100004304();
}

void sub_10000E2E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Missing configuration data for starting session",  v1,  2u);
}

void sub_10000E328(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_1000042F0((void *)&_mh_execute_header, v2, v3, "Failed to unarchive config data: %@", v4, v5, v6, v7, 2u);

  sub_100004304();
}

void sub_10000E3A4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E40C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E474()
{
  __assert_rtn("-[DTKTraceSessionCreator stopWithError:]", "DTKTraceHelpers.m", 243, "_stoppingSemaphore != NULL");
}

void sub_10000E49C()
{
  __assert_rtn("restorePort", "XRProcessWatcherExceptionPort.cp", 128, "_oldHandlerCount <= XRHOST_EXCEPTION_COUNT");
}

void sub_10000E4C4(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "failed to acquire assertion for pid %d: %{public}@",  (uint8_t *)v3,  0x12u);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}