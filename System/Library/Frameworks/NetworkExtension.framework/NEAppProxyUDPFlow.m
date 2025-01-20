@interface NEAppProxyUDPFlow
- (NEAppProxyUDPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4;
- (NWEndpoint)localEndpoint;
- (OS_nw_endpoint)localFlowEndpoint;
- (id)description;
- (void)openWithLocalEndpoint:(id)a3 completionHandler:(id)a4;
- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4;
- (void)readDatagramsAndFlowEndpointsWithCompletionHandler:(id)a3;
- (void)readDatagramsWithCompletionHandler:(void *)completionHandler;
- (void)resetLocalEndpoint;
- (void)writeDatagrams:(NSArray *)datagrams sentByEndpoints:(NSArray *)remoteEndpoints completionHandler:(void *)completionHandler;
- (void)writeDatagrams:(id)a3 sentByFlowEndpoints:(id)a4 completionHandler:(id)a5;
@end

@implementation NEAppProxyUDPFlow

- (NEAppProxyUDPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEAppProxyUDPFlow;
  v4 = -[NEAppProxyFlow initWithNEFlow:queue:](&v7, sel_initWithNEFlow_queue_, a3, a4);
  v5 = v4;
  if (v4) {
    -[NEAppProxyUDPFlow resetLocalEndpoint]((uint64_t)v4);
  }
  return v5;
}

- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4
{
  v7[1] = 3221225472LL;
  v7[2] = __65__NEAppProxyUDPFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke;
  v7[3] = &unk_18A090968;
  v8 = self;
  id v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___NEAppProxyUDPFlow;
  v7[0] = MEMORY[0x1895F87A8];
  id v5 = v9;
  -[NEAppProxyFlow openWithLocalFlowEndpoint:completionHandler:]( &v6,  sel_openWithLocalFlowEndpoint_completionHandler_,  a3,  v7);
}

- (void)openWithLocalEndpoint:(id)a3 completionHandler:(id)a4
{
  v7[1] = 3221225472LL;
  v7[2] = __61__NEAppProxyUDPFlow_openWithLocalEndpoint_completionHandler___block_invoke;
  v7[3] = &unk_18A090968;
  v8 = self;
  id v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___NEAppProxyUDPFlow;
  v7[0] = MEMORY[0x1895F87A8];
  id v5 = v9;
  -[NEAppProxyFlow openWithLocalEndpoint:completionHandler:](&v6, sel_openWithLocalEndpoint_completionHandler_, a3, v7);
}

- (void)readDatagramsAndFlowEndpointsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  v17 = __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke;
  v18 = &unk_18A08B1E8;
  id v6 = v4;
  id v19 = v6;
  uint64_t v7 = NEFlowAsyncDatagramsCopyNext();
  if (v7)
  {
    uint64_t v9 = v7;
    if (self) {
      id Property = objc_getProperty(self, v8, 40LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v11 = (dispatch_queue_s *)Property;
    block[0] = v5;
    block[1] = 3221225472LL;
    block[2] = __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_18A08FC28;
    id v13 = v6;
    uint64_t v14 = v9;
    dispatch_async(v11, block);
  }
}

- (void)readDatagramsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  v17 = __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke;
  v18 = &unk_18A08B1E8;
  id v6 = v4;
  id v19 = v6;
  uint64_t v7 = NEFlowAsyncDatagramsCopyNext();
  if (v7)
  {
    uint64_t v9 = v7;
    if (self) {
      id Property = objc_getProperty(self, v8, 40LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v11 = (dispatch_queue_s *)Property;
    block[0] = v5;
    block[1] = 3221225472LL;
    block[2] = __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_18A08FC28;
    id v13 = v6;
    uint64_t v14 = v9;
    dispatch_async(v11, block);
  }
}

- (void)writeDatagrams:(id)a3 sentByFlowEndpoints:(id)a4 completionHandler:(id)a5
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  v46 = v9;
  v47 = v8;
  if (v11 == [v9 count])
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v12);
          }
          if ((isa_nsdata(*(void **)(*((void *)&v64 + 1) + 8 * i)) & 1) == 0)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
              _os_log_error_impl( &dword_1876B1000,  v37,  OS_LOG_TYPE_ERROR,  "%s: Datagrams array contains a non-NSData object",  buf,  0xCu);
            }

            if (self) {
              id Property = objc_getProperty(self, v38, 40LL, 1);
            }
            else {
              id Property = 0LL;
            }
            v40 = (dispatch_queue_s *)Property;
            v62[0] = MEMORY[0x1895F87A8];
            v62[1] = 3221225472LL;
            v62[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_10;
            v62[3] = &unk_18A090940;
            id v63 = v10;
            dispatch_async(v40, v62);

            goto LABEL_48;
          }
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v71 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v59;
      while (2)
      {
        for (uint64_t j = 0LL; j != v19; ++j)
        {
          if (*(void *)v59 != v20) {
            objc_enumerationMutation(v17);
          }
          if (nw_endpoint_get_type(*(nw_endpoint_t *)(*((void *)&v58 + 1) + 8 * j)) != nw_endpoint_type_address)
          {
            ne_log_obj();
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
              _os_log_error_impl( &dword_1876B1000,  v41,  OS_LOG_TYPE_ERROR,  "%s: Remote endpoints array contains a non-NWEndpoint object",  buf,  0xCu);
            }

            if (self) {
              id v43 = objc_getProperty(self, v42, 40LL, 1);
            }
            else {
              id v43 = 0LL;
            }
            v44 = (dispatch_queue_s *)v43;
            v56[0] = MEMORY[0x1895F87A8];
            v56[1] = 3221225472LL;
            v56[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_11;
            v56[3] = &unk_18A090940;
            id v57 = v10;
            dispatch_async(v44, v56);

            id v12 = v17;
            goto LABEL_48;
          }
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v70 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    if ([v12 count])
    {
      unint64_t v23 = 0LL;
      *(void *)&__int128 v22 = 136315138LL;
      __int128 v45 = v22;
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v23, v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 objectAtIndexedSubscript:v23];
        v25 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
        nw_endpoint_get_address(v25);
        unint64_t v26 = [v12 count] - 1;
        if (v23 >= v26)
        {
          uint64_t v51 = MEMORY[0x1895F87A8];
          uint64_t v52 = 3221225472LL;
          v53 = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_2;
          v54 = &unk_18A08B210;
          id v55 = v10;
        }

        uint64_t v27 = NEFlowWrite();
        if (v27)
        {
          uint64_t v28 = v27;
          ne_log_obj();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v45;
            v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
            _os_log_error_impl(&dword_1876B1000, v29, OS_LOG_TYPE_ERROR, "%s: Failed to write flow Data", buf, 0xCu);
          }

          if (self) {
            id v31 = objc_getProperty(self, v30, 40LL, 1);
          }
          else {
            id v31 = 0LL;
          }
          v32 = (dispatch_queue_s *)v31;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_13;
          block[3] = &unk_18A08FC28;
          id v49 = v10;
          uint64_t v50 = v28;
          dispatch_async(v32, block);
        }

        if (v23 >= v26) {

        }
        ++v23;
      }

      while (v23 < [v12 count]);
    }
  }

  else
  {
    ne_log_obj();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByFlowEndpoints:completionHandler:]";
      __int16 v74 = 2048;
      uint64_t v75 = [v8 count];
      __int16 v76 = 2048;
      uint64_t v77 = [v9 count];
      _os_log_error_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_ERROR,  "%s: Size of datagrams array (%lu) does not match size of remoteEndpoints array (%lu)",  buf,  0x20u);
    }

    if (self) {
      id v35 = objc_getProperty(self, v34, 40LL, 1);
    }
    else {
      id v35 = 0LL;
    }
    v36 = (dispatch_queue_s *)v35;
    v68[0] = MEMORY[0x1895F87A8];
    v68[1] = 3221225472LL;
    v68[2] = __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke;
    v68[3] = &unk_18A090940;
    id v69 = v10;
    dispatch_async(v36, v68);

    id v12 = v69;
