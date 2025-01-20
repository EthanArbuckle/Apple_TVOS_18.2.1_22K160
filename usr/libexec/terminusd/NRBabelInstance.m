@interface NRBabelInstance
- (BOOL)handleUpdateFromAddr:(const in6_addr *)a3 ForPrefix:(const in6_addr *)a4 plen:(unsigned __int8)a5 nextHop:(const in6_addr *)a6 babelInterface:(id)a7 routerID:(unint64_t)a8 seqno:(unsigned __int16)a9 interval:(unsigned __int16)a10 metric:(unsigned __int16)a11 ae:(unsigned __int8)a12;
- (BOOL)isNewDistanceUnfeasibleForPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6;
- (BOOL)purgeAllRoutesFromNeighbor:(id)a3;
- (BOOL)purgeInterface:(id)a3;
- (NEVirtualInterface_s)nevi;
- (NRBabelInstance)init;
- (NSMutableArray)interfaces;
- (NSMutableArray)neighbors;
- (NSMutableArray)posrs;
- (NSMutableArray)routes;
- (NSMutableArray)sources;
- (NSString)addrStr;
- (OS_dispatch_queue)queue;
- (OS_nw_path_evaluator)ifBringupPathEvaluator;
- (id)copyNeighborWithAddr:(const in6_addr *)a3 babelInterface:(id)a4 isNewNeighbor:(BOOL *)a5;
- (id)copyPendingOutgoingSeqnoReqWithPrefix:(id)a3 routerID:(unint64_t)a4 isNewPOSR:(BOOL *)a5;
- (id)copyRouteString;
- (id)copyRouteWithPrefix:(id)a3 neighbor:(id)a4;
- (id)copySourceWithPrefix:(id)a3 routerID:(unint64_t)a4;
- (id)createSelectedRoutesArrayForPrefix:(id)a3;
- (id)createUpdateTLVs;
- (id)createUpdateTLVsForPrefix:(id)a3;
- (id)createUpdateTLVsForPrefix:(id)a3 interval:(unsigned __int16)a4;
- (id)createUpdateTLVsForRoutes:(id)a3;
- (id)createUpdateTLVsForRoutes:(id)a3 interval:(unsigned __int16)a4;
- (id)createUpdateTLVsWithInterval:(unsigned __int16)a3;
- (id)description;
- (unint64_t)routerID;
- (unsigned)nodeSeqno;
- (void)addRouterID:(unint64_t)a3 toTLVs:(id)a4;
- (void)addUpdateForRoute:(id)a3 interval:(unsigned __int16)a4 toTLVs:(id)a5;
- (void)dealloc;
- (void)handleAckReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 nonce:(unsigned __int16)a5 interval:(unsigned __int16)a6;
- (void)handleHelloFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 seqno:(unsigned __int16)a5 interval:(unsigned __int16)a6 personal:(BOOL)a7;
- (void)handleIHUFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 rxcost:(unsigned __int16)a5 interval:(unsigned __int16)a6;
- (void)handleIfBringupPathUpdate:(id)a3;
- (void)handlePacket:(const char *)a3 length:(unsigned int)a4 remoteAddr:(const in6_addr *)a5 localAddr:(const in6_addr *)a6 babelInterface:(id)a7 dtls:(BOOL)a8;
- (void)handleRouteReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6;
- (void)handleSeqnoReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6 routerID:(unint64_t)a7 seqno:(unsigned __int16)a8 hopCount:(unsigned __int8)a9;
- (void)sendImmediateRouteUpdateToAllNeighbors;
- (void)sendImmediateRouteUpdateToNeighbor:(id)a3;
- (void)sendSeqnoReqIfNecessaryTo:(id)a3 forPrefix:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 hopCount:(unsigned __int8)a7 originator:(id)a8;
- (void)setAddrStr:(id)a3;
- (void)setIfBringupPathEvaluator:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setNeighbors:(id)a3;
- (void)setNevi:(NEVirtualInterface_s *)a3;
- (void)setNodeSeqno:(unsigned __int16)a3;
- (void)setPosrs:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRouterID:(unint64_t)a3;
- (void)setRoutes:(id)a3;
- (void)setSources:(id)a3;
- (void)setupAddress:(in6_addr *)a3;
- (void)setupInterfaces;
- (void)updateFeasabilityDistanceForRoute:(id)a3;
- (void)updateRoutes;
@end

@implementation NRBabelInstance

- (void)handleIfBringupPathUpdate:(id)a3
{
  path = (nw_path *)a3;
  if (nw_path_get_status(path) == nw_path_status_satisfied)
  {
    uint64_t interface_index = nw_path_get_interface_index(path);
    v5 = -[NRBabelInterfaceSocket initWithInstance:interface:]( objc_alloc(&OBJC_CLASS___NRBabelInterfaceSocket),  "initWithInstance:interface:",  self,  interface_index);
    if (v5)
    {
      -[NSMutableArray addObject:](self->_interfaces, "addObject:", v5);
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d Added ifIndex %u, new list %@",  ",  "-[NRBabelInstance handleIfBringupPathUpdate:]"",  2565LL,  interface_index,  self->_interfaces);
      }
    }

    else
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs( qword_1001DC8A8,  17LL,  "NRBabelInterfaceSocket init %u failed - list is %@",  interface_index,  self->_interfaces);
      }
    }

    -[NRBabelInstance setupInterfaces](self, "setupInterfaces");
LABEL_22:

    goto LABEL_23;
  }

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    v5 = (NRBabelInterfaceSocket *)(id)qword_1001DC8A8;
    nw_path_status_t status = nw_path_get_status(path);
    _NRLogWithArgs( v5,  1LL,  "%s%.30s:%-4d if bringup path not satisfied %u",  ",  "-[NRBabelInstance handleIfBringupPathUpdate:]"",  2557,  status);
    goto LABEL_22;
  }

