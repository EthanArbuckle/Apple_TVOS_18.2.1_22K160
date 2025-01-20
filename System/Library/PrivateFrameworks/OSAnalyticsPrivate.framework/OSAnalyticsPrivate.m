void sub_187E708D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_61:
  [MEMORY[0x189611B08] sharedInstance];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (os_log_s *)[v65 logDomain];

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v63) {
      v67 = @"SUCCESS";
    }
    else {
      v67 = @"ABORTED";
    }
    v68 = v93->_jobCount;
    v69 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138543874;
    *(void *)v112 = v67;
    *(_WORD *)&v112[8] = 1024;
    *(_DWORD *)&v112[10] = v68;
    *(_WORD *)&v112[14] = 2048;
    *(double *)&v112[16] = v69 - Current;
    _os_log_impl( &dword_187E6F000,  v66,  OS_LOG_TYPE_DEFAULT,  "Submission Result: %{public}@ after %u job(s), elapsed time %.2f s",  buf,  0x1Cu);
  }

  if ((_DWORD)v63)
  {
    [v14 setObject:@"success" forKeyedSubscript:@"result"];
  }

  else
  {
    v70 = (void *)NSString;
    responseError = v93->_responseError;
    if (responseError)
    {
      -[NSError localizedDescription](v93->_responseError, "localizedDescription");
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v72 = @"other";
    }

    [v70 stringWithFormat:@"ABORTED - %@", v72];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v73 forKeyedSubscript:@"result"];

    if (responseError) {
  }
    }

  [MEMORY[0x189607968] numberWithBool:v63];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setObject:v74 forKeyedSubscript:@"complete"];

  [v14 setObject:v84 forKeyedSubscript:@"jobs"];
  [v14 setObject:v82 forKeyedSubscript:@"taskings"];

  return v14;
}

LABEL_96:
          [v119 setObject:v180 forKeyedSubscript:v189];
          goto LABEL_97;
        }

        if (v118 != 200) {
          goto LABEL_96;
        }
        [v183 objectForKeyedSubscript:v189];
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        if (v120)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v233 = v189;
            v121 = (os_log_s *)MEMORY[0x1895F8DA0];
            v122 = "Unexpected response data; already installed tasking blob of type %@ this session";
            v123 = OS_LOG_TYPE_INFO;
LABEL_82:
            _os_log_impl(&dword_187E6F000, v121, v123, v122, buf, 0xCu);
            goto LABEL_96;
          }

          goto LABEL_96;
        }
        v128 = -[NSDictionary objectForKeyedSubscript:](self->_responseHeaders, "objectForKeyedSubscript:", v117);
        if (![v128 length])
        {
          [v180 setObject:@"unchanged" forKeyedSubscript:@"action"];
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v233 = v189;
            _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "no tasking id returned for %@",  buf,  0xCu);
          }

          goto LABEL_95;
        }

        [MEMORY[0x189611B08] sharedInstance];
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v129 appleInternal])
        {
          allowUnsignedBlobs = self->_allowUnsignedBlobs;

          if (allowUnsignedBlobs)
          {
            v131 = self->_responseData;
            v132 = 0LL;
LABEL_94:
            v136 = -[OSASubmitter applyTasking:taskId:usingConfig:fromBlob:]( self,  "applyTasking:taskId:usingConfig:fromBlob:",  v189,  v128,  v181,  v131);
            [v180 addEntriesFromDictionary:v136];

            v119 = v183;
LABEL_95:

            goto LABEL_96;
          }
        }

        else
        {
        }

        if (-[NSData length](self->_responseData, "length"))
        {
          responseData = self->_responseData;
          v197 = 0LL;
          +[OSASubmitter extractAuthenticatedBlob:error:]( &OBJC_CLASS___OSASubmitter,  "extractAuthenticatedBlob:error:",  responseData,  &v197);
          v131 = (NSData *)objc_claimAutoreleasedReturnValue();
          v134 = v197;
          v132 = v134;
          if (v134)
          {
            [v134 localizedDescription];
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            [v180 setObject:v135 forKeyedSubscript:@"authenticationError"];
          }
        }

        else
        {
          v132 = 0LL;
          v131 = 0LL;
        }

        goto LABEL_94;
      }
    }

    v114 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v110,  "countByEnumeratingWithState:objects:count:",  &v198,  v223,  16LL);
    v96 = self;
    if (v114) {
      continue;
    }
    break;
  }