LABEL_48:
  }
}

- (void)writeDatagrams:(NSArray *)datagrams sentByEndpoints:(NSArray *)remoteEndpoints completionHandler:(void *)completionHandler
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v8 = datagrams;
  id v9 = remoteEndpoints;
  id v10 = completionHandler;
  uint64_t v11 = -[NSArray count](v8, "count");
  v46 = v9;
  v47 = v8;
  if (v11 == -[NSArray count](v9, "count"))
  {
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id v12 = v8;
    uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v64,  v71,  16LL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v12);
          }
          if ((isa_nsdata(*(void **)(*((void *)&v64 + 1) + 8 * i)) & 1) == 0)
          {
            ne_log_obj();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
              _os_log_error_impl( &dword_1876B1000,  v37,  OS_LOG_TYPE_ERROR,  "%s: Datagrams array contains a non-NSData object",  buf,  0xCu);
            }

            if (self) {
              id Property = objc_getProperty(self, v38, 40LL, 1);
            }
            else {
              id Property = 0LL;
            }
            v40 = (dispatch_queue_s *)Property;
            v62[0] = MEMORY[0x1895F87A8];
            v62[1] = 3221225472LL;
            v62[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_14;
            v62[3] = &unk_18A090940;
            id v63 = v10;
            dispatch_async(v40, v62);

            goto LABEL_48;
          }
        }

        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v64,  v71,  16LL);
        if (v14) {
          continue;
        }
        break;
      }
    }

    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v17 = v9;
    uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v58,  v70,  16LL);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v59;
      while (2)
      {
        for (uint64_t j = 0LL; j != v19; ++j)
        {
          if (*(void *)v59 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            ne_log_obj();
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
              _os_log_error_impl( &dword_1876B1000,  v41,  OS_LOG_TYPE_ERROR,  "%s: Remote endpoints array contains a non-NWEndpoint object",  buf,  0xCu);
            }

            if (self) {
              id v43 = objc_getProperty(self, v42, 40LL, 1);
            }
            else {
              id v43 = 0LL;
            }
            v44 = (dispatch_queue_s *)v43;
            v56[0] = MEMORY[0x1895F87A8];
            v56[1] = 3221225472LL;
            v56[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_15;
            v56[3] = &unk_18A090940;
            id v57 = v10;
            dispatch_async(v44, v56);

            id v12 = v17;
            goto LABEL_48;
          }
        }

        uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v58,  v70,  16LL);
        if (v19) {
          continue;
        }
        break;
      }
    }

    if (-[NSArray count](v12, "count"))
    {
      unint64_t v23 = 0LL;
      *(void *)&__int128 v22 = 136315138LL;
      __int128 v45 = v22;
      do
      {
        v24 = -[NSArray objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", v23, v45);
        v25 = -[NSArray objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", v23);
        [v25 address];
        unint64_t v26 = -[NSArray count](v12, "count") - 1;
        if (v23 >= v26)
        {
          uint64_t v51 = MEMORY[0x1895F87A8];
          uint64_t v52 = 3221225472LL;
          v53 = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_2;
          v54 = &unk_18A08B210;
          id v55 = v10;
        }

        uint64_t v27 = NEFlowWrite();
        if (v27)
        {
          uint64_t v28 = v27;
          ne_log_obj();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v45;
            v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
            _os_log_error_impl(&dword_1876B1000, v29, OS_LOG_TYPE_ERROR, "%s: Failed to write flow Data", buf, 0xCu);
          }

          if (self) {
            id v31 = objc_getProperty(self, v30, 40LL, 1);
          }
          else {
            id v31 = 0LL;
          }
          v32 = (dispatch_queue_s *)v31;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_16;
          block[3] = &unk_18A08FC28;
          id v49 = v10;
          uint64_t v50 = v28;
          dispatch_async(v32, block);
        }

        if (v23 >= v26) {

        }
        ++v23;
      }

      while (v23 < -[NSArray count](v12, "count"));
    }
  }

  else
  {
    ne_log_obj();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v73 = "-[NEAppProxyUDPFlow writeDatagrams:sentByEndpoints:completionHandler:]";
      __int16 v74 = 2048;
      uint64_t v75 = -[NSArray count](v8, "count");
      __int16 v76 = 2048;
      uint64_t v77 = -[NSArray count](v9, "count");
      _os_log_error_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_ERROR,  "%s: Size of datagrams array (%lu) does not match size of remoteEndpoints array (%lu)",  buf,  0x20u);
    }

    if (self) {
      id v35 = objc_getProperty(self, v34, 40LL, 1);
    }
    else {
      id v35 = 0LL;
    }
    v36 = (dispatch_queue_s *)v35;
    v68[0] = MEMORY[0x1895F87A8];
    v68[1] = 3221225472LL;
    v68[2] = __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke;
    v68[3] = &unk_18A090940;
    id v69 = v10;
    dispatch_async(v36, v68);

    id v12 = v69;