- (void)setupInterfaces
{
  for (int i = 0; i != 10; ++i)
  {
    *(_DWORD *)((char *)&__str + 7) = 0;
    *(void *)&__int128 __str = 0LL;
    snprintf((char *)&__str, 0xBuLL, "ipsec%u", i);
    uint64_t v5 = if_nametoindex((const char *)&__str);
    if ((_DWORD)v5)
    {
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      v4 = self->_interfaces;
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v56,  v62,  16LL);
      if (v6)
      {
        uint64_t v7 = *(void *)v57;
LABEL_9:
        uint64_t v8 = 0LL;
        while (1)
        {
          if (*(void *)v57 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v56 + 1) + 8 * v8);
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___NRBabelInterfaceSocket);
          if (v6 == (id)++v8)
          {
            id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v56,  v62,  16LL);
            if (v6) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
        }
      }

      else
      {
LABEL_17:

        v4 = -[NRBabelInterfaceSocket initWithInstance:interface:]( objc_alloc(&OBJC_CLASS___NRBabelInterfaceSocket),  "initWithInstance:interface:",  self,  v5);
        if (v4)
        {
          -[NSMutableArray addObject:](self->_interfaces, "addObject:", v4);
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d Added IPsec ifIndex %u, new list %@",  ",  "-[NRBabelInstance setupInterfaces]"",  2599LL,  v5,  self->_interfaces);
          }
        }

        else
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  17LL,  "NRBabelInterfaceSocket IPsec init %u failed - list is %@",  v5,  self->_interfaces);
          }

          v4 = 0LL;
        }
      }
    }
  }

  nw_parameters_t v11 = nw_parameters_create();
  __int128 __str = 0uLL;
  id v48 = xpc_uuid_create((const unsigned __int8 *)&__str);
  if (!v48)
  {
    id v28 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v28, 16LL);

    if (IsLevelEnabled)
    {
      id v30 = sub_1000B07C8();
      _NRLogWithArgs( v30,  16LL,  "%s%.30s:%-4d ABORTING: xpc_uuid_create(%p) failed",  ",  "nr_xpc_uuid_create"",  105,  &__str);
    }

    uint64_t v31 = _os_log_pack_size(22LL);
    v32 = (char *)&v47 - ((__chkstk_darwin(v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v33 = __error();
    uint64_t v34 = _os_log_pack_fill(v32, v31, *v33, &_mh_execute_header, "%{public}s xpc_uuid_create(%p) failed");
    *(_DWORD *)uint64_t v34 = 136446466;
    *(void *)(v34 + 4) = "nr_xpc_uuid_create";
    *(_WORD *)(v34 + 12) = 2048;
    *(void *)(v34 + 14) = &__str;
    id v35 = sub_1000B07C8();
    _NRLogAbortWithPack(v35, v32);
LABEL_51:
    __break(1u);
  }

  xpc_object_t v12 = xpc_array_create(0LL, 0LL);
  v13 = v12;
  if (!v12)
  {
    id v36 = sub_1000B07C8();
    int v37 = _NRLogIsLevelEnabled(v36, 16LL);

    if (v37)
    {
      id v38 = sub_1000B07C8();
      _NRLogWithArgs( v38,  16LL,  "%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed",  ",  "nr_xpc_array_create"",  56,  0LL,  0);
    }

    goto LABEL_50;
  }

  xpc_array_append_value(v12, v48);
  nw_parameters_set_preferred_netagent_uuids(v11, v13);
  xpc_object_t v14 = xpc_uint64_create(2uLL);
  xpc_object_t v15 = xpc_array_create(0LL, 0LL);
  v16 = v15;
  if (!v15)
  {
    id v39 = sub_1000B07C8();
    int v40 = _NRLogIsLevelEnabled(v39, 16LL);

    if (v40)
    {
      id v41 = sub_1000B07C8();
      _NRLogWithArgs( v41,  16LL,  "%s%.30s:%-4d ABORTING: xpc_array_create(%p, %u) failed",  ",  "nr_xpc_array_create"",  56,  0LL,  0);
    }

- (void)setupAddress:(in6_addr *)a3
{
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    uint64_t v5 = (void *)qword_1001DC8A8;
    unint64_t routerID = self->_routerID;
    unint64_t v7 = bswap64(routerID);
    id v8 = (id)qword_1001DC8A8;
    if (v7 > 0xFFFE)
    {
      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v11 = bswap32(routerID);
      v9 = -[NSString initWithFormat:]( v10,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v11),  (unsigned __int16)v11,  bswap32(HIDWORD(routerID)) >> 16,  __rev16(HIWORD(routerID)));
    }

    else
    {
      v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v7,  v16,  v17,  v18);
    }

    xpc_object_t v12 = v9;
    _NRLogWithArgs(v5, 1LL, "%s%.30s:%-4d starting instance %@", ", "-[NRBabelInstance setupAddress:]"", 2649LL, v9);
  }

  system( "netstat -rnf inet6 | grep -v Routing | grep -v Destination | grep -v Internet6 | grep -v -e '^$' | while read -r rou te ; do addr=$(echo $route | awk '{print $1}') ; flags=$(echo $route | awk '{print $3}') ; [[ $flags"
    " == *2* ]] && route -nv delete -inet6 ${addr}; done");
  IPv6AddrString = (NSString *)createIPv6AddrString(a3, v13);
  addrStr = self->_addrStr;
  self->_addrStr = IPv6AddrString;

  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d instance address is %@",  ",  "-[NRBabelInstance setupAddress:]"",  2657LL,  self->_addrStr);
  }

