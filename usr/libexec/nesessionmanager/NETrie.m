@interface NETrie
- (BOOL)search:(const char *)a3 length:(int)a4;
- (BOOL)searchWithString:(id)a3;
- (NETrie)initWithDomains:(id)a3 prefixCount:(int)a4 reverse:(BOOL)a5 partialSearchAllowed:(BOOL)a6 partialSearchTerminator:(char)a7 extra_bytes:(unint64_t)a8;
- (ne_trie)trie;
- (void)dealloc;
- (void)setTrie:(ne_trie *)a3;
@end

@implementation NETrie

- (NETrie)initWithDomains:(id)a3 prefixCount:(int)a4 reverse:(BOOL)a5 partialSearchAllowed:(BOOL)a6 partialSearchTerminator:(char)a7 extra_bytes:(unint64_t)a8
{
  LODWORD(v12) = a4;
  id v14 = a3;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS___NETrie;
  v15 = -[NETrie init](&v62, "init");
  v17 = v15;
  if (!v15)
  {
LABEL_34:
    v27 = v17;
    goto LABEL_35;
  }

  if (v14 && (v15 = (NETrie *)[v14 count]) != 0)
  {
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    id v52 = v14;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v19)
    {
      id v20 = v19;
      char v53 = a7;
      int v21 = 0;
      uint64_t v22 = *(void *)v59;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v18);
          }
          v21 += [*(id *)(*((void *)&v58 + 1) + 8 * (void)i) length];
        }

        id v20 = [v18 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }

      while (v20);
      uint64_t v24 = v21;
      a7 = v53;
    }

    else
    {
      uint64_t v24 = 0LL;
    }

    if ((_DWORD)v12) {
      id v12 = (id)(int)v12;
    }
    else {
      id v12 = [v18 count];
    }
    uint64_t v28 = ne_trie_init(&v17->_trie, v12, [v18 count], v24, 0xFFFFFFFFLL, a8, 0.0);
    if ((_DWORD)v28)
    {
      v17->_reverse = a5;
      v17->_partialSearchAllowed = a6;
      v17->_partialSearchTerminator = a7;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v30 = v18;
      id v31 = [v30 countByEnumeratingWithState:&v54 objects:v71 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v55;
        do
        {
          for (j = 0LL; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v55 != v33) {
              objc_enumerationMutation(v30);
            }
            id v35 = *(id *)(*((void *)&v54 + 1) + 8LL * (void)j);
            uint64_t v36 = ne_trie_insert( &v17->_trie,  [v35 UTF8String],  objc_msgSend(v35, "length"),  0,  0,  v17->_reverse);
            if ((_DWORD)v36 == 0xFFFF)
            {
              uint64_t v38 = ne_log_obj(v36, v37);
              v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v64 = v35;
                _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "NETrie - failed insert for %@",  buf,  0xCu);
              }
            }
          }

          id v32 = [v30 countByEnumeratingWithState:&v54 objects:v71 count:16];
        }

        while (v32);
      }

      uint64_t v42 = ne_log_obj(v40, v41);
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v47 = [v30 count];
        int nodes_free_next = v17->_trie.nodes_free_next;
        int child_maps_free_next = v17->_trie.child_maps_free_next;
        int bytes_free_next = v17->_trie.bytes_free_next;
        int root = v17->_trie.root;
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)v64 = v47;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = nodes_free_next;
        __int16 v65 = 1024;
        int v66 = child_maps_free_next;
        __int16 v67 = 1024;
        int v68 = bytes_free_next;
        __int16 v69 = 1024;
        int v70 = root;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "NETrie - initialized with %d domains (Nodes used = %d, child maps used = %d, bytes used = %d, int root = %d)",  buf,  0x20u);
      }

      id v14 = v52;
      goto LABEL_34;
    }

    uint64_t v45 = ne_log_obj(v28, v29);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "NETrie - failed init", buf, 2u);
    }

    v27 = 0LL;
    id v14 = v52;
  }

  else
  {
    uint64_t v25 = ne_log_obj(v15, v16);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "NETrie - No domain", buf, 2u);
    }

    v27 = 0LL;
  }

- (void)dealloc
{
  uint64_t v3 = ne_log_obj(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "NETrie - dealloc", buf, 2u);
  }

  if (self->_trie.memory)
  {
    uint64_t v7 = ne_log_obj(v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "NETrie - dealloc - free memory", buf, 2u);
    }

    free(self->_trie.memory);
  }

  *(_OWORD *)&self->_trie.child_maps_mem_size = 0u;
  *(_OWORD *)&self->_trie.is_mmap = 0u;
  *(_OWORD *)&self->_trie.nodes_count = 0u;
  *(_OWORD *)&self->_trie.trie_memory_size = 0u;
  *(_OWORD *)&self->_trie.nodes = 0u;
  *(_OWORD *)&self->_trie.bytes = 0u;
  *(_OWORD *)&self->_trie.magic = 0u;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NETrie;
  -[NETrie dealloc](&v9, "dealloc");
}

- (BOOL)search:(const char *)a3 length:(int)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    uint64_t v6 = self;
    int v15 = 0;
    p_trie = &self->_trie;
    if (v6)
    {
      BOOL reverse = v6->_reverse;
      BOOL partialSearchAllowed = v6->_partialSearchAllowed;
      LOBYTE(v6) = v6->_partialSearchTerminator;
    }

    else
    {
      BOOL partialSearchAllowed = 0LL;
      BOOL reverse = 0LL;
    }

    uint64_t v10 = ne_trie_search(p_trie, a3, a4, 0LL, 0LL, reverse, partialSearchAllowed, (char)v6, &v15, 0LL);
    BOOL v4 = (_DWORD)v10 != 0xFFFF;
    if ((_DWORD)v10 == 0xFFFF)
    {
      if (v15)
      {
        uint64_t v12 = ne_log_obj(v10, v11);
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v17 = a3;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "NETrie - high ASCII detected <%s>",  buf,  0xCu);
        }
      }
    }
  }

  return v4;
}

- (BOOL)searchWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    int v18 = 0;
    id v6 = v5;
    id v7 = [v6 UTF8String];
    id v8 = [v6 length];
    if (self)
    {
      BOOL reverse = self->_reverse;
      BOOL partialSearchAllowed = self->_partialSearchAllowed;
      char partialSearchTerminator = self->_partialSearchTerminator;
    }

    else
    {
      BOOL partialSearchAllowed = 0LL;
      BOOL reverse = 0LL;
      char partialSearchTerminator = 0;
    }

    uint64_t v12 = ne_trie_search( &self->_trie,  v7,  v8,  0LL,  0LL,  reverse,  partialSearchAllowed,  partialSearchTerminator,  &v18,  0LL);
    BOOL v14 = (_DWORD)v12 != 0xFFFF;
    if ((_DWORD)v12 == 0xFFFF && v18)
    {
      uint64_t v15 = ne_log_obj(v12, v13);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "NETrie - high ASCII detected <%@>",  buf,  0xCu);
      }
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (ne_trie)trie
{
  return result;
}

- (void)setTrie:(ne_trie *)a3
{
}

@end