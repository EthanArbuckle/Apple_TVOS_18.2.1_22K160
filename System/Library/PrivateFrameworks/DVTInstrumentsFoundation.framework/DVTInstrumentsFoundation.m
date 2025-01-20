id sub_100002880()
{
  if (qword_10000C9B0 != -1) {
    dispatch_once(&qword_10000C9B0, &stru_100008490);
  }
  return (id)qword_10000C9B8;
}

void sub_1000028C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100002880();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
    id v9 = [v8 UTF8String];
    id v10 = objc_claimAutoreleasedReturnValue([v5 description]);
    int v11 = 136315650;
    uint64_t v12 = a2;
    __int16 v13 = 2080;
    id v14 = v9;
    __int16 v15 = 2080;
    id v16 = [v10 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "failed to %s temporary memgraph with full disk stack logs at path %s with error %s",  (uint8_t *)&v11,  0x20u);
  }
}

id sub_1000029D0(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0LL;
  unsigned __int8 v4 = [v2 removeItemAtURL:v3 error:&v8];
  id v5 = v8;

  id v6 = 0LL;
  if ((v4 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id v6 = v5;
  }

  return v6;
}

id sub_100002A64(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 stackLogReader]);
  id v5 = [v4 streamFullStackLogsToBlock:v3];

  return v5;
}

LABEL_19:
    v23 = 1;