- (void)dealloc
{
  nevint i = self->_nevi;
  if (nevi) {
    NEVirtualInterfaceInvalidate(nevi, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRBabelInstance;
  -[NRBabelInstance dealloc](&v4, "dealloc");
}

- (NRBabelInstance)init
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___NRBabelInstance;
  v2 = -[NRBabelInstance init](&v44, "init");
  if (!v2)
  {
    id v27 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v27, 16LL);

    if (IsLevelEnabled)
    {
      id v29 = sub_1000B07C8();
      _NRLogWithArgs(v29, 16LL, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelInstance init]"", 2699);
    }

    uint64_t v30 = _os_log_pack_size(12LL);
    uint64_t v5 = (char *)block - ((__chkstk_darwin(v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = __error();
    uint64_t v32 = _os_log_pack_fill(v5, v30, *v31, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v32 = 136446210;
    *(void *)(v32 + 4) = "-[NRBabelInstance init]";
    id v33 = sub_1000B07C8();
    _NRLogAbortWithPack(v33, v5);
LABEL_13:
    id v34 = sub_1000B07C8();
    int v35 = _NRLogIsLevelEnabled(v34, 16LL);

    if (v35)
    {
      id v36 = sub_1000B07C8();
      _NRLogWithArgs( v36,  16LL,  "%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed",  ",  "nr_dispatch_queue_create"",  118,  v5);
    }

    uint64_t v37 = _os_log_pack_size(22LL);
    id v38 = (char *)block - ((__chkstk_darwin(v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    id v39 = __error();
    uint64_t v40 = _os_log_pack_fill( v38,  v37,  *v39,  &_mh_execute_header,  "%{public}s dispatch_queue_create(%s) failed");
    *(_DWORD *)uint64_t v40 = 136446466;
    *(void *)(v40 + 4) = "nr_dispatch_queue_create";
    *(_WORD *)(v40 + 12) = 2080;
    *(void *)(v40 + 14) = v5;
    id v41 = sub_1000B07C8();
    _NRLogAbortWithPack(v41, v38);
  }

  v3 = v2;
  objc_super v4 = (dispatch_queue_attr_s *)_NRCopySerialQueueAttr(v2);
  uint64_t v5 = "terminusd.babel";
  dispatch_queue_t v6 = dispatch_queue_create("terminusd.babel", v4);

  if (!v6) {
    goto LABEL_13;
  }
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  interfaces = v3->_interfaces;
  v3->_interfaces = v8;

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  neighbors = v3->_neighbors;
  v3->_neighbors = v10;

  xpc_object_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  sources = v3->_sources;
  v3->_sources = v12;

  xpc_object_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  routes = v3->_routes;
  v3->_routes = v14;

  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  posrs = v3->_posrs;
  v3->_posrs = v16;

  uint64_t v18 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  @"/tmp/terminus_babel_data.plist");
  if (!v18) {
    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", @"routerID"));
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0 || (id v21 = [v19 unsignedLongLongValue]) == 0)
  {
    do
    {
      uint64_t v22 = arc4random();
      id v21 = (id)(arc4random() | (unint64_t)(v22 << 32));
    }

    while ((unint64_t)v21 + 1 < 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, @"routerID");

    sub_1001013AC(@"/tmp/terminus_babel_data.plist", v18, 1);
  }

  v3->_unint64_t routerID = (unint64_t)v21;
  v3->_nodeSeqno = arc4random_uniform(0x10000u);
  v24 = (dispatch_queue_s *)v3->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF9C4;
  block[3] = &unk_1001B0A88;
  v25 = v3;
  v43 = v25;
  dispatch_async(v24, block);

  return v25;
}

- (id)copyNeighborWithAddr:(const in6_addr *)a3 babelInterface:(id)a4 isNewNeighbor:(BOOL *)a5
{
  id v8 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v9 = self->_neighbors;
  uint64_t v10 = (NRBabelNeighbor *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (int i = 0LL; i != v10; int i = (NRBabelNeighbor *)((char *)i + 1))
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v13, "matchesAddress:babelInterface:", a3, v8, (void)v16))
        {
          uint64_t v10 = v13;
          goto LABEL_11;
        }
      }

      uint64_t v10 = (NRBabelNeighbor *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)copySourceWithPrefix:(id)a3 routerID:(unint64_t)a4
{
  id v6 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unint64_t v7 = self->_sources;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (int i = 0LL; i != v9; int i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        xpc_object_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "matchesPrefix:routerID:", v6, a4, (void)v15))
        {
          id v13 = v12;
          goto LABEL_11;
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v13 = 0LL;
LABEL_11:

  return v13;
}

- (BOOL)isNewDistanceUnfeasibleForPrefix:(id)a3 routerID:(unint64_t)a4 seqno:(unsigned __int16)a5 metric:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v8 = -[NRBabelInstance copySourceWithPrefix:routerID:](self, "copySourceWithPrefix:routerID:", a3, a4);
  LOBYTE(v6) = [v8 isNewDistanceUnfeasibleWithSeqno:v7 metric:v6];

  return v6;
}

- (id)copyRouteWithPrefix:(id)a3 neighbor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = self->_routes;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (int i = 0LL; i != v9; int i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        xpc_object_t v12 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "matchesPrefix:neighbor:", v6, v7, (void)v14))
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)copyPendingOutgoingSeqnoReqWithPrefix:(id)a3 routerID:(unint64_t)a4 isNewPOSR:(BOOL *)a5
{
  id v8 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = self->_posrs;
  uint64_t v10 = (NRPendingOutgoingSeqnoReq *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (int i = 0LL; i != v10; int i = (NRPendingOutgoingSeqnoReq *)((char *)i + 1))
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (objc_msgSend(v13, "matchesPrefix:routerID:", v8, a4, (void)v16))
        {
          uint64_t v10 = v13;
          goto LABEL_11;
        }
      }

      uint64_t v10 = (NRPendingOutgoingSeqnoReq *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)handleAckReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 nonce:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  unsigned int v7 = a5;
  id v8 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:]( self,  "copyNeighborWithAddr:babelInterface:isNewNeighbor:",  a3,  a4,  0LL);
  v10[0] = 515;
  v10[1] = __rev16(v7);
  id v9 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v10, 4LL);
  [v8 scheduleTLV:v9 interval:v6];
}

