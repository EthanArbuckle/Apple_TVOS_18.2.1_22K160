@interface SDNodeCoalescer
- (NSArray)availableNodes;
- (NSArray)coalescedNodes;
- (NSMutableDictionary)contactIdentifierMap;
- (NSMutableDictionary)originalNodes;
- (SDNodeCoalescer)init;
- (id)coalescedNodesForNewAvailableNodes:(id)a3;
- (id)mappedContactIdentifierForContactIdentifier:(id)a3;
- (id)setMappedContactIdentifier:(id)a3 relatedContactIdentifiers:(id)a4;
- (void)setAvailableNodes:(id)a3;
- (void)setContactIdentifierMap:(id)a3;
- (void)setOriginalNodes:(id)a3;
@end

@implementation SDNodeCoalescer

- (SDNodeCoalescer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDNodeCoalescer;
  v2 = -[SDNodeCoalescer init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    originalNodes = v2->_originalNodes;
    v2->_originalNodes = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    contactIdentifierMap = v2->_contactIdentifierMap;
    v2->_contactIdentifierMap = v5;
  }

  return v2;
}

- (id)coalescedNodesForNewAvailableNodes:(id)a3
{
  id v93 = a3;
  v98 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v106 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v97 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v94 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v96 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v105 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  objc_storeStrong((id *)&self->_availableNodes, a3);
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  obj = self->_availableNodes;
  v102 = self;
  id v101 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v118,  v127,  16LL);
  if (v101)
  {
    uint64_t v100 = *(void *)v119;
    uint64_t v99 = kSFNodeKindRapport;
    do
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v119 != v100) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v118 + 1) + 8LL * (void)v5);
        v7 = (void *)SFNodeCopyKinds(v6);
        v9 = (void *)SFNodeCopyRealName(v6, v8);
        uint64_t v10 = SFNodeCopyContactIdentifiers(v6);
        v11 = (void *)SFNodeCopyContactIdentifier(v6);
        v12 = (void *)SFNodeCopyUserName(v6);
        unsigned int v103 = [v7 containsObject:v99];
        unsigned int v13 = sub_100034824(v6);
        if (!v10)
        {
          id v14 = sub_100034938(v6);
          uint64_t v10 = objc_claimAutoreleasedReturnValue(v14);
        }

        v107 = (void *)v10;
        if (v11)
        {
          BOOL v15 = 1;
LABEL_15:
          v111 = v11;
          goto LABEL_16;
        }

        id v16 = sub_100034970(v6);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
        BOOL v15 = v17 != 0;
        if (v17) {
          int v18 = 1;
        }
        else {
          int v18 = v13;
        }
        if (v18 == 1)
        {
          v11 = (void *)v17;
          goto LABEL_15;
        }

        BOOL v15 = 0;
        v111 = 0LL;
        v11 = v12;
LABEL_16:
        id v19 = v11;
        uint64_t v20 = airdrop_log(v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        id v109 = v19;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v53 = NSPrintF( "kinds=%##@ realName=%@ cnId=%@ aTag=%@ id=%@ isRap=%d isMe=%d",  v7,  v9,  v111,  v12,  v19,  v103,  v13,  v93);
          v54 = v9;
          v55 = v7;
          v56 = (void *)objc_claimAutoreleasedReturnValue(v53);
          *(_DWORD *)buf = 138412546;
          uint64_t v124 = v6;
          __int16 v125 = 2112;
          v126 = v56;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Coalescing node %@: %@", buf, 0x16u);

          v7 = v55;
          v9 = v54;
          id v19 = v109;
        }

        if (v19)
        {
          uint64_t v23 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v105, "objectForKeyedSubscript:", v19));
          v24 = v9;
          v25 = v7;
          v26 = (void *)v23;
          id v27 = sub_100113278();
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          id v29 = sub_10011313C(v26, v28);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

          self = v102;
          v7 = v25;
          v9 = v24;
          id v19 = v109;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v105, "setObject:forKeyedSubscript:", v30, v109);
        }

        else
        {
          uint64_t v31 = airdrop_log(v22);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v124 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "No identifier found for node %@",  buf,  0xCu);
          }
        }

        if (v13)
        {
          v32 = (os_log_s *)SFNodeCopyIDSDeviceIdentifier(v6);
          if (v32 || (v32 = (os_log_s *)SFNodeCopyComputerName(v6)) != 0LL)
          {
            v33 = v12;
            v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_originalNodes,  "objectForKeyedSubscript:",  v32));

            v35 = v107;
            if (!v34)
            {
              Copy = (const void *)SFNodeCreateCopy(0LL, v6);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_originalNodes,  "setObject:forKeyedSubscript:",  Copy,  v32);
              CFRelease(Copy);
            }

            v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_originalNodes,  "objectForKeyedSubscript:",  v32));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v98, "setObject:forKeyedSubscript:", v37, v32);

            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v106, "objectForKeyedSubscript:", v32));
            if (v38)
            {
              v39 = v38;
            }

            else
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v6));
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", v39, v32);
            v50 = (void *)SFNodeCopyModelIdentifier(v6);
            if (v50)
            {
              v51 = (void *)SFNodeCopyIconData(v6);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v96, "setObject:forKeyedSubscript:", v51, v32);
            }

            v12 = v33;
            id v19 = v109;
          }

          else
          {
            uint64_t v52 = airdrop_log(0LL);
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            v35 = v107;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v124 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "coalescedNodesForNewAvailableNodes: Device ID is not available for %@",  buf,  0xCu);
            }
          }

- (id)setMappedContactIdentifier:(id)a3 relatedContactIdentifiers:(id)a4
{
  id v6 = a3;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_contactIdentifierMap,  "objectForKeyedSubscript:",  v12));

      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_contactIdentifierMap,  "objectForKeyedSubscript:",  v12));

    if (v14) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:
  }

  id v14 = v6;
LABEL_12:
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_contactIdentifierMap,  "objectForKeyedSubscript:",  v20,  (void)v23));

        if (!v21) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_contactIdentifierMap,  "setObject:forKeyedSubscript:",  v14,  v20);
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v17);
  }

  return v14;
}

- (id)mappedContactIdentifierForContactIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_contactIdentifierMap, "objectForKeyedSubscript:", a3);
}

- (NSArray)availableNodes
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAvailableNodes:(id)a3
{
}

- (NSArray)coalescedNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSMutableDictionary)originalNodes
{
  return self->_originalNodes;
}

- (void)setOriginalNodes:(id)a3
{
}

- (NSMutableDictionary)contactIdentifierMap
{
  return self->_contactIdentifierMap;
}

- (void)setContactIdentifierMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end