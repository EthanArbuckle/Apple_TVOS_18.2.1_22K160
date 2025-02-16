@interface NWConcrete_nw_host_endpoint
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (const)domainForPolicy;
- (const)hostname;
- (id)copyDictionary;
- (id)copyEndpoint;
- (id)echConfig;
- (unint64_t)getHash;
- (unsigned)port;
- (unsigned)priority;
- (unsigned)type;
- (unsigned)weight;
- (void)dealloc;
- (void)setEchConfig:(id)a3;
- (void)setPriority:(unsigned __int16)a3;
- (void)setWeight:(unsigned __int16)a3;
@end

@implementation NWConcrete_nw_host_endpoint

- (unsigned)type
{
  return 2;
}

- (const)hostname
{
  return self->hostname;
}

- (unsigned)port
{
  return self->port;
}

- (id)copyEndpoint
{
  v3 = (id *)(id)nw_endpoint_create_host_with_numeric_port(self->hostname, bswap32(self->port) >> 16);
  objc_storeStrong(v3 + 31, self->ech_config);

  return v3;
}

- (char)createDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  hostname = self->hostname;
  v6 = (char *)nw_endpoint_copy_interface(self);
  if (v3)
  {
    v7 = __nwlog_salted_hostname_hash(self->hostname, (char *)&v17);
    hostname = __str;
    snprintf(__str, 0x12uLL, "%s%s", "Hostname#", v7);
  }

  v17 = 0LL;
  v8 = self;
  unsigned int alternate_port = v8->super.alternate_port;

  v10 = v6 + 104;
  unsigned int v11 = bswap32(v8->port) >> 16;
  v12 = "/";
  if (!alternate_port) {
    v12 = "";
  }
  unsigned int v13 = __rev16(alternate_port);
  v14 = "@";
  if (!v6)
  {
    v14 = "";
    v10 = "";
  }

  asprintf(&v17, "%s:%u%s%.0d%s%s", hostname, v11, v12, v13, v14, v10);
  v15 = v17;

  return v15;
}

- (unint64_t)getHash
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_SHA256_Update(&v7, &self->port, 2u);
  hostname = self->hostname;
  CC_LONG v4 = strlen(hostname);
  CC_SHA256_Update(&v7, hostname, v4);
  CC_SHA256_Final(md, &v7);
  int8x16_t v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (const)domainForPolicy
{
  return self->hostname;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v6 = (const char **)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_host_endpoint;
  BOOL v7 = -[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v9, sel_isEqualToEndpoint_matchFlags_, v6, v4)
    && !strcmp(self->hostname, v6[29])
    && self->port == *((unsigned __int16 *)v6 + 120);

  return v7;
}

- (void)dealloc
{
  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_host_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id)copyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_host_endpoint;
  id v3 = -[NWConcrete_nw_endpoint copyDictionary](&v8, sel_copyDictionary);
  objc_super v4 = v3;
  if (v3)
  {
    hostname = self->hostname;
    if (hostname) {
      xpc_dictionary_set_string(v3, "hostname", hostname);
    }
    xpc_dictionary_set_uint64(v4, "port", self->port);
    id v6 = v4;
  }

  return v4;
}

- (unsigned)priority
{
  return self->priority;
}

- (void)setPriority:(unsigned __int16)a3
{
  self->priority = a3;
}

- (unsigned)weight
{
  return self->weight;
}

- (void)setWeight:(unsigned __int16)a3
{
  self->weight = a3;
}

- (id)echConfig
{
  return self->ech_config;
}

- (void)setEchConfig:(id)a3
{
}

@end