LABEL_97:
  v15 = v189;
  if (v173) {
    -[OSASubmitter updateTaskingLastSuccessfulRequest:at:](v96, "updateTaskingLastSuccessfulRequest:at:", v189, v21);
  }
LABEL_99:
  [*(id *)(v113 + 2824) sharedInstance];
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = [v137 appleInternal];

  if (v138)
  {
    [*(id *)(v113 + 2824) sharedInstance];
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    [v139 pathDiagnostics];
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    [v140 stringByAppendingPathComponent:v185];
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    [v141 stringByAppendingPathExtension:@"ips"];
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    [v186 writeToFile:v142 atomically:0];
    v219[0] = @"logs";
    [v112 valueForKey:@"getFilenames"];
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v220[0] = v143;
    v220[1] = v178;
    v219[1] = @"postHeaders";
    v219[2] = @"response";
    v144 = [MEMORY[0x189607968] numberWithInteger:v96->_responseCode];
    v145 = (void *)v144;
    responseHeaders = (NSDictionary *)MEMORY[0x189604A60];
    responseError = v96->_responseError;
    if (v96->_responseHeaders) {
      responseHeaders = v96->_responseHeaders;
    }
    v220[2] = v144;
    v220[3] = responseHeaders;
    v219[3] = @"responseHeaders";
    v219[4] = @"responseError";
    if (responseError)
    {
      -[NSError localizedDescription](responseError, "localizedDescription");
      v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v148 = &stru_18A161700;
    }

    v220[4] = v148;
    v219[5] = @"payloadLength";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[NSData length](v96->_responseData, "length"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v220[5] = v149;
    [MEMORY[0x189603F68] dictionaryWithObjects:v220 forKeys:v219 count:6];
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (responseError) {
    [*(id *)(v113 + 2824) sharedInstance];
    }
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    [v151 pathDiagnostics];
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    [v152 stringByAppendingPathComponent:v185];
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    [v153 stringByAppendingPathExtension:@"diagnostics"];
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    [v150 writeToFile:v154 atomically:1];

    v15 = v189;
    v112 = v182;
  }

  if (v174 == 304 || v174 == 200)
  {
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v155 = v112;
    v156 = [v155 countByEnumeratingWithState:&v193 objects:v218 count:16];
    if (v156)
    {
      v157 = v156;
      LODWORD(v158) = 0;
      v159 = *(void *)v194;
      do
      {
        for (n = 0LL; n != v157; ++n)
        {
          if (*(void *)v194 != v159) {
            objc_enumerationMutation(v155);
          }
          v161 = *(void **)(*((void *)&v193 + 1) + 8 * n);
          [v161 bugType];
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = [v162 isEqualToString:@"193"];

          dryRun = self->_dryRun;
          [v161 bugType];
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          if (dryRun)
          {
            [v188 _recordRetirement:v165 reason:@"pending"];
          }

          else
          {
            [v188 _recordRetirement:v165 reason:@"submitted"];

            [v161 retire:"submitted"];
          }

          v158 = (v158 + v163);
        }

        v157 = [v155 countByEnumeratingWithState:&v193 objects:v218 count:16];
      }

      while (v157);
    }

    else
    {
      v158 = 0LL;
    }

    v15 = v189;
  }

  else
  {
    v158 = 0LL;
  }

  v216[0] = @"complete";
  [MEMORY[0x189607968] numberWithBool:v175];
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v217[0] = v190;
  v217[1] = v15;
  v216[1] = @"routing";
  v216[2] = @"logCount";
  v16 = v182;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v182, "count"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v217[2] = v166;
  v216[3] = @"aggdCount";
  [MEMORY[0x189607968] numberWithInt:v158];
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v217[3] = v167;
  v216[4] = @"contentLength";
  v14 = v186;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v186, "length"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v217[4] = v168;
  v216[5] = @"response";
  [MEMORY[0x189607968] numberWithInteger:self->_responseCode];
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v217[5] = v169;
  v216[6] = @"payloadLength";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[NSData length](self->_responseData, "length"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v217[6] = v170;
  v217[7] = v180;
  v216[7] = @"tasking";
  v216[8] = @"seconds";
  [MEMORY[0x189607968] numberWithDouble:v80];
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v217[8] = v171;
  [MEMORY[0x189603F68] dictionaryWithObjects:v217 forKeys:v216 count:9];
  v192 = (id)objc_claimAutoreleasedReturnValue();

  [v182 removeAllObjects];
  [v186 setLength:0];

  v17 = v181;
  v18 = v183;
  v23 = v184;
  v19 = v177;
LABEL_125:

  return v192;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}
}

