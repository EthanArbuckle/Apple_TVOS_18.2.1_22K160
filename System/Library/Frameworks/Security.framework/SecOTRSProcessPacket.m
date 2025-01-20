@interface SecOTRSProcessPacket
@end

@implementation SecOTRSProcessPacket

__n128 __SecOTRSProcessPacket_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __SecOTRSProcessPacket_block_invoke_2;
  v3[3] = &unk_1896732D8;
  __int128 v1 = *(_OWORD *)(a1 + 48);
  __int128 v4 = *(_OWORD *)(a1 + 32);
  __int128 v5 = v1;
  _os_activity_initiate(&dword_1804F4000, "OTR Process Packet", OS_ACTIVITY_FLAG_DEFAULT, v3);
  return result;
}

@end