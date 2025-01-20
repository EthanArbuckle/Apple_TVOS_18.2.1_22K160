@interface OSAExclaveContainer
- (BOOL)isExclaveValid;
- (NSMutableArray)notes;
- (NSMutableDictionary)addressSpaces;
- (NSMutableDictionary)layouts;
- (NSMutableDictionary)threadIdToScId;
- (NSMutableDictionary)threads;
- (OSAExclaveContainer)init;
- (id)getFramesForThread:(id)a3 usingCatalog:(id)a4;
- (kcdata_iter)parseKCdata:(kcdata_iter)a3;
- (void)appendNotesTo:(id)a3;
- (void)setIsExclaveValid:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setThreadId:(id)a3 withScId:(id)a4;
@end

@implementation OSAExclaveContainer

- (OSAExclaveContainer)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OSAExclaveContainer;
  v2 = -[OSAExclaveContainer init](&v14, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    addressSpaces = v2->_addressSpaces;
    v2->_addressSpaces = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    layouts = v2->_layouts;
    v2->_layouts = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    threads = v2->_threads;
    v2->_threads = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    threadIdToScId = v2->_threadIdToScId;
    v2->_threadIdToScId = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v11;

    v2->_isExclaveValid = 1;
  }

  return v2;
}

- (void)setThreadId:(id)a3 withScId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[OSAExclaveContainer threadIdToScId](self, "threadIdToScId");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (id)getFramesForThread:(id)a3 usingCatalog:(id)a4
{
  *(void *)&v54[5] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (-[OSAExclaveContainer isExclaveValid](self, "isExclaveValid"))
  {
    -[OSAExclaveContainer threadIdToScId](self, "threadIdToScId");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v6];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[OSAExclaveContainer threads](self, "threads");
      [v10 objectForKeyedSubscript:v9];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v48 = v9;
        id v49 = v6;
        [MEMORY[0x189603FA8] array];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stackEntries];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 count];

        if (v14)
        {
          uint64_t v15 = 0LL;
          v50 = self;
          v51 = v11;
          while (1)
          {
            [v11 stackEntries];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 stackEntries];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v17, "count") + ~v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[OSAExclaveContainer addressSpaces](self, "addressSpaces");
            [v18 addressSpaceId];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 objectForKeyedSubscript:v20];
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21) {
              break;
            }
            v22 = -[OSAExclaveContainer layouts](self, "layouts");
            [v21 layoutId];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 objectForKeyedSubscript:v23];
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
            {
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.4(v53, v21, v54);
              }

              goto LABEL_25;
            }

            uint64_t v52 = v15;
            [v18 frames];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = [v25 count];

            if (v26)
            {
              unint64_t v27 = 0LL;
              do
              {
                [v18 frames];
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                [v28 objectAtIndexedSubscript:v27];
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v30 = [v29 unsignedLongLongValue];
                [v24 segments];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                [v7 searchFrame:v30 in:v31 result:0];
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                [v12 addObject:v32];

                ++v27;
                [v18 frames];
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                unint64_t v34 = [v33 count];
              }

              while (v34 > v27);
            }

            uint64_t v11 = v51;
            uint64_t v15 = v52 + 1;
            [v51 stackEntries];
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v36 = [v35 count];

            self = v50;
            if (v36 <= v52 + 1) {
              goto LABEL_12;
            }
          }

          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.3(v18);
          }
