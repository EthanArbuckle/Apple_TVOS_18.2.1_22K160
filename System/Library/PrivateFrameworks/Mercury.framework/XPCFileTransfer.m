@interface XPCFileTransfer
@end

@implementation XPCFileTransfer

void __XPCFileTransfer_open_block_invoke()
{
  v5[4] = *MEMORY[0x1895F89C8];
  uint64_t v0 = *MEMORY[0x189603BB8];
  v4[0] = *MEMORY[0x189603BD8];
  v4[1] = v0;
  v5[0] = &unk_18A22B448;
  v5[1] = &unk_18A22B460;
  uint64_t v1 = *MEMORY[0x189603BC8];
  v4[2] = *MEMORY[0x189603BC0];
  v4[3] = v1;
  v5[2] = &unk_18A22B478;
  v5[3] = &unk_18A22B490;
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v3 = (void *)XPCFileTransfer_open_protectionTypes;
  XPCFileTransfer_open_protectionTypes = v2;
}

@end