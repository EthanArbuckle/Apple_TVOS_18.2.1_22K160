@interface DASRenderServerInfo
+ (id)infoFromServerWithPort:(unsigned int)a3;
- (NSArray)parseErrors;
- (NSOrderedSet)displays;
- (NSSet)contexts;
- (NSString)raw;
- (id)_initWithPort:(unsigned int)a3 raw:(id)a4;
- (id)archiveOfContext:(id)a3;
- (id)contextWithIdentifier:(unsigned int)a3;
- (id)description;
- (void)_parseRaw;
- (void)dealloc;
@end

@implementation DASRenderServerInfo

- (id)_initWithPort:(unsigned int)a3 raw:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if ((BSMachPortIsType(v4, 0x10000LL) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"invalid port"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (objc_class *)objc_opt_class(self);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138544642;
      v27 = v15;
      __int16 v28 = 2114;
      v29 = v18;
      __int16 v30 = 2048;
      v31 = self;
      __int16 v32 = 2114;
      v33 = @"DASParsing.m";
      __int16 v34 = 1024;
      int v35 = 249;
      __int16 v36 = 2114;
      v37 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x100003680LL);
  }

  if (!v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"raw"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (objc_class *)objc_opt_class(self);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138544642;
      v27 = v21;
      __int16 v28 = 2114;
      v29 = v24;
      __int16 v30 = 2048;
      v31 = self;
      __int16 v32 = 2114;
      v33 = @"DASParsing.m";
      __int16 v34 = 1024;
      int v35 = 250;
      __int16 v36 = 2114;
      v37 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x100003778LL);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___DASRenderServerInfo;
  v8 = -[DASRenderServerInfo init](&v25, "init");
  v9 = v8;
  if (v8)
  {
    v8->_port = v4;
    v10 = (NSString *)[v7 copy];
    raw = v9->_raw;
    v9->_raw = v10;

    -[DASRenderServerInfo _parseRaw](v9, "_parseRaw");
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DASRenderServerInfo;
  -[DASRenderServerInfo dealloc](&v3, "dealloc");
}

- (id)contextWithIdentifier:(unsigned int)a3
{
  contextIDNumberToContextMap = self->_contextIDNumberToContextMap;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *(void *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](contextIDNumberToContextMap, "objectForKey:", v4));

  return v5;
}

- (id)archiveOfContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"contextInfo"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[DASRenderServerInfo archiveOfContext:]"));
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"DASParsing.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v36[0]) = 273;
      WORD2(v36[0]) = 2114;
      *(void *)((char *)v36 + 6) = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  buf,  0x26u);
    }

    _bs_set_crash_log_message([v29 UTF8String]);
    __break(0);
    JUMPOUT(0x100003C3CLL);
  }

  v5 = v4;
  uint64_t port = self->_port;
  id v7 = [v4 identifier];
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  v8 = off_1000153E0;
  v36[0] = off_1000153E0;
  if (!off_1000153E0)
  {
    v9 = sub_100006064();
    v8 = dlsym(v9, "CARenderServerGetClientPort");
    *(void *)(*(void *)&buf[8] + 24LL) = v8;
    off_1000153E0 = v8;
  }

  _Block_object_dispose(buf, 8);
  if (!v8)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "mach_port_t soft_CARenderServerGetClientPort(mach_port_t, uint32_t)"));
    objc_msgSend( v31,  "handleFailureInFunction:file:lineNumber:description:",  v32,  @"DASParsing.m",  26,  @"%s",  dlerror());

    __break(1u);
  }

  uint64_t v10 = ((uint64_t (*)(uint64_t, id))v8)(port, v7);
  if (!(_DWORD)v10)
  {
    id v21 = sub_10000661C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v22 = [v5 identifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "server doesn't know about context %x",  buf,  8u);
    }

    goto LABEL_17;
  }

  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"DumpDisplay: capture %x from %i",  [v5 identifier],  objc_msgSend(v5, "pid")));
  v12 = objc_alloc(&OBJC_CLASS___RBSAssertion);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v5 pid]));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.displayarchive",  @"RenderClientProcessing"));
  __int16 v34 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  v16 = -[RBSAssertion initWithExplanation:target:attributes:]( v12,  "initWithExplanation:target:attributes:",  v11,  v13,  v15);

  id v33 = 0LL;
  -[RBSAssertion acquireWithError:](v16, "acquireWithError:", &v33);
  id v17 = v33;
  if (v17)
  {
    id v18 = sub_10000661C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = [v5 identifier];
      unsigned int v27 = [v5 pid];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "error acquiring assertion to capture archive of context %x (from %i)",  buf,  0xEu);
    }
  }

  v20 = (void *)off_100015290(v10);
  -[RBSAssertion invalidate](v16, "invalidate");
  mach_port_deallocate(mach_task_self_, v10);
  if (!v20)
  {
    id v23 = sub_10000661C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      unsigned int v28 = [v5 identifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "unable to capture archive of context %x",  buf,  8u);
    }