- (void)handleHelloFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 seqno:(unsigned __int16)a5 interval:(unsigned __int16)a6 personal:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  id v12 = a4;
  char v19 = 0;
  id v13 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:]( self,  "copyNeighborWithAddr:babelInterface:isNewNeighbor:",  a3,  v12,  &v19);
  if (v19)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      id v14 = (id)qword_1001DC8A8;
      IPv6AddrString = (void *)createIPv6AddrString(a3, v15);
      unsigned int v17 = [v13 metric];
      __int128 v18 = "public";
      if (v7) {
        __int128 v18 = "personal";
      }
      _NRLogWithArgs( v14,  1LL,  "%s%.30s:%-4d %@Adding new neighbor [%@] %@ - seqno %u interval %u metric %u %s",  ",  "-[NRBabelInstance handleHelloFromAddr:babelInterface:seqno:interval:personal:]"",  2839LL,  self,  v12,  IPv6AddrString,  v9,  v8,  v17,  v18);
    }

    -[NRBabelInstance sendImmediateRouteUpdateToNeighbor:](self, "sendImmediateRouteUpdateToNeighbor:", v13);
  }

  [v13 handleHelloWithSeqno:v9 interval:v8 personal:v7];
}

- (void)handleIHUFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 rxcost:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v15 = a4;
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    id v10 = (id)qword_1001DC8A8;
    IPv6AddrString = (void *)createIPv6AddrString(a3, v11);
    _NRLogWithArgs( v10,  2LL,  "%s%.30s:%-4d %@Got IHU from %@[%@] rxcost %u interval %u",  ",  "-[NRBabelInstance handleIHUFromAddr:babelInterface:rxcost:interval:]"",  2857LL,  self,  IPv6AddrString,  v15,  v7,  v6);
  }

  id v13 = v15;
  if ((_DWORD)v6)
  {
    id v14 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:]( self,  "copyNeighborWithAddr:babelInterface:isNewNeighbor:",  a3,  v15,  0LL);
    [v14 setTxcost:v7];
    [v14 resetIncomingIHUTimerInterval:v6];

    id v13 = v15;
  }
}

