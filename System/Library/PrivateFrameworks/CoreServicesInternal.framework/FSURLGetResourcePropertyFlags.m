@interface FSURLGetResourcePropertyFlags
@end

@implementation FSURLGetResourcePropertyFlags

const void *___FSURLGetResourcePropertyFlags_block_invoke()
{
  if ((_ZGVZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable & 1) == 0)
  {
    uint64_t v3 = *MEMORY[0x1896053B8];
    _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable = 1LL;
    unk_18C5BA6A0 = v3;
    qword_18C5BA6A8 = 0LL;
    qword_18C5BA6B0 = 2LL;
    qword_18C5BA6B8 = *MEMORY[0x189605378];
    unk_18C5BA6C0 = 0LL;
    uint64_t v4 = *MEMORY[0x1896053C8];
    qword_18C5BA6C8 = 4LL;
    unk_18C5BA6D0 = v4;
    qword_18C5BA6D8 = 0LL;
    unk_18C5BA6E0 = 8LL;
    qword_18C5BA6E8 = *MEMORY[0x1896053E8];
    unk_18C5BA6F0 = 0LL;
    uint64_t v5 = *MEMORY[0x1896053A0];
    qword_18C5BA6F8 = 16LL;
    unk_18C5BA700 = v5;
    qword_18C5BA708 = 0LL;
    unk_18C5BA710 = 32LL;
    qword_18C5BA718 = *MEMORY[0x1896053D0];
    unk_18C5BA720 = 0LL;
    uint64_t v6 = *MEMORY[0x1896053E0];
    qword_18C5BA728 = 64LL;
    unk_18C5BA730 = v6;
    qword_18C5BA738 = 0LL;
    unk_18C5BA740 = 128LL;
    qword_18C5BA748 = *MEMORY[0x189605390];
    unk_18C5BA750 = 0LL;
    uint64_t v7 = *MEMORY[0x189605360];
    qword_18C5BA758 = 256LL;
    unk_18C5BA760 = v7;
    qword_18C5BA768 = 0LL;
    unk_18C5BA770 = 512LL;
    qword_18C5BA778 = *MEMORY[0x189605370];
    unk_18C5BA780 = 0LL;
    uint64_t v8 = *MEMORY[0x189604C48];
    qword_18C5BA788 = 1024LL;
    unk_18C5BA790 = v8;
    qword_18C5BA798 = 0LL;
    unk_18C5BA7A0 = 2048LL;
    qword_18C5BA7A8 = *MEMORY[0x189604BB8];
    unk_18C5BA7B0 = 0LL;
    uint64_t v9 = *MEMORY[0x1896053B0];
    qword_18C5BA7B8 = 4096LL;
    unk_18C5BA7C0 = v9;
    qword_18C5BA7C8 = 0LL;
    unk_18C5BA7D0 = 0x2000LL;
    qword_18C5BA7D8 = *MEMORY[0x1896053F0];
    unk_18C5BA7E0 = 0LL;
    uint64_t v10 = *MEMORY[0x189605388];
    qword_18C5BA7E8 = 0x4000LL;
    unk_18C5BA7F0 = v10;
    qword_18C5BA7F8 = 0LL;
    unk_18C5BA800 = 0x8000LL;
    qword_18C5BA808 = *MEMORY[0x189605368];
    unk_18C5BA810 = 0LL;
    uint64_t v11 = *MEMORY[0x189605398];
    qword_18C5BA818 = 0x10000LL;
    unk_18C5BA820 = v11;
    xmmword_18C5BA828 = 0u;
    unk_18C5BA838 = 0u;
    _ZGVZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable = 1;
  }

  _FSURLGetResourcePropertyFlags::maskToPropertyTable = (uint64_t)&_ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
  _FSURLGetResourcePropertyFlags::maskToPropertyTableCount = 1;
  v0 = &qword_18C5BA6B0;
  do
  {
    result = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, (const void *)*(v0 - 2));
    *(v0 - 1) = (uint64_t)result;
    uint64_t v2 = *v0;
    v0 += 3;
  }

  while (v2);
  return result;
}

@end