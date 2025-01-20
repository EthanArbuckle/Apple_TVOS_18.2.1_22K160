@interface ThunderboltPacketDumper
- (BOOL)suppressed;
- (void)dumpATCConfigRegisterRead:(unsigned int)a3 value:(unsigned int)a4;
- (void)dumpATCConfigRegisterWrite:(unsigned int)a3 value:(unsigned int)a4;
- (void)dumpATCMetadataPacketType:(unsigned __int16)a3 metadata:(unsigned int)a4 opCode:(unsigned __int16)a5;
- (void)dumpATCMetadataRead:(unsigned int)a3 opCode:(unsigned __int16)a4;
- (void)dumpATCMetadataWrite:(unsigned int)a3 opCode:(unsigned __int16)a4;
- (void)dumpATCRegisterRead:(unsigned int)a3 value:(unsigned int)a4;
- (void)dumpATCRegisterWrite:(unsigned int)a3 value:(unsigned int)a4;
- (void)dumpATCRouterOperationWithOpCode:(unsigned __int16)a3 data:(id)a4;
- (void)dumpPacketType:(unsigned __int16)a3 data:(id)a4;
- (void)dumpRegisterOperation:(unsigned __int16)a3 registerNumber:(unsigned int)a4 value:(unsigned int)a5;
- (void)setSuppressed:(BOOL)a3;
@end

@implementation ThunderboltPacketDumper

- (void)dumpATCConfigRegisterRead:(unsigned int)a3 value:(unsigned int)a4
{
}

- (void)dumpATCConfigRegisterWrite:(unsigned int)a3 value:(unsigned int)a4
{
}

- (void)dumpATCRegisterRead:(unsigned int)a3 value:(unsigned int)a4
{
}

- (void)dumpATCRegisterWrite:(unsigned int)a3 value:(unsigned int)a4
{
}

- (void)dumpRegisterOperation:(unsigned __int16)a3 registerNumber:(unsigned int)a4 value:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  [MEMORY[0x189603FB8] data];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 appendLittleInt32:v6];
  [v9 appendLittleInt32:v5];
  -[ThunderboltPacketDumper dumpPacketType:data:](self, "dumpPacketType:data:", v7, v9);
}

- (void)dumpATCMetadataRead:(unsigned int)a3 opCode:(unsigned __int16)a4
{
}

- (void)dumpATCMetadataWrite:(unsigned int)a3 opCode:(unsigned __int16)a4
{
}

- (void)dumpATCMetadataPacketType:(unsigned __int16)a3 metadata:(unsigned int)a4 opCode:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  [MEMORY[0x189603FB8] data];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 appendLittleInt16:v5];
  [v9 appendLittleInt32:v6];
  -[ThunderboltPacketDumper dumpPacketType:data:](self, "dumpPacketType:data:", v7, v9);
}

- (void)dumpATCRouterOperationWithOpCode:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4 = a3;
  id v7 = a4;
  [MEMORY[0x189603FB8] data];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 appendLittleInt16:v4];
  if (v7) {
    [v6 appendData:v7];
  }
  -[ThunderboltPacketDumper dumpPacketType:data:](self, "dumpPacketType:data:", 2LL, v6);
}

- (void)dumpPacketType:(unsigned __int16)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_suppressed)
  {
    writeQueue = self->_writeQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__ThunderboltPacketDumper_dumpPacketType_data___block_invoke;
    block[3] = &unk_18A3C1550;
    unsigned __int16 v11 = a3;
    block[4] = self;
    id v10 = v6;
    dispatch_async((dispatch_queue_t)writeQueue, block);
  }
}

uint64_t __47__ThunderboltPacketDumper_dumpPacketType_data___block_invoke(uint64_t a1)
{
  v2[0] = 4;
  v2[1] = *(_WORD *)(a1 + 48);
  return [*(id *)(*(void *)(a1 + 32) + 8) dumpPacket:*(void *)(a1 + 40) type:6 metadata:v2 metadataLength:4];
}

- (BOOL)suppressed
{
  return self->_suppressed;
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
}

- (void).cxx_destruct
{
}

@end