- (BOOL)purgeAllRoutesFromNeighbor:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = self->_routes;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (int i = 0LL; i != v7; int i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "neighbor", (void)v15));
        if ([v12 isEqual:v4])
        {
          unsigned int v13 = [v11 receivedMetric];

          if (v13 != 0xFFFF)
          {
            [v11 setReceivedMetric:0xFFFFLL];
            char v8 = 1;
          }
        }

        else
        {
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)purgeInterface:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = self->_neighbors;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (int i = 0LL; i != v7; int i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "babelInterface", (void)v15));
        unsigned int v13 = [v12 isEqual:v4];

        if (v13) {
          v8 |= -[NRBabelInstance purgeAllRoutesFromNeighbor:](self, "purgeAllRoutesFromNeighbor:", v11);
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (BOOL)handleUpdateFromAddr:(const in6_addr *)a3 ForPrefix:(const in6_addr *)a4 plen:(unsigned __int8)a5 nextHop:(const in6_addr *)a6 babelInterface:(id)a7 routerID:(unint64_t)a8 seqno:(unsigned __int16)a9 interval:(unsigned __int16)a10 metric:(unsigned __int16)a11 ae:(unsigned __int8)a12
{
  uint64_t v14 = a5;
  id v18 = a7;
  char v19 = -[NRBabelPrefix initWithPrefix:plen:](objc_alloc(&OBJC_CLASS___NRBabelPrefix), "initWithPrefix:plen:", a4, v14);
  v82 = self;
  id v20 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:]( self,  "copyNeighborWithAddr:babelInterface:isNewNeighbor:",  a3,  v18,  0LL);
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    id v21 = (void *)qword_1001DC8A8;
    unint64_t v22 = bswap64(a8);
    id v23 = (id)qword_1001DC8A8;
    if (v22 > 0xFFFE)
    {
      v25 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v26 = bswap32(a8);
      v24 = -[NSString initWithFormat:]( v25,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v26),  (unsigned __int16)v26,  bswap32(HIDWORD(a8)) >> 16,  __rev16(HIWORD(a8)));
    }

    else
    {
      v24 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v22,  v76,  v77,  v78);
    }

    id v27 = v24;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v20 descriptionWithNextHop:a6]);
    _NRLogWithArgs( v21,  2LL,  "%s%.30s:%-4d %@Got Route %@ %@ seqno %u metric %u via %@ interval %u",  ",  "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]"",  2915LL,  self,  v19,  v27,  a9,  a11,  v28,  a10);
  }

  if (a11 != 0xFFFF || a12)
  {
    id v79 = v18;
    uint64_t v32 = -[NRBabelInstance copyRouteWithPrefix:neighbor:](self, "copyRouteWithPrefix:neighbor:", v19, v20);
    unsigned int v33 = -[NRBabelInstance isNewDistanceUnfeasibleForPrefix:routerID:seqno:metric:]( self,  "isNewDistanceUnfeasibleForPrefix:routerID:seqno:metric:",  v19,  a8,  a9,  a11);
    unsigned int v34 = v33;
    id v80 = v20;
    if (v32)
    {
      v81 = v32;
      unsigned int v35 = -[NRBabelRoute selected](v32, "selected");
      if (a11 != 0xFFFF && (v35 & v34) != 0)
      {
        id v36 = v32;
        if (-[NRBabelRoute routerID](v32, "routerID") == a8)
        {
          id v18 = v79;
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            uint64_t v37 = (void *)qword_1001DC8A8;
            unint64_t v38 = bswap64(a8);
            id v39 = (id)qword_1001DC8A8;
            if (v38 > 0xFFFE)
            {
              __int128 v57 = objc_alloc(&OBJC_CLASS___NSString);
              unsigned int v58 = bswap32(a8);
              uint64_t v40 = -[NSString initWithFormat:]( v57,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v58),  (unsigned __int16)v58,  bswap32(HIDWORD(a8)) >> 16,  __rev16(HIWORD(a8)));
            }

            else
            {
              uint64_t v40 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v38,  v76,  v77,  v78);
            }

            __int128 v59 = v40;
            _NRLogWithArgs( v37,  2LL,  "%s%.30s:%-4d %@ignoring unfeasible route for %@ %@",  ",  "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]"",  2967LL,  v82,  v19,  v40);
          }

          goto LABEL_98;
        }

        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          id v48 = (void *)qword_1001DC8A8;
          unint64_t v49 = bswap64(a8);
          id v50 = (id)qword_1001DC8A8;
          if (v49 > 0xFFFE)
          {
            v60 = objc_alloc(&OBJC_CLASS___NSString);
            unsigned int v61 = bswap32(a8);
            id v36 = v32;
            id v51 = -[NSString initWithFormat:]( v60,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v61),  (unsigned __int16)v61,  bswap32(HIDWORD(a8)) >> 16,  __rev16(HIWORD(a8)));
          }

          else
          {
            id v51 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v49,  v76,  v77,  v78);
          }

          v62 = v51;
          _NRLogWithArgs( v48,  2LL,  "%s%.30s:%-4d %@ retracting due to mismatched routerID %@: %@",  ",  "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]"",  2965LL,  self,  v51,  v36);
        }

        v63 = v36;
        __int128 v52 = v79;
        -[NRBabelRoute setReceivedMetric:](v63, "setReceivedMetric:", 0xFFFFLL);
        goto LABEL_83;
      }

      unsigned int v45 = -[NRBabelRoute receivedMetric](v32, "receivedMetric");
      BOOL v46 = v45 != a11;
      if (v45 == a11)
      {
        uint64_t v47 = v81;
        if (a11 == 0xFFFF) {
          goto LABEL_57;
        }
      }

      else
      {
        -[NRBabelRoute setReceivedMetric:](v81, "setReceivedMetric:", a11);
        uint64_t v47 = v81;
        if (a11 == 0xFFFF)
        {
LABEL_51:
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          __int128 v52 = v79;
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            _NRLogWithArgs( qword_1001DC8A8,  2LL,  "%s%.30s:%-4d %@updated route table entry %@",  ",  "-[NRBabelInstance handleUpdateFromAddr:ForPrefix:plen:nextHop:babelInterface:routerID:seqno:interval:metric:ae:]"",  3013LL,  self,  v81);
          }

- (void)handleRouteReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v11 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:]( self,  "copyNeighborWithAddr:babelInterface:isNewNeighbor:",  a3,  a4,  0LL);
  uint64_t v9 = -[NRBabelPrefix initWithPrefix:plen:](objc_alloc(&OBJC_CLASS___NRBabelPrefix), "initWithPrefix:plen:", a5, v6);
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d %@got RouteReq for %@ from %@",  ",  "-[NRBabelInstance handleRouteReqFromAddr:babelInterface:ForPrefix:plen:]"",  3097LL,  self,  v9,  v11);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createUpdateTLVsForPrefix:](self, "createUpdateTLVsForPrefix:", v9));
  [v11 sendTLVs:v10];
}

- (void)sendSeqnoReqIfNecessaryTo:(id)a3 forPrefix:(id)a4 routerID:(unint64_t)a5 seqno:(unsigned __int16)a6 hopCount:(unsigned __int8)a7 originator:(id)a8
{
  uint64_t v9 = a7;
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a8;
  char v23 = 0;
  id v16 = -[NRBabelInstance copyPendingOutgoingSeqnoReqWithPrefix:routerID:isNewPOSR:]( self,  "copyPendingOutgoingSeqnoReqWithPrefix:routerID:isNewPOSR:",  a4,  a5,  &v23);
  __int128 v17 = v16;
  if (v23) {
    goto LABEL_2;
  }
  unsigned int v19 = [v16 seqno];
  if (v19 != (_DWORD)v10)
  {
    if (v19 >= v10)
    {
      else {
        LOBYTE(v20) = 1;
      }
    }

    else
    {
      int v20 = ((__int16)(v10 - v19) >> 15) | 1;
    }

    if ((char)v20 > 0)
    {
LABEL_2:
      [v17 setSeqno:v10];
      [v17 setOriginator:v15];
      [v17 setRoute:v14];
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 neighbor]);
      [v17 setTarget:v18];

      [v17 setHopCount:v9];
      [v17 start];
      goto LABEL_3;
    }
  }