LABEL_20:
    v112 = v23;
    corpse_task_port = 0;
    v24 = self->_targetTask;
    v25 = sub_100002880();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Init memory scanner",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    if (v17)
    {
      v27 = task_generate_corpse(self->_targetTask, &corpse_task_port);
      if ((_DWORD)v27)
      {
        v28 = -[LeakAgent logAndGenerateReceiptForErrorWithFormat:]( self,  "logAndGenerateReceiptForErrorWithFormat:",  @"failed to generate corpse: %#x - %s",  v27,  mach_error_string(v27));
        int v11 = objc_claimAutoreleasedReturnValue(v28);
LABEL_119:

        _Block_object_dispose(&v132, 8);
        goto LABEL_120;
      }

      v29 = sub_100002880();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = self->_targetPid;
        v32 = self->_targetTask;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v138 = v31;
        *(_WORD *)&v138[4] = 1024;
        *(_DWORD *)&v138[6] = v32;
        v139 = 1024;
        LODWORD(v140[0]) = corpse_task_port;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "generated a corpse for pid: %u (task: %#x): %#x",  buf,  0x14u);
      }

      v24 = corpse_task_port;
    }

    v33 = [[VMUTaskMemoryScanner alloc] initWithTask:v24 options:v22];
    if (!v33)
    {
      int v11 = objc_claimAutoreleasedReturnValue( -[LeakAgent logAndGenerateReceiptForErrorWithFormat:]( self,  "logAndGenerateReceiptForErrorWithFormat:",  @"failed to create a VMUTaskMemoryScanner, probably because the target's libmalloc hasn't been initialized"));
      v116 = 0LL;
LABEL_118:

      goto LABEL_119;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ScannerSettings"]);

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ScannerSettings"]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ScannerSettingExactScanningEnabled"]);
      objc_msgSend(v33, "setExactScanningEnabled:", objc_msgSend(v36, "BOOLValue"));

      v37 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ScannerSettingAbandonedMarkingEnabled"]);
      objc_msgSend(v33, "setAbandonedMarkingEnabled:", objc_msgSend(v37, "BOOLValue"));

      v38 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ScannerSettingShowRawClassNames"]);
      objc_msgSend(v33, "setShowRawClassNames:", objc_msgSend(v38, "BOOLValue"));

      v39 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ScannerSettingObjectContentLevel"]);
      objc_msgSend(v33, "setObjectContentLevel:", objc_msgSend(v39, "unsignedIntValue"));

      v40 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ScannerSettingScanningMask"]);
      objc_msgSend(v33, "setScanningMask:", objc_msgSend(v40, "unsignedIntValue"));

      v41 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"ScannerSettingMaxInteriorOffset"]);
      v42 = v41;
      if (v41) {
        objc_msgSend(v33, "setMaxInteriorOffset:", objc_msgSend(v41, "unsignedLongValue"));
      }
    }

    v43 = sub_100002880();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Init memory scanner",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    v45 = sub_100002880();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v46,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Add root and malloc nodes",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    v130 = 0LL;
    int v11 = (uint64_t)[v33 addAllNodesFromTaskWithError:&v130];
    v47 = v130;
    v48 = v47;
    if ((v11 & 1) != 0)
    {
      v49 = 0;
    }

    else
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v47 localizedDescription]);
      int v11 = objc_claimAutoreleasedReturnValue( -[LeakAgent logAndGenerateReceiptForErrorWithFormat:]( self,  "logAndGenerateReceiptForErrorWithFormat:",  @"failed to add nodes to VMUTaskMemoryScanner with the error %@",  v50));

      v49 = 1;
    }

    v51 = sub_100002880();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v52,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Add root and malloc nodes",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    if (v49)
    {
      v116 = 0LL;
      goto LABEL_67;
    }

    v53 = sub_100002880();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v54,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Process graph",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProcessSnapshotGraphOptions"]);
    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ProcessSnapshotGraphOptions"]);
      v57 = [v56 unsignedLongValue];

      v58 = objc_claimAutoreleasedReturnValue([v33 processSnapshotGraphWithOptions:v57]);
    }

    else
    {
      v58 = objc_claimAutoreleasedReturnValue([v33 processSnapshotGraph]);
    }

    v59 = (void *)v58;
    v60 = sub_100002880();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v61,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Process graph",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    v62 = sub_100002880();
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v63,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Find leaks",  (const char *)&unk_1000074FF,  buf,  2u);
    }

    if (!v118)
    {
      v116 = v59;
LABEL_64:
      v72 = sub_100002880();
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
      if (os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v73,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Find leaks",  (const char *)&unk_1000074FF,  buf,  2u);
      }

      v49 = 0;
LABEL_67:
      [v33 detachFromTask];
      v74 = sub_100002880();
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        v76 = self->_targetPid;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v138 = v76;
        *(_WORD *)&v138[4] = 1024;
        *(_DWORD *)&v138[6] = v24;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "detached from process: %u (%#x)", buf, 0xEu);
      }

      if (corpse_task_port - 1 <= 0xFFFFFFFD) {
        mach_port_deallocate(mach_task_self_, corpse_task_port);
      }
      if (v49) {
        goto LABEL_118;
      }
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      if ((_DWORD)v24 == self->_targetTask)
      {
        task_info_outCnt = 10;
        if (task_info(v24, 0x12u, (task_info_t)buf, &task_info_outCnt))
        {
          int v11 = objc_claimAutoreleasedReturnValue( -[LeakAgent logAndGenerateReceiptForErrorWithFormat:]( self,  "logAndGenerateReceiptForErrorWithFormat:",  @"target process no longer exists"));
LABEL_117:

          goto LABEL_118;
        }
      }

      if (((v114 ^ 1 | v118) & 1) == 0)
      {
        v78 = sub_100002880();
        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_signpost_enabled(v79))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v79,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Count leaks",  (const char *)&unk_1000074FF,  buf,  2u);
        }

        v125[0] = _NSConcreteStackBlock;
        v125[1] = 3221225472LL;
        v125[2] = sub_100003E80;
        v125[3] = &unk_100008400;
        v126 = v116;
        v128 = &v132;
        v127 = v120;
        VMUWithRootNodeMarkingMap(v126, v125);
        v80 = sub_100002880();
        v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_signpost_enabled(v81))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v81,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Count leaks",  (const char *)&unk_1000074FF,  buf,  2u);
        }
      }

      if ((v113 | v115) == 1)
      {
        v82 = sub_100002880();
        v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
        if (os_signpost_enabled(v83))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v83,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Count marked",  (const char *)&unk_1000074FF,  buf,  2u);
        }

        v84 = [v116 copyUserMarked];
        if (v115)
        {
          v85 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }

        else
        {
          v85 = 0LL;
        }

        if (v84)
        {
          v123[0] = _NSConcreteStackBlock;
          v123[1] = 3221225472LL;
          v123[2] = sub_100003FBC;
          v123[3] = &unk_1000083D8;
          v124 = v85;
          v86 = [v116 enumerateMarkedObjects:v84 withBlock:v123];
          free(v84);
        }

        else
        {
          v86 = 0LL;
        }

        if (v113)
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v86));
          [v77 setObject:v87 forKeyedSubscript:@"MarkedCount"];
        }

        if (v115) {
          [v77 setObject:v85 forKeyedSubscript:@"MarkedAddresses"];
        }
        v88 = sub_100002880();
        v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_signpost_enabled(v89))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v89,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Count marked",  (const char *)&unk_1000074FF,  buf,  2u);
        }
      }

      v90 = sub_100002880();
      v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
      if (os_signpost_enabled(v91))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v91,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Serialize graph",  (const char *)&unk_1000074FF,  buf,  2u);
      }

      v92 = (void *)objc_claimAutoreleasedReturnValue([v116 plistRepresentationWithOptions:v112]);
      v93 = sub_100002880();
      v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
      if (os_signpost_enabled(v94))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v94,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Serialize graph",  (const char *)&unk_1000074FF,  buf,  2u);
      }

      v95 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CollectFullDiskStackLogs"]);
      v96 = [v95 BOOLValue];

      if (v96)
      {
        v122 = 0LL;
        v97 = objc_claimAutoreleasedReturnValue( -[LeakAgent getSerializedGraphWithFullDiskStackLogs:serializedGraph:error:]( self,  "getSerializedGraphWithFullDiskStackLogs:serializedGraph:error:",  v116,  v92,  &v122));
        v98 = v122;

        if (!v97)
        {
          v110 = (void *)objc_claimAutoreleasedReturnValue([v98 localizedDescription]);
          int v11 = objc_claimAutoreleasedReturnValue( -[LeakAgent logAndGenerateReceiptForErrorWithFormat:]( self,  "logAndGenerateReceiptForErrorWithFormat:",  @"failed to collect full disk stack logs with the error %@",  v110));

LABEL_116:
          goto LABEL_117;
        }

        v92 = (void *)v97;
      }

      else if (!v92)
      {
        v98 = 0LL;
        goto LABEL_107;
      }

      [v77 setObject:v92 forKeyedSubscript:@"SerializedGraph"];
      v98 = v92;