LABEL_17:
    v20 = 0LL;
    goto LABEL_18;
  }

LABEL_18:
  return v20;
}

- (id)description
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100005A84;
  uint64_t v10 = &unk_1000104B0;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self));
  v12 = self;
  id v3 = v11;
  id v4 = [v3 modifyBody:&v7];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build", v7, v8, v9, v10));

  return v5;
}

- (void)_parseRaw
{
  id v115 = 0LL;
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"^(?<displayName>.+) (?:display|contexts)(?<displayProperties>(?: \\([^\\)]+\\))*:$"),  1LL,  &v115));
  v69 = (DASRenderServerInfo *)v115;
  if (v69)
  {
    id v2 = sub_10000661C();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v119 = v69;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "failed to create display info parser -> %@",  buf,  0xCu);
    }
  }

  id v114 = 0LL;
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"^\\s*(?<contextID>[0-9a-f]+):(?: level (?<level>[^;]+);)? pid (?<pid>[0-9]+) \\[(?<process>[^\\]]*)\\](?<contextProperties>(?: \\([^\\)]+\\))*$"),
                    1LL,
                    &v114));
  v68 = (DASRenderServerInfo *)v114;
  if (v68)
  {
    id v4 = sub_10000661C();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v119 = v68;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "failed to create context info parser -> %@",  buf,  0xCu);
    }
  }

  if (!v77)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to create display info parser -> %@",  v69));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v54 = NSStringFromSelector(a2);
      v55 = (DASRenderServerInfo *)objc_claimAutoreleasedReturnValue(v54);
      v56 = (objc_class *)objc_opt_class(self);
      v57 = NSStringFromClass(v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      *(_DWORD *)buf = 138544642;
      v119 = v55;
      __int16 v120 = 2114;
      v121 = v58;
      __int16 v122 = 2048;
      v123 = self;
      __int16 v124 = 2114;
      v125 = @"DASParsing.m";
      __int16 v126 = 1024;
      int v127 = 387;
      __int16 v128 = 2114;
      v129 = v53;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v53 UTF8String]);
    __break(0);
    JUMPOUT(0x100004744LL);
  }

  id v6 = sub_10000661C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v51 = (DASRenderServerInfo *)objc_claimAutoreleasedReturnValue([v77 pattern]);
    *(_DWORD *)buf = 138412290;
    v119 = v51;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "created display pattern %@", buf, 0xCu);
  }

  if (!v73)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed to create context info parser -> %@",  v68));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v60 = NSStringFromSelector(a2);
      v61 = (DASRenderServerInfo *)objc_claimAutoreleasedReturnValue(v60);
      v62 = (objc_class *)objc_opt_class(self);
      v63 = NSStringFromClass(v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      *(_DWORD *)buf = 138544642;
      v119 = v61;
      __int16 v120 = 2114;
      v121 = v64;
      __int16 v122 = 2048;
      v123 = self;
      __int16 v124 = 2114;
      v125 = @"DASParsing.m";
      __int16 v126 = 1024;
      int v127 = 389;
      __int16 v128 = 2114;
      v129 = v59;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v59 UTF8String]);
    __break(0);
    JUMPOUT(0x100004840LL);
  }

  id v8 = sub_10000661C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v52 = (DASRenderServerInfo *)objc_claimAutoreleasedReturnValue([v73 pattern]);
    *(_DWORD *)buf = 138412290;
    v119 = v52;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "created context pattern %@", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v112[0] = 0LL;
  v112[1] = v112;
  v112[2] = 0x3032000000LL;
  v112[3] = sub_100004920;
  v112[4] = sub_100004930;
  id v113 = 0LL;
  v110[0] = 0LL;
  v110[1] = v110;
  v110[2] = 0x3032000000LL;
  v110[3] = sub_100004920;
  v110[4] = sub_100004930;
  id v111 = 0LL;
  v108[0] = 0LL;
  v108[1] = v108;
  v108[2] = 0x3032000000LL;
  v108[3] = sub_100004920;
  v108[4] = sub_100004930;
  id v109 = 0LL;
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_100004938;
  v100[3] = &unk_100010518;
  v104 = v110;
  v105 = v112;
  SEL v107 = a2;
  id v79 = v13;
  id v101 = v79;
  v102 = self;
  id v15 = v11;
  id v103 = v15;
  v106 = v108;
  v16 = objc_retainBlock(v100);
  raw = self->_raw;
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472LL;
  v89[2] = sub_100004C58;
  v89[3] = &unk_100010540;
  SEL v99 = a2;
  id v65 = v77;
  id v90 = v65;
  v91 = self;
  id v18 = v16;
  id v96 = v18;
  v97 = v112;
  id v76 = v12;
  id v92 = v76;
  v98 = v110;
  id v66 = v73;
  id v93 = v66;
  id v19 = v14;
  id v94 = v19;
  id v70 = v10;
  id v95 = v70;
  -[NSString enumerateLinesUsingBlock:](raw, "enumerateLinesUsingBlock:", v89);
  v18[2](v18);
  v67 = v18;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  id obj = v15;
  id v20 = [obj countByEnumeratingWithState:&v85 objects:v117 count:16];
  if (v20)
  {
    uint64_t v74 = *(void *)v86;
    do
    {
      id v71 = v20;
      for (i = 0LL; i != v71; i = (char *)i + 1)
      {
        if (*(void *)v86 != v74) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v85 + 1) + 8LL * (void)i);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v79 objectForKey:v22]);
        id v25 = [v24 countByEnumeratingWithState:&v81 objects:v116 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v82;
          do
          {
            for (j = 0LL; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v82 != v26) {
                objc_enumerationMutation(v24);
              }
              unsigned int v28 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)j);
              v29 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v28]);
              if (!v29)
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"failed to find context %x attached to %@ :\n%@",  [v28 unsignedIntValue],  v22,  self->_raw));
                id v45 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  v46 = NSStringFromSelector(a2);
                  v47 = (DASRenderServerInfo *)(id)objc_claimAutoreleasedReturnValue(v46);
                  v48 = (objc_class *)objc_opt_class(self);
                  v49 = NSStringFromClass(v48);
                  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                  *(_DWORD *)buf = 138544642;
                  v119 = v47;
                  __int16 v120 = 2114;
                  v121 = v50;
                  __int16 v122 = 2048;
                  v123 = self;
                  __int16 v124 = 2114;
                  v125 = @"DASParsing.m";
                  __int16 v126 = 1024;
                  int v127 = 471;
                  __int16 v128 = 2114;
                  v129 = v44;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
                }

                _bs_set_crash_log_message([v44 UTF8String]);
                __break(0);
                JUMPOUT(0x1000044E8LL);
              }

              [v23 addObject:v29];
            }

            id v25 = [v24 countByEnumeratingWithState:&v81 objects:v116 count:16];
          }

          while (v25);
        }

        __int16 v30 = objc_alloc(&OBJC_CLASS___DASDisplayInfo);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKey:v22]);
        id v32 = -[DASDisplayInfo _initWithName:attachedContexts:raw:]( v30,  "_initWithName:attachedContexts:raw:",  v22,  v23,  v31);
        [v78 addObject:v32];
      }

      id v20 = [obj countByEnumeratingWithState:&v85 objects:v117 count:16];
    }

    while (v20);
  }

  id v33 = (NSOrderedSet *)[v78 copy];
  displays = self->_displays;
  self->_displays = v33;

  int v35 = (NSDictionary *)[v19 copy];
  contextIDNumberToContextMap = self->_contextIDNumberToContextMap;
  self->_contextIDNumberToContextMap = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
  v38 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v37));
  contexts = self->_contexts;
  self->_contexts = v38;

  v40 = (NSArray *)[v70 copy];
  parseErrors = self->_parseErrors;
  self->_parseErrors = v40;

  id v42 = sub_10000661C();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v119 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "parse result: '%@'", buf, 0xCu);
  }

  _Block_object_dispose(v108, 8);
  _Block_object_dispose(v110, 8);

  _Block_object_dispose(v112, 8);
}

