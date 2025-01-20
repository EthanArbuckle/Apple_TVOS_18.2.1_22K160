@interface NWURLSessionMultipartParser
- (void)task:(void *)a3 handleMultipartData:(int)a4 complete:(void *)a5 error:(void *)a6 completionHandler:;
@end

@implementation NWURLSessionMultipartParser

- (void).cxx_destruct
{
}

- (void)task:(void *)a3 handleMultipartData:(int)a4 complete:(void *)a5 error:(void *)a6 completionHandler:
{
  id v11 = a2;
  v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!a1) {
    goto LABEL_34;
  }
  v15 = *(dispatch_data_s **)(a1 + 40);
  if (v15)
  {
    size_t size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 40));
    BOOL v16 = v12 != 0LL;
    if (!v12) {
      goto LABEL_10;
    }
    v17 = v15;
    dispatch_data_t concat = dispatch_data_create_concat(v17, v12);
    v19 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = concat;
  }

  else
  {
    size_t size = 0LL;
    size_t v48 = 0LL;
    BOOL v16 = v12 != 0LL;
    if (!v12) {
      goto LABEL_12;
    }
    v20 = v12;
    v17 = *(dispatch_data_s **)(a1 + 40);
    *(void *)(a1 + 40) = v20;
  }

  v15 = *(dispatch_data_s **)(a1 + 40);
  if (v15)
  {
LABEL_10:
    size_t v48 = dispatch_data_get_size(v15);
    goto LABEL_12;
  }

  size_t v48 = 0LL;