LABEL_107:
      if (v114)
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v133 + 6)));
        [v77 setObject:v99 forKeyedSubscript:@"LeakedCount"];
      }

      if (v119) {
        [v77 setObject:v120 forKeyedSubscript:@"LeakedAddresses"];
      }
      v100 = sub_100002880();
      v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        v102 = v77;
        v103 = self->_targetPid;
        v104 = [v116 nodeCount];
        v105 = [v116 edgeCount];
        v106 = *((_DWORD *)v133 + 6);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v138 = v103;
        *(_WORD *)&v138[4] = 1024;
        *(_DWORD *)&v138[6] = v104;
        v139 = 1024;
        LODWORD(v140[0]) = v105;
        WORD2(v140[0]) = 1024;
        *(_DWORD *)((char *)v140 + 6) = v106;
        _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_INFO,  "returning result for pid %u with %u nodes, %u edges (%u leaked)",  buf,  0x1Au);
        v77 = v102;
      }

      v107 = sub_100002880();
      v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
      if (os_signpost_enabled(v108))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v108,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Request memgraph",  (const char *)&unk_1000074FF,  buf,  2u);
      }

      int v11 = v77;
      goto LABEL_116;
    }

    v64 = [[VMULeakDetector alloc] initWithTask:self->_targetTask graph:v59 scanner:v33 stackLogReader:0];
    [v64 setSuppressOutput:1];
    v129 = 0LL;
    v65 = [v64 doNormalLeakDetectionWithError:&v129];
    v66 = v129;
    *((_DWORD *)v133 + 6) = v65;
    v111 = v66;
    if (v66)
    {
      v67 = sub_100002880();
      v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = objc_claimAutoreleasedReturnValue([v111 localizedDescription]);
        *(_DWORD *)buf = 138412290;
        *(void *)v138 = v69;
        v117 = (void *)v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "LeakDetector error: %@", buf, 0xCu);
      }

      v116 = 0LL;
    }

    else
    {
      if (!v65)
      {
        v116 = 0LL;
        goto LABEL_63;
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue([v64 graph]);
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "subgraphWithMarkedNodes:", objc_msgSend(v64, "leakedNodes")));
      v71 = v70;
      v68 = (os_log_s *)v59;
      v59 = v71;
    }

LABEL_63:
    goto LABEL_64;
  }

  int v11 = objc_claimAutoreleasedReturnValue( -[LeakAgent logAndGenerateReceiptForErrorWithFormat:]( self,  "logAndGenerateReceiptForErrorWithFormat:",  @"no valid task available"));
LABEL_120:

  return (id)v11;
}

void sub_100003DA8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x100003674LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_100003E80(uint64_t a1, _DWORD *a2)
{
  int v4 = *a2;
  unint64_t v5 = (*a2 + 7);
  if (v5 >= 8)
  {
    id v6 = a2 + 1;
    uint64_t v7 = v5 >> 3;
    if (v5 >> 3 <= 1) {
      uint64_t v7 = 1LL;
    }
    do
    {
      *id v6 = ~*v6;
      ++v6;
      --v7;
    }

    while (v7);
  }

  int v8 = v4 & 7;
  if (v8) {
    *((_BYTE *)a2 + (v5 >> 3) + 3) ^= -1 << v8;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003F70;
  v10[3] = &unk_1000083D8;
  id v9 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 enumerateMarkedObjects:a2 withBlock:v10];
}