LABEL_15:
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

void OUTLINED_FUNCTION_0_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_31:
    _Block_object_dispose(buf, 8);
    objc_autoreleasePoolPop(v7);
    if (!v24) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void *)(a1 + 40);
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = string;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "incoming connection from %s ERROR %s\n",  buf,  0x16u);
  }

LABEL_36:
}

void sub_187E78764( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_13:
  unlink(*(const char **)(a1 + 64));
  free(*(void **)(a1 + 64));
}

LABEL_27:
    v27 = 0LL;
    goto LABEL_28;
  }

  [MEMORY[0x189607AB8] UUID];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 UUIDString];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v12];
  }
  else {
    [MEMORY[0x189603FC8] dictionary];
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a6;
  v49[0] = @"messageType";
  v49[1] = @"fileMetadata";
  v50[0] = @"<file>";
  v50[1] = v22;
  v35 = v22;
  [MEMORY[0x189603F68] dictionaryWithObjects:v50 forKeys:v49 count:2];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ns2xpc();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v11;
  [v25 fileSystemRepresentation];
  v26 = v25;
  v36 = v26;
  v27 = v16;
  v37 = v27;
  v28 = v13;
  v38 = v28;
  v29 = (void *)xpc_file_transfer_create_with_path();
  if (v29)
  {
    xpc_dictionary_set_value(v24, "<file_xfer>", v29);
    +[PCCBridgeEndpoint addSenderToMessage:](&OBJC_CLASS___PCCBridgeEndpoint, "addSenderToMessage:", v24);
    v30 = -[NSMutableDictionary objectForKeyedSubscript:](self->_outgoingConnections, "objectForKeyedSubscript:", v28);
    xpc_remote_connection_send_message();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v46 = v26;
      v47 = 2114;
      v48 = v27;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "sent %{public}@, tracking: %{public}@",  buf,  0x16u);
    }
  }

  else
  {

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v26;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unable to create xpc file xfer object for %{public}@",  buf,  0xCu);
    }

    if (v34)
    {
      v31 = (void *)MEMORY[0x189607870];
      v43 = *MEMORY[0x1896075E0];
      v44 = @"Unable to transfer file";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 errorWithDomain:@"ProxyBridgeErrorDomain" code:3 userInfo:v32];
      *v34 = (id)objc_claimAutoreleasedReturnValue();
    }

    v27 = 0LL;
  }

LABEL_28:
  return v27;
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id OSAStabilityMonitorLogDomain()
{
  if (OSAStabilityMonitorLogDomain_onceToken != -1) {
    dispatch_once(&OSAStabilityMonitorLogDomain_onceToken, &__block_literal_global_0);
  }
  return (id)OSAStabilityMonitorLogDomain_domain;
}

void __OSAStabilityMonitorLogDomain_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.osanalytics.monitors", "stability");
  v1 = (void *)OSAStabilityMonitorLogDomain_domain;
  OSAStabilityMonitorLogDomain_domain = (uint64_t)v0;
}