LABEL_12:
  id v49 = v14;
  uint64_t v82 = 0LL;
  v83 = &v82;
  uint64_t v84 = 0x2020000000LL;
  uint64_t v85 = 0LL;
  dispatch_group_t v21 = dispatch_group_create();
  v80[0] = 0LL;
  v80[1] = v80;
  v80[2] = 0x3032000000LL;
  v80[3] = __Block_byref_object_copy__47790;
  v80[4] = __Block_byref_object_dispose__47791;
  id v46 = v13;
  id v81 = v13;
  uint64_t v22 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke;
  aBlock[3] = &unk_189BBF458;
  v23 = v21;
  v76 = v23;
  uint64_t v77 = a1;
  id v47 = v11;
  id v24 = v11;
  id v78 = v24;
  v79 = v80;
  v25 = _Block_copy(aBlock);
  uint64_t v69 = 0LL;
  v70 = (id *)&v69;
  uint64_t v71 = 0x3042000000LL;
  v72 = __Block_byref_object_copy__53;
  v73 = __Block_byref_object_dispose__54;
  id v74 = 0LL;
  v62[0] = v22;
  v62[1] = 3221225472LL;
  v62[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_55;
  v62[3] = &unk_189BBF4D0;
  v66 = &v69;
  v67 = v80;
  v62[4] = a1;
  char v68 = a4;
  v26 = v23;
  v63 = v26;
  id v64 = v24;
  id v27 = v25;
  id v65 = v27;
  v28 = (void (**)(void))_Block_copy(v62);
  v58[0] = v22;
  v58[1] = 3221225472LL;
  v58[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_63;
  v58[3] = &unk_189BBF520;
  v58[4] = a1;
  v61 = v80;
  id v29 = v27;
  id v60 = v29;
  v30 = v12;
  v59 = v30;
  v31 = _Block_copy(v58);
  v32 = (void (**)(void, void, void))v31;
  if (v16)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_67;
    applier[3] = &unk_189BBF548;
    size_t v57 = size;
    applier[4] = a1;
    v55 = &v82;
    id v54 = v31;
    v56 = v80;
    dispatch_data_apply(v30, applier);
  }

  if (!a4) {
    goto LABEL_31;
  }
  int v33 = *(_DWORD *)(a1 + 12);
  if (!v33)
  {
    dispatch_data_t subrange = dispatch_data_create_subrange(*(dispatch_data_t *)(a1 + 40), v83[3], v48 - v83[3]);
    if (!*(_BYTE *)(a1 + 8)) {
      ((void (**)(void, dispatch_data_t, void))v32)[2](v32, subrange, 0LL);
    }
    v83[3] = v48;
    *(_DWORD *)(a1 + 12) = 3;

    goto LABEL_31;
  }

  if (v33 == 1)
  {
    uint64_t v34 = *(void *)(a1 + 72);
    if (v34) {
      uint64_t v34 = *(void *)(v34 + 32);
    }
    dispatch_data_t v35 = dispatch_data_create_subrange( *(dispatch_data_t *)(a1 + 40),  v83[3],  v48 - (*(void *)(a1 + 96) + v34) - v83[3]);
    if (*(_BYTE *)(a1 + 8))
    {
      v83[3] = v48;
    }

    else
    {
      ((void (**)(void, dispatch_data_t, void))v32)[2](v32, v35, 0LL);
      int v37 = *(unsigned __int8 *)(a1 + 8);
      v83[3] = v48;
      if (!v37)
      {
LABEL_27:
        uint64_t v38 = *(void *)(a1 + 56);
        if (v38)
        {
          *(void *)(v38 + 40) = 0LL;
          *(void *)(v38 + 48) = 0LL;
        }

        *(_DWORD *)(a1 + 12) = 3;

LABEL_30:
        v32[2](v32, MEMORY[0x1895F8AA8], 0LL);
        *(_DWORD *)(a1 + 12) = 3;
        goto LABEL_31;
      }
    }

    *(_BYTE *)(a1 + 8) = 0;
    goto LABEL_27;
  }

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v7 = a2;
  id v8 = a4;
  if (!gLogDatapath)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v7 = 0LL;
    if (!v8 && !(_DWORD)a3) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

  __nwlog_obj();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl( &dword_181A5C000,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}s Delivering data %@, complete %{BOOL}d, error %@",  buf,  0x26u);
  }

  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  if (!dispatch_data_get_size(v7))
  {

    goto LABEL_5;
  }

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_55( uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL));
  if (!WeakRetained)
  {
    _os_crash();
    __break(1u);
  }

  v3 = WeakRetained;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[6];
  }
  v5 = v4;
  [v5 firstObject];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (gLogDatapath)
    {
      __nwlog_obj();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.receiver) = 136446210;
        *(id *)((char *)&buf.receiver + 4) = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:compl"
                                             "etionHandler:]_block_invoke_2";
        _os_log_impl( &dword_181A5C000,  v15,  OS_LOG_TYPE_DEBUG,  "%{public}s Delivering multipart response, waiting for disposition",  (uint8_t *)&buf,  0xCu);
      }
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(void **)(v7 + 32);
    }
    else {
      id v8 = 0LL;
    }
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = v6[1];
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_59;
    v26[3] = &unk_189BBF4A8;
    v26[4] = v7;
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)(a1 + 72);
    id v27 = v11;
    uint64_t v31 = v12;
    id v29 = *(id *)(a1 + 56);
    id v28 = *(id *)(a1 + 40);
    id v30 = v3;
    id v13 = v8;
    [v13 task:v9 deliverResponse:v10 completionHandler:v26];

    id v14 = v27;