- (void)handleSeqnoReqFromAddr:(const in6_addr *)a3 babelInterface:(id)a4 ForPrefix:(const in6_addr *)a5 plen:(unsigned __int8)a6 routerID:(unint64_t)a7 seqno:(unsigned __int16)a8 hopCount:(unsigned __int8)a9
{
  uint64_t v9 = a8;
  uint64_t v11 = a6;
  id v15 = a4;
  v75 = self;
  id v76 = -[NRBabelInstance copyNeighborWithAddr:babelInterface:isNewNeighbor:]( self,  "copyNeighborWithAddr:babelInterface:isNewNeighbor:",  a3,  v15,  0LL);
  id v16 = -[NRBabelPrefix initWithPrefix:plen:](objc_alloc(&OBJC_CLASS___NRBabelPrefix), "initWithPrefix:plen:", a5, v11);
  if (qword_1001DC8B0 != -1) {
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    __int128 v17 = (void *)qword_1001DC8A8;
    unint64_t v18 = bswap64(a7);
    id v19 = (id)qword_1001DC8A8;
    if (v18 > 0xFFFE)
    {
      id v21 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v22 = bswap32(a7);
      int v20 = -[NSString initWithFormat:]( v21,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v22),  (unsigned __int16)v22,  bswap32(HIDWORD(a7)) >> 16,  __rev16(HIWORD(a7)));
    }

    else
    {
      int v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v18,  v67,  v68,  v69);
    }

    char v23 = v20;
    _NRLogWithArgs( v17,  1LL,  "%s%.30s:%-4d %@got SeqnoReq for %@ %@ seqno %u hopCount %u from %@",  ",  "-[NRBabelInstance handleSeqnoReqFromAddr:babelInterface:ForPrefix:plen:routerID:seqno:hopCount:]"",  3138LL,  self,  v16,  v20,  v9,  a9,  v76);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( -[NRBabelInstance createSelectedRoutesArrayForPrefix:]( self,  "createSelectedRoutesArrayForPrefix:",  v16));
  if ([v24 count])
  {
    v70 = v16;
    id v72 = v15;
    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v73 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unsigned int v74 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    unsigned int v71 = v24;
    id obj = v24;
    id v26 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
    id v79 = v25;
    p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
    if (v26)
    {
      id v28 = v26;
      uint64_t v29 = *(void *)v85;
      do
      {
        for (int i = 0LL; i != v28; int i = (char *)i + 1)
        {
          if (*(void *)v85 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
          if ([v32 routerID] != (id)a7) {
            goto LABEL_31;
          }
          unsigned int v33 = [v32 seqno];
          if (v33 == (_DWORD)v9) {
            goto LABEL_31;
          }
          if (v33 >= v9)
          {
            else {
              LOBYTE(v34) = 1;
            }
          }

          else
          {
            int v34 = ((__int16)(v9 - v33) >> 15) | 1;
          }

          if ((char)v34 > 0)
          {
            if (v75->_routerID == a7) {
              BOOL v31 = v73;
            }
            else {
              BOOL v31 = v74;
            }
            goto LABEL_18;
          }

- (void)updateRoutes
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  unsigned __int16 v55 = self;
  id v4 = self->_routes;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v77,  v86,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v78;
    do
    {
      for (int i = 0LL; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v78 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bPrefix]);
        unsigned __int8 v11 = -[NSMutableArray containsObject:](v3, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bPrefix]);
          -[NSMutableArray addObject:](v3, "addObject:", v12);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v77,  v86,  16LL);
    }

    while (v6);
  }

  __int128 v56 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id obj = v3;
  id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v73,  v85,  16LL);
  if (v52)
  {
    uint64_t v51 = *(void *)v74;
    do
    {
      for (j = 0LL; j != v52; j = (char *)j + 1)
      {
        if (*(void *)v74 != v51) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        id v16 = v55->_routes;
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v69,  v84,  16LL);
        if (v17)
        {
          id v18 = v17;
          id v53 = j;
          id v14 = 0LL;
          uint64_t v19 = *(void *)v70;
          unsigned __int16 v20 = -1;
          do
          {
            for (k = 0LL; k != v18; k = (char *)k + 1)
            {
              if (*(void *)v70 != v19) {
                objc_enumerationMutation(v16);
              }
              unsigned int v22 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)k);
              char v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bPrefix]);
              unsigned int v24 = [v15 isContainedInPrefix:v23];

              if (v24 && [v22 metric] < v20)
              {
                id v25 = v22;

                unsigned __int16 v20 = (unsigned __int16)[v25 metric];
                id v14 = v25;
              }
            }

            id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v69,  v84,  16LL);
          }

          while (v18);

          if (v14)
          {
            j = v53;
          }

          else
          {
            j = v53;
          }
        }

        else
        {

          id v14 = 0LL;
        }
      }

      id v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v73,  v85,  16LL);
    }

    while (v52);
  }

  uint64_t v54 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v26 = v55->_routes;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v65,  v83,  16LL);
  if (v27)
  {
    id v28 = v27;
    char v29 = 0;
    uint64_t v30 = *(void *)v66;
    do
    {
      for (m = 0LL; m != v28; m = (char *)m + 1)
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(v26);
        }
        uint64_t v32 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)m);
        unsigned int v33 = [v32 selected];
        id v34 = -[NSMutableArray containsObject:](v56, "containsObject:", v32);
        if (v33 != (_DWORD)v34)
        {
          int v35 = (int)v34;
          [v32 setSelected:v34];
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            id v36 = "un";
            if (v35) {
              id v36 = "";
            }
            _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d %@%sselecting route %@",  ",  "-[NRBabelInstance updateRoutes]"",  3256LL,  v55,  v36,  v32);
          }

          if (v35) {
            -[NSMutableArray addObject:](v54, "addObject:", v32);
          }
          char v29 = 1;
        }
      }

      id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v65,  v83,  16LL);
    }

    while (v28);
  }

  else
  {
    char v29 = 0;
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v37 = v55->_routes;
  id v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v61,  v82,  16LL);
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v62;
    do
    {
      for (n = 0LL; n != v39; n = (char *)n + 1)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v37);
        }
        unint64_t v42 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)n);
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
        {
          if (qword_1001DC8B0 != -1) {
            dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
          }
          _NRLogWithArgs( qword_1001DC8A8,  1LL,  "%s%.30s:%-4d adding %@",  ",  "-[NRBabelInstance updateRoutes]"",  3278LL,  v42);
        }

        [v42 applyUsingSystem];
      }

      id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v61,  v82,  16LL);
    }

    while (v39);
  }

  if ((v29 & 1) != 0)
  {
    id v43 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v55->_posrs);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    objc_super v44 = v43;
    id v45 = -[NSArray countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v57,  v81,  16LL);
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v58;
      do
      {
        for (iint i = 0LL; ii != v46; iint i = (char *)ii + 1)
        {
          if (*(void *)v58 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * (void)ii) cancelIfRouteUnselected];
        }

        id v46 = -[NSArray countByEnumeratingWithState:objects:count:]( v44,  "countByEnumeratingWithState:objects:count:",  &v57,  v81,  16LL);
      }

      while (v46);
    }

    -[NRBabelInstance sendImmediateRouteUpdateToAllNeighbors](v55, "sendImmediateRouteUpdateToAllNeighbors");
    unint64_t v49 = v56;
  }

  else
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    unint64_t v49 = v56;
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs(qword_1001DC8A8, 2LL, "%s%.30s:%-4d no route changed", ", "-[NRBabelInstance updateRoutes]"", 3289);
    }
  }
}

