@interface NRBabelInstanceFake
- (NRBabelInstanceFake)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (void)setName:(id)a3;
@end

@implementation NRBabelInstanceFake

- (NRBabelInstanceFake)initWithName:(id)a3
{
  p_class_meths = a3;
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NRBabelInstanceFake;
  v7 = -[NRBabelInstance init](&v29, "init");
  if (!v7)
  {
    id v22 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v22, 16LL);

    if (IsLevelEnabled)
    {
      id v24 = sub_1000B07C8();
      _NRLogWithArgs( v24,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelInstanceFake initWithName:]"",  3978);
    }

    id v6 = (id)_os_log_pack_size(12LL);
    v8 = (NRBabelInstanceFake *)((char *)&v28 - ((__chkstk_darwin(v6) + 15) & 0xFFFFFFFFFFFFFFF0LL));
    v25 = __error();
    uint64_t v26 = _os_log_pack_fill(v8, v6, *v25, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v26 = 136446210;
    *(void *)(v26 + 4) = "-[NRBabelInstanceFake initWithName:]";
    id v27 = sub_1000B07C8();
    _NRLogAbortWithPack(v27, v8);
    goto LABEL_16;
  }

  v8 = v7;
  p_name = &v7->_name;
  objc_storeStrong((id *)&v7->_name, p_class_meths);
  do
    unint64_t v9 = __ldxr(&qword_1001DBD38);
  while (__stxr(v9 + 1, &qword_1001DBD38));
  -[NRBabelInstance setRouterID:](v8, "setRouterID:", bswap64(v9));
  -[NRBabelInstance setNodeSeqno:](v8, "setNodeSeqno:", 0LL);
  p_class_meths = &OBJC_PROTOCOL___NRBTLinkPreferencesAgentDelegate.class_meths;
  if (qword_1001DC8B0 != -1) {
LABEL_16:
  }
    dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
  if (_NRLogIsLevelEnabled(qword_1001DC8A8, 1LL))
  {
    if (p_class_meths[278] != -1LL) {
      dispatch_once(&qword_1001DC8B0, &stru_1001AF1A0);
    }
    v10 = *p_name;
    id v11 = (id)qword_1001DC8A8;
    unint64_t v12 = -[NRBabelInstance routerID](v8, "routerID");
    unint64_t v13 = bswap64(v12);
    if (v13 > 0xFFFE)
    {
      unsigned int v15 = v12;
      unint64_t v16 = HIWORD(v12);
      unint64_t v17 = HIDWORD(v12);
      v18 = objc_alloc(&OBJC_CLASS___NSString);
      unsigned int v19 = bswap32(v15);
      v14 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"<%x:%x:%x:%x>",  HIWORD(v19),  (unsigned __int16)v19,  bswap32(v17) >> 16,  __rev16(v16));
    }

    else
    {
      v14 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"<%llx>", v13);
    }

    v20 = v14;
    _NRLogWithArgs( v11,  1LL,  "%s%.30s:%-4d created fake instance %@ with routerID %@",  ",  "-[NRBabelInstanceFake initWithName:]"",  3984LL,  v10,  v14);
  }

  return v8;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@} ",  self->_name);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end