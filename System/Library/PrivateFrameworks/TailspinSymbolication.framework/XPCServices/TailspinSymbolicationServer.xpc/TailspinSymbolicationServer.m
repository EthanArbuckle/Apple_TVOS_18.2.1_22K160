LABEL_70:
          v74 = v27;
          v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKeyedSubscript:@"Size"]);
          v76 = [v75 unsignedLongLongValue];

          v14 = v96;
          v26 = v100;
          if (v76)
          {
            *(void *)buf = 0LL;
            v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v74,  200LL,  0LL,  buf));
            v78 = *(id *)buf;
            if (!v77)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1000028F8(v78);
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100002874(v74);
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_100002830();
              }
            }
          }

          else
          {
            v77 = 0LL;
          }

          [v77 length];
          v93[2](v93, v77);
          v79 = objc_claimAutoreleasedReturnValue([v100 objectForKeyedSubscript:@"shouldCacheSymbols"]);
          if (v79
            && (v80 = (void *)v79,
                v81 = (void *)objc_claimAutoreleasedReturnValue([v100 objectForKeyedSubscript:@"shouldCacheSymbols"]),
                v82 = [v81 BOOLValue],
                v81,
                v80,
                (v82 & 1) != 0))
          {
            +[SABinary clearCoreSymbolicationCaches](&OBJC_CLASS___SABinary, "clearCoreSymbolicationCaches");
          }

          else
          {
            +[SABinary clearCaches](&OBJC_CLASS___SABinary, "clearCaches", v86);
          }

          v17 = v91;
          objc_msgSend(v91, "done", v86);
          v15 = v95;
          v18 = v90;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1000027EC();
          }

          v16 = v93;
          goto LABEL_87;
        }
      }

      v45 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v30 count]);
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v86 = v30;
      v46 = v30;
      v47 = [v46 countByEnumeratingWithState:&v109 objects:buf count:16];
      if (v47)
      {
        v48 = v47;
        v49 = *(void *)v110;
        do
        {
          for (i = 0LL; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v110 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v41,  "instructionAtOffsetIntoSegment:",  objc_msgSend( *(id *)(*((void *)&v109 + 1) + 8 * (void)i),  "unsignedLongLongValue",  v86)));
            if (v51) {
              -[NSMutableArray addObject:](v45, "addObject:", v51);
            }
          }

          v48 = [v46 countByEnumeratingWithState:&v109 objects:buf count:16];
        }

        while (v48);
      }

      [v99 symbolicateAllInstructionsWithOptions:v23 pid:v12];
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      obj = v45;
      v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v105,  v119,  16LL);
      if (v104)
      {
        v103 = *(void *)v106;
        v102 = v41;
        do
        {
          for (j = 0LL; j != v104; j = (char *)j + 1)
          {
            if (*(void *)v106 != v103) {
              objc_enumerationMutation(obj);
            }
            v53 = *(void **)(*((void *)&v105 + 1) + 8LL * (void)j);
            if (objc_msgSend(v53, "numSymbols", v86))
            {
              v54 = v27;
              v55 = v27;
              v56 = v53;
              if (!v56) {
                sub_1000027D8();
              }
              v57 = v56;
              v58 = objc_claimAutoreleasedReturnValue([v56 binary]);
              if (!v58) {
                sub_1000027D8();
              }
              v59 = (void *)v58;
              v60 = [v57 numSymbols];
              if (!v60) {
                sub_1000027D8();
              }
              v61 = (unint64_t)v60;
              v62 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v57 offsetIntoSegment]));
              if (!v62) {
                sub_1000027D8();
              }
              v63 = (void *)v62;
              v64 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:@"Symbols"]);
              if (!v64)
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                [v55 setObject:v64 forKeyedSubscript:@"Symbols"];
                if (!v64) {
                  sub_1000027D8();
                }
              }

              v65 = (void *)objc_claimAutoreleasedReturnValue([v63 stringValue]);
              v66 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:v65]);

              if (v66) {
                sub_1000027D8();
              }
              if (v61 < 2) {
                v67 = 0LL;
              }
              else {
                v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  v61 - 1));
              }
              v113[0] = _NSConcreteStackBlock;
              v113[1] = 3221225472LL;
              v113[2] = sub_1000023A8;
              v113[3] = &unk_100004270;
              v114 = v57;
              v115 = v59;
              v116 = v67;
              v117 = v64;
              v118 = v63;
              v68 = v63;
              v69 = v64;
              v70 = v67;
              v71 = v59;
              v72 = v57;
              [v72 enumerateSymbols:v113];

              v27 = v54;
              v41 = v102;
            }
          }

          v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v105,  v119,  16LL);
        }

        while (v104);
      }

      v28 = v87;
      v13 = v88;
      v30 = v86;
      v39 = v94;
      v40 = v99;
    }

    add_binary_info_to_binary_dictionary(v27, v40);
    if (v92) {
      [v27 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TEXT_EXEC"];
    }
    goto LABEL_70;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000274C(v13);
  }
  [v17 done];
  v26 = v100;
LABEL_87:

  objc_autoreleasePoolPop(v18);
}