- (void)addRouterID:(unint64_t)a3 toTLVs:(id)a4
{
  int v6 = 2566;
  unint64_t v7 = a3;
  id v4 = a4;
  id v5 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v6, 12LL);
  [v4 addObject:v5];
}

- (void)addUpdateForRoute:(id)a3 interval:(unsigned __int16)a4 toTLVs:(id)a5
{
  unsigned int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bPrefix]);
  [v9 writePrefix:&v18];

  if (v18 || v19 != -65536)
  {
    LODWORD(v17) = 0;
    uint64_t v13 = 8LL;
    HIWORD(v13) = __rev16(v6);
    __int16 v14 = __rev16(objc_msgSend(v7, "seqno", v13, 0, 0, v17));
    __int16 v15 = __rev16([v7 metric]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bPrefix]);
    unsigned __int8 v11 = [v10 writeToAE:(char *)&v13 + 2 plen:(char *)&v13 + 4 prefix:&v16];

    BYTE1(v13) = v11 + 10;
    id v12 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  &v13,  (v11 + 10) + 2LL);
    [v8 addObject:v12];
  }
}

- (id)createSelectedRoutesArrayForPrefix:(id)a3
{
  id v3 = a3;
  if (![v3 plen])
  {

    id v3 = 0LL;
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = self->_routes;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (int i = 0LL; i != v7; int i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v10 selected])
        {
          if ([v10 metric] == 0xFFFF)
          {
            if (qword_1001DC8B0 != -1) {
              dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
            }
            if (_NRLogIsLevelEnabled(qword_1001DC8A8, 17LL))
            {
              if (qword_1001DC8B0 != -1) {
                dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
              }
              _NRLogWithArgs(qword_1001DC8A8, 17LL, "%@ found invalid selected infinite route %@", self, v10);
            }
          }

          else if (!v3 {
                 || (unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bPrefix]),
          }
                     unsigned int v12 = [v3 isEqual:v11],
                     v11,
                     v12))
          {
            -[NSMutableArray addObject:](v4, "addObject:", v10);
          }
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v7);
  }

  return v4;
}

- (void)updateFeasabilityDistanceForRoute:(id)a3
{
  id v12 = a3;
  if ([v12 metric] != 0xFFFF)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 bPrefix]);
    id v5 = -[NRBabelInstance copySourceWithPrefix:routerID:]( self,  "copySourceWithPrefix:routerID:",  v4,  [v12 routerID]);

    if (v5)
    {
      -[NRBabelSource updateFeasabilityDistanceWithSeqno:metric:]( v5,  "updateFeasabilityDistanceWithSeqno:metric:",  [v12 seqno],  objc_msgSend(v12, "metric"));
    }

    else
    {
      id v6 = objc_alloc(&OBJC_CLASS___NRBabelSource);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 bPrefix]);
      id v8 = [v12 routerID];
      id v9 = [v12 seqno];
      id v10 = [v12 receivedMetric];
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v12 instance]);
      id v5 = -[NRBabelSource initWithPrefix:routerID:seqno:metric:instance:]( v6,  "initWithPrefix:routerID:seqno:metric:instance:",  v7,  v8,  v9,  v10,  v11);
    }

    -[NRBabelSource resetGCTimer](v5, "resetGCTimer");
  }
}

- (id)createUpdateTLVsForRoutes:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v6 count])
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (int i = 0LL; i != v9; int i = (char *)i + 1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [*(id *)(*((void *)&v36 + 1) + 8 * (void)i) routerID]));
        }

        id v9 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }

      while (v9);
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    unsigned int v22 = v7;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
    if (v24)
    {
      uint64_t v23 = *(void *)v33;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = v13;
          id v14 = [*(id *)(*((void *)&v32 + 1) + 8 * v13) unsignedLongLongValue];
          -[NRBabelInstance addRouterID:toTLVs:](self, "addRouterID:toTLVs:", v14, v27);
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          id v15 = obj;
          id v16 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v29;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                unsigned __int16 v20 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)j);
                if ([v20 routerID] == v14)
                {
                  if (qword_1001DC8B0 != -1) {
                    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
                  }
                  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 2LL))
                  {
                    if (qword_1001DC8B0 != -1) {
                      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
                    }
                    _NRLogWithArgs( qword_1001DC8A8,  2LL,  "%s%.30s:%-4d sending update for %@",  ",  "-[NRBabelInstance createUpdateTLVsForRoutes:interval:]"",  3441LL,  v20);
                  }

                  -[NRBabelInstance addUpdateForRoute:interval:toTLVs:]( self,  "addUpdateForRoute:interval:toTLVs:",  v20,  v4,  v27);
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
            }

            while (v17);
          }

          uint64_t v13 = v26 + 1;
        }

        while ((id)(v26 + 1) != v24);
        id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
      }

      while (v24);
    }
  }

  return v27;
}

- (id)createUpdateTLVsForRoutes:(id)a3
{
  return -[NRBabelInstance createUpdateTLVsForRoutes:interval:]( self,  "createUpdateTLVsForRoutes:interval:",  a3,  0xFFFFLL);
}