id OSAStabilityMonitorLoadParameters()
{
  if (objc_opt_class())
  {
    [MEMORY[0x189612BA8] clientWithIdentifier:295];
    os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
    [v0 levelForFactor:@"parameters" withNamespaceName:@"OS_ANALYTICS_STABILITY_MONITOR"];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MEMORY[0x189603F48];
    [v1 fileValue];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 path];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 dataWithContentsOfFile:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      id v10 = 0LL;
      [MEMORY[0x1896079E8] propertyListWithData:v5 options:0 format:0 error:&v10];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (os_log_s *)v10;
      if (!v6)
      {
        OSAStabilityMonitorLogDomain();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          OSAStabilityMonitorLoadParameters_cold_3();
        }
      }
    }

    else
    {
      OSAStabilityMonitorLogDomain();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        OSAStabilityMonitorLoadParameters_cold_2();
      }
      v6 = 0LL;
    }
  }

  else
  {
    OSAStabilityMonitorLogDomain();
    os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v0, OS_LOG_TYPE_ERROR)) {
      OSAStabilityMonitorLoadParameters_cold_1();
    }
    v6 = 0LL;
  }

  return v6;
}

void OSAStabilityMonitorEvaluateStabilityForBundleID(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  v9 = a3;
  id v10 = a4;
  if (v7)
  {
    OSAnalyticsHelperServiceConnection();
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      OSAStabilityMonitorLoadParameters();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        ns2xpc();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v14 = v13 != 0LL;
        if (v13)
        {
          empty = xpc_dictionary_create_empty();
          xpc_dictionary_set_uint64(empty, "operation", 8uLL);
          xpc_dictionary_set_string( empty, "stability_bundleID", (const char *)[v7 UTF8String]);
          xpc_dictionary_set_value(empty, "stability_parameters", v13);
          if (v8) {
            xpc_dictionary_set_string( empty, "stability_coalitionName", (const char *)[v8 UTF8String]);
          }
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 3221225472LL;
          handler[2] = __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke;
          handler[3] = &unk_18A161430;
          id v17 = v10;
          xpc_connection_send_message_with_reply(v11, empty, v9, handler);
        }

        else
        {
          OSAStabilityMonitorLogDomain();
          empty = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)empty, OS_LOG_TYPE_ERROR)) {
            OSAStabilityMonitorEvaluateStabilityForBundleID_cold_4();
          }
        }
      }

      else
      {
        OSAStabilityMonitorLogDomain();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
          OSAStabilityMonitorEvaluateStabilityForBundleID_cold_3();
        }
        BOOL v14 = 0;
      }
    }

    else
    {
      OSAStabilityMonitorLogDomain();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        OSAStabilityMonitorEvaluateStabilityForBundleID_cold_2();
      }
      BOOL v14 = 0;
    }
  }

  else
  {
    OSAStabilityMonitorLogDomain();
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      OSAStabilityMonitorEvaluateStabilityForBundleID_cold_1();
    }
    BOOL v14 = 0;
  }

  if (v10 && !v14) {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1895B88F0]() == MEMORY[0x1895F9250])
  {
    if (xpc_dictionary_get_BOOL(v3, "result"))
    {
      BOOL v6 = xpc_dictionary_get_BOOL(v3, "stability_result");
      goto LABEL_12;
    }

    xpc_dictionary_get_string(v3, "error_desc");
    OSAStabilityMonitorLogDomain();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_2();
    }
  }

  else
  {
    v4 = (void *)MEMORY[0x1895B8860](v3);
    OSAStabilityMonitorLogDomain();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_3();
    }

    if (v4) {
      free(v4);
    }
  }

  BOOL v6 = 0LL;
LABEL_12:
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v6);
  }

  else
  {
    OSAStabilityMonitorLogDomain();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_1();
    }
  }
}

  ;
}

LABEL_14:
  return v12;
}