LABEL_9:

    goto LABEL_12;
  }

  if (!gLogDatapath)
  {
    if (!*(_BYTE *)(a1 + 80)) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }

  __nwlog_obj();
  BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.receiver) = 136446210;
    *(id *)((char *)&buf.receiver + 4) = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completio"
                                         "nHandler:]_block_invoke";
    _os_log_impl( &dword_181A5C000,  v16,  OS_LOG_TYPE_DEBUG,  "%{public}s Delivered all parts, returning",  (uint8_t *)&buf,  0xCu);
  }

  if (*(_BYTE *)(a1 + 80))
  {
LABEL_19:
    uint64_t v17 = *(void *)(a1 + 32);
    if ((!v17 || *(_DWORD *)(v17 + 12) != 3) && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL))
    {
      __int16 v22 = objc_alloc(&OBJC_CLASS___NWURLError);
      if (v22)
      {
        uint64_t v23 = *MEMORY[0x189607740];
        buf.receiver = v22;
        buf.super_class = (Class)&OBJC_CLASS___NWURLError;
        __int16 v22 = (NWURLError *)objc_msgSendSuper2(&buf, sel_initWithDomain_code_userInfo_, v23, -1017, 0);
      }

      uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8LL);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v22;
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      v19 = *(void **)(v18 + 32);
    }
    else {
      v19 = 0LL;
    }
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_58;
    v32[3] = &unk_189BBF480;
    uint64_t v21 = *(void *)(a1 + 48);
    id v33 = *(id *)(a1 + 40);
    [v19 task:v21 deliverData:0 complete:1 error:v20 completionHandler:v32];
    id v14 = v33;
    goto LABEL_9;
  }

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_63( void *a1,  void *a2,  BOOL a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  v5 = a2;
  v6 = v5;
  if (!a3) {
    goto LABEL_5;
  }
  uint64_t v7 = a1[4];
  if (!v7) {
    goto LABEL_5;
  }
  if (!*(_BYTE *)(v7 + 9))
  {
    *(_BYTE *)(v7 + 9) = 1;
LABEL_5:
    size_t size = dispatch_data_get_size(v5);
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    char v38 = 0;
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x2020000000LL;
    char v34 = 0;
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2;
    applier[3] = &unk_189BBF4F8;
    void applier[5] = &v31;
    applier[6] = size;
    applier[4] = &v35;
    dispatch_data_apply(v6, applier);
    int v9 = *((unsigned __int8 *)v36 + 24);
    if (v9 == 13) {
      goto LABEL_9;
    }
    if (v9 != 10) {
      goto LABEL_11;
    }
    if (*((_BYTE *)v32 + 24) != 13) {
LABEL_9:
    }
      uint64_t v10 = -1LL;
    else {
      uint64_t v10 = -2LL;
    }
    dispatch_data_t subrange = dispatch_data_create_subrange(v6, 0LL, v10 + size);

    v6 = subrange;
LABEL_11:
    uint64_t v12 = a1[4];
    if (!v12) {
      goto LABEL_15;
    }
    int v13 = *(_DWORD *)(v12 + 16);
    if (v13 == 1)
    {
      (*(void (**)(void))(a1[6] + 16LL))();
    }

    else
    {
      if (!v13)
      {
        uint64_t v12 = *(void *)(v12 + 48);
LABEL_15:
        id v14 = (id)v12;
        [v14 lastObject];
        uint64_t v15 = (id *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          BOOL v16 = objc_alloc(&OBJC_CLASS___NWURLSessionMultipartContent);
          uint64_t v17 = v6;
          if (v16)
          {
            *(void *)v39 = v16;
            *(void *)&v39[8] = &OBJC_CLASS___NWURLSessionMultipartContent;
            uint64_t v18 = (NWURLSessionMultipartContent *)objc_msgSendSuper2((objc_super *)v39, sel_init);
            BOOL v16 = v18;
            if (v18)
            {
              objc_storeStrong((id *)&v18->_data, v6);
              v16->_BOOL complete = a3;
              objc_storeStrong((id *)&v16->_error, 0LL);
            }
          }

          id v19 = v15[2];
          [v19 addObject:v16];

          if (gLogDatapath)
          {
            __nwlog_obj();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              if (v16)
              {
                id v27 = v16->_data;
                BOOL complete = v16->_complete;
                error = v16->_error;
              }

              else
              {
                BOOL complete = 0;
                id v27 = 0LL;
                error = 0LL;
              }

              *(_DWORD *)v39 = 136446978;
              *(void *)&v39[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandl"
                                   "er:]_block_invoke";
              *(_WORD *)&v39[12] = 2112;
              *(void *)&v39[14] = v27;
              __int16 v40 = 1024;
              BOOL v41 = complete;
              __int16 v42 = 2112;
              v43 = error;
              _os_log_impl( &dword_181A5C000,  v26,  OS_LOG_TYPE_DEBUG,  "%{public}s Created NWURLSessionMultipartContent, body %@, complete %{BOOL}d, error %@",  v39,  0x26u);
            }
          }
        }

        else
        {
          if (!*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
          {
            uint64_t v21 = objc_alloc(&OBJC_CLASS___NWURLError);
            if (v21)
            {
              uint64_t v22 = *MEMORY[0x189607740];
              *(void *)v39 = v21;
              *(void *)&v39[8] = &OBJC_CLASS___NWURLError;
              uint64_t v21 = (NWURLError *)objc_msgSendSuper2( (objc_super *)v39,  sel_initWithDomain_code_userInfo_,  v22,  -1017,  0);
            }

            uint64_t v23 = *(void *)(a1[7] + 8LL);
            uint64_t v24 = *(void **)(v23 + 40);
            *(void *)(v23 + 40) = v21;
          }

          uint64_t v25 = a1[4];
          uint64_t v15 = 0LL;
          if (v25) {
            *(_DWORD *)(v25 + 12) = 3;
          }
        }

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_67( void *a1,  void *a2,  uint64_t a3,  uint64_t a4,  unint64_t a5)
{
  uint64_t v159 = *MEMORY[0x1895F89C0];
  id v146 = a2;
  if (a5)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = a3 + 1;
    uint64_t v144 = *MEMORY[0x189607740];
    unint64_t v145 = a5;
    uint64_t v147 = a4;
    uint64_t v148 = a3 + 1;
    while (1)
    {
      uint64_t v12 = a1[4];
      if (!v12) {
        goto LABEL_3;
      }
      int v13 = *(_DWORD *)(v12 + 12);
      if (v13 == 2)
      {
        uint64_t v43 = *(void *)(v12 + 64);
        if (v43)
        {
          char v44 = *(_BYTE *)(a4 + v9);
          *(_BYTE *)(v43 + 8) = *(_BYTE *)(v43 + 9);
          *(_BYTE *)(v43 + 9) = v44;
          uint64_t v12 = a1[4];
          if (!v12) {
            goto LABEL_5;
          }
        }

        v45 = (unsigned __int8 *)*(id *)(v12 + 64);
        if (!v45) {
          goto LABEL_5;
        }
        int v46 = v45[9];

        if (v46 != 10) {
          goto LABEL_5;
        }
        uint64_t v47 = a1[4];
        if (v47 && (size_t v48 = *(id *)(v47 + 64)) != 0LL)
        {
          if (v48[8] == 13) {
            uint64_t v49 = 2LL;
          }
          else {
            uint64_t v49 = 1LL;
          }
        }

        else
        {
          uint64_t v49 = 0LL;
        }

        size_t v50 = *(void *)(*(void *)(a1[6] + 8LL) + 24LL);
        uint64_t v51 = a1[4];
        unint64_t v52 = a5;
        if (v51) {
          v53 = *(dispatch_data_s **)(v51 + 40);
        }
        else {
          v53 = 0LL;
        }
        uint64_t v149 = v10 + v9;
        uint64_t v54 = v10 + v9 + a1[8];
        size_t v55 = v50 + v49;
        dispatch_data_t subrange = dispatch_data_create_subrange(v53, v50, v54 - v55);
        size_t v57 = (void *)[objc_alloc(NSString) initWithData:subrange encoding:5];
        v58 = v57;
        if (v54 == v55)
        {
          uint64_t v59 = a1[4];
          if (v59) {
            id v60 = *(void **)(v59 + 32);
          }
          else {
            id v60 = 0LL;
          }
          objc_msgSend(v60, "response", v142, v143);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          [v61 allHeaderFields];
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)[v62 mutableCopy];

          uint64_t v64 = a1[4];
          if (v64) {
            uint64_t v65 = *(void *)(v64 + 80);
          }
          else {
            uint64_t v65 = 0LL;
          }
          [v63 addEntriesFromDictionary:v65];
          id v66 = objc_alloc(MEMORY[0x189601EA0]);
          [v61 URL];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          char v68 = (void *)objc_msgSend( v66,  "initWithURL:statusCode:HTTPVersion:headerFields:",  v67,  objc_msgSend(v61, "statusCode"),  0,  v63);

          uint64_t v69 = a1[4];
          if (v69) {
            v70 = *(void **)(v69 + 80);
          }
          else {
            v70 = 0LL;
          }
          [v70 removeAllObjects];
          uint64_t v71 = objc_alloc(&OBJC_CLASS___NWURLSessionMultipartPart);
          id v72 = v68;
          if (v71)
          {
            *(void *)v152 = v71;
            *(void *)&v152[8] = &OBJC_CLASS___NWURLSessionMultipartPart;
            v73 = (NWURLSessionMultipartPart *)objc_msgSendSuper2((objc_super *)v152, sel_init);
            uint64_t v71 = v73;
            if (v73)
            {
              objc_storeStrong((id *)&v73->_response, v68);
              id v74 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
              data = v71->_data;
              v71->_data = v74;
            }
          }

          unint64_t v52 = v145;

          uint64_t v76 = a1[4];
          if (v76) {
            uint64_t v77 = *(void **)(v76 + 48);
          }
          else {
            uint64_t v77 = 0LL;
          }
          [v77 addObject:v71];
          uint64_t v78 = a1[4];
          if (v78)
          {
            *(_DWORD *)(v78 + 12) = 0;
            uint64_t v79 = a1[4];
            if (v79) {
              *(_DWORD *)(v79 + 16) = 0;
            }
          }

          a4 = v147;
LABEL_94:
          a5 = v52;
        }

        else
        {
          uint64_t v90 = [v57 rangeOfString:@":"];
          if (v90 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v99 = v90;
            [v58 substringToIndex:v90];
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189607810] whitespaceCharacterSet];
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            [v100 stringByTrimmingCharactersInSet:v101];
            v102 = (void *)objc_claimAutoreleasedReturnValue();

            [v58 substringFromIndex:v99 + 1];
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x189607810] whitespaceCharacterSet];
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            [v103 stringByTrimmingCharactersInSet:v104];
            v105 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v106 = a1[4];
            if (v106) {
              v107 = *(void **)(v106 + 80);
            }
            else {
              v107 = 0LL;
            }
            a4 = v147;
            objc_msgSend(v107, "setObject:forKeyedSubscript:", v105, v102, v142, v143);

            goto LABEL_94;
          }

          a5 = v52;
          if (!*(void *)(*(void *)(a1[7] + 8LL) + 40LL))
          {
            v91 = objc_alloc(&OBJC_CLASS___NWURLError);
            if (v91)
            {
              *(void *)v152 = v91;
              *(void *)&v152[8] = &OBJC_CLASS___NWURLError;
              v91 = (NWURLError *)objc_msgSendSuper2( (objc_super *)v152,  sel_initWithDomain_code_userInfo_,  v144,  -1017,  0);
            }

            uint64_t v92 = *(void *)(a1[7] + 8LL);
            v93 = *(void **)(v92 + 40);
            *(void *)(v92 + 40) = v91;
          }

          uint64_t v94 = a1[4];
          if (v94) {
            *(_DWORD *)(v94 + 12) = 3;
          }
        }

        *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = v149 + a1[8];

        uint64_t v10 = v148;
        goto LABEL_5;
      }

      if (v13 != 1)
      {
        if (v13) {
          goto LABEL_5;
        }
        id v14 = *(id *)(v12 + 56);
        if (v14)
        {
          char v15 = *(_BYTE *)(a4 + v9);
          uint64_t v16 = v14[6];
          unint64_t v17 = v14[4];
          unint64_t v18 = (v16 + 1) % v17;
          if (v18 == v14[5])
          {
            if (v18 + 1 == v17) {
              unint64_t v19 = 0LL;
            }
            else {
              unint64_t v19 = v18 + 1;
            }
            v14[5] = v19;
          }

          *(_BYTE *)(v14[3] + v16) = v15;
          v14[6] = (unint64_t)(v14[6] + 1LL) % v14[4];
        }

        uint64_t v20 = a1[4];
        if (v20)
        {
          uint64_t v11 = *(id *)(v20 + 56);
          if (v11)
          {
            unint64_t v21 = v11[4];
            unint64_t v22 = (v11[6] + 1LL) % v21;
            if (v22 == v11[5])
            {
              uint64_t v23 = v11[2];
              if (!v23)
              {
LABEL_24:

                uint64_t v27 = a1[4];
                if (v27)
                {
                  id v28 = *(id *)(v27 + 56);
                  if (v28)
                  {
                    v28[5] = 0LL;
                    v28[6] = 0LL;
                  }

                  uint64_t v29 = a1[4];
                  if (v29)
                  {
                    id v30 = *(id *)(v29 + 72);
                    if (v30)
                    {
                      v30[4] = 0LL;
                      v30[2] = 0LL;
                      *((_BYTE *)v30 + 8) = 0;
                      *((_DWORD *)v30 + 3) = 4;
                    }
                  }
                }

                uint64_t v31 = a1[4];
                if (v31) {
                  *(_DWORD *)(v31 + 12) = 1;
                }
                goto LABEL_5;
              }

              uint64_t v24 = 0LL;
              uint64_t v25 = (char *)v11[1];
              while (1)
              {
                int v26 = *v25++;
                ++v24;
                if (!--v23) {
                  goto LABEL_24;
                }
              }
            }
          }
        }

        else
        {
LABEL_3:
          uint64_t v11 = 0LL;
        }

        goto LABEL_5;
      }

      uint64_t v32 = *(void *)(v12 + 72);
      if (!v32) {
        goto LABEL_117;
      }
      if (*(_DWORD *)(v32 + 12) != 4 || (unint64_t v33 = *(void *)(v32 + 32), v33 >= 2))
      {
        _os_crash();
        __break(1u);
      }

      *(_BYTE *)(*(void *)(v32 + 24) + v33) = *(_BYTE *)(a4 + v9);
      uint64_t v34 = *(void *)(v32 + 32);
      BOOL v35 = __CFADD__(v34, 1LL);
      uint64_t v36 = v34 + 1;
      uint64_t v37 = v35;
      uint64_t v38 = v37 << 63 >> 63;
      *(void *)(v32 + 32) = v36;
      if (v38 != v37 || v38 < 0) {
        break;
      }
      if (v36 == 1)
      {
        unsigned int v39 = **(unsigned __int8 **)(v32 + 24);
        BOOL v40 = v39 > 0x2D;
        uint64_t v41 = (1LL << v39) & 0x200000002400LL;
        if (!v40 && v41 != 0) {
          goto LABEL_117;
        }
LABEL_119:
        *(_DWORD *)(v32 + 12) = 2;
        *(void *)(v32 + 16) = 0LL;
        goto LABEL_120;
      }

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2_74( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (os_log_s *)(id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v5 = 136446466;
    v6 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke_2";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_181A5C000, v2, OS_LOG_TYPE_INFO, "%{public}s Completing with error %@", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_2( void *a1,  uint64_t a2,  unint64_t a3,  uint64_t a4,  uint64_t a5)
{
  unint64_t v5 = a1[6];
  if (v5)
  {
    unint64_t v6 = a5 + a3;
    BOOL v7 = v5 - 1 < a3 || v5 - 1 >= v6;
    if (!v7)
    {
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = *(_BYTE *)(a4 + v5 - 1 - a3);
      unint64_t v5 = a1[6];
    }

    BOOL v7 = v5 >= 2;
    unint64_t v8 = v5 - 2;
    if (v7 && v8 >= a3 && v8 < v6) {
      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = *(_BYTE *)(a4 + v8 - a3);
    }
  }

  return 1LL;
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_58( uint64_t a1)
{
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_59( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (gLogDatapath)
  {
    __nwlog_obj();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v37 = 136446466;
      *(void *)&v37[4] = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
      *(_WORD *)&v37[12] = 2048;
      *(void *)&v37[14] = a2;
      _os_log_impl(&dword_181A5C000, v31, OS_LOG_TYPE_DEBUG, "%{public}s Received disposition %ld", v37, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
LABEL_3:
      unint64_t v8 = *(void **)(v7 + 48);
      goto LABEL_4;
    }
  }

  unint64_t v8 = 0LL;
LABEL_4:
  [v8 removeObject:*(void *)(a1 + 40)];
  if (!a2)
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___NWURLError);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x189607740];
      *(void *)uint64_t v37 = v10;
      *(void *)&v37[8] = &OBJC_CLASS___NWURLError;
      uint64_t v10 = (NWURLError *)objc_msgSendSuper2((objc_super *)v37, sel_initWithDomain_code_userInfo_, v11, -999, 0);
    }

    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8LL);
    int v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v10;
    int v9 = 2;
    goto LABEL_27;
  }

  if (a2 == 1)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8LL);
    uint64_t v16 = *(void *)(v14 + 40);
    char v15 = (id *)(v14 + 40);
    if (!v16) {
      objc_storeStrong(v15, a3);
    }
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    unint64_t v17 = *(void **)(a1 + 40);
    if (v17) {
      unint64_t v17 = (void *)v17[2];
    }
    int v13 = v17;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v21 = 0LL;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * v21);
          uint64_t v23 = *(void *)(a1 + 56);
          if (v22)
          {
            id v24 = *(id *)(v22 + 16);
            BOOL v25 = *(_BYTE *)(v22 + 8) != 0;
            uint64_t v26 = *(void *)(v22 + 24);
          }

          else
          {
            BOOL v25 = 0LL;
            id v24 = 0LL;
            uint64_t v26 = 0LL;
          }

          (*(void (**)(uint64_t, id, BOOL, uint64_t))(v23 + 16))(v23, v24, v25, v26);

          ++v21;
        }

        while (v19 != v21);
        uint64_t v19 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v19);
    }

    int v9 = 1;
LABEL_27:

    goto LABEL_28;
  }

  if ((unint64_t)(a2 - 2) < 2)
  {
    _os_crash();
    __break(1u);
    return;
  }

  int v9 = 2;
LABEL_28:
  uint64_t v27 = *(void *)(a1 + 32);
  if (v27)
  {
    if (![*(id *)(v27 + 48) count]) {
      goto LABEL_30;
    }
  }

  else if (![0 count])
  {
LABEL_30:
    uint64_t v28 = *(void *)(a1 + 32);
    if (v28) {
      *(_DWORD *)(v28 + 16) = v9;
    }
  }

  id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v30 = *(void *)(a1 + 40);
  if (v30) {
    objc_storeStrong((id *)(v30 + 16), v29);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))(*(void *)(a1 + 64));
}

void __89__NWURLSessionMultipartParser_task_handleMultipartData_complete_error_completionHandler___block_invoke_50( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (gLogDatapath)
  {
    __nwlog_obj();
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136446466;
      uint64_t v10 = "-[NWURLSessionMultipartParser task:handleMultipartData:complete:error:completionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl( &dword_181A5C000,  v8,  OS_LOG_TYPE_DEBUG,  "%{public}s Delivered data, error %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7) {
    objc_storeStrong(v6, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end