void sub_100003F70(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", *a3));
  [v3 addObject:v4];
}

void sub_100003FBC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", *a3));
  [v3 addObject:v4];
}

uint64_t start(int a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  uint64_t v63 = 0LL;
  v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  int v66 = 0;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  int v62 = 0;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = sub_100004D8C;
  v57 = sub_100004D9C;
  id v58 = 0LL;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100004DA4;
  v52[3] = &unk_100008428;
  v52[4] = &v63;
  v52[5] = &v53;
  DTXSubtaskCheckin(v52);
  uint64_t v5 = *((unsigned int *)v64 + 6);
  id v6 = objc_autoreleasePoolPush();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 arguments]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
  [v10 setObject:v12 atIndexedSubscript:0];

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@" "]);
  [v7 appendFormat:@"Command args:    %@\n", v13];

  if ((_DWORD)v5)
  {
    id v14 = [[VMUProcessDescription alloc] initWithTask:v5 getBinariesList:0];
    __int16 v15 = v14;
    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 executablePath]);
      [v7 appendFormat:@"Target process:  %@ [%u]\n", v16, objc_msgSend(v15, "pid")];

      if ((int)[v15 parentPid] >= 1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 parentProcessPath]);
        [v7 appendFormat:@"Parent process:  %@ [%u]\n", v17, objc_msgSend(v15, "parentPid")];
      }

      if (!isatty(0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v15 executablePath]);
        unsigned int v19 = [v15 pid];
        *(_DWORD *)buf = 138412546;
        *(void *)v68 = v18;
        *(_WORD *)&v68[8] = 1024;
        *(_DWORD *)v69 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "examining %@ [%u]",  buf,  0x12u);
      }
    }
  }

  if (qword_10000C9C0) {
    free((void *)qword_10000C9C0);
  }
  v20 = [v7 length];
  v21 = (char *)malloc((size_t)(v20 + 1));
  qword_10000C9C0 = (uint64_t)v21;
  id v22 = v7;
  strncpy(v21, (const char *)[v22 UTF8String], (size_t)v20);
  uint64_t v23 = qword_10000C9C0;
  v20[qword_10000C9C0] = 0;
  qword_10000C978 = v23;

  objc_autoreleasePoolPop(v6);
  if (pid_for_task(*((_DWORD *)v64 + 6), (int *)v60 + 6) || !v54[5])
  {
    id v45 = sub_100002880();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      int v47 = *((_DWORD *)v60 + 6);
      int v48 = *((_DWORD *)v64 + 6);
      uint64_t v49 = v54[5];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v68 = v47;
      *(_WORD *)&v68[4] = 1024;
      *(_DWORD *)&v68[6] = v48;
      *(_WORD *)v69 = 2048;
      *(void *)&v69[2] = v49;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "invalid checkin, terminating: (%u:%#x, %p)",  buf,  0x18u);
    }

    exit(-1);
  }

  if (!*((_DWORD *)v60 + 6))
  {
    if (a1 != 2)
    {
      int v37 = 1;
      fwrite("usage: LeakAgent <pid>", 0x16uLL, 1uLL, __stderrp);
      unsigned int v36 = 1;
      goto LABEL_28;
    }

    int v24 = strtoul(*(const char **)(a2 + 8), 0LL, 10);
    *((_DWORD *)v60 + 6) = v24;
  }

  id v25 = sub_100002880();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    int v27 = *((_DWORD *)v60 + 6);
    int v28 = *((_DWORD *)v64 + 6);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v68 = v27;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "examining process: %d (%#x)", buf, 0xEu);
  }

  if (v54[5])
  {
    uint64_t v29 = *(void *)(a2 + 16);
    id v30 = objc_alloc(&OBJC_CLASS___DTXConnection);
    id v31 = [v30 initWithTransport:v54[5]];
    v32 = v31;
    if (v31)
    {
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100004F88;
      v51[3] = &unk_100008450;
      v51[4] = &v59;
      [v31 setMessageHandler:v51];
      v50 = objc_alloc(&OBJC_CLASS___LeakAgent);
      objc_msgSend( v32,  "setDispatchTarget:",  -[LeakAgent initWithTask:pid:](v50, "initWithTask:pid:", *((unsigned int *)v64 + 6), *((unsigned int *)v60 + 6)));
      [v32 resume];
      dispatch_main();
    }

    id v33 = sub_100002880();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v35 = *((_DWORD *)v60 + 6);
      *(_DWORD *)buf = 136315394;
      *(void *)v68 = v29;
      *(_WORD *)&v68[8] = 1024;
      *(_DWORD *)v69 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "failed to create connection to host: %s (target: %u)",  buf,  0x12u);
    }

    unsigned int v36 = 3;
    int v37 = 1;
  }

  else
  {
    v38 = objc_autoreleasePoolPush();
    unsigned int v36 = task_read_for_pid(mach_task_self_, *((unsigned int *)v60 + 6), v64 + 3);
    if (v36)
    {
      fprintf(__stderrp, "task_for_pid failed: %d \n", v36);
      int v37 = 1;
    }

    else
    {
      v39 = objc_alloc(&OBJC_CLASS___LeakAgent);
      v40 = -[LeakAgent initWithTask:pid:]( v39,  "initWithTask:pid:",  *((unsigned int *)v64 + 6),  *((unsigned int *)v60 + 6));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[LeakAgent serializedGraphWithOptions:](v40, "serializedGraphWithOptions:", &off_1000089E0));
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:@"SerializedGraph"]);
      id v43 = [[VMUProcessObjectGraph alloc] initWithPlistRepresentation:v42];
      NSLog(@"%u", [v43 nodeCount]);

      int v37 = 0;
    }

    objc_autoreleasePoolPop(v38);
  }

