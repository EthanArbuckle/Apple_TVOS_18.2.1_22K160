void sub_1001B49F0()
{
  JUMPOUT(0x1001B4958LL);
}

uint64_t sub_1001B4A00()
{
  STACK[0x4B0] = v0 + ((v1 + 309) | 1u) - 867;
  STACK[0x570] = (unint64_t)&STACK[0x5F8];
  STACK[0x578] = STACK[0x3C0];
  STACK[0x558] = (unint64_t)&STACK[0x5F8];
  int v2 = (v1 - 797673683) & 0x2F8B8CF7;
  STACK[0x370] = (unint64_t)&STACK[0x5F8];
  STACK[0x568] = (unint64_t)&STACK[0x5F8];
  STACK[0x580] = 0LL;
  v3 = malloc(0x404uLL);
  STACK[0x580] = (unint64_t)v3;
  v4 = malloc(0x408uLL);
  STACK[0x560] = (unint64_t)v4;
  if (v3) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  LODWORD(STACK[0x3C8]) = v2;
  return ((uint64_t (*)(void))((char *)*(&off_10025C670 + ((v6 * (v2 ^ 0x4E5)) ^ v1)) - 8))();
}

#error "1001BC0EC: call analysis failed (funcsize=5999)"
#error "1001BCA4C: call analysis failed (funcsize=370)"
void sub_1001BCA50()
{
  JUMPOUT(0x1001BC42CLL);
}

uint64_t sub_1001BCA58@<X0>( int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,int a58)
{
  unint64_t v61 = (v58 - 38);
  unint64_t v62 = (((unint64_t)(v59 + 0xF0E9D32C7201F8BLL) >> 30) ^ 0xFE6E2E9FFE9BFBEFLL)
      + v59
      + (((unint64_t)(v59 + 0xF0E9D32C7201F8BLL) >> 29) & 0x7FD37F7DELL);
  STACK[0x410] = v61;
  unint64_t v63 = ((((v61 ^ 0x10A06E92C884227ALL) + v62) >> 12) ^ 0xF7EF596FEFE7DFAELL)
      + v62
      + ((((v61 ^ 0x10A06E92C884227ALL) + v62) >> 11) & 0x1EB2DFDFCFBF5CLL);
  unint64_t v64 = v63
      + (((v63 + 0x18B11522D89C43EELL) >> 7) ^ 0x180900A808801C78LL)
      - (((v63 + 0x18B11522D89C43EELL) >> 6) & 0x3EDFEAFEEFFC70ELL)
      + 1;
  uint64_t v65 = v64 - ((2 * v64 + 0x15028F5A0384EEALL) & 0x35DD63827553F78ALL) + 0x1B96C63C0AC6233ALL;
  unint64_t v66 = ((2 * ((v65 ^ 0x1AEEB1C13AA9FBC5LL) + 0x288AB139EA2E5744LL)) & 0x95DF9DFE75A55FAELL)
      + (((v65 ^ 0x1AEEB1C13AA9FBC5LL) + 0x288AB139EA2E5744LL) ^ 0x4AEFCEFF3AD2AFD7LL);
  unint64_t v67 = v66
      + (((v66 - 0x4AEFCEFF3AD2AFD7LL) >> 24) ^ 0x9821A0008010C02BLL)
      - (((v66 - 0x4AEFCEFF3AD2AFD7LL) >> 23) & 0x1FEFFDE7FA8LL);
  unint64_t v68 = v67
      + (((v67 + 0x1CEE9100451C8FFELL) >> 13) ^ 0xC2040B8000000222LL)
      - (((v67 + 0x1CEE9100451C8FFELL) >> 12) & 0x7E8FFFFFFFBBALL);
  unint64_t v69 = v68
      + (((v68 + 0x5AEA8580451C8DDCLL) >> 5) ^ 0xB00A430304400D8LL)
      - (((v68 + 0x5AEA8580451C8DDCLL) >> 4) & 0x9FEB79F9F77FE4ELL)
      + 3;
  unint64_t v70 = v69 - ((2 * v69 + 0x1FD3C2A029B11A02LL) & 0x31D7AB6CFB6B2B8ALL) + 0x68D5B706928E22C6LL;
  unint64_t v71 = (v70 ^ 0x30FADBE77E1580E5LL)
      + ((v70 >> 31) ^ 0x9280A0016DF5B88DLL)
      + ((v70 >> 30) & 0x1E7FFE178LL ^ 0xFFFFFFFF3C149EE7LL)
      + 0x6D7F5FFEF3FFF0BELL;
  unint64_t v72 = (((((2 * v71) & 0xBCDFDFFD9EFFDED0LL) + (v71 ^ 0xDE6FEFFECF7FEF68LL) + 0x2190100130801098LL) >> 11) ^ 0x75DD37779EFD7FFALL)
      + ((2 * v71) & 0xBCDFDFFD9EFFDED0LL)
      + (v71 ^ 0xDE6FEFFECF7FEF68LL)
      + (((((2 * v71) & 0xBCDFDFFD9EFFDED0LL) + (v71 ^ 0xDE6FEFFECF7FEF68LL) + 0x2190100130801098LL) >> 10) & 0x3A6EEF3DFAFFF4LL);
  unint64_t v73 = (((v72 - 0x544D27766E7D6F62LL) >> 4) ^ 0x7E7F323CFFA7F77ALL)
      + v72
      + (((v72 - 0x544D27766E7D6F62LL) >> 3) & 0x1CFE6479FF4FEEF4LL)
      - 2
      * (((((v72 - 0x544D27766E7D6F62LL) >> 4) ^ 0x7E7F323CFFA7F77ALL)
        + v72
        + (((v72 - 0x544D27766E7D6F62LL) >> 3) & 0x1CFE6479FF4FEEF4LL)
        + 0x2D33A64C91DA9924LL) & 0x66C5DAC4086A2C7BLL ^ ((((v72 - 0x544D27766E7D6F62LL) >> 4) ^ 0x7E7F323CFFA7F77ALL)
                                                        + v72) & 1)
      + 0x13F981109A44C59ELL;
  unint64_t v74 = ((2 * ((v73 ^ 0xE6C5DAC4086A2C7ALL) + 0x1E4A8A832E7300A6LL)) & 0xFABBE3FCF6FD9FF6LL)
      + (((v73 ^ 0xE6C5DAC4086A2C7ALL) + 0x1E4A8A832E7300A6LL) ^ 0xFD5DF1FE7B7ECFFBLL);
  unint64_t v75 = v74
      + (((v74 + 0x2A20E0184813005LL) >> 30) ^ 0x81280E0E1024C20CLL)
      - (((v74 + 0x2A20E0184813005LL) >> 29) & 0x3DFB67BE6LL);
  unint64_t v76 = v75
      + (((v75 - 0x7E86000C8BA39207LL) >> 15) ^ 0x55BEBFBFF94F3B58LL)
      + (((v75 - 0x7E86000C8BA39207LL) >> 14) & 0x17F7FF29E76B0LL);
  unint64_t v77 = v76
      + (((v76 + 0x2BBB40337B0D32A1LL) >> 8) ^ 0x7FF7E7FFF2F52FDDLL)
      + (((v76 + 0x2BBB40337B0D32A1LL) >> 7) & 0x1EFCFFFE5EA5FBALL)
      + 1;
  unint64_t v78 = v77 - ((2 * v77 + 0x5786B06710300586LL) & 0xD20C52C5D9B1B224LL) - 0x6B367E698B0F242BLL;
  unint64_t v79 = ((2 * ((v78 ^ 0xE9062962ECD8D912LL) + 0x2C1E97BC5C429E81LL)) & 0xDB9CD8F0F5D3FDDCLL)
      + (((v78 ^ 0xE9062962ECD8D912LL) + 0x2C1E97BC5C429E81LL) ^ 0xEDCE6C787AE9FEEELL);
  unint64_t v80 = (((v79 + 0x1231938785160112LL) >> 27) ^ 0xFFD3FEF0FFFF6BFDLL)
      + v79
      + (((v79 + 0x1231938785160112LL) >> 26) & 0x21FFFED7FALL);
  unint64_t v81 = (((v80 + 0x125D949685169515LL) >> 15) ^ 0x757F6665C9AADBDELL)
      + v80
      + (((v80 + 0x125D949685169515LL) >> 14) & 0x2CCCB9355B7BCLL);
  unint64_t v82 = (((v81 - 0x6321D1CF449446C9LL) >> 8) ^ 0x5F8DF6E6F8EB7FFFLL)
      + v81
      + (((v81 - 0x6321D1CF449446C9LL) >> 7) & 0x11BEDCDF1D6FFFELL);
  unint64_t v83 = v82 - ((2 * v82 + 0x7AA06E9385007270LL) & 0xA29A32E93F6945FELL) + 0xE9D50BE6234DC37LL;
  uint64_t v84 = (v83 ^ 0x4D5C9CD333CB726FLL)
      + ((v83 >> 30) ^ 0x7BECEEEEB8348C3FLL)
      + ((v83 >> 29) & 0x71A8DFEE6LL ^ 0x20A84E680LL)
      - 0x7BECEEEF8D46FF73LL;
  unint64_t v85 = (((((2 * v84) & 0x77EFFEEB36EBE3DELL) + (v84 ^ 0xBBF7FF759B75F1EFLL) + 0x4408008A648A0E11LL) >> 8) ^ 0x29EFFFEB9DFFFF6FLL)
      + ((2 * v84) & 0x77EFFEEB36EBE3DELL)
      + (v84 ^ 0xBBF7FF759B75F1EFLL)
      + (((((2 * v84) & 0x77EFFEEB36EBE3DELL) + (v84 ^ 0xBBF7FF759B75F1EFLL) + 0x4408008A648A0E11LL) >> 7) & 0x1DFFFD73BFFFEDELL);
  unint64_t v86 = v85
      + (((v85 + 0x1A18009EC68A0EA2LL) >> 8) ^ 0x90504C00CC8A4311LL)
      - (((v85 + 0x1A18009EC68A0EA2LL) >> 7) & 0x15F67FE66EB79DCLL)
      + 1;
  uint64_t v87 = v86 - ((2 * v86 + 0x138F693BF3FF9720LL) & 0x578D747A9FF50A8ELL) + 0x358E6EDB49FA50D7LL;
  unint64_t v88 = ((2 * ((v87 ^ 0xABC6BA3D4FFA8547LL) + 0x75D572E7727DD82LL)) & 0xBA96FFED91FFA5B2LL)
      + (((v87 ^ 0xABC6BA3D4FFA8547LL) + 0x75D572E7727DD82LL) ^ 0x5D4B7FF6C8FFD2D9LL);
  unint64_t v89 = v88
      + (((v88 - 0x5D4B7FF6C8FFD2D9LL) >> 30) ^ 0x96E087A00025AA82LL)
      - (((v88 - 0x5D4B7FF6C8FFD2D9LL) >> 29) & 0x7FFB4AAFALL);
  unint64_t v90 = v89
      + (((v89 + 0xBD3F86936DA82A5LL) >> 9) ^ 0xB0A4A2003801012ALL)
      - (((v89 + 0xBD3F86936DA82A5LL) >> 8) & 0xB6BBFF8FFDFDAALL);
  unint64_t v91 = v90
      + (((v90 + 0x5B2F5668FED9817BLL) >> 7) ^ 0xEFFFAFAE7BCFEFF9LL)
      + (((v90 + 0x5B2F5668FED9817BLL) >> 6) & 0x3FF5F5CF79FDFF2LL);
  uint64_t v92 = v91 + 2 - 2 * ((v91 + 0x6B2FA6BA83099182LL) & 0x6294E59219C768E6LL ^ (v91 + 2) & 4) + 0x4DC48C4C9CD0FA62LL;
  unint64_t v93 = ((2 * ((v92 ^ 0xE294E59219C768E2LL) + 0x20226CA5EA003BB7LL)) & 0xF3DFDBE3FE7A9D9ELL)
      + (((v92 ^ 0xE294E59219C768E2LL) + 0x20226CA5EA003BB7LL) ^ 0x79EFEDF1FF3D4ECFLL);
  unint64_t v94 = v93
      + (((v93 - 0x79EFEDF1FF3D4ECFLL) >> 27) ^ 0x6604004223B28280LL)
      - (((v93 - 0x79EFEDF1FF3D4ECFLL) >> 26) & 0x3BB89AFAFELL);
  unint64_t v95 = v94
      + (((v94 + 0x200C11CBDD102EB1LL) >> 13) ^ 0xB6F273BDF5DFBFF7LL)
      + (((v94 + 0x200C11CBDD102EB1LL) >> 12) & 0x4E77BEBBF7FEELL);
  unint64_t v96 = v95
      + (((v95 + 0x69199E0DE7306EBALL) >> 4) ^ 0xBF66D1BFAFFADEDALL)
      + (((v95 + 0x69199E0DE7306EBALL) >> 3) & 0x1ECDA37F5FF5BDB4LL)
      + 1;
  unint64_t v97 = v96 - 0x317AAC943273F5B4LL + (~(2 * v96 + 0x5365989C6E6B1FBELL) | 0xB65AF1C4D3530B27LL);
  uint64_t v98 = (v97 ^ 0x56B52555E9BC8523LL)
      + ((v97 >> 26) ^ 0x1DCFF83AC7E7FF95LL)
      + ((v97 >> 25) & 0x5ED55D55DELL ^ 0xA501000D4LL)
      - 0x1DCFF82F6AAEAAEFLL;
  unint64_t v99 = ((2 * v98) & 0xFE7BA05F9FBDFDF6LL)
      + (v98 ^ 0xFF3DD02FCFDEFEFBLL)
      + (((((2 * v98) & 0xFE7BA05F9FBDFDF6LL) + (v98 ^ 0xFF3DD02FCFDEFEFBLL) + 0xC22FD030210105LL) >> 15) ^ 0x405507010100C830LL)
      - (((((2 * v98) & 0xFE7BA05F9FBDFDF6LL) + (v98 ^ 0xFF3DD02FCFDEFEFBLL) + 0xC22FD030210105LL) >> 14) & 0x1F1FDFDFE6F9ELL);
  int v100 = ((v99 - 0x3F92D730D0DFC72BLL) >> 6) - (((v99 - 0x3F92D730D0DFC72BLL) >> 5) & 0xEAC95A52) + 1969532201;
  LODWORD(v99) = ((2 * (v99 + 790640853)) & 0xEF6FF76E)
               + ((v99 + 790640853) ^ 0xF7B7FBB7)
               + (v100 ^ 0xD3843A33)
               + ((2 * v100) & 0xB23ED1CA ^ 0x5DF7AFBD);
  int v101 = v87 ^ v73 ^ a2 ^ (v99 - 2 * ((v99 + 1634168112) & 0x7033CDFE ^ v99 & 8) + 1369127718);
  int v102 = ((v101 + 1) & 7) - ((2 * (v101 + 1)) & 8) - 1474096964;
  LODWORD(STACK[0x2A4]) = v102;
  unint64_t v103 = v102 ^ 0xA82310BC;
  int v104 = v101 & 7;
  uint64_t v105 = 255LL;
  if (v104 == 7) {
    uint64_t v105 = 0LL;
  }
  STACK[0x3F0] = v103;
  uint64_t v106 = v105 << v103;
  int v107 = (v105 << v103) + 1956350720;
  unsigned int v108 = (v107 ^ 0x1C72F5AF)
       + ((2 * v107) & 0xD1D2FD5E ^ 0xC1121400)
       - 1760132783
       + ((((2 * v107) ^ 0xE9371600) - 2 * (((2 * v107) ^ 0xE9371600) & 0xADBFCF4 ^ (2 * v107) & 4) + 182189297) ^ 0xF524030E);
  unsigned int v109 = (v108 ^ 0x6F91BBFF) - 1871821823 + ((2 * v108) & 0xDF2377FE);
  LODWORD(STACK[0x260]) = v104;
  if (v104 == 7) {
    unsigned int v110 = 0;
  }
  else {
    unsigned int v110 = v109;
  }
  BOOL v111 = LODWORD(STACK[0x3D8]) == -555873442;
  int v112 = STACK[0x3A0];
  if (LODWORD(STACK[0x3D8]) != -555873442) {
    int v112 = STACK[0x398];
  }
  LODWORD(STACK[0x248]) = v112;
  int v113 = STACK[0x380];
  if (v111) {
    int v113 = STACK[0x31C];
  }
  LODWORD(STACK[0x2DC]) = v113;
  int v114 = STACK[0x2E0];
  if (v111) {
    int v114 = STACK[0x25C];
  }
  LODWORD(STACK[0x2E0]) = v114;
  int v115 = STACK[0x318];
  if (!v111) {
    int v115 = STACK[0x2D8];
  }
  LODWORD(STACK[0x2D8]) = v115;
  int v116 = STACK[0x2D4];
  if (!v111) {
    int v116 = STACK[0x2D0];
  }
  LODWORD(STACK[0x2D4]) = v116;
  if ((STACK[0x290] & 1) != 0) {
    a58 = a57;
  }
  unsigned int v118 = v78 ^ v65 ^ v60 ^ v92;
  unsigned int v119 = v83 ^ v70 ^ a1 ^ v97;
  int v120 = ((v106 & 4) + (v106 ^ 0x67) - ((v106 ^ 0x67) & 4) - 1850687744) ^ 0x99B5B501;
  int v121 = (((2 * v120) & 0xFEA6) - v120 + 149389484) ^ 0xE28ACE;
  unsigned int v122 = 16843009 * v121 - ((33686018 * v121) & 0xEFE149F6) + 2012259579;
  LODWORD(STACK[0x318]) = v101;
  int v123 = ((v110 & (v118 ^ 0x77)) - ((2 * (v110 & (v118 ^ 0x77))) & 0xA4) - 46) ^ 0x581532D0;
  unsigned int v124 = v123
       + (((v110 & (v118 ^ 0x7A502977)) - ((2 * (v110 & (v118 ^ 0x7A502977))) & 0xA4) + 466) & 0x64 ^ 0xA1684524)
       - (v123 & 0x48113264);
  unsigned int v125 = (((2 * ((v118 ^ BYTE1(v118) ^ BYTE2(v118)) ^ 0xCD0080A2)) | 0x2AF2AC16)
  int v126 = 16843009 * v125 - ((33686018 * v125) & 0xE821BEA) + 121703925;
  int v127 = ((v119 ^ (v119 >> 8) ^ HIWORD(v119)) & 0xDA ^ 0xCB) - ((v119 ^ (v119 >> 8) ^ HIWORD(v119)) & 0x25) + 1784427812;
  int v128 = ((v127 & 0x6F7 ^ 0x10833AD2) + (v127 & 0x108 ^ 0x20004101) - 1) ^ HIBYTE(v119) ^ 0x30837E29;
  int v129 = (1
        - *(void *)(STACK[0x568]
                                     + 8LL
                                     * ((*(void *)(STACK[0x568]
                                                   + 8
                                                   * (*(void *)(STACK[0x568]
                                                                + 8LL * ((*(_DWORD *)STACK[0x568] & 1) == 0)) & 1LL)) & 1) == 0))) & 1;
  LODWORD(STACK[0x204]) = (2 * v118) & 0xFFDF6FEE ^ 0xAECA6362;
  LODWORD(STACK[0x398]) = 33686018 * (v118 & 0x7F ^ 0x31);
  LODWORD(STACK[0x3A0]) = v124 ^ v122;
  LODWORD(STACK[0x25C]) = v126;
  LODWORD(STACK[0x2B4]) = ((~(33686018 * v128) | 0x5A25AE6F) + 16843009 * v128 - 756209463) ^ v126;
  LODWORD(STACK[0x290]) = v119 ^ 0x55570C3;
  LODWORD(STACK[0x380]) = a58;
  LODWORD(STACK[0x288]) = (((2 * (v101 & 0xFFFFFFF8 ^ 0x66D24E38)) & 0x70063300)
                         - (v101 & 0xFFFFFFF8 ^ 0x66D24E38)
                         - 939727236) ^ 0x9EF8F7CC;
  return sub_10018E3D0(1289548841, (v129 ^ 0x7EFDDF3Bu) + 2 * v129, 1002);
}

uint64_t sub_1001BDD04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(STACK[0x3F8] + (v9 - 223257225)) = v8 ^ 0x4D ^ *(_BYTE *)(a8 + ((v9 - 223257225) & 0xFLL)) ^ *(_BYTE *)(((v9 - 223257225) & 0xFLL) + a3 + 6) ^ *(_BYTE *)(a7 + (((_BYTE)v9 + 119) & 0xF)) ^ (75 * ((v9 + 119) & 0xF)) ^ 0x28;
  return ((uint64_t (*)(void))*(&off_10025C670 + ((138 * (v9 == v10 + 223257224)) ^ v8)))();
}

void sub_1001BDD88()
{
}

uint64_t sub_1001BDD90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * ((1557 * (v8 + 8 == (((v9 ^ 0x8D1) + 1123 + a8) ^ (183 * (v9 ^ 0x8D1))))) ^ v9 ^ 0x9CA))
                            - 4LL))();
}

uint64_t sub_1001BDDD8(uint64_t a1, uint64_t a2)
{
  LODWORD(STACK[0x400]) = v3;
  STACK[0x588] = 0x3D5E81B9A4563166LL;
  LODWORD(STACK[0x504]) = dword_100273C38 - 1227344546;
  uint64_t v5 = dword_100273C40;
  unint64_t v6 = 1856021207
     * ((((v4 - 152) | 0x8A6AD391298A1BEDLL) - (v4 - 152) + ((v4 - 152) & 0x75952C6ED675E410LL)) ^ 0x677E440A67E3CD13LL);
  *(_DWORD *)(v4 - 140) = v2 + 1877625409 + v6;
  *(_DWORD *)(v4 - 120) = v6 + v2 + 1123495930;
  *(_DWORD *)(v4 - 116) = v6;
  *(void *)(v4 - 136) = v5 - v6;
  *(void *)(v4 - 128) = v6 ^ 0x3E9237D6;
  *(_DWORD *)(v4 - 148) = (v2 + 1877625423) ^ v6;
  *(_DWORD *)(v4 - 144) = v6 ^ (v2 + 1877625409) ^ 0x53;
  uint64_t v8 = sub_1001DD4A8(v4 - 152);
  return ((uint64_t (*)(uint64_t))(*(void *)(a2 + 8LL * *(int *)(v4 - 152)) - 8LL))(v8);
}

uint64_t sub_1001BDEDC()
{
  int v0 = (LODWORD(STACK[0x40C]) - 1638) | 0x202;
  STACK[0x410] = (unint64_t)malloc(STACK[0x3F8]);
  uint32_t v1 = arc4random();
  unsigned int v2 = (v0 ^ 0x1D5D67F0) + v1 - ((2 * v1) & 0x3ABACBF6);
  LODWORD(xmmword_100273C44) = v2;
  DWORD1(xmmword_100273C44) = ((1812433253 * (v2 ^ 0x1D5D65FB ^ (v2 >> 30))) ^ 0x3F3F5CAD)
                            + ((1477382858 * (v2 ^ 0x1D5D65FB ^ (v2 >> 30))) & 0x7E7EB95A)
                            - 568456881
                            - ((((v0 + 460442091) & 0xE48E3659 ^ 0x1D360B5E)
                              + 2
                              * (((1812433253 * (v2 ^ 0x1D5D65FB ^ (v2 >> 30))) ^ 0x3F3F5CAD)
                               + ((1477382858 * (v2 ^ 0x1D5D65FB ^ (v2 >> 30))) & 0x7E7EB95A))
                              + 608910746) & 0x3ABACBF6);
  return ((uint64_t (*)(void))((char *)*(&off_10025C670 + v0) - 8))();
}

void sub_1001BE024()
{
}

uint64_t sub_1001BE040()
{
  int v1 = LODWORD(STACK[0x40C]) ^ 0x2A9;
  unsigned int v2 = (const float *)&xmmword_100273C44;
  int8x16_t v3 = (int8x16_t)vld1q_dup_f32(v2);
  v4.i64[0] = 0x8000000080000000LL;
  v4.i64[1] = 0x8000000080000000LL;
  int32x4_t v5 = vdupq_n_s32(0x64DC6F31u);
  v0.i64[0] = *(void *)((char *)&xmmword_100273C44 + 4);
  v0.i32[2] = HIDWORD(xmmword_100273C44);
  int8x16_t v6 = vextq_s8(v3, v0, 0xCuLL);
  int8x16_t v7 = v0;
  v7.i32[3] = dword_100273C54[0];
  int8x16_t v8 = vandq_s8(v6, v4);
  int32x4_t v9 = (int32x4_t)veorq_s8(vandq_s8(v7, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x1CB35CF4u));
  int8x16_t v10 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v9, v9), (int8x16_t)vdupq_n_s32(0xA321E24E)),  v9),  vdupq_n_s32(0x2E6F0ED9u)),  (int8x16_t)vdupq_n_s32(0xD070D921));
  int32x4_t v11 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v10, (int8x16_t)vdupq_n_s32(0x9B2390CE)),  (int32x4_t)vorrq_s8(v10, (int8x16_t)v5)),  v5),  (int8x16_t)vdupq_n_s32(0x9B2D81C6));
  v12.i32[0] = *((_DWORD *)&STACK[0x588] + (DWORD1(xmmword_100273C44) & (LODWORD(STACK[0x40C]) ^ 0x66Eu) ^ 1LL));
  v12.i32[1] = *((_DWORD *)&STACK[0x588] + ((BYTE8(xmmword_100273C44) & 1) == 0));
  v12.i32[2] = *((_DWORD *)&STACK[0x588] + (~HIDWORD(xmmword_100273C44) & 1LL));
  v12.i32[3] = *((_DWORD *)&STACK[0x588] + ((dword_100273C54[0] & 1) == 0));
  xmmword_100273C44 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_100274278, v12),  (int8x16_t)vdupq_n_s32(0x99F82E0A)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)v11, v8),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v11, v11),  (int8x16_t)vdupq_n_s32(0xF6B87DB0))),  vdupq_n_s32(0x7B5C3ED8u)),  1uLL));
  return ((uint64_t (*)(void))((char *)*(&off_10025C670 + (v1 ^ 0x10C)) - 8))();
}

uint64_t sub_1001BEA8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  v14 = (unsigned int *)(a7 + 4 * (v9 + v11));
  int v15 = (((v8 - 1015) | 0x36) ^ (a8 + 251)) & v10;
  uint64_t v16 = v9 + 1;
  int v17 = *(_DWORD *)(a7 + 4 * (v16 + v11));
  unsigned int v18 = (((2 * (v17 & 0x7FFFFFFE ^ 0x1CB35CF4)) | 0xA321E24E) - (v17 & 0x7FFFFFFE ^ 0x1CB35CF4) + 779030233) ^ 0xD070D921;
  unsigned int v19 = (v13 - (v18 | v13) + (v18 | 0x9B2390CE)) ^ 0x9B2D81C6;
  unsigned int *v14 = v14[397] ^ *((_DWORD *)&STACK[0x588] + ((v17 & 1) == 0)) ^ (((v19 | v15) - ((2 * v19) & 0xF6B87DB0) + 2069642968) >> 1) ^ 0x99F82E0A;
  return ((uint64_t (*)(void))(*(void *)(a6 + 8LL * ((113 * (v16 != v12 + 3)) ^ v8)) - 8LL))();
}

uint64_t sub_1001BEB84@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  int8x16_t v4 = &flt_100273FD0;
  int v5 = (a2 - 113) | 0x58;
  int8x16_t v6 = (int8x16_t)vld1q_dup_f32(v4);
  v7.i64[0] = 0x8000000080000000LL;
  v7.i64[1] = 0x8000000080000000LL;
  v8.i64[0] = -1LL;
  v8.i64[1] = -1LL;
  v9.i64[0] = 0x8000000080000000LL;
  v9.i64[1] = 0x8000000080000000LL;
  v3.i64[0] = *(void *)&dword_100273FD4;
  v3.i32[2] = dword_100273FDC;
  int8x16_t v10 = vextq_s8(v6, v3, 0xCuLL);
  int8x16_t v11 = v3;
  v11.i32[3] = dword_100273FE0;
  int8x16_t v12 = (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32((int32x4_t)vorrq_s8(v10, v7), vdupq_n_s32(0x8FE54F9F)),  (int8x16_t)vdupq_n_s32(0x115E33E0u)),  vdupq_n_s32(0xF2A3D0F0));
  int32x4_t v13 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( vandq_s8(v11, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)),  (int8x16_t)vdupq_n_s32(0x2D83F385u)),  v8),  (int8x16_t)vdupq_n_s32(0x38DF967Du));
  int32x4_t v14 = (int32x4_t)veorq_s8( vorrq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v13, v13),  (int8x16_t)vdupq_n_s32(0x1142D520u)),  v13),  vdupq_n_s32(0x775E956Fu)),  vandq_s8(v12, v9)),  (int8x16_t)vdupq_n_s32(0x7F5F956Cu));
  v15.i32[0] = *(_DWORD *)(v2 + 4LL * ((dword_100273FD4 & 1) == 0));
  v15.i32[1] = *(_DWORD *)(v2 + 4 * (unk_100273FD8 & ((v5 ^ 0x25u) - 247) ^ 1LL));
  v15.i32[2] = *(_DWORD *)(v2 + 4 * (~dword_100273FDC & 1LL));
  v15.i32[3] = *(_DWORD *)(v2 + 4LL * ((dword_100273FE0 & 1) == 0));
  *(int8x16_t *)&flt_100273FD0 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_100273C44, v15),  (int8x16_t)vdupq_n_s32(0xF6D7371D)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v14,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v14, v14),  (int8x16_t)vdupq_n_s32(0x4A0419EEu))),  vdupq_n_s32(0xA5020CF7)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (v5 ^ 0x2B)) - 8LL))();
}

void sub_1001BED30()
{
}

uint64_t sub_1001BED3C@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  int v2 = ((a2 + 489766663) & 0xE2CEC66F ^ 0x1F5637B5 ^ xmmword_100273C44 & 0x7FFFFFFE | 0x7F45FCE0)
     - ((a2 + 489766663) & 0xE2CEC66F ^ 0x1F5637B5 ^ xmmword_100273C44 & 0x7FFFFFFE | 0x80BA031F)
     - 2135293153;
  dword_100274600 = dword_100274274 ^ *((_DWORD *)&STACK[0x588] + ((xmmword_100273C44 & 1) == 0)) ^ ((((v2 | dword_100274600 & 0x80000000) ^ 0x7D4EA8C0) - 2 * (((v2 | dword_100274600 & 0x80000000) ^ 0x7D4EA8C0) & 0x2D0921F3 ^ v2 & 2) - 1391910415) >> 1) ^ 0xF2D2A19E;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((1742 * (LODWORD(STACK[0x504]) > 0x26F)) ^ a2)) - 8LL))();
}

uint64_t sub_1001BEE24()
{
  LODWORD(STACK[0x504]) = 0;
  int v2 = LODWORD(STACK[0x504])++;
  dword_100273C38 = v2 + 1227344547;
  uint64_t v3 = (dword_100273C40 + 260423849);
  unint64_t v4 = 1606104089
     * ((~((v1 - 152) ^ 0x9AF036D0EEA70D4BLL | 0xD7C1FE4EC6377693LL)
       + (((v1 - 152) ^ 0x9AF036D0EEA70D4BLL) & 0xD7C1FE4EC6377693LL)) ^ 0x7070CC55A278C619LL);
  *(_DWORD *)(v1 - 132) = ((v0 + 1651105345) | 0xB) + v4;
  *(_DWORD *)(v1 - 128) = (v0 + 1651105345) ^ v4;
  *(_DWORD *)(v1 - 124) = -1231242029 - v4 + v0;
  *(void *)(v1 - 120) = 1310193791 - v4;
  *(void *)(v1 - 152) = v3 + v4;
  *(_DWORD *)(v1 - 140) = v4;
  *(_DWORD *)(v1 - 136) = ((v0 + 1651105345) | 0x43) ^ v4;
  uint64_t v5 = sub_10013ACFC(v1 - 152);
  return ((uint64_t (*)(uint64_t))((char *)*(&off_10025C670 + *(int *)(v1 - 144)) - 12))(v5);
}

uint64_t sub_1001BEF44(uint64_t a1)
{
  if (v1 >= v2) {
    int v3 = dword_100273C40 + 1;
  }
  else {
    int v3 = 1049769942;
  }
  dword_100273C40 = v3;
  return sub_1001BF0D8(a1, &off_10025C670, STACK[0x3C0], &unk_1002124B0, &unk_100238B80, &unk_10021A9A0, 2773670916LL);
}

uint64_t sub_1001BF0D8@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, int a7@<W8>)
{
  *(_BYTE *)(a2 + (v10 - 39027169)) = (((a7 ^ 0x4CC ^ a6 ^ v8) >> (v7 + 44))
                                                   + ((2 * a7) ^ 0xEA)
                                                   - ((2 * ((a7 ^ 0x4CC ^ a6 ^ v8) >> (v7 + 44))) & 0x4A)
                                                   - 13) ^ 0x98;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((232
                                          * (v10
}

uint64_t sub_1001BF184(uint64_t a1, uint64_t a2)
{
  STACK[0x4B0] = STACK[0x3E0];
  STACK[0x4A8] = v2;
  STACK[0x4D8] = STACK[0x410];
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * (int)(((STACK[0x5D8] == 0)
                                               * ((((v3 + 1164289615) ^ 0x4565A080) - 98) ^ (v3 + 1164289615) & 0xBA9A5F7F)) ^ v3))
                            - 8LL))();
}

uint64_t ZyNF2D9(uint64_t a1)
{
  unint64_t v1 = 941074649
     * ((((unint64_t)&v3 | 0x6B6B37162FCDE1F4LL) - ((unint64_t)&v3 & 0x6B6B37162FCDE1F4LL)) ^ 0x6AEDD0F42F052E90LL);
  int v6 = -804802556 - v1;
  unint64_t v4 = (char *)&loc_1001DD71C + v1 - 4;
  uint64_t v5 = a1;
  sub_1001DD5F8((uint64_t)&v3);
  return v3;
}

uint64_t NAAB(uint64_t a1, int a2)
{
  v3[0] = &loc_10018B704;
  v3[1] = a1;
  int v4 = a2;
  unsigned int v5 = (230600693
      * ((-568580562 - ((&vars0 - 32) | 0xDE1C262E) + ((&vars0 - 32) | 0x21E3D9D1)) ^ 0xF3DF5FFA)) ^ 0x54F58F50;
  int v6 = v3;
  sub_10018B614((uint64_t)&v5);
  return v7;
}

uint64_t qSCskg(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = &loc_10018B790;
  v8[1] = a1;
  int v9 = a3;
  v8[2] = a2;
  v8[3] = a4;
  uint64_t v10 = a5;
  uint64_t v11 = a6;
  uint64_t v12 = a7;
  unsigned int v13 = (230600693
       * ((((&vars0 - 32) | 0x4099155E) - ((&vars0 - 32) & 0x4099155E)) ^ 0x92A59375)) ^ 0x54F58F50;
  int32x4_t v14 = v8;
  sub_10018B614((uint64_t)&v13);
  return v15;
}

void sub_1001BF444(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 64) + 1448877107 * (a1 ^ 0x713B1D2A);
  uint64_t v2 = *(void *)(a1 + 16);
  unsigned int v3 = (char *)malloc(0x5400uLL);
  *(void *)(v2 - 0xD8BCE74F8520811LL) = v3 + 0x657CD3A60B29129ALL;
  __asm { BR              X9 }

uint64_t sub_1001BF544@<X0>( uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  unsigned int v15 = *(_DWORD *)a13 + v13;
  unsigned int v16 = *(_DWORD *)(a13 + 4) - v13;
  uint64_t v17 = *(unsigned int *)(a13 + 80);
  uint64_t v18 = *(_DWORD *)(a13 + 32) ^ v13;
  *(_DWORD *)(*(void *)(a13 + 56) - 0x22D5632E44FD0F20LL) = 1461298233;
  BOOL v22 = (_DWORD)v17 - v13 == 41966271
     || (_DWORD)v18 == ((a7 - 1628029673) & 0x6109C2EE) + 1565069750
     || v16 == 1598548755
     || v15 == 1517882953;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 + 8LL * ((v22 * (a7 - 612)) ^ a7)) - 8LL))( v18,  a1,  v17,  a2,  a3,  a4,  a5,  a6,  a8,  a9,  a10);
}

uint64_t sub_1001BF5F8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  int v14 = a7 + 859;
  uint64_t v15 = a13[9];
  uint64_t v16 = a13[5];
  BOOL v20 = v15 == 0x59E3FCAF6574EC77LL
     || a13[6] == 0x5A78D2218AD9E2ALL
     || v16 == 0x54BD9D2603AA26EDLL
     || a13[3] == 0x4378B8CC4843E522LL;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8LL * ((v20 * ((v14 - 1260294922) & 0x4B1E8FB4 ^ (v14 - 1184))) ^ v14)))( a1,  v15,  a2,  v16,  a3,  a4,  a5,  a6,  a8,  a9,  a10);
}

void sub_1001BF6AC()
{
  *(_DWORD *)(v1 + 8) = v0;
}

uint64_t sub_1001BF6F8( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  HIDWORD(a11) = a1;
  HIDWORD(a9) = v58;
  int v63 = v55 + v56 + 419;
  unsigned int v64 = ((((*(unsigned __int8 *)(v61 - 0x4378B8CC4843E466LL) ^ 0x5E)
  unsigned int v65 = ((((*(unsigned __int8 *)(v61 - 0x4378B8CC4843E38DLL) ^ 0x5E)
  unsigned int v66 = (v65 - ((2 * v65) & 0x46359400) + 588958270) ^ 0x231ACA3E | (v64 + 2140439020 + (~(2 * v64) | 0x80D7FFFF) + 1) ^ 0x7F9481EC;
  int v67 = (v66 - ((2 * v66) & 0x153DBB42) + 178183585) ^ 0xA9EDDA1 | (v63
                                                                  + (*(unsigned __int8 *)(v61 - 0x4378B8CC4843E3DBLL) ^ 0x5E)
                                                                  + 172389405
                                                                  - ((2
                                                                    * (*(unsigned __int8 *)(v61 - 0x4378B8CC4843E3DBLL) ^ 0x5E)) & 0x32)) ^ 0xA467719;
  unsigned int v68 = (((v67 - ((2 * v67) & 0x898A28)) << 8) - 993717248) ^ 0xC4C51400;
  uint64_t v69 = 2
      * ((v68 - ((2 * v68) & 0xA511BC00) - 762782024) ^ 0xD288DEB8 | ((*(unsigned __int8 *)(v61 - 0x4378B8CC4843E3B1LL) ^ 0x5E)
                                                                    - ((2
  LODWORD(STACK[0xF70]) = 165093223;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 + 8LL * v63) - 8LL))( 165093216LL,  (v63 - 88),  v69,  4294442903LL,  194LL,  578325LL,  3205573259LL,  1372LL,  a9,  v57,  a11,  __PAIR64__(v60, v59),  v61,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_1001BFE58(int a1, int a2)
{
  LODWORD(STACK[0x1570]) = 165093223;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((112 * ((a1 ^ 0x9D71F66u) > 0x19F)) ^ (a2 + 1026))) - 12LL))();
}

uint64_t sub_1001BFF40(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  int v13 = v8 + v7;
  int v14 = v9 + v11;
  int v15 = v10 + a6;
  int v16 = v12 + a7;
  unsigned int v17 = ((((v14 - 876234345) % 0x190u) << (((a2 - 88) | 0x33) ^ 0x7E)) & 0x2F4)
      + (((v14 - 876234345) % 0x190u) ^ 0x77EE777A);
  unsigned int v18 = (((v16 - 656018934) * (v16 - 656018934)) ^ 0xFA37FF5F)
      + v14
      + ((2 * (v16 - 656018934) * (v16 - 656018934)) & 0xF46FFEBE);
  unsigned int v19 = ((((v18 - 779240903) % 0xFFFF) ^ 0x95B3D5FE) + 1783376386 + ((2 * ((v18 - 779240903) % 0xFFFF)) & 0x1ABFC))
      % 0x190;
  uint64_t v20 = 4LL * ((97 * v17 - 1901752974) % 0x55C);
  int v21 = *(_DWORD *)((char *)&STACK[0x8D0] + v20);
  uint64_t v22 = 4LL
      * ((((194 * ((v19 + 21704282 - ((2 * v19) & 0xB4)) ^ 0x14B2E5A)) & 0x3EDDE2)
        + ((97 * ((v19 + 21704282 - ((2 * v19) & 0xB4)) ^ 0x14B2E5A)) ^ 0x5F5F6EF1)
        - 1600035909)
       % 0x55C);
  *(_DWORD *)((char *)&STACK[0x8D0] + v20) = *(_DWORD *)((char *)&STACK[0x8D0] + v22);
  LODWORD(v20) = (v12
                + a7
                + (((v15 - 1370540222) * (v15 - 1370540222)) ^ 0x7BEDEBCF)
                + ((2 * (v15 - 1370540222) * (v15 - 1370540222)) & 0xF7DBD79E)
                + 1559758396)
               % 0xFFFF;
  LODWORD(v20) = ((v20 ^ 0xFF2DDF75) + 13770891 + ((2 * (_DWORD)v20) & 0x1BEEA)) % 0x190;
  *(_DWORD *)((char *)&STACK[0x8D0] + v22) = v21;
  uint64_t v23 = 4LL
      * ((((194 * ((v16 - 656018934) % 0x190u)) & 0x18FF6)
        + ((97 * ((v16 - 656018934) % 0x190u)) ^ 0x5FE7C7FB)
        - 1608971599)
       % 0x55C);
  int v24 = *(_DWORD *)((char *)&STACK[0x8D0] + v23);
  uint64_t v25 = 4LL * ((97 * (((2 * (_DWORD)v20) & 0x3EE) + (v20 ^ 0xBFF7EBF7)) + 1125149205) % 0x55C);
  *(_DWORD *)((char *)&STACK[0x8D0] + v23) = *(_DWORD *)((char *)&STACK[0x8D0] + v25);
  LODWORD(v23) = ((((v13 - 2021496829) * (v13 - 2021496829)) ^ 0x7D677FEA)
                + v15
                + ((2 * (v13 - 2021496829) * (v13 - 2021496829)) & 0xFACEFFD4)
                + 820492121)
               % 0xFFFF;
  *(_DWORD *)((char *)&STACK[0x8D0] + v25) = v24;
  LODWORD(v25) = ((v23 ^ 0xE5EF7DF9) + 437289479 + ((2 * (_DWORD)v23) & 0xFBF2)) % 0x190;
  unsigned int v26 = ((v15 - 1370540222) % 0x190u - 1878679692 - ((2 * ((v15 - 1370540222) % 0x190u)) & 0x2E8)) ^ 0x90059F74;
  LODWORD(v23) = 97 * v26;
  unsigned int v27 = (97 * v26) ^ 0xD72FDEFB;
  v26 *= 194;
  int v28 = *((_DWORD *)&STACK[0x8D0] + ((v26 & 0x5FBDF6) + v27 + 684782513) % 0x55C);
  uint64_t v29 = 4LL * ((97 * (((2 * (_DWORD)v25) & 0x1BE) + (v25 ^ 0xFECFAEDF)) + 1934594093) % 0x55C);
  *((_DWORD *)&STACK[0x8D0] + ((v26 & 0xFDFF9E) + (v23 ^ 0x6F7EFFCF) - 1870540067) % 0x55C) = *(_DWORD *)((char *)&STACK[0x8D0] + v29);
  *(_DWORD *)((char *)&STACK[0x8D0] + v29) = v28;
  LODWORD(v29) = (v13
                - 608178214
                + (((v18 - 779240903) * (v18 - 779240903)) ^ 0x3DFE5FFD)
                + ((2 * (v18 - 779240903) * (v18 - 779240903)) & 0x7BFCBFFA)
                + 1841567789)
               % 0xFFFF;
  LODWORD(v29) = ((v29 ^ 0x7F75F5D5) - 2138437077 + ((2 * (_DWORD)v29) & 0x1EBAA)) % 0x190;
  uint64_t v30 = 4LL * ((97 * ((v29 ^ 0xDEB4FFFF) + 2 * (_DWORD)v29) - 1653878003) % 0x55C);
  uint64_t v31 = 4LL
      * ((97 * ((((v13 - 2021496829) % 0x190u) ^ 0xF6F5FBDF) + ((2 * ((v13 - 2021496829) % 0x190u)) & 0x3BE))
        + 1825334061)
       % 0x55C);
  int v32 = *(_DWORD *)((char *)&STACK[0x8D0] + v31);
  *(_DWORD *)((char *)&STACK[0x8D0] + v31) = *(_DWORD *)((char *)&STACK[0x8D0] + v30);
  *(_DWORD *)((char *)&STACK[0x8D0] + v30) = v32;
  return ((uint64_t (*)(void))((char *)*(&off_10025C670
                                      + ((a2 + 665721834) ^ 0x27AE1F87 ^ (1565 * (((-415323 - a2) | (a2 + 415323)) >= 0))))
                            - 8))();
}

void sub_1001C04A8()
{
}

uint64_t sub_1001C04DC@<X0>(unsigned int a1@<W0>, int a2@<W6>, int a3@<W8>)
{
  int v4 = *((_DWORD *)&STACK[0x8D0]
       + (((194 * (a3 ^ 0x9D71F67)) & 0xC9FBA73A) - 1694302449 + ((((a2 - 3) ^ 0x61D) * (a3 ^ 0x9D71F67)) ^ 0x64FDD39D))
       % 0x55C) ^ 0x9D71F67;
  *((_DWORD *)&STACK[0x8D0] + (((194 * v4) & 0xA2FD7F7C) + ((97 * v4) ^ 0x517EBFBE) - 1367168386) % 0x55C) = a3;
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((363
                                          * ((((a3 ^ 0x9D71F67)
                                             + 165093223
                                             - ((2 * (a3 ^ 0x9D71F67) + 2) & 0x13AE3ECE)
                                             + 1) ^ a1) < 0x190)) ^ a2))
                            - 8LL))();
}

uint64_t sub_1001C05DC( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v14 = 4LL
      * (((127 * (v8 ^ 0x671)) ^ 0x612) * v10
       - 160627994
       - ((((((127 * (v8 ^ 0x671)) ^ 0x612u) * v10 - 160627994) * (unint64_t)v9) >> 32) >> 10) * a2);
  int v15 = dword_10021B7F0[(((2722 * (*(_DWORD *)(a3 + v14) ^ (a8 + 2))) & 0x7FDFDBFE)
                       + ((1361 * (*(_DWORD *)(a3 + v14) ^ (a8 + 2))) ^ 0x3FEFEDFFu)
                       - 1072338862)
                      % 0x12E0] ^ 0x4F18A365;
  unsigned int v16 = v15 * v11 - 699321525 - ((v15 * v13) & 0xACA26696);
  unsigned int v17 = (8 * ((v16 ^ 0xD651334B) * (v16 ^ 0xD651334B) + (~(2 * (v16 ^ 0xD651334B) * (v16 ^ 0xD651334B)) | 0x1397921B))
       - 1314801768) ^ 0xB1A1B790;
  int v18 = v16 ^ 0x75A52BE6 ^ (v17 - ((2 * v17) & 0x32D70830) + 426476572);
  unsigned int v19 = (uint64_t (*)(void))(*(void *)(v12 + 8LL * (((v10 != 1020051621) | (2 * (v10 != 1020051621))) ^ v8)) - 8LL);
  *(_DWORD *)(a3 + v14) = v18;
  return v19();
}

uint64_t sub_1001C0730@<X0>(uint64_t a1@<X6>, int a2@<W8>)
{
  unsigned int v10 = (((v5 - 2140710622) ^ 0xE) + 1567356524 - ((2 * ((v5 - 2140710622) ^ 0xE)) & 0xBAD7ECD8)) ^ 0x5D6BF66C;
  unsigned int v11 = ((v10 * v3) & 0x27CEDFF6) + ((v10 * v2) ^ 0x93E76FFB) + 1813898838;
  int v12 = *(_DWORD *)(a1 + 4LL * (v11 - (((v11 * (unint64_t)v4) >> 32) >> 10) * v6)) ^ 0x4F18A365;
  unsigned int v13 = v12 * v7 - 758978626 - ((v12 * v9) & 0xA585CF7C);
  unsigned int v14 = (8 * ((v13 ^ 0xD2C2E7BE) * (v13 ^ 0xD2C2E7BE) - ((2 * (v13 ^ 0xD2C2E7BE) * (v13 ^ 0xD2C2E7BE)) & 0x140D1C4C))
       + 1345614128) ^ 0x50347130;
  int v15 = (uint64_t (*)(void))(*(void *)(v8 + 8LL * ((15 * (v5 != 2140711037)) ^ a2)) - 8LL);
  *((_DWORD *)&STACK[0x8D0] + (97 * v5 - 1490407394) % 0x55Cu) = v13 ^ 0x92248B84 ^ (v14
                                                                                   - ((2 * v14) & 0xF4F3E110)
                                                                                   - 92671861);
  return v15();
}

uint64_t sub_1001C0888@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  int v59 = (((((a1 ^ 0x7F4) + v57 + 1680986281) * (v57 + 1870891805)) ^ 0x6EE3381B)
       + 618617358
       + ((2 * ((a1 ^ 0x7F4) + v57 + 1680986281) * (v57 + 1870891805)) & 0xDDC67036))
      * (v57 + 1870891805);
  *(_DWORD *)(*a57 + 4 * v57 - 0x657CD3A84D1AE626LL) = ((2 * v59) & 0x84DDBBFA)
                                                     + (v59 ^ 0xC26EDDFD)
                                                     - ((2 * (((2 * v59) & 0x84DDBBFA) + (v59 ^ 0xC26EDDFD)) + 67514964) & 0x13AE3ECE)
                                                     - 1411762031;
  return ((uint64_t (*)(void))(*(void *)(v58 + 8LL * ((243 * (v57 == 2424080866LL)) ^ a1)) - 8LL))();
}

uint64_t sub_1001C096C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,int a62,uint64_t a63)
{
  unsigned int v66 = malloc((HIDWORD(a11) + a13 + a12 - ((2 * (HIDWORD(a11) + a13 + a12) - 2116203608) & 0x9F89AD22) - 1867285403) ^ 0x4FC4D691);
  BOOL v72 = (a12 + 1792548112) < 0xCA200823;
  v66[a62 + HIDWORD(a11) - a64 - 1607036697] = *(_BYTE *)(a60 - 0x54BD9D2603AA26EDLL);
  return ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 + 8LL * ((1250 * !v72) ^ v64)) - ((v64 + 41723254) & 0xFD835BA6) + 664LL))( v66,  a63,  v67,  v68,  HIDWORD(a11),  v69,  v70,  v71,  a9,  a10,  a11);
}

void sub_1001C0AA8()
{
}

uint64_t sub_1001C0AB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v15 = (a13 + 229796072) < 0x1032C3A7;
  *(_BYTE *)(a1 + (a5 - 1565070426)) = *(_BYTE *)(a2 - 0x59E3FCAF6574EC77LL);
  return ((uint64_t (*)(uint64_t, BOOL, BOOL, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 + 8LL * ((90 * !v15) ^ (v13 + 746))) - 8LL))( a1,  (a13 + 229796072) > 0x1032C3A8,  (a13 + 229796072) < 0x1032C3A7,  (v13 + 746),  a5,  a6,  a7,  a8,  a9);
}

void sub_1001C0B78()
{
}

uint64_t sub_1001C0B84( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v65 = a5 + 2031328205;
  int v66 = v63 - 168;
  BOOL v67 = (a5 + 2031328205) < 0xD65CB027;
  int v68 = *(unsigned __int8 *)(a63 - 0x5A78D2218AD9E2ALL);
  *a1 = v68 - ((2 * v68) & 0x20) - 112;
  BOOL v69 = v65 > 0xD65CB028;
  if (v67) {
    BOOL v69 = v67;
  }
  uint64_t v70 = (uint64_t (*)(_BYTE *, void, BOOL, void, BOOL, uint64_t, uint64_t, uint64_t))(*(void *)(v64 + 8LL * ((1905 * !v69) ^ v66)) - 4LL);
  return v70(a1, v70, v67, (2 * v68) & 0x20, v67, a6, a7, a8);
}

void sub_1001C0C6C()
{
}

uint64_t sub_1001C0C74@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3
                                                                                 + 8LL
                                                                                 * (((((v2 + ((a2 - 325) | 0x20A) - 923) ^ v4) < 0x20)
                                                                                   * (((a2 - 579) | 0x308) - 896)) ^ (a2 + 684)))
                                                                     - 4LL))( a1,  147LL,  3575395474LL,  809818951LL);
}

uint64_t sub_1001C0E78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 + 8LL * ((1671 * (v42 == (_DWORD)a5 + ((v41 + 2046038485) & 0x860BEFA9) - 1098 - 192)) ^ v41)) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41);
}

uint64_t sub_1001C0EC0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((79 * (((v1 + ((v0 - 1537460748) & 0x5BA3C7A6) - 676) ^ v3) == (v0 ^ 0x509))) ^ v0)))();
}

uint64_t sub_1001C0F08@<X0>(int a1@<W8>)
{
  LOBYTE(STACK[0x398]) = 16;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((a1 + 524) ^ 0x78)) - 8LL))();
}

uint64_t sub_1001C0F58@<X0>( uint64_t a1@<X0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54,int a55,int a56,int a57,uint64_t a58,int a59)
{
  LODWORD(v848) = v59;
  int v63 = a2 - 715;
  HIDWORD(v851) = *(unsigned __int8 *)(a1 + (HIDWORD(a14) - 368097220));
  unsigned int v64 = (((HIDWORD(a14) ^ 0xBE ^ v63)
        - 2 * (((HIDWORD(a14) ^ 0xBE ^ v63) + 168773692) & 0xAFCF3FD ^ (HIDWORD(a14) ^ 0xBE ^ v63) & 1)
        + 1963736120) ^ 0x8AFCF3FC)
      + 2 * (BYTE4(a14) & 1);
  unsigned int v65 = ((2 * v64) & 0xD9BFFF34) + (v64 ^ 0x6CDFFF9A);
  int v858 = *(unsigned __int8 *)(a1 + v65 - 1826619289);
  int v859 = *(unsigned __int8 *)(a1 + v65 - 1826619288);
  unsigned int v66 = *(unsigned __int8 *)(a1 + v65 - 1826619287);
  LODWORD(v851) = *(unsigned __int8 *)(a1 + v65 - 1826619286);
  int v856 = *(unsigned __int8 *)(a1 + v65 - 1826619285);
  int v857 = *(unsigned __int8 *)(a1 + v65 - 1826619284);
  unsigned int v67 = *(unsigned __int8 *)(a1 + v65 - 1826619283);
  int v68 = *(unsigned __int8 *)(a1 + v65 - 1826619282);
  int v69 = *(unsigned __int8 *)(a1 + v65 - 1826619281);
  HIDWORD(v848) = v60 + (v62 ^ v60) - 2 * (((v62 ^ v60) + 2147483616) & (v60 + 14) ^ v62 & 0xE) - 32;
  unsigned int v70 = *(unsigned __int8 *)(a1 + v65 - 1826619280);
  int v71 = *(unsigned __int8 *)(a1 + v65 - 1826619279);
  unsigned int v72 = *(unsigned __int8 *)(a1 + v65 - 1826619278);
  HIDWORD(v850) = *(unsigned __int8 *)(a1 + v65 - 1826619277);
  LODWORD(v850) = *(unsigned __int8 *)(a1 + v65 - 1826619276);
  unsigned int v73 = *(unsigned __int8 *)(a1 + v65 - 1826619275);
  unsigned int v74 = *(unsigned __int8 *)(a1 + v65 - 1826619274);
  unsigned int v75 = *(unsigned __int8 *)(a1 + v65 - 1826619273);
  unsigned int v76 = *(unsigned __int8 *)(a1 + v65 - 1826619272);
  unsigned int v77 = *(unsigned __int8 *)(a1 + v65 - 1826619271);
  unsigned int v78 = *(unsigned __int8 *)(a1 + v65 - 1826619270);
  int v860 = *(unsigned __int8 *)(a1 + v65 - 1826619269);
  HIDWORD(v849) = *(unsigned __int8 *)(a1 + v65 - 1826619268);
  unsigned int v79 = *(unsigned __int8 *)(a1 + v65 - 1826619267);
  int v80 = *(unsigned __int8 *)(a1 + v65 - 1826619266);
  unsigned int v81 = *(unsigned __int8 *)(a1 + v65 - 1826619264);
  unsigned int v82 = *(unsigned __int8 *)(a1 + v65 - 1826619263);
  unsigned int v83 = *(unsigned __int8 *)(a1 + v65 - 1826619262);
  int v84 = *(unsigned __int8 *)(a1 + v65 - 1826619261);
  LODWORD(v849) = *(unsigned __int8 *)(a1 + v65 - 1826619290);
  unsigned int v85 = *(unsigned __int8 *)(a1 + v65 - 1826619260);
  unsigned int v86 = *(unsigned __int8 *)(a1 + v65 - 1826619265);
  HIDWORD(a14) = v65 - 1458522039;
  unint64_t v819 = __PAIR64__(v78, v79);
  HIDWORD(v846) = (v63 + 321) | 0x161;
  unint64_t v825 = __PAIR64__(v85, v82);
  int v87 = (v82 ^ v61) - ((2 * (v82 ^ v61)) & 0xAA);
  HIDWORD(v820) = v80;
  int v88 = (v80 ^ v61) - ((2 * (v80 ^ v61)) & 0x20);
  int v89 = ((((v79 ^ v61) - (((v79 ^ v61) << SBYTE4(v846)) & 0x1CC)) << 16) + 1659240448) ^ 0x62E60000;
  unsigned int v90 = (v89 + 660708061 - ((2 * v89) & 0x4EC20000)) ^ 0x27619ADD | ((((v88 << 8) - 1724706816) ^ 0x99331000)
                                                                   - 456157639
                                                                   - ((2 * (((v88 << 8) - 1724706816) ^ 0x99331000)) & 0x499F2C00)) ^ 0xE4CF9639;
  unsigned int v91 = v90 - 1854913480 - ((2 * v90) & 0x22E08870);
  unint64_t v817 = __PAIR64__(v76, v86);
  unsigned int v92 = v91 ^ 0x91704438 | ((v86 ^ v61) - 1827498561 - ((2 * (v86 ^ v61)) & 0x17E)) ^ 0x931295BF;
  LODWORD(a48) = v92 - ((2 * v92) & 0x5FBCE516) + 1876849291;
  unint64_t v826 = __PAIR64__(v67, v83);
  int v93 = (v83 ^ v61) - ((2 * (v83 ^ v61)) & 0x1F8);
  int v94 = (v81 ^ v61) + 1031931314 - ((2 * (v81 ^ v61)) & 0x164);
  unsigned int v95 = ((((_DWORD)a48 << 8) ^ 0xDE728B00) - 2117782769 - ((2 * (((_DWORD)a48 << 8) ^ 0xDE728B00)) & 0x38A6600)) ^ 0x81C5330F | v94 ^ 0x3D8205B2;
  unsigned int v96 = v95 - 1023017214 - ((2 * v95) & 0x860BFE04);
  unint64_t v821 = __PAIR64__(v75, v73);
  int v97 = (v73 ^ v61) - ((2 * (v73 ^ v61)) & 0xBA);
  HIDWORD(v824) = v68;
  int v98 = (v68 ^ v61) - 2 * ((v68 ^ v61) & 0x7F);
  int v99 = (v66 ^ v61) - ((2 * (v66 ^ v61)) & 0x18A);
  unsigned int v100 = ((((v67 ^ v61) - ((2 * (v67 ^ v61)) & 0x10C)) << 16) - 1652162560) ^ 0x9D860000;
  unsigned int v101 = (v100 + 38193959 - ((2 * v100) & 0x48C0000)) ^ 0x246CB27 | ((((v98 << 8) - 924090624) ^ 0xC8EB7F00)
                                                                   + 320233596
                                                                   - ((2 * (((v98 << 8) - 924090624) ^ 0xC8EB7F00)) & 0x262CC000)) ^ 0x1316607C;
  unsigned int v102 = v101 + 1397010777 - ((2 * v101) & 0xA68962B2);
  LODWORD(v820) = v71;
  int v103 = (v71 ^ v61) - ((2 * v71) & 0xA);
  unint64_t v823 = __PAIR64__(v66, v74);
  unsigned int v104 = ((((v74 ^ v61) - ((2 * (v74 ^ v61)) & 0xB6)) << 8) - 1795663104) ^ 0x94F85B00;
  int v105 = ((((v97 << 16) + 224198656) ^ 0xD5D0000)
        + 1826887594
        - ((2 * (((v97 << 16) + 224198656) ^ 0xD5D0000)) & 0x59C80000)) ^ 0x6CE417AA | (v104
                                                                                      + 64016944
                                                                                      - ((2 * v104) & 0x7A1A400)) ^ 0x3D0D230;
  unsigned int v844 = v105 - 1967880093 - ((2 * v105) & 0x156910C6);
  unsigned int v106 = v844 ^ 0x8AB48863 | ((v75 ^ v61) + 1835322907 - ((2 * (v75 ^ v61)) & 0x36)) ^ 0x6D64CE1B;
  unsigned int v107 = ((((v93 << 8) + 1065352192) ^ 0x3F7FFC00)
        - 1805771195
        - ((2 * (((v93 << 8) + 1065352192) ^ 0x3F7FFC00)) & 0x28BC3C00)) ^ 0x945E1E45 | ((((v87 << 16) - 363528192) ^ 0xEA550000)
                                                                                       - 589688653
                                                                                       - ((2
                                                                                         * (((v87 << 16) - 363528192) ^ 0xEA550000)) & 0x39B40000)) ^ 0xDCDA10B3;
  unsigned int v854 = v107 - 2098549553 - ((2 * v107) & 0x5D5599E);
  LODWORD(v827) = v84;
  unsigned int v108 = v854 ^ 0x82EAACCF | ((v84 ^ v61) - 875742792 + (~(2 * (v84 ^ v61)) | 0xFFFFFE8F) + 1) ^ 0xCBCD39B8;
  unsigned int v838 = v108 + 32166741 - ((2 * v108) & 0x3D5A6AA);
  unsigned int v109 = (((v106 - ((2 * v106) & 0x46961E)) << 8) - 1555362048) ^ 0xA34B0F00;
  int v110 = (v72 ^ v61) + 13209841 - ((2 * (v72 ^ v61)) & 0x1CC);
  int v111 = (v76 ^ v61) - 207770552 - (v61 & (2 * v76));
  unsigned int v112 = (v109 + 354814692 - ((2 * v109) & 0x2A4C1400)) ^ 0x15260AE4 | v111 ^ 0xF39DAC48;
  unsigned int v113 = v112 - 1740613362 - ((2 * v112) & 0x3080B21C);
  unint64_t v818 = __PAIR64__(v81, v77);
  int v114 = (v77 ^ v61) - ((2 * v77) & 0xC0);
  unsigned int v115 = (((v96 << 15) ^ 0xFF810000) - 992667042 - ((2 * ((v96 << 15) ^ 0xFF810000)) & 0x89AA0000)) ^ 0xC4D51A5E | (v91 >> 9) ^ 0x48B822;
  int v116 = (v78 ^ v61) - ((2 * (v78 ^ v61)) & 0x15C);
  LODWORD(v824) = v69;
  int v117 = v102 ^ 0x5344B159 | ((v69 ^ v61) + 958310844 - ((2 * (v69 ^ v61)) & 0x178)) ^ 0x391EA9BC;
  unsigned int v118 = (((v117 - ((2 * v117) & 0x10780C)) << 8) - 2009332224) ^ 0x883C0600;
  unint64_t v822 = __PAIR64__(v72, v70);
  int v119 = (v70 ^ v61) - 178472338 - ((2 * v70) & 0xDC);
  unsigned int v120 = (v118 + 558954199 - ((2 * v118) & 0x42A1EC00)) ^ 0x2150F6D7 | v119 ^ 0xF55CBA6E;
  unsigned int v121 = v120 - 1244419584 - ((2 * v120) & 0x6BA75440) + 32;
  int v122 = (BYTE4(v851) ^ v61) - ((2 * (HIDWORD(v851) ^ v61)) & 0x15C);
  int v841 = (v85 ^ v61) + 118365811 - ((2 * (v85 ^ v61)) & 0xE6);
  unsigned int v123 = (((v838 << 8) ^ 0xEAD35500) + 1059508087 - ((2 * ((v838 << 8) ^ 0xEAD35500)) & 0x7E4D9E00)) ^ 0x3F26CF77 | v841 ^ 0x70E1E73;
  unsigned int v852 = v123 - 1735214731 - ((2 * v123) & 0x312572EA);
  unsigned int v124 = ((((v103 << 16) - 1895497728) ^ 0x8F050000)
        + 1735249306
        - ((2 * (((v103 << 16) - 1895497728) ^ 0x8F050000)) & 0x4EDA0000)) ^ 0x676DCD9A | ((((v110 << 8) + 914688) ^ 0xC99EE600)
                                                                                         - 247472571
                                                                                         - ((2
                                                                                           * (((v110 << 8) + 914688) ^ 0xC99EE600)) & 0x627FBC00)) ^ 0xF13FDE45;
  unsigned int v125 = v124 - 154841205 - ((2 * v124) & 0xED8A9F16);
  unsigned int v853 = v96;
  HIDWORD(v126) = v94 ^ 0x32;
  LODWORD(v126) = v96 ^ 0xC305FF00;
  int v847 = v126 >> 7;
  unsigned int v127 = v125 ^ 0xF6C54F8B | ((BYTE4(v850) ^ v61) - 615860127 - ((2 * HIDWORD(v850)) & 0xC2)) ^ 0xDB4AB861;
  int v128 = (((v127 - ((2 * v127) & 0x333776)) << 8) + 429636352) ^ 0x199BBB00;
  int v129 = (v849 ^ v61) - ((2 * (v849 ^ v61)) & 0xE6);
  unsigned int v130 = ((((v851 ^ v61) + 342811 - ((2 * (v851 ^ v61)) & 0x112)) << 8) + 486912) ^ 0x5428900;
  unsigned int v131 = (v130 - 1997532161 - ((2 * v130) & 0x11E02600)) ^ 0x88F013FF | ((((v99 << 16) - 775618560) ^ 0xD1C50000)
                                                                       + 629560448
                                                                       - ((2 * (((v99 << 16) - 775618560) ^ 0xD1C50000)) & 0x4B0C0000)) ^ 0x25865480;
  int v132 = v131 - 1479342954 - ((2 * v131) & 0x4FA6092C);
  int v133 = (v850 ^ 0x90) - 169240789 - ((2 * v850) & 0x56);
  LODWORD(a47) = (((v96 << 14) ^ 0x7FC08000) + 1719299262 - ((2 * ((v96 << 14) ^ 0x7FC08000)) & 0xCCF48000)) ^ 0x667A6CBE | (v91 >> 10) ^ 0x245C11;
  HIDWORD(v126) = v119 ^ 0xEEEEEEEE;
  LODWORD(v126) = v121 ^ 0xB5D3AA00;
  unsigned int v134 = ((((v129 << 8) - 233737472) ^ 0xF2117300)
        + 34501695
        - ((2 * (((v129 << 8) - 233737472) ^ 0xF2117300)) & 0x41CE800)) ^ 0x20E743F | ((((v122 << 16) + 2075000832) ^ 0x7BAE0000)
                                                                                     - 1059678262
                                                                                     - ((2
                                                                                       * (((v122 << 16) + 2075000832) ^ 0x7BAE0000)) & 0x1AC0000)) ^ 0xC0D697CA;
  unsigned int v135 = (((v96 << 13) ^ 0xBFE04000) + 10294356 - ((2 * ((v96 << 13) ^ 0xBFE04000)) & 0x13A0000)) ^ 0x9D1454 | (v91 >> 11) ^ 0x122E08;
  int v136 = (BYTE4(v849) ^ 0x90) - 1954762029 - ((2 * (HIDWORD(v849) ^ 0x90)) & 0x1A6);
  unsigned int v137 = ((v128 - 404156887 - ((2 * v128) & 0xCFD21C00)) ^ 0xE7E90E29 | v133 ^ 0xF5E9972B)
       + 1344019328
       - ((2 * ((v128 - 404156887 - ((2 * v128) & 0xCFD21C00)) ^ 0xE7E90E29 | v133 ^ 0xF5E9972B)) & 0xA0383770)
       + 56;
  unsigned int v138 = v132 ^ 0xA7D30496 | ((v856 ^ 0x90) - 1034193214 - ((2 * (v856 ^ 0x90)) & 0x184)) ^ 0xC25B76C2;
  int v139 = (((v138 - ((2 * v138) & 0xDA9BD6)) << 8) + 1833822976) ^ 0x6D4DEB00;
  unsigned int v140 = ((((v860 ^ 0x90) - ((2 * v860) & 0xC0)) << 8) - 2100600832) ^ 0x82CB6000;
  unsigned int v141 = v136 ^ 0x8B7CB2D3 | (v140 - 1750972688 - ((2 * v140) & 0x2F448C00)) ^ 0x97A246F0;
  unsigned int v142 = ((((v116 << 16) - 760348672) ^ 0xD2AE0000)
        + 1931243040
        - ((2 * (((v116 << 16) - 760348672) ^ 0xD2AE0000)) & 0x66380000)) ^ 0x731C6E20 | ((((v114 << 24) - 0x20000000) ^ 0xE0000000)
                                                                                        - 1879274300
                                                                                        - ((2
                                                                                          * ((v114 << 24) - 0x20000000)) & 0x1E000000)) ^ 0x8FFC8CC4;
  unsigned int v143 = v142 + 1528886042 - ((2 * v142) & 0xB641E634);
  unsigned int v144 = (((v121 << 14) ^ 0xEA880000) + 1895501479 - ((2 * ((v121 << 14) ^ 0xEA880000)) & 0xE1F60000)) ^ 0x70FB0EA7 | (v102 >> 10) ^ 0x14D12C;
  int v145 = v143 ^ 0x5B20F31A | (v141 + 54867998 - ((2 * v141) & 0x68A703C)) ^ 0x345381E;
  unsigned int v146 = (((v852 << 13) ^ 0x572EA000) - 1617328426 - ((2 * ((v852 << 13) ^ 0x572EA000)) & 0x3F330000)) ^ 0x9F9986D6 | (v854 >> 11) ^ 0x105D55;
  LODWORD(v830) = v121;
  int v147 = ((v121 >> 3) ^ 0x14B65707)
       + ((a48 >> 2) ^ 0xE54BE169)
       + ((v121 >> 2) & 0x3BE7BB78 ^ 0xD69B55F7)
       + ((v126 >> 7) ^ 0xB7FADBBF)
       + ((2 * (v126 >> 7)) & 0x6FF5B77E)
       + ((a48 >> 1) & 0x7D78FB96 ^ 0x35683904)
       + (v144 ^ 0x6BFDFFFB)
       + ((2 * v144) & 0xD7FBFFF6)
       + (v135 ^ 0x6200A817)
       + (v115 ^ 0xF2218988)
       - ((2 * v135) & 0x3BFEAFD0)
       - ((2 * v115) & 0x1BBCECEE)
       + 2;
  unsigned int v148 = (((v852 << 15) ^ 0x5CBA8000) - 1006654541 - ((2 * ((v852 << 15) ^ 0x5CBA8000)) & 0x87FF0000)) ^ 0xC3FFABB3 | (v854 >> 9) ^ 0x417556;
  HIDWORD(v126) = v133 ^ 0x2B;
  LODWORD(v126) = v137 ^ 0x501C1B80;
  int v149 = v126 >> 7;
  unsigned int v150 = (v139 - 508764052 - ((2 * v139) & 0xC359C000)) ^ 0xE1ACE06C | ((v857 ^ 0x90)
                                                                      + 235618249
                                                                      - ((2 * (v857 ^ 0x90)) & 0x192)) ^ 0xE0B3FC9;
  int v151 = (((v113 << 14) ^ 0x16438000) + 800823147 - ((2 * ((v113 << 14) ^ 0x16438000)) & 0x5F770000)) ^ 0x2FBB976B | (v844 >> 10) ^ 0x22AD22;
  unsigned int v152 = (((v137 << 14) ^ 0x6EE0000) + 1901682615 - ((2 * ((v137 << 14) ^ 0x6EE0000)) & 0xE2B28000)) ^ 0x71595FB7 | (v125 >> 10) ^ 0x3DB153;
  HIDWORD(v126) = v111 ^ 0x48;
  LODWORD(v126) = v113 ^ 0x98405900;
  unsigned int v842 = v150 - 986272638 - ((2 * v150) & 0x8A6D5904);
  unsigned int v153 = (v842 ^ 0xCC22693F ^ (v147 - ((2 * v147 + 238593328) & 0x12298B7A) - 1875830699)) + (v842 ^ 0xC536AC82);
  unsigned int v154 = v153 - 563562880 - ((2 * v153) & 0xBCD16D44) + 34;
  int v155 = ((v126 >> 7) ^ 0x7DFE95BA)
       + ((2 * (v126 >> 7)) & 0xFBFD2B74)
       + (v151 ^ 0x4100800)
       - ((2 * v151) & 0xF7DFEFFE)
       + 1;
  HIDWORD(v126) = v154 ^ 0xB6A2;
  LODWORD(v126) = v154 ^ 0xDE680000;
  int v156 = (v126 >> 19) - ((2 * (v126 >> 19)) & 0x4D3ED2A2);
  unsigned int v157 = (v146 ^ 0xEE7EF6FF) + (v148 ^ 0xFA367A37) + ((2 * v148) & 0xF46CF46E) + ((2 * v146) & 0xDCFDEDFE);
  HIDWORD(v126) = v154 ^ 0xB6A2;
  LODWORD(v126) = v154 ^ 0xDE680000;
  unsigned int v158 = v145 + 1787715317 + (~(2 * v145) | 0x2AE354D7) - 2400;
  int v159 = (v126 >> 17) - ((2 * (v126 >> 17)) & 0xEC3CC7BC) + 1981703134;
  unsigned int v160 = ((v137 >> 3) ^ 0x1F591C4B)
       + ((v137 >> 2) & 0x2AB53E78 ^ 0x50668)
       + (v149 ^ 0xDAEFFF7A)
       + ((2 * v149) & 0xB5DFFEF4)
       + (v152 ^ 0x7E6FFDF5)
       + ((2 * v152) & 0xFCDFFBEA)
       - 1857723563
       + ((v157 - ((2 * v157 + 9772436) & 0x13768F4) - 1746517180) ^ (v838 >> 2) ^ 0x80E100AF);
  HIDWORD(v126) = v154 ^ 0xB6A2;
  LODWORD(v126) = v154 ^ 0xDE680000;
  int v161 = v126 >> 18;
  unsigned int v162 = v160 - 386152396 - ((2 * v160) & 0xD1F79068);
  HIDWORD(v126) = v158 ^ 0x25594;
  LODWORD(v126) = v143 ^ 0x5B200000;
  int v163 = v126 >> 18;
  int v164 = ((v156 + 647981393) ^ (v154 >> 10) ^ v159 ^ 0x50B690A2)
       + ((v155 - ((2 * v155 + 1004717194) & 0x3307434C) - 1753938965) ^ (v113 >> 3) ^ 0xA8BAA87);
  unsigned int v165 = (v134 - 1834529367 - ((2 * v134) & 0x254E9B52)) ^ 0x92A74DA9 | ((v858 ^ 0x90)
                                                                       - 1200224046
                                                                       - ((2 * (v858 ^ 0x90)) & 0x1A4)) ^ 0xB87608D2;
  HIDWORD(v829) = v137;
  unsigned int v166 = ((4 * v137) & 0xFB7646AC ^ 0x407046A0)
       + ((2 * v137) ^ 0xDD831426)
       + (v164 ^ 0x3CF3FF97)
       + ((2 * v164) & 0x79E7FF2E);
  unsigned int v167 = v166 - ((2 * v166 + 178371110) & 0x5004B470) + 1834170187;
  int v168 = (((v165 - ((2 * v165) & 0xB969C4)) << 8) + 1555358208) ^ 0x5CB4E200;
  int v169 = v168 + 908015201 - ((2 * v168) & 0x6C3E6C00);
  HIDWORD(v126) = v136 ^ 0x53;
  LODWORD(v126) = v158 ^ 0x6A8E5580;
  int v170 = v126 >> 7;
  HIDWORD(v126) = v154 ^ 0x22222222;
  LODWORD(v126) = v154 ^ 0xDE68B680;
  int v171 = v126 >> 7;
  HIDWORD(v126) = v841 ^ 0xFFFFFFF3;
  LODWORD(v126) = v852 ^ 0x9892B900;
  int v172 = v126 >> 7;
  int v173 = v162 ^ 0x3C834;
  unsigned int v174 = v162;
  HIDWORD(v126) = v162 ^ 0x1C834;
  LODWORD(v126) = v162 ^ 0xE8FA0000;
  int v175 = v126 >> 17;
  HIDWORD(v126) = v167 ^ 0x5A38;
  LODWORD(v126) = v167 ^ 0x28020000;
  int v176 = v126 >> 17;
  unsigned int v177 = v162 ^ 0xE8F80000;
  HIDWORD(v126) = v162 ^ 0x3C834;
  LODWORD(v126) = v162 ^ 0xE8F80000;
  int v178 = (v175 ^ 0xFBF59FF6)
       + ((v126 >> 19) ^ 0x3B73A7D5)
       + ((2 * (v126 >> 19)) & 0x76E74FAA)
       + ((2 * v175) & 0xF7EB3FEC);
  unsigned int v179 = ((v158 >> 3) ^ 0x7717755E)
       + (v163 ^ 0x5F1BCBFF)
       + ((2 * v163) & 0xBE3797FE)
       + ((v158 >> 2) & 0x348D7FD8 ^ 0x10811540)
       + 647853077
       + ((v178 - ((2 * v178 + 288190570) & 0x3004898A) - 526844678) ^ (v162 >> 10) ^ 0x18387A37);
  unsigned int v180 = (v170 ^ 0xF6EFF7FA) + ((2 * v170) & 0xEDDFEFF4) + (v179 ^ 0xC0882142) - ((2 * v179) & 0x7EEFBD7A) + 1;
  unsigned int v181 = (((v852 << 14) ^ 0xAE5D4000) + 876718379 - ((2 * ((v852 << 14) ^ 0xAE5D4000)) & 0x68830000)) ^ 0x3441A92B | (v854 >> 10) ^ 0x20BAAB;
  HIDWORD(v830) = v113 ^ 0x9840590E;
  unsigned int v182 = (v113 ^ 0xEA1BC328 ^ (v180 - 1159495690 - ((2 * v180 - 1861235322) & 0xE4B7344C) + 243)) + (v113 ^ 0x9840590E);
  unsigned int v183 = v182 - 1552598245 - ((2 * v182) & 0x46EA7636);
  unsigned int v184 = ((v167 >> 10) ^ 0xFFFCB5EF)
       + ((2 * (v167 >> 10)) & 0x6D6AF2 ^ 0x40020)
       + 608903
       + ((v176 - ((2 * v176) & 0xA4A072A2) + 1380989265) ^ (v167 >> 19) ^ (((v167 << 13) ^ 0x4B470000)
                                                                          - ((2 * ((v167 << 13) ^ 0x4B470000)) & 0x85D60000)
                                                                          - 1024780956) ^ 0x90BB2935);
  LODWORD(v831) = v158;
  unsigned int v185 = v154;
  int v186 = ((v853 >> 3) ^ 0xB0E1BEE2)
       + (v847 ^ 0xDBF737FA)
       + ((2 * v847) & 0xB7EE6FF4)
       + ((v853 >> 2) & 0x2EFDFDFA ^ 0xDF3E823F)
       + ((2 * v158) ^ 0x2A277387)
       + ((4 * v158) & 0xFE77B15C ^ 0xAA311050)
       + (a47 ^ 0xA6212000)
       - ((2 * a47) & 0xB3BDBFFE)
       + (v184 ^ 0x1202AA9)
       - ((2 * v184) & 0xFDBFAAAC)
       + 4;
  int v187 = v186 - ((2 * v186 + 706037586) & 0x4D3E0368);
  unsigned int v188 = ((v852 >> 3) ^ 0x74B77AE)
       + (v172 ^ 0xFFF96777)
       + ((2 * v172) & 0xFFF2CEEE)
       + ((v852 >> 2) & 0x174DBEFE ^ 0xF9FB51A3)
       + (v181 ^ 0x8C400A04)
       - ((2 * v181) & 0xE77FEBF6)
       + 3;
  HIDWORD(v126) = v183 ^ 0x53B1B;
  LODWORD(v126) = v183 ^ 0xA3700000;
  int v189 = (v126 >> 19) - ((2 * (v126 >> 19)) & 0xFF454814) + 2141365258;
  int v190 = v183 ^ 0x13B1B;
  unsigned int v191 = v183 ^ 0xA3740000;
  HIDWORD(v126) = v183 ^ 0x13B1B;
  LODWORD(v126) = v183 ^ 0xA3740000;
  unsigned int v192 = v183;
  unsigned int v193 = ((v183 >> 10) ^ 0x40299B8B) + ((v183 >> 9) & 0x7D7274 ^ 0xFFAECDEB);
  unsigned int v194 = v187 + 2074715485;
  int v195 = v193 - 1073825476 + (v189 ^ ((v126 >> 17) - ((2 * (v126 >> 17)) & 0x81E293B8) + 1089554908) ^ 0x3F53EDD6);
  unsigned int v196 = (v195 - ((2 * v195) & 0x1CE4C3BA) + 242377181) ^ (v188 - ((2 * v188 - 1092953082) & 0xFD06BEF0) - 571421317);
  HIDWORD(v126) = (v187 + 2074715485) ^ 0x701B4;
  LODWORD(v126) = (v187 + 2074715485) ^ 0xA6980000;
  int v197 = (v126 >> 19) + 947690007 + (~(2 * (v126 >> 19)) | 0x8F06CBD3);
  unsigned int v198 = (v171 ^ 0x3F6F837F)
       + ((v154 >> 3) ^ 0x40A878DE)
       + (v161 ^ 0xFFEF67F7)
       + ((v154 >> 2) & 0x36CADC14 ^ 0x368A0C00)
       + ((2 * v171) & 0x7EDF06FE)
       + ((2 * v161) & 0xFFDECFEE);
  int v199 = v198 - 2 * ((v198 + 1698408064) & 0x70E1145D ^ v198 & 0x18) - 702760251;
  HIDWORD(v126) = v194 ^ 0x101B4;
  LODWORD(v126) = v194 ^ 0xA69E0000;
  int v200 = (v126 >> 17) - ((2 * (v126 >> 17)) & 0xF19DA29A) + 2026819917;
  HIDWORD(v126) = v174 ^ 0x34;
  LODWORD(v126) = v174 ^ 0xE8FBC800;
  int v201 = v126 >> 7;
  unsigned int v202 = v201 ^ 0xE6FFEF7E;
  unsigned int v203 = (2 * v201) & 0xCDFFDEFC;
  HIDWORD(v126) = v167 ^ 0x25A38;
  LODWORD(v126) = v167 ^ 0x28000000;
  int v204 = (v126 >> 18) - 740834460 - ((2 * (v126 >> 18)) & 0xA7AF75F4);
  int v205 = __PAIR64__(v173, v177) >> 18;
  unsigned int v206 = ((2 * v852) ^ 0x6870AF02)
       + ((4 * v852) & 0xB2ABBBD0 ^ 0x220AA1D0)
       - 1498799592
       + (v199 ^ (v194 >> 10) ^ v197 ^ v200 ^ 0x307AF8DE);
  unsigned int v207 = v206 + 1667038076 - ((2 * v206) & 0xC6B9F6F8);
  HIDWORD(v126) = v194 ^ 0x34;
  LODWORD(v126) = v194 ^ 0xA69F0180;
  int v208 = (v126 >> 7) - ((2 * (v126 >> 7)) & 0xCC7D23B2);
  HIDWORD(v126) = v167 ^ 0x38;
  LODWORD(v126) = v167 ^ 0x28025A00;
  int v209 = (v126 >> 7) - ((2 * (v126 >> 7)) & 0x5C23AE08);
  HIDWORD(v126) = v207 ^ 0x4FB7C;
  LODWORD(v126) = v207 ^ 0x63580000;
  int v210 = v126 >> 19;
  int v211 = (v205 ^ 0x6EFF3BEF) + ((v174 >> 3) ^ 0x22AB13B9) + v202 + ((v174 >> 2) & 0x3F68D57E ^ 0x3A28D00C);
  HIDWORD(v126) = v196 ^ 0x13EA5;
  LODWORD(v126) = v196 ^ 0x70F00000;
  int v212 = v126 >> 17;
  HIDWORD(v126) = v196 ^ 0x13EA5;
  LODWORD(v126) = v196 ^ 0x70F00000;
  int v213 = v126 >> 19;
  unsigned int v214 = (v212 ^ 0xDDDFBF9C)
       + ((v196 >> 10) ^ 0x869E2817)
       + (v213 ^ 0x5CF7FF9F)
       + ((2 * (v196 >> 10)) & 0x7BD74E ^ 0xFFC7AFF1);
  unsigned int v215 = ((2 * v213) & 0xB9EFFF3E) + ((2 * v212) & 0xBBBF7F38) + v214;
  unsigned int v216 = ((2 * v185) ^ 0xBAD15D4F)
       - 100675594
       + ((4 * v185) & 0xF3FF9FE8 ^ 0x8E5D6577)
       + ((v211
         + ((2 * v205) & 0xDDFE77DE)
         + v203
         - ((2 * (v211 + ((2 * v205) & 0xDDFE77DE) + v203) - 728181848) & 0x9038FC3E)
         + 845735923) ^ 0x4FD87FB1 ^ (v215 - 2 * ((v215 + 111553646) & 0x7C401AF ^ v214 & 1) - 966119908));
  unsigned int v217 = v192;
  HIDWORD(v126) = v192 ^ 0x1B;
  LODWORD(v126) = v192 ^ 0xA3753B00;
  int v218 = (v126 >> 7) - ((2 * (v126 >> 7)) & 0xCCB91290);
  HIDWORD(v833) = v167;
  int v219 = (__PAIR64__(v190, v191) >> 18) - ((2 * (__PAIR64__(v190, v191) >> 18)) & 0x94208B48);
  unsigned int v220 = ((v167 >> 3) ^ 0xDEEEB7B8)
       + ((v167 >> 2) & 0x37DDF9FE ^ 0x200908E)
       + 605094657
       + ((v204 - 2154) ^ (v209 - 1374562556) ^ 0x7DC66DFE);
  HIDWORD(v126) = v196 ^ 0x13EA5;
  LODWORD(v126) = v196 ^ 0x70F00000;
  int v221 = v126 >> 18;
  HIDWORD(v126) = v194 ^ 0x301B4;
  LODWORD(v126) = v194 ^ 0xA69C0000;
  int v222 = (v126 >> 18) - ((2 * (v126 >> 18)) & 0xB1E0CC82);
  HIDWORD(v126) = v207 ^ 0xFB7C;
  LODWORD(v126) = v207 ^ 0x635C0000;
  unint64_t v832 = __PAIR64__(v185, v174);
  int v223 = (v174 ^ 0xE8FBC834)
       + (v210 ^ 0xFFB61EF6)
       + ((v126 >> 17) ^ 0x1E7CAA7D)
       + ((2 * v210) & 0xFF6C3DEC)
       + ((2 * (v126 >> 17)) & 0x3CF954FA);
  unsigned int v224 = (v220 ^ 0xEFFCDDFC)
       + ((2 * v220) & 0xDFF9BBF8)
       + ((v207 >> 10) ^ HIDWORD(a9))
       + ((2 * (v207 >> 10)) & 0x7BA370 ^ 0x31A270)
       + ((v223 - 506644851) ^ 0x200A1156)
       - ((2 * (v223 - 506644851)) & 0xBFEBDD52)
       + 1;
  unsigned int v225 = v216 - 1683868739 - ((2 * v216) & 0x3744677A);
  HIDWORD(v126) = v225 ^ 0x33BD;
  LODWORD(v126) = v225 ^ 0x9BA20000;
  int v226 = v126 >> 17;
  HIDWORD(v126) = v225 ^ 0x233BD;
  LODWORD(v126) = v225 ^ 0x9BA00000;
  int v227 = ((v126 >> 19) ^ 0x7FF7F8FE)
       + (v226 ^ 0xD3EFBEA7)
       + ((2 * v226) & 0xA7DF7D4E)
       + ((2 * (v126 >> 19)) & 0xFFEFF1FC);
  unsigned int v228 = (v224 - ((2 * v224 - 537494038) & 0x995CC854) + 1017750303) ^ v174;
  unsigned int v229 = (v218 + 1717340488) ^ (v192 >> 3) ^ (v219 - 904903260) ^ (v225 >> 10) ^ (v227
                                                                                - ((2 * v227 + 1479577782) & 0x863D7624)
                                                                                + 1865876333);
  HIDWORD(v126) = v228 ^ 0x5AC1E;
  LODWORD(v126) = v228 ^ 0xA4500000;
  int v230 = v126 >> 19;
  HIDWORD(v126) = v196 ^ 0x25;
  LODWORD(v126) = v196 ^ 0x70F13E80;
  int v231 = v126 >> 7;
  HIDWORD(v126) = v225 ^ 0x3D;
  LODWORD(v126) = v225 ^ 0x9BA23380;
  int v232 = (v126 >> 7) - ((2 * (v126 >> 7)) & 0x3136B3D6);
  HIDWORD(v126) = v207 ^ 0x7C;
  LODWORD(v126) = v207 ^ 0x635CFB00;
  int v233 = v126 >> 7;
  HIDWORD(v834) = v194;
  HIDWORD(v126) = v228 ^ 0x1AC1E;
  LODWORD(v126) = v228 ^ 0xA4540000;
  int v234 = ((v194 >> 3) ^ 0x9893E236)
       + ((v194 >> 2) & 0x277FFBFE ^ 0xDED83F93)
       + ((v208 + 1715376601) ^ (v222 - 655333823) ^ 0xBECEF798)
       + ((v228 >> 10) ^ 0x936B2568)
       + (v230 ^ 0x3E79FBAF)
       + ((v126 >> 17) ^ 0x994040A3)
       + ((2 * v230) & 0x7CF3F75E)
       - ((2 * (v126 >> 17)) & 0xCD7F7EB8)
       + ((2 * (v228 >> 10)) & 0x7B9FF8 ^ 0xFFADF52F)
       + 147034541;
  LODWORD(v833) = v217;
  unsigned int v235 = (v217 ^ 0xA3753B1B) + 193534 + (v234 ^ 0xFFFCFFF4) + ((2 * v234) & 0xFFF9FFE8) + 3086;
  HIDWORD(v126) = v228 ^ 0x1AC1E;
  LODWORD(v126) = v228 ^ 0xA4540000;
  int v236 = v126 >> 18;
  unsigned int v237 = v228;
  HIDWORD(v126) = v228 ^ 0x1E;
  LODWORD(v126) = v228 ^ 0xA455AC00;
  int v238 = v126 >> 7;
  unsigned int v239 = (v236 ^ 0x81A9990A) + (v238 ^ 0x74EDFFFF);
  HIDWORD(v126) = v207 ^ 0xFB7C;
  LODWORD(v126) = v207 ^ 0x635C0000;
  int v240 = v126 >> 18;
  unsigned int v241 = (v235 - ((2 * v235) & 0x1F4E63B0) + 262615512) ^ v217;
  HIDWORD(v126) = v241 ^ 0xAC3;
  LODWORD(v126) = v241 ^ 0xACD20000;
  int v242 = v126 >> 17;
  HIDWORD(v126) = v229 ^ 0x3811;
  LODWORD(v126) = v229 ^ 0x7B1A0000;
  int v243 = v126 >> 17;
  int v244 = v229 ^ 0x23811;
  int v245 = v229 ^ 0x7B180000;
  unsigned int v246 = v229;
  HIDWORD(v126) = v229 ^ 0x23811;
  LODWORD(v126) = v229 ^ 0x7B180000;
  int v247 = ((v126 >> 19) ^ 0x2FFB3B8F)
       + (v243 ^ 0xFFFBBBF7)
       + ((2 * v243) & 0xFFF777EE)
       + ((2 * (v126 >> 19)) & 0x5FF6771E);
  unsigned int v248 = (v221 ^ 0x59FD72E3)
       + ((v196 >> 3) ^ 0xF2519C7B)
       + (v231 ^ 0x7DFEFFEF)
       + ((v196 >> 2) & 0x389F775E ^ 0x181C4708)
       + ((2 * v221) & 0xB3FAE5C6)
       + ((2 * v231) & 0xFBFDFFDE)
       + ((v247 - ((2 * v247 + 538054900) & 0x5AA5E874) - 44303180) ^ (v229 >> 10) ^ 0xD2B3CD4B);
  HIDWORD(a34) = v207;
  unsigned int v249 = v241;
  HIDWORD(v126) = v241 ^ 0x20AC3;
  LODWORD(v126) = v241 ^ 0xACD00000;
  int v250 = ((v207 >> 3) ^ 0xDFB4649B)
       + (v233 ^ 0xFDFEEFFE)
       + (v240 ^ 0xD886081)
       + ((v207 >> 2) & 0x27BFF7E8 ^ 0x9736C8)
       + ((2 * v233) & 0xFBFDDFFC)
       - ((2 * v240) & 0xE4EF3EFC)
       + ((v241 >> 10) ^ 0x3E84CB3E)
       + (v242 ^ 0x7FDE3FE6)
       + ((v126 >> 19) ^ 0xF5CFFBFF)
       + ((v241 >> 9) & 0x5FFF78 ^ 0x566900)
       + ((2 * v242) & 0xFFBC7FCC)
       + ((2 * (v126 >> 19)) & 0xEB9FF7FE)
       + 1;
  LODWORD(v834) = v196 ^ 0x70F13EA5;
  unsigned int v251 = (v196 ^ 0x21C467EA ^ (v250 - ((2 * v250 - 663425066) & 0xA26AB29E) - 1116745414)) + (v196 ^ 0x70F13EA5);
  unsigned int v252 = v251 - 831303552 - ((2 * v251) & 0x9CE6A10E);
  unsigned int v253 = v248 - 2 * ((v248 + 733204864) & 0x321463B8 ^ v248 & 0x18) + 1573401888;
  HIDWORD(v126) = v253 ^ 0x463A0;
  LODWORD(v126) = v253 ^ 0x32100000;
  int v254 = v126 >> 19;
  HIDWORD(v836) = v246;
  HIDWORD(v126) = v246 ^ 0x11111111;
  LODWORD(v126) = v246 ^ 0x7B1A3800;
  int v255 = v126 >> 7;
  LODWORD(a48) = (v253 >> 2) & 0x2F3EEF38 ^ 0xC040828;
  HIDWORD(v126) = v241 ^ 0x20AC3;
  LODWORD(v126) = v241 ^ 0xACD00000;
  int v256 = v126 >> 18;
  int v257 = v253 ^ 0x63A0;
  int v258 = v253 ^ 0x32140000;
  unsigned int v259 = v253;
  HIDWORD(v126) = v253 ^ 0x63A0;
  LODWORD(v126) = v253 ^ 0x32140000;
  int v260 = ((v126 >> 17) ^ 0x7FECBEDB)
       + (v254 ^ 0x7D3D6AB6)
       + ((2 * v254) & 0xFA7AD56C)
       + ((2 * (v126 >> 17)) & 0xFFD97DB6);
  int v261 = v260 - ((2 * v260 + 95136990) & 0xC8C474DC);
  unsigned int v262 = v252 + 7;
  HIDWORD(v126) = (v252 + 7) ^ 0x15087;
  LODWORD(v126) = (v252 + 7) ^ 0xCE720000;
  int v263 = v126 >> 17;
  int v264 = (v252 + 7) ^ 0x35087;
  unsigned int v265 = v262 ^ 0xCE700000;
  HIDWORD(v126) = v264;
  LODWORD(v126) = v262 ^ 0xCE700000;
  int v266 = v126 >> 19;
  unsigned int v267 = ((2 * v238) & 0xE9DBFFFE) - ((2 * v236) & 0xFCACCDEA);
  int v268 = v267 + v239 + 1 - 2 * ((v267 + v239 + 1 + 157837046) & 0x4762180F ^ (v239 + 1) & 1);
  int v269 = __PAIR64__(v244, v245) >> 18;
  LODWORD(a33) = v225;
  unsigned int v270 = ((v225 >> 3) ^ 0xEE3DB188)
       + ((v225 >> 2) & 0x3A93EFFE ^ 0x22808CEE)
       + 45484033
       + ((v261 - 415756067) ^ (v259 >> 10) ^ 0xE46EBF76);
  unsigned int v271 = (2 * v270) & 0xFFF5797C;
  int v272 = (((__PAIR64__(v225 ^ 0x233BD, v225 ^ 0x9BA00000) >> 18)
         + 921924571
         + (~(2 * (__PAIR64__(v225 ^ 0x233BD, v225 ^ 0x9BA00000) >> 18)) | 0x9219184B)) ^ 0xAE682A31 ^ (v232 - 1734649365))
       + (v270 ^ 0x54341);
  HIDWORD(v126) = v249 ^ 0xFFFFFFC3;
  LODWORD(v126) = v249 ^ 0xACD20A80;
  int v273 = v126 >> 7;
  int v845 = (__PAIR64__(v257, v258) >> 18) - ((2 * (__PAIR64__(v257, v258) >> 18)) & 0xB0C3556E);
  unsigned int v274 = (v269 ^ 0x6090106C) + (v255 ^ 0xFF2D7DDB) + ((2 * v255) & 0xFE5AFBB6) - ((2 * v269) & 0x3EDFDF26) + 1;
  HIDWORD(v126) = a53 ^ 0x20;
  LODWORD(v126) = a53 ^ 0xE35EFF00;
  int v275 = v126 >> 6;
  HIDWORD(v126) = v259 ^ 0x20;
  LODWORD(v126) = v259 ^ 0x32146380;
  int v276 = (v126 >> 7) - ((2 * (v126 >> 7)) & 0x27F60E1A);
  unsigned int v277 = ((v268 + 1355448068) ^ (v237 >> 3) ^ 0x53E8AD8D) + (v225 ^ 0x9BA233BD);
  unsigned int v278 = (v277 ^ 0xFEFF76FD)
       + ((2 * v277) & 0xFDFEEDFA)
       + 16812291
       + (((v266 ^ 0xB43A0002)
         + (v263 ^ 0x7BBB2757)
         + ((2 * v263) & 0xF7764EAE)
         - ((2 * v266) & 0x978BFFFA)
         + 298769726
         - ((2 * ((v266 ^ 0xB43A0002) + (v263 ^ 0x7BBB2757) + ((2 * v263) & 0xF7764EAE) - ((2 * v266) & 0x978BFFFA) + 1)
           - 1609191092) & 0x8388092E)) ^ (v262 >> 10) ^ 0x41F79843);
  unsigned int v279 = v272 - v271 - 368269121 - ((2 * (v272 - v271 - 344897)) & 0xD423D870) + 56;
  int v280 = v279 ^ 0x1EC38;
  unsigned int v281 = v279 ^ 0xEA100000;
  HIDWORD(v126) = v279 ^ 0x1EC38;
  LODWORD(v126) = v279 ^ 0xEA100000;
  int v282 = v126 >> 19;
  HIDWORD(v126) = v279 ^ 0x1EC38;
  LODWORD(v126) = v279 ^ 0xEA100000;
  int v283 = ((v274 - ((2 * v274 + 8708976) & 0x15CE6E1C) + 724150470) ^ (v246 >> 3) ^ 0x8584700C)
       + ((v279 >> 10) ^ 0x2A189259)
       + (v282 ^ 0x410C2230)
       + ((v126 >> 17) ^ 0xE345344E)
       + ((v279 >> 9) & 0x3BD3BA ^ 0xFFCEFF4D)
       - ((2 * (v126 >> 17)) & 0x39759762)
       - ((2 * v282) & 0x7DE7BB9E)
       - 1316187295;
  unint64_t v835 = __PAIR64__(v249, v237);
  unsigned int v284 = (v237 ^ 0x18A9D063 ^ (v283 - ((2 * v283) & 0x79F8F8FA) - 1124303747)) + (v237 ^ 0xA455AC1E);
  unsigned int v285 = (v225 ^ 0x9BA233BD) + (v278 ^ 0xBDFC53FF) + ((2 * v278) & 0x7BF8A7FE) + 1107536897;
  unsigned int v286 = v285 - 352357956 - ((2 * v285) & 0xD5FEE378);
  LODWORD(a38) = v262;
  HIDWORD(v126) = v262 ^ 7;
  LODWORD(v126) = v262 ^ 0xCE735080;
  int v287 = v126 >> 7;
  HIDWORD(v126) = v286 ^ 0x171BC;
  LODWORD(v126) = v286 ^ 0xEAFE0000;
  int v288 = v126 >> 17;
  HIDWORD(v126) = a53 ^ 0x720;
  LODWORD(v126) = a53 ^ 0xE35EF800;
  int v289 = v126 >> 11;
  unsigned int v290 = v284 - 349332224 - ((2 * v284) & 0xD65B3A3E) + 31;
  HIDWORD(v126) = v290 ^ 0x59D1F;
  LODWORD(v126) = v290 ^ 0xEB280000;
  int v291 = v126 >> 19;
  int v292 = __PAIR64__(v264, v265) >> 18;
  HIDWORD(v126) = v286 ^ 0x771BC;
  LODWORD(v126) = v286 ^ 0xEAF80000;
  int v293 = ((v249 >> 3) ^ 0x6AE4BA26)
       + (v256 ^ 0x7FCFFEBD)
       + ((2 * v256) & 0xFF9FFD7A)
       + ((v249 >> 2) & 0x3EFDF6FC ^ 0x2A3482B0)
       + 11601349
       + (((v126 >> 19) - ((2 * (v126 >> 19)) & 0xDB969542) + 1842039457) ^ (v286 >> 10) ^ (v288
                                                                                          - ((2 * v288) & 0x9663B9A4)
                                                                                          + 1261558994) ^ 0x26C029AF);
  unsigned int v294 = (v273 ^ 0xDFBFDAEF) + ((2 * v273) & 0xBF7FB5DE) + (v293 ^ 0x2108183) - ((2 * v293) & 0xFBDEFCF8) + 1;
  HIDWORD(v126) = a53 ^ 0x15EFF20;
  LODWORD(v126) = a53 ^ 0xE3FFFFFF;
  int v295 = (__PAIR64__(v280, v281) >> 18) - ((2 * (__PAIR64__(v280, v281) >> 18)) & 0x474CEC6C);
  int v296 = ((v126 >> 25) ^ 0x40410870)
       + (v289 ^ 0x8A100081)
       + (v275 ^ 0xF547FBC3)
       + ((2 * v275) & 0xEA8FF786)
       - ((2 * (v126 >> 25)) & 0x7F7DEF1E)
       - ((2 * v289) & 0xEBDFFEFC)
       + 2;
  int v297 = v296 - ((2 * v296 - 2133985644) & 0xCCFE853A);
  unsigned int v298 = v272 - v271 - 368269121 - ((2 * (v272 - v271 - 344897)) & 0xD423D870) + 56;
  HIDWORD(v126) = v298 ^ 0x38;
  LODWORD(v126) = v298 ^ 0xEA11EC00;
  int v299 = (v126 >> 7) - ((2 * (v126 >> 7)) & 0xDF251B2E);
  HIDWORD(v126) = v286 ^ 0x3C;
  LODWORD(v126) = v286 ^ 0xEAFF7180;
  int v300 = v126 >> 7;
  HIDWORD(v126) = v290 ^ 0x19D1F;
  LODWORD(v126) = v290 ^ 0xEB2C0000;
  int v301 = v126 >> 17;
  HIDWORD(v126) = v290 ^ 0x19D1F;
  LODWORD(v126) = v290 ^ 0xEB2C0000;
  int v839 = v126 >> 18;
  int v302 = ((v259 >> 3) ^ 0xB1DDFBE8) + a48 + 1214285924 + ((v845 + 1482795703) ^ (v276 - 1812265203) ^ 0xCB9AADBA);
  unsigned int v303 = (v302 ^ 0x7FFFEFE3)
       + ((2 * v302) & 0xFFFFDFC6)
       + ((v290 >> 10) ^ 0x78C72680)
       + (v301 ^ 0x5FE74CDB)
       + (v291 ^ 0x2440840)
       + ((2 * (v290 >> 10)) & 0x7BDBCE ^ 0x7192CE)
       + ((2 * v301) & 0xBFCE99B6)
       - ((2 * v291) & 0xFB77EF7E)
       + 1;
  unsigned int v304 = (v249 ^ 0x783DD935 ^ (v303 - ((2 * v303 + 1236113972) & 0xA9DFA7EC) + 2043060496)) + (v249 ^ 0xACD20AC3);
  unsigned int v305 = v304 - 197921478 - ((2 * v304) & 0xE867EA74);
  unsigned int v306 = (v292 ^ 0x8C0168AB) + (v287 ^ 0xF7DDFAF3) + ((2 * v287) & 0xEFBBF5E6) - ((2 * v292) & 0xE7FD2EA8) + 1;
  unsigned int v307 = v306 - ((2 * v306 - 129943358) & 0xF86EB64E);
  HIDWORD(v126) = a53 ^ 0x1EFF20;
  LODWORD(v126) = a53 ^ 0xE3400000;
  int v308 = v126 >> 22;
  HIDWORD(v126) = v305 ^ 0x3F53A;
  LODWORD(v126) = v305 ^ 0xF4300000;
  int v309 = (v126 >> 19) - ((2 * (v126 >> 19)) & 0x9F5131AE);
  HIDWORD(v126) = a53 ^ 0x1F20;
  LODWORD(v126) = a53 ^ 0xE35EE000;
  int v310 = v126 >> 13;
  HIDWORD(v840) = a59 ^ 0xB287664C;
  unsigned int v855 = v298;
  unsigned int v311 = ((v298 >> 3) ^ 0x7AB1E63A)
       + ((v298 >> 2) & 0xFE7B77A ^ 0xA84330A)
       - 1744034749
       + ((v295 + 598111798) ^ (v299 - 275608169) ^ 0xCC34FBA1);
  unsigned int v312 = v311 - ((2 * v311) & 0x620AF350);
  LODWORD(a48) = v294 - ((2 * v294 + 1012877082) & 0x24312628) - 1337444703;
  LODWORD(v828) = a48 ^ 0x9314;
  HIDWORD(v126) = a48 ^ 0x9314;
  LODWORD(v126) = a48 ^ 0x92180000;
  int v313 = v126 >> 17;
  HIDWORD(v126) = a48 ^ 0x9314;
  LODWORD(v126) = a48 ^ 0x92180000;
  int v314 = ((v307 + 2019030920) ^ (a38 >> 3) ^ 0xE5F93137)
       + ((a48 >> 10) ^ 0xCDD369B3)
       + (v313 ^ 0xDDA77ABB)
       + ((v126 >> 19) ^ 0x98A98289)
       + ((2 * (a48 >> 10)) & 0x6FDF2E ^ 0x490C08)
       + ((2 * v313) & 0xBB4EF576)
       - ((2 * (v126 >> 19)) & 0xCEACFAEC)
       - 1145629915;
  HIDWORD(v126) = a53;
  LODWORD(v126) = a53 ^ 0xE35EFF20;
  HIDWORD(v827) = a53 ^ 0xE35EFF20;
  unsigned int v315 = (a59 ^ a53 ^ 0x51D9996C)
       + (((a56 ^ 0xE64661E1) + (a59 ^ 0xB287664C)) ^ 0x5FF6BFF7)
       + ((2 * ((a56 ^ 0xE64661E1) + (a59 ^ 0xB287664C))) & 0xBFED7FEE)
       - 1610006519;
  unsigned int v316 = (a57 ^ ((a53 ^ 0xE35EFF20)
               + (a56 ^ a53 ^ 0x5189EC1)
               - ((2 * ((a53 ^ 0xE35EFF20) + (a56 ^ a53 ^ 0x5189EC1))) & 0x8729DCE2)
               - 1013649807) ^ 0x45F24C3C ^ (v297 - 1494860313))
       + 694531638;
  int v317 = (((a53 ^ 0xE35EFF20) + (a56 ^ 0xE64661E1)) ^ 0xC20403)
       + (v308 ^ 0xEE9DF6FF)
       + ((v126 >> 2) ^ 0xD5D35FDE)
       + (v310 ^ 0x8C804104)
       + ((2 * v308) & 0xDD3BEDFE)
       + ((2 * (v126 >> 2)) & 0xABA6BFBC)
       - ((2 * ((a53 ^ 0xE35EFF20) + (a56 ^ 0xE64661E1))) & 0xFE7BF7F8)
       - ((2 * v310) & 0xE6FF7DF6)
       + (v315 ^ 0xBAADBD6E)
       + ((2 * v315) & 0x755B7ADC)
       + (v316 ^ 0xFFF571E1)
       + ((2 * v316) & 0xFFEAE3C2);
  int v318 = v169 ^ 0x361F3661 | ((v859 ^ 0x90) + 1690772880 - ((2 * (v859 ^ 0x90)) & 0x120)) ^ 0x64C72590;
  unsigned int v319 = v317 + (v318 ^ 0xCFD1F79F) + ((2 * v318) & 0x9FA3EF3E);
  HIDWORD(v126) = v305 ^ 0x1F53A;
  LODWORD(v126) = v305 ^ 0xF4320000;
  int v320 = (v126 >> 17) - ((2 * (v126 >> 17)) & 0x171541CA);
  LODWORD(a35) = v259;
  int v321 = (a35 ^ 0xCDEB9C5F) + (a35 ^ 0x597E3D10 ^ (v314 - ((2 * v314) & 0xD6D4BD60) + 1802133168)) + 1;
  HIDWORD(v126) = v286 ^ 0x371BC;
  LODWORD(v126) = v286 ^ 0xEAFC0000;
  int v322 = v126 >> 18;
  unsigned int v323 = v319 + 2;
  unsigned int v324 = v319 + 2 - ((2 * (v319 + 2) + 1202616920) & 0x8D254678) - 362160024;
  int v325 = (v324 << 21) ^ 0x67800000;
  unsigned int v326 = ((v325 - ((2 * v325) & 0x97400000) - 876801048) & 0xF8000000 | (v324 >> 11)) ^ 0xC818D254;
  unsigned int v327 = v326 - 2 * (v326 & 0x1012E4AF ^ (v324 >> 11) & 8);
  unsigned int v328 = ((v305 >> 10) ^ 0x803D467D)
       + 2147464577
       + ((v305 >> 9) & 0x7F6AFE ^ 0xFF85F705)
       + ((v309 + 1336449239) ^ (v320 - 1953849115) ^ 0xC4223832);
  LODWORD(a47) = v290;
  HIDWORD(v126) = v290 ^ 0x1F;
  LODWORD(v126) = v290 ^ 0xEB2D9D00;
  int v329 = v126 >> 7;
  unsigned int v330 = (v324 ^ 0xC692A33C)
       + (a53 ^ 0xE35EFF20)
       + 1844465651
       - ((2 * ((v324 ^ 0xC692A33C) + (a53 ^ 0xE35EFF20))) & 0xDBE09FE6);
  HIDWORD(v126) = (v324 >> 11) ^ 0xD254;
  LODWORD(v126) = (v327 - 1798118233) ^ 0x94D00000;
  int v331 = (v126 >> 19) + 1365315328 - ((2 * (v126 >> 19)) & 0xA2C21FB2);
  unsigned int v332 = v325 + 1982533280 - ((2 * v325) & 0xEC400000);
  unsigned int v333 = (v328 - 728355222 + (~(2 * v328) | 0x56D3A32D)) ^ (v312 - 1325041240);
  unsigned int v334 = v321 - ((2 * v321) & 0xDA0C373E) + 1829116831;
  HIDWORD(v126) = v334 ^ 0x61B9F;
  LODWORD(v126) = v334 ^ 0x6D000000;
  int v335 = v126 >> 19;
  v331 += 217;
  HIDWORD(v126) = v331 ^ 0xD9;
  LODWORD(v126) = v331 ^ 0x51610F00;
  int v336 = (v126 >> 8) - 15840601 - ((2 * (v126 >> 8)) & 0xFE1C954E);
  HIDWORD(v126) = v324 ^ 0x92A33C;
  LODWORD(v126) = v324 ^ 0xC6000000;
  int v337 = v126 >> 25;
  HIDWORD(v126) = v324 ^ 0x12A33C;
  LODWORD(v126) = v324 ^ 0xC6800000;
  int v338 = v126 >> 22;
  HIDWORD(v126) = v334 ^ 0x1B9F;
  LODWORD(v126) = v334 ^ 0x6D060000;
  unsigned int v339 = (v332 ^ 0x762B0EA0 | (v324 >> 11) ^ 0x18D254)
       - ((2 * (v332 ^ 0x762B0EA0 | (v324 >> 11) ^ 0x18D254)) & 0xFE1270C2);
  HIDWORD(v843) = a56 ^ 0xE64661E1;
  unint64_t v837 = __PAIR64__(v333, v334);
  int v340 = ((v334 >> 10) ^ 0x7FF5B6D1)
       + ((v334 >> 9) & 0x5DEEAE ^ 0x14820C)
       - 2146367319
       + (((v126 >> 17) - ((2 * (v126 >> 17)) & 0x11D1A5B2) + 149476057) ^ (v335 - ((2 * v335) & 0xADE5E388) + 1458762180) ^ 0x5E1A231D);
  HIDWORD(v126) = v333 ^ 0x157C1;
  LODWORD(v126) = v333 ^ 0x65920000;
  int v341 = (v126 >> 17) - ((2 * (v126 >> 17)) & 0x9BE28AFE);
  unsigned int v342 = v336 ^ 0xFF0E4AA7 | (((v324 << 26) ^ 0xF0000000) + 668730235 - ((2 * ((v324 << 26) ^ 0xF0000000)) & 0x48000000)) ^ 0x27DC037B;
  HIDWORD(v126) = v333 ^ 0x357C1;
  LODWORD(v126) = v333 ^ 0x65900000;
  int v343 = (v126 >> 19) - ((2 * (v126 >> 19)) & 0x274CF462);
  HIDWORD(v126) = v324 ^ 0x33C;
  LODWORD(v126) = v324 ^ 0xC692A000;
  int v344 = v126 >> 13;
  unsigned int v345 = ((v286 >> 3) ^ 0x3F1FEFB7)
       + (v300 ^ 0x7ED77D9F)
       + (v322 ^ 0x9446048)
       + ((v286 >> 2) & 0x3B7FFCFE ^ 0xC5C02391)
       + ((2 * v300) & 0xFDAEFB3E)
       - ((2 * v322) & 0xED773F6E);
  unsigned int v346 = (v298 ^ 0x15EE13C7) + (v340 ^ 0xFBEDFD74) + ((2 * v340) & 0xF7DBFAE8) + 68289165;
  unsigned int v347 = v345 + (v346 ^ 0xB7EFBBDF) + ((2 * v346) & 0x6FDF77BE) + 3;
  unsigned int v348 = v347 - ((2 * v347 + 996723056) & 0x9D8393CE);
  unsigned int v349 = ((v339 + 2131310689) ^ 0x5E76EAEB ^ (v342 - ((2 * v342) & 0x42FFA514) + 562025098))
       + (a56 ^ v330 ^ 0xC01338F9 ^ ((a56 ^ 0x19B99E1E)
                                   + (v324 ^ 0xC692A33C)
                                   + 1
                                   - ((2 * ((a56 ^ 0x19B99E1E) + (v324 ^ 0xC692A33C) + 1)) & 0x974A2DD6)
                                   + 1269110507));
  unsigned int v350 = (a59 ^ 0xB287664C) + (v337 ^ 0xB6FBFE35) + ((2 * v337) & 0x6DF7FC6A) + 1224999371;
  unsigned int v351 = (v350 ^ 0x7BC7DFF7) + ((2 * v350) & 0xF78FBFEE) + (v349 ^ 0x8028C043) - ((2 * v349) & 0xFFAE7F78) + 1;
  int v352 = ((v333 >> 10) ^ 0x7B62131A)
       + ((v333 >> 9) & 0x76EF9E ^ 0x32C98A)
       - 2071689167
       + ((v341 - 839826049) ^ (v343 - 1817806287) ^ 0x5E573F4E);
  HIDWORD(v831) = v305;
  HIDWORD(v126) = v305 ^ 0x3A;
  LODWORD(v126) = v305 ^ 0xF433F500;
  LODWORD(v846) = v126 >> 7;
  unsigned int v353 = ((a47 >> 3) ^ 0x1CA4E7E3)
       + (v329 ^ 0x7EF3BCFF)
       + (v839 ^ 0x57BFDDBE)
       + ((a47 >> 2) & 0x3C7D577E ^ 0xC7B6B8B9)
       + ((2 * v329) & 0xFDE779FE)
       + ((2 * v839) & 0xAF7FBB7C)
       + (v352 ^ 0x80D94246)
       - ((2 * v352) & 0xFE4D7B72)
       + 3;
  HIDWORD(v126) = v323;
  LODWORD(v126) = v324 ^ 0xC692A33C;
  unsigned int v354 = (a53 ^ 0x25CC5C1C ^ v324)
       + (((v324 ^ 0xC692A33C) + (a56 ^ 0xE64661E1)) ^ 0x133162)
       - ((2 * ((v324 ^ 0xC692A33C) + (a56 ^ 0xE64661E1))) & 0xFFD99D3A)
       - 1257826;
  int v355 = (((a56 ^ 0xE64661E1) + (a53 ^ 0x1CA100DF) + 1) ^ 0x5D5D7390)
       + ((2 * ((a56 ^ 0xE64661E1) + (a53 ^ 0x1CA100DF) + 1)) & 0xBABAE720)
       + (v338 ^ 0x80260F03)
       + (v344 ^ 0xF36FFEFB)
       + ((v126 >> 2) ^ 0xDAF95BEF)
       + ((2 * v344) & 0xE6DFFDF6)
       + ((2 * (v126 >> 2)) & 0xB5F2B7DE)
       - ((2 * v338) & 0xFFB3E1F8)
       + (v354 ^ 0x5DFEFDFD)
       + ((2 * v354) & 0xBBFDFBFA)
       - 166452090
       + (v842 ^ 0xFC7AB225 ^ (v351 - ((2 * v351 + 126065030) & 0x72983D4E) - 1123161238));
  unsigned int v356 = v355 + 1901593577 - ((2 * v355) & 0xE2B007D2);
  HIDWORD(v126) = v305 ^ 0x3F53A;
  LODWORD(v126) = v305 ^ 0xF4300000;
  LODWORD(v843) = v126 >> 18;
  LODWORD(v836) = v286;
  int v357 = (v286 ^ 0x15008E43) + (v286 ^ 0x664F0F5C ^ (v353 - ((2 * v353 + 224632182) & 0x1960FDC0) + 862080411)) + 1;
  unsigned int v358 = ((2 * v357) & 0x3FEDDFE6) + (v357 ^ 0x9FF6EFF3);
  HIDWORD(v126) = a48 ^ 0x14;
  LODWORD(v126) = a48 ^ 0x92189300;
  LODWORD(v829) = (v126 >> 7) - ((2 * (v126 >> 7)) & 0xB3477504);
  unsigned int v359 = ((2 * ((v356 ^ 0x715803E9) + (v324 ^ 0xC692A33C))) & 0xDAEDECBC)
       + (((v356 ^ 0x715803E9) + (v324 ^ 0xC692A33C)) ^ 0xED76F65E);
  HIDWORD(v126) = a48 ^ 0x9314;
  LODWORD(v126) = a48 ^ 0x92180000;
  HIDWORD(v828) = (v126 >> 18) - ((2 * (v126 >> 18)) & 0x6007F2AC);
  HIDWORD(v126) = v356 ^ 0x29;
  LODWORD(v126) = v356 ^ 0x715803C0;
  int v360 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0x4E95FB1C);
  HIDWORD(v126) = v356 ^ 0x3E9;
  LODWORD(v126) = v356 ^ 0x71580000;
  int v361 = v126 >> 11;
  HIDWORD(v126) = v356 ^ 0x3E9;
  LODWORD(v126) = v356 ^ 0x71580000;
  int v362 = v126 >> 13;
  int v363 = (v356 ^ 0x715803E9) + 1;
  HIDWORD(v126) = v356 ^ 0x15803E9;
  LODWORD(v126) = v356 ^ 0x70000000;
  int v364 = ((v126 >> 25) ^ 0xC4ECEF3B)
       + ((2 * (v126 >> 25)) & 0x89D9DE76)
       + 991105221
       + ((v361 - ((2 * v361) & 0xF732B82E) - 73835497) ^ (v360 + 659225998) ^ 0xDCD3A199);
  HIDWORD(v126) = v356 ^ 0x1803E9;
  LODWORD(v126) = v356 ^ 0x71400000;
  int v365 = v126 >> 22;
  unsigned int v366 = (v348 + 1819684511) ^ v298;
  HIDWORD(v126) = v366 ^ 0x25DF;
  LODWORD(v126) = v366 ^ 0x24D00000;
  unsigned int v367 = (v330 ^ 0x6DF04FF3)
       + ((v363 + (v324 ^ 0x396D5CC3) - ((2 * (v363 + (v324 ^ 0x396D5CC3))) & 0xD925CFC8) - 325916700) ^ ((v356 ^ 0x715803E9) + (a53 ^ 0xE35EFF20) - ((2 * ((v356 ^ 0x715803E9) + (a53 ^ 0xE35EFF20))) & 0x8BDA4476) - 974314949) ^ 0xD6803A20);
  int v368 = (v126 >> 19) - ((2 * (v126 >> 19)) & 0x9236CCBA);
  HIDWORD(v126) = v356 ^ 1;
  LODWORD(v126) = v356 ^ 0x715803E8;
  int v369 = v126 >> 2;
  unsigned int v370 = (a53 ^ 0xE35EFF20)
       + (((a53 ^ 0x9206FCC9 ^ v356) + 310970786 + v359) ^ 0x6BFCF5DD)
       + ((2 * ((a53 ^ 0x9206FCC9 ^ v356) + 310970786 + v359)) & 0xD7F9EBBA)
       - 1811740125;
  unsigned int v371 = (v370 ^ 0x71D14BAF)
       + ((2 * v370) & 0xE3A2975E)
       - 1909541807
       + (a56 ^ 0x48F3219F ^ (v364 - ((2 * v364) & 0x5D6A80FC) - 1363853186));
  HIDWORD(v126) = v366 ^ 0x25DF;
  LODWORD(v126) = v366 ^ 0x24D00000;
  int v372 = (v126 >> 17) - ((2 * (v126 >> 17)) & 0xF653F92A);
  int v373 = (v365 ^ 0x4A8004A0)
       + (v369 ^ 0x3BEEEEEA)
       + (v362 ^ 0x3F593F7)
       + ((2 * v369) & 0x77DDDDD4)
       + ((2 * v362) & 0x7EB27EE)
       - ((2 * v365) & 0x6AFFF6BE)
       + ((v367 + 1) ^ 0xC3DFBF3F)
       + ((2 * (v367 + 1)) & 0x87BF7E7E)
       - 1313097408
       + (v830 ^ 0x6F1B8400 ^ (((2 * v371) & 0xDEECDBBE)
                             + (v371 ^ 0xEF766DDF)
                             - ((2 * (((2 * v371) & 0xDEECDBBE) + (v371 ^ 0xEF766DDF)) + 565233614) & 0xB5905C40)
                             - 341798393));
  unsigned int v374 = v373 - 32169984 - ((2 * v373) & 0xFC2A524E);
  LODWORD(v840) = v358;
  unsigned int v375 = v374 + 2343;
  unsigned int v376 = (v374 + 2343) ^ 0xFE152927;
  unsigned int v377 = (v356 ^ 0x8EA7FC16) + v376 - 442637329 - ((2 * ((v356 ^ 0x8EA7FC16) + v376 + 1)) & 0xCB3BC7DC);
  HIDWORD(v126) = (v374 + 2343) ^ 0x927;
  LODWORD(v126) = (v374 + 2343) ^ 0xFE152000;
  int v378 = (v126 >> 13) - ((2 * (v126 >> 13)) & 0x6F1EE06);
  HIDWORD(v126) = (v374 + 2343) ^ 0x127;
  LODWORD(v126) = (v374 + 2343) ^ 0xFE152800;
  int v379 = (v126 >> 11) - ((2 * (v126 >> 11)) & 0x7602249E);
  unsigned int v380 = (v356 ^ 0x715803E9) + ((2 * (v374 + 2343)) ^ 0x83D18DB9) + ((4 * (v374 + 2343)) & 0xFFF7BFEC ^ 0xF854A48C);
  HIDWORD(v126) = -2352 - v374;
  LODWORD(v126) = (v374 + 2343) ^ 0xFE152924;
  int v381 = (v126 >> 2) - ((2 * (v126 >> 2)) & 0xE25818B4);
  HIDWORD(v126) = (v374 + 2343) ^ 0x152927;
  LODWORD(v126) = (v374 + 2343) ^ 0xFE000000;
  int v382 = v126 >> 22;
  LODWORD(v126) = -2344 - v374;
  int v383 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0xE580F6A2);
  unsigned int v384 = (v382 ^ 0x9330) - ((2 * v382) & 0xFFFED99E) - 37680 + ((v381 - 248771494) ^ (v378 - 2089224445) ^ 0x7254FB59);
  HIDWORD(v126) = v375 ^ 0xFFFFFFE7;
  LODWORD(v126) = v375 ^ 0xFE152900;
  unsigned int v385 = (v377 ^ (v376 + (v324 ^ 0xC692A33C) - ((2 * (v376 + (v324 ^ 0xC692A33C))) & 0xA0C424BA) + 1348604509) ^ 0xB5FFF1B3)
       - v359;
  int v386 = (a53 ^ 0xE35EFF20)
       + ((v379 + 989925967) ^ ((v126 >> 6) - ((2 * (v126 >> 6)) & 0x861ED25E) - 1022400209) ^ (v383 + 1925217105) ^ 0x7531FFCE);
  unsigned int v387 = ((2 * v324) ^ 0x62C2F9C7)
       + ((4 * v324) & 0xDFCF7F7C ^ 0x1A4A0C70)
       + ((v380 - 2147213303) ^ 0x28802205)
       - ((2 * (v380 - 2147213303)) & 0xAEFFBBF4)
       + ((v386 + 1) ^ 0xFDDFDB7F)
       + ((2 * (v386 + 1)) & 0xFBBFB6FE)
       + 1;
  unsigned int v388 = (HIDWORD(v829) ^ 0xE07C119A ^ (v387 - ((2 * v387 + 1060616080) & 0x60C01444) - 805575190))
       + ((v384 - ((2 * v384) & 0x2E18BDE2) - 1760796943) ^ (v385 - ((2 * v385 + 451800252) & 0x173FADD0) + 2031537478) ^ 0x1C938819);
  unsigned int v389 = (2 * v388) & 0xD7E38BB4;
  v388 += 1811006938;
  unsigned int v390 = v388 - v389;
  HIDWORD(v126) = v388 ^ 2;
  LODWORD(v126) = (v388 - v389) ^ 0x6BF1C5D8;
  int v391 = v126 >> 2;
  unsigned int v392 = v363 + (v390 ^ 0x940E3A25);
  HIDWORD(v126) = v390 ^ 0x1A;
  LODWORD(v126) = v390 ^ 0x6BF1C5C0;
  int v393 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0xC57CC1BE);
  HIDWORD(v126) = v390 ^ 0x31C5DA;
  LODWORD(v126) = v390 ^ 0x6BC00000;
  int v394 = v126 >> 22;
  int v395 = (v375 ^ 0x1EAD6D8) + 1;
  int v396 = (((v390 ^ 0x6BF1C5DA) + v395) ^ 0x2DEFEFDB) - 770699227 + ((2 * ((v390 ^ 0x6BF1C5DA) + v395)) & 0x5BDFDFB6);
  unsigned int v397 = (v356 ^ 0x8EA7FC16)
       + (((v390 ^ 0x6BF1C5DA) + v376) ^ 0x77F777FC)
       + ((2 * ((v390 ^ 0x6BF1C5DA) + v376)) & 0xEFEEEFF8)
       - 2012706811;
  unsigned int v398 = ((2 * v392) & 0xB772BF7E) + (v392 ^ 0x5BB95FBF) + (v397 ^ 0xBBF7FAF2) + ((2 * v397) & 0x77EFF5E4);
  unsigned int v399 = (v377 ^ 0xE59DE3EE)
       + ((v396 + (v356 ^ 0x1AA9C633 ^ v390)) ^ 0xFFECACFF)
       + ((2 * (v396 + (v356 ^ 0x1AA9C633 ^ v390))) & 0xFFD959FE);
  HIDWORD(v126) = v390 ^ 0x1F1C5DA;
  LODWORD(v126) = v390 ^ 0x6A000000;
  int v400 = v126 >> 25;
  HIDWORD(v126) = v390 ^ 0x5DA;
  LODWORD(v126) = v390 ^ 0x6BF1C000;
  int v401 = v126 >> 13;
  HIDWORD(v126) = v390 ^ 0x5DA;
  LODWORD(v126) = v390 ^ 0x6BF1C000;
  int v402 = (v400 ^ 0xE1D2FFFF)
       + ((2 * v400) & 0xC3A5FFFE)
       + 506265602
       + ((v393 + 1656643807) ^ ((v126 >> 11) - ((2 * (v126 >> 11)) & 0xA727F9F2) - 745276167) ^ 0x4ED263D9);
  unsigned int v403 = (v324 ^ 0xC692A33C) + (v402 ^ 0x6F9739DA) + ((2 * v402) & 0xDF2E73B4) - 1872181722;
  unsigned int v404 = ((v398 - ((2 * v398 - 794998114) & 0xD49F313C) - 761381395) ^ 0x1B536946 ^ (v403
                                                                                   - ((2 * v403) & 0xE239E3B0)
                                                                                   - 249761320))
       + 672521749;
  unsigned int v405 = HIDWORD(v830) + (v404 ^ 0xF9FBFBF7) + ((2 * v404) & 0xF3F7F7EE) + 100926473;
  unsigned int v406 = (v391 ^ 0xEFE6FDF5)
       + (v394 ^ 0x477ABBAF)
       + (v401 ^ 0xC8090350)
       + ((2 * v391) & 0xDFCDFBEA)
       + ((2 * v394) & 0x8EF5775E)
       - ((2 * v401) & 0x6FEDF95E)
       + ((v399 + 1266433) ^ 0x890918)
       - ((2 * (v399 + 1266433)) & 0xFEEDEDCE)
       + (v405 ^ 0x6FB91FEE)
       + 2;
  unsigned int v407 = v406
       + ((2 * v405) & 0xDF723FDC)
       - ((2 * (v406 + ((2 * v405) & 0xDF723FDC)) + 547763208) & 0x4921F9F8)
       - 1260120320;
  int v408 = (v407 ^ 0x2490FCFC)
       + (v390 ^ 0x6BF1C5DA)
       + 864239852
       - ((2 * ((v407 ^ 0x2490FCFC) + (v390 ^ 0x6BF1C5DA))) & 0x670681D8);
  HIDWORD(v126) = v407 ^ 0x3C;
  LODWORD(v126) = v407 ^ 0x2490FCC0;
  int v409 = v126 >> 6;
  HIDWORD(v126) = v407 ^ 0x10FCFC;
  LODWORD(v126) = v407 ^ 0x24800000;
  int v410 = v126 >> 22;
  int v411 = ((2 * a47) ^ 0xB8AC5C8)
       + ((4 * a47) & 0xBBA3FFEC ^ 0xA8A2746C)
       + 573440010
       + ((v372 + 2066349205) ^ (v366 >> 10) ^ (v368 - 920951203) ^ 0xB23BAEC1);
  HIDWORD(v126) = v407 ^ 0xFCFCFCFC;
  LODWORD(v126) = v407 ^ 0x2490E000;
  int v412 = v126 >> 13;
  HIDWORD(v126) = v407 ^ 0xFCFCFCFC;
  LODWORD(v126) = v407 ^ 0x2490F800;
  int v413 = v126 >> 11;
  HIDWORD(v126) = v407 ^ 0x90FCFC;
  LODWORD(v126) = v407 ^ 0x24000000;
  unsigned int v414 = (((v407 ^ 0x2490FCFC) + v395 - ((2 * ((v407 ^ 0x2490FCFC) + v395)) & 0x325B56B0) - 1725060264) ^ v408 ^ 0xAAAEEBB4)
       + v396;
  int v415 = (v356 ^ 0x715803E9)
       + (v413 ^ 0x8801A881)
       + ((v126 >> 25) ^ 0xEFF3FF9D)
       + (v409 ^ 0x5DDFFF97)
       + ((2 * (v126 >> 25)) & 0xDFE7FF3A)
       + ((2 * v409) & 0xBBBFFF2E)
       - ((2 * v413) & 0xEFFCAEFC)
       + 707418187;
  unsigned int v416 = (v415 ^ 0x7BA7FFD5)
       + ((2 * v415) & 0xF74FFFAA)
       + (v375 ^ 0xA3F4FFB ^ ((v375 ^ 0x257A2A24 ^ v407)
                            + (v408 ^ 0x338340EC)
                            - 198547746
                            + (~(2 * ((v375 ^ 0x257A2A24 ^ v407) + (v408 ^ 0x338340EC) + 1)) | 0x17AB3247)));
  HIDWORD(v126) = v406;
  LODWORD(v126) = v407 ^ 0x2490FCFC;
  int v417 = (v831 ^ 0x6A8E5594) + ((v416 - 2074607573) ^ 0x73EF7F9B) + ((2 * (v416 - 2074607573)) & 0xE7DEFF36) + 19999078;
  int v418 = (v410 ^ 0x90A2E00)
       + (v412 ^ 0x92200812)
       + ((v126 >> 2) ^ 0x67F39FAF)
       + ((2 * (v126 >> 2)) & 0xCFE73F5E)
       - ((2 * v410) & 0xEDEBA3FE)
       - ((2 * v412) & 0xDBBFEFDA)
       + (v414 ^ 0x9FFF0B5E)
       + ((2 * v414) & 0x3FFE16BC)
       + (v417 ^ 0x5F7FFFEB)
       + ((2 * v417) & 0xBEFFFFD6)
       + 2;
  int v419 = v418 - ((2 * v418 - 87671320) & 0xD98124CE);
  int v420 = v419 + 1780724059;
  HIDWORD(v126) = (v419 + 1780724059) ^ 0xFFFFFFE7;
  LODWORD(v126) = (v419 + 1780724059) ^ 0x6CC09240;
  int v421 = v126 >> 6;
  HIDWORD(v126) = (v419 + 1780724059) ^ 0x1267;
  LODWORD(v126) = (v419 + 1780724059) ^ 0x6CC08000;
  int v422 = v126 >> 13;
  HIDWORD(v126) = (v419 + 1780724059) ^ 0x267;
  LODWORD(v126) = (v419 + 1780724059) ^ 0x6CC09000;
  int v423 = v126 >> 11;
  HIDWORD(v126) = (v419 + 1780724059) ^ 0xC09267;
  LODWORD(v126) = (v419 + 1780724059) ^ 0x6C000000;
  int v424 = ((v829 - 643581310) ^ (a48 >> 3) ^ (HIDWORD(v828) + 805566806) ^ 0x41CAE49)
       + (v411 ^ 0xB69DE57F)
       + ((2 * v411) & 0x6D3BCAFE);
  int v425 = (v419 + 1780724059) ^ 0x6CC09267;
  unsigned int v426 = ((2 * (v425 + (v390 ^ 0x6BF1C5DA))) & 0xE55FDB56) + ((v425 + (v390 ^ 0x6BF1C5DA)) ^ 0x72AFEDAB);
  unsigned int v427 = (v407 ^ 0xDB6F0303) + 1;
  int v428 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0x764352B8);
  HIDWORD(v126) = -1780724088 - v419;
  LODWORD(v126) = (v419 + 1780724059) ^ 0x6CC09264;
  int v429 = v126 >> 2;
  unsigned int v430 = (v425 + v427 + 1551009053 - ((2 * (v425 + v427)) & 0xB8E50A3A)) ^ 0x5C72851D ^ (v426 - 1924132267);
  unsigned int v431 = (v423 ^ 0xDFB53FD7) + (v421 ^ 0xDFEFEBBD) + ((2 * v421) & 0xBFDFD77A) + ((2 * v423) & 0xBF6A7FAE);
  HIDWORD(v126) = v420 ^ 0x9267;
  LODWORD(v126) = v420 ^ 0x6CC00000;
  unsigned int v432 = (v390 ^ 0x6BF1C5DA)
       + ((v425 + (v407 ^ 0x2490FCFC)) ^ 0x7E0F6FF6)
       + ((2 * (v425 + (v407 ^ 0x2490FCFC))) & 0xFC1EDFEC)
       + v426;
  int v433 = ((v126 >> 22) ^ 0xFAE7E1DF)
       + (v429 ^ 0x5D2FFF7B)
       + (v422 ^ 0x52850006)
       + ((2 * (v126 >> 22)) & 0xF5CFC3BE)
       + ((2 * v429) & 0xBA5FFEF6)
       - ((2 * v422) & 0x5AF5FFF2)
       + 1;
  unsigned int v434 = ((v428 - 1155421860) ^ 0xAEBD57E9 ^ (v431 - ((2 * v431 + 11905240) & 0x2B39FD6A) + 1442304801)) + v376;
  int v435 = ((v430 + 876909028 - ((2 * v430) & 0x688923C8)) ^ 0x344491E4) + (v390 ^ 0x4F613926 ^ v407);
  unsigned int v436 = (v853 ^ 0xC305FF02) + ((v432 + 255894111) ^ 0xDCEEDC7F) + ((2 * (v432 + 255894111)) & 0xB9DDB8FE) + 588325761;
  unsigned int v437 = (v436 ^ 0x858F98)
       - ((2 * v436) & 0xFEF4E0CE)
       + (v434 ^ 0x31FF4F9B)
       + ((2 * v434) & 0x63FE9F36)
       + ((v433 - ((2 * v433 - 1429848770) & 0xE08891F8) - 978884709) ^ 0x8C55097 ^ (v435
                                                                                   - ((2 * v435) & 0xF10230D6)
                                                                                   + 2021726315))
       + 1752014022;
  unsigned int v438 = v437 - 49402582;
  unsigned int v439 = v437 - 49402582 - ((2 * v437) & 0xFA1C5A3C) - 12;
  unsigned int v440 = v439 ^ 0xFD0E2D1E;
  unsigned int v441 = (((v439 ^ 0xFD0E2D1E) + v427) ^ 0xBFAD83FB)
       + (((v439 ^ 0xFD0E2D1E) + v425) ^ 0x7DEDDDEC)
       + ((2 * ((v439 ^ 0xFD0E2D1E) + v425)) & 0xFBDBBBD8)
       + ((2 * ((v439 ^ 0xFD0E2D1E) + v427)) & 0x7F5B07F6);
  HIDWORD(v126) = v438 ^ 2;
  LODWORD(v126) = v439 ^ 0xFD0E2D1C;
  int v442 = v126 >> 2;
  HIDWORD(v126) = v439 ^ 0x1E;
  LODWORD(v126) = v439 ^ 0xFD0E2D00;
  int v443 = v126 >> 6;
  HIDWORD(v126) = v439 ^ 0x51E;
  LODWORD(v126) = v439 ^ 0xFD0E2800;
  int v444 = v126 >> 11;
  unsigned int v445 = (v420 ^ 0x933F6D98) + 1;
  unsigned int v446 = (v439 ^ 0xFD0E2D1E) + v445 + 1940706742 - ((2 * ((v439 ^ 0xFD0E2D1E) + v445)) & 0xE759AB6C);
  HIDWORD(v126) = v439 ^ 0xD1E;
  LODWORD(v126) = v439 ^ 0xFD0E2000;
  int v447 = v126 >> 13;
  HIDWORD(v126) = v439 ^ 0x10E2D1E;
  LODWORD(v126) = v439 ^ 0xFC000000;
  int v448 = v126 >> 25;
  HIDWORD(v126) = v439 ^ 0xE2D1E;
  LODWORD(v126) = v439 ^ 0xFD000000;
  unsigned int v449 = (v444 ^ 0x81220010)
       + 201590798
       + (v448 ^ 0xF6E3FFEB)
       + (v443 ^ 0x7BF5F7F7)
       + ((2 * v448) & 0xEDC7FFD6)
       + ((2 * v443) & 0xF7EBEFEE)
       - ((2 * v444) & 0xFDBBFFDE)
       + (v407 ^ 0x8F5395C4 ^ ((v446 ^ 0x73ACD5B6)
                             + (v407 ^ 0xD99ED1E2 ^ v439)
                             - ((2 * ((v446 ^ 0x73ACD5B6) + (v407 ^ 0xD99ED1E2 ^ v439))) & 0x5786D270)
                             - 1413256904));
  int v450 = (v390 ^ 0x6BF1C5DA) + (v449 ^ 0x43000006) - ((2 * v449) & 0x79FFFFF2) - 1124073478;
  unsigned int v451 = (v447 ^ 0x47FE796B)
       + ((2 * v447) & 0x8FFCF2D6)
       - 1207859563
       + (v407 ^ v420 ^ 0xD2A01723 ^ (v441 - ((2 * v441 + 80297010) & 0x35E0F370) + 1565857745));
  int v452 = (v442 ^ 0xBFF7B7F8)
       + ((v126 >> 22) ^ 0xFEBE4FBB)
       + ((2 * v442) & 0x7FEF6FF0)
       + ((2 * (v126 >> 22)) & 0xFD7C9F76)
       + (v451 ^ 0xDD020229)
       - ((2 * v451) & 0x45FBFBAC);
  unsigned int v453 = (v852 ^ 0x9892B975) + (v450 ^ 0xFF77EFDB) + ((2 * v450) & 0xFEEFDFB6) + 1965203138;
  int v454 = v452 + (v453 ^ 0x3ECBA3BE) + ((2 * v453) & 0x7D97477C) + 1;
  unsigned int v455 = v454 - 821435885 + (~(2 * v454 + 1257809098) | 0xACE4E0A5);
  HIDWORD(v126) = v455 ^ 1;
  LODWORD(v126) = v455 ^ 0xA98D8FAC;
  int v456 = v126 >> 2;
  HIDWORD(v126) = v455 ^ 0x2D;
  LODWORD(v126) = v455 ^ 0xA98D8F80;
  int v457 = v126 >> 6;
  HIDWORD(v126) = v455 ^ 0x7AD;
  LODWORD(v126) = v455 ^ 0xA98D8800;
  int v458 = v126 >> 11;
  HIDWORD(v126) = v455 ^ 0xFAD;
  LODWORD(v126) = v455 ^ 0xA98D8000;
  unsigned int v459 = v455 ^ 0xA98D8FAD;
  int v460 = ((v126 >> 13) ^ 0x77786FFB)
       + (v456 ^ 0x7FD3AFCB)
       + ((2 * v456) & 0xFFA75F96)
       + ((2 * (v126 >> 13)) & 0xEEF0DFF6);
  unsigned int v461 = (v458 ^ 0xA0680B1C) + (v457 ^ 0x7BEFFE99) + ((2 * v457) & 0xF7DFFD32) - ((2 * v458) & 0xBF2FE9C6) + 1;
  HIDWORD(v126) = v455 ^ 0xD8FAD;
  LODWORD(v126) = v455 ^ 0xA9800000;
  int v462 = (v126 >> 22) - ((2 * (v126 >> 22)) & 0xEFED197C);
  HIDWORD(v126) = v455 ^ 0x18D8FAD;
  LODWORD(v126) = v455 ^ 0xA8000000;
  int v463 = v439 ^ v420;
  unsigned int v464 = (v463 ^ v455 ^ 0x4CF1AAD7 ^ ((v455 ^ 0xA98D8FAD)
                                    + v445
                                    - ((2 * ((v455 ^ 0xA98D8FAD) + v445)) & 0xE9653406)
                                    + 1957861891))
       - 898248179;
  int v465 = (v464 ^ 0x9AF2FF1D)
       + ((2 * v464) & 0x35E5FE3A)
       + 1695351011
       + (v407 ^ ((v126 >> 25) - ((2 * (v126 >> 25)) & 0x78B9A226) + 1012715795) ^ 0x83A092B2 ^ (v461
                                                                                               - ((2 * v461 + 122678420) & 0x36D97EBA)
                                                                                               + 2132063655));
  unsigned int v466 = (HIDWORD(v832) ^ 0x33EA04F4 ^ (v465 - ((2 * v465) & 0xDB0564AC) - 310201770))
       + (v463 ^ v446 ^ (v462 - 134837058) ^ 0x6BA9D9E0 ^ (v460 - ((2 * v460 + 292012148) & 0xFC7A7F22) - 2031018037));
  int v467 = v466 + 104405352 - ((2 * v466) & 0xC7232D0);
  unsigned int v468 = (v455 ^ 0xA98D8FAD) + (v439 ^ 0xFD0E2D1E) - ((2 * ((v455 ^ 0xA98D8FAD) + (v439 ^ 0xFD0E2D1E))) & 0x2C23386);
  int v469 = (v439 ^ 0x2F1D2E1)
       + (v467 ^ 0x6391968)
       + 1
       - ((2 * ((v439 ^ 0x2F1D2E1) + (v467 ^ 0x6391968) + 1)) & 0x5C2944F8);
  HIDWORD(v126) = v467 ^ 0x28;
  LODWORD(v126) = v467 ^ 0x6391940;
  int v470 = v126 >> 6;
  unsigned int v471 = (v467 ^ 0x6391968)
       + (v455 ^ 0xA98D8FAD)
       - 2120570573
       - ((2 * ((v467 ^ 0x6391968) + (v455 ^ 0xA98D8FAD))) & 0x3355266);
  HIDWORD(v126) = v467 ^ 0x391968;
  LODWORD(v126) = v467 ^ 0x6000000;
  int v472 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0x2A4A32D6);
  HIDWORD(v126) = v467 ^ 0x1968;
  LODWORD(v126) = v467 ^ 0x6390000;
  int v473 = v126 >> 13;
  HIDWORD(v126) = v467 ^ 0x168;
  LODWORD(v126) = v467 ^ 0x6391800;
  int v474 = ((v126 >> 11) ^ 0xA84A5814)
       + (v470 ^ 0x67D1F539)
       + ((2 * v470) & 0xCFA3EA72)
       - ((2 * (v126 >> 11)) & 0xAF6B4FD6)
       + 1;
  unsigned int v475 = (v439 ^ 0xFD0E2D1E)
       + (((v439 ^ 0xFB373476 ^ v467) + (v455 ^ 0xA98D8FAD)) ^ 0x73E4D69E)
       + ((2 * ((v439 ^ 0xFB373476 ^ v467) + (v455 ^ 0xA98D8FAD))) & 0xE7C9AD3C)
       - 1944376990;
  HIDWORD(v126) = v467 ^ 0x391968;
  LODWORD(v126) = v467 ^ 0x6000000;
  int v476 = v126 >> 22;
  int v477 = ((v472 + 354752875) ^ 0x18774CB1 ^ (v474 - ((2 * v474 + 533161316) & 0x1AA4ABB4) - 46790516)) + v425;
  unsigned int v478 = (v467 ^ 0x6391968) + (v475 ^ 0x3984102C) - ((2 * v475) & 0x8CF7DFA6) - 964956204;
  HIDWORD(v126) = v466;
  LODWORD(v126) = v467 ^ 0x6391968;
  int v479 = (v473 ^ 0x9A071041)
       + ((v126 >> 2) ^ 0xEF7F93BF)
       + (v476 ^ 0x9A400104)
       + ((2 * (v126 >> 2)) & 0xDEFF277E)
       - ((2 * v476) & 0xCB7FFDF6)
       - ((2 * v473) & 0xCBF1DF7C)
       + ((v468 - 2124342845) ^ v471 ^ 0x2EEF128C ^ (v469 + 773104252))
       - 600220932;
  int v480 = (v832 ^ 0x170437CB)
       + (v478 ^ 0xA7BC5BF7)
       + ((2 * v478) & 0x4F78B7EE)
       + (v477 ^ 0x74CFD3FF)
       + ((2 * v477) & 0xE99FA7FE)
       + 1172495912;
  unsigned int v481 = ((2 * v479) & 0xAFEBBBA4) + (v479 ^ 0x57F5DDD2) + (v480 ^ 0xDBFEBCFB) + ((2 * v480) & 0xB7FD79F6);
  int v482 = v481 - ((2 * v481 + 404146790) & 0x2F64096A) - 474125848;
  HIDWORD(v126) = v482 ^ 0x35;
  LODWORD(v126) = v482 ^ 0x17B20480;
  int v483 = v126 >> 6;
  unsigned int v484 = (((v482 ^ 0x17B204B5) + (v467 ^ 0x6391968)) ^ 0x56F3FFDF)
       + (v455 ^ 0x41C074E7 ^ v482)
       + ((2 * ((v482 ^ 0x17B204B5) + (v467 ^ 0x6391968))) & 0xADE7FFBE);
  HIDWORD(v126) = v482 ^ 1;
  LODWORD(v126) = v482 ^ 0x17B204B4;
  int v485 = v126 >> 2;
  HIDWORD(v126) = v482 ^ 0x4B5;
  LODWORD(v126) = v482 ^ 0x17B20000;
  int v486 = v126 >> 13;
  unsigned int v487 = (v482 ^ v467 ^ 0x2F8C28A4 ^ ((v482 ^ 0x17B204B5)
                                    + (v455 ^ 0xA98D8FAD)
                                    - ((2 * ((v482 ^ 0x17B204B5) + (v455 ^ 0xA98D8FAD))) & 0x7C0E6AF2)
                                    + 1040659833))
       + (v471 ^ 0x819AA933);
  HIDWORD(v126) = v482 ^ 0x4B5;
  LODWORD(v126) = v482 ^ 0x17B20000;
  int v488 = (v126 >> 11) - ((2 * (v126 >> 11)) & 0x2735D64) + 20557490;
  HIDWORD(v126) = v488 ^ 0x1AEB2;
  LODWORD(v126) = v488 ^ 0x1380000;
  int v489 = (v126 >> 19) - ((2 * (v126 >> 19)) & 0xAB39332C);
  HIDWORD(v126) = v482 ^ 0x1B204B5;
  LODWORD(v126) = v482 ^ 0x16000000;
  int v490 = v126 >> 25;
  v489 -= 711157354;
  HIDWORD(v126) = v489 ^ 0x1996;
  LODWORD(v126) = v489 ^ 0xD59C8000;
  int v491 = v126 >> 13;
  unsigned int v492 = (v486 ^ 0x21E5664) + (v485 ^ 0xDDD37FFF) + ((2 * v485) & 0xBBA6FFFE) - ((2 * v486) & 0xFBC35336) + 1;
  HIDWORD(v126) = v482 ^ 0x3204B5;
  LODWORD(v126) = v482 ^ 0x17800000;
  unsigned int v493 = v440
       + (v490 ^ 0x1141B564)
       + (v483 ^ 0xAAD44250)
       - ((2 * v483) & 0xAA577B5E)
       - ((2 * v490) & 0xDD7C9536)
       + (v491 ^ 0x5BFCFD3D)
       + ((2 * v491) & 0xB7F9FA7A)
       - 403895537;
  unsigned int v494 = (v455 ^ 0xA570BC29 ^ (v484 - ((2 * v484 + 303562820) & 0x19FA6708) - 1240910938))
       + (v493 ^ 0xF3DFDE6F)
       + ((2 * v493) & 0xE7BFBCDE)
       + 203432337;
  unsigned int v495 = (HIDWORD(v833) ^ 0xD7FDA5C7) + (v494 ^ 0x7F7FAF3D) + ((2 * v494) & 0xFEFF5E7A) + 102053581;
  int v496 = (((v126 >> 22) - ((2 * (v126 >> 22)) & 0xA080AE6A) - 801089739) ^ (v487 - ((2 * v487) & 0xE859F7E6) + 1949105139) ^ (v492 - ((2 * v492 + 1075598136) & 0xF3E7C7BA) + 436342137) ^ 0x5D9F4F1B)
       + (v495 ^ 0xDEFFFEE3)
       + ((2 * v495) & 0xBDFFFDC6)
       + 553648413;
  unsigned int v497 = v496 - 835338240 - ((2 * v496) & 0x9C6B9B66);
  unsigned int v498 = v497 + 3507;
  HIDWORD(v126) = -3524 - v497;
  LODWORD(v126) = (v497 + 3507) ^ 0xCE35CDB0;
  int v499 = (v126 >> 2) - ((2 * (v126 >> 2)) & 0x81F24FC);
  HIDWORD(v126) = v498 ^ 0xDB3;
  LODWORD(v126) = v498 ^ 0xCE35C000;
  int v500 = v126 >> 13;
  HIDWORD(v126) = v498 ^ 0x5B3;
  LODWORD(v126) = v498 ^ 0xCE35C800;
  int v501 = v126 >> 11;
  v499 -= 2079354242;
  HIDWORD(v126) = v499 ^ 0x127E;
  LODWORD(v126) = v499 ^ 0x840F8000;
  int v502 = (v126 >> 15) - ((2 * (v126 >> 15)) & 0x6C8B349E) - 1236952497;
  HIDWORD(v126) = v502 ^ 0x19A4F;
  LODWORD(v126) = v502 ^ 0xB6440000;
  int v503 = v126 >> 17;
  HIDWORD(v126) = v498 ^ 0xFFFFFFF3;
  LODWORD(v126) = v498 ^ 0xCE35CD80;
  int v504 = v126 >> 6;
  unsigned int v505 = ((2 * ((v498 ^ 0xCE35CDB3) + (v482 ^ 0x17B204B5))) & 0x1697DD2E)
       + (((v498 ^ 0xCE35CDB3) + (v482 ^ 0x17B204B5)) ^ 0x8B4BEE97);
  HIDWORD(v126) = v498 ^ 0x35CDB3;
  LODWORD(v126) = v498 ^ 0xCE000000;
  int v506 = v126 >> 22;
  HIDWORD(v126) = v498 ^ 0x35CDB3;
  LODWORD(v126) = v498 ^ 0xCE000000;
  unsigned int v507 = (v506 ^ 0x2F7FF3FF)
       + ((2 * v506) & 0x5EFFE7FE)
       - 796914687
       + ((v500 - ((2 * v500) & 0xB3E6E8B0) + 1509127256) ^ 0x144048B5 ^ (v503 - ((2 * v503) & 0x9B6679DA) + 1303592173));
  unsigned int v508 = v507 - ((2 * v507) & 0xBBB0F920);
  unsigned int v509 = v505 + 1957957993;
  unsigned int v510 = ((v467 ^ 0xF9C6E697)
        + (v498 ^ 0xCE35CDB3)
        + 908413490
        - ((2 * ((v467 ^ 0xF9C6E697) + (v498 ^ 0xCE35CDB3) + 1)) & 0x6C4A9462)) ^ 0x36254A31 ^ (v505 + 1957957993);
  unsigned int v511 = ((v510 + 1977400970 - ((2 * v510) & 0xEBB97D14)) ^ 0x75DCBE8A) + (v482 ^ v467 ^ 0x118B1DDD);
  unsigned int v512 = (v467 ^ 0x6391968)
       + (((v498 ^ 0xCE35CDB3) + (v467 ^ 0x6391968)) ^ 0xEB79E9DB)
       + ((2 * ((v498 ^ 0xCE35CDB3) + (v467 ^ 0x6391968))) & 0xD6F3D3B6)
       + v505
       - 1992677490;
  int v513 = v459
       + (v501 ^ 0x6DFBCDDF)
       + ((v126 >> 25) ^ 0x3BE29FFF)
       + ((2 * v501) & 0xDBF79BBE)
       + ((2 * (v126 >> 25)) & 0x77C53FFE)
       + 1445040674;
  unsigned int v514 = (v504 ^ 0x81080102)
       - ((2 * v504) & 0xFDEFFDFA)
       + (v512 ^ 0x40324188)
       + (v513 ^ 0xFF5BFAF9)
       - ((2 * v512) & 0x7F9B7CEE)
       + ((2 * v513) & 0xFEB7F5F2)
       + 2;
  int v515 = ((v511 - ((2 * v511) & 0x7DF6F294) + 1056667978) ^ 0xE32305DA ^ (v508 - 573014896))
       + (v833 ^ 0xE1B9C34B ^ (v514 - ((2 * v514 - 999740170) & 0x8599F0A0) - 1526624565));
  int v516 = v515 + 186130432 - ((2 * v515) & 0x16304BDE);
  int v517 = v516 + 1519;
  int v518 = (v516 + 1519) ^ 0xB1825EF;
  int v519 = v518 + (v498 ^ 0x31CA324C) + 120870010 - ((2 * (v518 + (v498 ^ 0x31CA324C) + 1)) & 0xE68A8F2);
  unsigned int v520 = (v482 ^ 0x1CAA215A ^ (v516 + 1519))
       + ((v518 + (v498 ^ 0xCE35CDB3)) ^ 0xF1B0B2F4)
       + ((2 * (v518 + (v498 ^ 0xCE35CDB3))) & 0xE36165E8);
  HIDWORD(v126) = -1536 - v516;
  LODWORD(v126) = (v516 + 1519) ^ 0xB1825EC;
  int v521 = (v126 >> 2) - ((2 * (v126 >> 2)) & 0x7D247B20) + 1049771408;
  HIDWORD(v126) = v521 ^ 0x123D90;
  LODWORD(v126) = v521 ^ 0x3E800000;
  int v522 = (v126 >> 23) - ((2 * (v126 >> 23)) & 0xEE882866) + 2000950323;
  HIDWORD(v126) = v522 ^ 0x37441433;
  LODWORD(v126) = v522 ^ 0x40000000;
  int v523 = (v126 >> 30) - 516947968 - ((2 * (v126 >> 30)) & 0xC2600664) + 818;
  HIDWORD(v126) = v523 ^ 0x332;
  LODWORD(v126) = v523 ^ 0xE1300000;
  int v524 = v126 >> 11;
  HIDWORD(v126) = v517 ^ 0xFFFFFFEF;
  LODWORD(v126) = v517 ^ 0xB1825C0;
  int v525 = v126 >> 6;
  HIDWORD(v126) = v517 ^ 0x5EF;
  LODWORD(v126) = v517 ^ 0xB182000;
  int v526 = v126 >> 11;
  HIDWORD(v126) = v517 ^ 0x5EF;
  LODWORD(v126) = v517 ^ 0xB182000;
  int v527 = v126 >> 13;
  HIDWORD(v126) = v517 ^ 0x11825EF;
  LODWORD(v126) = v517 ^ 0xA000000;
  unsigned int v528 = (v519 ^ (v518 + (v482 ^ 0x17B204B5) - ((2 * (v518 + (v482 ^ 0x17B204B5))) & 0xC084126E) - 532543177) ^ 0xE7765D4E)
       + v509;
  int v529 = (v526 ^ 0x5DF96E2E)
       + ((v126 >> 25) ^ 0x3F6EFF7F)
       + (v525 ^ 0xFCDB9FEF)
       + ((2 * (v126 >> 25)) & 0x7EDDFEFE)
       + ((2 * v526) & 0xBBF2DC5C)
       + ((2 * v525) & 0xF9B73FDE);
  HIDWORD(v126) = v517 ^ 0x1825EF;
  LODWORD(v126) = v517 ^ 0xB000000;
  unsigned int v530 = v467 ^ 0x84A5D856 ^ (v529 - ((2 * v529 + 58189000) & 0x539827C) - 396840030);
  unsigned int v531 = (v482 ^ 0x4B976E0C ^ (v520 + 240078092 - ((2 * (v520 + 240078092)) & 0xB84AD572) + 1545956025)) - 2114705756;
  int v532 = (v531 ^ 0x32C8FBF5) + ((2 * v531) & 0x6591F7EA) + v530 - 852032501;
  int v533 = ((v126 >> 22) ^ 0xFF7FFEB7)
       + (v527 ^ 0xDDA1C6EC)
       + ((2 * (v126 >> 22)) & 0xFEFFFD6E)
       + ((2 * v527) & 0xBB438DD8)
       + (v528 ^ 0x8108082)
       - ((2 * v528) & 0xEFDEFEFA)
       + (v524 ^ 0x56EA9FDE)
       + ((2 * v524) & 0xADD53FBC)
       + (HIDWORD(v834) ^ 0x13161108 ^ (v532 - ((2 * v532) & 0x6B122178) - 1249308484))
       - 1008526851;
  int v534 = v533 + 166953442;
  int v535 = v533 + 166953442 - ((2 * v533) & 0x13E703C4);
  HIDWORD(v126) = v535 ^ 0x22222222;
  LODWORD(v126) = v535 ^ 0x9F381C0;
  int v536 = v126 >> 6;
  HIDWORD(v126) = v535 ^ 0x3381E2;
  LODWORD(v126) = v535 ^ 0x9C00000;
  int v537 = (v126 >> 22) - ((2 * (v126 >> 22)) & 0x611105F4);
  HIDWORD(v126) = v535 ^ 0x1F381E2;
  LODWORD(v126) = v535 ^ 0x8000000;
  int v538 = v126 >> 25;
  HIDWORD(v126) = v535 ^ 0x1E2;
  LODWORD(v126) = v535 ^ 0x9F38000;
  int v539 = (v538 ^ 0x77FB5B2F)
       + (v536 ^ 0x6FCECDEF)
       + ((v126 >> 11) ^ 0x82960041)
       + ((2 * v538) & 0xEFF6B65E)
       + ((2 * v536) & 0xDF9D9BDE)
       - ((2 * (v126 >> 11)) & 0xFAD3FF7C);
  HIDWORD(v126) = v534 ^ 2;
  LODWORD(v126) = v535 ^ 0x9F381E0;
  int v540 = (v126 >> 2) - ((2 * (v126 >> 2)) & 0x3B439EE8);
  unsigned int v541 = (v535 ^ 0x9F381E2)
       + (v498 ^ 0xCE35CDB3)
       - ((2 * ((v535 ^ 0x9F381E2) + (v498 ^ 0xCE35CDB3))) & 0x5CC1AB4E)
       - 1369385561;
  unsigned int v542 = ((2 * ((v535 ^ 0x9F381E2) + v518)) & 0x67FEEE62)
       + (((v535 ^ 0x9F381E2) + v518) ^ 0xB3FF7731)
       + (v541 ^ 0x519F2A58);
  HIDWORD(v126) = v535 ^ 0x1E2;
  LODWORD(v126) = v535 ^ 0x9F38000;
  unsigned int v543 = (v482 ^ 0x79768F8F ^ (v539 + 1 - 2 * ((v539 + 362796705) & 0x6EC48B3E ^ (v539 + 1) & 4) + 73687514))
       + (v498 ^ 0xAAD040DC ^ (v542 - ((2 * v542 - 1744760416) & 0xC9CB1ADE) - 1327098305));
  unsigned int v544 = (v535 ^ v517 ^ 0xAC8B71AA ^ v541) + (v519 ^ 0x7345479);
  int v545 = v834 + (v543 ^ 0xE3FBF39B) + ((2 * v543) & 0xC7F7E736) + 1539337534;
  int v546 = (((v126 >> 13) - ((2 * (v126 >> 13)) & 0x6DEF974E) - 1225274457) ^ (v540 - 1650339980) ^ (v537 - 1333230854) ^ 0x56F86DE5 ^ (v544 - ((2 * v544) & 0x9A4DD798) - 853087284))
       + (v545 ^ 0xDFFBFF9F)
       + ((2 * v545) & 0xBFF7FF3E)
       + 537133153;
  unsigned int v547 = v546 - 364914184 - ((2 * v546) & 0xD47FB3F0);
  HIDWORD(v126) = v547 ^ 0x3FD9F8;
  LODWORD(v126) = v547 ^ 0xEA000000;
  int v548 = v126 >> 22;
  HIDWORD(v126) = v547 ^ 0x3FD9F8;
  LODWORD(v126) = v547 ^ 0xEA000000;
  int v549 = v126 >> 25;
  HIDWORD(v126) = v547 ^ 0x38;
  LODWORD(v126) = v547 ^ 0xEA3FD9C0;
  int v550 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0x22827D2);
  HIDWORD(v126) = v547 ^ 0x19F8;
  LODWORD(v126) = v547 ^ 0xEA3FC000;
  int v551 = (v126 >> 13) - ((2 * (v126 >> 13)) & 0x95021230);
  HIDWORD(v126) = v546;
  LODWORD(v126) = v547 ^ 0xEA3FD9F8;
  unsigned int v552 = (v517 ^ 0xE127FC17 ^ v547)
       + (((v547 ^ 0xEA3FD9F8) + (v535 ^ 0x9F381E2)) ^ 0x69FECFB3)
       + ((2 * ((v547 ^ 0xEA3FD9F8) + (v535 ^ 0x9F381E2))) & 0xD3FD9F66)
       - 1778306995;
  int v553 = (v548 ^ 0x86602030)
       - ((2 * v548) & 0xF33FBF9E)
       + 2040520656
       + (((v126 >> 2) - ((2 * (v126 >> 2)) & 0x916D47A0) + 1219929040) ^ (v551 - 897513192) ^ 0x8237AAC8);
  int v554 = (v552 - ((2 * v552) & 0x34179668) + 436980532) ^ v535 ^ v517 ^ (v553 - ((2 * v553) & 0x5886DC62) - 1404867023);
  HIDWORD(v126) = v547 ^ 0x1F8;
  LODWORD(v126) = v547 ^ 0xEA3FD800;
  int v555 = (v549 ^ 0x86880E08)
       - ((2 * v549) & 0xF2EFE3EE)
       + 2037903864
       + (((v126 >> 11) - ((2 * (v126 >> 11)) & 0xBB46B566) - 576496973) ^ (v550 + 18093033) ^ 0xDCB7495A);
  HIDWORD(v126) = v554 ^ 0xA30108;
  LODWORD(v126) = v554 ^ 0xB4000000;
  unsigned int v556 = (v535 ^ 0xF60C7E1D)
       + (v547 ^ 0xEA3FD9F8)
       - 1442379032
       + (~(2 * ((v535 ^ 0xF60C7E1D) + (v547 ^ 0xEA3FD9F8) + 1)) | 0xABF1EA31)
       + 1;
  int v557 = (v126 >> 26) + 1490923520 - ((2 * (v126 >> 26)) & 0xB1BB6896) + 1099;
  HIDWORD(v126) = v557 ^ 0x44B;
  LODWORD(v126) = v557 ^ 0x58DDB000;
  int v558 = (v126 >> 11) + 75073355 - ((2 * (v126 >> 11)) & 0x8F30E96);
  unsigned int v559 = (v517 ^ 0xF4E7DA10)
       + (v556 ^ ((v547 ^ 0xEA3FD9F8) + v518 - ((2 * ((v547 ^ 0xEA3FD9F8) + v518)) & 0xEE983120) - 146007920) ^ 0x5D4B1277)
       + 1;
  unsigned int v560 = (v559 ^ 0xE75D1FBD)
       + ((2 * v559) & 0xCEBA3F7A)
       + 413327427
       + (v498 ^ 0x1838A738 ^ (v555 - ((2 * v555) & 0xAC1AD516) - 703763829));
  HIDWORD(v126) = v558 ^ 0x479874B;
  LODWORD(v126) = v558;
  unsigned int v561 = (HIDWORD(a34) ^ 0x635CFB7C) + (v560 ^ 0xFF6FBFF1) + ((2 * v560) & 0xFEDF7FE2) + 1847689469;
  int v562 = ((2 * v561) & 0xBDD3DDFE)
       + (v561 ^ 0x5EE9EEFF)
       + ((v126 >> 27) ^ 0xFADFFED7)
       + ((2 * (v126 >> 27)) & 0xF5BFFDAE);
  int v563 = v562 + 1678583902;
  int v564 = v562 + 1678583902 - ((2 * v562 + 1282155604) & 0x7BAE2C50) - 12;
  unsigned int v565 = v564 ^ 0xBDD71628;
  int v566 = (v547 ^ 0x15C02607) + 1;
  unsigned int v567 = (v564 ^ 0xBDD71628) + v566 + 382624088 - ((2 * ((v564 ^ 0xBDD71628) + v566)) & 0x2D9CC2B0);
  HIDWORD(v126) = v564 ^ 0x28;
  LODWORD(v126) = v564 ^ 0xBDD71600;
  int v568 = v126 >> 6;
  HIDWORD(v126) = v564 ^ 0x628;
  LODWORD(v126) = v564 ^ 0xBDD71000;
  int v569 = v126 >> 11;
  HIDWORD(v126) = v564 ^ 0x1628;
  LODWORD(v126) = v564 ^ 0xBDD70000;
  int v570 = v126 >> 13;
  unsigned int v571 = (v547 ^ 0x57E8CFD0 ^ v564)
       + (((v564 ^ 0xBDD71628) + (v535 ^ 0x9F381E2)) ^ 0x7DDBFBF7)
       + ((2 * ((v564 ^ 0xBDD71628) + (v535 ^ 0x9F381E2))) & 0xFBB7F7EE)
       - 2111568887;
  HIDWORD(v126) = v564 ^ 0x1D71628;
  LODWORD(v126) = v564 ^ 0xBC000000;
  int v572 = v126 >> 25;
  HIDWORD(v126) = v563;
  LODWORD(v126) = v564 ^ 0xBDD71628;
  int v573 = ((v126 >> 2) ^ 0x75B7FFDE) + (v570 ^ 0xBB7BF27F) + ((2 * v570) & 0x76F7E4FE) + ((2 * (v126 >> 2)) & 0xEB6FFFBC);
  HIDWORD(v126) = v564 ^ 0x171628;
  LODWORD(v126) = v564 ^ 0xBDC00000;
  unsigned int v574 = v518
       + (v568 ^ 0x90108375)
       + (v569 ^ 0xF5DFFFF3)
       + (v572 ^ 0x7FDBFF88)
       + ((2 * v569) & 0xEBBFFFE6)
       + ((2 * v572) & 0xFFB7FF10)
       - ((2 * v568) & 0xDFDEF914)
       - 97288944;
  unsigned int v575 = (v535 ^ 0xF523C61D ^ (v571 - ((2 * v571) & 0xF9A08FFE) - 53458945))
       + (v574 ^ 0x36FFBFD2)
       + ((2 * v574) & 0x6DFF7FA4)
       - 922730450;
  int v576 = (v535 ^ 0x4BDB6835 ^ v564) + (v567 ^ 0x16CE6158) + 1;
  unsigned int v577 = (v556 ^ 0xAA070AE7) + (v576 ^ 0xFBECB6DF) + ((2 * v576) & 0xF7D96DBE) + 68372769;
  int v578 = (((v126 >> 22) - ((2 * (v126 >> 22)) & 0x4E4FA366) - 1490562637) ^ 0x5109F9FF ^ (v573
                                                                                        - ((2 * v573 - 1650975930) & 0xEC5C5098)
                                                                                        - 990235153))
       + (v577 ^ 0xFFAF9DE5)
       + ((2 * v577) & 0xFF5F3BCA)
       + 5267995;
  int v579 = (a33 ^ 0x645DCC42) + (v575 ^ 0xF7BF6177) + ((2 * v575) & 0xEF7EC2EE) + 1523153713;
  unsigned int v580 = ((2 * v578) & 0x5DDD7ABC) + (v578 ^ 0xAEEEBD5E) + (v579 ^ 0x2FFFD4CE) + ((2 * v579) & 0x5FFFA99C);
  int v581 = v580 - 1446588970 - ((2 * v580 + 35838888) & 0x116ABFD4) - 24;
  HIDWORD(v126) = (v580 - 1446588970) ^ 2;
  LODWORD(v126) = v581 ^ 0x88B55FE8;
  int v582 = v126 >> 2;
  HIDWORD(v126) = v581 ^ 0x7EA;
  LODWORD(v126) = v581 ^ 0x88B55800;
  int v583 = v126 >> 11;
  HIDWORD(v126) = v581 ^ 0xAAAAAAAA;
  LODWORD(v126) = v581 ^ 0x88B55FC0;
  int v584 = v126 >> 6;
  HIDWORD(v126) = v581 ^ 0x1FEA;
  LODWORD(v126) = v581 ^ 0x88B54000;
  int v585 = v126 >> 13;
  HIDWORD(v126) = v581 ^ 0xB55FEA;
  LODWORD(v126) = v581 ^ 0x88000000;
  int v586 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0xE81F51C2);
  unsigned int v587 = (v585 ^ 0xBCAFFB7E) + (v582 ^ 0xEBFF6DA4) + ((2 * v582) & 0xD7FEDB48) + ((2 * v585) & 0x795FF6FC);
  unsigned int v588 = v587 - ((2 * v587 + 782314940) & 0x76FD2D5E);
  unsigned int v589 = v581 ^ 0x88B55FEA;
  unsigned int v590 = (v581 ^ 0x88B55FEA) + v566;
  int v591 = (v564 ^ 0x4228E9D7) + 1;
  unsigned int v592 = (v581 ^ 0x88B55FEA) + v591;
  unsigned int v593 = (v590 ^ 0xFEBBF78F) + (v592 ^ 0xEFABF3D1);
  unsigned int v594 = v593 + ((2 * v592) & 0xDF57E7A2) + ((2 * v590) & 0xFD77EF1E);
  unsigned int v595 = (v583 ^ 0x80498202) + (v584 ^ 0x63FAFD3B) + ((2 * v584) & 0xC7F5FA76) - ((2 * v583) & 0xFF6CFBFA) + 1;
  HIDWORD(v126) = v581 ^ 0x355FEA;
  LODWORD(v126) = v581 ^ 0x88800000;
  int v596 = ((v126 >> 22) - ((2 * (v126 >> 22)) & 0x52911E1A) + 692621069) ^ 0x923619A2 ^ (v588 + 315567501);
  int v597 = v594 - 2 * ((v594 + 295179424) & 0x7E0C6987 ^ v593 & 1) - 1885045210;
  unsigned int v598 = v535 ^ v547 ^ (v586 - 200300319) ^ v597 ^ (v595 - ((2 * v595 + 930546052) & 0xE857719C) - 1880671856) ^ 0x1DE421B3;
  int v599 = ((v596 + (v567 ^ 0x973DF721 ^ v597) + 1) ^ 0xF1DAFCF7)
       + ((2 * (v596 + (v567 ^ 0x973DF721 ^ v597) + 1)) & 0xE3B5F9EE)
       + 237306633
       + (v835 ^ 0x5410FB2F ^ (v598 - ((2 * v598 - 449840912) & 0xE08AAE62) + 1658672041));
  unsigned int v600 = v599 - 331729348 - ((2 * v599) & 0xD8746C78);
  HIDWORD(v126) = v600 ^ 0x3C;
  LODWORD(v126) = v600 ^ 0xEC3A3600;
  unsigned int v601 = v600 ^ 0xEC3A363C;
  unsigned int v602 = (v600 ^ 0xEC3A363C) + (v564 ^ 0xBDD71628) - ((2 * ((v600 ^ 0xEC3A363C) + (v564 ^ 0xBDD71628))) & 0x8DDFF0A4);
  int v603 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0x68881C2C);
  HIDWORD(v126) = v600 ^ 0x3A363C;
  LODWORD(v126) = v600 ^ 0xEC000000;
  int v604 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0xD40DBD4C);
  HIDWORD(v126) = v600 ^ 0x63C;
  LODWORD(v126) = v600 ^ 0xEC3A3000;
  int v605 = v581 ^ v564;
  int v606 = (((v605 ^ 0x356249C2) + v591) ^ 0xE5EFD3F6)
       + ((2 * ((v605 ^ 0x356249C2) + v591)) & 0xCBDFA7EC)
       + 437267466
       + (v547 ^ (v603 + 876875286) ^ ((v126 >> 11) - ((2 * (v126 >> 11)) & 0xF4854C4) - 2019284382) ^ (v604 - 368648538) ^ 0xB3D9232A);
  HIDWORD(v126) = v600 ^ 0x163C;
  LODWORD(v126) = v600 ^ 0xEC3A2000;
  int v607 = v126 >> 13;
  HIDWORD(v126) = v600 ^ 0x3A363C;
  LODWORD(v126) = v600 ^ 0xEC000000;
  int v608 = v126 >> 22;
  int v609 = v600 ^ v581;
  HIDWORD(v126) = v599;
  LODWORD(v126) = v600 ^ 0xEC3A363C;
  unsigned int v610 = (v605 ^ 0xCA9DB63D) + (v600 ^ v581 ^ 0x22609184 ^ (v602 + 1190131794)) + 1;
  int v611 = (v608 ^ 0x7FEDFFF7)
       + (v607 ^ 0x47879FFF)
       + ((v126 >> 2) ^ 0xF177E7D9)
       + ((2 * v608) & 0xFFDBFFEE)
       + ((2 * v607) & 0x8F0F3FFE)
       + ((2 * (v126 >> 2)) & 0xE2EFCFB2)
       + (v610 ^ 0xFF17EF7F)
       + ((2 * v610) & 0xFE2FDEFE)
       + 1207601330
       + (HIDWORD(v836) ^ 0x68FEED28 ^ (((2 * v606) & 0xFC7AFE56)
                                      + (v606 ^ 0x7E3D7F2B)
                                      - ((2 * (((2 * v606) & 0xFC7AFE56) + (v606 ^ 0x7E3D7F2B)) + 150373798) & 0x27C9AA72)
                                      + 945821708));
  int v612 = v611 - 1972402230;
  int v613 = v611 - 1972402230 - ((2 * v611) & 0x14DF0F5C) - 28;
  unsigned int v614 = v613 ^ 0x8A6F87AE;
  HIDWORD(v126) = v613 ^ 0x2F87AE;
  LODWORD(v126) = v613 ^ 0x8A400000;
  int v615 = (v126 >> 22) - ((2 * (v126 >> 22)) & 0xCA021D84);
  HIDWORD(v126) = v613 ^ 0xEEEEEEEE;
  LODWORD(v126) = v613 ^ 0x8A6F8780;
  int v616 = v126 >> 6;
  HIDWORD(v126) = v613 ^ 0x7AE;
  LODWORD(v126) = v613 ^ 0x8A6F8000;
  int v617 = ((v126 >> 11) ^ 0x20240830)
       + (v616 ^ 0x6CBEFF5A)
       + ((2 * v616) & 0xD97DFEB4)
       - ((2 * (v126 >> 11)) & 0xBFB7EF9E)
       + 1;
  unsigned int v618 = (v581 ^ 0x2DAD844 ^ v613)
       + 872419345
       + (((v613 ^ 0x8A6F87AE) + (v600 ^ 0xEC3A363C)) ^ 0xCBFFEFEF)
       + ((2 * ((v613 ^ 0x8A6F87AE) + (v600 ^ 0xEC3A363C))) & 0x97FFDFDE);
  HIDWORD(v126) = v613 ^ 0x6F87AE;
  LODWORD(v126) = v613 ^ 0x8A000000;
  int v619 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0x628CEF9E);
  HIDWORD(v126) = v612 ^ 2;
  LODWORD(v126) = v613 ^ 0x8A6F87AC;
  int v620 = v126 >> 2;
  HIDWORD(v126) = v613 ^ 0x7AE;
  LODWORD(v126) = v613 ^ 0x8A6F8000;
  unsigned int v621 = ((v619 + 826701775) ^ 0xE81558DB ^ (v617 - ((2 * v617 - 432410390) & 0xB2A65E28) + 1282418569)) + v565;
  int v622 = (v609 ^ 0x827572A4 ^ (v618 - ((2 * v618) & 0xCDF436E4) - 419816590))
       + ((v620 - ((2 * v620) & 0x41CD7F92) + 551993289) ^ ((v126 >> 13) - ((2 * (v126 >> 13)) & 0x13426E16) - 1985923317) ^ (v615 + 1694568130) ^ 0xCC468600);
  unsigned int v623 = (v600 ^ 0xFBEBC50E ^ (v621 + 399635251 + (~(2 * v621) | 0xD05C199B))) + 846739860;
  unsigned int v624 = (HIDWORD(v835) ^ 0x532DF53C) + (v623 ^ 0xE7AEBDF5) + ((2 * v623) & 0xCF5D7BEA) + 407978508;
  unsigned int v625 = ((2 * v622) & 0xBE7EF9DC) + (v622 ^ 0x5F3F7CEE) + (v624 ^ 0x469FF776) + ((2 * v624) & 0x8D3FEEEC);
  unsigned int v626 = v625 - ((2 * v625 - 1270802632) & 0xAE38318E);
  unsigned int v627 = v626 - 1321425821;
  int v628 = (v626 - 1321425821) ^ 0x571C18C7;
  HIDWORD(v126) = (v626 - 1321425821) ^ 7;
  LODWORD(v126) = (v626 - 1321425821) ^ 0x571C18C0;
  int v629 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0x6E536A4E);
  HIDWORD(v126) = (v626 - 1321425821) ^ 0x11C18C7;
  LODWORD(v126) = (v626 - 1321425821) ^ 0x56000000;
  int v630 = v126 >> 25;
  HIDWORD(v126) = (v626 - 1321425821) ^ 0xC7;
  LODWORD(v126) = (v626 - 1321425821) ^ 0x571C1800;
  int v631 = v126 >> 11;
  HIDWORD(v126) = (v626 - 1321425821) ^ 0x18C7;
  LODWORD(v126) = (v626 - 1321425821) ^ 0x571C0000;
  int v632 = v126 >> 13;
  HIDWORD(v126) = 1321425800 - v626;
  LODWORD(v126) = (v626 - 1321425821) ^ 0x571C18C4;
  unsigned int v633 = (v630 ^ 0xFBD5A6BB)
       + ((2 * v630) & 0xF7AB4D76)
       + 69884230
       + ((v631 - ((2 * v631) & 0x62D0C3DE) + 828924399) ^ (v629 - 1222003417) ^ 0x79BE2B37);
  int v634 = (v632 ^ 0x88044002) + ((v126 >> 2) ^ 0x5BFD39CD) + ((2 * (v126 >> 2)) & 0xB7FA739A) - ((2 * v632) & 0xEFF77FFA);
  HIDWORD(v126) = v627 ^ 0x1C18C7;
  LODWORD(v126) = v627 ^ 0x57000000;
  int v635 = (v613 ^ 0x75907851) + v628 + 1 - ((2 * ((v613 ^ 0x75907851) + v628 + 1)) & 0x1BADA66E) + 232182583;
  unsigned int v636 = v589 + (v633 ^ 0x6FFFFF7A) + ((2 * v633) & 0xDFFFFEF4) - 1879048058;
  int v637 = (((v126 >> 22) - ((2 * (v126 >> 22)) & 0xB005FA12) + 1476590857) ^ 0xC2C4A3D5 ^ (v634
                                                                                        + 1
                                                                                        - 2
                                                                                        * ((v634 + 469665329) & 0x1AC65EDE ^ (v634 + 1) & 2)
                                                                                        - 1228610292))
       + (v600 ^ ((v600 ^ 0x13C5C9C3)
                + (v613 ^ 0x8A6F87AE)
                + 1
                - ((2 * ((v600 ^ 0x13C5C9C3) + (v613 ^ 0x8A6F87AE) + 1)) & 0xBDA72222)
                + 1590923537) ^ v627 ^ 0xE8236CDD ^ v635);
  unsigned int v638 = ((2 * v600) ^ 0xA28B9757) + ((4 * v600) & 0xF5FFF65C ^ 0xB0E8D050) - 2063596335 + v628;
  unsigned int v639 = (v638 ^ 0xED63F6FF) + ((2 * v638) & 0xDAC7EDFE) + 312215810 + (v635 ^ 0xF2292CC8);
  int v640 = (a35 ^ 0x321463A0)
       + (v639 ^ 0x6D367CFE)
       + ((2 * v639) & 0xDA6CF9FC)
       + (v636 ^ 0x3BFDEAB4)
       + ((2 * v636) & 0x77FBD568)
       - 1827590360;
  unsigned int v641 = (v640 ^ 0x69EF83FF) + (v637 ^ 0xFEEC5D9F) + ((2 * v637) & 0xFDD8BB3E);
  unsigned int v642 = v641
       + ((2 * v640) & 0xD3DF07FE)
       - 2 * ((v641 + ((2 * v640) & 0xD3DF07FE) + 388243042) & 0x4B3E0B3B ^ v641 & 1)
       - 496883300;
  HIDWORD(v126) = v642 ^ 0xB3A;
  LODWORD(v126) = v642 ^ 0x4B3E0000;
  int v643 = v126 >> 13;
  int v644 = v642 ^ 0x4B3E0B3A;
  HIDWORD(v126) = v642 ^ 0x3E0B3A;
  LODWORD(v126) = v642 ^ 0x4B000000;
  int v645 = v126 >> 22;
  unsigned int v646 = v613 ^ 0xDD739F69 ^ v627;
  unsigned int v647 = v646 + v614 - ((2 * (v646 + v614)) & 0x870511D6);
  unsigned int v648 = v646
       + (((v642 ^ 0x4B3E0B3A) + v614) ^ 0xEC777FB7)
       + ((2 * ((v642 ^ 0x4B3E0B3A) + v614)) & 0xD8EEFF6E)
       + 327712841;
  HIDWORD(v126) = v642 ^ 0x33A;
  LODWORD(v126) = v642 ^ 0x4B3E0800;
  int v649 = v126 >> 11;
  HIDWORD(v126) = v642 ^ 0x3A;
  LODWORD(v126) = v642 ^ 0x4B3E0B00;
  int v650 = v126 >> 6;
  HIDWORD(v126) = v642 ^ 0x13E0B3A;
  LODWORD(v126) = v642 ^ 0x4A000000;
  int v651 = v126 >> 25;
  HIDWORD(v126) = v642 ^ 2;
  LODWORD(v126) = v642 ^ 0x4B3E0B38;
  unsigned int v652 = v601
       + (v651 ^ 0x2C1080C1)
       + (v649 ^ 0xC8098490)
       + (v650 ^ 0x12141040)
       - ((2 * v649) & 0x6FECF6DE)
       - ((2 * v651) & 0xA7DEFE7C)
       - ((2 * v650) & 0xDBD7DF7E)
       - 103683473;
  unsigned int v653 = (v647 + 1132628203) ^ 0x24CCA8A4 ^ (v652 - ((2 * v652) & 0xCE9C409E) + 1733173327);
  unsigned int v654 = (v627 ^ 0x1C2213FD ^ v642) + (v648 ^ 0xC020E000) - ((2 * v648) & 0x7FBE3FFE) + 1071587328;
  int v655 = (v645 ^ 0x3DBB6DE9)
       + (v643 ^ 0x7FFDBEF3)
       + ((v126 >> 2) ^ 0x26FEEFFD)
       + ((2 * v645) & 0x7B76DBD2)
       + ((2 * v643) & 0xFFFB7DE6)
       + ((2 * (v126 >> 2)) & 0x4DFDDFFA)
       + (v654 ^ 0x76FD695B)
       + ((2 * v654) & 0xEDFAD2B6)
       - 1538623028
       + (a38 ^ 0xFAFE1FBB ^ (v653 - ((2 * v653 + 1590488644) & 0x691A9E78) + 1676920414));
  int v656 = v655 - 1132079586;
  int v657 = v655 - 1132079586 - ((2 * v655) & 0x790BAC04) - 28;
  unsigned int v658 = (v627 ^ 0xA8E3E738)
       + (v657 ^ 0xBC85D602)
       - 1059445418
       - ((2 * ((v627 ^ 0xA8E3E738) + (v657 ^ 0xBC85D602) + 1)) & 0x81B44AAA);
  unsigned int v659 = (v642 ^ 0xB4C1F4C5) + 1;
  unsigned int v660 = (v657 ^ 0xBC85D602) + v659 + 839091461 - ((2 * ((v657 ^ 0xBC85D602) + v659)) & 0x64070A0A);
  HIDWORD(v126) = v657 ^ 0x1602;
  LODWORD(v126) = v657 ^ 0xBC85C000;
  int v661 = v126 >> 13;
  HIDWORD(v126) = v657 ^ 0x602;
  LODWORD(v126) = v657 ^ 0xBC85D000;
  int v662 = v126 >> 11;
  HIDWORD(v126) = v657 ^ 0x85D602;
  LODWORD(v126) = v657 ^ 0xBC000000;
  int v663 = v126 >> 25;
  unsigned int v664 = (((v642 ^ 0x4B3E0B3A) + v628) ^ 0x2911841A)
       - ((2 * ((v642 ^ 0x4B3E0B3A) + v628)) & 0xADDCF7CA)
       + (((v658 ^ 0xC0DA2555) + (v660 ^ 0x32038505)) ^ 0xEBFFCE7F)
       + ((2 * ((v658 ^ 0xC0DA2555) + (v660 ^ 0x32038505))) & 0xD7FF9CFE)
       + 1;
  HIDWORD(v126) = v657 ^ 2;
  LODWORD(v126) = v657 ^ 0xBC85D600;
  int v665 = v126 >> 6;
  HIDWORD(v126) = v656 ^ 2;
  LODWORD(v126) = v657 ^ 0xBC85D600;
  int v666 = v126 >> 2;
  unsigned int v667 = v614
       + (v663 ^ 0x6081B1C4)
       + (v665 ^ 0x8C0AC006)
       + (v662 ^ 0x57FFEF7D)
       - ((2 * v665) & 0xE7EA7FF2)
       - ((2 * v663) & 0x3EFC9C76)
       + ((2 * v662) & 0xAFFFDEFA)
       - 1150050631;
  unsigned int v668 = ((v658 ^ v660 ^ 0xF2D9A050) + v628 - ((2 * ((v658 ^ v660 ^ 0xF2D9A050) + v628)) & 0x7090602A) - 1203228651) ^ 0x96AF433B ^ (v667 - ((2 * v667) & 0x5DCEE65C) + 786920238);
  HIDWORD(v126) = v657 ^ 0x5D602;
  LODWORD(v126) = v657 ^ 0xBC800000;
  int v669 = ((v126 >> 22) ^ 0x7EFF6BFF)
       + (v666 ^ 0x6D989FFE)
       + (v661 ^ 0x8A30198A)
       + ((2 * (v126 >> 22)) & 0xFDFED7FE)
       + ((2 * v666) & 0xDB313FFC)
       - ((2 * v661) & 0xEB9FCCEA)
       + 1;
  unsigned int v670 = (v855 ^ 0xF69AA8BD ^ (v668 - ((2 * v668 + 771887906) & 0x3916890A) - 745779690))
       + ((v669 - ((2 * v669 + 309310704) & 0xBAD2C1C6) + 1721842523) ^ 0x28BBBD98 ^ (v664
                                                                                    - ((2 * v664 - 706913588) & 0xEBA5BAF6)
                                                                                    - 524186911));
  int v671 = v670 + 989624320 - ((2 * v670) & 0x75F8FAC6);
  int v672 = v671 + 1379;
  int v673 = (v671 + 1379) ^ 0x3AFC7D63;
  unsigned int v674 = v673 + (v657 ^ 0xBC85D602) - 289077565 - ((2 * (v673 + (v657 ^ 0xBC85D602))) & 0xDD8A0D86);
  HIDWORD(v126) = (v671 + 1379) ^ 0x563;
  LODWORD(v126) = (v671 + 1379) ^ 0x3AFC7800;
  int v675 = (v126 >> 11) - ((2 * (v126 >> 11)) & 0x532F0CEC);
  unsigned int v676 = ((2 * (v673 + v659)) & 0x63FF9DFC) + ((v673 + v659) ^ 0xB1FFCEFE);
  unsigned int v677 = (v657 ^ 0x8679AB61 ^ (v671 + 1379)) - 1308635394 - v676;
  HIDWORD(v126) = (v671 + 1379) ^ 0xFFFFFFE3;
  LODWORD(v126) = (v671 + 1379) ^ 0x3AFC7D40;
  int v678 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0x882898BE);
  HIDWORD(v126) = (v671 + 1379) ^ 0xFC7D63;
  LODWORD(v126) = (v671 + 1379) ^ 0x3A000000;
  int v679 = ((v126 >> 25) ^ 0x8880280)
       - ((2 * (v126 >> 25)) & 0xEEEFFAFE)
       - 143131264
       + ((v678 - 1005302689) ^ (v675 + 697796214) ^ 0xED83CA29);
  HIDWORD(v126) = (v671 + 1379) ^ 0x3C7D63;
  LODWORD(v126) = (v671 + 1379) ^ 0x3AC00000;
  int v680 = v126 >> 22;
  int v681 = v628 + (v679 ^ 0xFAFDFFF) + ((2 * v679) & 0x1F5FBFFE) - 263184383;
  unsigned int v682 = (((v671 + 1379) ^ 0x3AFC7D60u) >> 2) - (v671 << 30);
  HIDWORD(v126) = v672 ^ 0x1D63;
  LODWORD(v126) = v672 ^ 0x3AFC6000;
  unsigned int v683 = (v642 ^ 0xF7BBDD38 ^ v657)
       + ((v676 + 1308635394 + (v674 ^ 0xEEC506C3)) ^ 0x7E77DB0C)
       + ((2 * (v676 + 1308635394 + (v674 ^ 0xEEC506C3))) & 0xFCEFB618)
       - 2121784076;
  int v684 = v642 ^ (v677 + 1377290294 + (~(2 * v677) | 0x5BD06F95)) ^ 0x1225BF42 ^ (v681
                                                                               - ((2 * v681) & 0x1618F89A)
                                                                               + 185367629);
  int v685 = (v680 ^ 0x55020000)
       - ((2 * v680) & 0x55FBFFFE)
       + (((v126 >> 13) - ((2 * (v126 >> 13)) & 0x8D010EAE) + 1182828375) ^ 0x4962D063 ^ (v682
                                                                                        - ((2 * v682) & 0x1FC4AE68)
                                                                                        + 266491700))
       + (v683 ^ 0xA1172C14)
       - ((2 * v683) & 0xBDD1A7D6)
       + 166122476;
  int v686 = (v836 ^ 0xEAFF71BC)
       + ((v684 - 1298429573) ^ 0x7F3BE5DB)
       + ((2 * (v684 - 1298429573)) & 0xFE77CBB6)
       - 2134631899;
  unsigned int v687 = ((2 * v685) & 0xFA4ECA6E) + (v685 ^ 0xFD276537) + (v686 ^ 0x43ED4FFD) + ((2 * v686) & 0x87DA9FFA);
  unsigned int v688 = v687 + 1601963093 + (~(2 * v687 + 2111215000) | 0xBEDE8CEF);
  unsigned int v689 = v688 ^ 0xA090B988;
  HIDWORD(v126) = v688 ^ 0x188;
  LODWORD(v126) = v688 ^ 0xA090B800;
  int v690 = v126 >> 11;
  HIDWORD(v126) = v688;
  LODWORD(v126) = v688 ^ 0xA090B988;
  int v691 = (v126 >> 2) - ((2 * (v126 >> 2)) & 0xD6D65584);
  HIDWORD(v126) = v688 ^ 0x90B988;
  LODWORD(v126) = v688 ^ 0xA0000000;
  int v692 = v126 >> 25;
  HIDWORD(v126) = v688 ^ 0x10B988;
  LODWORD(v126) = v688 ^ 0xA0800000;
  int v693 = v126 >> 22;
  unsigned int v694 = v673
       + (((v688 ^ 0xA090B988) + (v657 ^ 0xBC85D602)) ^ 0xFCFFE9F9)
       + ((2 * ((v688 ^ 0xA090B988) + (v657 ^ 0xBC85D602))) & 0xF9FFD3F2)
       + 50337287;
  unsigned int v695 = (v688 ^ 0xA090B988) + (v694 ^ 0x9009027) - ((2 * v694) & 0xEDFEDFB0) - 151031847;
  unsigned int v696 = v695 - ((2 * v695) & 0xD6031E54);
  HIDWORD(v126) = v688 ^ 8;
  LODWORD(v126) = v688 ^ 0xA090B980;
  int v697 = v126 >> 6;
  HIDWORD(v126) = v688 ^ 0x1988;
  LODWORD(v126) = v688 ^ 0xA090A000;
  int v698 = v688 ^ v672;
  int v699 = (v693 ^ 0x808A4200)
       - ((2 * v693) & 0xFEEB7BFE)
       + 2138422784
       + ((v691 - 345298238) ^ ((v126 >> 13) - ((2 * (v126 >> 13)) & 0xF74B144C) - 73037274) ^ 0x10CEA0E4);
  unsigned int v700 = (v657 ^ 0xE3EA9075 ^ v688) + (v688 ^ v672 ^ 0x9A6CC4EB) + 1;
  unsigned int v701 = (v657 ^ 0xBC85D602) + (v700 ^ 0x7AEB5FE6) + ((2 * v700) & 0xF5D6BFCC);
  unsigned int v702 = (v699 ^ 0xF767F6BB) + ((2 * v699) & 0xEECFED76) + 144181573 + (v674 ^ 0x5C489E9 ^ (v696 - 352219350));
  unsigned int v703 = v644
       + (v692 ^ 0x42210483)
       + (v697 ^ 0x60090125)
       + (v690 ^ 0x7B9767FE)
       - ((2 * v697) & 0x3FEDFDB4)
       - ((2 * v692) & 0x7BBDF6F8)
       + ((2 * v690) & 0xF72ECFFC)
       + ((v701 - 2062245862) ^ 0x90602844)
       - ((2 * (v701 - 2062245862)) & 0xDF3FAF76)
       + 1373530646;
  int v704 = (v702 ^ 0x39DFB5E6)
       + ((2 * v702) & 0x73BF6BCC)
       - 970962406
       + (a47 ^ 0xEED13FF1 ^ (((2 * v703) & 0x7FBBF176)
                            + (v703 ^ 0xBFDDF8BB)
                            - ((2 * (((2 * v703) & 0x7FBBF176) + (v703 ^ 0xBFDDF8BB)) + 52319892) & 0xBF945DC)
                            - 812921288));
  unsigned int v705 = v704 - 989533620 - ((2 * v704) & 0x8A09D498);
  HIDWORD(v126) = v705 ^ 0x24C;
  LODWORD(v126) = v705 ^ 0xC504E800;
  int v706 = v126 >> 11;
  unsigned int v707 = v705 ^ 0xC504EA4C;
  HIDWORD(v126) = v705 ^ 0xC;
  LODWORD(v126) = v705 ^ 0xC504EA40;
  int v708 = v126 >> 6;
  int v709 = v688 ^ 0x659453C4 ^ v705;
  int v710 = (v672 ^ 0x768D0 ^ v705) + v709 + 1 - ((2 * ((v672 ^ 0x768D0 ^ v705) + v709 + 1)) & 0x1B5C3ED8);
  HIDWORD(v126) = v705 ^ 0x104EA4C;
  LODWORD(v126) = v705 ^ 0xC4000000;
  int v711 = v126 >> 25;
  unsigned int v712 = ((2 * ((v705 ^ 0xC504EA4C) + (v688 ^ 0x5F6F4677) + 1)) & 0xDFF727AE)
       + (((v705 ^ 0xC504EA4C) + (v688 ^ 0x5F6F4677) + 1) ^ 0xEFFB93D7)
       + ((v673 + (v705 ^ 0x3AFB15B3) + 1) ^ 0x5D71BFFB)
       + ((2 * (v673 + (v705 ^ 0x3AFB15B3) + 1)) & 0xBAE37FF6);
  unsigned int v713 = (v712 - ((2 * v712 + 1696946268) & 0xEB09356C) - 1474869532) ^ v672;
  HIDWORD(v126) = v705 ^ 0xA4C;
  LODWORD(v126) = v705 ^ 0xC504E000;
  int v714 = v126 >> 13;
  unsigned int v715 = (v711 ^ 0x751001)
       + (v706 ^ 0x8B2D0714)
       + (v708 ^ 0x537EEDD7)
       + ((2 * v708) & 0xA6FDDBAE)
       - ((2 * v711) & 0xFF15DFFC)
       - ((2 * v706) & 0xE9A5F1D6)
       + 2;
  HIDWORD(v126) = v705 ^ 0x4EA4C;
  LODWORD(v126) = v705 ^ 0xC5000000;
  int v716 = v126 >> 22;
  HIDWORD(v126) = v713 ^ 0x78E7D5;
  LODWORD(v126) = v713 ^ 0xCFFFFFFF;
  int v717 = (v126 >> 24) + 1484071168 - ((2 * (v126 >> 24)) & 0xB0EA43DA);
  HIDWORD(v126) = v704;
  LODWORD(v126) = v705 ^ 0xC504EA4C;
  int v718 = v126 >> 2;
  v717 += 237;
  HIDWORD(v126) = v717 ^ 0xED;
  LODWORD(v126) = v717 ^ 0x58752100;
  unsigned int v719 = (v716 ^ 0xA4004)
       + (v714 ^ 0x4417400)
       + (v718 ^ 0xFFBFFFB3)
       + ((2 * v718) & 0xFF7FFF66)
       - ((2 * v716) & 0xFFEB7FF6)
       - ((2 * v714) & 0xF77D17FE)
       + 2;
  int v720 = (v657 ^ (v715 - ((2 * v715 + 1102968356) & 0xF5689784) + 462636756) ^ 0x3D1BB7D6 ^ ((v126 >> 8)
                                                                                           - ((2 * (v126 >> 8)) & 0xF654542C)
                                                                                           + 2066360854))
       + 1088089828;
  int v721 = (a48 ^ 0x6DE76CEB) + (v720 ^ 0xB9AE7F79) + ((2 * v720) & 0x735CFEF2) + 1179746440;
  unsigned int v722 = (v698 ^ (v710 + 229515116) ^ 0xACD9C83B ^ (v719 - ((2 * v719 + 2011732110) & 0x76362778) + 923754499))
       + (v721 ^ 0x7EEBDF6B)
       + ((2 * v721) & 0xFDD7BED6)
       - 2129387371;
  unsigned int v723 = v722 - 1483231906;
  int v724 = v722 - 1483231906 - ((2 * v722) & 0x4F2F5ABC);
  unsigned int v725 = v724 ^ 0xA797AD5E;
  unsigned int v726 = (v724 ^ 0xA797AD5E) + (v705 ^ 0xC504EA4C);
  HIDWORD(v126) = v724 ^ 0x1E;
  LODWORD(v126) = v724 ^ 0xA797AD40;
  int v727 = (v126 >> 6) - ((2 * (v126 >> 6)) & 0xF55B1AAE);
  HIDWORD(v126) = v723 ^ 2;
  LODWORD(v126) = v724 ^ 0xA797AD5C;
  int v728 = (v126 >> 2) - ((2 * (v126 >> 2)) & 0xC52839A6);
  HIDWORD(v126) = v724 ^ 0x55E;
  LODWORD(v126) = v724 ^ 0xA797A800;
  int v729 = (v126 >> 11) - ((2 * (v126 >> 11)) & 0xDF759B94);
  HIDWORD(v126) = v724 ^ 0x197AD5E;
  LODWORD(v126) = v724 ^ 0xA6000000;
  int v730 = v126 >> 25;
  HIDWORD(v126) = v724 ^ 0x17AD5E;
  LODWORD(v126) = v724 ^ 0xA7800000;
  int v731 = (v126 >> 22) - ((2 * (v126 >> 22)) & 0xA0BC87EA);
  HIDWORD(v126) = v724 ^ 0xD5E;
  LODWORD(v126) = v724 ^ 0xA797A000;
  int v732 = v724 ^ v688;
  unsigned int v733 = (v730 ^ 0x77A3AEFB)
       + ((2 * v730) & 0xEF475DF6)
       - 2007215866
       + ((v729 + 1874513354) ^ (v727 - 89289385) ^ 0x6AE8BF62);
  unsigned int v734 = (v732 ^ 0xBB91DE0F ^ (v726 - ((2 * v726) & 0x792D95B2) - 1130968359)) + v689;
  unsigned int v735 = v673 + (v733 ^ 0xCB3FA5D5) + ((2 * v733) & 0x967F4BAA);
  unsigned int v736 = v732 ^ 0xEEE338F5 ^ (v726 - ((2 * v726) & 0xD3C85846) - 370922461);
  unsigned int v737 = (HIDWORD(v831) ^ 0xF433F53A)
       + (v734 ^ 0xF0FF57E4)
       + ((2 * v734) & 0xE1FEAFC8)
       + ((v735 + 885021227) ^ 0x777EE2FB)
       + ((2 * (v735 + 885021227)) & 0xEEFDC5F6)
       + 1843483196;
  int v738 = ((v736 + v709) ^ 0x39181118)
       + ((v728 - 493609773) ^ ((v126 >> 13) - ((2 * (v126 >> 13)) & 0xF755CFEA) + 2074798069) ^ (v731 + 1348355061) ^ 0xC960B8D3)
       - ((2 * (v736 + v709)) & 0x8DCFDDCE)
       - 957878552;
  unsigned int v739 = ((2 * v738) & 0x5FEFFFBE) + (v738 ^ 0xAFF7FFDF) + (v737 ^ 0xFFFE77C7) + ((2 * v737) & 0xFFFCEF8E);
  unsigned int v740 = v739 - ((2 * v739 + 1249460) & 0x393604E);
  unsigned int v741 = v740 - 774686563;
  unsigned int v742 = v740 - 774686591;
  HIDWORD(v126) = (v740 - 774686591) ^ 0x27;
  LODWORD(v126) = (v740 - 774686591) ^ 0x81C9B000;
  int v743 = v126 >> 6;
  int v744 = v126 >> 11;
  HIDWORD(v126) = v742 ^ 0x1C9B027;
  LODWORD(v126) = v741 + 2147483620;
  int v745 = (v126 >> 25) - ((2 * (v126 >> 25)) & 0xCCB6DD3A) + 1717268125;
  unsigned int v746 = (v744 ^ 0xAF6D7FFF) + (v743 ^ 0xEFBBDFD7) + ((2 * v743) & 0xDF77BFAE) + ((2 * v744) & 0x5EDAFFFE);
  HIDWORD(v126) = v742 ^ 0x1027;
  LODWORD(v126) = v742 ^ 0x81C9A000;
  int v747 = (v126 >> 13) - ((2 * (v126 >> 13)) & 0xAC0957EE) + 1443146743;
  int v748 = (v724 ^ 0x265E1D79 ^ v742) + (v705 ^ 0x44CD5A6B ^ v742);
  unsigned int v749 = v748 ^ 0x91050000;
  unsigned int v750 = (2 * v748) & 0xDDF5FFFE;
  HIDWORD(v126) = ~v741;
  LODWORD(v126) = v742 ^ 0x81C9B024;
  int v751 = v126 >> 2;
  int v752 = (v742 ^ 0x7E364FD8) + 1;
  HIDWORD(v126) = v742 ^ 0x9B027;
  LODWORD(v126) = v742 ^ 0x81FFFFFF;
  unsigned int v753 = v752 + (v724 ^ 0xA797AD5E);
  unsigned int v754 = v745 ^ 0xCB5E5859 ^ (v746 - ((2 * v746 + 1101873236) & 0x5A0A6D88) + 232511214);
  unsigned int v755 = (v724 ^ 0xA797AD5E) + ((v754 + v689) ^ 0xEC38EABE) + ((2 * (v754 + v689)) & 0xD871D57C) + 331814210;
  int v756 = (v705 ^ 0x62934712 ^ v724) + v749 - v750 + 1861943296;
  int v757 = (v756 ^ 0x158FAAE3)
       + ((2 * v756) & 0x2B1F55C6)
       + ((v751 - ((2 * v751) & 0x17EBB604) + 200661762) ^ v747 ^ ((v126 >> 22)
                                                                 - ((2 * (v126 >> 22)) & 0x67B38EEC)
                                                                 - 1277573258) ^ 0xEE28B783)
       - 361736931;
  int v758 = (v757 ^ 0x7EF5DBFF)
       + ((2 * v757) & 0xFDEBB7FE)
       - 2130041855
       + (v837 ^ 0xD2946B07 ^ (((2 * v755) & 0xFE5FFDBE)
                             + (v755 ^ 0xFF2FFEDF)
                             - ((2 * (((2 * v755) & 0xFE5FFDBE) + (v755 ^ 0xFF2FFEDF)) + 461336284) & 0x7F24E130)
                             - 1923995642));
  int v759 = v758 + 902648120 - ((2 * v758) & 0x6B9AA270);
  unsigned int v760 = v742 ^ 0x81C9B027;
  int v761 = v759 ^ 0x35CD5138;
  HIDWORD(v126) = v759 ^ 0xD5138;
  LODWORD(v126) = v759 ^ 0x35C00000;
  int v762 = v126 >> 22;
  unsigned int v763 = (v724 ^ 0x6DA50399 ^ v759)
       + (((v759 ^ 0x35CD5138) + (v742 ^ 0x81C9B027)) ^ 0xCFFEB47D)
       + ((2 * ((v759 ^ 0x35CD5138) + (v742 ^ 0x81C9B027))) & 0x9FFD68FA)
       + 805391236;
  HIDWORD(v126) = v759 ^ 0x138;
  LODWORD(v126) = v759 ^ 0x35CD5000;
  int v764 = v126 >> 11;
  unsigned int v765 = ((2 * v753) & 0xDFEFE5FC) + (v753 ^ 0x6FF7F2FE) + (v763 ^ 0xB9DEBFD7) + ((2 * v763) & 0x73BD7FAE);
  HIDWORD(v126) = v759 ^ 0x1CD5138;
  LODWORD(v126) = v759 ^ 0x34000000;
  int v766 = v126 >> 25;
  HIDWORD(v126) = v759 ^ 0x1138;
  LODWORD(v126) = v759 ^ 0x35CD4000;
  int v767 = (v126 >> 13) - ((2 * (v126 >> 13)) & 0x3B6F09E6);
  HIDWORD(v126) = v759 ^ 0x38;
  LODWORD(v126) = v759 ^ 0x35CD5100;
  int v768 = v126 >> 6;
  HIDWORD(v126) = v758;
  LODWORD(v126) = v759 ^ 0x35CD5138;
  int v769 = (v762 ^ 0x80904110)
       - ((2 * v762) & 0xFEDF7DDE)
       + 2138029808
       + ((v767 + 498566387) ^ ((v126 >> 2) - ((2 * (v126 >> 2)) & 0x43915F30) - 1580683368) ^ 0xBC7F2B6B);
  unsigned int v770 = v707
       + (v766 ^ 0x1050A48A)
       + (v764 ^ 0xEFDFFFBD)
       + (v768 ^ 0xEFAB45FB)
       + ((2 * v764) & 0xDFBFFF7A)
       + ((2 * v768) & 0xDF568BF6)
       - ((2 * v766) & 0xDF5EB6EA)
       + 270800318;
  unsigned int v771 = (v742 ^ 0x81C9B027) + (v770 ^ 0x7BEF92E3) + ((2 * v770) & 0xF7DF25C6) - 2079298275;
  unsigned int v772 = (HIDWORD(v837) ^ 0x4713DD6 ^ (((2 * v771) & 0xD7EFCB6E)
                                     + (v771 ^ 0x6BF7E5B7)
                                     - ((2 * (((2 * v771) & 0xD7EFCB6E) + (v771 ^ 0x6BF7E5B7)) - 375260140) & 0xC3C4D42E)
                                     - 692885471))
       + ((v769 - ((2 * v769) & 0xCE984708) - 414440572) ^ (v765 - ((2 * v765 + 206740054) & 0x1A742762) + 1667457244) ^ 0x6A763035);
  unsigned int v773 = v772 + 1260034048 - ((2 * v772) & 0x96353606);
  unsigned int v774 = v773 + 771;
  int v775 = (v773 + 771) ^ 0x4B1A9B03;
  unsigned int v776 = v775 + (v759 ^ 0x35CD5138) - ((2 * (v775 + (v759 ^ 0x35CD5138))) & 0xD5A40300) - 355335808;
  HIDWORD(v126) = (v773 + 771) ^ 0x1B03;
  LODWORD(v126) = (v773 + 771) ^ 0x4B1A8000;
  int v777 = (v126 >> 13) - ((2 * (v126 >> 13)) & 0x23362CB4) + 295376474;
  unsigned int v778 = ((v752 + v775 - ((2 * (v752 + v775)) & 0x60C06E0E) - 1335871737) ^ v776 ^ 0x5AB23687) + (v742 ^ 0x81C9B027);
  HIDWORD(v126) = (v773 + 771) ^ 0x11A9B03;
  LODWORD(v126) = (v773 + 771) ^ 0x4A000000;
  int v779 = v126 >> 25;
  unsigned int v780 = (v773 + 771) ^ 0x4B1A9B00;
  unsigned int v781 = (v780 >> 2) - (v773 << 30) - ((2 * ((v780 >> 2) - (v773 << 30))) & 0xCEBBA4F2);
  HIDWORD(v126) = v774 ^ 3;
  LODWORD(v126) = v780;
  int v782 = v126 >> 6;
  HIDWORD(v126) = v774 ^ 0x1A9B03;
  LODWORD(v126) = v774 ^ 0x4B000000;
  int v783 = v126 >> 22;
  HIDWORD(v126) = v774 ^ 0x3030303;
  LODWORD(v126) = v774 ^ 0x4B1A9800;
  unsigned int v784 = (v759 ^ 0x7ED7CA3B ^ v774) + (v742 ^ 0xCAD32B24 ^ v774);
  unsigned int v785 = (v742 ^ 0xB404E11F ^ v759) + (v784 ^ 0xFB5DD8F7) + ((2 * v784) & 0xF6BBB1EE) + 77735689;
  int v786 = v725
       + (v779 ^ 0x4041018)
       + (v782 ^ 0xC494DD66)
       + ((v126 >> 11) ^ 0xDBE6F4D9)
       - ((2 * v782) & 0x76D64532)
       - ((2 * v779) & 0xF7F7DFCE)
       + ((2 * (v126 >> 11)) & 0xB7CDE9B2)
       + 1535122857;
  unsigned int v787 = (v783 ^ 0x8A8C040C) - ((2 * v783) & 0xEAE7F7E6) + 1970535412 + (v777 ^ 0xF6C6C423 ^ (v781 - 413281671));
  unsigned int v788 = (v366 ^ 0x24D025DF)
       + (v778 ^ 0xF7D7B6DD)
       + (v786 ^ 0x2FBFF7C7)
       + ((2 * v778) & 0xEFAF6DBA)
       + ((2 * v786) & 0x5F7FEF8E)
       - 1906340197;
  unsigned int v789 = ((v785 - ((2 * v785) & 0xE04BEF3C) - 265947234) ^ 0x2C581370 ^ (v787 - ((2 * v787) & 0xB8FBC9DC) - 595729170))
       + (v788 ^ 0x5FAC6F8D)
       + ((2 * v788) & 0xBF58DF1A)
       - 1605136269;
  unsigned int v790 = v789 + 1293583112 - ((2 * v789) & 0x9A350610);
  int v791 = v790 ^ v774;
  unsigned int v792 = (v790 ^ v774 ^ 0x600180B)
       + (((v790 ^ 0x4D1A8308) + (v759 ^ 0x35CD5138)) ^ 0xC8001C04)
       - ((2 * ((v790 ^ 0x4D1A8308) + (v759 ^ 0x35CD5138))) & 0x6FFFC7F6)
       + 939516924;
  HIDWORD(v126) = v790 ^ 0x308;
  LODWORD(v126) = v790 ^ 0x4D1A8000;
  int v793 = v126 >> 13;
  HIDWORD(v126) = v790 ^ 8;
  LODWORD(v126) = v790 ^ 0x4D1A8300;
  int v794 = v126 >> 6;
  HIDWORD(v126) = v790 ^ 0x308;
  LODWORD(v126) = v790 ^ 0x4D1A8000;
  int v795 = v126 >> 11;
  HIDWORD(v126) = v790 ^ 0x11A8308;
  LODWORD(v126) = v790 ^ 0x4C000000;
  int v796 = v126 >> 25;
  unsigned int v797 = (v759 ^ 0x78D7D230 ^ v790)
       + (((v774 ^ 0xB4E564FC) + (v790 ^ 0x4D1A8308) + 1) ^ 0x4FFD87F6)
       + ((2 * ((v774 ^ 0xB4E564FC) + (v790 ^ 0x4D1A8308) + 1)) & 0x9FFB0FEC)
       - 1342015478;
  HIDWORD(v126) = v790 ^ 0x1A8308;
  LODWORD(v126) = v790 ^ 0x4D000000;
  int v798 = v126 >> 22;
  unsigned int v799 = v760 + (v795 ^ 0x4004844) + (v796 ^ 0xF73FBE6F) + (v794 ^ 0x14820008) + ((2 * v796) & 0xEE7F7CDE);
  HIDWORD(v126) = v789;
  LODWORD(v126) = v790 ^ 0x4D1A8308;
  unsigned int v800 = v761 + (v797 ^ 0xD97EAFDD) + ((2 * v797) & 0xB2FD5FBA) + 646008867;
  int v801 = (v793 ^ 0x30544600)
       + ((v126 >> 2) ^ 0xDD3EF7D7)
       + (v798 ^ 0x48886110)
       + ((2 * (v126 >> 2)) & 0xBA7DEFAE)
       - ((2 * v798) & 0x6EEF3DDE)
       - ((2 * v793) & 0x9F5773FE)
       - 1444650727
       + (v776 ^ 0xED8B38CD ^ (v792 - ((2 * v792) & 0xEB2729A) + 123287885));
  unsigned int v802 = ((v799 - ((2 * v795) & 0xF7FF6F76) - ((2 * v794) & 0xD6FBFFEE) - 264373947) ^ 0xBF5BFDDF)
       - v358
       + (v800 ^ 0x3F6DFFFF)
       + ((2 * (v799 - ((2 * v795) & 0xF7FF6F76) - ((2 * v794) & 0xD6FBFFEE) - 264373947)) & 0x7EB7FBBE)
       + ((2 * v800) & 0x7EDBFFFE)
       + (v801 ^ 0xFE97BB9)
       + ((2 * v801) & 0x1FD2F772);
  int v803 = v802 - ((2 * v802 + 195180658) & 0xD840722) - 1936515126;
  HIDWORD(v126) = v803 ^ 0x11111111;
  LODWORD(v126) = v803 ^ 0x86C20380;
  int v804 = v126 >> 6;
  HIDWORD(v126) = v803 ^ 0x391;
  LODWORD(v126) = v803 ^ 0x86C20000;
  int v805 = v126 >> 11;
  HIDWORD(v126) = v803 ^ 0xC20391;
  LODWORD(v126) = v803 ^ 0x86000000;
  int v806 = v126 >> 25;
  HIDWORD(v126) = v803 ^ 0x20391;
  LODWORD(v126) = v803 ^ 0x86C00000;
  int v807 = v126 >> 22;
  int v808 = v803 ^ v774;
  unsigned int v809 = v761
       + (v806 ^ 0x21E04149)
       + (v805 ^ 0xED6FFFF9)
       + (v804 ^ 0xF9D768BF)
       + ((2 * v805) & 0xDADFFFF2)
       + ((2 * v804) & 0xF3AED17E)
       - ((2 * v806) & 0xBC3F7D6C);
  HIDWORD(v126) = v803 ^ 1;
  LODWORD(v126) = v803 ^ 0x86C20390;
  int v810 = v126 >> 2;
  HIDWORD(v126) = v803 ^ 0x391;
  LODWORD(v126) = v803 ^ 0x86C20000;
  unsigned int v811 = v775
       + (((v808 ^ 0xCDD89892)
         + (((v803 ^ 0x86C20391) + (v790 ^ 0x4D1A8308)) ^ 0xB7BCF37F)
         + ((2 * ((v803 ^ 0x86C20391) + (v790 ^ 0x4D1A8308))) & 0x6F79E6FE)
         + 1212353665) ^ 0xC0003548)
       - ((2
         * ((v808 ^ 0xCDD89892)
          + (((v803 ^ 0x86C20391) + (v790 ^ 0x4D1A8308)) ^ 0xB7BCF37F)
          + ((2 * ((v803 ^ 0x86C20391) + (v790 ^ 0x4D1A8308))) & 0x6F79E6FE)
          + 1212353665)) & 0x7FFF956E);
  int v812 = (v810 ^ 0x1EA6F9B3)
       + ((v126 >> 13) ^ 0xF3FDB76F)
       + (v807 ^ 0xCE8285)
       + ((2 * v810) & 0x3D4DF366)
       + ((2 * (v126 >> 13)) & 0xE7FB6EDE)
       - ((2 * v807) & 0xFE62FAF4);
  unsigned int v813 = (v791 ^ 0xF9FFE7F4)
       + (v808 ^ 0xD93D6AF9 ^ ((v790 ^ 0xB2E57CF7)
                             + (v803 ^ 0x86C20391)
                             + 1
                             - ((2 * ((v790 ^ 0xB2E57CF7) + (v803 ^ 0x86C20391) + 1)) & 0x29CBE4D6)
                             + 350614123))
       + 1;
  unsigned int v814 = ((v424 + 1231166082) ^ 0x3F93FFDD)
       + ((2 * (v424 + 1231166082)) & 0x7F27FFBA)
       + ((v809 - 153594369) ^ 0x5A3FFFFB)
       + ((v811 + 1073728184) ^ 0xFE6BFFFF)
       + ((2 * (v811 + 1073728184)) & 0xFCD7FFFE)
       + ((2 * (v809 - 153594369)) & 0xB47FFFF6)
       + 1605325681
       + ((v813 - ((2 * v813) & 0xE274A10E) - 247836537) ^ (v812
                                                          + 1
                                                          - 2 * ((v812 + 210553945) & 0x1F2157DD ^ (v812 + 1) & 4)
                                                          + 195961905) ^ 0xEE1B075E);
  unsigned int v815 = v814 + 1568964608 - ((2 * v814) & 0xBB09063E) + 799;
  HIDWORD(v126) = v815 ^ 0x1F;
  LODWORD(v126) = v815 ^ 0x5D848300;
  return ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_10025C670 + ((((167 * (((HIDWORD(v846) - 729) | 0x214) ^ 0x298)) ^ 0x29A) * ((int)v848 >= 559453140)) | HIDWORD(v846))))( (v126 >> 6),  147LL,  3575395474LL,  809818951LL,  559453139LL,  3472778395LL,  (v815 ^ 0x5D84831F)
         + (a56 ^ 0xE64661E1)
         - 431595039
         - ((2 * ((v815 ^ 0x5D84831F) + (a56 ^ 0xE64661E1))) & 0xCC8CC3C2),
           822189023LL,
           a3,
           a4,
           a5,
           a6,
           a7,
           a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           a14,
           v817,
           v818,
           v819,
           v820,
           v821,
           v822,
           v823,
           v824,
           v825,
           v826,
           v827,
           v828,
           v829,
           v830,
           v831,
           v832,
           v833,
           v834,
           a33,
           a34,
           a35,
           v835,
           v836,
           a38,
           v837,
           v840,
           v843,
           v846,
           v848,
           v849,
           v850,
           v851,
           a47,
           a48);
}

uint64_t sub_1001CAC58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
}

void sub_1001CACAC()
{
}

#error "1001D0EB8: call analysis failed (funcsize=5127)"
void sub_1001D0EBC()
{
  JUMPOUT(0x1001D0AC4LL);
}

uint64_t sub_1001D0EC4@<X0>( int a1@<W1>, uint64_t a2@<X2>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  LOBYTE(STACK[0x3A5]) = BYTE1(a3) ^ 0xA;
  LOBYTE(STACK[0x552]) = BYTE2(v61) ^ 0xFE;
  LOBYTE(STACK[0x737]) = HIBYTE(a3) ^ 0x95;
  LOBYTE(STACK[0x389]) = BYTE1(v61) ^ 0xDA;
  LOBYTE(STACK[0x56E]) = BYTE2(a3) ^ 0x4A;
  LOBYTE(STACK[0x71B]) = HIBYTE(v61) ^ 0x25;
  LOBYTE(STACK[0x76F]) = HIBYTE(v60) ^ 0xA6;
  LOBYTE(STACK[0x214]) = v60 ^ 0xB5;
  LOBYTE(STACK[0x3C1]) = BYTE1(v58) ^ 0x96;
  LOBYTE(STACK[0x58A]) = BYTE2(v58) ^ 0x78;
  LOBYTE(STACK[0x3DD]) = BYTE1(v60) ^ 0x83;
  LOBYTE(STACK[0x753]) = HIBYTE(v58) ^ 0x8E;
  LOBYTE(STACK[0x5A6]) = BYTE2(v60) ^ 0xF3;
  uint64_t v63 = (HIDWORD(a7) + 221714557);
  BOOL v64 = v63 < 0xFB7733C;
  unsigned int v65 = (a1 ^ 0xC33B093D)
  unsigned int v66 = ((2 * v65) & 0xA6FDC5FE) + (v65 ^ 0xD37EE2FF);
  unsigned int v67 = (v66 + 746659073) % 0x101;
  int v68 = v58 ^ v62;
  unsigned int v69 = v68
      + (((v59 ^ 0x6A5FECD7) + 746659073 + v66 + 1) ^ 0xBFDF3E96)
      + ((2 * ((v59 ^ 0x6A5FECD7) + 746659073 + v66 + 1)) & 0x7FBE7D2C)
      + 1075888490;
  unsigned int v70 = ((2 * v67) & 0x3A8) + (v67 ^ 0xD77F9BD4) + (v69 ^ 0x9AE9ADB7) + ((2 * v69) & 0x35D35B6E);
  unsigned int v71 = v70 - ((2 * v70 + 455961834) & 0x8C2CBB6C) - 743631829;
  int v72 = v71 ^ v60;
  int v73 = ((2 * v71) & 0x5DDFFC7A ^ 0x45F7450) + (v71 ^ 0x7DC04415);
  int v74 = (v72 ^ 0x1AB356F2) + 1;
  int v75 = v74 + v68 - ((2 * (v74 + v68)) & 0x52E442CE) - 1452138137;
  unsigned int v76 = v74 + (v59 ^ 0x95A01328) - ((2 * (v74 + (v59 ^ 0x95A01328))) & 0x6C8B83AA) - 1236942379;
  int v77 = (v76 ^ v72 ^ 0x530968D8) + 644140058;
  unsigned int v78 = v77 ^ 0xDF7FF7EE;
  unsigned int v79 = (2 * v77) & 0xBEFFEFDC;
  int v80 = (v75 ^ 0x568DDE98) + v73 + v78 + v79 - 53385476;
  unsigned int v81 = v80 - ((2 * v80 - 377666124) & 0xCF6A9398) + 1551101094;
  int v82 = v81 ^ v75;
  int v83 = v81 ^ v76;
  v81 ^= 0xE7B549CC;
  int v84 = v73 + 1360003523 + v81 - 1601367081 - ((2 * (v73 + 1360003523 + v81)) & 0x411A27AE);
  unsigned int v85 = (((v82 ^ 0x4EC768AB) + v81) ^ 0xFFE2F5FB) + (v83 ^ 0xAE0F77E6) + ((2 * ((v82 ^ 0x4EC768AB) + v81)) & 0xFFC5EBF6);
  unsigned int v86 = v84 ^ 0x557EAC77 ^ (v85 - ((2 * v85 + 3806220) & 0xEBE77F40) - 166671962);
  unsigned int v87 = v86 - 538496077 + (~(2 * v86 + 430282614) | 0xD9D73011);
  unsigned int v88 = (v87 ^ 0x931467F7) + (v84 ^ 0xA08D13D7);
  uint64_t v89 = v88 ^ 0x40E1120;
  unsigned int v90 = ((v87 ^ 0x931467F7)
       + (v87 ^ v83 ^ 0x3D1B1011)
       + 1
       - ((2 * ((v87 ^ 0x931467F7) + (v87 ^ v83 ^ 0x3D1B1011) + 1)) & 0x209FBBF4)
       + 273669626) ^ v87 ^ v82;
  int v91 = v89 - ((2 * v88) & 0xF7E3DDBE) + ((2 * v90) & 0xFBEFD31A ^ 0x9B298108) + (v90 ^ 0x306B3B2B) + 1;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_10025C670 + ((693 * !v64) ^ a2)) - 4))( v89,  v91 - ((2 * v91 + 1359434296) & 0x8676127A) - 339824039,  a2,  746659073LL,  1359434296LL,  263680828LL,  v63,  2143190316LL,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58);
}

void sub_1001D1434()
{
}

uint64_t sub_1001D143C( uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  LOBYTE(STACK[0x24C]) = v14 ^ 0x43;
  LOBYTE(STACK[0x415]) = BYTE1(v14) ^ 0x76;
  LOBYTE(STACK[0x78B]) = HIBYTE(a2) ^ 0x53;
  LOBYTE(STACK[0x5DE]) = BYTE2(v14) ^ 0x4F;
  LOBYTE(STACK[0x5C2]) = BYTE2(a2) ^ 0xAB;
  LOBYTE(STACK[0x230]) = a2 ^ 0xAD;
  LOBYTE(STACK[0x3F9]) = BYTE1(a2) ^ 0x99;
  LOBYTE(STACK[0x268]) = v12 ^ 0xF1;
  LOBYTE(STACK[0x5FA]) = BYTE2(v12) ^ 0x78;
  LOBYTE(STACK[0x616]) = BYTE2(v13) ^ 0xF3;
  LOBYTE(STACK[0x44D]) = BYTE1(v13) ^ 0x83;
  LOBYTE(STACK[0x7A7]) = HIBYTE(v14) ^ 0x91;
  LOBYTE(STACK[0x7C3]) = HIBYTE(v12) ^ 0x8E;
  LOBYTE(STACK[0x284]) = v13 ^ 0xB5;
  LOBYTE(STACK[0x431]) = BYTE1(v12) ^ 0x96;
  LOBYTE(STACK[0x7DF]) = HIBYTE(v13) ^ 0xA6;
  BOOL v15 = (a12 + 179648779) < 0x69FD241E || (a12 + 179648779) > 0x69FD241F;
  return ((uint64_t (*)(uint64_t))((char *)*(&off_10025C670 + ((397 * !v15) ^ (a3 - 1191))) - 12))(518522465LL);
}

void sub_1001D19BC()
{
}

uint64_t sub_1001D19C4@<X0>( uint64_t a1@<X0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X4>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52)
{
  LOBYTE(STACK[0x469]) = BYTE1(a3) ^ 0xD1;
  LOBYTE(STACK[0x7FB]) = HIBYTE(a3) ^ 0xC7;
  LOBYTE(STACK[0x2BC]) = v53 ^ 0xB8;
  LOBYTE(STACK[0x2D8]) = v52 ^ 0xF1;
  LOBYTE(STACK[0x4A1]) = BYTE1(v52) ^ 0x96;
  LOBYTE(STACK[0x817]) = HIBYTE(v53) ^ 5;
  LOBYTE(STACK[0x485]) = BYTE1(v53) ^ 0x83;
  LOBYTE(STACK[0x64E]) = BYTE2(v53) ^ 0x30;
  LOBYTE(STACK[0x66A]) = BYTE2(v52) ^ 0x78;
  LOBYTE(STACK[0x2F4]) = a5 ^ 0xD3;
  LOBYTE(STACK[0x632]) = BYTE2(a3) ^ 0xDF;
  LOBYTE(STACK[0x686]) = BYTE2(a5) ^ 0x5E;
  LOBYTE(STACK[0x833]) = HIBYTE(v52) ^ 0x8E;
  char v55 = (((a3 & 0x35 ^ 0xEF) + ((2 * (a3 & 0x35 ^ 0xEF)) & 0x22 ^ 0xEF) - 102) ^ 0x99) & (((a3 & 0xCA ^ 0xBD)
                                                                                         + ((2 * (a3 & 0xCA)) ^ 0x8D)
                                                                                         - 4) ^ 0xFB);
  LOBYTE(STACK[0x2A0]) = v55 - ((2 * v55) & 0x20) - 112;
  LOBYTE(STACK[0x84F]) = HIBYTE(a5) ^ 0x48;
  LOBYTE(STACK[0x4BD]) = BYTE1(a5) ^ 0x6B;
  LODWORD(a51) = (a4 - 1287791080) & 0x4CC21FA9;
  BOOL v56 = (HIDWORD(a6) - 1373951054) < 0x89439FB;
  uint64_t v57 = *((_DWORD *)&STACK[0x8D0] + (639829332 * (a51 ^ 0x368) - 1933810328) % 0x55C) ^ 0x9D71F67u;
  int v58 = LOBYTE(STACK[0x478]) ^ *(unsigned __int8 *)((v57 ^ 0x2F9FFC36F6EEFB5BLL)
                                                  + a10
                                                  - 0x4378B8CC4843E522LL
                                                  + ((2 * v57) & 0x1EDDDF6B6LL)
                                                  - 0x2F9FFC36F6EEFB5BLL);
  unsigned int v59 = (a2 ^ 0x3CC4F6C2) - 36496591 * (((2 * (v58 ^ 0xCCCCCCCC)) & 0x1D2) + (v58 ^ 0xF7C7F327));
  unsigned int v60 = v59 - ((2 * v59 + 1542159056) & 0xD0A66308) - 1773605140;
  int v61 = v52 ^ a1;
  unsigned int v62 = (((v53 ^ 0x95A01328) + v61) ^ 0xC82C601)
      - ((2 * ((v53 ^ 0x95A01328) + v61)) & 0xE6FA73FC)
      - 209896961
      + (v60 ^ 0x2E86FA37 ^ ((v60 ^ 0x68533184) % 0x101 - ((2 * ((v60 ^ 0x68533184) % 0x101)) & 0x366) + 1188416435));
  int v63 = (v62 - ((2 * v62) & 0x6C41CB22) - 1239358063) ^ v54;
  unsigned int v64 = (v63 ^ 0x8043F6B4) - 2 * (((v63 ^ 0x8043F6B4) + 495567544) & 0x3FC026D5 ^ v63 & 1) + 1565125004;
  unsigned int v65 = ((2 * ((v64 ^ 0xBFC026D4) + v61)) & 0xC8B7DDBC) + (((v64 ^ 0xBFC026D4) + v61) ^ 0x645BEEDE);
  int v66 = v64 ^ v54;
  unsigned int v67 = v65 - 1683746526;
  LODWORD(v57) = (v66 ^ 0xE122D649 ^ (v67
                                    + (v53 ^ 0x95A01328)
                                    - ((2 * (v67 + (v53 ^ 0x95A01328))) & 0xD103C770)
                                    + 1753342904))
               + 1423587212;
  int v68 = ((2 * v57) & 0xFBDBDB66) + (v57 ^ 0x7DEDEDB3);
  int v69 = v68
      - 2112744883
      + (v53 ^ 0x2A6035FC ^ v64)
      - 2008863365
      - ((2 * (v68 - 2112744883 + (v53 ^ 0x2A6035FC ^ v64))) & 0x10865AF6);
  unsigned int v70 = ((v68 - 2112744883) ^ v66 ^ 0x89A335F1)
      + 680571825
      - 2 * (((v68 - 2112744883) ^ v66 ^ 0x89A335F1) & 0x2890B3B7 ^ ((v68 - 2112744883) ^ v66) & 6);
  unsigned int v71 = ((2 * ((v69 ^ 0x88432D7B) + v67)) & 0x6F1DF7C8) + (((v69 ^ 0x88432D7B) + v67) ^ 0x378EFBE4);
  int v72 = v70 ^ 0x1AA14981 ^ (1774253588 - v71 - ((1864234952 - 2 * v71) & 0x6463F460));
  int v73 = v72 - ((2 * v72 + 506164194) & 0x7F89861A) + 1322941694;
  int v74 = v73 ^ v70;
  unsigned int v75 = (((v69 ^ 0x3787EE76 ^ v73) + (v73 ^ 0xBFC4C30D)) ^ 0xE6E6FE5E)
      + ((2 * ((v69 ^ 0x3787EE76 ^ v73) + (v73 ^ 0xBFC4C30D))) & 0xCDCDFCBC)
      + 421069218
      + ((v65
        + v68
        + 498475887
        + (v73 ^ 0xBFC4C30D)
        - 1326400354
        - ((2 * (v65 + v68 + 498475887 + (v73 ^ 0xBFC4C30D))) & 0x61E1793C)) ^ 0xB0F0BC9E);
  uint64_t v76 = (v75 - ((2 * v75) & 0x16562034) - 1960112102) ^ v74;
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_10025C670 + (int)((30 * !v56) ^ a4)) - 12))( a1,  v76 ^ 0xFC10B6D7,  3452828860LL,  421069218LL,  a4,  v76,  2538893500LL,  4228953815LL,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52);
}

void sub_1001D1FF8()
{
}

uint64_t sub_1001D2010( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,unsigned int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LOBYTE(STACK[0x32C]) = v66 ^ 0xB8;
  LOBYTE(STACK[0x310]) = a6 ^ 0x47;
  LOBYTE(STACK[0x887]) = HIBYTE(v66) ^ 5;
  LOBYTE(STACK[0x4D9]) = BYTE1(a6) ^ 0x26;
  LOBYTE(STACK[0x6DA]) = BYTE2(v65) ^ 0x70;
  LOBYTE(STACK[0x6BE]) = BYTE2(v66) ^ 0x30;
  LOBYTE(STACK[0x86B]) = HIBYTE(a6) ^ 0x6C;
  LOBYTE(STACK[0x364]) = v67 ^ 0xB5;
  LOBYTE(STACK[0x4F5]) = BYTE1(v66) ^ 0x83;
  LOBYTE(STACK[0x348]) = v65 ^ 0xD9;
  LOBYTE(STACK[0x8A3]) = HIBYTE(v65) ^ 0xDC;
  LOBYTE(STACK[0x6F6]) = BYTE2(v67) ^ 0xF3;
  LOBYTE(STACK[0x6A2]) = BYTE2(a6) ^ 0x80;
  LOBYTE(STACK[0x52D]) = BYTE1(v67) ^ 0x83;
  LOBYTE(STACK[0x8BF]) = HIBYTE(v67) ^ 0xA6;
  LOBYTE(STACK[0x511]) = BYTE1(v65) ^ 0x9A;
  LODWORD(a53) = -134217732;
  int v68 = -721315142 - 1487347361 * ((((a65 ^ 0x90) << (a54 - 8)) & 0xCE) + (a65 ^ 0x7E9FE7F7));
  unsigned int v69 = v68
      - 418090588
      + (((v68 - 454836432) % 0x101u) ^ 0xFE7FFFEF)
      + ((2 * ((v68 - 454836432) % 0x101u)) & 0x3DE)
      - 429670591;
  unsigned int v70 = (v69 ^ 0xFFBBE973) + 621096836 + ((2 * v69) & 0xFF77D2E6) + 4462221;
  int v71 = (v70 - ((2 * v70) & 0xF770D10) + 129730184) ^ 0x459D2926;
  unsigned int v72 = ((v71 - 1738420157) ^ 0x75F6CFBE) - 649391344 + ((2 * (v71 - 1738420157)) & 0xEBED9F7C) + 1;
  unsigned int v73 = ((v72 - 1077624051 - ((2 * v72 + 298966018) & 0x6DB7C02C) + 2826) ^ 0xE7F77DD5) - 1543265250;
  unsigned int v74 = ((v73 - ((2 * v73 - 1876498466) & 0xAC4C0298) + 507082043) ^ 0x1677462D) - 35086739;
  int v75 = (v74 - ((2 * v74) & 0x1FD60FE8) - 1880422412) ^ 0x754AC756;
  unsigned int v76 = v75 - ((2 * v75 - 597685216) & 0x9C5E8514) - 1134606182;
  unsigned int v77 = (v76 ^ 0xB1D0BD75) - 1605399210 - ((2 * ((v76 ^ 0xB1D0BD75) + 644941651)) & 0xF3BD0C06);
  unsigned int v78 = (v76 ^ 0xB1D0BD75) + 621096837;
  unsigned int v79 = v78 ^ 0xFBB0E6F9;
  unsigned int v80 = (2 * v78) & 0xF761CDF2;
  unsigned int v81 = v76 ^ 0xC96219F8;
  unsigned int v82 = (v76 ^ 0xB1D0BD75) + 595271993 - ((2 * ((v76 ^ 0xB1D0BD75) + 1117723493)) & 0xC1B80BA8);
  unsigned int v83 = ((2 * ((v76 ^ 0x4E2F428A) - 1068415135)) & 0xD733FDEE) + (((v76 ^ 0x4E2F428A) - 1068415135) ^ 0x6B99FEF7);
  int v84 = v76 ^ 0xC09ED24;
  int v85 = (v76 ^ 0xC09ED24) + (v76 ^ 0x4E2F428A);
  int v86 = v85 ^ 0x7BF972BC;
  unsigned int v87 = (2 * v85) & 0xF7F2E578;
  unsigned int v88 = v79 + 72292615 + v80;
  unsigned int v89 = v76 ^ 0xA93B332E;
  unsigned int v90 = (v77 ^ 0x79DE8603)
      + (((v76 ^ 0x8752D821) + v88) ^ 0x7FB9F1F8)
      + ((2 * ((v76 ^ 0x8752D821) + v88)) & 0xFF73E3F0)
      - 2142892536;
  unsigned int v91 = ((v89 + v86 + v87 - 2079945404) ^ 0xAF77FED3)
      + ((2 * (v89 + v86 + v87 - 2079945404)) & 0x5EEFFDA6)
      + (v90 ^ 0x8120E4C0);
  int v92 = v76 ^ 0x195A034C;
  unsigned int v93 = v76 ^ 0xADA771E9;
  unsigned int v94 = (v76 ^ 0xB1D0BD75) + 1243070047 - ((2 * ((v76 ^ 0xB1D0BD75) + 1243070047) + 128040990) & 0x5C0C31E) - 1229897314;
  int v95 = v76 ^ 0x37FC83F6;
  unsigned int v96 = (v76 ^ 0xB1D0BD75) - 1738420156 - ((2 * ((v76 ^ 0xB1D0BD75) - 1738420156)) & 0xADC62064) - 689762254;
  unsigned int v97 = v91
      - ((2 * v90) & 0xFDBE367E)
      + 1
      - ((2 * (v91 - ((2 * v90) & 0xFDBE367E) + 1) - 1630652200) & 0xA9E7899E)
      - 1537547973;
  int v98 = (v76 ^ 0x4E2F428A) + 334030835 - ((2 * ((v76 ^ 0x4E2F428A) + 334030835)) & 0x4D6A8AF6) - 1498069637;
  unsigned int v99 = (((v76 ^ 0x4E2F428A) - 179867185) ^ 0x9CECBBB5)
      + 1662207051
      + ((2 * ((v76 ^ 0x4E2F428A) - 179867185)) & 0x39D9776A);
  unsigned int v100 = (v76 ^ 0x696083A4)
       + (v82 ^ 0x9B69A094 ^ ((v96 ^ 0x210D4FD ^ v97)
                            + v99
                            - ((2 * ((v96 ^ 0x210D4FD ^ v97) + v99)) & 0xF76B4A80)
                            + 2075501888))
       + 1;
  v76 ^= 0xA5F6C87u;
  unsigned int v101 = v76 + (v100 ^ 0xB077FDAF) + ((2 * v100) & 0x60EFFB5E) + 1334313553;
  unsigned int v102 = (v93 ^ v98 ^ 0x33940509 ^ (v101 - ((2 * v101) & 0x768BFC1C) + 994442766)) - v83;
  int v103 = (v92 ^ 0x522B7E9B) + (v94 ^ 0x10A6BF4D ^ (v102 - ((2 * v102 + 389283310) & 0x248DBD84) + 2111888825)) + 1;
  unsigned int v104 = ((2 * v103) & 0xBFC2FD3C)
       + (v103 ^ 0x5FE17E9E)
       - 2 * ((((2 * v103) & 0xBFC2FD3C) + (v103 ^ 0x5FE17E9E) + 2122314840) & 0x492A180B ^ (v103 ^ 0x5FE17E9E) & 2)
       + 1202326625;
  unsigned int v105 = (v104 ^ 0xC92A1809) + v76 - ((2 * ((v104 ^ 0xC92A1809) + v76)) & 0xC6391E44) - 484667614;
  unsigned int v106 = ((2 * ((v104 ^ 0xC92A1809) + (v82 ^ 0xE0DC05D4))) & 0xFFB5C9FC)
       + (((v104 ^ 0xC92A1809) + (v82 ^ 0xE0DC05D4)) ^ 0xFFDAE4FE);
  int v107 = v104 ^ v93;
  int v108 = v104 ^ v98;
  int v109 = v104 ^ v92;
  unsigned int v110 = (v104 ^ 0xC92A1809) + v89 - ((2 * ((v104 ^ 0xC92A1809) + v89)) & 0x346D739E) + 439794127;
  unsigned int v111 = ((2 * ((v104 ^ 0xC92A1809) + (v94 ^ 0x2E0618F))) & 0xD72FF7E4)
       + (((v104 ^ 0xC92A1809) + (v94 ^ 0x2E0618F)) ^ 0xEB97FBF2);
  unsigned int v112 = ((2 * ((v104 ^ 0xC92A1809) + v99)) & 0xFC7BFEFE) + (((v104 ^ 0xC92A1809) + v99) ^ 0xFE3DFF7F);
  int v113 = v104 ^ v81;
  unsigned int v114 = v84 + (v104 ^ 0x36D5E7F6) + 2014535445 - ((2 * (v84 + (v104 ^ 0x36D5E7F6) + 1)) & 0xF026BE28);
  int v115 = v104 ^ v95;
  unsigned int v116 = (v104 ^ 0xC92A1809) + v88 + 911198219 - ((2 * ((v104 ^ 0xC92A1809) + v88)) & 0x6C9F9016);
  int v117 = (v104 ^ 0x36D5E7F6)
       + v83
       - 2 * (((v104 ^ 0x36D5E7F6) + v83 + 342229258) & 0x30267D61 ^ ((v104 ^ 0x36D5E7F6) + v83) & 1)
       + 1150058090;
  int v118 = v96 ^ 0x1FC9083B ^ v104;
  unsigned int v119 = (v104 ^ v116 ^ v110 ^ v114 ^ 0x9D4036D9) + v118;
  unsigned int v120 = v77 ^ 0xB0F49E0A ^ v104;
  unsigned int v121 = (((v113 ^ 0x871AD9D0) + v120) ^ 0x2284A2D0)
       - v106
       - ((2 * ((v113 ^ 0x871AD9D0) + v120)) & 0xBAF6BA5E)
       + v112
       + (v119 ^ 0x3FDA9EAF)
       + ((2 * v119) & 0x7FB53D5E)
       - 1573637871;
  unsigned int v122 = (v105 ^ 0x1CE370DD) + (v115 ^ 0xEDD0CB0A ^ (v121 - ((2 * v121 + 169010654) & 0xB32595C) - 2103271523)) + 1;
  unsigned int v123 = (v107 ^ 0x674EA675) + (v122 ^ 0xBBF6F536) + ((2 * v122) & 0x77EDEA6C) + 1141443274;
  int v124 = (v108 ^ v117 ^ 0x5EBFFF19 ^ (v123 - ((2 * v123) & 0x20DBE16) - 2130256117)) - 762027389;
  unsigned int v125 = (v109 ^ 0x9B016692) + (v124 ^ 0xF6FF7FF2) + ((2 * v124) & 0xEDFEFFE4) + 151027727;
  uint64_t v126 = ((2 * v125) & 0xDBEFEFFC) + (v125 ^ 0x6DF7F7FE);
  int v127 = v111 + v126 - ((2 * (v111 + v126) + 216012832) & 0xD9ED83E) - 1388349393;
  unsigned int v128 = ((2 * ((v127 ^ 0x6CF6C1F) + (v116 ^ 0x364FC80B))) & 0xEFBEFBBE)
       + (((v127 ^ 0x6CF6C1F) + (v116 ^ 0x364FC80B)) ^ 0x77DF7DDF);
  unsigned int v129 = ((2 * (v112 + 29491329 + (v127 ^ 0x6CF6C1F))) & 0x7FE7FFAE)
       + ((v112 + 29491329 + (v127 ^ 0x6CF6C1F)) ^ 0xBFF3FFD7);
  HIDWORD(v130) = v128 + 1;
  LODWORD(v130) = v128 - 2011135455;
  int v131 = (v130 >> 2) + 1515450368 - ((2 * (v130 >> 2)) & 0xB4A7F2FE) + 2431;
  HIDWORD(v130) = v131 ^ 0x97F;
  LODWORD(v130) = v131 ^ 0x5A53F000;
  unsigned int v132 = (v127 ^ 0x6CF6C1F)
       + (v117 ^ 0xB0267D60)
       + 597931584
       - ((2 * ((v127 ^ 0x6CF6C1F) + (v117 ^ 0xB0267D60))) & 0x47476C80);
  int v133 = (v130 >> 12) - ((2 * (v130 >> 12)) & 0xC2F1086) - 2045278141;
  unsigned int v134 = ((2 * ((v127 ^ 0x6CF6C1F) + (v108 ^ 0x6F9F5D72))) & 0xEE7FF3BC)
       + (((v127 ^ 0x6CF6C1F) + (v108 ^ 0x6F9F5D72)) ^ 0x773FF9DE);
  int v135 = v127 ^ v109;
  int v136 = (v127 ^ 0x6CF6C1F) + v118 + 812793684 - ((2 * ((v127 ^ 0x6CF6C1F) + v118)) & 0x60E47EA8);
  unsigned int v137 = v106 + 2431746 + (v127 ^ 0x6CF6C1F) + 2081045839 - ((2 * (v106 + 2431746 + (v127 ^ 0x6CF6C1F))) & 0xF8147A9E);
  HIDWORD(v130) = v133 ^ 0x38843;
  LODWORD(v130) = v133 ^ 0x86140000;
  int v138 = (v130 >> 18) - 1394428866 - ((2 * (v130 >> 18)) & 0x59C5687C);
  uint64_t v139 = ((2 * ((v127 ^ 0x6CF6C1F) + (v115 ^ 0x6849E7A4))) & 0x3DBE7EDA)
       + (((v127 ^ 0x6CF6C1F) + (v115 ^ 0x6849E7A4)) ^ 0x9EDF3F6D);
  unsigned int v140 = ((2 * (v127 ^ v105)) & 0xB6F6D6E4 ^ 0x82A6C660) + (v127 ^ v105 ^ 0x3EA8884F);
  unsigned int v141 = (v120 + (v127 ^ 0xF93093E0) - 907230845 - ((2 * (v120 + (v127 ^ 0xF93093E0) + 1)) & 0x93D98304)) ^ 0xC9ECC182;
  unsigned int v142 = (v113 ^ 0x81D5B5CF ^ v127)
       + (((v127 ^ 0xAA2DD821 ^ v138) + v141) ^ 0xD6EFFF9B)
       + ((2 * ((v127 ^ 0xAA2DD821 ^ v138) + v141)) & 0xADDFFF36)
       + 688914533;
  unsigned int v143 = ((2 * ((v127 ^ 0x6CF6C1F) + (v114 ^ 0x78135F14))) & 0x21A7FEFC)
       + (((v127 ^ 0x6CF6C1F) + (v114 ^ 0x78135F14)) ^ 0x10D3FF7E)
       + ((2 * (v127 ^ v110)) & 0x7FBD0EC4 ^ 0x39B10A80)
       + (v127 ^ v110 ^ 0xA32752B2)
       + (v142 ^ 0xF7FFFFFC)
       + ((2 * v142) & 0xEFFFFFF8)
       + 1069438566;
  unsigned int v144 = (v136 ^ 0x6A4175E7 ^ (v143 - ((2 * v143 - 283228804) & 0xB4669566) + 1371696497)) - v129;
  int v145 = v107 ^ 0x6181CA6A ^ v127;
  unsigned int v146 = (v137 ^ 0xC582287 ^ (v144 - ((2 * v144 + 2145910702) & 0xE0A43F90) + 809901983)) + v145;
  int v147 = (v135 ^ 0x9DCE0A8D)
       + (v132 ^ 0x6AD04B0A ^ ((v146 ^ 0x5FEEFFFF)
                             - (v134
                              + v140
                              + v139)
                             + ((2 * v146) & 0xBFDDFFFE)
                             - 2
                             * (((v146 ^ 0x5FEEFFFF) - (v134 + v140 + v139) + ((2 * v146) & 0xBFDDFFFE) - 1851022146) & 0x4973FD4B ^ ((v146 ^ 0x5FEEFFFF) - (v134 + v140 + v139)) & 1)
                             - 618683896))
       + 1;
  int v148 = (v147 ^ 0xFAB6DBFD) + v126 + ((2 * v147) & 0xF56DB7FA);
  int v149 = v148 - ((2 * v148 + 782391306) & 0x28B9A566) - 1414660424;
  unsigned int v150 = ((2 * v149) & 0x7F8B6FF2 ^ 0x9014F40) + (v149 ^ 0xBB45505D);
  return ((uint64_t (*)(void, uint64_t, void, uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_10025C670 + a54))( v150 + (_DWORD)v139 - ((2 * (v150 + (_DWORD)v139) + 1119228212) & 0xDE997A4E),  4187141233LL,  v134 - v150,  63LL,  v150 + 1077561351 + v145 - 531894468 - ((2 * (v150 + 1077561351 + v145)) & 0xC097F9EC),  v126,  v139,  (v135 ^ 0x6231F572) - 1077561351 - v150 - ((2 * ((v135 ^ 0x6231F572) - 1077561351 - v150)) & 0xC7F787DC),  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53);
}

void sub_1001D3278()
{
}

uint64_t sub_1001D329C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LOBYTE(STACK[0x368]) = LOBYTE(STACK[0x3C8]) ^ LOBYTE(STACK[0x390]) ^ *(_BYTE *)((LODWORD(STACK[0x11F0]) ^ 0x3BFD6BFF9609AC98LL)
                                                                                + a13
                                                                                + ((2LL
                                                                                  * (LODWORD(STACK[0x11F0]) ^ 0x9D71F67u)) & 0x13FBD67FELL)
                                                                                - 0x7F7624CBE8229921LL) ^ *(_BYTE *)((LODWORD(STACK[0x1E10]) ^ 0x7FFD7E77D620CDFBLL) + a13 + ((2LL * (LODWORD(STACK[0x1E10]) ^ 0x9D71F67u)) & 0x1BFEFA538LL) + 0x3C89C8BBD7C44842LL) ^ 0x90;
  LOBYTE(STACK[0x531]) = *(_BYTE *)((LODWORD(STACK[0x1374]) ^ 0x4EABEFAFD429E019LL)
                                  + a13
                                  + ((2LL * (LODWORD(STACK[0x1374]) ^ 0x9D71F67u)) & 0x1BBFDFEFCLL)
                                  + 0x6DDB5783D9BD1B60LL) ^ LOBYTE(STACK[0x559]) ^ LOBYTE(STACK[0x591]) ^ *(_BYTE *)((LODWORD(STACK[0xA24]) ^ 0xFFC97D9E3F74B09DLL) + ((2 * (LODWORD(STACK[0xA24]) ^ 0x9D71F67)) & 0x6D475FF4) + a13 - 0x4342366A7EE7951CLL) ^ 0x90;
  LOBYTE(STACK[0x6FA]) = LOBYTE(STACK[0x75A]) ^ LOBYTE(STACK[0x722]) ^ *(_BYTE *)((LODWORD(STACK[0x14F8]) ^ 0xE2BBAEBDE48A79B0LL)
                                                                                + a13
                                                                                + ((2LL
                                                                                  * (LODWORD(STACK[0x14F8]) ^ 0x9D71F67u)) & 0x1DABACDAELL)
                                                                                - 0x2634678A35A14BF9LL) ^ *(_BYTE *)((LODWORD(STACK[0xBA8]) ^ 0x78FF8675F62CC088LL) + a13 + ((2LL * (LODWORD(STACK[0xBA8]) ^ 0x9D71F67u)) & 0x1FFF7BFDELL) + 0x4387C0BDB7C03AEFLL) ^ 0x90;
  LOBYTE(STACK[0x8C3]) = a73 ^ *(_BYTE *)((LODWORD(STACK[0xD2C]) ^ 0xFBBCEFB3766E82D8LL)
                                        + ((2 * (LODWORD(STACK[0xD2C]) ^ 0x9D71F67)) & 0xFF733B7E)
                                        + a13
                                        - 0x3F35A87FC7FD82E1LL) ^ *(_BYTE *)((LODWORD(STACK[0x167C]) ^ 0x7D7C7FBB52B2C0D8LL)
                                                                           + ((2 * (LODWORD(STACK[0x167C]) ^ 0x9D71F67)) & 0xB6CBBF7E)
                                                                           + a13
                                                                           + 0x3F0AC7785C563B1FLL) ^ LOBYTE(STACK[0x21B]) ^ 0x90;
  LOBYTE(STACK[0x384]) = LOBYTE(STACK[0x3AC]) ^ LOBYTE(STACK[0x3E4]) ^ *(_BYTE *)((LODWORD(STACK[0xEB0]) ^ 0xBDD7E9BCC5E1A988LL)
                                                                                + a13
                                                                                + ((2LL
                                                                                  * (LODWORD(STACK[0xEB0]) ^ 0x9D71F67u)) & 0x1986D6DDELL)
                                                                                - 0x150A289147A9C11LL) ^ *(_BYTE *)((LODWORD(STACK[0x1800]) ^ 0x136F3FAFE42C2494LL) + a13 + ((2LL * (LODWORD(STACK[0x1800]) ^ 0x9D71F67u)) & 0x1DBF677E6LL) - 0x56E7F87C363F2115LL) ^ 0x90;
  LOBYTE(STACK[0x54D]) = LOBYTE(STACK[0x575]) ^ LOBYTE(STACK[0x5AD]) ^ *(_BYTE *)((LODWORD(STACK[0x1034]) ^ 0xB222B7E7F500C499LL)
                                                                                + a13
                                                                                + ((2LL
                                                                                  * (LODWORD(STACK[0x1034]) ^ 0x9D71F67u)) & 0x1F9AFB7FCLL)
                                                                                + 0xA648F4BBAE43EE0LL) ^ *(_BYTE *)((LODWORD(STACK[0x1984]) ^ 0x67F8D6B7F2007498LL) + a13 + ((2LL * (LODWORD(STACK[0x1984]) ^ 0x9D71F67u)) & 0x1F7AED7FELL) + 0x548E707BBBE4AEDFLL) ^ 0x90;
  LOBYTE(STACK[0x716]) = LOBYTE(STACK[0x776]) ^ *(_BYTE *)((LODWORD(STACK[0x1B08]) ^ 0x9BFFBDFEF621F990LL)
                                                         + a13
                                                         + ((2LL * (LODWORD(STACK[0x1B08]) ^ 0x9D71F67u)) & 0x1FFEDCDEELL)
                                                         + 0x20878934B7C533E7LL) ^ *(_BYTE *)((LODWORD(STACK[0x11B8]) ^ 0xBFEB97CBF679F1FALL)
                                                                                            + a13
                                                                                            + ((2LL
                                                                                              * (LODWORD(STACK[0x11B8]) ^ 0x9D71F67u)) & 0x1FF5DDD3ALL)
                                                                                            - 0x364509847F2D3BFLL) ^ LOBYTE(STACK[0x73E]) ^ 0x90;
  a70 = a74 ^ LOBYTE(STACK[0x237]) ^ *(_BYTE *)((LODWORD(STACK[0x1C8C]) ^ 0x7FBDCBE47528E49ALL)
                                              + ((2 * (LODWORD(STACK[0x1C8C]) ^ 0x9D71F67)) & 0xF9FFF7FA)
                                              + a13
                                              + 0x3CC97B4F3ABC1EE1LL) ^ *(_BYTE *)((LODWORD(STACK[0x133C]) ^ 0xCEFBF5FDB38960A4LL)
                                                                                 + a13
                                                                                 + ((2LL
                                                                                   * (LODWORD(STACK[0x133C]) ^ 0x9D71F67u)) & 0x174BCFF86LL)
                                                                                 - 0x1274AECA02A264E5LL) ^ 0x90;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x378]) = -112;
  LOBYTE(STACK[0x370]) = -112;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)*(&off_10025C670 + a54 - 498) - 8))( 3942694827LL,  2443359173LL,  1800LL);
}

uint64_t sub_1001D3A20( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v70 = (v66 - (((v66 << ((a4 + 1) & 0xDF ^ (v65 + 1))) - 1160334000) & 0x9428E85A) + 662687445) ^ 0x4A147495;
  int v71 = *(_DWORD *)(v68 + 4LL * ((((2722 * v70) & 0xFFFFB7E6) + ((1361 * v70) ^ 0xFFFFDBF3) + 2329734) % 0x12E0)) ^ 0x4F18A365;
  unsigned int v72 = v71 - ((2 * v71 + 1448545978) & 0x43712F16) - 1931206936;
  unsigned int v73 = v72 ^ (v72 >> 7) ^ (v72 >> 3) ^ 0xFC56347B;
  unsigned int v74 = (uint64_t (*)(void))(*(void *)(v67 + 8LL * ((2026 * (v66 + 1 != v69 + 256)) ^ a4)) - 8LL);
  *(&a65 + (457 * v66 + 1151682600) % 0x708u) = byte_100221B30[(((4424 * v73) & 0x7F1FD5D8)
                                                              + ((2212 * v73) ^ 0xBF8FEAED)
                                                              + 1082850215)
                                                             % 0x97F] ^ 0x37;
  return v74();
}

uint64_t sub_1001D3BC8(unsigned int a1, int a2, uint64_t a3)
{
  int v12 = v4 * v8;
  uint64_t v13 = v12 + 131803634 - ((((v12 + 131803634) * (unint64_t)a1) >> 32) >> 10) * a2;
  unsigned int v14 = ((((*(unsigned __int8 *)(a3 + v13) ^ 0x90) << (v5 + 35)) & 0x1F6) + (*(unsigned __int8 *)(a3 + v13) ^ 0x1F33B96B))
      * v8
      + 1286406957;
  int v15 = *(unsigned __int8 *)(a3 + v14 - (((v14 * (unint64_t)a1) >> 32) >> 10) * a2) ^ 0xDB;
  unsigned int v16 = (((2 * v15) & 0x14E) + (v15 ^ 0x7FF7FAA7)) * v6 + 1162753284;
  int v17 = *(unsigned __int8 *)(v10 + v16 - (((v16 * (unint64_t)v7) >> 32) >> 10) * v9);
  HIDWORD(v18) = v17 ^ 0x33;
  LODWORD(v18) = ~v17 << 24;
  int v19 = (v18 >> 31) - ((2 * (v18 >> 31)) & 4);
  char v20 = (v19 + 2) >> 2;
  v19 -= 126;
  char v21 = (v20 ^ 0x7F) + 2 * v20 - 127;
  char v22 = 2 * ((v21 & (v19 ^ 0x82)) - ((2 * (v21 & (v19 ^ 0x82))) & 0x6A));
  int v23 = v19 ^ (((((v21 + (v19 ^ 0x82)) ^ 0x1E)
                                + ((2 * (v21 + (v19 ^ 0x82))) & 0x3C)
                                + ((v22 - 22) ^ 0xE1)
                                + ((2 * (v22 - 22)) & 0xE8 ^ 0x3F)
                                - 40) >> 4) | 0xB0);
  unsigned int v24 = (((2 * v23) & 0x176) + (v23 ^ 0x567AFFFF)) * v6 - 1048783240;
  int v25 = *(unsigned __int8 *)(v10 + v24 - (((v24 * (unint64_t)v7) >> 32) >> 10) * v9);
  unsigned int v26 = (((2 * (v25 ^ 0x19)) & 0xFFFFFFBF) + (v25 ^ 0x57F7D7C6)) * v8 - 158329559;
  int v27 = *(unsigned __int8 *)(a3 + v26 - (((v26 * (unint64_t)a1) >> 32) >> 10) * a2);
  unsigned int v28 = (((2 * (v27 ^ 0xC3)) & 0xFFFFFFF7) + (v27 ^ 0x7FF5FF38)) * v6 + 1450242500;
  unsigned int v29 = *(unsigned __int8 *)(v10 + v28 - (((v28 * (unint64_t)v7) >> 32) >> 10) * v9) ^ 0xFFFFFFB3;
  int v30 = ((~(62 * v29) | 0x1F) - 97 * v29 - 15) ^ 0x1C;
  unsigned int v31 = (((2 * v30) & 0x13E) + (v30 ^ 0x5DF4BB9F)) * v6 + 697822417;
  unsigned int v32 = *(unsigned __int8 *)(v10 + v31 - (((v31 * (unint64_t)v7) >> 32) >> 10) * v9) ^ 0xFFFFFFB3;
  unsigned int v33 = 23 * v32 - ((46 * v32) & 0xFFFFFF88) + 68;
  LOBYTE(v33) = v33 ^ 0x1D ^ (((v33 >> 3) & 9 ^ 0xFA) - 32);
  unsigned int v34 = ((v33 ^ 0x6472EDFF) + 2 * v33) * v8 - 1361617143;
  int v35 = *(unsigned __int8 *)(a3 + v34 - (((v34 * (unint64_t)a1) >> 32) >> 10) * a2);
  unsigned int v36 = (((2 * (v35 ^ 0x80)) & 0xFFFFFFDF) + (v35 ^ 0x8CFEFF7F)) * v8 + 1288512153;
  *(_BYTE *)(a3
           + v12
           + 132363002
           - ((((v12 + 132363002) * (unint64_t)a1) >> 32) >> 10) * a2) = *(_BYTE *)(a3 + v36 - (((v36 * (unint64_t)a1) >> 32) >> 10) * a2);
  unsigned int v37 = (((2 * (*(unsigned __int8 *)(a3 + v13) ^ 0xFFFFFFF7)) & 0x130) + (*(unsigned __int8 *)(a3 + v13) ^ 0xEFE7FA08))
      * v8
      - 1159353624;
  int v38 = *(unsigned __int8 *)(a3 + v37 - (((v37 * (unint64_t)a1) >> 32) >> 10) * a2);
  unsigned int v39 = (((2 * (v38 ^ 8)) & 0x17A) + (v38 ^ 0x774DECB5)) * v6 + 581857004;
  int v40 = *(unsigned __int8 *)(v10 + v39 - (((v39 * (unint64_t)v7) >> 32) >> 10) * v9);
  HIDWORD(v18) = v40 ^ 0x33;
  LODWORD(v18) = ~v40 << 24;
  LODWORD(v13) = ((v18 >> 31) - ((2 * (v18 >> 31)) & 0xC8) + 100);
  unsigned int v41 = (((2
         * (((v18 >> 31) - ((2 * (v18 >> 31)) & 0xFFFFFFC8) + 100) ^ (v13 >> 6) ^ (v13 >> 4) ^ 0x99)) & 0x1B0)
       + ((((v18 >> 31) - ((2 * (v18 >> 31)) & 0xC8) + 100) ^ (v13 >> 6) ^ (v13 >> 4)) ^ 0xFAFD7F41))
      * v8
      - 243844696;
  int v42 = *(unsigned __int8 *)(a3 + v41 - (((v41 * (unint64_t)a1) >> 32) >> 10) * a2);
  unsigned int v43 = (((2 * (v42 ^ 1)) & 0x1CA) + (v42 ^ 0xFFCAD6E6)) * v6 - 879473288;
  unsigned int v44 = *(unsigned __int8 *)(v10 + v43 - (((v43 * (unint64_t)v7) >> 32) >> 10) * v9) ^ 0xFFFFFFB3;
  unsigned int v45 = 23 * v44 - ((46 * v44) & 0xFFFFFFD2) + 105;
  int v46 = v45 ^ 0x95 ^ ((v45 >> 3) & 9 | 0x94);
  unsigned int v47 = (((2 * v46) & 0xB6) + (v46 ^ 0x7FDE545B)) * v8 - 1138907955;
  int v48 = *(unsigned __int8 *)(a3 + v47 - (((v47 * (unint64_t)a1) >> 32) >> 10) * a2);
  unsigned int v49 = (((2 * (v48 ^ 0x90)) & 0xFFFFFFBF) + (v48 ^ 0xFCAFEF4F)) * v8 - 370094295;
  LODWORD(v13) = ((v4 + 1 - v5) | (v5 - (v4 + 1))) >> 31;
  *(_BYTE *)(a3
           + v12
           + 132041274
           - ((((v12 + 132041274) * (unint64_t)a1) >> 32) >> 10) * a2) = *(_BYTE *)(a3 + v49 - (((v49 * (unint64_t)a1) >> 32) >> 10) * a2);
  return v50();
}

uint64_t sub_1001D40F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  HIDWORD(a35) = v73 - 121888048;
  int v75 = *(unsigned __int8 *)((LODWORD(STACK[0x178C]) ^ 0xEFF4BB8BC778F539LL)
                           + a63
                           + (((v73 - 121888048) ^ 0x19D5FD512LL) & (2LL
                                                                                 * (LODWORD(STACK[0x178C]) ^ 0x9D71F67u)))
                           + 0x100B4474315015A2LL);
  int v76 = a68 ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0x1484]) ^ 0xBBDEF06CE749E4F2LL)
                                        + a63
                                        + ((2LL * (LODWORD(STACK[0x1484]) ^ 0x9D71F67u)) & 0x1DD3DF72ALL)
                                        + 0x44210F931161046BLL);
  int v77 = LOBYTE(STACK[0x39A]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0x1608]) ^ 0x5FBFFFFF7728F098LL)
                                                         + ((2 * (LODWORD(STACK[0x1608]) ^ 0x9D71F67)) & 0xFDFFDFFE)
                                                         + a63
                                                         - 0x5FBFFFFF7EFFEFFFLL);
  int v78 = *(unsigned __int8 *)((LODWORD(STACK[0x1300]) ^ 0xEBFFB9F7F728E820LL)
                           + a63
                           + ((2LL * (LODWORD(STACK[0x1300]) ^ 0x9D71F67u)) & 0x1FDFFEE8ELL)
                           + 0x14004608010008B9LL) ^ 0x5E;
  int v79 = ((((v75 ^ LOBYTE(STACK[0x563]) ^ 0xCE) - ((2 * (v75 ^ LOBYTE(STACK[0x563]) ^ 0xCE)) & 0xAE)) << 16) + 1985413120) ^ 0x76570000;
  unsigned int v80 = (((v77 - 2 * (v77 & 0xF)) << 8) - 1435824384) ^ 0xAA6B0F00;
  int v81 = (v80 + 874023148 - ((2 * v80) & 0x68311000)) ^ 0x341888EC | (v79 + 2000676118 - ((2 * v79) & 0x6E7E0000)) ^ 0x773FE516;
  unsigned int v82 = (v81 - 532754575 - ((2 * v81) & 0x407D9EE2)) ^ 0xE03ECF71 | (v76 + 1505620439 - ((2 * v76) & 0x1AE)) ^ 0x59BDF1D7;
  unsigned int v83 = (((v82 - ((2 * v82) & 0xFF736E)) << 8) - 4606208) ^ 0xFFB9B700;
  unsigned int v84 = (v83 - 759819967 - ((2 * v83) & 0xA56C2200)) ^ 0xD2B61141 | (v78 + 1851068524 - ((2 * v78) & 0xD8)) ^ 0x6E55106C;
  *(_DWORD *)(*a64 - 0x657CD3A60B28C15ALL) = ((LOBYTE(STACK[0x710]) ^ 0x90)
                                            - ((2 * (LOBYTE(STACK[0x710]) ^ 0x90)) & 0x34)
                                            - 588721638) ^ 0xF84FA52F ^ (v84 - ((2 * v84) & 0x5AE0D0A4) + 762341458);
  int v85 = LOBYTE(STACK[0x57F]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0x1D9C]) ^ 0x7FEFB7DF2E3AFCDBLL)
                                                         + ((2 * (LODWORD(STACK[0x1D9C]) ^ 0x9D71F67)) & 0x4FDBC778)
                                                         + a63
                                                         - 0x7FEFB7DF27EDE3BCLL);
  int v86 = *(unsigned __int8 *)((LODWORD(STACK[0x1C18]) ^ 0x3BFBBFB1F42B829ALL)
                           + a63
                           + ((2LL * (LODWORD(STACK[0x1C18]) ^ 0x9D71F67u)) & 0x1FBF93BFALL)
                           - 0x3BFBBFB1FDFC9DFDLL) ^ LOBYTE(STACK[0x3B6]) ^ 0xCE;
  int v87 = a73 ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0x1A94]) ^ 0x7FEDBF6EE023F35ALL)
                                        + a63
                                        + ((2LL * (LODWORD(STACK[0x1A94]) ^ 0x9D71F67u)) & 0x1D3E9D87ALL)
                                        - 0x7FEDBF6EE9F4EC3DLL);
  unsigned int v88 = (((v85 - ((2 * v85) & 0xFFFFFFC3)) << 16) + 1776353280) ^ 0x69E10000;
  unsigned int v89 = (((v86 + 16544069 - ((2 * v86) & 0x66666666)) << 8) - 4608) ^ 0xFC713300;
  int v90 = (v89 + 1190158289 - ((2 * v89) & 0xDE0BE00)) ^ 0x46F05FD1 | (v88 + 822310817 - ((2 * v88) & 0x62060000)) ^ 0x310377A1;
  int v91 = (v90 + 654819334 - ((2 * v90) & 0x4E0F800C)) ^ 0x2707C006 | (v87 + 435528172 - ((2 * v87) & 0x1D8)) ^ 0x19F5A1EC;
  int v92 = LOBYTE(STACK[0x72C]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0x1910]) ^ 0x77F76D69D46AE658LL)
                                                         + a63
                                                         + ((2LL * (LODWORD(STACK[0x1910]) ^ 0x9D71F67u)) & 0x1BB7BF27ELL)
                                                         - 0x77F76D69DDBDF93FLL);
  int v93 = (((v91 - ((2 * v91) & 0xE9C8E)) << 8) + 122570496) ^ 0x74E4700;
  int v94 = (v93 + 787100913 - ((2 * v93) & 0x5DD46800)) ^ 0x2EEA34F1 | (v92 + 1489033846 - ((2 * v92) & 0xEC)) ^ 0x58C0DA76;
  *(_DWORD *)(*a64 - 0x657CD3A60B28C14ALL) = v94 + 165093223 - ((2 * v94) & 0x13AE3ECE);
  int v95 = *(unsigned __int8 *)((LODWORD(STACK[0xCB8]) ^ 0xDFF697EAD618C58CLL)
                           + a63
                           + ((2LL * (LODWORD(STACK[0xCB8]) ^ 0x9D71F67u)) & 0x1BF9FB5D6LL)
                           + 0x2009681520302515LL);
  unsigned int v96 = ((2 * (v95 ^ 0x5C)) & 0xFFFFFFFB) + (v95 ^ 0xF30DEBA3);
  int v97 = *(unsigned __int8 *)((LODWORD(STACK[0x9B0]) ^ 0x7FF2F3FD622CC20FLL)
                           + ((2 * (LODWORD(STACK[0x9B0]) ^ 0x9D71F67)) & 0xD7F7BAD0)
                           + a63
                           - 0x7FF2F3FD6BFBDD68LL) ^ LOBYTE(STACK[0x748]) ^ 0xCE;
  int v98 = LOBYTE(STACK[0x59B]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0xE3C]) ^ 0xEFCBA9FBDC82A498LL)
                                                         + a63
                                                         + ((2LL * (LODWORD(STACK[0xE3C]) ^ 0x9D71F67u)) & 0x1AAAB77FELL)
                                                         + 0x103456042AAA4401LL);
  int v99 = (((v98 - ((2 * v98) & 0xA)) << 8) + 862520576) ^ 0x33690500;
  unsigned int v100 = ((LOBYTE(STACK[0x3D2]) ^ 0x90) - 703516164 - ((2 * (LOBYTE(STACK[0x3D2]) ^ 0x90)) & 0x1F8)) ^ 0xD61131FC;
  int v101 = (v99 + 2003722116 - ((2 * v99) & 0x6EDCBE00)) ^ 0x776E5F84 | v100;
  int v102 = (v101 ^ 0x6FEB2E) + v96 + ((2 * v101) & 0xDFD65C);
  int v103 = (((v100 & (v96 + 217191427)) - ((2 * (v100 & (v96 + 217191427))) & 0x27FA7C)) << 9) - 1476756480;
  int v104 = *(unsigned __int8 *)((LODWORD(STACK[0xB34]) ^ 0xCDD5BBF5F608F188LL)
                            + a63
                            + ((2LL * (LODWORD(STACK[0xB34]) ^ 0x9D71F67u)) & 0x1FFBFDDDELL)
                            + 0x322A440A00201111LL) ^ 0x5E;
  unsigned int v105 = ((v103 ^ 0x63F43C45)
        + ((2 * v103) & 0x77E37C00 ^ 0xB81F87FF)
        + (((v102 << 8) - 2111253248) ^ 0x6F7FF3F7)
        + ((2 * ((v102 << 8) - 2111253248)) & 0xDEFFE600)
        - 864957499) | (v104 + 1787715317 - ((2 * v104) & 0x1EA)) ^ 0x6A8E5EF5;
  unsigned int v106 = (((v105 + 1391703 - ((2 * v105) & 0x2A78AE)) ^ ((LOBYTE(STACK[0x209]) ^ 0x90)
                                                       - ((2 * (LOBYTE(STACK[0x209]) ^ 0x90)) & 0xFFFFFF8F)
                                                       + 3386311)) << 8) ^ 0x26979000;
  unsigned int v107 = (v106 - 741811193 - ((2 * v106) & 0xA791B800)) ^ 0xD3C8DC07 | (v97 - 928134120 - ((2 * v97) & 0x30)) ^ 0xC8ADCC18;
  *(_DWORD *)(*a64 - 0x657CD3A60B28C13ALL) = v107 + 165093223 - ((2 * v107) & 0x13AE3ECE);
  HIDWORD(v152) = (*(unsigned __int8 *)(v74 - 117) ^ 0xE6) - ((2 * (*(unsigned __int8 *)(v74 - 117) ^ 0xE6)) & 0x1D4);
  int v108 = *(unsigned __int8 *)((LODWORD(STACK[0x19FC]) ^ 0xFF3EBF7FA3C20B8LL)
                            + a63
                            + ((2LL * (LODWORD(STACK[0x19FC]) ^ 0x9D71F67u)) & 0x1E7D67FBELL)
                            - 0xFF3EBF7F3EB3FDFLL);
  HIDWORD(v156) = (*(unsigned __int8 *)(v74 - 120) ^ 0xE6)
                + 1160058212
                - ((2 * (*(unsigned __int8 *)(v74 - 120) ^ 0xE6)) & 0xC8);
  LODWORD(v152) = LOBYTE(STACK[0x79B]);
  HIDWORD(v151) = (*(unsigned __int8 *)(v74 - 119) ^ 0xE6)
                - 2040689701
                - ((2 * (*(unsigned __int8 *)(v74 - 119) ^ 0xE6)) & 0x1B6);
  int v109 = (LOBYTE(STACK[0x2CB]) ^ 0xCE ^ v108) - ((2 * (LOBYTE(STACK[0x2CB]) ^ 0xCE ^ v108)) & 0x1E8);
  LODWORD(v153) = 696;
  int v110 = (*(unsigned __int8 *)(v74 - 118) ^ 0xE6) - ((2 * (*(unsigned __int8 *)(v74 - 118) ^ 0xE6)) & 0x14E);
  int v111 = *(unsigned __int8 *)((LODWORD(STACK[0x1878]) ^ 0x77CC7FF7B42C7689LL)
                            + a63
                            + ((2LL * (LODWORD(STACK[0x1878]) ^ 0x9D71F67u)) & 0x17BF6D3DCLL)
                            - 0x77CC7FF7BDFB69EELL) ^ 0x5E;
  HIDWORD(v153) = v111 - ((2 * v111) & 0x11A);
  LODWORD(v151) = 44;
  unsigned int v112 = (((v109 << 8) - 1677790208) ^ 0x9BFEF400)
       + 2077768762
       - ((2 * (((v109 << 8) - 1677790208) ^ 0x9BFEF400)) & 0x77B07800);
  LODWORD(v156) = 147;
  unint64_t v155 = (LODWORD(STACK[0x194C]) ^ 0xFBEB775FFE266698LL)
       + a63
       + ((2LL * (LODWORD(STACK[0x194C]) ^ 0x9D71F67u)) & 0x1EFE2F3FELL);
  HIDWORD(a40) = 1490;
  unint64_t v154 = (LODWORD(STACK[0x1644]) ^ 0xEDFFDBDFF42DA0B8LL)
       + a63
       + ((2LL * (LODWORD(STACK[0x1644]) ^ 0x9D71F67u)) & 0x1FBF57FBELL);
  unsigned int v113 = (LOBYTE(STACK[0x80A]) ^ 0x90) - 179074851 - ((2 * (LOBYTE(STACK[0x80A]) ^ 0x90)) & 0xBBBBBBBB);
  unsigned int v114 = ((((v110 << 8) + 1343530752) ^ 0x5014A700)
        - 2060158596
        - ((2 * (((v110 << 8) + 1343530752) ^ 0x5014A700)) & 0xA68F200)) ^ 0x8534797C | ((((HIDWORD(v152) << 16)
                                                                                         + 501874688) ^ 0x1DEA0000)
                                                                                       + 190424240
                                                                                       - ((2
                                                                                         * (((HIDWORD(v152) << 16)
                                                                                           + 501874688) ^ 0x1DEA0000)) & 0x16B20000)) ^ 0xB59A4B0;
  unsigned int v115 = (v114 - 1867661272 - ((2 * v114) & 0x215B8050)) ^ 0x90ADC028 | HIDWORD(v151) ^ 0x865D8BDB;
  unint64_t v116 = (LODWORD(STACK[0x17C8]) ^ 0xFFEFFFDE7602E03DLL)
       + ((2 * (LODWORD(STACK[0x17C8]) ^ 0x9D71F67)) & 0xFFABFEB4)
       + a63;
  int v117 = (((v115 - ((2 * v115) & 0xA0821C)) << 8) + 1346440704) ^ 0x50410E00;
  unsigned int v118 = v117 + 1189952680 - ((2 * v117) & 0x8DDA7800);
  int v119 = v152 ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0xE0C]) ^ 0x277FAF7FF761B0B1LL)
                                          + a63
                                          + ((2LL * (LODWORD(STACK[0xE0C]) ^ 0x9D71F67u)) & 0x1FD6D5FACLL)
                                          - 0x277FAF7FFEB6AFD6LL);
  int v120 = v119 - ((2 * v119) & 0x18);
  unsigned int v121 = (v113 ^ 0xF55388DD | v112 ^ 0x7BD83C3A) - ((2 * (v113 ^ 0xF55388DD | v112 ^ 0x7BD83C3A)) & 0xFCC6);
  int v122 = LOBYTE(STACK[0x5D2]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0xC88]) ^ 0x7D5BFFFB7EE85298LL)
                                                          + ((2 * (LODWORD(STACK[0xC88]) ^ 0x9D71F67)) & 0xEE7E9BFE)
                                                          + a63
                                                          - 0x7D5BFFFB773F4DFFLL);
  int v123 = v122 - ((2 * v122) & 0x172);
  int v124 = *(unsigned __int8 *)((LODWORD(STACK[0x16F4]) ^ 0x5FFDFBCFF42AE41CLL)
                            + a63
                            + ((2LL * (LODWORD(STACK[0x16F4]) ^ 0x9D71F67u)) & 0x1FBFBF6F6LL)
                            - 0x5FFDFBCFFDFDFB7BLL);
  unsigned int v125 = (LOBYTE(STACK[0x641]) ^ 0xCE ^ v124) + 16125893 - ((2 * (LOBYTE(STACK[0x641]) ^ 0xCE ^ v124)) & 0xFFFFFF7F);
  int v126 = LOBYTE(STACK[0x478]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0x1570]) ^ 0x97C77FFD5608DC9ALL)
                                                          + ((2 * (LODWORD(STACK[0x1570]) ^ 0x9D71F67)) & 0xBFBF87FA)
                                                          + a63
                                                          + 0x68388002A0203C03LL);
  int v127 = LOBYTE(STACK[0x409]) ^ 0xCE ^ *(unsigned __int8 *)((LODWORD(STACK[0xB04]) ^ 0xFF7FFB7D92460099LL)
                                                          + a63
                                                          + ((2LL * (LODWORD(STACK[0xB04]) ^ 0x9D71F67u)) & 0x137223FFCLL)
                                                          + 0x800482646EE002LL);
  unsigned int v128 = ((((v123 << 8) + 603437312) ^ 0x23F7B900)
        + 1585051960
        - ((2 * (((v123 << 8) + 603437312) ^ 0x23F7B900)) & 0x3CF3F200)) ^ 0x5E79F938 | ((((v120 << 16) - 972292096) ^ 0xC60C0000)
                                                                                       - 1987809124
                                                                                       - ((2
                                                                                         * (((v120 << 16) - 972292096) ^ 0xC60C0000)) & 0x13080000)) ^ 0x8984709C;
  int v129 = *(unsigned __int8 *)((LODWORD(STACK[0x980]) ^ 0xEFF3F2DBF61A32F9LL)
                            + a63
                            + ((2LL * (LODWORD(STACK[0x980]) ^ 0x9D71F67u)) & 0x1FF9A5B3CLL)
                            + 0x100C0D240032D262LL) ^ LOBYTE(STACK[0x240]) ^ 0xCE;
  int v130 = (((v121 + 65123) ^ (HIDWORD(v153) + 59021)) << 16) ^ 0x18EE0000;
  unsigned int v131 = (v130 - 1380249918 - ((2 * v130) & 0x5B760000)) ^ 0xADBB0EC2 | ((((v125 << 8) - 1536) ^ 0xF60FBF00)
                                                                       + 1926292350
                                                                       - ((2 * (((v125 << 8) - 1536) ^ 0xF60FBF00)) & 0x65A1C600)) ^ 0x72D0E37E;
  unsigned int v132 = (v128 - 110980561 - ((2 * v128) & 0x72C5245E)) ^ 0xF962922F | (v127 - 1025097227 - ((2 * v127) & 0x1EA)) ^ 0xC2E641F5;
  int v133 = (((v132 - ((2 * v132) & 0x62C3C8)) << 8) + 828498944) ^ 0x3161E400;
  unsigned int v134 = (v131 - 857479076 - ((2 * v131) & 0x99C7D0B8)) ^ 0xCCE3E85C | (v126 - 1834125956 - ((2 * v126) & 0xF8)) ^ 0x92AD757C;
  unsigned int v135 = LODWORD(STACK[0xAF0]) ^ ((v118 ^ 0x46ED3CA8 | HIDWORD(v156) ^ 0x45251564)
                                - ((2 * (v118 ^ 0x46ED3CA8 | HIDWORD(v156) ^ 0x45251564)) & 0x9C688D06)
                                + 1312048771) ^ (v129 - ((2 * v129) & 0x164) + 207201714);
  int v136 = *(unsigned __int8 *)(v155 + 0x41488A0080E8601LL);
  int v137 = LOBYTE(STACK[0x5C9]);
  int v138 = *(unsigned __int8 *)(v154 + 0x1200242002054021LL);
  int v139 = *(unsigned __int8 *)(v116 + 0x100021802A00A6LL);
  int v140 = LOBYTE(STACK[0x792]);
  uint64_t v141 = LOBYTE(STACK[0x253]);
  int v142 = LOBYTE(STACK[0x400]);
  int v143 = *(unsigned __int8 *)((LODWORD(STACK[0x14C0]) ^ 0xF3AAADEFB6ACE0B0LL)
                            + a63
                            + ((2LL * (LODWORD(STACK[0x14C0]) ^ 0x9D71F67u)) & 0x17EF7FFAELL)
                            + 0xC55521040840029LL);
  *(_DWORD *)(*a64 - 0x657CD3A60B29129ALL) = v135 ^ (v133 - ((2 * v133) & 0x7AFF7000) - 1115703256) ^ 0xE6678966 ^ (v134 - ((2 * v134) & 0x32EBA4FE) + 427151999);
  int v144 = (v139 ^ v140 ^ 0xCE) - ((2 * (v139 ^ v140 ^ 0xCE)) & 0x34);
  unsigned int v145 = ((((v136 ^ v141 ^ 0xCE) - ((2 * (v136 ^ v141 ^ 0xCE)) & 0x8E)) << 16) - 1505296384) ^ 0xA6470000;
  unsigned int v146 = (v145 + 1665114619 - ((2 * v145) & 0x467E0000)) ^ 0x633FA1FB | ((((v144 << 8) - 392291840) ^ 0xE89E1A00)
                                                                       + 235896174
                                                                       - ((2 * (((v144 << 8) - 392291840) ^ 0xE89E1A00)) & 0x1C1EFA00)) ^ 0xE0F7D6E;
  unsigned int v147 = (v146 + 1953470971 - ((2 * v146) & 0x68DF33F6)) ^ 0x746F99FB | ((v137 ^ 0xCE ^ v138)
                                                                       - 1919966639
                                                                       - ((2 * (v137 ^ 0xCE ^ v138)) & 0xA2)) ^ 0x8D8FA251;
  unsigned int v148 = (((v147 - ((2 * v147) & 0xB403AC)) << 8) - 637413888) ^ 0xDA01D600;
  unsigned int v149 = (v148 + 766431794 - ((2 * v148) & 0x5B5DA400)) ^ 0x2DAED232 | ((v142 ^ 0xCE ^ v143)
                                                                      - 2037649827
                                                                      - ((2 * (v142 ^ 0xCE ^ v143)) & 0xBA)) ^ 0x868BEE5D;
  *(_DWORD *)(*a64 - 0x657CD3A60B28C1CALL) = v149 + 165093223 - ((2 * v149) & 0x13AE3ECE);
  return ((uint64_t (*)(uint64_t, uint64_t, void *, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_10025C670 + SHIDWORD(a35)) - 4))( v141,  605235757LL,  a64,  v116,  1602219577LL,  136LL,  3269870069LL,  &STACK[0x8D0],  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  v151,  v152,  v153,  v154,  a40,  v155,  v156,  0x24000000409LL,  1602219577LL,  0x3840D60C411B0CE2LL,  0x30E131271DC0394ELL);
}

void sub_1001D5850()
{
}

uint64_t sub_1001D5858( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,int a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v66 = (((v65 - 1745114362) >> 1) & 0x4B5DBB76) + (((v65 - 1745114362) >> 2) ^ 0x65AEDDBB);
  uint64_t v91 = v66 < 0x65AEC987;
  uint64_t v67 = &STACK[0x8D0];
  HIDWORD(a43) = (457 * v65 + 1347280169) % 0x708u;
  unsigned int v68 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 1772275838) % 0x55Cu);
  uint64_t v69 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 1772275547) % 0x55Cu) ^ 0x9D71F67u;
  uint64_t v70 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 1772275741) % 0x55Cu) ^ 0x9D71F67u;
  unsigned int v71 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 1772252364) % 0x55Cu);
  int v72 = *(unsigned __int8 *)((*((unsigned int *)v67 + (97 * v65 - 1772252267) % 0x55Cu) ^ 0x6BFFBFEFF77CC5D8LL)
                           + a63
                           + ((2LL * (*((_DWORD *)v67 + (97 * v65 - 1772252267) % 0x55Cu) ^ 0x9D71F67u)) & 0x1FD57B57ELL)
                           - 0x6BFFBFEFFEABDABFLL);
  uint64_t v73 = *(unsigned __int8 *)((v71 ^ 0x5F79AEF776B87019LL)
                           + ((2 * (v71 ^ 0x9D71F67)) & 0xFEDEDEFC)
                           + a63
                           - 0x5F79AEF77F6F6F7ELL);
  int v74 = *(&a65 + (457 * v65 + 1347169575) % 0x708u) ^ 0xCE ^ *(unsigned __int8 *)((v70 ^ 0xF4ED7CFCA38EF7FBLL)
                                                                                                 + a63
                                                                                                 + ((2 * v70) & 0x1471DEFF6LL)
                                                                                                 + 0xB1283035C710805LL);
  int v75 = *(unsigned __int8 *)((v69 ^ 0x6DFFF6DBFD8DFF37LL) + a63 + ((2 * v69) & 0x1FB1BFE6ELL) - 0x6DFFF6DBFD8DFF37LL) ^ *(&a65 + (457 * v65 + 1347170489) % 0x708u) ^ 0xCE;
  uint64_t v76 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 1772252461) % 0x55Cu) ^ 0x9D71F67u;
  LODWORD(v69) = *(&a65 + (457 * v65 + 1347169034 + a53 - 3) % 0x708u) ^ 0xCE ^ *(unsigned __int8 *)((*((unsigned int *)v67 + (97 * v65 - 1772275644) % 0x55Cu) ^ 0xDFFFF779562CE480LL) + ((2 * (*((_DWORD *)v67 + (97 * v65 - 1772275644) % 0x55Cu) ^ 0x9D71F67)) & 0xBFF7F7CE) + a63 + 0x20000886A0040419LL);
  int v77 = *(unsigned __int8 *)((v76 ^ 0x1ABFFE1DED37EFF9LL) + a63 + ((2 * v76) & 0x1DA6FDFF2LL) - 0x1ABFFE1DED37EFF9LL);
  int v78 = *(unsigned __int8 *)((*((unsigned int *)v67 + (97 * v65 - 1772252558) % 0x55Cu) ^ 0x7EE7FBCABF6CEEB1LL)
                           + a63
                           + ((2LL * (*((_DWORD *)v67 + (97 * v65 - 1772252558) % 0x55Cu) ^ 0x9D71F67u)) & 0x16D77E3ACLL)
                           - 0x7EE7FBCAB6BBF1D6LL);
  int v79 = *(&a65 + (457 * v65 + 1347169118) % 0x708u) ^ 0xCE ^ *(unsigned __int8 *)((v68 ^ 0x7EFF77ED3688E890LL)
                                                                                                 + ((2 * (v68 ^ 0x9D71F67)) & 0x7EBFEFEE)
                                                                                                 + a63
                                                                                                 - 0x7EFF77ED3F5FF7F7LL);
  unsigned int v80 = (((v75 - ((2 * v75) & 0x1F8)) << 16) - 470024192) ^ 0xE3FC0000;
  LODWORD(v69) = ((((_DWORD)v69 - ((2 * (_DWORD)v69) & 0x1E4)) << 8) + 655094272) ^ 0x270BF200;
  LODWORD(v69) = (v69 + 1989021589 - ((2 * v69) & 0x6D1C1E00)) ^ 0x768E0F95 | (v80
                                                                             + 1784177551
                                                                             - ((2 * v80) & 0x54B00000)) ^ 0x6A58638F;
  LODWORD(v69) = (v69 - 1537722967 - ((2 * v69) & 0x48B06B52)) ^ 0xA45835A9 | (v74 - 1761547369 - ((2 * v74) & 0x12E)) ^ 0x9700EB97;
  LODWORD(v69) = ((((_DWORD)v69 + 11666170 - ((2 * (_DWORD)v69) & 0x641E8C)) << 8) + 805888) ^ 0xB20F4600;
  int v81 = (v69 - 2039183446 - ((2 * v69) & 0xCE90E00)) ^ 0x867487AA | (v79 - 1849415857 - ((2 * v79) & 0x9E)) ^ 0x91C4274F;
  int v82 = *(&a65 + HIDWORD(a43));
  int v83 = *(&a65 + (457 * v65 + 1347278798) % 0x708u);
  LODWORD(v76) = *(&a65 + (457 * v65 + 1347279255) % 0x708u);
  LODWORD(v70) = *(&a65 + (457 * v65 + 1347279712) % 0x708u);
  *(_DWORD *)(((4LL * (v66 - 539236737)) | ((unint64_t)(v66 - 539236737 < 0x458AC43A) << 34))
            + *a64
            - 0x657CD3A721542382LL) = *((_DWORD *)&STACK[0x8D0] + (97 * (v66 - 539236737) - 1502869754) % 0x55C) ^ 0xAE64D26D ^ (v81 - 1369124243 - ((2 * v81) & 0x5CC9A4DA));
  unsigned int v84 = (v72 ^ v82 ^ 0xCE) - ((2 * (v72 ^ v82 ^ 0xCE)) & 0xFFFFFF1F);
  uint64_t v85 = v78 ^ v83 ^ 0xCEu;
  int v86 = ((((v84 << 8) - 278425856) ^ 0xEF678F00)
       + 236993262
       - ((2 * (((v84 << 8) - 278425856) ^ 0xEF678F00)) & 0x1C407400)) ^ 0xE203AEE | ((v73 ^ 0x5E)
                                                                                    + 1999253365
                                                                                    - ((2 * (v73 ^ 0x5E)) & 0xEA)) ^ 0x772A2F75;
  unsigned int v87 = ((((v70 ^ 0x90) - ((2 * (v70 ^ 0x90)) & 0x1CC) + 57830) ^ (v86
                                                                                             - ((2 * v86) & 0x9D0C)
                                                                                             + 20102)) << 16) ^ 0xAF600000;
  int v88 = (v87 - 134878521 - ((2 * v87) & 0xEFEA0000)) ^ 0xF7F5EAC7 | (v69 + 1085159065 - ((2 * v69) & 0x15C6C00)) ^ 0x40AE3699;
  int v89 = (v88 - 1539220096 - ((2 * v88) & 0x4882BB00)) ^ 0xA4415D80 | (v85 + 340687602 - ((2 * v85) & 0x1E4)) ^ 0x144E7AF2;
  *(_DWORD *)(((4LL * v66) | (v91 << 34)) + *a64 - 0x657CD3A7A1E438B6LL) = v89 + 165093223 - ((2 * v89) & 0x13AE3ECE);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_10025C670 + ((1199 * ((v65 - 1745114358) < 0x20)) ^ a53)))( v85,  3205573259LL,  4160088775LL,  1085159065LL,  1855863530LL,  340687602LL,  1372LL,  v73,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  v91,  a45);
}

uint64_t sub_1001D6040( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  HIDWORD(v72) = a5 + 18;
  LODWORD(v72) = a5 - 1855862542;
  int v73 = (v72 >> 5) - ((2 * (v72 >> 5)) & 0xE9A72B5A) - 53242451;
  HIDWORD(v72) = v73 ^ 0x15AD;
  LODWORD(v72) = v73 ^ 0xFCD38000;
  int v74 = (v72 >> 13) - ((2 * (v72 >> 13)) & 0xFEBAC352) + 2136826281;
  HIDWORD(v72) = v74 ^ 0x21A9;
  LODWORD(v72) = v74 ^ 0x7F5D4000;
  int v75 = ((v72 >> 14) - 720950662 - ((2 * (v72 >> 14)) & 0xAA0E54F4)) ^ 0xD5072A7A;
  uint64_t v76 = (((a5 - 1855863498) >> 2) + 1186130401 - (((a5 - 1855863498) >> 1) & 0xD65D3C2)) ^ 0x46B2E9E1;
  unsigned int v77 = ((194 * v76) & 0x683F7B56) + ((97 * v76) ^ 0xB41FBDAB) + 1273013077;
  unsigned int v78 = v77 - (((v77 * (unint64_t)a2) >> 32) >> 10) * a7;
  unsigned int v79 = ((194 * v75) & 0xF1FFF6E6) + ((97 * v75) ^ 0x78FFFB73) - 2030041971;
  uint64_t v80 = *(_DWORD *)(v68 + 4LL * (v79 - (((v79 * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0x9D71F67u;
  int v81 = *(unsigned __int8 *)(v67 + 457 * a5 - 2020544407 - (457 * a5 - 2020544407) / 0x708u * v66) ^ v69 ^ *(unsigned __int8 *)((*(unsigned int *)(v68 + 4LL * (97 * a5 + 369960149 - ((((97 * a5 + 369960149) * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0xDB77B5F27328E063LL) + ((2 * (*(_DWORD *)(v68 + 4LL * (97 * a5 + 369960149 - ((((97 * a5 + 369960149) * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0x9D71F67)) & 0xF5FFFE08) + v71 + 0x24884A0D850000FCLL);
  LODWORD(v80) = *(unsigned __int8 *)((v80 ^ 0xF7EF76CF6B9EF7F6LL)
                                    + ((2 * (_DWORD)v80) & 0xD73DEFEC)
                                    + v71
                                    + 0x81089309461080ALL) ^ v64;
  int v82 = *(unsigned __int8 *)(v67 + 457 * a5 - 2020545778 - (457 * a5 - 2020545778) / 0x708u * v66) ^ v65;
  int v83 = *(unsigned __int8 *)(v67 + 457 * a5 - 2020544864 - (457 * a5 - 2020544864) / 0x708u * v66) ^ v69 ^ *(unsigned __int8 *)((*(unsigned int *)(v68 + 4LL * (97 * a5 + 369960052 - ((((97 * a5 + 369960052) * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0x8EA99AF7F240F5D0LL) + v71 + ((2LL * (*(_DWORD *)(v68 + 4LL * (97 * a5 + 369960052 - ((((97 * a5 + 369960052) * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0x9D71F67u)) & 0x1F72FD56ELL) + 0x7156650804681549LL);
  unsigned int v84 = (((v81 - ((2 * v81) & 0xA8)) << 16) - 1839988736) ^ 0x92540000;
  unsigned int v85 = (((v83 - ((2 * v83) & 0x46)) << 8) - 263838976) ^ 0xF0462300;
  unsigned int v86 = (v85 + 2046856840 - ((2 * v85) & 0x74011C00)) ^ 0x7A008E88 | (v84 - 514200051 - ((2 * v84) & 0x42B20000)) ^ 0xE159EE0D;
  int v87 = *(unsigned __int8 *)(v67 + 457 * a5 - 2020545321 - (457 * a5 - 2020545321) / 0x708u * v66) ^ v69 ^ *(unsigned __int8 *)((*(unsigned int *)(v68 + 4LL * (97 * a5 + 369959955 - ((((97 * a5 + 369959955) * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0xFFFF6F9FF66AE088LL) + v71 + ((2LL * (*(_DWORD *)(v68 + 4LL * (97 * a5 + 369959955 - ((((97 * a5 + 369959955) * (unint64_t)a2) >> 32) >> 10) * a7)) ^ 0x9D71F67u)) & 0x1FF7BFFDELL) + 0x906000420011LL);
  unsigned int v88 = (v86 - 1023331043 - ((2 * v86) & 0x6026A3A)) ^ 0xC301351D | (v87 + 1805215296 - ((2 * (_BYTE)v87) & 0x80)) ^ 0x6B996640;
  int v89 = (((v88 - ((2 * v88) & 0x762A86)) << 8) + 991249152) ^ 0x3B154300;
  unsigned int v90 = (v89 - 1020305220 - ((2 * v89) & 0x865EC000)) ^ 0xC32F60BC | (v82 - 1286101776 - ((2 * v82) & 0x1E0)) ^ 0xB357A4F0;
  *(_DWORD *)(*a64
            + 4
            * (((((a5 - 1855863498) >> 2)
               + 1186130401
               - (((a5 - 1855863498) >> 1) & 0xD65D3C2)) ^ 0x3A1DFAFEFB0DBE1ELL)
             + ((2 * v76) & 0x17B7EAFFELL))
            - 0x4DF4BFA102267296LL) = (v80 - ((2 * v80) & 0x1AE) + 1273287639) ^ *(_DWORD *)(v68 + 4LL * v78) ^ 0xE4C59131 ^ (v90 - ((2 * v90) & 0x5E4285CC) - 1356774682);
  return (*(uint64_t (**)(void))(v70 + 8LL * ((15 * ((a5 - 1855863494) < 0x60)) ^ a54)))();
}

uint64_t sub_1001D6540( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v66 = 97 * v65;
  LODWORD(a44) = (a54 + 32) | 0x90;
  int v67 = (a44 - 717) * v65;
  unsigned int v68 = v67 + 1750564217;
  unsigned int v69 = (((v65 - 2120158951) >> 1) & 0x67FFF7FC) + (((v65 - 2120158951) >> 2) ^ 0x33FFFBFE);
  uint64_t v70 = &STACK[0x8D0];
  HIDWORD(v105) = (v67 + 1750565588) % 0x708u;
  unsigned int v71 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 + 503121765) % 0x55Cu);
  unsigned int v72 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 + 503104790) % 0x55Cu);
  LODWORD(v105) = (v67 + 1750565131) % 0x708u;
  unsigned int v73 = v67 + 1750483785;
  uint64_t v74 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 + 503122056) % 0x55Cu) ^ 0x9D71F67u;
  unsigned int v75 = (v67 + 1750484242) % 0x708u;
  unsigned int v76 = (v67 + 1750564674) % 0x708u;
  uint64_t v77 = *(unsigned __int8 *)((v71 ^ 0xDAFFF72DF608E09DLL)
                           + a63
                           + ((2LL * (v71 ^ 0x9D71F67)) & 0x1FFBFFFF4LL)
                           + 0x250008D200200006LL);
  int v78 = *(unsigned __int8 *)((v74 ^ 0x7F3FBA6EF7F7BDB7LL) + a63 + ((2 * v74) & 0x1EFEF7B6ELL) - 0x7F3FBA6EF7F7BDB7LL);
  unsigned int v79 = (v73 + 914) % 0x708;
  uint64_t v80 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 + 503121959) % 0x55Cu) ^ 0x9D71F67u;
  unsigned int v81 = v73 % 0x708;
  LODWORD(v74) = (v73 + 1371) % 0x708;
  uint64_t v82 = *(unsigned __int8 *)((v80 ^ 0x67FEE5FFECBFFFFALL) + a63 + ((2 * v80) & 0x1D97FFFF4LL) - 0x67FEE5FFECBFFFFALL);
  uint64_t v83 = *(unsigned __int8 *)((*((unsigned int *)v70 + (97 * v65 + 503121862) % 0x55Cu) ^ 0x89FDD9AFB524F4D7LL)
                           + a63
                           + ((2LL * (*((_DWORD *)v70 + (97 * v65 + 503121862) % 0x55Cu) ^ 0x9D71F67u)) & 0x179E7D760LL)
                           + 0x76022650430C1450LL);
  int v84 = *(unsigned __int8 *)((*((unsigned int *)v70 + (v66 + 503104887) % 0x55Cu) ^ 0xEBFF25D7F22A54CCLL)
                           + a63
                           + ((2LL * (*((_DWORD *)v70 + (v66 + 503104887) % 0x55Cu) ^ 0x9D71F67u)) & 0x1F7FA9756LL)
                           + 0x1400DA280402B455LL) ^ *(&a65 + v79) ^ 0xCE;
  LODWORD(v74) = *(unsigned __int8 *)((*((unsigned int *)v70 + (v66 + 503104984) % 0x55Cu) ^ 0xF9FFDFBDB268E19ALL)
                                    + a63
                                    + ((2LL * (*((_DWORD *)v70 + (v66 + 503104984) % 0x55Cu) ^ 0x9D71F67u)) & 0x1777FFDFALL)
                                    + 0x600204244400103LL) ^ *(&a65 + v74) ^ 0xCE;
  int v85 = *(&a65 + v75) ^ 0xCE ^ *(unsigned __int8 *)((v72 ^ 0xBDA69CA7E788C9B8LL)
                                                                   + a63
                                                                   + ((2LL * (v72 ^ 0x9D71F67)) & 0x1DCBFADBELL)
                                                                   + 0x4259635811A02921LL);
  LODWORD(v74) = ((((_DWORD)v74 - ((2 * (_DWORD)v74) & 0x166)) << 16) + 1941110784) ^ 0x73B30000;
  unsigned int v86 = (((v84 - ((2 * v84) & 0x16C)) << 8) - 1475758592) ^ 0xA809B600;
  int v87 = (v86 + 1449350188 - ((2 * v86) & 0x2CC6A800)) ^ 0x5663542C;
  LODWORD(v74) = (v74 - 1668539182 - ((2 * v74) & 0x39180000)) ^ 0x9C8C1CD2 | v87;
  int v88 = v87 | (v85 + 1767369325 - ((2 * v85) & 0xDA)) ^ 0x6957EA6D;
  HIDWORD(v89) = (v88 - ((2 * v88) & 0x6C6) + 867) ^ 0x363;
  LODWORD(v89) = (v74 - 56225792 - ((2 * v74) & 0x794C2190) + 200) ^ 0xFCA61000;
  int v90 = *(&a65 + v81) ^ 0xCE ^ *(unsigned __int8 *)((*((unsigned int *)v70 + (v66 + 503104693) % 0x55Cu) ^ 0xD933ED7FB72172A2LL)
                                                                   + a63
                                                                   + ((2LL
                                                                     * (*((_DWORD *)v70 + (v66 + 503104693) % 0x55Cu) ^ 0x9D71F67u)) & 0x17DECDB8ALL)
                                                                   + 0x26CC12804109923BLL);
  int v91 = (v89 >> 12) - ((2 * (v89 >> 12)) & 0x9F5425F0) - 810937608;
  HIDWORD(v89) = v91 ^ 0xA12F8;
  LODWORD(v89) = v91 ^ 0xCFA00000;
  unsigned int v92 = ((((v89 >> 20) - ((2 * (v89 >> 20)) & 0xB9F750)) << 8) - 587487232) ^ 0xDCFBA800;
  unsigned int v93 = (v92 + 1555789717 - ((2 * v92) & 0xB976EE00)) ^ 0x5CBB7795 | (v90 + 1068812227 - ((2 * v90) & 0xFFFFFF87)) ^ 0x3FB4C7C3;
  int v94 = *(&a65 + HIDWORD(v105));
  int v95 = *(&a65 + v105);
  int v96 = *(&a65 + v68 % 0x708);
  int v97 = *(&a65 + v76);
  *(_DWORD *)(((4LL * (v69 - 810226054)) | ((unint64_t)(v69 - 810226054 < 0x3B4EA78) << 34))
            + *a64
            - 0x657CD3A619FCBC7ALL) = *((_DWORD *)&STACK[0x8D0] + (97 * (v69 - 810226054) - 1737258616) % 0x55C) ^ 0x52FB4000 ^ (v93 + 1392197632 - ((2 * v93) & 0xA5F68000));
  int v98 = (v94 ^ 0xCE ^ v78) - ((2 * (v94 ^ 0xCE ^ v78)) & 0xCE);
  int v100 = (v99 + 1371409745 - ((2 * v99) & 0xC1A00)) ^ 0x51BE0D51 | ((((v98 << 16) + 526843904) ^ 0x1F670000)
                                                                  + 1456984333
                                                                  - ((2 * (((v98 << 16) + 526843904) ^ 0x1F670000)) & 0x2DAE0000)) ^ 0x56D7D10D;
  unsigned int v101 = (v100 - 1146011200 - ((2 * v100) & 0x77628380)) ^ 0xBBB141C0 | ((v97 ^ 0x90)
                                                                       + 745160171
                                                                       - ((2 * (v97 ^ 0x90)) & 0x1D6)) ^ 0x2C6A3DEB;
  unsigned int v102 = (((v101 - ((2 * v101) & 0xA29FF8) + 13717500) ^ ((v83 ^ 0x5E)
  int v103 = (v102 + 982266522 - ((2 * v102) & 0x75186400)) ^ 0x3A8C329A | ((v77 ^ v96 ^ 0xCE)
                                                                      - 1296181308
                                                                      - ((2 * (v77 ^ v96 ^ 0xCE)) & 0x188)) ^ 0xB2BDD7C4;
  *(_DWORD *)(((4LL * v69) | ((unint64_t)(v69 < 0x33FFE7DA) << 34)) + *a64 - 0x657CD3A6DB28B202LL) = v103 + 165093223 - ((2 * v103) & 0x13AE3ECE);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_10025C670 + ((1913 * ((v65 - 2120158947) > 0xAF)) ^ a54)))( 1371409745LL,  1800LL,  1456984333LL,  v82,  v77,  a64,  &STACK[0x8D0],  v83,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  v105,  a44,  a45);
}

uint64_t sub_1001D6D98( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v73 = (((v64 - 1197237198) >> 1) & 0x36BBF11E) + (((v64 - 1197237198) >> 2) ^ 0xDB5DF88F);
  int v74 = *(unsigned __int8 *)(v68
                           + 457 * v64
                           - 1676036484
                           - ((((457 * v64 - 1676036484) * (unint64_t)v70) >> 32) >> 10)
                           * a2) ^ v69 ^ *(unsigned __int8 *)((*(unsigned int *)(a7
                                                                               + 4LL
                                                                               * (97 * v64
                                                                                - 167798288
                                                                                - ((((97 * v64 - 167798288)
                                                                                                 * (unint64_t)v66) >> 32) >> 10)
                                                                                * v67)) ^ 0xFBFFF7B0362840D0LL)
                                                            + ((2
                                                              * (*(_DWORD *)(a7
                                                                           + 4LL
                                                                           * (97 * v64
                                                                            - 167798288
                                                                            - ((((97 * v64 - 167798288)
                                                                                             * (unint64_t)v66) >> 32) >> 10)
                                                                            * v67)) ^ 0x9D71F67)) & 0x7FFEBF6E)
                                                            + v65
                                                            + 0x400084FC000A049LL);
  int v75 = *(unsigned __int8 *)(v68
                           + 457 * v64
                           - 1676036027
                           - ((((457 * v64 - 1676036027) * (unint64_t)v70) >> 32) >> 10)
                           * a2) ^ v69 ^ *(unsigned __int8 *)((*(unsigned int *)(a7
                                                                               + 4LL
                                                                               * (97 * v64
                                                                                - 167798191
                                                                                - ((((97 * v64 - 167798191)
                                                                                                 * (unint64_t)v66) >> 32) >> 10)
                                                                                * v67)) ^ 0xF655FF3D740DF2D8LL)
                                                            + ((2
                                                              * (*(_DWORD *)(a7
                                                                           + 4LL
                                                                           * (97 * v64
                                                                            - 167798191
                                                                            - ((((97 * v64 - 167798191)
                                                                                             * (unint64_t)v66) >> 32) >> 10)
                                                                            * v67)) ^ 0x9D71F67)) & 0xFBB5DB7E)
                                                            + v65
                                                            + 0x9AA00C282251241LL);
  int v76 = *(unsigned __int8 *)((*(unsigned int *)(a7
                                              + 4LL
                                              * (97 * v64
                                               - 167798385
                                               - ((((97 * v64 - 167798385)
                                                                * (unint64_t)v66) >> 32) >> 10)
                                               * v67)) ^ 0x7BBBF7F8E608E298LL)
                           + v65
                           + ((2LL
                             * (*(_DWORD *)(a7
                                          + 4LL
                                          * (97 * v64
                                           - 167798385
                                           - ((((97 * v64 - 167798385)
                                                            * (unint64_t)v66) >> 32) >> 10)
                                           * v67)) ^ 0x9D71F67u)) & 0x1DFBFFBFELL)
                           - 0x7BBBF7F8EFDFFDFFLL);
  int v77 = *(unsigned __int8 *)(v68
                           + 457 * v64
                           - 1676036941
  int v78 = (((v75 - ((2 * v75) & 0x1BC)) << 16) + 333316096) ^ 0x13DE0000;
  int v79 = (((v74 - ((2 * v74) & 0x124)) << 8) + 1781043712) ^ 0x6A289200;
  unsigned int v80 = (v78 - 475414840 + (~(2 * v78) | 0xB8ADFFFF) + 1) ^ 0xE3A9BEC8 | (v79 + 1400737603 - ((2 * v79) & 0x26FB1E00)) ^ 0x537D8F43;
  unsigned int v81 = (v80 + 1359790086 - ((2 * v80) & 0x2219800C)) ^ 0x510CC006 | ((v77 ^ v69 ^ v76)
                                                                    - 89950627
                                                                    - ((2 * (v77 ^ v69 ^ v76)) & 0xBA)) ^ 0xFAA3765D;
  int v82 = *(unsigned __int8 *)(v68
                           + 457 * v64
                           - 1676037398
                           - ((((457 * v64 - 1676037398) * (unint64_t)v70) >> 32) >> 10)
                           * a2) ^ v69 ^ *(unsigned __int8 *)((*(unsigned int *)(a7
                                                                               + 4LL
                                                                               * (97 * v64
                                                                                - 167798482
                                                                                - ((((97 * v64 - 167798482)
                                                                                                 * (unint64_t)v66) >> 32) >> 10)
                                                                                * v67)) ^ 0x6F3FBF8FE62CE218LL)
                                                            + v65
                                                            + ((2LL
                                                              * (*(_DWORD *)(a7
                                                                           + 4LL
                                                                           * (97 * v64
                                                                            - 167798482
                                                                            - ((((97 * v64 - 167798482)
                                                                                             * (unint64_t)v66) >> 32) >> 10)
                                                                            * v67)) ^ 0x9D71F67u)) & 0x1DFF7FAFELL)
                                                            - 0x6F3FBF8FEFFBFD7FLL);
  int v83 = (((v81 + (~(2 * v81) | 0x5E93D1)) << 8) + 1354110976) ^ 0x50B61700;
  unsigned int v84 = (v83 - 444321346 - ((2 * v83) & 0xCB086200)) ^ 0xE58431BE | (v82 - 907070068 - ((2 * v82) & 0x118)) ^ 0xC9EF358C;
  int v85 = (v84 - ((2 * v84) & 0x1E6DB3EC) - 1892230666) ^ *(_DWORD *)(a7
                                                                  + 4LL
                                                                  * (97 * v73
                                                                   - 513465431
                                                                   - ((((97 * v73 - 513465431)
  HIDWORD(v86) = v85 ^ 0x691;
  LODWORD(v86) = v85 ^ 0x86E1C000;
  int v87 = (v86 >> 11) - ((2 * (v86 >> 11)) & 0xB59AADB6) - 624077093;
  HIDWORD(v86) = v87 ^ 0x1ACD56DB;
  LODWORD(v86) = v87 ^ 0xC0000000;
  int v88 = (v86 >> 29) - ((2 * (v86 >> 29)) & 0xB2C1154C) - 647984474;
  HIDWORD(v86) = v88 ^ 0x608AA6;
  LODWORD(v86) = v88 ^ 0xD9000000;
  *(_DWORD *)(((4LL * (v73 - 1605350842)) | ((unint64_t)(v73 - 1605350842 < 0x7BAE42D9) << 34))
            + *a64
            - 0x657CD3A7F9E21DFELL) = (v86 >> 24) + 165093223 - ((2 * (v86 >> 24)) & 0x13AE3ECE);
  return (*(uint64_t (**)(void))(v71
                              + 8LL
                              * (((v64 - 1197237194) < 0xE0) | (8
                                                                            * ((v64 - 1197237194) < 0xE0)) | v72)))();
}

uint64_t sub_1001D720C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, int a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, int a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v69 = (((((v68 - 1172) | 0x270) ^ 0x28D) & (a45 + 30)) - 1900568016 - ((2 * (a45 + 30)) & 0x60)) ^ 0x8EB7A230;
  int v70 = *(&a65 + (((914 * v69) & 0x6F9EE) + ((v69 * v65) ^ 0x1DD37CF7) - 500136119) % 0x708);
  int v71 = *(_DWORD *)(v66 + 4LL * ((1361 * (((2 * (v70 ^ 0xA)) & 0x17C) + (v70 ^ 0xF76F3DF4)) - 1981692578) % 0x12E0));
  int v72 = (2 * ((v71 ^ 0x7550948E) * (v71 ^ 0x7550948E) - ((2 * (v71 ^ 0x7550948E) * (v71 ^ 0x7550948E)) & 0x1AADF948))
       + 447609160) ^ 0x1AADF948;
  unsigned int v73 = (v72 - ((2 * v72) & 0x2D37E410) + 379318793) ^ v71;
  unsigned int v74 = (2012343039 - (BYTE2(v73) ^ 0xC5) + ((2 * (BYTE2(v73) ^ 0xC5)) & 0x88888888) + 1468) ^ 0x77F379CB;
  int v75 = (v74 - ((2 * v74) & 0x1376E) + 2010446775) ^ 0x77D672B6;
  int v76 = (v75 * v65) ^ 0x5B767FEC;
  unsigned int v77 = (914 * v75) & 0xB6ECFFD8;
  uint64_t v78 = (97 * a45 + 1421876830) % 0x55Cu;
  int v79 = (((2 * (v73 ^ 0xEF)) & 0x152) - (v73 ^ 0xEF) - 1830440874) ^ 0x53E5A05E;
  int v80 = *(&a65
                         + (((914 * (HIBYTE(v73) ^ 0xB0)) & 0x2FFFE)
                          + (((HIBYTE(v73) ^ 0xB0) * v65) ^ 0x7FEF7FFF)
                          - 2146257863)
                         % 0x708u);
  int v81 = BYTE1(v73);
  unsigned int v82 = v77 + v76 - 1534346412;
  int v83 = (((2 * v79) | 0x435D6F76) - v79 + 1582385221) ^ 0x60AEA778;
  uint64_t v84 = (((914 * v83) & 0xAFFFCFB6) + ((v83 * v65) ^ 0x57FFE7DB) - 1476242587) % 0x708;
  int v85 = v81 ^ 0x27;
  uint64_t v86 = ((v81 ^ 0x27) * v65) ^ 0xFFFD2FDF;
  int v87 = (((v80 ^ 0x90) - ((2 * v80) & 0x40)) << 16) - 2111832064;
  unsigned int v89 = (v88 + 1967275888 - ((2 * v88) & 0x6A847E00)) ^ 0x75423F70 | ((v87 ^ 0x82200000)
                                                                    + 1019863600
                                                                    - ((2 * v87) & 0x79920000)) ^ 0x3CC9E230;
  int v90 = *(&a65 + (((914 * v85) & 0x25FBE) + 326524 + v86 + 4069) % 0x708) ^ 0x90;
  unsigned int v91 = (v89 + 861047656 - ((2 * v89) & 0x66A516D0)) ^ 0x33528B68 | (v90 + 1814376159 - ((2 * v90) & 0xFFFFFFBF)) ^ 0x6C252EDF;
  int v92 = (((v91 - ((2 * v91) & 0xE8C4AE)) << 8) + 1952601856) ^ 0x74625700;
  int v93 = *(&a65 + v84) ^ 0x90;
  unsigned int v94 = (v92 - 436702832 - ((2 * v92) & 0xCBF0E200)) ^ 0xE5F87190 | (v93 - 1310305411 - ((2 * v93) & 0xFA)) ^ 0xB1E6537D;
  int v95 = (v94 + 795416402 - ((2 * v94) & 0x5ED22EA4)) ^ a50;
  *((_DWORD *)&STACK[0x8D0] + v78) = (v95 ^ 0x2F691752)
                                                 + 165093223
                                                 - 2 * ((v95 ^ 0x2F691752) & 0x9D71F6F ^ v95 & 8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 8LL * ((545 * (a45 == 1092292065)) | v68)))( v78,  144LL,  861047656LL,  v84,  1019863600LL,  v86,  4294782943LL,  (a45 + 1),  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36);
}

uint64_t sub_1001D76E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v67 - 0x657CD3A72772FA32LL) = *(_DWORD *)(v66
                                                                 + 4LL
                                                                 * (v64
                                                                  + 15
                                                                  + (_DWORD)v67 * v65
                                                                  + 301549733
                                                                  - ((((v64
                                                                                                  + 15
                                                                                                  + v67 * v65
                                                                                                  + 301549733)
  return ((uint64_t (*)(void))(*(void *)(v70 + 8LL * ((243 * (v67 == 1192397849)) ^ v64)) - 12LL))();
}

uint64_t sub_1001D775C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, int a45, unsigned int a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v69 = ((a46 - 12) + 404918330 - ((((_BYTE)a46 - 12) & 0x3B ^ a46 & 1) << ((v66 + 97) ^ 0xE3))) ^ 0x1822903A;
  int v70 = *(&a66 + (((914 * v69) & 0x7D93FFAE) + ((457 * v69) ^ 0xBEC9FFD7) + 1094321257) % 0x708);
  unsigned int v71 = ((v70 ^ 0x90) - ((2 * v70) & 0x86) - 1795705277) ^ *(_DWORD *)(v67
                                                                     + 4LL
                                                                     * ((1361
                                                                       * (((2 * (v70 ^ 0x44)) & 0xFFFFFF9F)
                                                                        + (v70 ^ 0x6B7FBFAB))
                                                                       + 2116613535)
                                                                      % 0x12E0));
  unsigned int v72 = ((914 * (HIBYTE(v71) ^ 0xAF)) & 0x31BF6) + ((457 * (HIBYTE(v71) ^ 0xAF)) ^ 0x7BEF8DFB) - 2079150779;
  int v73 = ((BYTE1(v71) ^ 0x1544CF) - ((2 * (BYTE1(v71) ^ 0x1544CF)) & 0x2200F6) + 152666747) ^ 0x90CC67B;
  int v74 = ((BYTE2(v71) ^ 0x75) + (HIWORD(v71) & 0x9B ^ 0x26A47E8A) - ((BYTE2(v71) ^ 0x75) & 0x9B)) ^ 0x26A47EE8;
  LOWORD(v71) = ((2 * (v71 ^ 0xD3)) & 0xD8) - (v71 ^ 0xD3) - 26989;
  int v75 = ((v71 & 0x2C0 ^ 0x5046DCC1) + (v71 & 0x13F) - 1) ^ 0x5046DEB1;
  unsigned int v76 = ((914 * v75) & 0x73FEBBF6) + ((457 * v75) ^ 0xB9FF5DFB) + 1174592837;
  int v77 = *(&a66 + v72 % 0x708) ^ 0x90;
  int v78 = *(&a66 + (((914 * v74) & 0x7EE5FF84) + ((457 * v74) ^ 0x3F72FFC2u) - 1064354946) % 0x708);
  int v79 = *(&a66 + (((914 * v73) & 0xD6CFB79E) + ((457 * v73) ^ 0xEB67DBCF) + 345661297) % 0x708);
  int v80 = *(&a66 + v76 % 0x708);
  unsigned int v81 = (((v77 - ((2 * v77) & 0x77777777)) << 16) - 390397952) ^ 0xE8BB0000;
  unsigned int v82 = ((((v78 ^ 0x90) - ((2 * v78) & 0x14)) << 8) - 145749504) ^ 0xF7500A00;
  unsigned int v83 = (v82 + 1847867983 - ((2 * v82) & 0x5C487400)) ^ 0x6E243A4F | (v81 - 472013913 - ((2 * v81) & 0x47BA0000)) ^ 0xE3DDA3A7;
  unsigned int v84 = (v83 - 1393111997 - ((2 * v83) & 0x59ED9886)) ^ 0xACF6CC43 | ((v79 ^ 0x90)
                                                                    - 467100466
                                                                    - ((2 * (v79 ^ 0x90)) & 0x19C)) ^ 0xE4289CCE;
  unsigned int v85 = (((v84 + 12620069 - ((2 * v84) & 0x812242)) << 8) - 1024) ^ 0xC0912100;
  int v86 = (v85 + 66365311 - ((2 * v85) & 0x7E94E00)) ^ 0x3F4A77F | ((v80 ^ 0x90) + 849013366 - ((2 * (v80 ^ 0x90)) & 0xEC)) ^ 0x329AEA76;
  *((_DWORD *)&STACK[0x8D0] + (97 * a46 - 1351686796) % 0x55C) = a58 ^ 0x45A30229 ^ (v86
                                                                                   - ((2 * v86) & 0x3A22D266)
                                                                                   - 1659803341);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 + 8LL * ((1471 * (a46 == 943773451)) ^ v66)) - 12LL))( 66365311LL,  3827866830LL,  2901855299LL,  1847867983LL,  1346821313LL,  a46,  648314506LL,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37);
}

uint64_t sub_1001D7C04@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * v59 - 0x657CD3A6F397DB12LL) = *(_DWORD *)(v57
                                                                 + 4LL
                                                                 * ((_DWORD)v59 * v60
                                                                  - 75800850
                                                                  - ((((v59 * v60 - 75800850)
  return ((uint64_t (*)(void))(*(void *)(v62 + 8LL * ((1861 * (v59 != 974898001)) ^ a1)) - 4LL))();
}

uint64_t sub_1001D7C7C@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, int a48, int a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  unsigned int v62 = ((v59 - 55) - 1582912446 - (((v59 + 201) << (a1 + 31)) & 0x84)) ^ 0xA1A6AC42;
  int v63 = *(&a59 + (((914 * v62) & 0x17FEEE) + ((457 * v62) ^ 0xFB8BFF77) + 74974409) % 0x708);
  unsigned int v64 = *(_DWORD *)(v60 + 4LL * ((1361 * ((v63 ^ 0x3FAFED18) + 2 * (v63 ^ 0xE7u)) + 1775796413) % 0x12E0));
  int v65 = (((2 * (BYTE2(v64) ^ 0x2B)) & 0x76) - (BYTE2(v64) ^ 0x2B) + 3012) ^ 0xB99;
  __int16 v66 = (v64 ^ 0xB1) - 2 * ((v64 ^ 0xB1) & 7) + 30215;
  int v67 = ((v66 & 0x305) + 1913188351 + (v66 & 0xFA ^ 0x11080B)) ^ 0x7219FA57;
  int v68 = (((2 * (BYTE1(v64) ^ 0xA3)) | 0x73FEC826) - (BYTE1(v64) ^ 0xA3) + 1174445037) & 0x7FFFFFFF ^ 0x39FF64A1;
  int v69 = *(&a59
                         + (((914 * (HIBYTE(v64) ^ 0xBE)) & 0xDCFA)
                          + ((457 * (HIBYTE(v64) ^ 0xBE)) ^ 0xAF2E6E7D)
                          + 1356057795)
                         % 0x708) ^ 0x90;
  int v70 = *(&a59 + (((914 * v68) & 0x3E67EBD6) + ((457 * v68) ^ 0x9F33F5EB) + 1624130901) % 0x708);
  int v71 = *(&a59 + (((914 * v65) & 0x22B9D4) + ((457 * v65) ^ 0x21F15CEAu) - 569319850) % 0x708) ^ 0x90;
  int v72 = v69 - ((2 * v69) & 0x70);
  unsigned int v73 = v71 - ((2 * v71) & 0xFFFFFF83);
  unsigned int v74 = (((v72 << 16) - 197656576) ^ 0xF4380000)
      + 1455784533
      - ((2 * (((v72 << 16) - 197656576) ^ 0xF4380000)) & 0x2D8A0000);
  unsigned int v75 = ((((((v73 << 8) - 588857088) ^ 0xDCE6C100)
         + 280585946
         - ((2 * (((v73 << 8) - 588857088) ^ 0xDCE6C100)) & 0x2172CC00)) ^ 0x10B966DA | v74 ^ 0x56C58255)
       + 2139930656
       + (~(2
          * (((((v73 << 8) - 588857088) ^ 0xDCE6C100)
            + 280585946
            - ((2 * (((v73 << 8) - 588857088) ^ 0xDCE6C100)) & 0x2172CC00)) ^ 0x10B966DA | v74 ^ 0x56C58255)) | 0x80E67FBF)
       + 1) ^ 0x7F8CC020 | ((v70 ^ 0x90) + 1358868560 - ((2 * (v70 ^ 0x90)) & 0xA0)) ^ 0x50FEB050;
  int v76 = *(&a59 + (((914 * v67) & 0xDFCFE6E) + ((457 * v67) ^ 0x56FE7F37u) - 1459373047) % 0x708);
  int v77 = (((v75 + 121835 - ((2 * v75) & 0x3B796)) << 8) - 0x2000) ^ 0x1DBCB00;
  unsigned int v78 = (v77 + 1646666228 - ((2 * v77) & 0xC44C4200)) ^ 0x622621F4 | ((v76 ^ 0x90)
                                                                    + 642897329
                                                                    - ((2 * (v76 ^ 0x90)) & 0x162)) ^ 0x2651D5B1;
  *((_DWORD *)&STACK[0x8D0] + (97 * v59 - 1552457431) % 0x55Cu) = a49 ^ 0xF3194E50 ^ (v78
                                                                                    - ((2 * v78) & 0xD204792C)
                                                                                    + 1761754262);
  return ((uint64_t (*)(void))(*(void *)(v61 + 8LL * ((v59 == 901565238) ^ a1)) - 4LL))();
}

uint64_t sub_1001D80E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v70 - 0x657CD3A64EB8CA16LL) = *(_DWORD *)(v69
                                                                 + 4LL
                                                                 * ((_DWORD)v70 * v67
                                                                  - 1717732147
                                                                  - ((((v70 * v67
                                                                                                  - 1717732147)
  return ((uint64_t (*)(void))(*(void *)(v71 + 8LL * (((v70 != 283376914) * v65) ^ v64)) - 12LL))();
}

uint64_t sub_1001D814C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, int a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v69 = ((((v66 - 598291305) & 0x23A933FF ^ 0x14A) & (a46 + 178)) + 602682236 - 2 * ((a46 + 178) & 0x7D ^ a46 & 1)) ^ 0x23EC337C;
  unsigned int v70 = (((914 * v69) & 0xFE7FB6F8) + ((457 * v69) ^ 0xFF3FDB7C) + 12855492) % 0x708;
  uint64_t v71 = &a66;
  int v72 = *(_DWORD *)(v67
                  + 4LL
                  * ((1361
                    * (((2 * (v71[v70] ^ 0x80)) & 0x33333333)
                     + (v71[v70] ^ 0x4FBF2D79u))
                    + 149042127)
                   % 0x12E0));
  HIDWORD(v73) = v72 ^ 0xA365;
  LODWORD(v73) = v72 ^ 0x4F180000;
  int v74 = (v73 >> 16) - ((2 * (v73 >> 16)) & 0x71B6B38E) - 1193584185;
  unsigned int v75 = ((16 * v74) & 0xEFD3BFB0 ^ 0x8D919C30) + ((8 * v74) ^ 0x313311E5);
  unsigned int v76 = (v75 - ((2 * v75 + 367270102) & 0x22DE7970) - 597604061) ^ v74;
  int v77 = (v76 & 0x21) - 1845212417 + (v76 & 0xDE ^ 0x410101D);
  unsigned int v78 = ((v76 >> 23) & 0x1BE ^ 0x190) + (HIBYTE(v76) ^ 0xDD4D6F17);
  unsigned int v79 = ((BYTE2(v76) ^ 0x98C820F5) + (HIWORD(v76) & 0xDE ^ 0x3135A0A) - ((BYTE2(v76) ^ 0x98C820F5) & 0x88820DE)) ^ 0x93535A9E;
  int v80 = (((2 * (BYTE1(v76) ^ 7)) & 0x144) - (BYTE1(v76) ^ 7) + 1355624029) ^ 0x70DD3B5C;
  unsigned int v81 = (v78 - ((2 * v78 + 1164255938) & 0x9F89AD22) + 1920428018) ^ 0x4FC4D691;
  unsigned int v82 = ((914 * v81) & 0xAFB5B3FA) + ((457 * v81) ^ 0x57DAD9FD) - 1473960445;
  uint64_t v83 = (((914 * (v77 ^ 0x96145B25)) & 0xF0FDC) + ((457 * (v77 ^ 0x96145B25)) ^ 0xB3F787EE) + 1275769682) % 0x708;
  unsigned int v84 = (((2 * v80) | 0xD20DE54E) - v80 - 1762063015) ^ 0x4916E7AF;
  unsigned int v85 = (((914 * v84) & 0xD5EFFF5E) + ((457 * v84) ^ 0xEAF7FFAF) + 352992145) % 0x708;
  int v86 = *(&a66 + (((914 * v79) & 0xBBFC) + ((457 * v79) ^ 0x1CE85DFE) - 484844222) % 0x708) ^ 0x90;
  int v87 = *(&a66 + v82 % 0x708) ^ 0x90;
  int v88 = (((v87 - ((2 * v87) & 0x172)) << 16) + 498663424) ^ 0x1DB90000;
  unsigned int v89 = (((v86 - ((2 * v86) & 0x178)) << 8) - 1135035392) ^ 0xBC58BC00;
  unsigned int v90 = (v88 + 1185411423 - ((2 * v88) & 0xD4E0000)) ^ 0x46A7F15F | (v89 - 1216580873 - ((2 * v89) & 0x6EF8E400)) ^ 0xB77C72F7;
  unsigned int v91 = (v90 - 259587949 - ((2 * v90) & 0x610E0126)) ^ 0xF0870093 | ((v71[v85] ^ 0x90)
                                                                   - 750134681
                                                                   - ((2 * v71[v85]) & 0xCE)) ^ 0xD349DA67;
  unsigned int v92 = (((v91 - ((2 * v91) & 0x4D2158)) << 8) - 1500468224) ^ 0xA690AC00;
  LODWORD(v71) = (v92 + 1292454077 - ((2 * v92) & 0x9A129000)) ^ 0x4D0948BD | ((v71[v83] ^ 0x90)
                                                                             + 43909121
                                                                             - 2 * (v71[v83] & 1)) ^ 0x29E0001;
  *((_DWORD *)&STACK[0x8D0] + (97 * a46 - 1171633806) % 0x55Cu) = a57 ^ 0xC965CB7B ^ ((_DWORD)v71
                                                                                    - ((2 * (_DWORD)v71) & 0x4636DF00)
                                                                                    - 1558483072);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 + 8LL * ((171 * (a46 == 499137101)) ^ v66)) - 12LL))( 1292454077LL,  4035379347LL,  3544832615LL,  v83,  1185411423LL,  1226237871LL,  v82 / 0x708uLL,  987100LL,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37);
}

uint64_t sub_1001D86AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v68 - 0x657CD3A7AEC2F352LL) = *(_DWORD *)(v69
                                                                 + 4LL
                                                                 * (v64
                                                                  + 194
                                                                  + (_DWORD)v68 * v65
                                                                  + 1084591719
                                                                  - ((((v64
                                                                                    + 194
                                                                                    + (_DWORD)v68 * v65
                                                                                    + 1084591719)
  return ((uint64_t (*)(void))(*(void *)(v70 + 8LL * ((962 * (v68 == 1759939425)) ^ v64)) - 12LL))();
}

uint64_t sub_1001D8720@<X0>( uint64_t a1@<X6>, uint64_t a2@<X7>, unsigned int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, int a41, int a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  int v63 = (((a42 + 217) & ((a3 ^ 0x6DD) - 939)) + 226605718 - ((2 * (a42 + 217)) & 0x12C)) ^ 0xD81BA96;
  unsigned int v64 = (((914 * v63) & 0xFBFB6) + ((457 * v63) ^ 0xDFFFDFDB) + 537142373) % 0x708;
  int v65 = *(_DWORD *)(v61
                  + 4LL
                  * ((1361
                    * (((2 * (*(&a61 + v64) ^ 0xFFFFFFC1)) & 0x9E)
                     + (*(&a61 + v64) ^ 0xBF7BF78E))
                    - 33539692)
                   % 0x12E0)) ^ 0x4F18A365;
  unsigned int v66 = v65 - ((2 * v65 + 1468112052) & 0x7C340F20) - 371534358;
  unsigned int v67 = (((v66 >> 15) & 0x18) + 1524540335 + (BYTE2(v66) ^ 0xFFFFFFDE) + 69) ^ 0x5ADEA3AF;
  int v68 = (((v66 & 0x7D ^ 0xBFFAD61) & 0x8308B5 | v66 & 0x80) ^ 0xA0)
      + ((v66 & 0x7D ^ 0xBFFAD61 | v66 & 0x82) ^ 0x258B0D5D)
      - (((v66 & 0x7D ^ 0xBFFAD61 | v66 & 0x82) ^ 0x258B0D5D) & 0x234A0B5);
  int v69 = *(&a61
                         + (((914 * (HIBYTE(v66) ^ 0x34)) & 0x3BCFE)
                          + ((457 * (HIBYTE(v66) ^ 0x34)) ^ 0xF24BDE7F)
                          + 230055105)
                         % 0x708) ^ 0x90;
  int v70 = *(&a61 + (((914 * v67) & 0xFEE92E) + ((457 * v67) ^ 0xBEFF7497) + 1090700969) % 0x708) ^ 0x90;
  int v71 = *(&a61
                         + (((914 * (BYTE1(v66) ^ 0x6B)) & 0x3D87C)
                          + ((457 * (BYTE1(v66) ^ 0x6B)) ^ 0xBF1FEC3E)
                          + 1088573186)
                         % 0x708);
  int v72 = (((v69 - ((2 * v69) & 0xA4)) << 16) + 1683095552) ^ 0x64520000;
  int v73 = (((v70 + 7170659 - ((2 * v70) & 0xB4)) << 8) - 2304) ^ 0x6D6A5A00;
  unsigned int v74 = (v73 - 591557318 - ((2 * v73) & 0x397B1A00)) ^ 0xDCBD8D3A | (v72 - 2042054806 - ((2 * v72) & 0xC900000)) ^ 0x8648B76A;
  uint64_t v75 = (97 * a42 + 2058117177) % 0x55Cu;
  unsigned int v76 = (v74 + 1188541864 - ((2 * v74) & 0x8DAF6B50)) ^ 0x46D7B5A8 | ((v71 ^ 0x90) - 1205838016 - ((2 * v71) & 0x80)) ^ 0xB8205F40;
  unsigned int v77 = (((v76 - ((2 * v76) & 0x195EA8)) << 8) - 1934666752) ^ 0x8CAF5400;
  int v78 = *(&a61
                         + (((914 * (v68 ^ 0x2CC308B3)) & 0xBDFD3E96)
                          + ((457 * (v68 ^ 0x2CC308B3)) ^ 0x5EFE9F4B)
                          - 1593598987)
                         % 0x708) ^ 0x90;
  unsigned int v79 = (v77 - 1073468580 - ((2 * v77) & 0x80085600)) ^ 0xC0042B5C | (v78 - 140998455 - ((2 * v78) & 0x192)) ^ 0xF79888C9;
  *((_DWORD *)&STACK[0x8D0] + v75) = a52 ^ (v79 - ((2 * v79) & 0x8096BBB8) + 1078681052) ^ 0x7B416609;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 + 8LL * ((1757 * (a42 == 820064806)) ^ a3)) - 12LL))( v75,  4153968841LL,  3221498716LL,  3089129280LL,  1188541864LL,  (a42 + 1),  a1,  a2,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33);
}

uint64_t sub_1001D8BA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v69 - 0x657CD3A611F0DEDELL) = *(_DWORD *)(v65
                                                                 + 4LL
                                                                 * (((v64 + 355) ^ 0x5B908AD6)
                                                                  + (_DWORD)v69 * v66
                                                                  - ((((((v64 + 355) ^ 0x5B908AD6)
                                                                                    + (_DWORD)v69 * v66)
  return ((uint64_t (*)(void))(*(void *)(v70 + 8LL * ((679 * (v69 == 28441156)) ^ v64)) - 12LL))();
}

uint64_t sub_1001D8C1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, unsigned int a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v69 = (((((v66 - 1485) | 0x581) - 1218) & (a47 + 189)) - 761020744 - ((2 * (a47 + 189)) & 0x170)) ^ 0xD2A3BEB8;
  int v70 = *(&a66 + (((914 * v69) & 0x7397E) + ((457 * v69) ^ 0xFF139CBF) + 15755137) % 0x708);
  unsigned int v71 = ((v70 ^ 0xBE) - ((2 * (v70 ^ 0xBE)) & 0x1E8) + 1717183988) ^ *(_DWORD *)(v67
                                                                               + 4LL
                                                                               * ((1361
                                                                                 * (((2 * (v70 ^ 0x92)) & 0x1A6)
                                                                                  + (v70 ^ 0x1EDDAC41u))
                                                                                 - 409671485)
                                                                                % 0x12E0));
  unsigned int v72 = ((BYTE2(v71) ^ 0x70) - ((2 * (BYTE2(v71) ^ 0x70)) & 0xFFFFFFCF) + 1530246887) ^ 0xD95B06F;
  unsigned int v73 = 1035293029 - (BYTE1(v71) ^ 0xD5 | 0x3DB55165) + (BYTE1(v71) ^ 0xD5 | 0xC24AAE9A);
  unsigned int v74 = (-1437056867 - (v72 | 0xAA58409D) + (v72 | 0x55A7BF62)) ^ 0x307B941;
  int v75 = (((2 * (v71 ^ 0x14)) | 0x7BB13B8A) - (v71 ^ 0x14) - 1037606341) ^ 0x3DD89DD1;
  int v76 = *(&a66
                         + (((914 * (HIBYTE(v71) ^ 0xA7)) & 0x37FAE)
                          + ((457 * (HIBYTE(v71) ^ 0xA7)) ^ 0xFF75BFD7)
                          + 9206633)
                         % 0x708) ^ 0x90;
  int v77 = *(&a66 + (((914 * v74) & 0xFF7EFFE4) + 4369528 + ((457 * v74) ^ 0xFFBF7FF2) + 3798) % 0x708);
  unsigned int v78 = (((v76 - ((2 * v76) & 0xF0)) << 16) - 1904738304) ^ 0x8E780000;
  unsigned int v79 = ((((v77 ^ 0x90) + 11666170 - ((2 * v77) & 0x56)) << 8) + 405760) ^ 0xB2092B00;
  unsigned int v80 = (v78 - 2092038769 - ((2 * v78) & 0x69C0000)) ^ 0x834E058F | (v79 - 353155013 - ((2 * v79) & 0x55E69000)) ^ 0xEAF3483B;
  int v81 = *(&a66
                         + (((914 * (v73 ^ 0xC24AAEEF)) & 0x72D33CDC)
                          + ((457 * (v73 ^ 0xC24AAEEF)) ^ 0x39699E6E)
                          - 963076910)
                         % 0x708) ^ 0x90;
  unsigned int v82 = 97 * a47 + 1768273821;
  unint64_t v83 = v82 / 0x55CuLL;
  uint64_t v84 = v82 % 0x55C;
  unsigned int v85 = (((((v80 + 1547446935 - ((2 * v80) & 0xB878552E)) ^ 0x5C3C2A97 | (v81 + 1651430012 - ((2 * v81) & 0xF8)) ^ 0x626ED27C)
         - ((2
           * ((v80 + 1547446935 - ((2 * v80) & 0xB878552E)) ^ 0x5C3C2A97 | (v81 + 1651430012 - ((2 * v81) & 0xF8)) ^ 0x626ED27C)) & 0x7A35C8)) << 8)
       - 1122311168) ^ 0xBD1AE400;
  int v86 = *(&a66 + (((914 * v75) & 0xBFA8FDEE) + ((457 * v75) ^ 0x5FD47EF7) - 1607615415) % 0x708) ^ 0x90;
  unsigned int v87 = (v85 - 2029255651 - ((2 * v85) & 0xE180800)) ^ 0x870C041D | (v86 - 540451159 - ((2 * v86) & 0x152)) ^ 0xDFC95EA9;
  *((_DWORD *)&STACK[0x8D0] + v84) = a58 ^ 0xA703D29E ^ (v87 - ((2 * v87) & 0x5D969D54) - 1362407766);
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 + 8LL * ((351 * (a47 == 1088720962)) ^ v66)) - 12LL))( v84,  v83,  1651430012LL,  1547446935LL,  3259674266LL,  a47,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38);
}

uint64_t sub_1001D90D0@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * v61 - 0x657CD3A76F435B72LL) = *(_DWORD *)(v57
                                                                 + 4LL
                                                                 * ((_DWORD)v61 * v60
                                                                  + 1149280470
                                                                  - ((((v61 * v60
                                                                                                  + 1149280470)
}

uint64_t sub_1001D9144( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, int a47, unsigned int a48, uint64_t a49, uint64_t a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,int a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v70 = (((v67 - 838) ^ 0x7C719F34) + (a48 - 125) - ((2 * (a48 + 131)) & 0x18)) ^ 0x7C719E0C;
  unsigned int v71 = (((914 * v70) & 0xB776C) + ((457 * v70) ^ 0xEAF5BBB6) + 353257610) % 0x708;
  unsigned int v72 = *(_DWORD *)(v68
                  + 4LL
                  * ((1361
                    * (((2 * (*(&a67 + v71) ^ 0xB2)) & 0xFFFFFFF7)
                     + (*(&a67 + v71) ^ 0x3FFBDE49))
                    - 702433804)
                   % 0x12E0));
  unsigned int v73 = ((BYTE2(v72) ^ 0xC5001A1D) - ((2 * (BYTE2(v72) ^ 0xC5001A1D)) & 0x80000434) - 353222118) ^ 0x2FF25812;
  uint64_t v74 = (457 * v73) ^ 0xDAEF3FFE;
  int v75 = ((BYTE1(v72) ^ 0x69) + 1921036872 - ((2 * (BYTE1(v72) ^ 0x69)) & 0x118) + 68) ^ 0x7280B248;
  int v76 = *(&a67
                         + (((914 * (HIBYTE(v72) ^ 0xBC)) & 0x3A296)
                          + ((457 * (HIBYTE(v72) ^ 0xBC)) ^ 0xCE7FD14B)
                          + 830630389)
                         % 0x708);
  int v77 = *(&a67 + (((914 * v73) & 0xB5DE7FFC) + v74 + 622000962) % 0x708);
  int v78 = *(&a67
                         + (((914 * (v72 ^ 0x49)) & 0x27AEE)
                          + ((457 * (v72 ^ 0x49)) ^ 0x7F8F3D77u)
                          - 2139947575)
                         % 0x708);
  int v79 = *(&a67 + (((914 * v75) & 0xFBFFFF16) + ((457 * v75) ^ 0xFDFFFF8B) + 33700789) % 0x708);
  int v80 = ((((v76 ^ 0x90) + (~(2 * (v76 ^ 0x90)) | 0xFF19)) << 16) + 1853095936) ^ 0x6E730000;
  int v81 = ((((v77 ^ 0x90) - ((2 * v77) & 0xC4)) << 8) + 486826496) ^ 0x1D046200;
  int v82 = (v81 + 679408758 - ((2 * v81) & 0x50FDE800)) ^ 0x287EF476 | (v80 + 250586496 - ((2 * v80) & 0x5DE0000)) ^ 0xEEFA580;
  unsigned int v83 = (v82 - 1434896106 - ((2 * v82) & 0x54F2722C)) ^ 0xAA793916 | ((v79 ^ 0x90)
                                                                    - 71690081
                                                                    - ((2 * (v79 ^ 0x90)) & 0xFFFFFF3F)) ^ 0xFBBA189F;
  int v84 = (((v83 - ((2 * v83) & 0x59326A)) << 8) + 748238080) ^ 0x2C993500;
  unsigned int v85 = (v84 - 1433091493 - ((2 * v84) & 0x55298400)) ^ 0xAA94C25B | ((v78 ^ 0x90)
                                                                    - 731599680
                                                                    - ((2 * (v78 ^ 0x90)) & 0x180)) ^ 0xD464ACC0;
  unsigned int v86 = a51 ^ 0x4F32C51D ^ (v85 + 1328727325 - ((2 * v85) & 0x9E658A3A));
  *((_DWORD *)&STACK[0x8D0] + (97 * a48 + 431063715) % 0x55C) = a57 ^ a58 ^ 0x57202332 ^ (v86
                                                                                        - ((2 * v86) & 0xFFCCEA8C)
                                                                                        - 1673914);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 8LL * ((195 * (a48 == 1323896700)) ^ v67)))( 250586496LL,  622000962LL,  v74,  4261412747LL,  1921036872LL,  a48,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39);
}

uint64_t sub_1001D958C@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * v61 - 0x657CD3A74454870ALL) = *(_DWORD *)(v60
                                                                 + 4LL
                                                                 * ((_DWORD)v61 * v57
                                                                  + 1436416432
                                                                  - ((((v61 * v57
                                                                                                  + 1436416432)
  return ((uint64_t (*)(void))(*(void *)(v62 + 8LL * ((124 * (v61 != 1313532239)) ^ a1)) - 12LL))();
}

uint64_t sub_1001D95F8@<X0>( uint64_t a1@<X6>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, unsigned int a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,int a51,int a52,int a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  unsigned int v64 = ((a43 - 107) - 1151836186 - ((2 * (a43 + 149)) & 0x1CC)) ^ 0xBB585FE6;
  unsigned int v65 = (((914 * v64) & 0x1C65648) + ((v64 * (((a3 + 548) | 1) - 404)) ^ 0xEFE32B24) + 270588188) % 0x708;
  unsigned int v66 = *(_DWORD *)(v62
                  + 4LL
                  * ((1361
                    * (((2 * (*(&a62 + v65) ^ 0x47)) & 0xFFFFFFEF)
                     + (*(&a62 + v65) ^ 0xDEDFEDB0))
                    + 461365721)
                   % 0x12E0));
  unsigned int v67 = (v66 ^ 0x46 | 0xFA93D0E5) - (v66 ^ 0x46 | 0x56C2F1A) + 90976026;
  unsigned int v68 = ((BYTE2(v66) ^ 0xFA) - ((2 * (BYTE2(v66) ^ 0xFA)) & 0x1D4) - 808732438) ^ 0x8F8BB86E;
  unsigned int v69 = (-366873976 - (v68 | 0xEA21F288) + (v68 | 0x15DE0D77)) ^ 0x559E0D67;
  unsigned int v70 = ((v67 & 0x12134CB5 ^ 0x10080495) + (v67 ^ 0xAA13F962) - ((v67 ^ 0xAA13F962) & 0x121B6CB5)) ^ 0x429B45A5;
  int v71 = *(&a62 + (((914 * v69) & 0xF4EFEEFE) + ((457 * v69) ^ 0x7A77F77F) - 2054536255) % 0x708);
  int v72 = *(&a62
                         + (((914 * (HIBYTE(v66) ^ 0x12)) & 0x3FF4E)
                          + ((457 * (HIBYTE(v66) ^ 0x12)) ^ 0x5FAFFFA7)
                          - 1605223527)
                         % 0x708u);
  unsigned int v73 = ((((v72 ^ 0x90) - ((2 * (v72 ^ 0x90)) & 0x196)) << 16) - 674562048) ^ 0xD7CB0000;
  int v74 = ((((v71 ^ 0x90) + (~(2 * v71) | 0xFFFFED)) << 8) + 789056000) ^ 0x2F080900;
  int v75 = *(&a62
                         + (((914 * (BYTE1(v66) ^ 0xD2)) & 0x17EBE)
                          + ((457 * (BYTE1(v66) ^ 0xD2)) ^ 0x5FBCBF5Fu)
                          - 1606059039)
                         % 0x708);
  unsigned int v76 = (v73 + 1728913975 - ((2 * v73) & 0x4E1A0000)) ^ 0x670D2237 | (v74 - 1408138809 - ((2 * v74) & 0x30200)) ^ 0xAC1181C7;
  int v77 = (v76 + 95348266 - ((2 * v76) & 0xB5DCC54)) ^ 0x5AEE62A | ((v75 ^ 0x90) + 742912778 - ((2 * v75) & 0x14)) ^ 0x2C47F30A;
  int v78 = *(&a62 + (((914 * v70) & 0x3AEBEBB6) + ((457 * v70) ^ 0x1D75F5DB) - 494123675) % 0x708);
  int v79 = (((v77 + 136818 - ((2 * v77) & 0x42CC2)) << 8) - 4352) ^ 0x2166100;
  unsigned int v80 = (v79 + 1946254052 + (~(2 * v79) | 0x17FD0BFF) + 1) ^ 0x74017AE4 | ((v78 ^ 0x90)
                                                                         - 1341881258
                                                                         - ((2 * (v78 ^ 0x90)) & 0xAC)) ^ 0xB0048456;
  *((_DWORD *)&STACK[0x8D0] + (97 * a43 - 19112075) % 0x55C) = a52 ^ a53 ^ a54 ^ 0x81DC5D80 ^ (v80
                                                                                             - ((2 * v80) & 0x75B01CAA)
                                                                                             + 987237973);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 + 8LL * ((1052 * (a43 == 1018591594)) ^ a3)) - 12LL))( 1946254052LL,  144LL,  742912778LL,  95348266LL,  1728913975LL,  a43,  a1,  a2,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34);
}

uint64_t sub_1001D9ABC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(((4LL * (v69 - 1583112462)) | ((unint64_t)(v69 - 1583112462 < (v64 ^ 0x918ACE2u)) << 34))
            + *a64
            - 0x657CD3A62F8BD196LL) = *(_DWORD *)(v68
                                                + 4LL
                                                * (v69 * v65
                                                 - 861804641
                                                 - ((((v69 * v65 - 861804641)
  return (*(uint64_t (**)(void))(v70 + 8LL * ((168 * ((v69 & 0xFFFFFF00) == 1735727104)) ^ v64)))();
}

uint64_t sub_1001D9B54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, int a48, unsigned int a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,unsigned int a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v70 = ((a49 + 110) - 564338074 - ((2 * (a49 + 110)) & 0xCC)) ^ 0xDE5CE266;
  unsigned int v71 = (((914 * v70) & 0xDB3F4) + 1074080326 + ((v70 * (56 * (v67 ^ 0x1D4) + 9)) ^ 0xBFFED9FA)) % 0x708;
  int v72 = *(_DWORD *)(v68
                  + 4LL
                  * ((1361
                    * (((2 * (*(&a66 + v71) ^ 0x60)) & 0xFA)
                     + (*(&a66 + v71) ^ 0x3B0FFF9Fu))
                    + 2507717)
                   % 0x12E0)) ^ 0x4F18A365;
  unsigned int v73 = v72 - ((2 * v72 - 1476488976) & 0xCA7AF108) - 1187200772;
  unsigned int v74 = ((2 * (v73 ^ 0xB3)) | 0xFB8E35AC) - (v73 ^ 0xB3) + 37283114;
  unsigned int v75 = (((v73 >> 8) & 0x1D ^ 0x14404415) + ((v73 >> 8) & 0xE2 ^ 0x80840061) - 1) ^ 0x94C444AA;
  uint64_t v76 = (457 * v75) ^ 0x7BDF7BB7;
  unsigned int v77 = (((2 * (BYTE2(v73) ^ 0x3E)) & 0x72) - (BYTE2(v73) ^ 0x3E) - 1772271418) ^ 0xB7C54857;
  unsigned int v78 = (914 * v75) & 0xF7BEF76E;
  unsigned int v79 = ((v74 & 0xEC0113F3 ^ 0x82093E2) + (v74 & 0x11C6080C ^ 0x13002C09) - 1) ^ 0xE6E7A558;
  unsigned int v80 = (901115502 - (v77 | 0x35B5EE6E) + (v77 | 0xCA4A1191)) ^ 0xEBD2119B;
  uint64_t v81 = (457 * v80) ^ 0xF6DF7FB7;
  uint64_t v82 = HIBYTE(v73);
  int v83 = *(&a66 + (((914 * v80) & 0xEDBEFF6E) + v81 + 153271177) % 0x708);
  int v84 = *(&a66
                         + (((914 * (v82 ^ 0x1C)) & 0x3533A)
                          + ((457 * (v82 ^ 0x1C)) ^ 0xD9CFA99D)
                          + 640848291)
                         % 0x708) ^ 0x90;
  unsigned int v85 = (((v84 - ((2 * v84) & 0xFFFFFF3F)) << 16) - 945881088) ^ 0xC79F0000;
  unsigned int v86 = ((((v83 ^ 0x90) - ((2 * v83) & 8)) << 8) - 2040069120) ^ 0x86670400;
  unsigned int v87 = (v86 + 1118392911 - ((2 * v86) & 0x552A400)) ^ 0x42A9524F | (v85 - 1353121302 - ((2 * v85) & 0x5EB20000)) ^ 0xAF5901EA;
  int v88 = *(&a66 + (v78 + v76 - 2078097527) % 0x708) ^ 0x90;
  unsigned int v89 = (v87 + 1122750530 - ((2 * v87) & 0x5D7A084)) ^ 0x42EBD042 | (v88 - 691405833 - ((2 * v88) & 0xFFFFFFEF)) ^ 0xD6C9FBF7;
  unsigned int v90 = (((v89 - ((2 * v89) & 0xC3E3FA)) << 8) - 504234752) ^ 0xE1F1FD00;
  int v91 = *(&a66 + (((914 * v79) & 0xFFBDFCE6) + ((457 * v79) ^ 0xFFDEFE73) + 2309325) % 0x708) ^ 0x90;
  int v92 = (v90 + 884900629 - ((2 * v90) & 0x697D0600)) ^ 0x34BE8315 | (v91 + 1923158423 - ((2 * v91) & 0x12E)) ^ 0x72A11197;
  *((_DWORD *)&STACK[0x8D0] + (97 * a49 + 1521237422) % 0x55C) = a59 ^ 0xC3C5A56D ^ (v92
                                                                                   - ((2 * v92) & 0x73D41422)
                                                                                   + 971639313);
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 8LL * (((a49 != 1091267729) * v66) ^ v67)))( a59,  1118392911LL,  v76,  3654265245LL,  v81,  v82,  a49,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40);
}

uint64_t sub_1001DA044@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * v61 - 0x657CD3A625DBB9A2LL) = *(_DWORD *)(v60
                                                                 + 4LL
                                                                 * ((_DWORD)v61 * v58
                                                                  + 2022467274
                                                                  - ((((v61 * v58
                                                                                                  + 2022467274)
  return (*(uint64_t (**)(void))(v62 + 8LL * ((28 * (v61 != 111984117)) | a1)))();
}

uint64_t sub_1001DA0AC@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, int a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  int v60 = (((a42 + 180) & ((a1 ^ 7) - 200)) + 793091995 - ((2 * (a42 + 180)) & 0x136)) ^ 0x2F459F9B;
  unsigned int v61 = (((914 * v60) & 0x277694E) + ((457 * v60) ^ 0x7B3BB4A7u) - 2067247207) % 0x708;
  uint64_t v62 = &a58;
  unsigned int v63 = *(_DWORD *)(v58
                  + 4LL
                  * ((1361
                    * (((2 * (v62[v61] ^ 0x88888888)) & 0x19A)
                     + (v62[v61] ^ 0x77EFBB67))
                    + 1587059369)
                   % 0x12E0));
  int v64 = (((v63 >> 8) & 0x4F ^ 0x1C07) + ((v63 >> 8) & 0xB0 ^ 0x11) - 1) ^ 0x1C31;
  int v65 = (v63 ^ 0x2F) + (v63 & 0x5E ^ 0x55FFA750) - ((v63 ^ 0x2F) & 0x5E);
  unsigned int v66 = ((914 * (HIBYTE(v63) ^ 0x30)) & 0x1B6EE) + ((457 * (HIBYTE(v63) ^ 0x30)) ^ 0x77E4DB77) - 2011340855;
  int v67 = (318545703 - (BYTE2(v63) ^ 0x8B) + ((2 * (BYTE2(v63) ^ 0x8B)) & 0x1B0)) ^ 0x12FC9F9B;
  v65 ^= 0x55FFA7F0u;
  int v68 = (457 * v65) ^ 0x5FBDBBFF;
  int v69 = 914 * v65;
  int v70 = *(&a58 + v66 % 0x708) ^ 0x90;
  unsigned int v71 = ((v69 & 0xBF7B77FE) + v68 - 1606123711) % 0x708;
  int v72 = *(&a58 + (((914 * v67) & 0x3B3EEBE) + ((457 * v67) ^ 0x75D9F75Fu) - 1977072671) % 0x708) ^ 0x90;
  int v73 = *(&a58 + (((914 * v64) & 0xFDFDEC) + ((457 * v64) ^ 0xFDFEFEF6) + 33766474) % 0x708);
  int v74 = (((v70 - ((2 * v70) & 0x38)) << 16) + 1595670528) ^ 0x5F1C0000;
  int v75 = (((v72 - ((2 * v72) & 0x1D2)) << 8) + 624879872) ^ 0x253EE900;
  unsigned int v76 = (v75 - 1880740074 - ((2 * v75) & 0x1FCC5E00)) ^ 0x8FE62F16 | (v74 - 67538254 - ((2 * v74) & 0x77F20000)) ^ 0xFBF972B2;
  uint64_t v77 = v73 ^ 0x90u;
  int v78 = (v76 - 717092965 - ((2 * v76) & 0xAA840F36)) ^ 0xD542079B | (v77 + 175670030 - ((2 * v73) & 0x1C)) ^ 0xA78830E;
  uint64_t v79 = (a42 + 1);
  int v80 = (((v78 - ((2 * v78) & 0x934EE4)) << 8) + 1235710464) ^ 0x49A77200;
  LODWORD(v62) = (v80 - 820191014 - ((2 * v80) & 0x9E39C000)) ^ 0xCF1CE0DA | ((v62[v71] ^ 0x90)
                                                                            - 620762674
                                                                            - ((2 * (v62[v71] ^ 0x90)) & 0x19C)) ^ 0xDAFFE9CE;
  uint64_t v81 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 8LL * ((7 * ((_DWORD)v79 == 1807238732)) ^ a1));
  *((_DWORD *)&STACK[0x8D0] + (97 * a42 + 791526964) % 0x55Cu) = a54 ^ 0xBEF3EE21 ^ ((_DWORD)v62
                                                                                   - ((2 * (_DWORD)v62) & 0xB0D098C2)
                                                                                   + 1483230305);
  return v81( 3474776282LL,  v77,  3577874331LL,  175670030LL,  2317894625LL,  v79,  1442817872LL,  318545703LL,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33);
}

uint64_t sub_1001DA4E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v68 - 0x657CD3A670EE64DALL) = *(_DWORD *)(v65
                                                                 + 4LL
                                                                 * ((_DWORD)v68 * ((v64 - 56) ^ 0x1EE)
                                                                  + 1544404668
                                                                  - ((((v68
                                                                                    * ((v64 - 56) ^ 0x1EE)
                                                                                    + 1544404668)
  return (*(uint64_t (**)(void))(v69 + 8LL * ((1675 * (v68 == 426858691)) ^ v64)))();
}

uint64_t sub_1001DA554@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, int a42, int a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,int a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  unsigned int v61 = ((a43 - 107) - 1052391691 - ((2 * (a43 + 149)) & 0x1EA)) ^ 0xC145C6F5;
  int v62 = *(&a59 + (((914 * v61) & 0xDD5DE) + ((457 * v61) ^ 0xBFD6EAEF) + 1076697425) % 0x708);
  unsigned int v63 = *(_DWORD *)(v59 + 4LL * ((1361 * (((2 * (v62 ^ 0x85)) & 0xFFFFFF3F) + (v62 ^ 0x67D7E95A)) - 311600689) % 0x12E0));
  unsigned int v64 = (((2 * ~HIWORD(v63)) & 0x1F0) - ~HIWORD(v63) - 1236175609) ^ 0xB6D15586;
  int v65 = (((2 * v64) | 0x7C6C55F8) - v64 - 1043737340) ^ 0x3EB60AFA;
  unsigned int v66 = ((914 * (HIBYTE(v63) ^ 0x2B)) & 0x21736) + ((457 * (HIBYTE(v63) ^ 0x2B)) ^ 0xEFD90B9B);
  unsigned int v67 = ((2 * (BYTE1(v63) ^ 0x420004EA)) | 0xE0CDEF8E) - (BYTE1(v63) ^ 0x420004EA) - 1885796295;
  uint64_t v68 = (457 * v65) ^ 0x879BDEFB;
  int v69 = ((v63 ^ 0xE9) + (v63 & 0x84 ^ 0x16068804) - ((v63 ^ 0xE9) & 0x84)) ^ 0x36569C92;
  v67 ^= 0x3266F3E3u;
  uint64_t v70 = (457 * v67) ^ 0xBFFC6EF7;
  int v71 = (((2 * v69) & 0x800826) - v69 + 1813142508) ^ 0x4C424F6C;
  unsigned int v72 = ((914 * v71) & 0xFDD7DDFE) + ((457 * v71) ^ 0x7EEBEEFF) - 2129245119;
  int v73 = *(&a59
                         + (v66
                                        + 271134629
                                        - 1800 * ((2386093 * (unint64_t)(v66 + 271134629)) >> 32))) ^ 0x90;
  int v74 = (((v73 - ((2 * v73) & 0x1D0)) << 16) + 417857536) ^ 0x18E80000;
  int v75 = *(&a59 + (((914 * v65) & 0xF37BDF6) + v68 + 2019974213) % 0x708) ^ 0x90;
  int v76 = (((v75 - ((2 * v75) & 0x64)) << 8) + 1912549888) ^ 0x71FF3200;
  int v77 = (v76 + 339239034 - ((2 * v76) & 0x2870C000)) ^ 0x1438607A | (v74 + 893661319 - ((2 * v74) & 0x6A880000)) ^ 0x35443087;
  int v78 = *(&a59 + (((914 * v67) & 0x7FF8DDEE) + v70 + 1074121801) % 0x708);
  unsigned int v79 = (v77 - 808285096 - ((2 * v77) & 0x9FA518B0)) ^ 0xCFD28C58 | ((v78 ^ 0x90)
                                                                   - 1963683312
                                                                   - ((2 * (v78 ^ 0x90)) & 0x20)) ^ 0x8AF49210;
  int v80 = (((v79 - ((2 * v79) & 0x46544A)) << 8) + 589964544) ^ 0x232A2500;
  int v81 = *(&a59 + v72 % 0x708) ^ 0x90;
  unsigned int v82 = (v80 - 740834460 - ((2 * v80) & 0xA7AF8600)) ^ 0xD3D7C364 | (v81 + 1005442985 - ((2 * v81) & 0x152)) ^ 0x3BEDD7A9;
  *((_DWORD *)&STACK[0x8D0] + (97 * a43 - 1322022027) % 0x55Cu) = a53 ^ (v82 - ((2 * v82) & 0x7CA6847A) - 1101839811) ^ 0xFF592F8C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 + 8LL * ((25 * (a43 != 987745642)) ^ a1)) - 8LL))( 3486682200LL,  2331283984LL,  893661319LL,  339239034LL,  v70,  v68,  1279414124LL,  255311350LL,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34);
}

uint64_t sub_1001DA9F4@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * (v61 + ((a1 - 1124023184) & 0x42FF3F74)) - 0x657CD3A7807E663ALL) = *(_DWORD *)(v60 + 4LL * ((_DWORD)v61 * v57 - 1565782184 - ((((v61 * v57 - 1565782184) * (unint64_t)v58) >> 32) >> 10) * v59));
  return ((uint64_t (*)(void))(*(void *)(v62 + 8LL * ((1275 * (v61 == 1565872807)) ^ a1)) - 8LL))();
}

uint64_t sub_1001DAA7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, int a50,unsigned int a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  int v69 = (v66 + 1016073450 + (a51 - 70) - ((2 * (a51 + 186)) & 0xBC)) ^ 0x3C90125E;
  int v70 = *(&a66 + (((914 * v69) & 0x77DFE) + ((457 * v69) ^ 0x7FDBBEFFu) - 2144844479) % 0x708) ^ 0xCF;
  int v71 = *(_DWORD *)(v67 + 4LL * ((1361 * (((2 * v70) & 0x1CC) + (v70 ^ 0xFF6FBAE6)) - 15548561) % 0x12E0));
  HIDWORD(v72) = v71 ^ 0x718A365;
  LODWORD(v72) = v71 ^ 0x48000000;
  unsigned int v73 = (v72 >> 27) - ((2 * (v72 >> 27)) & 0x2DFD33F2) - 1761699335;
  unsigned int v74 = (((v73 >> 8) & 0xE1) + ((v73 >> 8) & 0x1E ^ 0xE4CB9703) - 1) ^ 0xEFEB1B4F;
  int v75 = ((HIWORD(v73) & 0x43) + 1476460543 + (HIWORD(v73) & 0xBC ^ 0x21D08599)) ^ 0x79D18599;
  int v76 = ((v72 >> 27) - ((2 * (v72 >> 27)) & 0xF2) - 7) ^ 0x92;
  unsigned int v77 = ((v76 - ((2 * v76) & 0x114) - 1776674934) & 0x8208117C ^ 0x28418070)
      + ((v76 - ((2 * v76) & 0x114) - 1776674934) ^ 0xD63E178F)
      - (((v76 - ((2 * v76) & 0x114) - 1776674934) ^ 0xD63E178F) & 0x20117C);
  int v78 = (v74 - ((2 * v74) & 0x601152C) + 1195936406) ^ 0x4C6806B4;
  int v79 = HIBYTE(v73) ^ 0xF1;
  uint64_t v80 = (457 * v79) ^ 0x7E36BB7Fu;
  unsigned int v81 = (((2 * ((2 * v73) & 0x80)) ^ 0x100) & 0xFFFFFF7F | (((v73 >> 6) & 1) << 7)) + (v77 ^ 0xEA4D90EC) - 128;
  int v82 = *(&a66 + (((914 * v79) & 0x176FE) + v80 - 2117369919) % 0x708) ^ 0x90;
  int v83 = *(&a66 + (((914 * v75) & 0x1F796E) + ((457 * v75) ^ 0xEFFFBCB7) + 268598921) % 0x708) ^ 0x90;
  int v84 = (((v82 - ((2 * v82) & 0x18A)) << 16) + 1304756224) ^ 0x4DC50000;
  unsigned int v85 = (((v83 - ((2 * v83) & 0x1E8)) << 8) - 1942490112) ^ 0x8C37F400;
  int v86 = *(&a66 + (((914 * v78) & 0x7FFB76A6) + ((457 * v78) ^ 0xBFFDBB53) + 1074036717) % 0x708);
  unsigned int v87 = (v85 + 1864061120 - ((2 * v85) & 0x5E36A000)) ^ 0x6F1B50C0 | (v84 - 2120525093 - ((2 * v84) & 0x3360000)) ^ 0x819B5ADB;
  unsigned int v88 = (v87 - 1539934214 - ((2 * v87) & 0x486CEFF4)) ^ 0xA43677FA | ((v86 ^ 0x90) + 1884049702 - ((2 * v86) & 0x4C)) ^ 0x704C5126;
  int v89 = (((v88 - ((2 * v88) & 0xFCB43C)) << 8) + 2119835136) ^ 0x7E5A1E00;
  int v90 = *(&a66 + (457 * (((2 * v81) & 0xFDFFFCBA) + (v81 ^ 0xFEFFFE5D)) - 922555397) % 0x708) ^ 0x90;
  unsigned int v91 = (v89 + 940077525 - ((2 * v89) & 0x7010E200)) ^ 0x380871D5 | (v90 - 1126312262 - ((2 * v90) & 0x174)) ^ 0xBCDDD6BA;
  *((_DWORD *)&STACK[0x8D0] + (97 * a51 - 496012422) % 0x55C) = a63 ^ (v91 - ((2 * v91) & 0x468174D8) + 591444588) ^ 0x57564BF;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 + 8LL * ((830 * (a51 == 1953346373)) ^ v66)) - 8LL))( 940077525LL,  2174442203LL,  1864061120LL,  v80,  3221076819LL,  a51,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42);
}

uint64_t sub_1001DAF7C@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * v61 - 0x657CD3A7CA8B1A92LL) = *(_DWORD *)(v60
                                                                 + 4LL
                                                                 * ((_DWORD)v61 * v58
                                                                  - 1628324338
                                                                  - ((((v61 * v58
                                                                                                  - 1628324338)
  return ((uint64_t (*)(void))(*(void *)(v62 + 8LL * ((119 * (v61 != 1876463665)) ^ a1)) - 8LL))();
}

uint64_t sub_1001DAFE8@<X0>( uint64_t a1@<X7>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, unsigned int a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,int a52,int a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  unsigned int v62 = ((a45 - 39) - 1963628562 - ((2 * (a45 + 217)) & 0x1DC)) ^ 0x8AF567EE;
  int v63 = *(&a60
                         + (((914 * v62) & 0xFDF97C)
                          + ((v62 * ((a2 + 697544750) & 0xD66C4FFE ^ 0x7A3)) ^ 0x9BFEFCBE)
                          + 1678051202)
                         % 0x708);
  unsigned int v64 = (*(_DWORD *)(v60 + 4LL * ((1361 * (((2 * v63) & 0x172) + (v63 ^ 0xFD7D7DB9)) + 1479518263) % 0x12E0)) ^ 0x4F18A365)
      + (((((v63 ^ 0x90) - ((2 * (_BYTE)v63) & 0x16) + 538669323) ^ 0xC57D60A8) + 1) ^ 0x4FF7FEBD)
      + ((2 * ((((v63 ^ 0x90) - ((2 * (_BYTE)v63) & 0x16) + 538669323) ^ 0xC57D60A8) + 1)) & 0x9FEFFD7A)
      - 1341652669;
  unsigned int v65 = v64 - ((2 * v64) & 0xE1EEEFA4) + 1895266258;
  unsigned int v66 = ((v65 >> 8) & 0x88) + (BYTE1(v65) ^ 0xFFFFFF8C) + (BYTE1(v65) | 0x90C62377) + 1;
  unsigned int v67 = (-801315683 - (BYTE2(v65) ^ 0x57 | 0xD03CE49D) + (BYTE2(v65) ^ 0x57 | 0x2FC31B62)) ^ 0x2FCB0A43;
  unsigned int v68 = (v66 & 0x226A1CB6 ^ 0x222A1C80) + (v66 ^ 0xD0C40377) - ((v66 ^ 0xD0C40377) & 0x226A1CB6);
  unsigned int v69 = (v67 - ((2 * v67) & 0x1B4C633C) - 1918488162) ^ 0x8DAE201E;
  int v70 = v65 ^ 0x33;
  int v71 = *(&a60
                         + (((914 * (HIBYTE(v65) ^ 0x30)) & 0x3D5D2)
                          + ((457 * (HIBYTE(v65) ^ 0x30)) ^ 0x3EF5EAE9)
                          - 1056157609)
                         % 0x708u) ^ 0x90;
  int v72 = *(&a60 + (((914 * v69) & 0xBBDE7CD4) + ((457 * v69) ^ 0xDDEF3E6A) + 571669718) % 0x708) ^ 0x90;
  uint64_t v73 = (97 * a45 + 2002617913) % 0x55C;
  unsigned int v74 = (((v71 - ((2 * v71) & 0x152)) << 16) - 139919360) ^ 0xF7A90000;
  unsigned int v75 = (((v72 - ((2 * v72) & 0x122)) << 8) - 992571136) ^ 0xC4D69100;
  int v76 = (v74 + 747361742 - ((2 * v74) & 0x59160000)) ^ 0x2C8BD5CE | (v75 + 640077915 - ((2 * v75) & 0x4C4DA000)) ^ 0x2626D05B;
  int v77 = *(&a60
                         + (((914 * (v68 ^ 0x62683CBA)) & 0x7B8D75EC)
                          + ((457 * (v68 ^ 0x62683CBA)) ^ 0xBDC6BAF6)
                          + 1111195722)
                         % 0x708) ^ 0x90;
  uint64_t v78 = (2 * v77) & 0x17C;
  int v79 = (v76 + 983664348 - ((2 * v76) & 0x75430DB8)) ^ 0x3AA186DC | (v77 + 1161260478 - v78) ^ 0x45376DBE;
  int v80 = *(&a60 + (((914 * v70) & 0x2F3FE) + ((457 * v70) ^ 0x5FFB79FFu) - 1610170047) % 0x708);
  unsigned int v81 = (((v79 - ((2 * v79) & 0xC68C14)) << 8) - 481949184) ^ 0xE3460A00;
  unsigned int v82 = (v81 - 871606933 - ((2 * v81) & 0x9818AA00)) ^ 0xCC0C556B | ((v80 ^ 0x90) + 319543587 - ((2 * v80) & 0x46)) ^ 0x130BD923;
  *((_DWORD *)&STACK[0x8D0] + v73) = a53 ^ (v82 - 1518244982 + (~(2 * v82) | 0xB4FD28ED)) ^ 0x44483428;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 + 8LL * ((375 * (a45 == 776358950)) ^ a2)) - 8LL))( v78,  v73,  1161260478LL,  983664348LL,  640077915LL,  3183917814LL,  a45,  a1,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36);
}

uint64_t sub_1001DB508( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v66 - 0x657CD3A7FA7AB9B2LL) = *(_DWORD *)(v65
                                                                 + 4LL
                                                                 * ((v64 ^ 0x1483DE2C)
                                                                  + (_DWORD)v66 * v67
                                                                  - (((((v64 ^ 0x1483DE2Cu)
                                                                                    + (_DWORD)v66 * v67)
  return (*(uint64_t (**)(void))(v70 + 8LL * ((227 * (v66 == 2077518585)) ^ v64)))();
}

uint64_t sub_1001DB57C@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, int a44, int a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  unsigned int v62 = ((a45 + 124) - 415974856 - 2 * ((a45 + 124) & ((a1 + 8) ^ 0xED) ^ a45 & 2)) ^ 0xE734BA38;
  unsigned int v63 = (((914 * v62) & 0x7FFFFFE8) + ((457 * v62) ^ 0xBFFFFFF4) + 1074005068) % 0x708;
  unsigned int v64 = *(_DWORD *)(v60
                  + 4LL
                  * ((1361
                    * (2 * ((*(&a60 + v63) ^ 1) & 0x7F) + (*(&a60 + v63) ^ 0xDEF6FF7E))
                    - 1590027388)
                   % 0x12E0));
  int v65 = (v64 ^ 0x70) - ((2 * (v64 ^ 0x70)) & 0x50) - 1881097688;
  unsigned int v66 = (((v64 >> 8) & 0x54 ^ 0x9ACD4305) + ((v64 >> 8) & 0xAB) - 1) ^ 0xDBCF5552;
  int v67 = v66 - ((2 * v66) & 0x20421E4) + 961720562;
  unsigned int v68 = ((2 * (BYTE2(v64) ^ 0x4F)) | 0xA14702E0) - (BYTE2(v64) ^ 0x4F);
  unsigned int v69 = ((v68 - 1352892784) & 0x946112DD ^ 0x9040100C)
      + ((v68 - 1352892784) ^ 0x4CAB83F3)
      - (((v68 - 1352892784) ^ 0x4CAB83F3) & 0x946112DD);
  unsigned int v70 = (((914 * (HIBYTE(v64) ^ 0xE5)) & 0x1F77E) + ((457 * (HIBYTE(v64) ^ 0xE5)) ^ 0x6BFAFBBF) - 1811464319) % 0x708u;
  unsigned int v71 = 97 * a45 + 1837199264;
  unsigned int v72 = ((v65 & 0x814002FD ^ 0x301A049D) + (v65 ^ 0xCF61BB62) - ((v65 ^ 0xCF61BB62) & 0x400102FD)) ^ 0xB1DA0769;
  uint64_t v73 = (914 * (v67 ^ 0x7850A6BA)) & 0x468FFBFE;
  int v74 = (457 * v72) ^ 0x6FFBDFE7;
  v69 ^= 0x886910D9;
  unsigned int v75 = (457 * v69) ^ 0xCECDFD7D;
  uint64_t v76 = (914 * v69) & 0x9D9BFAFA;
  unsigned int v77 = (914 * v72) & 0xDFF7BFCE;
  uint64_t v78 = v73 + ((457 * (v67 ^ 0x7850A6BA)) ^ 0x2347FDFF) - 591774399;
  uint64_t v79 = (v76 + v75 + 825507267) % 0x708;
  unsigned int v80 = (v77 + v74 - 1878631591) % 0x708;
  unsigned int v81 = ((v71 % 0x55C) ^ 0xF66BB77F) + 1574928272 + ((2 * (v71 % 0x55C)) & 0xEFE);
  if (v71 >= 0xFFFFFAA4) {
    unsigned int v81 = 97 * a45 - 1043551221;
  }
  int v82 = (*(&a60 + v70) ^ 0x90) - ((2 * (*(&a60 + v70) ^ 0x90)) & 0x2C);
  int v83 = *(&a60 + v79) ^ 0x90;
  unsigned int v84 = (((v83 + 13209841 - ((2 * v83) & 0x1A4)) << 8) - 7936) ^ 0xC990D200;
  unsigned int v85 = (v84 - 1789769201 - ((2 * v84) & 0x2AA49400)) ^ 0x95524A0F | ((((v82 << 16) - 2095710208) ^ 0x83160000)
                                                                    + 1439375230
                                                                    - ((2 * (((v82 << 16) - 2095710208) ^ 0x83160000)) & 0x2B960000)) ^ 0x55CB1F7E;
  int v86 = *(&a60 + v78 % 0x708) ^ 0x90;
  unsigned int v87 = (v85 + 186938250 + (~(2 * v85) | 0xE9B718EB) + 1) ^ 0xB24738A | (v86 + 1704165329 - ((2 * v86) & 0x1A2)) ^ 0x65937FD1;
  unsigned int v88 = (((v87 - ((2 * v87) & 0x211EE0)) << 8) - 1869647872) ^ 0x908F7000;
  unsigned int v89 = (v88 - 951140680 - ((2 * v88) & 0x8E9D7C00)) ^ 0xC74EBEB8 | ((*(&a60 + v80) ^ 0x90)
                                                                   - 1448433077
                                                                   - ((2 * *(&a60 + v80)) & 0x96)) ^ 0xA9AAAA4B;
  *((_DWORD *)&STACK[0x8D0] + v81 - 1414215439) = a55 ^ (v89 - ((2 * v89) & 0xFCF194E8) - 25638284) ^ 0x17E429E5;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 + 8LL * (((8 * (a45 == 1176566403)) | (16 * (a45 == 1176566403))) ^ a1)) - 12LL))( 1704165329LL,  186938250LL,  1439375230LL,  v79,  v78,  v76,  v73,  3469606269LL,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36);
}

uint64_t sub_1001DBAAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v67 - 0x657CD3A6DD401A8ALL) = *(_DWORD *)(v66
                                                                 + 4LL
  return ((uint64_t (*)(void))(*(void *)(v68 + 8LL * ((964 * (v67 == 881184047)) ^ v64)) - 12LL))();
}

uint64_t sub_1001DBB30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,unsigned int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,int a59,int a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v69 = ((a52 - 118) - 1348050978 - ((2 * (a52 + 138)) & 0x1BC)) ^ 0xAFA65FDE;
  int v70 = *(&a66
                         + (((914 * v69) & 0x19D6ED4)
                          + ((v66 - 521817896) & 0x1F1A4F3E ^ 0xAFCEB440 ^ (457 * v69))
                          + 1345670358)
                         % 0x708);
  unsigned int v71 = 1361 * (((2 * (v70 ^ 0x8D)) & 0xEC) + (v70 ^ 0x2FFFE1FB)) - 790939652;
  unsigned int v72 = ((2 * (v70 ^ 0x48)) & 0xDA) + (v70 ^ 0xC1BFFFB5);
  unsigned int v73 = (v72 - 1960693017 + ((2 * v72 + 19950636) & 0x113F9A0 ^ 0x5DFFFFFF)) ^ *(_DWORD *)(v67 + 4LL * (v71 % 0x12E0));
  int v74 = (BYTE2(v73) ^ 0x11) + (HIWORD(v73) & 7 ^ 0x5CA93F06) - ((BYTE2(v73) ^ 0x11) & 7);
  unsigned int v75 = (((2 * (BYTE1(v73) ^ 0x4001B25E)) | 0x5A9E5FE8) - (BYTE1(v73) ^ 0x4001B25E) + 1387319308) ^ 0xED4E9DFC;
  unsigned int v76 = ((v74 & 0x1409175D ^ 0x80420618) + (v74 ^ 0x553D1967) - ((v74 ^ 0x553D1967) & 0x895175D)) ^ 0x954B3144;
  int v77 = HIBYTE(v73) ^ 0xCB;
  uint64_t v78 = (457 * v77) ^ 0x76DE598Eu;
  uint64_t v79 = (457 * v76) ^ 0xEF7FE77F;
  int v80 = ((v73 ^ 0x11) - ((2 * (v73 ^ 0x11)) & 0xD6) + 1387) ^ 0x5D7;
  uint64_t v81 = (457 * v80) ^ 0x7FFD7EFEu;
  unsigned int v82 = (914 * v80) & 0xFFFAFDFC;
  int v83 = *(&a66 + (((914 * v77) & 0xB31C) + v78 - 1994137166) % 0x708) ^ 0x90;
  int v84 = *(&a66 + (((914 * v76) & 0xDEFFCEFE) + v79 + 276976577) % 0x708);
  unsigned int v85 = (((v83 - ((2 * v83) & 0x76)) << 16) - 499449856) ^ 0xE23B0000;
  int v86 = ((((v84 ^ 0x90) - ((2 * (v84 ^ 0x90)) & 0xB0)) << 8) + 657741824) ^ 0x27345800;
  unsigned int v87 = (v86 - 17054937 - ((2 * v86) & 0x7DF78600)) ^ 0xFEFBC327 | (v85 - 1288110512 - ((2 * v85) & 0x66700000)) ^ 0xB338FE50;
  int v88 = *(&a66 + (v82 + v81 - 2147173310) % 0x708);
  int v89 = *(&a66 + (((914 * v75) & 0x85FFFFFE) + ((457 * v75) ^ 0x42FFFFFF) - 1123927231) % 0x708);
  unsigned int v90 = (v87 + 1500445478 - ((2 * v87) & 0x32DDF64C)) ^ 0x596EFB26 | ((v89 ^ 0x90)
                                                                    - 1225201974
                                                                    - ((2 * (v89 ^ 0x90)) & 0x194)) ^ 0xB6F8E6CA;
  int v91 = (((v90 + 4120034 - ((2 * v90) & 0x7DC78C)) << 8) + 386048) ^ 0x3EE3C600;
  int v92 = (v91 + 414472595 - ((2 * v91) & 0x3168B200)) ^ 0x18B45993 | ((v88 ^ 0x90)
                                                                   + 934279070
                                                                   - ((2 * (v88 ^ 0x90)) & 0x13C)) ^ 0x37AFF79E;
  *((_DWORD *)&STACK[0x8D0] + (97 * a52 - 273316790) % 0x55C) = a58 ^ a59 ^ a60 ^ 0xCE31AFF8 ^ (v92
                                                                                              - ((2 * v92) & 0x29BA6528)
                                                                                              - 1797442924);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 + 8LL * ((57 * (a52 == 755544181)) ^ v66)) - 12LL))( 3006856784LL,  v79,  v81,  v78,  3741306622LL,  a52,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43);
}

uint64_t sub_1001DC024@<X0>( unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *(_DWORD *)(*a57 + 4 * v61 - 0x657CD3A6DC130A1ELL) = *(_DWORD *)(v60
                                                                 + 4LL
                                                                 * ((_DWORD)v61 * v57
                                                                  + 902859531
                                                                  - ((((v61 * v57 + 902859531)
  BOOL v63 = ((409 * (a1 ^ 0x328)) ^ 0x333LL) + v61 == 876252693;
  return ((uint64_t (*)(void))(*(void *)(v62 + 8LL * (((8 * v63) | (16 * v63)) ^ a1)) - 12LL))();
}

uint64_t sub_1001DC0A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,int a52,unsigned int a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,int a62,int a63)
{
  unsigned int v71 = (((v68 - 736) | 0x6A8) - 1868918430 + (a53 + 62) - 2 * ((a53 + 62) & 0x5D ^ a53 & 1)) ^ 0x909A985C;
  int v72 = *(&a68 + (((914 * v71) & 0x1DA8F7FC) + ((457 * v71) ^ 0xCED47BFE) + 825198658) % 0x708);
  unsigned int v73 = (((v72 ^ 0x90) - ((2 * v72) & 0xDA) + 812372077) ^ 0xDF7D61DE)
      + (*(_DWORD *)(v69
                   + 4LL * ((1361 * (((2 * (v72 ^ 0xFFFFFFC7)) & 0x1B6) + (v72 ^ 0xDF6EBE38)) + 611947258) % 0x12E0)) ^ 0x4F18A365);
  unsigned int v74 = v73 - ((2 * v73) & 0x8BEF621E) - 973623025;
  unsigned int v75 = ((BYTE1(v74) ^ 0xDC) + ((v74 >> 8) & 0x1A ^ 0x9C23D002) - ((BYTE1(v74) ^ 0xDC) & 0x1A)) ^ 0xDD31D12F;
  int v76 = (((2 * (BYTE2(v74) ^ 0x38)) & 0x12) - (BYTE2(v74) ^ 0x38) + 758) ^ 0x228;
  unsigned int v77 = (-950994524 - (v75 | 0xC750F9A4) + (v75 | 0x38AF065B)) ^ 0x79BD0759;
  unsigned int v78 = ((914 * (HIBYTE(v74) ^ 0xBE)) & 0x3F2FE) + ((457 * (HIBYTE(v74) ^ 0xBE)) ^ 0xFBCDF97F) + 70533569;
  int v79 = v74 ^ 0x57;
  unsigned int v80 = (457 * v79) ^ 0xFF7D17F3;
  int v81 = 914 * v79;
  unsigned int v82 = (((914 * v77) & 0xB5BDF6F6) + ((457 * v77) ^ 0xDADEFB7B) + 623067077) % 0x708;
  int v83 = *(&a68 + v78 % 0x708) ^ 0x90;
  int v84 = *(&a68 + (((914 * v76) & 0x6F7F6) + ((457 * v76) ^ 0x19337BFBu) - 422658235) % 0x708) ^ 0x90;
  int v85 = (((v83 - ((2 * v83) & 0x70)) << 16) + 1329070080) ^ 0x4F380000;
  unsigned int v86 = (((v84 - ((2 * v84) & 0x1B2)) << 8) - 207824640) ^ 0xF39CD900;
  unsigned int v87 = (v86 - 930946538 - ((2 * v86) & 0x1105C400)) ^ 0xC882E216 | (v85 + 1502600281 - ((2 * v85) & 0x331E0000)) ^ 0x598FDC59;
  unsigned int v88 = (v87 + 2047389843 - ((2 * v87) & 0xF4116126)) ^ 0x7A08B093 | ((*(&a68 + v82) ^ 0x90)
                                                                    - 841086101
                                                                    - ((2 * *(&a68 + v82)) & 0xD6)) ^ 0xCDDE0B6B;
  int v89 = (((v88 - ((2 * v88) & 0x2D5E64)) << 8) + 380580352) ^ 0x16AF3200;
  int v90 = *(&a68 + ((v81 & 0x22FE6) + v80 + 8725325) % 0x708) ^ 0x90;
  unsigned int v91 = (v89 - 1952092211 - ((2 * v89) & 0x174ADE00)) ^ 0x8BA56FCD | (v90 + 1577407487 - 2 * v90) ^ 0x5E0553FF;
  *((_DWORD *)&STACK[0x8D0] + (97 * a53 + 1613214078) % 0x55C) = a65 ^ a63 ^ a62 ^ 0x5BFF1086 ^ (v91
                                                                                               - ((2 * v91) & 0xE59B1F08)
                                                                                               + 1926074244);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v70 + 8LL * ((1341 * (a53 == 470427329)) ^ v68)) - 12LL))( 1577407487LL,  3453881195LL,  2047389843LL,  3364020758LL,  1502600281LL,  258814LL,  a53,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44);
}

uint64_t sub_1001DC544@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  int v63 = v61 - ((2 * v61 + 175428742) & 0x7AB9955C) - 1030277903;
  *(_DWORD *)(*a57
            + 4
            * ((v63 ^ ((a1 ^ 0xDC1F4AE4) + 1631420048) ^ 0x32AF5FBE3FF5FD67LL)
             + ((2 * (v63 ^ ((a1 ^ 0xDC1F4AE4) + 1631420048))) & 0x7FEBFACE))
            - 0x303A529F0B010836LL) = *(_DWORD *)(v60
                                                + 4LL
                                                * (v61 * v57
                                                 + 2065639343
                                                 - ((((v61 * v57 + 2065639343)
  int v64 = ((2 * v63) ^ 0x7AB9955C) - ((2 * ((2 * v63) ^ 0x7AB9955C)) & 0x361EF13C) - 1693484897;
  unsigned int v65 = (v63 ^ 0xC2A33D63) + (v64 & 0xFFFFEF9A ^ 0xFCF0F645) + ((2 * v64) & 0xCFFF1D34 ^ 0x61E1134) - 1744805599;
  return ((uint64_t (*)(void))(*(void *)(v62
                                        + 8LL
                                        * ((467 * (((2 * v65) & 0xFFEF7BEE) + (v65 ^ 0xFFF7BDF7) + 541193 < 0x100)) ^ a1))
                            - 4LL))();
}

uint64_t sub_1001DC6AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, int a33, int a34)
{
  int v35 = v34 + 601929759;
  unsigned int v36 = ((LOBYTE(STACK[0x378]) ^ 0x90) - 1173925125 - ((2 * (LOBYTE(STACK[0x378]) ^ 0x90)) & 0xFFFFFFF7)) ^ 0xBA0752FB | (((a34 + 1216724507) & 0xFFFFFF00) - ((2 * (a34 + 1216724507)) & 0xB0170000) + (v35 ^ 0xD80B84BD)) ^ 0xD80B8080;
  LODWORD(STACK[0x8D0]) = v36 + 165093223 - ((2 * v36) & 0x13AE3ECE);
  return ((uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))((char *)*(&off_10025C670 + (v35 ^ 0x7A))
                                                                                - 4))( 1372LL,  &STACK[0x8D0],  122LL,  1902203041LL);
}

void sub_1001DC8F0()
{
}

uint64_t sub_1001DC8F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * a4 - 0x657CD3A7D0AE304ELL) = *((_DWORD *)&STACK[0x8D0]
                                                      + (((v64 - 942104578) & 0x38275FFF ^ 0x45A) * a4
                                                       + 169898751)
                                                      % 0x55C);
  return ((uint64_t (*)(void))(*(void *)(a7 + 8LL * ((389 * (a4 == 1902203296)) ^ v64)) - 4LL))();
}

uint64_t sub_1001DC994( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, int a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v68 = *(&a66
                         + (((914 * ((-1526205693 - ((1478248148 << (v66 ^ 0x3A)) & 6)) ^ 0xA507F303)) & 0x747FFE)
                          + ((457 * ((-1526205693 - ((1478248148 << (v66 ^ 0x3A)) & 6)) ^ 0xA507F303)) ^ 0x69FA3FFF)
                          - 1777744831)
                         % 0x708);
  HIDWORD(v70) = v69 ^ 0x33;
  LODWORD(v70) = ~v69 << 24;
  int v71 = (v70 >> 31) - ((2 * (v70 >> 31)) & 0xFFFFFFBA) + 93;
  int v72 = v71 ^ (((v70 >> 31) - ((2 * (v70 >> 31)) & 0xBA) + 93) >> 4) ^ ((v71 >> 6) | 0xA8) ^ 0xF1;
  unsigned int v73 = (v72 + 100774127 - ((2 * v72) & 0x1DE)) ^ 0x601B0EF | ((a35 & 0x361CB600 ^ 0x4102027)
                                                                              + (a35 & 0xC9E34900 ^ 0x49030019)
                                                                              - 2) ^ 0xB481943E;
  *uint64_t v67 = (v73 + 1392197632 - ((2 * v73) & 0xA5F69C5E) + 3631) ^ 0x5B2C51FD;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*(&off_10025C670 + v66))( 2768761603LL,  4294967226LL,  100774127LL);
}

void sub_1001DCBB8()
{
}

uint64_t sub_1001DCBC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v65 - 0x657CD3A6EE9B72BALL) = *((_DWORD *)&STACK[0x8D0]
                                                       + (97 * (int)v65 + 1952826692) % (v64 + 1023));
  return (*(uint64_t (**)(void))(v66 + 8LL * ((1520 * (v65 != 953984315)) ^ v64)))();
}

uint64_t sub_1001DCC34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(&a65 + (457 * v65 + 160014708) % 0x708u) = *(&a65
                                               + (457
                                                * (((2
                                                   * (*(&a65 + (457 * v65 + 160014708) % 0x708u) ^ 0x80)) & 0x1D2)
                                                 + (*(&a65 + (457 * v65 + 160014708) % 0x708u) ^ 0x6F5FBD79u))
                                                + 773898071)
                                               % 0x708);
  int v68 = *(uint64_t (**)(void))(v67 + 8LL * ((v65 != 206410603) | v66));
  *(&a65 + (457 * v65 + 160135356) % 0x708u) = *(&a65
                                               + (457
                                                * (((2
                                                   * (*(&a65 + (457 * v65 + 160135356) % 0x708u) ^ 0x80)) & 0x1CA)
                                                 + (*(&a65 + (457 * v65 + 160135356) % 0x708u) ^ 0x7DFE6F75u))
                                                + 348945267)
                                               % 0x708);
  return v68();
}

uint64_t sub_1001DCD20@<X0>(int a1@<W8>)
{
  *(_BYTE *)(v5
           + v1 * a1
           + 213021379
           - ((((v1 * a1 + 213021379) * (unint64_t)v2) >> 32) >> 10) * v4) = *(_BYTE *)(v5 + v1 * a1 + 213259019 - ((((v1 * a1 + 213259019) * (unint64_t)v2) >> 32) >> 10) * v4);
  return (*(uint64_t (**)(void))(v6 + 8LL * ((975 * (((207 * (v3 ^ 0x15F)) ^ 0x26C) + v1 == 1465650197)) ^ v3)))();
}

uint64_t sub_1001DCDA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v67 = ((LOBYTE(STACK[0x378]) ^ 0x90) - 1489802038 - ((2 * (LOBYTE(STACK[0x378]) ^ 0x90)) & 0x194)) ^ 0xA7336CCA | (((785963591 - a34) & 0xFFFFFF00) - ((2 * (785963591 - a34)) & 0x871AB400) + 1133337107) ^ 0x438D5A13;
  *((_DWORD *)&STACK[0x8D0] + (1406601116 * (v65 - 524) + 998645220) % 0x55Cu) = v67
                                                                               + 165093223
                                                                               - ((2 * v67) & 0x13AE3ECE);
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 8LL * v65))( 2443359173LL,  1800LL,  &a65,  144LL,  404LL,  998645220LL,  3205573259LL,  1372LL);
}

void sub_1001DCECC()
{
}

uint64_t sub_1001DCED4@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  int v60 = *((_DWORD *)&STACK[0x8D0] + (((v57 + 712809799) & 0xD5835DFD ^ 0x1FD) * v58 + 353603918) % 0x55C);
  HIDWORD(v61) = v58 + 57609538;
  LODWORD(v61) = v58 - 881914558;
  int v62 = a1 + (v61 >> 27) - ((2 * (v61 >> 27)) & 0xC0A7A05E) + 15;
  HIDWORD(v61) = v62 ^ 0xF;
  LODWORD(v61) = v62 ^ a1;
  int v63 = ((2 * (v61 >> 5)) & 0xA7DDDDA6) + ((v61 >> 5) ^ 0x53EEEED3);
  *(_DWORD *)(((4LL * (v63 - 1346380417)) | ((unint64_t)((v63 - 1346380417) < 0x3AECC52) << 34))
            + *a57
            - 0x657CD3A619E443E2LL) = v60;
  return (*(uint64_t (**)(void))(v59 + 8LL * ((50 * ((v63 - 1408167942) < 0x100)) ^ v57)))();
}

uint64_t sub_1001DCFF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, int a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v68 = v66 ^ 0x14;
  unsigned int v69 = ((LOBYTE(STACK[0x370]) ^ 0x90) - 2102334395 - ((2 * LOBYTE(STACK[0x370])) & 0x8A)) ^ 0x82B0EC45 | ((a35 & 0xFFFFFF00 ^ 0x881F7F00 | 0xA14CA8E4) - (a35 & 0xFFFFFF00 ^ 0x881F7F00 | 0x5EB3571B) + 1588811547) ^ v68 ^ 0xCAA8156C;
  *int v65 = v69 + 165093223 - ((2 * v69) & 0x13AE3ECE);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))(v67
                                                                                                 + 8LL * (v68 ^ 0x14)))( 2574305985LL,  1679083369LL,  2443359173LL,  1800LL,  &a65,  144LL,  138LL);
}

void sub_1001DD118()
{
}

uint64_t sub_1001DD120( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(*a64 + 4 * v66 - 0x657CD3A7188A51A6LL) = *((_DWORD *)&STACK[0x8D0]
                                                       + (97 * (int)v66 + 2072522601) % ((v65 + 284) ^ 0x7F8u));
  return (*(uint64_t (**)(void))(v67 + 8LL * ((1957 * (v66 + 1 == v64 + 256)) ^ v65)))();
}

uint64_t sub_1001DD18C@<X0>( __int16 a1@<W8>, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57)
{
  *a3 = 1461298233;
  int v61 = v58 ^ 0x480;
  unsigned int v62 = (((4424 * ((v61 - 896) ^ 0x24E)) & 0xDFF3FFF8) + ((2212 * ((v61 - 896) ^ 0x24E)) ^ 0xEFF9FFFE) + 272239578)
      % 0x97F;
  *(_DWORD *)(v57
            + 4LL
            * ((unsigned __int16)((((2 * ~*(unsigned __int8 *)(v60 + v62)) & 0x7C)
                                 + (*(unsigned __int8 *)(v60 + v62) ^ 0xFB81))
                                * a1
                                + 16174)
             % 0x55Cu)) = *(_DWORD *)(*a57 - 0x657CD3A60B29129ALL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v59
                                                     + 8LL
                                                     * ((106 * ((v61 + 1227028743) > 0x4922FE2C)) ^ v61)))( 198376LL,  2062123892LL);
}

void sub_1001DD370()
{
}

uint64_t sub_1001DD378@<X0>( int a1@<W0>, int a2@<W1>, int a3@<W3>, int a4@<W4>, unsigned int a5@<W5>, uint64_t a6@<X6>, int a7@<W7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,int a62,int a63)
{
  int v75 = (((a63 + v71 + 106) & ((v73 + 558) ^ a4)) + v68 - (a61 & a3)) ^ v68;
  unsigned int v76 = ((v75 * v67) & a1) + ((v75 * a8) ^ a2) + v72;
  int v77 = *(_DWORD *)(v66 + 4LL * (v76 - (((v76 * (unint64_t)a5) >> 32) >> 10) * v70));
  if (__CFADD__(a63, v71)) {
    unint64_t v78 = v74;
  }
  else {
    unint64_t v78 = 0LL;
  }
  *(_DWORD *)(*a66 + 4 * ((a63 + v71) | v78) + a6) = v77;
  unsigned int v79 = v69 + a63 + 2;
  BOOL v81 = v79 > v69 && a65 - 1136187326 > v79;
  return ((uint64_t (*)(void))((char *)*(&off_10025C670 + ((v81 * a7) ^ (v73 + 273))) - 8))();
}

void sub_1001DD42C()
{
}

uint64_t sub_1001DD438( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  return (*(uint64_t (**)(void))(v64 + 8LL * ((726 * ((((v63 - 690) | 0x84) ^ 0x95DD56D5) + a63 > 0x2FC69580)) ^ v63)))();
}

void sub_1001DD480()
{
}

uint64_t sub_1001DD4A8(uint64_t result)
{
  uint64_t v1 = 1856021207 * ((((2 * result) | 0x4840409B3328D17ELL) - result + 0x5BDFDFB2666B9741LL) ^ 0x4934B7D6D7FDBE41LL);
  int v2 = *(_DWORD *)(result + 12) - v1;
  unint64_t v3 = *(void *)(result + 24) ^ v1;
  unint64_t v4 = *(void *)(result + 16) + v1;
  int v5 = *(_DWORD *)(result + 36) ^ v1;
  int v6 = *(_DWORD *)(result + 4) ^ v1;
  int v7 = *(_DWORD *)(result + 8) ^ v1;
  BOOL v8 = v4 == v3;
  BOOL v9 = v4 > v3;
  int v10 = v8;
  if ((v5 & 1) == 0) {
    BOOL v9 = v10;
  }
  if (!v9) {
    int v2 = v6;
  }
  *(_DWORD *)result = v7 ^ v2;
  return result;
}

uint64_t TcswZQtsc8hw(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = &loc_10018B840;
  v4[1] = a1;
  v4[2] = a2;
  v4[3] = a3;
  unsigned int v5 = (230600693 * ((&vars0 + 1575738355 - 2 * ((&vars0 - 32) & 0x5DEBDC13)) ^ 0x8FD75A38)) ^ 0x54F58F50;
  int v6 = v4;
  sub_10018B614((uint64_t)&v5);
  return v7;
}

void sub_1001DD5F8(uint64_t a1)
{
  __asm { BR              X13 }

void sub_1001DD6B4(uint64_t a1@<X8>)
{
  unsigned int v6 = ((v7 & 0xBE9DF940 | ~(v7 | 0xBE9DF940)) ^ 0x52F8FAFC) * v1;
  memset(v7, 0, sizeof(v7));
  uint64_t v8 = v2;
  __int128 v9 = 0u;
  unsigned int v11 = v6 ^ 0xF60457FA;
  int v12 = (v3 + v4) ^ v6;
  uint64_t v13 = a1;
  sub_1000AF120((uint64_t)v7);
  *unsigned int v5 = v10;
}

void sub_1001DD7B4(void *a1)
{
  if (a1[4]) {
    BOOL v1 = a1[1] == 0LL;
  }
  else {
    BOOL v1 = 1;
  }
  int v3 = !v1 && a1[2] != 0LL;
  __asm { BR              X12 }

void sub_1001DD85C(uint64_t a1@<X8>)
{
  uint64_t v14 = 0x40AF9B25784C106DLL;
  v7[0] = 0LL;
  v7[1] = &v6;
  uint64_t v9 = v2;
  uint64_t v10 = 0LL;
  unsigned int v5 = 562267567
     * (((v7 ^ 0x5A23AF60 | 0xAF18922F)
  v7[3] = 0LL;
  uint64_t v8 = v1;
  unsigned int v12 = v5 ^ 0x9B9D4101;
  int v13 = (v3 + 543) ^ v5;
  v7[2] = a1;
  sub_1000AF120((uint64_t)v7);
  *(_DWORD *)(v4 + 4) = v11;
}

void sub_1001DD928(_DWORD *a1)
{
  unsigned int v1 = 230600693 * (a1 ^ 0xD23C862B);
  int v2 = *a1 ^ v1;
  int v3 = (char *)*(&off_10025C670
               + ((14
                 * (((malloc( ((a1[7] + v1 - 502926590) & 0xFFFFFFF0 ^ 0x5F3FFFED)
                      + ((2 * (a1[7] + v1 - 502926590)) & 0xBE7FFFC0)
  __asm { BR              X9 }

uint64_t sub_1001DD9F8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((135 * (v1 + 1317161423 == (((a1 | 0x204) + 3) | 1) + 1820087484)) ^ (a1 | 0x204))))();
}

uint64_t sub_1001DDA6C@<X0>(int a1@<W8>)
{
  BOOL v12 = v7 < v6;
  uint64_t v13 = (v1 + a1);
  *(_BYTE *)(v10 + v13) = *(_BYTE *)(v2 + (v13 & 0xF)) ^ *(_BYTE *)(*(void *)(v9 + 16) + v13) ^ *(_BYTE *)(v3 + (v13 & 0xF)) ^ (-39 * ((v1 + a1) & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + v4 + 2);
  if (v12 == v1 + 118821484 < v6) {
    LOBYTE(v12) = v1 + 118821484 < v7;
  }
  return (*(uint64_t (**)(void))(v11 + 8LL * (((((v5 + 4) ^ v12) & 1) * v8) ^ v5)))();
}

uint64_t sub_1001DDAF8@<X0>(int a1@<W8>)
{
  *(_BYTE *)(v7 + (v1 + a1)) = *(_BYTE *)(v2 + ((v1 + a1) & 0xFLL)) ^ *(_BYTE *)(v3 + ((v1 + a1) & 0xFLL)) ^ (-39 * ((v1 + a1) & 0xF)) ^ *(_BYTE *)(v4 + ((v1 + a1) & 0xFLL) + ((v5 - 1324742450) & 0x4EF5F7BF ^ 0x29DLL)) ^ 0x80;
  BOOL v9 = v1 + 396607366 < (v6 + 499844106);
  return ((uint64_t (*)(void))(*(void *)(v8 + 8LL * ((14 * !v9) | v5)) - 8LL))();
}

uint64_t sub_1001DDBAC@<X0>(unsigned int a1@<W0>, int a2@<W8>)
{
  BOOL v12 = a1 < v7;
  int v13 = v2 + 1;
  *(_BYTE *)(v10 + (v13 + a2)) = *(_BYTE *)(v4 + ((v13 + a2) & 0xFLL)) ^ *(_BYTE *)(v3
                                                                                                + ((v13 + a2) & 0xFLL)) ^ *(_BYTE *)((((_BYTE)v13 + (_BYTE)a2) & 0xF) + v5 + 2) ^ (((v13 + a2) & 0xF) * v9);
  if (v12 == v13 + v8 < v7 + 61 * (v6 ^ 0x21A) - 671) {
    BOOL v12 = v13 + v8 < a1;
  }
  return ((uint64_t (*)(void))(*(void *)(v11 + 8LL * ((14 * !v12) | v6)) - 8LL))();
}

uint64_t sub_1001DDC38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v8
                                                                                                  + 8LL * (v5 ^ (93 * (v7 == &unk_100214A15))))
                                                                                      - 4LL))( a1,  a2,  a3,  a4,  a5,  ((v6 << (v5 ^ 0x9E)) & 0xD5D7FBC0) + (v6 ^ 0x6AEBFDEC));
}

uint64_t sub_1001DDC88@<X0>(int a1@<W5>, int a2@<W8>)
{
  unsigned int v6 = (v3 + 1268886816) & 0xB45E517D;
  *(void *)(v5 - 144) = 0xCCB769911B6BC4BCLL;
  *(void *)(v5 - 136) = 0xEBFA5C68B745F81DLL;
  *(void *)(v5 - 128) = 0xCCB769911B6BC4BCLL;
  *(void *)(v5 - 120) = 0xEBFA5C68B745F81DLL;
  int v7 = 14 * (v6 ^ 0x160);
  *(_DWORD *)(v5 - 216) = v7;
  BOOL v9 = ((v2 + (_BYTE)v7 - 18) & 0xF) == 0 && a1 != a2;
  return ((uint64_t (*)(void))(*(void *)(v4 + 8LL * (int)((1106 * v9) ^ v6)) - 4LL))();
}

uint64_t sub_1001DDD2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  *(void *)(v36 - 200) = v34;
  uint64_t v37 = v35[8];
  int v38 = byte_100217C10[v37 ^ 0x17];
  LODWORD(v37) = (v37 ^ 0xFFFFFFD6) + 1;
  LODWORD(v37) = (v37 ^ 0x7C)
               + v38
               + 8 * (v37 >> 2)
  LODWORD(v37) = ((((v37 ^ 0x56) - ((2 * (v37 ^ 0x56)) & 0xFFFFFFFB)) << 24) + 2097152000) ^ 0x7D000000;
  unsigned int v39 = byte_100217C10[v35[12] ^ 0xF0LL] + (((v35[12] ^ 0x31) + 1) ^ 0x79) + ((2 * ((v35[12] ^ 0x31) + 1)) & 0xFFFFFFF3);
  LODWORD(v37) = (v37 - ((2 * v37) & 0x24000000) + 316206945) ^ 0x12D8EF61 | ((byte_100225E70[v35[11] ^ 0xFALL]
                                                                                              + 60)
                                                                            - ((2
                                                                              * (byte_100225E70[v35[11] ^ 0xFALL] + 60)) & 0xD0)
                                                                            - 373248152) ^ 0xE9C0AF68;
  int v40 = v37 - ((2 * v37) & 0x775A33C6) + 1001200099;
  HIDWORD(v41) = byte_100218E50[v35[9] ^ 0xECLL];
  LODWORD(v41) = (HIDWORD(v41) ^ 0x10) << 24;
  LODWORD(v37) = (v39 - ((2 * (_BYTE)v39 + 6) & 0x7C) - 127) ^ 0x4E;
  LODWORD(v37) = ((((_DWORD)v37 - ((2 * (_DWORD)v37) & 0xB2)) << 24) + 1493172224) ^ 0x59000000;
  LODWORD(v37) = (v37 - ((2 * v37) & 0xC7FFFFFF) - 480375683) ^ 0xE35E0C7D | ((byte_100225E70[v35[15] ^ 0xE1LL]
                                                                                              + 60)
                                                                            - ((2
                                                                              * (byte_100225E70[v35[15] ^ 0xE1LL] + 60)) & 0x100)
                                                                            + 1071382144) ^ 0x3FDBFE80;
  int v42 = ((v41 >> 27) - ((2 * (v41 >> 27)) & 0xF0) - 8) ^ 0x62;
  int v43 = ((((~(2 * v42) | 0xFEAB) + v42) << 16) + 1856700416) ^ 0x6EAA0000;
  int v44 = v40 ^ 0x3BAD19E3 | (v43 - ((2 * v43) & 0x2D40000) + 1567233095) ^ 0x5D6A1447;
  unsigned int v45 = v44 - ((2 * v44) & 0xC92D7042);
  unsigned int v46 = byte_100217C10[*v35 ^ 0x70LL] + (*v35 ^ 0xFFFFFFB1) - 68;
  unsigned int v47 = (((2 * v46) & 0xFFFFFFEF)
       + (v46 ^ 0xFFFFFFF7)
       - ((2 * (((2 * v46) & 0xFFFFFFEF) + (v46 ^ 0xFFFFFFF7)) + 20) & 0x86)
       - 51) ^ 0x1E;
  int v48 = (((v47 - ((2 * v47) & 0xFC)) << 24) + 2113929216) ^ 0x7E000000;
  uint64_t v49 = v35[4];
  unsigned int v50 = (v48 - ((2 * v48) & 0x78000000) - 1137880178) ^ 0xBC2D538E | ((byte_100225E70[v35[3] ^ 0xABLL]
                                                                                      + 60)
                                                                    - ((2 * (byte_100225E70[v35[3] ^ 0xABLL] + 60)) & 0xD2)
                                                                    - 963173271) ^ 0xC6972469;
  int v51 = (v49 ^ ((v49 ^ 0x3B) - ((2 * (v49 ^ 0x3B) + 2) & 6) + 20) ^ ((v49 ^ 0x2B)
                                                                                    - ((2 * (v49 ^ 0x2B) + 2) & 0xFFFFFFE7)
                                                                                    + 116) ^ 0xFFFFFFA4)
      + 16;
  unsigned int v52 = byte_100217C10[v49 ^ 0xFA] + (v51 ^ 0xD) - ((2 * v51) & 0xFFFFFFE4) + 1;
  HIDWORD(v41) = byte_100218E50[v35[5] ^ 0x86LL];
  LODWORD(v41) = (HIDWORD(v41) ^ 0x10) << 24;
  unsigned int v53 = ((((((v41 >> 27) + (~(2 * (v41 >> 27)) | 0x73) + 71) ^ 0xD7)
  int v54 = (v52 - ((2 * v52 + 92) & 0x94) + 120) ^ 0x51;
  unsigned int v55 = (((v54 - ((2 * v54) & 0xBC)) << 24) - 570425344) ^ 0xDE000000;
  unsigned int v56 = (v55 - ((2 * v55) & 0xAAAAAAAA) - 716119292) ^ 0xD550E304 | (v53 - ((2 * v53) & 0x4F8E0000) + 1741106588) ^ 0x67C72D9C;
  int v57 = byte_100221830[v35[10] ^ 0x53LL] ^ 0xF;
  int v58 = (((v57 - ((2 * v57) & 0x1A8)) << 8) + 1844761600) ^ 0x6DF4D400;
  unsigned int v59 = (v45 - 459884511) ^ 0xE496B821 | (v58 - ((2 * v58) & 0xFEEBA00) - 940089907) ^ 0xC7F75DCD;
  int v60 = byte_100225E70[v35[7] ^ 0x62LL];
  int v61 = (v60 - 2 * ((v60 + 28) & 0x13 ^ v60 & 1) + 78) ^ 0xE8;
  unsigned int v62 = (v56 - ((2 * v56) & 0x70AA0548) - 1202388316) ^ 0xB85502A4 | (v61
                                                                    - ((2 * v61) & 0xDA)
                                                                    - 952855699) ^ 0xC734936D;
  HIDWORD(v41) = byte_100218E50[v35[13] ^ 0x77LL];
  LODWORD(v41) = (HIDWORD(v41) ^ 0x10) << 24;
  unsigned int v63 = ((((((v41 >> 27) - ((2 * (v41 >> 27)) & 0x64) - 78) ^ 0x15)
  LODWORD(v37) = (v63 - ((2 * v63) & 0x7BC60000) + 1038330183) ^ 0x3DE3A947 | (v37
                                                                             - ((2 * v37) & 0xB9AA749E)
                                                                             + 1557477967) ^ 0x5CD53A4F;
  int v64 = byte_100221830[v35[6] ^ 0xCDLL] ^ 0xD2;
  unsigned int v65 = (((v64 - ((2 * v64) & 0x16C)) << 8) - 1465993728) ^ 0xA89EB600;
  unsigned int v66 = (v62 - ((2 * v62) & 0x160E42BC) + 185016670) ^ 0xB07215E | (v65 - ((2 * v65) & 0x624CF400) - 1322878447) ^ 0xB1267A11;
  int v67 = byte_100221830[v35[2] ^ 0xD4LL] ^ 6;
  int v68 = (((v67 - ((2 * v67) & 0x16)) << 8) + 1931152128) ^ 0x731B0B00;
  int v69 = v35[1];
  unsigned int v70 = ((2 * (v69 ^ 0x55)) & 0xFFFFFFEF) + (v69 ^ 0x77F5F7AA);
  int v71 = (v69 ^ 0x10) - ((2 * v69) & 0x98) + 286421836;
  *(void *)(v36 - 208) = v35;
  uint64_t v72 = v35[14];
  HIDWORD(v41) = byte_100218E50[(v71 ^ (912805451 - v70 - ((1877733512 - 2 * v70) & 0x7CE4AC0E)) ^ 0x753E3397 ^ ((v71 ^ 0xEEED8CB3) - ((2 * (v71 ^ 0xEEED8CB3) + 2) & 0xB4BC2DB8) - 631367971))
                              + 77];
  LODWORD(v41) = (HIDWORD(v41) ^ 0x10) << 24;
  *(_DWORD *)(v36 - 228) = v66 + 1381575640;
  *(_DWORD *)(v36 - 224) = (2 * v66) & 0xA4B257B0;
  unsigned int v73 = (v68 - ((2 * v68) & 0x6FEEFA00) - 134775364) ^ 0xF7F77DBC | (v50 - ((2 * v50) & 0x64154610) - 1307925752) ^ 0xB20AA308;
  unsigned int v74 = ((((((v41 >> 27) - ((2 * (v41 >> 27)) & 0x76) + 59) ^ 0xEF)
  unsigned int v75 = (v74 - ((2 * v74) & 0x1F720000) + 1337584507) ^ 0x4FB9EB7B | (v73 - ((2 * v73) & 0xB18B13E) - 2054399841) ^ 0x858C589F;
  int v76 = byte_100221830[v72 ^ 0x4E] ^ 0xB7;
  unsigned int v77 = (((v76 - ((2 * v76) & 0x196)) << 8) - 609563904) ^ 0xDBAACB00;
  LODWORD(a27) = (v77 - ((2 * v77) & 0x58146A00) - 334875359) ^ 0xEC0A3521;
  LODWORD(v37) = (v37 - ((2 * v37) & 0x26137436) - 1828079077) ^ 0x9309BA1B | a27;
  LODWORD(v37) = v37 - ((2 * v37) & 0xC69FE56C) + 1666183862;
  int v78 = ((2 * v37) ^ 0xDDB840F4) - ((2 * ((2 * v37) ^ 0xDDB840F4)) & 0xFBED564) + 668953267;
  *(_DWORD *)(v36 - 240) = (2 * v75) & 0xC3B76370;
  *(_DWORD *)(v36 - 248) = v75 - 505695816;
  *(_DWORD *)(v36 - 256) = (2
                          * ((((v37 ^ 0x6EDC207A) + 227791549) ^ 0x6A9DFAFB)
                           + ((2 * ((v37 ^ 0x6EDC207A) + 227791549)) & 0xD53BF5F6)
                           + (v78 & 0x1B27A57A ^ 0x807B1473)
                           + ((2 * v78) & 0x30070274 ^ 0xFFF9FF9B))
                          + 600547722) & 0xC93117FE;
  HIDWORD(a24) = a6;
  int v79 = *(_DWORD *)(v36 - 216);
  unsigned int v80 = *(_BYTE **)(v36 - 200);
  int v81 = *v80;
  *unsigned int v80 = v81 ^ 0xE5 ^ (-80 - ((82 * ((v79 - 99) ^ 0x6D) + 100) & 0x60));
  LODWORD(v49) = 2014341611 * ((v81 ^ 0x5B3FFE7D) + ((2 * v81) & 0xFA)) + 1205986300;
  LODWORD(v49) = (v49 ^ 0xF76DD973) + 143795853 + ((2 * v49) & 0xEEDBB2E6);
  unsigned int v82 = v49 % 0x101 - ((2 * (v49 % 0x101)) & 0x19C) - 72211762;
  LODWORD(v49) = ((v49 & 0x9C9C2391) - ((2 * v49) & 0x8284222) + 1182267705) ^ 0x5A10AC6 ^ (((2
                                                                                            * (v82 & 0x191 ^ 0x18EE1115)) | 0xB671C4D4)
                                                                                          - (v82 & 0x191 ^ 0x18EE1115)
                                                                                          - 1530454634) | ((v49 & 0x6363DC6E) - ((2 * v49) & 0x44411098) + 984386013) ^ 0x972BFEA7 ^ (((2 * (v82 & 0x6E ^ 0x5B3004F)) & 0xB060008) - (v82 & 0x6E ^ 0x5B3004F) - 1472956549);
  LODWORD(v49) = ((v49 - ((2 * v49) & 0x16ECF4E) - 2135464025) ^ 0x70542DCE) - 828153160;
  LODWORD(v49) = (v49 ^ 0xF4787DDE) + 2078559509 + ((2 * v49) & 0xE8F0FBBC) + 193430050;
  LODWORD(v49) = v49 - ((2 * v49) & 0x417BA6FE) - 1598172289;
  unsigned int v83 = (((v49 ^ 0x641C2D59) - 1711921770 - ((2 * (v49 ^ 0x641C2D59)) & 0x33EC4B2C)) ^ 0x99F62596) >> 31;
  unsigned int v84 = ((2 * v83) & 0xFFF3B99E) + (v83 ^ 0x7FF9DCCF);
  unsigned int v85 = (((2 * (v84 + 49)) & 0x1BE) + ((v84 + 49) ^ 0x897B6FDF) + 1988399137) % 0xBD;
  unsigned int v86 = v84 + (v85 ^ 0xFFFFFF0C) - ((2 * v85) & 0xE6) + 37;
  int v87 = ((2 * v85) & 0x1EC) + (v85 ^ 0x71FCE7F6) + ((2 * v86) & 0x1F8);
  int v88 = (v49 ^ 0x641C2D59) + 937923721 + (~(2 * ((v49 ^ 0x641C2D59) - 253539735)) | 0x71F76BBF) + 1;
  int v89 = (v87
       + (v86 ^ 0x6DE72FFC)
  int v90 = v88 ^ 0x47044A20;
  int v91 = 2 * (((v89 ^ 0x35141DCB) & v90) - ((2 * ((v89 ^ 0x35141DCB) & v90)) & 0xA9817B0)) + 177739696;
  unsigned int v92 = (v88 ^ 0x721057EB ^ v89) + (v91 ^ 0x41476251) - 1272935905 + ((2 * v91) & 0x97BEEBC0 ^ 0x15302B40);
  int v93 = v49 ^ 0x35FCA098 ^ ((v49 ^ 0x641C2D59) - 48892597 - ((2 * ((v49 ^ 0x641C2D59) - 828153160)) & 0x5CE52526)) ^ 0x49BE6F9 ^ (v92 - ((2 * v92) & 0x1DB697C) + 15578302);
  BOOL v95 = (a6 - 1188583344) < 0x2413A63C || (a6 - 1188583344) > 0x2413A63D;
  int v94 = v93 - ((2 * v93 + 473760050) & 0x17F9D8A2) + 1243311338;
  unsigned int v96 = ((4 * v94) & 0xBE8DCFBC ^ 0xD17E7EFB)
      + ((2 * v94) ^ 0x3740C083)
      + (((v94 ^ 0x8BFCEC51) + v90) ^ 0x7EBD0FFF)
      + ((2 * ((v94 ^ 0x8BFCEC51) + v90)) & 0xFD7A1FFE);
  LODWORD(a31) = (v59 - ((2 * v59) & 0x664ABC86) + 858086979) ^ 0x820978A6;
  return ((uint64_t (*)(_UNKNOWN **, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_10025C670 + ((78 * !v95) ^ v79)) - 12))( &off_10025C670,  4024484104LL,  4193770669LL,  177739696LL,  v96 - ((2 * v96 + 1091809218) & 0x56C49876) + 200025116,  (v79 - 611),  779260563LL,  605267516LL,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34);
}

void sub_1001DECE8()
{
}

uint64_t sub_1001DECF4()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((20 * (v0 ^ 0x11F)) ^ (100
                                                                * ((v2 ^ 0x7FEF6FBF) - 1475013058 + (v1 & 0xFFDEDF60) != 671385085))))
                            - 4LL))();
}

uint64_t sub_1001E55F0@<X0>(int a1@<W8>)
{
  BOOL v11 = v5 < v4;
  if (v11 == v7 - 180039564 < v4) {
    BOOL v11 = v7 - 180039564 < v5;
  }
  unsigned int v13 = (((v9 + v7 - 851424650) ^ *(_DWORD *)(*(void *)(v3 + 2248) + (*(_DWORD *)(v2 + 2768) & v1))) & 0x7FFFFFFF)
      * a1;
  BOOL v12 = (_BYTE *)(v9 + (v7 | ((unint64_t)(v7 < ((v8 + 1174419611) | 0x10A580ACu) - 602277477) << 32)) - 851424650);
  *v12 ^= byte_100222EC0[(v7 - 851424650) & 0xF | (16 * (((v13 ^ HIWORD(v13)) * a1) >> 24))] ^ (-123 * (v13 ^ BYTE2(v13)));
  return ((uint64_t (*)(void))(*(void *)(v10 + 8LL * ((v11 * v6) ^ v8)) - 4LL))();
}

uint64_t sub_1001E56D0()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (v0 ^ 0x56A5BAB1 ^ ((((v0 + 16) ^ (((v1 - v0) | (v0 - v1)) < 0)) & 1)
                                                            * (((v0 - 1782254588) & 0x139552BF) - 490))))
                            - 12LL))();
}

uint64_t sub_1001E5734@<X0>(int a1@<W8>)
{
  uint64_t v9 = (char *)(v7 + (v5 - 1598029805));
  char v10 = *v9;
  unint64_t v11 = (v9 ^ (v9 >> 16)) * a1;
  **(_BYTE **)(v6 + 8) = byte_10023D440[v11 >> 24] ^ v10 ^ byte_10023A6B0[(v11 >> 24) + 2] ^ byte_100218530[(v11 >> 24) + 1] ^ v11 ^ (85 * BYTE3(v11));
  return ((uint64_t (*)(uint64_t))(*(void *)(v8 + 8LL * (int)((v4 & 0xBA08FAB3) - 541)) - 12LL))(-1671917635LL);
}

void sub_1001E581C()
{
}

  ;
}

uint64_t sub_1001E5860( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, int a11, int a12, int a13, int a14, int a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, unsigned __int8 a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, int a37)
{
  *(void *)(v40 - 224) = a1;
  unsigned int v41 = ((a15 ^ 0xA21793F0) - 2 * (((a15 ^ 0xA21793F0) + 17998814) & 0x1F6A85F ^ a15 & 1) + 1024019516) ^ 0xA21793F0;
  int v42 = ((v41 - 2 * ((v41 + 17998814) & 0x1F6A85F ^ a15 & 1) + 1024019516) ^ 0x81F6A85E) + v39;
  int v43 = (v42 ^ 0x36F7DFCF) - 922214351 + ((2 * v42) & 0x6DEFBF9E);
  unsigned int v44 = (((v37 & 0xD8) + (v37 & 0xFC ^ 0xFFFFFFDF) + (v37 & 0xD8 | 0x616D425)) | 1) ^ 0x2E27DC2B;
  unsigned int v45 = ((v43 & 0xFFFFFFFE) - ((2 * v43) & 0x7E97E654) - 1085541590) ^ 0xD0926859;
  unsigned int v46 = (((2 * v44) | 0xDB72ED14) - v44 - 1840871050) ^ 0x45887E88 | (-2
                                                                    - (((a10 ^ a26) & 3 | 0xFCBFFDF6)
                                                                     + ((a10 ^ a26) & 3 | 0xF36F4B39))) ^ 0xFD0B6CE;
  unsigned int v47 = ((16 - a12) & 0x20000000 ^ 0xFF7B66B7) + 2 * ((16 - a12) & 0x20000000);
  *(_DWORD *)(v40 - 228) = (v38 + 405) ^ 0x3FB;
  int v48 = (57 * v45 - (((-123515335 * v45) << (*(_DWORD *)(v40 - 228) - 53)) & 0x26) - 109);
  unsigned int v49 = ((v48 ^ 0xEC) - ((2 * (v48 ^ 0xEC)) & 0x1A0) - 1576126512) ^ 0xEB2F5BC5;
  int v50 = dword_100218F50[(v46 - ((2 * v46) & 0x3D78483E) - 1631837153) ^ 0xC9AF66B3 ^ (-506605065
                                                                                    - (v49 | 0xE1CDD1F7)
                                                                                    + (v49 | 0x1E322E08))];
  int v51 = v50 - ((2 * v50 + 707968690) & 0x7D8428F2) - 740592686;
  unsigned int v52 = a13 ^ a17 ^ v51 ^ (((8 * v51) ^ 0xF610A3C8)
                         - 2 * (((8 * v51) ^ 0xF610A3C8) & 0x16217BD8 ^ (8 * v51) & 0x10)
                         - 1776190513);
  if (((v52 ^ 0xA0000000) & (v47 + 8689993)) != 0) {
    unsigned int v53 = 2096548686 - v47;
  }
  else {
    unsigned int v53 = v47 + 2113928672;
  }
  *(_DWORD *)(*(void *)(v40 - 224) + 4LL * (v48 ^ 0x93u)) = a37 & 0xDFFFFFFF ^ 0x497A9FA8 ^ ((v52 ^ 0xA59427A1)
                                                                                             - 2105238679
                                                                                             + v53
                                                                                             - ((2
                                                                                               * ((v52 ^ 0xA59427A1)
                                                                                                - 2105238679
                                                                                                + v53)) & 0x20CF1612)
                                                                                             + 275221257);
  return ((uint64_t (*)(void))((char *)*(&off_10025C670 + v38 + 405) - 4))();
}

void sub_1001E5BD4()
{
}

uint64_t sub_1001E5BE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, __int128 a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, int a29, int a30, int a31, int a32, int a33, int a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, int a44, int a45)
{
  unsigned int v46 = (*(_DWORD *)(v45 - 228) + 1715372741) & 0x99C17AB7;
  HIDWORD(v47) = a45 ^ 0xC592;
  LODWORD(v47) = a45 ^ 0xEC600000;
  *(_DWORD *)(v45 - 228) = v46;
  LODWORD(v368) = (v47 >> 20) - ((2 * (v47 >> 20)) & 0xEE37768E) + v46 + 1998305428;
  HIDWORD(v367) = DWORD1(a24) - 1793850860;
  HIDWORD(v366) = 1788739420;
  LODWORD(v367) = -1487798272;
  LODWORD(v366) = HIDWORD(a19) ^ 0x10F98664;
  HIDWORD(a12) = a19 + 1;
  uint64_t v48 = (*(_DWORD *)(v45 - 228) - 691) | 0x13Du;
  *(void *)(v45 - 248) = v48;
  unsigned int v49 = *(unsigned __int8 **)(v45 - 200);
  int v50 = (-43 - 17 * ((v48 + 1488482844) ^ 0x55) - ((-34 * ((v48 + 1488482844) ^ 0x55)) & 0xFFFFFFAA)) ^ v49[((_DWORD)v48 + 1488482844) ^ 0x58B87355];
  int v51 = (2 * v50) ^ 0x67;
  unsigned int v52 = (4 * v50) & 0xFFFFFFBF ^ 0x73;
  int v53 = byte_100217C10[v50 ^ 0x1DLL] + (v50 ^ 0x23) - 68;
  unsigned int v54 = (v53 ^ 0x77) + v51 + v52 + ((2 * v53) & 0xFFFFFFEF);
  int v55 = (v54 + 1 - 2 * ((v54 + 1) & 6 ^ (v54 + 105)) + 97) ^ 0xBB;
  int v56 = ((v55 - ((2 * v55) & 0x62)) << 24) + 822083584;
  LODWORD(v48) = byte_100221830[v49[14] ^ 0xF0];
  LODWORD(v48) = ((((v48 ^ 0xE4) - ((2 * (v48 ^ 0xE4)) & 0x28)) << 8) - 784985088) ^ 0xD1361400;
  int v57 = byte_100225E70[v49[15] ^ 0xFE];
  int v58 = ((v56 ^ 0x31000000) - 1943426145 - ((2 * v56) & 0x18000000)) ^ 0x8C29AB9F | (v48
                                                                                   + 1313569040
                                                                                   - ((2 * v48) & 0x1C96F200)) ^ 0x4E4B7910;
  unsigned int v59 = v58 + 1568258813 - ((2 * v58) & 0xBAF375FA);
  int v60 = byte_100221830[v49[2] ^ 0x52];
  unsigned int v61 = byte_100218E50[v49[5] ^ 0x98];
  HIDWORD(a27) = 9;
  unsigned int v62 = v59 ^ 0x5D79BAFD | ((v57 + 60) - 136937644 - ((2 * (v57 + 60)) & 0xA8)) ^ 0xF7D67F54;
  unsigned int v63 = v62 - 288168915 - ((2 * v62) & 0xDDA5C85A);
  unsigned int v64 = ((v61 << 6) ^ 0xFFFFFF85) - (v61 << 6) + ((32 * v61) ^ 0x7E) + 1;
  int v65 = (v49[9] ^ 0x45) - ((2 * (v49[9] ^ 0xDE)) & 0xC0) + 1107019872;
  unsigned int v66 = ((((v60 ^ 0xCE) - ((2 * (v60 ^ 0xCE)) & 0x104)) << 8) - 931036672) ^ 0xC8818200;
  int v369 = v66 - 1993903010 - ((2 * v66) & 0x124EE800);
  unsigned int v67 = (v64 + ((2 * v64 - 28) & 0xFFFFFFA8 ^ 0xF7) - 52) ^ (v61 >> 3) ^ 0xDB;
  unsigned int v68 = (((v67 - ((2 * v67) & 0x116)) << 16) - 1970601984) ^ 0x8A8B0000;
  int v69 = v68 + 1531175498 - ((2 * v68) & 0x36860000);
  HIDWORD(v47) = byte_100218E50[((v65 & 0x112) - ((2 * v65) & 0x204) + 1020310442) ^ 0x2B30209B ^ ((v65 & 0xED ^ 0x10422025)
                                                                                                 - ((2 * (v65 & 0xED ^ 0x10422025)) & 0x44052)
                                                                                                 + 128103225)];
  LODWORD(v47) = (HIDWORD(v47) ^ 0x10) << 24;
  uint64_t v70 = (v49[8] - ((2 * v49[8]) & 0x52) - 1249833431) ^ 0x6A1B5F7u;
  LODWORD(v70) = (((v70 ^ 0x25) + 1) ^ 0x71)
               + ((2 * ((v70 ^ 0x25) + 1)) & 0xFFFFFFE3)
               + byte_100217C10[v70 ^ 0xB320BBE4LL];
  int v71 = v49;
  unsigned int v72 = ((((((v47 >> 27) - ((2 * (v47 >> 27)) & 0x30) - 104) ^ 0xC1)
  LODWORD(v70) = (v70 - ((2 * v70 - 106) & 0xC6) + 46) ^ 0xE7;
  LODWORD(v70) = (((_DWORD)v70 - ((2 * (_DWORD)v70) & 0x92)) << 24) - 922746880;
  LODWORD(v70) = ((v70 ^ 0xC9000000) + 77919931 - ((2 * v70) & 0x8000000)) ^ 0x4A4F6BB | (v72
                                                                                        - 129286495
                                                                                        - ((2 * v72) & 0x70960000)) ^ 0xF84B3EA1;
  unsigned int v73 = (((v49[4] ^ 0xEB01DD99) + 1) ^ 0xFFFFFFE7)
      + ((2 * ((v49[4] ^ 0xEB01DD99) + 1)) & 0xFFFFFFCF)
      + byte_100217C10[v49[4] ^ 0x58LL];
  int v74 = (v73 - ((2 * v73 - 86) & 0xEA) + 74) ^ 0x28;
  unsigned int v75 = (((v74 - ((2 * v74) & 0x4C)) << 24) - 1509949440) ^ 0xA6000000;
  int v76 = (v75 + 181053977 - ((2 * v75) & 0x14000000)) ^ 0xACAAA19 | v69 ^ 0x5B43E24A;
  HIDWORD(a25) = 6;
  LOBYTE(v72) = v49[6];
  int v77 = byte_100225E70[(v49[3] - ((2 * v49[3]) & 0x17C) + 1069429694) ^ 0x3FBE3331];
  LOBYTE(v75) = v77 + 60;
  LODWORD(v49) = v49[11];
  int v78 = v77 + 60 - ((2 * (v77 + 60)) & 0x40);
  LOBYTE(v77) = v72 ^ 0xB1;
  unsigned int v79 = ((2 * (_DWORD)v49) & 0x194) + (v49 ^ 0xE6F6FBCA);
  unsigned int v80 = (((2 * (v49 & 0x4E969245 ^ 0x40)) & 0x88888888) - (v49 & 0x4E969245 ^ 0x40) - 69) ^ 0xFB;
  int v81 = 2 * (v80 - ((2 * v80) & 0x9A)) + 201893018;
  int v82 = byte_100221830[v77] ^ 0xCD;
  unsigned int v83 = (((v82 - ((2 * v82) & 0x1BC)) << 8) - 445194752) ^ 0xE576DE00;
  int v84 = (v81 ^ 0x70F40311) - v79 + 1546988528 + ((2 * v81) & 0x18114F14 ^ 0x18114914);
  unsigned int v85 = (v79 + 420021302) ^ (328262367 - v79 - ((1307441044 - 2 * v79) & 0x5933CE2A)) ^ 0x799777C6 ^ (v84 - ((2 * v84 + 462049438) & 0xAA1D21A6) + 1658042658);
  unsigned int v86 = ((v85 + 1309341184 - ((2 * v85) & 0x9C15EC00)) ^ 0x4E0AF600) + 69;
  int v87 = v86 - ((2 * v86) & 0x37BA6216) - 1680002805;
  HIDWORD(v368) = 13;
  HIDWORD(v47) = v87 ^ 0x1D5;
  LODWORD(v47) = v87 ^ 0x97748000;
  int v88 = (v47 >> 14) - ((2 * (v47 >> 14)) & 0x9EE149B2) + 1332782297;
  HIDWORD(v47) = v88 ^ 0x967F;
  LODWORD(v47) = v88 ^ 0x8C080000;
  unsigned int v89 = (v76 - 1704039208 - ((2 * v76) & 0x34DCD9B0)) ^ 0x9A6E6CD8 | (v83 - 2052178943 - ((2 * v83) & 0xB5C7800)) ^ 0x85AE3C01;
  char v90 = ((2 * (v71[13] ^ 0x4D)) ^ 0x52) - ((2 * ((2 * (v71[13] ^ 0x4D)) ^ 0x52)) & 0x1C) - 113;
  int v91 = byte_100225E70[((v47 >> 18) + 736558693 - ((2 * (v47 >> 18)) & 0x57CDFDD8) + 135) ^ 0x2BE6FE65]
      + 60;
  int v92 = ((v90 & 0x10 | v90 & 0x8A ^ 0xAD) - 1) ^ 0x26;
  LODWORD(v70) = (v70 - 1283042578 - ((2 * v70) & 0x670CA5DC)) ^ 0xB38652EE | (v91
                                                                             - 751504239
                                                                             - ((2 * v91) & 0x122)) ^ 0xD334F491;
  int v93 = v70 + 1035804075 - ((2 * v70) & 0x7B7A3B56);
  HIDWORD(v47) = byte_100218E50[(v71[13] ^ 0x7FDEF089)
                              + ((2 * (v71[13] ^ 0xCF973CE4)) & 0xDA)
                              + v92
                              - 2 * v92
                              - 2145316896];
  LODWORD(v47) = (HIDWORD(v47) ^ 0x10) << 24;
  LODWORD(v70) = ((((((v47 >> 27) - ((2 * (v47 >> 27)) & 0x6A) + 53) ^ 0x8A)
  LODWORD(v70) = (v70 - 580516685 - ((2 * v70) & 0x3ACC0000)) ^ 0xDD6604B3 | v63 ^ 0xEED2E42D;
  HIDWORD(v47) = byte_100218E50[v71[1] ^ 0xA0];
  LODWORD(v47) = (HIDWORD(v47) ^ 0x10) << 24;
  HIDWORD(a24) = 0;
  unsigned int v94 = ((((((v47 >> 27) - ((2 * (v47 >> 27)) & 0x94) + 74) ^ 0x58)
  unsigned int v95 = (v94 - 131419702 - ((2 * v94) & 0x70540000)) ^ 0xF82AB1CA | v75 & 8;
  int v96 = (*v71 ^ 0x685C904D) + byte_100217C10[*v71 ^ 0x8CLL];
  *(void *)((char *)&a24 + 4) = 7LL;
  unsigned int v97 = (1190992271 - ((v78 + 32) & 0xF7 ^ 0x20B02061 | 0x46FD198F) + ((v78 + 32) & 0xF7 ^ 0x20B02061 | 0xB902E670)) ^ 0x99B2C631 | v369 ^ 0x8927745E;
  int v98 = (v96 - ((2 * (_BYTE)v96 + 2) & 6) - 64) ^ 0xB8;
  unsigned int v99 = (((v98 - ((2 * v98) & 0xCCCCCCCC)) << 24) + 1711276032) ^ 0x66000000;
  unsigned int v100 = (v95 - 355620273 - ((2 * v95) & 0xD59B549E)) ^ 0xEACDAA4F | (v97 + 1459088279 - ((2 * v97) & 0x2DEFD72E)) ^ 0x56F7EB97;
  HIDWORD(a21) = 10;
  unsigned int v101 = (v100 + 701901464 - ((2 * v100) & 0x53AC5530)) ^ 0x29D62A98 | (v99 - 1211487373 - ((2 * v99) & 0x6E000000)) ^ 0xB7CA2B73;
  int v102 = byte_100225E70[v71[7] ^ 0xBD] + 60;
  unsigned int v103 = (v89 - 978607360 - ((2 * v89) & 0x8B574600)) ^ 0xC5ABA300 | (v102
                                                                    + 460459664
                                                                    - ((2 * v102) & 0x120)) ^ 0x1B720E90;
  int v104 = byte_100221830[v71[10] ^ 0x17] ^ 0x8B;
  unsigned int v105 = (((v104 - ((2 * v104) & 0xFFFFFFEF)) << 8) - 951978240) ^ 0xC741F700;
  int v106 = v93 ^ 0x3DBD1DAB | (v105 + 96092744 - ((2 * v105) & 0xB748400)) ^ 0x5BA4248;
  int v107 = v106 - ((2 * v106) & 0x3639FEEC) - 1692598410;
  int v108 = a22 ^ HIDWORD(a22) ^ HIDWORD(a10) ^ (v101 - ((2 * v101) & 0x5B0A16CC) + 763693926);
  LODWORD(v49) = HIDWORD(a22) ^ a45 ^ a22;
  unsigned int v109 = v49 ^ a30 ^ (v103 - ((2 * v103) & 0xB49B5D76) - 632443205);
  unsigned int v110 = v49 ^ a31 ^ v107;
  HIDWORD(v47) = v108 ^ 0x708C;
  LODWORD(v47) = v108 ^ 0xD8100000;
  LODWORD(v49) = v49 ^ a34 ^ (v70 - ((2 * v70) & 0xC75B3FF4) + 1672323066);
  LODWORD(v70) = ((v47 >> 20) - ((2 * (v47 >> 20)) & 0x2E62FDC0) - 1758363936) ^ v368;
  HIDWORD(v47) = v70 ^ 0x619;
  LODWORD(v47) = v70 ^ 0x3B424000;
  unsigned int v111 = (v47 >> 12) - ((2 * (v47 >> 12)) & 0x26551908) - 1825928060;
  uint64_t v112 = *(void *)(v45 - 240);
  uint64_t v113 = *(void *)(v45 - 224);
  uint64_t v114 = *(void *)(v45 - 208);
  int v115 = *(_DWORD *)(v114 + 4LL * (BYTE2(v111) ^ 0xCFu));
  unsigned int v116 = HIWORD(v109);
  int v117 = *(_DWORD *)(v114 + 4LL * (BYTE2(v49) ^ 0x66u));
  unsigned int v118 = *(_DWORD *)(v113 + 4LL * (v49 ^ 0xD8u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v110) ^ 0x38u)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v109) ^ 3u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v111) ^ 6));
  int v119 = *(_DWORD *)(v112 + 4LL * (BYTE1(v111) ^ 0x7Au));
  int v120 = *(_DWORD *)(a13 + 4LL * ((v49 >> 24) ^ 0x1A));
  int v121 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v109) ^ 0xA2)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v110) ^ 0x6Au)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v49) ^ 0x44u));
  LODWORD(v49) = v120 & 0x2000 ^ 0x73BFFFDA;
  unsigned int v122 = *(_DWORD *)(v113 + 4LL * (((v47 >> 12) - ((2 * (v47 >> 12)) & 8) - 124) ^ 0xF6u)) ^ v121;
  int v123 = (_DWORD)v49 - 268639240;
  int v124 = v117 ^ *(_DWORD *)(v113 + 4LL * (v109 ^ 0xEDu));
  int v125 = (_DWORD)v49 - 1941954522;
  int v126 = v124 ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v110) ^ 0xDE));
  int v127 = *(_DWORD *)(v112 + 4LL * (BYTE1(v109) ^ 0x24u));
  int v128 = *(_DWORD *)(v113 + 4LL * (v110 ^ 0x1Bu));
  unsigned int v129 = v119 ^ v126;
  unsigned int v130 = ((v120 & 0xFFFFDFFF ^ 0xB2B553EC)
        + (v120 & 0x16008A3F ^ 0x4008813)
        - ((v120 & 0xFFFFDFFF ^ 0xB2B553EC) & 0x16008A3F)) ^ 0x9425BFD;
  int v131 = ((2 * v130) | 0x4A9174) - v130 - 2443450;
  int v132 = -679697492 - (_DWORD)v49;
  if ((v125 & (v115 ^ 0x10221880)) == 0) {
    int v132 = v123;
  }
  int v133 = v128 ^ v127 ^ v131 ^ ((v115 ^ 0x59235AE6)
                             - 1673315282
                             + v132
                             - ((2 * ((v115 ^ 0x59235AE6) - 1673315282 + v132)) & 0x41DFFD4C)
                             + 552599206);
  int v134 = *(_DWORD *)(v114 + 4LL * (BYTE2(v122) ^ 5u));
  unsigned int v135 = v134 & 0x40000000 | ((v134 & 0x40000000u) >> 30 << 31);
  unsigned int v136 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v118) ^ 0xDA)) ^ 0xCE2DFE11;
  int v137 = ((v135 + 0x40000000) & v136) + 1096709769 - 2 * ((v135 + 0x40000000) & v136);
  int v138 = v135 | 0x3DC3BFBF;
  unsigned int v139 = v135 - 1383878765;
  unsigned int v140 = v134 & 0xBFFFFFFF;
  unsigned int v141 = ((((v133 ^ 0x77E49D98u) >> (v116 & 0x18))
         + 1125121215
         - ((2 * ((v133 ^ 0x77E49D98u) >> (v116 & 0x18))) & 0x861FF97E)) ^ 0x430FFCBF) >> (v116 & 0x18 ^ 0x18);
  unsigned __int8 v142 = v141 - ((2 * v141) & 0xE8) - 12;
  int v143 = 1799843666 - v138;
  if (v137 != 1096709769) {
    unsigned int v139 = v143;
  }
  unsigned int v144 = *(_DWORD *)(v113 + 4LL * (v133 ^ 0x98u)) ^ v140 ^ *(_DWORD *)(v112
                                                                                      + 4LL * (BYTE1(v129) ^ 0x21u)) ^ (v136 - 1837346707 + v139 - ((2 * (v136 - 1837346707 + v139)) & 0x9EB1BE34) + 1331224346);
  int v145 = *(_DWORD *)(v113 + 4LL * (v118 ^ 0xADu));
  int v146 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v122) ^ 0x2B)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v129) ^ 0xDu));
  unsigned int v147 = *(_DWORD *)(v112 + 4LL * (BYTE1(v118) ^ 0x99u)) ^ *(_DWORD *)(v113 + 4LL * (v122 ^ 0x2Du)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v129) ^ 0x51)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v133) ^ 0xE4u));
  int v148 = *(_DWORD *)(v114 + 4LL * (BYTE2(v118) ^ 0xDEu)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v122) ^ 0xC0u)) ^ *(_DWORD *)(v113 + 4LL * (v129 ^ 0x4Du)) ^ *(_DWORD *)(a13 + 4LL * (v142 ^ 0xF4u));
  unsigned int v149 = v146 ^ v145 ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v133) ^ 0x9Du));
  int v150 = (v148 ^ 0x18A3BA6A) + 1;
  v148 ^= 0x2E18E397u;
  unsigned int v151 = v148 + (v150 ^ 0x57FEF8DF) + ((2 * v150) & 0xAFFDF1BE) - 1476327647;
  unsigned int v152 = ((v151 - ((2 * v151) & 0xFF3D2A82) + 2141099329) ^ 0x80616ABD) + v148;
  unsigned int v153 = v152 - ((2 * v152) & 0xA1FB9EAE) + 1358810967;
  int v154 = *(_DWORD *)(v114 + 4LL * (BYTE2(v153) ^ 0xFDu));
  unsigned int v155 = *(_DWORD *)(v114 + 4LL * (BYTE2(v149) ^ 0xABu)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v147) ^ 0x75u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v144) ^ 0xD1)) ^ *(_DWORD *)(v113 + 4LL * (v153 ^ 0x57u));
  int v156 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v153) ^ 0x50));
  unsigned int v157 = *(_DWORD *)(v112 + 4LL * (BYTE1(v153) ^ 0xCFu)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v147) ^ 0xBEu)) ^ *(_DWORD *)(v113 + 4LL * (v144 ^ 0x25u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v149) ^ 0x15));
  unsigned int v158 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v147) ^ 0x6A)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v144) ^ 0xB5u)) ^ *(_DWORD *)(v113 + 4LL * ((v146 ^ v145 ^ *(_BYTE *)(v112 + 4LL * (BYTE1(v133) ^ 0x9Du))) ^ 0x94u)) ^ v154;
  unsigned int v159 = *(_DWORD *)(v113 + 4LL * (v147 ^ 0x4Eu)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v144) ^ 0xC3u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v149) ^ 0xB7u)) ^ v156;
  int v160 = *(_DWORD *)(v113 + 4LL * (v159 ^ 0x38u)) ^ 0x48F54EEE;
  int v161 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v155) ^ 0xA0)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v157) ^ 0x78u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v158) ^ 0x75u)) ^ 0x66EDAD79;
  int v162 = v160 + v161;
  unsigned int v163 = (v161 & v160) + 1091758903 + (~(2 * (v161 & v160)) | 0xFDDA2993);
  int v164 = *(_DWORD *)(v113 + 4LL * (v155 ^ 0xE0u));
  int v165 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v157) ^ 0x9B)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v158) ^ 0xDEu)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v159) ^ 0xD3u));
  unsigned int v166 = v165 & 0xA7993134;
  unsigned int v167 = ((v165 & 0x480602C1 ^ 0x3891371) + (v165 & 0x1060CC0A ^ 0x1040880B) - 1) ^ 0xDF0F1250;
  unsigned int v168 = (32223319 - (v167 | 0x1EBB057) + (v167 | 0xFE144FA8)) ^ 0x72B64ACA | v166 ^ 0x26892130;
  unsigned int v169 = v168 - 137853446 - ((2 * v168) & 0xEF910BF4);
  unsigned int v170 = v169 ^ 0xF7C885FA;
  unsigned int v171 = (v164 ^ 0x40C234EB ^ v169) + (v169 ^ 0xF7C885FA) + 1;
  int v172 = *(_DWORD *)(v112 + 4LL * (BYTE1(v155) ^ 0xB7u));
  unsigned int v173 = v164 ^ ((v164 ^ 0xB70AB111) - ((2 * (v164 ^ 0xB70AB111) + 2) & 0xE8CCD9B6) - 194614052) ^ 0xAA8F9097 ^ (v171 - ((2 * v171) & 0x2C396544) + 370979490);
  int v174 = (2 * v163) ^ 0x1271F66D;
  unsigned int v175 = (4 * v163) & 0xDF57BFFC ^ 0xFBBC5327;
  int v176 = *(_DWORD *)(v114 + 4LL * (BYTE2(v155) ^ 0xCBu));
  unsigned int v177 = v173 + v170 - ((2 * (v173 + v170)) & 0xE11F1E9C) - 259027122;
  int v178 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v159) ^ 0x16));
  unsigned int v179 = (v162 ^ 0x7ADFB9B5) + ((2 * v162) & 0xF5BF736A) + v174 + v175 + 1;
  unsigned int v180 = v179 - ((2 * v179 - 375894892) & 0xA082A0D0) + 1158510258;
  unsigned int v181 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v158) ^ 0xDF)) ^ v172 ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v159) ^ 0x9Au)) ^ *(_DWORD *)(v113 + 4LL * (v157 ^ 0xE3u));
  unsigned int v182 = v178 ^ v176 ^ *(_DWORD *)(v113 + 4LL * (v158 ^ 0x3Au)) ^ *(_DWORD *)(v112
                                                                                             + 4LL
                                                                                             * (BYTE1(v157) ^ 0xE3u));
  int v183 = *(_DWORD *)(v114 + 4LL * (BYTE2(v182) ^ 0x87u));
  int v184 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v182) ^ 0xE4));
  unsigned int v185 = *(_DWORD *)(v114 + 4LL * (BYTE2(v177) ^ 0x54u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v181) ^ 0x4Cu)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v180) ^ 0xE6)) ^ *(_DWORD *)(v113 + 4LL * (v182 ^ 0x31u));
  unsigned int v186 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v177) ^ 0xF3)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v181) ^ 5u)) ^ 0x970EA4F7;
  unsigned int v187 = *(_DWORD *)(v112 + 4LL * (BYTE1(v182) ^ 0x7Cu)) ^ 0xF1E3098E;
  int v188 = 2 * ((v187 & v186) - ((2 * (v187 & v186)) & 0x79ECFDC6)) - 101909050;
  unsigned int v189 = ((v187 + v186) ^ 0xFFFDDFCF)
       + ((2 * (v187 + v186)) & 0xFFFBBF9E)
       + (v188 ^ 0xF8EDF8E3)
       + ((2 * v188) & 0xFDFDF5B4 ^ 0xE260E7B);
  unsigned int v190 = (v189 + 1 - 2 * ((v189 + 520166157) & 0x1E48446F ^ (v189 + 1) & 2) - 1656135815) ^ *(_DWORD *)(v113 + 4LL * (v180 ^ 0xB8u));
  int v191 = *(_DWORD *)(v114 + 4LL * (BYTE2(v180) ^ 0xFAu));
  unsigned int v192 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v181) ^ 0xDC)) ^ v183 ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v180) ^ 0x69u)) ^ *(_DWORD *)(v113 + 4LL * ((v173 + v170 - ((2 * (v173 + v170)) & 0x9C) + 78) ^ 0xEAu));
  unsigned int v193 = *(_DWORD *)(v112 + 4LL * (BYTE1(v177) ^ 0xB6u)) ^ v184 ^ *(_DWORD *)(v113
                                                                            + 4LL * (v181 ^ 0x9Eu)) ^ v191;
  int v194 = (((2 * (v193 ^ 0x78)) & 0x15E) - (v193 ^ 0x78) - 2145140656) ^ 0x61858598;
  unsigned int v195 = *(_DWORD *)(v114 + 4LL * (BYTE2(v190) ^ 0xB7u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v192) ^ 0xC0u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v185) ^ 0xEF)) ^ *(_DWORD *)(v113 + 4LL * ((-1327576019 - (v194 | 0xB0DECC2D) + (v194 | 0x4F2133D2)) ^ 0xAE87762B));
  int v196 = *(_DWORD *)(v114 + 4LL * (BYTE2(v185) ^ 0xC9u));
  int v197 = *(_DWORD *)(v112 + 4LL * (BYTE1(v185) ^ 0x56u));
  unsigned int v198 = *(_DWORD *)(v114 + 4LL * (BYTE2(v192) ^ 0xFu)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v193) ^ 0x5Fu)) ^ *(_DWORD *)(v113 + 4LL * (v185 ^ 0x42u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v190) ^ 0x14));
  int v199 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v192) ^ 0x1E)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v193) ^ 0x90u)) ^ v197;
  int v200 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v193) ^ 0xD4)) ^ v196;
  unsigned int v201 = (v199 & 0x6A9DFF5C ^ 0x884CA48) - ((2 * (v199 & 0x6A9DFF5C ^ 0x884CA48)) & 0x80307C28) + 1081622198;
  unsigned int v202 = (-305972043 - (v199 & 0x956200A3 ^ 0x112200A2 | 0xEDC33CB5) + (v199 & 0x956200A3 ^ 0x112200A2 | 0x123CC34A)) ^ ((v201 & 0x21AB5F58 ^ 0x218B4359) + (v201 ^ 0x701CA4) - ((v201 ^ 0x701CA4) & 0x21AB5F58)) ^ *(_DWORD *)(v113 + 4LL * (v190 ^ 0xF2u));
  unsigned int v203 = v200 ^ *(_DWORD *)(v113 + 4LL * (v192 ^ 0xEFu)) ^ *(_DWORD *)(v112
                                                                                      + 4LL * (BYTE1(v190) ^ 0x86u));
  int v204 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v203) ^ 0xEA));
  unsigned int v205 = *(_DWORD *)(v112 + 4LL * (BYTE1(v203) ^ 7u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v198) ^ 0x20)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v202) ^ 0xAFu)) ^ *(_DWORD *)(v113 + 4LL * (v195 ^ 0x9Fu));
  unsigned int v206 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v195) ^ 0xE2)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v198) ^ 0x81u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v202) ^ 0xCFu)) ^ *(_DWORD *)(v113 + 4LL * (v203 ^ 0x48u));
  unsigned int v207 = *(_DWORD *)(v114 + 4LL * (BYTE2(v203) ^ 0x1Eu)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v202) ^ 0x7A)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v195) ^ 0x14u)) ^ *(_DWORD *)(v113 + 4LL * (v198 ^ 0xEEu));
  unsigned int v208 = *(_DWORD *)(v112 + 4LL * (BYTE1(v198) ^ 0x98u)) ^ v204 ^ *(_DWORD *)(v113
                                                                            + 4LL * (v202 ^ 0x7Du)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v195) ^ 0x8Bu));
  int v209 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v205) ^ 0x5E));
  int v210 = *(_DWORD *)(v114 + 4LL * (BYTE2(v207) ^ 0xC1u));
  int v211 = (v209 & 0x100000 ^ 0x5B7E697F) + 2 * (v209 & 0x100000);
  int v212 = *(_DWORD *)(v112 + 4LL * (BYTE1(v206) ^ 0xC2u));
  unsigned int v213 = (v209 & 0xF842B1EB ^ 0x18002083) + (v209 & 0x7AD4E14 ^ 0x5800C11);
  int v214 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v207) ^ 0x60));
  int v215 = *(_DWORD *)(v113 + 4LL * (v208 ^ 0x8Cu)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v207) ^ 0xE1u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v206) ^ 0x50));
  int v216 = *(_DWORD *)(v114 + 4LL * (BYTE2(v208) ^ 0xC7u));
  int v217 = -1546349941 - v211;
  if (((v210 ^ 0x59200000) & (v211 - 1535011199))
     + 414868980
     - ((2 * ((v210 ^ 0x59200000) & (v211 - 1535011199))) & 0x31600000) == 414868980)
    int v217 = v211 - 321405043;
  int v218 = (v210 ^ 0x59235AE6) - 1213606156 + v217 - ((2 * ((v210 ^ 0x59235AE6) - 1213606156 + v217)) & 0x2BAF890C);
  int v219 = v216 ^ v214;
  unsigned int v220 = v212 ^ 0xF1E3098E;
  unsigned int v221 = v220 + (v212 ^ 0x99125286 ^ v219) + 1 - ((2 * (v220 + (v212 ^ 0x99125286 ^ v219) + 1)) & 0x414C42CE);
  int v222 = *(_DWORD *)(v112 + 4LL * (BYTE1(v208) ^ 5u));
  int v223 = *(_DWORD *)(v113 + 4LL * (v206 ^ 0x2Bu));
  unsigned int v224 = v222 ^ v223 ^ (v213 - 1) ^ (v218 + 366462086);
  unsigned int v225 = (v219 ^ ((v219 ^ 0x68F15B08) - ((2 * (v219 ^ 0x68F15B08) + 2) & 0x1F5ADA24) + 263023891) ^ (v221 + 547758439) ^ 0xB805E882)
       + v220;
  unsigned int v226 = (v225 - ((2 * v225) & 0xF894C178) + 2085249212) ^ *(_DWORD *)(v113 + 4LL * (v205 ^ 0x52u));
  int v227 = *(_DWORD *)(v114 + 4LL * (BYTE2(v206) ^ 0xD6u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v208) ^ 0xA4));
  int v228 = 2 * v226;
  int v229 = v227 ^ *(_DWORD *)(v113 + 4LL * (v207 ^ 0x53u));
  if ((v224 & 4) != 0) {
    int v231 = 4;
  }
  else {
    int v231 = 252;
  }
  unsigned int v232 = v231 + (v224 ^ 0xA62133CF);
  int v230 = (v228 ^ 0x697E5CA4) - ((2 * (v228 ^ 0x697E5CA4)) & 0x32583A14);
  unsigned int v233 = (v226 & 0x5DCB65B7 ^ 0xE3E4D154)
       + (v228 & 0xAA96CA0C ^ 0x28164804)
       + ((v230 + 1496063243) & 0x2B00C04E ^ 0x8E20003)
       + ((2 * (v230 + 1496063243)) & 0x5401808C ^ 0xEFFFFFFB)
       + 1;
  unsigned int v234 = (v233 - ((2 * v233 + 945608112) & 0x3561D240) - 1226877960) ^ v226 & 0xA2349A48;
  unsigned int v235 = v215 ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v205) ^ 0x4Fu));
  int v236 = (v215 ^ *(_BYTE *)(v114 + 4LL * (BYTE2(v205) ^ 0x4Fu))) ^ 0x55;
  unsigned int v237 = (-585233293 - (v236 | 0xDD1E0C73) + (v236 | 0x22E1F38C)) ^ 0x2265328E;
  unsigned int v238 = v229 ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v205) ^ 0xB9u));
  int v239 = *(_DWORD *)(v114 + 4LL * (BYTE2(v234) ^ 0x90u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v224) ^ 0xA6)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v238) ^ 0x65u)) ^ *(_DWORD *)(v113 + 4LL * ((((2 * v237) & 0x2DEA790) - v237 + 2123410487) ^ 0x7E146D99));
  int v240 = (v232 ^ 0xDB) + ((2 * v232) & 0xB6) + 37;
  int v241 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v234) ^ 0x38)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v235) ^ 0xDBu)) ^ *(_DWORD *)(v113 + 4LL * ((v240 + 1370044091 - ((2 * v240) & 0x176)) ^ 0x51A936BFu)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v238) ^ 0x53u));
  HIDWORD(v242) = v205 ^ 0x18E397;
  LODWORD(v242) = v205 ^ 0x2E000000;
  int v244 = (v242 >> 22) - ((2 * (v242 >> 22)) & 0x614FB262) + 816306481;
  HIDWORD(v242) = v244 ^ 0x304;
  LODWORD(v242) = v244 ^ 0x1F9DD400;
  unsigned int v245 = (v242 >> 10) - ((2 * (v242 >> 10)) & 0xD5ED1352) + 1794541993;
  int v246 = *(_DWORD *)(v113 + 4LL * (((v242 >> 10) - ((2 * (v242 >> 10)) & 0x52) - 87) ^ 0xEFu)) ^ 0x48F54EEE;
  unsigned int v247 = v214 ^ 0xCE2DFE11;
  int v248 = (v246 & v247) - ((2 * (v246 & v247)) & 0x463990D0);
  int v249 = (v246 | v247) - ((2 * (v246 | v247)) & 0x5FBE295A);
  unsigned int v250 = v222 ^ v210 ^ v223 ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v245) ^ 0x97));
  unsigned int v251 = v215 ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v245) ^ 0xEAu));
  unsigned int v252 = (v249 + 803148973) ^ (v248 - 1558394776) ^ ((v220 & (v216 ^ 0x59235AE6))
                                                   - ((2 * (v220 & (v216 ^ 0x59235AE6))) & 0x97550BD0)
                                                   + 1269466600) ^ ((v220 | v216 ^ 0x59235AE6)
                                                                  - ((2 * (v220 | v216 ^ 0x59235AE6)) & 0x5543C9C4)
                                                                  - 1432230686);
  int v253 = v229 ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v245) ^ 0x1Du));
  unsigned int v254 = (991439928
        - ((2 * (v253 & 0x80000)) ^ 0x100000 | v253 & 0x80000)
        - ((932644826 - 2 * (((2 * (v253 & 0x80000)) ^ 0x100000 | v253 & 0x80000) + 2121792889)) & 0x3B810888)) ^ (((2 * (v253 & 0xFFF7FFFF ^ 0x2E487376)) & 0xDD01805E) - (v253 & 0xFFF7FFFF ^ 0x2E487376) - 1853931568);
  int v255 = *(_DWORD *)(v114 + 4LL * (BYTE2(v250) ^ 0x55u)) ^ 0x59235AE6;
  unsigned int v256 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v251) ^ 0x87)) ^ 0xCE2DFE11;
  int v257 = (v256 & v255) - ((2 * (v256 & v255)) & 0x31249504);
  unsigned int v258 = ((v256 + v255) ^ 0xDBE5EFBB)
       + ((2 * (v256 + v255)) & 0xB7CBDF76)
       + ((2 * v257 - 1323002620) ^ 0xA1E2F463)
       + ((2 * (2 * v257 - 1323002620)) & 0xDE733D30 ^ 0xBDBED7FF)
       + 1;
  unsigned int v259 = *(_DWORD *)(v112 + 4LL * (BYTE1(v252) ^ 0xDDu)) ^ *(_DWORD *)(v113 + 4LL * (v254 ^ 0xF5u)) ^ (v258 - ((2 * v258 + 648502716) & 0xB9AEB31E) + 1881868397);
  int v260 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v252) ^ 0xFA)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v254) ^ 0xE3u));
  int v261 = *(_DWORD *)(v113 + 4LL * (v251 ^ 0xF9u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v250) ^ 0xF7)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v252) ^ 0x5Cu)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v254) ^ 0xAu));
  unsigned int v262 = (v260 & 0xFFFFFFEF ^ 0x67F21700)
       + (v260 & 0x111F05CB ^ 0x100D00CB)
       - ((v260 & 0xFFFFFFEF ^ 0x67F21700) & 0x111F05CB);
  int v263 = *(_DWORD *)(v112 + 4LL * (BYTE1(v251) ^ 0xDBu));
  unsigned int v264 = v260 & 0x10 ^ 0xFFF7FCD7;
  BOOL v265 = ((v264 + 525113) & v263) + 1227329862 - 2 * ((v264 + 525113) & v263) == 1227329862;
  unsigned int v266 = v264 + 1124031294;
  unsigned int v267 = 1122981068 - v264;
  if (v265) {
    unsigned int v267 = v266;
  }
  unsigned int v268 = *(_DWORD *)(v113 + 4LL * (v250 ^ 0x3Cu)) ^ v262 ^ ((v263 ^ 0xF1E3098E)
                                                                           - 1123506181
                                                                           + v267
                                                                           - ((2
                                                                             * ((v263 ^ 0xF1E3098E) - 1123506181 + v267)) & 0x634D064A)
                                                                           + 832996133);
  int v269 = *(_DWORD *)(v112 + 4LL * (BYTE1(v250) ^ 0x81u)) ^ *(_DWORD *)(v113 + 4LL * (v252 ^ 0xA0u)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v251) ^ 2u)) ^ *(_DWORD *)(a13 + 4LL * (HIBYTE(v254) ^ 0x8C));
  unsigned int v271 = (((2 * v239) ^ 0x5C31C72E) - ((2 * ((2 * v239) ^ 0x5C31C72E)) & 0x5F42EE5C) + 799110958) & 0x8584F182 ^ 0x9D837902;
  HIDWORD(v272) = v241 ^ 0xE397;
  LODWORD(v272) = v241 ^ 0x2E180000;
  int v273 = (v272 >> 18) - ((2 * (v272 >> 18)) & 0x32BC7734) + 425606042;
  unsigned int v274 = ((((2 * v271) | 0x38669F2A) - v271 + 1674358891) ^ 0x80B4E697) + (v239 ^ 0x2EA1CEFF);
  unsigned int v275 = ((2 * v274) & 0xFBF9AF5E) + (v274 ^ 0x7DFCD7AF);
  unsigned int v276 = ((2 * v270) & 0x7F7B77FE) + (v270 ^ 0xBFBDBBFF) + (v259 ^ 0x108D612);
  int v277 = v276 - ((2 * v276 + 8685572) & 0x7FFDCB16) + 4270477;
  int v278 = (13798327 - (v268 | 0xFFFFFD)) & 0x800022;
  unsigned int v279 = v268 ^ 0x98B07BE7;
  if (v278 == 8388640) {
    int v280 = 2;
  }
  else {
    int v280 = -2;
  }
  unsigned int v281 = v280 + v279 - ((2 * (v280 + v279)) & 0x974AA62E) - 878357737;
  int v282 = v277 ^ 0x6E0E080F;
  unsigned int v283 = (-818646825 * v282) ^ 0xDFFDAF5A;
  HIDWORD(v284) = v273 ^ 0x368F;
  LODWORD(v284) = v273 ^ 0x90944000;
  unsigned int v285 = (-1637293650 * v282) & 0xBFFB5EB4;
  unsigned int v286 = ((2 * v281) & 0xFF9DFFFE ^ 0x3C94CDA6) + (v281 ^ 0xE184992C);
  int v287 = (((v284 >> 14) - ((2 * (v284 >> 14)) & 0x39E95890) - 1661686712) ^ 0xFD4DBEA7) - 1070568364;
  unsigned int v288 = ((2 * v287) & 0xDE77CDFA) + (v287 ^ 0x6F3BE6FD) - v286;
  unsigned int v289 = ((2 * v261) & 0xFD7F4FFE ^ 0xD8474C7C) + (v261 ^ 0x12DC11C1);
  int v290 = v275 - v289 - ((2 * (v275 - v289) + 25534624) & 0x50B1A9FE) - 1457806001;
  int v243 = *(_DWORD *)(a13 + 4LL * (HIBYTE(v238) ^ 0x33)) ^ *(_DWORD *)(v114 + 4LL * (BYTE2(v235) ^ 2u)) ^ *(_DWORD *)(v112 + 4LL * (BYTE1(v224) ^ 0x33u)) ^ *(_DWORD *)(v113 + 4LL * (v234 ^ 0x28u));
  unsigned int v291 = ((((2 * v243) ^ 0x5C31C72E) - ((2 * ((2 * v243) ^ 0x5C31C72E)) & 0x1C23B8CC) + 236051559) & 0xBA6A0020 ^ 0x9A480000)
       + (v243 ^ 0xBB895035);
  unsigned int v292 = ((1743057845 * (v290 ^ 0x4C93D5B4)) ^ 0xFCF3BCAF) + ((-808851606 * (v290 ^ 0x4C93D5B4)) & 0xF9E7795E);
  unsigned int v293 = ((2 * v291) & 0xF5BFF74E) + (v291 ^ 0xFADFFBA7) + (v269 ^ 0x9943AFDA);
  unsigned int v294 = (v293 - 2 * ((v293 + 85984346) & 0x22A0D00B ^ v293 & 1) + 666948708) ^ 0x9D21D771;
  int v295 = 292393685 * v294 + 177564357 - ((47916458 * v294) & 0x152AD58A);
  int v296 = (v288 - ((2 * v288 + 556151300) & 0x56228A64) - 1146855884) ^ 0x174C6DB5;
  unsigned int v297 = -1029760007 - 762590379 * v296 - ((-1525180758 * v296) & 0x853E37F2);
  int v298 = v285 - v292 + v283 + 485887317;
  int v299 = v298 + (v295 ^ 0xA956AC5) - ((2 * (v298 + (v295 ^ 0xA956AC5))) & 0x524AB14A) - 1457170267;
  unsigned int v300 = ((v292 + 51135313 + (v297 ^ 0xC29F1BF9)) ^ 0x77FB7B0F)
       + (v299 ^ 0x56DAA75A)
       + ((2 * (v292 + 51135313 + (v297 ^ 0xC29F1BF9))) & 0xEFF6F61E);
  unsigned int v301 = v300 - ((2 * v300 + 269027812) & 0xD42E6ECA) - 233063337;
  int v302 = v301 ^ v299;
  unsigned int v303 = v295 ^ 0xC80A713C ^ v297;
  unsigned int v304 = v298 + v303 - 387798938 - ((2 * (v298 + v303)) & 0xD1C550CC);
  unsigned int v305 = ((2 * ((v304 ^ 0xE8E2A866) + v303)) & 0xFDF7FBCA) + (((v304 ^ 0xE8E2A866) + v303) ^ 0x7EFBFDE5);
  unsigned int v306 = (v304 ^ 0xD42F3859 ^ v302) + 1;
  unsigned int v307 = ((2 * (v306 + (v301 ^ 0x6A173765))) & 0xDFDEF7EE) + ((v306 + (v301 ^ 0x6A173765)) ^ 0x6FEF7BF7);
  unsigned int v308 = v305 - v307;
  unsigned int v309 = v307 + v289 + ((2 * v307 + 539035666) ^ 0x90E0E03) - ((2 * (2 * v307 + 539035666)) & 0xEDE3E3F8);
  unsigned int v310 = ((2 * (v306 + (v259 ^ 0xFEF729ED))) & 0xB676FAB4) + ((v306 + (v259 ^ 0xFEF729ED)) ^ 0xDB3B7D5A);
  unsigned int v311 = v309 - ((2 * v309 + 616417816) & 0x3F902D26) + 1378286495;
  unsigned int v312 = (v269 ^ 0x66BC5025)
       + (((v302 ^ 0x3CCD903F) - 252477933 + v308) ^ 0xFFD33BF7)
       + ((2 * ((v302 ^ 0x3CCD903F) - 252477933 + v308)) & 0xFFA677EE)
       + 2933769;
  unsigned int v313 = ((2 * v312) & 0x6BB1ED7A) + (v312 ^ 0xB5D8F6BD);
  unsigned int v314 = v310 - ((2 * v310 + 116947534) & 0x1DDADD80) + 1382656999;
  unsigned int v315 = v286 - v308 - ((2 * (v286 - v308) + 1444766236) & 0x5C3B406A) + 422334787;
  unsigned int v316 = v313 - ((2 * v313 - 550444158) & 0xED48EDF8) - 432215875;
  uint64_t v317 = *(void *)(v45 - 256);
  uint64_t v318 = *(void *)(v45 - 216);
  int v319 = *(_DWORD *)(a39 + 4LL * (BYTE2(v311) ^ 0xC8u)) ^ a21 ^ *(_DWORD *)(v317 + 4LL * (HIBYTE(v314) ^ 0xE)) ^ *(_DWORD *)(a16 + 4LL * (BYTE1(v315) ^ 0xA0u)) ^ *(_DWORD *)(v318 + 4LL * ((v313 - ((2 * v313 - 126) & 0xF8) - 67) ^ 0xFCu));
  HIDWORD(v284) = v319 ^ 0xF2D47A;
  LODWORD(v284) = v319 ^ 0x8C000000;
  int v320 = (v284 >> 25) - ((2 * (v284 >> 25)) & 0x7985A2B6) - 1128083109;
  int v321 = a21 ^ a29 ^ *(_DWORD *)(a16 + 4LL * (BYTE1(v314) ^ 0x6Eu)) ^ *(_DWORD *)(v317 + 4LL * (HIBYTE(v315) ^ 0xAE)) ^ *(_DWORD *)(v318 + 4LL * (v311 ^ 0x93u)) ^ *(_DWORD *)(a39 + 4LL * (BYTE2(v316) ^ 0xA4u));
  HIDWORD(v284) = v320 ^ 0x1E;
  LODWORD(v284) = v320 ^ 0xB28EEA00;
  int v322 = HIDWORD(a19) ^ a29 ^ a21;
  unsigned int v323 = v322 ^ *(_DWORD *)(a39 + 4LL * (BYTE2(v315) ^ 0x1Du)) ^ *(_DWORD *)(v317 + 4LL * (HIBYTE(v311) ^ 0x1F)) ^ *(_DWORD *)(v318 + 4LL * (v314 ^ 0xC0u)) ^ *(_DWORD *)(a16 + 4LL * (BYTE1(v316) ^ 0x76u));
  unsigned int v324 = HIDWORD(a19) ^ a29 ^ ((v284 >> 7) - ((2 * (v284 >> 7)) & 0x2DD9F02) - 2123444351);
  unsigned int v325 = v322 ^ *(_DWORD *)(v318 + 4LL * (v315 ^ 0x35u)) ^ *(_DWORD *)(a39 + 4LL
                                                                                            * (BYTE2(v314) ^ 0xEDu)) ^ *(_DWORD *)(a16 + 4LL * (BYTE1(v311) ^ 0x16u)) ^ *(_DWORD *)(v317 + 4LL * (HIBYTE(v316) ^ 0x76));
  int v326 = (v321 ^ (HIDWORD(a12) + (v366 ^ v321) - ((2 * (HIDWORD(a12) + (v366 ^ v321))) & 0xF080BA9C) + 2017484110) ^ ((v321 ^ 0xF468C3D8) - ((2 * (v321 ^ 0xF468C3D8) + 2) & 0x62F08ED6) - 1317517460) ^ 0xC2AF2602)
       + a19;
  unsigned int v327 = v326 - ((2 * v326) & 0xBCAA4B98) - 564845108;
  unsigned int v328 = ((v327 & 0x7CC7D4AF ^ 0x1C849480)
        + (v327 & 0x14039429 ^ 0x822B2129)
        - ((v327 & 0x7CC7D4AF ^ 0x1C849480) & 0x14039429)) ^ 0xD6623565;
  unsigned int v329 = (((2 * v328) & 0xB1AB81B4) - v328 + 640302885) ^ ((v327 & 0x83382B50 ^ 0x7DEFDFFF)
                                                         - ((2 * (v327 & 0x83382B50 ^ 0x7DEFDFFF)) & 0xA7C411B6)
                                                         + 1407322331);
  LOBYTE(v328) = byte_100221210[HIBYTE(v323) ^ 0x12LL];
  LOBYTE(v320) = (v328 & 0x2B ^ 0xDD) + ((2 * v328) & 0x52 ^ 0xED);
  LOBYTE(v311) = (v328 & 0xD4 ^ 0xC4) - ((2 * (v328 & 0xD4 ^ 0xC4)) & 0x78);
  unsigned int v330 = (((8 * v327) ^ 0xCF56FFD8)
        - 1066689688
        - ((2 * ((8 * v327) ^ 0xCF56FFD8)) & 0x80D736D0)
        + (v327 >> 5)) ^ 0xC06B9B6F;
  unsigned int v331 = v330 - ((2 * v330) & 0xBE);
  unsigned int v332 = *(_BYTE **)(v45 - 200);
  v332[4] = HIBYTE(v323) ^ (v320 - 86) ^ (v311 - 75) ^ 0x52;
  HIDWORD(v284) = (v331 - 9) ^ 6;
  LODWORD(v284) = ((v331 - 33) ^ 0xFFFFFFBF) << 24;
  int v333 = ((v327 >> 23) & 0x7E ^ 0x72) + (HIBYTE(v327) ^ 0x7EFEDB06);
  int v334 = byte_100214090[((v284 >> 27) - ((2 * (v284 >> 27)) & 0x33) + 25) ^ 0xA9LL];
  HIDWORD(v284) = v334 ^ 9;
  LODWORD(v284) = (v334 ^ 0xC0) << 24;
  int v335 = (v284 >> 28) - ((2 * (v284 >> 28)) & 0xFFFFFFF7);
  unsigned int v336 = v335 - 5;
  unsigned int v337 = (v335 - 5);
  HIDWORD(v284) = (v335 - 5) ^ 0x7B;
  LODWORD(v284) = (4 - v335) << 24;
  int v338 = 127 - (v284 >> 31);
  unsigned int v339 = (2 * (((v336 >> 7) & 1 | 0x70) ^ (v337 >> 4))) ^ 0xFFFFFFFC;
  int v340 = v339 - ((2 * v339) & 0x14) - 53;
  HIDWORD(v284) = v340 ^ ~v338;
  LODWORD(v284) = (v340 ^ v338 ^ 0xFFFFFFC3) << 24;
  v332[11] = ((v284 >> 25) - ((2 * (v284 >> 25)) & 0x14) - 118) ^ 0x5B;
  int v341 = ((BYTE2(v325) ^ 0x7C) - ((2 * (BYTE2(v325) ^ 0x7C)) & 0x24) + 1687404306) ^ 0x66533B22;
  unsigned int v342 = (v341 | 0xCC143B65) - (v341 | 0x33EBC49A) + 871089306;
  char v343 = byte_10023BF20[v342 ^ 0xCED4BFFB];
  if ((v342 ^ 0xCED4BF80) < 0x80) {
    char v344 = -4;
  }
  else {
    char v344 = 4;
  }
  v332[13] = (v344 + (v343 ^ 0x79) - 2 * ((v344 + (v343 ^ 0x79)) & 0x7E ^ v343 & 2) - 4) ^ 0x2F;
  int v345 = byte_100221210[HIBYTE(v325) ^ 0x86LL];
  unsigned int v346 = (BYTE1(v325) ^ 0x9B | 0x11AE414F) - (BYTE1(v325) ^ 0x9B | 0xEE51BEB0) - 296632656;
  unsigned int v347 = ((((v325 >> 8) & 0xE5 ^ 0x4A2405C0) + ((v325 >> 8) & 0x1A ^ 0x20900013) - 1) ^ 0x954BFA67) + 1;
  int v348 = ((v346 & 0x1000019C ^ 0x52000091) + (v346 & 0x1AE4263) - 1) ^ 0x43AE410C;
  int v349 = (v347 ^ 0x1FFFFF76) + ((2 * v347) & 0x3FFFFEEC) + v348 - 536870774;
  HIDWORD(v351) = v345 ^ 1;
  LODWORD(v351) = (v345 ^ 0xFFFFFFCF) << 24;
  int v350 = v351 >> 26;
  v332[12] = HIBYTE(v325) ^ (((v350 - 80 - ((2 * v350) & 0x60)) & 0xC0) >> 6) ^ (((8 * (v350 - 80)) ^ 0x7F)
                                                                                                + ((4
                                                                                                  * (v350 - 80 - ((2 * v350) & 0x60))) ^ 0xC0)
                                                                                                - 1) ^ 0xF1;
  LOBYTE(v350) = byte_100224740[((v349 - ((2 * v349) & 0x41E52924) + 552768658) ^ 0xDF0D6B6E) + v348];
  int v352 = ((v323 >> 8) & 0xAC ^ 0x5B41EBF7) - ((v323 >> 8) & 0x53);
  unsigned int v353 = ((v352 & 0xA5 ^ 0x8FCF3CA1) + (v352 & 0x15A ^ 0x40100011) - 1) ^ 0x3020C2BD;
  uint64_t v354 = (2 * v353 + 6) & 0x6147D3F0;
  LOBYTE(v350) = v350 ^ ((v350 ^ 0x5E) - ((2 * (v350 ^ 0x5E) + 42) & 0x32) + 14) ^ ((v350 ^ 0xAA)
                                                                                  + (~(2 * (v350 ^ 0xAA) + 2) | 0xB1)
                                                                                  - 87) ^ 0xEB;
  v332[14] = BYTE1(v325) ^ 0x1D ^ (v350 + ~(2 * ((v350 + 116) & 0x67 ^ v350 & 1)) - 37);
  unsigned int v355 = (((2 * (BYTE1(v323) ^ 0xC1)) | 0xE0F4D2A2) - (BYTE1(v323) ^ 0xC1) - 1887070545) ^ 0x3C734B51;
  v332[1] = byte_10023BF20[BYTE2(v324) ^ 0x18LL] ^ 0x3B;
  v332[6] = BYTE1(v323) ^ byte_100224740[((((2 * v355) | 0x3033C4C4) - v355 - 404349538) ^ (v353
                                                                                          - (_DWORD)v354
                                                                                          - 1331435013) ^ 0x32440ECF ^ (((((2 * v355) | 0x3033C4C4) - v355 - 404349538) ^ 0xABEF3F5A) - ((2 * ((((2 * v355) | 0x3033C4C4) - v355 - 404349538) ^ 0xABEF3F5A) + 2) & 0xADEE4F24) - 688445549))
                                       + 2] ^ 0xDD;
  unsigned int v356 = ((v324 >> 8) & 0x30) + (BYTE1(v324) ^ 0xFFFFFFBF) + (BYTE1(v324) | 0xB08B1BCF) + 1;
  v332[2] = BYTE1(v324) ^ byte_100224740[((v356 & 0x5E4950E7 ^ 0x4A400002)
                                        + (v356 ^ 0x34A953E5)
                                        - ((v356 ^ 0x34A953E5) & 0x5E4950E7)) ^ 0xDA6B1828LL] ^ 0x9F;
  unsigned int v357 = ((HIWORD(v329) & 0x1F ^ 0x8B90FE08) + (HIWORD(v329) & 0xE0 ^ 0xC1) - 1) ^ 0x9BD23E0B;
  v332[9] = byte_10023BF20[(((2 * v357) | 0xF4FD5DE) - v357 - 128445167) ^ 0x17E52A6ALL] ^ 0xBD;
  int v358 = 2 * v333 - ((4 * (_BYTE)v333 + 4) & 0xE0) + 371;
  unsigned int v359 = (v358 & 0xAE ^ 0x8A0A4385) + v333 + ((2 * v358) & 0x114 ^ 0xFFFFFEFF);
  uint64_t v360 = v359 - ((2 * v359 - 303184920) & 0xA50B61E8) - 914582808;
  v332[8] = byte_100221210[v360 ^ 0xD285B0FFLL] ^ v360 ^ 0x62;
  unsigned int v361 = (((BYTE1(v329) ^ 0xF) + ((v329 >> 8) & 0xCB ^ 0x7F56F6C0) - ((BYTE1(v329) ^ 0xF) & 0xCB)) ^ 0x80A90960) + 1;
  LODWORD(v360) = (((v329 >> 8) & 0xD9) + ((v329 >> 8) & 0x26 ^ 0x2A111521) + 511) ^ 0x2A111703;
  int v362 = v360 + (v361 ^ 0xE6DB9B7B) + ((2 * v361) & 0xCDB736F6) + 421815429;
  LODWORD(v360) = ((v362 - ((2 * v362) & 0x13F2F916) + 167345291) ^ 0xF606837B) + v360;
  LOBYTE(v360) = (((2 * ((v360 - 71 - ((2 * v360) & 0x72)) ^ 0x39)) | 0xDC)
                - ((v360 - 71 - ((2 * v360) & 0x72)) ^ 0x39)
                + 18) ^ byte_100224740[((_DWORD)v360 + 817878201 - ((2 * (_DWORD)v360) & 0x617FA972)) ^ 0x30BFD4BB];
  LOBYTE(v362) = (v360 & 0xA ^ 0xF7) + ((2 * (v360 & 0xA)) | 0x12) - 8;
  LOBYTE(v360) = ((v360 & 0xF5 ^ 0x64 | 0xC3) - (v360 & 0xF5 ^ 0x64 | 0x3C) + 60) ^ 0xE3;
  LOBYTE(v360) = (((2 * v360) & 0xD8) - v360 + 19) ^ 0x97 | v362 ^ 9;
  unsigned int v363 = (((32 * v325) ^ 0x5F469280) - 1424714661 - ((2 * ((32 * v325) ^ 0x5F469280)) & 0x56292880)) ^ 0xAB14945B | (((v325 >> 3) & 7) + ((v325 >> 3) & 0x18 ^ 0x1F148811) - 1) ^ 0x1F148802;
  int v364 = v363 - ((2 * v363) & 0xA0) - 48;
  HIDWORD(v351) = v364 ^ 1;
  LODWORD(v351) = v364 << 24;
  v332[10] = (v360 - ((2 * v360) & 0xC0) - 32) ^ 0xE0;
  LODWORD(v360) = ((BYTE2(v323) ^ 0x2A) - ((2 * (BYTE2(v323) ^ 0x2A)) & 0xFFFFFFF7) - 1196913925) ^ 0xF8AE2ED3;
  v332[5] = byte_10023BF20[(((2 * (_DWORD)v360) | 0x9BAD5584) - v360 + 841569598) ^ 0x8DD00EBCLL] ^ 0x48;
  LODWORD(v360) = byte_100214090[((v351 >> 29) - ((2 * (v351 >> 29)) & 0xF8) + 124) ^ 8LL];
  HIDWORD(v351) = v360 ^ 9;
  LODWORD(v351) = (v360 ^ 0xC0) << 24;
  LODWORD(v360) = (v351 >> 28) - ((2 * (v351 >> 28)) & 0xFFFFFFB6) + 91;
  v332[15] = (v360 & 0x80 | 0x3B) ^ (((v360 & 0x80) != 0) ^ (((v351 >> 28)
                                                                             - ((2 * (v351 >> 28)) & 0xB6)
                                                                             + 91) >> 4) | 0x50) ^ ((v360 & 6)
                                                                                                  + (v360 & 0x7F ^ 0x47)
                                                                                                  - ((v360 & 0x7F ^ 0x47) & 6)
                                                                                                  + 0x80) ^ 0x59;
  v332[*((void *)&a24 + 1)] = HIBYTE(v324) ^ 0x54 ^ byte_100221210[HIBYTE(v324) ^ 0xA1LL];
  LODWORD(v360) = byte_100214090[v323 ^ 0xF5LL];
  HIDWORD(v351) = v360 ^ 9;
  LODWORD(v351) = (v360 ^ 0xC0) << 24;
  LODWORD(v360) = (v351 >> 28) - ((2 * (v351 >> 28)) & 0x6A) + 53;
  v332[7] = v360 ^ (((v351 >> 28) - ((2 * (v351 >> 28)) & 0x6A) + 53) >> 4) ^ (((v360 & 0x80) != 0) | 0x1A) ^ 0x71;
  LOWORD(v360) = (v324 & 0xB8 ^ 0xDD29) + (v324 & 0x47) - 1;
  LODWORD(v360) = byte_100214090[((v360 & 0x1A4 ^ 0xE3281885) + (v360 & 0x45B) - 1) ^ 0xE3281DB7];
  HIDWORD(v351) = v360 ^ 9;
  LODWORD(v351) = (v360 ^ 0xC0) << 24;
  v332[3] = ((v351 >> 28) - ((2 * (v351 >> 28)) & 0xA2) + 81) ^ (((v351 >> 28)
                                                                                 - ((2 * (v351 >> 28)) & 0xA2)
                                                                                 + 81) >> 7) ^ (((v351 >> 28) - ((2 * (v351 >> 28)) & 0xA2) + 81) >> 4) ^ 0x75;
  return ((uint64_t (*)(uint64_t, _BYTE *, uint64_t, unsigned __int8 *, uint64_t, unsigned __int8 *, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t))((char *)*(&off_10025C670 + ((1033 * (HIDWORD(v367) > 0x10)) ^ (*(_DWORD *)(v45 - 228) - 566))) - 12))( 193LL,  v332,  a13,  byte_100221210,  v354,  byte_100214090,  9LL,  byte_10023BF20,  a9,  a10,  a11,  a12,  a13,  v366,  v367,  a16,  v368,  11LL,  a19,  1LL,  a21,  a22,  4LL,  a24,  *((void *)&a24 + 1),  a25,  8LL,  a27);
}

void sub_1001E9BF0()
{
}

char *sub_1001E9C38(char *result, char *a2, unint64_t a3)
{
  if (((a2 ^ result) & 7) != 0)
  {
  }

  else
  {
    unint64_t v3 = -(int)result & 7;
    switch((int)v3)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        char v4 = *result++;
        *a2++ = v4;
LABEL_6:
        char v5 = *result++;
        *a2++ = v5;
LABEL_7:
        char v6 = *result++;
        *a2++ = v6;
LABEL_8:
        char v7 = *result++;
        *a2++ = v7;
LABEL_9:
        char v8 = *result++;
        *a2++ = v8;
LABEL_10:
        char v9 = *result++;
        *a2++ = v9;
LABEL_11:
        char v10 = *result++;
        *a2++ = v10;
        break;
      default:
        break;
    }

    BOOL v11 = a3 >= v3;
    char v12 = a3 - v3;
    if (!v11) {
      char v12 = 0;
    }
    unint64_t v13 = v12 & 7;
    switch(v13)
    {
      case 0uLL:
        return result;
      case 1uLL:
        goto LABEL_24;
      case 2uLL:
        goto LABEL_23;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        goto LABEL_21;
      case 5uLL:
        goto LABEL_20;
      case 6uLL:
        goto LABEL_19;
      case 7uLL:
        char v14 = *result++;
        *a2++ = v14;
LABEL_19:
        char v15 = *result++;
        *a2++ = v15;
LABEL_20:
        char v16 = *result++;
        *a2++ = v16;
LABEL_21:
        char v17 = *result++;
        *a2++ = v17;
LABEL_22:
        char v18 = *result++;
        *a2++ = v18;
LABEL_23:
        char v19 = *result++;
        *a2++ = v19;
LABEL_24:
        *a2 = *result;
        break;
      default:
        result = (char *)((uint64_t (*)(void))((char *)&loc_1001E9D58 + 4 * byte_10021257F[(v13 >> 3) & 7]))();
        break;
    }
  }

  return result;
}

_BYTE *sub_1001E9DF8(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }

  unint64_t v4 = a3 - v3;
  unint64_t v6 = v4;
  unint64_t v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_1001E9E88 + 4 * byte_100212596[(v5 >> 3) & 7]))();
      break;
  }

  return result;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result) {
              return result;
            }
            uint64_t v3 = 0x1000000000LL;
          }

          else
          {
            uint64_t v3 = 0x800000000LL;
          }
        }

        else
        {
          uint64_t v3 = 0x400000000LL;
        }
      }

      else
      {
        uint64_t v3 = 8LL;
      }
    }

    else
    {
      uint64_t v3 = 3840LL;
    }

    *(void *)(a1 + 240) |= v3;
  }

  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    time_t v5 = 0LL;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
      }
    }
  }

  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8LL;
      goto LABEL_11;
    }
  }

  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000LL;
      goto LABEL_11;
    }

uint64_t X509PolicySetFlagsForTestAnchor(void *a1, uint64_t a2)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  v5[0] = 0LL;
  v5[1] = 0LL;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0LL, v5);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }

  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0LL;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!(_DWORD)result) {
      break;
    }
    v2 += 32LL;
    if (v2 == 160) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0LL;
  while (digests[v1 / 4] != (_DWORD)result)
  {
    v1 += 32LL;
    if (v1 == 160) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    unint64_t v6 = &CTOidSha1;
    uint64_t v4 = 5LL;
    goto LABEL_11;
  }

  uint64_t v4 = 9LL;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    unint64_t v6 = &CTOidSha256;
    goto LABEL_11;
  }

  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    unint64_t v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9LL;
    goto LABEL_11;
  }

  uint64_t v4 = 9LL;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    unint64_t v6 = &CTOidSha384;
    goto LABEL_11;
  }

  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    unint64_t v6 = &CTOidSha384;
    goto LABEL_18;
  }

  uint64_t v4 = 9LL;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    unint64_t v6 = &CTOidSha512;
    goto LABEL_18;
  }

  unint64_t v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1LL;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0LL;
  char v25 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0LL;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (unint64_t result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v12 = a5[9];
              uint64_t v11 = a5[10];
              if (__CFADD__(v12, v11)) {
                goto LABEL_31;
              }
              if (v12 > v12 + v11) {
                goto LABEL_32;
              }
              unint64_t v23 = a5[9];
              unint64_t v24 = v12 + v11;
              if (!v11 || (unint64_t result = ccder_blob_check_null((uint64_t)&v23), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n(a1);
                    if (!result) {
                      return result;
                    }
                    unint64_t v13 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }

                    unint64_t v14 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0LL;
                    }
                    unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v28 = -21846;
                    char v26 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v15 = a5[4];
                      LOBYTE(v27) = v15;
                      if ((unint64_t)&v26 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v15 <= 9)
                        {
                          uint64_t v16 = __memcpy_chk((char *)&v27 + 1, a5[3]);
                          if (v14 > 0x1068) {
                            return 0LL;
                          }
                          unint64_t result = __chkstk_darwin(v16);
                          char v18 = (unint64_t *)((char *)&v22 - v17);
                          unint64_t v19 = 0LL;
                          *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            char v21 = &v18[v19 / 8];
                            *(_OWORD *)char v21 = v20;
                            *((_OWORD *)v21 + 1) = v20;
                            v19 += 32LL;
                          }

                          while (v17 != v19);
                          if (v17 >= 1)
                          {
                            *char v18 = v13;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs( v18,  &v26,  a4,  a3,  a5[12],  a5[11],  &v25)) {
                              return v25 != 0;
                            }
                            unint64_t result = 0LL;
                            char v25 = 0;
                            return result;
                          }
                        }

                        goto LABEL_32;
                      }
                    }

                    goto LABEL_31;
                  }

LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

                            __break(0x5513u);
                            return result;
                          }

                          if (ccec_verify(v17, a4, a3, v20, v21, (char *)&v22 + 7)) {
LABEL_24:
                          }
                            HIBYTE(v22) = 0;
                        }

                        return HIBYTE(v22) != 0;
                      }

            __break(0x5519u);
          }
        }
      }

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0LL;
  BOOL v7 = 1;
  do
  {
    BOOL v7 = v6 < 3;
    a1 += 32LL;
    ++v6;
  }

  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0LL;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0LL;
  HIBYTE(v22) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              uint64_t result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                uint64_t v11 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v11, 3uLL))
                {
                  __break(0x550Cu);
                }

                else
                {
                  uint64_t v12 = 24 * v11;
                  BOOL v13 = __CFADD__(v12, 16LL);
                  unint64_t v14 = v12 + 16;
                  if (!v13 && v14 < 0xFFFFFFFFFFFFFFF0LL)
                  {
                    uint64_t result = __chkstk_darwin(result);
                    uint64_t v17 = (uint64_t *)((char *)&v22 - v15);
                    unint64_t v18 = 0LL;
                    do
                    {
                      unint64_t v19 = &v17[v18 / 8];
                      *unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
                      v19[1] = 0xAAAAAAAAAAAAAAAALL;
                      v18 += 16LL;
                    }

                    while (v15 != v18);
                    if (v16 >= 0x10)
                    {
                      *uint64_t v17 = result;
                      if (v15 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          uint64_t result = ccec_x963_import_pub_size(a2);
                          unint64_t v21 = *(void *)(a5 + 88);
                          uint64_t v20 = *(void *)(a5 + 96);
                          if (result == 256 && v20 == 64)
                          {
                            if (v21 < 0xFFFFFFFFFFFFFFE0LL)
                            {
                              if (!ccec_verify_composite( v17,  a4,  a3,  *(void *)(a5 + 88),  v21 + 32,  (char *)&v22 + 7)) {
                                return HIBYTE(v22) != 0;
                              }
                              goto LABEL_24;
                            }

uint64_t ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    return 0LL;
  }

  uint64_t v4 = *a1;
  int v6 = *v4;
  int v7 = *(int *)((char *)v4 + 3);
  if (v6 != -2127887098 || v7 != 587203713) {
    return 0LL;
  }
  return ccec_cp_521();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  int v7 = (void *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366LL;
  }
  char v8 = v7;
  uint64_t v9 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }

  uint64_t v10 = 24 * v9;
  BOOL v11 = __CFADD__(v10, 16LL);
  unint64_t v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0LL) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = __chkstk_darwin(v7);
  unint64_t v16 = (uint64_t *)((char *)&v19 - v14);
  unint64_t v17 = 0LL;
  do
  {
    unint64_t v18 = &v16[v17 / 8];
    *unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16LL;
  }

  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  *unint64_t v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }

  uint64_t result = ccec_import_pub(v8, a1[1], *a1, (char *)&v19 - v14);
  if (!(_DWORD)result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size(v8);
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub(v16, a3);
      }
      goto LABEL_20;
    }

    return 393220LL;
  }

  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  int v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6) {
    return 655366LL;
  }
  uint64_t v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v8 = 24 * v7;
  BOOL v9 = __CFADD__(v8, 16LL);
  unint64_t v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0LL)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }

  unint64_t result = __chkstk_darwin(v6);
  uint64_t v14 = (unint64_t *)((char *)&v18 - v12);
  unint64_t v15 = 0LL;
  do
  {
    unint64_t v16 = &v14[v15 / 8];
    *unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16LL;
  }

  while (v12 != v15);
  if (v13 < 0x10) {
    goto LABEL_24;
  }
  unint64_t *v14 = result;
  if (v12 >= 1)
  {
    uint64_t v17 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v17)
    {
      unint64_t result = cczp_bitlen(*v14);
      if (result < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v17 = 0LL;
          }
          else {
            uint64_t v17 = 393220LL;
          }
          ccec_export_pub(v14, a3);
          return v17;
        }

        goto LABEL_23;
      }

      goto LABEL_21;
    }

    return v17;
  }

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 327696LL;
  if (!result || !a2) {
    return v3;
  }
  uint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  unint64_t v10 = 0LL;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }

  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    int v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v12);
    uint64_t v6 = 327697LL;
    if (!v5 && !HIDWORD(v12))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698LL;
      }

      else
      {
        int v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        uint64_t v6 = 327699LL;
        if (!v7)
        {
          char v8 = v10;
          if (v10 <= 0xFF)
          {
            uint64_t v6 = 0LL;
            if (a3)
            {
              *(_DWORD *)a3 = v12;
              *(void *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(void *)(a3 + 24) = 0LL;
              *(void *)(a3 + 32) = 0LL;
            }
          }
        }
      }
    }

    return v6;
  }

  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, void *a2)
{
  unint64_t v2 = *(unsigned __int8 **)result;
  unint64_t v3 = *(void *)(result + 8);
  if (*(void *)result > v3) {
    goto LABEL_51;
  }
  uint64_t v4 = (void *)result;
  int v5 = *(unsigned __int8 **)result;
  if (*(void *)result < v3)
  {
    unint64_t v6 = v3 - (void)v2;
    int v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      int v7 = v5 + 1;
      *(void *)unint64_t result = v7;
      ++v5;
      if (!--v6)
      {
        int v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }

  unint64_t result = 327708LL;
  char v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16) {
    return result;
  }
  BOOL v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_51:
    __break(0x5519u);
LABEL_52:
    __break(0x5513u);
LABEL_53:
    __break(0x5500u);
    return result;
  }

  uint64_t v10 = 0LL;
  void *v4 = v9;
  if (v2 >= v5 || (signed int v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_47:
    unint64_t result = 0LL;
    if (a2) {
      *a2 = v10;
    }
  }

  else
  {
    char v12 = 0;
    uint64_t v10 = 0LL;
    uint64_t v13 = v11 >> 1;
    char v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        unint64_t v16 = *v2;
        uint64_t v17 = &asciiNibbleToByte[v16];
        BOOL v18 = v17 < (unsigned __int8 *)&CTOidAppleImg4Manifest && v17 >= asciiNibbleToByte;
        if (!v18) {
          goto LABEL_51;
        }
        if (v2 + 1 > v5 || v2 > v2 + 1) {
          goto LABEL_51;
        }
        unsigned int v15 = *v17;
        ++v2;
      }

      else
      {
        unsigned int v15 = 0;
      }

      if (v2 >= v5) {
        return 327703LL;
      }
      unint64_t v19 = *v2;
      uint64_t v20 = &asciiNibbleToByte[v19];
      uint64_t v22 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v22) {
        goto LABEL_51;
      }
      if (v15 > 0xF) {
        return 327703LL;
      }
      unsigned int v23 = *v20;
      if (v23 > 0xF) {
        return 327703LL;
      }
      unint64_t v24 = (unint64_t)(v23 | (16 * v15)) << (v14 & 0xF8);
      BOOL v18 = __CFADD__(v10, v24);
      v10 += v24;
      if (v18) {
        goto LABEL_53;
      }
      if (v22 < v5)
      {
        v14 -= 8;
        char v12 = 1;
        unint64_t v2 = v22;
        if (v13-- > 1) {
          continue;
        }
      }

      goto LABEL_47;
    }
  }

  return result;
}

uint64_t CTEvaluateBAASystem(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0LL, 0LL, 0LL, 0LL, &X509PolicyBAASystem);
}

unint64_t CTEvaluateBAASystemWithId( unint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v7 = 0LL;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0LL, 0LL, &v7, &v8, &X509PolicyBAASystem);
  if (!(_DWORD)result) {
    return CTFillBAAIdentity(v7, v8, v9, a5);
  }
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a1 & 0x800000) != 0 && a4)
  {
    unint64_t result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result) {
      return result;
    }
  }

  else if (!a4)
  {
    return 0LL;
  }

  unint64_t result = 0LL;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(void *)(a4 + 32) = 0LL;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      unint64_t result = 0LL;
      *(void *)(a4 + 24) = a2;
      *(void *)(a4 + 32) = a3;
      return result;
    }

    return 0LL;
  }

  return result;
}

unint64_t CTEvaluateBAASystemTestRoot( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  unint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v9 = 0LL;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, &X509PolicyBAASystem);
  if (!(_DWORD)result) {
    return CTFillBAAIdentity(v9, v10, v11, a7);
  }
  return result;
}

unint64_t CTEvaluateBAAUser(unint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v7 = 0LL;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0LL, 0LL, &v7, &v8, &X509PolicyBAAUser);
  if (!(_DWORD)result) {
    return CTFillBAAIdentity(v7, v8, v9, a5);
  }
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  unint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v9 = 0LL;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, &X509PolicyBAAUser);
  if (!(_DWORD)result) {
    return CTFillBAAIdentity(v9, v10, v11, a7);
  }
  return result;
}

unint64_t CTEvaluateBAASepApp( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  unint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v9 = 0LL;
  unint64_t result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, &X509PolicyBAASepApp);
  if (!(_DWORD)result) {
    return CTFillBAAIdentity(v9, v10, v11, a7);
  }
  return result;
}

uint64_t CTEvaluateBAAAccessory( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a5, a6, a3, a4, 0LL, &v12, &X509PolicyMFi4Attestation);
  if (!(_DWORD)result && a7)
  {
    if (a8)
    {
      uint64_t v11 = v13;
      *a7 = v12;
      *a8 = v11;
    }
  }

  return result;
}

uint64_t CTEvaluateBAA( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10)
{
  switch(a1)
  {
    case 1LL:
      uint64_t result = CTEvaluateBAASystemTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 2LL:
      uint64_t result = CTEvaluateBAAUserTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 3LL:
      uint64_t result = CTEvaluateBAAAccessory(a2, a3, a4, a5, a6, a7, a8, a9);
      break;
    case 4LL:
      uint64_t result = CTEvaluateBAASepApp(a2, a3, a4, a5, a6, a7, a10);
      break;
    default:
      uint64_t result = 327712LL;
      break;
  }

  return result;
}

uint64_t CTGetBAARootType(unint64_t a1, uint64_t a2)
{
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_14;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  return 3LL;
}

uint64_t CTGetBAASubCAType(unint64_t a1, uint64_t a2)
{
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_14;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  return 3LL;
}

uint64_t CTEvaluateDAK( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  unint64_t v7 = a1 + a2;
  if (a1 + a2 < a1) {
    goto LABEL_31;
  }
  uint64_t result = CTEvaluateBAAUserTestRoot(a1, a2, a3, a4, a5, a6, a7);
  if ((_DWORD)result) {
    return result;
  }
  *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[17] = v12;
  v27[18] = v12;
  v27[15] = v12;
  v27[16] = v12;
  v27[13] = v12;
  v27[14] = v12;
  v27[11] = v12;
  v27[12] = v12;
  v27[9] = v12;
  v27[10] = v12;
  v27[7] = v12;
  v27[8] = v12;
  v27[5] = v12;
  v27[6] = v12;
  v27[3] = v12;
  v27[4] = v12;
  v27[1] = v12;
  v27[2] = v12;
  v27[0] = v12;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v17 = 0LL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_32;
  }
  v16[0] = a1;
  v16[1] = v7;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(v16, (unint64_t)v27, 1LL, v18, &v17);
  if (!(_DWORD)result)
  {
    if (!v18[0]) {
      return 327691LL;
    }
    unint64_t v25 = 0LL;
    unint64_t v26 = 0LL;
    uint64_t result = CTParseExtensionValue( *(void *)v18[0],  *(void *)(v18[0] + 8LL),  &CTOidAppleFDRIdentity,  9uLL,  &v25,  &v26);
    if (!(_DWORD)result)
    {
      unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v25, v26))
      {
        if (v25 > v25 + v26) {
          goto LABEL_31;
        }
        unint64_t v23 = v25;
        unint64_t v24 = v25 + v26;
        unint64_t v22 = v26;
        uint64_t result = ccder_blob_decode_tl(&v23, 12LL, &v22);
        if (!(_DWORD)result) {
          return 720929LL;
        }
        if (v24 < v23) {
          goto LABEL_31;
        }
        unint64_t v13 = v22;
        if (v22 > v24 - v23) {
          goto LABEL_31;
        }
        unint64_t v25 = v23;
        unint64_t v26 = v22;
        if (!__CFADD__(v23, v22))
        {
          char v14 = (_BYTE *)v23;
          if (v23 < v23 + v22)
          {
            do
            {
              if (*v14 == 45) {
                goto LABEL_19;
              }
              ++v14;
              --v13;
            }

            while (v13);
            char v14 = (_BYTE *)(v23 + v22);
          }

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  __int16 v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  __int16 v28 = a1;
  unsigned int v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = ccder_blob_decode_ber_tl((uint64_t)&v28, 0x2000000000000010LL, (_BYTE *)&v27 + 1, &v26);
  uint64_t result = 65537LL;
  if (v7)
  {
    unint64_t v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    unint64_t v24 = v28;
    unint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl(&v24, 6LL, &v26))
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      unint64_t v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      unint64_t v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080LL;
      if (&v22[v30[0]] != v23) {
        return 131082LL;
      }
      unint64_t v10 = a3 + 11;
      uint64_t result = 131092LL;
      if (*v10 <= 4uLL && ((1LL << *v10) & 0x1A) != 0)
      {
        unsigned __int8 v35 = 0;
        size_t v34 = 0LL;
        unsigned int v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        unsigned int v32 = v22;
        unint64_t v33 = (unint64_t)&v22[v34];
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        uint64_t v11 = &v32[v34];
        v32 += v34;
        int v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          unsigned __int8 v40 = 0;
          int v38 = (char *)v33;
          unint64_t v39 = 0LL;
          char v37 = v11;
          if (ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000LL, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
            }

            if (v37 > v38) {
              goto LABEL_112;
            }
            unsigned int v32 = v37;
            unint64_t v33 = (unint64_t)v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            unint64_t v41 = 0LL;
            uint64_t v17 = v32;
            unint64_t v18 = v33;
            unint64_t v19 = v41;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0LL;
            }

            unint64_t v20 = &v17[v19];
            unsigned int v32 = v20;
          }

          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }

          uint64_t v11 = v32;
        }

        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        char v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        int v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        char v37 = v22;
        int v38 = v23;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000LL, &v31, v30) & 1) == 0)
        {
          unint64_t v13 = v22;
          int v15 = v23;
          goto LABEL_86;
        }

        unsigned int v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          unsigned int v32 = v37;
          unint64_t v33 = (unint64_t)&v37[v30[0]];
          unint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            int v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            unint64_t v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              char v37 = v13;
              int v38 = v15;
              if (ccder_blob_eat_ber_inner((unint64_t *)&v37, 0xA000000000000001LL, 0LL, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                unint64_t v23 = v38;
              }

              if (v30[2] >= v30[1])
              {
                unint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    unint64_t v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543LL;
                      }
                      return 0LL;
                    }

                    return (v4 + 5);
                  }
                }
              }
            }

LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }

        goto LABEL_114;
      }
    }

    else
    {
      return 65538LL;
    }
  }

  return result;
}

uint64_t ccder_blob_decode_ber_tl(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag(a1, &v10);
  uint64_t result = 0LL;
  if (v8)
  {
    if (v10 == a2) {
      return ccder_blob_decode_ber_len(a1, a3, a4);
    }
  }

  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1LL;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0LL, &v9);
  if (!(_DWORD)result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (__CFADD__(*a1, v9))
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }

  unint64_t v5 = v4 + v9;
  unint64_t v6 = a1[1];
  if (v4 <= v4 + v9)
  {
    BOOL v7 = v5 >= v6;
    BOOL v8 = v5 == v6;
  }

  else
  {
    BOOL v7 = 1;
    BOOL v8 = 0;
  }

  if (!v8 && v7) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1LL;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  unint64_t v84 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  unint64_t v84 = *(void *)(a1 + 40);
  unint64_t v85 = v4 + v3;
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0LL;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }

  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl((uint64_t)&v84, 0x2000000000000010LL, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }

    unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > v84 + v72 || v84 + v72 > v85) {
      goto LABEL_92;
    }
    unint64_t v69 = v84;
    unint64_t v70 = v84 + v72;
    if ((ccder_blob_decode_uint64(&v69, &v73) & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }

    unint64_t v9 = v69;
    unint64_t v8 = v70;
    unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    unint64_t v67 = v69;
    unint64_t v68 = v70;
    unint64_t v65 = v69;
    unint64_t v66 = v70;
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&__int128 v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > v10 + v72 || v10 + v72 > v70) {
      goto LABEL_92;
    }
    unint64_t v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }

    unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    unint64_t v63 = v69;
    unint64_t v64 = v70;
    if (ccder_blob_decode_tl(&v63, 0xA000000000000000LL, &v72))
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&__int128 v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > v63 + v72 || v63 + v72 > v64) {
        goto LABEL_92;
      }
      unint64_t v69 = v63 + v72;
      unint64_t v70 = v64;
    }

    else
    {
      *((void *)&v75 + 1) = 0LL;
      *(void *)&__int128 v76 = 0LL;
    }

    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }

    if ((ccder_blob_decode_tl(&v69, 4LL, &v72) & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }

    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&__int128 v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    unint64_t v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    unint64_t v63 = v12;
    unint64_t v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001LL, 0LL, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      unint64_t v69 = v63;
      unint64_t v70 = v64;
    }

    if ((ccder_blob_decode_eoc(&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }

    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      char v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176LL * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176LL * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              unint64_t v33 = find_digest(v30 + 176LL * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176LL * v29);
                    unint64_t v37 = v35 + 176LL * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    __int128 v40 = v73;
                    __int128 v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *unsigned __int8 v36 = v40;
                    __int128 v42 = v76;
                    __int128 v43 = v77;
                    __int128 v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    __int128 v45 = v80;
                    __int128 v46 = v81;
                    __int128 v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }

          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              unint64_t v20 = (_OWORD *)(v19 + 176LL * v60);
              if (176 * v17 - 176LL * v60 < 0xB0) {
                goto LABEL_92;
              }
              __int128 v21 = v73;
              __int128 v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *unint64_t v20 = v21;
              __int128 v23 = v76;
              __int128 v24 = v77;
              __int128 v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              __int128 v26 = v80;
              __int128 v27 = v81;
              __int128 v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }

              ++v60;
            }
          }
        }
      }
    }

    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    unint64_t v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }

    if (v69 == v85)
    {
      if (v60) {
        return 0LL;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0LL;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0LL;
        int v51 = *(_OWORD **)(a1 + 56);
        __int128 v52 = v73;
        __int128 v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *int v51 = v52;
        __int128 v54 = v76;
        __int128 v55 = v77;
        __int128 v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        __int128 v57 = v80;
        __int128 v58 = v81;
        __int128 v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }

LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }

    return (v48 << 8) | 0x30008;
  }

  if ((ccder_blob_decode_tl(&v67, 0x8000000000000000LL, &v72) & 1) != 0)
  {
    unint64_t v10 = v67;
    unint64_t v11 = v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    unint64_t v69 = v10;
    unint64_t v70 = v11;
    goto LABEL_19;
  }

  if (ccder_blob_decode_tl(&v65, 0xA000000000000000LL, &v72))
  {
    unint64_t v10 = v65;
    unint64_t v11 = v66;
    goto LABEL_17;
  }

  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3LL)
  {
    if (*(void *)a3 != 1LL) {
      return 524289LL;
    }
    uint64_t v8 = 524293LL;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            unint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              unint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }

            goto LABEL_36;
          }
        }
      }
    }

    goto LABEL_48;
  }

  if (*(void *)(a2 + 88) == 1LL) {
    return 524298LL;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl(&v20, 0x8000000000000000LL, &v19))
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }

  uint64_t v8 = 524294LL;
  if (!ccder_blob_decode_tl(&v15, 0xA000000000000000LL, &v19)
    || !ccder_blob_decode_tl(&v15, 4LL, &v19))
  {
    return v8;
  }

  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }

  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295LL;
  }
  unint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543LL;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682LL;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  unint64_t v9 = v8;
  memset(v87, 0, sizeof(v87));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    uint64_t v13 = a2[9];
    if (v13)
    {
      uint64_t v14 = a2[10];
      if (v14)
      {
        unint64_t v10 = v87;
        uint64_t v15 = ccdigest(v8, v14, v13, v87);
        unint64_t v11 = *v9;
        if (*v9 >= 0x41) {
          goto LABEL_206;
        }
        goto LABEL_16;
      }
    }

    if (!v10) {
      goto LABEL_165;
    }
  }

  if (*v8 != v11)
  {
LABEL_165:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710LL;
  }

  if (v11 > 0x40) {
    goto LABEL_206;
  }
  uint64_t v15 = __memcpy_chk(v87, a2[13]);
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v17 = (const void **)(a3 + 128);
  uint64_t v18 = *(void *)(a3 + 48);
  if (!v18)
  {
LABEL_185:
    uint64_t result = CMSBuildPath(v15, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0LL;
      case 524294:
        goto LABEL_202;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753) {
          goto LABEL_193;
        }
        int v67 = 524296;
LABEL_192:
        *(_DWORD *)(a3 + 168) = v67;
LABEL_193:
        uint64_t v68 = *v9;
        if (*v9 > 0x40) {
          goto LABEL_206;
        }
        v76[0] = (uint64_t)v87;
        v76[1] = v68;
        uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v76, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          int v69 = *(_DWORD *)(a3 + 168);
          if (!v69 || v69 == 458753 || v69 == 327681) {
            *(_DWORD *)(a3 + 168) = result;
          }
          uint64_t result = 0LL;
        }

        break;
      case 524297:
        int v67 = 524297;
        goto LABEL_192;
      default:
        if ((_DWORD)result) {
          goto LABEL_202;
        }
        goto LABEL_193;
    }

    goto LABEL_202;
  }

  uint64_t v73 = a1;
  __int128 v80 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v81 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v19 = *(void *)(a3 + 40);
  if (__CFADD__(v19, v18)) {
LABEL_207:
  }
    __break(0x5513u);
  unint64_t v20 = v19 + v18;
  if (v19 > v20)
  {
LABEL_206:
    __break(0x5519u);
    goto LABEL_207;
  }

  __int128 v80 = *(char **)(a3 + 40);
  unint64_t v81 = v20;
  unint64_t v79 = 0xAAAAAAAAAAAAAAAALL;
  if (v19 >= v20)
  {
    uint64_t result = 262156LL;
    goto LABEL_202;
  }

  int v21 = 0;
  uint64_t v75 = 0x2000000000000010LL;
  unsigned int v72 = 262146;
  unsigned int v74 = 262147;
  int v71 = 458754;
  do
  {
    if (!ccder_blob_decode_tl(&v80, v75, &v79))
    {
      uint64_t result = 262145LL;
      goto LABEL_202;
    }

    if (__CFADD__(v80, v79)) {
      goto LABEL_207;
    }
    __int128 v22 = &v80[v79];
    __int128 v78 = (char *)0xAAAAAAAAAAAAAAAALL;
    __int128 v77 = (char *)0xAAAAAAAAAAAAAAAALL;
    __int128 v77 = v80;
    __int128 v78 = &v80[v79];
    if (!ccder_blob_decode_tl(&v77, 6LL, &v79))
    {
      uint64_t result = v72;
      goto LABEL_202;
    }

    __int128 v24 = v77;
    if (__CFADD__(v77, v79)) {
      goto LABEL_207;
    }
    if (v77 > &v77[v79] || &v77[v79] > v78) {
      goto LABEL_206;
    }
    v77 += v79;
    if (v79 != 9) {
      goto LABEL_168;
    }
    if (*(void *)v24 == 0x9010DF78648862ALL && v24[8] == 3)
    {
      if ((v21 & 1) != 0) {
        goto LABEL_170;
      }
      __int128 v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
      int v35 = ccder_blob_decode_tl(&v77, 0x2000000000000011LL, &v82);
      uint64_t result = v74;
      if (v35)
      {
        *(void *)unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v77, *(void *)v85)) {
          goto LABEL_207;
        }
        if (&v77[*(void *)v85] == v78)
        {
          if (v77 > &v77[*(void *)v85]) {
            goto LABEL_206;
          }
          else {
            uint64_t result = 0LL;
          }
        }

        else
        {
LABEL_73:
          uint64_t result = 262148LL;
        }
      }

      v21 |= 1u;
LABEL_154:
      if ((_DWORD)result) {
        goto LABEL_202;
      }
      goto LABEL_155;
    }

    if (*(void *)v24 == 0x9010DF78648862ALL && v24[8] == 4)
    {
      if ((v21 & 2) != 0) {
        goto LABEL_170;
      }
      __int128 v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
      int v36 = ccder_blob_decode_tl(&v77, 0x2000000000000011LL, &v82);
      uint64_t result = v74;
      if (v36)
      {
        *(void *)unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v77, *(void *)v85)) {
          goto LABEL_207;
        }
        if (&v77[*(void *)v85] == v78 && (__int128 v52 = find_digest((uint64_t)v6)) != 0LL)
        {
          uint64_t v53 = *(void *)v85;
          if (*(void *)v85 != *(void *)(a3 + 136)
            || v53 != *(void *)(*((uint64_t (**)(void))v52 + 3))()
            || memcmp(*v17, v77, *(size_t *)v85))
          {
            *(_DWORD *)(a3 + 168) = v71;
          }

          uint64_t result = 0LL;
        }

        else
        {
LABEL_80:
          uint64_t result = 262148LL;
        }
      }

      v21 |= 2u;
      goto LABEL_154;
    }

    if (*(void *)v24 == 0x96463F78648862ALL && v24[8] == 2)
    {
      if ((v21 & 0x10) != 0) {
        goto LABEL_170;
      }
      unint64_t v84 = 0xAAAAAAAAAAAAAAAALL;
      int v37 = ccder_blob_decode_tl(&v77, 0x2000000000000011LL, &v84);
      uint64_t result = v74;
      if (v37)
      {
        BOOL v38 = v77;
        unint64_t v39 = v78;
        if (v77 >= v78)
        {
LABEL_111:
          if (v38 == v39) {
            uint64_t result = 0LL;
          }
          else {
            uint64_t result = 262155LL;
          }
        }

        else
        {
          while (1)
          {
            if (!ccder_blob_decode_tl(&v77, v75, &v84))
            {
              uint64_t result = 262157LL;
              goto LABEL_153;
            }

            memset(v85, 170, 16);
            if (__CFADD__(v77, v84)) {
              goto LABEL_207;
            }
            if (v77 > &v77[v84] || &v77[v84] > v78) {
              goto LABEL_206;
            }
            *(void *)unint64_t v85 = v77;
            *(void *)&v85[8] = &v77[v84];
            if ((ccder_blob_decode_tl(v85, 6LL, &v84) & 1) == 0)
            {
              uint64_t result = 262151LL;
              goto LABEL_153;
            }

            __int128 v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
            __int128 v83 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
            if (*(void *)&v85[8] < *(void *)v85 || v84 > *(void *)&v85[8] - *(void *)v85) {
              goto LABEL_206;
            }
            __int128 v82 = *(_BYTE **)v85;
            __int128 v83 = (_BYTE *)v84;
            if (__CFADD__(*(void *)v85, v84)) {
              goto LABEL_207;
            }
            if (*(void *)v85 > *(void *)v85 + v84 || *(void *)v85 + v84 > *(void *)&v85[8]) {
              goto LABEL_206;
            }
            *(void *)v85 += v84;
            if (!ccder_blob_decode_tl(v85, 4LL, &v84))
            {
              uint64_t result = 262152LL;
              goto LABEL_153;
            }

            uint64_t v41 = *(void *)v85;
            if (__CFADD__(*(void *)v85, v84)) {
              goto LABEL_207;
            }
            unint64_t v42 = *(void *)v85 + v84;
            if (*(void *)v85 > *(void *)v85 + v84) {
              goto LABEL_206;
            }
            uint64_t v43 = *(void *)&v85[8];
            if (v42 > *(void *)&v85[8]) {
              goto LABEL_206;
            }
            *(void *)v85 += v84;
            if (v42 != *(void *)&v85[8]) {
              break;
            }
            __int128 v44 = find_digest((uint64_t)&v82);
            if (v44)
            {
              unsigned int v45 = *v44;
              if (*v44 > *(_DWORD *)(a3 + 104))
              {
                unsigned int v46 = *(_DWORD *)(v73 + 8);
                if (!v46 || v45 <= v46)
                {
                  *(_DWORD *)(a3 + 104) = v45;
                  unint64_t v47 = v84;
                  if (v84 > v43 - v41) {
                    goto LABEL_206;
                  }
                  *(void *)(a3 + 112) = v41;
                  *(void *)(a3 + 120) = v47;
                }
              }
            }

            BOOL v38 = *(char **)v85;
            unint64_t v39 = v78;
            __int128 v77 = *(char **)v85;
          }

          uint64_t result = 262153LL;
        }
      }

LABEL_153:
      v21 |= 0x10u;
      goto LABEL_154;
    }

    if (*(void *)v24 == 0x9010DF78648862ALL && v24[8] == 5)
    {
      if ((v21 & 4) != 0) {
        goto LABEL_170;
      }
      unint64_t v84 = 0xAAAAAAAAAAAAAAAALL;
      int v48 = ccder_blob_decode_tl(&v77, 0x2000000000000011LL, &v84);
      uint64_t result = v74;
      if (v48)
      {
        __int128 v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
        memset(v85, 170, 16);
        if (v77 > v78) {
          goto LABEL_206;
        }
        *(void *)unint64_t v85 = v77;
        *(void *)&v85[8] = v78;
        if (ccder_blob_decode_tl(&v77, 23LL, &v82))
        {
          int v49 = v77;
LABEL_135:
          if (__CFADD__(v49, v82)) {
            goto LABEL_207;
          }
          if (&v82[(void)v49] == v78) {
            uint64_t result = 0LL;
          }
          else {
            uint64_t result = 262148LL;
          }
          goto LABEL_148;
        }

        if ((ccder_blob_decode_tl(v85, 24LL, &v82) & 1) != 0)
        {
          int v49 = *(char **)v85;
          if (*(void *)v85 > *(void *)&v85[8]) {
            goto LABEL_206;
          }
          __int128 v77 = *(char **)v85;
          __int128 v78 = *(char **)&v85[8];
          goto LABEL_135;
        }

        uint64_t result = 262148LL;
      }

LABEL_208:
  __break(0x5500u);
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }

  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, &v9);
}

uint64_t CMSVerify( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v29 = 0LL;
  v30[0] = 0LL;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0LL;
  uint64_t v25 = 0LL;
  __int128 v23 = 0u;
  __int128 v24 = (char *)&v23 + 8;
  v30[1] = 0LL;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4LL;
  v22[1] = (unint64_t)__b;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  memset(v19, 0, sizeof(v19));
  __int128 v27 = v19;
  *(void *)&v28[0] = 1LL;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091LL;
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos( (uint64_t)v22,  (uint64_t)v30,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v8 = 0LL;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, &v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  return CMSVerify(a1, a2, 0LL, 0LL, a5, &v6, &v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *(unsigned __int8 **)result;
  if (!*(void *)result) {
    return 0LL;
  }
  unint64_t v4 = *(void *)(result + 8);
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }

  *(void *)uint64_t result = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        uint64_t v8 = v3 + 2;
        *(void *)uint64_t result = v8;
        unint64_t v7 = *v5;
        uint64_t v5 = v8;
        break;
      case 0x82u:
        uint64_t v9 = v3 + 3;
        unint64_t v10 = (unint64_t)v3[1] << 8;
        uint64_t v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        uint64_t v9 = v3 + 4;
        unint64_t v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v11 = v3[3];
LABEL_40:
        unint64_t v7 = v10 | v11;
        *(void *)uint64_t result = v9;
        uint64_t v5 = v9;
        break;
      default:
        return 0LL;
    }
  }

  *a3 = v7;
  return 1LL;
}

uint64_t CMSParseImplicitCertificateSet( unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0LL;
  a4[1] = 0LL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }

  unint64_t v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0LL;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1LL;
  }

  else
  {
    unint64_t v12 = 0LL;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    __int128 v27 = (unint64_t **)(a4 + 1);
    __int128 v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!v32) {
        goto LABEL_8;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304LL;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0LL;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }

        *unint64_t v17 = v15;
        *__int128 v27 = (unint64_t *)(v15 + 272);
      }

      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *__int128 v23 = *a4;
        unint64_t v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        __int128 v20 = v27;
        if (!v7) {
          __int128 v20 = v19;
        }
        *__int128 v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }

        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }

      if (v6 < v5) {
        goto LABEL_43;
      }
      unint64_t v21 = v30;
      uint64_t v22 = v30 - v5;
      if (v30 - v5 > v6 - v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if (v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304LL;
        unint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }

      goto LABEL_8;
    }
  }

uint64_t ccder_blob_eat_ber_inner(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag(a1, &v14);
  uint64_t result = 0LL;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = ccder_blob_decode_ber_len((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0LL;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }

    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = ccder_blob_eat_ber_inner(a1, 0LL, 0LL, (char)(a4 - 1));
        if (!(_DWORD)result) {
          return result;
        }
        return (ccder_blob_decode_eoc(a1, 1) & 1) != 0;
      }

      return 0LL;
    }

    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1LL;
    }

LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }

  return result;
}

          __break(0x5519u);
          return result;
        }

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t v16 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v16);
  if ((_DWORD)result)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v5 = *a1;
    if (!__CFADD__(*a1, v16))
    {
      if (v5 > v5 + v16 || v5 + v16 > a1[1]) {
        goto LABEL_28;
      }
      unint64_t v13 = *a1;
      unint64_t v14 = v5 + v16;
      uint64_t result = ccder_blob_decode_tl(&v13, 6LL, &v15);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v7 = v15;
      unint64_t v8 = v13;
      if (a2)
      {
        if (v14 < v13 || v15 > v14 - v13) {
          goto LABEL_28;
        }
        *a2 = v13;
        a2[1] = v7;
      }

      if (!__CFADD__(v8, v7))
      {
        unint64_t v9 = v8 + v7;
        if (v9 == v14)
        {
          if (v9 <= a1[1] && *a1 <= v9)
          {
            *a1 = v9;
            return 1LL;
          }

uint64_t ccder_blob_decode_Time(unint64_t *a1, unint64_t *a2)
{
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0LL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = a1[1];
  if (*a1 > v2) {
    goto LABEL_17;
  }
  unint64_t v11 = *a1;
  unint64_t v12 = v2;
  uint64_t result = ccder_blob_decode_tl(&v11, 23LL, &v13);
  if ((result & 1) != 0)
  {
    unint64_t v6 = v13;
    if (v13 != 13) {
      return 0LL;
    }
LABEL_8:
    unint64_t v9 = v11;
    if (a2)
    {
      if (v12 < v11 || v6 > v12 - v11) {
        goto LABEL_17;
      }
      *a2 = v11;
      a2[1] = v6;
    }

    if (__CFADD__(v9, v6))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v10 = v9 + v6;
    if (v10 <= a1[1] && *a1 <= v10)
    {
      *a1 = v10;
      return 1LL;
    }

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0LL;
  unint64_t v23 = 0LL;
  if (a2 && a3)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v6 = a1[1];
    if (*a1 > v6) {
      goto LABEL_49;
    }
    unint64_t v21 = *a1;
    unint64_t v22 = v6;
    uint64_t result = ccder_blob_decode_tl(&v21, 0xA000000000000000LL, &v23);
    if ((_DWORD)result)
    {
      *a2 = 0;
      goto LABEL_6;
    }

    unint64_t v9 = a1[1];
    if (*a1 > v9) {
      goto LABEL_49;
    }
    unint64_t v21 = *a1;
    unint64_t v22 = v9;
    uint64_t result = ccder_blob_decode_tl(&v21, 0x8000000000000001LL, &v23);
    if ((_DWORD)result)
    {
      unint64_t v10 = v21;
      if (v22 < v21) {
        goto LABEL_49;
      }
      unint64_t v11 = v23;
      if (v23 > v22 - v21) {
        goto LABEL_49;
      }
      *a3 = v21;
      a3[1] = v11;
      int v12 = 1;
      goto LABEL_18;
    }

    unint64_t v13 = a1[1];
    if (*a1 > v13) {
      goto LABEL_49;
    }
    unint64_t v21 = *a1;
    unint64_t v22 = v13;
    uint64_t result = ccder_blob_decode_tl(&v21, 0x8000000000000002LL, &v23);
    if ((_DWORD)result)
    {
      unint64_t v10 = v21;
      if (v22 < v21) {
        goto LABEL_49;
      }
      unint64_t v11 = v23;
      if (v23 > v22 - v21) {
        goto LABEL_49;
      }
      *a3 = v21;
      a3[1] = v11;
      int v12 = 2;
      goto LABEL_18;
    }

    unint64_t v14 = a1[1];
    if (*a1 > v14) {
      goto LABEL_49;
    }
    unint64_t v21 = *a1;
    unint64_t v22 = v14;
    uint64_t result = ccder_blob_decode_tl(&v21, 0xA000000000000003LL, &v23);
    if ((_DWORD)result)
    {
      int v15 = 3;
LABEL_27:
      *a2 = v15;
LABEL_6:
      if (!__CFADD__(v21, v23))
      {
        unint64_t v8 = v21 + v23;
LABEL_20:
        if (v8 <= a1[1] && *a1 <= v8)
        {
          *a1 = v8;
          return 1LL;
        }

LABEL_50:
      __break(0x5513u);
      return result;
    }

    unint64_t v20 = a1[1];
    if (*a1 > v20) {
      goto LABEL_49;
    }
    unint64_t v21 = *a1;
    unint64_t v22 = v20;
    uint64_t result = ccder_blob_decode_tl(&v21, 0x8000000000000008LL, &v23);
    if ((_DWORD)result)
    {
      int v15 = 8;
      goto LABEL_27;
    }
  }

  return result;
}

        __break(0x5513u);
        goto LABEL_51;
      }

uint64_t ccder_blob_check_null(uint64_t a1)
{
  uint64_t v2 = 0LL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 5LL, &v2);
  if (v2) {
    return 0LL;
  }
  else {
    return result;
  }
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0LL;
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }

      goto LABEL_11;
    }
  }

  else
  {
LABEL_11:
    uint64_t result = 0LL;
    if (a5) {
      *a5 = v6;
    }
  }

  return result;
}

uint64_t CTParseExtensionValue( unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    uint64_t result = 720914LL;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0LL;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0LL;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0LL, 0LL, a9, (uint64_t)&X509PolicySavage, 2LL);
}

uint64_t CTEvaluateCertifiedChip( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result = (uint64_t)memset(__b, 170, sizeof(__b));
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0LL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4LL, &v33[2], &v32);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t result = 327690LL;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692LL;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  unint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *unint64_t v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0LL && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0LL;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0LL);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000LL) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  __int128 v24 = (__int128 *)oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey( &v28,  (uint64_t)&ecPublicKey,  v24,  (void *)(v23 + 16),  (__int128 *)(v23 + 40),  (__int128 *)(v23 + 56));
  if ((_DWORD)result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000LL) != 0) {
      goto LABEL_35;
    }
  }

  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691LL;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0LL;
  }
  v27[0] = 0LL;
  v27[1] = 0LL;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }

  uint64_t result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!(_DWORD)result) {
    return 0LL;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0LL, 0LL, 0LL, 0LL, a7, (uint64_t)&X509PolicySavage, 2LL);
}

uint64_t CTEvaluateYonkersCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0LL, 0LL, a9, (uint64_t)&X509PolicyYonkers, 0x80000LL);
}

uint64_t CTEvaluateSensorCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip( a1,  a2,  a3,  a4,  a7,  a8,  a9,  a10,  a5,  a6,  a11,  (uint64_t)&X509PolicySensor,  0x10000000000LL);
}

uint64_t CTEvaluateCertsForPolicy( unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, __int128 *a11)
{
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4LL, &v38[2], &v37);
  if ((_DWORD)result) {
    return result;
  }
  if (v35 != v36) {
    return 327690LL;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    unint64_t v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      unint64_t v21 = &v38[1];
    }
    *unint64_t v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    __int128 v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      __int128 v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }

    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      __int128 v27 = oidForPubKeyLength();
    }

    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0LL);
    if (!(_DWORD)result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }

        uint64_t result = 0LL;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0LL;
            *a9 = v29[30];
          }
        }
      }
    }

    return result;
  }

  if (v39[265])
  {
    if (v38[2])
    {
      unint64_t v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        unint64_t v22 = (_BYTE *)*((void *)v22 + 34);
        if (!v22)
        {
          unint64_t v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }

    else
    {
      unint64_t v22 = 0LL;
    }
  }

  else
  {
    unint64_t v22 = v39;
  }

  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0LL, 0LL, 0LL, 0LL, &X509PolicySatori);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0LL, 0LL, 0LL, 0LL, &X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0LL, 0LL, 0LL, 0LL, &X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0LL, 0LL, &X509PolicyUcrt);
}

uint64_t CTEvaluatePragueSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  unint64_t v9 = 0xAAAAAAAA0000AA01LL;
  __int128 v8 = xmmword_10023E7B0;
  BYTE1(v9) = a5;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  unint64_t v9 = 0xAAAAAAAA0000AA01LL;
  __int128 v8 = xmmword_10023E7C0;
  BYTE1(v9) = a5;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700LL;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707LL;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000LL) == 0)
  {
    if ((v7 & 0x200000000LL) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1LL)
      {
        if (v5 > 0x13) {
          return 327704LL;
        }
        unint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0LL;
          uint64_t v17 = 0LL;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
          }

LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }

        goto LABEL_13;
      }
    }

LABEL_41:
    __break(0x5513u);
    return result;
  }

  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1LL) {
    goto LABEL_41;
  }
  unint64_t v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0LL;
    uint64_t v10 = 0LL;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
      }

      goto LABEL_23;
    }

    goto LABEL_37;
  }

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 327702LL;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00LL;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent( a1,  (uint64_t (*)(void, int *, uint64_t))CTCompareGeneralNameToHostname,  (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }

  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, void *a2, unint64_t a3)
{
  if ((_DWORD)result != 2) {
    return 1LL;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1LL;
        }
        unint64_t v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42) {
          return 1LL;
        }
        if (v14 != (_BYTE *)-1LL)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2LL;
            uint64_t v17 = -v16;
            uint64_t v18 = 2LL;
            uint64_t result = 1LL;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1LL;
                }
                size_t v19 = 0LL;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }

                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result) {
                    goto LABEL_48;
                  }
                }

                if (v11 != 46) {
                  return 1LL;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1LL;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1LL;
                }

                goto LABEL_50;
              }

              if (v13 == ++v18) {
                return result;
              }
            }

            goto LABEL_50;
          }

          return 1LL;
        }

LABEL_48:
      uint64_t result = 0LL;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }

LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  unint64_t v20 = 0xAAAAAAAA00AAAA01LL;
  unint64_t v21 = &null_octet;
  __int128 v19 = xmmword_10023E7D0;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  __int128 v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0LL, 0LL, 0LL, 0LL, &v19);
  if (!(_DWORD)result)
  {
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    unint64_t v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }

    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1LL, &v15[1], v15);
      if (!(_DWORD)result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }

  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  return 2LL;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712LL;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0LL, 0LL, 0LL, 0LL, &X509PolicySEK), (_DWORD)result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy( a2,  a3,  0,  1,  a4,  a5,  (uint64_t)&_sek_test_root_public_key,  97LL,  0LL,  0LL,  &X509PolicySEK);
      }
    }
  }

  return result;
}

uint64_t CTCopyUID(uint64_t result, _BYTE *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      goto LABEL_6;
    }

    goto LABEL_34;
  }

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v70 = 0LL;
  uint64_t v71 = 0LL;
  unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915LL;
  unint64_t v68 = *a2;
  unint64_t v69 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl(&v68, 0x2000000000000010LL, &v71);
  if (!(_DWORD)result) {
    return v10;
  }
  uint64_t v12 = v71;
  unint64_t v13 = v68;
  unint64_t v14 = v71 + v68 - v4;
  if (__CFADD__(v71, v68 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v69) {
    goto LABEL_186;
  }
  unint64_t v66 = v13;
  unint64_t v67 = v15;
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  if (ccder_blob_decode_tl(&v64, 0xA000000000000000LL, &v70))
  {
    unint64_t v16 = v70;
    unint64_t v17 = v64;
    if (__CFADD__(v64, v70)) {
      goto LABEL_187;
    }
    uint64_t v18 = 720916LL;
    if (ccder_blob_decode_uint64(&v64, a1 + 32) && v64 == v17 + v16)
    {
      if (v17 + v16 > v65) {
        goto LABEL_186;
      }
      unint64_t v66 = v17 + v16;
      unint64_t v67 = v65;
      goto LABEL_14;
    }

    return v18;
  }

LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }

LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(unint64_t *a1, int a2, BOOL *a3)
{
  unint64_t v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_22;
  }
  unint64_t v13 = (unsigned __int8 *)*a1;
  unint64_t v14 = v3;
  uint64_t v12 = 0LL;
  uint64_t result = ccder_blob_decode_tl(&v13, 1LL, &v12);
  if ((result & 1) != 0)
  {
    if (v12 == 1)
    {
      unint64_t v8 = v13;
      if ((unint64_t)v13 < v14)
      {
        int v9 = *v13;
        if (v9 != 255 && v9 != 0) {
          return 0LL;
        }
        if (a3) {
          *a3 = v9 != 0;
        }
        if (v8 == (unsigned __int8 *)-1LL)
        {
          __break(0x5513u);
          return result;
        }

        int v11 = v8 + 1;
        if ((unint64_t)v11 <= a1[1] && *a1 <= (unint64_t)v11)
        {
          *a1 = (unint64_t)v11;
          return 1LL;
        }
      }

uint64_t X509ExtensionParseKeyUsage(uint64_t a1, _BYTE *a2)
{
  unint64_t v6 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = 0LL;
  uint64_t result = ccder_blob_decode_bitstring(a1, &v6, &v5);
  if ((_DWORD)result)
  {
    if (v7 != *(void *)(a1 + 8) || v6 == (_BYTE *)v7 || v5 > 8)
    {
      return 0LL;
    }

    else if ((unint64_t)v6 >= v7)
    {
      __break(0x5519u);
    }

    else
    {
      *a2 = *v6 & (-1 << (8 - v5));
      return 1LL;
    }
  }

  return result;
}

uint64_t X509ExtensionParseBasicConstraints(unint64_t *a1, unint64_t *a2, BOOL *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v11);
  if ((_DWORD)result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_uint64(a1, &v10);
      if ((_DWORD)result)
      {
        if (!*a3) {
          return 0LL;
        }
        unint64_t v7 = v10;
        *a2 = v10;
        BOOL v8 = __CFADD__(v7, 1LL);
        unint64_t v9 = v7 + 1;
        if (v8)
        {
          __break(0x5500u);
          return result;
        }

        *a2 = v9;
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier( unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v14);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_15;
    }
    if (v7 + v14 != a1[1]) {
      return 0LL;
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14) {
      goto LABEL_16;
    }
    unint64_t v11 = v7;
    unint64_t v12 = v7 + v14;
    uint64_t result = ccder_blob_decode_tl(&v11, 0x8000000000000000LL, &v13);
    if ((_DWORD)result)
    {
      if (v12 < v11) {
        goto LABEL_16;
      }
      unint64_t v8 = v13;
      if (v13 > v12 - v11) {
        goto LABEL_16;
      }
      *a2 = v11;
      *a3 = v8;
    }

    unint64_t v9 = *a1;
    if (__CFADD__(*a1, v14))
    {
LABEL_15:
      __break(0x5513u);
    }

    else
    {
      unint64_t v10 = v9 + v14;
      if (v9 <= v9 + v14 && v10 <= a1[1])
      {
        *a1 = v10;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseSubjectKeyIdentifier( unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v17);
  if ((_DWORD)result)
  {
    unint64_t v7 = a1[1];
    unint64_t v8 = v17;
    BOOL v10 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (v10)
    {
      BOOL v10 = v17 >= v9;
      BOOL v11 = v17 == v9;
    }

    else
    {
      BOOL v10 = 1;
      BOOL v11 = 0;
    }

    if (!v11 && v10) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = v8;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v8))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v13 = v12 + v8;
    unint64_t v14 = a1[1];
    if (v12 <= v13)
    {
      BOOL v15 = v13 >= v14;
      BOOL v16 = v13 == v14;
    }

    else
    {
      BOOL v15 = 1;
      BOOL v16 = 0;
    }

    if (!v16 && v15) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v13;
  }

  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v15);
  uint64_t result = 0LL;
  if (v6 && v15)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = a1[1];
    if (*a1 > v8) {
      goto LABEL_12;
    }
    unint64_t v12 = *a1;
    unint64_t v13 = v8;
    uint64_t result = ccder_blob_decode_tl(&v12, 6LL, &v14);
    if (!(_DWORD)result) {
      return result;
    }
    if (v13 < v12) {
      goto LABEL_12;
    }
    unint64_t v9 = v14;
    if (v14 > v13 - v12) {
      goto LABEL_12;
    }
    *a2 = v12;
    *a3 = v9;
    unint64_t v10 = *a1;
    if (__CFADD__(*a1, v15))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v11 = v10 + v15;
    if (v10 > v10 + v15 || v11 > a1[1]) {
LABEL_12:
    }
      __break(0x5519u);
    *a1 = v11;
  }

  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v15);
  unint64_t v7 = v15;
  if (v15) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0LL;
  }
  if ((_DWORD)result == 1)
  {
    unint64_t v8 = a1[1];
    BOOL v9 = v8 >= *a1;
    unint64_t v10 = v8 - *a1;
    if (!v9 || v15 > v10) {
      goto LABEL_16;
    }
    *a2 = *a1;
    *a3 = v7;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v7))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v13 = v12 + v7;
    if (v12 > v13 || v13 > a1[1]) {
LABEL_16:
    }
      __break(0x5519u);
    *a1 = v13;
  }

  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0LL;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16LL * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16LL * v6);
    if (!(_DWORD)result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16LL * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension( uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, int a6)
{
  if (a6) {
    a5 = 0LL;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_261;
    }

LABEL_157:
    int v44 = 0;
LABEL_158:
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27) {
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    }
    if (!v44) {
      goto LABEL_232;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 37748736LL;
    }

    else
    {
      if (*(void *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327) {
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        }
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841LL)
        {
          unint64_t v52 = *(void *)result;
          unint64_t v51 = *(void *)(result + 8);
          if (a5)
          {
            if (v52 > v51) {
              goto LABEL_265;
            }
            *a5 = v52;
            a5[1] = v51 - v52;
          }

          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(void *)uint64_t result = v51;
            return 1LL;
          }

LABEL_265:
          __break(0x5519u);
          return result;
        }

        goto LABEL_232;
      }

      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 0x8004000000LL;
    }

LABEL_201:
    uint64_t v24 = v54 | v55;
    goto LABEL_261;
  }

  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0LL;
      goto LABEL_201;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_203;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315) {
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null(result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304) {
      return X509ExtensionParseGenericSSLMarker((unint64_t *)result, a4, a5);
    }
    int v44 = 1;
    goto LABEL_158;
  }

  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_232;
    }
    goto LABEL_157;
  }

  if (*(void *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1) {
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44) {
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36) {
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(void *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        uint64_t result = ccder_blob_check_null(result);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x8000000000LL;
        goto LABEL_261;
      }

      if (*(void *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          uint64_t result = ccder_blob_check_null(result);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x2000000;
        }

        else
        {
          if (*(void *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(void *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3) {
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            }
            goto LABEL_232;
          }

          uint64_t result = ccder_blob_check_null(result);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x4000000;
        }

LABEL_261:
        *a4 = v24;
        return 1LL;
      }

      *a4 |= 0x1000000uLL;
LABEL_232:
      unint64_t v52 = *(void *)result;
      unint64_t v51 = *(void *)(result + 8);
      goto LABEL_233;
    }

    uint64_t result = ccder_blob_check_null(result);
    if (!(_DWORD)result) {
      return result;
    }
    unint64_t v54 = *a4;
    uint64_t v55 = 1048584LL;
    goto LABEL_201;
  }

  BOOL v56 = 0;
  uint64_t result = der_get_BOOLean((unint64_t *)result, 0, &v56);
  if ((_DWORD)result)
  {
    uint64_t v53 = 0x10000080002LL;
    if (!v56) {
      uint64_t v53 = 0x20000040001LL;
    }
    *a4 |= v53;
  }

  return result;
}

uint64_t X509CertificateParseWithExtension( unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939LL;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if ((_DWORD)result) {
    return v8;
  }
  if (__CFADD__(v11, v14))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }

  uint64_t v8 = 720939LL;
  if (*a2 != v11 + v14) {
    return v8;
  }
  unint64_t v13 = v14 + v11 - v9;
  if (__CFADD__(v14, v11 - v9)) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0LL;
  }

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0LL, 0LL);
}

uint64_t X509CertificateParseSPKI( unint64_t *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
LABEL_38:
  }
    __break(0x5513u);
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_37;
  }
  uint64_t v10 = 655361LL;
  unint64_t v21 = *a1;
  unint64_t v22 = v6;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v21, v20)) {
    goto LABEL_38;
  }
  if (v21 > v21 + v20 || v21 + v20 > v22) {
    goto LABEL_37;
  }
  unint64_t v18 = v21;
  unint64_t v19 = v21 + v20;
  unint64_t v11 = v20;
  unint64_t v12 = v18;
  if (!a2) {
    goto LABEL_13;
  }
  if (v19 < v18 || v20 > v19 - v18)
  {
LABEL_37:
    __break(0x5519u);
    goto LABEL_38;
  }

  *a2 = v18;
  a2[1] = v11;
LABEL_13:
  if (__CFADD__(v12, v11)) {
    goto LABEL_38;
  }
  unint64_t v13 = v12 + v11;
  if (v12 > v12 + v11) {
    goto LABEL_37;
  }
  unint64_t v14 = v19;
  if (v13 > v19) {
    goto LABEL_37;
  }
  unint64_t v18 = v13;
  if (v13 == v19)
  {
    if (a3)
    {
      *a3 = 0LL;
      a3[1] = 0LL;
    }
  }

  else if (a3)
  {
    *a3 = v13;
    a3[1] = v14 - v13;
  }

  if (v14 > v22 || v21 > v14) {
    goto LABEL_37;
  }
  unint64_t v21 = v14;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0LL;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_bitstring(&v21, &v18, &v17);
  if (!(_DWORD)result) {
    return 655364LL;
  }
  if (!v17)
  {
    *a4 = 0LL;
    a4[1] = 0LL;
LABEL_33:
    if (v21 == v22) {
      return 0LL;
    }
    else {
      return 655365LL;
    }
  }

  if (v17 < 0xFFFFFFFFFFFFFFF9LL)
  {
    if (v19 >= v18)
    {
      unint64_t v16 = (v17 + 7) >> 3;
      if (v16 <= v19 - v18)
      {
        *a4 = v18;
        a4[1] = v16;
        goto LABEL_33;
      }
    }

    goto LABEL_37;
  }

  __break(0x5500u);
  return result;
}

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = 327691LL;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      unint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0LL, 0LL, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }

  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  __int128 v28 = 0uLL;
  __int128 v27 = 0uLL;
  unint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v24 = 0LL;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9) {
    return v9;
  }
  uint64_t v9 = 655632LL;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    unint64_t v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
  }

  else
  {
    unint64_t v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureRSA;
  }

  memset(v14, 0, sizeof(v14));
  __int128 v19 = *a5;
  __int128 v15 = *a4;
  __int128 v17 = v28;
  __int128 v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }

  uint64_t result = v25;
  if (v26 || !v25)
  {
    uint64_t v12 = *a3;
    uint64_t v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14)) {
        return 0LL;
      }
      else {
        return 655648LL;
      }
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, void *a3, uint64_t a4, __int128 *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64LL;
  __int128 v10 = 0uLL;
  uint64_t result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10, (uint64_t)v12);
  if (!(_DWORD)result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  }
  return result;
}

uint64_t X509MatchSignatureAlgorithm(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9LL;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32LL;
    uint64_t v11 = ccsha256_di();
    goto LABEL_14;
  }

  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5LL;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20LL;
    uint64_t v11 = ccsha1_di();
LABEL_14:
    ccdigest(v11, a1[1], *a1, a5);
    return 0LL;
  }

  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result) {
    return 656640LL;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9LL;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48LL;
    uint64_t v11 = ccsha384_di();
    goto LABEL_14;
  }

uint64_t X509CertificateCheckSignatureWithPublicKey( uint64_t *a1, uint64_t a2, __int128 *a3, void *a4, __int128 *a5, __int128 *a6)
{
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  unint64_t v30 = v32;
  uint64_t v31 = 64LL;
  __int128 v29 = 0uLL;
  uint64_t matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29, (uint64_t)v32);
  if ((_DWORD)matched) {
    return matched;
  }
  uint64_t matched = 655617LL;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    uint64_t v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
  }

  else
  {
    uint64_t v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureRSA;
  }

  uint64_t v28 = 0LL;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  __int128 v24 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v18 = 0u;
  __int128 v21 = *a5;
  uint64_t v17 = 0LL;
  __int128 v23 = *a6;
  __int128 v19 = v29;
  if (a3) {
    __int128 v14 = *a3;
  }
  else {
    __int128 v14 = null_octet;
  }
  __int128 v22 = v14;
  uint64_t result = *a1;
  uint64_t v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    else {
      return 655648LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent( uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0LL;
    }
    memset(v9, 170, sizeof(v9));
  }

  return 720912LL;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v25 = v3;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v2, v3)) {
    goto LABEL_62;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_61:
    __break(0x5519u);
    goto LABEL_62;
  }

  uint64_t v6 = 720901LL;
  unint64_t v23 = v2;
  unint64_t v24 = v4;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (v2 < v4)
  {
    while (1)
    {
      unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v2 = v23;
      if (__CFADD__(v23, v25)) {
        break;
      }
      unint64_t v7 = v23 + v25;
      if (v23 > v23 + v25 || v7 > v24) {
        goto LABEL_61;
      }
      unint64_t v21 = v23;
      unint64_t v22 = v23 + v25;
      while (v2 < v7)
      {
        unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v21, v25)) {
          goto LABEL_62;
        }
        if (v21 > v21 + v25 || v21 + v25 > v22) {
          goto LABEL_61;
        }
        unint64_t v19 = v21;
        unint64_t v20 = v21 + v25;
        unint64_t v10 = (unsigned __int16 *)v19;
        unint64_t v2 = v20;
        if (v19 > v20 || v25 > v20 - v19) {
          goto LABEL_61;
        }
        if (__CFADD__(v19, v25)) {
          goto LABEL_62;
        }
        unint64_t v11 = v19 + v25;
        if (v19 > v19 + v25 || v11 > v20) {
          goto LABEL_61;
        }
        v19 += v25;
        if (v25 == 3)
        {
          int v12 = *v10;
          int v13 = *((unsigned __int8 *)v10 + 2);
          if (v12 == 1109 && v13 == 3)
          {
            unint64_t v17 = v11;
            unint64_t v18 = v20;
            if ((ccder_blob_decode_tl(&v17, 12LL, &v25) & 1) == 0)
            {
              if (v19 > v20) {
                goto LABEL_61;
              }
              unint64_t v17 = v19;
              unint64_t v18 = v20;
              if ((ccder_blob_decode_tl(&v17, 19LL, &v25) & 1) == 0)
              {
                if (v19 > v20) {
                  goto LABEL_61;
                }
                unint64_t v17 = v19;
                unint64_t v18 = v20;
              }
            }

            unint64_t v15 = v25;
            if (!v25) {
              return v6;
            }
            if (__CFADD__(v17, v25)) {
              goto LABEL_62;
            }
            unint64_t v2 = v17 + v25;
            if (v20 != v17 + v25) {
              return 720902LL;
            }
            if (v18 < v17 || v25 > v18 - v17) {
              goto LABEL_61;
            }
            *a2 = v17;
            a2[1] = v15;
          }
        }

        unint64_t v7 = v22;
        if (v2 > v22 || v21 > v2) {
          goto LABEL_61;
        }
        unint64_t v21 = v2;
      }

      if (v2 != v7) {
        return 720903LL;
      }
      unint64_t v4 = v24;
      if (v2 > v24 || v23 > v2) {
        goto LABEL_61;
      }
      unint64_t v23 = v2;
      if (v2 >= v24) {
        goto LABEL_49;
      }
    }

LABEL_62:
    __break(0x5513u);
  }

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0LL;
  time_t v5 = 0LL;
  time_t v6 = 0LL;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, &v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1, (unint64_t *)v4, 0LL);
  if (!(_DWORD)result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1, 0LL, (unint64_t *)v4);
  if (!(_DWORD)result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0LL);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  uint64_t v3 = 720906LL;
  if (!result) {
    return v3;
  }
  unint64_t v4 = *(void *)(result + 72);
  uint64_t v5 = *(void *)(result + 80);
  if (!v4 || v5 == 0) {
    return v3;
  }
  if (__CFADD__(v4, v5))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v7 = v4 + v5;
    if (v4 <= v7)
    {
      v9[0] = *(void *)(result + 72);
      v9[1] = v7;
      return 720908LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v2 = 720909LL;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }

  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }

  uint64_t v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911LL;
    }
    uint64_t v2 = 0LL;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }

  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v14 = *a1;
  unint64_t v15 = v3;
  unint64_t v13 = v3 - v4;
  if ((ccder_blob_decode_tl(&v14, 22LL, &v13) & 1) != 0) {
    goto LABEL_5;
  }
  unint64_t v8 = a1[1];
  if (*a1 > v8) {
    goto LABEL_19;
  }
  unint64_t v14 = *a1;
  unint64_t v15 = v8;
  if (ccder_blob_decode_tl(&v14, 12LL, &v13))
  {
LABEL_5:
    unint64_t v10 = v14;
    unint64_t v9 = v15;
    if (v14 > v15) {
      goto LABEL_19;
    }
    *a1 = v14;
    a1[1] = v9;
    unint64_t v11 = v13;
  }

  else
  {
    unint64_t v10 = *a1;
    unint64_t v9 = a1[1];
    unint64_t v11 = v9 - *a1;
    unint64_t v13 = v11;
  }

  if (__CFADD__(v10, v11)) {
    goto LABEL_20;
  }
  if (v9 == v10 + v11)
  {
    if (!v11) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v10 <= v9)
      {
        *a1 = v9;
        return v9 == v10 + v11;
      }

      goto LABEL_19;
    }

    if (v10 <= v9 && v11 <= v9 - v10)
    {
      *a3 = v10;
      a3[1] = v11;
      goto LABEL_15;
    }

uint64_t X509ExtensionParseCertifiedChipIntermediate( unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 22LL, &v16);
  if ((_DWORD)result)
  {
    unint64_t v7 = v16;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v16))
    {
      __break(0x5513u);
      goto LABEL_34;
    }

    unint64_t v9 = v8 + v16;
    if (a1[1] != v8 + v16) {
      return 0LL;
    }
    unint64_t v10 = *a2;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v8 > v9) {
        goto LABEL_34;
      }
      *a3 = v8;
      a3[1] = v7;
    }

    if (v7 == 4)
    {
      if (*(_DWORD *)v8 != 1953653621) {
        goto LABEL_30;
      }
      unint64_t v13 = 0x30001000000LL;
    }

    else
    {
      if (v7 == 17)
      {
        if (*(void *)v8 != 0x207372656B6E6F59LL
          || *(void *)(v8 + 8) != 0x726F74636146202DLL
          || *(_BYTE *)(v8 + 16) != 121)
        {
LABEL_30:
          if (v8 <= v9)
          {
            *a1 = v9;
            return 1LL;
          }

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v9);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v9))
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 + v9) {
        return 0LL;
      }
      if (v9 == 32)
      {
        if (a3)
        {
          if (v8 < v7 || v8 - v7 <= 0x1F) {
            goto LABEL_15;
          }
          *a3 = v7;
          a3[1] = 32LL;
        }

        *a2 |= 4uLL;
      }

      if (v7 <= v8)
      {
        *a1 = v8;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v10);
  if ((_DWORD)result)
  {
    unint64_t v7 = v10;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v10))
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v9 = a1[1];
      if (v9 != v8 + v10) {
        return 0LL;
      }
      if (v10)
      {
        if (a3)
        {
          if (v9 < v8 || v10 > v9 - v8) {
            goto LABEL_15;
          }
          *a3 = v8;
          a3[1] = v7;
        }

        *a2 |= 0x30000000uLL;
      }

      if (v8 <= v9)
      {
        *a1 = v9;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseGenericSSLMarker(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v17 = 0LL;
  int v6 = ccder_blob_decode_tl(a1, 12LL, &v17);
  uint64_t result = 0LL;
  if (v6)
  {
    unint64_t v8 = v17;
    if (v17 >= 0x19)
    {
      unint64_t v9 = *a1;
      BOOL v10 = *(void *)*a1 == 0x2E3034382E322E31LL && *(void *)(*a1 + 8) == 0x312E353336333131LL;
      unint64_t v11 = 0x2E37322E362E3030LL;
      if (!v10 || *(void *)(*a1 + 16) != 0x2E37322E362E3030LL) {
        return 0LL;
      }
      if (v9 < 0xFFFFFFFFFFFFFFE8LL)
      {
        unint64_t v13 = v9 + 24;
        if (v9 >= v9 + 24) {
          goto LABEL_21;
        }
        unint64_t v11 = a1[1];
        if (v13 > v11) {
          goto LABEL_21;
        }
        unint64_t v14 = (unsigned __int8 *)(v9 + 24);
        do
        {
          BOOL v15 = v14 > v14 + 1;
          ++v14;
        }

        while (!v15);
        while (1)
        {
LABEL_21:
          __break(0x5519u);
LABEL_22:
          if (!a3) {
            goto LABEL_26;
          }
          unint64_t v16 = v8 - 24;
          if (v8 < 0x18) {
            goto LABEL_31;
          }
          if (v16 <= v11 - v13)
          {
            *a3 = v13;
            a3[1] = v16;
LABEL_26:
            unint64_t v13 = *a2 | 0x200000000LL;
            *a2 = v13;
            if (__CFADD__(v9, v8)) {
              break;
            }
            v8 += v9;
            if (v9 <= v8 && v8 <= v11)
            {
              *a1 = v8;
              return 1LL;
            }
          }
        }
      }

      __break(0x5513u);
LABEL_31:
      __break(0x5515u);
    }
  }

  return result;
}

uint64_t X509ExtensionParseServerAuthMarker( uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null(a1);
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6LL) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1LL) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    uint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0LL;
      }
    }

    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }

    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1LL;
      }

      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }

      goto LABEL_25;
    }

    return 0LL;
  }

  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v14);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_17;
    }
    if (a1[1] != v7 + v14) {
      return 0LL;
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14) {
      goto LABEL_18;
    }
    unint64_t v11 = v7;
    unint64_t v12 = v7 + v14;
    uint64_t result = ccder_blob_decode_tl(&v11, 0xA000000000000002LL, &v13);
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_tl(&v11, 4LL, &v13);
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v12 < v11) {
            goto LABEL_18;
          }
          unint64_t v8 = v13;
          if (v13 > v12 - v11) {
            goto LABEL_18;
          }
          *a3 = v11;
          a3[1] = v8;
        }

        *a2 |= 0x240000800000uLL;
        unint64_t v9 = *a1;
        if (!__CFADD__(*a1, v14))
        {
          unint64_t v10 = v9 + v14;
          if (v9 <= v9 + v14 && v10 <= a1[1])
          {
            *a1 = v10;
            return 1LL;
          }

unint64_t *X509ExtensionParseMFI4Properties( unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }

    *a3 = v4;
    a3[1] = 32LL;
  }

  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0LL)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }

    goto LABEL_12;
  }

unint64_t *X509ChainParseCertificateSet( unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0LL;
  *a4 = 0LL;
  a4[1] = 0LL;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0LL;
      *a5 = v5;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0LL;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    unint64_t v13 = a4 + 1;
    unint64_t v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304LL) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }

      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v10)
      {
        unint64_t v17 = (void *)*v13;
        void *v14 = 0LL;
        v14[1] = v17;
        *unint64_t v17 = v16;
        *unint64_t v13 = (unint64_t)v14;
      }

      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }

      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }

      goto LABEL_6;
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
  }

  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0LL;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0LL;
      v2[37] = 0LL;
      uint64_t v2 = (void *)v2[34];
    }

    while (v2);
  }

  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691LL;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0LL;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1)) {
            return 0LL;
          }
          uint64_t BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (BAARootUsingKeyIdentifier) {
            return 0LL;
          }
          else {
            return v16;
          }
        }

        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }

      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      unint64_t v13 = (void *)a3[1];
      v7[36] = 0LL;
      v7[37] = v13;
      *unint64_t v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0LL;
      if (!v14) {
        return result;
      }
    }

    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }

    return 524297LL;
  }

  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result) {
        return v7;
      }
      if (!--v3) {
        return 0LL;
      }
    }

    __break(0x5519u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!(_DWORD)result) {
        return v5;
      }
      if (!--v1) {
        return 0LL;
      }
    }

    __break(0x5519u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        uint64_t v8 = *v6;
      }
    }
  }

  if (v8)
  {
    uint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0LL;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1LL;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }

      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }

      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(_BYTE *)(a3 + 16))
      {
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }

      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }

      unint64_t v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      unint64_t v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(_BYTE *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0LL;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }

        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }

      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }

      if (*(_BYTE *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }

      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }

      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
      }

      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0LL) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }

          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }

          goto LABEL_49;
        }
      }

      else if (a3)
      {
        goto LABEL_34;
      }

      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, (void *)(v8 + 16), v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result) {
          return result;
        }
      }

      unint64_t v21 = v11 + 1;
      if (v11 == -1LL) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }

  unint64_t v21 = 0LL;
  uint64_t v13 = -1LL;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if ((v8 & 1) != 0)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1LL)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }

    if (*(void *)a3 != v22) {
      return ((_DWORD)v22 << 8) | 0x90006u;
    }
  }

  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = (_DWORD)v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184LL;
    if ((v8 & 1) != 0) {
      uint64_t v27 = 168LL;
    }
    uint64_t v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, (void *)(v25 + 16), v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }

    int v26 = 589836;
    return v24 | v26;
  }

  int v24 = (_DWORD)v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, sizeof(v35));
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }

  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey( *(uint64_t **)(a3 + 24),  *(void *)(a3 + 32),  *(__int128 **)(a3 + 40),  (void *)(v25 + 16),  (__int128 *)(v25 + 40),  (__int128 *)(v25 + 56))) {
      goto LABEL_72;
    }
  }

  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }

LABEL_87:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0LL);
}

void __scheduleXPCActivity_block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to defer activity: %s",  (uint8_t *)&v3,  0xCu);
}

void libInFieldCollectionLibrary_cold_1(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  int v3 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *libInFieldCollectionLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"MACollectionInterface.m",  42LL,  @"%s",  *a1);

  OUTLINED_FUNCTION_0();
  __break(1u);
}

void dealwith_activation_cold_1()
{
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_1()
{
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_2()
{
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_3()
{
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_4()
{
}

void handle_deactivate_cold_1()
{
}

void handle_deactivate_cold_2()
{
}

void __ucrt_oob_activity_handler_block_invoke_3_cold_1()
{
}

void perform_sydro_data_migration_tasks_cold_1()
{
}

void perform_sydro_data_migration_tasks_cold_2()
{
}

void perform_sydro_data_migration_tasks_cold_3()
{
}

void __register_xpc_activities_block_invoke_cold_1()
{
}

void __register_xpc_activities_block_invoke_503_cold_1()
{
}

void __register_xpc_activities_block_invoke_504_cold_1()
{
}

void __register_xpc_activities_block_invoke_505_cold_1()
{
}

void __register_xpc_activities_block_invoke_506_cold_1()
{
}

void __register_xpc_activities_block_invoke_507_cold_1()
{
}

void __register_xpc_activities_block_invoke_508_cold_1()
{
}

void __register_xpc_activities_block_invoke_509_cold_1()
{
}

void __register_xpc_activities_block_invoke_510_cold_1()
{
}

void __register_xpc_activities_block_invoke_511_cold_1()
{
}

void __getMSDKManagedDeviceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v3 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *MobileStoreDemoKitLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"activation_support.m",  27LL,  @"%s",  *a1);

  __break(1u);
}

void __getMSDKManagedDeviceClass_block_invoke_cold_2()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v1 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getMSDKManagedDeviceClass(void)_block_invoke");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"activation_support.m",  28LL,  @"Unable to find class %s",  "MSDKManagedDevice");

  __break(1u);
}

void copySplunkDeviceIdentifiers_cold_1()
{
}

void __writeSplunkLog_block_invoke_cold_1()
{
}

void __writeSplunkLog_block_invoke_cold_2()
{
}

void __writeSplunkLog_block_invoke_cold_3()
{
}

void __writeSplunkLog_block_invoke_cold_4()
{
}

void __writeSplunkLog_block_invoke_cold_5()
{
}

void __writeSplunkLog_block_invoke_cold_6(void *a1, os_log_s *a2)
{
  __int16 v4 = 1024;
  int v5 = 0x100000;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Splunk log is too big (%ld > %d).", v3, 0x12u);
}

void __writeSplunkLog_block_invoke_cold_7()
{
}

void __writeSplunkLog_block_invoke_cold_8()
{
}

void __writeSplunkLog_block_invoke_cold_9()
{
}

void __writeSplunkLog_block_invoke_cold_10(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  id v7 = [a2 lastObject];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_FAULT,  "Too many splunk log files, removing %@.",  a1,  0xCu);
}

void __writeSplunkLog_block_invoke_cold_11()
{
}

void __writeSplunkLog_block_invoke_34_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __splunk_activity_handler_block_invoke_2_43_cold_1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&uint8_t v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL);
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to perform splunk logging (will not retry post => %@): %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __splunk_daily_stats_activity_handler_block_invoke_cold_1()
{
}

void __getLAContextClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v3 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *LocalAuthenticationLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"identity_support.m",  21LL,  @"%s",  *a1);

  __break(1u);
}

void __getLAContextClass_block_invoke_cold_2()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v1 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getLAContextClass(void)_block_invoke");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"identity_support.m",  22LL,  @"Unable to find class %s",  "LAContext");

  __break(1u);
}

void libavp_send_host_message_cold_1()
{
  uint64_t v1 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CFDataRef gAppleVirtualPlatformSendSubsystemMessageToHost(AppleVirtualPlatformMessageSubsystem, CFDataRef, CFErrorRef *)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"vm_libavp.m",  34LL,  @"%s",  OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_1()
{
  uint64_t v1 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronous(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"vm_libavp.m",  38LL,  @"%s",  OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_2()
{
  uint64_t v1 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"vm_libavp.m",  41LL,  @"%s",  OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_3()
{
  uint64_t v1 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CFDataRef gAppleVirtualPlatformGuestCopyStrongIdentityData(CFDictionaryRef, CFErrorRef *)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"vm_libavp.m",  32LL,  @"%s",  OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_4()
{
  uint64_t v1 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"vm_libavp.m",  44LL,  @"%s",  OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void libavp_guest_has_host_key_cold_1()
{
  uint64_t v1 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v2 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "_Bool gAppleVirtualPlatformGuestHasHostKey(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v1,  "handleFailureInFunction:file:lineNumber:description:",  v0,  @"vm_libavp.m",  36LL,  @"%s",  OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void AppleVirtualPlatformLibrary_cold_1(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
  uint64_t v3 =  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *AppleVirtualPlatformLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"vm_libavp.m",  26LL,  @"%s",  *a1);

  OUTLINED_FUNCTION_0();
  __break(1u);
}

void isSupportedDeviceIdentityClient_cold_1(void *a1)
{
  id v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v2, "%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

void main_cold_1()
{
  uint64_t v0 =  createAndLogError( (uint64_t)"main",  331LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create serial queue.");
  OUTLINED_FUNCTION_2_1();
  id v1 = -[NSError description](v0, "description");
  id v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_2()
{
  uint64_t v0 =  createAndLogError( (uint64_t)"main",  338LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create data ark.");
  OUTLINED_FUNCTION_2_1();
  id v1 = -[NSError description](v0, "description");
  id v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_3()
{
  uint64_t v0 =  createAndLogError( (uint64_t)"main",  386LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to initialize XPC server.");
  OUTLINED_FUNCTION_2_1();
  id v1 = -[NSError description](v0, "description");
  id v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_4()
{
  uint64_t v0 =  createAndLogError( (uint64_t)"main",  398LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to initialize lockdown server.");
  OUTLINED_FUNCTION_2_1();
  id v1 = -[NSError description](v0, "description");
  id v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_5(id a1)
{
  id v1 =  createAndLogError( (uint64_t)"main",  355LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a1,  @"Migration failed.");
  OUTLINED_FUNCTION_2_1();
  id v2 = -[NSError description](v1, "description");
  id v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_6(id a1)
{
  id v1 =  createAndLogError( (uint64_t)"main",  344LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a1,  @"Failed to perform boot initialization tasks.");
  OUTLINED_FUNCTION_2_1();
  id v2 = -[NSError description](v1, "description");
  id v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_7()
{
  uint64_t v0 = *__error();
  id v1 = __error();
  id v2 = OUTLINED_FUNCTION_2_2(v1);
  id v3 =  createAndLogError( (uint64_t)"main",  306LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to retrieve password database info for user: %d (%s)",  v0,  v2);
  OUTLINED_FUNCTION_2_1();
  id v4 = -[NSError description](v3, "description");
  id v6 = OUTLINED_FUNCTION_1_2(v4, v5);
  _os_crash(v6);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_8(id a1)
{
  id v1 =  createAndLogError( (uint64_t)"main",  296LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a1,  @"Failed to set backup exclusion on container path.");
  OUTLINED_FUNCTION_2_1();
  id v2 = -[NSError description](v1, "description");
  id v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_9(id a1)
{
  id v1 =  createAndLogError( (uint64_t)"main",  290LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a1,  @"Failed to get backup exclusion on container path.");
  OUTLINED_FUNCTION_2_1();
  id v2 = -[NSError description](v1, "description");
  id v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_10()
{
  id v0 = -[NSError description]( createAndLogError( (uint64_t)"main", 281LL, @"com.apple.MobileActivation.ErrorDomain", -1LL, 0LL, @"Failed to copy container path(s)."), "description");
  id v2 = OUTLINED_FUNCTION_1_2(v0, v1);
  _os_crash(v2);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_11()
{
  uint64_t v0 = *__error();
  id v1 = __error();
  id v2 = OUTLINED_FUNCTION_2_2(v1);
  id v3 = -[NSError description]( createAndLogError( (uint64_t)"main", 269LL, @"com.apple.MobileActivation.ErrorDomain", -1LL, 0LL, @"Failed to set temporary directory subpath: %d (%s)", v0, v2), "description");
  id v5 = OUTLINED_FUNCTION_1_2(v3, v4);
  _os_crash(v5);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void main_cold_12()
{
  uint64_t v0 = *__error();
  id v1 = __error();
  id v2 = OUTLINED_FUNCTION_2_2(v1);
  id v3 = -[NSError description]( createAndLogError( (uint64_t)"main", 263LL, @"com.apple.MobileActivation.ErrorDomain", -1LL, 0LL, @"Error setting low space io policy: %d (%s)", v0, v2), "description");
  id v5 = OUTLINED_FUNCTION_1_2(v3, v4);
  _os_crash(v5);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void __main_block_invoke_2_cold_1(id a1)
{
  id v1 =  createAndLogError( (uint64_t)"main_block_invoke_2",  377LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a1,  @"Migration failed.");
  OUTLINED_FUNCTION_2_1();
  id v2 = -[NSError description](v1, "description");
  id v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void __perform_boot_initialization_tasks_block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Failed to query monotonic clock: %@",  (uint8_t *)&v2,  0xCu);
}