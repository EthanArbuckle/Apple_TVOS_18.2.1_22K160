@interface FSURLGetCatalogInfo
@end

@implementation FSURLGetCatalogInfo

const void *___FSURLGetCatalogInfo_block_invoke()
{
  if ((_ZGVZZ20_FSURLGetCatalogInfoEUb1_E8theTable & 1) == 0)
  {
    _ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable = 2;
    qword_18C5BA868 = *MEMORY[0x1896053E0];
    unk_18C5BA870 = 0LL;
    dword_18C5BA878 = 2;
    qword_18C5BA880 = *MEMORY[0x1896053D0];
    unk_18C5BA888 = 0LL;
    dword_18C5BA890 = 49154;
    qword_18C5BA898 = *MEMORY[0x189605378];
    unk_18C5BA8A0 = 0LL;
    dword_18C5BA8A8 = 2;
    qword_18C5BA8B0 = *MEMORY[0x189605408];
    unk_18C5BA8B8 = 0LL;
    dword_18C5BA8C0 = 2;
    qword_18C5BA8C8 = *MEMORY[0x189605398];
    unk_18C5BA8D0 = 0LL;
    dword_18C5BA8D8 = 8;
    qword_18C5BA8E0 = *MEMORY[0x189604CF0];
    unk_18C5BA8E8 = 0LL;
    dword_18C5BA8F0 = 24;
    qword_18C5BA8F8 = *MEMORY[0x189604C10];
    unk_18C5BA900 = 0LL;
    dword_18C5BA908 = 32;
    qword_18C5BA910 = *MEMORY[0x1896052B0];
    unk_18C5BA918 = 0LL;
    dword_18C5BA920 = 64;
    qword_18C5BA928 = *MEMORY[0x1896052A8];
    unk_18C5BA930 = 0LL;
    dword_18C5BA938 = 128;
    qword_18C5BA940 = *MEMORY[0x189605268];
    unk_18C5BA948 = 0LL;
    dword_18C5BA950 = 256;
    qword_18C5BA958 = *MEMORY[0x1896052A0];
    unk_18C5BA960 = 0LL;
    dword_18C5BA968 = 1024;
    qword_18C5BA970 = qword_18C5BA898;
    unk_18C5BA978 = 0LL;
    dword_18C5BA980 = 0x400000;
    qword_18C5BA988 = *MEMORY[0x189605338];
    unk_18C5BA990 = 0LL;
    dword_18C5BA998 = 268288;
    qword_18C5BA9A0 = *MEMORY[0x1896053C8];
    unk_18C5BA9A8 = 0LL;
    dword_18C5BA9B0 = 268288;
    qword_18C5BA9B8 = *MEMORY[0x189604C20];
    unk_18C5BA9C0 = 0LL;
    dword_18C5BA9C8 = 0x4000;
    qword_18C5BA9D0 = *MEMORY[0x189605340];
    unk_18C5BA9D8 = 0LL;
    dword_18C5BA9E0 = 0x4000;
    qword_18C5BA9E8 = *MEMORY[0x1896052C0];
    unk_18C5BA9F0 = 0LL;
    dword_18C5BA9F8 = 0x8000;
    qword_18C5BAA00 = *MEMORY[0x189604C18];
    unk_18C5BAA08 = 0LL;
    dword_18C5BAA10 = 0x8000;
    qword_18C5BAA18 = *MEMORY[0x189604C00];
    unk_18C5BAA20 = 0LL;
    dword_18C5BAA28 = 0x80000;
    qword_18C5BAA30 = *MEMORY[0x1896053B0];
    unk_18C5BAA38 = 0LL;
    dword_18C5BAA40 = 0x80000;
    qword_18C5BAA48 = *MEMORY[0x1896053F0];
    unk_18C5BAA50 = 0LL;
    dword_18C5BAA58 = 0x80000;
    qword_18C5BAA60 = *MEMORY[0x189605388];
    qword_18C5BAA68 = 0LL;
    dword_18C5BAA70 = 0x80000000;
    qword_18C5BAA78 = *MEMORY[0x189605438];
    qword_18C5BAA80 = 0LL;
    dword_18C5BAA88 = 0;
    qword_18C5BAA98 = 0LL;
    qword_18C5BAA90 = 0LL;
    _ZGVZZ20_FSURLGetCatalogInfoEUb1_E8theTable = 1;
  }

  _FSURLGetCatalogInfo::maskToPropertyTable = (uint64_t)&_ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable;
  v0 = &dword_18C5BA878;
  do
  {
    result = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, *((const void **)v0 - 2));
    *((void *)v0 - 1) = result;
    int v2 = *v0;
    v0 += 6;
  }

  while (v2);
  return result;
}

@end