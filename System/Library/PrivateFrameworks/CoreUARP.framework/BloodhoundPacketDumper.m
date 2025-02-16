@interface BloodhoundPacketDumper
- (BloodhoundPacketDumper)initWithDumper:(pcap_dumper *)a3;
- (BloodhoundPacketDumper)initWithFileName:(id)a3;
- (void)dealloc;
- (void)dumpPacket:(id)a3 type:(unsigned int)a4 metadata:(void *)a5 metadataLength:(unint64_t)a6;
@end

@implementation BloodhoundPacketDumper

- (BloodhoundPacketDumper)initWithFileName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___BloodhoundPacketDumper;
  v5 = -[BloodhoundPacketDumper init](&v12, sel_init);
  if (v5)
  {
    v6 = pcap_open_dead(157, 0x80000);
    v5->_pcap = v6;
    if (!v6
      || ([v4 stringByExpandingTildeInPath],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          fileName = v5->_fileName,
          v5->_fileName = (NSString *)v7,
          fileName,
          v9 = pcap_dump_open(v5->_pcap, -[NSString UTF8String](v5->_fileName, "UTF8String")),
          (v5->_dumper = v9) == 0LL))
    {
      v10 = 0LL;
      goto LABEL_7;
    }

    pcap_dump_flush(v9);
  }

  v10 = v5;
LABEL_7:

  return v10;
}

- (BloodhoundPacketDumper)initWithDumper:(pcap_dumper *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BloodhoundPacketDumper;
  result = -[BloodhoundPacketDumper init](&v5, sel_init);
  if (result)
  {
    result->_dumper = a3;
    result->_externalDumper = 1;
  }

  return result;
}

- (void)dealloc
{
  pcap = self->_pcap;
  if (pcap) {
    pcap_close(pcap);
  }
  dumper = self->_dumper;
  if (dumper && !self->_externalDumper) {
    pcap_dump_close(dumper);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BloodhoundPacketDumper;
  -[BloodhoundPacketDumper dealloc](&v5, sel_dealloc);
}

- (void)dumpPacket:(id)a3 type:(unsigned int)a4 metadata:(void *)a5 metadataLength:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  v11 = (void *)MEMORY[0x1895B7E8C]();
  [MEMORY[0x189603FB8] data];
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 appendLittleInt32:v8];
  if (a5) {
    [v12 appendBytes:a5 length:a6];
  }
  if (v10) {
    [v12 appendData:v10];
  }
  memset(&v15, 0, sizeof(v15));
  gettimeofday(&v15.ts, 0LL);
  v15.caplen = [v12 length];
  v15.len = [v12 length];
  dumper = self->_dumper;
  id v14 = v12;
  pcap_dump((u_char *)dumper, &v15, (const u_char *)[v14 bytes]);
  pcap_dump_flush(self->_dumper);

  objc_autoreleasePoolPop(v11);
}

- (void).cxx_destruct
{
}

@end