LABEL_8:
}

  [v9 objectForKeyedSubscript:@"proxied_dev"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [@"ProxiedDevice-" stringByAppendingString:v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PCCProxyingDevice isFilenameReasonable:](self, "isFilenameReasonable:", v24))
  {
    [v9 objectForKeyedSubscript:@"name"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PCCProxyingDevice isFilenameReasonable:](self, "isFilenameReasonable:", v25))
    {
      v26 = [v9 objectForKeyedSubscript:@"subdir"];
      v27 = (void *)MEMORY[0x189611B08];
      [MEMORY[0x189611B08] sharedInstance];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 pathSubmission];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26) {
        v30 = (const __CFString *)v26;
      }
      else {
        v30 = &stru_18A161700;
      }
      objc_msgSend(v24, "stringByAppendingPathComponent:", v30, v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = *MEMORY[0x189611C38];
      v122[0] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v122 forKeys:&v121 count:1];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 ensureUsablePath:v29 component:v31 options:v32];
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v91 = v33;
      if (v33)
      {
        v34 = [v33 stringByAppendingPathComponent:v25];
        v35 = (void *)NSString;
        [MEMORY[0x189611B08] sharedInstance];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 pathSubmission];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v120[0] = v37;
        v120[1] = v24;
        v120[2] = @"Retired";
        v120[3] = v25;
        [MEMORY[0x189603F18] arrayWithObjects:v120 count:4];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 pathWithComponents:v38];
        v40 = v39 = v25;

        [MEMORY[0x1896078A8] defaultManager];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v119[0] = v34;
        v95 = (void *)v34;
        v42 = (void *)v34;
        v43 = (void *)v40;
        v25 = v39;
        [v42 stringByAppendingPathExtension:@"synced"];
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v44;
        v119[2] = v43;
        [v43 stringByAppendingPathExtension:@"synced"];
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v119[3] = v45;
        [MEMORY[0x189603F18] arrayWithObjects:v119 count:4];
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v47 = v46;
        v48 = [v47 countByEnumeratingWithState:&v98 objects:v118 count:16];
        if (v48)
        {
          v49 = v48;
          v50 = *(void *)v99;
LABEL_16:
          v51 = 0LL;
          while (1)
          {
            if (*(void *)v99 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v98 + 1) + 8 * v51);
            if (v49 == ++v51)
            {
              v49 = [v47 countByEnumeratingWithState:&v98 objects:v118 count:16];
              if (v49) {
                goto LABEL_16;
              }
              goto LABEL_33;
            }
          }

          [v95 pathExtension];
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = [v57 isEqualToString:@"ips"];

          v59 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
          if (v58)
          {
            if (v59)
            {
              *(_DWORD *)buf = 138543362;
              v113 = v52;
              _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Duplicate log detected at %{public}@",  buf,  0xCu);
            }

            v60 = v52;

            -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v25, @"failed-duplicate");
            v22 = 0LL;
            v61 = @"<unknown>";
            v95 = v60;
            v9 = v96;
            goto LABEL_45;
          }

          if (v59)
          {
            *(_DWORD *)buf = 138543362;
            v113 = v52;
            _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "overwriting file at %{public}@",  buf,  0xCu);
          }

          [v41 removeItemAtPath:v52 error:0];
        }

LABEL_24:
}

  objc_autoreleasePoolPop(v2);
}

LABEL_4:
    id v10 = 0LL;
    goto LABEL_5;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18[0] = @"PayloadContent";
    v18[1] = @"PayloadType";
    v19[0] = v7;
    v19[1] = @"Configuration";
    v12 = [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:v18 count:2];

    id v7 = (id)v12;
  }

  v15 = 0LL;
  v13 = [MEMORY[0x1896079E8] dataWithPropertyList:v7 format:200 options:0 error:&v15];
  BOOL v14 = v15;
  id v10 = v14;
  if (v13)
  {

    id v10 = (id)v13;
    goto LABEL_5;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v10;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Serialization of settings to plist failed: %@",  buf,  0xCu);
  }

LABEL_6:
}

LABEL_33:
        [v94 path];
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = 0LL;
        v66 = [v41 moveItemAtPath:v65 toPath:v95 error:&v97];
        v22 = v97;

        v67 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v67)
          {
            *(_DWORD *)buf = 138543362;
            v113 = v95;
            _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "incoming log %{public}@",  buf,  0xCu);
          }

          [v93 rename:v95];
          v68 = v25;
          [v68 pathExtension];
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = [v69 isEqualToString:@"synced"];

          if (v70)
          {
            v71 = [v68 stringByDeletingPathExtension];

            v68 = (id)v71;
          }

          [v68 pathExtension];
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = [&unk_18A166CB8 containsObject:v72];

          if (v73)
          {
            [v93 bugType];
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = v96;
            -[PCCProxyingDevice receivedReport:from:metadata:](self, "receivedReport:from:metadata:", v93, v92, v96);
          }

          else
          {
            [v68 pathExtension];
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = v96;
          }

          -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v61, @"received");