LABEL_28:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  objc_autoreleasePoolPop(v4);
  if (v37) {
    return v36;
  }
  else {
    return 0LL;
  }
}

void sub_100004D34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_100004D8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004D9C(uint64_t a1)
{
}

void sub_100004DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  id v16 = sub_100005064;
  v17 = &unk_1000084B8;
  v18 = &v19;
  uint64_t v5 = v15;
  __int128 v24 = 0u;
  memset(msg, 0, sizeof(msg));
  if (mach_msg((mach_msg_header_t *)msg, 2, 0, 0x30u, a3, 0, 0) || *(_DWORD *)&msg[20] == 70)
  {
    ((void (*)(void *, void, uint64_t, void))v16)(v5, 0LL, 4LL, 0LL);
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 4LL;
    if (HIDWORD(v24) + *(_DWORD *)&msg[4] == 48)
    {
      uint64_t v8 = 0LL;
      if (*(_DWORD *)&msg[24] == 1)
      {
        if (!HIBYTE(DWORD1(v24))
          && ((int v9 = HIWORD(DWORD1(v24)), (HIWORD(DWORD1(v24)) - 22) < 0xFFFFFFFA)
           || (*(_DWORD *)msg & 0x80000000) != 0))
        {
          if (v9 == 16) {
            unsigned int v10 = 1;
          }
          else {
            unsigned int v10 = 4 * ((v9 - 17) > 4);
          }
          else {
            uint64_t v7 = v10;
          }
          uint64_t v6 = *(unsigned int *)&msg[28];
          uint64_t v8 = *(unsigned int *)&msg[8];
        }

        else
        {
          uint64_t v6 = 0LL;
          uint64_t v8 = 0LL;
        }
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    ((void (*)(void *, uint64_t, uint64_t, uint64_t))v16)(v5, v6, v7, v8);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  int v11 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v11;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[DTXMachTransport fileDescriptorHandshakeWithReceivePort:]( &OBJC_CLASS___DTXMachTransport,  "fileDescriptorHandshakeWithReceivePort:",  a3));
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void sub_100004F70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100004F88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 errorStatus] != 2)
  {
    id v4 = sub_100002880();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "received unexpected message: %@ - terminating (target: %u)",  (uint8_t *)&v7,  0x12u);
    }
  }

  exit(1);
}

void sub_100005034(id a1)
{
  os_log_t v1 = os_log_create("com.apple.LeakAgent", "memgraph");
  v2 = (void *)qword_10000C9B8;
  qword_10000C9B8 = (uint64_t)v1;
}

uint64_t sub_100005064(uint64_t result, mach_port_name_t a2, int a3)
{
  if (!a3)
  {
    uint64_t v4 = result;
    result = mach_port_mod_refs(mach_task_self_, a2, 0, 1);
    if (!(_DWORD)result) {
      *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 8LL) + 24LL) = a2;
    }
  }

  return result;
}

id objc_msgSend_vmRegionRangeInfoForRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vmRegionRangeInfoForRange:");
}