@interface NRBabelLinkFake
- (NRBabelLinkFake)initWithName:(id)a3;
- (NSMutableArray)fakeInterfaces;
- (NSString)name;
- (unsigned)fakeLinkIndex;
- (void)setFakeInterfaces:(id)a3;
- (void)setFakeLinkIndex:(unsigned __int16)a3;
- (void)setName:(id)a3;
@end

@implementation NRBabelLinkFake

- (NRBabelLinkFake)initWithName:(id)a3
{
  v4 = (NSString *)a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NRBabelLinkFake;
  v5 = -[NRBabelLinkFake init](&v22, "init");
  if (!v5)
  {
    id v13 = sub_1000B07C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v13, 16LL);

    if (IsLevelEnabled)
    {
      id v15 = sub_1000B07C8();
      _NRLogWithArgs( v15,  16LL,  "%s%.30s:%-4d ABORTING: [super init] failed",  ",  "-[NRBabelLinkFake initWithName:]"",  3879);
    }

    uint64_t v16 = _os_log_pack_size(12LL);
    v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v18 = __error();
    uint64_t v19 = _os_log_pack_fill(v17, v16, *v18, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)uint64_t v19 = 136446210;
    *(void *)(v19 + 4) = "-[NRBabelLinkFake initWithName:]";
    id v20 = sub_1000B07C8();
    _NRLogAbortWithPack(v20, v17);
  }

  v6 = v5;
  name = v5->_name;
  v5->_name = v4;
  v8 = v4;

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  fakeInterfaces = v6->_fakeInterfaces;
  v6->_fakeInterfaces = v9;

  do
    unsigned __int16 v11 = __ldxr(word_1001DBD30);
  while (__stxr(v11 + 1, word_1001DBD30));
  v6->_fakeLinkIndex = v11;
  return v6;
}

- (NSMutableArray)fakeInterfaces
{
  return self->_fakeInterfaces;
}

- (void)setFakeInterfaces:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)fakeLinkIndex
{
  return self->_fakeLinkIndex;
}

- (void)setFakeLinkIndex:(unsigned __int16)a3
{
  self->_fakeLinkIndex = a3;
}

- (void).cxx_destruct
{
}

@end