- (id)createUpdateTLVsForPrefix:(id)a3 interval:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createSelectedRoutesArrayForPrefix:](self, "createSelectedRoutesArrayForPrefix:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NRBabelInstance createUpdateTLVsForRoutes:interval:]( self,  "createUpdateTLVsForRoutes:interval:",  v6,  v4));

  return v7;
}

- (id)createUpdateTLVsForPrefix:(id)a3
{
  return -[NRBabelInstance createUpdateTLVsForPrefix:interval:]( self,  "createUpdateTLVsForPrefix:interval:",  a3,  0xFFFFLL);
}

- (id)createUpdateTLVsWithInterval:(unsigned __int16)a3
{
  return -[NRBabelInstance createUpdateTLVsForPrefix:interval:](self, "createUpdateTLVsForPrefix:interval:", 0LL, a3);
}

- (id)createUpdateTLVs
{
  return -[NRBabelInstance createUpdateTLVsWithInterval:](self, "createUpdateTLVsWithInterval:", 0xFFFFLL);
}

- (void)sendImmediateRouteUpdateToNeighbor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v23 = v4;
    id v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v23,  1LL));
  }

  else
  {
    id v6 = self->_neighbors;
  }

  id v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance createUpdateTLVs](self, "createUpdateTLVs"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v7;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (int i = 0LL; i != v11; int i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createIHUTLV", (void)v18));
        -[NSMutableArray addObject:](v15, "addObject:", v16);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 createPersonalHelloTLV]);
        -[NSMutableArray addObject:](v15, "addObject:", v17);

        -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v8);
        [v14 sendTLVs:v15];
        [v14 enqueueNextUpdate];
        [v14 enqueueNextIHU];
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v11);
  }
}

- (void)sendImmediateRouteUpdateToAllNeighbors
{
}

- (void)handlePacket:(const char *)a3 length:(unsigned int)a4 remoteAddr:(const in6_addr *)a5 localAddr:(const in6_addr *)a6 babelInterface:(id)a7 dtls:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = *(void *)&a4;
  id v14 = a7;
  id v15 = v14;
  if (v11 <= 3)
  {
    if (qword_1001DC8B0 != -1) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d %@packet too short len %u",  ",  "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]"",  3511LL,  self,  v11);
    }

    goto LABEL_212;
  }

  int v16 = !v8;
  unsigned int v17 = [v14 dtlsEnabled] & !v8;
  unsigned int v18 = *((unsigned __int16 *)a3 + 1);
  uint64_t v19 = __rev16(v18);
  if ((int)v19 + 2 > v11)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d %@Packet too short: bodyLen(%u) + 2 > packetLen(%u)",  ",  "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]"",  3520LL,  self,  v19,  v11);
      }

      goto LABEL_212;
    }

    goto LABEL_150;
  }

  uint64_t v20 = *(unsigned __int8 *)a3;
  if ((_DWORD)v20 != 42)
  {
    if ((v17 & 1) == 0)
    {
      if (qword_1001DC8B0 != -1) {
        dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
      }
      if (_NRLogIsLevelEnabled(qword_1001DC8A8, 16LL))
      {
        if (qword_1001DC8B0 != -1) {
          dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
        }
        _NRLogWithArgs( qword_1001DC8A8,  16LL,  "%s%.30s:%-4d %@Invalid magic number %u != %u",  ",  "-[NRBabelInstance handlePacket:length:remoteAddr:localAddr:babelInterface:dtls:]"",  3527LL,  self,  v20,  42LL);
      }

      goto LABEL_212;
    }

- (id)description
{
  id v3 = objc_alloc(&OBJC_CLASS___NSString);
  unint64_t routerID = self->_routerID;
  unint64_t v5 = bswap64(routerID);
  if (v5 > 0xFFFE)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    unsigned int v8 = bswap32(routerID);
    id v6 = -[NSString initWithFormat:]( v7,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v8),  (unsigned __int16)v8,  bswap32(HIDWORD(routerID)) >> 16,  __rev16(HIWORD(routerID)));
  }

  else
  {
    id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%llx>",  v5,  v12,  v13,  v14);
  }

  id v9 = v6;
  id v10 = -[NSString initWithFormat:](v3, "initWithFormat:", @"NRBabelInstance %@", v6);

  return v10;
}

- (id)copyRouteString
{
  id v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@\nInterfaces\n",  self);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance interfaces](self, "interfaces"));
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"\t%@\n",  *(void *)(*((void *)&v28 + 1) + 8LL * (void)v8));
        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v6);
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Neighbors\n");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance neighbors](self, "neighbors"));
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"\t%@\n",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v13));
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }

    while (v11);
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Routes\n");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRBabelInstance routes](self, "routes"));
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      unsigned int v18 = 0LL;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"\t%@\n",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v18));
        unsigned int v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }

    while (v16);
  }

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unsigned)nodeSeqno
{
  return self->_nodeSeqno;
}

- (void)setNodeSeqno:(unsigned __int16)a3
{
  self->_uint64_t nodeSeqno = a3;
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (void)setRouterID:(unint64_t)a3
{
  self->_unint64_t routerID = a3;
}

- (NSMutableArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
}

- (NSMutableArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSMutableArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (NSMutableArray)posrs
{
  return self->_posrs;
}

- (void)setPosrs:(id)a3
{
}

- (OS_nw_path_evaluator)ifBringupPathEvaluator
{
  return self->_ifBringupPathEvaluator;
}

- (void)setIfBringupPathEvaluator:(id)a3
{
}

- (NEVirtualInterface_s)nevi
{
  return self->_nevi;
}

- (void)setNevi:(NEVirtualInterface_s *)a3
{
  self->_nevint i = a3;
}

- (NSString)addrStr
{
  return self->_addrStr;
}

- (void)setAddrStr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end