LABEL_45:
          v64 = v90;
        }

        else
        {
          v9 = v96;
          v64 = v90;
          if (v67)
          {
            *(_DWORD *)buf = 138543874;
            v113 = v94;
            v114 = 2114;
            v115 = v95;
            v116 = 2114;
            v117 = v22;
            _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "FAILED to activate %{public}@ -> %{public}@ : %{public}@",  buf,  0x20u);
          }

          -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v25, @"failed-move");
          v61 = @"<unknown>";
        }
      }

      else
      {
        v62 = (void *)MEMORY[0x189607870];
        v110 = *MEMORY[0x1896075E0];
        v111 = @"failed untrusted path validation";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v63];
        v22 = (id)objc_claimAutoreleasedReturnValue();

        -[PCCProxyingDevice summarizeLog:reason:](self, "summarizeLog:reason:", v25, @"failed-path");
        v95 = 0LL;
        v9 = v96;
        v64 = v90;
      }
    }

    else
    {
      v55 = (void *)MEMORY[0x189607870];
      v108 = *MEMORY[0x1896075E0];
      v109 = @"failed untrusted filename validation";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v55 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v56];
      v22 = (id)objc_claimAutoreleasedReturnValue();

      -[PCCProxyingDevice summarizeLog:reason:]( self,  "summarizeLog:reason:",  @"<untrusted>",  @"failed-filename");
      v95 = 0LL;
    }
  }

  else
  {
    v53 = (void *)MEMORY[0x189607870];
    v106 = *MEMORY[0x1896075E0];
    v107 = @"failed untrusted proxy validation";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 errorWithDomain:@"ProxyCompanionLogTransferErrorDomain" code:6 userInfo:v54];
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[PCCProxyingDevice summarizeLog:reason:]( self,  "summarizeLog:reason:",  @"<untrusted>",  @"failed-proxy-data");
    v95 = 0LL;
  }

LABEL_50:
  [MEMORY[0x189603F50] date];
  v74 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastTouch = self->_lastTouch;
  self->_lastTouch = v74;

  if (v22 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    -[PCCProxyingDevice handleFile:from:metadata:].cold.2((uint64_t)v94, (uint64_t)v92, (uint64_t)v22);
  }
  [v9 objectForKeyedSubscript:@"jobId"];
  v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"jobEvent"];
  v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"jobType"];
  v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"status"];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v79 objectForKeyedSubscript:@"jobStatus"];
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v80 = 0LL;
  }

  if ([v80 BOOLValue])
  {
    v81 = @"<unsolicited>";
    v102[0] = @"jobId";
    v102[1] = @"jobType";
    v82 = @"xfer-file";
    if (v76) {
      v81 = v76;
    }
    if (v78) {
      v82 = v78;
    }
    v103[0] = v81;
    v103[1] = v82;
    v102[2] = @"jobEvent";
    v83 = @"<legacy>";
    if (v77) {
      v83 = v77;
    }
    v103[2] = v83;
    [MEMORY[0x189603F68] dictionaryWithObjects:v103 forKeys:v102 count:3];
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v95;
    if (v22) {
      v86 = v22;
    }
    else {
      v86 = v95;
    }
    -[PCCProxyingDevice finishRequestWithMessage:result:](self, "finishRequestWithMessage:result:", v84, v86);

    v87 = v96;
  }

  else
  {
    v85 = v95;
    v87 = v96;
    if (v76)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        -[PCCProxyingDevice handleFile:from:metadata:].cold.1((uint64_t)v79);
      }
      if (v77) {
        v88 = v77;
      }
      else {
        v88 = @"unsolicited";
      }
      if (v78) {
        v89 = v78;
      }
      else {
        v89 = @"xfer-group";
      }
      -[PCCProxyingDevice addRequest:event:type:onComplete:]( self,  "addRequest:event:type:onComplete:",  v76,  v88,  v89,  0LL);
    }
  }
}