- (NSOrderedSet)displays
{
  return self->_displays;
}

- (NSSet)contexts
{
  return self->_contexts;
}

- (NSArray)parseErrors
{
  return self->_parseErrors;
}

- (NSString)raw
{
  return self->_raw;
}

- (void).cxx_destruct
{
}

+ (id)infoFromServerWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((BSMachPortIsType(*(void *)&a3, 0x10000LL) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"the render server port must be valid"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (objc_class *)objc_opt_class(a1);
      id v17 = NSStringFromClass(v16);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2048;
      id v32 = a1;
      __int16 v33 = 2114;
      __int16 v34 = @"DASParsing.m";
      __int16 v35 = 1024;
      int v36 = 232;
      __int16 v37 = 2114;
      v38 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x1000063BCLL);
  }

  if ((BSMachSendRightRetain(v3) & 1) == 0)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"could not retain the server port"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v20 = NSStringFromSelector(a2);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = (objc_class *)objc_opt_class(a1);
      id v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2048;
      id v32 = a1;
      __int16 v33 = 2114;
      __int16 v34 = @"DASParsing.m";
      __int16 v35 = 1024;
      int v36 = 237;
      __int16 v37 = 2114;
      v38 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x1000064A8LL);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  id v6 = off_1000153D8;
  id v32 = off_1000153D8;
  if (!off_1000153D8)
  {
    id v7 = sub_100006064();
    id v6 = dlsym(v7, "CARenderServerGetInfo");
    *(void *)(*(void *)&buf[8] + 24LL) = v6;
    off_1000153D8 = v6;
  }

  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    a1 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    a2 = (SEL)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "char *soft_CARenderServerGetInfo(mach_port_t, uint32_t, uintptr_t)"));
    objc_msgSend( a1,  "handleFailureInFunction:file:lineNumber:description:",  a2,  @"DASParsing.m",  25,  @"%s",  dlerror());

    __break(1u);
LABEL_15:
    id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringWithFormat:", @"could not fetch contexts info from server %x", v3));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = NSStringFromSelector(a2);
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      unsigned int v28 = (objc_class *)objc_opt_class(a1);
      v29 = NSStringFromClass(v28);
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      id v32 = a1;
      __int16 v33 = 2114;
      __int16 v34 = @"DASParsing.m";
      __int16 v35 = 1024;
      int v36 = 239;
      __int16 v37 = 2114;
      v38 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v25 UTF8String]);
    __break(0);
    JUMPOUT(0x1000065F4LL);
  }

  id v8 = (void *)((uint64_t (*)(uint64_t, void, void))v6)(v3, 0LL, 0LL);
  v9 = &OBJC_CLASS___NSString;
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
  free(v8);
  id v11 = -[DASRenderServerInfo _initWithPort:raw:]( objc_alloc(&OBJC_CLASS___DASRenderServerInfo),  "_initWithPort:raw:",  v3,  v10);

  return v11;
}

@end