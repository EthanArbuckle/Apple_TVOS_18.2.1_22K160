int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3;
  void *v4;
  os_log_s *v5;
  uint8_t v6[16];
  v3 = os_log_create("com.apple.dt.DTMLModelRunnerService", "CoreMLPerf");
  v4 = off_1000348E8;
  off_1000348E8 = v3;

  v5 = (os_log_s *)off_1000348E8;
  if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CoreML: (XPC) Started XPC service", v6, 2u);
  }

  xpc_main((xpc_connection_handler_t)sub_100002968);
}

void sub_100002968(void *a1)
{
  id v1 = a1;
  v2 = (os_log_s *)off_1000348E8;
  if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CoreML: (XPC) creating event handler", buf, 2u);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100002A24;
  handler[3] = &unk_100030D68;
  id v5 = v1;
  v3 = (_xpc_connection_s *)v1;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_resume(v3);
}

void sub_100002A24(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (os_log_s *)off_1000348E8;
  if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) event handler fired",  (uint8_t *)&buf,  2u);
  }

  xpc_type_t type = xpc_get_type(v3);
  v6 = (os_log_s *)off_1000348E8;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_ERROR)) {
      sub_1000241D0(v6, v32, v33, v34, v35, v36, v37, v38);
    }
  }

  else
  {
    xpc_type_t v7 = type;
    if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) event handler no error",  (uint8_t *)&buf,  2u);
    }

    if (v7 != (xpc_type_t)&_xpc_type_dictionary) {
      sub_100024380();
    }
    v8 = (os_log_s *)off_1000348E8;
    if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) event handler asserted dictionary",  (uint8_t *)&buf,  2u);
    }

    id v9 = *(id *)(a1 + 32);
    id v10 = v3;
    string = xpc_dictionary_get_string(v10, "command");
    if (!string)
    {
      v69 = (os_log_s *)off_1000348E8;
      if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_ERROR)) {
        sub_100024204(v69, v70, v71, v72, v73, v74, v75, v76);
      }
      exit(101);
    }

    v12 = string;
    if (!strcmp(string, "getPID"))
    {
      id v39 = v10;
      v40 = (_xpc_connection_s *)v9;
      pid_t pid = xpc_connection_get_pid(v40);
      v42 = (os_log_s *)off_1000348E8;
      if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = pid;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) getPID - PID is %i",  (uint8_t *)&buf,  8u);
        v42 = (os_log_s *)off_1000348E8;
      }

      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) event handler creating reply",  (uint8_t *)&buf,  2u);
      }

      xpc_object_t reply = xpc_dictionary_create_reply(v39);

      xpc_dictionary_set_int64(reply, "pid", pid);
      xpc_connection_send_message(v40, reply);

      v44 = (os_log_s *)off_1000348E8;
      if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) about to SIGSTOP",  (uint8_t *)&buf,  2u);
      }

      pid_t v45 = getpid();
      kill(v45, 17);
      v46 = (os_log_s *)off_1000348E8;
      if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) did SIGSTOP",  (uint8_t *)&buf,  2u);
      }
    }

    else
    {
      if (strcmp(v12, "profile"))
      {
        v77 = (os_log_s *)off_1000348E8;
        if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_ERROR)) {
          sub_10002434C(v77, v78, v79, v80, v81, v82, v83, v84);
        }
        exit(102);
      }

      v13 = (_xpc_connection_s *)v9;
      id v14 = v10;
      pid_t v15 = xpc_connection_get_pid(v13);
      v16 = (os_log_s *)off_1000348E8;
      if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) profile command - PID is %i",  (uint8_t *)&buf,  8u);
      }

      v17 = xpc_dictionary_get_string(v14, "modelFileName");
      if (v17)
      {
        v18 = v17;
        v19 = xpc_dictionary_get_string(v14, "containerGUID");
        if (v19)
        {
          v20 = v19;
          v88 = v13;
          int64_t int64 = xpc_dictionary_get_int64(v14, "computeUnit");
          v21 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = int64;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received computeUnit value: %ld",  (uint8_t *)&buf,  0xCu);
          }

          int64_t v93 = xpc_dictionary_get_int64(v14, "experimentIterations");
          v22 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v93;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received experimentIterations value: %ld",  (uint8_t *)&buf,  0xCu);
          }

          int64_t v92 = xpc_dictionary_get_int64(v14, "loadCount");
          v23 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v92;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received loadCount value: %ld",  (uint8_t *)&buf,  0xCu);
          }

          int64_t v91 = xpc_dictionary_get_int64(v14, "predictionCount");
          v24 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v91;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received predictionCount value: %ld",  (uint8_t *)&buf,  0xCu);
          }

          int64_t v90 = xpc_dictionary_get_int64(v14, "maxPredictionTime");
          v25 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v90;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received maxPredictionTime value: %ld",  (uint8_t *)&buf,  0xCu);
          }

          int64_t v89 = xpc_dictionary_get_int64(v14, "maxIterationTime");
          v26 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v89;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received maxIterationTime value: %ld",  (uint8_t *)&buf,  0xCu);
          }

          pid_t v86 = v15;
          v27 = xpc_dictionary_get_string(v14, "functionName");
          v28 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) received functionName value: '%s'",  (uint8_t *)&buf,  0xCu);
          }

          id v87 = v9;
          uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v18));
          uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v20));
          if (v27) {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v27));
          }
          else {
            v31 = 0LL;
          }
          v85 = (void *)v30;
          v63 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v30);
          v64 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) initializing PerfRunner",  (uint8_t *)&buf,  2u);
          }

          v65 = -[PerfRunConfig initWithExperimentIterations:loadCount:predictionCount:maxPredictionTime:maxIterationTime:functionName:]( objc_alloc(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig),  "initWithExperimentIterations:loadCount:predictionCount:maxPredictionTime:maxIterationTime:functionName:",  v93,  v92,  v91,  v90,  v89,  v31);
          v66 = -[ModelLocation initWithTempFolderGuid:fileName:]( objc_alloc(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation),  "initWithTempFolderGuid:fileName:",  v63,  v29);
          v67 = (void *)v29;
          v68 = -[PerfRunner initWithConfig:]( objc_alloc(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner),  "initWithConfig:",  v65);
          *(void *)&__int128 buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472LL;
          v96 = sub_1000032B8;
          v97 = &unk_100030D90;
          id v98 = v14;
          pid_t v100 = v86;
          v13 = v88;
          v99 = v88;
          -[PerfRunner runWithModelLocation:computeUnits:perfRunConfig:completionHandler:]( v68,  "runWithModelLocation:computeUnits:perfRunConfig:completionHandler:",  v66,  int64,  v65,  &buf);

          id v9 = v87;
        }

        else
        {
          v55 = (os_log_s *)off_1000348E8;
          if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_ERROR)) {
            sub_1000242DC(v55, v56, v57, v58, v59, v60, v61, v62);
          }
        }
      }

      else
      {
        v47 = (os_log_s *)off_1000348E8;
        if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_ERROR)) {
          sub_10002426C(v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
    }
  }
}

void sub_1000032B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (os_log_s *)off_1000348E8;
  if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "CoreML: (XPC) event handler creating reply",  buf,  2u);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v6 = v3;
  xpc_dictionary_set_string(reply, "timerData", (const char *)[v6 UTF8String]);
  xpc_dictionary_set_int64(reply, "pid", *(int *)(a1 + 48));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_type_t v7 = (os_log_s *)off_1000348E8;
  if (os_log_type_enabled((os_log_t)off_1000348E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CoreML: (XPC) event handler sent reply", v8, 2u);
  }
}

void sub_1000033C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000033D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000033E8()
{
  id v0 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    uint64_t v4 = v3;

    qword_1000348F8 = v2;
    unk_100034900 = v4;
  }

  else
  {
    __break(1u);
  }
}

uint64_t sub_100003470()
{
  if (qword_1000348F0 != -1) {
    swift_once(&qword_1000348F0, sub_1000033E8);
  }
  uint64_t v0 = qword_1000348F8;
  uint64_t v1 = unk_100034900;
  swift_bridgeObjectRetain(unk_100034900);
  uint64_t result = OS_os_log.init(subsystem:category:)(v0, v1, 0xD000000000000016LL, 0x8000000100028CE0LL);
  qword_100035878 = result;
  return result;
}

uint64_t sub_100003514()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100007D78(v0, qword_100035880);
  sub_100007D60(v0, (uint64_t)qword_100035880);
  if (qword_1000348F0 != -1) {
    swift_once(&qword_1000348F0, sub_1000033E8);
  }
  uint64_t v1 = qword_1000348F8;
  uint64_t v2 = unk_100034900;
  swift_bridgeObjectRetain(unk_100034900);
  return Logger.init(subsystem:category:)(v1, v2, 0xD000000000000016LL, 0x8000000100028CE0LL);
}

uint64_t sub_1000035C4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100007D78(v0, qword_100034920);
  uint64_t v1 = sub_100007D60(v0, (uint64_t)qword_100034920);
  if (qword_100034910 != -1) {
    swift_once(&qword_100034910, sub_100003514);
  }
  uint64_t v2 = sub_100007D60(v0, (uint64_t)qword_100035880);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

uint64_t sub_100003718()
{
  uint64_t v1 = v0;
  uint64_t v2 = ((uint64_t (*)(void))static os_log_type_t.debug.getter)();
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v3 = qword_100035878;
  uint64_t v4 = sub_10000645C(&qword_100034A28);
  uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_1000253B0;
  uint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  uint64_t v8 = v7;
  *(void *)(v5 + 56) = &type metadata for String;
  unint64_t v9 = sub_100007D1C();
  *(void *)(v5 + 64) = v9;
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v8;
  os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, v3, "PerfRunner: %@ iterations", 25LL, 2LL, v5);
  uint64_t v11 = swift_bridgeObjectRelease(v5, v10);
  uint64_t v12 = static os_log_type_t.debug.getter(v11);
  uint64_t v13 = qword_100035878;
  uint64_t v14 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_1000253B0;
  uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = v9;
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v16;
  os_log(_:dso:log:_:_:)(v12, &_mh_execute_header, v13, "PerfRunner: %@ loads", 20LL, 2LL, v14);
  uint64_t v18 = swift_bridgeObjectRelease(v14, v17);
  uint64_t v19 = static os_log_type_t.debug.getter(v18);
  uint64_t v20 = qword_100035878;
  uint64_t v21 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_1000253B0;
  uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  *(void *)(v21 + 56) = &type metadata for String;
  *(void *)(v21 + 64) = v9;
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v23;
  os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, v20, "PerfRunner: %@ predictions", 26LL, 2LL, v21);
  uint64_t v25 = swift_bridgeObjectRelease(v21, v24);
  uint64_t v26 = static os_log_type_t.debug.getter(v25);
  uint64_t v27 = qword_100035878;
  uint64_t v28 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v28 + 16) = xmmword_1000253B0;
  uint64_t v29 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  *(void *)(v28 + 56) = &type metadata for String;
  *(void *)(v28 + 64) = v9;
  *(void *)(v28 + 32) = v29;
  *(void *)(v28 + 40) = v30;
  os_log(_:dso:log:_:_:)(v26, &_mh_execute_header, v27, "PerfRunner: %@ max prediction time", 34LL, 2LL, v28);
  uint64_t v32 = swift_bridgeObjectRelease(v28, v31);
  uint64_t v33 = static os_log_type_t.debug.getter(v32);
  uint64_t v34 = qword_100035878;
  uint64_t v35 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v35 + 16) = xmmword_1000253B0;
  uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  *(void *)(v35 + 56) = &type metadata for String;
  *(void *)(v35 + 64) = v9;
  *(void *)(v35 + 32) = v36;
  *(void *)(v35 + 40) = v37;
  os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "PerfRunner: %@ max iteration time", 33LL, 2LL, v35);
  uint64_t v39 = swift_bridgeObjectRelease(v35, v38);
  uint64_t v40 = static os_log_type_t.debug.getter(v39);
  uint64_t v41 = qword_100035878;
  uint64_t v42 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v42 + 16) = xmmword_1000253B0;
  uint64_t v44 = *(void *)(v1 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName);
  unint64_t v43 = *(void *)(v1 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName + 8);
  *(void *)(v42 + 56) = &type metadata for String;
  *(void *)(v42 + 64) = v9;
  uint64_t v45 = 0x296C6C756E28LL;
  if (v43) {
    uint64_t v45 = v44;
  }
  unint64_t v46 = 0xE600000000000000LL;
  if (v43) {
    unint64_t v46 = v43;
  }
  *(void *)(v42 + 32) = v45;
  *(void *)(v42 + 40) = v46;
  swift_bridgeObjectRetain(v43);
  os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "PerfRunner: %@ function name", 28LL, 2LL, v42);
  return swift_bridgeObjectRelease(v42, v47);
}

uint64_t sub_100003B2C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100003B68 + 4 * byte_1000253D0[a1]))( 0xD000000000000014LL,  0x8000000100028B80LL);
}

uint64_t sub_100003B68()
{
  return 0x6E756F4364616F6CLL;
}

uint64_t sub_100003B84()
{
  return 0x6974636964657270LL;
}

uint64_t sub_100003BA8()
{
  return v0 + 1;
}

unint64_t sub_100003BC0()
{
  return 0xD000000000000010LL;
}

uint64_t sub_100003BDC()
{
  return 0x6E6F6974636E7566LL;
}

uint64_t sub_100003C04()
{
  return sub_100003B2C(*v0);
}

uint64_t sub_100003C0C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100007364(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003C30()
{
  return 0LL;
}

void sub_100003C3C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100003C48(uint64_t a1)
{
  unint64_t v2 = sub_10000A5D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003C70(uint64_t a1)
{
  unint64_t v2 = sub_10000A5D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_100003C98()
{
  return sub_100005FC4(type metadata accessor for PerfRunConfig);
}

uint64_t type metadata accessor for PerfRunConfig()
{
  return objc_opt_self(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig);
}

uint64_t sub_100003CD8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000645C(&qword_100034B40);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_10000A5D4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PerfRunConfig.CodingKeys,  &type metadata for PerfRunConfig.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations);
  char v26 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, &v26, v5);
  if (!v2)
  {
    uint64_t v13 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount);
    char v25 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, &v25, v5);
    uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount);
    char v24 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v14, &v24, v5);
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxPredictionTime);
    char v23 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v23, v5);
    uint64_t v16 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxIterationTime);
    char v22 = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v16, &v22, v5);
    uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName);
    uint64_t v18 = *(void *)(v3 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName + 8);
    char v21 = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v17, v18, &v21, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100003EC0(void *a1)
{
  return sub_100003CD8(a1);
}

BOOL sub_100003EE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100003EF4()
{
}

uint64_t sub_100003F2C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x73654D726F727265LL;
  }
  else {
    return 0x646F43726F727265LL;
  }
}

uint64_t sub_100003F70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = a4;
  uint64_t v8 = sub_10000645C(&qword_100034BC0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000649C(a1, v12);
  unint64_t v14 = sub_10000ADC8();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PerfRunner.ErrorResponse.CodingKeys,  &type metadata for PerfRunner.ErrorResponse.CodingKeys,  v14,  v12,  v13);
  char v19 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v19, v8);
  if (!v4)
  {
    char v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a3, v17, &v18, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

BOOL sub_100004098(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000040B0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_1000040F4(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100004134()
{
  return sub_100003F2C(*v0);
}

uint64_t sub_10000413C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000075EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_100004160(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000416C(uint64_t a1)
{
  unint64_t v2 = sub_10000ADC8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004194(uint64_t a1)
{
  unint64_t v2 = sub_10000ADC8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000041BC(void *a1)
{
  return sub_100003F70(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_1000041D8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100004210 + 4 * byte_1000253D6[a1]))( 0xD000000000000017LL,  0x8000000100029160LL);
}

uint64_t sub_100004210()
{
  return 0x74636964657270LL;
}

uint64_t sub_100004228()
{
  return 0x656C69706D6F63LL;
}

uint64_t sub_100004240()
{
  return 1684107116LL;
}

uint64_t sub_100004250()
{
  return 0x7274536C65646F6DLL;
}

uint64_t sub_100004274()
{
  return 0x436E755266726570LL;
}

uint64_t sub_100004298(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000645C(&qword_1000349D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_1000064C0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PerfRunner.TimerResults.CodingKeys,  &type metadata for PerfRunner.TimerResults.CodingKeys,  v11,  v9,  v10);
  v21.n128_u64[0] = v3->n128_u64[0];
  char v22 = 0;
  uint64_t v12 = type metadata accessor for SampleTimer();
  uint64_t v13 = sub_100006670( &qword_1000349E8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for SampleTimer,  (uint64_t)&unk_100026770);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v22, v5, v12, v13);
  if (!v2)
  {
    v21.n128_u64[0] = v3->n128_u64[1];
    char v22 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v22, v5, v12, v13);
    v21.n128_u64[0] = v3[1].n128_u64[0];
    char v22 = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v22, v5, v12, v13);
    v21.n128_u64[0] = v3[1].n128_u64[1];
    char v22 = 3;
    uint64_t v14 = sub_10000645C(&qword_1000349F0);
    unint64_t v15 = sub_100006504();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v22, v5, v14, v15);
    sub_1000065F0(v3 + 2, &v23);
    sub_1000065F0(&v23, &v21);
    char v22 = 4;
    unint64_t v16 = sub_10000662C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v22, v5, &_s14ModelStructureON, v16);
    v21.n128_u64[0] = v3[3].n128_u64[1];
    char v22 = 5;
    uint64_t v17 = type metadata accessor for PerfRunConfig();
    uint64_t v19 = sub_100006670( &qword_100034A10,  v18,  (uint64_t (*)(uint64_t))type metadata accessor for PerfRunConfig,  (uint64_t)&unk_100025494);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v22, v5, v17, v19);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000452C()
{
  return sub_1000041D8(*v0);
}

uint64_t sub_100004534@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100007850(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100004558(uint64_t a1)
{
  unint64_t v2 = sub_1000064C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004580(uint64_t a1)
{
  unint64_t v2 = sub_1000064C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000045A8(void *a1)
{
  return sub_100004298(a1);
}

uint64_t sub_100004664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  uint64_t v5 = type metadata accessor for URL(0LL);
  v4[14] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[15] = v6;
  v4[16] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000046C8, 0LL, 0LL);
}

uint64_t sub_1000046C8()
{
  if (qword_100034918 != -1) {
    swift_once(&qword_100034918, sub_1000035C4);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100007D60(v1, (uint64_t)qword_100034920);
  uint64_t v3 = static os_log_type_t.debug.getter(v2);
  os_log_type_t v4 = v3;
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v3);
  if (os_log_type_enabled(v5, v4))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v4, "starting PerfRunner.run with layer schedule support", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  sub_100003718();
  uint64_t v7 = sub_100023E5C();
  uint64_t v8 = static os_log_type_t.debug.getter(v7);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v9 = v0[11];
  uint64_t v10 = qword_100035878;
  uint64_t v11 = sub_10000645C(&qword_100034A28);
  v0[17] = v11;
  uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_1000253B0;
  uint64_t v13 = URL.path.getter(v12);
  uint64_t v15 = v14;
  *(void *)(v12 + 56) = &type metadata for String;
  unint64_t v16 = sub_100007D1C();
  v0[18] = v16;
  *(void *)(v12 + 64) = v16;
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v15;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v10, "PerfRunner.run modelUrl is %@", 29LL, 2LL, v12);
  swift_bridgeObjectRelease(v12, v17);
  uint64_t v18 = sub_100007AC8(v9);
  uint64_t v19 = static os_log_type_t.debug.getter(v18);
  LOBYTE(v9) = v19;
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = v9;
  if (os_log_type_enabled(v20, (os_log_type_t)v9))
  {
    char v22 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "PerfRunner.run finished unwrapping unit", v22, 2u);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  __n128 v23 = (void *)swift_task_alloc(dword_100034A4C);
  v0[19] = v23;
  void *v23 = v0;
  v23[1] = sub_10000494C;
  return sub_10000829C((uint64_t)(v0 + 2), v0[16], v18, v0[12]);
}

uint64_t sub_10000494C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 152);
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    os_log_type_t v4 = sub_100004B08;
  }

  else
  {
    sub_100009E04(v2 + 16);
    os_log_type_t v4 = sub_1000049B8;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000049B8()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = sub_100009810((_OWORD *)(v0 + 16));
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 120) + 8LL))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    sub_100009E84((uint64_t *)(v0 + 16), v4);
    sub_100009A70(v1);
    unint64_t v5 = sub_100009C54(v1);
    uint64_t v7 = v6;
    swift_errorRelease(v1);
  }

  else
  {
    unint64_t v5 = (unint64_t)v2;
    uint64_t v7 = v3;
    uint64_t v8 = *(void *)(v0 + 136);
    uint64_t v9 = *(void *)(v0 + 144);
    uint64_t v10 = *(void *)(v0 + 120);
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v12 = static os_log_type_t.debug.getter(v2);
    uint64_t v13 = qword_100035878;
    uint64_t v14 = swift_allocObject(v8, 72LL, 7LL);
    *(_OWORD *)(v14 + 16) = xmmword_1000253B0;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = v9;
    *(void *)(v14 + 32) = v5;
    *(void *)(v14 + 40) = v7;
    swift_bridgeObjectRetain(v7);
    os_log(_:dso:log:_:_:)(v12, &_mh_execute_header, v13, "PerfRunner returning a result: %@", 33LL, 2LL, v14);
    swift_bridgeObjectRelease(v14, v15);
    sub_100009E84((uint64_t *)(v0 + 16), v16);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v18, v11);
  }

  swift_task_dealloc(*(void *)(v0 + 128));
  return (*(uint64_t (**)(unint64_t, uint64_t))(v0 + 8))(v5, v7);
}

uint64_t sub_100004B08()
{
  uint64_t v1 = *(void *)(v0 + 160);
  sub_100009A70(v1);
  unint64_t v2 = sub_100009C54(v1);
  uint64_t v4 = v3;
  swift_errorRelease(v1);
  swift_task_dealloc(*(void *)(v0 + 128));
  return (*(uint64_t (**)(unint64_t, uint64_t))(v0 + 8))(v2, v4);
}

uint64_t sub_100004CC4(void *a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  v5[3] = a3;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  uint64_t v10 = dword_1000349C4;
  id v11 = a1;
  id v12 = a3;
  a5;
  uint64_t v13 = (void *)swift_task_alloc(v10);
  v5[6] = v13;
  void *v13 = v5;
  v13[1] = sub_100004D64;
  return sub_100004664((uint64_t)v11, a2, (uint64_t)v12);
}

uint64_t sub_100004D64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (***)(void, void))(*v2 + 40);
  uint64_t v6 = *(void **)(*v2 + 24);
  unint64_t v5 = *(void **)(*v2 + 32);
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v11 = *v2;
  swift_task_dealloc(*(void *)(*v2 + 48));

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2, v9);
  ((void (**)(void, NSString))v4)[2](v4, v8);

  _Block_release(v4);
  return (*(uint64_t (**)(void))(v11 + 8))();
}

uint64_t sub_100004E0C(uint64_t a1, uint64_t a2)
{
  void v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return swift_task_switch(sub_100004E28, 0LL, 0LL);
}

uint64_t sub_100004E28()
{
  if (qword_100034918 != -1) {
    swift_once(&qword_100034918, sub_1000035C4);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[11] = sub_100007D60(v1, (uint64_t)qword_100034920);
  uint64_t v2 = static os_log_type_t.debug.getter();
  os_log_type_t v3 = v2;
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v2);
  if (os_log_type_enabled(v4, v3))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v3, "Gathering MLComputePlan from model", v5, 2u);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v6 = (void *)v0[9];

  type metadata accessor for MLComputePlan(0LL);
  id v7 = [v6 copy];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease(v7);
  uint64_t v8 = sub_10000A028(0LL, &qword_100034A38, &OBJC_CLASS___MLModelConfiguration_ptr);
  swift_dynamicCast(v0 + 6, v0 + 2, (char *)&type metadata for Any + 8, v8, 7LL);
  uint64_t v9 = (void *)v0[6];
  v0[12] = v9;
  [v9 setProfilingOptions:1];
  uint64_t v10 = (void *)swift_task_alloc(async function pointer to static MLComputePlan.load(contentsOf:configuration:)[1]);
  v0[13] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_100004FC4;
  return static MLComputePlan.load(contentsOf:configuration:)(v0[8], v9);
}

uint64_t sub_100004FC4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 104);
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    unint64_t v5 = sub_10000511C;
  }

  else
  {

    unint64_t v5 = sub_100005038;
  }

  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_100005038()
{
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  uint64_t v2 = (os_log_s *)Logger.logObject.getter();
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v1, "Building ModelStructure from MLComputePlan", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }

  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 80);

  uint64_t v6 = sub_100017B34(v4);
  uint64_t v7 = v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 32);
  uint64_t v9 = *(void *)(v5 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 40);
  *(void *)(v7 + 32) = v6;
  *(void *)(v7 + 40) = v10;
  unsigned __int8 v11 = *(_BYTE *)(v7 + 48);
  *(_BYTE *)(v7 + 48) = v12;
  sub_10000615C(v8, v9, v11);
  swift_release(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000511C()
{
  uint64_t v1 = *(void *)(v0 + 120);

  os_log_type_t v2 = static os_log_type_t.debug.getter();
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  if (os_log_type_enabled(v4, v2))
  {
    uint64_t v5 = *(void *)(v0 + 120);
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v6 = 138412290;
    swift_errorRetain(v5);
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(void *)(v0 + 56) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v6 + 4, v6 + 12);
    *uint64_t v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v4, v2, "Failed to construct MLComputePlan: %@", v6, 0xCu);
    uint64_t v9 = sub_10000645C(&qword_100034A40);
    swift_arrayDestroy(v7, 1LL, v9);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
    uint64_t v10 = *(void *)(v0 + 120);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }

  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v12 = *(void *)(v0 + 80);

  uint64_t v13 = v12 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v14 = *(void *)(v12 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 32);
  uint64_t v15 = *(void *)(v12 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 40);
  *(_OWORD *)(v13 + 32) = xmmword_1000253C0;
  unsigned __int8 v16 = *(_BYTE *)(v13 + 48);
  *(_BYTE *)(v13 + 48) = 3;
  sub_10000615C(v14, v15, v16);
  swift_errorRelease(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000052CC(void *a1, uint64_t a2, uint64_t a3)
{
  id v9 = 0LL;
  id v3 = [a1 predictionFromFeatures:a2 usingState:a3 error:&v9];
  id v4 = v9;
  if (v3)
  {
    id v5 = v3;
    id v6 = v9;
    return swift_unknownObjectRelease(v5);
  }

  else
  {
    id v8 = v9;
    _convertNSErrorToError(_:)(v4);

    return swift_willThrow();
  }

uint64_t sub_100005388(void *a1, uint64_t a2)
{
  id v8 = 0LL;
  id v2 = [a1 predictionFromFeatures:a2 error:&v8];
  id v3 = v8;
  if (v2)
  {
    id v4 = v2;
    id v5 = v8;
    return swift_unknownObjectRelease(v4);
  }

  else
  {
    id v7 = v8;
    _convertNSErrorToError(_:)(v3);

    return swift_willThrow();
  }

void sub_100005440(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6 = v3;
  uint64_t v51 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v47 = a1;
  if (a1 < 1)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  double v10 = Current;
  double v11 = (double)a2;
  uint64_t v12 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v13 = 1LL;
  int v45 = 134218240;
  uint64_t v46 = v6;
  uint64_t v48 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  while (1)
  {
    uint64_t v14 = objc_autoreleasePoolPush();
    uint64_t v15 = *(void *)(v6 + v12);
    swift_retain(v15);
    *(CFAbsoluteTime *)(v15 + 16) = CFAbsoluteTimeGetCurrent();
    *(_BYTE *)(v15 + 24) = 0;
    uint64_t v16 = swift_release(v15);
    v51(v16);
    if (v4)
    {
      objc_autoreleasePoolPop(v14);
      return;
    }

    uint64_t v17 = *(void *)(v6 + v12);
    if ((*(_BYTE *)(v17 + 24) & 1) == 0)
    {
      uint64_t v18 = a2;
      double v19 = *(double *)(v17 + 16);
      swift_retain(*(void *)(v6 + v12));
      double v5 = CFAbsoluteTimeGetCurrent();
      uint64_t v20 = (void *)(v17 + 32);
      swift_beginAccess(v17 + 32, &v49, 33LL, 0LL);
      os_log_type_t v21 = *(void **)(v17 + 32);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v21);
      *(void *)(v17 + 32) = v21;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        os_log_type_t v21 = sub_100006E28(0LL, v21[2] + 1LL, 1, (uint64_t)v21);
        void *v20 = v21;
      }

      unint64_t v24 = v21[2];
      unint64_t v23 = v21[3];
      if (v24 >= v23 >> 1)
      {
        os_log_type_t v21 = sub_100006E28((void *)(v23 > 1), v24 + 1, 1, (uint64_t)v21);
        void *v20 = v21;
      }

      a2 = v18;
      v21[2] = v24 + 1;
      *(double *)&v21[v24 + 4] = v5 - v19;
      swift_endAccess(&v49);
      swift_release(v17);
      uint64_t v6 = v46;
      uint64_t v12 = v48;
    }

    objc_autoreleasePoolPop(v14);
    double v25 = CFAbsoluteTimeGetCurrent();
    if (!a2)
    {
      if (qword_100034918 != -1) {
        swift_once(&qword_100034918, sub_1000035C4);
      }
      uint64_t v36 = type metadata accessor for Logger(0LL);
      uint64_t v37 = sub_100007D60(v36, (uint64_t)qword_100034920);
      uint64_t v28 = (os_log_s *)Logger.logObject.getter(v37);
      os_log_type_t v38 = static os_log_type_t.debug.getter(v28);
      if (!os_log_type_enabled(v28, v38)) {
        goto LABEL_21;
      }
      uint64_t v30 = swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v30 = 0;
      uint64_t v31 = v28;
      os_log_type_t v32 = v38;
      uint64_t v33 = "Max prediction time ignored";
      uint64_t v34 = (uint8_t *)v30;
      uint32_t v35 = 2;
      goto LABEL_20;
    }

    double v5 = v25 - v10;
    if (v25 - v10 >= v11) {
      break;
    }
    if (qword_100034918 != -1) {
      swift_once(&qword_100034918, sub_1000035C4);
    }
    uint64_t v26 = type metadata accessor for Logger(0LL);
    uint64_t v27 = sub_100007D60(v26, (uint64_t)qword_100034920);
    uint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
    os_log_type_t v29 = static os_log_type_t.debug.getter(v28);
    if (!os_log_type_enabled(v28, v29)) {
      goto LABEL_21;
    }
    uint64_t v30 = swift_slowAlloc(22LL, -1LL);
    *(_DWORD *)uint64_t v30 = 134218240;
    *(double *)(v30 + 4) = v5;
    *(_WORD *)(v30 + 12) = 2048;
    *(void *)(v30 + 14) = a2;
    uint64_t v31 = v28;
    os_log_type_t v32 = v29;
    uint64_t v33 = "Max prediction time not yet exceeded: %f < %lld";
    uint64_t v34 = (uint8_t *)v30;
    uint32_t v35 = 22;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v31, v32, v33, v34, v35);
    swift_slowDealloc(v30, -1LL, -1LL);
    uint64_t v12 = v48;
LABEL_21:

    if (v47 == v13) {
      return;
    }
    if (__OFADD__(v13++, 1LL))
    {
      __break(1u);
      goto LABEL_31;
    }
  }

  if (qword_100034918 != -1) {
LABEL_32:
  }
    swift_once(&qword_100034918, sub_1000035C4);
  uint64_t v40 = type metadata accessor for Logger(0LL);
  uint64_t v41 = sub_100007D60(v40, (uint64_t)qword_100034920);
  uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
  os_log_type_t v43 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc(22LL, -1LL);
    *(_DWORD *)uint64_t v44 = v45;
    double v49 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v44 + 4, v44 + 12);
    *(_WORD *)(v44 + 12) = 2048;
    double v49 = *(double *)&a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v44 + 14, v44 + 22);
    _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "Max prediction time exceeded: %f >= %lld",  (uint8_t *)v44,  0x16u);
    swift_slowDealloc(v44, -1LL, -1LL);
  }
}

void sub_100005888()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = swift_bridgeObjectRetain(*(void *)(v0
                                            + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers
                                            + 24));
    uint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(char *)(v1 + v4 + 32);
      uint64_t v6 = static os_log_type_t.info.getter(v3);
      if (qword_100034908 != -1) {
        swift_once(&qword_100034908, sub_100003470);
      }
      ++v4;
      uint64_t v7 = qword_100035878;
      uint64_t v8 = sub_10000645C(&qword_100034A28);
      uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
      *(_OWORD *)(v9 + 16) = xmmword_1000253B0;
      uint64_t v10 = 8 * v5;
      uint64_t v11 = qword_100025B48[v5];
      uint64_t v12 = *(void *)((char *)&unk_100025B68 + v10);
      *(void *)(v9 + 56) = &type metadata for String;
      *(void *)(v9 + 64) = sub_100007D1C();
      *(void *)(v9 + 32) = v11;
      *(void *)(v9 + 40) = v12;
      os_log(_:dso:log:_:_:)(v6, &_mh_execute_header, v7, "Supported compute unit: %@", 26LL, 2LL, v9);
      uint64_t v3 = swift_bridgeObjectRelease(v9, v13);
    }

    while (v2 != v4);
    swift_bridgeObjectRelease(v1, v14);
  }

char *sub_1000059FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100005DA0();
  if (!v5)
  {
    uint64_t v42 = a4;
    swift_unknownObjectWeakInit(v44, 0LL);
    uint64_t v41 = a3;
    if (a3 < 1) {
      goto LABEL_21;
    }
    v37[0] = a1;
    v37[1] = 0LL;
    uint64_t v38 = v10;
    uint64_t v39 = v9;
    id v43 = (id)objc_opt_self(&OBJC_CLASS___MLModel);
    uint64_t v13 = &v4[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers];
    uint64_t v14 = 1LL;
    swift_beginAccess(v44, v46, 1LL, 0LL);
    uint64_t v40 = v12;
    uint64_t v16 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      uint64_t v18 = objc_autoreleasePoolPush();
      uint64_t v19 = *((void *)v13 + 2);
      swift_retain(v19);
      *(CFAbsoluteTime *)(v19 + 16) = CFAbsoluteTimeGetCurrent();
      *(_BYTE *)(v19 + 24) = 0;
      swift_release(v19);
      id v20 = v15;
      URL._bridgeToObjectiveC()(v21);
      unint64_t v23 = v22;
      v45[0] = 0LL;
      uint64_t v4 = (char *)[v43 modelWithContentsOfURL:v22 configuration:v20 error:v45];

      id v24 = v45[0];
      if (!v4) {
        break;
      }
      id v25 = v45[0];

      uint64_t v26 = *((void *)v13 + 2);
      if ((*(_BYTE *)(v26 + 24) & 1) == 0)
      {
        double v27 = *(double *)(v26 + 16);
        swift_retain(*((void *)v13 + 2));
        double Current = CFAbsoluteTimeGetCurrent();
        os_log_type_t v29 = (void *)(v26 + 32);
        swift_beginAccess(v26 + 32, v45, 33LL, 0LL);
        uint64_t v30 = *(void **)(v26 + 32);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
        *(void *)(v26 + 32) = v30;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v30 = sub_100006E28(0LL, v30[2] + 1LL, 1, (uint64_t)v30);
          *os_log_type_t v29 = v30;
        }

        unint64_t v33 = v30[2];
        unint64_t v32 = v30[3];
        if (v33 >= v32 >> 1)
        {
          uint64_t v30 = sub_100006E28((void *)(v32 > 1), v33 + 1, 1, (uint64_t)v30);
          *os_log_type_t v29 = v30;
        }

        uint64_t v15 = v42;
        v30[2] = v33 + 1;
        *(double *)&v30[v33 + 4] = Current - v27;
        swift_endAccess(v45);
        swift_release(v26);
        uint64_t v12 = v40;
        uint64_t v16 = v41;
      }

      swift_unknownObjectWeakAssign(v44, v4);
      if (v16 == v14)
      {
        objc_autoreleasePoolPop(v18);
        (*(void (**)(void, char *, uint64_t))(v38 + 32))(v37[0], v12, v39);
        swift_unknownObjectWeakDestroy(v44);
        return v4;
      }

      objc_autoreleasePoolPop(v18);
      Strong = (void *)swift_unknownObjectWeakLoadStrong(v44);

      if (Strong)
      {
        uint64_t v35 = static os_log_type_t.error.getter();
        if (qword_100034908 != -1) {
          swift_once(&qword_100034908, sub_100003470);
        }
        os_log(_:dso:log:_:_:)( v35,  &_mh_execute_header,  qword_100035878,  "After setting the model instance to nil, it was not deallocated. Model load times may be innacurate due to cached resources!",  124LL,  2LL,  _swiftEmptyArrayStorage);
      }

      if (__OFADD__(v14++, 1LL))
      {
        __break(1u);
LABEL_21:
        __break(1u);
      }
    }

    uint64_t v4 = (char *)v45[0];
    _convertNSErrorToError(_:)(v24);

    swift_willThrow();
    objc_autoreleasePoolPop(v18);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v39);
    swift_unknownObjectWeakDestroy(v44);
  }

  return v4;
}

void sub_100005DA0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 8);
  swift_retain(v2);
  *(CFAbsoluteTime *)(v2 + 16) = CFAbsoluteTimeGetCurrent();
  *(_BYTE *)(v2 + 24) = 0;
  swift_release(v2);
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___MLModel);
  URL._bridgeToObjectiveC()(v4);
  uint64_t v6 = v5;
  v20[0] = 0LL;
  id v7 = [v3 compileModelAtURL:v5 error:v20];

  id v8 = v20[0];
  if (v7)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v7);
    id v9 = v8;

    uint64_t v10 = *(void *)(v1 + 8);
    if ((*(_BYTE *)(v10 + 24) & 1) == 0)
    {
      double v11 = *(double *)(v10 + 16);
      swift_retain(*(void *)(v1 + 8));
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v13 = (void *)(v10 + 32);
      swift_beginAccess(v10 + 32, v20, 33LL, 0LL);
      uint64_t v14 = *(void **)(v10 + 32);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
      *(void *)(v10 + 32) = v14;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v14 = sub_100006E28(0LL, v14[2] + 1LL, 1, (uint64_t)v14);
        void *v13 = v14;
      }

      double v16 = Current - v11;
      unint64_t v18 = v14[2];
      unint64_t v17 = v14[3];
      if (v18 >= v17 >> 1)
      {
        uint64_t v14 = sub_100006E28((void *)(v17 > 1), v18 + 1, 1, (uint64_t)v14);
        void *v13 = v14;
      }

      v14[2] = v18 + 1;
      *(double *)&v14[v18 + 4] = v16;
      swift_endAccess(v20);
      swift_release(v10);
    }
  }

  else
  {
    id v19 = v20[0];
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }

id sub_100005FB8()
{
  return sub_100005FC4(type metadata accessor for PerfRunner);
}

id sub_100005FC4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for PerfRunner()
{
  return objc_opt_self(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner);
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_1000060C8(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 < 2u) {
    return swift_bridgeObjectRetain(result);
  }
  if (a3 == 2)
  {
    ((void (*)(void))swift_bridgeObjectRetain)();
    return swift_bridgeObjectRetain(a2);
  }

  return result;
}

void destroy for PerfRunner.TimerResults(uint64_t a1)
{
}

uint64_t sub_10000615C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2) {
      return result;
    }
    uint64_t v3 = a2;
    swift_bridgeObjectRelease(result, a2);
  }

  else
  {
    uint64_t v3 = result;
  }

  return swift_bridgeObjectRelease(v3, a2);
}

uint64_t initializeWithCopy for PerfRunner.TimerResults(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  unsigned __int8 v10 = *((_BYTE *)a2 + 48);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  sub_1000060C8(v8, v9, v10);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  double v11 = (void *)a2[7];
  *(void *)(a1 + 56) = v11;
  id v12 = v11;
  return a1;
}

uint64_t *assignWithCopy for PerfRunner.TimerResults(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  uint64_t v8 = a2[2];
  uint64_t v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  uint64_t v10 = a2[3];
  uint64_t v11 = a1[3];
  a1[3] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11, v12);
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  unsigned __int8 v15 = *((_BYTE *)a2 + 48);
  sub_1000060C8(v13, v14, v15);
  uint64_t v16 = a1[4];
  uint64_t v17 = a1[5];
  a1[4] = v13;
  a1[5] = v14;
  unsigned __int8 v18 = *((_BYTE *)a1 + 48);
  *((_BYTE *)a1 + 48) = v15;
  sub_10000615C(v16, v17, v18);
  id v19 = (void *)a2[7];
  id v20 = (void *)a1[7];
  a1[7] = (uint64_t)v19;
  id v21 = v19;

  return a1;
}

__n128 initializeWithTake for PerfRunner.TimerResults(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PerfRunner.TimerResults(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  swift_release(*(void *)(a1 + 16));
  uint64_t v5 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v5, v6);
  char v7 = *(_BYTE *)(a2 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  unsigned __int8 v10 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v7;
  sub_10000615C(v8, v9, v10);
  uint64_t v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);

  return a1;
}

uint64_t getEnumTagSinglePayload for PerfRunner.TimerResults(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PerfRunner.TimerResults(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 64) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.TimerResults()
{
  return &type metadata for PerfRunner.TimerResults;
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

uint64_t sub_10000645C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_10000649C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_1000064C0()
{
  unint64_t result = qword_1000349E0;
  if (!qword_1000349E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000259E8, &type metadata for PerfRunner.TimerResults.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000349E0);
  }

  return result;
}

unint64_t sub_100006504()
{
  unint64_t result = qword_1000349F8;
  if (!qword_1000349F8)
  {
    uint64_t v1 = sub_100006568(&qword_1000349F0);
    sub_1000065AC();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000349F8);
  }

  return result;
}

uint64_t sub_100006568(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000065AC()
{
  unint64_t result = qword_100034A00;
  if (!qword_100034A00)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025F9C, &_s13ComputeDeviceVN);
    atomic_store(result, (unint64_t *)&qword_100034A00);
  }

  return result;
}

__n128 *sub_1000065F0(__n128 *a1, __n128 *a2)
{
  return a2;
}

unint64_t sub_10000662C()
{
  unint64_t result = qword_100034A08;
  if (!qword_100034A08)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026D30, &_s14ModelStructureON);
    atomic_store(result, (unint64_t *)&qword_100034A08);
  }

  return result;
}

uint64_t sub_100006670(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000066B0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100025910, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_1000066EC(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100025910, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100006734(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100025910, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t sub_10000678C(uint64_t a1, uint64_t a2)
{
  return sub_1000068D4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006798(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5, v7);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_10000680C(uint64_t a1, id *a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v9);
  uint64_t v5 = v10;
  if (v10)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5, v7);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100006888@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4, v6);
  *a2 = v5;
  return result;
}

uint64_t sub_1000068C8(uint64_t a1, uint64_t a2)
{
  return sub_1000068D4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000068D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7, v9);
  return v8;
}

uint64_t sub_100006910(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5, v6);
}

Swift::Int sub_100006950(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v9, a1);
  String.hash(into:)(v9, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5, v7);
  return v6;
}

uint64_t sub_1000069C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100025910, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_100006A0C(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5, v7);
  swift_bridgeObjectRelease(v9, v11);
  return v10 & 1;
}

uint64_t sub_100006A94@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3, v5);
  *a2 = v4;
  return result;
}

uint64_t sub_100006AD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006B00(uint64_t a1)
{
  uint64_t v2 = sub_100006670( &qword_100034BD0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_100025778);
  uint64_t v3 = sub_100006670( &qword_100034BD8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_100025718);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006B8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000B050;
  return v6();
}

uint64_t sub_100006BE0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000B050;
  return v7();
}

uint64_t sub_100006C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000A500(a1);
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
  uint64_t v16 = swift_allocObject(&unk_100031038, 32LL, 7LL);
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

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100034B38, v16);
}

uint64_t sub_100006D78(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100006DDC;
  return v6(a1);
}

uint64_t sub_100006DDC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void *sub_100006E28(void *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000645C(&qword_100034A20);
      uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        unsigned __int8 v15 = (const void *)(a4 + 32);
        *(void *)(a4 + 16) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100007C30(0LL, v8, (char *)v14, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4, v15);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_100006F34(void *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000645C(&qword_100034AD8);
      uint64_t v11 = (void *)swift_allocObject(v10, 4 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 29;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 2);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        unsigned __int8 v15 = (const void *)(a4 + 32);
        *(void *)(a4 + 16) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10000A0F4(0LL, v8, (char *)v14, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4, v15);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_100007040(void *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000645C(&qword_100034AE0);
      uint64_t v11 = (void *)swift_allocObject(v10, 4 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 29;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 2);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        unsigned __int8 v15 = (const void *)(a4 + 32);
        *(void *)(a4 + 16) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10000A0F4(0LL, v8, (char *)v14, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4, v15);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_10000714C(void *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000645C(&qword_100034AF0);
      uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        unsigned __int8 v15 = (const void *)(a4 + 32);
        *(void *)(a4 + 16) = 0LL;
        goto LABEL_24;
      }
    }

    sub_100007C30(0LL, v8, (char *)v14, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4, v15);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_100007258(void *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10000645C(&qword_100034AE8);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        unsigned __int8 v15 = (const void *)(a4 + 32);
        *(void *)(a4 + 16) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10000A1DC(0LL, v8, (unint64_t)v14, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4, v15);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100007364(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v4 = 0x8000000100028B80LL;
    if (a2 == 0x8000000100028B80LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x8000000100028B80LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4, a2);
    return 0LL;
  }

  if (a1 == 0x6E756F4364616F6CLL && a2 == 0xE900000000000074LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E756F4364616F6CLL, 0xE900000000000074LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  if (a1 == 0x6974636964657270LL && a2 == 0xEF746E756F436E6FLL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6974636964657270LL, 0xEF746E756F436E6FLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2LL;
  }

  if (a1 == 0xD000000000000011LL && a2 == 0x8000000100028BB0LL)
  {
    unint64_t v6 = 0x8000000100028BB0LL;
LABEL_19:
    swift_bridgeObjectRelease(v6, a2);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x8000000100028BB0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
    goto LABEL_19;
  }

  if (a1 == 0xD000000000000010LL)
  {
    unint64_t v7 = 0x8000000100028BD0LL;
    if (a2 == 0x8000000100028BD0LL) {
      goto LABEL_24;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100028BD0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v7, a2);
    return 4LL;
  }

  if (a1 == 0x6E6F6974636E7566LL && a2 == 0xEC000000656D614ELL)
  {
    swift_bridgeObjectRelease(0xEC000000656D614ELL, a2);
    return 5LL;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6974636E7566LL, 0xEC000000656D614ELL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v9);
    if ((v8 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_1000075EC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x646F43726F727265LL && a2 == 0xE900000000000065LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x646F43726F727265LL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x73654D726F727265LL && a2 == 0xEC00000065676173LL)
  {
    swift_bridgeObjectRelease(0xEC00000065676173LL, a2);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73654D726F727265LL, 0xEC00000065676173LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1000076EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = (objc_class *)type metadata accessor for PerfRunConfig();
  char v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations] = 0LL;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount] = 0LL;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount] = 0LL;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxPredictionTime] = 0LL;
  *(void *)&v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxIterationTime] = 0LL;
  char v6 = &v5[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName];
  *(void *)char v6 = 0LL;
  *((void *)v6 + 1) = 0LL;
  v16.receiver = v5;
  v16.super_class = v4;
  id v7 = objc_msgSendSuper2(&v16, "init");
  char v8 = a1;

  uint64_t v9 = *(void *)&v8[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount];
  uint64_t v10 = type metadata accessor for SampleTimer();
  uint64_t v11 = swift_allocObject(v10, 48LL, 7LL);
  *(void *)(v11 + 16) = 0LL;
  *(_BYTE *)(v11 + 24) = 1;
  *(void *)(v11 + 32) = _swiftEmptyArrayStorage;
  *(void *)(v11 + 40) = v9;
  uint64_t v12 = *(void *)&v8[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations];
  uint64_t v13 = swift_allocObject(v10, 48LL, 7LL);
  *(void *)(v13 + 16) = 0LL;
  *(_BYTE *)(v13 + 24) = 1;
  *(void *)(v13 + 32) = _swiftEmptyArrayStorage;
  *(void *)(v13 + 40) = v12;
  uint64_t v14 = *(void *)&v8[OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount];
  uint64_t result = swift_allocObject(v10, 48LL, 7LL);
  *(void *)(result + 16) = 0LL;
  *(_BYTE *)(result + 24) = 1;
  *(void *)(result + 32) = _swiftEmptyArrayStorage;
  *(void *)(result + 40) = v14;
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v13;
  *(void *)(a2 + 16) = result;
  *(void *)(a2 + 24) = _swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(_BYTE *)(a2 + 48) = 3;
  *(void *)(a2 + 56) = v8;
  return result;
}

uint64_t sub_100007850(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x74636964657270LL && a2 == 0xE700000000000000LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74636964657270LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  if (a1 == 0x656C69706D6F63LL && a2 == 0xE700000000000000LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C69706D6F63LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  if (a1 == 1684107116 && a2 == 0xE400000000000000LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(1684107116LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2LL;
  }

  if (a1 == 0xD000000000000017LL)
  {
    unint64_t v6 = 0x8000000100029160LL;
    if (a2 == 0x8000000100029160LL) {
      goto LABEL_19;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000017LL, 0x8000000100029160LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
LABEL_19:
    swift_bridgeObjectRelease(v6, a2);
    return 3LL;
  }

  if (a1 == 0x7274536C65646F6DLL && a2 == 0xEE00657275746375LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7274536C65646F6DLL, 0xEE00657275746375LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 4LL;
  }

  else if (a1 == 0x436E755266726570LL && a2 == 0xED00006769666E6FLL)
  {
    swift_bridgeObjectRelease(0xED00006769666E6FLL, a2);
    return 5LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x436E755266726570LL, 0xED00006769666E6FLL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v8);
    if ((v7 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_100007AC8(uint64_t a1)
{
  unint64_t v2 = 0xD000000000000013LL;
  unint64_t v3 = 0x8000000100028FF0LL;
  switch(a1)
  {
    case 0LL:
      unint64_t v3 = 0xE800000000000000LL;
      unint64_t v2 = 0x796C6E4F7570632ELL;
      break;
    case 1LL:
      unint64_t v3 = 0xEA00000000005550LL;
      unint64_t v2 = 0x47646E417570632ELL;
      break;
    case 2LL:
      unint64_t v3 = 0xE400000000000000LL;
      unint64_t v2 = 1819042094LL;
      break;
    case 3LL:
      break;
    default:
      unint64_t v2 = 0xD000000000000015LL;
      unint64_t v3 = 0x8000000100028FA0LL;
      break;
  }

  uint64_t v4 = static os_log_type_t.debug.getter(a1);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v5 = qword_100035878;
  uint64_t v6 = sub_10000645C(&qword_100034A28);
  uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_1000253B0;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_100007D1C();
  *(void *)(v7 + 32) = v2;
  *(void *)(v7 + 40) = v3;
  os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, v5, "PerfRunner.run using computeUnit: %@", 36LL, 2LL, v7);
  swift_bridgeObjectRelease(v7, v8);
  return a1;
}

char *sub_100007C30(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

unint64_t sub_100007D1C()
{
  unint64_t result = qword_100034A30;
  if (!qword_100034A30)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100034A30);
  }

  return result;
}

uint64_t sub_100007D60(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100007D78(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

void sub_100007DB8()
{
  if ((sub_1000180A0() & 1) != 0)
  {
    if (qword_100034918 != -1) {
      swift_once(&qword_100034918, sub_1000035C4);
    }
    uint64_t v0 = type metadata accessor for Logger(0LL);
    uint64_t v1 = sub_100007D60(v0, (uint64_t)qword_100034920);
    uint64_t v2 = static os_log_type_t.debug.getter(v1);
    os_log_type_t v3 = v2;
    uint64_t v4 = (os_log_s *)Logger.logObject.getter(v2);
    if (os_log_type_enabled(v4, v3))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v3, "About to purge ANE binary for compiled model", v5, 2u);
      swift_slowDealloc(v5, -1LL, -1LL);
    }

    size_t v6 = (void *)objc_opt_self(&OBJC_CLASS___MLModelAsset);
    URL._bridgeToObjectiveC()(v7);
    uint64_t v9 = v8;
    id v48 = 0LL;
    LODWORD(v6) = [v6 purgeANEBinaryForModelAtURL:v8 error:&v48];

    id v10 = v48;
    if (!(_DWORD)v6) {
      goto LABEL_18;
    }
    uint64_t v11 = static os_log_type_t.debug.getter(v48);
    os_log_type_t v12 = v11;
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v11);
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v12, "Successfully purged ANE binary for compiled model", v14, 2u);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    uint64_t v16 = static os_log_type_t.debug.getter(v15);
    os_log_type_t v17 = v16;
    unsigned __int8 v18 = (os_log_s *)Logger.logObject.getter(v16);
    if (os_log_type_enabled(v18, v17))
    {
      id v19 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v17, "About to purge compiled model", v19, 2u);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    id v20 = [(id)objc_opt_self(NSFileManager) defaultManager];
    URL._bridgeToObjectiveC()(v21);
    unint64_t v23 = v22;
    id v48 = 0LL;
    unsigned int v24 = [v20 removeItemAtURL:v22 error:&v48];

    id v10 = v48;
    if (v24)
    {
      uint64_t v25 = static os_log_type_t.debug.getter(v48);
      os_log_type_t v26 = v25;
      double v27 = (os_log_s *)Logger.logObject.getter(v25);
      if (os_log_type_enabled(v27, v26))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v26, "Successfully purged compiled model", v28, 2u);
        swift_slowDealloc(v28, -1LL, -1LL);
      }
    }

    else
    {
LABEL_18:
      id v37 = v10;
      uint64_t v38 = _convertNSErrorToError(_:)(v10);

      uint64_t v39 = swift_willThrow();
      uint64_t v40 = static os_log_type_t.error.getter(v39);
      if (qword_100034908 != -1) {
        swift_once(&qword_100034908, sub_100003470);
      }
      uint64_t v41 = qword_100035878;
      uint64_t v42 = sub_10000645C(&qword_100034A28);
      uint64_t v43 = swift_allocObject(v42, 72LL, 7LL);
      *(_OWORD *)(v43 + 16) = xmmword_1000253B0;
      uint64_t v44 = URL.path.getter(v43);
      uint64_t v46 = v45;
      *(void *)(v43 + 56) = &type metadata for String;
      *(void *)(v43 + 64) = sub_100007D1C();
      *(void *)(v43 + 32) = v44;
      *(void *)(v43 + 40) = v46;
      os_log(_:dso:log:_:_:)( v40,  &_mh_execute_header,  v41,  "Failed to purge ANE binary for compiled model at %@",  51LL,  2LL,  v43);
      swift_bridgeObjectRelease(v43, v47);
      swift_errorRelease(v38);
    }
  }

  else
  {
    uint64_t v29 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    if (qword_100034908 != -1) {
      swift_once(&qword_100034908, sub_100003470);
    }
    uint64_t v30 = qword_100035878;
    uint64_t v31 = sub_10000645C(&qword_100034A28);
    uint64_t v32 = swift_allocObject(v31, 72LL, 7LL);
    *(_OWORD *)(v32 + 16) = xmmword_1000253B0;
    uint64_t v33 = URL.path.getter(v32);
    uint64_t v35 = v34;
    *(void *)(v32 + 56) = &type metadata for String;
    *(void *)(v32 + 64) = sub_100007D1C();
    *(void *)(v32 + 32) = v33;
    *(void *)(v32 + 40) = v35;
    os_log(_:dso:log:_:_:)( v29,  &_mh_execute_header,  v30,  "Compiled model URL failed security check when attempting to cleanup: %@",  71LL,  2LL,  v32);
    swift_bridgeObjectRelease(v32, v36);
  }

uint64_t sub_10000829C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  void v5[9] = a3;
  v5[7] = a1;
  uint64_t v6 = type metadata accessor for URL(0LL);
  v5[12] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[13] = v7;
  v5[14] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100008304, 0LL, 0LL);
}

void sub_100008304()
{
  void (*v76)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t (*v87)();
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  os_log_s *v99;
  os_log_type_t v100;
  BOOL v101;
  void *v102;
  uint8_t *v103;
  os_log_s *v104;
  os_log_type_t v105;
  const char *v106;
  uint8_t *v107;
  uint32_t v108;
  os_log_type_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  __int128 *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t (*v131)();
  os_log_type_t v132;
  BOOL v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  double *v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  if (qword_100034918 != -1) {
    swift_once(&qword_100034918, sub_1000035C4);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100007D60(v1, (uint64_t)qword_100034920);
  *(void *)(v0 + 120) = v2;
  uint64_t v3 = static os_log_type_t.debug.getter(v2);
  os_log_type_t v4 = v3;
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v3);
  if (os_log_type_enabled(v5, v4))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v4, "beginning first security check on model URL", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = sub_1000180A0();
  if ((v7 & 1) == 0)
  {
    uint64_t v35 = static os_log_type_t.error.getter(v7);
    os_log_type_t v36 = v35;
    id v37 = (os_log_s *)Logger.logObject.getter(v35);
    if (!os_log_type_enabled(v37, v36)) {
      goto LABEL_21;
    }
    uint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v38 = 0;
    uint64_t v39 = "failed first security check on model URL";
    goto LABEL_20;
  }

  uint64_t v8 = static os_log_type_t.debug.getter(v7);
  os_log_type_t v9 = v8;
  id v10 = (os_log_s *)Logger.logObject.getter(v8);
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "beginning second security check on model URL", v11, 2u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  uint64_t v12 = sub_100018468();
  if ((v12 & 1) == 0)
  {
    uint64_t v40 = static os_log_type_t.error.getter(v12);
    os_log_type_t v36 = v40;
    id v37 = (os_log_s *)Logger.logObject.getter(v40);
    if (!os_log_type_enabled(v37, v36)) {
      goto LABEL_21;
    }
    uint64_t v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v38 = 0;
    uint64_t v39 = "failed second security check on model URL";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v37, v36, v39, v38, 2u);
    swift_slowDealloc(v38, -1LL, -1LL);
LABEL_21:

    unint64_t v41 = sub_100009FE4();
    swift_allocError(&type metadata for PerfRunner.PerfRunError, v41, 0LL, 0LL);
    _BYTE *v42 = 1;
    swift_willThrow();
LABEL_22:
    swift_task_dealloc(*(void *)(v0 + 112));
    uint64_t v43 = *(void (**)(void))(v0 + 8);
    goto LABEL_23;
  }

  uint64_t v13 = static os_log_type_t.debug.getter(v12);
  os_log_type_t v14 = v13;
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v13);
  if (os_log_type_enabled(v15, v14))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v14, "passed security checks on model URL", v16, 2u);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  os_log_type_t v17 = (uint64_t *)(v0 + 16);

  uint64_t v19 = static os_log_type_t.debug.getter(v18);
  os_log_type_t v20 = v19;
  id v21 = (os_log_s *)Logger.logObject.getter(v19);
  if (os_log_type_enabled(v21, v20))
  {
    char v22 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v20, "initializing random seed", v22, 2u);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  uint64_t v23 = type metadata accessor for SeededRNG();
  uint64_t v24 = swift_allocObject(v23, 24LL, 7LL);
  *(void *)(v24 + 16) = 0LL;
  uint64_t *v17 = v24;
  uint64_t v25 = static os_log_type_t.debug.getter(v24);
  os_log_type_t v26 = v25;
  double v27 = (os_log_s *)Logger.logObject.getter(v25);
  if (os_log_type_enabled(v27, v26))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v26, "trying inputGenerator", v28, 2u);
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  uint64_t v29 = *(void *)(v0 + 64);

  uint64_t v31 = (void *)sub_100012B6C((uint64_t)_swiftEmptyArrayStorage, v30);
  sub_100012188(v29, v31);
  *(void *)(v0 + 128) = v32;
  *(void *)(v0 + 136) = v33;
  uint64_t v34 = swift_bridgeObjectRelease(v31, v33);
  uint64_t v44 = static os_log_type_t.debug.getter(v34);
  os_log_type_t v45 = v44;
  uint64_t v46 = (os_log_s *)Logger.logObject.getter(v44);
  if (os_log_type_enabled(v46, v45))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v45, "finished inputGenerator", v47, 2u);
    swift_slowDealloc(v47, -1LL, -1LL);
  }

  uint64_t v49 = *(void *)(v0 + 72);
  uint64_t v48 = *(void *)(v0 + 80);

  uint64_t v50 = *(void *)(v48 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_functionName + 8);
  id v51 = [objc_allocWithZone(MLModelConfiguration) init];
  *(void *)(v0 + 144) = v51;
  [v51 setComputeUnits:v49];
  if (v50) {
    NSString v52 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v52 = 0LL;
  }
  uint64_t v53 = *(void *)(v0 + 80);
  [v51 setFunctionName:v52];

  uint64_t v54 = *(void *)(v53 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_experimentIterations);
  *(void *)(v0 + 152) = v54;
  if (v54 < 0)
  {
    __break(1u);
    return;
  }

  if (!v54)
  {
LABEL_52:
    v116 = *(void *)(v0 + 136);
    v117 = *(void **)(v0 + 144);
    v118 = *(void *)(v0 + 112);
    v119 = *(void *)(v0 + 88);
    v120 = *(void *)(v0 + 56);
    v121 = sub_10000CC1C();
    v122 = (__int128 *)(v119 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
    v123 = *(void *)(v119 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24);
    *(void *)(v119 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24) = v121;
    swift_bridgeObjectRelease(v123, v124);
    sub_100005888();

    swift_release(v116);
    swift_release(*(void *)(v0 + 16));
    v126 = *((void *)v122 + 4);
    v125 = *((void *)v122 + 5);
    LOBYTE(v117) = *((_BYTE *)v122 + 48);
    v127 = *((void *)v122 + 7);
    v142 = v122[1];
    v144 = *v122;
    swift_task_dealloc(v118);
    *(_OWORD *)v120 = v144;
    *(_OWORD *)(v120 + 16) = v142;
    *(void *)(v120 + 32) = v126;
    *(void *)(v120 + 40) = v125;
    *(_BYTE *)(v120 + 48) = (_BYTE)v117;
    *(void *)(v120 + 56) = v127;
    uint64_t v43 = *(void (**)(void))(v0 + 8);
LABEL_23:
    v43();
    return;
  }

  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  v141 = v0 + 40;
  v138 = v0 + 48;
  v140 = (double *)(v0 + 24);
  uint64_t v57 = *(void *)(v0 + 80);
  uint64_t v58 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_loadCount;
  uint64_t v59 = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxPredictionTime;
  *(void *)(v0 + 160) = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_predictionCount;
  *(void *)(v0 + 168) = v59;
  *(void *)(v0 + 176) = OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13PerfRunConfig_maxIterationTime;
  v139 = (uint64_t *)(v0 + 32);
  *(void *)(v0 + 184) = *(void *)(v57 + v58);
  *(void *)(v0 + 192) = 0LL;
  while (1)
  {
    v143 = v55;
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v62 = static os_log_type_t.debug.getter(v61);
    os_log_type_t v63 = v62;
    v64 = (os_log_s *)Logger.logObject.getter(v62);
    if (os_log_type_enabled(v64, v63))
    {
      v65 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v65 = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, v63, "Invoking compileAndLoadModel", v65, 2u);
      swift_slowDealloc(v65, -1LL, -1LL);
    }

    uint64_t v66 = *(void *)(v0 + 184);
    v67 = *(void **)(v0 + 144);
    uint64_t v68 = *(void *)(v0 + 112);
    uint64_t v69 = *(void *)(v0 + 64);

    uint64_t v70 = sub_1000059FC(v68, v69, v66, v67);
    *(void *)(v0 + 200) = v70;
    if (v56)
    {
      v128 = *(void *)(v0 + 136);
      v129 = *(void *)(v0 + 16);

      swift_release(v128);
      swift_release(v129);
      goto LABEL_22;
    }

    uint64_t v71 = v70;
    uint64_t v72 = static os_log_type_t.debug.getter(v70);
    os_log_type_t v73 = v72;
    uint64_t v74 = (os_log_s *)Logger.logObject.getter(v72);
    if (os_log_type_enabled(v74, v73))
    {
      uint64_t v75 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v73, "Finished compileAndLoadModel", v75, 2u);
      swift_slowDealloc(v75, -1LL, -1LL);
    }

    uint64_t v76 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v0 + 128);

    v76(&v145, v17);
    v77 = v145;
    *(void *)(v0 + 208) = v145;
    uint64_t v78 = [v71 modelDescription];
    uint64_t v79 = [v78 stateDescriptionsByName];

    uint64_t v80 = sub_10000A028(0LL, &qword_100034A70, &OBJC_CLASS___MLFeatureDescription_ptr);
    uint64_t v81 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v79,  &type metadata for String,  v80,  &protocol witness table for String);

    uint64_t v82 = *(void *)(v81 + 16);
    uint64_t v84 = swift_bridgeObjectRelease(v81, v83);
    if (v82)
    {
      v85 = MLModel.makeState()(v84);
      pid_t v86 = (void *)swift_allocObject(&unk_100030F70, 40LL, 7LL);
      v86[2] = v71;
      v86[3] = v77;
      v86[4] = v85;
      id v87 = sub_10000A094;
    }

    else
    {
      pid_t v86 = (void *)swift_allocObject(&unk_100030F98, 32LL, 7LL);
      v86[2] = v71;
      v86[3] = v77;
      id v87 = sub_10000A0DC;
    }

    *(void *)(v0 + 216) = v86;
    v88 = *(void *)(v0 + 80);
    int64_t v89 = *(void *)(v88 + *(void *)(v0 + 160));
    int64_t v90 = *(void *)(v88 + *(void *)(v0 + 168));
    int64_t v91 = v71;
    swift_unknownObjectRetain(v77);
    swift_retain(v86);
    sub_100005440(v89, v90, (void (*)(uint64_t))v87);
    *(void *)(v0 + 224) = 0LL;
    int64_t v92 = *(void *)(v0 + 176);
    int64_t v93 = *(void *)(v0 + 80);
    swift_release(v86);
    v95 = CFAbsoluteTimeGetCurrent();
    v96 = *(void *)(v93 + v92);
    if (!v96)
    {
      v99 = (os_log_s *)Logger.logObject.getter(v94);
      v109 = static os_log_type_t.debug.getter(v99);
      if (!os_log_type_enabled(v99, v109)) {
        goto LABEL_48;
      }
      v103 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v103 = 0;
      v104 = v99;
      v105 = v109;
      v106 = "Max iteration time ignored";
      v107 = v103;
      v108 = 2;
      goto LABEL_46;
    }

    v97 = v95 - Current;
    id v98 = Logger.logObject.getter(*(id *)(v0 + 80));
    v99 = (os_log_s *)v98;
    pid_t v100 = static os_log_type_t.debug.getter(v98);
    v101 = os_log_type_enabled(v99, v100);
    v102 = *(void **)(v0 + 80);
    if (v101)
    {
      v103 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)v103 = 134218240;
      *v140 = v97;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v140, v139, v103 + 4, v103 + 12);
      *((_WORD *)v103 + 6) = 2048;
      *v139 = v96;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v139, v141, v103 + 14, v103 + 22);

      v104 = v99;
      v105 = v100;
      v106 = "Max iteration time not yet exceeded: %f < %lld";
      v107 = v103;
      v108 = 22;
LABEL_46:
      _os_log_impl((void *)&_mh_execute_header, v104, v105, v106, v107, v108);
      swift_slowDealloc(v103, -1LL, -1LL);
      goto LABEL_48;
    }

LABEL_48:
    if (v143 == *(void *)(v0 + 152) - 1LL)
    {
      v130 = (void *)swift_task_alloc(dword_1000349CC);
      *(void *)(v0 + 240) = v130;
      v131 = sub_100009074;
      goto LABEL_59;
    }

    swift_unknownObjectRelease(v77);
    swift_release(v86);
    v110 = *(void **)(v0 + 200);
    v111 = *(void *)(v0 + 152);
    v113 = *(void *)(v0 + 104);
    v112 = *(void *)(v0 + 112);
    v114 = *(void *)(v0 + 96);
    v115 = *(void *)(v0 + 192) + 1LL;
    sub_100007DB8();

    (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v112, v114);
    if (v115 == v111) {
      goto LABEL_52;
    }
    uint64_t v56 = *(void *)(v0 + 224);
    uint64_t v55 = *(void *)(v0 + 192) + 1LL;
    *(void *)(v0 + 192) = v55;
    if (v55 == *(void *)(v0 + 152))
    {
      __break(1u);
      goto LABEL_52;
    }
  }

  v132 = static os_log_type_t.info.getter(v98);
  v133 = os_log_type_enabled(v99, v132);
  v134 = *(void **)(v0 + 80);
  if (v133)
  {
    v135 = swift_slowAlloc(22LL, -1LL);
    *(_DWORD *)v135 = 134218240;
    *(double *)(v0 + 40) = v97;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v141, v138, v135 + 4, v135 + 12);
    *(_WORD *)(v135 + 12) = 2048;
    *(void *)(v0 + 48) = v96;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v138, v0 + 56, v135 + 14, v135 + 22);

    _os_log_impl( (void *)&_mh_execute_header,  v99,  v132,  "Max iteration time exceeded: %f >= %lld",  (uint8_t *)v135,  0x16u);
    swift_slowDealloc(v135, -1LL, -1LL);
  }

  else
  {
  }

  v130 = (void *)swift_task_alloc(dword_1000349CC);
  *(void *)(v0 + 232) = v130;
  v131 = sub_100008F24;
LABEL_59:
  *v130 = v0;
  v130[1] = v131;
  v136 = *(void *)(v0 + 112);
  v137 = *(void *)(v0 + 88);
  v130[9] = *(void *)(v0 + 144);
  v130[10] = v137;
  v130[8] = v136;
  swift_task_switch(sub_100004E28, 0LL, 0LL);
}

uint64_t sub_100008F24()
{
  return swift_task_switch(sub_100008F78, 0LL, 0LL);
}

uint64_t sub_100008F78()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void **)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 96);
  swift_release(*(void *)(v0 + 216));
  swift_unknownObjectRelease(v1);
  sub_100007DB8();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = *(void **)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 56);
  uint64_t v11 = sub_10000CC1C();
  uint64_t v12 = (__int128 *)(v9 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  uint64_t v13 = *(void *)(v9 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24);
  *(void *)(v9 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24) = v11;
  swift_bridgeObjectRelease(v13, v14);
  sub_100005888();
  swift_release(v6);

  swift_release(*(void *)(v0 + 16));
  uint64_t v16 = *((void *)v12 + 4);
  uint64_t v15 = *((void *)v12 + 5);
  LOBYTE(v7) = *((_BYTE *)v12 + 48);
  uint64_t v17 = *((void *)v12 + 7);
  __int128 v19 = v12[1];
  __int128 v20 = *v12;
  swift_task_dealloc(v8);
  *(_OWORD *)uint64_t v10 = v20;
  *(_OWORD *)(v10 + 16) = v19;
  *(void *)(v10 + 32) = v16;
  *(void *)(v10 + 40) = v15;
  *(_BYTE *)(v10 + 48) = (_BYTE)v7;
  *(void *)(v10 + 56) = v17;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009074()
{
  return swift_task_switch(sub_1000090C8, 0LL, 0LL);
}

uint64_t sub_1000090C8()
{
  void (*v40)(uint64_t *__return_ptr, uint64_t);
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t (*v51)();
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  os_log_s *v63;
  os_log_type_t v64;
  BOOL v65;
  void *v66;
  uint64_t v67;
  os_log_s *v68;
  os_log_type_t v69;
  const char *v70;
  uint8_t *v71;
  uint32_t v72;
  os_log_type_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t (*v83)();
  os_log_type_t v84;
  BOOL v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  double *v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v1 = *(void *)(v0 + 216);
  swift_unknownObjectRelease(*(void *)(v0 + 208));
  swift_release(v1);
  uint64_t v2 = *(void **)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 192) + 1LL;
  sub_100007DB8();

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v7 != v3)
  {
    int64_t v91 = (uint64_t *)(v0 + 32);
    int64_t v92 = (double *)(v0 + 24);
    v94 = v0 + 40;
    int64_t v90 = v0 + 48;
    while (1)
    {
      uint64_t v22 = *(void *)(v0 + 224);
      uint64_t v23 = *(void *)(v0 + 192);
      *(void *)(v0 + 192) = v23 + 1;
      if (v23 + 1 == *(void *)(v0 + 152))
      {
        __break(1u);
        return result;
      }

      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v26 = static os_log_type_t.debug.getter(v25);
      os_log_type_t v27 = v26;
      uint64_t v28 = (os_log_s *)Logger.logObject.getter(v26);
      if (os_log_type_enabled(v28, v27))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v27, "Invoking compileAndLoadModel", v29, 2u);
        swift_slowDealloc(v29, -1LL, -1LL);
      }

      uint64_t v30 = *(void *)(v0 + 184);
      uint64_t v31 = *(void **)(v0 + 144);
      uint64_t v32 = *(void *)(v0 + 112);
      uint64_t v33 = *(void *)(v0 + 64);

      uint64_t v34 = sub_1000059FC(v32, v33, v30, v31);
      *(void *)(v0 + 200) = v34;
      if (v22)
      {
        uint64_t v80 = *(void *)(v0 + 136);
        uint64_t v81 = *(void *)(v0 + 16);

        swift_release(v80);
        swift_release(v81);
        swift_task_dealloc(*(void *)(v0 + 112));
        id v21 = *(uint64_t (**)(void))(v0 + 8);
        return v21();
      }

      uint64_t v35 = v34;
      uint64_t v36 = static os_log_type_t.debug.getter(v34);
      os_log_type_t v37 = v36;
      uint64_t v38 = (os_log_s *)Logger.logObject.getter(v36);
      if (os_log_type_enabled(v38, v37))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v37, "Finished compileAndLoadModel", v39, 2u);
        swift_slowDealloc(v39, -1LL, -1LL);
      }

      uint64_t v40 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v0 + 128);

      v40(&v96, v0 + 16);
      unint64_t v41 = v96;
      *(void *)(v0 + 208) = v96;
      uint64_t v42 = [v35 modelDescription];
      uint64_t v43 = [v42 stateDescriptionsByName];

      uint64_t v44 = sub_10000A028(0LL, &qword_100034A70, &OBJC_CLASS___MLFeatureDescription_ptr);
      os_log_type_t v45 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v43,  &type metadata for String,  v44,  &protocol witness table for String);

      uint64_t v46 = *(void *)(v45 + 16);
      uint64_t v48 = swift_bridgeObjectRelease(v45, v47);
      if (v46)
      {
        uint64_t v49 = MLModel.makeState()(v48);
        uint64_t v50 = (void *)swift_allocObject(&unk_100030F70, 40LL, 7LL);
        v50[2] = v35;
        v50[3] = v41;
        v50[4] = v49;
        id v51 = sub_10000A094;
      }

      else
      {
        uint64_t v50 = (void *)swift_allocObject(&unk_100030F98, 32LL, 7LL);
        v50[2] = v35;
        v50[3] = v41;
        id v51 = sub_10000A0DC;
      }

      *(void *)(v0 + 216) = v50;
      NSString v52 = *(void *)(v0 + 80);
      uint64_t v53 = *(void *)(v52 + *(void *)(v0 + 160));
      uint64_t v54 = *(void *)(v52 + *(void *)(v0 + 168));
      uint64_t v55 = v35;
      swift_unknownObjectRetain(v41);
      swift_retain(v50);
      sub_100005440(v53, v54, (void (*)(uint64_t))v51);
      *(void *)(v0 + 224) = 0LL;
      uint64_t v56 = *(void *)(v0 + 176);
      uint64_t v57 = *(void *)(v0 + 80);
      swift_release(v50);
      uint64_t v59 = CFAbsoluteTimeGetCurrent();
      uint64_t v60 = *(void *)(v57 + v56);
      if (!v60) {
        break;
      }
      uint64_t v61 = v59 - Current;
      uint64_t v62 = Logger.logObject.getter(*(id *)(v0 + 80));
      os_log_type_t v63 = (os_log_s *)v62;
      if (v61 >= (double)v60)
      {
        uint64_t v84 = static os_log_type_t.info.getter(v62);
        v85 = os_log_type_enabled(v63, v84);
        pid_t v86 = *(void **)(v0 + 80);
        if (v85)
        {
          id v87 = swift_slowAlloc(22LL, -1LL);
          *(_DWORD *)id v87 = 134218240;
          *(double *)(v0 + 40) = v61;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v94, v90, v87 + 4, v87 + 12);
          *(_WORD *)(v87 + 12) = 2048;
          *(void *)(v0 + 48) = v60;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v90, v0 + 56, v87 + 14, v87 + 22);

          _os_log_impl( (void *)&_mh_execute_header,  v63,  v84,  "Max iteration time exceeded: %f >= %lld",  (uint8_t *)v87,  0x16u);
          swift_slowDealloc(v87, -1LL, -1LL);
        }

        else
        {
        }

        uint64_t v82 = (void *)swift_task_alloc(dword_1000349CC);
        *(void *)(v0 + 232) = v82;
        uint64_t v83 = sub_100008F24;
        goto LABEL_31;
      }

      v64 = static os_log_type_t.debug.getter(v62);
      v65 = os_log_type_enabled(v63, v64);
      uint64_t v66 = *(void **)(v0 + 80);
      if (v65)
      {
        v67 = swift_slowAlloc(22LL, -1LL);
        *(_DWORD *)v67 = 134218240;
        *int64_t v92 = v61;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v92, v91, v67 + 4, v67 + 12);
        *(_WORD *)(v67 + 12) = 2048;
        *int64_t v91 = v60;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v94, v67 + 14, v67 + 22);

        uint64_t v68 = v63;
        uint64_t v69 = v64;
        uint64_t v70 = "Max iteration time not yet exceeded: %f < %lld";
        uint64_t v71 = (uint8_t *)v67;
        uint64_t v72 = 22;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v68, v69, v70, v71, v72);
        swift_slowDealloc(v67, -1LL, -1LL);
        goto LABEL_21;
      }

LABEL_21:
      if (v23 == *(void *)(v0 + 152) - 2LL)
      {
        uint64_t v82 = (void *)swift_task_alloc(dword_1000349CC);
        *(void *)(v0 + 240) = v82;
        uint64_t v83 = sub_100009074;
LABEL_31:
        *uint64_t v82 = v0;
        v82[1] = v83;
        v88 = *(void *)(v0 + 112);
        int64_t v89 = *(void *)(v0 + 88);
        v82[9] = *(void *)(v0 + 144);
        v82[10] = v89;
        v82[8] = v88;
        return swift_task_switch(sub_100004E28, 0LL, 0LL);
      }

      swift_unknownObjectRelease(v41);
      swift_release(v50);
      uint64_t v74 = *(void **)(v0 + 200);
      uint64_t v75 = *(void *)(v0 + 152);
      v77 = *(void *)(v0 + 104);
      uint64_t v76 = *(void *)(v0 + 112);
      uint64_t v78 = *(void *)(v0 + 96);
      uint64_t v79 = *(void *)(v0 + 192) + 1LL;
      sub_100007DB8();

      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
      if (v79 == v75) {
        goto LABEL_2;
      }
    }

    os_log_type_t v63 = (os_log_s *)Logger.logObject.getter(v58);
    os_log_type_t v73 = static os_log_type_t.debug.getter(v63);
    if (!os_log_type_enabled(v63, v73)) {
      goto LABEL_21;
    }
    v67 = swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v67 = 0;
    uint64_t v68 = v63;
    uint64_t v69 = v73;
    uint64_t v70 = "Max iteration time ignored";
    uint64_t v71 = (uint8_t *)v67;
    uint64_t v72 = 2;
    goto LABEL_19;
  }

LABEL_2:
  uint64_t v9 = *(void *)(v0 + 136);
  uint64_t v10 = *(void **)(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 112);
  uint64_t v12 = *(void *)(v0 + 88);
  uint64_t v13 = *(void *)(v0 + 56);
  uint64_t v14 = sub_10000CC1C();
  uint64_t v15 = (__int128 *)(v12 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers);
  uint64_t v16 = *(void *)(v12 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24);
  *(void *)(v12 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService10PerfRunner_timers + 24) = v14;
  swift_bridgeObjectRelease(v16, v17);
  sub_100005888();

  swift_release(v9);
  swift_release(*(void *)(v0 + 16));
  uint64_t v19 = *((void *)v15 + 4);
  uint64_t v18 = *((void *)v15 + 5);
  LOBYTE(v10) = *((_BYTE *)v15 + 48);
  uint64_t v20 = *((void *)v15 + 7);
  int64_t v93 = v15[1];
  v95 = *v15;
  swift_task_dealloc(v11);
  *(_OWORD *)uint64_t v13 = v95;
  *(_OWORD *)(v13 + 16) = v93;
  *(void *)(v13 + 32) = v19;
  *(void *)(v13 + 40) = v18;
  *(_BYTE *)(v13 + 48) = (_BYTE)v10;
  *(void *)(v13 + 56) = v20;
  id v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

char *sub_100009810(_OWORD *a1)
{
  uint64_t v3 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = JSONEncoder.init()();
  if (qword_100034918 != -1) {
    swift_once(&qword_100034918, sub_1000035C4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_100007D60(v8, (uint64_t)qword_100034920);
  uint64_t v10 = static os_log_type_t.debug.getter(v9);
  os_log_type_t v11 = v10;
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v10);
  if (os_log_type_enabled(v12, v11))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v11, "attempting to encode JSON", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  __int128 v14 = a1[1];
  v29[0] = *a1;
  v29[1] = v14;
  __int128 v15 = a1[3];
  v29[2] = a1[2];
  v29[3] = v15;
  unint64_t v16 = sub_100009F00();
  uint64_t v17 = dispatch thunk of JSONEncoder.encode<A>(_:)(v29, &type metadata for PerfRunner.TimerResults, v16);
  if (v1)
  {
    swift_release(v7);
  }

  else
  {
    uint64_t v19 = v17;
    unint64_t v20 = v18;
    uint64_t v21 = static os_log_type_t.debug.getter(v17);
    os_log_type_t v22 = v21;
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v24 = v22;
    if (os_log_type_enabled(v23, v22))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "successfully encoded JSON", v25, 2u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    static String.Encoding.utf8.getter();
    uint64_t v26 = String.init(data:encoding:)(v19, v20, v5);
    if (v27) {
      uint64_t v5 = (char *)v26;
    }
    else {
      uint64_t v5 = (char *)0xD000000000000011LL;
    }
    sub_100009F44(v19, v20);
    swift_release(v7);
  }

  return v5;
}

uint64_t sub_100009A70(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.error.getter();
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v3 = qword_100035878;
  uint64_t v4 = sub_10000645C(&qword_100034A28);
  uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_1000253B0;
  swift_getErrorValue(a1, v28, v27);
  uint64_t v6 = Error.localizedDescription.getter(v27[1], v27[2]);
  uint64_t v8 = v7;
  *(void *)(v5 + 56) = &type metadata for String;
  unint64_t v9 = sub_100007D1C();
  *(void *)(v5 + 64) = v9;
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v8;
  os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, v3, "PerfRunner error: %@", 20LL, 2LL, v5);
  swift_bridgeObjectRelease(v5, v10);
  uint64_t v26 = a1;
  swift_errorRetain(a1);
  uint64_t v11 = sub_10000645C(&qword_100034A60);
  uint64_t result = swift_dynamicCast(v24, &v26, v11, &type metadata for FeatureGeneration.GenerationError, 6LL);
  if ((result & 1) != 0)
  {
    uint64_t v13 = v24[0];
    uint64_t v14 = v24[1];
    char v15 = v25;
    uint64_t v16 = static os_log_type_t.error.getter();
    uint64_t v17 = qword_100035878;
    uint64_t v18 = swift_allocObject(v4, 72LL, 7LL);
    *(_OWORD *)(v18 + 16) = xmmword_1000253B0;
    sub_10000E020(v13, v14, v15);
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    sub_100009FCC(v13, v14, v15);
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = v9;
    *(void *)(v18 + 32) = v20;
    *(void *)(v18 + 40) = v22;
    os_log(_:dso:log:_:_:)(v16, &_mh_execute_header, v17, "PerfRunner generation error: %@", 31LL, 2LL, v18);
    return swift_bridgeObjectRelease(v18, v23);
  }

  return result;
}

unint64_t sub_100009C54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v20[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  uint64_t v6 = JSONEncoder.init()();
  swift_getErrorValue(a1, v22, v21);
  uint64_t v7 = Error.localizedDescription.getter(v21[1], v21[2]);
  uint64_t v9 = v8;
  v20[0] = 107LL;
  v20[1] = v7;
  v20[2] = v8;
  unint64_t v10 = sub_100009F88();
  uint64_t v11 = dispatch thunk of JSONEncoder.encode<A>(_:)(v20, &type metadata for PerfRunner.ErrorResponse, v10);
  unint64_t v13 = v12;
  uint64_t v14 = swift_bridgeObjectRelease(v9, v12);
  static String.Encoding.utf8.getter(v14);
  uint64_t v15 = String.init(data:encoding:)(v11, v13, v4);
  uint64_t v17 = v16;
  sub_100009F44(v11, v13);
  swift_release(v6);
  if (v17) {
    return v15;
  }
  else {
    return 0xD00000000000001DLL;
  }
}

uint64_t sub_100009E04(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 56);
  unsigned __int8 v8 = *(_BYTE *)(a1 + 48);
  swift_retain(*(void *)a1);
  swift_retain(v2);
  swift_retain(v3);
  swift_bridgeObjectRetain(v4);
  sub_1000060C8(v5, v6, v8);
  id v9 = v7;
  return a1;
}

uint64_t *sub_100009E84(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  unsigned __int8 v8 = (void *)a1[7];
  unsigned __int8 v9 = *((_BYTE *)a1 + 48);
  swift_bridgeObjectRelease(a1[3], a2);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  sub_10000615C(v6, v7, v9);

  return a1;
}

unint64_t sub_100009F00()
{
  unint64_t result = qword_100034A50;
  if (!qword_100034A50)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002546C, &type metadata for PerfRunner.TimerResults);
    atomic_store(result, (unint64_t *)&qword_100034A50);
  }

  return result;
}

uint64_t sub_100009F44(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100009F88()
{
  unint64_t result = qword_100034A58;
  if (!qword_100034A58)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000259C0, &type metadata for PerfRunner.ErrorResponse);
    atomic_store(result, (unint64_t *)&qword_100034A58);
  }

  return result;
}

uint64_t sub_100009FCC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease(a2, a2);
  }
  return result;
}

unint64_t sub_100009FE4()
{
  unint64_t result = qword_100034A68;
  if (!qword_100034A68)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025980, &type metadata for PerfRunner.PerfRunError);
    atomic_store(result, (unint64_t *)&qword_100034A68);
  }

  return result;
}

uint64_t sub_10000A028(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_10000A060()
{
  swift_unknownObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000A094()
{
  return sub_1000052CC(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10000A0B0()
{
  swift_unknownObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000A0DC()
{
  return sub_100005388(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

char *sub_10000A0F4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000A1DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10000A2CC()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10000A308()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  unint64_t v5 = (void *)v0[5];
  unint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc(dword_100034B04);
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10000A388;
  return ((uint64_t (*)(void *, uint64_t, void *, void *, void *))((char *)&dword_100034B00 + dword_100034B00))( v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_10000A388()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000A3D4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc(dword_100034B14);
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = sub_10000B050;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100034B10 + dword_100034B10))(v2, v3, v4);
}

uint64_t sub_10000A450()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000A47C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_100034B24);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000B050;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100034B20 + dword_100034B20))( a1,  v4,  v5,  v6);
}

uint64_t sub_10000A500(uint64_t a1)
{
  uint64_t v2 = sub_10000645C(&qword_100034AF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000A540()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000A564(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100034B34);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A388;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100034B30 + dword_100034B30))(a1, v4);
}

unint64_t sub_10000A5D4()
{
  unint64_t result = qword_100034B48;
  if (!qword_100034B48)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000258C0, &type metadata for PerfRunConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034B48);
  }

  return result;
}

_BYTE *_s13ComputeDeviceV10DeviceTypeOwCP(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunConfig.CodingKeys()
{
  return &type metadata for PerfRunConfig.CodingKeys;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_10000A66C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t getEnumTagSinglePayload for PerfRunner.PerfRunError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PerfRunner.PerfRunError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_10000A78C + 4 * byte_1000253E5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000A7C0 + 4 * byte_1000253E0[v4]))();
}

uint64_t sub_10000A7C0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A7C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000A7D0LL);
  }
  return result;
}

uint64_t sub_10000A7DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000A7E4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_10000A7E8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A7F0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A7FC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A804(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.PerfRunError()
{
  return &type metadata for PerfRunner.PerfRunError;
}

uint64_t initializeBufferWithCopyOfBuffer for PerfRunner.ErrorResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for PerfRunner.ErrorResponse(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16), a2);
}

void *assignWithCopy for PerfRunner.ErrorResponse(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = a2[2];
  uint64_t v4 = a1[2];
  a1[2] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4, v5);
  return a1;
}

__n128 _s11DeviceUsageVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PerfRunner.ErrorResponse(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v3, a2);
  return a1;
}

uint64_t getEnumTagSinglePayload for PerfRunner.ErrorResponse(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PerfRunner.ErrorResponse(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.ErrorResponse()
{
  return &type metadata for PerfRunner.ErrorResponse;
}

uint64_t _s14ModelStructureO7ProgramV9OperationV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t _s35com_apple_dt_DTMLModelRunnerService13PerfRunConfigC10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_10000AA60 + 4 * byte_1000253EF[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10000AA94 + 4 * byte_1000253EA[v4]))();
}

uint64_t sub_10000AA94(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AA9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000AAA4LL);
  }
  return result;
}

uint64_t sub_10000AAB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000AAB8LL);
  }
  *(_BYTE *)__n128 result = a2 + 5;
  return result;
}

uint64_t sub_10000AABC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AAC4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.TimerResults.CodingKeys()
{
  return &type metadata for PerfRunner.TimerResults.CodingKeys;
}

unint64_t sub_10000AAE4()
{
  unint64_t result = qword_100034B60;
  if (!qword_100034B60)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000255D8, &type metadata for PerfRunner.TimerResults.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034B60);
  }

  return result;
}

unint64_t sub_10000AB2C()
{
  unint64_t result = qword_100034B68;
  if (!qword_100034B68)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025640, &type metadata for PerfRunner.PerfRunError);
    atomic_store(result, (unint64_t *)&qword_100034B68);
  }

  return result;
}

uint64_t sub_10000AB70()
{
  return sub_100006670( &qword_100034B70,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_1000256DC);
}

uint64_t sub_10000ABA0()
{
  return sub_100006670( &qword_100034B78,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_1000256B0);
}

uint64_t sub_10000ABD0()
{
  return sub_100006670( &qword_100034B80,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey,  (uint64_t)&unk_10002574C);
}

unint64_t sub_10000AC04()
{
  unint64_t result = qword_100034B88;
  if (!qword_100034B88)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025898, &type metadata for PerfRunConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034B88);
  }

  return result;
}

unint64_t sub_10000AC4C()
{
  unint64_t result = qword_100034B90;
  if (!qword_100034B90)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025808, &type metadata for PerfRunConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034B90);
  }

  return result;
}

unint64_t sub_10000AC94()
{
  unint64_t result = qword_100034B98;
  if (!qword_100034B98)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025830, &type metadata for PerfRunConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034B98);
  }

  return result;
}

uint64_t sub_10000ACD8()
{
  return sub_100006670( (unint64_t *)&qword_100034BA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for CFString,  (uint64_t)&unk_10002593C);
}

uint64_t sub_10000AD08()
{
  return sub_100006670( &qword_100034BA8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for CFString,  (uint64_t)&unk_100025678);
}

unint64_t sub_10000AD3C()
{
  unint64_t result = qword_100034BB0;
  if (!qword_100034BB0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025548, &type metadata for PerfRunner.TimerResults.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034BB0);
  }

  return result;
}

unint64_t sub_10000AD84()
{
  unint64_t result = qword_100034BB8;
  if (!qword_100034BB8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025570, &type metadata for PerfRunner.TimerResults.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034BB8);
  }

  return result;
}

unint64_t sub_10000ADC8()
{
  unint64_t result = qword_100034BC8;
  if (!qword_100034BC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025AF0, &type metadata for PerfRunner.ErrorResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034BC8);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for PerfRunner.ErrorResponse.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for PerfRunner.ErrorResponse.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_10000AEE8 + 4 * byte_1000253F9[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000AF1C + 4 * byte_1000253F4[v4]))();
}

uint64_t sub_10000AF1C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AF24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000AF2CLL);
  }
  return result;
}

uint64_t sub_10000AF38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000AF40LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10000AF44(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AF4C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000AF58(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PerfRunner.ErrorResponse.CodingKeys()
{
  return &type metadata for PerfRunner.ErrorResponse.CodingKeys;
}

unint64_t sub_10000AF78()
{
  unint64_t result = qword_100034BE0;
  if (!qword_100034BE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025AC8, &type metadata for PerfRunner.ErrorResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034BE0);
  }

  return result;
}

unint64_t sub_10000AFC0()
{
  unint64_t result = qword_100034BE8;
  if (!qword_100034BE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025A38, &type metadata for PerfRunner.ErrorResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034BE8);
  }

  return result;
}

unint64_t sub_10000B008()
{
  unint64_t result = qword_100034BF0;
  if (!qword_100034BF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025A60, &type metadata for PerfRunner.ErrorResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100034BF0);
  }

  return result;
}

uint64_t sub_10000B064()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for SeededRNG()
{
  return objc_opt_self(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService9SeededRNG);
}

unint64_t sub_10000B094()
{
  unint64_t v1 = *(void *)(*(void *)v0 + 16LL) - 0x61C8864680B583EBLL;
  *(void *)(*(void *)v0 + 16LL) = v1;
  unint64_t v2 = (0xBF58476D1CE4E5B9LL * (v1 ^ (v1 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v1 ^ (v1 >> 30))) >> 27);
  return (0x94D049BB133111EBLL * v2) ^ ((0x94D049BB133111EBLL * v2) >> 31);
}

uint64_t sub_10000B0EC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a3 - a2 == -1)
  {
    unint64_t v11 = *(void *)(*a1 + 16) - 0x61C8864680B583EBLL;
    *(void *)(*a1 + 16) = v11;
    unint64_t v12 = (0xBF58476D1CE4E5B9LL * (v11 ^ (v11 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v11 ^ (v11 >> 30))) >> 27);
    int64_t v10 = (0x94D049BB133111EBLL * v12) ^ ((0x94D049BB133111EBLL * v12) >> 31);
  }

  else
  {
    int64_t v10 = sub_10000FA1C(a3 - a2 + 1) + a2;
  }

  int64_t v13 = v10 & ~(v10 >> 63);
  swift_bridgeObjectRetain(a5);
  unint64_t v14 = sub_10000B208(0LL, v13, a2, a3, a4, a5, a1);
  swift_bridgeObjectRelease(a5, v15);
  unint64_t v19 = v14;
  uint64_t v16 = sub_10000645C(&qword_100034CB8);
  unint64_t v17 = sub_10000B474();
  return String.init<A>(_:)(&v19, v16, v17);
}

unint64_t sub_10000B208( unint64_t result, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t *a7)
{
  uint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  if (!v7) {
    return (unint64_t)_swiftEmptyArrayStorage;
  }
  int64_t v11 = result;
  unint64_t result = sub_100013518(0, v7 & ~(v7 >> 63), 0);
  if (a2 >= v11 && (v7 & 0x8000000000000000LL) == 0)
  {
    uint64_t v34 = v7;
    uint64_t v12 = 0LL;
    uint64_t v13 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000LL) == 0) {
      uint64_t v13 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v35 = v13;
    while (v12 != v7)
    {
      if (!v35) {
        goto LABEL_22;
      }
      swift_bridgeObjectRetain(a6);
      unint64_t result = String.count.getter(a5, a6);
      if ((result & 0x8000000000000000LL) != 0) {
        goto LABEL_23;
      }
      if (!result) {
        goto LABEL_24;
      }
      uint64_t v14 = *a7;
      uint64_t v15 = *(void *)(*a7 + 16);
      uint64_t v16 = v15 - 0x61C8864680B583EBLL;
      *(void *)(*a7 + 16) = v15 - 0x61C8864680B583EBLL;
      unint64_t v17 = 0xBF58476D1CE4E5B9LL
          * ((v15 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v15 - 0x61C8864680B583EBLL) >> 30));
      unint64_t v18 = (0x94D049BB133111EBLL * (v17 ^ (v17 >> 27))) ^ ((0x94D049BB133111EBLL * (v17 ^ (v17 >> 27))) >> 31);
      unint64_t v19 = v18 * result;
      uint64_t v20 = (v18 * (unsigned __int128)result) >> 64;
      if (result > v18 * result)
      {
        unint64_t v21 = -(uint64_t)result % result;
        if (v21 > v19)
        {
          unint64_t v22 = v15 + 0x3C6EF372FE94F82ALL;
          do
          {
            v16 -= 0x61C8864680B583EBLL;
            unint64_t v23 = 0x94D049BB133111EBLL
                * ((0xBF58476D1CE4E5B9LL * (v22 ^ (v22 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v22 ^ (v22 >> 30))) >> 27));
            unint64_t v24 = v23 ^ (v23 >> 31);
            v22 -= 0x61C8864680B583EBLL;
          }

          while (v21 > v24 * result);
          uint64_t v20 = (v24 * (unsigned __int128)result) >> 64;
          *(void *)(v14 + 16) = v16;
        }
      }

      uint64_t v25 = String.index(_:offsetBy:)(15LL, v20, a5, a6);
      uint64_t v26 = a5;
      uint64_t v27 = String.subscript.getter(v25, a5, a6);
      uint64_t v29 = v28;
      unint64_t v30 = a6;
      unint64_t result = swift_bridgeObjectRelease(a6, v28);
      unint64_t v32 = _swiftEmptyArrayStorage[2];
      unint64_t v31 = _swiftEmptyArrayStorage[3];
      if (v32 >= v31 >> 1) {
        unint64_t result = sub_100013518(v31 > 1, v32 + 1, 1);
      }
      ++v12;
      _swiftEmptyArrayStorage[2] = v32 + 1;
      uint64_t v33 = &_swiftEmptyArrayStorage[2 * v32];
      v33[4] = v27;
      v33[5] = v29;
      uint64_t v7 = v34;
      a6 = v30;
      a5 = v26;
      if (v12 == v34) {
        return (unint64_t)_swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

LABEL_26:
  __break(1u);
  return result;
}

  uint64_t v40 = v23;
  unint64_t v41 = (v22 - 1) & v22;
  for (i = __clz(__rbit64(v22)) + (v23 << 6); ; i = __clz(__rbit64(v6)) | (v40 << 6))
  {
    uint64_t v25 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v26 = v25[1];
    uint64_t v27 = *(void **)(*(void *)(v1 + 56) + 8 * i);
    uint64_t v43 = *v25;
    uint64_t v44 = v26;
    uint64_t v42 = v27;
    uint64_t v28 = sub_10000A028(0LL, v10, v11);
    swift_bridgeObjectRetain(v26);
    uint64_t v29 = v27;
    swift_dynamicCast(v7, &v42, v28, v12, 7LL);
    unint64_t v31 = v43;
    unint64_t v30 = v44;
    sub_10001233C(v7, v8);
    sub_10001233C(v8, v48);
    sub_10001233C(v48, &v46);
    unint64_t result = sub_100012FFC(v31, v30);
    uint64_t v33 = result;
    if ((v32 & 1) != 0)
    {
      uint64_t v13 = v8;
      uint64_t v14 = v7;
      uint64_t v15 = v1;
      uint64_t v16 = v11;
      unint64_t v17 = v10;
      unint64_t v18 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v18[1], v32);
      os_log_s *v18 = v31;
      v18[1] = v30;
      int64_t v10 = v17;
      int64_t v11 = v16;
      unint64_t v1 = v15;
      uint64_t v7 = v14;
      int v8 = v13;
      uint64_t v12 = (char *)&type metadata for Any + 8;
      unint64_t v19 = (void *)(v3[7] + 32 * v33);
      sub_10000D788(v19);
      unint64_t result = (unint64_t)sub_10001233C(&v46, v19);
      unsigned int v6 = v41;
      if (!v41) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v34 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v34 = v31;
    v34[1] = v30;
    unint64_t result = (unint64_t)sub_10001233C(&v46, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v35 = v3[2];
    uint64_t v36 = __OFADD__(v35, 1LL);
    os_log_type_t v37 = v35 + 1;
    if (v36) {
      goto LABEL_34;
    }
    v3[2] = v37;
    unsigned int v6 = v41;
    if (!v41) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v41 = (v6 - 1) & v6;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_10000B474()
{
  unint64_t result = qword_100034CC0[0];
  if (!qword_100034CC0[0])
  {
    uint64_t v1 = sub_100006568(&qword_100034CB8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, qword_100034CC0);
  }

  return result;
}

uint64_t sub_10000B4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 16LL);
}

void *sub_10000B4C8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t sub_10000B4F4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 8));
}

void *sub_10000B4FC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 _s14ModelStructureO7ProgramV14NamedValueTypeVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000B540(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t _s14ModelStructureO8PipelineVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t _s14ModelStructureO8PipelineVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t type metadata accessor for AnyValueGenerator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000B600(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyValueGenerator);
}

uint64_t sub_10000B600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_10000B630( uint64_t a1, void (*a2)(void **__return_ptr), void *a3, void (*a4)(uint64_t *__return_ptr, uint64_t), uint64_t inited)
{
  unsigned __int8 v9 = v43;
  unint64_t v10 = v43[2];
  if (v10)
  {
    int64_t v11 = v43 + 4;
    uint64_t v12 = 1LL;
    uint64_t v13 = v43[2];
    while (1)
    {
      uint64_t v14 = *v11++;
      uint64_t v15 = v12 * v14;
      uint64_t v12 = v15;
      if (!--v13) {
        goto LABEL_7;
      }
    }

    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v15 = 1LL;
LABEL_7:
  swift_retain(inited);
  a3 = sub_10000E154(v15, a1, a4);
  swift_release(inited);
  uint64_t v16 = sub_10000645C(&qword_100034D60);
  inited = swift_initStackObject(v16, v46);
  *(_OWORD *)(inited + 16) = xmmword_1000253B0;
  unint64_t v17 = (__CFString *)kCVPixelBufferIOSurfacePropertiesKey;
  *(void *)(inited + 32) = kCVPixelBufferIOSurfacePropertiesKey;
  unint64_t v18 = v17;
  a4 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_100012C68((uint64_t)_swiftEmptyArrayStorage, v19);
  *(void *)(inited + 64) = sub_10000645C(&qword_100034D68);
  *(void *)(inited + 40) = a4;
  unint64_t v21 = sub_100012DA8(inited, v20);
  if (!v10) {
    goto LABEL_16;
  }
  if (v10 > v9[2])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  inited = v9[v10 + 3];
  if (!inited)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  unint64_t v22 = v21;
  if (v15 == 0x8000000000000000LL && inited == -1) {
    __break(1u);
  }
  CVPixelBufferRef pixelBufferOut = 0LL;
  a1 = v15 / inited;
  type metadata accessor for CFString(0LL);
  sub_10000C3E4();
  isa = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22, v24);
  CVReturn v25 = CVPixelBufferCreate(kCFAllocatorDefault, inited, v15 / inited, 0x4C303068u, isa, &pixelBufferOut);

  if (pixelBufferOut)
  {
    a4 = pixelBufferOut;
    if ((swift_isUniquelyReferenced_nonNull_native(a3) & 1) != 0)
    {
LABEL_14:
      unint64_t v27 = a3[2];
      uint64_t v43 = a3 + 4;
      unint64_t v44 = v27;
      sub_10000BA60((void **)&v43, a1, inited, (CVPixelBufferRef)a4);
      swift_bridgeObjectRelease(a3, v28);
      uint64_t v29 = sub_10000BCFC((uint64_t)v9, (uint64_t (*)(uint64_t))&Int._bridgeToObjectiveC());
      swift_bridgeObjectRelease(v9, v30);
      id v31 = objc_allocWithZone(&OBJC_CLASS___MLMultiArray);
      sub_10000C42C();
      Class v32 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v29, v33);
      id v34 = [v31 initWithPixelBuffer:a4 shape:v32];

      return (uint64_t)v34;
    }

LABEL_19:
    a3 = sub_10000BDA4((uint64_t)a3);
    goto LABEL_14;
  }

  os_log_type_t v36 = static os_log_type_t.error.getter(v26);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  os_log_type_t v37 = (os_log_s *)qword_100035878;
  if (os_log_type_enabled((os_log_t)qword_100035878, v36))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v38 = 67109120;
    LODWORD(v43) = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, (char *)&v43 + 4, v38 + 4, v38 + 8);
    _os_log_impl( (void *)&_mh_execute_header,  v37,  v36,  "Failed to create backing PB while generating F16 Multiarray input with err %d",  v38,  8u);
    swift_slowDealloc(v38, -1LL, -1LL);
  }

  uint64_t v43 = 0LL;
  unint64_t v44 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(77LL);
  v39._object = (void *)0x8000000100029280LL;
  v39._countAndFlagsBits = 0xD00000000000004BLL;
  String.append(_:)(v39);
  v40._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
  object = v40._object;
  String.append(_:)(v40);
  swift_bridgeObjectRelease(object, v42);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v43,  v44,  "com_apple_dt_DTMLModelRunnerService/FeatureValueGeneration.swift",  64LL,  2LL,  197LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10000BA60(void **a1, vImagePixelCount a2, vImagePixelCount a3, CVPixelBufferRef pixelBuffer)
{
  if ((a2 & 0x8000000000000000LL) != 0 || (a3 & 0x8000000000000000LL) != 0)
  {
    char v17 = 2;
    vImage_Error v7 = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  v17,  3451LL,  0);
    __break(1u);
  }

  else
  {
    if ((a3 - 0x2000000000000000LL) >> 62 != 3) {
      __break(1u);
    }
    src.data = *a1;
    src.height = a2;
    src.width = a3;
    src.rowBytes = 4 * a3;
    CVPixelBufferLockBaseAddress(pixelBuffer, 0LL);
    dest.data = CVPixelBufferGetBaseAddress(pixelBuffer);
    dest.height = a2;
    dest.width = a3;
    dest.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
    vImage_Error v7 = vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
    if (!v7) {
      return CVPixelBufferUnlockBaseAddress(pixelBuffer, 0LL);
    }
  }

  vImage_Error v9 = v7;
  os_log_type_t v10 = static os_log_type_t.error.getter(v7);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  int64_t v11 = (os_log_s *)qword_100035878;
  if (os_log_type_enabled((os_log_t)qword_100035878, v10))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v12 = 134217984;
    vImage_Error v19 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v12 + 4, v12 + 12);
    _os_log_impl( (void *)&_mh_execute_header,  v11,  v10,  "Failed to convert FToF16 for multiarray generation with err %ld",  v12,  0xCu);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  vImage_Error v19 = 0LL;
  unint64_t v20 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(62LL);
  v13._object = (void *)0x8000000100029320LL;
  v13._countAndFlagsBits = 0xD00000000000003CLL;
  String.append(_:)(v13);
  v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v14._object;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(object, v16);
  LODWORD(v18) = 0;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v19,  v20,  "com_apple_dt_DTMLModelRunnerService/FeatureValueGeneration.swift",  64LL,  2LL,  215LL,  v18);
  __break(1u);
  return result;
}

void *sub_10000BCF0(uint64_t a1)
{
  return sub_10000BCFC(a1, (uint64_t (*)(uint64_t))&Int64._bridgeToObjectiveC());
}

void *sub_10000BCFC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = _swiftEmptyArrayStorage;
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v3);
    unsigned int v6 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v6++;
      uint64_t v8 = a2(v7);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v9 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
      uint64_t v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v8);
      specialized ContiguousArray._endMutation()(v10);
      --v3;
    }

    while (v3);
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_10000BDA4(uint64_t a1)
{
  return sub_100006F34(0LL, *(void *)(a1 + 16), 0, a1);
}

CVPixelBufferRef sub_10000BDB8(size_t a1, size_t a2, OSType a3)
{
  CVPixelBufferRef pixelBufferOut = 0LL;
  uint64_t v6 = sub_10000645C(&qword_100034D60);
  uint64_t inited = swift_initStackObject(v6, v17);
  *(_OWORD *)(inited + 16) = xmmword_1000253B0;
  uint64_t v8 = (__CFString *)kCVPixelBufferIOSurfacePropertiesKey;
  *(void *)(inited + 32) = kCVPixelBufferIOSurfacePropertiesKey;
  uint64_t v9 = v8;
  unint64_t v11 = sub_100012C68((uint64_t)_swiftEmptyArrayStorage, v10);
  *(void *)(inited + 64) = sub_10000645C(&qword_100034D68);
  *(void *)(inited + 40) = v11;
  unint64_t v13 = sub_100012DA8(inited, v12);
  type metadata accessor for CFString(0LL);
  sub_10000C3E4();
  isa = (const __CFDictionary *)Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13, v15);
  CVPixelBufferCreate(kCFAllocatorDefault, a1, a2, a3, isa, &pixelBufferOut);

  CVPixelBufferRef result = pixelBufferOut;
  if (!pixelBufferOut) {
    __break(1u);
  }
  return result;
}

_BYTE *sub_10000BEFC( __CVBuffer *a1, void (*a2)(void **__return_ptr, uint64_t), uint64_t a3, uint64_t a4)
{
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488) {
    unint64_t v7 = 1LL;
  }
  else {
    unint64_t v7 = 4LL;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  int64_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  CVPixelBufferRef result = CVPixelBufferGetBaseAddress(a1);
  uint64_t v18 = result;
  if (!result) {
    goto LABEL_27;
  }
  if ((Height & 0x8000000000000000LL) == 0)
  {
    pixelBuffer = a1;
    if (!Height) {
      return (_BYTE *)CVPixelBufferUnlockBaseAddress(pixelBuffer, 0LL);
    }
    if ((Width & 0x8000000000000000LL) != 0) {
      goto LABEL_26;
    }
    uint64_t v11 = 0LL;
    while (v11 != Height)
    {
      if (Width)
      {
        uint64_t v12 = 0LL;
        unint64_t v13 = &v18[v11 * BytesPerRow];
        while (v12 != Width)
        {
          a2(&v20, a4);
          CVPixelBufferRef result = v20;
          if (v7 > v20[2]) {
            goto LABEL_22;
          }
          uint64_t v15 = 0LL;
          ++v12;
          do
          {
            uint64_t v16 = v15 + 1;
            v13[v15] = result[v15 + 32];
            uint64_t v15 = v16;
          }

          while (v7 != v16);
          CVPixelBufferRef result = (_BYTE *)swift_bridgeObjectRelease(result, v14);
          v13 += v16;
          if (v12 == Width) {
            goto LABEL_9;
          }
        }

        __break(1u);
LABEL_22:
        __break(1u);
        break;
      }

LABEL_9:
      if (++v11 == Height) {
        return (_BYTE *)CVPixelBufferUnlockBaseAddress(pixelBuffer, 0LL);
      }
    }

    __break(1u);
LABEL_24:
    __break(1u);
  }

  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10000C074(__CVBuffer *a1, size_t a2, size_t a3)
{
  VTPixelTransferSessionRef pixelTransferSessionOut = 0LL;
  uint64_t v6 = VTPixelTransferSessionCreate(kCFAllocatorDefault, &pixelTransferSessionOut);
  if (pixelTransferSessionOut)
  {
    unint64_t v7 = pixelTransferSessionOut;
    uint64_t v8 = sub_10000BDB8(a2, a3, 0x4C303068u);
    OSStatus v9 = VTPixelTransferSessionTransferImage(v7, a1, v8);
    uint64_t v10 = noErr.getter();
    if (v9 == (_DWORD)v10)
    {
      VTPixelTransferSessionInvalidate(v7);

      return (uint64_t)v8;
    }

    os_log_type_t v23 = static os_log_type_t.error.getter(v10);
    if (qword_100034908 != -1) {
      swift_once(&qword_100034908, sub_100003470);
    }
    uint64_t v24 = (os_log_s *)qword_100035878;
    if (os_log_type_enabled((os_log_t)qword_100035878, v23))
    {
      CVReturn v25 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)CVReturn v25 = 67109120;
      LODWORD(v31) = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, (char *)&v31 + 4, v25 + 4, v25 + 8);
      _os_log_impl((void *)&_mh_execute_header, v24, v23, "Failed to convert U8 PB to F16 with err %d", v25, 8u);
      swift_slowDealloc(v25, -1LL, -1LL);
    }

    unint64_t v31 = 0LL;
    unint64_t v32 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(42LL);
    swift_bridgeObjectRelease(v32, v26);
    unint64_t v31 = 0xD000000000000028LL;
    unint64_t v32 = 0x8000000100029250LL;
    HIDWORD(v30) = v9;
    v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    object = v27._object;
    String.append(_:)(v27);
    swift_bridgeObjectRelease(object, v29);
    unint64_t v20 = v31;
    unint64_t v21 = v32;
    LODWORD(v30) = 0;
    uint64_t v22 = 136LL;
  }

  else
  {
    int v12 = v6;
    os_log_type_t v13 = static os_log_type_t.error.getter(v6);
    if (qword_100034908 != -1) {
      swift_once(&qword_100034908, sub_100003470);
    }
    uint64_t v14 = (os_log_s *)qword_100035878;
    if (os_log_type_enabled((os_log_t)qword_100035878, v13))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v15 = 67109120;
      LODWORD(v31) = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, (char *)&v31 + 4, v15 + 4, v15 + 8);
      _os_log_impl( (void *)&_mh_execute_header,  v14,  v13,  "Failed to create VTPixelTransferSession with err %d",  v15,  8u);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    unint64_t v31 = 0LL;
    unint64_t v32 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(51LL);
    v16._countAndFlagsBits = 0xD000000000000031LL;
    v16._object = (void *)0x8000000100029210LL;
    String.append(_:)(v16);
    HIDWORD(v30) = v12;
    v17._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int32,  &protocol witness table for Int32);
    uint64_t v18 = v17._object;
    String.append(_:)(v17);
    swift_bridgeObjectRelease(v18, v19);
    unint64_t v20 = v31;
    unint64_t v21 = v32;
    LODWORD(v30) = 0;
    uint64_t v22 = 124LL;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v20,  v21,  "com_apple_dt_DTMLModelRunnerService/FeatureValueGeneration.swift",  64LL,  2LL,  v22,  v30);
  __break(1u);
  return result;
}

unint64_t sub_10000C3E4()
{
  unint64_t result = qword_100034BA0;
  if (!qword_100034BA0)
  {
    type metadata accessor for CFString(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10002593C, v1);
    atomic_store(result, (unint64_t *)&qword_100034BA0);
  }

  return result;
}

unint64_t sub_10000C42C()
{
  unint64_t result = qword_100034D70;
  if (!qword_100034D70)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100034D70);
  }

  return result;
}

uint64_t sub_10000C468(char a1)
{
  return qword_100026580[a1];
}

void sub_10000C488(void *a1, uint64_t a2)
{
  uint64_t v14 = a2;
  uint64_t v3 = sub_10000645C(&qword_100034DD0);
  v13[7] = *(void *)(v3 - 8);
  v13[8] = v3;
  __chkstk_darwin(v3);
  v13[6] = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_10000645C(&qword_100034DD8);
  v13[4] = *(void *)(v5 - 8);
  v13[5] = v5;
  __chkstk_darwin(v5);
  v13[3] = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000645C(&qword_100034DE0);
  v13[1] = *(void *)(v7 - 8);
  v13[2] = v7;
  __chkstk_darwin(v7);
  uint64_t v8 = sub_10000645C(&qword_100034DE8);
  __chkstk_darwin(v8);
  uint64_t v9 = sub_10000645C(&qword_100034DF0);
  v13[9] = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v11);
  unint64_t v12 = sub_10000DA14();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON,  &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON,  v12,  v11,  v10);
  __asm { BR              X10 }

uint64_t sub_10000C640()
{
  *(_BYTE *)(v5 - 68) = 0;
  unint64_t v6 = sub_10000DB24();
  ((void (*)(ValueMetadata *, uint64_t, uint64_t, ValueMetadata *, unint64_t))KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:))( &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON,  v5 - 68,  v0,  &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON,  v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 104) + 8LL))(v1, v0);
}

uint64_t sub_10000C774()
{
  return sub_10000C468(*v0);
}

uint64_t sub_10000C77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000D010(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000C7A0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000C7AC(uint64_t a1)
{
  unint64_t v2 = sub_10000DA14();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C7D4(uint64_t a1)
{
  unint64_t v2 = sub_10000DA14();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C7FC()
{
  return 0LL;
}

uint64_t sub_10000C808@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease(a1, a1);
  *a2 = 1;
  return result;
}

void sub_10000C834(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000C840(uint64_t a1)
{
  unint64_t v2 = sub_10000DB24();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C868(uint64_t a1)
{
  unint64_t v2 = sub_10000DB24();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C890(uint64_t a1)
{
  unint64_t v2 = sub_10000DAE0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C8B8(uint64_t a1)
{
  unint64_t v2 = sub_10000DAE0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C8E0(uint64_t a1)
{
  unint64_t v2 = sub_10000DA9C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C908(uint64_t a1)
{
  unint64_t v2 = sub_10000DA9C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C930(uint64_t a1)
{
  unint64_t v2 = sub_10000DA58();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C958(uint64_t a1)
{
  unint64_t v2 = sub_10000DA58();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C980@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_10000D19C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_10000C9A8(void *a1)
{
}

uint64_t sub_10000C9C0(void *a1, char a2)
{
  uint64_t v4 = sub_10000645C(&qword_100034D88);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000649C(a1, v8);
  unint64_t v10 = sub_10000CF88();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s13ComputeDeviceV10CodingKeysON,  &_s13ComputeDeviceV10CodingKeysON,  v10,  v8,  v9);
  char v15 = a2;
  unint64_t v11 = sub_10000CFCC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v15, v12, v4, &_s13ComputeDeviceV10DeviceTypeON, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000CAB8()
{
  return 1LL;
}

Swift::Int sub_10000CAC0()
{
  return Hasher._finalize()();
}

void sub_10000CB00()
{
}

Swift::Int sub_10000CB24(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10000CB64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000D5C0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000CB8C(uint64_t a1)
{
  unint64_t v2 = sub_10000CF88();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CBB4(uint64_t a1)
{
  unint64_t v2 = sub_10000CF88();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_10000CBDC@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10000D668(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000CC04(void *a1)
{
  return sub_10000C9C0(a1, *v1);
}

void *sub_10000CC1C()
{
  uint64_t v0 = type metadata accessor for MLComputeDevice(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (id *)((char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = __chkstk_darwin(v2);
  unint64_t v32 = (char *)&v25 - v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - v7;
  sub_10000CEEC();
  uint64_t v9 = static MLModel.availableComputeDevices.getter();
  uint64_t v11 = v9;
  int64_t v12 = *(void *)(v9 + 16);
  if (v12)
  {
    uint64_t v33 = _swiftEmptyArrayStorage;
    sub_1000134FC(0, v12, 0);
    unint64_t v13 = (*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    uint64_t v26 = v11;
    unint64_t v14 = v11 + v13;
    uint64_t v15 = *(void *)(v1 + 72);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v31 = v15;
    int v29 = enum case for MLComputeDevice.cpu(_:);
    int v28 = enum case for MLComputeDevice.gpu(_:);
    int v27 = enum case for MLComputeDevice.neuralEngine(_:);
    do
    {
      Swift::String v16 = v30;
      v30(v8, (char *)v14, v0);
      Swift::String v17 = v32;
      v16(v32, v8, v0);
      (*(void (**)(id *, char *, uint64_t))(v1 + 32))(v4, v17, v0);
      int v18 = (*(uint64_t (**)(id *, uint64_t))(v1 + 88))(v4, v0);
      if (v18 == v29)
      {
        (*(void (**)(id *, uint64_t))(v1 + 96))(v4, v0);

        char v19 = 0;
      }

      else if (v18 == v28)
      {
        (*(void (**)(id *, uint64_t))(v1 + 96))(v4, v0);

        char v19 = 1;
      }

      else if (v18 == v27)
      {
        (*(void (**)(id *, uint64_t))(v1 + 96))(v4, v0);

        char v19 = 2;
      }

      else
      {
        (*(void (**)(id *, uint64_t))(v1 + 8))(v4, v0);
        char v19 = 3;
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
      unint64_t v20 = v33;
      if ((swift_isUniquelyReferenced_nonNull_native(v33) & 1) == 0)
      {
        sub_1000134FC(0, v20[2] + 1LL, 1);
        unint64_t v20 = v33;
      }

      unint64_t v23 = v20[2];
      unint64_t v22 = v20[3];
      if (v23 >= v22 >> 1)
      {
        sub_1000134FC(v22 > 1, v23 + 1, 1);
        unint64_t v20 = v33;
      }

      v20[2] = v23 + 1;
      *((_BYTE *)v20 + v23 + 32) = v19;
      v14 += v31;
      --v12;
    }

    while (v12);
    swift_bridgeObjectRelease(v26, v21);
  }

  else
  {
    swift_bridgeObjectRelease(v9, v10);
    return _swiftEmptyArrayStorage;
  }

  return v20;
}

unint64_t sub_10000CEEC()
{
  unint64_t result = qword_100034D78;
  if (!qword_100034D78)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___MLModel);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100034D78);
  }

  return result;
}

ValueMetadata *_s13ComputeDeviceVMa()
{
  return &_s13ComputeDeviceVN;
}

unint64_t sub_10000CF44()
{
  unint64_t result = qword_100034D80;
  if (!qword_100034D80)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025F0C, &_s13ComputeDeviceVN);
    atomic_store(result, (unint64_t *)&qword_100034D80);
  }

  return result;
}

unint64_t sub_10000CF88()
{
  unint64_t result = qword_100034D90;
  if (!qword_100034D90)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002614C, &_s13ComputeDeviceV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034D90);
  }

  return result;
}

unint64_t sub_10000CFCC()
{
  unint64_t result = qword_100034D98;
  if (!qword_100034D98)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026124, &_s13ComputeDeviceV10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_100034D98);
  }

  return result;
}

uint64_t sub_10000D010(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7696483 && a2 == 0xE300000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(7696483LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 7696487 && a2 == 0xE300000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(7696487LL, 0xE300000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0x6E456C617275656ELL && a2 == 0xEC000000656E6967LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E456C617275656ELL, 0xEC000000656E6967LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2LL;
  }

  else if (a1 == 0x6E776F6E6B6E75LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL, a2);
    return 3LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E776F6E6B6E75LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_10000D19C(void *a1)
{
  uint64_t v2 = sub_10000645C(&qword_100034E20);
  v29[10] = *(void *)(v2 - 8);
  v29[11] = v2;
  __chkstk_darwin(v2);
  v29[9] = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_10000645C(&qword_100034E28);
  v29[5] = *(void *)(v4 - 8);
  v29[6] = v4;
  __chkstk_darwin(v4);
  v29[8] = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000645C(&qword_100034E30);
  v29[3] = *(void *)(v6 - 8);
  _OWORD v29[4] = v6;
  __chkstk_darwin(v6);
  v29[7] = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10000645C(&qword_100034E38);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000645C(&qword_100034E40);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  uint64_t v30 = a1;
  sub_10000649C(a1, v16);
  unint64_t v18 = sub_10000DA14();
  uint64_t v19 = v31;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON,  &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON,  v18,  v16,  v17);
  if (!v19)
  {
    v29[1] = v8;
    v29[2] = v11;
    v29[0] = v9;
    uint64_t v31 = v13;
    uint64_t v20 = KeyedDecodingContainer.allKeys.getter(v12);
    uint64_t v21 = v20;
    if (*(void *)(v20 + 16) == 1LL) {
      __asm { BR              X9 }
    }

    uint64_t v22 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v22, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v24 = v23;
    sub_10000645C(&qword_100034E48);
    void *v24 = &_s13ComputeDeviceV10DeviceTypeON;
    uint64_t v25 = KeyedDecodingContainer.codingPath.getter(v12);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v25,  0xD00000000000002BLL,  0x8000000100029360LL,  0LL);
    uint64_t v26 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104LL))( v24,  enum case for DecodingError.typeMismatch(_:),  v22);
    swift_willThrow(v26);
    swift_bridgeObjectRelease(v21, v27);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v12);
  }

  sub_10000D788(v30);
  return v12;
}

void sub_10000D4C0()
{
  *(_BYTE *)(v2 - 67) = 1;
  unint64_t v3 = sub_10000DAE0();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON,  v2 - 67,  v1,  &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON,  v3);
  if (!v0) {
    JUMPOUT(0x10000D594LL);
  }
  JUMPOUT(0x10000D474LL);
}

void sub_10000D504()
{
  *(_BYTE *)(v2 - 66) = 2;
  unint64_t v3 = sub_10000DA9C();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON,  v2 - 66,  v1,  &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON,  v3);
  if (!v0) {
    JUMPOUT(0x10000D544LL);
  }
  JUMPOUT(0x10000D474LL);
}

void sub_10000D550()
{
  *(_BYTE *)(v2 - 65) = 3;
  unint64_t v3 = sub_10000DA58();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON,  v2 - 65,  v1,  &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON,  v3);
  if (!v0) {
    JUMPOUT(0x10000D594LL);
  }
  JUMPOUT(0x10000D474LL);
}

uint64_t sub_10000D5C0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7954656369766564LL && a2 == 0xEA00000000006570LL)
  {
    swift_bridgeObjectRelease(a2, a2);
    char v6 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7954656369766564LL, 0xEA00000000006570LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v6 = v4 ^ 1;
  }

  return v6 & 1;
}

uint64_t sub_10000D64C()
{
  return 0x7954656369766564LL;
}

unint64_t sub_10000D668(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100034DA0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  unint64_t v9 = (unint64_t)sub_10000649C(a1, v7);
  unint64_t v10 = sub_10000CF88();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s13ComputeDeviceV10CodingKeysON,  &_s13ComputeDeviceV10CodingKeysON,  v10,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000D7A8();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    unint64_t v9 = v13;
    sub_10000D788(a1);
  }

  return v9;
}

uint64_t sub_10000D788(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000D7A8()
{
  unint64_t result = qword_100034DA8;
  if (!qword_100034DA8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000260FC, &_s13ComputeDeviceV10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_100034DA8);
  }

  return result;
}

uint64_t _s13ComputeDeviceV10CodingKeysOwet(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t _s13ComputeDeviceV10CodingKeysOwst(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10000D880 + 4 * byte_100025EE8[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10000D8A0 + 4 * byte_100025EED[v4]))();
  }
}

_BYTE *sub_10000D880(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10000D8A0(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000D8A8(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000D8B0(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000D8B8(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000D8C0(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_10000D8CC()
{
  return 0LL;
}

ValueMetadata *_s13ComputeDeviceV10CodingKeysOMa()
{
  return &_s13ComputeDeviceV10CodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeON;
}

unint64_t sub_10000D8F8()
{
  unint64_t result = qword_100034DB0;
  if (!qword_100034DB0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002601C, &_s13ComputeDeviceV10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_100034DB0);
  }

  return result;
}

unint64_t sub_10000D940()
{
  unint64_t result = qword_100034DB8;
  if (!qword_100034DB8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000260D4, &_s13ComputeDeviceV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034DB8);
  }

  return result;
}

unint64_t sub_10000D988()
{
  unint64_t result = qword_100034DC0;
  if (!qword_100034DC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026044, &_s13ComputeDeviceV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034DC0);
  }

  return result;
}

unint64_t sub_10000D9D0()
{
  unint64_t result = qword_100034DC8;
  if (!qword_100034DC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002606C, &_s13ComputeDeviceV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034DC8);
  }

  return result;
}

unint64_t sub_10000DA14()
{
  unint64_t result = qword_100034DF8;
  if (!qword_100034DF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002652C, &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034DF8);
  }

  return result;
}

unint64_t sub_10000DA58()
{
  unint64_t result = qword_100034E00;
  if (!qword_100034E00)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000264DC, &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E00);
  }

  return result;
}

unint64_t sub_10000DA9C()
{
  unint64_t result = qword_100034E08;
  if (!qword_100034E08)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002648C, &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E08);
  }

  return result;
}

unint64_t sub_10000DAE0()
{
  unint64_t result = qword_100034E10;
  if (!qword_100034E10)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002643C, &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E10);
  }

  return result;
}

unint64_t sub_10000DB24()
{
  unint64_t result = qword_100034E18;
  if (!qword_100034E18)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000263EC, &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E18);
  }

  return result;
}

uint64_t _s13ComputeDeviceV10DeviceTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

uint64_t _s13ComputeDeviceV10DeviceTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_10000DC44 + 4 * byte_100025EF7[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000DC78 + 4 * byte_100025EF2[v4]))();
}

uint64_t sub_10000DC78(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DC80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000DC88LL);
  }
  return result;
}

uint64_t sub_10000DC94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000DC9CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10000DCA0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DCA8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO10CodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON;
}

ValueMetadata *_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysOMa()
{
  return &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON;
}

unint64_t sub_10000DD08()
{
  unint64_t result = qword_100034E50;
  if (!qword_100034E50)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000263C4, &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E50);
  }

  return result;
}

unint64_t sub_10000DD50()
{
  unint64_t result = qword_100034E58;
  if (!qword_100034E58)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000262E4, &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E58);
  }

  return result;
}

unint64_t sub_10000DD98()
{
  unint64_t result = qword_100034E60;
  if (!qword_100034E60)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002630C, &_s13ComputeDeviceV10DeviceTypeO13CpuCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E60);
  }

  return result;
}

unint64_t sub_10000DDE0()
{
  unint64_t result = qword_100034E68;
  if (!qword_100034E68)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026294, &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E68);
  }

  return result;
}

unint64_t sub_10000DE28()
{
  unint64_t result = qword_100034E70;
  if (!qword_100034E70)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000262BC, &_s13ComputeDeviceV10DeviceTypeO13GpuCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E70);
  }

  return result;
}

unint64_t sub_10000DE70()
{
  unint64_t result = qword_100034E78;
  if (!qword_100034E78)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026244, &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E78);
  }

  return result;
}

unint64_t sub_10000DEB8()
{
  unint64_t result = qword_100034E80;
  if (!qword_100034E80)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002626C, &_s13ComputeDeviceV10DeviceTypeO22NeuralEngineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E80);
  }

  return result;
}

unint64_t sub_10000DF00()
{
  unint64_t result = qword_100034E88;
  if (!qword_100034E88)
  {
    unint64_t result = swift_getWitnessTable("Ͷ", &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E88);
  }

  return result;
}

unint64_t sub_10000DF48()
{
  unint64_t result = qword_100034E90;
  if (!qword_100034E90)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002621C, &_s13ComputeDeviceV10DeviceTypeO17UnknownCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E90);
  }

  return result;
}

unint64_t sub_10000DF90()
{
  unint64_t result = qword_100034E98;
  if (!qword_100034E98)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026334, &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034E98);
  }

  return result;
}

unint64_t sub_10000DFD8()
{
  unint64_t result = qword_100034EA0;
  if (!qword_100034EA0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002635C, &_s13ComputeDeviceV10DeviceTypeO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100034EA0);
  }

  return result;
}

void sub_10000E020(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }

unint64_t sub_10000E058()
{
  v3._countAndFlagsBits = v1;
  v3._object = v0;
  String.append(_:)(v3);
  return 0xD000000000000016LL;
}

void *sub_10000E154(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100006F34(0LL, a1 & ~(a1 >> 63), 0, (uint64_t)_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }

  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      int v8 = v11;
      unint64_t v10 = i[2];
      unint64_t v9 = i[3];
      if (v10 >= v9 >> 1) {
        i = sub_100006F34((void *)(v9 > 1), v10 + 1, 1, (uint64_t)i);
      }
      i[2] = v10 + 1;
      *((_DWORD *)i + v10 + 8) = v8;
    }

    return i;
  }

  return result;
}

void *sub_10000E228(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100007040(0LL, a1 & ~(a1 >> 63), 0, (uint64_t)_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }

  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      int v8 = v11;
      unint64_t v10 = i[2];
      unint64_t v9 = i[3];
      if (v10 >= v9 >> 1) {
        i = sub_100007040((void *)(v9 > 1), v10 + 1, 1, (uint64_t)i);
      }
      i[2] = v10 + 1;
      *((_DWORD *)i + v10 + 8) = v8;
    }

    return i;
  }

  return result;
}

void *sub_10000E2F4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100006E28(0LL, a1 & ~(a1 >> 63), 0, (uint64_t)_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }

  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      uint64_t v8 = v11;
      unint64_t v10 = i[2];
      unint64_t v9 = i[3];
      if (v10 >= v9 >> 1) {
        i = sub_100006E28((void *)(v9 > 1), v10 + 1, 1, (uint64_t)i);
      }
      i[2] = v10 + 1;
      i[v10 + 4] = v8;
    }

    return i;
  }

  return result;
}

void *sub_10000E3C8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_10000714C(0LL, a1 & ~(a1 >> 63), 0, (uint64_t)_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }

  else
  {
    for (i = result; v5; --v5)
    {
      a3(&v11, a2);
      uint64_t v8 = v11;
      unint64_t v10 = i[2];
      unint64_t v9 = i[3];
      if (v10 >= v9 >> 1) {
        i = sub_10000714C((void *)(v9 > 1), v10 + 1, 1, (uint64_t)i);
      }
      i[2] = v10 + 1;
      i[v10 + 4] = v8;
    }

    return i;
  }

  return result;
}

void *sub_10000E494(uint64_t a1, uint64_t a2, void (*a3)(void *__return_ptr, uint64_t))
{
  uint64_t v5 = a1;
  unint64_t result = sub_100007258(0LL, a1 & ~(a1 >> 63), 0, (uint64_t)_swiftEmptyArrayStorage);
  if (v5 < 0)
  {
    __break(1u);
  }

  else
  {
    for (i = result; v5; --v5)
    {
      a3(v13, a2);
      uint64_t v8 = v13[0];
      uint64_t v9 = v13[1];
      unint64_t v11 = i[2];
      unint64_t v10 = i[3];
      if (v11 >= v10 >> 1) {
        i = sub_100007258((void *)(v10 > 1), v11 + 1, 1, (uint64_t)i);
      }
      i[2] = v11 + 1;
      uint64_t v12 = &i[2 * v11];
      v12[4] = v8;
      v12[5] = v9;
    }

    return i;
  }

  return result;
}

void *sub_10000E568(uint64_t a1, uint64_t *a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  unint64_t result = _swiftEmptyArrayStorage;
  if (v3)
  {
    int64_t v28 = v3;
    sub_100013544(0, v3, 0);
    int64_t v6 = v28;
    uint64_t v5 = a2;
    uint64_t v7 = 0LL;
    unint64_t result = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v8 = (char *)(a1 + 32 + 2 * v7);
      char v9 = *v8;
      unsigned __int8 v10 = v8[1] - *v8;
      if (v10 == 0xFF)
      {
        unint64_t v23 = *(void *)(*v5 + 16) - 0x61C8864680B583EBLL;
        *(void *)(*v5 + 16) = v23;
        unint64_t v24 = 0x94D049BB133111EBLL
            * ((0xBF58476D1CE4E5B9LL * (v23 ^ (v23 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v23 ^ (v23 >> 30))) >> 27));
        char v22 = (v24 >> 31) ^ v24;
      }

      else
      {
        uint64_t v11 = *v5;
        uint64_t v12 = *(void *)(*v5 + 16);
        uint64_t v13 = v12 - 0x61C8864680B583EBLL;
        *(void *)(*v5 + 16) = v12 - 0x61C8864680B583EBLL;
        unint64_t v14 = 0xBF58476D1CE4E5B9LL
            * ((v12 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v12 - 0x61C8864680B583EBLL) >> 30));
        unsigned int v15 = (v10 + 1);
        unsigned int v17 = v16 >> 8;
        if (v10 >= v16)
        {
          unsigned int v18 = ~v10 % v15;
          if (v18 > v16)
          {
            unint64_t v19 = v12 + 0x3C6EF372FE94F82ALL;
            do
            {
              v13 -= 0x61C8864680B583EBLL;
              unint64_t v20 = 0x94D049BB133111EBLL
                  * ((0xBF58476D1CE4E5B9LL * (v19 ^ (v19 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v19 ^ (v19 >> 30))) >> 27));
              unsigned int v21 = ((v20 >> 31) ^ v20) * v15;
              v19 -= 0x61C8864680B583EBLL;
            }

            while (v18 > v21);
            unsigned int v17 = v21 >> 8;
            *(void *)(v11 + 16) = v13;
          }
        }

        char v22 = v17 + v9;
      }

      if ((v22 & 0xFE) != 0) {
        char v25 = v22;
      }
      else {
        char v25 = 1;
      }
      uint64_t v30 = result;
      unint64_t v27 = result[2];
      unint64_t v26 = result[3];
      if (v27 >= v26 >> 1)
      {
        sub_100013544(v26 > 1, v27 + 1, 1);
        int64_t v6 = v28;
        uint64_t v5 = a2;
        unint64_t result = v30;
      }

      ++v7;
      result[2] = v27 + 1;
      *((_BYTE *)result + v27 + 32) = v25;
    }

    while (v7 != v6);
  }

  return result;
}

unint64_t sub_10000E78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 - a2 != -1) {
    return sub_10000FA20(a3 - a2 + 1) + a2;
  }
  unint64_t v4 = *(void *)(*(void *)a1 + 16LL) - 0x61C8864680B583EBLL;
  *(void *)(*(void *)a1 + 16LL) = v4;
  unint64_t v5 = (0xBF58476D1CE4E5B9LL * (v4 ^ (v4 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v4 ^ (v4 >> 30))) >> 27);
  return (0x94D049BB133111EBLL * v5) ^ ((0x94D049BB133111EBLL * v5) >> 31);
}

__CVBuffer *sub_10000E81C(uint64_t a1, uint64_t a2)
{
  __int128 v12 = *(_OWORD *)(a2 + 8);
  ((void (*)(__int128 *__return_ptr))v12)(&v11);
  __int128 v4 = v11;
  unint64_t v5 = (__int128 *)(a2 + 24);
  if (*(_DWORD *)a2 == 1278226536)
  {
    int64_t v6 = sub_10000BDB8(v11, *((size_t *)&v11 + 1), 0x4C303038u);
    __int128 v11 = *v5;
    __int128 v7 = v11;
    sub_100012598((uint64_t)&v12);
    sub_100012598((uint64_t)&v11);
    sub_10000BEFC(v6, (void (*)(void **__return_ptr, uint64_t))v7, *((uint64_t *)&v7 + 1), a1);
    sub_1000125C0((uint64_t)&v12);
    sub_1000125C0((uint64_t)&v11);
    uint64_t v8 = (__CVBuffer *)sub_10000C074(v6, v4, *((size_t *)&v4 + 1));
  }

  else
  {
    uint64_t v8 = sub_10000BDB8(v11, *((size_t *)&v11 + 1), *(_DWORD *)a2);
    __int128 v11 = *v5;
    __int128 v9 = v11;
    sub_100012598((uint64_t)&v12);
    sub_100012598((uint64_t)&v11);
    sub_10000BEFC(v8, (void (*)(void **__return_ptr, uint64_t))v9, *((uint64_t *)&v9 + 1), a1);
    sub_1000125C0((uint64_t)&v12);
    sub_1000125C0((uint64_t)&v11);
  }

  return v8;
}

uint64_t sub_10000E950(uint64_t a1, uint64_t a2)
{
  if (HIDWORD(a2) - (_DWORD)a2 != -1) {
    return sub_10000FAEC((HIDWORD(a2) - a2 + 1)) + a2;
  }
  unint64_t v3 = *(void *)(*(void *)a1 + 16LL) - 0x61C8864680B583EBLL;
  *(void *)(*(void *)a1 + 16LL) = v3;
  unint64_t v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9LL * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v3 ^ (v3 >> 30))) >> 27));
  return (v4 >> 31) ^ v4;
}

void sub_10000E9E8(float a1, float a2)
{
  if ((~COERCE_INT(a2 - a1) & 0x7F800000) != 0) {
    sub_10000FAEC(0x1000001uLL);
  }
  else {
    __break(1u);
  }
}

uint64_t sub_10000EA64( uint64_t a1, void (*a2)(void **__return_ptr, uint64_t), uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v7 = sub_10000645C(&qword_100034F20);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  __int128 v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - v12;
  a2(&v25, a1);
  unint64_t v14 = v25;
  uint64_t v15 = v25[2];
  if (v15)
  {
    unsigned int v16 = v25 + 4;
    uint64_t v17 = 1LL;
    while (1)
    {
      uint64_t v18 = *v16++;
      uint64_t result = v17 * v18;
      uint64_t v17 = result;
      if (!--v15) {
        goto LABEL_7;
      }
    }

    __break(1u);
  }

  else
  {
    uint64_t result = 1LL;
LABEL_7:
    char v25 = sub_10000E228(result, a1, a4);
    uint64_t v20 = sub_10000645C(&qword_100034F28);
    uint64_t v21 = sub_100012714(&qword_100034F30, &qword_100034F28, (uint64_t)&protocol conformance descriptor for [A]);
    MLShapedArray.init<A>(scalars:shape:)( &v25,  v14,  &type metadata for Int32,  v20,  &protocol witness table for Int32,  v21);
    sub_10000A028(0LL, &qword_100034EF0, &OBJC_CLASS___MLMultiArray_ptr);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v22 = sub_100012714( &qword_100034F38,  &qword_100034F20,  (uint64_t)&protocol conformance descriptor for MLShapedArray<A>);
    uint64_t v23 = MLMultiArray.init<A>(_:)(v11, v7, v22);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v23;
  }

  return result;
}

uint64_t sub_10000EC38( uint64_t a1, void (*a2)(void **__return_ptr, uint64_t), uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v7 = sub_10000645C(&qword_100034F00);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  __int128 v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - v12;
  a2(&v25, a1);
  unint64_t v14 = v25;
  uint64_t v15 = v25[2];
  if (v15)
  {
    unsigned int v16 = v25 + 4;
    uint64_t v17 = 1LL;
    while (1)
    {
      uint64_t v18 = *v16++;
      uint64_t result = v17 * v18;
      uint64_t v17 = result;
      if (!--v15) {
        goto LABEL_7;
      }
    }

    __break(1u);
  }

  else
  {
    uint64_t result = 1LL;
LABEL_7:
    char v25 = sub_10000E154(result, a1, a4);
    uint64_t v20 = sub_10000645C(&qword_100034F08);
    uint64_t v21 = sub_100012714(&qword_100034F10, &qword_100034F08, (uint64_t)&protocol conformance descriptor for [A]);
    MLShapedArray.init<A>(scalars:shape:)( &v25,  v14,  &type metadata for Float,  v20,  &protocol witness table for Float,  v21);
    sub_10000A028(0LL, &qword_100034EF0, &OBJC_CLASS___MLMultiArray_ptr);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v22 = sub_100012714( &qword_100034F18,  &qword_100034F00,  (uint64_t)&protocol conformance descriptor for MLShapedArray<A>);
    uint64_t v23 = MLMultiArray.init<A>(_:)(v11, v7, v22);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v23;
  }

  return result;
}

uint64_t sub_10000EE0C( uint64_t a1, void (*a2)(void **__return_ptr, uint64_t), uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v7 = sub_10000645C(&qword_100034ED8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  __int128 v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - v12;
  a2(&v25, a1);
  unint64_t v14 = v25;
  uint64_t v15 = v25[2];
  if (v15)
  {
    unsigned int v16 = v25 + 4;
    uint64_t v17 = 1LL;
    while (1)
    {
      uint64_t v18 = *v16++;
      uint64_t result = v17 * v18;
      uint64_t v17 = result;
      if (!--v15) {
        goto LABEL_7;
      }
    }

    __break(1u);
  }

  else
  {
    uint64_t result = 1LL;
LABEL_7:
    char v25 = sub_10000E2F4(result, a1, a4);
    uint64_t v20 = sub_10000645C(&qword_100034EE0);
    uint64_t v21 = sub_100012714(&qword_100034EE8, &qword_100034EE0, (uint64_t)&protocol conformance descriptor for [A]);
    MLShapedArray.init<A>(scalars:shape:)( &v25,  v14,  &type metadata for Double,  v20,  &protocol witness table for Double,  v21);
    sub_10000A028(0LL, &qword_100034EF0, &OBJC_CLASS___MLMultiArray_ptr);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v22 = sub_100012714( &qword_100034EF8,  &qword_100034ED8,  (uint64_t)&protocol conformance descriptor for MLShapedArray<A>);
    uint64_t v23 = MLMultiArray.init<A>(_:)(v11, v7, v22);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v23;
  }

  return result;
}

id sub_10000EFE0(uint64_t a1)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1, v4);
  id v10 = 0LL;
  id v5 = [(id)swift_getObjCClassFromMetadata(v1) featureValueWithDictionary:isa error:&v10];

  id v6 = v10;
  if (v5)
  {
    id v7 = v10;
  }

  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)(v6);

    swift_willThrow();
  }

  return v5;
}

id sub_10000F0E4(uint64_t a1, uint64_t a2)
{
  void (*v16)(void **__return_ptr, uint64_t);
  uint64_t v17;
  void *v18;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  id result;
  void *v36;
  uint64_t v37;
  void *v39;
  uint64_t v2 = a2;
  swift_bridgeObjectRetain(a2);
  Swift::String v39 = sub_10000FBC4(v2);
  uint64_t v3 = 0LL;
  sub_10000FCA8((uint64_t *)&v39);
  swift_bridgeObjectRelease(v2, v4);
  id v5 = v39;
  uint64_t v6 = v39[2];
  if (!v6)
  {
    id v8 = _swiftEmptyDictionarySingleton;
LABEL_20:
    swift_release(v5);
    unint64_t v32 = sub_10000F3AC((uint64_t)v8);
    swift_bridgeObjectRelease(v8, v33);
    id v34 = objc_allocWithZone(&OBJC_CLASS___MLDictionaryFeatureProvider);
    return sub_10000F830(v32);
  }

  swift_retain(v39);
  os_log_type_t v36 = v5;
  id v7 = v5 + 5;
  id v8 = _swiftEmptyDictionarySingleton;
  os_log_type_t v37 = v2;
  while (*(void *)(v2 + 16))
  {
    uint64_t v12 = *(v7 - 1);
    uint64_t v11 = *v7;
    swift_bridgeObjectRetain_n(*v7, 2LL);
    unint64_t v13 = sub_100012FFC(v12, v11);
    if ((v14 & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v3 = v6;
    uint64_t v15 = *(void *)(v2 + 56) + 16 * v13;
    unsigned int v16 = *(void (**)(void **__return_ptr, uint64_t))v15;
    uint64_t v17 = *(void *)(v15 + 8);
    swift_retain(v17);
    v16(&v39, a1);
    swift_release(v17);
    uint64_t v18 = v39;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
    Swift::String v39 = v8;
    uint64_t v21 = sub_100012FFC(v12, v11);
    uint64_t v22 = v8[2];
    uint64_t v23 = (v20 & 1) == 0;
    uint64_t v24 = v22 + v23;
    if (__OFADD__(v22, v23)) {
      goto LABEL_24;
    }
    char v25 = v20;
    if (v8[3] >= v24)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        id v8 = v39;
        if ((v20 & 1) != 0) {
          goto LABEL_3;
        }
      }

      else
      {
        sub_100014E98();
        id v8 = v39;
        if ((v25 & 1) != 0) {
          goto LABEL_3;
        }
      }
    }

    else
    {
      sub_10001470C(v24, isUniquelyReferenced_nonNull_native);
      unint64_t v26 = sub_100012FFC(v12, v11);
      if ((v25 & 1) != (v27 & 1)) {
        goto LABEL_26;
      }
      uint64_t v21 = v26;
      id v8 = v39;
      if ((v25 & 1) != 0)
      {
LABEL_3:
        uint64_t v9 = v8[7];

        *(void *)(v9 + 8 * v21) = v18;
        goto LABEL_4;
      }
    }

    v8[(v21 >> 6) + 8] |= 1LL << v21;
    int64_t v28 = (uint64_t *)(v8[6] + 16 * v21);
    os_log_s *v28 = v12;
    v28[1] = v11;
    *(void *)(v8[7] + 8 * v21) = v18;
    int v29 = v8[2];
    uint64_t v30 = __OFADD__(v29, 1LL);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_25;
    }
    v8[2] = v31;
    swift_bridgeObjectRetain(v11);
LABEL_4:
    v7 += 2;
    swift_bridgeObjectRelease_n(v11, 2LL);
    swift_bridgeObjectRelease(0x8000000000000000LL, v10);
    uint64_t v6 = v3 - 1;
    uint64_t v2 = v37;
    if (v3 == 1)
    {
      id v5 = v36;
      swift_release(v36);
      goto LABEL_20;
    }
  }

  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  swift_release(v39);
  __break(1u);
  uint64_t result = (id)swift_unexpectedError( v3,  "com_apple_dt_DTMLModelRunnerService/FeatureProviderGeneration.swift",  67LL,  1LL,  28LL);
  __break(1u);
  return result;
}

unint64_t sub_10000F3AC(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10000645C(&qword_100034EB0);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
  }

  uint64_t v39 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v38 = (unint64_t)(63 - v4) >> 6;
  id v7 = &v45;
  id v8 = &v47;
  unint64_t result = swift_bridgeObjectRetain(v1);
  int64_t v40 = 0LL;
  uint64_t v10 = &qword_100034EB8;
  uint64_t v11 = &OBJC_CLASS___MLFeatureValue_ptr;
  uint64_t v12 = (char *)&type metadata for Any + 8;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v21 = v40 + 1;
  if (__OFADD__(v40, 1LL)) {
    goto LABEL_35;
  }
  if (v21 >= v38) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v39 + 8 * v21);
  int64_t v23 = v40 + 1;
  if (!v22)
  {
    int64_t v23 = v40 + 2;
    if (v40 + 2 >= v38) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v39 + 8 * v23);
    if (!v22)
    {
      int64_t v23 = v40 + 3;
      if (v40 + 3 >= v38) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v39 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v40 + 4;
        if (v40 + 4 >= v38) {
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(v39 + 8 * v23);
        if (!v22)
        {
          int64_t v24 = v40 + 5;
          if (v40 + 5 < v38)
          {
            unint64_t v22 = *(void *)(v39 + 8 * v24);
            if (v22)
            {
              int64_t v23 = v40 + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v23 = v24 + 1;
              if (__OFADD__(v24, 1LL)) {
                goto LABEL_36;
              }
              if (v23 >= v38) {
                break;
              }
              unint64_t v22 = *(void *)(v39 + 8 * v23);
              ++v24;
              if (v22) {
                goto LABEL_26;
              }
            }
          }

LABEL_32:
          sub_10001234C(v1);
          return (unint64_t)v3;
        }
      }
    }
  }

  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

void sub_10000F728(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_bridgeObjectRetain(*a1);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5);
  id v6 = [(id)objc_opt_self(MLSequence) sequenceWithStringArray:isa];

  *a2 = v6;
}

void sub_10000F7A0(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = sub_10000BCF0(*a1);
  sub_10000A028(0LL, (unint64_t *)&qword_100034D70, &OBJC_CLASS___NSNumber_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3, v5);
  id v6 = [(id)objc_opt_self(MLSequence) sequenceWithInt64Array:isa];

  *a2 = v6;
}

id sub_10000F830(uint64_t a1)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1, v4);
  id v10 = 0LL;
  id v5 = [v1 initWithDictionary:isa error:&v10];

  id v6 = v10;
  if (v5)
  {
    id v7 = v10;
  }

  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)(v6);

    swift_willThrow();
  }

  return v5;
}

id sub_10000F914(uint64_t a1)
{
  uint64_t v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  id v5 = v4;
  id v14 = 0LL;
  id v6 = [v2 initWithContentsOfURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL);
    id v10 = v7;
    v9(a1, v8);
  }

  else
  {
    id v11 = v14;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    uint64_t v12 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8LL))(a1, v12);
  }

  return v6;
}

unint64_t sub_10000FA20(unint64_t result)
{
  if (result)
  {
    uint64_t v2 = *v1;
    uint64_t v3 = *(void *)(*v1 + 16);
    uint64_t v4 = v3 - 0x61C8864680B583EBLL;
    *(void *)(*v1 + 16) = v3 - 0x61C8864680B583EBLL;
    unint64_t v5 = 0xBF58476D1CE4E5B9LL * ((v3 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v3 - 0x61C8864680B583EBLL) >> 30));
    unint64_t v6 = (0x94D049BB133111EBLL * (v5 ^ (v5 >> 27))) ^ ((0x94D049BB133111EBLL * (v5 ^ (v5 >> 27))) >> 31);
    unint64_t v7 = v6 * result;
    uint64_t v8 = (v6 * (unsigned __int128)result) >> 64;
    if (v7 < result)
    {
      unint64_t v9 = -(uint64_t)result % result;
      if (v9 > v7)
      {
        unint64_t v10 = v3 + 0x3C6EF372FE94F82ALL;
        do
        {
          v4 -= 0x61C8864680B583EBLL;
          unint64_t v11 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9LL * (v10 ^ (v10 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v10 ^ (v10 >> 30))) >> 27));
          unint64_t v12 = v11 ^ (v11 >> 31);
          v10 -= 0x61C8864680B583EBLL;
        }

        while (v9 > v12 * result);
        uint64_t v8 = (v12 * (unsigned __int128)result) >> 64;
        *(void *)(v2 + 16) = v4;
      }
    }

    return v8;
  }

  else
  {
    __break(1u);
  }

  return result;
}

unint64_t sub_10000FAEC(unint64_t result)
{
  if ((_DWORD)result)
  {
    uint64_t v2 = *v1;
    uint64_t v3 = *(void *)(*v1 + 16);
    uint64_t v4 = v3 - 0x61C8864680B583EBLL;
    *(void *)(*v1 + 16) = v3 - 0x61C8864680B583EBLL;
    unint64_t v5 = 0xBF58476D1CE4E5B9LL * ((v3 - 0x61C8864680B583EBLL) ^ ((unint64_t)(v3 - 0x61C8864680B583EBLL) >> 30));
    unint64_t v6 = result
       * (unint64_t)(((0x94D049BB133111EBLL * (v5 ^ (v5 >> 27))) >> 31) ^ (321982955
                                                                                              * (v5 ^ (v5 >> 27))));
    unint64_t v7 = HIDWORD(v6);
    if (v6 < result)
    {
      unsigned int v8 = -(int)result % result;
      if (v8 > v6)
      {
        unint64_t v9 = v3 + 0x3C6EF372FE94F82ALL;
        do
        {
          v4 -= 0x61C8864680B583EBLL;
          unint64_t v10 = 0x94D049BB133111EBLL
              * ((0xBF58476D1CE4E5B9LL * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9LL * (v9 ^ (v9 >> 30))) >> 27));
          int64_t v11 = result * (unint64_t)((v10 >> 31) ^ v10);
          v9 -= 0x61C8864680B583EBLL;
        }

        while (v8 > v11);
        unint64_t v7 = v11 >> 32;
        *(void *)(v2 + 16) = v4;
      }
    }

    return v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void *sub_10000FBC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_10000645C(&qword_100034AE8);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_100010910((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10001234C(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

Swift::Int sub_10000FCA8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_100010B0C(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_10000FD10(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_10000FD10(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_1000103F8(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_154;
  }

  if (v3 >= 0) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_162:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v113 = result;
  v110 = a1;
  if (v3 < 2)
  {
    unint64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_120:
      v102 = v12;
      v112 = v9;
      if (v13 < 2) {
        goto LABEL_117;
      }
      uint64_t v104 = *v110;
      while (1)
      {
        unint64_t v105 = v13 - 2;
        if (v13 < 2) {
          goto LABEL_149;
        }
        if (!v104) {
          goto LABEL_161;
        }
        v101 = v102;
        uint64_t v106 = *(void *)&v102[16 * v105 + 32];
        uint64_t v107 = *(void *)&v102[16 * v13 + 24];
        sub_1000104C4( (char *)(v104 + 16 * v106),  (char *)(v104 + 16LL * *(void *)&v102[16 * v13 + 16]),  v104 + 16 * v107,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v107 < v106) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v101) & 1) == 0) {
          v101 = sub_1000108FC((uint64_t)v101);
        }
        if (v105 >= *((void *)v101 + 2)) {
          goto LABEL_151;
        }
        v108 = &v101[16 * v105 + 32];
        *(void *)v108 = v106;
        *((void *)v108 + 1) = v107;
        unint64_t v109 = *((void *)v101 + 2);
        if (v13 > v109) {
          goto LABEL_152;
        }
        memmove(&v101[16 * v13 + 16], &v101[16 * v13 + 32], 16 * (v109 - v13));
        v102 = v101;
        *((void *)v101 + 2) = v109 - 1;
        unint64_t v13 = v109 - 1;
        if (v109 <= 2) {
          goto LABEL_117;
        }
      }
    }

    v112 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v7 = v6 >> 1;
    uint64_t v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v6 >> 1, &type metadata for String);
    *(void *)(v8 + 16) = v7;
    v112 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }

  Swift::Int v10 = 0LL;
  uint64_t v11 = *a1;
  uint64_t v111 = v11 + 8;
  unint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v114 = v3;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 >= v3) {
      goto LABEL_46;
    }
    uint64_t v15 = (uint64_t *)(v11 + 16 * v10);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (void *)(v11 + 16 * v14);
    uint64_t v19 = v18[1];
    if (v16 == *v18 && v17 == v19)
    {
      Swift::Int v22 = v14 + 2;
      if (v14 + 2 >= v3) {
        goto LABEL_45;
      }
      int v21 = 0;
    }

    else
    {
      int v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, *v18, v19, 1LL);
      Swift::Int v22 = v14 + 2;
      if (v14 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    int64_t v23 = (uint64_t *)(v111 + 16 * v22);
    do
    {
      uint64_t v25 = *(v23 - 1);
      uint64_t v26 = *v23;
      unint64_t v27 = (void *)(v11 + 16 * v10);
      uint64_t v28 = v27[1];
      if (v25 == *v27 && v26 == v28)
      {
        if ((v21 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v21 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, *v27, v28, 1LL)) & 1) != 0)
      {
        goto LABEL_36;
      }

      v23 += 2;
      Swift::Int v24 = v22 + 1;
      Swift::Int v10 = v22;
      Swift::Int v22 = v24;
    }

    while (v24 < v3);
    Swift::Int v22 = v24;
LABEL_36:
    Swift::Int v10 = v22;
    if ((v21 & 1) != 0)
    {
LABEL_37:
      if (v22 < v14) {
        goto LABEL_157;
      }
      if (v14 < v22)
      {
        uint64_t v30 = 16 * v22;
        uint64_t v31 = 16 * v14;
        Swift::Int v32 = v22;
        Swift::Int v33 = v14;
        do
        {
          if (v33 != --v32)
          {
            if (!v11) {
              goto LABEL_160;
            }
            uint64_t v34 = v11 + v30;
            uint64_t v35 = *(void *)(v11 + v31);
            uint64_t v36 = *(void *)(v11 + v31 + 8);
            *(_OWORD *)(v11 + v31) = *(_OWORD *)(v11 + v30 - 16);
            *(void *)(v34 - 16) = v35;
            *(void *)(v34 - 8) = v36;
          }

          ++v33;
          v30 -= 16LL;
          v31 += 16LL;
        }

        while (v33 < v32);
      }

LABEL_45:
      Swift::Int v10 = v22;
    }

LABEL_46:
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v14)) {
        goto LABEL_153;
      }
      if (v10 - v14 < v113)
      {
        if (__OFADD__(v14, v113)) {
          goto LABEL_155;
        }
        if (v14 + v113 >= v3) {
          Swift::Int v37 = v3;
        }
        else {
          Swift::Int v37 = v14 + v113;
        }
        if (v37 < v14) {
          goto LABEL_156;
        }
        if (v10 != v37)
        {
          int64_t v38 = (void *)(v11 + 16 * v10);
          do
          {
            uint64_t v39 = (uint64_t *)(v11 + 16 * v10);
            uint64_t v40 = *v39;
            uint64_t v41 = v39[1];
            Swift::Int v42 = v14;
            uint64_t v43 = v38;
            do
            {
              uint64_t v44 = *(v43 - 2);
              uint64_t v45 = *(v43 - 1);
              BOOL v46 = v40 == v44 && v41 == v45;
              if (v46 || (_stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, v44, v45, 1LL) & 1) == 0) {
                break;
              }
              if (!v11) {
                goto LABEL_158;
              }
              uint64_t v40 = *v43;
              uint64_t v41 = v43[1];
              *(_OWORD *)uint64_t v43 = *((_OWORD *)v43 - 1);
              *(v43 - 1) = v41;
              *(v43 - 2) = v40;
              v43 -= 2;
              ++v42;
            }

            while (v10 != v42);
            ++v10;
            v38 += 2;
          }

          while (v10 != v37);
          Swift::Int v10 = v37;
        }
      }
    }

    if (v10 < v14)
    {
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
      goto LABEL_162;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0) {
      unint64_t v12 = sub_10001075C(0LL, *((void *)v12 + 2) + 1LL, 1, v12);
    }
    unint64_t v48 = *((void *)v12 + 2);
    unint64_t v47 = *((void *)v12 + 3);
    unint64_t v13 = v48 + 1;
    if (v48 >= v47 >> 1) {
      unint64_t v12 = sub_10001075C((char *)(v47 > 1), v48 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v13;
    uint64_t v49 = v12 + 32;
    uint64_t v50 = &v12[16 * v48 + 32];
    *(void *)uint64_t v50 = v14;
    *((void *)v50 + 1) = v10;
    if (v48) {
      break;
    }
    unint64_t v13 = 1LL;
LABEL_15:
    Swift::Int v3 = v114;
    if (v10 >= v114)
    {
      unint64_t v9 = v112;
      goto LABEL_120;
    }
  }

  Swift::Int v115 = v10;
  while (1)
  {
    unint64_t v51 = v13 - 1;
    if (v13 >= 4)
    {
      uint64_t v56 = &v49[16 * v13];
      uint64_t v57 = *((void *)v56 - 8);
      uint64_t v58 = *((void *)v56 - 7);
      BOOL v62 = __OFSUB__(v58, v57);
      uint64_t v59 = v58 - v57;
      if (v62) {
        goto LABEL_137;
      }
      uint64_t v61 = *((void *)v56 - 6);
      uint64_t v60 = *((void *)v56 - 5);
      BOOL v62 = __OFSUB__(v60, v61);
      uint64_t v54 = v60 - v61;
      char v55 = v62;
      if (v62) {
        goto LABEL_138;
      }
      unint64_t v63 = v13 - 2;
      v64 = &v49[16 * v13 - 32];
      uint64_t v66 = *(void *)v64;
      uint64_t v65 = *((void *)v64 + 1);
      BOOL v62 = __OFSUB__(v65, v66);
      uint64_t v67 = v65 - v66;
      if (v62) {
        goto LABEL_140;
      }
      BOOL v62 = __OFADD__(v54, v67);
      uint64_t v68 = v54 + v67;
      if (v62) {
        goto LABEL_143;
      }
      if (v68 >= v59)
      {
        pid_t v86 = &v49[16 * v51];
        uint64_t v88 = *(void *)v86;
        uint64_t v87 = *((void *)v86 + 1);
        BOOL v62 = __OFSUB__(v87, v88);
        uint64_t v89 = v87 - v88;
        if (v62) {
          goto LABEL_147;
        }
        BOOL v79 = v54 < v89;
        goto LABEL_105;
      }
    }

    else
    {
      if (v13 != 3)
      {
        uint64_t v80 = *((void *)v12 + 4);
        uint64_t v81 = *((void *)v12 + 5);
        BOOL v62 = __OFSUB__(v81, v80);
        uint64_t v73 = v81 - v80;
        char v74 = v62;
        goto LABEL_99;
      }

      uint64_t v53 = *((void *)v12 + 4);
      uint64_t v52 = *((void *)v12 + 5);
      BOOL v62 = __OFSUB__(v52, v53);
      uint64_t v54 = v52 - v53;
      char v55 = v62;
    }

    if ((v55 & 1) != 0) {
      goto LABEL_139;
    }
    unint64_t v63 = v13 - 2;
    uint64_t v69 = &v49[16 * v13 - 32];
    uint64_t v71 = *(void *)v69;
    uint64_t v70 = *((void *)v69 + 1);
    BOOL v72 = __OFSUB__(v70, v71);
    uint64_t v73 = v70 - v71;
    char v74 = v72;
    if (v72) {
      goto LABEL_142;
    }
    uint64_t v75 = &v49[16 * v51];
    uint64_t v77 = *(void *)v75;
    uint64_t v76 = *((void *)v75 + 1);
    BOOL v62 = __OFSUB__(v76, v77);
    uint64_t v78 = v76 - v77;
    if (v62) {
      goto LABEL_145;
    }
    if (__OFADD__(v73, v78)) {
      goto LABEL_146;
    }
    if (v73 + v78 >= v54)
    {
      BOOL v79 = v54 < v78;
LABEL_105:
      if (v79) {
        unint64_t v51 = v63;
      }
      goto LABEL_107;
    }

LABEL_99:
    if ((v74 & 1) != 0) {
      goto LABEL_141;
    }
    uint64_t v82 = &v49[16 * v51];
    uint64_t v84 = *(void *)v82;
    uint64_t v83 = *((void *)v82 + 1);
    BOOL v62 = __OFSUB__(v83, v84);
    uint64_t v85 = v83 - v84;
    if (v62) {
      goto LABEL_144;
    }
    if (v85 < v73) {
      goto LABEL_15;
    }
LABEL_107:
    unint64_t v90 = v51 - 1;
    if (v51 - 1 >= v13)
    {
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }

    uint64_t v91 = v11;
    if (!v11) {
      goto LABEL_159;
    }
    int64_t v92 = v12;
    int64_t v93 = &v49[16 * v90];
    uint64_t v94 = *(void *)v93;
    v95 = v49;
    unint64_t v96 = v51;
    v97 = &v49[16 * v51];
    uint64_t v98 = *((void *)v97 + 1);
    uint64_t v99 = v91;
    sub_1000104C4((char *)(v91 + 16LL * *(void *)v93), (char *)(v91 + 16LL * *(void *)v97), v91 + 16 * v98, __dst);
    if (v1) {
      break;
    }
    if (v98 < v94) {
      goto LABEL_134;
    }
    if (v96 > *((void *)v92 + 2)) {
      goto LABEL_135;
    }
    *(void *)int64_t v93 = v94;
    *(void *)&v95[16 * v90 + 8] = v98;
    unint64_t v100 = *((void *)v92 + 2);
    if (v96 >= v100) {
      goto LABEL_136;
    }
    unint64_t v12 = v92;
    unint64_t v13 = v100 - 1;
    memmove(v97, v97 + 16, 16 * (v100 - 1 - v96));
    uint64_t v49 = v95;
    *((void *)v92 + 2) = v100 - 1;
    uint64_t v11 = v99;
    Swift::Int v10 = v115;
    if (v100 <= 2) {
      goto LABEL_15;
    }
  }

  v101 = v92;
LABEL_116:
  v102 = v101;
LABEL_117:
  swift_bridgeObjectRelease(v102, v5);
  v112[2] = 0LL;
  return swift_bridgeObjectRelease(v112, v103);
}

uint64_t sub_1000103F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    unint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      uint64_t v13 = *(v12 - 2);
      uint64_t v14 = *(v12 - 1);
      BOOL v15 = result == v13 && v10 == v14;
      if (v15 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, v13, v14, 1LL), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_1000104C4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  uint64_t v31 = __src;
  uint64_t v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v19 = &v4[16 * v13];
      id v29 = v19;
      uint64_t v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v20 = (char *)(a3 - 16);
        int v21 = v6;
        while (1)
        {
          Swift::Int v22 = v20 + 16;
          uint64_t v23 = *((void *)v19 - 2);
          uint64_t v24 = *((void *)v19 - 1);
          uint64_t v25 = *((void *)v21 - 2);
          uint64_t v26 = *((void *)v21 - 1);
          v21 -= 16;
          BOOL v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1LL) & 1) == 0)
          {
            id v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19) {
              *(_OWORD *)uint64_t v20 = *((_OWORD *)v19 - 1);
            }
            int v21 = v6;
            v19 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v22 != v6 || v20 >= v6) {
              *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
            }
            uint64_t v31 = v21;
            if (v21 <= v7) {
              goto LABEL_50;
            }
          }

          v20 -= 16;
          uint64_t v6 = v21;
          if (v19 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    id v29 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        uint64_t v15 = *((void *)v6 + 1);
        uint64_t v16 = *((void *)v4 + 1);
        BOOL v17 = *(void *)v6 == *(void *)v4 && v15 == v16;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v15, *(void *)v4, v16, 1LL) & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v30 = v4;
          uint64_t v18 = v6;
        }

        else
        {
          uint64_t v18 = v6 + 16;
          if (v7 < v6 || v7 >= v18 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v18;
      }

      while ((unint64_t)v18 < a3);
      uint64_t v31 = v7;
    }

LABEL_50:
    sub_100010854((void **)&v31, (const void **)&v30, &v29);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_10001075C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034EC0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4, v15);
  return v11;
}

char *sub_100010854(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

char *sub_1000108FC(uint64_t a1)
{
  return sub_10001075C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100010910(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain(v21);
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100010B0C(uint64_t a1)
{
  return sub_100013A48(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_100010B20(double *a1@<X1>, double *a2@<X8>)
{
  double v4 = *a1;
  double v3 = a1[1];
  double v5 = v3 - *a1;
  if ((~*(void *)&v5 & 0x7FF0000000000000LL) != 0)
  {
    unint64_t v6 = sub_10000FA20(0x20000000000001uLL);
    double v7 = v4 + v5 * ((double)v6 * 1.11022302e-16);
    if (v6 == 0x20000000000000LL) {
      double v7 = v3;
    }
    *a2 = v7;
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100010BA0@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a2;
  uint64_t v6 = swift_bridgeObjectRetain(*a2);
  double v7 = sub_10000E568(v6, a1);
  uint64_t result = swift_bridgeObjectRelease(v5, v8);
  *a3 = v7;
  return result;
}

unint64_t sub_100010BFC@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  unint64_t result = *(void *)(*a1 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }

  unint64_t result = sub_10000FA20(result);
  if ((result & 0x8000000000000000LL) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (result < *(void *)(v2 + 16))
  {
    *a2 = *(void *)(v2 + 8 * result + 32);
    return result;
  }

LABEL_7:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

      NSFastEnumerationIterator.next()(v30, v23);
      if (!v31) {
        goto LABEL_12;
      }
    }

    v25(v4, 1LL, 1LL, v5);
LABEL_6:
    uint64_t v23 = sub_100017F68((uint64_t)v4, &qword_100035020);
    goto LABEL_7;
  }

  uint64_t v31 = static os_log_type_t.debug.getter(v30);
  Swift::Int v32 = qword_100035878;
  Swift::Int v33 = swift_allocObject(v11, 72LL, 7LL);
  *(_OWORD *)(v33 + 16) = v42;
  uint64_t v34 = URL.path.getter();
  *(void *)(v33 + 56) = &type metadata for String;
  *(void *)(v33 + 64) = v16;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v35;
  os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "Symlink found: %@", 17LL, 2LL, v33);
  swift_bridgeObjectRelease(v33, v36);
  sub_100017F68((uint64_t)v8, &qword_100035030);
  return 0LL;
}

uint64_t sub_100010C5C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t *)@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  (*(void (**)(uint64_t *__return_ptr))a2)(&v15);
  uint64_t v11 = a4(v15 & ~(v15 >> 63), a1, v9, v10);
  uint64_t v14 = v11;
  a3(&v15, &v14);
  uint64_t result = swift_bridgeObjectRelease(v11, v12);
  *a5 = v15;
  return result;
}

unint64_t sub_100010CF8@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  unint64_t result = *(void *)(*a1 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }

  unint64_t result = sub_10000FA20(result);
  if ((result & 0x8000000000000000LL) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (result < *(void *)(v2 + 16))
  {
    uint64_t v5 = v2 + 16 * result;
    uint64_t v6 = *(void *)(v5 + 40);
    *a2 = *(void *)(v5 + 32);
    a2[1] = v6;
    return swift_bridgeObjectRetain(v6);
  }

id sub_100010D58(uint64_t a1, void (**a2)(uint64_t *__return_ptr, uint64_t))
{
  void (*v3)(uint64_t *__return_ptr, uint64_t);
  uint64_t v5;
  double v3 = *a2;
  sub_10000A028(0LL, &qword_100034EB8, &OBJC_CLASS___MLFeatureValue_ptr);
  v3(&v5, a1);
  return sub_10000EFE0(v5);
}

id sub_100010DE4(uint64_t a1, void (**a2)(void **__return_ptr), SEL *a3)
{
  double v4 = v7;
  id v5 = objc_msgSend((id)objc_opt_self(MLFeatureValue), *a3, v7);

  return v5;
}

id sub_100010E44(uint64_t a1, void (**a2)(uint64_t *__return_ptr))
{
  uint64_t v2 = v9;
  swift_bridgeObjectRetain(v9);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2, v4);
  id v5 = [(id)objc_opt_self(MLFeatureValue) featureValueWithString:v3];
  swift_bridgeObjectRelease(v2, v6);

  return v5;
}

id sub_100010ED4(uint64_t a1, void (**a2)(uint64_t *__return_ptr))
{
  return [(id)objc_opt_self(MLFeatureValue) featureValueWithInt64:v3];
}

id sub_100010F24(uint64_t a1, void (**a2)(double *__return_ptr))
{
  return [(id)objc_opt_self(MLFeatureValue) featureValueWithDouble:v3];
}

__CVBuffer *(*sub_100010F7C(void *a1))@<X0>(uint64_t a1@<X0>, __CVBuffer **a2@<X8>)
{
  unint64_t result = (__CVBuffer *(*)@<X0>(uint64_t@<X0>, __CVBuffer **@<X8>))[a1 constraint];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = objc_opt_self(&OBJC_CLASS___MIOImageConstraint);
    uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional(v2, v3, 0LL, 0LL, 0LL);
    unsigned int v5 = [v4 pixelFormatType];
    id v6 = [v4 imageSize];
    id v7 = [v6 pixelsWide];

    id v8 = [v4 imageSize];
    id v9 = [v8 pixelsHigh];

    uint64_t v10 = sub_10000645C(&qword_100034ED0);
    uint64_t v11 = static Array._allocateBufferUninitialized(minimumCapacity:)(4LL, v10);
    *(void *)(v11 + 16) = 4LL;
    *(void *)(v11 + 32) = 0xFF00FF00FF00FF00LL;
    swift_unknownObjectRelease(v2);
    uint64_t v12 = swift_allocObject(&unk_100031BF8, 32LL, 7LL);
    *(void *)(v12 + 16) = v7;
    *(void *)(v12 + 24) = v9;
    uint64_t v13 = swift_allocObject(&unk_100031C20, 24LL, 7LL);
    *(void *)(v13 + 16) = v11;
    uint64_t v14 = swift_allocObject(&unk_100031C48, 56LL, 7LL);
    *(_DWORD *)(v14 + 16) = v5;
    *(void *)(v14 + 24) = sub_100012518;
    *(void *)(v14 + 32) = v12;
    *(void *)(v14 + 40) = sub_100012524;
    *(void *)(v14 + 48) = v13;
    return sub_100012558;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t (*sub_100011110(void *a1))@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t result = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))[a1 constraint];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_opt_self(&OBJC_CLASS___MIOMultiArrayConstraint);
    unsigned int v5 = (void *)swift_dynamicCastObjCClassUnconditional(v3, v4, 0LL, 0LL, 0LL);
    id v6 = [v5 shape];
    uint64_t v7 = sub_10000A028(0LL, (unint64_t *)&qword_100034D70, &OBJC_CLASS___NSNumber_ptr);
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    if ((unint64_t)v8 >> 62)
    {
      if (v8 < 0) {
        uint64_t v35 = v8;
      }
      else {
        uint64_t v35 = v8 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v8);
      uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v35);
      swift_bridgeObjectRelease(v8, v36);
    }

    else
    {
      uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    id v37 = a1;
    id v39 = v5;
    if (v10)
    {
      uint64_t v40 = _swiftEmptyArrayStorage;
      uint64_t v11 = &v40;
      sub_100013560(0, v10 & ~(v10 >> 63), 0);
      if (v10 < 0)
      {
        __break(1u);
        goto LABEL_31;
      }

      int64_t v38 = v3;
      uint64_t v12 = 0LL;
      uint64_t v13 = v40;
      do
      {
        if ((v8 & 0xC000000000000001LL) != 0) {
          id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, v8);
        }
        else {
          id v14 = *(id *)(v8 + 8 * v12 + 32);
        }
        uint64_t v15 = v14;
        id v16 = objc_msgSend(v14, "integerValue", v37);

        uint64_t v40 = v13;
        unint64_t v19 = v13[2];
        unint64_t v18 = v13[3];
        if (v19 >= v18 >> 1)
        {
          sub_100013560(v18 > 1, v19 + 1, 1);
          uint64_t v13 = v40;
        }

        ++v12;
        void v13[2] = v19 + 1;
        v13[v19 + 4] = v16;
      }

      while (v10 != v12);
      swift_bridgeObjectRelease(v8, v17);
      uint64_t v3 = v38;
    }

    else
    {
      swift_bridgeObjectRelease(v8, v9);
      uint64_t v13 = _swiftEmptyArrayStorage;
    }

    uint64_t v11 = (void **)swift_allocObject(&unk_100031C70, 24LL, 7LL);
    v11[2] = v13;
    uint64_t v20 = (uint64_t)[v39 dataType];
    if (v20 > 65599)
    {
      if (v20 == 65600)
      {
        swift_unknownObjectRelease(v3);
        uint64_t v27 = swift_allocObject(&unk_100031D88, 32LL, 7LL);
        *(_OWORD *)(v27 + 16) = xmmword_1000266E0;
        uint64_t v28 = (void *)swift_allocObject(&unk_100031DB0, 48LL, 7LL);
        v28[2] = sub_100012B68;
        v28[3] = v11;
        v28[4] = sub_100012B64;
        v28[5] = v27;
        return sub_1000126D8;
      }

      if (v20 == 131104)
      {
        swift_unknownObjectRelease(v3);
        uint64_t v23 = swift_allocObject(&unk_100031C98, 24LL, 7LL);
        *(void *)(v23 + 16) = 0xFF00000000LL;
        uint64_t v24 = (void *)swift_allocObject(&unk_100031CC0, 48LL, 7LL);
        void v24[2] = sub_100012B68;
        v24[3] = v11;
        v24[4] = sub_1000125F8;
        v24[5] = v23;
        return sub_100012624;
      }

      goto LABEL_25;
    }

    if (v20 != 65552)
    {
      if (v20 == 65568)
      {
        swift_unknownObjectRelease(v3);
        uint64_t v21 = swift_allocObject(&unk_100031D38, 24LL, 7LL);
        *(void *)(v21 + 16) = 0x3F80000000000000LL;
        Swift::Int v22 = (void *)swift_allocObject(&unk_100031D60, 48LL, 7LL);
        v22[2] = sub_100012B68;
        v22[3] = v11;
        v22[4] = sub_100012B60;
        v22[5] = v21;
        return sub_10001268C;
      }

LABEL_25:
      id v29 = objc_msgSend(v37, "name", v37);
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      uint64_t v32 = v31;

      unint64_t v33 = sub_100012354();
      swift_allocError(&type metadata for FeatureGeneration.GenerationError, v33, 0LL, 0LL);
      *(void *)uint64_t v34 = v30;
      *(void *)(v34 + 8) = v32;
      *(_BYTE *)(v34 + 16) = 1;
      swift_willThrow();
      swift_unknownObjectRelease(v3);
      return (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))swift_release(v11);
    }

    unsigned int v5 = (void *)static os_log_type_t.debug.getter(65552LL);
    if (qword_100034908 == -1)
    {
LABEL_23:
      os_log(_:dso:log:_:_:)( v5,  &_mh_execute_header,  qword_100035878,  "using custom multiArrayGenerator (float16)",  42LL,  2LL,  _swiftEmptyArrayStorage,  v37);
      swift_unknownObjectRelease(v3);
      uint64_t v25 = swift_allocObject(&unk_100031CE8, 24LL, 7LL);
      *(void *)(v25 + 16) = 0x3F80000000000000LL;
      uint64_t v26 = (void *)swift_allocObject(&unk_100031D10, 48LL, 7LL);
      v26[2] = sub_100012B68;
      v26[3] = v11;
      v26[4] = sub_100012640;
      v26[5] = v25;
      return sub_10001266C;
    }

    uint64_t v12 = (v23 - 1) & v23;
    uint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    id v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    unint64_t v18 = v17[1];
    unint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    char *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    unint64_t result = v20;
  }

  uint64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  uint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    uint64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    Swift::Int v22 = __clz(__rbit64(v20));
    uint64_t v12 = (v20 - 1) & v20;
    uint64_t v15 = v22 + (v9 << 6);
LABEL_12:
    id v16 = *(void *)(v2 + 56) + 16 * v15;
    uint64_t v17 = *(void *)v16;
    LOBYTE(v16) = *(_BYTE *)(v16 + 8);
    *(_BYTE *)(*(void *)(v4 + 48) + v15) = *(_BYTE *)(*(void *)(v2 + 48) + v15);
    unint64_t v18 = *(void *)(v4 + 56) + 16 * v15;
    *(void *)unint64_t v18 = v17;
    *(_BYTE *)(v18 + 8) = v16;
  }

  uint64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  uint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    uint64_t v9 = v21;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

LABEL_31:
    swift_once(&qword_100034908, sub_100003470);
    goto LABEL_23;
  }

  __break(1u);
  return result;
}

uint64_t (*sub_100011600(void *a1))@<X0>(void *a1@<X8>)
{
  unint64_t result = (uint64_t (*)@<X0>(void *@<X8>))[a1 constraint];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = objc_opt_self(&OBJC_CLASS___MIODictionaryConstraint);
    id v6 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v4, v5, 0, 0, 0), "keyType");
    if (v6 == (id)1)
    {
      uint64_t v10 = sub_10000645C(&qword_100034F40);
      uint64_t inited = swift_initStackObject(v10, v22);
      *(_OWORD *)(inited + 16) = xmmword_1000266F0;
      uint64_t v19 = 0LL;
      AnyHashable.init<A>(_:)(&v19, &type metadata for Int64, &protocol witness table for Int64);
      sub_10000A028(0LL, (unint64_t *)&qword_100034D70, &OBJC_CLASS___NSNumber_ptr);
      *(NSNumber *)(inited + 72) = NSNumber.init(floatLiteral:)(0.0);
      uint64_t v19 = 1LL;
      AnyHashable.init<A>(_:)(&v19, &type metadata for Int64, &protocol witness table for Int64);
      uint64_t v1 = sub_100012754;
      uint64_t v9 = &unk_100031DD8;
    }

    else
    {
      if (v6 != (id)3)
      {
        id v13 = [a1 name];
        uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
        uint64_t v16 = v15;

        unint64_t v17 = sub_100012354();
        swift_allocError(&type metadata for FeatureGeneration.GenerationError, v17, 0LL, 0LL);
        *(void *)uint64_t v18 = v14;
        *(void *)(v18 + 8) = v16;
        *(_BYTE *)(v18 + 16) = 3;
        swift_willThrow();
        swift_unknownObjectRelease(v4);
        return v1;
      }

      uint64_t v7 = sub_10000645C(&qword_100034F40);
      uint64_t inited = swift_initStackObject(v7, v21);
      *(_OWORD *)(inited + 16) = xmmword_1000266F0;
      uint64_t v19 = 813262187LL;
      unint64_t v20 = 0xE400000000000000LL;
      AnyHashable.init<A>(_:)(&v19, &type metadata for String, &protocol witness table for String);
      sub_10000A028(0LL, (unint64_t *)&qword_100034D70, &OBJC_CLASS___NSNumber_ptr);
      *(NSNumber *)(inited + 72) = NSNumber.init(floatLiteral:)(0.0);
      uint64_t v19 = 830039403LL;
      unint64_t v20 = 0xE400000000000000LL;
      AnyHashable.init<A>(_:)(&v19, &type metadata for String, &protocol witness table for String);
      uint64_t v1 = sub_100012B68;
      uint64_t v9 = &unk_100031E00;
    }

    *(NSNumber *)(inited + 120) = NSNumber.init(floatLiteral:)(1.0);
    unint64_t v12 = sub_100012ED4(inited, v11);
    swift_unknownObjectRelease(v4);
    *(void *)(swift_allocObject(v9, 24LL, 7LL) + 16) = v12;
    return v1;
  }

  __break(1u);
  return result;
}

void sub_1000118A0(void *a1)
{
  id v2 = [a1 constraint];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = objc_opt_self(&OBJC_CLASS___MIOSequenceConstraint);
    uint64_t v5 = (void *)swift_dynamicCastObjCClassUnconditional(v3, v4, 0LL, 0LL, 0LL);
    id v6 = [v5 countRange];
    uint64_t v7 = swift_allocObject(&unk_100031E28, 24LL, 7LL);
    *(void *)(v7 + 16) = v6;
    id v8 = [v5 valueDescription];
    id v9 = [v8 type];
    if (v9 == (id)1)
    {
      uint64_t v26 = sub_100012788;
      unint64_t v12 = &unk_100031EA0;
      id v13 = sub_10000F7A0;
      uint64_t v14 = sub_10001277C;
      uint64_t v15 = &unk_100031E78;
      uint64_t v11 = &off_100030E68;
      uint64_t v16 = &unk_100031E50;
      goto LABEL_6;
    }

    if (v9 == (id)3)
    {
      uint64_t v10 = sub_10000645C(&qword_100034AE8);
      uint64_t v11 = (_UNKNOWN **)swift_allocObject(v10, 80LL, 7LL);
      *((_OWORD *)v11 + 1) = xmmword_100026700;
      v11[4] = (_UNKNOWN *)97;
      v11[5] = (_UNKNOWN *)0xE100000000000000LL;
      uint64_t v26 = sub_1000127F0;
      unint64_t v12 = &unk_100031F18;
      v11[6] = (_UNKNOWN *)98;
      v11[7] = (_UNKNOWN *)0xE100000000000000LL;
      v11[8] = (_UNKNOWN *)99;
      v11[9] = (_UNKNOWN *)0xE100000000000000LL;
      id v13 = sub_10000F728;
      uint64_t v14 = sub_1000127B0;
      uint64_t v15 = &unk_100031EF0;
      uint64_t v16 = &unk_100031EC8;
LABEL_6:
      swift_unknownObjectRelease(v3);

      uint64_t v17 = swift_allocObject(v16, 24LL, 7LL);
      *(void *)(v17 + 16) = v11;
      uint64_t v18 = (void *)swift_allocObject(v15, 64LL, 7LL);
      v18[2] = sub_100012770;
      v18[3] = v7;
      v18[4] = v14;
      v18[5] = v17;
      v18[6] = v13;
      v18[7] = 0LL;
      uint64_t v19 = swift_allocObject(v12, 32LL, 7LL);
      *(void *)(v19 + 16) = v26;
      *(void *)(v19 + 24) = v18;
      return;
    }

    id v20 = [a1 name];
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    uint64_t v23 = v22;

    unint64_t v24 = sub_100012354();
    swift_allocError(&type metadata for FeatureGeneration.GenerationError, v24, 0LL, 0LL);
    *(void *)uint64_t v25 = v21;
    *(void *)(v25 + 8) = v23;
    *(_BYTE *)(v25 + 16) = 2;
    swift_willThrow();
    swift_unknownObjectRelease(v3);
    swift_release(v7);
  }

  else
  {
    __break(1u);
  }

uint64_t (*sub_100011B50(void *a1))@<X0>(uint64_t *@<X8>)
{
  switch((unint64_t)[a1 type])
  {
    case 1uLL:
      uint64_t v4 = swift_allocObject(&unk_100031B08, 32LL, 7LL);
      id v2 = sub_1000123B8;
      *(_OWORD *)(v4 + 16) = xmmword_100026720;
      uint64_t v5 = sub_1000124B8;
      id v6 = &unk_100031B58;
      uint64_t v7 = sub_100012490;
      id v8 = &unk_100031B30;
      break;
    case 2uLL:
      uint64_t v4 = swift_allocObject(&unk_100031B80, 32LL, 7LL);
      id v2 = sub_1000123B8;
      *(_OWORD *)(v4 + 16) = xmmword_1000266E0;
      uint64_t v5 = sub_1000124D8;
      id v6 = &unk_100031BD0;
      uint64_t v7 = sub_1000124D0;
      id v8 = &unk_100031BA8;
      break;
    case 3uLL:
      uint64_t v4 = swift_allocObject(&unk_100031A90, 48LL, 7LL);
      *(_OWORD *)(v4 + 16) = xmmword_100026710;
      *(void *)(v4 + 32) = 0xD00000000000003DLL;
      *(void *)(v4 + 40) = 0x80000001000294F0LL;
      id v2 = sub_1000123B8;
      uint64_t v5 = sub_100012478;
      id v6 = &unk_100031AE0;
      uint64_t v7 = sub_10001244C;
      id v8 = &unk_100031AB8;
      break;
    case 4uLL:
      uint64_t v15 = sub_100010F7C(a1);
      if (v1) {
        return v2;
      }
      uint64_t v7 = v15;
      uint64_t v4 = v16;
      id v2 = sub_1000123B8;
      uint64_t v5 = sub_100012408;
      id v6 = &unk_100031A68;
      id v8 = &unk_100031A40;
      break;
    case 5uLL:
      uint64_t v17 = sub_100011110(a1);
      if (v1) {
        return v2;
      }
      uint64_t v7 = v17;
      uint64_t v4 = v18;
      id v2 = sub_1000123B8;
      uint64_t v5 = sub_1000123E8;
      id v6 = &unk_100031A18;
      id v8 = &unk_1000319F0;
      break;
    case 6uLL:
      uint64_t v19 = sub_100011600(a1);
      if (v1) {
        return v2;
      }
      uint64_t v7 = v19;
      uint64_t v4 = v20;
      id v2 = sub_1000123B8;
      uint64_t v5 = sub_1000123BC;
      id v6 = &unk_1000319C8;
      id v8 = &unk_1000319A0;
      break;
    case 7uLL:
      sub_1000118A0(a1);
      if (v1) {
        return v2;
      }
      uint64_t v7 = v21;
      uint64_t v4 = v22;
      id v2 = sub_1000123B8;
      uint64_t v5 = sub_100012398;
      id v6 = &unk_100031978;
      id v8 = &unk_100031950;
      break;
    default:
      id v9 = [a1 name];
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      uint64_t v12 = v11;

      unint64_t v13 = sub_100012354();
      swift_allocError(&type metadata for FeatureGeneration.GenerationError, v13, 0LL, 0LL);
      *(void *)uint64_t v14 = v10;
      *(void *)(v14 + 8) = v12;
      *(_BYTE *)(v14 + 16) = 0;
      swift_willThrow();
      return v2;
  }

  uint64_t v23 = swift_allocObject(v8, 32LL, 7LL);
  *(void *)(v23 + 16) = v7;
  *(void *)(v23 + 24) = v4;
  uint64_t v24 = swift_allocObject(v6, 32LL, 7LL);
  *(void *)(v24 + 16) = v5;
  *(void *)(v24 + 24) = v23;
  return v2;
}

void *sub_100011E74(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t isUniquelyReferenced_nonNull_native = a1;
  if (a1 >> 62)
  {
LABEL_27:
    if (isUniquelyReferenced_nonNull_native < 0) {
      uint64_t v42 = isUniquelyReferenced_nonNull_native;
    }
    else {
      uint64_t v42 = isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(isUniquelyReferenced_nonNull_native);
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v42);
    if (v6) {
      goto LABEL_3;
    }
LABEL_31:
    swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native, v7);
    return &_swiftEmptyDictionarySingleton;
  }

  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (!v6) {
    goto LABEL_31;
  }
LABEL_3:
  unint64_t v44 = isUniquelyReferenced_nonNull_native & 0xC000000000000001LL;
  uint64_t v8 = 4LL;
  uint64_t v43 = v6;
  while (1)
  {
    if (v44) {
      id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, isUniquelyReferenced_nonNull_native);
    }
    else {
      id v15 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v8);
    }
    uint64_t v16 = v15;
    if (__OFADD__(v8 - 4, 1LL))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }

    uint64_t v48 = v8 - 3;
    id v17 = [v15 name];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v20 = v19;

    if (a2[2])
    {
      swift_bridgeObjectRetain(v20);
      sub_100012FFC(v18, v20);
      swift_bridgeObjectRelease(v20, v21);
    }

    uint64_t v22 = sub_100011B50(v16);
    if (v3)
    {
      swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native, v23);

      swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton, v39);
      return (void *)swift_bridgeObjectRelease(v20, v40);
    }

    uint64_t v45 = v22;
    BOOL v46 = v23;
    unint64_t v47 = v16;
    uint64_t v24 = v8;
    uint64_t v25 = a2;
    uint64_t v26 = isUniquelyReferenced_nonNull_native;
    a2 = &_swiftEmptyDictionarySingleton;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
    unint64_t v28 = sub_100012FFC(v18, v20);
    uint64_t v29 = *((void *)&_swiftEmptyDictionarySingleton + 2);
    BOOL v30 = (v27 & 1) == 0;
    uint64_t v31 = v29 + v30;
    if (__OFADD__(v29, v30)) {
      goto LABEL_25;
    }
    uint64_t v3 = v27;
    if (*((void *)&_swiftEmptyDictionarySingleton + 3) < v31) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_100014CF0();
    }
LABEL_19:
    uint64_t isUniquelyReferenced_nonNull_native = v26;
    a2 = v25;
    if ((v3 & 1) != 0)
    {
      id v9 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(*((void *)&_swiftEmptyDictionarySingleton + 7) + 16 * v28);
      uint64_t v10 = v9[1];
      *id v9 = v45;
      v9[1] = v46;
      swift_release(v10);
      uint64_t v11 = v43;
      uint64_t v12 = v47;
    }

    else
    {
      *((void *)&_swiftEmptyDictionarySingleton + (v28 >> 6) + 8) |= 1LL << v28;
      uint64_t v34 = (uint64_t *)(*((void *)&_swiftEmptyDictionarySingleton + 6) + 16 * v28);
      *uint64_t v34 = v18;
      v34[1] = v20;
      uint64_t v35 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(*((void *)&_swiftEmptyDictionarySingleton + 7) + 16 * v28);
      uint64_t v12 = v47;
      *uint64_t v35 = v45;
      v35[1] = v46;
      uint64_t v36 = *((void *)&_swiftEmptyDictionarySingleton + 2);
      BOOL v37 = __OFADD__(v36, 1LL);
      uint64_t v38 = v36 + 1;
      uint64_t v11 = v43;
      if (v37) {
        goto LABEL_26;
      }
      *((void *)&_swiftEmptyDictionarySingleton + 2) = v38;
      swift_bridgeObjectRetain(v20);
    }

    swift_bridgeObjectRelease(v20, v13);
    swift_bridgeObjectRelease(0x8000000000000000LL, v14);
    uint64_t v8 = v24 + 1;
    uint64_t v3 = 0LL;
    if (v48 == v11) {
      goto LABEL_31;
    }
  }

  sub_100014424(v31, isUniquelyReferenced_nonNull_native);
  unint64_t v32 = sub_100012FFC(v18, v20);
  if ((v3 & 1) == (v33 & 1))
  {
    unint64_t v28 = v32;
    goto LABEL_19;
  }

  unint64_t result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_100012188(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for URL(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, a1);
  id v9 = objc_allocWithZone(&OBJC_CLASS___MIOModel);
  id v10 = sub_10000F914((uint64_t)v7);
  if (!v2)
  {
    uint64_t v11 = v10;
    id v12 = [v10 modelDescription];
    id v13 = [v12 inputDescriptions];

    uint64_t v14 = sub_10000A028(0LL, &qword_100034EA8, &OBJC_CLASS___MIOFeatureDescription_ptr);
    unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);

    id v16 = v11;
    id v17 = sub_100011E74(v15, a2);
    swift_bridgeObjectRelease(v15, v18);

    *(void *)(swift_allocObject(&unk_100031928, 24LL, 7LL) + 16) = v17;
  }

uint64_t sub_1000122F0(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 24LL, 7LL);
}

id sub_100012314@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = sub_10000F0E4(a1, *(void *)(v2 + 16));
  *a2 = result;
  return result;
}

_OWORD *sub_10001233C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001234C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100012354()
{
  unint64_t result = qword_100034EC8;
  if (!qword_100034EC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002668C, &type metadata for FeatureGeneration.GenerationError);
    atomic_store(result, (unint64_t *)&qword_100034EC8);
  }

  return result;
}

id sub_100012398(uint64_t a1)
{
  return sub_100010DE4( a1,  (void (**)(void **__return_ptr))(v1 + 16),  (SEL *)&selRef_featureValueWithSequence_);
}

id sub_1000123BC(uint64_t a1)
{
  return sub_100010D58(a1, (void (**)(uint64_t *__return_ptr, uint64_t))(v1 + 16));
}

uint64_t sub_1000123C4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

id sub_1000123E8(uint64_t a1)
{
  return sub_100010DE4( a1,  (void (**)(void **__return_ptr))(v1 + 16),  (SEL *)&selRef_featureValueWithMultiArray_);
}

id sub_100012408(uint64_t a1)
{
  return sub_100010DE4( a1,  (void (**)(void **__return_ptr))(v1 + 16),  (SEL *)&selRef_featureValueWithPixelBuffer_);
}

uint64_t sub_100012428(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 48LL, 7LL);
}

uint64_t sub_10001244C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000B0EC(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
  *a2 = result;
  a2[1] = v5;
  return result;
}

id sub_100012478(uint64_t a1)
{
  return sub_100010E44(a1, (void (**)(uint64_t *__return_ptr))(v1 + 16));
}

uint64_t sub_100012480()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

unint64_t sub_100012490@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_10000E78C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24));
  *a2 = result;
  return result;
}

id sub_1000124B8(uint64_t a1)
{
  return sub_100010ED4(a1, (void (**)(uint64_t *__return_ptr))(v1 + 16));
}

uint64_t sub_1000124C0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000124D0(double *a1@<X8>)
{
}

id sub_1000124D8(uint64_t a1)
{
  return sub_100010F24(a1, (void (**)(double *__return_ptr))(v1 + 16));
}

uint64_t sub_1000124E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_100012508()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

__n128 sub_100012518@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

uint64_t sub_100012524@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100010BA0(a1, (void *)(v2 + 16), a2);
}

uint64_t sub_10001252C()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

__CVBuffer *sub_100012558@<X0>(uint64_t a1@<X0>, __CVBuffer **a2@<X8>)
{
  __int128 v4 = *(_OWORD *)(v2 + 32);
  v6[0] = *(_OWORD *)(v2 + 16);
  v6[1] = v4;
  uint64_t v7 = *(void *)(v2 + 48);
  __n128 result = sub_10000E81C(a1, (uint64_t)v6);
  *a2 = result;
  return result;
}

uint64_t sub_100012598(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000125C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000125E8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000125F8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = sub_10000E950(a1, *(void *)(v2 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_100012624@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000126E4(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_10000EA64, a2);
}

uint64_t sub_100012630()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100012640(_DWORD *a1@<X8>)
{
  *a1 = v3;
}

uint64_t sub_10001266C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000126E4(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_10000B630, a2);
}

uint64_t sub_100012678()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10001268C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000126E4(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_10000EC38, a2);
}

uint64_t sub_100012698()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000126AC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000126D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000126E4(a1, (uint64_t (*)(uint64_t, void, void, void, void))sub_10000EE0C, a2);
}

uint64_t sub_1000126E4@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void, void, void, void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(a1, v3[2], v3[3], v3[4], v3[5]);
  *a3 = result;
  return result;
}

uint64_t sub_100012714(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_100006568(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100012754@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_100012760()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100012770(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

unint64_t sub_10001277C@<X0>(void *a1@<X8>)
{
  return sub_100010BFC((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_100012788@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100010C5C( a1,  v2 + 16,  *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 48),  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10000E3C8,  a2);
}

unint64_t sub_1000127B0@<X0>(void *a1@<X8>)
{
  return sub_100010CF8((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_1000127BC()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_1000127F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100010C5C( a1,  v2 + 16,  *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 48),  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10000E494,  a2);
}

void *sub_100012814@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v4);
  *a1 = v4;
  return result;
}

ValueMetadata *type metadata accessor for FeatureGeneration()
{
  return &type metadata for FeatureGeneration;
}

uint64_t storeEnumTagSinglePayload for FeatureGeneration.ValueStrategy(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10001289C + 4 * byte_1000265C4[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000128BC + 4 * byte_1000265C9[v4]))();
  }
}

_BYTE *sub_10001289C(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_1000128BC(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1000128C4(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1000128CC(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1000128D4(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1000128DC(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FeatureGeneration.ValueStrategy()
{
  return &type metadata for FeatureGeneration.ValueStrategy;
}

uint64_t sub_1000128FC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for FeatureGeneration.GenerationError(uint64_t a1)
{
  return sub_100009FCC(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s35com_apple_dt_DTMLModelRunnerService17FeatureGenerationV15GenerationErrorOwCP_0( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1000128FC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FeatureGeneration.GenerationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1000128FC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100009FCC(v6, v7, v8);
  return a1;
}

__n128 _s14ModelStructureOwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FeatureGeneration.GenerationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100009FCC(v4, v5, v6);
  return a1;
}

uint64_t _s14ModelStructureOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s14ModelStructureOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100012AA4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100012AAC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureGeneration.GenerationError()
{
  return &type metadata for FeatureGeneration.GenerationError;
}

unint64_t sub_100012AC8()
{
  unint64_t result = qword_100034F48;
  if (!qword_100034F48)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026664, &type metadata for FeatureGeneration.ValueStrategy);
    atomic_store(result, (unint64_t *)&qword_100034F48);
  }

  return result;
}

unint64_t sub_100012B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000645C(&qword_100035018);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v8 = *(v7 - 1);
    uint64_t v9 = *v7;
    swift_bridgeObjectRetain(*v7);
    unint64_t result = sub_100012FFC(v8, v9);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v12 = (uint64_t *)(v5[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    uint64_t v13 = v5[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v7 += 2;
    uint64_t v5[2] = v15;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012C68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000645C(&qword_100034FE8);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  uint64_t v7 = v4 + 64;
  uint64_t v8 = a1 + 32;
  swift_retain(v4);
  while (1)
  {
    sub_10001805C(v8, (uint64_t)v17, &qword_100034FF0);
    unint64_t result = sub_1000130D0((uint64_t)v17);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v11 = v5[6] + 40 * result;
    __int128 v12 = v17[0];
    __int128 v13 = v17[1];
    *(void *)(v11 + 32) = v18;
    *(_OWORD *)uint64_t v11 = v12;
    *(_OWORD *)(v11 + 16) = v13;
    unint64_t result = (unint64_t)sub_10001233C(&v19, (_OWORD *)(v5[7] + 32 * result));
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    uint64_t v5[2] = v16;
    v8 += 72LL;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000645C(&qword_100034FD0);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  uint64_t v7 = v4 + 64;
  uint64_t v8 = a1 + 32;
  swift_retain(v4);
  while (1)
  {
    sub_10001805C(v8, (uint64_t)&v15, &qword_100034FD8);
    uint64_t v9 = v15;
    unint64_t result = sub_100013060(v15);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(void *)(v5[6] + 8 * result) = v9;
    unint64_t result = (unint64_t)sub_10001233C(&v16, (_OWORD *)(v5[7] + 32 * result));
    uint64_t v12 = v5[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    uint64_t v5[2] = v14;
    v8 += 40LL;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10000645C(&qword_100035008);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  uint64_t v7 = a1 + 32;
  swift_retain(v4);
  while (1)
  {
    sub_10001805C(v7, (uint64_t)v16, &qword_100035010);
    unint64_t result = sub_1000130D0((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v10 = v5[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    *(void *)(v5[7] + 8 * result) = v18;
    uint64_t v13 = v5[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    uint64_t v5[2] = v15;
    v7 += 48LL;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100012FFC(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100013158(a1, a2, v5);
}

unint64_t sub_100013060(uint64_t a1)
{
  uint64_t v4 = v3;
  unint64_t v5 = sub_100017FA4();
  _CFObject.hash(into:)(v8, v4, v5);
  Swift::Int v6 = Hasher._finalize()();
  return sub_100013238(a1, v6);
}

unint64_t sub_1000130D0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100013360(a1, v4);
}

unint64_t sub_100013100(unsigned __int8 a1)
{
  Swift::Int v3 = Hasher._finalize()();
  return sub_100013424(a1, v3);
}

unint64_t sub_100013158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_100013238(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v6 = v2;
    type metadata accessor for CFString(0LL);
    uint64_t v9 = v8;
    uint64_t v10 = *(void **)(*(void *)(v6 + 48) + 8 * i);
    unint64_t v11 = sub_100017FA4();
    id v12 = v10;
    char v13 = static _CFObject.== infix(_:_:)(v12, a1, v9, v11);

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = ~v4;
      for (unint64_t i = (i + 1) & v14; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v14)
      {
        id v15 = *(id *)(*(void *)(v6 + 48) + 8 * i);
        char v16 = static _CFObject.== infix(_:_:)(v15, a1, v9, v11);

        if ((v16 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

unint64_t sub_100013360(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100017FEC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100018028((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_100013424(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
      }
    }
  }

  return result;
}

uint64_t sub_1000134C4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000135FC(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000134E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100013784(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000134FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000138FC(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100013518(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100014134(a1, a2, a3, *v3, &qword_100034FC8);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100013544(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100013BB0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100013560(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100013CFC(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_10001357C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100013E58(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100013598(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100013FC0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000135B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100014134(a1, a2, a3, *v3, &qword_100034FB0);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000135E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000142A0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1000135FC(char a1, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034F70);
    unint64_t v11 = (char *)swift_allocObject(v10, 72 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 72);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  char v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[72 * v8]) {
      memmove(v13, v14, 72 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[72 * v8] || v13 >= &v14[72 * v8])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100013784(char a1, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034F78);
    unint64_t v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  char v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_1000138FC(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000645C(&qword_100034F68);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  char v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
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
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100013A48(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034AE8);
    unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100013BB0(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000645C(&qword_100034FF8);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
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
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100013CFC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100035000);
    unint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100013E58(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034FA0);
    unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  size_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100013FC0(char a1, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034FA8);
    unint64_t v11 = (char *)swift_allocObject(v10, 80 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 80);
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 80 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100014134(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v8 = a2;
  }

  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    uint64_t v11 = sub_10000645C(a5);
    size_t v12 = (char *)swift_allocObject(v11, 16 * v10 + 32, 7LL);
    int64_t v13 = j__malloc_size(v12);
    uint64_t v14 = v13 - 32;
    if (v13 < 32) {
      uint64_t v14 = v13 - 17;
    }
    *((void *)v12 + 2) = v9;
    *((void *)v12 + 3) = 2 * (v14 >> 4);
  }

  else
  {
    size_t v12 = (char *)_swiftEmptyArrayStorage;
  }

  size_t v15 = v12 + 32;
  char v16 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v12 != a4 || v15 >= &v16[16 * v9]) {
      memmove(v15, v16, 16 * v9);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v16 >= &v15[16 * v9] || v15 >= &v16[16 * v9])
  {
    swift_arrayInitWithCopy(v15);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v12;
  }

uint64_t sub_1000142A0(char a1, int64_t a2, char a3, char *a4)
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000645C(&qword_100034F90);
    uint64_t v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  int64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[24 * v8]) {
      memmove(v13, v14, 24 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[24 * v8] || v13 >= &v14[24 * v8])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

Swift::Int sub_100014424(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000645C(&qword_100034FC0);
  char v38 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    BOOL v37 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v10 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v11 = ~(-1LL << v9);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v14 = v7 + 64;
    Swift::Int result = swift_retain(v5);
    int64_t v16 = 0LL;
    while (1)
    {
      if (v12)
      {
        unint64_t v23 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v24 = v23 | (v16 << 6);
      }

      else
      {
        if (__OFADD__(v16++, 1LL)) {
          goto LABEL_41;
        }
        if (v16 >= v13)
        {
LABEL_34:
          swift_release(v5);
          uint64_t v3 = v37;
          if ((v38 & 1) != 0)
          {
            uint64_t v36 = 1LL << *(_BYTE *)(v5 + 32);
            if (v36 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
            }
            else {
              *uint64_t v10 = -1LL << v36;
            }
            *(void *)(v5 + 16) = 0LL;
          }

          break;
        }

        unint64_t v26 = v10[v16];
        if (!v26)
        {
          int64_t v27 = v16 + 1;
          if (v16 + 1 >= v13) {
            goto LABEL_34;
          }
          unint64_t v26 = v10[v27];
          if (!v26)
          {
            while (1)
            {
              int64_t v16 = v27 + 1;
              if (__OFADD__(v27, 1LL)) {
                break;
              }
              if (v16 >= v13) {
                goto LABEL_34;
              }
              unint64_t v26 = v10[v16];
              ++v27;
              if (v26) {
                goto LABEL_23;
              }
            }

LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            return result;
          }

          ++v16;
        }

LABEL_23:
        unint64_t v12 = (v26 - 1) & v26;
        unint64_t v24 = __clz(__rbit64(v26)) + (v16 << 6);
      }

      uint64_t v28 = 16 * v24;
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + v28);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      __int128 v39 = *(_OWORD *)(*(void *)(v5 + 56) + v28);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain(v30);
        swift_retain(*((void *)&v39 + 1));
      }

      Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
      String.hash(into:)(v40, v31, v30);
      Swift::Int result = Hasher._finalize()();
      uint64_t v17 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v18 = result & ~v17;
      unint64_t v19 = v18 >> 6;
      if (((-1LL << v18) & ~*(void *)(v14 + 8 * (v18 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1LL << v18) & ~*(void *)(v14 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }

          BOOL v34 = v19 == v33;
          if (v19 == v33) {
            unint64_t v19 = 0LL;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v14 + 8 * v19);
        }

        while (v35 == -1);
        unint64_t v20 = __clz(__rbit64(~v35)) + (v19 << 6);
      }

      *(void *)(v14 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v20;
      uint64_t v21 = 16 * v20;
      uint64_t v22 = (void *)(*(void *)(v8 + 48) + v21);
      void *v22 = v31;
      v22[1] = v30;
      *(_OWORD *)(*(void *)(v8 + 56) + v21) = v39;
      ++*(void *)(v8 + 16);
    }
  }

  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

Swift::Int sub_10001470C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000645C(&qword_100034FB8);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v37) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    unint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      id v34 = v33;
    }

    Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v23 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

Swift::Int sub_100014A18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  Swift::Int v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10000645C(&qword_100034F60);
  Swift::Int result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  Swift::Int v8 = result;
  if (*(void *)(v5 + 16))
  {
    char v34 = a2;
    unint64_t v33 = v3;
    int64_t v9 = 0LL;
    uint64_t v36 = (void *)(v5 + 64);
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1LL << v10);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    Swift::Int v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v9 << 6);
      }

      else
      {
        int64_t v18 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }

        Swift::Int result = v5 + 64;
        if (v18 >= v35) {
          goto LABEL_34;
        }
        unint64_t v19 = v36[v18];
        ++v9;
        if (!v19)
        {
          int64_t v9 = v18 + 1;
          if (v18 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v19 = v36[v9];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v35)
            {
LABEL_34:
              if ((v34 & 1) == 0)
              {
                Swift::Int result = swift_release(v5);
                uint64_t v3 = v33;
                goto LABEL_41;
              }

              uint64_t v32 = 1LL << *(_BYTE *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v36, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
              }
              else {
                *uint64_t v36 = -1LL << v32;
              }
              uint64_t v3 = v33;
              *(void *)(v5 + 16) = 0LL;
              break;
            }

            unint64_t v19 = v36[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v9 = v20 + 1;
                if (__OFADD__(v20, 1LL)) {
                  goto LABEL_43;
                }
                if (v9 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v19 = v36[v9];
                ++v20;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v9 = v20;
          }
        }

LABEL_24:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v9 << 6);
      }

      uint64_t v21 = *(void *)(v5 + 56) + 16 * v17;
      Swift::UInt v22 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v17);
      char v23 = *(_BYTE *)(v21 + 8);
      uint64_t v24 = *(void *)v21;
      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      Hasher._combine(_:)(v22);
      Swift::Int result = Hasher._finalize()();
      uint64_t v25 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1LL << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }

          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0LL;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v13 + 8 * v27);
        }

        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }

      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      *(_BYTE *)(*(void *)(v8 + 48) + v14) = v22;
      uint64_t v15 = *(void *)(v8 + 56) + 16 * v14;
      *(void *)uint64_t v15 = v24;
      *(_BYTE *)(v15 + 8) = v23;
      ++*(void *)(v8 + 16);
    }
  }

  Swift::Int result = swift_release(v5);
LABEL_41:
  Swift::Int *v3 = v8;
  return result;
}

void *sub_100014CF0()
{
  uint64_t v1 = v0;
  sub_10000645C(&qword_100034FC0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    Swift::Int result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
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

    if (__OFADD__(v9++, 1LL)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    if (!v22) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    __int128 v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    int64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain(v18);
    Swift::Int result = (void *)swift_retain(*((void *)&v24 + 1));
  }

  int64_t v23 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    ++v9;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }

  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

id sub_100014E98()
{
  uint64_t v1 = v0;
  sub_10000645C(&qword_100034FB8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
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
      goto LABEL_28;
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

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_100015048()
{
  uint64_t v1 = v0;
  sub_10000645C(&qword_100034F60);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
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

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }

void *sub_1000151E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MLModelStructure.Program.Argument(0LL);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  char v39 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v38 = (char *)&v33 - v5;
  sub_10000645C(&qword_100034F98);
  id result = (void *)static _DictionaryStorage.copy(original:)(a1);
  int64_t v7 = 0LL;
  uint64_t v42 = a1;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v9 = a1 + 64;
  uint64_t v8 = v10;
  uint64_t v11 = 1LL << *(_BYTE *)(v9 - 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & v8;
  uint64_t v34 = v9;
  int64_t v35 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v36 = result + 8;
  int64_t v37 = result;
  uint64_t v14 = v40;
  uint64_t v15 = v41;
  uint64_t v17 = v38;
  uint64_t v16 = (uint64_t)v39;
  if ((v12 & v8) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v18 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  int64_t v43 = v7;
  for (unint64_t i = v18 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v24 = *(void *)(v42 + 56);
    uint64_t v25 = (uint64_t *)(*(void *)(v42 + 48) + 16 * i);
    uint64_t v26 = v25[1];
    uint64_t v44 = *v25;
    unint64_t v27 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v27(v17, v24 + *(void *)(v14 + 72) * i, v15);
    v27((char *)v16, (unint64_t)v17, v15);
    swift_bridgeObjectRetain(v26);
    uint64_t v28 = sub_1000161CC(v16);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v15);
    id result = v37;
    *(void *)((char *)v36 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    unint64_t v29 = (void *)(result[6] + 16 * i);
    *unint64_t v29 = v44;
    v29[1] = v26;
    *(void *)(result[7] + 8 * i) = v28;
    uint64_t v30 = result[2];
    BOOL v31 = __OFADD__(v30, 1LL);
    uint64_t v32 = v30 + 1;
    if (v31)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    result[2] = v32;
    int64_t v7 = v43;
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v20 = v7 + 1;
    if (__OFADD__(v7, 1LL)) {
      goto LABEL_24;
    }
    if (v20 >= v35) {
      return result;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v20);
    int64_t v22 = v7 + 1;
    if (!v21)
    {
      int64_t v22 = v7 + 2;
      if (v7 + 2 >= v35) {
        return result;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v7 + 3;
        if (v7 + 3 >= v35) {
          return result;
        }
        unint64_t v21 = *(void *)(v34 + 8 * v22);
        if (!v21) {
          break;
        }
      }
    }

LABEL_18:
    unint64_t v13 = (v21 - 1) & v21;
    int64_t v43 = v22;
  }

  uint64_t v23 = v7 + 4;
  if (v7 + 4 >= v35) {
    return result;
  }
  unint64_t v21 = *(void *)(v34 + 8 * v23);
  if (v21)
  {
    int64_t v22 = v7 + 4;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v22 >= v35) {
      return result;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_18;
    }
  }

    uint64_t v52 = (v21 - 1) & v21;
    uint64_t v53 = v22;
  }

  uint64_t v23 = v8 + 4;
  if (v8 + 4 >= v43) {
    return result;
  }
  unint64_t v21 = *(void *)(v42 + 8 * v23);
  if (v21)
  {
    int64_t v22 = v8 + 4;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v22 >= v43) {
      return result;
    }
    unint64_t v21 = *(void *)(v42 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_18;
    }
  }

unint64_t sub_10001548C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000645C(&qword_100034F60);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (unint64_t i = (_BYTE *)(a1 + 48); ; i += 24)
    {
      unsigned __int8 v5 = *(i - 16);
      uint64_t v6 = *((void *)i - 1);
      char v7 = *i;
      unint64_t result = sub_100013100(v5);
      if ((v9 & 1) != 0) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
      *(_BYTE *)(v3[6] + result) = v5;
      uint64_t v10 = v3[7] + 16 * result;
      *(void *)uint64_t v10 = v6;
      *(_BYTE *)(v10 + 8) = v7;
      uint64_t v11 = v3[2];
      BOOL v12 = __OFADD__(v11, 1LL);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      v3[2] = v13;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }

    __break(1u);
LABEL_10:
    __break(1u);
  }

  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }

  return result;
}

uint64_t sub_10001556C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MLComputePlan.DeviceUsage.Reason.Category(0LL);
  uint64_t v109 = *(void *)(v2 - 8);
  uint64_t v110 = v2;
  ((void (*)(void))__chkstk_darwin)();
  v108 = (char *)&v100 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v107 = type metadata accessor for MLComputePlan.DeviceUsage.Reason(0LL);
  uint64_t v106 = *(void *)(v107 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v105 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000645C(&qword_100034F58);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for MLComputePlan.DeviceUsage.SupportState(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v120 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  v122 = (char *)&v100 - v12;
  __chkstk_darwin(v11);
  v126 = (char *)&v100 - v13;
  uint64_t v14 = type metadata accessor for MLComputeDevice(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  v116 = (char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v16);
  v119 = (char *)&v100 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  int64_t v22 = (char *)&v100 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = (char *)&v100 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  v123 = (char *)&v100 - v27;
  uint64_t v28 = MLComputePlan.DeviceUsage.supported.getter(v26);
  int64_t v30 = *(void *)(v28 + 16);
  v117 = v6;
  uint64_t v118 = a1;
  uint64_t v121 = v7;
  uint64_t v129 = v14;
  uint64_t v127 = v15;
  if (v30)
  {
    uint64_t v115 = v8;
    BOOL v31 = (uint64_t (*)(char *, uint64_t))v28;
    v130 = _swiftEmptyArrayStorage;
    sub_1000134FC(0, v30, 0);
    uint64_t v32 = *(unsigned __int8 *)(v15 + 80);
    Swift::Int v114 = v31;
    uint64_t v33 = (char *)v31 + ((v32 + 32) & ~v32);
    v128 = *(void (**)(char *, uint64_t))(v15 + 72);
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    uint64_t v35 = enum case for MLComputeDevice.cpu(_:);
    LODWORD(v125) = enum case for MLComputeDevice.gpu(_:);
    LODWORD(v124) = enum case for MLComputeDevice.neuralEngine(_:);
    do
    {
      uint64_t v36 = v129;
      v34(v25, v33, v129);
      v34(v22, v25, v36);
      uint64_t v37 = v127;
      int v38 = (*(uint64_t (**)(char *, uint64_t))(v127 + 88))(v22, v36);
      if (v38 == (_DWORD)v124) {
        char v39 = 2;
      }
      else {
        char v39 = 3;
      }
      if (v38 == (_DWORD)v125) {
        char v39 = 1;
      }
      uint64_t v40 = v35;
      if (v38 == (_DWORD)v35) {
        char v41 = 0;
      }
      else {
        char v41 = v39;
      }
      uint64_t v42 = *(void (**)(char *, uint64_t))(v37 + 8);
      v42(v22, v36);
      v42(v25, v36);
      int64_t v43 = v130;
      if ((swift_isUniquelyReferenced_nonNull_native(v130) & 1) == 0)
      {
        sub_1000134FC(0, v43[2] + 1LL, 1);
        int64_t v43 = v130;
      }

      unint64_t v46 = v43[2];
      unint64_t v45 = v43[3];
      if (v46 >= v45 >> 1)
      {
        sub_1000134FC(v45 > 1, v46 + 1, 1);
        int64_t v43 = v130;
      }

      v43[2] = v46 + 1;
      *((_BYTE *)v43 + v46 + 32) = v41;
      uint64_t v33 = (char *)v128 + (void)v33;
      --v30;
      uint64_t v35 = v40;
    }

    while (v30);
    unint64_t v100 = v43;
    uint64_t v47 = swift_bridgeObjectRelease(v114, v44);
    uint64_t v6 = v117;
    a1 = v118;
    uint64_t v7 = v121;
    uint64_t v8 = v115;
    uint64_t v14 = v129;
  }

  else
  {
    uint64_t v47 = swift_bridgeObjectRelease(v28, v29);
    LODWORD(v35) = enum case for MLComputeDevice.cpu(_:);
    unint64_t v100 = _swiftEmptyArrayStorage;
  }

  uint64_t v48 = v123;
  MLComputePlan.DeviceUsage.preferred.getter(v47);
  uint64_t v49 = v127;
  Swift::Int v114 = *(uint64_t (**)(char *, uint64_t))(v127 + 88);
  int v50 = v114(v48, v14);
  LODWORD(v115) = v35;
  BOOL v51 = v50 == (_DWORD)v35;
  uint64_t v52 = v119;
  if (v51)
  {
    int v102 = 0;
  }

  else
  {
    if (v50 == enum case for MLComputeDevice.gpu(_:))
    {
      int v53 = 1;
    }

    else if (v50 == enum case for MLComputeDevice.neuralEngine(_:))
    {
      int v53 = 2;
    }

    else
    {
      int v53 = 3;
    }

    int v102 = v53;
  }

  v128 = *(void (**)(char *, uint64_t))(v49 + 8);
  v128(v48, v14);
  uint64_t v54 = (void *)sub_10001548C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v55 = static MLComputeDevice.allComputeDevices.getter();
  uint64_t v56 = *(void *)(v55 + 16);
  uint64_t v101 = v55;
  if (!v56)
  {
LABEL_59:
    uint64_t v97 = type metadata accessor for MLComputePlan.DeviceUsage(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v97 - 8) + 8LL))(a1, v97);
    swift_bridgeObjectRelease(v101, v98);
    return (uint64_t)v100;
  }

  uint64_t v57 = v49;
  unint64_t v58 = v55 + ((*(unsigned __int8 *)(v49 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80));
  int v113 = enum case for MLComputeDevice.gpu(_:);
  int v112 = enum case for MLComputeDevice.neuralEngine(_:);
  int v111 = enum case for MLComputePlan.DeviceUsage.SupportState.unsupported(_:);
  int v104 = enum case for MLComputePlan.DeviceUsage.SupportState.supported(_:);
  unsigned int v103 = enum case for MLComputePlan.DeviceUsage.Reason.Category.unsupported(_:);
  uint64_t v125 = *(void *)(v57 + 72);
  uint64_t v127 = *(void *)(v57 + 16);
  uint64_t v59 = (void (*)(char *, char *, uint64_t))v127;
  ((void (*)(char *, unint64_t, uint64_t))v127)(v52, v58, v14);
  while (1)
  {
    MLComputePlan.DeviceUsage.supportState(for:)(v52);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
    {
      v128(v52, v14);
      sub_100017F68((uint64_t)v6, &qword_100034F58);
      goto LABEL_30;
    }

    uint64_t v60 = v126;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v126, v6, v7);
    uint64_t v61 = v52;
    BOOL v62 = v116;
    v59(v116, v61, v14);
    int v63 = v114(v62, v14);
    if (v63 == v112) {
      char v64 = 2;
    }
    else {
      char v64 = 3;
    }
    if (v63 == v113) {
      char v64 = 1;
    }
    unsigned __int8 v65 = v63 == (_DWORD)v115 ? 0 : v64;
    v128(v62, v14);
    uint64_t v66 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v67 = v122;
    v66(v122, v60, v7);
    uint64_t v68 = v120;
    v66(v120, v67, v7);
    int v69 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v68, v7);
    if (v69 == v111)
    {
      (*(void (**)(char *, uint64_t))(v8 + 96))(v68, v7);
      uint64_t v70 = v106;
      uint64_t v71 = v105;
      uint64_t v72 = v107;
      uint64_t v73 = (*(uint64_t (**)(char *, char *, uint64_t))(v106 + 32))(v105, v68, v107);
      char v74 = v108;
      uint64_t v75 = MLComputePlan.DeviceUsage.Reason.category.getter(v73);
      uint64_t v124 = MLComputePlan.DeviceUsage.Reason.Category.rawValue.getter(v75);
      uint64_t v76 = *(void (**)(char *, uint64_t))(v8 + 8);
      v76(v122, v121);
      (*(void (**)(char *, uint64_t))(v109 + 8))(v74, v110);
      uint64_t v77 = v72;
      uint64_t v78 = v76;
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v77);
    }

    else
    {
      if (v69 == v104)
      {
        BOOL v79 = v67;
        uint64_t v78 = *(void (**)(char *, uint64_t))(v8 + 8);
        v78(v79, v7);
        uint64_t v124 = 0LL;
        LODWORD(v123) = 1;
        goto LABEL_47;
      }

      uint64_t v81 = v109;
      uint64_t v80 = v110;
      uint64_t v82 = v108;
      uint64_t v83 = (*(uint64_t (**)(char *, void, uint64_t))(v109 + 104))(v108, v103, v110);
      uint64_t v124 = MLComputePlan.DeviceUsage.Reason.Category.rawValue.getter(v83);
      uint64_t v78 = *(void (**)(char *, uint64_t))(v8 + 8);
      v78(v122, v7);
      (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v80);
      v78(v120, v7);
    }

    LODWORD(v123) = 0;
LABEL_47:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v54);
    v130 = v54;
    unint64_t v86 = sub_100013100(v65);
    uint64_t v87 = v54[2];
    BOOL v88 = (v85 & 1) == 0;
    uint64_t v89 = v87 + v88;
    if (__OFADD__(v87, v88)) {
      break;
    }
    char v90 = v85;
    if (v54[3] >= v89)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v14 = v129;
        uint64_t v54 = v130;
        if ((v85 & 1) == 0) {
          goto LABEL_56;
        }
      }

      else
      {
        sub_100015048();
        uint64_t v14 = v129;
        uint64_t v54 = v130;
        if ((v90 & 1) == 0) {
          goto LABEL_56;
        }
      }
    }

    else
    {
      sub_100014A18(v89, isUniquelyReferenced_nonNull_native);
      unint64_t v91 = sub_100013100(v65);
      if ((v90 & 1) != (v85 & 1)) {
        goto LABEL_62;
      }
      unint64_t v86 = v91;
      uint64_t v14 = v129;
      uint64_t v54 = v130;
      if ((v90 & 1) == 0)
      {
LABEL_56:
        v54[(v86 >> 6) + 8] |= 1LL << v86;
        *(_BYTE *)(v54[6] + v86) = v65;
        uint64_t v93 = v54[7] + 16 * v86;
        *(void *)uint64_t v93 = v124;
        *(_BYTE *)(v93 + 8) = (_BYTE)v123;
        uint64_t v94 = v54[2];
        BOOL v95 = __OFADD__(v94, 1LL);
        uint64_t v96 = v94 + 1;
        if (v95) {
          goto LABEL_61;
        }
        v54[2] = v96;
        goto LABEL_58;
      }
    }

    uint64_t v92 = v54[7] + 16 * v86;
    *(void *)uint64_t v92 = v124;
    *(_BYTE *)(v92 + 8) = (_BYTE)v123;
LABEL_58:
    swift_bridgeObjectRelease(0x8000000000000000LL, v85);
    uint64_t v7 = v121;
    v78(v126, v121);
    uint64_t v52 = v119;
    v128(v119, v14);
    uint64_t v6 = v117;
    a1 = v118;
LABEL_30:
    v58 += v125;
    --v56;
    uint64_t v59 = (void (*)(char *, char *, uint64_t))v127;
    if (!v56) {
      goto LABEL_59;
    }
    ((void (*)(char *, unint64_t, uint64_t))v127)(v52, v58, v14);
  }

  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&_s13ComputeDeviceVN);
  __break(1u);
  return result;
}

void *sub_100015E70(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000645C(&qword_100034F50);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = type metadata accessor for MLComputePlan.DeviceUsage(0LL);
  uint64_t v8 = *(void *)(v50 - 8);
  uint64_t v9 = __chkstk_darwin(v50);
  int64_t v43 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v42 = (char *)&v41 - v11;
  uint64_t v51 = type metadata accessor for MLModelStructure.NeuralNetwork.Layer(0LL);
  uint64_t v12 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = _swiftEmptyArrayStorage;
  if (v15)
  {
    uint64_t v41 = v2;
    uint64_t v59 = _swiftEmptyArrayStorage;
    sub_1000134C4(0, v15, 0);
    uint64_t v17 = v12;
    uint64_t v18 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v45 = *(void *)(v17 + 72);
    uint64_t v46 = v17;
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    uint64_t v48 = v7;
    uint64_t v49 = a2;
    uint64_t v47 = v8;
    uint64_t v19 = v51;
    do
    {
      v44(v14, v18, v19);
      uint64_t v20 = swift_retain(a2);
      uint64_t v21 = MLModelStructure.NeuralNetwork.Layer.name.getter(v20);
      uint64_t v57 = v22;
      uint64_t v58 = v21;
      uint64_t v23 = MLModelStructure.NeuralNetwork.Layer.type.getter();
      uint64_t v55 = v24;
      uint64_t v56 = v23;
      uint64_t v54 = MLModelStructure.NeuralNetwork.Layer.inputNames.getter();
      uint64_t v53 = MLModelStructure.NeuralNetwork.Layer.outputNames.getter();
      dispatch thunk of MLComputePlan.deviceUsage(for:)(v14);
      uint64_t v25 = v50;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1LL, v50) == 1)
      {
        swift_release(a2);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v19);
        sub_100017F68((uint64_t)v7, &qword_100034F50);
        uint64_t v52 = 0LL;
        uint64_t v26 = 0LL;
        uint64_t v27 = 0LL;
      }

      else
      {
        uint64_t v28 = v42;
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v42, v7, v25);
        uint64_t v29 = (uint64_t)v43;
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v43, v28, v25);
        uint64_t v30 = v8;
        uint64_t v52 = sub_10001556C(v29);
        LOBYTE(v29) = v31;
        uint64_t v27 = v32;
        swift_release(a2);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v51);
        uint64_t v33 = v28;
        uint64_t v19 = v51;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v25);
        uint64_t v26 = v29;
      }

      uint64_t v16 = v59;
      if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0)
      {
        sub_1000134C4(0, v16[2] + 1LL, 1);
        uint64_t v16 = v59;
      }

      unint64_t v35 = v16[2];
      unint64_t v34 = v16[3];
      if (v35 >= v34 >> 1)
      {
        sub_1000134C4(v34 > 1, v35 + 1, 1);
        uint64_t v16 = v59;
      }

      _OWORD v16[2] = v35 + 1;
      uint64_t v36 = &v16[9 * v35];
      uint64_t v37 = v57;
      v36[4] = v58;
      v36[5] = v37;
      uint64_t v38 = v55;
      v36[6] = v56;
      v36[7] = v38;
      uint64_t v39 = v53;
      v36[8] = v54;
      v36[9] = v39;
      v36[10] = v52;
      v36[11] = v26;
      v36[12] = v27;
      v18 += v45;
      --v15;
      uint64_t v7 = v48;
      a2 = v49;
      uint64_t v8 = v47;
    }

    while (v15);
  }

  return v16;
}

uint64_t sub_1000161CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MLModelStructure.Program.Binding(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (uint64_t *)((char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = MLModelStructure.Program.Argument.bindings.getter(v7);
  int64_t v11 = *(void *)(v10 + 16);
  uint64_t v12 = _swiftEmptyArrayStorage;
  if (!v11)
  {
LABEL_13:
    uint64_t v24 = type metadata accessor for MLModelStructure.Program.Argument(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8LL))(a1, v24);
    swift_bridgeObjectRelease(v10, v25);
    return (uint64_t)v12;
  }

  uint64_t v29 = a1;
  unint64_t v35 = _swiftEmptyArrayStorage;
  sub_10001357C(0, v11, 0);
  unint64_t v13 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v28 = v10;
  unint64_t v14 = v10 + v13;
  uint64_t v15 = *(void *)(v3 + 72);
  uint64_t v32 = *(void (**)(uint64_t *, char *, uint64_t))(v3 + 16);
  uint64_t v33 = v15;
  int v31 = enum case for MLModelStructure.Program.Binding.value(_:);
  int v30 = enum case for MLModelStructure.Program.Binding.name(_:);
  uint64_t v34 = v3;
  while (1)
  {
    uint64_t v16 = v32;
    v32((uint64_t *)v9, (char *)v14, v2);
    v16(v6, v9, v2);
    int v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
    if (v17 != v31) {
      break;
    }
    uint64_t v18 = *(void (**)(uint64_t *, uint64_t))(v3 + 8);
    v18(v6, v2);
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
LABEL_7:
    v18((uint64_t *)v9, v2);
    uint64_t v12 = v35;
    if ((swift_isUniquelyReferenced_nonNull_native(v35) & 1) == 0)
    {
      sub_10001357C(0, v12[2] + 1LL, 1);
      uint64_t v12 = v35;
    }

    unint64_t v22 = v12[2];
    unint64_t v21 = v12[3];
    if (v22 >= v21 >> 1)
    {
      sub_10001357C(v21 > 1, v22 + 1, 1);
      uint64_t v12 = v35;
    }

    v12[2] = v22 + 1;
    uint64_t v23 = &v12[2 * v22];
    v23[4] = v19;
    v23[5] = v20;
    uint64_t v3 = v34;
    v14 += v33;
    if (!--v11)
    {
      uint64_t v10 = v28;
      a1 = v29;
      goto LABEL_13;
    }
  }

  if (v17 == v30)
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    uint64_t v19 = *v6;
    uint64_t v20 = v6[1];
    uint64_t v18 = *(void (**)(uint64_t *, uint64_t))(v3 + 8);
    goto LABEL_7;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v2, v2);
  __break(1u);
  return result;
}

void *sub_100016424(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = type metadata accessor for MLModelStructure.Program.Block(0LL);
  uint64_t v5 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v24 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = _swiftEmptyArrayStorage;
  if (v7)
  {
    v21[1] = v2;
    uint64_t v26 = _swiftEmptyArrayStorage;
    sub_1000135E0(0, v7, 0);
    uint64_t v8 = v26;
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v10 = *(void *)(v5 + 72);
    unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v23 = v10;
    do
    {
      int64_t v11 = v24;
      v22(v24, v9, v25);
      swift_retain(a2);
      uint64_t v12 = sub_100016D34(v11, a2);
      uint64_t v14 = v13;
      uint64_t v16 = v15;
      swift_release(a2);
      uint64_t v26 = v8;
      unint64_t v18 = v8[2];
      unint64_t v17 = v8[3];
      if (v18 >= v17 >> 1)
      {
        sub_1000135E0(v17 > 1, v18 + 1, 1);
        uint64_t v8 = v26;
      }

      v8[2] = v18 + 1;
      uint64_t v19 = &v8[3 * v18];
      void v19[4] = v12;
      v19[5] = v14;
      v19[6] = v16;
      v9 += v23;
      --v7;
    }

    while (v7);
  }

  return v8;
}

uint64_t sub_10001659C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v98 = a2;
  uint64_t v5 = sub_10000645C(&qword_100034F88);
  __chkstk_darwin(v5);
  uint64_t v96 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v97 = type metadata accessor for MLComputePlan.Cost(0LL);
  uint64_t v95 = *(void *)(v97 - 8);
  uint64_t v7 = __chkstk_darwin(v97);
  uint64_t v87 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  BOOL v88 = (char *)&v81 - v9;
  uint64_t v10 = type metadata accessor for MLModelStructure.Program.ValueType(0LL);
  uint64_t v105 = *(void *)(v10 - 8);
  uint64_t v106 = v10;
  __chkstk_darwin(v10);
  int v104 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for MLModelStructure.Program.NamedValueType(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  unsigned int v103 = (char *)&v81 - v17;
  uint64_t v18 = sub_10000645C(&qword_100034F50);
  __chkstk_darwin(v18);
  uint64_t v89 = (char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v91 = type metadata accessor for MLComputePlan.DeviceUsage(0LL);
  uint64_t v90 = *(void *)(v91 - 8);
  uint64_t v20 = __chkstk_darwin(v91);
  uint64_t v85 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v20);
  unint64_t v86 = (char *)&v81 - v23;
  uint64_t v24 = MLModelStructure.Program.Operation.operatorName.getter(v22);
  uint64_t v93 = v25;
  uint64_t v94 = v24;
  uint64_t v26 = MLModelStructure.Program.Operation.inputs.getter();
  uint64_t v92 = sub_1000151E4(v26);
  uint64_t v28 = swift_bridgeObjectRelease(v26, v27);
  uint64_t v29 = MLModelStructure.Program.Operation.outputs.getter(v28);
  uint64_t v31 = v29;
  int64_t v32 = *(void *)(v29 + 16);
  uint64_t v99 = a1;
  if (v32)
  {
    uint64_t v83 = 0LL;
    uint64_t v84 = a3;
    uint64_t v107 = _swiftEmptyArrayStorage;
    sub_1000135B4(0, v32, 0);
    unint64_t v33 = (*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v82 = v31;
    unint64_t v34 = v31 + v33;
    uint64_t v35 = *(void *)(v13 + 72);
    unint64_t v100 = *(uint64_t (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v101 = v35;
    uint64_t v102 = v13;
    do
    {
      uint64_t v36 = v103;
      uint64_t v37 = v100;
      v100(v103, (char *)v34, v12);
      uint64_t v38 = v37(v16, v36, v12);
      uint64_t v39 = MLModelStructure.Program.NamedValueType.name.getter(v38);
      uint64_t v41 = v40;
      uint64_t v42 = v104;
      MLModelStructure.Program.NamedValueType.type.getter();
      (*(void (**)(char *, uint64_t))(v105 + 8))(v42, v106);
      int64_t v43 = *(void (**)(char *, uint64_t))(v13 + 8);
      v43(v16, v12);
      v43(v36, v12);
      uint64_t v44 = v107;
      if ((swift_isUniquelyReferenced_nonNull_native(v107) & 1) == 0)
      {
        sub_1000135B4(0, v44[2] + 1LL, 1);
        uint64_t v44 = v107;
      }

      unint64_t v47 = v44[2];
      unint64_t v46 = v44[3];
      if (v47 >= v46 >> 1)
      {
        sub_1000135B4(v46 > 1, v47 + 1, 1);
        uint64_t v44 = v107;
      }

      v44[2] = v47 + 1;
      uint64_t v48 = &v44[2 * v47];
      v48[4] = v39;
      v48[5] = v41;
      uint64_t v13 = v102;
      v34 += v101;
      --v32;
    }

    while (v32);
    uint64_t v49 = swift_bridgeObjectRelease(v82, v45);
    a3 = v84;
    a1 = v99;
  }

  else
  {
    uint64_t v49 = swift_bridgeObjectRelease(v29, v30);
    uint64_t v44 = _swiftEmptyArrayStorage;
  }

  uint64_t v50 = MLModelStructure.Program.Operation.blocks.getter(v49);
  uint64_t v51 = v98;
  swift_retain(v98);
  uint64_t v52 = sub_100016424(v50, v51);
  swift_bridgeObjectRelease(v50, v53);
  swift_release(v51);
  uint64_t v54 = (uint64_t)v89;
  dispatch thunk of MLComputePlan.deviceUsage(for:)(a1);
  uint64_t v55 = v90;
  uint64_t v56 = v91;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48))(v54, 1LL, v91) == 1)
  {
    sub_100017F68(v54, &qword_100034F50);
    uint64_t v57 = 0LL;
    uint64_t v105 = 0LL;
    uint64_t v106 = 0LL;
  }

  else
  {
    uint64_t v58 = v86;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v86, v54, v56);
    uint64_t v59 = (uint64_t)v85;
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v85, v58, v56);
    uint64_t v57 = sub_10001556C(v59);
    LOBYTE(v59) = v60;
    uint64_t v106 = v61;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v58, v56);
    uint64_t v105 = v59;
  }

  uint64_t v62 = v95;
  uint64_t v63 = (uint64_t)v96;
  dispatch thunk of MLComputePlan.estimatedCost(of:)(a1);
  uint64_t v64 = v97;
  int v65 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v63, 1LL, v97);
  if (v65 == 1)
  {
    swift_release(v51);
    uint64_t v66 = type metadata accessor for MLModelStructure.Program.Operation(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v66 - 8) + 8LL))(a1, v66);
    uint64_t result = sub_100017F68(v63, &qword_100034F88);
    double v68 = 0.0;
  }

  else
  {
    int v69 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 32);
    int v104 = (char *)v57;
    uint64_t v70 = v88;
    v69(v88, v63, v64);
    uint64_t v71 = v52;
    uint64_t v72 = v87;
    uint64_t v73 = (*(uint64_t (**)(char *, char *, uint64_t))(v62 + 16))(v87, v70, v64);
    uint64_t v74 = v64;
    double v68 = MLComputePlan.Cost.weight.getter(v73);
    uint64_t v75 = *(void (**)(char *, uint64_t))(v62 + 8);
    uint64_t v76 = v72;
    uint64_t v52 = v71;
    v75(v76, v74);
    swift_release(v51);
    uint64_t v77 = type metadata accessor for MLModelStructure.Program.Operation(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v77 - 8) + 8LL))(v99, v77);
    uint64_t v78 = v70;
    uint64_t v57 = (uint64_t)v104;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v75)(v78, v74);
  }

  uint64_t v79 = v93;
  *(void *)a3 = v94;
  *(void *)(a3 + 8) = v79;
  *(void *)(a3 + 16) = v92;
  *(void *)(a3 + 24) = v44;
  *(void *)(a3 + 32) = v52;
  *(void *)(a3 + 40) = v57;
  uint64_t v80 = v106;
  *(void *)(a3 + 48) = v105;
  *(void *)(a3 + 56) = v80;
  *(double *)(a3 + 64) = v68;
  *(_BYTE *)(a3 + 72) = v65 == 1;
  return result;
}

void *sub_100016BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = type metadata accessor for MLModelStructure.Program.Operation(0LL);
  uint64_t v5 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = _swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v20 = v2;
    uint64_t v24 = _swiftEmptyArrayStorage;
    sub_100013598(0, v8, 0);
    uint64_t v9 = v24;
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v11 = *(void *)(v5 + 72);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    do
    {
      v12(v7, v10, v21);
      swift_retain(a2);
      sub_10001659C((uint64_t)v7, a2, (uint64_t)v22);
      uint64_t v24 = v9;
      unint64_t v14 = v9[2];
      unint64_t v13 = v9[3];
      if (v14 >= v13 >> 1)
      {
        sub_100013598(v13 > 1, v14 + 1, 1);
        uint64_t v9 = v24;
      }

      v9[2] = v14 + 1;
      uint64_t v15 = &v9[10 * v14];
      v15[2] = v22[0];
      __int128 v16 = v22[1];
      __int128 v17 = v22[2];
      __int128 v18 = v23[0];
      *(_OWORD *)((char *)v15 + 89) = *(_OWORD *)((char *)v23 + 9);
      v15[4] = v17;
      v15[5] = v18;
      v15[3] = v16;
      v10 += v11;
      --v8;
    }

    while (v8);
  }

  return v9;
}

void *sub_100016D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MLModelStructure.Program.ValueType(0LL);
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  unint64_t v46 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MLModelStructure.Program.NamedValueType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v45 = (char *)&v38 - v12;
  uint64_t v13 = MLModelStructure.Program.Block.inputs.getter(v11);
  uint64_t v15 = v13;
  int64_t v16 = *(void *)(v13 + 16);
  if (v16)
  {
    uint64_t v40 = a2;
    uint64_t v41 = a1;
    uint64_t v49 = _swiftEmptyArrayStorage;
    sub_1000135B4(0, v16, 0);
    unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v39 = v15;
    unint64_t v18 = v15 + v17;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v42 = *(uint64_t (**)(char *, char *, uint64_t))(v7 + 16);
    uint64_t v43 = v19;
    uint64_t v44 = v7;
    do
    {
      uint64_t v20 = v45;
      uint64_t v21 = v42;
      v42(v45, (char *)v18, v6);
      uint64_t v22 = v21(v10, v20, v6);
      uint64_t v23 = MLModelStructure.Program.NamedValueType.name.getter(v22);
      uint64_t v25 = v24;
      uint64_t v26 = v46;
      MLModelStructure.Program.NamedValueType.type.getter();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v48);
      uint64_t v27 = *(void (**)(char *, uint64_t))(v7 + 8);
      v27(v10, v6);
      v27(v20, v6);
      uint64_t v28 = v49;
      if ((swift_isUniquelyReferenced_nonNull_native(v49) & 1) == 0)
      {
        sub_1000135B4(0, v28[2] + 1LL, 1);
        uint64_t v28 = v49;
      }

      unint64_t v31 = v28[2];
      unint64_t v30 = v28[3];
      if (v31 >= v30 >> 1)
      {
        sub_1000135B4(v30 > 1, v31 + 1, 1);
        uint64_t v28 = v49;
      }

      v28[2] = v31 + 1;
      int64_t v32 = &v28[2 * v31];
      v32[4] = v23;
      v32[5] = v25;
      uint64_t v7 = v44;
      v18 += v43;
      --v16;
    }

    while (v16);
    uint64_t v33 = swift_bridgeObjectRelease(v39, v29);
    a2 = v40;
    a1 = v41;
  }

  else
  {
    uint64_t v33 = swift_bridgeObjectRelease(v13, v14);
    uint64_t v28 = _swiftEmptyArrayStorage;
  }

  MLModelStructure.Program.Block.outputNames.getter(v33);
  uint64_t v34 = MLModelStructure.Program.Block.operations.getter();
  swift_retain(a2);
  sub_100016BC4(v34, a2);
  swift_release(a2);
  uint64_t v35 = type metadata accessor for MLModelStructure.Program.Block(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8LL))(a1, v35);
  swift_bridgeObjectRelease(v34, v36);
  return v28;
}

void *sub_100016FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MLModelStructure.Program.ValueType(0LL);
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  __chkstk_darwin(v4);
  uint64_t v47 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MLModelStructure.Program.NamedValueType(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  unint64_t v46 = (char *)&v39 - v11;
  uint64_t v12 = type metadata accessor for MLModelStructure.Program.Block(0LL);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = MLModelStructure.Program.Function.inputs.getter(v13);
  uint64_t v18 = v16;
  int64_t v19 = *(void *)(v16 + 16);
  if (v19)
  {
    uint64_t v40 = v15;
    uint64_t v41 = a2;
    uint64_t v42 = a1;
    uint64_t v50 = _swiftEmptyArrayStorage;
    sub_1000135B4(0, v19, 0);
    unint64_t v20 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v39 = v18;
    unint64_t v21 = v18 + v20;
    uint64_t v22 = *(void *)(v7 + 72);
    uint64_t v43 = *(uint64_t (**)(char *, char *, uint64_t))(v7 + 16);
    uint64_t v44 = v22;
    uint64_t v45 = v7;
    do
    {
      uint64_t v23 = v46;
      uint64_t v24 = v43;
      v43(v46, (char *)v21, v6);
      uint64_t v25 = v24(v10, v23, v6);
      uint64_t v26 = MLModelStructure.Program.NamedValueType.name.getter(v25);
      uint64_t v28 = v27;
      uint64_t v29 = v47;
      MLModelStructure.Program.NamedValueType.type.getter();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v49);
      unint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
      v30(v10, v6);
      v30(v23, v6);
      unint64_t v31 = v50;
      if ((swift_isUniquelyReferenced_nonNull_native(v50) & 1) == 0)
      {
        sub_1000135B4(0, v31[2] + 1LL, 1);
        unint64_t v31 = v50;
      }

      unint64_t v34 = v31[2];
      unint64_t v33 = v31[3];
      if (v34 >= v33 >> 1)
      {
        sub_1000135B4(v33 > 1, v34 + 1, 1);
        unint64_t v31 = v50;
      }

      v31[2] = v34 + 1;
      uint64_t v35 = &v31[2 * v34];
      v35[4] = v26;
      v35[5] = v28;
      uint64_t v7 = v45;
      v21 += v44;
      --v19;
    }

    while (v19);
    uint64_t v36 = swift_bridgeObjectRelease(v39, v32);
    a2 = v41;
    a1 = v42;
    uint64_t v15 = v40;
  }

  else
  {
    uint64_t v36 = swift_bridgeObjectRelease(v16, v17);
    unint64_t v31 = _swiftEmptyArrayStorage;
  }

  MLModelStructure.Program.Function.block.getter(v36);
  sub_100016D34((uint64_t)v15, a2);
  uint64_t v37 = type metadata accessor for MLModelStructure.Program.Function(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v37 - 8) + 8LL))(a1, v37);
  return v31;
}

void *sub_1000172AC(uint64_t a1, uint64_t a2)
{
  uint64_t v51 = a2;
  uint64_t v3 = type metadata accessor for MLModelStructure.Program.Function(0LL);
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v47 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  unint64_t v46 = (char *)&v41 - v6;
  sub_10000645C(&qword_100034F80);
  uint64_t result = (void *)static _DictionaryStorage.copy(original:)(a1);
  int64_t v8 = 0LL;
  uint64_t v50 = a1;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = a1 + 64;
  uint64_t v9 = v11;
  uint64_t v12 = 1LL << *(_BYTE *)(v10 - 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & v9;
  uint64_t v42 = v10;
  int64_t v43 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v44 = result + 8;
  uint64_t v45 = result;
  uint64_t v15 = v48;
  uint64_t v16 = v49;
  uint64_t v17 = v46;
  uint64_t v18 = v51;
  if (!v14) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v52 = (v14 - 1) & v14;
  int64_t v53 = v8;
  for (unint64_t i = __clz(__rbit64(v14)) | (v8 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v55 = 16 * i;
    uint64_t v24 = *(void *)(v50 + 56);
    uint64_t v25 = (uint64_t *)(*(void *)(v50 + 48) + 16 * i);
    uint64_t v26 = v25[1];
    uint64_t v56 = *v25;
    uint64_t v27 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    v27(v17, v24 + *(void *)(v15 + 72) * i, v16);
    uint64_t v28 = (uint64_t)v47;
    v27(v47, (unint64_t)v17, v16);
    swift_bridgeObjectRetain(v26);
    swift_retain(v18);
    uint64_t v29 = sub_100016FDC(v28, v18);
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v54 = v34;
    swift_release(v18);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v16);
    uint64_t result = v45;
    *(void *)((char *)v44 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    uint64_t v35 = (void *)(result[6] + v55);
    *uint64_t v35 = v56;
    v35[1] = v26;
    uint64_t v36 = (void *)(result[7] + 32 * i);
    *uint64_t v36 = v29;
    v36[1] = v31;
    uint64_t v37 = v54;
    v36[2] = v33;
    v36[3] = v37;
    uint64_t v38 = result[2];
    BOOL v39 = __OFADD__(v38, 1LL);
    uint64_t v40 = v38 + 1;
    if (v39)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    result[2] = v40;
    unint64_t v14 = v52;
    int64_t v8 = v53;
    if (v52) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v20 = v8 + 1;
    if (__OFADD__(v8, 1LL)) {
      goto LABEL_24;
    }
    if (v20 >= v43) {
      return result;
    }
    unint64_t v21 = *(void *)(v42 + 8 * v20);
    int64_t v22 = v8 + 1;
    if (!v21)
    {
      int64_t v22 = v8 + 2;
      if (v8 + 2 >= v43) {
        return result;
      }
      unint64_t v21 = *(void *)(v42 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v8 + 3;
        if (v8 + 3 >= v43) {
          return result;
        }
        unint64_t v21 = *(void *)(v42 + 8 * v22);
        if (!v21) {
          break;
        }
      }
    }

uint64_t sub_100017594(uint64_t a1, uint64_t a2)
{
  uint64_t v76 = a2;
  uint64_t v4 = type metadata accessor for MLModelStructure.Program(0LL);
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v70 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  double v68 = &v60[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v5);
  uint64_t v67 = &v60[-v7];
  uint64_t v64 = type metadata accessor for MLModelStructure.Pipeline(0LL);
  uint64_t v63 = *(void *)(v64 - 8);
  uint64_t v8 = __chkstk_darwin(v64);
  uint64_t v62 = &v60[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8);
  uint64_t v66 = &v60[-v10];
  uint64_t v11 = type metadata accessor for MLModelStructure.NeuralNetwork(0LL);
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v75 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v73 = &v60[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v12);
  uint64_t v72 = &v60[-v14];
  uint64_t v15 = type metadata accessor for MLModelStructure(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v82 = &v60[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  int64_t v18 = *(void *)(a1 + 16);
  int64_t v19 = _swiftEmptyArrayStorage;
  if (!v18) {
    return (uint64_t)v19;
  }
  uint64_t v83 = v2;
  uint64_t v85 = _swiftEmptyArrayStorage;
  sub_1000134E0(0, v18, 0);
  uint64_t v20 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v79 = *(void *)(v16 + 72);
  uint64_t v78 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16);
  int v77 = enum case for MLModelStructure.neuralNetwork(_:);
  int v71 = enum case for MLModelStructure.program(_:);
  int v65 = enum case for MLModelStructure.pipeline(_:);
  int v61 = enum case for MLModelStructure.unsupported(_:);
  uint64_t v80 = v16;
  uint64_t v81 = v15;
  while (1)
  {
    unint64_t v21 = v82;
    v78(v82, v20, v15);
    int v22 = (*(uint64_t (**)(_BYTE *, uint64_t))(v16 + 88))(v21, v15);
    if (v22 != v77) {
      break;
    }
    (*(void (**)(_BYTE *, uint64_t))(v16 + 96))(v21, v15);
    uint64_t v23 = v74;
    uint64_t v24 = v75;
    uint64_t v25 = v72;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v74 + 32))(v72, v21, v75);
    uint64_t v26 = v73;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v23 + 16))(v73, v25, v24);
    uint64_t v27 = v76;
    uint64_t v28 = swift_retain(v76);
    uint64_t v29 = MLModelStructure.NeuralNetwork.layers.getter(v28);
    swift_retain(v27);
    uint64_t v30 = v83;
    uint64_t v31 = (uint64_t)sub_100015E70(v29, v27);
    uint64_t v83 = v30;
    swift_release(v27);
    uint64_t v32 = *(void (**)(_BYTE *, uint64_t))(v23 + 8);
    v32(v26, v24);
    swift_release(v27);
    swift_bridgeObjectRelease(v29, v33);
    v32(v25, v24);
    uint64_t v34 = 0LL;
    char v35 = 0;
LABEL_11:
    int64_t v19 = v85;
    if ((swift_isUniquelyReferenced_nonNull_native(v85) & 1) == 0)
    {
      sub_1000134E0(0, v19[2] + 1LL, 1);
      int64_t v19 = v85;
    }

    uint64_t v16 = v80;
    unint64_t v57 = v19[2];
    unint64_t v56 = v19[3];
    if (v57 >= v56 >> 1)
    {
      sub_1000134E0(v56 > 1, v57 + 1, 1);
      int64_t v19 = v85;
    }

    v19[2] = v57 + 1;
    uint64_t v58 = &v19[3 * v57];
    v58[4] = v31;
    v58[5] = v34;
    *((_BYTE *)v58 + 48) = v35;
    v20 += v79;
    --v18;
    uint64_t v15 = v81;
    if (!v18) {
      return (uint64_t)v19;
    }
  }

  if (v22 == v71)
  {
    (*(void (**)(_BYTE *, uint64_t))(v16 + 96))(v21, v15);
    uint64_t v37 = v69;
    uint64_t v36 = v70;
    uint64_t v38 = v67;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v69 + 32))(v67, v21, v70);
    BOOL v39 = v68;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 16))(v68, v38, v36);
    uint64_t v40 = v76;
    uint64_t v41 = swift_retain(v76);
    uint64_t v42 = MLModelStructure.Program.functions.getter(v41);
    swift_retain(v40);
    uint64_t v43 = v83;
    uint64_t v31 = (uint64_t)sub_1000172AC(v42, v40);
    uint64_t v83 = v43;
    swift_bridgeObjectRelease(v42, v44);
    swift_release(v40);
    uint64_t v45 = *(void (**)(_BYTE *, uint64_t))(v37 + 8);
    v45(v39, v36);
    swift_release(v40);
    v45(v38, v36);
    uint64_t v34 = 0LL;
    char v35 = 1;
    goto LABEL_11;
  }

  if (v22 == v65)
  {
    (*(void (**)(_BYTE *, uint64_t))(v16 + 96))(v21, v15);
    uint64_t v46 = v63;
    uint64_t v47 = v66;
    uint64_t v48 = v64;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v63 + 32))(v66, v21, v64);
    uint64_t v49 = v62;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 16))(v62, v47, v48);
    uint64_t v50 = v76;
    uint64_t v51 = swift_retain(v76);
    uint64_t v31 = MLModelStructure.Pipeline.subModelNames.getter(v51);
    uint64_t v52 = MLModelStructure.Pipeline.subModels.getter();
    swift_retain(v50);
    uint64_t v53 = v83;
    uint64_t v34 = sub_100017594(v52, v50, v84);
    uint64_t v83 = v53;
    swift_release(v50);
    uint64_t v54 = *(void (**)(_BYTE *, uint64_t))(v46 + 8);
    v54(v49, v48);
    swift_release(v50);
    swift_bridgeObjectRelease(v52, v55);
    v54(v66, v48);
    char v35 = 2;
    goto LABEL_11;
  }

  if (v22 == v61)
  {
    uint64_t v34 = 0LL;
    char v35 = 3;
    uint64_t v31 = 1LL;
    goto LABEL_11;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v81, v81);
  __break(1u);
  return result;
}

uint64_t sub_100017B34(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MLModelStructure.Program(0LL);
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v54 = (char *)&v50 - v6;
  uint64_t v7 = type metadata accessor for MLModelStructure.Pipeline(0LL);
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v50 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v51 = (char *)&v50 - v10;
  uint64_t v11 = type metadata accessor for MLModelStructure.NeuralNetwork(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v50 - v16;
  uint64_t v18 = type metadata accessor for MLModelStructure(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  int v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MLComputePlan.modelStructure.getter(v20);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v22, v18);
  if (v23 == enum case for MLModelStructure.neuralNetwork(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v22, v18);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v22, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    uint64_t v24 = swift_retain(a1);
    uint64_t v25 = MLModelStructure.NeuralNetwork.layers.getter(v24);
    swift_retain(a1);
    uint64_t v26 = sub_100015E70(v25, a1);
    swift_release(a1);
    uint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v15, v11);
    swift_release(a1);
    swift_bridgeObjectRelease(v25, v28);
    v27(v17, v11);
    return (uint64_t)v26;
  }

  if (v23 == enum case for MLModelStructure.program(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v22, v18);
    uint64_t v30 = v54;
    uint64_t v29 = v55;
    uint64_t v31 = v22;
    uint64_t v32 = v56;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v54, v31, v56);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v5, v30, v32);
    uint64_t v33 = swift_retain(a1);
    uint64_t v34 = MLModelStructure.Program.functions.getter(v33);
    swift_retain(a1);
    char v35 = sub_1000172AC(v34, a1);
    swift_bridgeObjectRelease(v34, v36);
    swift_release(a1);
    uint64_t v37 = *(void (**)(char *, uint64_t))(v29 + 8);
    v37(v5, v32);
    swift_release(a1);
    uint64_t v38 = v32;
    uint64_t v26 = v35;
    v37(v30, v38);
    return (uint64_t)v26;
  }

  if (v23 == enum case for MLModelStructure.pipeline(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v22, v18);
    uint64_t v40 = v51;
    uint64_t v39 = v52;
    uint64_t v41 = v53;
    (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v51, v22, v53);
    uint64_t v42 = v50;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v50, v40, v41);
    uint64_t v43 = swift_retain(a1);
    uint64_t v44 = MLModelStructure.Pipeline.subModelNames.getter(v43);
    uint64_t v45 = MLModelStructure.Pipeline.subModels.getter();
    swift_retain(a1);
    sub_100017594(v45, a1);
    swift_release(a1);
    uint64_t v46 = *(void (**)(char *, uint64_t))(v39 + 8);
    v46(v42, v41);
    swift_release(a1);
    uint64_t v47 = v45;
    uint64_t v26 = (void *)v44;
    swift_bridgeObjectRelease(v47, v48);
    v46(v40, v41);
    return (uint64_t)v26;
  }

  if (v23 == enum case for MLModelStructure.unsupported(_:)) {
    return 1LL;
  }
  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v18, v18);
  __break(1u);
  return result;
}

uint64_t sub_100017F68(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000645C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_100017FA4()
{
  unint64_t result = qword_100034FE0;
  if (!qword_100034FE0)
  {
    type metadata accessor for CFString(255LL);
    unint64_t result = swift_getWitnessTable(&unk_100025910, v1);
    atomic_store(result, (unint64_t *)&qword_100034FE0);
  }

  return result;
}

uint64_t sub_100017FEC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100018028(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001805C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000645C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000180A0()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  char v60 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v55 - v5;
  uint64_t v7 = URL.pathComponents.getter(v4);
  uint64_t v9 = v7;
  unint64_t v10 = *(void *)(v7 + 16);
  if (v10 <= 3)
  {
    uint64_t v11 = swift_bridgeObjectRelease(v7, v8);
    uint64_t v12 = static os_log_type_t.debug.getter(v11);
    if (qword_100034908 != -1) {
      swift_once(&qword_100034908, sub_100003470);
    }
    uint64_t v13 = qword_100035878;
    uint64_t v14 = sub_10000645C(&qword_100034A28);
    uint64_t v15 = swift_allocObject(v14, 72LL, 7LL);
    *(_OWORD *)(v15 + 16) = xmmword_1000253B0;
    uint64_t v16 = URL.path.getter(v15);
    uint64_t v18 = v17;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = sub_100007D1C();
    *(void *)(v15 + 32) = v16;
    *(void *)(v15 + 40) = v18;
    os_log(_:dso:log:_:_:)(v12, &_mh_execute_header, v13, "Symlink failure code 1: %@", 26LL, 2LL, v15);
    swift_bridgeObjectRelease(v15, v19);
    return 0LL;
  }

  type metadata accessor for ModelLocation(0LL);
  uint64_t v21 = sub_100023AEC((uint64_t)v6);
  uint64_t v22 = URL.pathComponents.getter(v21);
  uint64_t v24 = v22;
  uint64_t v25 = *(void *)(v9 + 16);
  if (v25)
  {
    uint64_t v59 = v6;
    uint64_t v56 = v22;
    unint64_t v26 = *(void *)(v22 + 16);
    unint64_t v58 = v10 - 1;
    swift_bridgeObjectRetain(v9);
    unint64_t v28 = 0LL;
    uint64_t v57 = v9;
    uint64_t v29 = (void *)(v9 + 40);
    while (1)
    {
      if (v28 >= v26)
      {
        uint64_t v36 = *(v29 - 1);
        uint64_t v37 = *v29;
        if (v58 == v28)
        {
          uint64_t v38 = v1;
          uint64_t v39 = v0;
          object = String.lowercased()()._object;
          swift_bridgeObjectRetain(v37);
          v41._countAndFlagsBits = 0x616B6361706C6D2ELL;
          v41._object = (void *)0xEA00000000006567LL;
          Swift::Bool v30 = String.hasSuffix(_:)(v41);
          uint64_t v42 = object;
          uint64_t v0 = v39;
          uint64_t v1 = v38;
          swift_bridgeObjectRelease(v42, v43);
        }

        else
        {
          swift_bridgeObjectRetain(*v29);
          Swift::Bool v30 = 1;
        }

        uint64_t v31 = v60;
        uint64_t v32 = v36;
        uint64_t v33 = v59;
        URL.appendingPathComponent(_:isDirectory:)(v32, v37, v30);
        swift_bridgeObjectRelease(v37, v34);
        char v35 = *(void (**)(char *, uint64_t))(v1 + 8);
        v35(v33, v0);
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v33, v31, v0);
        if ((sub_100018734() & 1) == 0) {
          break;
        }
      }

      ++v28;
      v29 += 2;
      if (v25 == v28)
      {
        swift_bridgeObjectRelease(v56, v27);
        swift_bridgeObjectRelease_n(v57, 2LL);
        uint64_t v6 = v59;
        goto LABEL_16;
      }
    }

    swift_bridgeObjectRelease(v56, v27);
    uint64_t v45 = swift_bridgeObjectRelease_n(v57, 2LL);
    uint64_t v46 = static os_log_type_t.debug.getter(v45);
    if (qword_100034908 != -1) {
      swift_once(&qword_100034908, sub_100003470);
    }
    uint64_t v47 = qword_100035878;
    uint64_t v48 = sub_10000645C(&qword_100034A28);
    uint64_t v49 = swift_allocObject(v48, 72LL, 7LL);
    *(_OWORD *)(v49 + 16) = xmmword_1000253B0;
    uint64_t v50 = v59;
    uint64_t v51 = URL.path.getter(v49);
    uint64_t v53 = v52;
    *(void *)(v49 + 56) = &type metadata for String;
    *(void *)(v49 + 64) = sub_100007D1C();
    *(void *)(v49 + 32) = v51;
    *(void *)(v49 + 40) = v53;
    os_log(_:dso:log:_:_:)(v46, &_mh_execute_header, v47, "Symlink failure code 3: %@", 26LL, 2LL, v49);
    swift_bridgeObjectRelease(v49, v54);
    v35(v50, v0);
    return 0LL;
  }

  swift_bridgeObjectRelease(v9, v23);
  swift_bridgeObjectRelease(v24, v44);
LABEL_16:
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return 1LL;
}

uint64_t sub_100018468()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000645C(&qword_100035020);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_100018734() & 1) == 0) {
    return 0LL;
  }
  uint64_t v29 = v10;
  id v13 = [(id)objc_opt_self(NSFileManager) defaultManager];
  uint64_t v14 = sub_10000645C(&qword_100035028);
  uint64_t v15 = swift_allocObject(v14, 48LL, 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_1000266F0;
  *(void *)(v15 + 32) = NSURLIsRegularFileKey;
  *(void *)(v15 + 40) = NSURLIsDirectoryKey;
  uint64_t v16 = NSURLIsRegularFileKey;
  uint64_t v17 = NSURLIsDirectoryKey;
  uint64_t v18 = (void *)NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)(v1, v15, 0LL, 0LL, 0LL);
  uint64_t v20 = swift_bridgeObjectRelease(v15, v19);
  if (!v18)
  {

    return 0LL;
  }

  uint64_t v21 = v13;
  uint64_t v28 = v9;
  uint64_t v22 = NSEnumerator.makeIterator()(v20);
  NSFastEnumerationIterator.next()(v30, v22);
  if (v31)
  {
    while (1)
    {
      int v24 = swift_dynamicCast(v4, v30, (char *)&type metadata for Any + 8, v5, 6LL);
      uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      if (!v24) {
        break;
      }
      v25(v4, 0LL, 1LL, v5);
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
      char v26 = sub_100018734();
      uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v26 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v28);

        return 0LL;
      }

LABEL_12:
  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v28);
  return 1LL;
}

uint64_t sub_100018734()
{
  uint64_t v0 = sub_10000645C(&qword_100035030);
  uint64_t v1 = __chkstk_darwin(v0);
  Swift::String v41 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v40 - v4;
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v40 - v7;
  uint64_t v9 = static os_log_type_t.debug.getter(v6);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v10 = qword_100035878;
  uint64_t v11 = sub_10000645C(&qword_100034A28);
  uint64_t v12 = swift_allocObject(v11, 72LL, 7LL);
  __int128 v42 = xmmword_1000253B0;
  *(_OWORD *)(v12 + 16) = xmmword_1000253B0;
  uint64_t v13 = URL.path.getter();
  uint64_t v15 = v14;
  *(void *)(v12 + 56) = &type metadata for String;
  unint64_t v16 = sub_100007D1C();
  *(void *)(v12 + 64) = v16;
  *(void *)(v12 + 32) = v13;
  *(void *)(v12 + 40) = v15;
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v10, "Checking %@ is not a symlink", 28LL, 2LL, v12);
  swift_bridgeObjectRelease(v12, v17);
  uint64_t v18 = sub_10000645C(&qword_100035028);
  uint64_t inited = swift_initStackObject(v18, v43);
  *(_OWORD *)(inited + 16) = xmmword_1000266F0;
  *(void *)(inited + 32) = NSURLIsRegularFileKey;
  *(void *)(inited + 40) = NSURLIsDirectoryKey;
  uint64_t v20 = NSURLIsRegularFileKey;
  uint64_t v21 = NSURLIsDirectoryKey;
  uint64_t v22 = sub_100018B04(inited);
  swift_setDeallocating(inited);
  type metadata accessor for URLResourceKey(0LL);
  swift_arrayDestroy(inited + 32, 2LL, v23);
  URL.resourceValues(forKeys:)(v22);
  swift_bridgeObjectRelease(v22, v24);
  uint64_t v25 = type metadata accessor for URLResourceValues(0LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56LL))(v8, 0LL, 1LL, v25);
  sub_100018D30((uint64_t)v8, (uint64_t)v5);
  type metadata accessor for URLResourceValues(0LL);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v27(v5, 1LL, v25) == 1) {
    goto LABEL_6;
  }
  unsigned __int8 v28 = URLResourceValues.isRegularFile.getter();
  uint64_t v29 = *(uint64_t (**)(char *, uint64_t))(v26 + 8);
  uint64_t v30 = v29(v5, v25);
  if (v28 != 2)
  {
    uint64_t v5 = v41;
    sub_100018D30((uint64_t)v8, (uint64_t)v41);
    if (v27(v5, 1LL, v25) == 1)
    {
LABEL_6:
      uint64_t v30 = sub_100017F68((uint64_t)v5, &qword_100035030);
      goto LABEL_7;
    }

    unsigned __int8 v39 = URLResourceValues.isDirectory.getter();
    uint64_t v30 = v29(v5, v25);
    if (v39 != 2)
    {
      uint64_t v37 = (v28 | v39) & 1;
      sub_100017F68((uint64_t)v8, &qword_100035030);
      return v37;
    }
  }

void *sub_100018B04(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10000645C(&qword_100035038);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v43 = v1;
    uint64_t v44 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v44 + 8 * v4);
      uint64_t v7 = *(void *)(v3 + 40);
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      uint64_t v10 = v9;
      Hasher.init(_seed:)(v45, v7);
      id v11 = v6;
      String.hash(into:)(v45, v8, v10);
      Swift::Int v12 = Hasher._finalize()();
      unint64_t result = (void *)swift_bridgeObjectRelease(v10, v13);
      uint64_t v15 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v16 = v12 & ~v15;
      unint64_t v17 = v16 >> 6;
      uint64_t v18 = *(void *)(v5 + 8 * (v16 >> 6));
      uint64_t v19 = 1LL << v16;
      if (((1LL << v16) & v18) != 0)
      {
        uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v3 + 48) + 8 * v16));
        uint64_t v22 = v21;
        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        if (v20 == v23 && v22 == v24)
        {
LABEL_3:
          swift_bridgeObjectRelease_n(v22, 2LL);
LABEL_4:

          goto LABEL_5;
        }

        uint64_t v26 = v24;
        char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, v23, v24, 0LL);
        swift_bridgeObjectRelease(v22, v28);
        unint64_t result = (void *)swift_bridgeObjectRelease(v26, v29);
        if ((v27 & 1) != 0) {
          goto LABEL_4;
        }
        uint64_t v30 = ~v15;
        while (1)
        {
          unint64_t v16 = (v16 + 1) & v30;
          unint64_t v17 = v16 >> 6;
          uint64_t v18 = *(void *)(v5 + 8 * (v16 >> 6));
          uint64_t v19 = 1LL << v16;
          if ((v18 & (1LL << v16)) == 0) {
            break;
          }
          uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v3 + 48) + 8 * v16));
          uint64_t v22 = v32;
          uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
          if (v31 == v33 && v22 == v34) {
            goto LABEL_3;
          }
          uint64_t v36 = v34;
          char v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v22, v33, v34, 0LL);
          swift_bridgeObjectRelease(v22, v38);
          unint64_t result = (void *)swift_bridgeObjectRelease(v36, v39);
          if ((v37 & 1) != 0) {
            goto LABEL_4;
          }
        }
      }

      *(void *)(v5 + 8 * v17) = v19 | v18;
      *(void *)(*(void *)(v3 + 48) + 8 * v16) = v11;
      uint64_t v40 = *(void *)(v3 + 16);
      BOOL v41 = __OFADD__(v40, 1LL);
      uint64_t v42 = v40 + 1;
      if (v41)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v42;
LABEL_5:
      if (++v4 == v43) {
        return (void *)v3;
      }
    }
  }

  return &_swiftEmptySetSingleton;
}

uint64_t sub_100018D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000645C(&qword_100035030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018D78(char a1)
{
  return *(void *)&aStarttimsample[8 * a1];
}

uint64_t sub_100018D98()
{
  return sub_100018D78(*v0);
}

uint64_t sub_100018DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100019240(a1, a2);
  *a3 = result;
  return result;
}

void sub_100018DC4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_100018DD0(uint64_t a1)
{
  unint64_t v2 = sub_100018FFC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018DF8(uint64_t a1)
{
  unint64_t v2 = sub_100018FFC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100018E20(uint64_t a1, uint64_t a2)
{
  return swift_deallocClassInstance(v2, 48LL, 7LL);
}

uint64_t type metadata accessor for SampleTimer()
{
  return objc_opt_self(&OBJC_CLASS____TtC35com_apple_dt_DTMLModelRunnerService11SampleTimer);
}

uint64_t sub_100018E64(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000645C(&qword_100035150);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_100018FFC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for SampleTimer.CodingKeys,  &type metadata for SampleTimer.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + 16);
  uint64_t v13 = *(unsigned __int8 *)(v3 + 24);
  v21[0] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v12, v13, v21, v5);
  if (!v2)
  {
    swift_beginAccess(v3 + 32, v21, 0LL, 0LL);
    uint64_t v20 = *(void *)(v3 + 32);
    char v19 = 1;
    uint64_t v14 = sub_10000645C(&qword_100034EE0);
    unint64_t v15 = sub_100019040();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v5, v14, v15);
    uint64_t v16 = *(void *)(v3 + 40);
    LOBYTE(v20) = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, &v20, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100018FDC(void *a1)
{
  return sub_100018E64(a1);
}

unint64_t sub_100018FFC()
{
  unint64_t result = qword_100035158;
  if (!qword_100035158)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002685C, &type metadata for SampleTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100035158);
  }

  return result;
}

unint64_t sub_100019040()
{
  unint64_t result = qword_100035160;
  if (!qword_100035160)
  {
    uint64_t v1 = sub_100006568(&qword_100034EE0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100035160);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for SampleTimer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_1000190E8 + 4 * byte_100026735[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10001911C + 4 * byte_100026730[v4]))();
}

uint64_t sub_10001911C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019124(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10001912CLL);
  }
  return result;
}

uint64_t sub_100019138(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100019140LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_100019144(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001914C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SampleTimer.CodingKeys()
{
  return &type metadata for SampleTimer.CodingKeys;
}

unint64_t sub_10001916C()
{
  unint64_t result = qword_100035168;
  if (!qword_100035168)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026834, &type metadata for SampleTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100035168);
  }

  return result;
}

unint64_t sub_1000191B4()
{
  unint64_t result = qword_100035170;
  if (!qword_100035170)
  {
    unint64_t result = swift_getWitnessTable("\u0379", &type metadata for SampleTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100035170);
  }

  return result;
}

unint64_t sub_1000191FC()
{
  unint64_t result = qword_100035178;
  if (!qword_100035178)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000267CC, &type metadata for SampleTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100035178);
  }

  return result;
}

uint64_t sub_100019240(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D69547472617473LL && a2 == 0xE900000000000065LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6D69547472617473LL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x73656C706D6173LL && a2 == 0xE700000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x73656C706D6173LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0x617265704F6D756ELL && a2 == 0xED0000736E6F6974LL)
  {
    swift_bridgeObjectRelease(0xED0000736E6F6974LL, a2);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617265704F6D756ELL, 0xED0000736E6F6974LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

void *_s14ModelStructureO7ProgramV14NamedValueTypeVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV14NamedValueTypeVwxx(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8), a2);
}

void *_s14ModelStructureO7ProgramV14NamedValueTypeVwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4, a2);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV14NamedValueTypeVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(swift_bridgeObjectRelease(0xE000000000000000LL, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO7ProgramV14NamedValueTypeVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV14NamedValueTypeVMa()
{
  return &_s14ModelStructureO7ProgramV14NamedValueTypeVN;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwxx(void *a1, uint64_t a2)
{
  uint64_t result = a1[5];
  if (result)
  {
    swift_bridgeObjectRelease(result, v6);
    return swift_bridgeObjectRelease(a1[7], v8);
  }

  return result;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  uint64_t v9 = a2 + 40;
  uint64_t v8 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  if (v8)
  {
    *(void *)(a1 + 40) = v8;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    uint64_t v10 = *(void *)(a2 + 56);
    *(void *)(a1 + 56) = v10;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v10);
  }

  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v9;
    *(void *)(a1 + 56) = *(void *)(v9 + 16);
  }

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11, v12);
  uint64_t v13 = *(void *)(a2 + 32);
  uint64_t v14 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14, v15);
  unint64_t v17 = (_OWORD *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v20 = (_OWORD *)(a2 + 40);
  uint64_t v19 = *(void *)(a2 + 40);
  if (v18)
  {
    if (v19)
    {
      *(void *)(a1 + 40) = v19;
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRelease(v18, v21);
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      uint64_t v22 = *(void *)(a2 + 56);
      uint64_t v23 = *(void *)(a1 + 56);
      *(void *)(a1 + 56) = v22;
      swift_bridgeObjectRetain(v22);
      swift_bridgeObjectRelease(v23, v24);
    }

    else
    {
      sub_10001970C((void *)(a1 + 40), v16);
      uint64_t v26 = *(void *)(a2 + 56);
      _OWORD *v17 = *v20;
      *(void *)(a1 + 56) = v26;
    }
  }

  else if (v19)
  {
    *(void *)(a1 + 40) = v19;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    uint64_t v25 = *(void *)(a2 + 56);
    *(void *)(a1 + 56) = v25;
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v25);
  }

  else
  {
    __int128 v27 = *v20;
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    _OWORD *v17 = v27;
  }

  uint64_t v28 = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 64) = v28;
  return a1;
}

void *sub_10001970C(void *a1, uint64_t a2)
{
  return a1;
}

__n128 _s14ModelStructureO7ProgramV9OperationVwtk(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5, a2);
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v6, v7);
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(v8, v9);
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(v10, v11);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a2 + 40);
  if (!v13) {
    goto LABEL_5;
  }
  if (!v14)
  {
    sub_10001970C((void *)(a1 + 40), v12);
LABEL_5:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    goto LABEL_6;
  }

  *(void *)(a1 + 40) = v14;
  swift_bridgeObjectRelease(v13, v12);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease(v15, v16);
LABEL_6:
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(swift_bridgeObjectRelease(0xE000000000000000LL, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO7ProgramV9OperationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 73) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV9OperationVMa()
{
  return &_s14ModelStructureO7ProgramV9OperationVN;
}

void *_s14ModelStructureO7ProgramV14NamedValueTypeVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4, v5);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV7BindingOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  else {
    return 0LL;
  }
}

uint64_t _s14ModelStructureO7ProgramV7BindingOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

uint64_t sub_1000199C0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1000199D8(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = (a2 - 1);
  }

  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingON;
}

ValueMetadata *_s14ModelStructureO7ProgramV8ArgumentVMa()
{
  return &_s14ModelStructureO7ProgramV8ArgumentVN;
}

uint64_t _s14ModelStructureO7ProgramV5BlockVwxx(void *a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a1[2], v4);
}

uint64_t *_s14ModelStructureO7ProgramV5BlockVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  a1[2] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t *_s14ModelStructureO7ProgramV5BlockVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  uint64_t v7 = a2[1];
  uint64_t v8 = a1[1];
  a1[1] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  uint64_t v10 = a2[2];
  uint64_t v11 = a1[2];
  a1[2] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11, v12);
  return a1;
}

void *_s14ModelStructureO7ProgramV5BlockVwta(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease(v4, v5);
  uint64_t v6 = a1[2];
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v6, v7);
  return a1;
}

ValueMetadata *_s14ModelStructureO7ProgramV5BlockVMa()
{
  return &_s14ModelStructureO7ProgramV5BlockVN;
}

ValueMetadata *_s14ModelStructureO7ProgramVMa()
{
  return &_s14ModelStructureO7ProgramVN;
}

uint64_t _s14ModelStructureO7ProgramV8FunctionVwxx(void *a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a1[3], v5);
}

uint64_t *_s14ModelStructureO7ProgramV8FunctionVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t *_s14ModelStructureO7ProgramV8FunctionVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  uint64_t v7 = a2[1];
  uint64_t v8 = a1[1];
  a1[1] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  uint64_t v10 = a2[2];
  uint64_t v11 = a1[2];
  a1[2] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11, v12);
  uint64_t v13 = a2[3];
  uint64_t v14 = a1[3];
  a1[3] = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14, v15);
  return a1;
}

__n128 _s14ModelStructureO7ProgramV8FunctionVwtk(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *_s14ModelStructureO7ProgramV8FunctionVwta(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4, v5);
  swift_bridgeObjectRelease(a1[2], v6);
  uint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  swift_bridgeObjectRelease(v7, v8);
  return a1;
}

uint64_t _s14ModelStructureO7ProgramV8FunctionVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t _s14ModelStructureO7ProgramV8FunctionVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV8FunctionVMa()
{
  return &_s14ModelStructureO7ProgramV8FunctionVN;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkVMa()
{
  return &_s14ModelStructureO13NeuralNetworkVN;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwxx(void *a1, uint64_t a2)
{
  uint64_t result = a1[6];
  if (result)
  {
    swift_bridgeObjectRelease(result, v6);
    return swift_bridgeObjectRelease(a1[8], v8);
  }

  return result;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  uint64_t v9 = a2 + 48;
  uint64_t v8 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  if (v8)
  {
    *(void *)(a1 + 48) = v8;
    *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 64) = v10;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v10);
  }

  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)v9;
    *(void *)(a1 + 64) = *(void *)(v9 + 16);
  }

  return a1;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11, v12);
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v14 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14, v15);
  unint64_t v17 = (_OWORD *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v20 = (_OWORD *)(a2 + 48);
  uint64_t v19 = *(void *)(a2 + 48);
  if (v18)
  {
    if (v19)
    {
      *(void *)(a1 + 48) = v19;
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRelease(v18, v21);
      *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
      uint64_t v22 = *(void *)(a2 + 64);
      uint64_t v23 = *(void *)(a1 + 64);
      *(void *)(a1 + 64) = v22;
      swift_bridgeObjectRetain(v22);
      swift_bridgeObjectRelease(v23, v24);
    }

    else
    {
      sub_10001970C((void *)(a1 + 48), v16);
      uint64_t v26 = *(void *)(a2 + 64);
      _OWORD *v17 = *v20;
      *(void *)(a1 + 64) = v26;
    }
  }

  else if (v19)
  {
    *(void *)(a1 + 48) = v19;
    *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
    uint64_t v25 = *(void *)(a2 + 64);
    *(void *)(a1 + 64) = v25;
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v25);
  }

  else
  {
    __int128 v27 = *v20;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    _OWORD *v17 = v27;
  }

  return a1;
}

__n128 _s14ModelStructureO13NeuralNetworkV5LayerVwtk(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5, a2);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7, v8);
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(v9, v10);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease(v11, v12);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a2 + 48);
  if (!v14) {
    goto LABEL_5;
  }
  if (!v15)
  {
    sub_10001970C((void *)(a1 + 48), v13);
LABEL_5:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    return a1;
  }

  *(void *)(a1 + 48) = v15;
  swift_bridgeObjectRelease(v14, v13);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease(v16, v17);
  return a1;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(swift_bridgeObjectRelease(0xE000000000000000LL, v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 72) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkV5LayerVMa()
{
  return &_s14ModelStructureO13NeuralNetworkV5LayerVN;
}

uint64_t _s11DeviceUsageVwxx(void *a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a1[2], v3);
}

uint64_t _s11DeviceUsageVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)a1 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v4 = a2[2];
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t *_s11DeviceUsageVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v7 = a2[2];
  uint64_t v8 = a1[2];
  a1[2] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  return a1;
}

uint64_t *_s11DeviceUsageVwta(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4, a2);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v5 = a1[2];
  a1[2] = a2[2];
  swift_bridgeObjectRelease(v5, v6);
  return a1;
}

uint64_t _s11DeviceUsageVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t sub_10001A2E8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s11DeviceUsageVMa()
{
  return &_s11DeviceUsageVN;
}

uint64_t _s11DeviceUsageV12SupportStateOwCP(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t _s11DeviceUsageV12SupportStateOwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t _s11DeviceUsageV12SupportStateOwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0LL;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_10001A39C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10001A3B8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }

  else
  {
    *(_BYTE *)(result + 8) = 0;
  }

  return result;
}

ValueMetadata *_s11DeviceUsageV12SupportStateOMa()
{
  return &_s11DeviceUsageV12SupportStateON;
}

uint64_t _s14ModelStructureOwxx(uint64_t a1)
{
  return sub_10000615C(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s14ModelStructureOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1000060C8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s14ModelStructureOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1000060C8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10000615C(v6, v7, v8);
  return a1;
}

uint64_t _s14ModelStructureOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10000615C(v4, v5, v6);
  return a1;
}

uint64_t sub_10001A4DC(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_10001A4F4(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0LL;
    LOBYTE(a2) = 3;
  }

  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s14ModelStructureOMa()
{
  return &_s14ModelStructureON;
}

uint64_t sub_10001A51C(char a1)
{
  if ((a1 & 1) != 0) {
    return 1701869940LL;
  }
  else {
    return 1701667182LL;
  }
}

uint64_t sub_10001A53C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_10000645C(&qword_100035210);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_10000649C(a1, v11);
  unint64_t v13 = sub_10001D978();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON,  &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON,  v13,  v11,  v12);
  char v18 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, a3, &v18, v7);
  if (!v3)
  {
    char v17 = 1;
    unint64_t v14 = sub_10001DA00();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v14, &v17, v7, &_s14ModelStructureO7ProgramV9ValueTypeVN, v14);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10001A668(char a1)
{
  if ((a1 & 1) != 0) {
    return 1701667182LL;
  }
  else {
    return 0x65756C6176LL;
  }
}

uint64_t sub_10001A694(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a3;
  uint64_t v25 = a2;
  uint64_t v4 = sub_10000645C(&qword_100035318);
  uint64_t v26 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unsigned __int8 v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000645C(&qword_100035320);
  uint64_t v24 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_10000645C(&qword_100035328);
  uint64_t v28 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000649C(a1, v14);
  unint64_t v15 = sub_10001F400();
  uint64_t v16 = v13;
  uint64_t v17 = v27;
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON,  &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON,  v15,  v14,  v16);
  if (v17)
  {
    char v30 = 1;
    unint64_t v18 = sub_10001F444();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON,  &v30,  v10,  &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON,  v18);
    KeyedEncodingContainer.encode(_:forKey:)(v25, v17, v19, v4);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
  }

  else
  {
    char v29 = 0;
    unint64_t v20 = sub_10001F488();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON,  &v29,  v10,  &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON,  v20);
    unint64_t v21 = sub_10001F510();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, v22, v7, &_s14ModelStructureO7ProgramV5ValueVN, v21);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v7);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v10);
}

uint64_t sub_10001A8C0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000645C(&qword_100035360);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000649C(a1, v8);
  unint64_t v10 = sub_10001F554();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON,  &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON,  v10,  v8,  v9);
  uint64_t v16 = a2;
  uint64_t v11 = sub_10000645C(&qword_100035348);
  uint64_t v12 = sub_100023454( &qword_100035368,  &qword_100035348,  (void (*)(void))sub_10001F5DC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, v13, v4, v11, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10001A9E4(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x6B636F6C62LL;
  }
  else {
    return 0x737475706E69LL;
  }
}

uint64_t sub_10001AA14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  uint64_t v9 = sub_10000645C(&qword_100035420);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000649C(a1, v14);
  unint64_t v15 = sub_10001FA80();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON,  &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON,  v15,  v14,  v13);
  v23[0] = a2;
  char v24 = 0;
  uint64_t v16 = sub_10000645C(&qword_100035248);
  uint64_t v17 = sub_100023454( &qword_1000352A0,  &qword_100035248,  (void (*)(void))sub_10001F2AC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v23, &v24, v9, v16, v17);
  if (!v5)
  {
    v23[0] = a3;
    v23[1] = v21;
    _OWORD v23[2] = v22;
    char v24 = 1;
    unint64_t v18 = sub_10001F2F0();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v23, &v24, v9, &_s14ModelStructureO7ProgramV5BlockVN, v18);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10001AB98(char a1)
{
  return *(void *)&aInputs_0[8 * a1];
}

uint64_t sub_10001ABB8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a3;
  uint64_t v8 = sub_10000645C(&qword_1000353B0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000649C(a1, v12);
  unint64_t v14 = sub_10001F620();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON,  &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON,  v14,  v12,  v13);
  uint64_t v24 = a2;
  char v23 = 0;
  uint64_t v15 = sub_10000645C(&qword_100035248);
  uint64_t v16 = sub_100023454( &qword_1000352A0,  &qword_100035248,  (void (*)(void))sub_10001F2AC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v8, v15, v16);
  if (!v4)
  {
    uint64_t v24 = v22;
    char v23 = 1;
    uint64_t v17 = sub_10000645C(&qword_100035388);
    uint64_t v18 = sub_10001F6A8( &qword_1000353B8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v8, v17, v18);
    uint64_t v24 = a4;
    char v23 = 2;
    uint64_t v19 = sub_10000645C(&qword_100035398);
    uint64_t v20 = sub_100023454( &qword_1000353C0,  &qword_100035398,  (void (*)(void))sub_10001F708,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v8, v19, v20);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10001ADC0(char a1)
{
  return *(void *)&aOperatorinputs[8 * a1];
}

uint64_t sub_10001ADE0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000645C(&qword_100035288);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_10001F004();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON,  &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  LOBYTE(v24[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, v24, v5);
  if (!v2)
  {
    v24[0] = v3[2];
    char v25 = 1;
    uint64_t v14 = sub_10000645C(&qword_100035230);
    uint64_t v15 = sub_10001F1F4( &qword_100035290,  (void (*)(void))sub_10001F268,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v24, &v25, v5, v14, v15);
    v24[0] = v3[3];
    char v25 = 2;
    uint64_t v16 = sub_10000645C(&qword_100035248);
    uint64_t v17 = sub_100023454( &qword_1000352A0,  &qword_100035248,  (void (*)(void))sub_10001F2AC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v24, &v25, v5, v16, v17);
    v24[0] = v3[4];
    char v25 = 3;
    uint64_t v18 = sub_10000645C(&qword_100035260);
    uint64_t v19 = sub_100023454( &qword_1000352B0,  &qword_100035260,  (void (*)(void))sub_10001F2F0,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v24, &v25, v5, v18, v19);
    sub_10001F378((uint64_t)(v3 + 5), (uint64_t)v27, &qword_1000352C0);
    sub_10001F378((uint64_t)v27, (uint64_t)v24, &qword_1000352C0);
    char v25 = 4;
    unint64_t v20 = sub_10001F334();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v24, &v25, v5, &_s11DeviceUsageVN, v20);
    sub_10001F378((uint64_t)(v3 + 8), (uint64_t)v26, &qword_1000352D0);
    sub_10001F378((uint64_t)v26, (uint64_t)v24, &qword_1000352D0);
    char v25 = 5;
    unint64_t v21 = sub_10001F3BC();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v24, &v25, v5, &_s4CostVN, v21);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001B0D0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000645C(&qword_1000353F8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000649C(a1, v8);
  unint64_t v10 = sub_10001F940();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV10CodingKeysON,  &_s14ModelStructureO7ProgramV10CodingKeysON,  v10,  v8,  v9);
  uint64_t v16 = a2;
  uint64_t v11 = sub_10000645C(&qword_1000353E0);
  uint64_t v12 = sub_10001F984( &qword_100035400,  (void (*)(void))sub_10001FA3C,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, v13, v4, v11, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10001B1F4(char a1)
{
  return *(void *)&aName_1[8 * a1];
}

uint64_t sub_10001B214(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_10000645C(&qword_100035478);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_1000203C4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON,  &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  LOBYTE(v21[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, v21, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    LOBYTE(v21[0]) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v21, v5);
    v21[0] = v3[4];
    char v22 = 2;
    uint64_t v16 = sub_10000645C(&qword_100035388);
    uint64_t v17 = sub_10001F6A8( &qword_1000353B8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v22, v5, v16, v17);
    v21[0] = v3[5];
    char v22 = 3;
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v22, v5, v16, v17);
    sub_10001F378((uint64_t)(v3 + 6), (uint64_t)v23, &qword_1000352C0);
    sub_10001F378((uint64_t)v23, (uint64_t)v21, &qword_1000352C0);
    char v22 = 4;
    unint64_t v18 = sub_10001F334();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v21, &v22, v5, &_s11DeviceUsageVN, v18);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10001B428(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10000645C(&qword_100035450);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000649C(a1, v8);
  unint64_t v10 = sub_1000202F8();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO13NeuralNetworkV10CodingKeysON,  &_s14ModelStructureO13NeuralNetworkV10CodingKeysON,  v10,  v8,  v9);
  uint64_t v16 = a2;
  uint64_t v11 = sub_10000645C(&qword_100035438);
  uint64_t v12 = sub_100023454( &qword_100035458,  &qword_100035438,  (void (*)(void))sub_100020380,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v16, v13, v4, v11, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10001B54C()
{
  return 0x6C65646F4D627573LL;
}

uint64_t sub_10001B580(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_10000645C(&qword_100035750);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_10000649C(a1, v11);
  unint64_t v13 = sub_100023300();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO8PipelineV10CodingKeysON,  &_s14ModelStructureO8PipelineV10CodingKeysON,  v13,  v11,  v12);
  uint64_t v21 = a2;
  char v20 = 0;
  uint64_t v14 = sub_10000645C(&qword_100035388);
  uint64_t v15 = sub_10001F6A8( &qword_1000353B8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v20, v7, v14, v15);
  if (!v3)
  {
    uint64_t v21 = a3;
    char v20 = 1;
    uint64_t v16 = sub_10000645C(&qword_100035760);
    uint64_t v17 = sub_100023454( &qword_100035768,  &qword_100035760,  (void (*)(void))sub_10000662C,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v20, v7, v16, v17);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10001B718(char a1)
{
  return *(void *)&aNeuralneprogra[8 * a1];
}

void sub_10001B738(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = a4;
  v16[11] = a3;
  v16[12] = a2;
  uint64_t v5 = sub_10000645C(&qword_100035180);
  v16[5] = *(void *)(v5 - 8);
  v16[6] = v5;
  __chkstk_darwin(v5);
  v16[4] = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000645C(&qword_100035188);
  _OWORD v16[2] = *(void *)(v7 - 8);
  v16[3] = v7;
  __chkstk_darwin(v7);
  v16[1] = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10000645C(&qword_100035190);
  v16[9] = *(void *)(v9 - 8);
  v16[10] = v9;
  __chkstk_darwin(v9);
  uint64_t v10 = sub_10000645C(&qword_100035198);
  v16[7] = *(void *)(v10 - 8);
  v16[8] = v10;
  __chkstk_darwin(v10);
  uint64_t v11 = sub_10000645C(&qword_1000351A0);
  __chkstk_darwin(v11);
  uint64_t v12 = sub_10000645C(&qword_1000351A8);
  v16[13] = *(void *)(v12 - 8);
  v16[14] = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000649C(a1, v14);
  unint64_t v15 = sub_10001D230();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s14ModelStructureO10CodingKeysON,  &_s14ModelStructureO10CodingKeysON,  v15,  v14,  v13);
  __asm { BR              X10 }

uint64_t sub_10001B930()
{
  *(_BYTE *)(v4 - 96) = 0;
  unint64_t v5 = sub_10001D40C();
  uint64_t v6 = *(void *)(v4 - 112);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s14ModelStructureO23NeuralNetworkCodingKeysON,  v4 - 96,  v6,  &_s14ModelStructureO23NeuralNetworkCodingKeysON,  v5);
  *(void *)(v4 - 96) = *(void *)(v4 - 128);
  unint64_t v7 = sub_10001D450();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v4 - 96, v8, v3, &_s14ModelStructureO13NeuralNetworkVN, v7);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 120) + 8LL))(v1, v6);
}

uint64_t sub_10001BB94(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x726F707075736E75LL;
  }
  else {
    return 0x6574726F70707573LL;
  }
}

uint64_t sub_10001BBD8(void *a1, uint64_t a2, int a3)
{
  int v28 = a3;
  uint64_t v23 = a2;
  uint64_t v4 = sub_10000645C(&qword_100035508);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000645C(&qword_100035510);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_10000645C(&qword_100035518);
  uint64_t v26 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = a1[3];
  uint64_t v15 = a1[4];
  sub_10000649C(a1, v14);
  unint64_t v16 = sub_100021A84();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s11DeviceUsageV12SupportStateO10CodingKeysON,  &_s11DeviceUsageV12SupportStateO10CodingKeysON,  v16,  v14,  v15);
  if ((v28 & 1) != 0)
  {
    char v29 = 0;
    unint64_t v22 = sub_100021B50();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON,  &v29,  v11,  &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON,  v22);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  else
  {
    char v30 = 1;
    unint64_t v17 = sub_100021AC8();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON,  &v30,  v11,  &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON,  v17);
    uint64_t v27 = v23;
    unint64_t v18 = sub_100021B94();
    uint64_t v19 = v25;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v27, v20, v25, &_s11DeviceUsageV6ReasonVN, v18);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v19);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v13, v11);
}

uint64_t sub_10001BE08(char a1)
{
  if (!a1) {
    return 0x6574726F70707573LL;
  }
  if (a1 == 1) {
    return 0x6572726566657270LL;
  }
  return 0xD000000000000010LL;
}

uint64_t sub_10001BE6C(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  int v22 = a3;
  uint64_t v8 = sub_10000645C(&qword_1000354B8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_10000649C(a1, v12);
  unint64_t v14 = sub_1000218F8();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s11DeviceUsageV10CodingKeysON,  &_s11DeviceUsageV10CodingKeysON,  v14,  v12,  v13);
  uint64_t v24 = a2;
  char v23 = 0;
  uint64_t v15 = sub_10000645C(&qword_1000349F0);
  uint64_t v16 = sub_100023454( (unint64_t *)&qword_1000349F8,  &qword_1000349F0,  (void (*)(void))sub_1000065AC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v8, v15, v16);
  if (!v4)
  {
    LOBYTE(v24) = v22;
    char v23 = 1;
    unint64_t v17 = sub_1000065AC();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v8, &_s13ComputeDeviceVN, v17);
    uint64_t v24 = a4;
    char v23 = 2;
    uint64_t v18 = sub_10000645C(&qword_1000354A0);
    uint64_t v19 = sub_1000219C4( &qword_1000354C0,  (void (*)(void))sub_1000065AC,  (void (*)(void))sub_100021A40,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v23, v8, v18, v19);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10001C050(uint64_t a1)
{
  unint64_t v2 = sub_100023344();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C078(uint64_t a1)
{
  unint64_t v2 = sub_100023344();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C0A0(void *a1)
{
  return sub_10000D788(a1);
}

uint64_t sub_10001C0C4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001C16C( a1,  a2,  a3,  &qword_100035770,  (uint64_t (*)(void))sub_100023344,  (uint64_t)&_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysON);
}

uint64_t sub_10001C0F0(uint64_t a1)
{
  unint64_t v2 = sub_1000233CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C118(uint64_t a1)
{
  unint64_t v2 = sub_1000233CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C140(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001C16C( a1,  a2,  a3,  &qword_100035798,  (uint64_t (*)(void))sub_1000233CC,  (uint64_t)&_s14ModelStructureO7ProgramV5ValueV10CodingKeysON);
}

uint64_t sub_10001C16C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v9 = sub_10000645C(a4);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  sub_10000649C(a1, v13);
  uint64_t v15 = a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)(a6, a6, v15, v13, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10001C23C()
{
  return sub_10001A51C(*v0);
}

uint64_t sub_10001C244@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001D710(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001C268(uint64_t a1)
{
  unint64_t v2 = sub_10001D978();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C290(uint64_t a1)
{
  unint64_t v2 = sub_10001D978();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C2B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10001D7D8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }

  return result;
}

uint64_t sub_10001C2E0(void *a1)
{
  return sub_10001A53C(a1, *v1, v1[1]);
}

uint64_t sub_10001C2F8()
{
  return sub_10001A668(*v0);
}

uint64_t sub_10001C300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001DA44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001C324(uint64_t a1)
{
  unint64_t v2 = sub_10001F400();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C34C(uint64_t a1)
{
  unint64_t v2 = sub_10001F400();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C380(uint64_t a1)
{
  unint64_t v2 = sub_10001F444();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C3A8(uint64_t a1)
{
  unint64_t v2 = sub_10001F444();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C3D0(uint64_t a1)
{
  unint64_t v2 = sub_10001F488();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C3F8(uint64_t a1)
{
  unint64_t v2 = sub_10001F488();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001C420@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10001DB14(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }

  return result;
}

uint64_t sub_10001C448(void *a1)
{
  return sub_10001A694(a1, *v1, v1[1]);
}

uint64_t sub_10001C464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001DEF4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001C48C(uint64_t a1)
{
  unint64_t v2 = sub_10001F554();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C4B4(uint64_t a1)
{
  unint64_t v2 = sub_10001F554();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001C4DC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10001DF90(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10001C504(void *a1)
{
  return sub_10001A8C0(a1, *v1);
}

uint64_t sub_10001C51C()
{
  return sub_10001A9E4(*v0);
}

uint64_t sub_10001C524@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001E0DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001C548(uint64_t a1)
{
  unint64_t v2 = sub_10001FA80();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C570(uint64_t a1)
{
  unint64_t v2 = sub_10001FA80();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C598@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10001E1B4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }

  return result;
}

uint64_t sub_10001C5C4(void *a1)
{
  return sub_10001AA14(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_10001C5E0()
{
  return sub_10001AB98(*v0);
}

uint64_t sub_10001C5E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001E3C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001C60C(uint64_t a1)
{
  unint64_t v2 = sub_10001F620();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C634(uint64_t a1)
{
  unint64_t v2 = sub_10001F620();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C65C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10001E51C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }

  return result;
}

uint64_t sub_10001C688(void *a1)
{
  return sub_10001ABB8(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_10001C6A4()
{
  return sub_10001ADC0(*v0);
}

uint64_t sub_10001C6AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001E7E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001C6D0(uint64_t a1)
{
  unint64_t v2 = sub_10001F004();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C6F8(uint64_t a1)
{
  unint64_t v2 = sub_10001F004();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10001C720@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v7[0];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 57) = *(_OWORD *)((char *)v7 + 9);
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }

  return result;
}

uint64_t sub_10001C768(void *a1)
{
  return sub_10001ADE0(a1);
}

uint64_t sub_10001C7AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001F74C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001C7D4(uint64_t a1)
{
  unint64_t v2 = sub_10001F940();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C7FC(uint64_t a1)
{
  unint64_t v2 = sub_10001F940();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001C824@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10001F7F4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10001C84C(void *a1)
{
  return sub_10001B0D0(a1, *v1);
}

uint64_t sub_10001C864()
{
  return sub_10001B1F4(*v0);
}

uint64_t sub_10001C86C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10001FAC4(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001C890(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10001C89C(uint64_t a1)
{
  unint64_t v2 = sub_1000203C4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C8C4(uint64_t a1)
{
  unint64_t v2 = sub_1000203C4();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10001C8EC@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(void *)(a2 + 64) = v7;
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }

  return result;
}

uint64_t sub_10001C93C(void *a1)
{
  return sub_10001B214(a1);
}

uint64_t sub_10001C980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10002011C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001C9A8(uint64_t a1)
{
  unint64_t v2 = sub_1000202F8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C9D0(uint64_t a1)
{
  unint64_t v2 = sub_1000202F8();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001C9F8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_1000201AC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10001CA20(void *a1)
{
  return sub_10001B428(a1, *v1);
}

uint64_t sub_10001CA38()
{
  return sub_10001B54C();
}

uint64_t sub_10001CA40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100020408(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001CA64(uint64_t a1)
{
  unint64_t v2 = sub_100023300();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CA8C(uint64_t a1)
{
  unint64_t v2 = sub_100023300();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CAB4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100020508(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }

  return result;
}

uint64_t sub_10001CADC(void *a1)
{
  return sub_10001B580(a1, *v1, v1[1]);
}

uint64_t sub_10001CAF4()
{
  return sub_10001B718(*v0);
}

uint64_t sub_10001CAFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100020714(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001CB20(uint64_t a1)
{
  unint64_t v2 = sub_10001D230();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CB48(uint64_t a1)
{
  unint64_t v2 = sub_10001D230();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CB70(uint64_t a1)
{
  unint64_t v2 = sub_10001D2B8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CB98(uint64_t a1)
{
  unint64_t v2 = sub_10001D2B8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CBC0(uint64_t a1)
{
  unint64_t v2 = sub_10001D40C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CBE8(uint64_t a1)
{
  unint64_t v2 = sub_10001D40C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CC10(uint64_t a1)
{
  unint64_t v2 = sub_10001D2FC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CC38(uint64_t a1)
{
  unint64_t v2 = sub_10001D2FC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CC60(uint64_t a1)
{
  unint64_t v2 = sub_10001D384();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CC88(uint64_t a1)
{
  unint64_t v2 = sub_10001D384();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CCB0(uint64_t a1)
{
  unint64_t v2 = sub_10001D274();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CCD8(uint64_t a1)
{
  unint64_t v2 = sub_10001D274();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001CD00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100020930(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
  }

  return result;
}

void sub_10001CD2C(void *a1)
{
}

uint64_t sub_10001CD48()
{
  return sub_10001BB94(*v0);
}

uint64_t sub_10001CD50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100020F9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001CD74(uint64_t a1)
{
  unint64_t v2 = sub_100021A84();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CD9C(uint64_t a1)
{
  unint64_t v2 = sub_100021A84();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CDC4(uint64_t a1)
{
  unint64_t v2 = sub_100021B50();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CDEC(uint64_t a1)
{
  unint64_t v2 = sub_100021B50();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CE14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10002109C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001CE3C(uint64_t a1)
{
  unint64_t v2 = sub_100021AC8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CE64(uint64_t a1)
{
  unint64_t v2 = sub_100021AC8();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001CE8C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100021114(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5 & 1;
  }

  return result;
}

uint64_t sub_10001CEBC(void *a1)
{
  return sub_10001BBD8(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8));
}

unint64_t sub_10001CED8()
{
  return 0xD000000000000010LL;
}

uint64_t sub_10001CEF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000214B8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001CF1C(uint64_t a1)
{
  unint64_t v2 = sub_100023410();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CF44(uint64_t a1)
{
  unint64_t v2 = sub_100023410();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CF6C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000645C(&qword_1000357A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_100023410();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)( &_s11DeviceUsageV6ReasonV10CodingKeysON,  &_s11DeviceUsageV6ReasonV10CodingKeysON,  v11,  v9,  v10);
  if (v2) {
    return sub_10000D788(a1);
  }
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_10000D788(a1);
  *a2 = v13;
  return result;
}

uint64_t sub_10001D07C(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_1000357B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v1;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000649C(a1, v8);
  unint64_t v10 = sub_100023410();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &_s11DeviceUsageV6ReasonV10CodingKeysON,  &_s11DeviceUsageV6ReasonV10CodingKeysON,  v10,  v8,  v9);
  KeyedEncodingContainer.encode(_:forKey:)(v7, v11, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001D164()
{
  return sub_10001BE08(*v0);
}

uint64_t sub_10001D16C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10002153C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001D190(uint64_t a1)
{
  unint64_t v2 = sub_1000218F8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001D1B8(uint64_t a1)
{
  unint64_t v2 = sub_1000218F8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001D1E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_10002168C(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }

  return result;
}

uint64_t sub_10001D210(void *a1)
{
  return sub_10001BE6C(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16));
}

unint64_t sub_10001D230()
{
  unint64_t result = qword_1000351B0;
  if (!qword_1000351B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028408, &_s14ModelStructureO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000351B0);
  }

  return result;
}

unint64_t sub_10001D274()
{
  unint64_t result = qword_1000351B8;
  if (!qword_1000351B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000283B8, &_s14ModelStructureO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000351B8);
  }

  return result;
}

unint64_t sub_10001D2B8()
{
  unint64_t result = qword_1000351C0;
  if (!qword_1000351C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028368, &_s14ModelStructureO15EmptyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000351C0);
  }

  return result;
}

unint64_t sub_10001D2FC()
{
  unint64_t result = qword_1000351C8;
  if (!qword_1000351C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028318, &_s14ModelStructureO18PipelineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000351C8);
  }

  return result;
}

unint64_t sub_10001D340()
{
  unint64_t result = qword_1000351D0;
  if (!qword_1000351D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000282F0, &_s14ModelStructureO8PipelineVN);
    atomic_store(result, (unint64_t *)&qword_1000351D0);
  }

  return result;
}

unint64_t sub_10001D384()
{
  unint64_t result = qword_1000351D8;
  if (!qword_1000351D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000282A0, &_s14ModelStructureO17ProgramCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000351D8);
  }

  return result;
}

unint64_t sub_10001D3C8()
{
  unint64_t result = qword_1000351E0;
  if (!qword_1000351E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026B50, &_s14ModelStructureO7ProgramVN);
    atomic_store(result, (unint64_t *)&qword_1000351E0);
  }

  return result;
}

unint64_t sub_10001D40C()
{
  unint64_t result = qword_1000351E8;
  if (!qword_1000351E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028250, &_s14ModelStructureO23NeuralNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000351E8);
  }

  return result;
}

unint64_t sub_10001D450()
{
  unint64_t result = qword_1000351F0;
  if (!qword_1000351F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026AB0, &_s14ModelStructureO13NeuralNetworkVN);
    atomic_store(result, (unint64_t *)&qword_1000351F0);
  }

  return result;
}

uint64_t sub_10001D498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100023A3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10001D4C0(uint64_t a1)
{
  unint64_t v2 = sub_100023388();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001D4E8(uint64_t a1)
{
  unint64_t v2 = sub_100023388();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001D510@<X0>(void *a1@<X0>, double *a2@<X8>)
{
  uint64_t v5 = sub_10000645C(&qword_100035780);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_100023388();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)(&_s4CostV10CodingKeysON, &_s4CostV10CodingKeysON, v11, v9, v10);
  if (v2) {
    return sub_10000D788(a1);
  }
  double v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_10000D788(a1);
  *a2 = v13;
  return result;
}

uint64_t sub_10001D628(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100035790);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  double v7 = *v1;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_10000649C(a1, v8);
  unint64_t v10 = sub_100023388();
  uint64_t v11 = dispatch thunk of Encoder.container<A>(keyedBy:)(&_s4CostV10CodingKeysON, &_s4CostV10CodingKeysON, v10, v8, v9);
  KeyedEncodingContainer.encode(_:forKey:)(v11, v3, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001D710(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(1701667182LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 1701869940 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease(0xE400000000000000LL, a2);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(1701869940LL, 0xE400000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_10001D7D8(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_1000351F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000649C(a1, v7);
  unint64_t v9 = sub_10001D978();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON,  &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    char v16 = 0;
    uint64_t v8 = KeyedDecodingContainer.decode(_:forKey:)(&v16, v3);
    uint64_t v12 = v11;
    v15[14] = 1;
    sub_10001D9BC();
    swift_bridgeObjectRetain(v12);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v13);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    sub_10000D788(a1);
    swift_bridgeObjectRelease(v12, v14);
  }

  return v8;
}

unint64_t sub_10001D978()
{
  unint64_t result = qword_100035200;
  if (!qword_100035200)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028200, &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035200);
  }

  return result;
}

unint64_t sub_10001D9BC()
{
  unint64_t result = qword_100035208;
  if (!qword_100035208)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000281D8, &_s14ModelStructureO7ProgramV9ValueTypeVN);
    atomic_store(result, (unint64_t *)&qword_100035208);
  }

  return result;
}

unint64_t sub_10001DA00()
{
  unint64_t result = qword_100035218;
  if (!qword_100035218)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000281B0, &_s14ModelStructureO7ProgramV9ValueTypeVN);
    atomic_store(result, (unint64_t *)&qword_100035218);
  }

  return result;
}

uint64_t sub_10001DA44(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65756C6176LL && a2 == 0xE500000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C6176LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 1701667182 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease(0xE400000000000000LL, a2);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(1701667182LL, 0xE400000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

void *sub_10001DB14(void *a1)
{
  uint64_t v43 = sub_10000645C(&qword_1000352E0);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v42 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_10000645C(&qword_1000352E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000645C(&qword_1000352F0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  uint64_t v44 = a1;
  uint64_t v13 = sub_10000649C(a1, v11);
  unint64_t v14 = sub_10001F400();
  uint64_t v15 = v45;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON,  &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON,  v14,  v11,  v12);
  if (!v15)
  {
    uint64_t v39 = v4;
    uint64_t v40 = v3;
    uint64_t v17 = v42;
    uint64_t v16 = v43;
    uint64_t v45 = v8;
    uint64_t v18 = KeyedDecodingContainer.allKeys.getter(v7);
    uint64_t v19 = v18;
    uint64_t v20 = v7;
    if (*(void *)(v18 + 16) == 1LL)
    {
      if ((*(_BYTE *)(v18 + 32) & 1) != 0)
      {
        char v47 = 1;
        unint64_t v21 = sub_10001F444();
        uint64_t v22 = KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON,  &v47,  v7,  &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON,  v21);
        char v23 = v10;
        uint64_t v24 = v16;
        uint64_t v13 = (void *)KeyedDecodingContainer.decode(_:forKey:)(v22, v16);
        uint64_t v25 = v45;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v24);
        swift_bridgeObjectRelease(v19, v37);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v20);
      }

      else
      {
        char v46 = 0;
        unint64_t v32 = sub_10001F488();
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON,  &v46,  v7,  &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON,  v32);
        sub_10001F4CC();
        uint64_t v34 = v40;
        KeyedDecodingContainer.decode<A>(_:forKey:)(v35);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v34);
        swift_bridgeObjectRelease(v19, v36);
        (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v7);
        uint64_t v13 = 0LL;
      }
    }

    else
    {
      uint64_t v26 = type metadata accessor for DecodingError(0LL);
      swift_allocError(v26, &protocol witness table for DecodingError, 0LL, 0LL);
      int v28 = v27;
      sub_10000645C(&qword_100034E48);
      uint64_t v13 = v10;
      void *v28 = &_s14ModelStructureO7ProgramV7BindingON;
      uint64_t v29 = KeyedDecodingContainer.codingPath.getter(v7);
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v29,  0xD00000000000002BLL,  0x8000000100029360LL,  0LL);
      uint64_t v30 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104LL))( v28,  enum case for DecodingError.typeMismatch(_:),  v26);
      swift_willThrow(v30);
      swift_bridgeObjectRelease(v19, v31);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v7);
    }
  }

  sub_10000D788(v44);
  return v13;
}

uint64_t sub_10001DEF4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73676E69646E6962LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(a2, a2);
    char v6 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73676E69646E6962LL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v6 = v4 ^ 1;
  }

  return v6 & 1;
}

uint64_t sub_10001DF78()
{
  return 0x73676E69646E6962LL;
}

void *sub_10001DF90(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100035338);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_10000649C(a1, v7);
  unint64_t v10 = sub_10001F554();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON,  &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON,  v10,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_100035348);
    sub_100023454( &qword_100035350,  &qword_100035348,  (void (*)(void))sub_10001F598,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v9 = v13;
    sub_10000D788(a1);
  }

  return v9;
}

uint64_t sub_10001E0DC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737475706E69LL && a2 == 0xE600000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x737475706E69LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x6B636F6C62LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease(0xE500000000000000LL, a2);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6B636F6C62LL, 0xE500000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_10001E1B4(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100035410);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000649C(a1, v7);
  unint64_t v9 = sub_10001FA80();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON,  &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_100035248);
    char v19 = 0;
    sub_100023454( &qword_100035250,  &qword_100035248,  (void (*)(void))sub_10001F0B8,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v18);
    uint64_t v7 = v18[0];
    char v19 = 1;
    sub_10001F0FC();
    swift_bridgeObjectRetain(v7);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v18);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v11 = v18[0];
    uint64_t v12 = v18[1];
    uint64_t v13 = v18[2];
    swift_bridgeObjectRetain(v18[0]);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v13);
    sub_10000D788(a1);
    swift_bridgeObjectRelease(v13, v14);
    swift_bridgeObjectRelease(v12, v15);
    swift_bridgeObjectRelease(v11, v16);
    swift_bridgeObjectRelease(v7, v17);
  }

  return v7;
}

uint64_t sub_10001E3C8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x737475706E69LL && a2 == 0xE600000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x737475706E69LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x614E74757074756FLL && a2 == 0xEB0000000073656DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x614E74757074756FLL, 0xEB0000000073656DLL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0x6F6974617265706FLL && a2 == 0xEA0000000000736ELL)
  {
    swift_bridgeObjectRelease(0xEA0000000000736ELL, a2);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6F6974617265706FLL, 0xEA0000000000736ELL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_10001E51C(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100035378);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000649C(a1, v7);
  unint64_t v9 = sub_10001F620();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON,  &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_100035248);
    char v17 = 0;
    sub_100023454( &qword_100035250,  &qword_100035248,  (void (*)(void))sub_10001F0B8,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v18);
    uint64_t v7 = v18;
    sub_10000645C(&qword_100035388);
    char v17 = 1;
    sub_10001F6A8( &qword_100035390,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v7);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v18);
    uint64_t v11 = v18;
    sub_10000645C(&qword_100035398);
    char v17 = 2;
    sub_100023454( &qword_1000353A0,  &qword_100035398,  (void (*)(void))sub_10001F664,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v11);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v18);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v12 = v18;
    swift_bridgeObjectRetain(v18);
    sub_10000D788(a1);
    swift_bridgeObjectRelease(v12, v13);
    swift_bridgeObjectRelease(v11, v14);
    swift_bridgeObjectRelease(v7, v15);
  }

  return v7;
}

uint64_t sub_10001E7E8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F74617265706FLL && a2 == 0xEC000000656D614ELL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x726F74617265706FLL, 0xEC000000656D614ELL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x737475706E69LL && a2 == 0xE600000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x737475706E69LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0x7374757074756FLL && a2 == 0xE700000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7374757074756FLL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2LL;
  }

  else if (a1 == 0x736B636F6C62LL && a2 == 0xE600000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x736B636F6C62LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 3LL;
  }

  else if (a1 == 0x7355656369766564LL && a2 == 0xEB00000000656761LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7355656369766564LL, 0xEB00000000656761LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 4LL;
  }

  else if (a1 == 1953722211 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease(0xE400000000000000LL, a2);
    return 5LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(1953722211LL, 0xE400000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_10001EA40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_10000645C(&qword_100035220);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_10001F004();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON,  &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON,  v11,  v9,  v10);
  if (v2) {
    return sub_10000D788(a1);
  }
  LOBYTE(v46) = 0;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v46, v5);
  uint64_t v14 = v13;
  sub_10000645C(&qword_100035230);
  char v50 = 1;
  sub_10001F1F4( &qword_100035238,  (void (*)(void))sub_10001F074,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  swift_bridgeObjectRetain(v14);
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v46);
  uint64_t v41 = v12;
  uint64_t v45 = v14;
  uint64_t v15 = v46;
  sub_10000645C(&qword_100035248);
  char v50 = 2;
  sub_100023454( &qword_100035250,  &qword_100035248,  (void (*)(void))sub_10001F0B8,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain(v15);
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v46);
  uint64_t v40 = v15;
  uint64_t v16 = v46;
  sub_10000645C(&qword_100035260);
  char v50 = 3;
  sub_100023454( &qword_100035268,  &qword_100035260,  (void (*)(void))sub_10001F0FC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  uint64_t v44 = v16;
  swift_bridgeObjectRetain(v16);
  uint64_t v39 = 0LL;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v46);
  uint64_t v17 = v46;
  char v50 = 4;
  unint64_t v18 = sub_10001F140();
  swift_bridgeObjectRetain(v17);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v46, &_s11DeviceUsageVN, &v50, v5, &_s11DeviceUsageVN, v18);
  uint64_t v38 = v17;
  uint64_t v19 = v47;
  char v50 = 5;
  uint64_t v43 = v46;
  uint64_t v37 = v48;
  sub_10001F184(v46, v47, v48);
  unint64_t v20 = sub_10001F1B0();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v46, &_s4CostVN, &v50, v5, &_s4CostVN, v20);
  uint64_t v42 = v19;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v39 = v46;
  int v49 = v47;
  swift_bridgeObjectRetain(v45);
  uint64_t v21 = v40;
  swift_bridgeObjectRetain(v40);
  uint64_t v22 = v44;
  swift_bridgeObjectRetain(v44);
  uint64_t v23 = v38;
  swift_bridgeObjectRetain(v38);
  uint64_t v24 = v43;
  uint64_t v25 = v37;
  sub_10001F184(v43, v19, v37);
  sub_10001F048(v24, v19, v25);
  uint64_t v26 = v45;
  swift_bridgeObjectRelease(v45, v27);
  swift_bridgeObjectRelease(v21, v28);
  swift_bridgeObjectRelease(v22, v29);
  swift_bridgeObjectRelease(v23, v30);
  sub_10000D788(a1);
  swift_bridgeObjectRelease(v23, v31);
  swift_bridgeObjectRelease(v22, v32);
  swift_bridgeObjectRelease(v21, v33);
  swift_bridgeObjectRelease(v26, v34);
  uint64_t v35 = v42;
  uint64_t result = sub_10001F048(v24, v42, v25);
  *(void *)a2 = v41;
  *(void *)(a2 + 8) = v26;
  *(void *)(a2 + 16) = v21;
  *(void *)(a2 + 24) = v22;
  *(void *)(a2 + 32) = v23;
  *(void *)(a2 + 40) = v24;
  *(void *)(a2 + 48) = v35;
  *(void *)(a2 + 56) = v25;
  *(void *)(a2 + 64) = v39;
  *(_BYTE *)(a2 + 72) = v49;
  return result;
}

unint64_t sub_10001F004()
{
  unint64_t result = qword_100035228;
  if (!qword_100035228)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028160, &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035228);
  }

  return result;
}

uint64_t sub_10001F048(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRelease(result, a2);
    return swift_bridgeObjectRelease(a3, v4);
  }

  return result;
}

unint64_t sub_10001F074()
{
  unint64_t result = qword_100035240;
  if (!qword_100035240)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026C18, &_s14ModelStructureO7ProgramV8ArgumentVN);
    atomic_store(result, (unint64_t *)&qword_100035240);
  }

  return result;
}

unint64_t sub_10001F0B8()
{
  unint64_t result = qword_100035258;
  if (!qword_100035258)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026D08, &_s14ModelStructureO7ProgramV14NamedValueTypeVN);
    atomic_store(result, (unint64_t *)&qword_100035258);
  }

  return result;
}

unint64_t sub_10001F0FC()
{
  unint64_t result = qword_100035270;
  if (!qword_100035270)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026BC8, &_s14ModelStructureO7ProgramV5BlockVN);
    atomic_store(result, (unint64_t *)&qword_100035270);
  }

  return result;
}

unint64_t sub_10001F140()
{
  unint64_t result = qword_100035278;
  if (!qword_100035278)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026A38, &_s11DeviceUsageVN);
    atomic_store(result, (unint64_t *)&qword_100035278);
  }

  return result;
}

uint64_t sub_10001F184(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRetain(result);
    return swift_bridgeObjectRetain(a3);
  }

  return result;
}

unint64_t sub_10001F1B0()
{
  unint64_t result = qword_100035280;
  if (!qword_100035280)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028138, &_s4CostVN);
    atomic_store(result, (unint64_t *)&qword_100035280);
  }

  return result;
}

uint64_t sub_10001F1F4(unint64_t *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_100006568(&qword_100035230);
    a2();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10001F268()
{
  unint64_t result = qword_100035298;
  if (!qword_100035298)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026BF0, &_s14ModelStructureO7ProgramV8ArgumentVN);
    atomic_store(result, (unint64_t *)&qword_100035298);
  }

  return result;
}

unint64_t sub_10001F2AC()
{
  unint64_t result = qword_1000352A8;
  if (!qword_1000352A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026CE0, &_s14ModelStructureO7ProgramV14NamedValueTypeVN);
    atomic_store(result, (unint64_t *)&qword_1000352A8);
  }

  return result;
}

unint64_t sub_10001F2F0()
{
  unint64_t result = qword_1000352B8;
  if (!qword_1000352B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026BA0, &_s14ModelStructureO7ProgramV5BlockVN);
    atomic_store(result, (unint64_t *)&qword_1000352B8);
  }

  return result;
}

unint64_t sub_10001F334()
{
  unint64_t result = qword_1000352C8;
  if (!qword_1000352C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026A10, &_s11DeviceUsageVN);
    atomic_store(result, (unint64_t *)&qword_1000352C8);
  }

  return result;
}

uint64_t sub_10001F378(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000645C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

unint64_t sub_10001F3BC()
{
  unint64_t result = qword_1000352D8;
  if (!qword_1000352D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028110, &_s4CostVN);
    atomic_store(result, (unint64_t *)&qword_1000352D8);
  }

  return result;
}

unint64_t sub_10001F400()
{
  unint64_t result = qword_1000352F8;
  if (!qword_1000352F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000280C0, &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000352F8);
  }

  return result;
}

unint64_t sub_10001F444()
{
  unint64_t result = qword_100035300;
  if (!qword_100035300)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028070, &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035300);
  }

  return result;
}

unint64_t sub_10001F488()
{
  unint64_t result = qword_100035308;
  if (!qword_100035308)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028020, &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035308);
  }

  return result;
}

unint64_t sub_10001F4CC()
{
  unint64_t result = qword_100035310;
  if (!qword_100035310)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027FF8, &_s14ModelStructureO7ProgramV5ValueVN);
    atomic_store(result, (unint64_t *)&qword_100035310);
  }

  return result;
}

unint64_t sub_10001F510()
{
  unint64_t result = qword_100035330;
  if (!qword_100035330)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027FD0, &_s14ModelStructureO7ProgramV5ValueVN);
    atomic_store(result, (unint64_t *)&qword_100035330);
  }

  return result;
}

unint64_t sub_10001F554()
{
  unint64_t result = qword_100035340;
  if (!qword_100035340)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027F80, &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035340);
  }

  return result;
}

unint64_t sub_10001F598()
{
  unint64_t result = qword_100035358;
  if (!qword_100035358)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026C68, &_s14ModelStructureO7ProgramV7BindingON);
    atomic_store(result, (unint64_t *)&qword_100035358);
  }

  return result;
}

unint64_t sub_10001F5DC()
{
  unint64_t result = qword_100035370;
  if (!qword_100035370)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026C40, &_s14ModelStructureO7ProgramV7BindingON);
    atomic_store(result, (unint64_t *)&qword_100035370);
  }

  return result;
}

unint64_t sub_10001F620()
{
  unint64_t result = qword_100035380;
  if (!qword_100035380)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027F30, &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035380);
  }

  return result;
}

unint64_t sub_10001F664()
{
  unint64_t result = qword_1000353A8;
  if (!qword_1000353A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026CB8, &_s14ModelStructureO7ProgramV9OperationVN);
    atomic_store(result, (unint64_t *)&qword_1000353A8);
  }

  return result;
}

uint64_t sub_10001F6A8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_100006568(&qword_100035388);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10001F708()
{
  unint64_t result = qword_1000353C8;
  if (!qword_1000353C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026C90, &_s14ModelStructureO7ProgramV9OperationVN);
    atomic_store(result, (unint64_t *)&qword_1000353C8);
  }

  return result;
}

uint64_t sub_10001F74C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F6974636E7566LL && a2 == 0xE900000000000073LL)
  {
    swift_bridgeObjectRelease(a2, a2);
    char v6 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6974636E7566LL, 0xE900000000000073LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v6 = v4 ^ 1;
  }

  return v6 & 1;
}

uint64_t sub_10001F7D8()
{
  return 0x6E6F6974636E7566LL;
}

void *sub_10001F7F4(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_1000353D0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_10000649C(a1, v7);
  unint64_t v10 = sub_10001F940();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO7ProgramV10CodingKeysON,  &_s14ModelStructureO7ProgramV10CodingKeysON,  v10,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_1000353E0);
    sub_10001F984( &qword_1000353E8,  (void (*)(void))sub_10001F9F8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v9 = v13;
    sub_10000D788(a1);
  }

  return v9;
}

unint64_t sub_10001F940()
{
  unint64_t result = qword_1000353D8;
  if (!qword_1000353D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027EE0, &_s14ModelStructureO7ProgramV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000353D8);
  }

  return result;
}

uint64_t sub_10001F984(unint64_t *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_100006568(&qword_1000353E0);
    a2();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10001F9F8()
{
  unint64_t result = qword_1000353F0;
  if (!qword_1000353F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026B28, &_s14ModelStructureO7ProgramV8FunctionVN);
    atomic_store(result, (unint64_t *)&qword_1000353F0);
  }

  return result;
}

unint64_t sub_10001FA3C()
{
  unint64_t result = qword_100035408;
  if (!qword_100035408)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026B00, &_s14ModelStructureO7ProgramV8FunctionVN);
    atomic_store(result, (unint64_t *)&qword_100035408);
  }

  return result;
}

unint64_t sub_10001FA80()
{
  unint64_t result = qword_100035418;
  if (!qword_100035418)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027E90, &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035418);
  }

  return result;
}

uint64_t sub_10001FAC4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(1701667182LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 1701869940 && a2 == 0xE400000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(1701869940LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0x6D614E7475706E69LL && a2 == 0xEA00000000007365LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6D614E7475706E69LL, 0xEA00000000007365LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2LL;
  }

  else if (a1 == 0x614E74757074756FLL && a2 == 0xEB0000000073656DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x614E74757074756FLL, 0xEB0000000073656DLL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 3LL;
  }

  else if (a1 == 0x7355656369766564LL && a2 == 0xEB00000000656761LL)
  {
    swift_bridgeObjectRelease(0xEB00000000656761LL, a2);
    return 4LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7355656369766564LL, 0xEB00000000656761LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 4LL;
    }
    else {
      return 5LL;
    }
  }

uint64_t sub_10001FCC8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000645C(&qword_100035468);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000649C(a1, v9);
  unint64_t v11 = sub_1000203C4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON,  &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON,  v11,  v9,  v10);
  if (v2) {
    return sub_10000D788(a1);
  }
  LOBYTE(v44[0]) = 0;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(v44, v5);
  uint64_t v14 = v13;
  uint64_t v43 = v12;
  LOBYTE(v44[0]) = 1;
  swift_bridgeObjectRetain(v13);
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)(v44, v5);
  uint64_t v17 = v16;
  uint64_t v39 = v15;
  uint64_t v42 = v14;
  sub_10000645C(&qword_100035388);
  char v45 = 2;
  uint64_t v18 = sub_10001F6A8( &qword_100035390,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain(v17);
  uint64_t v40 = v18;
  uint64_t v41 = 0LL;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v44);
  char v45 = 3;
  uint64_t v38 = v44[0];
  swift_bridgeObjectRetain(v44[0]);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v44);
  uint64_t v19 = v44[0];
  char v45 = 4;
  unint64_t v20 = sub_10001F140();
  uint64_t v40 = v19;
  swift_bridgeObjectRetain(v19);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v44, &_s11DeviceUsageVN, &v45, v5, &_s11DeviceUsageVN, v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v21 = v44[0];
  uint64_t v22 = v44[1];
  uint64_t v41 = v44[0];
  uint64_t v23 = v44[2];
  uint64_t v24 = v42;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(v17);
  uint64_t v25 = v38;
  swift_bridgeObjectRetain(v38);
  uint64_t v26 = v40;
  swift_bridgeObjectRetain(v40);
  sub_10001F184(v21, v22, v23);
  swift_bridgeObjectRelease(v24, v27);
  swift_bridgeObjectRelease(v17, v28);
  swift_bridgeObjectRelease(v25, v29);
  swift_bridgeObjectRelease(v26, v30);
  sub_10000D788(a1);
  swift_bridgeObjectRelease(v26, v31);
  swift_bridgeObjectRelease(v25, v32);
  swift_bridgeObjectRelease(v17, v33);
  swift_bridgeObjectRelease(v24, v34);
  uint64_t v35 = v41;
  uint64_t result = sub_10001F048(v41, v22, v23);
  *a2 = v43;
  a2[1] = v24;
  a2[2] = v39;
  a2[3] = v17;
  a2[4] = v25;
  a2[5] = v26;
  a2[6] = v35;
  a2[7] = v22;
  a2[8] = v23;
  return result;
}

uint64_t sub_10002011C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73726579616CLL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(a2, a2);
    char v6 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73726579616CLL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v6 = v4 ^ 1;
  }

  return v6 & 1;
}

uint64_t sub_100020198()
{
  return 0x73726579616CLL;
}

void *sub_1000201AC(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100035428);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_10000649C(a1, v7);
  unint64_t v10 = sub_1000202F8();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO13NeuralNetworkV10CodingKeysON,  &_s14ModelStructureO13NeuralNetworkV10CodingKeysON,  v10,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_100035438);
    sub_100023454( &qword_100035440,  &qword_100035438,  (void (*)(void))sub_10002033C,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v9 = v13;
    sub_10000D788(a1);
  }

  return v9;
}

unint64_t sub_1000202F8()
{
  unint64_t result = qword_100035430;
  if (!qword_100035430)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027E40, &_s14ModelStructureO13NeuralNetworkV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035430);
  }

  return result;
}

unint64_t sub_10002033C()
{
  unint64_t result = qword_100035448;
  if (!qword_100035448)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026A88, &_s14ModelStructureO13NeuralNetworkV5LayerVN);
    atomic_store(result, (unint64_t *)&qword_100035448);
  }

  return result;
}

unint64_t sub_100020380()
{
  unint64_t result = qword_100035460;
  if (!qword_100035460)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026A60, &_s14ModelStructureO13NeuralNetworkV5LayerVN);
    atomic_store(result, (unint64_t *)&qword_100035460);
  }

  return result;
}

unint64_t sub_1000203C4()
{
  unint64_t result = qword_100035470;
  if (!qword_100035470)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027DF0, &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035470);
  }

  return result;
}

uint64_t sub_100020408(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C65646F4D627573LL && a2 == 0xED000073656D614ELL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C65646F4D627573LL, 0xED000073656D614ELL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x6C65646F4D627573LL && a2 == 0xE900000000000073LL)
  {
    swift_bridgeObjectRelease(0xE900000000000073LL, a2);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6C65646F4D627573LL, 0xE900000000000073LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_100020508(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_1000357C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000649C(a1, v7);
  unint64_t v9 = sub_100023300();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO8PipelineV10CodingKeysON,  &_s14ModelStructureO8PipelineV10CodingKeysON,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_100035388);
    HIBYTE(v14) = 0;
    sub_10001F6A8( &qword_100035390,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15);
    uint64_t v7 = v15;
    sub_10000645C(&qword_100035760);
    HIBYTE(v14) = 1;
    sub_100023454( &qword_1000357C8,  &qword_100035760,  (void (*)(void))sub_1000234B8,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v7);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v11 = v15;
    swift_bridgeObjectRetain(v15);
    sub_10000D788(a1);
    swift_bridgeObjectRelease(v11, v12);
    swift_bridgeObjectRelease(v7, v13);
  }

  return v7;
}

uint64_t sub_100020714(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x654E6C617275656ELL && a2 == 0xED00006B726F7774LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x654E6C617275656ELL, 0xED00006B726F7774LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x6D6172676F7270LL && a2 == 0xE700000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6D6172676F7270LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0x656E696C65706970LL && a2 == 0xE800000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656E696C65706970LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2LL;
  }

  else if (a1 == 0x7974706D65LL && a2 == 0xE500000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7974706D65LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 3LL;
  }

  else if (a1 == 0x726F707075736E75LL && a2 == 0xEB00000000646574LL)
  {
    swift_bridgeObjectRelease(0xEB00000000646574LL, a2);
    return 4LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x726F707075736E75LL, 0xEB00000000646574LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 4LL;
    }
    else {
      return 5LL;
    }
  }

void *sub_100020930(void *a1)
{
  uint64_t v2 = sub_10000645C(&qword_100035528);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  __chkstk_darwin(v2);
  uint64_t v39 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_10000645C(&qword_100035530);
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  __chkstk_darwin(v4);
  uint64_t v36 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = sub_10000645C(&qword_100035538);
  uint64_t v34 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v37 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v38 = sub_10000645C(&qword_100035540);
  void v30[3] = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v35 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10000645C(&qword_100035548);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_10000645C(&qword_100035550);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = a1[3];
  uint64_t v16 = a1[4];
  uint64_t v42 = a1;
  uint64_t v18 = sub_10000649C(a1, v17);
  unint64_t v19 = sub_10001D230();
  unint64_t v20 = v43;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s14ModelStructureO10CodingKeysON,  &_s14ModelStructureO10CodingKeysON,  v19,  v17,  v16);
  if (!v20)
  {
    uint64_t v43 = v11;
    v30[1] = v9;
    v30[2] = v8;
    uint64_t v21 = KeyedDecodingContainer.allKeys.getter(v12);
    if (*(void *)(v21 + 16) == 1LL) {
      __asm { BR              X10 }
    }

    uint64_t v22 = v21;
    uint64_t v18 = v15;
    uint64_t v23 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v23, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v25 = v24;
    sub_10000645C(&qword_100034E48);
    void *v25 = &_s14ModelStructureON;
    uint64_t v26 = KeyedDecodingContainer.codingPath.getter(v12);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v26,  0xD00000000000002BLL,  0x8000000100029360LL,  0LL);
    uint64_t v27 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104LL))( v25,  enum case for DecodingError.typeMismatch(_:),  v23);
    swift_willThrow(v27);
    swift_bridgeObjectRelease(v22, v28);
    (*(void (**)(void *, uint64_t))(v13 + 8))(v18, v12);
  }

  sub_10000D788(v42);
  return v18;
}

uint64_t sub_100020F9C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574726F70707573LL && a2 == 0xE900000000000064LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574726F70707573LL, 0xE900000000000064LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x726F707075736E75LL && a2 == 0xEB00000000646574LL)
  {
    swift_bridgeObjectRelease(0xEB00000000646574LL, a2);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x726F707075736E75LL, 0xEB00000000646574LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_10002109C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000LL)
  {
    swift_bridgeObjectRelease(a2, a2);
    char v6 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(12383LL, 0xE200000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v6 = v4 ^ 1;
  }

  return v6 & 1;
}

uint64_t sub_100021108()
{
  return 12383LL;
}

void *sub_100021114(void *a1)
{
  uint64_t v2 = sub_10000645C(&qword_1000354D0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  uint64_t v37 = v3;
  __chkstk_darwin(v2);
  uint64_t v38 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_10000645C(&qword_1000354D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10000645C(&qword_1000354E0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  uint64_t v39 = a1;
  uint64_t v15 = sub_10000649C(a1, v13);
  unint64_t v16 = sub_100021A84();
  uint64_t v17 = v40;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s11DeviceUsageV12SupportStateO10CodingKeysON,  &_s11DeviceUsageV12SupportStateO10CodingKeysON,  v16,  v13,  v14);
  if (!v17)
  {
    uint64_t v18 = v5;
    unint64_t v19 = v38;
    uint64_t v40 = v10;
    unint64_t v20 = v12;
    uint64_t v21 = KeyedDecodingContainer.allKeys.getter(v9);
    uint64_t v22 = v21;
    if (*(void *)(v21 + 16) == 1LL)
    {
      int v42 = *(unsigned __int8 *)(v21 + 32);
      if ((v42 & 1) != 0)
      {
        char v44 = 1;
        unint64_t v23 = sub_100021AC8();
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON,  &v44,  v9,  &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON,  v23);
        sub_100021B0C();
        uint64_t v33 = v36;
        KeyedDecodingContainer.decode<A>(_:forKey:)(&v41);
        (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v33);
        swift_bridgeObjectRelease(v22, v34);
        (*(void (**)(void *, uint64_t))(v40 + 8))(v20, v9);
        uint64_t v15 = v41;
      }

      else
      {
        char v43 = 0;
        unint64_t v32 = sub_100021B50();
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON,  &v43,  v9,  &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON,  v32);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v18);
        swift_bridgeObjectRelease(v22, v35);
        (*(void (**)(void *, uint64_t))(v40 + 8))(v20, v9);
        uint64_t v15 = 0LL;
      }
    }

    else
    {
      uint64_t v24 = type metadata accessor for DecodingError(0LL);
      swift_allocError(v24, &protocol witness table for DecodingError, 0LL, 0LL);
      uint64_t v25 = v22;
      uint64_t v27 = v26;
      sub_10000645C(&qword_100034E48);
      void *v27 = &_s11DeviceUsageV12SupportStateON;
      uint64_t v15 = v20;
      uint64_t v28 = KeyedDecodingContainer.codingPath.getter(v9);
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v28,  0xD00000000000002BLL,  0x8000000100029360LL,  0LL);
      uint64_t v29 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104LL))( v27,  enum case for DecodingError.typeMismatch(_:),  v24);
      swift_willThrow(v29);
      swift_bridgeObjectRelease(v25, v30);
      (*(void (**)(void *, uint64_t))(v40 + 8))(v20, v9);
    }
  }

  sub_10000D788(v39);
  return v15;
}

uint64_t sub_1000214B8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010LL && a2 == 0x8000000100029660LL)
  {
    swift_bridgeObjectRelease(0x8000000100029660LL, a2);
    char v3 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100029660LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v3 = v4 ^ 1;
  }

  return v3 & 1;
}

uint64_t sub_10002153C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6574726F70707573LL && a2 == 0xE900000000000064LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574726F70707573LL, 0xE900000000000064LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0LL;
  }

  else if (a1 == 0x6572726566657270LL && a2 == 0xE900000000000064LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6572726566657270LL, 0xE900000000000064LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1LL;
  }

  else if (a1 == 0xD000000000000010LL && a2 == 0x8000000100029640LL)
  {
    swift_bridgeObjectRelease(0x8000000100029640LL, a2);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100029640LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v7);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_10002168C(void *a1)
{
  uint64_t v3 = sub_10000645C(&qword_100035480);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_10000649C(a1, v7);
  unint64_t v9 = sub_1000218F8();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &_s11DeviceUsageV10CodingKeysON,  &_s11DeviceUsageV10CodingKeysON,  v9,  v7,  v8);
  if (v1)
  {
    sub_10000D788(a1);
  }

  else
  {
    sub_10000645C(&qword_1000349F0);
    HIBYTE(v14) = 0;
    sub_100023454( &qword_100035490,  &qword_1000349F0,  (void (*)(void))sub_10002193C,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15);
    uint64_t v7 = v15;
    HIBYTE(v14) = 1;
    sub_10002193C();
    swift_bridgeObjectRetain(v7);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15);
    sub_10000645C(&qword_1000354A0);
    HIBYTE(v14) = 2;
    sub_1000219C4( &qword_1000354A8,  (void (*)(void))sub_10002193C,  (void (*)(void))sub_100021980,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v11 = v15;
    swift_bridgeObjectRetain(v15);
    sub_10000D788(a1);
    swift_bridgeObjectRelease(v11, v12);
    swift_bridgeObjectRelease(v7, v13);
  }

  return v7;
}

unint64_t sub_1000218F8()
{
  unint64_t result = qword_100035488;
  if (!qword_100035488)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027DA0, &_s11DeviceUsageV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035488);
  }

  return result;
}

unint64_t sub_10002193C()
{
  unint64_t result = qword_100035498;
  if (!qword_100035498)
  {
    unint64_t result = swift_getWitnessTable(&unk_100025F74, &_s13ComputeDeviceVN);
    atomic_store(result, (unint64_t *)&qword_100035498);
  }

  return result;
}

unint64_t sub_100021980()
{
  unint64_t result = qword_1000354B0;
  if (!qword_1000354B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000269E8, &_s11DeviceUsageV12SupportStateON);
    atomic_store(result, (unint64_t *)&qword_1000354B0);
  }

  return result;
}

uint64_t sub_1000219C4(unint64_t *a1, void (*a2)(void), void (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v9 = sub_100006568(&qword_1000354A0);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100021A40()
{
  unint64_t result = qword_1000354C8;
  if (!qword_1000354C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000269C0, &_s11DeviceUsageV12SupportStateON);
    atomic_store(result, (unint64_t *)&qword_1000354C8);
  }

  return result;
}

unint64_t sub_100021A84()
{
  unint64_t result = qword_1000354E8;
  if (!qword_1000354E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027D50, &_s11DeviceUsageV12SupportStateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000354E8);
  }

  return result;
}

unint64_t sub_100021AC8()
{
  unint64_t result = qword_1000354F0;
  if (!qword_1000354F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027D00, &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000354F0);
  }

  return result;
}

unint64_t sub_100021B0C()
{
  unint64_t result = qword_1000354F8;
  if (!qword_1000354F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027CD8, &_s11DeviceUsageV6ReasonVN);
    atomic_store(result, (unint64_t *)&qword_1000354F8);
  }

  return result;
}

unint64_t sub_100021B50()
{
  unint64_t result = qword_100035500;
  if (!qword_100035500)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027C88, &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035500);
  }

  return result;
}

unint64_t sub_100021B94()
{
  unint64_t result = qword_100035520;
  if (!qword_100035520)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027C60, &_s11DeviceUsageV6ReasonVN);
    atomic_store(result, (unint64_t *)&qword_100035520);
  }

  return result;
}

unint64_t sub_100021BD8()
{
  unint64_t result = qword_100035558;
  if (!qword_100035558)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027C38, &_s14ModelStructureO8PipelineVN);
    atomic_store(result, (unint64_t *)&qword_100035558);
  }

  return result;
}

unint64_t sub_100021C1C()
{
  unint64_t result = qword_100035560;
  if (!qword_100035560)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026B78, &_s14ModelStructureO7ProgramVN);
    atomic_store(result, (unint64_t *)&qword_100035560);
  }

  return result;
}

unint64_t sub_100021C60()
{
  unint64_t result = qword_100035568;
  if (!qword_100035568)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026AD8, &_s14ModelStructureO13NeuralNetworkVN);
    atomic_store(result, (unint64_t *)&qword_100035568);
  }

  return result;
}

ValueMetadata *_s11DeviceUsageV12SupportStateO10CodingKeysOMa()
{
  return &_s11DeviceUsageV12SupportStateO10CodingKeysON;
}

ValueMetadata *_s11DeviceUsageV12SupportStateO19SupportedCodingKeysOMa()
{
  return &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON;
}

ValueMetadata *_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysOMa()
{
  return &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON;
}

ValueMetadata *_s11DeviceUsageV10CodingKeysOMa()
{
  return &_s11DeviceUsageV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysOMa()
{
  return &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO13NeuralNetworkV10CodingKeysOMa()
{
  return &_s14ModelStructureO13NeuralNetworkV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV8FunctionV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV10CodingKeysON;
}

uint64_t _s11DeviceUsageV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_100021D90 + 4 * byte_1000268EE[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100021DC4 + 4 * byte_1000268E9[v4]))();
}

uint64_t sub_100021DC4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100021DCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100021DD4LL);
  }
  return result;
}

uint64_t sub_100021DE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100021DE8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_100021DEC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100021DF4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV5BlockV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingO10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON;
}

uint64_t _s14ModelStructureO7ProgramV9OperationV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_100021E9C + 4 * byte_1000268F8[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100021ED0 + 4 * byte_1000268F3[v4]))();
}

uint64_t sub_100021ED0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100021ED8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100021EE0LL);
  }
  return result;
}

uint64_t sub_100021EEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100021EF4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_100021EF8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100021F00(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14ModelStructureO7ProgramV9OperationV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON;
}

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t _s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_100022008 + 4 * byte_100026902[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10002203C + 4 * byte_1000268FD[v4]))();
}

uint64_t sub_10002203C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022044(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10002204CLL);
  }
  return result;
}

uint64_t sub_100022058(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100022060LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_100022064(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002206C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14ModelStructureO10CodingKeysOMa()
{
  return &_s14ModelStructureO10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO23NeuralNetworkCodingKeysOMa()
{
  return &_s14ModelStructureO23NeuralNetworkCodingKeysON;
}

ValueMetadata *_s14ModelStructureO17ProgramCodingKeysOMa()
{
  return &_s14ModelStructureO17ProgramCodingKeysON;
}

ValueMetadata *_s14ModelStructureO18PipelineCodingKeysOMa()
{
  return &_s14ModelStructureO18PipelineCodingKeysON;
}

ValueMetadata *_s14ModelStructureO15EmptyCodingKeysOMa()
{
  return &_s14ModelStructureO15EmptyCodingKeysON;
}

ValueMetadata *_s14ModelStructureO21UnsupportedCodingKeysOMa()
{
  return &_s14ModelStructureO21UnsupportedCodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV9ValueTypeVMa()
{
  return &_s14ModelStructureO7ProgramV9ValueTypeVN;
}

ValueMetadata *_s4CostVMa()
{
  return &_s4CostVN;
}

ValueMetadata *_s14ModelStructureO7ProgramV5ValueVMa()
{
  return &_s14ModelStructureO7ProgramV5ValueVN;
}

ValueMetadata *_s11DeviceUsageV6ReasonVMa()
{
  return &_s11DeviceUsageV6ReasonVN;
}

uint64_t _s14ModelStructureO8PipelineVwxx(void *a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a1[1], v3);
}

uint64_t *_s14ModelStructureO8PipelineVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t *_s14ModelStructureO8PipelineVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  uint64_t v7 = a2[1];
  uint64_t v8 = a1[1];
  a1[1] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  return a1;
}

void *_s14ModelStructureO8PipelineVwta(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4, v5);
  return a1;
}

ValueMetadata *_s14ModelStructureO8PipelineVMa()
{
  return &_s14ModelStructureO8PipelineVN;
}

unint64_t sub_100022224()
{
  unint64_t result = qword_100035570;
  if (!qword_100035570)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026F88, &_s14ModelStructureO18PipelineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035570);
  }

  return result;
}

unint64_t sub_10002226C()
{
  unint64_t result = qword_100035578;
  if (!qword_100035578)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027040, &_s14ModelStructureO17ProgramCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035578);
  }

  return result;
}

unint64_t sub_1000222B4()
{
  unint64_t result = qword_100035580;
  if (!qword_100035580)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000270F8, &_s14ModelStructureO23NeuralNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035580);
  }

  return result;
}

unint64_t sub_1000222FC()
{
  unint64_t result = qword_100035588;
  if (!qword_100035588)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000271B0, &_s14ModelStructureO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035588);
  }

  return result;
}

unint64_t sub_100022344()
{
  unint64_t result = qword_100035590;
  if (!qword_100035590)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027268, &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035590);
  }

  return result;
}

unint64_t sub_10002238C()
{
  unint64_t result = qword_100035598;
  if (!qword_100035598)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027320, &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035598);
  }

  return result;
}

unint64_t sub_1000223D4()
{
  unint64_t result = qword_1000355A0;
  if (!qword_1000355A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000273D8, &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355A0);
  }

  return result;
}

unint64_t sub_10002241C()
{
  unint64_t result = qword_1000355A8;
  if (!qword_1000355A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027490, &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355A8);
  }

  return result;
}

unint64_t sub_100022464()
{
  unint64_t result = qword_1000355B0;
  if (!qword_1000355B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027548, &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355B0);
  }

  return result;
}

unint64_t sub_1000224AC()
{
  unint64_t result = qword_1000355B8;
  if (!qword_1000355B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027600, &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355B8);
  }

  return result;
}

unint64_t sub_1000224F4()
{
  unint64_t result = qword_1000355C0;
  if (!qword_1000355C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000276B8, &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355C0);
  }

  return result;
}

unint64_t sub_10002253C()
{
  unint64_t result = qword_1000355C8;
  if (!qword_1000355C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027770, &_s14ModelStructureO7ProgramV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355C8);
  }

  return result;
}

unint64_t sub_100022584()
{
  unint64_t result = qword_1000355D0;
  if (!qword_1000355D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027828, &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355D0);
  }

  return result;
}

unint64_t sub_1000225CC()
{
  unint64_t result = qword_1000355D8;
  if (!qword_1000355D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000278E0, &_s14ModelStructureO13NeuralNetworkV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355D8);
  }

  return result;
}

unint64_t sub_100022614()
{
  unint64_t result = qword_1000355E0;
  if (!qword_1000355E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027998, &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355E0);
  }

  return result;
}

unint64_t sub_10002265C()
{
  unint64_t result = qword_1000355E8;
  if (!qword_1000355E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027A50, &_s11DeviceUsageV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355E8);
  }

  return result;
}

unint64_t sub_1000226A4()
{
  unint64_t result = qword_1000355F0;
  if (!qword_1000355F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027B08, &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355F0);
  }

  return result;
}

unint64_t sub_1000226EC()
{
  unint64_t result = qword_1000355F8;
  if (!qword_1000355F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027C10, &_s11DeviceUsageV12SupportStateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000355F8);
  }

  return result;
}

unint64_t sub_100022734()
{
  unint64_t result = qword_100035600;
  if (!qword_100035600)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027B30, &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035600);
  }

  return result;
}

unint64_t sub_10002277C()
{
  unint64_t result = qword_100035608;
  if (!qword_100035608)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027B58, &_s11DeviceUsageV12SupportStateO19SupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035608);
  }

  return result;
}

unint64_t sub_1000227C4()
{
  unint64_t result = qword_100035610;
  if (!qword_100035610)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027A78, &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035610);
  }

  return result;
}

unint64_t sub_10002280C()
{
  unint64_t result = qword_100035618;
  if (!qword_100035618)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027AA0, &_s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035618);
  }

  return result;
}

unint64_t sub_100022854()
{
  unint64_t result = qword_100035620;
  if (!qword_100035620)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027B80, &_s11DeviceUsageV12SupportStateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035620);
  }

  return result;
}

unint64_t sub_10002289C()
{
  unint64_t result = qword_100035628;
  if (!qword_100035628)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027BA8, &_s11DeviceUsageV12SupportStateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035628);
  }

  return result;
}

unint64_t sub_1000228E4()
{
  unint64_t result = qword_100035630;
  if (!qword_100035630)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000279C0, &_s11DeviceUsageV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035630);
  }

  return result;
}

unint64_t sub_10002292C()
{
  unint64_t result = qword_100035638;
  if (!qword_100035638)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000279E8, &_s11DeviceUsageV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035638);
  }

  return result;
}

unint64_t sub_100022974()
{
  unint64_t result = qword_100035640;
  if (!qword_100035640)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027908, &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035640);
  }

  return result;
}

unint64_t sub_1000229BC()
{
  unint64_t result = qword_100035648;
  if (!qword_100035648)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027930, &_s14ModelStructureO13NeuralNetworkV5LayerV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035648);
  }

  return result;
}

unint64_t sub_100022A04()
{
  unint64_t result = qword_100035650;
  if (!qword_100035650)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027850, &_s14ModelStructureO13NeuralNetworkV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035650);
  }

  return result;
}

unint64_t sub_100022A4C()
{
  unint64_t result = qword_100035658;
  if (!qword_100035658)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027878, &_s14ModelStructureO13NeuralNetworkV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035658);
  }

  return result;
}

unint64_t sub_100022A94()
{
  unint64_t result = qword_100035660;
  if (!qword_100035660)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027798, &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035660);
  }

  return result;
}

unint64_t sub_100022ADC()
{
  unint64_t result = qword_100035668;
  if (!qword_100035668)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000277C0, &_s14ModelStructureO7ProgramV8FunctionV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035668);
  }

  return result;
}

unint64_t sub_100022B24()
{
  unint64_t result = qword_100035670;
  if (!qword_100035670)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000276E0, &_s14ModelStructureO7ProgramV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035670);
  }

  return result;
}

unint64_t sub_100022B6C()
{
  unint64_t result = qword_100035678;
  if (!qword_100035678)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027708, &_s14ModelStructureO7ProgramV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035678);
  }

  return result;
}

unint64_t sub_100022BB4()
{
  unint64_t result = qword_100035680;
  if (!qword_100035680)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027628, &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035680);
  }

  return result;
}

unint64_t sub_100022BFC()
{
  unint64_t result = qword_100035688;
  if (!qword_100035688)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027650, &_s14ModelStructureO7ProgramV5BlockV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035688);
  }

  return result;
}

unint64_t sub_100022C44()
{
  unint64_t result = qword_100035690;
  if (!qword_100035690)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027570, &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035690);
  }

  return result;
}

unint64_t sub_100022C8C()
{
  unint64_t result = qword_100035698;
  if (!qword_100035698)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027598, &_s14ModelStructureO7ProgramV8ArgumentV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035698);
  }

  return result;
}

unint64_t sub_100022CD4()
{
  unint64_t result = qword_1000356A0;
  if (!qword_1000356A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027400, &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356A0);
  }

  return result;
}

unint64_t sub_100022D1C()
{
  unint64_t result = qword_1000356A8;
  if (!qword_1000356A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027428, &_s14ModelStructureO7ProgramV7BindingO15ValueCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356A8);
  }

  return result;
}

unint64_t sub_100022D64()
{
  unint64_t result = qword_1000356B0;
  if (!qword_1000356B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027348, &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356B0);
  }

  return result;
}

unint64_t sub_100022DAC()
{
  unint64_t result = qword_1000356B8;
  if (!qword_1000356B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027370, &_s14ModelStructureO7ProgramV7BindingO14NameCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356B8);
  }

  return result;
}

unint64_t sub_100022DF4()
{
  unint64_t result = qword_1000356C0;
  if (!qword_1000356C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000274B8, &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356C0);
  }

  return result;
}

unint64_t sub_100022E3C()
{
  unint64_t result = qword_1000356C8;
  if (!qword_1000356C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000274E0, &_s14ModelStructureO7ProgramV7BindingO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356C8);
  }

  return result;
}

unint64_t sub_100022E84()
{
  unint64_t result = qword_1000356D0;
  if (!qword_1000356D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027290, &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356D0);
  }

  return result;
}

unint64_t sub_100022ECC()
{
  unint64_t result = qword_1000356D8;
  if (!qword_1000356D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000272B8, &_s14ModelStructureO7ProgramV9OperationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356D8);
  }

  return result;
}

unint64_t sub_100022F14()
{
  unint64_t result = qword_1000356E0;
  if (!qword_1000356E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000271D8, &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356E0);
  }

  return result;
}

unint64_t sub_100022F5C()
{
  unint64_t result = qword_1000356E8;
  if (!qword_1000356E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027200, &_s14ModelStructureO7ProgramV14NamedValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356E8);
  }

  return result;
}

unint64_t sub_100022FA4()
{
  unint64_t result = qword_1000356F0;
  if (!qword_1000356F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027068, &_s14ModelStructureO23NeuralNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356F0);
  }

  return result;
}

unint64_t sub_100022FEC()
{
  unint64_t result = qword_1000356F8;
  if (!qword_1000356F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027090, &_s14ModelStructureO23NeuralNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000356F8);
  }

  return result;
}

unint64_t sub_100023034()
{
  unint64_t result = qword_100035700;
  if (!qword_100035700)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026FB0, &_s14ModelStructureO17ProgramCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035700);
  }

  return result;
}

unint64_t sub_10002307C()
{
  unint64_t result = qword_100035708;
  if (!qword_100035708)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026FD8, &_s14ModelStructureO17ProgramCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035708);
  }

  return result;
}

unint64_t sub_1000230C4()
{
  unint64_t result = qword_100035710;
  if (!qword_100035710)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026EF8, &_s14ModelStructureO18PipelineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035710);
  }

  return result;
}

unint64_t sub_10002310C()
{
  unint64_t result = qword_100035718;
  if (!qword_100035718)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026F20, &_s14ModelStructureO18PipelineCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035718);
  }

  return result;
}

unint64_t sub_100023154()
{
  unint64_t result = qword_100035720;
  if (!qword_100035720)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026EA8, &_s14ModelStructureO15EmptyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035720);
  }

  return result;
}

unint64_t sub_10002319C()
{
  unint64_t result = qword_100035728;
  if (!qword_100035728)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026ED0, &_s14ModelStructureO15EmptyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035728);
  }

  return result;
}

unint64_t sub_1000231E4()
{
  unint64_t result = qword_100035730;
  if (!qword_100035730)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026E58, &_s14ModelStructureO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035730);
  }

  return result;
}

unint64_t sub_10002322C()
{
  unint64_t result = qword_100035738;
  if (!qword_100035738)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026E80, &_s14ModelStructureO21UnsupportedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035738);
  }

  return result;
}

unint64_t sub_100023274()
{
  unint64_t result = qword_100035740;
  if (!qword_100035740)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027120, &_s14ModelStructureO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035740);
  }

  return result;
}

unint64_t sub_1000232BC()
{
  unint64_t result = qword_100035748;
  if (!qword_100035748)
  {
    unint64_t result = swift_getWitnessTable(&unk_100027148, &_s14ModelStructureO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035748);
  }

  return result;
}

unint64_t sub_100023300()
{
  unint64_t result = qword_100035758;
  if (!qword_100035758)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028860, &_s14ModelStructureO8PipelineV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035758);
  }

  return result;
}

unint64_t sub_100023344()
{
  unint64_t result = qword_100035778;
  if (!qword_100035778)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028810, &_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035778);
  }

  return result;
}

unint64_t sub_100023388()
{
  unint64_t result = qword_100035788;
  if (!qword_100035788)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000287C0, &_s4CostV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035788);
  }

  return result;
}

unint64_t sub_1000233CC()
{
  unint64_t result = qword_1000357A0;
  if (!qword_1000357A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028770, &_s14ModelStructureO7ProgramV5ValueV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357A0);
  }

  return result;
}

unint64_t sub_100023410()
{
  unint64_t result = qword_1000357B0;
  if (!qword_1000357B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028720, &_s11DeviceUsageV6ReasonV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357B0);
  }

  return result;
}

uint64_t sub_100023454(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_100006568(a2);
    a3();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_1000234B8()
{
  unint64_t result = qword_1000357D0;
  if (!qword_1000357D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100026998, &_s14ModelStructureON);
    atomic_store(result, (unint64_t *)&qword_1000357D0);
  }

  return result;
}

ValueMetadata *_s11DeviceUsageV6ReasonV10CodingKeysOMa()
{
  return &_s11DeviceUsageV6ReasonV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV5ValueV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV5ValueV10CodingKeysON;
}

uint64_t _s11DeviceUsageV12SupportStateO21UnsupportedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10002355C + 4 * byte_100026907[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10002357C + 4 * byte_10002690C[v4]))();
  }
}

_BYTE *sub_10002355C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10002357C(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100023584(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002358C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100023594(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002359C(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *_s4CostV10CodingKeysOMa()
{
  return &_s4CostV10CodingKeysON;
}

ValueMetadata *_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysOMa()
{
  return &_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysON;
}

uint64_t _s11DeviceUsageV12SupportStateO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100023614 + 4 * byte_100026916[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100023648 + 4 * byte_100026911[v4]))();
}

uint64_t sub_100023648(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100023650(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100023658LL);
  }
  return result;
}

uint64_t sub_100023664(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10002366CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100023670(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100023678(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14ModelStructureO8PipelineV10CodingKeysOMa()
{
  return &_s14ModelStructureO8PipelineV10CodingKeysON;
}

unint64_t sub_100023698()
{
  unint64_t result = qword_1000357D8;
  if (!qword_1000357D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000284E8, &_s14ModelStructureO8PipelineV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357D8);
  }

  return result;
}

unint64_t sub_1000236E0()
{
  unint64_t result = qword_1000357E0;
  if (!qword_1000357E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000285F0, &_s4CostV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357E0);
  }

  return result;
}

unint64_t sub_100023728()
{
  unint64_t result = qword_1000357E8;
  if (!qword_1000357E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000286F8, &_s11DeviceUsageV6ReasonV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357E8);
  }

  return result;
}

unint64_t sub_100023770()
{
  unint64_t result = qword_1000357F0;
  if (!qword_1000357F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028668, &_s11DeviceUsageV6ReasonV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357F0);
  }

  return result;
}

unint64_t sub_1000237B8()
{
  unint64_t result = qword_1000357F8;
  if (!qword_1000357F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028690, &_s11DeviceUsageV6ReasonV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_1000357F8);
  }

  return result;
}

unint64_t sub_100023800()
{
  unint64_t result = qword_100035800;
  if (!qword_100035800)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028618, &_s14ModelStructureO7ProgramV5ValueV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035800);
  }

  return result;
}

unint64_t sub_100023848()
{
  unint64_t result = qword_100035808;
  if (!qword_100035808)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028640, &_s14ModelStructureO7ProgramV5ValueV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035808);
  }

  return result;
}

unint64_t sub_100023890()
{
  unint64_t result = qword_100035810;
  if (!qword_100035810)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028560, &_s4CostV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035810);
  }

  return result;
}

unint64_t sub_1000238D8()
{
  unint64_t result = qword_100035818;
  if (!qword_100035818)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028588, &_s4CostV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035818);
  }

  return result;
}

unint64_t sub_100023920()
{
  unint64_t result = qword_100035820;
  if (!qword_100035820)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028510, &_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035820);
  }

  return result;
}

unint64_t sub_100023968()
{
  unint64_t result = qword_100035828;
  if (!qword_100035828)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028538, &_s14ModelStructureO7ProgramV9ValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035828);
  }

  return result;
}

unint64_t sub_1000239B0()
{
  unint64_t result = qword_100035830;
  if (!qword_100035830)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028458, &_s14ModelStructureO8PipelineV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035830);
  }

  return result;
}

unint64_t sub_1000239F8()
{
  unint64_t result = qword_100035838;
  if (!qword_100035838)
  {
    unint64_t result = swift_getWitnessTable(&unk_100028480, &_s14ModelStructureO8PipelineV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_100035838);
  }

  return result;
}

uint64_t sub_100023A3C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746867696577LL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(a2, a2);
    char v6 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746867696577LL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2, v5);
    char v6 = v4 ^ 1;
  }

  return v6 & 1;
}

uint64_t sub_100023AB8()
{
  return 0x746867696577LL;
}

uint64_t sub_100023AEC@<X0>(uint64_t a1@<X8>)
{
  v26[1] = a1;
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v26 - v6;
  id v8 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v9 = [v8 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v9);
  uint64_t v11 = static os_log_type_t.debug.getter(v10);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v12 = qword_100035878;
  uint64_t v13 = sub_10000645C(&qword_100034A28);
  uint64_t v14 = swift_allocObject(v13, 72LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_1000253B0;
  uint64_t v15 = ((uint64_t (*)(void))URL.path.getter)();
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_100007D1C();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v17;
  os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "PerfRunner: prefix is %@", 24LL, 2LL, v14);
  uint64_t v19 = swift_bridgeObjectRelease(v14, v18);
  uint64_t v20 = URL.path.getter(v19);
  uint64_t v22 = v21;
  if (v20 == 0x706D742F7261762FLL && v21 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL, 0xE800000000000000LL);
LABEL_7:
    URL.init(fileURLWithPath:)(0xD000000000000010LL, 0x8000000100029750LL);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v5, v1);
    goto LABEL_8;
  }

  char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, 0x706D742F7261762FLL, 0xE800000000000000LL, 0LL);
  swift_bridgeObjectRelease(v22, v24);
  if ((v23 & 1) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  URL.appendingPathComponent(_:isDirectory:)(0xD000000000000017LL, 0x8000000100029730LL, 1LL);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

uint64_t sub_100023E5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  id v8 = (char *)&v31 - v7;
  uint64_t v9 = sub_100023AEC((uint64_t)&v31 - v7);
  uint64_t v10 = UUID.uuidString.getter(v9);
  uint64_t v12 = v11;
  URL.appendingPathComponent(_:isDirectory:)(v10, v11, 1LL);
  swift_bridgeObjectRelease(v12, v13);
  uint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_fileName);
  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_fileName + 8);
  object = String.lowercased()()._object;
  v17._countAndFlagsBits = 0x616B6361706C6D2ELL;
  v17._object = (void *)0xEA00000000006567LL;
  Swift::Bool v18 = String.hasSuffix(_:)(v17);
  swift_bridgeObjectRelease(object, v19);
  uint64_t v20 = URL.appendingPathComponent(_:isDirectory:)(v14, v15, v18);
  uint64_t v21 = static os_log_type_t.debug.getter(v20);
  if (qword_100034908 != -1) {
    swift_once(&qword_100034908, sub_100003470);
  }
  uint64_t v22 = qword_100035878;
  uint64_t v23 = sub_10000645C(&qword_100034A28);
  uint64_t v24 = swift_allocObject(v23, 72LL, 7LL);
  *(_OWORD *)(v24 + 16) = xmmword_1000253B0;
  uint64_t v25 = URL.path.getter(v24);
  uint64_t v27 = v26;
  *(void *)(v24 + 56) = &type metadata for String;
  *(void *)(v24 + 64) = sub_100007D1C();
  *(void *)(v24 + 32) = v25;
  *(void *)(v24 + 40) = v27;
  os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v22, "PerfRunner: Actual model path on disk: %@", 41LL, 2LL, v24);
  swift_bridgeObjectRelease(v24, v28);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v3 + 8);
  v29(v6, v2);
  return ((uint64_t (*)(char *, uint64_t))v29)(v8, v2);
}

id sub_100024090()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelLocation(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100024118()
{
  return type metadata accessor for ModelLocation(0LL);
}

uint64_t type metadata accessor for ModelLocation(uint64_t a1)
{
  uint64_t result = qword_100035868;
  if (!qword_100035868) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ModelLocation);
  }
  return result;
}

uint64_t sub_10002415C(uint64_t a1, uint64_t a2)
{
  uint64_t result = type metadata accessor for UUID(319LL, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    v5[1] = &unk_100028A08;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v5, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void sub_1000241D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024204( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002426C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000242DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002434C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024380()
{
  __assert_rtn("coreml_event_handler_block_invoke", "main.m", 169, "type == XPC_TYPE_DICTIONARY");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_initWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:");
}

id objc_msgSend_initWithExperimentIterations_loadCount_predictionCount_maxPredictionTime_maxIterationTime_functionName_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithExperimentIterations:loadCount:predictionCount:maxPredictionTime:maxIterationTime:functionName:");
}

id objc_msgSend_initWithTempFolderGuid_fileName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTempFolderGuid:fileName:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_runWithModelLocation_computeUnits_perfRunConfig_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithModelLocation:computeUnits:perfRunConfig:completionHandler:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}