LABEL_25:

          id v37 = 0LL;
        }

        else
        {
LABEL_12:
          id v37 = v12;
        }

        uint64_t v9 = v48;
        id v6 = v49;
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.2((uint64_t)v9, v40, v41, v42, v43, v44, v45, v46);
        }
        id v37 = 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.1(v6);
      }
      id v37 = 0LL;
    }
  }

  else
  {
    v38 = -[OSAExclaveContainer notes](self, "notes");
    objc_msgSend( NSString,  "stringWithFormat:",  @"Omitted invalid exclave data for thread %llu",  objc_msgSend(v6, "unsignedLongLongValue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 addObject:v39];

    id v37 = 0LL;
  }

  return v37;
}

- (kcdata_iter)parseKCdata:(kcdata_iter)a3
{
  end = (kcdata_item *)a3.end;
  kcdata_item_t item = a3.item;
  [MEMORY[0x189603FA8] array];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  kcdata_item_t v7 = item + 1;
  kcdata_item_t v8 = item;
  v57 = item;
  if (&item[1] <= end)
  {
    kcdata_item_t v8 = item;
    do
    {
      unint64_t v9 = (unint64_t)v7 + v8->size;
      if (v8->type == -242132755) {
        goto LABEL_13;
      }
      if (v8->type == 19 && v8[1].type == 2377) {
        break;
      }
      kcdata_item_t v7 = (kcdata_item_t)(v9 + 16);
      kcdata_item_t v8 = (kcdata_item_t)v9;
    }

    while (v9 + 16 <= (unint64_t)end);
  }

  v56 = self;
  unint64_t v10 = (unint64_t)&v8[1];
  if (v8->type != -242132755 && v10 <= (unint64_t)end)
  {
    LOBYTE(flags) = 0;
    unint64_t v15 = 0x189607000uLL;
    do
    {
      LOBYTE(flags) = 0;
      int type = v8->type;
      if ((v8->type & 0xFFFFFFF0) == 0x20) {
        int type = 17;
      }
      if (type > 2378)
      {
        switch(type)
        {
          case 2379:
            [v6 top];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 data];
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 objectForKeyedSubscript:&unk_189E30B18];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            [*(id *)(v15 + 2408) numberWithUnsignedLongLong:*(void *)&v8[1].type];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setSchedulingContextId:](v20, "setSchedulingContextId:", v21);
            goto LABEL_71;
          case 2381:
            [v6 top];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 data];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 objectForKeyedSubscript:&unk_189E30B60];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            [*(id *)(v15 + 2408) numberWithUnsignedLongLong:*(void *)&v8[1].type];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setAddressSpaceId:](v20, "setAddressSpaceId:", v21);
            goto LABEL_71;
          case 2384:
            [v6 top];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 data];
            unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 objectForKeyedSubscript:&unk_189E30B30];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            [*(id *)(v15 + 2408) numberWithUnsignedLongLong:*(void *)&v8[1].type];
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setAddressSpaceId:](v20, "setAddressSpaceId:", v28);

            v29 = *(void **)(v15 + 2408);
            uint64_t v30 = *(void *)&v8[2].type;
            goto LABEL_41;
          case 2385:
            [v6 top];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 data];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            [v32 objectForKeyedSubscript:&unk_189E30B30];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            [NSString stringWithUTF8String:&v8[1]];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setName:](v20, "setName:", v21);
            goto LABEL_71;
          case 2387:
            [v6 top];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 data];
            unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
            [v34 objectForKeyedSubscript:&unk_189E30B48];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            v29 = *(void **)(v15 + 2408);
            uint64_t v30 = *(void *)&v8[1].type;
LABEL_41:
            objc_msgSend(v29, "numberWithUnsignedLongLong:", v30, v56);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[ExclaveThread setLayoutId:](v20, "setLayoutId:", v21);
            goto LABEL_71;
          default:
            goto LABEL_75;
        }
      }

      switch(type)
      {
        case 17:
          uint64_t flags = v8->flags;
          if ([v6 count])
          {
            [v6 top];
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v18 = 0LL;
          }

          if (HIDWORD(flags) == 2388)
          {
            [v18 data];
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
            [v46 objectForKeyedSubscript:&unk_189E30B48];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            if ((_DWORD)flags)
            {
              kcdata_item_t v47 = v8 + 1;
              uint64_t flags = flags;
              do
              {
                v48 = -[ExclaveThread segments](v20, "segments", v56);
                [v48 addImage:v47 address:*(void *)&v47[1].type size:0];

                kcdata_item_t v47 = (kcdata_item_t)((char *)v47 + 24);
                --flags;
              }

              while (flags);
            }
            v21 = -[ExclaveThread segments](v20, "segments", v56);
            [v21 sortByAddressAndSetInferredSizes];
            LOBYTE(flags) = 0;
            goto LABEL_72;
          }

          if (HIDWORD(flags) == 2382)
          {
            [v18 data];
            uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
            [v42 objectForKeyedSubscript:&unk_189E30B60];
            v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();

            if ((_DWORD)flags)
            {
              uint64_t v43 = v8 + 1;
              uint64_t flags = flags;
              do
              {
                uint64_t v44 = *(void *)&v43->type;
                uint64_t v43 = (kcdata_item *)((char *)v43 + 8);
                objc_msgSend(*(id *)(v15 + 2408), "numberWithUnsignedLongLong:", v44, v56);
                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[ExclaveThread addFrames:](v20, "addFrames:", v45);

                --flags;
              }

              while (flags);
            }

            goto LABEL_73;
          }

          LOBYTE(flags) = 0;
          break;
        case 19:
          v35 = -[KCContainer initWithKCData:](objc_alloc(&OBJC_CLASS___KCContainer), "initWithKCData:", v8, end);
          [v6 push:v35];

          LOBYTE(flags) = 0;
          switch(v8[1].type)
          {
            case 0x94Au:
              [v6 top];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(&OBJC_CLASS___ExclaveThread);
              [v18 data];
              unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              id v37 = v20;
              v38 = &unk_189E30B18;
              goto LABEL_70;
            case 0x94Cu:
              [v6 top];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(&OBJC_CLASS___ExclaveStackEntry);
              [v18 data];
              unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              id v37 = v20;
              v38 = &unk_189E30B60;
              goto LABEL_70;
            case 0x94Fu:
              [v6 top];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(&OBJC_CLASS___ExclaveAddressSpace);
              [v18 data];
              unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              id v37 = v20;
              v38 = &unk_189E30B30;
              goto LABEL_70;
            case 0x952u:
              [v6 top];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_alloc_init(&OBJC_CLASS___ExclaveLayout);
              [v18 data];
              unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v36;
              id v37 = v20;
              v38 = &unk_189E30B48;
LABEL_70:
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v38, v56);
LABEL_71:
              LOBYTE(flags) = 0;
              goto LABEL_72;
            default:
              goto LABEL_75;
          }

        case 20:
          [v6 pop];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = v8->flags;
          if (v22 != [v18 tag]) {
            -[OSAExclaveContainer parseKCdata:].cold.1();
          }
          int v23 = [v18 type];
          LOBYTE(flags) = v23 == 2377;
          if (v23 != 2377)
          {
            if ([v18 type] == 2380)
            {
              [v6 top];
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();
              [v18 data];
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              [v39 objectForKeyedSubscript:&unk_189E30B60];
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[ExclaveThread data](v20, "data");
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
              [v40 objectForKeyedSubscript:&unk_189E30B18];
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

              [v41 addStackEntries:v21];
              goto LABEL_84;
            }

            if ([v18 type] == 2378)
            {
              [v18 data];
              id v49 = (void *)objc_claimAutoreleasedReturnValue();
              [v49 objectForKeyedSubscript:&unk_189E30B18];
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();
              v50 = -[ExclaveThread schedulingContextId](v20, "schedulingContextId");
              if (v50)
              {
                v21 = -[OSAExclaveContainer threads](v56, "threads");
                uint64_t v51 = -[ExclaveThread schedulingContextId](v20, "schedulingContextId");
LABEL_83:
                uint64_t v41 = (void *)v51;
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v51, v56);
LABEL_84:

LABEL_72:
                unint64_t v15 = 0x189607000LL;
              }
            }

            else if ([v18 type] == 2383)
            {
              [v18 data];
              uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
              [v52 objectForKeyedSubscript:&unk_189E30B30];
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();
              v53 = -[ExclaveThread addressSpaceId](v20, "addressSpaceId");
              if (v53)
              {
                v21 = -[OSAExclaveContainer addressSpaces](v56, "addressSpaces");
                uint64_t v51 = -[ExclaveThread addressSpaceId](v20, "addressSpaceId");
                goto LABEL_83;
              }
            }

            else
            {
              [v18 data];
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              [v54 objectForKeyedSubscript:&unk_189E30B48];
              v20 = (ExclaveThread *)objc_claimAutoreleasedReturnValue();
              v55 = -[ExclaveThread layoutId](v20, "layoutId");
              if (v55)
              {
                v21 = -[OSAExclaveContainer layouts](v56, "layouts");
                uint64_t v51 = -[ExclaveThread layoutId](v20, "layoutId");
                goto LABEL_83;
              }
            }