void add_binary_info_to_binary_dictionary(void *a1, void *a2)
{
  id v21 = a1;
  id v3 = a2;
  if (v21 && v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleVersion]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleShortVersion]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 binaryVersion]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 segmentWithName:@"__TEXT_EXEC"]);
    v10 = v9;
    if (v9)
    {
      id v11 = [v9 length];
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v3 segmentWithName:@"__TEXT"]);
      v13 = v12;
      if (!v12) {
        v12 = v3;
      }
      id v11 = [v12 length];
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
    if (!v14) {
      sub_1000027D8();
    }
    v15 = (void *)v14;
    v18 = v4;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    [v21 setObject:v16 forKeyedSubscript:@"UUID_String"];

    [v21 setObject:v15 forKeyedSubscript:@"Size"];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10 != 0LL));
    [v21 setObject:v17 forKeyedSubscript:@"TEXT_EXEC"];

    [v21 setObject:v20 forKeyedSubscript:@"Name"];
    [v21 setObject:v19 forKeyedSubscript:@"Path"];
    [v21 setObject:v5 forKeyedSubscript:@"BundleID"];
    [v21 setObject:v6 forKeyedSubscript:@"BundleVersion"];
    [v21 setObject:v7 forKeyedSubscript:@"BundleShortVersion"];
    [v21 setObject:v8 forKeyedSubscript:@"BinaryVersion"];
  }
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TailspinSymbolicationServer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000023A8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100002AB0(a1, v7);
  }
  v9 = [*(id *)(a1 + 32) offsetIntoSegment];
  id v10 = v7;
  id v11 = v8;
  id v12 = v10;
  if (!v12) {
    sub_1000027D8();
  }
  v13 = v12;

  uint64_t v14 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  8LL);
  if (!v14) {
    sub_1000027D8();
  }
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  v9 - (_BYTE *)[v13 offsetIntoSegment]));
  if (!v17) {
    sub_1000027D8();
  }
  v18 = (void *)v17;
  uint64_t v34 = a4;
  uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v13 length]));
  if (!v19) {
    sub_1000027D8();
  }
  v20 = (void *)v19;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, @"Name");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, @"Length");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, @"Offset");
  if (v11)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue([v11 filePath]);
    if (!v33) {
      sub_1000027D8();
    }
    v31 = v16;
    id v21 = [v11 lineNum];
    if ((_DWORD)v21) {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v21));
    }
    else {
      v22 = 0LL;
    }
    id v23 = [v11 columnNum];
    uint64_t v32 = a1;
    if ((_DWORD)v23) {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v23));
    }
    else {
      v24 = 0LL;
    }
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  v9 - (_BYTE *)[v11 offsetIntoSegment]));
    if (!v25) {
      sub_1000027D8();
    }
    v26 = (void *)v25;
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v11 length]));
    if (!v27) {
      sub_1000027D8();
    }
    v28 = (void *)v27;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v33, @"FileName");
    if (v22) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v22, @"LineNumber");
    }
    if (v24) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v24, @"ColNumber");
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v26, @"SourceOffset");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v28, @"SourceLength");

    v16 = v31;
    a1 = v32;
  }

  if (v34)
  {
    [*(id *)(a1 + 48) addObject:v15];
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 48),  @"InlineSymbols");
    v29 = *(void **)(a1 + 56);
    v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) stringValue]);
    [v29 setObject:v15 forKeyedSubscript:v30];
  }
}

uint64_t sub_1000026FC()
{
  return _os_assert_log(0LL);
}

  ;
}

  ;
}

void sub_100002728( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100002738()
{
  return [v0 count];
}

id sub_100002744(void *a1, const char *a2)
{
  return [a1 UTF8String];
}

void sub_10000274C(void *a1)
{
  sub_100002704();
}

void sub_1000027D8()
{
  uint64_t v0 = sub_1000026FC();
  _os_crash(v0);
  __break(1u);
}

void sub_1000027EC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "sent reply dictionary data",  v0,  2u);
}

void sub_100002830()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "couldn't serialize symbols dictionary",  v0,  2u);
}

void sub_100002874(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100002744(v2, v3);
  sub_100002728((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v4, "dict is:\n%s", v5, v6, v7, v8, 2u);

  sub_100002704();
}

void sub_1000028F8(void *a1)
{
  id v2 = objc_claimAutoreleasedReturnValue([a1 description]);
  sub_100002744(v2, v3);
  sub_100002728((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v4, "error: %s", v5, v6, v7, v8, 2u);

  sub_100002704();
}

void sub_10000297C(void *a1)
{
  sub_100002704();
}

void sub_100002A08(uint64_t a1, int a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Client %{public}@ [%d] is not entitled to use TailspinSymbolication.",  (uint8_t *)&v4,  0x12u);

  sub_100002704();
}

void sub_100002AB0(uint64_t a1, void *a2)
{
  id v5 = [*(id *)(a1 + 32) offsetIntoSegment];
  id v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
  id v8 = sub_100002744(v6, v7);
  id v9 = objc_claimAutoreleasedReturnValue([a2 name]);
  id v10 = [v9 UTF8String];
  id v11 = [*(id *)(a1 + 32) offsetIntoSegment];
  int v12 = 134218754;
  id v13 = v5;
  __int16 v14 = 2080;
  id v15 = v8;
  __int16 v16 = 2080;
  id v17 = v10;
  __int16 v18 = 2048;
  int64_t v19 = v11 - (_BYTE *)[a2 offsetIntoSegment];
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%llx in %s -> %s + %llx",  (uint8_t *)&v12,  0x2Au);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}