LABEL_48:
  }
}

- (NWEndpoint)localEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = (void *)MEMORY[0x189608DF0];
    -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 endpointWithCEndpoint:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  return (NWEndpoint *)v6;
}

- (id)description
{
  id v4 = (void *)NSString;
  -[NEAppProxyFlow metaData](self, "metaData");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NEAppProxyUDPFlow localFlowEndpoint](self, "localFlowEndpoint");
    v2 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
    uint64_t port = nw_endpoint_get_port(v2);
  }

  else
  {
    uint64_t port = 0LL;
  }

  -[NEAppProxyFlow networkInterface](self, "networkInterface");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = -[NEAppProxyFlow isBound](self, "isBound");
  id v10 = &stru_18A0915E8;
  if (v9) {
    id v10 = @"(bound)";
  }
  [v4 stringWithFormat:@"UDP %@ local port %u interface %@%@", v5, port, v8, v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
  return v11;
  }
}

- (OS_nw_endpoint)localFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __70__NEAppProxyUDPFlow_writeDatagrams_sentByEndpoints_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_10( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_11( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, 4LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __74__NEAppProxyUDPFlow_writeDatagrams_sentByFlowEndpoints_completionHandler___block_invoke_13( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id v10 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:32];
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:32]; a2; a2 = *(void *)(a2 + 144))
  {
    [v10 addObject:*(void *)(a2 + 128)];
    [MEMORY[0x189608DE8] endpointWithAddress:a2];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [i addObject:v8];
  }

  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, a4);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __56__NEAppProxyUDPFlow_readDatagramsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0LL, 0LL, v2);
}

void __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  id v13 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:32];
  for (uint64_t i = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:32]; a2; a2 = *(void *)(a2 + 144))
  {
    [v13 addObject:*(void *)(a2 + 128)];
    nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)a2);
    [i addObject:address];
  }

  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, a4);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = (void *)[v13 copy];
  id v12 = (void *)[i copy];
  (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v11, v12, v9);
}

void __72__NEAppProxyUDPFlow_readDatagramsAndFlowEndpointsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)&OBJC_CLASS___NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0LL, 0LL, v2);
}

void __61__NEAppProxyUDPFlow_openWithLocalEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  -[NEAppProxyUDPFlow resetLocalEndpoint](v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)resetLocalEndpoint
{
  if (a1)
  {
    id v4 = (id)NEFlowCopyProperty();
    if (isa_nsdata(v4))
    {
      nw_endpoint_t address = nw_endpoint_create_address((const sockaddr *)[v4 bytes]);
      uint64_t v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = address;
    }
  }

void __65__NEAppProxyUDPFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  -[NEAppProxyUDPFlow resetLocalEndpoint](v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

@end