LABEL_10:
    [*(id *)(a1 + 48) finishRequest:v5 result:*(void *)(a1 + 40)];
LABEL_23:

    goto LABEL_24;
  }

  [*(id *)(a1 + 32) objectForKeyedSubscript:@"messageType"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 isEqualToString:@"updateProxiedDeviceMetadata"];

  if (v8)
  {
    [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:@"<unsolicited>"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5) {
      goto LABEL_23;
    }
    goto LABEL_10;
  }

  [*(id *)(a1 + 32) objectForKeyedSubscript:@"messageType"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 isEqualToString:@"initiateLogList"];

  if ((v10 & 1) == 0)
  {
    [*(id *)(a1 + 32) objectForKeyedSubscript:@"messageType"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [v11 isEqualToString:@"synchronize"];

    if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      id v17 = 138412290;
      v18 = v13;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "unknown finishing message %@",  (uint8_t *)&v17,  0xCu);
    }
  }

void OSAStabilityMonitorLoadParameters_cold_1()
{
}

void OSAStabilityMonitorLoadParameters_cold_2()
{
}

void OSAStabilityMonitorLoadParameters_cold_3()
{
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_1()
{
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_2()
{
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_3()
{
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_4()
{
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_1()
{
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_2()
{
}

void __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke_cold_3()
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x18960DA98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x18960FEE0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x189613728]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x189607720]();
}

uint64_t OSAIsDebugEnabledForRSD()
{
  return MEMORY[0x189611B50]();
}

uint64_t OSAIsRSDDevice()
{
  return MEMORY[0x189611B58]();
}

uint64_t OSAIsRSDDisplay()
{
  return MEMORY[0x189611B60]();
}

uint64_t OSAIsRSDHost()
{
  return MEMORY[0x189611B68]();
}

uint64_t OSANSDateFormat()
{
  return MEMORY[0x189611B70]();
}

uint64_t OSASafeOpenWriteOnly()
{
  return MEMORY[0x189611B78]();
}

uint64_t OSAnalyticsHelperServiceConnection()
{
  return MEMORY[0x189611BD0]();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return MEMORY[0x18960B238]();
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x18960B560]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x18960B6E0](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1896175A0](strm, *(void *)&level, version, *(void *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1896175A8](strm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1895FAEF0](when, delta);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB320](__buf, __size, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

uint64_t ns2xpc()
{
  return MEMORY[0x189611C40]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

double pow(double a1, double a2)
{
  return result;
}

uint64_t remote_device_browser_cancel()
{
  return MEMORY[0x189611E98]();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return MEMORY[0x189611EA8]();
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x189611EC8]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x189611ED8]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x189611EE8]();
}

uint64_t remote_device_copy_uuid()
{
  return MEMORY[0x189611F00]();
}

uint64_t remote_device_get_name()
{
  return MEMORY[0x189611F20]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x189611F30]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x189611F38]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x189611F58]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x189611F60]();
}

uint64_t remote_device_start_browsing()
{
  return MEMORY[0x189611F78]();
}

uint64_t remote_device_state_get_description()
{
  return MEMORY[0x189611F88]();
}

uint64_t remote_device_type_get_description()
{
  return MEMORY[0x189611F90]();
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

uint64_t xpc2ns()
{
  return MEMORY[0x189611C50]();
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1895FDBA0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1895FDC78]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x1895FDE28]();
}

uint64_t xpc_file_transfer_write_to_fd()
{
  return MEMORY[0x1895FDE58]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x189612010]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x189612018]();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return MEMORY[0x189612038]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x189612050]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x189612080]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x189612090]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1896120A0]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t objc_msgSend__initWithRequest_delegate_usesCache_maxContentLength_startImmediately_connectionProperties_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithRequest_delegate_usesCache_maxContentLength_startImmediately_connectionProperties_);
}

uint64_t objc_msgSend_processJob_forRouting_including_usingConfig_taskings_summarize_additionalRequestHeaders_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_processJob_forRouting_including_usingConfig_taskings_summarize_additionalRequestHeaders_);
}

uint64_t objc_msgSend_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_);
}