- (void)appendNotesTo:(id)a3
{
  id v4 = a3;
  -[OSAExclaveContainer notes](self, "notes");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObjectsFromArray:v5];
}

- (NSMutableDictionary)addressSpaces
{
  return self->_addressSpaces;
}

- (NSMutableDictionary)layouts
{
  return self->_layouts;
}

- (NSMutableDictionary)threads
{
  return self->_threads;
}

- (NSMutableDictionary)threadIdToScId
{
  return self->_threadIdToScId;
}

- (NSMutableArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (BOOL)isExclaveValid
{
  return self->_isExclaveValid;
}

- (void)setIsExclaveValid:(BOOL)a3
{
  self->_isExclaveValid = a3;
}

- (void).cxx_destruct
{
}

- (void)getFramesForThread:(void *)a1 usingCatalog:.cold.1(void *a1)
{
}

- (void)getFramesForThread:(uint64_t)a3 usingCatalog:(uint64_t)a4 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getFramesForThread:(void *)a1 usingCatalog:.cold.3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1( &dword_1861AC000,  MEMORY[0x1895F8DA0],  v2,  "Address space info does exist for asid %@",  v3,  v4,  v5,  v6,  2u);
}

- (void)getFramesForThread:(void *)a3 usingCatalog:.cold.4(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl( &dword_1861AC000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Layout info does not exist for layout id %@",  a1,  0xCu);
}

- (void)parseKCdata:.cold.1()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  174,  "kcdata_iter_container_id(kcData) == end.tag");
}

- (void)parseKCdata:.cold.2()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  216,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_IPCSTACKENTRY)");
}

- (void)parseKCdata:.cold.3()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  230,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_TEXTLAYOUT)");
}

- (void)parseKCdata:.cold.4()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  248,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_SCRESULT)");
}

- (void)parseKCdata:.cold.5()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  262,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_IPCSTACKENTRY)");
}

- (void)parseKCdata:.cold.6()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  276,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_ADDRESSSPACE)");
}

- (void)parseKCdata:.cold.7()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  291,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_ADDRESSSPACE)");
}

- (void)parseKCdata:.cold.8()
{
  __assert_rtn( "-[OSAExclaveContainer parseKCdata:]",  "OSAExclave.m",  305,  "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_TEXTLAYOUT)");
}

@end