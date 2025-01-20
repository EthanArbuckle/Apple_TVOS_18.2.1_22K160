void *NAAP()
{
  Class v0;
  Class v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  size_t v17;
  size_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  Class v34;
  uint64_t v35;
  void *v36;
  v0 = NSClassFromString(@"NFSecureElement");
  if (v0)
  {
    v1 = v0;
    if (off_18C723270())
    {
      v2 = (void *)-[objc_class sharedHardwareManager](off_18C723270(), "sharedHardwareManager");
      v3 = [v2 getHwSupport];
      if ((_DWORD)v3 == 2)
      {
LABEL_15:
        v15 = (void *)objc_msgSend((id)-[objc_class embeddedSecureElement](v1, "embeddedSecureElement"), "serialNumber");
        if (v15)
        {
          v16 = (void *)[v15 UTF8String];
          if (v16) {
            goto LABEL_17;
          }
          goto LABEL_45;
        }

        NSLog(@"Error: Failed to retrieve seid from cache.");
        return 0LL;
      }

      if ((_DWORD)v3 != 4)
      {
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 1LL, v3);
        usleep(0xF4240u);
        v4 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v4);
        if ((_DWORD)v4 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 2LL, v4);
        usleep(0xF4240u);
        v5 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v5);
        if ((_DWORD)v5 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 3LL, v5);
        usleep(0xF4240u);
        v6 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v6);
        if ((_DWORD)v6 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 4LL, v6);
        usleep(0xF4240u);
        v7 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v7);
        if ((_DWORD)v7 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 5LL, v7);
        usleep(0xF4240u);
        v8 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v8);
        if ((_DWORD)v8 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 6LL, v8);
        usleep(0xF4240u);
        v9 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v9);
        if ((_DWORD)v9 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 7LL, v9);
        usleep(0xF4240u);
        v10 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v10);
        if ((_DWORD)v10 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 8LL, v10);
        usleep(0xF4240u);
        v11 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v11);
        if ((_DWORD)v11 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 9LL, v11);
        usleep(0xF4240u);
        v12 = [v2 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v12);
        if ((_DWORD)v12 == 2) {
          goto LABEL_15;
        }
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 10LL, v12);
        usleep(0xF4240u);
        v13 = [v2 queryHardwareSupport:0];
        v14 = v13;
        NSLog(@"Info: new state --> %d\n", v13);
        if (v14 == 2) {
          goto LABEL_15;
        }
LABEL_51:
        NSLog(@"Error: Hardware still not in a valid state, bailing out\n");
        return 0LL;
      }

LABEL_26:
      NSLog(@"Error: HWState returns UnSupported, bailing out\n");
      return 0LL;
    }

LABEL_27:
    NSLog(@"Error: Can't get softlinked NFHM class\n");
    return 0LL;
  }

  v16 = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 1);
  if (!v16)
  {
    NSLog(@"Error: Failed to open NearField framework.");
    return v16;
  }

  if (!off_18C723270()) {
    goto LABEL_27;
  }
  v20 = (void *)-[objc_class sharedHardwareManager](off_18C723270(), "sharedHardwareManager");
  v21 = [v20 getHwSupport];
  if ((_DWORD)v21 != 2)
  {
    if ((_DWORD)v21 == 4) {
      goto LABEL_26;
    }
    NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 1LL, v21);
    usleep(0xF4240u);
    v23 = [v20 queryHardwareSupport:0];
    NSLog(@"Info: new state --> %d\n", v23);
    if ((_DWORD)v23 != 2)
    {
      NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 2LL, v23);
      usleep(0xF4240u);
      v24 = [v20 queryHardwareSupport:0];
      NSLog(@"Info: new state --> %d\n", v24);
      if ((_DWORD)v24 != 2)
      {
        NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 3LL, v24);
        usleep(0xF4240u);
        v25 = [v20 queryHardwareSupport:0];
        NSLog(@"Info: new state --> %d\n", v25);
        if ((_DWORD)v25 != 2)
        {
          NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 4LL, v25);
          usleep(0xF4240u);
          v26 = [v20 queryHardwareSupport:0];
          NSLog(@"Info: new state --> %d\n", v26);
          if ((_DWORD)v26 != 2)
          {
            NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 5LL, v26);
            usleep(0xF4240u);
            v27 = [v20 queryHardwareSupport:0];
            NSLog(@"Info: new state --> %d\n", v27);
            if ((_DWORD)v27 != 2)
            {
              NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 6LL, v27);
              usleep(0xF4240u);
              v28 = [v20 queryHardwareSupport:0];
              NSLog(@"Info: new state --> %d\n", v28);
              if ((_DWORD)v28 != 2)
              {
                NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 7LL, v28);
                usleep(0xF4240u);
                v29 = [v20 queryHardwareSupport:0];
                NSLog(@"Info: new state --> %d\n", v29);
                if ((_DWORD)v29 != 2)
                {
                  NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 8LL, v29);
                  usleep(0xF4240u);
                  v30 = [v20 queryHardwareSupport:0];
                  NSLog(@"Info: new state --> %d\n", v30);
                  if ((_DWORD)v30 != 2)
                  {
                    NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 9LL, v30);
                    usleep(0xF4240u);
                    v31 = [v20 queryHardwareSupport:0];
                    NSLog(@"Info: new state --> %d\n", v31);
                    if ((_DWORD)v31 != 2)
                    {
                      NSLog(@"Info: Attempt %d state %d is not yet ready, sleeping a bit\n", 10LL, v31);
                      usleep(0xF4240u);
                      v32 = [v20 queryHardwareSupport:0];
                      v33 = v32;
                      NSLog(@"Info: new state --> %d\n", v32);
                      if (v33 != 2) {
                        goto LABEL_51;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  v34 = NSClassFromString(@"NFSecureElement");
  if (v34)
  {
    v35 = objc_msgSend((id)-[objc_class embeddedSecureElement](v34, "embeddedSecureElement"), "serialNumber");
    if (v35)
    {
      v36 = (void *)v35;
      dlclose(v16);
      v16 = (void *)[v36 UTF8String];
      if (v16)
      {
LABEL_17:
        v17 = strlen((const char *)v16);
        if (v17)
        {
          v18 = 0LL;
          v19 = 1;
          while (*((_BYTE *)v16 + v18) == 48)
          {
            v18 = v19++;
            if (v17 <= v18) {
              goto LABEL_46;
            }
          }

          return v16;
        }

        goto LABEL_46;
      }

LABEL_45:
      NSLog(@"Error: SEID UTF8String conversion is NULL.");
LABEL_46:
      NSLog(@"Error: SEID retrieved is all zeros.");
      return v16;
    }

    NSLog(@"Error: Failed to retrieve seid.");
  }

  else
  {
    NSLog(@"Error: Failed to find NFSecureElement class.");
  }

  dlclose(v16);
  return 0LL;
}

Class sub_1886DF4A4()
{
  if (qword_18C724500 != -1) {
    dispatch_once(&qword_18C724500, &unk_18A26FD90);
  }
  Class result = objc_getClass("NFHardwareManager");
  qword_18C7244F8 = (uint64_t)result;
  off_18C723270 = sub_1886DF500;
  return result;
}

uint64_t sub_1886DF500()
{
  return qword_18C7244F8;
}

void *sub_1886DF50C()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
  qword_18C7244F0 = (uint64_t)result;
  return result;
}

void sub_1886DF534(uint64_t a1)
{
  __asm { BR              X10 }
}

void sub_1886DF57C(uint64_t a1@<X8>)
{
  unint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = v1 > v3;
  BOOL v5 = v1 == v3;
  int v6 = v4;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0) {
    BOOL v5 = v6;
  }
  BOOL v7 = !v5;
  uint64_t v8 = 24LL;
  if (!v7) {
    uint64_t v8 = 28LL;
  }
  *(_DWORD *)(v2 + 12) = *(_DWORD *)(a1 + v8) ^ *(_DWORD *)(a1 + 32);
}

uint64_t sub_1886E3DF4@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  BOOL v3 = a1 == 2570119661LL;
  uint64_t v4 = a1 + 1;
  int v5 = v3;
  return ((uint64_t (*)(uint64_t))(*(void *)(v2 + 8LL * ((180 * v5) ^ a2)) - 12LL))(v4);
}

uint64_t sub_1886E40B8@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W8>)
{
  LODWORD(STACK[0x21C]) = a1;
  LODWORD(STACK[0x220]) = a2;
  LODWORD(STACK[0x224]) = v3;
  LODWORD(STACK[0x228]) = v4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5
                                                                                 + 8LL
                                                                                 * (((2 * v6) | (16 * v6)) ^ (a3 + 60)))
                                                                     - 12LL))( 3632502580LL,  814318005LL,  269747206LL,  671739263LL);
}

uint64_t sub_1886E41E4@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  unint64_t v429 = __PAIR64__(v34, v35);
  HIDWORD(a32) = a1;
  int v39 = LODWORD(STACK[0x218]) ^ 0x511BE68D;
  LODWORD(STACK[0x22C]) = v34;
  LODWORD(a17) = 29 * (v37 ^ 0xFA);
  LODWORD(STACK[0x230]) = v35;
  int v40 = STACK[0x220];
  int v41 = 1127189946 * LODWORD(STACK[0x220]) + 903910606;
  LODWORD(STACK[0x234]) = v39;
  unsigned int v42 = v40 * (a17 + 1637336362) - (v41 & 0x69FCCC42) - 1880182648;
  unsigned int v43 = (v37 + 459897922) & 0xE49683FF ^ 0x4EB2E9A6 ^ LODWORD(STACK[0x21C]);
  unsigned int v44 = 560956771 * v43 - ((1121913542 * v43) & 0xD5EB69F2) - 352996103;
  int v45 = -1317011456 * v43 - 1520976529 - ((1660944384 * v43) & 0x4A000000);
  unsigned int v46 = (((-479297536 * v40 - ((1188888576 * v40 + 1248264192) & 0x47B40000) - 921847260) ^ 0xA3DA3A24) & 0xFFFF8000 | (v42 >> 17)) ^ 0x5A7F;
  unsigned int v47 = v46 + 1174282095 - ((2 * v46) & 0x8BFC3EDE);
  unsigned int v48 = 78224713 * (v47 ^ 0x45FE1F6F) - ((156449426 * (v47 ^ 0x45FE1F6F)) & 0x85202852) + 1116738601;
  unsigned int v49 = (369098752 * (v34 ^ 0xEEF8AB78) + 548014955 - ((738197504 * (v34 ^ 0xEEF8AB78)) & 0x40000000)) ^ 0x20AA0B6B | ((-2093375861 * (v34 ^ 0xEEF8AB78) - ((108215574 * (v34 ^ 0xEEF8AB78)) & 0xD4641A8C) - 365818554) >> 7);
  int v50 = ((2 * v49) & 0x7E7FFD4E ^ 0x228C804) + (v49 ^ 0x3EEB9ABD);
  unsigned int v51 = (((((v44 >> 9) | v45 ^ 0xA557BD6F) ^ 0x757ADA)
        + 415247526
        - 2 * ((((v44 >> 9) | v45 ^ 0xA557BD6F) ^ 0x757ADA) & 0x18C02CA7 ^ (v44 >> 9) & 1)) ^ 0x5D3E33C9 ^ v47)
      - v50
      + 1061158567;
  unsigned int v52 = ((1267190912 * (v35 ^ 0xE2AF4CC7) - 767791173 - ((-1760585472 * (v35 ^ 0xE2AF4CC7)) & 0xA478DF00)) ^ 0xD23C6FBB | ((1687621529 * (v35 ^ 0xE2AF4CC7) - ((-919724238 * (v35 ^ 0xE2AF4CC7)) & 0xA20FD444) - 788010462) >> 25)) ^ 0x68;
  unsigned int v53 = v52 - 670318432 - ((2 * v52) & 0xB0178140);
  unsigned int v54 = v53 ^ (v51 - ((2 * v51) & 0xE226BF66) - 250388557) ^ 0x29189F13;
  unsigned int v55 = v53 ^ 0xD80BC0A0;
  unsigned int v56 = -142106043 * (v53 ^ 0xD80BC0A0) - ((-284212086 * (v53 ^ 0xD80BC0A0)) & 0xEC1EC572) - 166763847;
  unsigned int v57 = (-692584448 * v54 + 296088629 - ((762314752 * v54) & 0x23400000)) ^ 0x11A5F435 | ((1709808343 * v54
                                                                                         - ((1272133038 * v54) & 0x625F5ADA)
                                                                                         - 1322275475) >> 13);
  int v58 = ((2 * v57) & 0x7FBFB13E ^ 0xB103A) + (v57 ^ 0x3FDA51E2);
  int v59 = ~(v42 >> 17);
  unsigned int v60 = ((1256849408 * v50 - ((-1781268480 * v50 - 357302272) & 0xE8B80000) - 373842397) ^ 0xF45D9E23) & 0xFFFE0000 | ((-1345542795 * v50 - ((1603881706 * v50 + 85325146) & 0x6F193252u) + 2048365526) >> 15);
  unsigned int v61 = ((2 * v60) & 0xA7FECBB6 ^ 0x2CA32) + (v60 ^ 0x53FE0AC2);
  unsigned int v62 = ((2 * (-1610612736 * v55 + (v56 >> 3))) & 0xBFDFC766 ^ 0x3D83C026)
      + ((-1610612736 * v55 + (v56 >> 3)) ^ 0xC12E0FE4);
  unsigned int v63 = (v48 & 0xFFC73BDC ^ 0x42801008) + (v59 << 31) + ((v48 >> 1) ^ 0x5EAB97FA) + v62 - v61 + v58 + 2115262416;
  unsigned int v64 = 213632093 * v63 - ((427264186 * v63 + 1650030974) & 0xE9E37156) - 1507953302;
  int v65 = -2001076224 * v63 - ((24379392 * v63 + 50069504) & 0x8180000) + 2106261433;
  unsigned int v66 = ((-2025682640 * v61 - ((243602016 * v61 + 105474016) & 0xD0106A0) - 643483839) ^ 0x6808351) & 0xFFFFFFF0 | ((-395040621 * v61 - ((283660582 * v61 + 979670654) & 0x31CEAF88) - 702962941) >> 28);
  unsigned int v67 = (1207959552 * v58 - ((-1879048192 * v58 - 1879048192) & 0xB0000000) - 1568756767) ^ 0x5A7EABE1 | ((1189873353 * v58 - ((-1915220590 * v58 - 617717166) & 0xC6517574) - 792728605) >> 5);
  unsigned int v68 = ((2 * v67) & 0x9BFD77DE ^ 0x230038A) + (v67 ^ 0xCEE7FE3A);
  unsigned int v69 = ((-868205248 * v62 - ((411073152 * v62 + 336255104) & 0x6380CD80) + 2076562194) ^ 0x31C066D2) & 0xFFFFFFC0 | ((-1691287307 * v62 - ((912392682 * v62 + 1917856610) & 0x820FD636) - 97517364) >> 26);
  unsigned int v70 = ((2 * v69) & 0xEFFF6548) + (v69 ^ 0x77FFB2B4);
  unsigned int v71 = ((2 * ((v65 ^ 0x40CFFB9) & 0xFFFE0000 | (v64 >> 15))) & 0xEFCBFB7E ^ 0x1D346)
      + (((v65 ^ 0x40CFFB9) & 0xFFFE0000 | (v64 >> 15)) ^ 0x77E5145C);
  unsigned int v72 = (v66 ^ 0x7FEF51B4) + ((2 * v66) & 0xFFDEA37A ^ 0x13) + v70 - v68 - v71 + 1;
  int v73 = -809759992 * v71 - 1982528838;
  unsigned int v74 = (-2047698469 * v70 - ((199570358 * v70 - 420719768) & 0x92143A6A) + 1015039721) >> 5;
  int v75 = (v74 | (-671088640 * v70 - ((805306368 * v70) & 0x20000000) - 1301993712) ^ 0x12652710) ^ 0x64850E9;
  unsigned int v76 = (((v73 - ((-1619519984 * v71 + 726252048) & 0xE8604B60)) ^ 0xF43025B2) & 0xFFFFFFF8 | ((-101219999 * v71
                                                                                              - ((-202439998 * v71
                                                                                                + 627652418) & 0xAE3D8B50)
                                                                                              + 1775460681) >> 29)) ^ 2;
  int v77 = v76 - 1490308777 - 2 * (v76 & 0x272BB15F ^ v73 & 8);
  LODWORD(STACK[0x238]) = v77;
  unsigned int v78 = (((-735410688 * v72 - ((676662272 * v72 + 1852212224) & 0x41850000) + 401982153) ^ 0xA0C280C9) & 0xFFFFFE00 | (((~(114567814 * v72 + 41366338) | 0xF3F69E2F) + 1131025731 * v72 - 952087926) >> 23)) ^ 0x10C;
  unsigned int v79 = v78 - 981491391 - ((2 * v78) & 0x8AFF4282);
  unsigned int v80 = ((288332334 * v68 - ((576664668 * v68 - 1097405924) & 0xE030C278) - 815540661) ^ 0x7018613D) & 0xFFFFFFFE | ((((288332334 * v68 + 1598780686) & 0xE00D7926) + 2003317481 * v68 + 1616087269) >> 31);
  unsigned int v81 = v80 - 808705761 - ((2 * v80) & 0x9F98423E);
  int v82 = (v77 ^ 0x58D44EA8) + ((v75 - 2 * (v75 & 0x5E1177E6 ^ v74 & 4) - 569280542) ^ 0x11DD56FD ^ v81) + 1;
  unsigned int v83 = (v79 ^ 0xC57FA141) + (v82 ^ 0x5956FBDF) + ((2 * v82) & 0xB2ADF7BE) - 1498872799;
  unsigned int v84 = v83 + 1614140945 - ((2 * v83) & 0xC06BAC22);
  unsigned int v85 = (v81 ^ 0xCFCC211F)
      + (v77 ^ 0xA72BB157)
      - ((2 * ((v81 ^ 0xCFCC211F) + (v77 ^ 0xA72BB157))) & 0x29490348)
      + 346325412;
  unsigned int v86 = 2 * (((v85 ^ 0x2B5C9766) & (v79 ^ 0xC57FA141)) - ((2 * ((v85 ^ 0x2B5C9766) & (v79 ^ 0xC57FA141))) & 0x45038844))
      + 1157859396;
  unsigned int v87 = (v79 ^ 0x6E233627 ^ v85) + (v86 ^ 0x3D8EB5AB) - 2022522351 + ((2 * v86) & 0xF11A7BDC ^ 0x80021088);
  unsigned int v88 = v84 ^ 0x6A2450CD ^ (v87 - ((2 * v87) & 0xF16A10B8) + 2025130076);
  unsigned int v89 = v88 - ((2 * v88 + 169249170) & 0x7875DBCC) + 21377711;
  LODWORD(STACK[0x23C]) = v89;
  LODWORD(STACK[0x240]) = HIBYTE(v89) ^ 0x11D6C390;
  unsigned int v90 = (v79 ^ 0xC57FA141)
      + (v89 ^ 0xC3C51219)
      + 47004794
      - ((2 * ((v79 ^ 0xC57FA141) + (v89 ^ 0xC3C51219) + 1)) & 0x59A78F2);
  LODWORD(STACK[0x244]) = v90;
  int v91 = v89 ^ v77;
  LODWORD(STACK[0x248]) = v89 ^ v77;
  int v92 = v90 ^ 0x2CD3C79;
  unsigned int v93 = -1989855995 * (v90 ^ 0x2CD3C79) - ((46819850 * (v90 ^ 0x2CD3C79)) & 0x9EDA5A8) - 2064198956;
  v89 ^= 0x3C3AEDE6u;
  LODWORD(STACK[0x24C]) = v89;
  unsigned int v94 = (v84 ^ 0x6035D611) + v89 - 625802855 - ((2 * ((v84 ^ 0x6035D611) + v89)) & 0xB5660332);
  LODWORD(STACK[0x250]) = v94;
  unsigned int v95 = v94 ^ 0xDAB30199;
  unsigned int v96 = (-385185554 * (v94 ^ 0xDAB30199)) & 0xBBAA62C4;
  unsigned int v97 = (1199570944 * (v91 ^ 0x9B115CB1) - 1805206580 - ((251658240 * (v91 ^ 0x9B115CB1)) & 0x28000000)) ^ 0x9466BBCC | ((-552207217 * (v91 ^ 0x9B115CB1) - ((-1104414434 * (v91 ^ 0x9B115CB1)) & 0xFC13DFBA) + 2114580445) >> 9);
  unsigned int v98 = ((2 * v97) & 0xD2FBEF98 ^ 0x7A0988) + (v97 ^ 0x6942F33B);
  unsigned int v99 = (23018240 * v89 + 566662977 - ((46036480 * v89) & 0x438D2E00)) ^ 0x21C69741 | ((-620667077 * v89
                                                                                      - ((-1241334154 * v89) & 0x8C42264A)
                                                                                      + 1176572709) >> 24);
  unsigned int v100 = ((2 * v99) & 0xFF7D552E ^ 0xC) + (v99 ^ 0xFFBEAAD1) - v98;
  int v101 = ((-1499422720 * v92 + 248376668 - ((222380032 * v92) & 0x1D9BC000)) ^ 0xECDED5C | (v93 >> 19)) ^ 0x109E;
  unsigned int v102 = v101 + 1118298824 - ((2 * v101) & 0x854FC590);
  int v103 = v102 ^ (v100 - ((2 * v100 + 327064170) & 0x31B1D802) + 43530550);
  unsigned int v104 = 470369577 * v98 - ((940739154 * v98 + 1102751912) & 0x557CB242) + 1268493685;
  v102 ^= 0x42A7E2C8u;
  unsigned int v105 = 494062539 * v102 - ((988125078 * v102) & 0x567224EC) + 725160566;
  unsigned int v106 = -770371108 * v95 - 195443919 - ((-1540742216 * v95) & 0xE8B38660);
  unsigned int v107 = v106 ^ 0xF459C331 | ((v96 - 1954890871 * v95 + 573230749) >> 30);
  HIDWORD(v108) = v103 ^ 0x7F0EC9;
  LODWORD(v108) = v103 ^ 0xDA000000;
  unsigned int v109 = v107 - 1011109446 - ((2 * v107) & 0x87776374);
  int v110 = (v108 >> 25) - ((2 * (v108 >> 25)) & 0x27BF7304) + 333429122;
  HIDWORD(v108) = v109 ^ 0x1BBB1BA;
  LODWORD(v108) = v106 ^ 0xF4000000;
  int v111 = v110 ^ ((v108 >> 25) - ((2 * (v108 >> 25)) & 0x8685D51C) - 1019024754);
  HIDWORD(v108) = v111 ^ 0x4E;
  LODWORD(v108) = v111 ^ 0xA232500;
  int v112 = ((v108 >> 7) - ((2 * (v108 >> 7)) & 0x63023B8C) - 1316938298) ^ 0x3434612A;
  unsigned int v113 = (-1564475392 * v112 - 1562903341 - ((1166016512 * v112) & 0x45800000)) ^ 0xA2D7FCD3 | ((1142700683 * v112
                                                                                               - ((137917718 * v112) & 0x31CD3856u)
                                                                                               + 417766443) >> 10);
  unsigned int v114 = ((2 * v113) & 0xFDBA779E ^ 0x8730E) + (v113 ^ 0x7EDB0268);
  int v115 = -1503252248 - ((v93 << 11) & 0x40000000) + 1610612736 * v102;
  HIDWORD(v108) = (v109 + 16) ^ 2;
  LODWORD(v108) = (-189532815 * (v109 ^ 0xC3BBB1BA) - 1971875632 - ((157805282 * (v109 ^ 0xC3BBB1BA)) & 0x14EF21A6) + 3) ^ 0x8A7790D0;
  int v116 = ((2 * (v108 >> 3)) & 0x6FFDFA96) + ((v108 >> 3) ^ 0xB7FEFD4B);
  unsigned int v117 = 45711879 * v114 - ((24314894 * v114 + 33193646) & 0x25BFD06) + 1512783322;
  unsigned int v118 = 117440512 * v114 - ((234881024 * v114 - 1375731712) & 0xF8000000) - 752274927;
  unsigned int v119 = ((v104 >> 4) ^ 0xFD909E29) - 1879048192 * v98 + ((v104 >> 3) & 0x1E76F776 ^ 0x456C324) - 1041807242 + v114;
  unsigned int v120 = (((v115 ^ 0xA66630E8 | (v105 >> 3)) ^ 0x567224E)
        + 1703870101
        - ((2 * ((v115 ^ 0xA66630E8 | (v105 >> 3)) ^ 0x567224E)) & 0xCB1DFD2A)) ^ 0x658EFE95;
  unsigned int v121 = v116
       + ((v119 | v120) ^ 0x3FFDFA5D)
       + (v119 & v120 ^ 0xFF7B7FDF)
       + ((2 * (v119 | v120)) & 0x7FFBF4BA)
       + ((2 * (v119 & v120)) & 0xFEF6FFBE)
       - 1299559000;
  unsigned int v122 = -716246237 * v120 - ((-1432492474 * v120) & 0xDCFFB772) + 1853873081;
  unsigned int v123 = 341226649 * v121 - ((145582386 * v121 + 265434578) & 0x1878549C) - 1809496777;
  unsigned int v124 = (((939524096 * v121 + 821719095) >> 7) & 0x1F00000 ^ 0xF00000)
       + (((939524096 * v121 + 821719095) >> 8) ^ 0x784E967);
  unsigned int v125 = (((((v123 >> 5) ^ 0x61E152) << (((v123 & 0x18 ^ 8) + 69) & 0x18))
         - 122329053
         - ((2 * (((v123 >> 5) ^ 0x61E152) << (((v123 & 0x18 ^ 8) + 69) & 0x18))) & 0xF16AD046)) ^ 0xF8B56823) << (((v123 & 0x18 ^ 8) + 69) ^ 0x5D);
  unsigned int v126 = (v125 - ((2 * v125) & 0xAA197CC8) + 1426898532) ^ (v123 >> 13);
  unsigned int v127 = v126 & 0xF7FFFFFF;
  unsigned int v128 = ((2 * v126) & 0xEFAE1D7C ^ 0xBA081D08)
       + (v126 & 0xF7FFFFFF ^ 0xA2DBD13B)
       + (((v126 ^ 0xA2F3207A) + 1) ^ 0xEEFBFFEF)
       + ((2 * ((v126 ^ 0xA2F3207A) + 1)) & 0xDDF7FFDE);
  unsigned int v129 = v128 - 686111387;
  int v130 = ((v128 + 288158035) & (v124 - 133960471))
       + 950406924
       - ((2 * ((v128 + 288158035) & (v124 - 133960471))) & 0x714C1E0E);
  unsigned int v131 = ((2 * ((v118 ^ 0x7C293211) & 0xFF000000 | (v117 >> 8))) & 0xBDBFFF66 ^ 0x25B64)
       + (((v118 ^ 0x7C293211) & 0xFF000000 | (v117 >> 8)) ^ 0x5EDED24D);
  unsigned int v132 = 842006528 * v120 + 1706750479 - ((1684013056 * v120) & 0xCB600000);
  unsigned int v133 = ((2 * (v127 ^ 0xA49CD4D6)) | 0xB4D53D08) - (v127 ^ 0xA49CD4D6) - 1516936836;
  unsigned int v134 = (v133 & 0x456E9CC0 ^ 0x45040040) + (v133 ^ 0x8AFA9F86) - ((v133 ^ 0x8AFA9F86) & 0x456E9CC0);
  unsigned int v135 = 1093377409 * v116 - ((39271170 * v116 + 556055658) & 0x28C6BE22) - 453657274;
  int v136 = -1065353216 * v116 - (((v116 << 24) + 889192448) & 0x27000000) - 1372395387;
  unsigned int v137 = -1262427457 - v128;
  if (v130 == 950406924) {
    unsigned int v137 = v129;
  }
  int v138 = (v137 + v124 - ((2 * (v137 + v124) + 1680617902) & 0x74C51DF2) - 327637040) ^ v134;
  HIDWORD(v139) = v138 ^ 0xB3DAB2;
  LODWORD(v139) = v138 ^ 0x5000000;
  int v140 = ((v139 >> 24) - ((2 * (v139 >> 24)) & 0xFC25EA9C) - 32311986) ^ 0x41D02F95;
  unsigned int v141 = ((v132 ^ 0x65BAF20F | (v122 >> 12)) ^ 0xFD591802)
       + ((2 * (v132 ^ 0x65BAF20F | (v122 >> 12))) & 0xFABFFFFE ^ 0xDCFFA)
       + v131
       - 1547698098
       + v140
       - ((2
         * (((v132 ^ 0x65BAF20F | (v122 >> 12)) ^ 0xFD591802)
          + ((2 * (v132 ^ 0x65BAF20F | (v122 >> 12))) & 0xFABFFFFE ^ 0xDCFFA)
          + v131
          - 1547698098
          + v140)) & 0x2D24C7A6)
       + 378692563;
  unsigned int v142 = -515049483 * v140 - ((-1030098966 * v140) & 0xEB2E6600) - 174640384;
  unsigned int v143 = ((v136 ^ 0x93B2E885) & 0xFF800000 | (v135 >> 9)) ^ 0x4A31AF;
  int v144 = v143 + 75585331 - ((2 * v143) & 0x902AE66);
  unsigned int v145 = ((-938598912 * v131 - ((1850368 * v131 + 142478336) & 0xF494C00) - 203183045) ^ 0x7A4A63B) & 0xFFFFFE00 | ((1281623823 * v131 - ((-1731719650 * v131 - 1779679482) & 0xA3C2F460) - 1663592013) >> 23);
  int v146 = v145 ^ 0x7CFCFA74;
  unsigned int v147 = (2 * v145) & 0xF9F9F5AE ^ 0x106;
  int v148 = -46137344 * v140 - 1868738846 - ((981467136 * v140) & 0x21000000);
  unsigned int v149 = ((2 * (v148 ^ 0x909D4EE2 | (v142 >> 10))) & 0xBB7B7F6A ^ 0x7A4B08)
       + ((v148 ^ 0x909D4EE2 | (v142 >> 10)) ^ 0x5D80DA79);
  unsigned int v150 = (-651705973 - 2046820352 * (v144 ^ 0x4815733) - ((201326592 * (v144 ^ 0x4815733)) & 0xB0000000)) ^ 0xD927C18B | ((764078531 * (v144 ^ 0x4815733) - ((1528157062 * (v144 ^ 0x4815733)) & 0x5D205026u) + 781199379) >> 7);
  unsigned int v151 = ((-1755408896 * (v144 ^ 0x121334E0 ^ v141) - 2079740505 - ((247278592 * (v144 ^ 0x121334E0 ^ v141)) & 0x8135800)) ^ 0x8409ADA7 | ((155955019 * (v144 ^ 0x121334E0 ^ v141) - ((311910038 * (v144 ^ 0x121334E0 ^ v141)) & 0xB0D47F02) + 1483358081) >> 23)) ^ 0xB0;
  unsigned int v152 = v151 - 566077786 - ((2 * v151) & 0xBC84AD4C);
  unsigned int v153 = v146 + v147 - 2043691609 + v149;
  unsigned int v154 = (v150 ^ 0xFFA2D587) + ((2 * v150) & 0xFFFFEBAE ^ 0xBA40A0) + v153 - 1625976330 + (v152 ^ 0xDE4256A6);
  unsigned int v155 = ((2 * v152) ^ 0xDFB53C0D)
       + ((4 * v152) & 0x399CDD7C ^ 0xC6F7A7E7)
       + (v154 ^ 0x9FF795BE)
       + ((2 * v154) & 0x3FEF2B7C)
       + 1;
  int v156 = v155 - ((2 * v155 + 2041426434) & 0x4399CC04) - 1633435901;
  unsigned int v157 = v152 ^ 0x1EC07D1E ^ (1189195675 * v153 - ((-1916575946 * v153 - 434718658) & 0x81045770) + 864913367);
  int v158 = v156 ^ (-1269723209 * v157 - ((144908142 * v157) & 0x11F258BC) + 150547550);
  unsigned int v159 = 864785899 * (v158 ^ 0xA935CA5C) - 72579680 - ((1729571798 * (v158 ^ 0xA935CA5C)) & 0xF7590B40);
  LODWORD(STACK[0x254]) = v159;
  unsigned int v160 = (v159 ^ 0xFBAC85A0) + (v156 ^ 0xA1CCE602);
  unsigned int v161 = v160 + 1190962942 - ((2 * v160) & 0x8DF94DFC);
  LODWORD(STACK[0x258]) = v161;
  int v162 = v149 + (v159 ^ 0x4537A5F) - ((2 * (v149 + (v159 ^ 0x4537A5F)) + 75792536) & 0x864C8FE) + 645178571;
  LODWORD(STACK[0x25C]) = v162;
  int v163 = v152 ^ v159;
  LODWORD(STACK[0x260]) = v163;
  unsigned int v164 = (701231104 * (v163 ^ 0x25EED306) - 1739966448 - ((328720384 * (v163 ^ 0x25EED306)) & 0x30946000)) ^ 0x984A3810 | ((984784063 * (v163 ^ 0x25EED306) - ((1969568126 * (v163 ^ 0x25EED306)) & 0xBAFCE728) + 1568568212) >> 20);
  unsigned int v165 = ((2 * v164) & 0xFDF7EFBC ^ 0xBAC) + (v164 ^ 0xFEFBF209);
  unsigned int v166 = (81720326 * (v162 ^ 0x8432647F) + 400403867 - ((163440652 * (v162 ^ 0x8432647F)) & 0x2FBB5B34)) ^ 0x17DDAD9B | ((-2106623485 * (v162 ^ 0x8432647F) - ((81720326 * (v162 ^ 0x8432647F)) & 0xB2C63750) + 1499667368) >> 31);
  unsigned int v167 = ((2 * v166) & 0xABF7FDD2) + (v166 ^ 0x55FBFEE9);
  HIDWORD(v139) = v160;
  LODWORD(v139) = (-1238516047 * (v161 ^ 0x46FCA6FE) - 1466424836 - ((1817935202 * (v161 ^ 0x46FCA6FE)) & 0x513043FA) + 1) ^ 0xA89821FC;
  int v168 = ((2 * (v139 >> 1)) & 0xEB8FCDB6) + ((v139 >> 1) ^ 0x75C7E6DB);
  HIDWORD(v139) = v158;
  LODWORD(v139) = (669419103 * (v158 ^ 0xA935CA5C) - 1680676374 - ((265096382 * (v158 ^ 0xA935CA5C)) & 0x37A5D3D6) + 1) ^ 0x9BD2E9EA;
  int v169 = v139 >> 1;
  unsigned int v170 = v169 ^ 0x93EEBFEE;
  int v171 = (2 * v169) & 0x27DD7FDC;
  int v172 = 911603935 * v167 - ((212595134 * v167 + 39613970) & 0x13E7E41A) + 992095510;
  int v173 = v167 + v165 + v170 + v171 + v168 - 1188216739;
  unsigned int v174 = 1303741375 * v173 - ((-1687484546 * v173 - 39302566) & 0xE5A7E8C6) + 1906842000;
  int v175 = 1442373376 * v167 - ((200392192 * v167 + 477499904) & 0x10751400) + 913675249;
  int v176 = 1795653120 * v173 - ((370080768 * v173 + 278180864) & 0x1B725C00) - 1241282306;
  int v177 = 1985368095 * v165 - ((78422078 * v165 + 48707644) & 0x5246B8C);
  int v178 = v177 + 1275449828;
  unsigned int v179 = -324231106 * v165 - ((-648462212 * v165 + 634286200) & 0xE02D4DA0) - 2097291507;
  unsigned int v180 = ((v176 ^ 0xDB92EFE) & 0xFFFFFE00 | (v174 >> 23)) ^ 0x1E5;
  unsigned int v181 = v180 + 1981907218 - ((2 * v180) & 0xEC430224);
  unsigned int v182 = (1242395727 * v168 - ((-1810175842 * v168 + 388697302) & 0xED04CF0A) + 35122672) >> 17;
  int v183 = ((((v182 & 0x5000) + (v182 & 0x7800 ^ 0x7000)) | 0x79F4048A) - ((v182 & 0x7800 ^ 0x7000) & 0x55555555)) ^ 0x7192D28A;
  unsigned int v184 = ((-1171816448 * v168 - ((1951334400 * v168 - 2039808000) & 0x813E0000) + 64271372) ^ 0x409F340C | ((-1596504848 * v168 - ((1101957600 * v168 + 1924189536) & 0xF800FC80) - 1252465424) >> 21)) ^ 0x7E0;
  unsigned int v185 = (v183 - ((2 * v183) & 0xCA7C00) + 2012036663) ^ 0x7F8BB037 | (v184 + 1374016625 - ((2 * v184) & 0xA3CBA8E2)) ^ 0x51E5D471;
  unsigned int v186 = v185 - ((2 * v185) & 0x9CB39ADA) - 832975507;
  unsigned int v187 = ((((v175 ^ 0x83A8AF1) & 0xFFFFFF00 | HIBYTE(v172)) ^ 9)
        - ((2 * ((v175 ^ 0x83A8AF1) & 0xFFFFFF00 | HIBYTE(v172))) & 0xE37D1CC)
        - 2028214042) ^ 0xF13A69F4 ^ v181;
  unsigned int v188 = ((v179 ^ 0xF016A6D1)
        + 1989145868
  HIDWORD(v139) = v186 ^ 0x663;
  LODWORD(v139) = v186 ^ 0x6B101000;
  int v189 = (v139 >> 11) - ((2 * (v139 >> 11)) & 0xB4F4CB3E) - 629512801;
  unsigned int v190 = 402784757 * v188 - ((805569514 * v188) & 0x20CEBF56) - 1872273493;
  unsigned int v191 = -1261235587 * (v189 ^ 0xBBAECCA4) - ((1772496122 * (v189 ^ 0xBBAECCA4)) & 0xFBC48C44) + 2111981090;
  unsigned int v192 = ((2 * (v187 & v188)) & 0xDF55C7F6)
       + (v187 & v188 ^ 0xEFAAE3FB)
       + ((((v187 | v188) ^ 0xFCFF9FD5) + ((2 * (v187 | v188)) & 0xF9FF3FAA) + 50356268 + (v189 ^ 0x4451335B)) ^ 0x9EF7C7FA)
       + ((2 * (((v187 | v188) ^ 0xFCFF9FD5) + ((2 * (v187 | v188)) & 0xF9FF3FAA) + 50356268 + (v189 ^ 0x4451335B))) & 0x3DEF8FF4);
  unsigned int v193 = -1953964303 * v192 - ((387038690 * v192 - 1926541130) & 0x8BE2D0BE) + 210178234;
  unsigned int v194 = -1198657776 * v192 - ((1897651744 * v192 - 759887008) & 0xCAF89BC0) + 1322701714;
  unsigned int v195 = (-408944640 * (v181 ^ 0x76218112) - 2014277908 - ((255852544 * (v181 ^ 0x76218112)) & 0xFC00000)) ^ 0x87F08EEC | ((-1877897411 * (v181 ^ 0x76218112) - ((539172474 * (v181 ^ 0x76218112)) & 0xB5D371E8) - 622216972) >> 11);
  unsigned int v196 = ((2 * v195) & 0xFDF77FEE ^ 0x363A6E) + (v195 ^ 0xFEE0E2C0);
  unsigned int v197 = ((((v178 & 0x80000000 ^ 0x89244001) - 1549028207) ^ 0xACCFF492) & 0x80000000 | (v190 >> 1)) ^ 0x34CD38DA;
  unsigned int v198 = -1499950104 * (v189 ^ 0xBBAECCA4) + 1706962694 - ((1295067088 * (v189 ^ 0xBBAECCA4)) & 0xCB7C5E00);
  unsigned int v199 = ((2 * ((v194 ^ 0xE57C4DE2) & 0xFFFFFFF0 | (v193 >> 28))) & 0xEABFFD7E ^ 0x18)
       + (((v194 ^ 0xE57C4DE2) & 0xFFFFFFF0 | (v193 >> 28)) ^ 0x755FFEB3);
  unsigned int v200 = ((2 * (v198 ^ 0x65BE2F06 | (v191 >> 29))) & 0xCB58DABC ^ 4) + ((v198 ^ 0x65BE2F06 | (v191 >> 29)) ^ 0xE5AC6D5D);
  unsigned int v201 = -1838491311 * v196 - ((617984674 * v196 + 615761842) & 0x9E68EE3A) - 510764298;
  unsigned int v202 = (~(176685056 * v196 + 516423680) | 0xC997FFFF) + 1698955264 * v196 - 1432801790;
  unsigned int v203 = (v190 & 0xF9FD2E1E ^ 0x90650E0A) + v197 - v196 + v200 - v199 + 306274624;
  unsigned int v204 = (((-1466637617 * v199 - ((1361692062 * v199 + 1948306206) & 0x4BCF29A8) + 1610087011) >> 3) - (v199 << 29)) ^ 0x14BCF29A;
  int v205 = v204 - ((2 * v204 + 0x40000000) & 0x7137337A) + 412850621;
  unsigned int v206 = (1137132315 * v203 - ((126780982 * v203 + 1276476902) & 0x6C789F3E) - 599322990) >> 11;
  unsigned int v207 = ((v202 ^ 0x1B352E01) & 0xFFFC0000 | (v201 >> 14)) ^ 0x13CD1;
  int v208 = v207 + 973649963 - 2 * (v207 & 0x3A08B82F ^ (v201 >> 14) & 4);
  unsigned int v209 = (v206 | (1667235840 * v203 - ((1186988032 * v203 + 1019215872) & 0x55555555) - 1994600261) ^ 0xAABCD0BB) ^ 0x6C789;
  int v210 = v209 - 1987811398 - 2 * (v209 & 0x98467BE ^ v206 & 4);
  unsigned int v211 = ((-183808064 * v200 - ((706125696 * v200 + 1070067456) & 0x360A4B00) + 2062097680) ^ 0x9B052590) & 0xFFFFFFC0 | ((668216639 * v200 - ((128473726 * v200 + 117383100) & 0x6D3D966) + 1256815761) >> 26);
  unsigned int v212 = v211 - ((2 * v211) & 0xC7A01894) - 472904630;
  unsigned int v213 = (v205 ^ 0x389B99BD)
       + (((v208 ^ 0x3A08B82B) + (v210 ^ 0x767B9845) + 1) ^ 0x57F537BF)
       + ((2 * ((v208 ^ 0x3A08B82B) + (v210 ^ 0x767B9845) + 1)) & 0xAFEA6F7E)
       + 367130530;
  int v214 = v212 ^ v208 ^ v205 ^ v210;
  unsigned int v215 = v214 ^ 0xC25B6E12 ^ (v213 - ((2 * v213) & 0x553848E8) - 1432607628);
  int v216 = 1569695457 * v215 - 1999004010 - ((455036354 * v215) & 0x11B33D2C);
  LODWORD(STACK[0x264]) = v216;
  LOBYTE(v207) = v172 & 8;
  unsigned int v217 = (v216 ^ 0x88D99E96)
       + (v210 ^ 0x898467BA)
       - 271394311
       - ((2 * ((v216 ^ 0x88D99E96) + (v210 ^ 0x898467BA))) & 0xDFA5B3F2);
  LODWORD(STACK[0x268]) = v217;
  int v218 = v205 ^ v216;
  LODWORD(STACK[0x26C]) = v205 ^ v216;
  int v219 = (v216 ^ 0x77266169) + (v214 ^ 0x68C74A66) + 1;
  int v220 = (v216 ^ 0x77266169) + (v214 ^ 0x68C74A66) - 2071986679 - ((2 * v219) & 0x8FFFC10);
  LODWORD(STACK[0x270]) = v220;
  unsigned int v221 = ((((v216 ^ 0x88D99E96) >> v207) + 1355332182 - ((2 * ((v216 ^ 0x88D99E96) >> v207)) & 0xA19174AC)) ^ 0x50C8BA56) >> (v207 ^ 8);
  LODWORD(STACK[0x274]) = v221 - ((2 * v221) & 0x41B463A) - 2113035491;
  int v222 = ((v218 ^ v217) & 0x9D6928 ^ 0x20131C83 | (v218 ^ v217) & 0x56208210) - 1;
  unsigned int v223 = (((v218 ^ v217) & 0x880214C4 ^ 0x549A823D) + ((v218 ^ v217) & 0x21400003) - 1) ^ 0x799A9EFE;
  unsigned int v224 = (((2 * v223) & 0x12000082) - v223 + 651878046) ^ 0x2DAD69E | ((v222 & 0x44012200 ^ 0xAC001405 | v222 & 0x12BCC938)
                                                                     - 1) ^ 0xFA81D614;
  LODWORD(STACK[0x278]) = v224 - ((2 * v224) & 0x1D517B7E) + 245939647;
  LODWORD(STACK[0x27C]) = LOBYTE(STACK[0x267]) ^ 0x171A4571;
  v217 ^= 0xEFD2D9F9;
  unsigned int v225 = 153924947 * v217 - ((307849894 * v217) & 0x407B6608) - 1606569212;
  unsigned int v226 = (-601006845 * (v220 ^ 0x847FFE08) - ((-1202013690 * (v220 ^ 0x847FFE08)) & 0xF839B838) - 65217508) >> 2;
  int v227 = -1767219200 * v217 + 285653179 - ((760528896 * v217) & 0x220D4000);
  int v228 = ((v227 ^ 0x1106B8BB | (v225 >> 19)) ^ 0x1407)
       - 2025534840
       - ((2 * (v227 ^ 0x1106B8BB | (v225 >> 19))) & 0xE899510);
  unsigned int v229 = ((-1452751222 * (v218 ^ 0xB042072B) - ((1389464852 * (v218 ^ 0xB042072B)) & 0xA6613E30)) & 0xFFFFFFFE | ((1421108037 * (v218 ^ 0xB042072B) - ((694732426 * (v218 ^ 0xB042072B)) & 0x7AA5FF2C) + 1028849558) >> 31))
       + 1395695384;
  unsigned int v230 = ((2 * v229) & 0x557FB346 ^ 0x4613200) + (v229 ^ 0xF98F46BB);
  unsigned int v231 = (-872480768 * v215 + 294916330 - ((402522112 * v215) & 0x23280000)) ^ 0x119410EA | ((1958857727 * v215
                                                                                            - ((-377251842 * v215) & 0xFE676FAC)
                                                                                            + 2134095830) >> 16);
  int v232 = ((v226 - (v219 << 30)) ^ 0x3F073707) - 1520261545 - ((2 * ((v226 - (v219 << 30)) ^ 0x3F073707)) & 0x4AC54CAE);
  unsigned int v233 = (v231 ^ 0xF5F9A45C) - v230 + ((2 * v231) & 0xEBF3B6DE ^ 0xB647) + 1;
  unsigned int v234 = v233 - ((2 * v233 + 1770781796) & 0x83E818FE) + 1991903921;
  unsigned int v235 = v228 ^ 0x8744CA88;
  unsigned int v236 = 769450227 * (v228 ^ 0x8744CA88) - ((1538900454 * (v228 ^ 0x8744CA88)) & 0x7F5DDDCE) - 1079054617;
  unsigned int v237 = ((1794753344 * (v228 ^ v232 ^ 0xE3D260A0 ^ v234)
         - 1838754762
         - ((368281216 * (v228 ^ v232 ^ 0xE3D260A0 ^ v234)) & 0x24CDA800)) ^ 0x9266D436 | ((632022797
                                                                                          * (v228 ^ v232 ^ 0xE3D260A0 ^ v234)
                                                                                          - ((1264045594
                                                                                            * (v228 ^ v232 ^ 0xE3D260A0 ^ v234)) & 0xBEDC03AE)
                                                                                          - 546438697) >> 26)) ^ 0x37;
  unsigned int v238 = v237 - 711424688 - ((2 * v237) & 0xAB310AA0);
  unsigned int v239 = v238 ^ 0xD5988550;
  unsigned int v240 = 573074837 * (v238 ^ 0xD5988550) - ((1146149674 * (v238 ^ 0xD5988550)) & 0x6D215466) + 915450419;
  unsigned int v241 = (((-1526211840 * v230 - ((1242543616 * v230 - 1128718848) & 0xBD2C2400) - 1124949604) ^ 0xDE96129C) & 0xFFFFFF00 | ((-1482356773 * v230 - ((1330253750 * v230 + 666679582) & 0x4F73CCC6) - 1147649294) >> 24)) ^ 0xA7;
  unsigned int v242 = ((2021392384 * (v232 ^ 0xA562A657) + 520849622 - ((821559296 * (v232 ^ 0xA562A657)) & 0x3E100000)) ^ 0x1F0B88D6 | ((946314783 * (v232 ^ 0xA562A657) - ((1892629566 * (v232 ^ 0xA562A657)) & 0x486B77E4) - 1539982350) >> 14)) ^ 0x290D6;
  unsigned int v243 = v242 - 642945878 - ((2 * v242) & 0xB35AD954);
  int v244 = v238 ^ (v241 - ((2 * v241) & 0x6D9AFBF6) + 919436795);
  unsigned int v245 = v240 >> 13;
  unsigned int v246 = ((1887010816 * v235 - 1499048602 - ((1626537984 * v235) & 0x4D4C0000)) ^ 0xA6A65566 | (v236 >> 17)) ^ 0x5FD7;
  unsigned int v247 = v246 + 1676691201 - ((2 * v246) & 0xC7E08E02);
  int v248 = v247 ^ 0x63F04701;
  unsigned int v249 = -151639808 * (v243 ^ 0xD9AD6CAA) + 1541941320 - ((-303279616 * (v243 ^ 0xD9AD6CAA)) & 0xB7D05000);
  unsigned int v250 = -1067541609 * (v247 ^ 0x63F04701) - ((-2135083218 * (v247 ^ 0x63F04701)) & 0xA4BB045A) + 1381859885;
  unsigned int v251 = 2
       * (((v244 ^ 0xE355F8AB) & (v247 ^ 0x63F04701)) - ((2 * ((v244 ^ 0xE355F8AB) & (v247 ^ 0x63F04701))) & 0x1791D87C))
       + 395434108;
  unsigned int v252 = (v247 ^ 0x80A5BFAA ^ v244) + (v251 ^ 0x40F22F91) - 1466169325 + ((2 * v251) & 0xAEC7EFD8 ^ 0x2E03A0D8);
  unsigned int v253 = (v245 | (1822949376 * v239 - 2085959261 - ((22020096 * v239) & 0x7500000)) ^ 0x83AAC9A3) ^ 0x1B485;
  int v254 = v253 - 2069302670 - ((2 * v253) & 0x951E4E4);
  unsigned int v255 = -373723136 * v248 - ((-747446272 * v248) & 0x9B710000) - 843546447;
  unsigned int v256 = v243 ^ 0x182C0A98 ^ (v252 - ((2 * v252) & 0x8302CC64) - 1048484302);
  unsigned int v257 = -1132906321 * v256 - ((2029154654 * v256) & 0x9E093D9E) - 821780785;
  unsigned int v258 = (v249 ^ 0x5BE82848 | ((636941865 * (v243 ^ 0xD9AD6CAA)
                              - ((200141906 * (v243 ^ 0xD9AD6CAA)) & 0x3DA1B548)
                              + 517003940) >> 24)) ^ 0x1E;
  unsigned int v259 = v258 - 623059909 - ((2 * v258) & 0xB5B9B876);
  unsigned int v260 = -1358954496 * v256 + 2038633108 - ((1577058304 * v256) & 0xF2000000);
  unsigned int v261 = v254 ^ 0x84A8F272;
  unsigned int v262 = 793627520 * v248 - ((1587255040 * v248) & 0xD57B5700) - 356668497;
  unsigned int v263 = (v262 & 0xE8000000 ^ 0xE070EEE9 | v262 & 0x10000000) - 1;
  unsigned int v264 = (v245 & 0x200 ^ 0xB4FE3F46) + 2 * (v245 & 0x200);
  unsigned int v265 = (((v263 & 0x70000000 ^ 0x1120CA11) + (v263 & 0x88000000 ^ 0xC992507) - 2) ^ 0x15B9EF16) & 0xFFFFFF80 | (v250 >> 25);
  unsigned int v266 = v264 + 1878522816;
  unsigned int v267 = ((v265 ^ 0x29) - 1789892268 - ((2 * v265) & 0x2AA0D2A8)) ^ 0x95506954 | (v255 >> 5) ^ 0x66DC405;
  int v268 = v267 - ((2 * v267) & 0x1BD61282) - 1913976511;
  HIDWORD(v139) = v268 ^ 0x20AF79F;
  LODWORD(v139) = v268;
  int v269 = (v139 >> 27) - ((2 * (v139 >> 27)) & 0x19444AAC) + 211952982;
  unsigned int v270 = ((v264 + 1258406074) & (v269 ^ 0xF09DFE00))
       - 963455759
       - ((2 * ((v264 + 1258406074) & (v269 ^ 0xF09DFE00))) & 0x8D25A800);
  unsigned int v271 = -638289332 - v264;
  if (v270 == -963455759) {
    unsigned int v271 = v266;
  }
  unsigned int v272 = (v269 ^ 0xF09DFE87)
       - 620116742
       + v271
       - ((2 * ((v269 ^ 0xF09DFE87) - 620116742 + v271)) & 0xC9D9CAE0)
       - 454236816;
  unsigned int v273 = ((2 * (v260 ^ 0x79831294 | (v257 >> 8))) & 0xEBBAC95E ^ 0x19A091C)
       + ((v260 ^ 0x79831294 | (v257 >> 8)) ^ 0xF5126031);
  unsigned int v274 = (v254 & 0xFFFFFDFF ^ 0x60441502 ^ v272) - v273 - 170040145;
  int v275 = ((2 * v274) & 0x6FFA653A) + (v274 ^ 0x37FD329D);
  HIDWORD(v276) = v259 ^ 0x5C3B;
  LODWORD(v276) = v249 ^ 0x5BE80000;
  unsigned int v277 = (-1342730706 * v273 - ((1609505884 * v273 + 2097917212) & 0x4A5A5EB8)) & 0xFFFFFFFE | ((1476118295 * v273
                                                                                               - ((804752942 * v273
                                                                                                 + 1048958606) & 0x3D9E517E)
                                                                                               - 1106111482) >> 31);
  int v278 = (v276 >> 15) - ((2 * (v276 >> 15)) & 0x48A5862E) + 609403671;
  HIDWORD(v276) = v275 + 19811;
  LODWORD(v276) = v275 - 939340445;
  int v279 = ((v276 >> 15) - ((2 * (v276 >> 15)) & 0x9A95C644) + 1296753442) ^ v278;
  HIDWORD(v276) = v279 ^ 0x3195;
  LODWORD(v276) = v279 ^ 0x5F5C0000;
  unsigned int v280 = ((v277 + 1672676842) ^ 0x252D2F5C) - 604257571 - ((2 * ((v277 + 1672676842) ^ 0x252D2F5C)) & 0xB7F785BA);
  int v281 = ((v276 >> 17) - ((2 * (v276 >> 17)) & 0xD83AA1FA) + 1813860605) ^ 0x64CD4BDF;
  unsigned int v282 = ((1141596832 * v261 - 335693942 - ((-2011773632 * v261) & 0xD7FB6F00)) ^ 0xEBFDB78A | ((1914723093 * v261
                                                                                               - ((-465521110 * v261) & 0xB5284AB4)
                                                                                               + 1519658330) >> 27)) ^ 0xB;
  int v283 = v282 - ((2 * v282) & 0x72C72856) + 962827307;
  unsigned int v284 = ((-211812352 * v281 + 977509069 - ((1723858944 * v281) & 0x74800000)) ^ 0x3A439ACD | ((453773211 * v281
                                                                                              - ((907546422 * v281) & 0xD1A73218)
                                                                                              + 1758697740) >> 11)) ^ 0xD1A73;
  int v285 = v284 + 1006427615 - ((2 * v284) & 0x77F9BBBE);
  LODWORD(STACK[0x280]) = v285;
  unsigned int v286 = (-20222976 * (v259 ^ 0xDADCDC3B) + 227213692 - ((496424960 * (v259 ^ 0xDADCDC3B)) & 0x1B160000)) ^ 0xD8B017C | ((2147463899 * (v259 ^ 0xDADCDC3B) - ((134178230 * (v259 ^ 0xDADCDC3B)) & 0x40DD11E) - 2113476465) >> 22);
  unsigned int v287 = ((2 * v286) & 0xF53AE6F6 ^ 0x410) + (v286 ^ 0x7A9D7173) + (v283 ^ 0xC69C6BD4);
  unsigned int v288 = ((v287 - ((2 * v287 + 180689164) & 0x1DDA095A) - 1806724813) ^ 0xD516C670 ^ v280) + (v285 ^ 0x3BFCDDDF);
  int v289 = v288 + 656097314 - ((2 * v288) & 0x4E368044);
  unsigned int v290 = (v285 ^ 0xC4032220) + (v283 ^ 0x18281709 ^ v280) + 1;
  unsigned int v291 = (383327023 * (((2 * v290) & 0xE9DF6DFE) + (v290 ^ 0xF4EFB6FF))
        - ((766654046 * (((2 * v290) & 0xE9DF6DFE) + (v290 ^ 0xF4EFB6FF)) + 1863517278) & 0x98FA81BA)
        - 2079931636) ^ v289;
  unsigned int v292 = v291 ^ 0xE6D7E716;
  LODWORD(STACK[0x284]) = v291 ^ 0xE6D7E716;
  int v293 = v289 ^ 0x271B4022;
  int v294 = v291 ^ 0x3B52C005;
  unsigned int v295 = (v291 ^ 0x3B52C005) + v293 + 1199134552 - ((2 * ((v291 ^ 0x3B52C005) + v293)) & 0x8EF2AEB0);
  LODWORD(STACK[0x288]) = v295;
  unsigned int v296 = (v280 ^ 0xDBFBC2DD)
       + (v291 ^ 0xC4AD3FFA)
       - 1649687530
       - ((2 * ((v280 ^ 0xDBFBC2DD) + (v291 ^ 0xC4AD3FFA) + 1)) & 0x3B57882A);
  LODWORD(STACK[0x28C]) = v296;
  int v297 = v292 ^ v285;
  LODWORD(STACK[0x290]) = v297;
  int v298 = v295 ^ 0x47795758;
  unsigned int v299 = 2140198595 * (v295 ^ 0x47795758) - ((-14570106 * (v295 ^ 0x47795758)) & 0xC89B8E60) + 1682818864;
  unsigned int v300 = v296 ^ 0x9DABC415;
  unsigned int v301 = -469914611 * (v296 ^ 0x9DABC415) - ((-939829222 * (v296 ^ 0x9DABC415)) & 0x93FF0DDC) + 1241482990;
  v297 ^= 0xE679FACC;
  unsigned int v302 = -800319901 * v297 - ((-1600639802 * v297) & 0xE244A4E0) + 1898074736;
  unsigned int v303 = (136439790 * v294 - ((272879580 * v294) & 0xD73C32A0)) & 0xFFFFFFFE | ((((136439790 * v294) & 0x896AE932)
                                                                               - 68219895 * v294
                                                                               + 994741094) >> 31);
  unsigned int v304 = 436207616 * v300 + 1338302993 - ((872415232 * v300) & 0x9C000000);
  int v305 = (v303 - 341960368) ^ 0x64616783;
  int v306 = (2 * (v303 - 341960368)) & 0x1FFEFDA6 ^ 0x173C30A0;
  unsigned int v307 = ((2 * (v304 ^ 0x4FC4E211 | (v301 >> 7))) & 0xB392FAAC ^ 0x102FA08)
       + ((v304 ^ 0x4FC4E211 | (v301 >> 7)) ^ 0xD95A825B);
  int v308 = ((225193984 * v298 + 134954962 - ((450387968 * v298) & 0x10166000)) ^ 0x80B3FD2 | (v299 >> 20)) ^ 0x644;
  int v309 = v308 + 568114215 - ((2 * v308) & 0x43B9784E);
  unsigned int v310 = -2107591912 * v297 + 1508127258 - ((79783472 * v297) & 0xB3C86430);
  int v311 = 2 * v307 + 1282213204;
  unsigned int v312 = v311 ^ 0x82101041;
  unsigned int v313 = (2 * v311) & 0xFBDFDF7C;
  int v314 = v309 ^ 0x21DCBC27;
  unsigned int v315 = -1713889809 * (v309 ^ 0x21DCBC27) - ((867187678 * (v309 ^ 0x21DCBC27)) & 0x8BF19C96) + 1173933643;
  int v316 = v307 + v312 - v313 + v305 + v306 - 1497530023;
  int v317 = ((v310 ^ 0x59E4321A | (v302 >> 29)) ^ 3)
       + 919741047
       - 2 * (((v310 ^ 0x59E4321A | (v302 >> 29)) ^ 3) & 0x36D2227F ^ (v310 ^ 0x59E4321A) & 8);
  int v318 = v309 ^ v317 ^ 0x352D89F9 ^ (v316 - ((2 * v316 + 1523770490) & 0x44462F52) - 1886615066);
  unsigned int v319 = (-1404165120 * v318 - 693577516 + (~(1486637056 * v318) | 0x52AE4FFF) + 1) ^ 0xD6A8D8D4 | ((-500493431 * v318 - ((-1000986862 * v318) & 0xC6962BAE) - 481618473) >> 22);
  unsigned int v320 = ((2 * v319) & 0xFD6E659E ^ 0x51A) + (v319 ^ 0x7EB73142);
  unsigned int v321 = ((-1391615488 * v307 - ((1511736320 * v307 + 111355904) & 0xEEE2D400) + 2059599726) ^ 0x77716B6E) & 0xFFFFFE00 | ((-959019311 * v307 - ((-1918038622 * v307 - 503098988) & 0xE24753E6) - 500870467) >> 23);
  unsigned int v322 = v321 ^ 0x91FEEF57;
  int v323 = (2 * v321) & 0x23FDDF6A ^ 0x140;
  unsigned int v324 = -1583710767 * v320 - ((1127545762 * v320 - 1305156606) & 0xEFEFCE22) - 787326702;
  unsigned int v325 = (-1652433168 * v314 - ((990100960 * v314) & 0x8345DFE0)) & 0xFFFFFFF0 | (v315 >> 28);
  unsigned int v326 = (1810006016 * (v317 ^ 0x36D22277) - 1385788406 - ((1472528384 * (v317 ^ 0x36D22277)) & 0x5ACD0000)) ^ 0xAD668C0A | ((239392709 * (v317 ^ 0x36D22277) - ((478785418 * (v317 ^ 0x36D22277)) & 0xC75A9A24) - 475181806) >> 17);
  int v327 = ((2 * v326) & 0x7FFEFBF6 ^ 0xE3A4) + (v326 ^ 0x3FFF0C2D);
  unsigned int v328 = ((2 * (v325 + 1101197296)) & 0xFDE9AFD6 ^ 0x81418FC0) + ((v325 + 1101197296) ^ 0x3F56381F);
  unsigned int v329 = v322 + v323 + v328 + v327 + 251976675 + v320;
  unsigned int v330 = -990074529 * v328 - ((167334590 * v328 + 311130518) & 0x18AC9A24) - 711194147;
  unsigned int v331 = 1337597952 * v320 - ((-1619771392 * v320 - 1669316608) & 0xCC6D4000) + 880205054;
  unsigned int v332 = -1528704193 * v329 - ((1237558910 * v329 - 1989962726) & 0xBA096A96) - 1581875368;
  unsigned int v333 = ((2 * ((v331 ^ 0xE636BCFE) & 0xFFFFE000 | (v324 >> 19))) & 0xF7FFFAF8 ^ 0x18F8)
       + (((v331 ^ 0xE636BCFE) & 0xFFFFE000 | (v324 >> 19)) ^ 0x7BFFF382);
  unsigned int v334 = 1257766912 * v328 - ((-860880896 - 1779433472 * v328) & 0xFF100000) - 438123510;
  unsigned int v335 = ((939524096 * v327 - ((805306368 - (v327 << 28)) & 0x30000000) - 1250400791) ^ 0x9D7865E9) & 0xF8000000 | ((-1424635961 * v327 - ((371953550 * v327 + 230681030) & 0x3DA29C76u) + 1169244958) >> 5);
  unsigned int v336 = ((2 * v335) & 0xFBFDFECE ^ 0x9ED14C2) + (v335 ^ 0x79087516) - v333;
  unsigned int v337 = -754239251 * v333 - ((-1508478502 * v333 + 947284072) & 0x81232E88) - 590558344;
  int v338 = 497025024 * v333 - ((994050048 * v333 + 218103808) & 0x48800000) + 717633195;
  unsigned int v339 = (((v329 << 29) + 1163506565) ^ 0xE559B385) & 0xE0000000 | (v332 >> 3);
  unsigned int v340 = ((2 * v339) & 0xFFFE30EE ^ 0x17402042) + (v339 ^ 0xF45F8EDE);
  int v341 = 1129482055 * v340 - ((111480462 * v340 + 1047981054) & 0x3B04B126) + 482201234;
  int v342 = v336 + v340 - ((2 * (v336 + v340) + 2080623420) & 0x4F9ED644) - 1513008960;
  unsigned int v343 = ((v334 ^ 0xFF8AC40A) & 0xFFF80000 | (v330 >> 13)) ^ 0x62B2;
  int v344 = v343 + 407488970 - ((2 * v343) & 0x30939394);
  unsigned int v345 = ((v338 ^ 0xA44636AB) & 0xFFE00000 | (v337 >> 11)) ^ 0x181232;
  unsigned int v346 = v345 + 1942058196 - ((2 * v345) & 0xE782E9A8);
  HIDWORD(v276) = ~(v332 >> 3);
  LODWORD(v276) = v341 ^ 0x9D825892;
  int v347 = (v276 >> 1) - 1948582041 - ((2 * (v276 >> 1)) & 0x17B5FECE);
  unsigned int v348 = (v347 ^ 0x8BDAFF67) - 703786175;
  unsigned int v349 = v348 ^ 0x8FFFBDCF;
  int v350 = (2 * v348) & 0x1FFF7B9E;
  unsigned int v351 = ((-353370112 * (v344 ^ 0xBF86A2E8 ^ v342)
         + 1986225280
         - ((-706740224 * (v344 ^ 0xBF86A2E8 ^ v342)) & 0xECC00000)) ^ 0x76636480 | ((-2146845009
                                                                                    * (v344 ^ 0xBF86A2E8 ^ v342)
                                                                                    - ((1277278
                                                                                      * (v344 ^ 0xBF86A2E8 ^ v342)) & 0x4D6F7742)
                                                                                    - 1497908319) >> 12)) ^ 0xA6B7B;
  unsigned int v352 = v351 + 1437585699 - ((2 * v351) & 0xAB5FA246);
  unsigned int v353 = ((83886080 * (v344 ^ 0x1849C9CA) - 825679893 - ((167772160 * (v344 ^ 0x1849C9CA)) & 0x9C000000)) ^ 0xCEC91FEB | ((1847516677 * (v344 ^ 0x1849C9CA) - ((-599933942 * (v344 ^ 0x1849C9CA)) & 0xB564E7DE) - 625839121) >> 8)) ^ 0xDAB273;
  unsigned int v354 = ((v353 - ((2 * v353) & 0x77B6007E) - 1143275457) ^ 0xC81A74EB ^ v346)
       + (((v352 ^ 0x55AFD123) + (v347 ^ 0x8BDAFF67)) ^ 0x88A020A0)
       - ((2 * ((v352 ^ 0x55AFD123) + (v347 ^ 0x8BDAFF67))) & 0xEEBFBEBE)
       + 2002771808;
  unsigned int v355 = ((2 * v354) & 0xEB7EFFA4) + (v354 ^ 0xF5BF7FD2);
  unsigned int v356 = (v352 ^ 0x112063BF ^ ((v346 ^ 0x73C174D4)
                             + v349
                             + v350
                             + 1879065137
                             - ((2 * ((v346 ^ 0x73C174D4) + v349 + v350 + 1879065137)) & 0x891F6538)
                             + 1150268060))
       - 171999278
       - v355;
  unsigned int v357 = ((2 * v356) & 0xED33EF7A)
       + (v356 ^ 0x7699F7BD)
       - ((2 * (((2 * v356) & 0xED33EF7A) + (v356 ^ 0x7699F7BD)) + 49453196) & 0x1B84D7D0)
       - 1086605266;
  LODWORD(STACK[0x294]) = v357;
  int v358 = v357 ^ v352;
  LODWORD(STACK[0x298]) = v357 ^ v352;
  LODWORD(STACK[0x29C]) = v357 ^ 0xD7993CBF;
  unsigned int v359 = v357 ^ 0xD7993CBF ^ v347;
  LODWORD(STACK[0x2A0]) = v359;
  unsigned int v360 = v355 + (v357 ^ 0x68F765C3) - ((2 * (v355 + (v357 ^ 0x68F765C3)) + 343998558) & 0xCB2B351E) + 1876302526;
  LODWORD(STACK[0x2A4]) = v360;
  int v361 = v352 ^ v347;
  LODWORD(STACK[0x2A8]) = LOBYTE(STACK[0x297]);
  int v362 = v360 ^ 0x65959A8F;
  unsigned int v363 = -891995541 * (v360 ^ 0x65959A8F) - ((-1783991082 * (v360 ^ 0x65959A8F)) & 0xA20B3EF8) + 1359323004;
  HIDWORD(v276) = v360 ^ 0x5959A8F;
  LODWORD(v276) = v360 ^ 0x60000000;
  int v364 = (v276 >> 27) - ((2 * (v276 >> 27)) & 0xBC65C794);
  HIDWORD(v276) = v361 ^ 0x6752E44;
  LODWORD(v276) = v361 ^ 0xD8000000;
  int v365 = ((v276 >> 27) - ((2 * (v276 >> 27)) & 0x39546B7C) + 480916926) ^ (v364 + 1580393418);
  HIDWORD(v276) = v365 ^ 0xFFFFFFF7;
  LODWORD(v276) = v365 ^ 0xB8870F40;
  LODWORD(STACK[0x2AC]) = (v276 >> 5) - ((2 * (v276 >> 5)) & 0x89462566) + 1151537843;
  int v366 = 1476395008 * v362 - 1526841848 - ((805306368 * v362) & 0x40000000);
  v359 ^= 0xCB4B59E4;
  LODWORD(STACK[0x2B0]) = v359;
  unsigned int v367 = (416982401 * v359 - ((833964802 * v359) & 0x42556D18) - 1591036276) >> 19;
  unsigned int v368 = ((2 * (v366 ^ 0xA4FE3E08 | (v363 >> 5))) & 0xD6F5DEFA ^ 0x41058F2)
       + ((v366 ^ 0xA4FE3E08 | (v363 >> 5)) ^ 0x69F2C386);
  unsigned int v369 = ((1420828672 * v359 - 2094197463 - ((23085056 * v359) & 0x65A0000)) ^ 0x832D1529 | v367) ^ 0x1425;
  int v370 = v369 + 284451573 - 2 * (v369 & 0x10F462F7 ^ v367 & 2);
  unsigned int v371 = (-483421280 * (v357 ^ 0x97089A3C) - 1117524850 - ((1180641088 * (v357 ^ 0x97089A3C)) & 0x7AC7D900)) ^ 0xBD63EC8E | ((-1625719651 * (v357 ^ 0x97089A3C) - ((104003898 * (v357 ^ 0x97089A3C)) & 0x5F088B6) - 2097658789) >> 27);
  int v372 = (v371 ^ 0x10) - ((2 * v371) & 0xD505C50) + 111685160;
  unsigned int v373 = (-2107637760 * (v358 ^ 0xC2A74B1F) + 1543990570 - ((79691776 * (v358 ^ 0xC2A74B1F)) & 0xB8000000)) ^ 0x5C076D2A | ((1970973715 * (v358 ^ 0xC2A74B1F) - ((720721958 * (v358 ^ 0xC2A74B1F)) & 0x2C5F97F0) + 372231160) >> 11);
  unsigned int v374 = ((2 * v373) & 0x59FEFEDA ^ 0x48AD2) + (v373 ^ 0xACFDBA94);
  int v375 = v370 ^ 0x10F462F5;
  unsigned int v376 = -1054358235 * (v370 ^ 0x10F462F5) - ((-2108716470 * (v370 ^ 0x10F462F5)) & 0xC6FEA276) + 1669288251;
  int v377 = (v372 ^ 0x165C4CDD ^ v370) - v374 - v368 + 410676970;
  unsigned int v378 = ((2 * v377) & 0xFDFFFFEE) + (v377 ^ 0x7EFFFFF7);
  unsigned int v379 = ((-52959136 * v374 - ((967823552 * v374 + 139779648) & 0x262E9B80) - 683557649) ^ 0x93174DCF) & 0xFFFFFFE0 | (((~(-1613922682 * v374 - 196958478) | 0x4873F349) - 806961341 * v374 - 706258475) >> 27);
  unsigned int v380 = ((2 * v379) & 0x7D6F79F2 ^ 0x12) + (v379 ^ 0xBEB7BCF2);
  int v381 = -280210354 * v368 - ((1587062940 * v368 + 1001654228) & 0x4AC10D48) + 1127910030;
  unsigned int v382 = ((1848891000 * v378 - ((1550298352 * v378 + 799347824) & 0x5C50F850)) & 0xFFFFFFF8 | ((-842630449 * v378
                                                                                              - ((462222750 * v378
                                                                                                + 368353934) & 0x274867C4)
                                                                                              + 513705257) >> 29))
       + 100337248;
  unsigned int v383 = ((2 * v382) & 0xEF9B7DBA ^ 0x4C107818) + (v382 ^ 0xD9E5C2F1);
  unsigned int v384 = (1240549696 * v375 - 3494313 - ((-1813867904 * v375) & 0xFF955C80)) ^ 0xFFCAAE57 | (v376 >> 26);
  unsigned int v385 = v384 ^ 0xEFFFFDC3;
  unsigned int v386 = (2 * v384) & 0xDFFFFBB6 ^ 0x30;
  unsigned int v387 = ((v381 & 0xFFFFFFFE | ((140105177 * v368 - 956848153 + ((1867273294 * v368 + 500827114) & 0x5436A300) + 1187) >> 31)) ^ 0x5A3A7B4A)
       + ((2 * v381) & 0xFEB5FBDC ^ 0x4A810948);
  unsigned int v388 = -2056931385 * v383 - ((181104526 * v383 + 1524584042) & 0x65CCB942) - 531233834;
  int v389 = 181104526 * v383 - ((362209052 * v383 + 364813524) & 0x12BF0848) + 1681838734;
  int v390 = v380 + v385 + v386 - v387 - v383 - 90671860;
  unsigned int v391 = -61479435 * v390 - ((145476586 * v390 + 145237966) & 0xF89017E) - 602368858;
  unsigned int v392 = 977450077 * v387 - ((1954900154 * v387 - 1139486444) & 0x8313A1F0) - 1617675902;
  unsigned int v393 = -1952448512 * v387 - ((390070272 * v387 + 578813952) & 0xF9000000) - 1916386950;
  unsigned int v394 = ((((~(799539200 * v390 + 523763712) | 0xBD9FFFFF) - 1747714048 * v390 - 254823368) ^ 0xA133B437) & 0xFFFC0000 | (v391 >> 14)) ^ 0x21F12;
  int v395 = v394 - 1985544062 - 2 * (v394 & 0x9A7008E ^ (v391 >> 14) & 0xC);
  unsigned int v396 = ((-452984832 * v380 - ((-2046820352 - 905969664 * v380) & 0xB2000000) + 485971261) ^ 0xD9F7553D) & 0xFF000000 | ((-1339890971 * v380 - ((1615185354 * v380 - 813939066) & 0x903BE8C8) - 1344530521) >> 8);
  unsigned int v397 = ((v389 & 0xFFFFFFFE | (v388 >> 31)) ^ 0xFF11D38A) + ((2 * v389) & 0xEC9CAF5C ^ 0x9C0848);
  unsigned int v398 = ((2 * v396) & 0xAF65FFBA ^ 0x1003BA8) + (v396 ^ 0x577AE229) + v397;
  int v399 = v398 - 2146527809 + (~(2 * v398 + 1677545706) | 0x63E0256D);
  unsigned int v400 = ((v393 ^ 0x7C86417A) & 0xFFE00000 | (v392 >> 11)) ^ 0x8313A;
  int v401 = v400 - 1624281154 - ((2 * v400) & 0x3E5EDF7C);
  unsigned int v402 = (((250216448 * v397 - ((231997440 * v397 + 233308160) & 0x9300000) + 1535920275) ^ 0x4984893) & 0xFFFE0000 | ((-1465546891 * v397 - 2 * ((-1465546891 * v397 + 1791961978) & 0x521E620F ^ (-1465546891 * v397) & 1) + 1022201224) >> 15)) ^ 0x1A43C;
  unsigned int v403 = v402 - ((2 * v402) & 0xB0A1A050) + 1481691176;
  unsigned int v404 = ((869793792 * (v395 ^ 0x89A70082) + 353461865 - ((665845760 * (v395 ^ 0x89A70082)) & 0x2A200000)) ^ 0x15116669 | ((-442128773 * (v395 ^ 0x89A70082) - ((189484278 * (v395 ^ 0x89A70082)) & 0x28420E1C) - 1809774834) >> 13)) ^ 0x4A108;
  unsigned int v405 = v404 - 739162888 - ((2 * v404) & 0xA7E289F0);
  unsigned int v406 = ((625550208 * (v401 ^ v399 ^ 0xD8878275 ^ v395)
         - 1909879709
         - ((177358592 * (v401 ^ v399 ^ 0xD8878275 ^ v395)) & 0x1C531800)) ^ 0x8E298C63 | ((2051707463
                                                                                          * (v401 ^ v399 ^ 0xD8878275 ^ v395)
                                                                                          - ((882189454
                                                                                            * (v401 ^ v399 ^ 0xD8878275 ^ v395)) & 0x2B0E20DA)
                                                                                          + 361173101) >> 25)) ^ 0xA;
  int v407 = v406 + 199009623 - ((2 * v406) & 0x17B94AAE);
  unsigned int v408 = ((2105540608 * (v401 ^ 0x9F2F6FBE) - 1461061897 - ((2063597568 * (v401 ^ 0x9F2F6FBE)) & 0x51000000)) ^ 0xA8E9F6F7 | ((1352423675 * (v401 ^ 0x9F2F6FBE) - ((557363702 * (v401 ^ 0x9F2F6FBE)) & 0x3BD127F6) + 501781499) >> 9)) ^ 0xEF449;
  int v409 = v408 - ((2 * v408) & 0x50696434) + 674542106;
  int v410 = v407 ^ 0xBDCA557;
  unsigned int v411 = ((2 * ((v407 ^ 0xBDCA557) + (v405 ^ v403 ^ 0x8BA194D0))) & 0x5FE9FF68)
       + (((v407 ^ 0xBDCA557) + (v405 ^ v403 ^ 0x8BA194D0)) ^ 0x2FF4FFB4);
  int v412 = v405 ^ v403 ^ v409 ^ v407;
  int v413 = (v411 - ((2 * v411 + 1858364596) & 0x4E55658A) - 1634933473) ^ v412;
  unsigned int v414 = (2 * v413) ^ 0xF80ECC1F;
  unsigned int v415 = (4 * v413) & 0x7FFDFFFC ^ 0x8FE267C3;
  unsigned int v416 = v413 ^ 0xDC07E60F;
  v413 ^= 0xF633158u;
  unsigned int v417 = ((v416 + v413) ^ 0x6FDFBCFE) + v414 + v415 + ((2 * (v416 + v413)) & 0xDFBF79FC) + 1;
  unsigned int v418 = ((v413 + 75806284) ^ 0xFFDFFF7B)
       + ((2 * (v413 + 75806284)) & 0xFFBFFEF6)
       + 2097285
       + ((v417 - ((2 * v417 - 1606515198) & 0x9983E6C2) + 484521570) ^ 0x333E0C9F);
  unsigned int v419 = v418 + 1090176683 - ((2 * v418) & 0x81F58D56);
  LODWORD(STACK[0x2B4]) = v412;
  LODWORD(STACK[0x2B8]) = v419;
  LODWORD(STACK[0x2BC]) = v419 ^ v412;
  LODWORD(STACK[0x2C0]) = (v419 ^ 0x40FAC6AB) + v410 - ((2 * ((v419 ^ 0x40FAC6AB) + v410)) & 0xCAA989B0) + 1700054232;
  LODWORD(STACK[0x2C4]) = (v419 ^ 0x40FAC6AB)
                        + (v405 ^ 0xD3F144F8)
                        - ((2 * ((v419 ^ 0x40FAC6AB) + (v405 ^ 0xD3F144F8))) & 0x801598A)
                        - 2080330555;
  v420 = malloc(0x404uLL);
  v38[53] = v420;
  void *v38 = 0LL;
  v38[1] = 0LL;
  v38[2] = 0LL;
  v38[3] = 0LL;
  v38[5] = 0LL;
  v38[6] = 0LL;
  v38[7] = 0LL;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(void *)(v36 + 8LL * ((1241 * (v420 != 0LL)) ^ v37)) - 12LL))( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  v429,  a34);
}

uint64_t sub_1886E8F5C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, void *a21, void *a22, uint64_t a23, void *a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, int a49, int a50)
{
  int v53 = v50 ^ 0xD5;
  unsigned int v69 = *(void **)(v52 + 56);
  unsigned int v67 = *(void **)(v52 + 40);
  unsigned int v68 = *(void **)(v52 + 48);
  HIDWORD(a23) = a50;
  unsigned int v54 = *(void **)(v52 + 24);
  unsigned int v55 = *(void **)(v52 + 8);
  unsigned int v66 = *(void **)v52;
  free(*(void **)(v52 + 16));
  free(v54);
  free(v55);
  free(*(void **)(v52 + 424));
  free(v67);
  free(v66);
  free(v68);
  free(v69);
  if ((a50 ^ 0xFFFA67C7) + 2129641472 + ((2 * a50) & 0xFFF4CF8E) == 2129274823) {
    int v64 = 0;
  }
  else {
    int v64 = -45011;
  }
  LODWORD(STACK[0x388]) = v64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 + 8LL * (v53 | (4 * ((a50 ^ 0xFFFA67C7) + 2129641472 + ((2 * a50) & 0xFFF4CF8E) == 2129274823)))) - ((v53 + 625) ^ 0x98DA4AED) + 2564443826LL))( v56,  v57,  v58,  v59,  v60,  v61,  v62,  v63,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  v66,  v67,  v68,  a23,  v69,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45);
}

uint64_t sub_1886E9058@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, int a48, int a49)
{
  LODWORD(STACK[0x38C]) = a49 - 1992393748;
  v54[9] = 42865283LL;
  *(_DWORD *)(v55 - 204) = a49 - 1992393748;
  v54[279] = v54[11];
  LODWORD(STACK[0x454]) = a1;
  v54[103] = 42865283LL;
  uint64_t v56 = v54[103];
  v54[104] = v56;
  int v57 = STACK[0x454];
  LODWORD(STACK[0x468]) = STACK[0x454];
  int v58 = v57 - v53 - 1084;
  LODWORD(STACK[0x46C]) = v58;
  uint64_t v59 = (*(_DWORD *)(v55 - 204) + v56);
  uint64_t v60 = v59 + 0x3469F9217737D82LL;
  v54[106] = v59 + 0x3469F9217737D82LL;
  BOOL v61 = v59 >= (v58 ^ 0xA75892E0);
  unint64_t v62 = 0xFCB9606DA909A620LL;
  if (!v61) {
    unint64_t v62 = 0xFCB9606EA909A620LL;
  }
  v54[80] = v54[279] + v60 + v62;
  v54[78] = *(void *)(v49 + 8LL * (v57 + 170));
  unint64_t v63 = ((v54[80] - *(void *)(v50 + 1832)) & 0xFFFFFFFFFFFFFFF0LL) + *(void *)(v51 + 1824);
  uint64_t v64 = (*(uint64_t (**)(void, unint64_t *, uint64_t))(*(void *)(v52 + 1856)
                                                                       + 32LL * *(unsigned __int8 *)(v63 + 8)
                                                                       + 8))( *(void *)v63,  &STACK[0x3D7],  1LL);
  LOBYTE(STACK[0x39F]) = STACK[0x3D7];
  return ((uint64_t (*)(uint64_t))v54[78])(v64);
}

void sub_1886E9114()
{
}

void sub_1886E9130()
{
  uint64_t v1 = v0[123];
  uint64_t v2 = v0[276] + v1;
  unsigned int v3 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x9A38147C)) ^ LODWORD(STACK[0x500])) & 0x7FFFFFFF);
  int v4 = (v3 >> (LODWORD(STACK[0x4F4]) ^ 0xAE)) ^ v3;
  LOBYTE(STACK[0x3EA]) = byte_1887456F0[v1 & 0xF | (16 * ((83590351 * v4) >> 24))] ^ LOBYTE(STACK[0x39F]) ^ (-49 * v4);
  v0[88] = v2;
  JUMPOUT(0x1886E20F0LL);
}

uint64_t sub_1886E91D4@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,int a60,int a61)
{
  int v61 = STACK[0x57C];
  LODWORD(STACK[0x210]) = STACK[0x578];
  LODWORD(STACK[0x214]) = v61;
  LODWORD(STACK[0x218]) = a61 - a60;
  return sub_1886E3DF4(2570119646LL, a1);
}

uint64_t sub_1886E92F4()
{
  unsigned int v1 = ((((LODWORD(STACK[0x574]) + 325683026) ^ STACK[0x568] & 0xC1829018) - 1) | STACK[0x568] & 0x4100605) ^ 0xE1BE8CDD;
  unsigned int v2 = v1 - ((2 * v1) & 0xE7A62DF2) - 69500935;
  int v3 = STACK[0x564];
  char v4 = (v3 - ((2 * v3 + 4) & 6) + 73) ^ 0x83;
  int v5 = LOBYTE(STACK[0x39F]) ^ 0xB0 ^ (-113 * v4 - ((30 * v4) & 0x3C) + 30);
  int v6 = v5 - ((2 * v5) & 0xB4);
  unsigned int v7 = ((((_BYTE)v6 + 122) & 0x1D ^ 0xFFFFFFFB) + 156321152) & 0x810001B | ((_BYTE)v6 + 122) & 4;
  unsigned int v8 = (((v6 + 1706762074) & 0xC2 ^ 0x400005C9) - ((v6 + 1706762074) & 0x20) + 55414819) ^ 0xCF0E9556;
  unsigned int v9 = (-1790240240
      - (STACK[0x568] & 0x3A6D69E2 ^ 0xA22D4E8A | 0x954B1A10)
      + (STACK[0x568] & 0x3A6D69E2 ^ 0xA22D4E8A | 0x6AB4E5EF)) ^ 0xAD44D53D ^ (((2 * v8) & 0x8800130) - v8 - 877447582) | v2 ^ 0xC19E7FBA ^ v7;
  unsigned int v10 = ((2 * v9) & 0xBFFDFEAC)
      + (v9 ^ 0x5FFEFF56)
      - ((2 * (((2 * v9) & 0xBFFDFEAC) + (v9 ^ 0x5FFEFF56)) - 1380048562) & 0xC55E998E)
      - 1181852306;
  LODWORD(STACK[0x57C]) = v10;
  BOOL v11 = (STACK[0x56C] & 1) == 0;
  LODWORD(STACK[0x580]) = ++v3;
  uint64_t v12 = *(void *)(v0 + 8LL * (LODWORD(STACK[0x570]) | (16 * v11)));
  LODWORD(STACK[0x554]) = STACK[0x570];
  LODWORD(STACK[0x558]) = STACK[0x578];
  LODWORD(STACK[0x55C]) = v10;
  LODWORD(STACK[0x560]) = v3;
  return ((uint64_t (*)(void))(v12 - 4))();
}

void sub_1886E9568()
{
  char v2 = STACK[0x39F];
  unsigned int v3 = STACK[0x490] & 0xFFFFFFFC ^ v1;
  LODWORD(STACK[0x4D8]) = v3;
  unsigned int v4 = v3 + 776642290 + ((2 * v3) & 0x5C953DE0 ^ 0xFFFFFFFB) + 1;
  LODWORD(STACK[0x5C4]) = v4;
  unsigned __int8 v5 = (-113 * (LOBYTE(STACK[0x5C0]) ^ 0x58)
      - ((32 * LOBYTE(STACK[0x5C0]) - 2 * (LOBYTE(STACK[0x5C0]) ^ 0x58)) & 0x6C)
      - 74) ^ v2;
  LOBYTE(STACK[0x5C8]) = v5;
  int v6 = byte_18873E660[v5 ^ 7LL];
  HIDWORD(v8) = v6 ^ 0xD;
  LODWORD(v8) = (v6 ^ 0x80) << 24;
  int v7 = v8 >> 30;
  int v9 = (2 * v7) & 0x64;
  v7 += 50;
  HIDWORD(v8) = v7 ^ 2;
  LODWORD(v8) = ((v7 - v9) ^ 0x30) << 24;
  LOBYTE(STACK[0x5C9]) = (v8 >> 26) - ((2 * (v8 >> 26)) & 0xF7) + 123;
  LOBYTE(STACK[0x5CA]) = (v5 ^ 0x72) - 2 * (((v5 ^ 0x72) + 120) & 0x57 ^ (v5 ^ 0x72) & 3) - 52;
  *(void *)(v0 + 640) = *(void *)(v0 + 1432) + (v4 ^ 0x2E4A9EF2);
  JUMPOUT(0x1886E92E4LL);
}

void sub_1886E9678()
{
  LOBYTE(STACK[0x5CB]) = STACK[0x39F];
  unsigned int v4 = STACK[0x490] & 0xFFFFFFF0 ^ (v3 + 8);
  LODWORD(STACK[0x4E0]) = v4;
  unsigned int v5 = v4 + 758911083 + ((2 * v4) & 0x5A7820C0 ^ 0xFFFFFFE9) + 1;
  LODWORD(STACK[0x5CC]) = v5;
  LOBYTE(STACK[0x5D3]) = -113 * (LOBYTE(STACK[0x5C4]) ^ 0xF2) - ((30 * (LOBYTE(STACK[0x5C4]) ^ 0xF2)) & 0x62) - 79;
  int v6 = LOBYTE(STACK[0x5C9]) ^ LOBYTE(STACK[0x5CA]) ^ LOBYTE(STACK[0x5C8]) ^ 0xB5;
  unsigned int v7 = (((v6 - ((2 * v6) & 0x96)) << 24) - 889192448) ^ 0xCB000000;
  LODWORD(STACK[0x5D4]) = v7 - 1190982485 - ((2 * v7) & 0x72000000);
  v2[80] = v2[180] + (v5 ^ 0x2D3C106B);
  v2[78] = *(void *)(v0 + 8LL * (v1 + 173)) - 4LL;
  JUMPOUT(0x1886E9520LL);
}

void sub_1886E9764( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, int a25, char a26)
{
  char v28 = STACK[0x39F];
  char v29 = byte_188747830[(LOBYTE(STACK[0x5CB]) ^ LOBYTE(STACK[0x5D3])) ^ 0x83];
  char v30 = -113 * (LOBYTE(STACK[0x5CC]) ^ 0x6B) - ((30 * (LOBYTE(STACK[0x5CC]) ^ 0x6B)) & 0x7C) - 66;
  int v31 = STACK[0x490];
  unsigned int v32 = STACK[0x490] & 0xFFFFFFF6 ^ (v27 + 8);
  LODWORD(STACK[0x598]) = v32;
  LODWORD(STACK[0x5D8]) = v32 - 537896100 - ((2 * v32) & 0xBFE0B6B8);
  LOBYTE(STACK[0x5DF]) = -109 * v29 - ((a26 + 38 * v29) & 0x55) + 31;
  unsigned __int8 v33 = v28 ^ 0x48 ^ v30;
  unsigned int v34 = (v31 & 0xFFFFFFFD ^ v27) + 572647925 - ((2 * (v31 & 0xFFFFFFFD ^ v27)) & 0x4443D3EA);
  LODWORD(STACK[0x5E0]) = v34;
  char v35 = byte_188747830[v33];
  LOBYTE(STACK[0x5E5]) = v35;
  LOBYTE(STACK[0x5E6]) = -109 * v35 - ((38 * v35 + 42) & 0x26) + 8;
  LOBYTE(STACK[0x5E7]) = -104 * v29 - ((48 * v29) & 0xDF) - 54;
  uint64_t v36 = v26[181] + (v34 ^ 0x2221E9F5);
  v26[153] = v36;
  v26[80] = v36;
  JUMPOUT(0x1886EAB88LL);
}

void sub_1886E98AC()
{
  LOBYTE(STACK[0x5F5]) = STACK[0x39F];
  LOBYTE(STACK[0x5F6]) = -113 * (LOBYTE(STACK[0x5E0]) ^ 0xF5) - ((30 * (LOBYTE(STACK[0x5E0]) ^ 0xF5)) & 0x83) - 63;
  LOBYTE(STACK[0x5F7]) = ((48 * LOBYTE(STACK[0x5E5])) | 0xBF) - 104 * LOBYTE(STACK[0x5E5]) - 56;
  v2[80] = v2[182] + (LODWORD(STACK[0x5D8]) ^ 0xDFF05B5C);
  v2[78] = *(void *)(v0 + 8LL * (v1 + v3 + 1296));
  JUMPOUT(0x1886E9520LL);
}

void sub_1886E9928()
{
  int v2 = byte_1887466F0[(LOBYTE(STACK[0x5F5]) ^ LOBYTE(STACK[0x5F6])) ^ 0xA9];
  unsigned int v3 = (v2 ^ 0xFFFFFFC6) + 1;
  v2 ^= 0xFFFFFFC5;
  int v4 = v2 + (v3 ^ 0x1B) + ((2 * v3) & 0x36) - 27;
  int v5 = ((v4 - 2 * (v4 & 0x1F) + 31) ^ 0xFFFFFFE7) + v2;
  int v6 = (-113 * (LOBYTE(STACK[0x5D8]) ^ 0x5C) - ((-2 * (LOBYTE(STACK[0x5D8]) ^ 0x5C)) & 0x18) + 12) ^ LOBYTE(STACK[0x39F]);
  int v7 = (v5 ^ 0xDE) + ((2 * v5) & 0xBC) + 34;
  unsigned int v8 = (((v7 - ((2 * v7) & 0x1F2)) << 8) - 1303643904) ^ 0xB24BF900;
  int v9 = byte_1887467F0[((-113 * (LOBYTE(STACK[0x5D8]) ^ 0x5C)
                                       - ((-2 * (LOBYTE(STACK[0x5D8]) ^ 0x5C)) & 0x18)
                                       + 12) ^ LOBYTE(STACK[0x39F])) ^ 0xDALL];
  int v10 = STACK[0x490];
  unsigned int v11 = STACK[0x490] & 0xFFFFFFFE ^ v1;
  LODWORD(STACK[0x5A8]) = v11;
  int v12 = v11 + 338848135 + ((2 * (v11 & 0x1432699E ^ (v10 | 0x7FFFFFE7))) ^ 0x33) + 1;
  LODWORD(STACK[0x5F8]) = v12;
  unsigned int v13 = (v6 ^ 5) + (((v6 ^ 0x26) + 1) ^ 0xFFFFFFDB) + ((2 * ((v6 ^ 0x26) + 1)) & 0xFFFFFFB6) + 37;
  int v14 = (v13 ^ 0x7F) + 2 * v13;
  int v15 = LOBYTE(STACK[0x5DF]) ^ LOBYTE(STACK[0x5E7]) ^ 0x40;
  unsigned int v16 = (v8 + 1027040549 + (~(2 * v8) | 0x859135FF) + 1) ^ 0x3D376525 | (v15 + 195671386 - ((2 * v15) & 0xB4)) ^ 0xBA9B55A;
  LODWORD(STACK[0x5FC]) = v16 - ((2 * v16) & 0x4984D1FE) - 1530763009;
  HIDWORD(v17) = v9 ^ 2;
  LODWORD(v17) = (v9 ^ 0x90) << 24;
  LOBYTE(STACK[0x602]) = (v17 >> 26) - ((2 * (v17 >> 26)) & 0xD0) + 104;
  HIDWORD(v17) = v14 + 1;
  LODWORD(v17) = (v14 << 24) - 2130706432;
  LOBYTE(STACK[0x603]) = (v17 >> 26) - ((2 * (v17 >> 26)) & 0xF7) + 123;
  *(void *)(v0 + 640) = *(void *)(v0 + 1464) + (v12 ^ 0x14326987u);
  JUMPOUT(0x1886EA858LL);
}

void sub_1886E9B6C()
{
  unsigned __int8 v2 = (-113 * (LOBYTE(STACK[0x5F8]) ^ 0x87) - ((30 * (LOBYTE(STACK[0x5F8]) ^ 0x87)) & 0xB4) - 38) ^ LOBYTE(STACK[0x39F]);
  int v3 = LOBYTE(STACK[0x602]);
  int v4 = LOBYTE(STACK[0x603]);
  HIDWORD(v5) = v4 ^ v3 ^ 0xE;
  LODWORD(v5) = (v4 ^ ~v3) << 24;
  int v6 = byte_1887467F0[v2 ^ 0xCDLL];
  unsigned int v7 = ((((((v5 >> 30) + (~(2 * (v5 >> 30)) | 0x45) - 34) ^ 0xAA)
  LODWORD(STACK[0x604]) = v7 + 662509689 - ((2 * v7) & 0x4EFA0000);
  char v8 = (v2 ^ 0x12) + (((v2 ^ 0x31) + 1) ^ 0xE7) + ((2 * ((v2 ^ 0x31) + 1)) & 0xCF) + 25;
  int v9 = ((2 * (STACK[0x5FC] & 0xA39B ^ 0x180)) | 0x3AC431DC) - (STACK[0x5FC] & 0xA39B ^ 0x180) + 1654515474;
  LODWORD(STACK[0x608]) = (v9 & 0x8D08A51A ^ 0xA088500) + (v9 ^ 0xF50230FE) - ((v9 ^ 0xF50230FE) & 0x2F08A51A);
  int v10 = v6 ^ 0xDC ^ (v8 - ((2 * v8) & 0x64) - 78);
  unsigned int v11 = (((v10 - ((2 * v10) & 0xFFFFFF1F)) << 16) - 7405568) ^ 0xFF8F0000;
  int v12 = (2 * v11) & 0x37980000;
  v11 -= 1681081721;
  unsigned int v13 = v11 - v12;
  int v14 = STACK[0x490];
  unsigned int v15 = STACK[0x490] & 0xFFFFFFF5 ^ (v1 + 8);
  LODWORD(STACK[0x4A4]) = v15;
  unsigned int v16 = v15 + 215101161 + ((2 * v15) & 0x19A45DC2 ^ 0xFFFFFFEF) + 1;
  LODWORD(STACK[0x60C]) = v16;
  unsigned int v17 = v14 & 0xFFFFFFF9 ^ v1;
  LODWORD(STACK[0x538]) = v17;
  LODWORD(STACK[0x610]) = v17 - 627131525 - ((2 * v17) & 0xB53D76F6);
  unsigned int v18 = (((2 * (~v11 & 0x70000)) | 0xA86C3D92) - (~v11 & 0x70000) - 1412832969) ^ 0x3C753864;
  LODWORD(STACK[0x614]) = ((2 * v18) & 0x8AE4DE52) - v18 + 982356182;
  LODWORD(STACK[0x618]) = (v13 & 0xF80000 ^ 0x500000)
                        + (v13 & 0xF00000 ^ 0x2A29509)
                        - ((v13 & 0xF80000 ^ 0x500000) & 0xF00000);
  *(void *)(v0 + 640) = *(void *)(v0 + 1472) + (v16 ^ 0xCD22EE9);
  JUMPOUT(0x1886EA1F4LL);
}

void sub_1886EA204()
{
  int v5 = LOBYTE(STACK[0x39F]);
  unsigned int v6 = ((((LOBYTE(STACK[0x63F]) ^ 0x87) - ((2 * (LOBYTE(STACK[0x63F]) ^ 0x87)) & 0x94)) << 8) - 2109257216) ^ 0x82474A00;
  unsigned int v7 = (v6 + 1539453654 - ((2 * v6) & 0x37846400)) ^ 0x5BC232D6 | LODWORD(STACK[0x5D4]) ^ 0xB9030CAB;
  LODWORD(STACK[0x650]) = v7 + 1686375451 - ((2 * v7) & 0xC9081836);
  int v8 = (((v5 - ((2 * v5) & 0xA6)) << 22) + 348127232) ^ 0x14C00000;
  unsigned int v9 = v8 - ((2 * v8) & 0xAAAAAAAA) + 1431842463;
  uint64_t v10 = LOBYTE(STACK[0x64B]);
  int v11 = byte_18873E660[v10 ^ 8] ^ v10 ^ 0x68 ^ ((v10 ^ 0x7D)
                                                            + ~(2 * (((v10 ^ 0x7D) + 120) & 0x6A ^ v10 & 2))
                                                            - 31);
  LODWORD(v10) = 599785472 * LODWORD(STACK[0x64C]) - ((125829120 * LODWORD(STACK[0x64C])) & 0x31000000) + 2022875495;
  LODWORD(v10) = (v10 & 0x20000000 ^ 0xE0773CEF) - (v10 & 0x20000000) + (v10 & 0x3E000000 ^ 0x4000000);
  LODWORD(v10) = (v10 & 0xC8000004 ^ 0x9000010) + (v10 ^ 0xC0193E8C) - ((v10 ^ 0xC0193E8C) & 0xC84A0043);
  unsigned int v12 = (((v11 - ((2 * v11) & 0xA2)) << 24) - 788529152) ^ 0xD1000000;
  unsigned int v13 = v9 ^ 0x91A0231A;
  int v14 = (v9 ^ 0xBB7BDED0 ^ v10)
      + (v9 ^ 0x91A0231A)
      - ((2 * ((v9 ^ 0xBB7BDED0 ^ v10) + (v9 ^ 0x91A0231A))) & 0x590A55CA)
      - 1400558875;
  unsigned int v15 = STACK[0x490] & 0xFFFFFFF8 ^ v4;
  LODWORD(STACK[0x524]) = v15;
  int v16 = v15 + 851084537 - ((2 * v15) & 0x657509F2);
  LODWORD(STACK[0x654]) = v16;
  int v17 = LOBYTE(STACK[0x5E6]) ^ LOBYTE(STACK[0x5F7]) ^ 0x34;
  unsigned int v18 = (v12 - 1669406104 - ((2 * v12) & 0x38000000)) ^ 0x9C7EE268 | (v17 - 1987512236 - ((2 * v17) & 0xA8)) ^ 0x8988F854;
  LODWORD(STACK[0x658]) = v18 - 991520969 - ((2 * v18) & 0x89CD2E6E);
  LODWORD(v10) = (v10 ^ v14 ^ ((v10 ^ 0x2ADBFDCB) - ((2 * (v10 ^ 0x2ADBFDCB) + 2) & 0x846C2424) - 1036643821) ^ 0xBB973AC3)
               + v13;
  LODWORD(v10) = ((2 * v10) & 0xF9FFFFEE) + (v10 ^ 0xFCFFFFF7);
  HIDWORD(v19) = v10 + 9;
  LODWORD(v19) = v10 + 50331657;
  LODWORD(v10) = (v19 >> 22) - ((2 * (v19 >> 22)) & 0xD3228FFA) + 1771128829;
  int v20 = ((2 * ((v10 ^ 0x89A750EE) + 32)) & 0xCFFEBFBE) + (((v10 ^ 0x89A750EE) + 32) ^ 0x67FF5FDF);
  LODWORD(v10) = (((2 * ((2 * v10) ^ 0xFA)) & 0x24) - ((2 * v10) ^ 0xFA) + 44) & 0x40;
  LODWORD(v10) = v20 + ((v10 & 0xFFFFFF7F | (((v10 >> 6) & 1) << 7)) ^ 0x714285);
  LODWORD(v10) = v10 - ((2 * v10 + 790543160) & 0xC8FD0C32) + 2081285045;
  LODWORD(STACK[0x65C]) = v10;
  LODWORD(STACK[0x660]) = (v10 ^ 0xE47E8619) - ((2 * (v10 ^ 0xE47E8619) + 112) & 0x48) + 28;
  v2[80] = v2[188] + (v16 ^ 0x32BA84F9u);
  v2[78] = *(void *)(v0 + 8LL * (v1 + v3 + 1311));
  JUMPOUT(0x1886E9520LL);
}

void sub_1886EA5EC()
{
  LOBYTE(STACK[0x6A6]) = STACK[0x39F];
  LOBYTE(STACK[0x6A7]) = -113 * (LOBYTE(STACK[0x654]) ^ 0xF9) - ((30 * (LOBYTE(STACK[0x654]) ^ 0xF9)) & 0xB4) - 38;
  int v2 = STACK[0x65C];
  int v3 = byte_18873E660[LODWORD(STACK[0x65C]) ^ 0xE47E866C];
  unsigned int v4 = (STACK[0x490] & 0xFFFFFFF4 ^ (v1 + 8))
     - 1504129468
     - 2 * ((STACK[0x490] & 0xFFFFFFF4 ^ (v1 + 8)) & 0x2658CE54 ^ STACK[0x490] & 0x10);
  LODWORD(STACK[0x6A8]) = v4;
  LODWORD(STACK[0x6AC]) = ((v3 ^ 0x8D) - ((2 * (v3 ^ 0x8D)) & 0xA2) + 81) ^ LODWORD(STACK[0x660]) ^ v2;
  uint64_t v5 = v0[189] + (v4 ^ 0xA658CE44);
  v0[144] = v5;
  v0[80] = v5;
  JUMPOUT(0x1886EAB88LL);
}

void sub_1886EA6C8()
{
  int v3 = byte_1887467F0[LOBYTE(STACK[0x687]) ^ 0x46LL];
  int v4 = LOBYTE(STACK[0x39F]);
  unsigned int v5 = LODWORD(STACK[0x658]) ^ 0xC4E69737 | LODWORD(STACK[0x688]) ^ 0xD2B186E8;
  LODWORD(STACK[0x66C]) = v5 - 1651760043 - ((2 * v5) & 0x3B1848AA);
  LOBYTE(v5) = -113 * LODWORD(STACK[0x498]) - ((30 * LOBYTE(STACK[0x498])) & 0x62) - 79;
  unsigned int v6 = (v0
      + (((v3 ^ LOBYTE(STACK[0x68F]) ^ 0x70) - ((2 * (v3 ^ LOBYTE(STACK[0x68F]) ^ 0x70)) & 0x4C)) << 16)
      - 1707933696) ^ 0x9A260000;
  unsigned int v7 = (v6 - 909819188 - ((2 * v6) & 0x138A0000)) ^ 0xC9C542CC | LODWORD(STACK[0x680]) ^ 0xF248E7FA;
  LODWORD(STACK[0x670]) = v7 - ((2 * v7) & 0x9B3AFAF4) + 1302166906;
  unsigned int v8 = (STACK[0x490] & 0xFFFFFFF2 ^ (v2 + 8))
     + 43492868
     + ((2 * (STACK[0x490] & 0xFFFFFFF2 ^ (v2 + 8))) & 0x52F4C00 ^ 0xFFFFFFF7)
     + 1;
  LODWORD(STACK[0x674]) = v8;
  int v9 = v5 & 0xF0 ^ (v4 + 1869732895 - ((2 * v4) & 0xD4) + 75);
  LODWORD(STACK[0x678]) = v9;
  LODWORD(STACK[0x67C]) = v9 ^ 0x6F71DC1F;
  uint64_t v10 = v1[193] + (v8 ^ 0x297A604);
  v1[129] = v10;
  v1[80] = v10;
  JUMPOUT(0x1886EA854LL);
}

void sub_1886EA868()
{
  char v4 = ((~(30 * (LOBYTE(STACK[0x698]) ^ 0xE1)) | 0x71) - 113 * (LOBYTE(STACK[0x698]) ^ 0xE1) + 72) ^ LOBYTE(STACK[0x39F]);
  LOBYTE(STACK[0x687]) = v4;
  int v5 = byte_1887466F0[(LOBYTE(STACK[0x697]) ^ LOBYTE(STACK[0x69C])) ^ 0x16] ^ 0xBD;
  unsigned int v6 = (((v5 - ((2 * v5) & 0xF4)) << 8) - 88376832) ^ 0xFABB7A00;
  LODWORD(STACK[0x688]) = v6 - 760117528 - ((2 * v6) & 0x25630C00);
  char v7 = ((2 * v4) ^ 0x32) + (v4 ^ 0xE6);
  int v8 = LOBYTE(STACK[0x69D]) ^ LOBYTE(STACK[0x69E]) ^ 0xF1;
  unsigned int v9 = (v8 + 1723857986 - ((2 * v8) & 0x84)) ^ 0x66BFFC42 | LODWORD(STACK[0x690]) ^ 0x82EF6A5B;
  LODWORD(STACK[0x668]) = v9 - ((2 * v9) & 0x9285CDB8) + 1229121244;
  if (((v7 + 1) & 8) != 0) {
    char v10 = -8;
  }
  else {
    char v10 = 8;
  }
  char v11 = ((v7 + v10 - 127 - ((2 * (v7 + v10 - 127)) & 0x28) + 20) ^ 0x3F) + 1;
  LOBYTE(STACK[0x68F]) = (v11 ^ 0xF7)
                       + v7
                       + ((2 * v11) & 0xEF)
                       - ((2 * ((v11 ^ 0xF7) + v7 + ((2 * v11) & 0xEF)) + 20) & 0x30)
                       - 94;
  uint64_t v12 = LODWORD(STACK[0x490]) ^ v3;
  LODWORD(STACK[0x498]) = v12;
  uint64_t v13 = v2[192] + v12;
  v2[132] = v13;
  v2[80] = v13;
  v2[78] = *(void *)(v0 + 8LL * (v1 + 192));
  JUMPOUT(0x1886E9520LL);
}

void sub_1886EAA00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
  LOBYTE(STACK[0x697]) = STACK[0x39F];
  int v28 = LOBYTE(STACK[0x69F]);
  int v29 = (v28 ^ 0xE7) - ((2 * (v28 ^ 0xE7)) & 0xF8) + 1976002172;
  unsigned int v30 = ((2 * (v28 ^ 0xFFFFFFC1)) & 0x1D6) + (v28 ^ 0xBFD27E2E);
  unsigned int v31 = ((v29 ^ 0x8A389983) - ((2 * (v29 ^ 0x8A389983) + 2) & 0x3868B974) + 473193659) ^ v29 ^ (-1421089441
                                                                                              - v30
                                                                                              - ((2141519386 - 2 * v30) & 0xD6F2CCA4));
  LODWORD(STACK[0x664]) = v31;
  unsigned int v32 = STACK[0x490] & 0xFFFFFFFA ^ v27;
  LODWORD(STACK[0x514]) = v32;
  unsigned int v33 = v32 - 121317153 - ((2 * v32) & 0xF189B1C0);
  LOBYTE(v31) = byte_188747830[(v31 ^ 0x828A5C94) + 34];
  LODWORD(STACK[0x698]) = v33;
  LOBYTE(STACK[0x69C]) = -113 * (LOBYTE(STACK[0x6A0]) ^ 0xEC) - ((30 * (LOBYTE(STACK[0x6A0]) ^ 0xEC)) & 0xA0) + 80;
  LOBYTE(STACK[0x69D]) = -109 * v31 - ((a26 + 38 * v31) & 0xE4) + 103;
  LOBYTE(STACK[0x69E]) = -104 * v31 + 35;
  *(void *)(v26 + 640) = *(void *)(v26 + 1528) + (v33 ^ 0xF8C4D8E1);
  JUMPOUT(0x1886EAB84LL);
}

void sub_1886EAB94()
{
  char v2 = STACK[0x39F];
  int v3 = byte_188747830[(LOBYTE(STACK[0x6A6]) ^ LOBYTE(STACK[0x6A7])) ^ 0x9C];
  unsigned int v4 = (((LODWORD(STACK[0x6AC]) << 24) ^ 0xEC000000)
      - 1710395748
      - ((2 * ((LODWORD(STACK[0x6AC]) << 24) ^ 0xEC000000)) & 0x34000000)) ^ 0x9A0D6E9C | LODWORD(STACK[0x644]) ^ 0xFDEF444D;
  LODWORD(STACK[0x690]) = v4 - 2098238885 - ((2 * v4) & 0x5DED4B6);
  int v5 = (-104 * v3 - ((48 * v3) & 0xC0) - 57) ^ (-109 * v3 - ((38 * v3 + 42) & 0x26) + 8) ^ 0x74;
  int v6 = (v5 + 2142276500 - ((2 * v5) & 0x128)) ^ 0x7FB08B94 | LODWORD(STACK[0x650]) ^ 0x64840C1B;
  LODWORD(STACK[0x680]) = v6 - 230103046 - ((2 * v6) & 0xE491CFF4);
  LOBYTE(STACK[0x69F]) = (-113 * (LOBYTE(STACK[0x6A8]) ^ 0x44)
                        - ((32 * LOBYTE(STACK[0x6A8]) - 2 * (LOBYTE(STACK[0x6A8]) ^ 0x44)) & 0x72)
                        + 57) ^ v2;
  unsigned int v7 = STACK[0x490] & 0xFFFFFFF1 ^ (v1 + 8);
  LODWORD(STACK[0x494]) = v7;
  unsigned int v8 = v7 - 737678356 + ((2 * v7) & 0xA80FD7C0 ^ 0xFFFFFFE7) + 1;
  LODWORD(STACK[0x6A0]) = v8;
  *(void *)(v0 + 640) = *(void *)(v0 + 1520) + (v8 ^ 0xD407EBEC);
  JUMPOUT(0x1886E92E4LL);
}

void sub_1886EAD3C()
{
  int v1 = LOBYTE(STACK[0x39F]);
  LODWORD(STACK[0x44C]) = (LODWORD(STACK[0x42C]) - 336782190) ^ v1;
  LODWORD(STACK[0x450]) = 2 * (v1 & 0x7F);
  char v2 = (LOBYTE(STACK[0x41C]) + (~(2 * LOBYTE(STACK[0x41C]) + 60) | 0xC9) + 58) ^ 0x1B;
  LOBYTE(v1) = v1 ^ 0x82 ^ ((~(30 * v2) | 0xA7) - 113 * v2 + 45);
  uint64_t v3 = *(void *)(v0 + 784);
  LOBYTE(STACK[0x3EA]) = v1;
  *(void *)(v0 + 704) = v3;
  JUMPOUT(0x1886E20F0LL);
}

void sub_1886EADCC()
{
  unsigned __int8 v1 = (-113 * (LOBYTE(STACK[0x674]) ^ 4) - ((32 * LOBYTE(STACK[0x674]) - 2 * (LOBYTE(STACK[0x674]) ^ 4)) & 0x64) - 78) ^ LOBYTE(STACK[0x39F]);
  int v2 = LOBYTE(STACK[0x678]);
  int v3 = (~(2 * v2) & 0x44) + (v2 ^ 0x48);
  char v4 = (v1 ^ 0x5C) + (((v1 ^ 0x7F) + 1) ^ 0xDF) + ((2 * ((v1 ^ 0x7F) + 1)) & 0xBF) + 33;
  int v5 = byte_18873E660[LODWORD(STACK[0x67C])] ^ v2 ^ 0xA6 ^ (v3 - ((2 * (_BYTE)v3 + 12) & 0x10) - 34);
  int v6 = (((v5 - ((2 * v5) & 0x26)) << 24) + 318767104) ^ 0x13000000;
  int v7 = byte_1887467F0[v1 ^ 0x83LL] ^ 0x31 ^ (v4 - ((2 * v4) & 0x78) - 68);
  unsigned int v8 = (((v7 - ((2 * v7) & 0x9A)) << 16) - 1169358848) ^ 0xBA4D0000;
  unsigned int v9 = (v8 - 1125453270 - ((2 * v8) & 0x79D40000)) ^ 0xBCEAF22A | LODWORD(STACK[0x66C]) ^ 0x9D8C2455;
  unsigned int v10 = (v6 - 1719024500 - ((2 * v6) & 0x32000000)) ^ 0x9989C48C | LODWORD(STACK[0x640]) ^ 0x958EC03D;
  unsigned int v11 = v10 - ((2 * v10) & 0x8AF42A1C) + 1165628686;
  unsigned int v12 = LODWORD(STACK[0x730]) ^ LODWORD(STACK[0x5BC]) ^ LODWORD(STACK[0x734]) ^ LODWORD(STACK[0x738]) ^ (v9 - ((2 * v9) & 0xA9F0CC6A) + 1425565237);
  unsigned int v13 = LODWORD(STACK[0x668]) ^ LODWORD(STACK[0x5B4]) ^ LODWORD(STACK[0x73C]) ^ LODWORD(STACK[0x740]) ^ LODWORD(STACK[0x744]);
  unsigned int v14 = LODWORD(STACK[0x670]) ^ LODWORD(STACK[0x5B8]) ^ LODWORD(STACK[0x748]) ^ LODWORD(STACK[0x74C]) ^ LODWORD(STACK[0x750]);
  unsigned int v15 = LODWORD(STACK[0x754]) ^ LODWORD(STACK[0x5B0]) ^ LODWORD(STACK[0x758]) ^ LODWORD(STACK[0x75C]) ^ v11;
  int v16 = *(_DWORD *)(v0[204] + 4LL * (BYTE1(v15) ^ 0x75u));
  int v17 = *(_DWORD *)(v0[206] + 4LL * (BYTE2(v14) ^ 0x47u));
  uint64_t v18 = v0[207];
  int v19 = *(_DWORD *)(v0[201] + 4LL * (BYTE1(v13) ^ 0xE0u)) ^ *(_DWORD *)(v0[200] + 4LL * (HIBYTE(v15) ^ 0xFE)) ^ *(_DWORD *)(v0[203] + 4LL * (v12 ^ 0x27u));
  unsigned int v20 = v17 ^ 0xA0024619;
  unsigned int v21 = (v19 ^ v17 ^ 0xE40D45C6) + (v17 ^ 0xA0024619) + 1;
  int v22 = *(_DWORD *)(v0[211] + 4LL * (BYTE2(v15) ^ 0x68u));
  int v23 = *(_DWORD *)(v0[205] + 4LL * (BYTE1(v12) ^ 0xC8u)) ^ *(_DWORD *)(v0[202] + 4LL * (BYTE2(v13) ^ 0x57u)) ^ *(_DWORD *)(v18 + 4LL * (HIBYTE(v14) ^ 0xF4)) ^ *(_DWORD *)(v0[208] + 4LL * ((LOBYTE(STACK[0x754]) ^ LOBYTE(STACK[0x5B0]) ^ LOBYTE(STACK[0x758]) ^ LOBYTE(STACK[0x75C]) ^ v11) ^ 0x6Eu));
  int v24 = *(_DWORD *)(v0[210] + 4LL * (BYTE1(v14) ^ 0x32u)) ^ v22 ^ *(_DWORD *)(v0[209] + 4LL * HIBYTE(v12));
  unsigned int v25 = (v19 ^ ((v19 ^ 0x440F03DF) - ((2 * (v19 ^ 0x440F03DF) + 2) & 0x651542AC) + 847946071) ^ (v21
                                                                                               - ((2 * v21) & 0x730D382E)
                                                                                               - 1182360553) ^ 0x30FCC161)
      + v20;
  unsigned int v26 = v25 - ((2 * v25) & 0xF94BEBCE) + 2091251175;
  v265[0] = ((((2 * v24) ^ 0x92) + 25) ^ 0xE6) + (v24 ^ 0xC9);
  int v27 = *(_DWORD *)(v18 + 4LL * (HIBYTE(v13) ^ 0x52)) ^ v16 ^ *(_DWORD *)(v0[213] + 4LL * (BYTE2(v12) ^ 0x73u));
  unsigned int v28 = v27 ^ *(_DWORD *)(v0[212]
                        + 4LL
                        * ((LOBYTE(STACK[0x670]) ^ LOBYTE(STACK[0x5B8]) ^ LOBYTE(STACK[0x748]) ^ LOBYTE(STACK[0x74C]) ^ LOBYTE(STACK[0x750])) ^ 6u));
  LOBYTE(v27) = (v27 & 0x18 ^ 0x4A) - ((2 * (v27 & 0x18 ^ 0x4A)) & 0x90) + 108;
  unsigned int v29 = *(_DWORD *)(v0[214]
                  + 4LL
                  * ((LOBYTE(STACK[0x668]) ^ LOBYTE(STACK[0x5B4]) ^ LOBYTE(STACK[0x73C]) ^ LOBYTE(STACK[0x740]) ^ LOBYTE(STACK[0x744])) ^ 0x29u)) ^ v24;
  unsigned int v30 = ((((v23 ^ 0x6DE5E0Fu) >> (v27 ^ 0x2E)) - 743686145 - ((2 * ((v23 ^ 0x6DE5E0Fu) >> (v27 ^ 0x2E))) & 0xA7587FFE)) ^ 0xD3AC3FFF) >> (v27 ^ 0x36);
  int v31 = *(_DWORD *)(v0[220] + 4LL * (HIBYTE(v29) ^ 0x10));
  unsigned int v32 = *(_DWORD *)(v0[216] + 4LL * (BYTE2(v23) ^ 0xDEu)) ^ *(_DWORD *)(v0[219] + 4LL * (BYTE1(v28) ^ 0x47u)) ^ *(_DWORD *)(v0[221] + 4LL * ((*(_BYTE *)(v0[214] + 4LL * ((LOBYTE(STACK[0x668]) ^ LOBYTE(STACK[0x5B4]) ^ LOBYTE(STACK[0x73C]) ^ LOBYTE(STACK[0x740]) ^ LOBYTE(STACK[0x744])) ^ 0x29u)) ^ v24) ^ 0x3Cu)) ^ *(_DWORD *)(v0[215] + 4LL * (HIBYTE(v26) ^ 0x5A));
  int v33 = *(_DWORD *)(v0[228] + 4LL * (BYTE2(v26) ^ 0x1Cu));
  unsigned int v34 = *(_DWORD *)(v0[218] + 4LL * ((v30 - ((2 * v30) & 0x36) - 101) ^ 0x9Bu)) ^ *(_DWORD *)(v0[217] + 4LL * (BYTE1(v29) ^ 0xD4u)) ^ *(_DWORD *)(v0[222] + 4LL * (BYTE2(v28) ^ 0x7Bu)) ^ *(_DWORD *)(v0[225] + 4LL * (v26 ^ 0x26u));
  HIDWORD(v35) = v31 ^ 0x1295;
  LODWORD(v35) = v31 ^ 0x97B80000;
  int v36 = (v35 >> 15) - ((2 * (v35 >> 15)) & 0x49F443C6) - 1527111197;
  unsigned int v37 = *(_DWORD *)(v0[224] + 4LL * (BYTE2(v29) ^ 0x86u)) ^ *(_DWORD *)(v0[223] + 4LL * (v23 ^ 0xFu)) ^ *(_DWORD *)(v0[227] + 4LL * (HIBYTE(v28) ^ 0x8C)) ^ *(_DWORD *)(v0[226] + 4LL * (BYTE1(v26) ^ 0xC6u));
  HIDWORD(v35) = v33 ^ 0x4619;
  LODWORD(v35) = v33 ^ 0xA0020000;
  int v38 = ((v35 >> 15) - ((2 * (v35 >> 15)) & 0x38FF0F86) - 1669363773) ^ v36;
  HIDWORD(v35) = v38 ^ 0x12B4D;
  LODWORD(v35) = v38 ^ 0xBDB60000;
  unsigned int v39 = *(_DWORD *)(v0[230] + 4LL * (v28 ^ 0xE4u)) ^ *(_DWORD *)(v0[229] + 4LL * (BYTE1(v23) ^ 0x5Eu)) ^ ((v35 >> 17) - ((2 * (v35 >> 17)) & 0xBBDC710) - 2048990328);
  int v40 = *(_DWORD *)(v0[236] + 4LL * (v37 ^ 0xFEu));
  int v41 = *(_DWORD *)(v0[239] + 4LL * (BYTE2(v39) ^ 0x6Du));
  int v42 = *(_DWORD *)(v0[240] + 4LL * (BYTE1(v32) ^ 0xF0u));
  unsigned int v43 = *(_DWORD *)(v0[232] + 4LL * (BYTE2(v34) ^ 0x42u)) ^ *(_DWORD *)(v0[231] + 4LL * (HIBYTE(v32) ^ 0xEF)) ^ *(_DWORD *)(v0[234] + 4LL * (BYTE1(v37) ^ 0xE9u)) ^ *(_DWORD *)(v0[237] + 4LL * (v39 ^ 0x66u));
  int v44 = *(_DWORD *)(v0[241] + 4LL * (BYTE2(v32) ^ 0x6Eu));
  unsigned int v45 = HIBYTE(v37) ^ 0x65;
  unsigned int v46 = *(_DWORD *)(v0[235] + 4LL * (BYTE2(v37) ^ 0xCBu)) ^ *(_DWORD *)(v0[233] + 4LL * (HIBYTE(v34) ^ 0xF2)) ^ *(_DWORD *)(v0[243] + 4LL * (v32 ^ 0x15u)) ^ *(_DWORD *)(v0[238] + 4LL * (BYTE1(v39) ^ 0xF2u));
  uint64_t v47 = v0[244];
  int v48 = *(_DWORD *)(v47 + 4LL * (HIBYTE(v39) ^ 0x9A));
  int v49 = *(_DWORD *)(v0[246] + 4LL * (HIBYTE(v43) ^ 0x77));
  unsigned int v50 = v42 ^ *(_DWORD *)(v0[242] + 4LL * (v34 ^ 0x23u)) ^ *(_DWORD *)(v47 + 4LL * v45) ^ v41;
  LODWORD(v47) = *(_DWORD *)(v0[247] + 4LL * (BYTE1(v50) ^ 0xE1u));
  int v51 = *(_DWORD *)(v0[249] + 4LL * (BYTE1(v43) ^ 0x1Cu));
  HIDWORD(v35) = v49 ^ 0x1295;
  LODWORD(v35) = v49 ^ 0x97B80000;
  unsigned int v52 = v44 ^ v40 ^ *(_DWORD *)(v0[245] + 4LL * (BYTE1(v34) ^ 0x14u)) ^ v48;
  int v53 = (v35 >> 19) - ((2 * (v35 >> 19)) & 0x3D6A3900) + 515185792;
  int v54 = *(_DWORD *)(v0[250] + 4LL * (BYTE2(v52) ^ 0xEBu));
  HIDWORD(v35) = v47 ^ 0x23045;
  LODWORD(v35) = v47 ^ 0xC1680000;
  int v55 = ((v35 >> 19) - ((2 * (v35 >> 19)) & 0xB3727BAA) + 1505312213) ^ v53;
  HIDWORD(v35) = v55 ^ 0xA1C;
  LODWORD(v35) = v55 ^ 0x89DFE000;
  uint64_t v56 = v0[252];
  int v57 = *(_DWORD *)(v56 + 4LL * (HIBYTE(v46) ^ 0x9E));
  int v58 = *(_DWORD *)(v56 + 4LL * (HIBYTE(v50) ^ 0xE0));
  int v59 = *(_DWORD *)(v0[253] + 4LL * (v43 ^ 0xABu));
  int v60 = *(_DWORD *)(v0[254] + 4LL * (BYTE2(v50) ^ 0xA6u));
  unsigned int v61 = *(_DWORD *)(v0[251] + 4LL * (v52 ^ 0xB4u)) ^ *(_DWORD *)(v0[248] + 4LL * (BYTE2(v46) ^ 0x9Fu)) ^ ((v35 >> 13) - ((2 * (v35 >> 13)) & 0x23F6F6E0) - 1845789840);
  LODWORD(v47) = ((v57 & 0xFFFFBFFF ^ 0x28E6AB6C)
                + (v57 & 0x795F8838 ^ 0x51190010)
                - ((v57 & 0xFFFFBFFF ^ 0x28E6AB6C) & 0x795F8838)) ^ 0x775359C9;
  int v62 = ((2 * v47) & 0x1CED5246) - v47 + 1904826076;
  int v63 = v57 & 0x4000;
  int v64 = v63 | 0x2F901D83;
  BOOL v65 = (v63 & ~v60) == 0;
  int v66 = 1595947782 - (v63 | 0x2F901D83);
  if (v65) {
    int v66 = v64;
  }
  unsigned int v67 = (v60 ^ 0xA0024619) - 797973891 + v66 - ((2 * ((v60 ^ 0xA0024619) - 797973891 + v66)) & 0xDB927D52) + 1841905321;
  int v68 = *(_DWORD *)(v0[256] + 4LL * (HIBYTE(v52) ^ 0x95));
  int v69 = *(_DWORD *)(v0[257] + 4LL * (BYTE2(v43) ^ 0x2Fu));
  unsigned int v70 = *(_DWORD *)(v0[255] + 4LL * (BYTE1(v52) ^ 0xDCu)) ^ v59 ^ v62 ^ v67;
  HIDWORD(v71) = v69 ^ 0x24619;
  LODWORD(v71) = v69 ^ 0xA0000000;
  int v72 = (v71 >> 23) - ((2 * (v71 >> 23)) & 0x1A3BDFF6) - 1927417861;
  HIDWORD(v71) = v68 ^ 0x381295;
  LODWORD(v71) = v68 ^ 0x97800000;
  unsigned int v73 = v51 ^ 0xF6D064C9 ^ v54 ^ v58;
  unsigned int v74 = *(_DWORD *)(v0[258] + 4LL * (v46 ^ 0xB1u)) ^ 0xED22DEF0;
  int v75 = (v74 & v73) - ((2 * (v74 & v73)) & 0x9795844);
  unsigned int v76 = v72 ^ ((v71 >> 23) - ((2 * (v71 >> 23)) & 0x840DE9B2) + 1107752153);
  unsigned int v77 = ((v74 + v73) ^ 0x4FBEF8E9)
      + ((2 * (v74 + v73)) & 0x9F7DF1D2)
      + ((2 * v75 - 1988536252) ^ 0xA33958C5)
      + ((2 * (2 * v75 - 1988536252)) & 0xAB7FFEFC ^ 0xFD8D4F77)
      + 1;
  unsigned int v78 = v77 - ((2 * v77 + 201461036) & 0x7C836464) + 1145223368;
  unsigned int v79 = *(_DWORD *)(v0[260] + 4LL * (BYTE1(v46) ^ 0xB2u)) ^ *(_DWORD *)(v0[259] + 4LL * (v50 ^ 0x76u)) ^ (v76 >> 9) ^ (((v76 << 23) ^ 0x91000000) - ((2 * ((v76 << 23) ^ 0x91000000)) & 0xBE000000) + 1600768577);
  int v80 = *(_DWORD *)(v0[262] + 4LL * (HIBYTE(v61) ^ 0x62)) ^ *(_DWORD *)(v0[261] + 4LL * (BYTE2(v70) ^ 0xFCu));
  int v81 = *(_DWORD *)(v0[263] + 4LL * (BYTE1(v78) ^ 0xE3u));
  unsigned int v82 = (v80 & 0x40000 | ((((v80 & 0x40000u) >> 18) & 1) << 19)) ^ 0x5FC77EFD;
  unsigned int v83 = ((v82 - 1606909693) & (v81 ^ 0xC1680000))
      - 298685701
      - ((2 * ((v82 - 1606909693) & (v81 ^ 0xC1680000))) & 0xDC600000);
  unsigned int v84 = (v80 & 0x6D119687 ^ 0x8108281) + (v80 & 0x92EA6978 ^ 0x90824161) - 1;
  unsigned int v85 = (v84 & 0xDFEF2CD1 ^ 0xD0EE2890) + (v84 ^ 0x2F119765) - ((v84 ^ 0x2F119765) & 0xDFEF2CD1);
  unsigned int v86 = v82 - 423766048;
  unsigned int v87 = -1504913958 - v82;
  if (v83 == -298685701) {
    unsigned int v87 = v86;
  }
  unsigned int v88 = (v81 ^ 0xC16A3045)
      - 1183143645
      + v87
      - ((2 * ((v81 ^ 0xC16A3045) - 1183143645 + v87)) & 0x3FB2EFFC)
      - 1613137922;
  uint64_t v89 = v0[70];
  uint64_t v90 = v0[66];
  unsigned int v91 = *(_DWORD *)(v0[265] + 4LL * (BYTE2(v78) ^ 0xB3u)) ^ *(_DWORD *)(v0[264] + 4LL * (BYTE1(v79) ^ 0x9Eu)) ^ *(_DWORD *)(v0[266] + 4LL * (HIBYTE(v70) ^ 0xE0)) ^ *(_DWORD *)(v0[267] + 4LL * (v61 ^ 0x4Fu));
  uint64_t v92 = v0[56];
  uint64_t v93 = v0[63];
  unsigned int v94 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v78) ^ 0x24)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v79) ^ 0xADu)) ^ *(_DWORD *)(v90 + 4LL * (BYTE1(v61) ^ 0x97u)) ^ *(_DWORD *)(v92 + 4LL * (v70 ^ 8u));
  unsigned int v95 = HIBYTE(v79) ^ 0x67;
  unsigned int v96 = v88 ^ v85 ^ *(_DWORD *)(v92 + 4LL * (v79 ^ 0x7Bu));
  int v97 = *(_DWORD *)(v90 + 4LL * (BYTE1(v70) ^ 0xE4u));
  int v98 = *(_DWORD *)(v89 + 4LL * (BYTE2(v61) ^ 0x5Eu)) ^ *(_DWORD *)(v92 + 4LL * (v78 ^ 0xBDu));
  int v99 = -688599110 - (v97 & 0x10000000 | 0x6B7A67DD);
  if ((v97 & 0x10000000 & v98) == 0) {
    int v99 = v97 & 0x10000000 | 0x6B7A67DD;
  }
  unsigned int v100 = ((v97 & 0xEFFFFFFF ^ 0x22D0521F) - ((2 * (v97 & 0xEFFFFFFF ^ 0x22D0521F)) & 0x99F4DE10) - 856002808) ^ *(_DWORD *)(v93 + 4LL * v95) ^ ((v98 ^ 0x4D2098E9) - 1803184093 + v99 - ((2 * ((v98 ^ 0x4D2098E9) - 1803184093 + v99)) & 0xFA22F388) + 2098297284);
  unsigned int v101 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v96) ^ 0x20)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v91) ^ 0x98u)) ^ *(_DWORD *)(v90 + 4LL * (BYTE1(v94) ^ 0xABu)) ^ *(_DWORD *)(v92 + 4LL * (v100 ^ 0x66u));
  unsigned int v102 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v91) ^ 0x77)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v94) ^ 0x6Au)) ^ *(_DWORD *)(v90 + 4LL * (BYTE1(v100) ^ 0x40u)) ^ *(_DWORD *)(v92 + 4LL * ~(_BYTE)v96);
  unsigned int v103 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v94) ^ 0xED)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v100) ^ 0x9Au)) ^ *(_DWORD *)(v92 + 4LL * (v91 ^ 0xD1u)) ^ *(_DWORD *)(v90 + 4LL * (BYTE1(v96) ^ 0xCFu));
  uint64_t v104 = v0[66];
  unsigned int v105 = *(_DWORD *)(v89 + 4LL * (BYTE2(v96) ^ 0xE1u)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v100) ^ 0x27)) ^ 0xF6D064C9 ^ *(_DWORD *)(v90 + 4LL * (BYTE1(v91) ^ 0xFAu));
  unsigned int v106 = *(_DWORD *)(v92 + 4LL * (v94 ^ 0x5Eu)) ^ 0xED22DEF0;
  int v107 = (v106 & v105) - ((2 * (v106 & v105)) & 0x6841FD4A);
  unsigned int v108 = ((2 * (v106 + v105)) & 0x6FFFF6DA)
       + ((v106 + v105) ^ 0x37FFFB6D)
       + ((2 * v107 - 398328502) ^ 0xEA42D943)
       + ((2 * (2 * v107 - 398328502)) & 0xFBF9B7EC ^ 0x2F7E4D7B);
  unsigned int v109 = v108 - ((2 * v108 - 1946566378) & 0xB5E16F38) - 1595041753;
  int v110 = *(_DWORD *)(v90 + 4LL * (BYTE1(v103) ^ 0xCAu)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v102) ^ 0x1Bu)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v101) ^ 0xAB));
  int v111 = ((v110 & 0xC00044 ^ 0x208E6155) + (v110 & 0x1B11122A ^ 0x1011009) - 2) ^ 0x524E6154;
  unsigned int v112 = (((2 * v111) & 0xA4020194) - v111 - 1445693643) ^ 0xC8C56775 | ((v110 & 0x640E2401 ^ 0x11073022)
                                                                       + (v110 & 0x8020C990 ^ 0x20C001)
                                                                       - 1) ^ 0xF52794A3;
  unsigned int v113 = v112 - ((2 * v112) & 0xF2E6F488) - 109872572;
  unsigned int v114 = *(_DWORD *)(v90 + 4LL * (BYTE1(v109) ^ 0xE1u)) ^ *(_DWORD *)(v92 + 4LL * (v101 ^ 0x48u)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v103) ^ 0x83u)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v102) ^ 0xC7));
  unsigned int v115 = HIBYTE(v103) ^ 0x31;
  unsigned int v116 = *(_DWORD *)(v90 + 4LL * (BYTE1(v102) ^ 0xDBu)) ^ *(_DWORD *)(v89 + 4LL * (BYTE2(v101) ^ 0x71u)) ^ *(_DWORD *)(v92 + 4LL * (v103 ^ 0xC7u)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v109) ^ 0x12));
  unsigned int v117 = *(_DWORD *)(v89 + 4LL * (BYTE2(v109) ^ 0xF2u)) ^ *(_DWORD *)(v93 + 4LL * v115) ^ *(_DWORD *)(v92 + 4LL * (v102 ^ 0xA0u)) ^ *(_DWORD *)(v90 + 4LL * (BYTE1(v101) ^ 0x9Bu));
  char v118 = (STACK[0x664] & 0x10) + (STACK[0x664] & 0x18 ^ 0xF7) + (STACK[0x664] & 0x10 | 0x2E) + 1;
  unsigned int v119 = ((((v116 ^ 0xFD102CE4) >> (v118 ^ 0x36))
         - 489054638
         - ((2 * ((v116 ^ 0xFD102CE4) >> (v118 ^ 0x36))) & 0xC5B33CA4)) ^ 0xE2D99E52) >> (v118 ^ 0x2E);
  int v259 = *(_DWORD *)(v92 + 4LL * (v109 ^ 7u));
  unsigned __int8 v120 = BYTE2(v113) ^ BYTE2(v259);
  unsigned int v121 = ((unsigned __int16)(v113 ^ v259) >> 8) ^ 0x75;
  int v256 = *(_DWORD *)(v89 + 4LL * (BYTE2(v117) ^ 0x12u));
  int v257 = *(_DWORD *)(v90 + 4LL * (BYTE1(v116) ^ 0x2Cu)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v114) ^ 0x1F));
  unsigned int v264 = v257 ^ v256 ^ *(_DWORD *)(v92 + 4LL * ((v113 ^ v259) ^ 0x95u));
  int v122 = *(_DWORD *)(v90 + 4LL * (BYTE1(v117) ^ 0x7Au));
  int v123 = *(_DWORD *)(v93 + 4LL * (((v113 ^ v259) >> 24) ^ 0xCC));
  int v124 = *(_DWORD *)(v89 + 4LL * (BYTE2(v114) ^ 0x63u));
  int v125 = *(_DWORD *)(v92 + 4LL * (v116 ^ 0xE4u));
  unsigned int v262 = v123 ^ v122 ^ v124 ^ v125;
  int v254 = *(_DWORD *)(v89 + 4LL * (BYTE2(v116) ^ 0x10u));
  int v126 = *(_DWORD *)(v90 + 4LL * v121);
  int v127 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v117) ^ 0x35));
  int v128 = *(_DWORD *)(v90 + 4LL * (BYTE1(v114) ^ 0xAu));
  int v129 = *(_DWORD *)(v92 + 4LL * (v114 ^ 0x81u));
  int v130 = *(_DWORD *)(v93 + 4LL * ((v119 - ((2 * v119) & 0xD6) - 21) ^ 0xEBu));
  int v131 = *(_DWORD *)(v92 + 4LL * (v117 ^ 0x7Fu));
  int v132 = v126 ^ v254 ^ v127 ^ v129;
  int v133 = v130 ^ v128 ^ *(_DWORD *)(v89 + 4LL * (v120 ^ 0x29u)) ^ v131;
  int v134 = *(_DWORD *)(v89 + 4LL * (BYTE2(v264) ^ 0x41u)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v262) ^ 0x34)) ^ 0x37BA548C;
  uint64_t v252 = v104;
  unsigned int v135 = *(_DWORD *)(v104 + 4LL * (BYTE1(v132) ^ 0xF3u)) ^ 0xC16A3045;
  unsigned int v136 = (v134 & v135) + 1399221330 + (~(2 * (v134 & v135)) | 0xD933275D);
  unsigned int v137 = ((v134 + v135) ^ 0xFCFBEADC)
       + ((2 * (v134 + v135)) & 0xF9F7D5B8)
       + ((2 * v136) ^ 0xF2CFF4A3)
       + ((4 * v136) & 0x57F9A7FC ^ 0xBA665EBB)
       + 1;
  int v138 = v137 - ((2 * v137 + 503435846) & 0x34DB45F6) + 1231981598;
  int v139 = *(_DWORD *)(v92 + 4LL * (v133 ^ 0x6Eu));
  unsigned int v140 = (v138 ^ ((v138 ^ 0x65925D04) - ((2 * (v138 ^ 0x65925D04) + 2) & 0xC72C67B0) + 1670788057) ^ ((v139 ^ 0xED22DEF0) + (v139 ^ 0x88B083F4 ^ v138) + 1 - ((2 * ((v139 ^ 0xED22DEF0) + (v139 ^ 0x88B083F4 ^ v138) + 1)) & 0x6C7B5D4C) + 910012070) ^ 0xCFC63F85)
       + (v139 ^ 0xED22DEF0);
  unsigned int v253 = v140 - ((2 * v140) & 0xAFFC0402) - 671219199;
  unsigned int v141 = v110 ^ v259;
  unsigned int v142 = HIBYTE(v116) ^ 0xFD;
  unsigned int v143 = *(_DWORD *)(v92 + 4LL * (v141 ^ 0x18u)) ^ v256 ^ v257;
  int v144 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v141) ^ 0xC3)) ^ v122 ^ v124 ^ v125;
  unsigned int v250 = v132;
  unsigned int v145 = v127 ^ *(_DWORD *)(v104 + 4LL * (BYTE1(v141) ^ 0x6Bu)) ^ v129 ^ v254;
  unsigned int v146 = *(_DWORD *)(v89 + 4LL * (BYTE2(v141) ^ 0x8Au)) ^ v131 ^ v128 ^ *(_DWORD *)(v93 + 4LL * v142);
  unsigned int v147 = ((((v144 ^ 0x34D0834Du) >> (((((BYTE1(v132) | 0xE7) + 58) ^ 0x1E) - 1) ^ 0x2E))
         + 451123070
         - ((2 * ((v144 ^ 0x34D0834Du) >> (((((BYTE1(v132) | 0xE7) + 58) ^ 0x1E) - 1) ^ 0x2E))) & 0x35C72EFC)) ^ 0x1AE3977E) >> (((((BYTE1(v132) | 0xE7) + 58) ^ 0x1E) - 1) ^ 0x36);
  LOWORD(v256) = v143;
  unsigned int v260 = BYTE2(v143) ^ 0x41;
  LODWORD(v104) = BYTE2(v132) ^ 0xA1;
  unsigned int v258 = v262 ^ 0x4D;
  unsigned int v148 = v133;
  unsigned int v149 = BYTE2(v133) ^ 0x43;
  int v251 = *(_DWORD *)(v89 + 4LL * (BYTE2(v145) ^ 0xA1u)) ^ *(_DWORD *)(v93 + 4LL * (HIBYTE(v143) ^ 0x30));
  unsigned int v150 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v145) ^ 0x1E)) ^ 0x97B81295;
  unsigned int v151 = *(_DWORD *)(v89 + 4LL * (BYTE2(v146) ^ 0x43u)) ^ 0xA0024619;
  unsigned int v152 = BYTE1(v133) ^ 0x65;
  unsigned int v153 = BYTE1(v146) ^ 0x65;
  int v154 = 2 * ((v150 & v151) - ((2 * (v150 & v151)) & 0x15595CA6)) - 1789305690;
  int v155 = v154 ^ 0x11595825;
  unsigned int v156 = (2 * v154) & 0xF7FFF6F8 ^ 0xDD4D4FB7;
  unsigned int v157 = BYTE1(v262) ^ 0x83;
  unsigned int v158 = BYTE1(v144) ^ 0x83;
  int v255 = *(_DWORD *)(v89 + 4LL * v104);
  int v263 = *(_DWORD *)(v89 + 4LL * (BYTE2(v262) ^ 0xD0u));
  int v249 = *(_DWORD *)(v89 + 4LL * v149);
  int v159 = *(_DWORD *)(v89 + 4LL * v260);
  int v160 = *(_DWORD *)(v89 + 4LL * (BYTE2(v144) ^ 0xD0u));
  int v261 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v148) ^ 0xF8));
  int v161 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v264) ^ 0x30));
  int v162 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v250) ^ 0x1E));
  int v163 = *(_DWORD *)(v93 + 4LL * ((v147 - ((2 * v147) & 0xDA) - 19) ^ 0xEDu));
  int v164 = *(_DWORD *)(v93 + 4LL * (HIBYTE(v146) ^ 0xF8));
  int v165 = *(_DWORD *)(v252 + 4LL * (BYTE1(v145) ^ 0xF3u)) ^ v159 ^ *(_DWORD *)(v92 + 4LL
                                                                                  * (v146 ^ 0x6Eu)) ^ v163;
  unsigned int v166 = ((v150 + v151) ^ 0xFDFF7FBF) + ((2 * (v150 + v151)) & 0xFBFEFF7E) + v155 + v156 + 1;
  unsigned int v167 = v166 - ((2 * v166 - 67045508) & 0xDFDF1AA8) - 303036142;
  unsigned int v168 = (v253 ^ 0xFDB46D9C) + 804848677;
  int v169 = *(_DWORD *)(v92 + 4LL * (v144 ^ 0x4Du));
  int v170 = v168 ^ 0x6D6A7DF7;
  unsigned int v171 = (2 * v168) & 0xDAD4FBEE;
  int v172 = v251 ^ v169 ^ *(_DWORD *)(v252 + 4LL * v153);
  int v174 = ((2 * v173) & 0x375759B2) + (v173 ^ 0x1BABACD9);
  unsigned int v175 = v171
       + v170
       + (v165 ^ 0xCE472A5B)
       - ((2 * (v171 + v170 + (v165 ^ 0xCE472A5B)) + 623576084) & 0x75EE0DA8)
       + 1301055710;
  int v176 = (*(_DWORD *)(v252 + 4LL * v152) ^ v255 ^ 0x1A0B5C68 ^ *(_DWORD *)(v92 + 4LL * v258) ^ v161) - 493681713;
  int v177 = v164 ^ v160 ^ *(_DWORD *)(v252 + 4LL * (BYTE1(v256) ^ 0x33u)) ^ *(_DWORD *)(v92
                                                                                   + 4LL
                                                                                   * (v145 ^ 0xB3u));
  unsigned int v178 = ((2 * v176) & 0xF4F5DFDC) + (v176 ^ 0x7A7AEFEE) + (v172 ^ 0xE5F4A397);
  unsigned int v179 = (v263 ^ *(_DWORD *)(v252 + 4LL * (BYTE1(v264) ^ 0x33u)) ^ *(_DWORD *)(v92
  int v180 = *(_DWORD *)(v252 + 4LL * v158) ^ *(_DWORD *)(v92 + 4LL * (v256 ^ 0xF5u)) ^ v167;
  unsigned int v181 = (v178 - ((2 * v178 + 185212966) & 0xC7FFD254) + 1770322237) ^ 0x612E3214;
  int v182 = ((991886601 * v181) ^ 0x3FFBFE7F) + ((1983773202 * v181) & 0x7FF7FCFE);
  unsigned int v183 = ((2 * v177) & 0xDFEEDFFE ^ 0xD9C2956A) + (v177 ^ 0x131EA54A);
  unsigned int v184 = -1583751953 * (v175 ^ 0xED880A7) - ((1127463390 * (v175 ^ 0xED880A7)) & 0x9DD213D2) - 823588375;
  unsigned int v185 = ((2 * v179) & 0xFFE7DFF8) + (v179 ^ 0x7FF3EFFC) - v183;
  unsigned int v186 = v174
       + (v180 ^ 0xB8F233C5)
       - 2 * ((v174 + (v180 ^ 0xB8F233C5) + 72635176) & 0x1FF3383F ^ (v174 + (v180 ^ 0xB8F233C5)) & 6)
       - 2075686047;
  unsigned int v187 = (v184 & 0x8000 ^ 0xD4FBF7FD) + 2 * (v184 & 0x8000);
  unsigned int v188 = (v185 - ((2 * v185 + 1611071494) & 0x608F0578) + 541786815) ^ 0xCCC5BE8A;
  int v189 = -1622682715 * v188 - 1923608933 - ((512730954 * v188) & 0x1AB01D36);
  unsigned int v190 = ((2 * (v184 & 0xFFFF7FFF ^ 0xC4FF167D)) & 0x2392B514) - (v184 & 0xFFFF7FFF ^ 0xC4FF167D) + 1849042293;
  int v191 = v182 - 1073479295;
  int v192 = (v191 & (v187 + 721684483)) - 2094079993 - ((2 * (v191 & (v187 + 721684483))) & 0x65D0000);
  unsigned int v193 = v187 + 1810888920;
  int v194 = -858426793 * (v186 ^ 0x73BD3E1E) - ((430630062 * (v186 ^ 0x73BD3E1E)) & 0x4E450F08) - 1490909308;
  unsigned int v195 = 367519954 - v187;
  if (v192 == -2094079993) {
    unsigned int v195 = v193;
  }
  int v196 = (v195 + v182 - ((2 * (v195 + v182) + 506470744) & 0x177003AE) + 181408387) ^ v190;
  unsigned int v197 = ((2 * v196) & 0x94CF46AC ^ 0x9400462C) + (v196 ^ 0x25FF9860);
  unsigned int v198 = ((2 * (v191 + (v194 ^ 0x58DD787B) + 1)) & 0xBAB2FFF6) + ((v191 + (v194 ^ 0x58DD787B) + 1) ^ 0xDD597FFB);
  unsigned int v199 = v198
       + 650108670
       + ((v197 + 899177642 + (v194 ^ v189 ^ 0x2A7A891F)) ^ 0xFEF7F64F)
       + ((2 * (v197 + 899177642 + (v194 ^ v189 ^ 0x2A7A891F))) & 0xFDEFEC9E)
       + 838467516;
  int v200 = 2 * v199 - 1779870216;
  unsigned int v201 = v198
       + 650108670
       + ((v197 + 899177642 + (v189 ^ 0x8D580E9B)) ^ 0x33202301)
       - ((2 * (v197 + 899177642 + (v189 ^ 0x8D580E9B))) & 0x99BFB9FC)
       + v199
       + (v200 ^ 0x8C1C50C1)
       + 1;
  unsigned int v202 = v201
       - ((2 * v200) & 0xE7C75E7C)
       - 2 * ((v201 - ((2 * v200) & 0xE7C75E7C) + 127850560) & 0x56CCA8C7 ^ v201 & 1)
       + 1584103686;
  int v203 = v202 ^ (-761973469 - v197 - ((349128364 - 2 * v197) & 0x105B239A));
  unsigned int v204 = ((2 * ((v165 ^ 0x31B8D5A4) + 2018070100)) & 0x7FCFF3F8)
       + (((v165 ^ 0x31B8D5A4) + 2018070100) ^ 0xBFE7F9FC)
       - v199;
  unsigned int v205 = v204 + 139913993 + (~(2 * v204 + 709277200) | 0xD998DFFF);
  int v206 = v198 + 581337093 + (v203 ^ 0x5EE1390B);
  unsigned int v207 = ((2 * ((v172 ^ 0x1A0B5C68) + (v202 ^ 0xA9335739) + 1)) & 0xFFF7FCFE)
       + (((v172 ^ 0x1A0B5C68) + (v202 ^ 0xA9335739) + 1) ^ 0x7FFBFE7F);
  unsigned int v208 = ((2 * ((v180 ^ 0x470DCC3A) + (v203 ^ 0xA11EC6F4) + 1)) & 0xFB3E4BBE)
       + (((v180 ^ 0x470DCC3A) + (v203 ^ 0xA11EC6F4) + 1) ^ 0x7D9F25DF);
  unsigned int v209 = v207 - ((2 * v207 - 1517209098) & 0xF7EBB592) - 826378300;
  unsigned int v210 = v208 - ((2 * v208 + 765211568) & 0xA9813102) + 1804513881;
  unsigned int v211 = v183 + (v206 ^ 0x80041A02) - ((2 * v206) & 0xFFF7CBFA) + 1;
  unsigned int v212 = v211 - ((2 * v211 + 29803196) & 0x1C2656A) - 557542381;
  uint64_t v213 = v0[53];
  int v214 = *(_DWORD *)(v213 + 4LL * (HIBYTE(v205) ^ 0x93));
  unsigned int v215 = HIBYTE(v212);
  unsigned int v216 = BYTE1(v210) ^ 0x98;
  LOBYTE(v207) = (((2 * v265[0]) & 0xC) - v265[0] + 1) & 8;
  unsigned int v217 = ((((v212 ^ 0xE132B5) >> (v207 ^ 8)) + 1617602554 - ((2 * ((v212 ^ 0xE132B5) >> (v207 ^ 8))) & 0xC0D54FF4)) ^ 0x606AA7FA) >> v207;
  char v218 = v217 - ((2 * v217) & 0xA8);
  unsigned int v219 = BYTE2(v212) ^ 0xE1;
  uint64_t v220 = v0[72];
  int v221 = *(_DWORD *)(v220 + 4LL * (v212 ^ 0xB5u));
  unsigned int v222 = BYTE1(v205) ^ 0x90;
  int v223 = *(_DWORD *)(v220 + 4LL * (v210 ^ 0x81u));
  int v224 = *(_DWORD *)(v220 + 4LL * v205);
  int v225 = *(_DWORD *)(v220 + 4LL * (v209 ^ 0xC9u));
  int v226 = *(_DWORD *)(v213 + 4LL * (HIBYTE(v209) ^ 0x7B));
  int v227 = *(_DWORD *)(v213 + 4LL * (HIBYTE(v210) ^ 0x54));
  LODWORD(v220) = *(_DWORD *)(v213 + 4LL * v215);
  uint64_t v228 = v0[68];
  int v229 = *(_DWORD *)(v228 + 4LL * (BYTE2(v209) ^ 0xF5u));
  LOBYTE(v215) = v218 - 44;
  int v230 = *(_DWORD *)(v228 + 4LL * v219);
  int v231 = *(_DWORD *)(v228 + 4LL * (BYTE2(v210) ^ 0xC0u));
  int v232 = *(_DWORD *)(v228 + 4LL * (BYTE2(v205) ^ 0x33u));
  uint64_t v233 = v0[60];
  int v234 = *(_DWORD *)(v233 + 4LL * v222) ^ v230 ^ v227;
  HIDWORD(v235) = v225 ^ 0xFFFFFFF3;
  LODWORD(v235) = v225 ^ 0xF6B599C0;
  int v236 = (v235 >> 6) - ((2 * (v235 >> 6)) & 0xAF458926) - 677198701;
  HIDWORD(v235) = v234 ^ 0x3C;
  LODWORD(v235) = v234 ^ 0x29EA3AC0;
  int v237 = v236 ^ ((v235 >> 6) - ((2 * (v235 >> 6)) & 0x54FE116A) + 712968373);
  HIDWORD(v235) = v237 ^ 0x27B0CA;
  LODWORD(v235) = v237 ^ 0xC0000000;
  unsigned int v238 = LODWORD(STACK[0x284]) ^ LODWORD(STACK[0x254]) ^ LODWORD(STACK[0x2B8]) ^ ((v235 >> 26)
                                                                                - ((2 * (v235 >> 26)) & 0x7D965CB8)
                                                                                - 1093980580);
  int v239 = v229 ^ v214 ^ *(_DWORD *)(v233 + 4LL * v216) ^ v221 ^ LODWORD(STACK[0x254]) ^ LODWORD(STACK[0x284]) ^ LODWORD(STACK[0x2B8]);
  unsigned int v240 = v226 ^ v231 ^ v224 ^ LODWORD(STACK[0x254]) ^ LODWORD(STACK[0x284]) ^ LODWORD(STACK[0x2B8]) ^ *(_DWORD *)(v233 + 4LL * (v215 ^ 0xD4u));
  int v241 = v220 ^ v232 ^ v223 ^ *(_DWORD *)(v233 + 4LL * (BYTE1(v209) ^ 0xDAu)) ^ LODWORD(STACK[0x254]) ^ LODWORD(STACK[0x284]) ^ LODWORD(STACK[0x2B8]);
  LODWORD(STACK[0x374]) = v238;
  LODWORD(STACK[0x4A8]) = v238 >> 8;
  LODWORD(STACK[0x378]) = v239;
  LODWORD(STACK[0x37C]) = v240;
  LODWORD(STACK[0x380]) = v241;
  char v242 = byte_188744690[BYTE1(v239) ^ 0x5ALL];
  LODWORD(STACK[0x4DC]) = HIBYTE(v240);
  LODWORD(STACK[0x53C]) = v240 >> 8;
  char v243 = v242 ^ 0xE3;
  if (v241 == 470142744) {
    char v243 = 16;
  }
  char v244 = ((v243 & (v242 ^ 0xF)) - 2 * (v243 & (v242 ^ 0xF) & 3) - 125) >> 2;
  char v245 = (v242 ^ 0x76 ^ v244) + 1;
  char v246 = v242 ^ 0xA9;
  char v247 = v246 + (v245 ^ 0xF9) + ((2 * v245) & 0xF3) + 7;
  char v248 = (v244 ^ ((v244 ^ 0xDF) - ((2 * (v244 ^ 0xDF) + 2) & 0xE7) + 116) ^ 0xDD ^ (v247 - ((2 * v247) & 0x1C) - 114))
       + v246;
  LOBYTE(STACK[0x3EA]) = (v248 ^ 0x72) + ((2 * v248) & 0xE4) - 114;
  v0[88] = v0[153];
  JUMPOUT(0x1886E20F0LL);
}

uint64_t ZshgJnRaSlwn(uint64_t a1)
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(443 * (a1 != 0)) ^ 0x2BAu] - 12LL))();
}

void vsPHbdGf()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  uint64_t v0 = qword_18C723CA0 - (void)&v1 + qword_18C723C90;
  qword_18C723CA0 = 1435369301 * v0 - 0x24F7A4F210016D8BLL;
  qword_18C723C90 = 1435369301 * (v0 ^ 0x3FCCDB3BD4E106A1LL);
  __asm { BR              X8 }

uint64_t sub_1886ED2D0()
{
  unint64_t v2 = ((unint64_t)&STACK[0x3B0] ^ 0x6FB3FF65FDABF8B5LL)
     - 0x6FB3FF65FDABF8B5LL
     + ((2LL * (void)&STACK[0x3B0]) & 0xDF67FECBFB57F168LL);
  STACK[0x218] = ((v2 % 0x25) ^ 0x47FF7DFAD3BFFFFBLL)
               - 0x47FF7DFAD3BFFFEBLL
               + ((2 * (v2 % 0x25)) & 0x76LL);
  STACK[0x200] = (unint64_t)&STACK[0x19B0];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0
                                                                       + 8LL
                                                                       * ((21 * (((v1 + 54) ^ 0xCB) & 1)) ^ 0x3CA)))( 1074171621LL,  2746141291LL,  1677708453LL,  1677708965LL);
}

uint64_t sub_1886ED418(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x220]) = a4;
  *(void *)(v6 + 368) = 0x4551A715DC5917CALL;
  LODWORD(STACK[0x3B0]) = *(_DWORD *)(v7 + 3208) - 1823406259;
  uint64_t v11 = *(unsigned int *)(v8 + 3160);
  v9[12] = *(void *)(v5 + 8LL * (v4 + 1771230046));
  LODWORD(STACK[0x578]) = v4 + 1621942387;
  LODWORD(STACK[0x588]) = 0;
  v9[14] = v11;
  LODWORD(STACK[0x58C]) = (v4 + 1621942387) & 0xF79F7D90;
  LODWORD(STACK[0x590]) = v4 + 1621942417;
  v9[17] = a1;
  *(void *)(v6 + 448) = &STACK[0x570];
  *(_DWORD *)(v10 - 192) = 1431737413 * ((((2 * (v10 - 200)) | 0xE8EB0088) - (v10 - 200) - 1953857604) ^ 0xCA2B1F56)
                         + 40706419
                         + v4;
  sub_1886DF534(v10 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v10 - 188)])();
}

uint64_t sub_1886ED504()
{
  int v1 = v0 - 1771229163;
  STACK[0x240] = (unint64_t)malloc(STACK[0x218]);
  uint32_t v2 = arc4random();
  unsigned int v3 = v2 - 1595106619 - ((v2 << (v1 ^ 0xC8)) & 0x41D9358A);
  LODWORD(xmmword_18C723288) = v3;
  unsigned int v4 = v3 ^ 0xA0EC9AC7 ^ (v3 >> 30);
  unsigned int v5 = (v4 * (((4 * v1) ^ 0x970) + 1812432657)) ^ 0xFEFD779D;
  DWORD1(xmmword_18C723288) = v5
                            + ((-670100790 * v4) & 0xFDFAEF3A)
                            - 1578163415
                            - ((2 * (v5 + ((-670100790 * v4) & 0xFDFAEF3A)) + 33886408) & 0x41D9358A);
  return ((uint64_t (*)(uint64_t))(qword_18A26FDB0[v1 ^ 0x1CD] - 8LL))(1563213102LL);
}

void sub_1886ED640()
{
}

uint64_t sub_1886ED65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v7 = (v5 - 1771229603) | 0x84;
  int8x16_t v8 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  v9.i64[0] = 0x8000000080000000LL;
  v9.i64[1] = 0x8000000080000000LL;
  int8x16_t v10 = (int8x16_t)vdupq_n_s32(0x7E3D3798u);
  v11.i64[0] = 0x100000001LL;
  v11.i64[1] = 0x100000001LL;
  v6.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v6.i32[2] = HIDWORD(xmmword_18C723288);
  int8x16_t v12 = vextq_s8(v8, v6, 0xCuLL);
  int8x16_t v13 = v6;
  v13.i32[3] = unk_18C723298;
  int8x16_t v14 = (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8(vandq_s8(v12, v9), (int8x16_t)vdupq_n_s32(0xC2C14240)),  vdupq_n_s32(0x61074669u));
  int32x4_t v15 = (int32x4_t)veorq_s8(vandq_s8(v13, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x290DFE50u));
  int8x16_t v16 = (int8x16_t)vsubq_s32( vaddq_s32(v15, (int32x4_t)veorq_s8(vandq_s8(v13, v10), (int8x16_t)vdupq_n_s32(0xD6300188))),  (int32x4_t)vandq_s8((int8x16_t)v15, v10));
  int32x4_t v17 = (int32x4_t)veorq_s8( vorrq_s8( (int8x16_t)vaddq_s32( vaddq_s32( (int32x4_t)veorq_s8( vandq_s8(v16, (int8x16_t)vdupq_n_s32(0xD39708D2)),  (int8x16_t)vdupq_n_s32(0x80030843)),  (int32x4_t)veorq_s8( vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x2C68F72Cu)),  (int8x16_t)vdupq_n_s32(0x24085309u))),  v11),  veorq_s8(v14, (int8x16_t)vdupq_n_s32(0xA3C888A9))),  (int8x16_t)vdupq_n_s32(0x53D70846u));
  v18.i32[0] = *((_DWORD *)&STACK[0x2378] + ((BYTE4(xmmword_18C723288) & 1) == 0));
  v18.i32[1] = *((_DWORD *)&STACK[0x2378] + ((BYTE8(xmmword_18C723288) & 1) == 0));
  v18.i32[2] = *((_DWORD *)&STACK[0x2378] + (HIDWORD(xmmword_18C723288) & (v7 - 404) ^ 1LL));
  v18.i32[3] = *((_DWORD *)&STACK[0x2378] + (~unk_18C723298 & 1LL));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v18),  (int8x16_t)vdupq_n_s32(0xED63EDE3)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v17,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v17, v17),  (int8x16_t)vdupq_n_s32(0xC4EBE8A6))),  vdupq_n_s32(0x6275F453u)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a5 + 8LL * v7) - 4LL))();
}

uint64_t sub_1886EE1F0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, int a3@<W8>)
{
  int8x16_t v8 = (_DWORD *)(a2 + 4 * (v4 + v6));
  unsigned int v9 = (*v8 & 0x7FFFFFFE ^ 0x290DFE50) + (*v8 & v5 ^ 0xD6300188) - ((*v8 & 0x7FFFFFFE ^ 0x290DFE50) & v5);
  unsigned int v10 = (((v9 & 0xD39708D2 ^ 0x80030843) + (v9 & 0x2C68F72C ^ 0x24085309) - 2) | ((v3 & 0x80000000 ^ 0xC2C14240)
                                                                                + 1627866729) ^ 0xA3C888A9) ^ 0x53D70846;
  *(_DWORD *)(a2 + 4 * ((a3 ^ 0x5B6u ^ (unint64_t)(v6 + 980)) + v4)) = v8[396] ^ *((_DWORD *)&STACK[0x2378]
                                                                                        + ((*v8 & 1) == 0)) ^ ((v10 - ((2 * v10) & 0xC4EBE8A6) + 1651897427) >> 1) ^ 0xED63EDE3;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((1400 * (v4 + 1 == v7 + 3)) ^ a3)) - 4LL))();
}

uint64_t sub_1886EE320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9 = v7 - 8;
  unsigned int v10 = (const float *)&dword_18C723614;
  int8x16_t v11 = (int8x16_t)vld1q_dup_f32(v10);
  uint64_t v12 = (v9 - 127570996) & 0x79A90F7;
  v13.i64[0] = 0x8000000080000000LL;
  v13.i64[1] = 0x8000000080000000LL;
  v14.i64[0] = -1LL;
  v14.i64[1] = -1LL;
  v8.i64[0] = *(void *)&dword_18C723618;
  v8.i32[2] = *(_DWORD *)(a6 + 4 * (v12 - 1));
  int8x16_t v15 = vextq_s8(v11, v8, 0xCuLL);
  int8x16_t v16 = v8;
  v16.i32[3] = dword_18C723624;
  int8x16_t v17 = (int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v15, v13), vdupq_n_s32(0xC7339E3E));
  int32x4_t v18 = (int32x4_t)veorq_s8(vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x7EF7519Au));
  int32x4_t v19 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v18, v18),  (int8x16_t)vdupq_n_s32(0x9289E0u)),  v18),  vdupq_n_s32(0x7FB6BB0Eu)),  (int8x16_t)vdupq_n_s32(0xE679FCC7)),  v14),  (int8x16_t)vdupq_n_s32(0xC7D48C96));
  v20.i32[0] = *(_DWORD *)(v6 + 4LL * ((dword_18C723618 & 1) == 0));
  v20.i32[1] = *(_DWORD *)(v6 + 4 * (~dword_18C72361C & 1LL));
  v20.i32[2] = *(_DWORD *)(v6 + 4 * (~*(_DWORD *)(a6 + 4 * (v12 - 1)) & 1LL));
  v20.i32[3] = *(_DWORD *)(v6 + 4 * (~dword_18C723624 & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v20),  (int8x16_t)vdupq_n_s32(0x8E400C38)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8( (int8x16_t)v19,  vandq_s8(v17, v13)),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v19, v19),  (int8x16_t)vdupq_n_s32(0x48646FCAu))),  vdupq_n_s32(0xA43237E5)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a5 + 8LL * (v9 ^ 8)) - 8LL))();
}

void sub_1886EE4A8()
{
}

uint64_t sub_1886EE4B4@<X0>(uint64_t a1@<X4>, _DWORD *a2@<X5>, unsigned int a3@<W8>)
{
  int v4 = ((*a2 & 0x7FFFFFFE ^ 0x289CD8E5) + (*a2 & 0x83AE73C ^ 0x222718) - ((*a2 & 0x7FFFFFFE ^ 0x289CD8E5) & 0x83AE73D)) ^ 0x4AA51C;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x2378] + ((*a2 & 1) == 0)) ^ (((v4 | (((v3 + a3 + 1610776505) & 0x9FFD7F5F ^ 0x1BCF56BB)
                                                                              + (a2[623] & 0x80000000 ^ 0xEE000060)) ^ 0xFBA27C50)
                                                                       - ((2 * v4) & 0xE2FF955C)
                                                                       + 1904200366) >> 1) ^ 0xE4E6F29D;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (((32 * (LODWORD(STACK[0x3B0]) > 0x26F)) | ((LODWORD(STACK[0x3B0]) > 0x26F) << 9)) ^ a3))
                            - 4LL))();
}

uint64_t sub_1886EE5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  LODWORD(STACK[0x3B0]) = 0;
  int v12 = LODWORD(STACK[0x3B0])++;
  *(_DWORD *)(v7 + 3208) = v12 + 1823406260;
  uint64_t v13 = (*(_DWORD *)(v8 + 3160) - 864582338);
  v9[12] = *(void *)(a5 + 8 * ((v5 - 1870663943) ^ 0x26ED1CE7LL));
  v9[14] = 209589283LL;
  LODWORD(STACK[0x578]) = 1;
  LODWORD(STACK[0x588]) = (v5 - 1870663943) | 0x1A;
  LODWORD(STACK[0x58C]) = v5 - 1870663943;
  LODWORD(STACK[0x590]) = v5 - 1870663960;
  v9[17] = v13;
  *(_DWORD *)(v11 - 192) = 1431737413 * ((~((v11 - 200) | v10) + ((v11 - 200) & v10)) ^ 0xABDBE83E) + 40706419 + v5;
  *(void *)(v6 + 448) = &STACK[0x570];
  sub_1886DF534(v11 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v11 - 188)])();
}

uint64_t sub_1886EE6AC()
{
  int v5 = STACK[0x220];
  if (v2 >= v3) {
    int v6 = *(_DWORD *)(v4 + 3160) + 1;
  }
  else {
    int v6 = 1074171621;
  }
  *(_DWORD *)(v4 + 3160) = v6;
  int v7 = v1 ^ (v1 >> 11);
  unsigned int v8 = (((v7 << 7) ^ 0x7C43AB00) - ((2 * ((v7 << 7) ^ 0x7C43AB00)) & 0xC74B9200) + 1671809365) & 0x9D2C5680 ^ 0x88205400;
  int v9 = (((2 * v8) & 0x12488800) - v8 - 694447207) ^ 0x5F9F17B9;
  int v10 = (((2 * v9) | 0x368F9E14) - v9 + 1689792758) ^ v7;
  unsigned int v11 = (((v10 << 15) ^ 0xEC3E0000) - ((2 * ((v10 << 15) ^ 0xEC3E0000)) & 0xBF650000) - 541943714) & 0xEFC60000 ^ 0xCECB41A2;
  unsigned int v12 = (2118446611 - (v11 | 0x7E44EE13) + (v11 | 0x81BB11EC)) ^ v10;
  byte_18C72450C[v5 - 1677708454] = ((v12 ^ (v12 >> 18) ^ 0xE1) + (~(2 * (v12 ^ (v12 >> 18) ^ 0xE1)) | 0x37) - 27) ^ 0x20;
  return (*(uint64_t (**)(void))(v0
                              + 8LL
                              * ((837
                                * (v5
                                 - (((v12 ^ (v12 >> 18) ^ 0xE1)
                                                    + (~(2 * (v12 ^ (v12 >> 18) ^ 0xE1)) | 0x37)
                                                    - 27) != 0x20) == 1677708453)) ^ 0x1A8)))();
}

uint64_t sub_1886EE820()
{
  unsigned int v5 = 2 * ((v2 - 111) ^ 0x966D2D4B);
  int v6 = v0 - 1771229676;
  uint64_t v7 = *(void *)(v1 + 8LL * (v0 - 1771229676));
  unint64_t v8 = 591644117
     * ((((v4 - 200) | 0xB2C8AEF4238A5EE6LL) - (v4 - 200) + ((v4 - 200) & 0x4D37510BDC75A118LL)) ^ 0x56D38E3DB88F14A1LL);
  *(_DWORD *)(v4 - 176) = 1601233193 - v8;
  *(void *)(v3 + 464) = aXUs;
  *(void *)(v3 + 448) = v7 - v8;
  sub_18871DC68(v4 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[(468 * (*(_DWORD *)(v4 - 192) == (v5 ^ 0x32E))) ^ (v6 | 0x232)])();
}

uint64_t sub_1886EE82C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  unsigned int v62 = ((HIDWORD(a14) ^ 0x15419B98 ^ LODWORD(STACK[0x13C8]))
       - ((2 * (HIDWORD(a14) ^ 0x15419B98 ^ LODWORD(STACK[0x13C8])) - 1297592520) & 0xC7CC5604)
       + 1027232414) ^ 0x27BDA49E;
  unsigned int v63 = (v62 - ((2 * v62 - 1297592520) & 0xC7CC5604) + 1027232414) ^ 0x27BDA49E;
  unsigned int v64 = ((v63 - ((2 * v63 - 1297592520) & 0xC7CC5604) + 1027232414) ^ 0x63E62B02) + LODWORD(STACK[0x220]);
  unsigned int v65 = (v64 & 1 ^ 0x3AF147FF) + 2 * (v64 & 1) - 988891135 + ((v64 - ((2 * v64) & 0xACF79FA4) - 696528942) ^ 0xBF7272FB);
  unsigned int v66 = v65 ^ 0x93DDB3A8;
  int v67 = (2 * v65) & 0x27BB6750;
  unsigned int v68 = (v65 ^ 0x93DDB3A8) + v67;
  uint64_t v69 = a12 ^ LODWORD(STACK[0x230]);
  LODWORD(STACK[0x230]) = v68 - 496652548 + 1377581177 * v68;
  LODWORD(STACK[0x228]) = 626476000 - (1539804940 * v67 + 1539804940 * v66);
  LODWORD(STACK[0x220]) = 1377581177 * v68 + 1984127652;
  LODWORD(STACK[0x218]) = 1377581177 * v67 + 1377581177 * v66 + 646534552;
  LODWORD(STACK[0x200]) = 1377581176 * v68 + 169940556;
  char v70 = 119 * v68 - 12;
  char v71 = -48 - (18 * v67 + 18 * v66);
  LODWORD(a59) = (LODWORD(STACK[0x238]) + 93698096) & 0xFA6A47DF;
  int32x4_t v72 = vdupq_n_s32(0xAA710AC9);
  int32x4_t v73 = vdupq_n_s32(0x996194u);
  LOBYTE(v66) = LODWORD(STACK[0x200]) - ((0x80 - (16 * v67 + 16 * v66)) & 0x18);
  LOBYTE(v67) = LODWORD(STACK[0x220]) - ((LODWORD(STACK[0x218]) << (a59 ^ 0x46)) & 0x18);
  unsigned int v74 = LODWORD(STACK[0x230]) - (STACK[0x228] & 0x9F741A18);
  int v75 = ((v70 - (v71 & 0x18)) ^ v69) ^ 0xFC;
  int v76 = ((LOBYTE(STACK[0x230]) - (STACK[0x228] & 0x18)) ^ v69) ^ 0xFC;
  int v77 = (1635232199 - v75 + ((2 * v75) | 0x3D10AC72)) ^ 0x1C8C389B;
  int v78 = (1635232199 - ((v66 ^ v69) ^ 0xFC) + ((2 * ((v66 ^ v69) ^ 0xFC)) | 0x3D10AC72)) ^ 0x1C8C389B;
  int v79 = (1635232199 - ((v67 ^ v69) ^ 0xFC) + ((2 * ((v67 ^ v69) ^ 0xFC)) | 0x3D10AC72)) ^ 0x1C8C389B;
  int v80 = (1635232199 - v76 + ((2 * v76) | 0x3D10AC72)) ^ 0x1C8C389B;
  uint64_t v81 = v80 - 814502740 - ((2 * v80) & 0x9EE75958);
  v82.i32[0] = dword_18873EC90[(v77 - 814502740 - ((2 * v77) & 0x9EE75958)) ^ 0x4D77C25C];
  v82.i32[1] = dword_18873EC90[(v78 - 814502740 - ((2 * v78) & 0x9EE75958)) ^ 0x4D77C25C];
  v82.i32[2] = dword_18873EC90[(v79 - 814502740 - ((2 * v79) & 0x9EE75958)) ^ 0x4D77C25C];
  v82.i32[3] = dword_18873EC90[v81 ^ 0x4D77C25C];
  int v83 = v67 ^ 0x6F;
  uint64_t v84 = (2 * v83) & 0x144;
  uint64_t v85 = (350625373 - v83 + v84);
  int8x16_t v86 = veorq_s8( vandq_s8((int8x16_t)vshrq_n_u32(v82, 1uLL), (int8x16_t)vdupq_n_s32(0x3B051CEDu)),  (int8x16_t)vdupq_n_s32(0x33010C25u));
  int32x4_t v87 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v86, (int8x16_t)vdupq_n_s32(0x558EF536u)),  (int32x4_t)vorrq_s8(v86, (int8x16_t)v72)),  v72),  (int8x16_t)vdupq_n_s32(0x5DDEF536u));
  int8x16_t v88 = veorq_s8( veorq_s8((int8x16_t)v82, (int8x16_t)vdupq_n_s32(a19 ^ a20 ^ a13)),  (int8x16_t)vaddq_s32( vsubq_s32( v87,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v87, v87), (int8x16_t)vdupq_n_s32(0x64A1157Au))),  vdupq_n_s32(0xF2508ABD)));
  int32x4_t v89 = (int32x4_t)veorq_s8(vandq_s8(v88, (int8x16_t)vdupq_n_s32(0x4DCE15B7u)), (int8x16_t)vdupq_n_s32(0xB73DFA6D));
  int32x4_t v90 = (int32x4_t)veorq_s8(vandq_s8(v88, (int8x16_t)vdupq_n_s32(0xB231EA48)), (int8x16_t)vdupq_n_s32(0xDFCE7FBF));
  int32x4_t v91 = (int32x4_t)vandq_s8( veorq_s8( (int8x16_t)vaddq_s32( vaddq_s32(v89, vdupq_n_s32(0x996195u)),  (int32x4_t)veorq_s8( vandq_s8( (int8x16_t)vaddq_s32(v89, v89),  (int8x16_t)vdupq_n_s32(0x1100328u)),  (int8x16_t)vdupq_n_s32(0xFFDD3FFF))),  (int8x16_t)v73),  veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v90,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v90, v90),  (int8x16_t)vdupq_n_s32(0x400090u))),  vdupq_n_s32(0x3A99EE95u)),  (int8x16_t)vdupq_n_s32(0xC5A611FB)));
  int32x4_t v92 = vaddq_s32( vsubq_s32(v91, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v91, v91), (int8x16_t)vdupq_n_s32(0x132C328u))),  v73);
  *(_DWORD *)(a1
            + 4LL
            * ((350625373
  *(_DWORD *)(a1 + 4LL * ((350625373 - (v66 & 0xFC ^ 0x6F) + ((2 * (v66 & 0xFC ^ 0x6F)) & 0x144)) ^ 0x14E61E3E)) = v92.i32[1];
  *(_DWORD *)(a1 + 4LL * (v85 ^ 0x14E61E3E)) = v92.i32[2];
  *(_DWORD *)(a1 + 4LL * ((350625373 - (v74 & 0xFE ^ 0x6F) + ((2 * (v74 & 0xFE ^ 0x6F)) & 0x144)) ^ 0x14E61E3E)) = v92.i32[3];
  uint64_t v93 = (uint64_t (*)(uint64_t, uint64_t, void, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[SLODWORD(STACK[0x238])] - 8LL);
  return v93( a1,  v69,  v93,  qword_18A26FDB0,  v85,  v84,  350625373LL,  v81,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

void sub_1886EEDD4()
{
}

uint64_t sub_1886EEDEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,unsigned int a59)
{
  int v59 = malloc(0x404uLL);
  STACK[0x550] = (unint64_t)v59;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v59 != 0LL) * (((a59 - 327) | 0x264) - 805)) ^ a59] - (a59 ^ 0x24BLL)))();
}

uint64_t sub_1886EEE4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, int a14, int a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20, unsigned int a21, int a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, int a32, uint64_t a33, uint64_t a34, int a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, int a43, uint64_t a44, int a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v72 = ((2 * a71) ^ 0x68601A30) - ((((2 * a71) ^ 0x68601A30) << (v71 - 73)) & 0x58B58B4) + 180726875;
  unsigned int v73 = (((a71 ^ 0x34300D18) + 37379851) ^ 0xCEEDEFFB)
      + ((2 * ((a71 ^ 0x34300D18) + 37379851)) & 0x9DDBDFF6)
      + (v72 & 0x474BE16 ^ 0xB2F28BB)
      + ((2 * v72) & 0x828742C ^ 0xFFF7AFDB)
      + 1;
  unsigned int v74 = v73 - ((2 * v73 - 653008090) & 0xEC6190E6) - 491079162;
  unsigned int v75 = ((2 * v74) ^ 0xEC6190E6) - ((2 * ((2 * v74) ^ 0xEC6190E6)) & 0x58B58B4) + 180726875;
  unsigned int v76 = (((v74 ^ 0xF630C873) + 37379851) ^ 0xCEEDEFFB)
      + ((2 * ((v74 ^ 0xF630C873) + 37379851)) & 0x9DDBDFF6)
      + (v75 & 0x474BE16 ^ 0xB2F28BB)
      + ((2 * v75) & 0x828742C ^ 0xFFF7AFDB)
      + 1;
  unsigned int v77 = ((v76 - ((2 * v76 - 653008090) & 0xEC6190E6) - 491079162) ^ 0xF630C873) + LODWORD(STACK[0x13CC]);
  unsigned int v78 = (v77 ^ 0x8BB7DFFF) + 1950883841 + ((2 * v77) & 0x176FBFFE);
  HIDWORD(v79) = a12 ^ 0x32A4F;
  LODWORD(v79) = a12 ^ 0x4A280000;
  unsigned int v80 = ((v78 & 0xFFFFFFFE) - ((2 * v78) & 0xB8042B34) - 603843174) ^ 0x5E34D43F;
  LODWORD(STACK[0x238]) = 1037230240 * v80;
  LODWORD(STACK[0x218]) = 4 * v80;
  LODWORD(STACK[0x230]) = 1037230239 * v80 + 92;
  LODWORD(STACK[0x228]) = 2074460478 * v80;
  LODWORD(STACK[0x200]) = 8 * v80;
  int v81 = 1037230237 * v80 + 92;
  LODWORD(STACK[0x220]) = v81 + v80;
  v82.i64[0] = 0x100000001LL;
  v82.i64[1] = 0x100000001LL;
  v83.i64[0] = 0x400000004LL;
  v83.i64[1] = 0x400000004LL;
  int v84 = (v81 - ((58 * v80) & 0xB8));
  int v85 = (LODWORD(STACK[0x220]) - ((60 * (_BYTE)v80) & 0xB8)) & 0xFE;
  int v86 = (LODWORD(STACK[0x230]) - (STACK[0x228] & 0xB8));
  int v87 = (LOBYTE(STACK[0x238]) - ((LODWORD(STACK[0x238]) << ((v71 + 86) ^ 0xA1)) & 0xB8) + 92) & 0xFC;
  unsigned int v88 = (416825053 - (v84 ^ 0x64) + ((2 * (v84 ^ 0x64)) | 0xCE4F8246)) ^ 0x8727802B;
  unsigned int v89 = (416825053 - (v85 ^ 0x64) + ((2 * (v85 ^ 0x64)) | 0xCE4F8246)) ^ 0x8727802B;
  unsigned int v90 = (416825053 - (v86 ^ 0x64) + ((2 * (v86 ^ 0x64)) | 0xCE4F8246)) ^ 0x8727802B;
  unsigned int v91 = (416825053 - (v87 ^ 0x64) + ((2 * (v87 ^ 0x64)) | 0xCE4F8246)) ^ 0x8727802B;
  unsigned int v92 = a17 ^ a18 ^ a15 ^ 0xDC507B19;
  v93.i32[0] = dword_188747430[v92 ^ (v88 - 252265084 - ((2 * v88) & 0xE1ED7B08))];
  v93.i32[1] = dword_188747430[v92 ^ (v89 - 252265084 - ((2 * v89) & 0xE1ED7B08))];
  v93.i32[2] = dword_188747430[v92 ^ (v90 - 252265084 - ((2 * v90) & 0xE1ED7B08))];
  v93.i32[3] = dword_188747430[v92 ^ (v91 - 252265084 - ((2 * v91) & 0xE1ED7B08))];
  int32x4_t v94 = (int32x4_t)veorq_s8( vandq_s8((int8x16_t)vaddq_s32(v93, vdupq_n_s32(0x27EB2B2u)), (int8x16_t)vdupq_n_s32(0x5D2E5E93u)),  vandq_s8((int8x16_t)v93, v82));
  int32x4_t v95 = vaddq_s32(vsubq_s32(v93, vaddq_s32(v94, v94)), vdupq_n_s32(0x5FAD1144u));
  int32x4_t v96 = (int32x4_t)veorq_s8((int8x16_t)vshlq_n_s32(v95, 3uLL), (int8x16_t)vdupq_n_s32(0xE972F490));
  int8x16_t v97 = veorq_s8( veorq_s8((int8x16_t)v95, (int8x16_t)vdupq_n_s32(a45 ^ a22 ^ a35 ^ a32 ^ a43 ^ a21)),  (int8x16_t)vaddq_s32( vsubq_s32( v96,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v96, v96), (int8x16_t)vdupq_n_s32(0x9EC84B30))),  vdupq_n_s32(0xCF64259B)));
  int32x4_t v98 = (int32x4_t)vorrq_s8( (int8x16_t)vshlq_n_s32((int32x4_t)veorq_s8(v97, (int8x16_t)vdupq_n_s32(0x39F22u)), 0xEuLL),  (int8x16_t)vshrq_n_u32((uint32x4_t)veorq_s8(v97, (int8x16_t)vdupq_n_s32(0xDA780000)), 0x12uLL));
  int8x16_t v99 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v98,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v98, v98), (int8x16_t)vdupq_n_s32(0x1967EBF8u))),  vdupq_n_s32(0xCB3F5FCu)),  (int8x16_t)vdupq_n_s32((v79 >> 18) - ((2 * (v79 >> 18)) & 0x4DDCEF5C) - 1494321234));
  int32x4_t v100 = (int32x4_t)vorrq_s8( (int8x16_t)vshlq_n_s32((int32x4_t)veorq_s8(v99, v83), 0x12uLL),  (int8x16_t)vshrq_n_u32((uint32x4_t)veorq_s8(v99, (int8x16_t)vdupq_n_s32(0x41118000u)), 0xEuLL));
  int8x16_t v101 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v100,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v100, v100), (int8x16_t)vdupq_n_s32(0x536FCA08u))),  vdupq_n_s32(0xA9B7E504)),  (int8x16_t)vdupq_n_s32(0xFC96AE85));
  *(_DWORD *)(a1 + 4LL * (v84 ^ 0x5Cu)) = v101.i32[0];
  *(_DWORD *)(a1 + 4LL * (v85 ^ 0x5Cu)) = v101.i32[1];
  *(_DWORD *)(a1 + 4LL * (v86 ^ 0x5Cu)) = v101.i32[2];
  *(_DWORD *)(a1 + 4LL * (v87 ^ 0x5Cu)) = v101.i32[3];
  return ((uint64_t (*)(void))(qword_18A26FDB0[v71 - 1597017768] - 12LL))();
}

void sub_1886EF3C0()
{
}

uint64_t sub_1886EF3D8()
{
  uint64_t v1 = malloc(0x408uLL);
  STACK[0x568] = (unint64_t)v1;
  LODWORD(STACK[0x238]) = v0 + 439;
  return ((uint64_t (*)(void))qword_18A26FDB0[((((v1 == 0LL) ^ (v0 + 1)) & 1) * ((v0 + 439) ^ 0x205)) | v0])();
}

uint64_t sub_1886EF42C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v62 = ((a13 ^ LODWORD(STACK[0x13C8]) ^ 0xCC940B0A)
       - ((2 * (a13 ^ LODWORD(STACK[0x13C8]) ^ 0xCC940B0A) + 244053670) & 0x30C1817E)
       + 1067891730) ^ 0xCC940B0A;
  unsigned int v63 = ((v62 - ((2 * v62 + 244053670) & 0x30C1817E) + 1067891730) ^ 0x9860C0BF) + (LODWORD(STACK[0x13C0]) ^ 0x5B89DDC);
  unsigned int v64 = (((((2 * v63) & 0x1BFDF18) + (v63 ^ 0xDFEF8C)) & 0xFFFFFFFE)
       - ((2 * (((2 * v63) & 0x1BFDF18) + (v63 ^ 0xDFEF8C)) + 239083752) & 0xD563770)
       - 2050282451) ^ 0x51FE149A;
  *(int32x4_t *)&STACK[0x240] = vdupq_n_s32(a35 ^ HIDWORD(a10) ^ a37 ^ a13 ^ HIDWORD(a14));
  LODWORD(STACK[0x230]) = 1723025465 - 258082380 * v64;
  LODWORD(a51) = 4 * v64;
  LODWORD(STACK[0x228]) = -848916366 - 516164760 * v64;
  LODWORD(STACK[0x220]) = -516164760 * v64;
  LODWORD(STACK[0x218]) = 1723025465 - 258082381 * v64;
  LODWORD(STACK[0x200]) = -848916366 - 516164762 * v64;
  int v103 = -516164762 * v64;
  v102[0] = 57 - 78 * v64;
  int v101 = -848916366 - 516164764 * v64;
  LODWORD(a59) = 1723025465 - 258082383 * v64;
  int32x4_t v65 = vdupq_n_s32(0x9CCFEC70);
  int32x4_t v66 = vdupq_n_s32(0x422B32BFu);
  int32x4_t v67 = vdupq_n_s32(0x535772E8u);
  LODWORD(a57) = -258082382 * v64;
  LODWORD(a55) = -848916366 - 516164766 * v64;
  LODWORD(a53) = -516164766 * v64;
  LODWORD(a47) = 8 * v64;
  uint64_t v68 = LODWORD(STACK[0x238]);
  unsigned int v69 = ((-258082382 * v64) << (((v68 - 87) | 0xED) ^ 0xEC)) & 0xCD669070;
  unsigned int v70 = STACK[0x220] & 0xCD669070;
  LOBYTE(v64) = v102[0] - v69;
  unsigned int v71 = LODWORD(STACK[0x218]) - (v103 & 0xCD669072);
  unsigned int v72 = LODWORD(STACK[0x230]) - v70;
  int v73 = (-448470953 - (a59 - (a53 & 0x72)) + ((a55 - 2 * (a53 & 0xCD669072)) & 0x150)) ^ 0xED6CF84E;
  unsigned int v74 = (-448470953 - (v102[0] - v69) + ((v101 - 2 * v69) & 0x150)) ^ 0xED6CF84E;
  unsigned int v75 = (-448470953 - v71 + ((LODWORD(STACK[0x200]) - 2 * (v103 & 0xCD669072)) & 0x150)) ^ 0xED6CF84E;
  unsigned int v76 = (-448470953 - (v72 & 0xFD) + ((LODWORD(STACK[0x228]) - 2 * v70) & 0x150)) ^ 0xED6CF84E;
  int v77 = a15 ^ HIDWORD(a15) ^ HIDWORD(a13);
  v78.i32[0] = v77 ^ (1091091255 - v73 + ((2 * v73) | 0x7DEE8992));
  v78.i32[1] = v77 ^ (1091091255 - v74 + ((2 * v74) | 0x7DEE8992));
  v78.i32[2] = v77 ^ (1091091255 - v75 + ((2 * v75) | 0x7DEE8992));
  v78.i32[3] = v77 ^ (1091091255 - v76 + ((2 * v76) | 0x7DEE8992));
  int32x4_t v79 = (int32x4_t)vorrq_s8( (int8x16_t)vshlq_n_s32( (int32x4_t)(*(_OWORD *)&v78 ^ __PAIR128__(0xA0000000ALL, 0xA0000000ALL)),  0x1BuLL),  (int8x16_t)vshrq_n_u32( (uint32x4_t)(*(_OWORD *)&v78 ^ __PAIR128__(0xFA79DB40FA79DB40LL, 0xFA79DB40FA79DB40LL)),  5uLL));
  __int32 v80 = v79.i32[0] - 1381470973 - ((2 * v79.i32[0]) & 0x5B50D9DC);
  int v81 = v79.i32[1] - 1381470973 - ((2 * v79.i32[1]) & 0x5B50D9DC);
  int v82 = v79.i32[2] - 1381470973 - ((2 * v79.i32[2]) & 0x5B50D9DC);
  int v83 = v79.i32[3] - 1381470973 - ((2 * v79.i32[3]) & 0x5B50D9DC);
  v79.i32[0] = (v80 + 134217707) ^ 0x4BF0174;
  v79.i32[1] = (v81 + 134217707) ^ 0x4BF0174;
  v79.i32[2] = (v82 + 134217707) ^ 0x4BF0174;
  v79.i32[3] = (v83 + 134217707) ^ 0x4BF0174;
  v84.i32[0] = v80 + 2147483627;
  v84.i32[1] = v81 + 2147483627;
  v84.i32[2] = v82 + 2147483627;
  v84.i32[3] = v83 + 2147483627;
  int8x16_t v85 = vorrq_s8((int8x16_t)vshlq_n_s32(v79, 5uLL), (int8x16_t)vshrq_n_u32(v84, 0x1BuLL));
  v85.i32[0] = dword_18873DE40[(v85.i32[0] - 1441376554 - ((2 * v85.i32[0]) & 0x542CADAC)) ^ 0x88FBE592];
  v85.i32[1] = dword_18873DE40[(v85.i32[1] - 1441376554 - ((2 * v85.i32[1]) & 0x542CADAC)) ^ 0x88FBE592];
  v85.i32[2] = dword_18873DE40[(v85.i32[2] - 1441376554 - ((2 * v85.i32[2]) & 0x542CADAC)) ^ 0x88FBE592];
  v85.i32[3] = dword_18873DE40[(v85.i32[3] - 1441376554 - ((2 * v85.i32[3]) & 0x542CADAC)) ^ 0x88FBE592];
  int8x16_t v86 = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)&STACK[0x240], v78), (int8x16_t)vdupq_n_s32(0xCF8688A7)), v85);
  int8x16_t v87 = veorq_s8(vandq_s8(v86, (int8x16_t)vdupq_n_s32(0x860D3FFB)), (int8x16_t)vdupq_n_s32(0x82081DD0));
  int32x4_t v88 = (int32x4_t)veorq_s8(vandq_s8(v86, (int8x16_t)vdupq_n_s32(0x79F2C004u)), (int8x16_t)vdupq_n_s32(0x28F24004u));
  int8x16_t v89 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v88, v88), (int8x16_t)vdupq_n_s32(0xC44BE142)),  v88),  vdupq_n_s32(0x9DDA0F5F)),  (int8x16_t)vdupq_n_s32(0x2E36E0A2u));
  int32x4_t v90 = (int32x4_t)vorrq_s8( veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v89, (int8x16_t)vdupq_n_s32(0xBDD4CD40)),  (int32x4_t)vorrq_s8(v89, (int8x16_t)v66)),  v66),  (int8x16_t)vdupq_n_s32(0xA8D55D47)),  veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v87, (int8x16_t)vdupq_n_s32(0x6330138Fu)),  (int32x4_t)vorrq_s8(v87, (int8x16_t)v65)),  v65),  (int8x16_t)vdupq_n_s32(0xE1301654)));
  int8x16_t v91 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v90,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v90, v90), (int8x16_t)vdupq_n_s32(0x6F3B8C94u))),  vdupq_n_s32(0xB79DC64A)),  (int8x16_t)vdupq_n_s32(a21 ^ HIDWORD(a16) ^ a20));
  int32x4_t v92 = (int32x4_t)veorq_s8(vandq_s8(v91, (int8x16_t)vdupq_n_s32(0x4D3D1E75u)), (int8x16_t)vdupq_n_s32(0xB2DBEF8F));
  int32x4_t v93 = (int32x4_t)veorq_s8(vandq_s8(v91, (int8x16_t)vdupq_n_s32(0xB2C2E18A)), (int8x16_t)vdupq_n_s32(0x7F7D7F77u));
  int32x4_t v94 = (int32x4_t)vandq_s8( veorq_s8( (int8x16_t)vaddq_s32( vaddq_s32(v92, vdupq_n_s32(0x535772E9u)),  (int32x4_t)veorq_s8( vandq_s8( (int8x16_t)vaddq_s32(v92, v92),  (int8x16_t)vdupq_n_s32(0x822A24C0)),  (int8x16_t)vdupq_n_s32(0xDB7B3EEF))),  (int8x16_t)v67),  veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v93,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v93, v93),  (int8x16_t)vdupq_n_s32(0x60048214u))),  vdupq_n_s32(0xA3D13CB6)),  (int8x16_t)vdupq_n_s32(0xBC33455E)));
  int v95 = (((a59 - (a53 & 0xCD669072)) & 0x9E ^ 0xB620CA97) + ((a59 - (a53 & 0xCD669072)) & 0x61) - 1) ^ 0xA325DEAF;
  unsigned int v96 = ((v64 & 0x9E ^ 0xB620CA97) + (v64 & 0x61) - 1) ^ 0xA325DEAF;
  unsigned int v97 = ((v71 & 0x9E ^ 0xB620CA97) + (v71 & 0x61) - 1) ^ 0xA325DEAF;
  int32x4_t v98 = vaddq_s32( vsubq_s32(v94, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v94, v94), (int8x16_t)vdupq_n_s32(0xA6AEE5D0))),  v67);
  *(_DWORD *)(a1 + 4LL * ((v95 - 778489679 - ((2 * v95) & 0x22022162)) ^ 0xC49C24B1)) = v98.i32[0];
  *(_DWORD *)(a1 + 4LL * ((v96 - 778489679 - ((2 * v96) & 0x22022162)) ^ 0xC49C24B1)) = v98.i32[1];
  unsigned int v99 = ((v72 & 0x9C ^ 0xB620CA97) + (v72 & 0x61) - 1) ^ 0xA325DEAF;
  *(_DWORD *)(a1 + 4LL * ((v97 - 778489679 - ((2 * v97) & 0x22022162)) ^ 0xC49C24B1)) = v98.i32[2];
  *(_DWORD *)(a1 + 4LL * ((v99 - 778489679 - ((2 * v99) & 0x22022162)) ^ 0xC49C24B1)) = v98.i32[3];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(int)v68] - 4LL))( a1,  2853590742LL,  v68,  2298209682LL,  2112784786LL,  1532025308LL,  1412214188LL,  1091091255LL,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

void sub_1886EFC58()
{
}

uint64_t sub_1886EFC70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, unsigned int a50)
{
  unint64_t v51 = STACK[0x558];
  STACK[0x17B0] = STACK[0x560];
  LODWORD(STACK[0x17B8]) = LODWORD(STACK[0x1648]) - 1035419641;
  LODWORD(STACK[0x17BC]) = (__PAIR64__(a50, a18) >> 1)
  unint64_t v53 = STACK[0x548];
  unint64_t v52 = STACK[0x550];
  unint64_t v54 = STACK[0x538];
  STACK[0x17C0] = STACK[0x530];
  STACK[0x17C8] = v52;
  STACK[0x17D0] = v53;
  STACK[0x17D8] = v51;
  unint64_t v55 = STACK[0x520];
  STACK[0x17E0] = STACK[0x528];
  STACK[0x17E8] = v55;
  LODWORD(v55) = LODWORD(STACK[0x1640]) ^ 0x32B9E087;
  STACK[0x17F0] = STACK[0x568];
  STACK[0x17F8] = v54;
  HIDWORD(v56) = v55;
  LODWORD(v56) = 1 - a17;
  LODWORD(STACK[0x1800]) = (v56 >> 30) - ((2 * (v56 >> 30)) & 0xF5498722) - 89865327;
  LODWORD(STACK[0x1804]) = LODWORD(STACK[0x18BC]) + 1414529030;
  int v57 = STACK[0x13DC];
  LODWORD(v51) = STACK[0x168C];
  LODWORD(STACK[0x94C]) = STACK[0x13D8];
  LODWORD(STACK[0x950]) = 1185167684;
  LODWORD(STACK[0x954]) = a11;
  LODWORD(STACK[0x958]) = v51;
  LODWORD(STACK[0x95C]) = v57;
  LODWORD(STACK[0x960]) = v50 ^ 0x5F5;
  LODWORD(STACK[0x964]) = v50 ^ 0xB5ABA430;
  LODWORD(v51) = 29 * (v50 ^ 0x1FC);
  LODWORD(STACK[0x968]) = v51;
  LODWORD(STACK[0x96C]) = 1;
  LODWORD(v51) = (v51 ^ 0x876A2D6F) + 1;
  LODWORD(STACK[0x970]) = v51;
  STACK[0x750] = STACK[0x17B0] + (v51 ^ 0x876A2C82);
  STACK[0x740] = qword_18A26FDB0[(v50 ^ 0x5F5) + 200] - 4LL;
  uint64_t v58 = (*(uint64_t (**)(void, unint64_t *, uint64_t))(qword_18C724740
                                                                       + 32LL
                                                                       * *(unsigned __int8 *)(((STACK[0x750]
                                                                                              - qword_18C724728) & 0xFFFFFFFFFFFFFFF0LL)
                                                                                            + qword_18C724720
                                                                                            + 8)
                                                                       + 8))( *(void *)(((STACK[0x750] - qword_18C724728) & 0xFFFFFFFFFFFFFFF0LL) + qword_18C724720),  &STACK[0x78F],  1LL);
  LOBYTE(STACK[0x74F]) = STACK[0x78F];
  return ((uint64_t (*)(uint64_t))STACK[0x740])(v58);
}

uint64_t sub_1886EFD90(uint64_t a1, uint64_t a2, int a3)
{
  return ((uint64_t (*)(void))(*(void *)(v5
                                        + 8LL
                                        * (((v3 + 8 == a3) * ((v6 + ((v4 - 593) | 0x20) - 365) ^ LODWORD(STACK[0x238]))) ^ v4))
                            - 12LL))();
}

uint64_t sub_1886EFDC8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x230]) = a4;
  *(void *)(v10 + 776) = 0x66187103FF10C1DCLL;
  LODWORD(STACK[0x440]) = *(_DWORD *)(v8 + 3208) - 1823406259;
  uint64_t v13 = *(unsigned int *)(v9 + 3160);
  v11[12] = *(void *)(v5 + 8 * ((v4 + 568875267) ^ 0x1FFFFFFFB85586E7LL));
  LODWORD(STACK[0x578]) = v4 + 568875267;
  LODWORD(STACK[0x588]) = 0;
  v11[14] = v7;
  LODWORD(STACK[0x58C]) = (v4 + 568875267) ^ 0x7A;
  LODWORD(STACK[0x590]) = v4 + 568875287;
  v11[17] = v13;
  *(void *)(v6 + 448) = &STACK[0x570];
  *(_DWORD *)(v12 - 192) = 1431737413 * ((((2 * (v12 - 200)) | 0x88448562) - (v12 - 200) - 1143095985) ^ 0xFA7CDDA3)
                         + 40706419
                         + v4;
  sub_1886DF534(v12 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v12 - 188)] - 8LL))();
}

uint64_t sub_1886EFEBC()
{
  STACK[0x240] = (unint64_t)malloc(STACK[0x228]);
  uint32_t v0 = arc4random();
  LODWORD(xmmword_18C723288) = v0 - 1595106619 - ((2 * v0) & 0x41D9358A);
  DWORD1(xmmword_18C723288) = ((1812433253 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0xFFFFB726)
                            + ((-670100790 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0xFFFF6E4C)
                            - 1595087968
                            - ((2
                              * (((1812433253
                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0xFFFFB726)
                               + ((-670100790
  return ((uint64_t (*)(void))sub_1886F0000)();
}

void sub_1886F0000()
{
}

uint64_t sub_1886F001C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int8x16_t v6 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  int8x16_t v7 = (int8x16_t)vdupq_n_s32(0x4E6F79CAu);
  v8.i64[0] = 0x8000000080000000LL;
  v8.i64[1] = 0x8000000080000000LL;
  v5.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v5.i32[2] = HIDWORD(xmmword_18C723288);
  int8x16_t v9 = vextq_s8(v6, v5, 0xCuLL);
  int8x16_t v10 = v5;
  v10.i32[3] = unk_18C723298;
  int8x16_t v11 = (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8(vandq_s8(v9, v8), (int8x16_t)vdupq_n_s32(0xF2490000)),  vdupq_n_s32(0xEE4CB3E0));
  int32x4_t v12 = (int32x4_t)veorq_s8(vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x631528E0u));
  int32x4_t v13 = (int32x4_t)veorq_s8( (int8x16_t)vsubq_s32( vaddq_s32( v12,  (int32x4_t)veorq_s8(vandq_s8(v10, v7), (int8x16_t)vdupq_n_s32(0x8C6A510B))),  (int32x4_t)vandq_s8((int8x16_t)v12, v7)),  (int8x16_t)vdupq_n_s32(0x8D96CBEF));
  v14.i32[0] = *((_DWORD *)&STACK[0x1930] + ((BYTE4(xmmword_18C723288) & 1) == 0));
  v14.i32[1] = *((_DWORD *)&STACK[0x1930] + (~DWORD2(xmmword_18C723288) & 1LL));
  v14.i32[2] = *((_DWORD *)&STACK[0x1930] + (~HIDWORD(xmmword_18C723288) & 1LL));
  v14.i32[3] = *((_DWORD *)&STACK[0x1930] + (~unk_18C723298 & 1LL));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v14),  (int8x16_t)vdupq_n_s32(0x9A98D406)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)v13, vandq_s8(v11, v8)),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v13, v13),  (int8x16_t)vdupq_n_s32(0x96205768))),  vdupq_n_s32(0xCB102BB5)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a5 + 9664) - 12LL))();
}

uint64_t sub_1886F0B6C@<X0>( uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, int a5@<W7>, int a6@<W8>)
{
  unsigned int v8 = (v6 & 0x80000000 ^ 0xF2490000) - 296963104;
  int v9 = *(_DWORD *)(a3 + 4 * (v7 + a1 + 9 * (a6 ^ 0x3B8u)));
  unsigned int v10 = ((v9 & 0x7FFFFFFE ^ 0x631528E0) + (v9 & a5 ^ 0x8C6A510B) - ((v9 & 0x7FFFFFFE ^ 0x631528E0) & a5)) ^ 0x8D96CBEF;
  *(_DWORD *)(a3 + 4 * (v7 + a1) + 3128) = *(_DWORD *)(a3 + 4 * (v7 + a1) + 4716) ^ *((_DWORD *)&STACK[0x1930]
                                                                                    + ((v9 & 1) == 0)) ^ (((v10 | v8 & 0x80000000) - ((2 * v10) & 0x96205768) - 888132683) >> 1) ^ 0x9A98D406;
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * ((2023 * (v7 + 1 == a4 + 3)) ^ a6)) - 12LL))();
}

uint64_t sub_1886F0C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9 = (const float *)&dword_18C723614;
  int8x16_t v10 = (int8x16_t)vld1q_dup_f32(v9);
  v11.i64[0] = 0x8000000080000000LL;
  v11.i64[1] = 0x8000000080000000LL;
  v8.i64[0] = *(void *)&dword_18C723618;
  v8.i32[2] = dword_18C723620;
  int8x16_t v12 = vextq_s8(v10, v8, 0xCuLL);
  int8x16_t v13 = v8;
  v13.i32[3] = *(_DWORD *)(a6 + 4 * ((v6 ^ 0x43u) - 613LL));
  int32x4_t v14 = (int32x4_t)veorq_s8(vandq_s8(v13, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0xE6424Cu));
  int32x4_t v15 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v14,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v14, v14),  (int8x16_t)vdupq_n_s32(0xA732C438))),  vdupq_n_s32(0x5399621Cu)),  (int8x16_t)vdupq_n_s32(0x7393BA94u));
  v16.i32[0] = *(_DWORD *)(v7 + 4LL * ((dword_18C723618 & 1) == 0));
  v16.i32[1] = *(_DWORD *)(v7 + 4 * (~dword_18C72361C & 1LL));
  v16.i32[2] = *(_DWORD *)(v7 + 4 * (~dword_18C723620 & 1LL));
  v16.i32[3] = *(_DWORD *)(v7 + 4 * (~v13.i32[3] & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v16),  (int8x16_t)vdupq_n_s32(0x9BC23C40)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8( (int8x16_t)v15,  vbicq_s8(v11, v12)),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v15, v15),  (int8x16_t)vdupq_n_s32(0x934BF670))),  vdupq_n_s32(0xC9A5FB38)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a5 + 8LL * v6) - 8LL))();
}

void sub_1886F0DA0()
{
}

uint64_t sub_1886F0DAC@<X0>(uint64_t a1@<X4>, _DWORD *a2@<X5>, int a3@<W8>)
{
  unsigned int v4 = (*a2 & 0x7FFFFFFE ^ 0xDCC195CD) - 1;
  unsigned int v5 = ((v4 & ((v3 + a3 - 844) ^ 0x8A35EACB) ^ 0x580080) + (v4 ^ 0xBCA5CF58) - ((v4 ^ 0xBCA5CF58) & 0x1C58C780)) ^ 0x5CD007D0;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x1930] + ((*a2 & 1) == 0)) ^ (((v5 | (a3 ^ (v3 + 188) ^ 0x166D2D4B) & a2[623] ^ 0x80000000)
                                                                       + 659021855
                                                                       - 2 * (v5 & 0x2747E03F ^ v4 & 0x20)) >> 1) ^ 0xECB331D3;
  return (*(uint64_t (**)(void))(a1 + 8LL * ((1873 * (LODWORD(STACK[0x440]) > 0x26F)) ^ a3)))();
}

uint64_t sub_1886F0EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  LODWORD(STACK[0x440]) = 0;
  int v11 = LODWORD(STACK[0x440])++;
  *(_DWORD *)(v7 + 3208) = v11 + 1823406260;
  uint64_t v12 = (*(_DWORD *)(v8 + 3160) - 364970770);
  v9[12] = *(void *)(a5 + 8LL * (v5 + 1771230042));
  LODWORD(STACK[0x578]) = v5 + 853903522;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = v5 + 853903484;
  LODWORD(STACK[0x590]) = (v5 + 853903522) ^ 0x16;
  v9[14] = v12;
  v9[17] = 709200851LL;
  *(_DWORD *)(v10 - 192) = 1431737413 * ((((v10 - 200) | 0x7C25F7D7) - ((v10 - 200) & 0x7C25F7D7)) ^ 0xC27B68C5)
                         + 40706419
                         + v5;
  *(void *)(v6 + 448) = &STACK[0x570];
  sub_1886DF534(v10 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v10 - 188)] - 4LL))();
}

uint64_t sub_1886F0FA0()
{
  int v7 = STACK[0x230];
  if (v2 >= v3) {
    int v8 = *(_DWORD *)(v5 + 3160) + 1;
  }
  else {
    int v8 = v4;
  }
  *(_DWORD *)(v5 + 3160) = v8;
  unsigned int v9 = ((((v1 ^ (v1 >> 11)) << 7) ^ 0x7C43AB00)
      - ((2 * (((v1 ^ (v1 >> 11)) << 7) ^ 0x7C43AB00)) & 0x50742200)
      + 674894085) & 0x9D2C5680 ^ v1 ^ (v1 >> 11);
  unsigned int v10 = ((v9 << 15) ^ 0x4BAB0000) - ((2 * ((v9 << 15) ^ 0x4BAB0000)) & 0x812D0000) + 1083605738;
  unsigned int v11 = ((((v10 & 0xEFC60000 ^ 0x62860000)
         + (v10 & 0xC9C60000 ^ 0x89792483)
         - ((v10 & 0xEFC60000 ^ 0x62860000) & 0xC9C60000)) ^ 0x99258658)
       - 1) ^ v9;
  *(_BYTE *)(*(void *)(v6 + 600) + (v7 - 978475490)) = ((v11 ^ (v11 >> 18) ^ 0xE)
                                                                      - ((2 * (v11 ^ (v11 >> 18) ^ 0xE)) & 0x60)
                                                                      - 80) ^ 0xC6;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0
                                                              + 8LL
                                                              * ((753
                                                                * (v7
                                                                 - (((v11 ^ (v11 >> 18) ^ 0xE)
                                                                                    - ((2 * (v11 ^ (v11 >> 18) ^ 0xE)) & 0x60)
                                                                                    - 80) != 0xC6) == 978475489)) ^ 0x16D)))( 3421569481LL,  978475489LL,  274804457LL);
}

uint64_t sub_1886F4E30()
{
  char v4 = v2 - v1 - 86;
  STACK[0x3B8] = v0;
  STACK[0x3F0] = STACK[0x240];
  free(*(void **)(v3 + 600));
  LODWORD(STACK[0x22A0]) = 438484908;
  LODWORD(STACK[0x22B8]) = 438484910;
  uint64_t v5 = off_18C723C70[0];
  *(_BYTE *)(v3 + 713) = *off_18C723C70[0] - 46;
  *(_BYTE *)(v3 + 714) = v5[1] + ((v2 - 94) & 0xCE ^ 0x14);
  *(_BYTE *)(v3 + 715) = v5[2] - 46;
  *(_BYTE *)(v3 + 716) = v5[3] - 46;
  *(_BYTE *)(v3 + 717) = v5[4] - 46;
  *(_BYTE *)(v3 + 718) = v5[5] - 46;
  *(_BYTE *)(v3 + 719) = v5[6] - 46;
  *(_BYTE *)(v3 + 720) = v5[7] + (v4 ^ 0x99);
  *(_BYTE *)(v3 + 721) = v5[8] - 46;
  *(_BYTE *)(v3 + 722) = v5[9] - 46;
  *(_BYTE *)(v3 + 723) = v5[10] - 46;
  *(_BYTE *)(v3 + 724) = v5[11] - 46;
  *(_BYTE *)(v3 + 725) = v5[12] - 46;
  *(_BYTE *)(v3 + 726) = v5[13] - 46;
  *(_BYTE *)(v3 + 727) = v5[14] - 46;
  *(_BYTE *)(v3 + 728) = v5[15] - 46;
  *(_BYTE *)(v3 + 729) = v5[16] - 46;
  *(_BYTE *)(v3 + 730) = v5[17] - 46;
  *(_BYTE *)(v3 + 731) = v5[18] - 46;
  *(_BYTE *)(v3 + 732) = v5[19] - 46;
  *(_BYTE *)(v3 + 733) = v5[20] - 46;
  *(_BYTE *)(v3 + 734) = v5[21] - 46;
  *(_BYTE *)(v3 + 735) = off_18C723C70[0][22] - 46;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v7 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x18F1], SystemEncoding);
  *(void *)(v3 + 304) = v7;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(63 * (v7 == 0LL)) ^ v2] - 4LL))();
}

uint64_t sub_1886F4FF4()
{
  uint64_t v2 = MGCopyAnswer();
  *(void *)(v1 + 288) = v2;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(13 * (v2 != 0)) ^ v0]
                            - ((((v0 - 8719369) & 0x16DDBFE7u) - 2146142554) ^ 0x966D2D43LL)))();
}

uint64_t sub_1886F505C()
{
  unint64_t v3 = STACK[0x368];
  char v4 = (char *)&STACK[0x19A0] + STACK[0x368];
  *(void *)(v2 + 224) = STACK[0x368];
  *(void *)(v2 + 232) = v4;
  STACK[0x368] = v3 + 64;
  *(void *)(v2 + 240) = (((32LL * (v4 & 1)) ^ 0x20) & 0xFFFFFFFFFFFFFFEFLL | (16LL
  CFTypeID v5 = CFGetTypeID(*(CFTypeRef *)(v2 + 288));
  uint64_t v6 = ((_DWORD)v0 - 374912359) ^ v0 ^ 0x1658B710 ^ v5 ^ 0x7FDFBEFDFDFEAF74LL;
  unint64_t v7 = (2 * v5) & 0xFFBF7DFBFBFD5FFELL;
  CFTypeID TypeID = CFStringGetTypeID();
  unint64_t v9 = v6 + v7 + (TypeID ^ 0xC242800185A06A5LL) - ((2 * TypeID) & 0xE7B7AFFFCF4BF2B4LL) + 1;
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8
                                        * (v0 ^ 0x1658B614 ^ (69
                                                                          * (((v9
}

uint64_t sub_1886F516C()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 288));
  uint64_t v4 = v3 ^ 0x6DDA3EBCE5BAE733LL;
  unint64_t v5 = (2 * v3) & 0xDBB47D79CB75CE66LL;
  CFTypeID TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((117
                                          * (v4
                                           + (TypeID ^ 0xC80001A482BA1123LL)
                                           + v5
                                           - (((159 * (v0 ^ 0x1B7)) ^ (v0 - 119 + 0x6FFFFCB6FA8BDB48LL)) & (2 * TypeID)) != 0x35DA40616874F856LL)) ^ v0))
                            - 12LL))();
}

uint64_t sub_1886F5220()
{
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(v2 + 288));
  int v5 = Length - ((Length << ((6 * (v0 ^ 0x1B)) ^ (11 * (v0 ^ 0xF)) ^ 0xC4u)) & 0xDA3E6CB6) - 316721573;
  LODWORD(STACK[0x14BC]) = v5 ^ 0x9C16A8A9;
  LODWORD(STACK[0x37C]) = v5 ^ 0x9C16A8A9;
  uint64_t v6 = malloc(v5 ^ 0xED1F365B);
  *(void *)(v3 + 4016) = v6;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((518 * (v6 != 0LL)) ^ v0)))();
}

uint64_t sub_1886F52B8()
{
  int v5 = (void *)(*(void *)(v3 + 240) + *(void *)(v3 + 232) - 0x3405737C11AC427ALL);
  v8.length = (v1 ^ 0x7FED7E1E6FFDFF5FLL) - 0x7FED7E1E6FFDFF5FLL + ((v1 << (9 * (v0 ^ 0xDDu) - 26)) & 0xDFFBFEBELL);
  *int v5 = 0LL;
  v5[1] = v8.length;
  v8.location = 0LL;
  CFDataGetBytes(*(CFDataRef *)(v3 + 288), v8, *(UInt8 **)(v4 + 4016));
  unint64_t v6 = sub_18872562C(v1, 0x32u, 853288424);
  *(void *)(v4 + 3640) = v6;
  return (*(uint64_t (**)(void))(v2 + 8LL * ((38 * (v6 != 0)) ^ v0)))();
}

uint64_t sub_1886F5384()
{
  unint64_t v6 = (v3 ^ 0xFBFEE6F9FD75BDFBLL) + 0x4011906853977DCLL + (v2 & 0x1FAEB7BF6LL);
  *(_BYTE *)(v4 + 167) = v6 < 0x82AF35D7;
  *(void *)(v4 + 152) = v6;
  unint64_t v7 = *(uint64_t (**)(void))(v0 + 8LL * ((966 * (v6 != ((v1 + 860272097) & 0xCCB9495B) + 2192520636LL)) ^ v1));
  LODWORD(STACK[0xE6C]) = v1;
  v5[300] = 0x1F62BDAF7F847903LL;
  v5[301] = 0x3FCEEB4E4F30FF49LL;
  v5[302] = 0x41B8689786B18ABLL;
  return v7();
}

uint64_t sub_1886F545C@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  LODWORD(STACK[0x474]) = a8;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 8LL * ((98 * (((((((v60 + 119) | 5) - 56) & 0xEB) + 16) ^ ((((unsigned __int16)(v60 + 375) | 5) ^ LOWORD(STACK[0x14BC]) ^ 0xDDE4 ^ 0x4280u) > 1)) & 1)) ^ ((v60 + 375) | 5))))( *(void *)(v61 + 4016),  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59);
}

uint64_t sub_1886F54A8()
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(v2 + 288));
  unint64_t v5 = ((2 * Length) & 0xCFBA68FFF5FDF558LL) + (Length ^ 0x67DD347FFAFEFAACLL);
  *(void *)(v3 + 3424) = v5;
  unint64_t v6 = malloc((v0 ^ 0x325u) + 626 + v5 - 0x67DD347FFAFEFF38LL);
  *(void *)(v3 + 3432) = v6;
  STACK[0x420] = (unint64_t)v6;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((594 * (v6 != 0LL)) ^ v0)))();
}

uint64_t sub_1886F5540( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t CString = CFStringGetCString(*(CFStringRef *)(v62 + 288), *(char **)(v63 + 3432), v60, SystemEncoding);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 + 8LL * ((((2 * (CString & 0x3F) + (((v59 + 126) | 0x80) ^ 0x34 ^ CString)) == 191) * (((v59 - 1154) ^ 0x2B) - 1)) ^ v59)) - 8LL))( CString,  v66,  v67,  v68,  v69,  v70,  v71,  v72,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59);
}

uint64_t sub_1886F55C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  unsigned int v61 = LODWORD(STACK[0x1270])
      + 1980408904
      + ~((2 * LODWORD(STACK[0x1270]) + 167905962) & (((v59 ^ 0x2AB) + 657) ^ 0xE2133F55));
  LODWORD(STACK[0x37C]) = v61;
  unint64_t v62 = sub_18872562C(v61 ^ 0x71099EF2, 0x32u, -1983055792);
  *(void *)(v60 + 25) = v62;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_18A26FDB0[(466 * (v62 != 0)) ^ v59])( v62,  v63,  v64,  v65,  v66,  v67,  v68,  v69,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59);
}

uint64_t sub_1886F565C()
{
  int v3 = (v1 - 553) | 0x203;
  unint64_t v4 = *(void *)(v2 + 3424) - 0x67DD347F29D33BEFLL;
  *(void *)(v2 + 4032) = v4;
  *(_BYTE *)(v2 + 4047) = v4 < 0xD12BBEBD;
  uint64_t v5 = *(void *)(v0 + 8LL * (((v4 != 3509305021) * (v3 - 582)) ^ v1));
  LODWORD(STACK[0x604]) = v1;
  *(void *)(v2 + 248) = 0x231EFE0488222BDDLL;
  *(void *)(v2 + 256) = 0x24B1F8C1DADA620DLL;
  *(void *)(v2 + 264) = 0xB3040FAC71B5D7DLL;
  LODWORD(STACK[0x87C]) = v3;
  return ((uint64_t (*)(void))(v5 - 8))();
}

uint64_t sub_1886F56FC()
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(278 * (**(void **)(v2 + 3856) != 0LL)) ^ (v0 + 1771230438)] - 12LL))();
}

uint64_t sub_1886F571C()
{
  LODWORD(STACK[0x41C]) = 1896455930;
  uint64_t v2 = malloc(8uLL);
  *(void *)(v1 + 3352) = v2;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v2 != 0LL) * (86 * (v0 ^ 0x2FA) - 60)) ^ v0] - 4LL))();
}

uint64_t sub_1886F577C()
{
  int v3 = (_BYTE *)v2[419];
  *int v3 = (HIBYTE(STACK[0x460]) - ((STACK[0x460] >> 55) & 0x2C) + v0 + 12 + 6) ^ 0x16;
  v3[1] = (HIWORD(STACK[0x460]) - ((STACK[0x460] >> 47) & 0x5E) - 81) ^ 0xAF;
  v3[2] = (((unsigned __int16)WORD2(STACK[0x460]) >> 8) - ((STACK[0x460] >> 39) & 0x92) - 55) ^ 0xC9;
  v3[3] = (HIDWORD(STACK[0x460]) - ((STACK[0x460] >> 31) & 0x46) + 35) ^ 0x23;
  v3[4] = (HIBYTE(LODWORD(STACK[0x460])) - ((LODWORD(STACK[0x460]) >> 23) & 0xF4) - 6) ^ 0xFA;
  v3[5] = (HIWORD(LODWORD(STACK[0x460])) - ((LODWORD(STACK[0x460]) >> 15) & 0x38) - 100) ^ 0x9C;
  v3[6] = (BYTE1(LODWORD(STACK[0x460])) - ((LODWORD(STACK[0x460]) >> 7) & 0xBA) - 35) ^ 0xDD;
  v3[7] = (LOBYTE(STACK[0x460]) - ((2 * LOBYTE(STACK[0x460])) & 0x10) - 120) ^ 0x88;
  unint64_t v4 = sub_18872562C(8LL, 0x32u, -158815570);
  *(void *)(v1 + 664) = v4;
  uint64_t v5 = (uint64_t (*)(void))qword_18A26FDB0[(19 * (v4 == 0)) | v0];
  LODWORD(STACK[0xF8C]) = v0;
  v2[336] = 0x68AD387F046A2F24LL;
  v2[337] = 0x2AF381F92A4D0583LL;
  v2[338] = 0x359A336E20FCE184LL;
  return v5();
}

uint64_t sub_1886F5950@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x2C4]) = a1;
  unint64_t v4 = *(void *)(v3 + 3352);
  int v5 = (((v2 | 0x10E) - 1771230163) ^ 0xEAB5554D) != 2094561294;
  unint64_t v6 = (uint64_t (*)(unint64_t))(*(void *)(v1 + 8LL * (((4 * v5) | (v5 << 7)) ^ (v2 + 292))) - 8LL);
  STACK[0x220] = v4;
  return v6(v4);
}

uint64_t sub_1886F5990()
{
  unint64_t v4 = STACK[0x368];
  v3[420] = STACK[0x368];
  v3[421] = (char *)&STACK[0x19A0] + v4;
  STACK[0x368] = v4 + 64;
  uint64_t v5 = (16 - 16 * (&STACK[0x19A0] + v4)) & 0x10;
  v3[422] = ((67 * (v0 ^ 0x2E3)) ^ 0xEE7FFEF3FDFFBF84LL | (2 * v5)) + (v5 ^ 0x57D68D5F7776DFFFLL);
  CFTypeID v6 = CFGetTypeID(*(CFTypeRef *)(v2 + 73));
  unint64_t v7 = v6 ^ 0xFDDFBFF4FFFA6732LL;
  unint64_t v8 = (2 * v6) & 0xFBBF7FE9FFF4CE64LL;
  CFTypeID TypeID = CFStringGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((28
                                          * (v7
                                           + (TypeID ^ 0x4A8629009CE4483LL)
                                           + v8
                                           - ((2 * TypeID) & 0xF6AF3ADFEC6376F8LL) == 0x288228509C8ABB5LL)) ^ v0))
                            - 12LL))();
}

uint64_t sub_1886F5A9C()
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(v3 + 73));
  unint64_t v6 = (Length ^ 0x60FFFC5CFBFCF8E5LL ^ (131 * (v0 ^ 0x10Fu))) + ((2 * Length) & 0xC1FFF8B9F7F9F2D8LL);
  *(void *)(v4 + 328) = v6;
  unint64_t v7 = malloc(v6 - 0x60FFFC5CFBFCF96BLL);
  *(void *)(v4 + 336) = v7;
  uint64_t v8 = *(void *)(v2 + 8LL * ((1416 * (v7 != 0LL)) ^ v0));
  *(void *)(v1 + 96) = v7;
  return ((uint64_t (*)(void))(v8 - ((127 * (v0 ^ 0x10Eu)) ^ 0xF2LL)))();
}

uint64_t sub_1886F5B58()
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  Boolean CString = CFStringGetCString(*(CFStringRef *)(v2 + 73), *(char **)(v3 + 336), v1, SystemEncoding);
}

uint64_t sub_1886F5BD0()
{
  unsigned int v2 = LODWORD(STACK[0x1770]) - ((2 * LODWORD(STACK[0x1770]) + 134614314) & 0xE2133DE4) + 1963763079;
  LODWORD(STACK[0x27C]) = v2;
  unint64_t v3 = sub_18872562C(v2 ^ (((v0 - 380) ^ 0x11A) + 1896455643), 0x32u, -1165678848);
  *(void *)(v1 + 3896) = v3;
  return ((uint64_t (*)(void))qword_18A26FDB0[(522 * (v3 != 0)) ^ v0])();
}

uint64_t sub_1886F5C60()
{
  int v4 = (v1 - 271) | 0x181;
  unint64_t v5 = *(void *)(v2 + 328) - 0x60FFFC5C62446300LL;
  *(void *)(v3 + 3384) = v5;
  *(_BYTE *)(v3 + 3399) = v5 < 0x99B8966C;
  unint64_t v6 = *(uint64_t (**)(void))(v0 + 8LL * (((v5 != 2579011180) * (v4 ^ 0x11C)) ^ v1));
  LODWORD(STACK[0xFCC]) = v1;
  *(void *)(v3 + 2752) = 0x27559F18954AF4E2LL;
  *(void *)(v3 + 2760) = 0x5E8C6E9D715A20EALL;
  *(void *)(v3 + 2768) = 0x796AE6C61244D31ELL;
  LODWORD(STACK[0x1134]) = v4;
  return v6();
}

void sub_1886F5D04()
{
  int v2 = STACK[0x1134];
  LODWORD(STACK[0x1138]) = LODWORD(STACK[0x1134]) - 380;
  unsigned int v3 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(((v2 - 380) ^ 0xFD1BB2E9) & dword_18C724718)) ^ (*(_DWORD *)(v0 + 328)
                                                                                            + *(_DWORD *)(v1 + 3896)
                                                                                            + 67307156)) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x5C3]) = byte_18873E440[v4 >> 24] ^ byte_188744BB0[v4 >> 24] ^ byte_18873F490[(v4 >> 24) + 1] ^ v4 ^ (-127 * BYTE3(v4));
  JUMPOUT(0x18870911CLL);
}

uint64_t sub_1886F5DC4()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 73));
  unint64_t v4 = v3 ^ 0xF9DBBFB7E5BE7771LL;
  unint64_t v5 = (v3 << ((((v0 ^ 0x4C) + 91) | 0xF1u) + 10)) & 0xF3B77F6FCB7CEEE2LL;
  CFTypeID TypeID = CFDataGetTypeID();
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((7
                                * (v4 + (TypeID ^ 0x6E84018250822021LL) - ((2 * TypeID) & 0x22F7FCFB5EFBBFBCLL) + v5 == 0x685FC13A36409792LL)) ^ v0 ^ 0x14Cu)))();
}

uint64_t sub_1886F5E78()
{
  int Length = CFDataGetLength(*(CFDataRef *)(v2 + 73));
  unsigned int v5 = Length - ((2 * Length) & 0xDA3E6CB6) - 316721509 + ((127 * (v0 ^ 0xF5)) ^ 0xFFFFFF3E);
  LODWORD(STACK[0x185C]) = v5 ^ 0x9C16A8A9;
  LODWORD(STACK[0x27C]) = v5 ^ 0x9C16A8A9;
  unint64_t v6 = malloc(v5 ^ 0xED1F365B);
  *(void *)(v3 + 568) = v6;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((507 * (v6 == 0LL)) ^ v0)) - 12LL))();
}

uint64_t sub_1886F5F10()
{
  unsigned int v5 = (void *)(v4[422] + v4[421] - 0x46568C5375769E87LL);
  v8.length = (v1 ^ 0x5F7FF9EF6DBFFEE5LL) + ((2LL * v1) & 0xDB7FFDCALL) - 0x5F7FF9EF6DBFFEE5LL;
  *unsigned int v5 = 0LL;
  v5[1] = v8.length;
  v8.location = 0LL;
  CFDataGetBytes(*(CFDataRef *)(v2 + 73), v8, *(UInt8 **)(v3 + 568));
  unint64_t v6 = sub_18872562C(v1, 0x32u, 2049918501);
  v4[442] = v6;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(442 * (((19 * (v0 ^ 0xF5) + 1) ^ (v6 == 0)) & 1)) ^ v0 ^ 0x2F]
                            - 8LL))();
}

uint64_t sub_1886F5FF4()
{
  unint64_t v6 = (v3 ^ 0xAB53EFDFCFFFF377LL) + (v2 & 0x19FFFE6EELL) + 0x54AC10210115C883LL;
  *(void *)(v4 + 272) = v6;
  *(_BYTE *)(v4 + 287) = v6 < 0xD115BBFA;
  unint64_t v7 = (uint64_t (*)(void))(*(void *)(v0 + 8LL * ((61 * (v6 != 3507862522)) ^ v1)) - (v1 - 178) + 30LL);
  LODWORD(STACK[0xB34]) = v1;
  v5[197] = 0xE6F33ABA73F893LL;
  v5[198] = 0xCCDBE4E70573A43LL;
  v5[199] = 0x5A3A20D5AD109256LL;
  return v7();
}

uint64_t sub_1886F60B0()
{
  LODWORD(STACK[0x45C]) = v0;
  return ((uint64_t (*)(void, void))(*(void *)(v1
                                                             + 8LL
                                                             * ((410
                                                               * (((unsigned __int16)(LOWORD(STACK[0x185C]) ^ (((v2 + 30675) & 0x8ABF) + 25494)) ^ 0xF8BCu) > 1)) ^ (v2 - 1606846509) & 0x5FC68ABFu))
                                                 - 4LL))( *(void *)(v3 + 568),  *(void *)(v3 + 568));
}

uint64_t sub_1886F60F4()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 73));
  uint64_t v4 = v3 ^ 0x6FDB7FBDF7FEF779LL;
  unint64_t v5 = (2 * v3) & 0xDFB6FF7BEFFDEEF2LL;
  CFTypeID TypeID = CFNumberGetTypeID();
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((1022
                                * (v4
                                 + v5
                                 + (((v0 - 232) | 0x16u) ^ TypeID ^ 0x81094608006208FCLL)
                                 - ((2 * TypeID) & 0xFDED73EFFF3BEFFALL) == 0xF0E4C5C5F860FF7BLL)) ^ v0)))();
}

uint64_t sub_1886F61A4()
{
  Boolean Value = CFNumberGetValue(*(CFNumberRef *)(v1 + 73), kCFNumberSInt64Type, &STACK[0x298]);
}

uint64_t sub_1886F6208()
{
  LODWORD(STACK[0x27C]) = 1896455930;
  uint64_t v2 = malloc(8uLL);
  *(void *)(v1 + 56) = v2;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(71 * ((((v0 ^ 0xF2) + 81) ^ (v2 == 0LL)) & 1)) ^ v0]
                            - 12LL))();
}

uint64_t sub_1886F6264()
{
  uint64_t v4 = *(_BYTE **)(v2 + 56);
  *uint64_t v4 = ((v0 ^ 0x4E) + HIBYTE(STACK[0x298]) - ((STACK[0x298] >> 55) & 0x6E) + 54) ^ 0x37;
  v4[1] = (HIWORD(STACK[0x298]) - ((STACK[0x298] >> 47) & 0x7C) + 62) ^ 0x3E;
  v4[2] = (((unsigned __int16)WORD2(STACK[0x298]) >> 8) - ((STACK[0x298] >> 39) & 0x6A) - 75) ^ 0xB5;
  v4[3] = (HIDWORD(STACK[0x298]) - ((STACK[0x298] >> 31) & 0x4E) + 39) ^ 0x27;
  v4[4] = (HIBYTE(LODWORD(STACK[0x298])) - ((LODWORD(STACK[0x298]) >> 23) & 0x46) - 93) ^ 0xA3;
  v4[5] = (HIWORD(LODWORD(STACK[0x298])) - ((LODWORD(STACK[0x298]) >> 15) & 0xCE) - 25) ^ 0xE7;
  v4[6] = (BYTE1(LODWORD(STACK[0x298])) - ((LODWORD(STACK[0x298]) >> 7) & 0xC6) - 29) ^ 0xE3;
  v4[7] = (LOBYTE(STACK[0x298]) - ((2 * LOBYTE(STACK[0x298])) & 0xBC) - 34) ^ 0xDE;
  unint64_t v5 = sub_18872562C(8LL, 0x32u, -1324549896);
  *(void *)(v1 + 217) = v5;
  unint64_t v6 = (uint64_t (*)(void))qword_18A26FDB0[(229 * (v5 == 0)) ^ v0];
  LODWORD(STACK[0x684]) = v0;
  v3[47] = 0xF9462F8CB3A0719LL;
  v3[48] = 0x30D525C30E3FCDF8LL;
  v3[49] = 0x7EC183AE525B144ELL;
  return v6();
}

uint64_t sub_1886F6424()
{
  LODWORD(STACK[0x46C]) = v0;
  unint64_t v5 = *(void *)(v4 + 56);
  unint64_t v6 = (uint64_t (*)(unint64_t))(*(void *)(v1
                                                            + 8LL
                                                            * ((432
                                                              * ((((((v2 + 39) | 0x291) - 643) | 0x148) ^ 0x5CEDFE8D)
                                                               - 279007320
                                                               + ((8 << ((((v2 + 39) | 0x91) - 110) ^ (v3 - 1))) & 0x1FFF6) != 1280094115)) ^ ((v2 + 39) | 0x291)))
                                                - 4LL);
  STACK[0x220] = v5;
  return v6(v5);
}

uint64_t sub_1886F6464()
{
  return ((uint64_t (*)(void))qword_18A26FDB0[(158 * (STACK[0x22D8] != 0)) ^ (v0 + 1477978781) & 0xA7E7D67F])();
}

void sub_1886F6498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3[65];
  v3[66] = v4;
  uint64_t v6 = v3[63];
  uint64_t v5 = v3[64];
  v3[67] = v5;
  v3[68] = v6;
  LODWORD(v6) = STACK[0x704];
  LODWORD(STACK[0x738]) = STACK[0x704];
  uint64_t v7 = (v6 - 355);
  LOBYTE(v4) = *(_BYTE *)(v4 + v3[433] - 0x6F065D875E38C12BLL);
  uint64_t v8 = v7 + v5 + *(void *)(v2 + 88) - 0x64E58E1B0A271B1DLL;
  unsigned int v9 = 83590351 * ((v8 ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4))) & 0x7FFFFFFF);
  unint64_t v10 = 83590351 * (v9 ^ HIWORD(v9));
  char v11 = byte_188744BB0[v10 >> 24];
  LODWORD(STACK[0x73C]) = v7;
  LOBYTE(STACK[0x5C3]) = v11 ^ v4 ^ byte_18873E440[v10 >> 24] ^ byte_18873F490[(v10 >> 24) + 1] ^ v10 ^ (-127 * BYTE3(v10));
  v3[20] = *(void *)(a2 + 8LL * ((int)v6 + 963)) - 8LL;
  v3[21] = v8;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_1886F658C()
{
  uint64_t v1 = v0[67] + 1LL;
  uint64_t v2 = v0[68];
  int v3 = (21 * ((unint64_t)(v2 - 0x6958EF79FA45CA8ELL) < 8)) ^ LODWORD(STACK[0x738]);
  LODWORD(STACK[0x704]) = STACK[0x738];
  uint64_t v4 = v0[66] + 1LL;
  uint64_t v5 = (uint64_t (*)(void))(qword_18A26FDB0[v3] - 8LL);
  v0[63] = v2 + 1;
  v0[64] = v1;
  v0[65] = v4;
  return v5();
}

uint64_t sub_1886F65F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = LODWORD(STACK[0x278])++;
  *(_DWORD *)(v8 + 3208) = v12 + 1823406260;
  uint64_t v13 = (*(_DWORD *)(v9 + 3160) - 638615273);
  v10[12] = *(void *)(a6 + 8LL * (v6 + 1771230042));
  LODWORD(STACK[0x578]) = v6 + 294614864;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = (v6 + 294614864) | 0x60;
  LODWORD(STACK[0x590]) = v6 + 294614876;
  v10[14] = v13;
  v10[17] = 435556348LL;
  *(void *)(v7 + 448) = &STACK[0x570];
  *(_DWORD *)(v11 - 192) = 1431737413 * ((2 * ((v11 - 200) & 0x4D99BC38) - (v11 - 200) + 845562823) ^ 0x8C38DCD5)
                         + 40706419
                         + v6;
  sub_1886DF534(v11 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v11 - 188)] - 8LL))();
}

uint64_t sub_1886F66E4()
{
  int v7 = STACK[0x228];
  if (v2 >= v3) {
    int v8 = *(_DWORD *)(v6 + 3160) + 1;
  }
  else {
    int v8 = v4;
  }
  *(_DWORD *)(v6 + 3160) = v8;
  int v9 = v1 ^ (v1 >> 11);
  int v10 = ((v9 << 7) ^ 0x7C43AB00) - ((2 * ((v9 << 7) ^ 0x7C43AB00)) & 0x164CAD00) - 1960421737;
  unsigned int v11 = ((v10 & 0x9D2C5680 ^ 0x85200080)
       + (v10 & 0x15205480 ^ 0x50437D63)
       - ((v10 & 0x9D2C5680 ^ 0x85200080) & 0x15205480)) ^ 0x19675FEB;
  unsigned int v12 = (391702886 - (v11 | 0x1758E966) + (v11 | 0xE8A71699)) ^ v9;
  unsigned int v13 = (((v12 << 15) ^ 0xF2E38000) - ((2 * ((v12 << 15) ^ 0xF2E38000)) & 0xE8ED0000) + 1953953606) & 0xEFC60000 ^ 0xC9020000;
  unsigned int v14 = (((v13 - ((2 * v13) & 0x84080000) - 1037811172) & 0x3D8A0000 ^ 0x148A4079 | (v13
                                                                                   - ((2 * v13) & 0x84080000)
                                                                                   - 1037811172) & 0xC2740000)
       - 1) ^ v12;
  *(_BYTE *)(v5 + (v7 - 2094561287)) = ((v14 ^ (v14 >> 18) ^ 0x52)
                                                    + 52
                                                    - ((2 * (v14 ^ (v14 >> 18) ^ 0x52)) & 0x62)
                                                    + 125) ^ 0x4D;
  return (*(uint64_t (**)(uint64_t))(v0
                                            + 8LL
                                            * ((812
                                              * (v7
                                               - (((v14 ^ (v14 >> 18) ^ 0x52)
                                                                  + 52
                                                                  - ((2 * (v14 ^ (v14 >> 18) ^ 0x52)) & 0x62)
                                                                  + 125) != 0x4D) == 2094561286)) ^ 0x11E)))(639156063LL);
}

void sub_1886F6864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v6[74];
  v6[75] = v7;
  int v8 = STACK[0x75C];
  LODWORD(STACK[0x770]) = STACK[0x75C];
  unsigned int v9 = (v8 - 1771062425) & 0xFFFD6DEB;
  LODWORD(STACK[0x774]) = v9;
  LODWORD(STACK[0x778]) = v9 - 556932904;
  v7 -= 1966804502LL;
  LOBYTE(STACK[0x77F]) = *(_BYTE *)(v6[436] + v7);
  uint64_t v10 = **(void **)(v5 + 256) + v7;
  v6[78] = v10;
  v6[72] = v10;
  v6[70] = *(void *)(a5 + 8LL * (v8 + 225));
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_1886F68D8()
{
  unsigned int v0 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFD0E9218CLL)) ^ LODWORD(STACK[0x780])) & 0x7FFFFFFF);
  unint64_t v1 = 83590351 * ((v0 >> (LODWORD(STACK[0x778]) ^ 0x33)) ^ v0);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(2017
                                             * ((LOBYTE(STACK[0x77F]) - 20) != (byte_18873EA80[v1 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_18873FBD0[v1 >> 24] ^ byte_18873F6A0[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0x770])]
                            - 8LL))();
}

uint64_t sub_1886F69B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5
                              + 8LL
                              * ((29
                                * ((((((LODWORD(STACK[0x774]) + 1771230453) | 0x26) - 1196882552) ^ (**(void **)(v5 + 256) == 0LL)) & 1) == 0)) ^ ((LODWORD(STACK[0x774]) + 1771230453) | 0x26))))();
}

uint64_t sub_1886F6AA4@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  uint64_t v5 = (v2 + a2) ^ (a2 + 564);
  uint64_t v6 = (v2 + a2) | 0x9045204A;
  uint64_t v7 = *(void *)(a1 + 8LL * (v2 ^ ((4 * ((v3 & 1) == 0)) & 0xF7 | (8 * ((v3 & 1) == 0)))));
  STACK[0x368] = *(void *)(v4 + 3480);
  return ((uint64_t (*)(void))(v7 - (v5 ^ 0x966D2C1FLL ^ v6)))();
}

uint64_t sub_1886F6B04( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t CString = CFStringGetCString(a1, (char *)STACK[0x1398], v18, SystemEncoding);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(1238 * ((((2 * CString) & 0x5E) + ((((v17 + 42) | 0x11) - 98) ^ CString)) != 175)) ^ v17] - 12LL))( CString,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17);
}

uint64_t sub_1886F6B7C()
{
  unsigned int v2 = LODWORD(STACK[0x1390]) - (((LODWORD(STACK[0x1390]) << ((v0 + 59) ^ 0x10)) + 570691146) & 0xE2133DE4) - 2113165801;
  LODWORD(STACK[0x4E4]) = v2;
  unint64_t v3 = sub_18872562C(v2 ^ 0x71099EF2, 0x32u, -150729865);
  *(void *)(v1 + 3648) = v3;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(831 * (v3 != 0)) ^ v0] - 12LL))();
}

uint64_t sub_1886F6C08()
{
  uint64_t v4 = (v1 ^ 0x24Du) - 390;
  unint64_t v5 = v3[464] - 0x63F1F6FD2DCED916LL + v4;
  *(void *)(v2 + 352) = v5;
  *(_BYTE *)(v2 + 367) = v5 < 0xC12F209C;
  uint64_t v6 = *(void *)(v0 + 8LL * ((158 * (v5 == 3241091228)) ^ v1 ^ 0x24D));
  LODWORD(STACK[0x8B4]) = v4;
  LODWORD(STACK[0xB74]) = v1 ^ 0x24D;
  v3[205] = 0x24CED77CFC24FD0DLL;
  v3[206] = 0x12BE31F57B2D0D6ELL;
  v3[207] = 0x5EDEBCB257407475LL;
  return ((uint64_t (*)(void))(v6 - 4))();
}

void sub_1886F6CC8()
{
  int v1 = (LODWORD(STACK[0x8B4]) - 850983447) & 0x32B8F951;
  LODWORD(STACK[0x8B8]) = v1;
  unsigned int v2 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (*(_DWORD *)(v0 + 3712)
                                                                             + *(_DWORD *)(v0 + 3648)
                                                                             + 285345572)) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = byte_18873E860[(v1 - 15) + (v3 >> 24)] ^ byte_188744CB0[v3 >> 24] ^ byte_188744DB0[v3 >> 24] ^ v3 ^ (23 * BYTE3(v3));
  JUMPOUT(0x18870911CLL);
}

void sub_1886F6DA0()
{
  int v1 = LODWORD(STACK[0x1874]) - ((2 * LODWORD(STACK[0x1874]) + 167442930) & 0x1E705690) + 1144367169;
  LODWORD(STACK[0x7C4]) = v1;
  LODWORD(STACK[0x7C8]) = LODWORD(STACK[0x14EC]) - 16443621;
  unsigned int v2 = 83590351
     * (((LODWORD(STACK[0x7AC]) + *(_DWORD *)(v0 + 656) - 638738031) ^ *(_DWORD *)(qword_18C724710
                                                                                 + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = HIBYTE(v1) ^ byte_18873E340[v3 >> 24] ^ byte_18873FAC0[(v3 >> 24) + 1] ^ byte_188743C60[v3 >> 24] ^ v3 ^ (-103 * BYTE3(v3)) ^ 0x8F;
  JUMPOUT(0x1886F4BF8LL);
}

void sub_1886F6ECC()
{
  char v1 = STACK[0x7C6];
  LODWORD(STACK[0x7CC]) = LODWORD(STACK[0x14EC]) + 403504196;
  unsigned int v2 = 83590351
     * (((LODWORD(STACK[0x7C8]) + *(_DWORD *)(v0 + 656) - 214212350) ^ *(_DWORD *)(qword_18C724710
                                                                                 + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = v1 ^ byte_18873E340[v3 >> 24] ^ byte_18873FAC0[(v3 >> 24) + 1] ^ byte_188743C60[v3 >> 24] ^ v3 ^ (-103 * BYTE3(v3)) ^ 0x38;
  JUMPOUT(0x1886F4BF4LL);
}

void sub_1886F6FC8()
{
  char v1 = STACK[0x7C5];
  unint64_t v2 = STACK[0x290];
  *(void *)(v0 + 672) = STACK[0x290];
  LODWORD(STACK[0x7D0]) = LODWORD(STACK[0x14EC]) - 9597952;
  unsigned int v3 = 83590351
     * (((LODWORD(STACK[0x7CC]) + v2 - 634160166) ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x5C3]) = v1 ^ byte_18873E340[v4 >> 24] ^ byte_18873FAC0[(v4 >> 24) + 1] ^ byte_188743C60[v4 >> 24] ^ v4 ^ (-103 * BYTE3(v4)) ^ 0x2B;
  JUMPOUT(0x1886F4BF8LL);
}

void sub_1886F70C0()
{
  char v1 = STACK[0x7C4];
  LODWORD(STACK[0x7BC]) = LODWORD(STACK[0x14EC]) + 1707620083;
  unsigned int v2 = 83590351
     * (((LODWORD(STACK[0x7D0]) + *(_DWORD *)(v0 + 672) - 221058017) ^ *(_DWORD *)(qword_18C724710
                                                                                 + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = v1 ^ byte_18873E340[v3 >> 24] ^ byte_18873FAC0[(v3 >> 24) + 1] ^ byte_188743C60[v3 >> 24] ^ v3 ^ (-103 * BYTE3(v3)) ^ 0x48;
  JUMPOUT(0x1886F4BF4LL);
}

uint64_t sub_1886F71C4()
{
  LODWORD(STACK[0x364]) = STACK[0x7BC];
  int v0 = STACK[0x310];
  LODWORD(STACK[0x7C0]) = STACK[0x310];
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v0 != 1258455831) | (4 * (v0 != 1258455831))) ^ LODWORD(STACK[0x794])]
                            - 4LL))();
}

void sub_1886F7204()
{
  int v2 = STACK[0x79C];
  *(void *)(v0 + 168) = STACK[0x308];
  unsigned int v3 = LODWORD(STACK[0x7C0]) + 150648796;
  LODWORD(STACK[0x16D8]) = v3;
  *(_BYTE *)(v0 + 183) = v3 < 0x53FD3AF3;
  int v4 = STACK[0x7BC];
  LODWORD(STACK[0x924]) = v2;
  LODWORD(STACK[0x928]) = v4;
  LODWORD(STACK[0x92C]) = 552694250;
  unint64_t v5 = LODWORD(STACK[0x92C]);
  LODWORD(STACK[0x930]) = v5;
  LODWORD(STACK[0x934]) = STACK[0x928];
  int v6 = STACK[0x924];
  LODWORD(STACK[0x938]) = STACK[0x924];
  LODWORD(STACK[0x93C]) = (v6 - 17995363) & 0x977FBFEB;
  unint64_t v7 = (v5 | ((unint64_t)(v5 < 0x20F171EA) << 32)) + *(void *)(v0 + 168);
  *(void *)(v1 + 1072) = v7 - 552694250;
  *(void *)(v1 + 576) = v7 - 0x5A72C1CEC215D1ADLL;
  JUMPOUT(0x18871088CLL);
}

uint64_t sub_1886F7258(uint64_t a1, uint64_t a2)
{
  int v5 = STACK[0x798];
  uint64_t v6 = v3[84] - 1938276051LL;
  unint64_t v7 = (LODWORD(STACK[0x7BC]) | ((unint64_t)(LODWORD(STACK[0x7BC]) < 0x7387BED3uLL) << 32)) + v6;
  int v8 = v2 - LODWORD(STACK[0x14EC]) - 1149654221;
  unsigned int v9 = (uint64_t (*)(void))(*(void *)(a2 + 8LL * (LODWORD(STACK[0x798]) + 1771229888)) - 12LL);
  v3[12] = *(void *)(a2 + 8LL * (LODWORD(STACK[0x798]) + 1771230056));
  LODWORD(STACK[0x578]) = v8 + 473608700;
  v3[18] = v7;
  v3[19] = (v2 | ((unint64_t)(v2 < 0x7387BED3) << 32)) + v6;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  *(_DWORD *)(v4 - 192) = 1431737413 * ((v4 - 2140286675 - 2 * ((v4 - 200) & 0x806DD1F5)) ^ 0x3E334EE7) + 40706419 + v5;
  sub_1886DF534(v4 - 200);
  return v9();
}

uint64_t sub_1886F7260@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
}

uint64_t sub_1886F72C0()
{
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * ((28
}

uint64_t sub_1886F72D0()
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
                                        * ((28
}

uint64_t sub_1886F7300()
{
  uint64_t v2 = 133 * (v0 ^ 0x966D2D49);
  unint64_t v3 = sub_18872562C(9LL, 0x32u, -833641632);
  uint64_t v4 = qword_18A26FDB0[((v3 != 0) * (v0 + 1771230377)) ^ (v0 + 1771230131)];
  *(void *)(v1 + 3608) = v3;
  LODWORD(STACK[0xF2C]) = v2;
  *(void *)(v1 + 2592) = 1946437536LL;
  return ((uint64_t (*)(void))(v4 - v2 + 262))();
}

uint64_t sub_1886F7314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_1886F735C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * (int)(((v6 + ((v5 - 554747484) & 0xB77DEF4F) + 60)
                                               * (*(void *)(v7 + 88) != 0LL)) ^ v5))
                            - 12LL))();
}

uint64_t sub_1886F739C(unint64_t a1)
{
  *(void *)(v2 + 88) = *(void *)(v4 + 4024);
  **(_DWORD **)(v3 + 72) = 1896455910;
  LODWORD(STACK[0x2258]) = 438484907;
  int v5 = off_18C723C78[0];
  *(_BYTE *)(v2 + 345) = *off_18C723C78[0] - 95;
  *(_BYTE *)(v2 + 346) = v5[1] - 95;
  *(_BYTE *)(v2 + 347) = v1 + 119 + v5[2] - 33;
  *(_BYTE *)(v2 + 348) = v5[3] - 95;
  *(_BYTE *)(v2 + 349) = v5[4] - 95;
  *(_BYTE *)(v2 + 350) = v5[5] - 95;
  *(_BYTE *)(v2 + 351) = v5[6] - 95;
  *(_BYTE *)(v2 + 352) = v5[7] - 95;
  *(_BYTE *)(v2 + 353) = v5[8] - 95;
  *(_BYTE *)(v2 + 354) = v5[9] - 95;
  *(_BYTE *)(v2 + 355) = v5[10] - 95;
  *(_BYTE *)(v2 + 356) = v5[11] - 95;
  *(_BYTE *)(v2 + 357) = v5[12] - 95;
  *(_BYTE *)(v2 + 358) = v5[13] - 95;
  *(_BYTE *)(v2 + 359) = v5[14] - 95;
  *(_BYTE *)(v2 + 360) = v5[15] - 95;
  *(_BYTE *)(v2 + 361) = v5[16] - 95;
  *(_BYTE *)(v2 + 362) = v5[17] - 95;
  *(_BYTE *)(v2 + 363) = v5[18] - 95;
  *(_BYTE *)(v2 + 364) = v5[19] - 95;
  *(_BYTE *)(v2 + 365) = v5[20] - 95;
  *(_BYTE *)(v2 + 366) = v5[21] - 95;
  *(_BYTE *)(v2 + 367) = off_18C723C78[0][22] - 95;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v7 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x2361], SystemEncoding);
  *(void *)(v4 + 3984) = v7;
  return ((uint64_t (*)(void))qword_18A26FDB0[(119 * (v7 != 0LL)) ^ (v1 + 1771230423)])();
}

uint64_t sub_1886F756C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (v6 - v5 - 1219);
  uint64_t v10 = MGCopyAnswer();
  *(void *)(v7 + 3736) = v10;
}

uint64_t sub_1886F75C4()
{
  unint64_t v2 = STACK[0x368];
  STACK[0x1588] = STACK[0x368];
  uint64_t v3 = (char *)&STACK[0x19A0] + v2;
  STACK[0x1590] = (unint64_t)&STACK[0x19A0] + v2;
  v2 += 64LL;
  STACK[0x1598] = v2;
  STACK[0x368] = v2;
  STACK[0x15A0] = 16LL * (void)v3;
  STACK[0x15A8] = ((16 - 16LL * (void)v3) & ((((_DWORD)v0 - 1200290708) ^ 0x18Cu) - 628LL) ^ 0xEEFF7EB66FFEFF7FLL)
                + 2 * ((16 - 16LL * (void)v3) & ((((_DWORD)v0 - 1200290708) ^ 0x18Cu) - 628LL))
                + 0x73FBFFEFF4E3A7FFLL;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)STACK[0x13A8]);
  uint64_t v5 = v4 ^ 0x7DDEFEF7E6FFEFFBLL;
  unint64_t v6 = (2 * v4) & 0xFBBDFDEFCDFFDFF6LL;
  CFTypeID TypeID = CFStringGetTypeID();
  unint64_t v8 = v5 + (TypeID ^ 0x8604280608B0EA0LL) + v6 - ((2 * TypeID) & 0xEF3F7AFF3EE9E2BELL) + 1;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (int)((v8 | (4 * v8)) ^ (v0 - 1200291041))) - 8LL))();
}

uint64_t sub_1886F76FC()
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(v2 + 3736));
  unint64_t v5 = ((Length << (((v0 + 24) | 0x10) ^ 0x31u)) & 0xCDFAEEF9FDB9F1BELL) + (Length ^ 0xE6FD777CFEDCF8DFLL);
  *(void *)(v3 + 169) = v5;
  unint64_t v6 = malloc((v0 - 230) + 0x1902888301230500LL + v5);
  *(void *)(v3 + 177) = v6;
  STACK[0x3E0] = (unint64_t)v6;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((1831 * (v6 != 0LL)) ^ v0)) - 12LL))();
}

uint64_t sub_1886F77AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t CString = CFStringGetCString(*(CFStringRef *)(v66 + 3736), (char *)STACK[0x15D8], v64, SystemEncoding);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 + 8LL * ((711 * ((((2 * CString) & 0x5E) + (CString ^ 0xAF)) != 175)) ^ v63)) - (((v63 - 2043934958) | 0x10412509u) ^ 0x966D2D4FLL)))( CString,  1771229876LL,  v65,  v69,  v70,  v71,  v72,  v73,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_1886F784C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v68 = v64 - 2;
  int v69 = (v66 + v64 - 2 + 475838808) & 0x4D3619BE;
  uint64_t v70 = v63 + *(void *)(v65 + 169);
  uint64_t v71 = v70 + 545;
  unint64_t v72 = v70 + 546;
  if (v71 >= 0) {
    unint64_t v72 = v71;
  }
  int v73 = (v72 >> 1) - ((v69 + 499659922) & (2 * (v72 >> 1))) + 249830161;
  LODWORD(STACK[0x3B4]) = v73 ^ 0x7FED85E3;
  unint64_t v74 = sub_18872562C(v73 ^ 0xEE41B11u, 0x32u, -1934707656);
  *(void *)(v67 + 4096) = v74;
  return ((uint64_t (*)(unint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(30 * (v74 == 0)) ^ v68] - 4LL))( v74,  1771229876LL,  qword_18A26FDB0,  v75,  v76,  v77,  v78,  v79,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_1886F7910( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8LL * ((62 * (v64 == ((8 * (v63 ^ 0x186) - 1762673345) & 0xFF7D6F5B ^ 0xE764B3B9))) ^ v63)) - 12LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_1886F796C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = (8 * v63) ^ 0x4B0;
  int v68 = v65 ^ v64;
  if ((v65 ^ v64) <= 1) {
    int v68 = 1;
  }
  LODWORD(STACK[0x1704]) = v68 + v67 + 1987180271;
  LODWORD(STACK[0x1344]) = 1987180576;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8LL * ((688 * (((v67 + 27) ^ (*(_BYTE *)(*(void *)(v66 + 177) + ((1987180576 << (((v67 + 64) | 0xF) - 126)) + 320606144)) == 0)) & 1)) ^ v67)) - 4LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_1886F799C()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 3736));
  uint64_t v4 = v3 ^ 0x69FE7EFCE6FBF7B5LL;
  unint64_t v5 = (2 * v3) & 0xD3FCFDF9CDF7EF6ALL;
  CFTypeID TypeID = CFDataGetTypeID();
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((23
                                * (v4
                                 + (TypeID ^ 0xC28411C614B03421LL)
                                 + v5
                                 - ((((v0 - 1308807365) & 0x4E02CFEB ^ 0x7AF7DC73D69F97BALL) + ((v0 - 355) | 0x8Au)) & (2 * TypeID)) == 0x2C8290C2FBAC2BD6LL)) ^ v0)))();
}

uint64_t sub_1886F7A60()
{
  int Length = CFDataGetLength(*(CFDataRef *)(v2 + 3736));
  unsigned int v4 = Length - (((2 * (v0 ^ 0xBA)) ^ 0xDA3E6E94) & (2 * Length)) - 316721573;
  LODWORD(STACK[0x1494]) = v4 ^ 0x9C16A8A9;
  LODWORD(STACK[0x3B4]) = v4 ^ 0x9C16A8A9;
  unint64_t v5 = malloc(v4 ^ 0xED1F365B);
  *(void *)(v2 + 3976) = v5;
}

uint64_t sub_1886F7AF0()
{
  int v4 = (v0 - 427) | 0x2A4;
  unint64_t v5 = (void *)(STACK[0x15A8] + STACK[0x1590] - 0x62FB7EA664E2A79DLL + ((v4 + 209321829) | 0x4005C064u) - 1283441230);
  v8.length = (v1 ^ 0x7FCD1EEF8DEFCFFALL) + ((2LL * v1) & 0x11BDF9FF4LL) - 0x7FCD1EEF8DEFCFFALL;
  *unint64_t v5 = 0LL;
  v5[1] = v8.length;
  v8.location = 0LL;
  CFDataGetBytes(*(CFDataRef *)(v3 + 3736), v8, *(UInt8 **)(v3 + 3976));
  unint64_t v6 = sub_18872562C(v1, 0x32u, -632481085);
  *(void *)(v3 + 3544) = v6;
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * ((469 * (v6 != 0)) ^ v4)) - 4LL))();
}

uint64_t sub_1886F7BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v8 = (v5 & 0xFFFB8E36) - 0x5FDFB1AA337E04AELL + (v6 ^ v4 ^ 0x5FDFB1AA33820576LL);
  *(void *)(v7 + 3400) = v8;
  *(_BYTE *)(v7 + 3411) = v8 < 0x4C7FC26D;
  unsigned int v9 = (uint64_t (*)(void))(*(void *)(a3
                                     + 8LL
                                     * ((202 * (((((v4 - v8) | (v8 - v4)) >> ((v3 | 0x1Au) + 32)) & 1) == 0)) ^ (v3 + 617)))
                         - 4LL);
  LODWORD(STACK[0x116C]) = v4 ^ 0x4C7FC003;
  *(void *)(v7 + 3168) = 0x7033BD7DBF5D0F01LL;
  *(void *)(v7 + 3176) = 0x3C3A167287728675LL;
  *(void *)(v7 + 3184) = 0x5087DEAA734A18DDLL;
  return v9();
}

void sub_1886F7CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3[398];
  v3[399] = v4;
  uint64_t v5 = v3[397];
  v3[400] = v5;
  v3[401] = v3[396];
  int v6 = STACK[0x116C];
  LODWORD(STACK[0x11A4]) = STACK[0x116C];
  uint64_t v7 = (v6 - 591);
  LODWORD(STACK[0x11A8]) = v7;
  unint64_t v8 = v3[443] + v5 + (v7 ^ 0xC3C5E98D788D7994LL);
  LODWORD(v7) = 83590351 * ((v8 ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4))) & 0x7FFFFFFF);
  unint64_t v9 = 83590351 * (v7 ^ WORD1(v7));
  LOBYTE(STACK[0x5C3]) = byte_188744BB0[v9 >> 24] ^ *(_BYTE *)(v4 + v3[497] - 0x5087DEAA734A18DDLL) ^ byte_18873E440[v9 >> 24] ^ byte_18873F490[(v9 >> 24) + 1] ^ v9 ^ (-127 * BYTE3(v9));
  v3[20] = *(void *)(a3 + 8LL * (v6 ^ 0x7E2)) - 8LL;
  v3[21] = v8;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_1886F7DDC()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 3736));
  unint64_t v4 = v3 ^ 0xFDFAFFBFE4BA6F31LL;
  unint64_t v5 = (2 * v3) & 0xFBF5FF7FC974DE62LL;
  CFTypeID TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((703
                                          * (v4
                                           + v5
                                           + (TypeID ^ 0x8001CA105472084BLL)
                                           + (v0 ^ 0x14Eu)
                                           + 317
                                           - ((2 * TypeID) & 0xFFFC6BDF571BEF68LL) == 0x7DFCC9D0392C799ELL)) ^ v0))
                            - 4LL))();
}

uint64_t sub_1886F7E90()
{
  int Value = CFNumberGetValue(*(CFNumberRef *)(v3 + 3736), kCFNumberSInt64Type, &STACK[0x268]);
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (v0 ^ v1 ^ (679
}

uint64_t sub_1886F7EEC()
{
  LODWORD(STACK[0x3B4]) = 1896455930;
  uint64_t v3 = malloc(8uLL);
  *(void *)(v2 + 368) = v3;
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (int)(((((((((v0 - 70) & 0x68) - 73) ^ 0x9D) + 1) ^ (v3 == 0LL)) & 1)
                                               * ((((v0 + 1898340026) & 0x8ED9A368) + 1174881463) & 0xB9F8B97C ^ 0x109)) | (v0 + 1898340026) & 0x8ED9A368))
                            - 12LL))();
}

uint64_t sub_1886F7F74()
{
  unint64_t v4 = *(_BYTE **)(v2 + 368);
  *unint64_t v4 = (HIBYTE(STACK[0x268]) - ((STACK[0x268] >> 55) & 0xD6) + ((v0 - 30) ^ 0xDC) + 41) ^ 0xEB;
  v4[1] = (HIWORD(STACK[0x268]) - ((STACK[0x268] >> 47) & 0xD4) - 22) ^ 0xEA;
  v4[2] = (((unsigned __int16)WORD2(STACK[0x268]) >> 8) - ((STACK[0x268] >> 39) & 0xC8) - 28) ^ 0xE4;
  v4[3] = (HIDWORD(STACK[0x268]) - ((STACK[0x268] >> 31) & 0x90) + 72) ^ 0x48;
  v4[4] = (HIBYTE(LODWORD(STACK[0x268])) - ((LODWORD(STACK[0x268]) >> 23) & 0x26) + 19) ^ 0x13;
  v4[5] = (HIWORD(LODWORD(STACK[0x268])) - ((LODWORD(STACK[0x268]) >> 15) & 0x28) - 108) ^ 0x94;
  v4[6] = (BYTE1(LODWORD(STACK[0x268])) - ((LODWORD(STACK[0x268]) >> 7) & 0x9C) + 78) ^ 0x4E;
  v4[7] = (LOBYTE(STACK[0x268]) - ((2 * LOBYTE(STACK[0x268])) & 0xC0) - 32) ^ 0xE0;
  unint64_t v5 = sub_18872562C(8LL, 0x32u, 1449183640);
  v3[468] = v5;
  int v6 = (uint64_t (*)(void))(*(void *)(v1 + 8LL * ((114 * (v5 == 0)) ^ v0)) - 12LL);
  LODWORD(STACK[0xE2C]) = v0;
  v3[292] = 0x120A1B98F216DEA9LL;
  v3[293] = 0x18C6D2B65AD562FELL;
  v3[294] = 0x6BAB18BE86E856EDLL;
  return v6();
}

void sub_1886F814C()
{
  uint64_t v2 = *(void *)(v1 + 2352);
  *(void *)(v1 + 2360) = v2;
  uint64_t v3 = *(void *)(v1 + 2344);
  *(void *)(v1 + 2368) = v3;
  *(void *)(v1 + 2376) = *(void *)(v1 + 2336);
  int v4 = STACK[0xE2C];
  LODWORD(STACK[0xE64]) = STACK[0xE2C];
  int v5 = 10 * (v4 ^ 0x13F);
  LODWORD(STACK[0xE68]) = v5;
  unsigned int v6 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v3 + *(_DWORD *)(v1 + 3744) - 1523933950)) & 0x7FFFFFFF);
  unint64_t v7 = 83590351 * (v6 ^ HIWORD(v6));
  LOBYTE(STACK[0x5C3]) = byte_188744BB0[v7 >> (v5 ^ 6u)] ^ *(_BYTE *)(v2 + *(void *)(v0 + 368) - 0x6BAB18BE86E856EDLL) ^ byte_18873E440[v7 >> (v5 ^ 6u)] ^ byte_18873F490[(v7 >> (v5 ^ 6u)) + 1] ^ v7 ^ (-127 * (v7 >> (v5 ^ 6u)));
  JUMPOUT(0x188710258LL);
}

uint64_t sub_1886F8248()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (((STACK[0x2260] != 0) * ((75 * (v0 ^ (v2 + 1))) ^ 0x22F)) ^ (v0 + 1771230402)))
                            - 12LL))();
}

uint64_t sub_1886F826C@<X0>(int a1@<W8>)
{
  int v2 = ((a1 ^ 0x44E2EA1B) - 1336730530) & 0x4FACE3FB;
  unint64_t v3 = sub_188725908(STACK[0x480] - 0x2061722DFEAF01F1LL);
  return ((uint64_t (*)(unint64_t))(qword_18A26FDB0[(53
                                                                    * (v1 == ((v2 - 1593241435) & 0x5EF6EF9F ^ 0x39F))) ^ v2]
                                                   - 4LL))(v3);
}

uint64_t sub_1886F8300@<X0>(int a1@<W8>)
{
  BOOL v4 = (char)(byte_18873E860[LODWORD(STACK[0xF70]) + 2] ^ byte_188744CB0[*(void *)(v3 + 2664)] ^ byte_188744DB0[*(void *)(v3 + 2664)] ^ (23 * LOBYTE(STACK[0xF86])) ^ LOBYTE(STACK[0xF77]) ^ LOBYTE(STACK[0xF6F])) >= (char)(v1 + ((a1 - 67) | 2) + 72);
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (((8 * v4) | (32 * v4)) ^ a1)) - 12LL))();
}

uint64_t sub_1886F839C()
{
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(v1
                                     + 8LL
                                     * ((1365
  LODWORD(STACK[0x810]) = v2 + v0 + 471 - 470;
  return v3();
}

void sub_1886F83D4(int a1@<W8>)
{
  if (LOBYTE(STACK[0xF87]) >= 0x67u) {
    unsigned int v5 = 1512497180;
  }
  else {
    unsigned int v5 = LODWORD(STACK[0xF88]) + (a1 ^ 0xCA4BCC27);
  }
  LODWORD(STACK[0x810]) = a1;
  LODWORD(STACK[0x814]) = v5;
  LODWORD(STACK[0x818]) = STACK[0x814];
  int v6 = STACK[0x810];
  LODWORD(STACK[0x81C]) = LODWORD(STACK[0x810]) ^ 0x7A071A2F;
  int v7 = v1 + v6;
  LODWORD(STACK[0x820]) = (v7 + 401) | 0x26A;
  LODWORD(STACK[0x824]) = v7 + 527;
  uint64_t v8 = **(void **)(v3 + 80)
     + (int)((LODWORD(STACK[0xF5C]) ^ 0xFFFDFF7E) + 128484 + ((2 * LODWORD(STACK[0xF5C])) & 0xFFFBFEFC) + 2719);
  v4[99] = v8;
  v4[72] = v8;
  v4[70] = *(void *)(v2 + 8LL * (v7 + 1229)) - 4LL;
  JUMPOUT(0x18871B8BCLL);
}

void sub_1886F8408()
{
  int v4 = LODWORD(STACK[0xF88]) + 1546051980;
  LODWORD(STACK[0x810]) = v0;
  LODWORD(STACK[0x814]) = v4;
  LODWORD(STACK[0x818]) = STACK[0x814];
  int v5 = STACK[0x810];
  LODWORD(STACK[0x81C]) = LODWORD(STACK[0x810]) ^ 0x7A071A2F;
  int v6 = v1 + v5;
  LODWORD(STACK[0x820]) = (v6 + 401) | 0x26A;
  LODWORD(STACK[0x824]) = v6 + 527;
  uint64_t v7 = **(void **)(v2 + 80)
     + (int)((LODWORD(STACK[0xF5C]) ^ 0xFFFDFF7E) + 128484 + ((2 * LODWORD(STACK[0xF5C])) & 0xFFFBFEFC) + 2719);
  *(void *)(v3 + 792) = v7;
  *(void *)(v3 + 576) = v7;
  JUMPOUT(0x18871B8B8LL);
}

uint64_t sub_1886F8424()
{
  uint64_t v4 = (v0 - 29);
  unint64_t v5 = ((2LL * (void)&STACK[0x4F8]) & 0xDC5F72F5AF3FF870LL)
     + 0x11D04685286003C6LL
     + ((v4 - 0x11D0468528600527LL) ^ (unint64_t)&STACK[0x4F8]);
  STACK[0x200] = ((v5 % 0x25) ^ 0xF27BFBFFF6767FEFLL) + 0xD84040009898021LL + ((2 * (v5 % 0x25)) & 0x5ELL);
  STACK[0x230] = STACK[0x490];
  STACK[0x240] = *(void *)(v3 + 3376) + *(void *)(v3 + 3368) - 0x46568C5375769E87LL;
  LODWORD(STACK[0x218]) = v2 - 2;
  return v6(2977863413LL);
}

uint64_t sub_1886F8574@<X0>(unsigned int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  *(_BYTE *)(a2 + (a4 - 1280094116)) = (((v5 ^ a1) >> (v6 - 68))
                                                    + (~((v5 ^ a1) >> (v6 - 68) << ((17 * (a5 ^ 0x57)) ^ 0xB8)) | 0x91)
                                                    + 56) ^ (a5 + 55);
  return ((uint64_t (*)(void))(*(void *)(v7
                                        + 8LL
                                        * ((241
                                          * (a4
                                           - ((((v5 ^ a1) >> (v6 - 68))
                                                              + (~((v5 ^ a1) >> (v6 - 68) << ((17 * (a5 ^ 0x57)) ^ 0xB8)) | 0x91)
}

uint64_t sub_1886F8AEC@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v4
                                        + 8LL
}

uint64_t sub_1886F8B30(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x228]) = a4;
  STACK[0x2238] = 0xB0399B8929312B56LL;
  LODWORD(STACK[0x4F8]) = *(_DWORD *)(v7 + 3208) - 1823406259;
  uint64_t v11 = *(unsigned int *)(v8 + 3160);
  v9[12] = *(void *)(v5 + 8 * ((v4 - 2128153733) ^ 0x1794206FLL));
  LODWORD(STACK[0x578]) = v4 - 2128153733;
  LODWORD(STACK[0x588]) = 0;
  v9[14] = v6;
  LODWORD(STACK[0x58C]) = (v4 - 2128153733) ^ 0x15;
  LODWORD(STACK[0x590]) = (v4 - 2128153733) ^ 0x99;
  v9[17] = v11;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  *(_DWORD *)(v10 - 192) = 1431737413
                         * ((((v10 - 200) | 0xCCC43128) - (v10 - 200) + ((v10 - 200) & 0x333BCED0)) ^ 0x729AAE3A)
                         + 40706419
                         + v4;
  sub_1886DF534(v10 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v10 - 188)] - 8LL))();
}

uint64_t sub_1886F8C30()
{
  int v1 = 3 * (v0 ^ (v0 - 207));
  STACK[0x230] = (unint64_t)malloc(STACK[0x200]);
  uint32_t v2 = arc4random();
  LODWORD(xmmword_18C723288) = v2 - 1595106619 - ((v1 + 1104753125) & (2 * v2));
  int v3 = xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> (3 * (v0 ^ (v0 + 49)) + 121));
  DWORD1(xmmword_18C723288) = ((1812433253 * v3) ^ 0x6FDC2FAF)
                            + ((-670100790 * v3) & 0xDFB85F5E)
                            + 823159575
                            - ((2 * (((1812433253 * v3) ^ 0x6FDC2FAF) + ((-670100790 * v3) & 0xDFB85F5E)) + 541565092) & 0x41D9358A);
  return ((uint64_t (*)(void))(qword_18A26FDB0[v1 ^ 0x788] - 8LL))();
}

void sub_1886F8D54()
{
}

void sub_1886F8D70()
{
}

void sub_1886F8F40()
{
}

uint64_t sub_1886F8F48@<X0>(uint64_t a1@<X6>, uint64_t a2@<X7>, int a3@<W8>)
{
  uint64_t v8 = (unsigned int *)(a2 + 4 * (v3 + v6));
  unsigned int v9 = v5 + ((a3 - 732) ^ v4 & 0x80000000 ^ 0xD5C7E7B5) + 716;
  uint64_t v10 = v3 + 1;
  int v11 = *(_DWORD *)(a2 + 4 * (v10 + v6));
  unsigned int v12 = ((((2 * (v11 & 0x7FFFFFFE ^ 0x3475C2A2)) & 0xB481FC28) - (v11 & 0x7FFFFFFE ^ 0x3475C2A2) + 633274858) | v9 & 0x80000000) ^ 0x3126598C;
  *uint64_t v8 = v8[397] ^ *((_DWORD *)&STACK[0x2238] + ((v11 & 1) == 0)) ^ ((v12 - ((2 * v12) & 0x8B45D4A8) + 1168304725) >> 1) ^ 0xBE05E7C;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * (((v10 == v7 + 3) | ((v10 == v7 + 3) << 7)) ^ a3)) - 12LL))();
}

void sub_1886F9028( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x4F8]) = a1 + 1;
  gettimeofday(a64, 0LL);
  int v67 = (_DWORD *)STACK[0x240];
  int v68 = *(_DWORD *)(STACK[0x240] + 16)
      - 1595106619
      - ((*(_DWORD *)(STACK[0x240] + 16) << (v66 + v65 + v64 - 92 - 73 + 2)) & 0x41D9358A);
  v67[1] = *(_DWORD *)(STACK[0x240] + 24) - 1595106619 - ((2 * *(_DWORD *)(STACK[0x240] + 24)) & 0x41D9358A);
  v67[2] = v68;
  uint32_t v69 = arc4random();
  v67[3] = v69 - 1595106619 - ((2 * v69) & 0x41D9358A);
  uint32_t v70 = arc4random();
  *int v67 = v70 - 1595106619 - ((2 * v70) & 0x41D9358A);
  int v71 = ((2 * STACK[0x230]) & 0xEFFFBFEA) + (STACK[0x230] ^ 0x77FFDFF5);
  LODWORD(STACK[0x238]) = v71 - ((2 * v71 + 268451862) & 0xCF6AD078) + 1874167879;
  JUMPOUT(0x1886F194CLL);
}

uint64_t sub_1886F914C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t (*a59)(uint64_t),uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x428] = v67;
  STACK[0x490] = STACK[0x230];
  return a59(a67);
}

uint64_t sub_1886F9168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11 = LODWORD(STACK[0x2F4])++;
  *(_DWORD *)(v7 + 3208) = v11 + 1823406260;
  uint64_t v12 = (*(_DWORD *)(v8 + 3160) + 161607057);
  v9[12] = *(void *)(a6 + 8 * ((v6 - 1916284683) ^ 0x2434FEE5LL));
  LODWORD(STACK[0x578]) = v6 - 1916284683;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = v6 - 1916284745;
  LODWORD(STACK[0x590]) = v6 - 1916284626;
  v9[14] = v12;
  v9[17] = 1235778678LL;
  *(_DWORD *)(v10 - 192) = 1431737413 * ((2 * ((v10 - 200) & 0x454A6338) - (v10 - 200) + 984980678) ^ 0x84EB03D4)
                         + 40706419
                         + v6;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v10 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v10 - 188)])();
}

void sub_1886F925C()
{
}

void sub_1886F9270(uint64_t a1@<X2>, int a2@<W8>)
{
  int v6 = STACK[0x7D4];
  LODWORD(STACK[0x7D8]) = STACK[0x7D4];
  unsigned int v7 = (v6 + 906995244) & 0xC9F059EF;
  LODWORD(STACK[0x7DC]) = v7;
  int v8 = v3 + v7 - 491;
  LODWORD(STACK[0x7E0]) = v8;
  unsigned int v9 = (v2 - 917224880) | (16 * a2 + 455490273) ^ 0xE286F101;
  LOBYTE(v9) = v9 - ((v9 << (v8 ^ (v3 - 1))) & 0x5A);
  uint64_t v10 = *(void *)(v4 + 48) + (LODWORD(STACK[0x1464]) - 1648833516);
  unsigned int v11 = 83590351 * ((v10 ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4))) & 0x7FFFFFFF);
  unint64_t v12 = 83590351 * (v11 ^ HIWORD(v11));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v12 >> 24] ^ (v9 + 45) ^ byte_188743410[v12 >> 24] ^ byte_188744EB0[(v12 >> 24) + 3] ^ v12 ^ (-111 * BYTE3(v12)) ^ 0x2D;
  *(void *)(v5 + 160) = *(void *)(a1 + 8LL * (v6 + 870));
  *(void *)(v5 + 168) = v10;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_1886F93A0(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(qword_18A26FDB0[((4
                                                                     * (LODWORD(STACK[0x1464]) == LODWORD(STACK[0x1264]))) | (32 * (LODWORD(STACK[0x1464]) == LODWORD(STACK[0x1264])))) ^ LODWORD(STACK[0x7D8])]
                                                   - 8LL))( a1,  1771229876LL);
}

uint64_t sub_1886F93EC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v65 = STACK[0x7DC];
  LODWORD(STACK[0x1464]) = a9 + 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8LL * (((*(_BYTE *)(*(void *)(v64 + 4000) + (2 * (a9 + 1) + 997300264)) != 0) * ((v65 + 653) ^ 0x773)) ^ v65)) - ((v65 - 1771230368) ^ 0x966D2D43LL)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,  a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64);
}

uint64_t sub_1886F93F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_1886F9438@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  STACK[0x368] = *(void *)(v3 + 504);
  return (*(uint64_t (**)(void))(a1 + 8LL * ((594 * ((v2 ^ (a2 - 47)) & 1)) ^ a2)))();
}

uint64_t sub_1886F948C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(STACK[0x278]) = 0;
  return sub_1886F65F8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1886F9498()
{
  unint64_t v3 = LODWORD(STACK[0x7E8]);
  LODWORD(STACK[0x7EC]) = v3;
  int v4 = STACK[0x7E4];
  LODWORD(STACK[0x7F0]) = STACK[0x7E4];
  LODWORD(STACK[0x7F4]) = 113 * (v4 ^ 0xA5);
  unint64_t v5 = (v3 | ((unint64_t)(v3 < 0xF4C9B4) << 32)) - 16042420;
  v2[93] = v5;
  unint64_t v6 = *(void *)(v1 + 632) + v5;
  v2[94] = v6;
  v2[72] = v6 - 0x5A72C1CEA1245FC3LL;
  v2[70] = *(void *)(v0 + 8LL * (v4 + 1054)) - 8LL;
  unint64_t v7 = ((v2[72] - qword_18C724728) & 0xFFFFFFFFFFFFFFF0LL) + qword_18C724720;
  uint64_t v8 = (*(uint64_t (**)(void, unint64_t *, uint64_t))(qword_18C724740
                                                                      + 32LL * *(unsigned __int8 *)(v7 + 8)
                                                                      + 8))( *(void *)v7,  &STACK[0x78F],  1LL);
  LOBYTE(STACK[0x74F]) = STACK[0x78F];
  return ((uint64_t (*)(uint64_t))v2[70])(v8);
}

void sub_1886F9510()
{
  unsigned int v1 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFF912136CLL)) ^ LODWORD(STACK[0x800])) & 0x7FFFFFFF);
  int v2 = (v1 >> (LODWORD(STACK[0x7F4]) ^ 0xD4)) ^ v1;
  LOBYTE(STACK[0x5C3]) = byte_18873CE40[*(void *)(v0 + 744) & 0xF | (16 * ((83590351 * v2) >> 24))] ^ LOBYTE(STACK[0x74F]) ^ (-49 * v2);
  JUMPOUT(0x188709118LL);
}

uint64_t sub_1886F95B8()
{
  int v1 = LODWORD(STACK[0x7EC]) + 1;
  unsigned int v2 = LODWORD(STACK[0x7EC]) + 1860624125;
  char v3 = *(_BYTE *)(v0 + 19) ^ (v2 < 0x6FDBA8B0);
  char v4 = v2 < LODWORD(STACK[0x1634]);
  if ((v3 & 1) != 0) {
    char v4 = *(_BYTE *)(v0 + 19);
  }
  unint64_t v5 = (uint64_t (*)(void))(qword_18A26FDB0[(109 * (v4 & 1)) ^ LODWORD(STACK[0x7F0])] - 12LL);
  LODWORD(STACK[0x7E4]) = STACK[0x7F0];
  LODWORD(STACK[0x7E8]) = v1;
  return v5();
}

uint64_t sub_1886F962C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  LODWORD(STACK[0x14EC]) = STACK[0x14EC];
  LODWORD(STACK[0x4B4]) = (a2 ^ 0x76F) + 1333571276;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((73
}

uint64_t sub_1886F9688( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  *(void *)(v63 + 3864) = STACK[0x290];
  size_t v64 = ((v62 + 1257538443) & 0xB50B7A33 ^ 0xFE191288) + LODWORD(STACK[0x43C]);
  LODWORD(STACK[0x1434]) = v64;
  int v65 = malloc(v64);
  *(void *)(v63 + 3880) = v65;
  *a62 = v65;
  return ((uint64_t (*)(void))(qword_18A26FDB0[v62 | (4 * (v65 != 0LL))] - ((v62 - 17) | 2u) + 1094LL))();
}

uint64_t sub_1886F9704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * (((*(void *)(v6 + 3864) == 0x2061722DFEAF01F1LL)
                                          * (((v5 - 578) | 0x164) ^ 0x347)) ^ v5))
                            - (v5 ^ 0x672u)
                            + 532LL))();
}

uint64_t sub_1886F9758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8 = (v6 | ((unint64_t)(v6 < 0x1E6EF58) << 32)) + 1323433053;
  *(void *)(v7 + 3520) = v8;
  *(_BYTE *)(v7 + 3535) = v8 < (unint64_t)(v5 ^ 0x966D2E3F) - 1168392598;
  unsigned int v9 = (uint64_t (*)(void))(*(void *)(a5 + 8LL * ((238 * (v8 == 1355344821)) ^ v5)) - 4LL);
  LODWORD(STACK[0xCCC]) = v5;
  *(void *)(v7 + 1984) = 0x5746D3A0217B0606LL;
  *(void *)(v7 + 1992) = 0x7D2E92B84B1CDE0ELL;
  *(void *)(v7 + 2000) = 0x8B4D678019E3290LL;
  return v9();
}

void sub_1886F9828()
{
  uint64_t v1 = v0[250];
  v0[251] = v1;
  v0[252] = v0[249];
  v0[253] = v0[248];
  int v2 = STACK[0xCCC];
  LODWORD(STACK[0xD00]) = STACK[0xCCC];
  uint64_t v3 = (v2 - 1771230761);
  LODWORD(STACK[0xD04]) = v3;
  unint64_t v4 = v0[483] + v1 + (v3 ^ 0xF74B2987680CE03BLL);
  v0[255] = v4;
  v0[72] = v4 - 0x2061722DFEAF01F1LL;
  JUMPOUT(0x18871B8B8LL);
}

uint64_t sub_1886F98A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = STACK[0x310];
  LODWORD(STACK[0x1874]) = STACK[0x310];
  uint64_t v7 = (uint64_t (*)(void))(*(void *)(a5
                                     + 8LL
                                     * ((63 * (v6 == (((v5 ^ 0x7B3) - 31243308) & 0x1DCBBF7) + 1258454976)) ^ v5 ^ 0x7B3))
                         - 12LL);
  LODWORD(STACK[0x790]) = (v5 ^ 0x7B3) + 47;
  return v7();
}

void sub_1886F9900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = STACK[0x790];
  LODWORD(STACK[0x794]) = STACK[0x790];
  int v7 = (v6 ^ 0x3A0) - 1771229903;
  LODWORD(STACK[0x798]) = v7;
  int v8 = 37 * (v6 ^ 0x3A0);
  LODWORD(STACK[0x79C]) = v8;
  char v9 = STACK[0x300];
  unint64_t v10 = STACK[0x290];
  v5[82] = STACK[0x290];
  unint64_t v11 = LODWORD(STACK[0x14EC]);
  LODWORD(STACK[0x7AC]) = v11 + 408082059;
  unint64_t v12 = (v11 | ((unint64_t)(v11 < 0xDBF87E5) << 32)) + v10;
  int v13 = ((v12 - 230655973) ^ *(_DWORD *)(qword_18C724710 + ((v8 - 1952265718) & dword_18C724718))) & (v7 ^ 0xE992D2B4);
  unint64_t v14 = 83590351 * ((83590351 * v13) ^ ((83590351 * v13) >> 16));
  LOBYTE(STACK[0x5C3]) = v9 ^ byte_18873E340[v14 >> 24] ^ byte_18873FAC0[(v14 >> 24) + 1] ^ byte_188743C60[v14 >> 24] ^ v14 ^ (-103 * BYTE3(v14)) ^ 0xF6;
  v5[20] = *(void *)(a5 + 8LL * (v6 ^ 0x689)) - 8LL;
  v5[21] = v12 - 0x2061722E0C6E89D6LL;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_1886F9A4C()
{
  BOOL v3 = (v1 & 3) + v0 - ((2 * v1) & 4) != v0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[((2 * v3) | (4 * v3)) ^ v2]
                                                                              - 12LL))( 217376429LL,  651186755LL,  2438139114LL,  584LL,  729LL);
}

void sub_1886F9B0C()
{
}

uint64_t sub_1886F9B24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40)
{
  int v45 = (v44 - 160) | 0x3E0;
  LODWORD(STACK[0x238]) = v45;
  int v46 = v41 ^ (v40 + 352) ^ v45;
  unsigned int v47 = -1302716785 * (v43 ^ 0xFDEAE2B3) - ((1689533726 * (v43 ^ 0xFDEAE2B3)) & 0xADF656E8) - 688182412;
  unsigned int v48 = v47 >> 19;
  unsigned int v49 = (~(275621222 * v42 + 499103184) | 0xC96A9DA5) - 935931213 * v42 + 707431446;
  int v50 = -631873536 * v42 - ((346865664 * v42 + 381288448) & 0x1F3F8000) + 184340660;
  unsigned int v51 = 1137827840 * (v43 ^ 0xFDEAE2B3) - ((-2019311616 * (v43 ^ 0xFDEAE2B3)) & 0xCB77C000) + 1706814833;
  int v52 = ((v47 >> 18) & 0xFDC ^ 0x59C) + ((v47 >> 19) & 0x17EE ^ 0x29FFF531);
  int v53 = v51 & 0x29044000;
  unsigned int v54 = (v51 & 0x29044000 ^ 0xDEFFBFFF) - ((2 * (v51 & 0x29044000 ^ 0xDEFFBFFF) + 2) & 0xAB530000) + 1437181654;
  unsigned int v55 = ((-1781095162 * v46 - ((732776972 * v46) & 0x98E6D56C)) & 0xFFFFFFFE | ((((-1781095162 * v46) & 0xE2FC8160)
                                                                               - 1256936067 * v46
                                                                               + 243384143) >> 31))
      + 1282632374;
  unsigned int v56 = ((2 * v55) & 0xFF7FFFEE ^ 0x9866D56C) + (v55 ^ 0x33CC9541);
  int v57 = v52 - 704636927;
  unsigned int v58 = ((-1036492576 * a7 - ((-2072985152 * a7 + 965037760) & 0xA34A72C0) - 295182127) ^ 0x51A53971) & 0xFFFFFFE0 | ((-300825849 * a7 - ((2328078 * a7 + 30157430) & 0x3B4DC20u) - 960462005) >> 27);
  unsigned int v59 = ((2 * v58) & 0xFBF6CBFA ^ 0x20) + (v58 ^ 0x7DFB65ED);
  unsigned int v60 = (((v52 - 704636927) | v51 & 0x29044000 ^ 0x21004000) ^ 0x88019241)
      + v52
      - ((2 * ((v52 - 704636927) | v51 & 0x29044000 ^ 0x21004000)) & 0xEFFCDB7C);
  int v61 = v60 - 2 * ((v60 + 234784192) & 0x2A043CDD ^ v60 & 4) + 2013446809;
  unsigned int v62 = (v50 ^ 0xF9FD0B4) & 0xFFFFE000 | (v49 >> 19);
  unsigned int v63 = -639062627 * v56 - ((-1278125254 * v56 + 551302410) & 0xBDA6DBAA) + 1866565722;
  unsigned int v64 = ((2 * (v51 & 0xD6FBA000 ^ 0x92B38000)) | 0x3679479C) - (v51 & 0xD6FBA000 ^ 0x92B38000) + 1690524722;
  unsigned int v65 = (v53 ^ v54 ^ 0x5EADDA0C ^ v61) + v57;
  unsigned int v66 = ((v64 & 0xFB3BEEDA ^ 0x48030800) + (v64 ^ 0xB73CF7DF) - ((v64 ^ 0xB73CF7DF) & 0xFB3BEEDA)) ^ 0x1339ACB | ((v48 & 0x11) - 502229347 - (v48 & 0x800) + 2031) ^ 0xE210969D;
  unsigned int v67 = -1382219776 * v56 - ((1530527744 * v56 + 889847808) & 0x96800000) - 440068571;
  unsigned int v68 = ((v65 ^ 0xFF77FFFF) + 8912897 + ((2 * v65) & 0xFEEFFFFE)) | (v66 - ((2 * v66) & 0x68C5D866) + 878898227) ^ 0x3462EC33;
  unsigned int v69 = v68 + 1009653027 + (~(2 * v68) | 0x87A3D5B9) + 1;
  unsigned int v70 = (v62 ^ 0x71DFEA9E) - v59 + ((2 * v62) & 0xE3BFF3EE ^ 0x22C2) - v56 + 1276739115;
  unsigned int v71 = v69 ^ (v70 - ((2 * v70 + 2139347876) & 0x634D154E) - 244811655) ^ 0x8D889F84;
  unsigned int v72 = 2027185433 * v71 - ((1906887218 * v71) & 0x60D43C38) - 1335222756;
  unsigned int v73 = 848068608 * v71 - ((1696137216 * v71) & 0xE9810000) - 188696535;
  unsigned int v74 = 334163693 * (v69 ^ 0x3C2E1523) - ((668327386 * (v69 ^ 0x3C2E1523)) & 0x2CB0B4AA) + 374889045;
  unsigned int v75 = -637534208 * (v69 ^ 0x3C2E1523) - ((-1275068416 * (v69 ^ 0x3C2E1523)) & 0xAAAAAAAA) + 1410641224;
  unsigned int v76 = ((2 * ((v73 ^ 0xF4C0B829) & 0xFFFF8000 | (v72 >> 17))) & 0x7E3D569E ^ 0x100A)
      + (((v73 ^ 0xF4C0B829) & 0xFFFF8000 | (v72 >> 17)) ^ 0x3F1EF37A);
  unsigned int v77 = ((2 * ((v67 ^ 0xCB401625) & 0xFFFF0000 | HIWORD(v63))) & 0x347BFBFE ^ 0x1B9A6)
      + (((v67 ^ 0xCB401625) & 0xFFFF0000 | HIWORD(v63)) ^ 0x9A3D232C);
  unsigned int v78 = v77 + 2146851808;
  unsigned int v79 = ((2 * (v75 ^ 0x5414AD48 | (v74 >> 7))) & 0xBCEDF3FE ^ 0x496168) + ((v75 ^ 0x5414AD48 | (v74 >> 7)) ^ 0x5E5A494B);
  unsigned int v80 = ((1169031168 * v59 - ((190578688 * v59 + 437518336) & 0x1FEC0000) - 1929275917) ^ 0xFF795F3) & 0xFFFE0000 | ((-1429003561 * v59 - ((1436960174 * v59 + 2039840010) & 0x8CDDD6F6) - 2093372928) >> 15);
  unsigned int v81 = 1256955867 * v79 - ((-1781055562 * v79 + 800818102) & 0xD12B9FB4) - 2139909707;
  unsigned int v82 = 1087309287 * v76 - ((-2120348722 * v76 + 1513341294) & 0xE92F0E1C) - 1582209083;
  HIDWORD(v83) = (v80 ^ 0xF5D4E33A) + ((2 * v80) & 0xEBAADFCE ^ 0x2198A) + v77 + 2146851808 + v76 + v79 + 972761596;
  LODWORD(v83) = ((~(90959638 * HIDWORD(v83) + 169928864) | 0xF48A3041) + 1790310283 * HIDWORD(v83) - 1026859984) ^ 0x85BAE7DE;
  unsigned int v84 = 1008180224 * v76 - ((2016360448 * v76 - 821708800) & 0xF3A3B800) + 1632942429;
  int v85 = ((2 * (v83 >> 1)) & 0xFFDFEFEE) + ((v83 >> 1) ^ 0x7FEFF7F7);
  int v86 = -671088640 * v79 - ((805306368 - (v79 << 28)) & 0x30000000) - 155137715;
  char v87 = ((v85 + 9) & 0x14) - ((2 * (v85 + 9)) & 8) - 49;
  unsigned int v88 = ((2 * ((v84 ^ 0xF9D1DD5D) & 0xFFFFFC00 | (v82 >> 22))) & 0xDCF977DC ^ 0x384)
      + (((v84 ^ 0xF9D1DD5D) & 0xFFFFFC00 | (v82 >> 22)) ^ 0xEE7CBA3C);
  unsigned int v89 = ((-1382721235 * v77 - ((1529524826 * v77 + 1522755162) & 0x77817E4E) + 1763865172) ^ 0x3BC0BF27) >> (v87 ^ 0xCF);
  unsigned int v90 = ((v89 - ((2 * v89) & 0x2B9C0A92) - 1781660343) ^ 0x95CE0549) >> (v87 ^ 0xDB);
  unsigned int v91 = 1435684864 * v78 - v85 - v88 + (v90 ^ 0xBFFFE7EB) + ((2 * v90) & 0x7FFFCFD6) - 464661715;
  int v92 = v91 - ((2 * v91 + 1775735194) & 0x5D6266F8) + 597490761;
  unsigned int v93 = ((v86 ^ 0x1EC0C94D) & 0xF8000000 | (v81 >> 5)) ^ 0x344AE7E;
  int v94 = v93 - ((2 * v93) & 0x74CC4134) - 1167712102;
  unsigned int v95 = v94 ^ 0xBA66209A;
  unsigned int v96 = 2126547813 * (v94 ^ 0xBA66209A) - ((-41871670 * (v94 ^ 0xBA66209A)) & 0xB472FC6E) + 1513717303;
  int v97 = -1421997755 * v85 - ((1450971786 * v85 + 328267482) & 0x552629DC);
  char v98 = ~(69 * v85 - ((-118 * v85 - 38) & 0xDC) + 123);
  unsigned int v99 = 2 * (((v92 ^ 0x2EB1337C) & (v94 ^ 0xBA66209A)) - ((2 * ((v92 ^ 0x2EB1337C) & (v94 ^ 0xBA66209A))) & 0x5EB93396))
      + 1589195670;
  unsigned int v100 = (v94 ^ 0x94D713E6 ^ v92) + (v99 ^ 0x694295A9) - 939238975 + ((2 * v99) & 0x6FF74C7C ^ 0x2D72442C);
  int v101 = ((2 * v100) & 0x2FF591FE) + (v100 ^ 0x17FAC8FF);
  LOBYTE(v92) = ((v98 & 0x19) - ((2 * v98) & 0x12) + 45) ^ 0x3C;
  char v102 = ((2 * v92) | 0x2A) - v92 + 107;
  int v103 = -1627086208 * v85 - ((1040794880 * v85 + 1216048384) & 0x6EA62300) - 1685010308;
  unsigned int v104 = -872031717 * v101 - ((-1744063434 * v101 - 1865331146) & 0xB49B8DB0) - 1565102605;
  unsigned int v105 = ((-2011374097 * v88 - ((272219102 * v88 + 1519398300) & 0x4084312C) + 1300901732) >> 4)
       - (v88 << 28)
       - 0x20000000;
  unsigned int v106 = ((2 * v105) & 0xFAB477BA ^ 0x10004312) + (v105 ^ 0xF75E1A54);
  unsigned int v107 = -669946720 * v95 - ((-1339893440 * v95) & 0x87382580) - 1013181757;
  unsigned int v108 = (((((v97 + 878415963) ^ 0x2A9314EEu) >> (v102 ^ 0x95))
         - ((2 * (((v97 + 878415963) ^ 0x2A9314EEu) >> (v102 ^ 0x95))) & 0xFC78B810)
         + 2117884936) ^ 0x7E3C5C08) >> (v102 ^ 0x8C);
  LOBYTE(v108) = v108 - ((2 * v108) & 0x4E) + 39;
  unsigned int v109 = ((v108 ^ 0xF11D6D76) - ((2 * (v108 ^ 0xF11D6D76)) & 0xE220099C) - 212826930) ^ 0x824D0DD7;
  unsigned int v110 = (v109 - ((2 * v109) & 0x4840B4D6) - 1523164565) ^ 0x2536BE23 | v103 ^ 0xB75311FC;
  int v111 = v110 - ((2 * v110) & 0x70221706) - 1206842493;
  unsigned int v112 = (((-671088640 * v101 - ((805306368 - (v101 << 28)) & 0x20000000) + 1792635847) ^ 0x92D973C7) & 0xF8000000 | (v104 >> 5)) ^ 0x6D26E36;
  int v113 = v112 - 2 * (v112 & 0x630E531F ^ (v104 >> 5) & 1) + 1661883166;
  unsigned int v114 = ((v106 - 23405569 + (v111 ^ 0xB8110B83)) ^ 0xE9545C99)
       + ((2 * (v106 - 23405569 + (v111 ^ 0xB8110B83))) & 0xD2A8B932)
       + 380347239
       + (v113 ^ 0x630E531E);
  unsigned int v115 = (((v107 ^ 0xC39C12C3) & 0xFFFFFFE0 | (v96 >> 27)) ^ 0xBF7CBDA4)
       + v106
       + ((2 * ((v107 ^ 0xC39C12C3) & 0xFFFFFFE0 | (v96 >> 27))) & 0x7EF97B5E ^ 0x16)
       + (((v113 ^ 0x630E531E) + (v111 ^ 0xB8110B83)) ^ 0xBDD0D24)
       - ((2 * ((v113 ^ 0x630E531E) + (v111 ^ 0xB8110B83))) & 0xE845E5B6)
       + 1;
  unsigned int v116 = v115 - ((2 * v115 + 1855451806) & 0xF81DD516) + 861594586;
  unsigned int v117 = v116 ^ (v114 - ((2 * v114) & 0xE64AE584) + 1931834050);
  int v118 = v117 ^ 0x56B44E3D;
  unsigned int v119 = 2
       * (((v117 ^ 0xDA6B1812) & (v111 ^ 0xB8110B83)) - ((2 * ((v117 ^ 0xDA6B1812) & (v111 ^ 0xB8110B83))) & 0x66732422))
       + 1718821922;
  int v120 = (v111 ^ 0x627A1391 ^ v117) + (v119 ^ 0x598C914D) - 1073722735 + ((2 * v119) & 0x7FFF6ADC ^ 0x4CE64844);
  int v121 = v120 - ((2 * v120) & 0x16D05C3C) - 1956106722;
  LODWORD(STACK[0x230]) = v113;
  int v122 = v113 ^ v117 ^ 0x56B44E3D;
  unsigned int v418 = (v116 ^ 0xFC0EEA8B)
       + (v117 ^ 0x2594E7ED)
       + 1
       - ((2 * ((v116 ^ 0xFC0EEA8B) + (v117 ^ 0x2594E7ED) + 1)) & 0x449AAE9E)
       - 1571989681;
  LODWORD(STACK[0x220]) = v122;
  unsigned int v123 = v122 ^ 0xEFD10531;
  unsigned int v124 = -879604157 * (v122 ^ 0xEFD10531) - ((388275334 * (v122 ^ 0xEFD10531)) & 0x18F1E2AE) + 209252695;
  HIDWORD(v415) = v117 ^ 0xDA6B1812;
  unsigned int v125 = ((1586364416 * (v121 ^ 0x8B682E1E) - ((-1122238464 * (v121 ^ 0x8B682E1E)) & 0xA2B80000) + 1365067363) ^ 0x515D4663) & 0xFFFE0000 | ((-1620594873 * (v121 ^ 0x8B682E1E) - ((1053777550 * (v121 ^ 0x8B682E1E)) & 0xE233D89A) + 1897524301) >> 15);
  int v126 = ((2 * v125) & 0x7FC6B1EE ^ 0x8066) + (v125 ^ 0x3FE3BAC4);
  unsigned int v127 = ((-1879048192 * (v418 ^ 0xA24D574F) - ((v418 ^ 0xA24D574F) >> 1 << 30) + 1771484928) ^ 0x6996B700 | ((161990985 * (v418 ^ 0xA24D574F) - ((323981970 * (v418 ^ 0xA24D574F)) & 0x8F4362BC) - 945704610) >> 4)) ^ 0xC7A1B15;
  int v128 = v127 - ((2 * v127) & 0xDCD48D2) + 115778665;
  unsigned int v129 = ((2083797504 * HIDWORD(v415) - ((-127372288 * HIDWORD(v415)) & 0xBFC15400) - 538924245) ^ 0xDFE0AB2B) & 0xFFFFFE00 | ((-1220666851 * HIDWORD(v415) - ((1853633594 * HIDWORD(v415)) & 0xB2FB0C4C) - 646085082) >> 23);
  unsigned int v130 = (v129 ^ 0x7EF3EF0D) + ((2 * v129) & 0xFDE7DD7E ^ 0x165) - v126 + 1;
  unsigned int v131 = v130 - ((2 * v130 - 2116103060) & 0x951A0A40) - 1954779306;
  int v132 = v128 ^ 0x6E6A469;
  unsigned int v133 = 2
       * (((v131 ^ 0xCA8D0520) & (v128 ^ 0x6E6A469)) - ((2 * ((v131 ^ 0xCA8D0520) & (v128 ^ 0x6E6A469))) & 0x63C5D716))
       + 1673910038;
  unsigned int v134 = ((1313013760 * v123 - ((-1668939776 * v123) & 0x81CC0000) - 1058634904) ^ 0xC0E68368) & 0xFFFF0000 | HIWORD(v124);
  unsigned int v135 = ((2 * v134) & 0xD5EE5FDE ^ 0x18D0) + (v134 ^ 0x6AF72397);
  unsigned int v136 = 105412641 * (v128 ^ 0x6E6A469) - ((210825282 * (v128 ^ 0x6E6A469)) & 0x75993A0E) - 1160995577;
  unsigned int v137 = (v128 ^ 0xCC6BA149 ^ v131) + (v133 ^ 0x183218EB) - 2079838205 + ((2 * v133) & 0xF7EF9FF8 ^ 0xC78B8E28);
  int v138 = v135 + (v137 ^ 0x3FAFFD6D) + ((2 * v137) & 0x7F5FFADA) - 1581058737;
  unsigned int v139 = (((-1452699648 * v126 - ((1389568000 * v126 + 592191488) & 0xE5CAA000) - 2071238483) ^ 0xF2E558AD) & 0xFFFFF000 | ((1148884633 * v126 - ((150285618 * v126 + 848442562) & 0x680099D4u) + 1296656203) >> 20)) ^ 0xB40;
  unsigned int v140 = v139 - ((2 * v139) & 0xAF2D0A3E) + 1469482271;
  unsigned int v141 = (((-1843525568 * v132 - ((71045248 * v132) & 0x1FA7CC00) + 265545232) ^ 0xFD3E610) & 0xFFFFFFC0 | (v136 >> 26)) ^ 0x2E;
  int v142 = v141 - ((2 * v141) & 0x7D7C3F10) + 1052647304;
  unsigned int v143 = ((1437219328 * v138 - ((-1420528640 * v138 + 1328448512) & 0xA5FB4000) - 90906096) ^ 0xD2FDA010) & 0xFFFFFE00 | ((-1851075299 * v138 - ((592816698 * v138 + 1361549122) & 0x5A8738B4u) + 1440180219) >> 23);
  unsigned int v144 = ((2 * v143) & 0xDDF7DBF2 ^ 0xB0) + (v143 ^ 0x6EFBEDA3);
  unsigned int v145 = ((1999542912 * v135 - ((1851602176 * v135 + 926975232) & 0x535DB800) + 1162813177) ^ 0x29AEDC79) & 0xFFFFFF80 | ((-387031755 * v135 - ((-774063510 * v135 - 865173238) & 0xBFCF84F6) - 971046144) >> 25);
  unsigned int v146 = ((2 * v145) & 0xC7F6CEDC ^ 0xDC) + (v145 ^ 0xE3FB6701);
  int v147 = v142 ^ 0x3EBE1F88;
  int v148 = 2
       * (((v140 ^ 0x5796851F) & (v142 ^ 0x3EBE1F88)) - ((2 * ((v140 ^ 0x5796851F) & (v142 ^ 0x3EBE1F88))) & 0x2F7FEC60))
       + 796912736;
  int v149 = (v142 ^ 0x69289A97 ^ v140) + (v148 ^ 0x18800395) - 939519989 + ((2 * v148) & 0x6FFFDFE8 ^ 0x4EFFD8C0);
  unsigned int v150 = (v149 ^ 0x75DFDFF4) - v146 + ((2 * v149) & 0xEBBFBFE8) + v144;
  unsigned int v151 = -296969661 * v144 - ((-593939322 * v144 - 2047222870) & 0xDB74EC84) - 1330158569;
  int v152 = -1023942422 * (v142 ^ 0x3EBE1F88);
  unsigned int v153 = 401186745 * (v150 - 1462666586) - ((265502578 * (v150 - 1462666586) + 199402118) & 0x161F35D6) - 1325339602;
  unsigned int v154 = ((-1937194716 * v146 - ((420577864 * v146 + 444009744) & 0x31B6A088)) & 0xFFFFFFFC | ((1663184969 * v146
                                                                                              - ((1178886290 * v146
                                                                                                + 647873348) & 0x67C09DEC)
                                                                                              + 1194274968) >> 30))
       - 434710836;
  unsigned int v155 = v154 ^ 0xEE6DB979;
  unsigned int v156 = (2 * v154) & 0xED6DD27E ^ 0x2124800C;
  int v157 = 642589056 * v144 - ((211436288 * v144 + 216913152) & 0xA0F0500) - 2088866553;
  unsigned int v158 = ((2 * ((v157 ^ 0x5078287) & 0xFFFFFF80 | (v151 >> 25))) & 0x7EFF5ECC ^ 0x4C)
       + (((v157 ^ 0x5078287) & 0xFFFFFF80 | (v151 >> 25)) ^ 0xBF7FAF50);
  unsigned int v159 = -1086811273 * v158 - ((2121344750 * v158 + 1664863020) & 0xFC819868) - 1344359990;
  int v160 = 1064435712 * v150 - ((249823232 * v150 + 82051072) & 0xED00000) - 1579545712;
  unsigned int v161 = ((v152 - ((99598804 * v147) & 0x3AE7C420) + 494133777) ^ 0x1D73E211) & 0xFFFFFFFE | (((v152 & 0xDF146566)
                                                                                             + 511971211 * v147
                                                                                             + 276155724) >> 31);
  unsigned int v162 = ((2 * v161) & 0xDEFEFAD2) + (v161 ^ 0xEF7F7D69);
  unsigned int v163 = ((2 * ((v160 ^ 0x87680B90) & 0xFFFE0000 | (v153 >> 15))) & 0x7FFFFF06 ^ 0x2C06)
       + (((v160 ^ 0x87680B90) & 0xFFFE0000 | (v153 >> 15)) ^ 0xBFFFE99C);
  int v164 = v155 + v156 + v162 - v158 - v163 - 145488150;
  unsigned int v165 = -240767569 * v163 - ((1665948510 * v163 + 2085133542) & 0x70F03700) + 1989962227;
  int v166 = -574619648 * v158 - ((192937984 * v158 + 184549376) & 0xD000000) + 1812223120;
  unsigned int v167 = -753477760 * v163 - ((-1506955520 * v163 + 609121024) & 0xDF3FA700) + 29822298;
  unsigned int v168 = (((2048228480 * v164 - ((-198510336 * v164 + 819175168) & 0xF1795300) - 1859749608) ^ 0xF8BCA998) & 0xFFFFFF80 | ((-889967879 * v164 - ((-1779935758 * v164 + 1650566974) & 0xC17BA17E) - 1846631330) >> 25)) ^ 0x30;
  unsigned int v169 = v168 - ((2 * v168) & 0x905E1BEC) - 936440330;
  unsigned int v170 = (((110055424 * v162 - ((220110848 * v162 + 1246781440) & 0xAB3B0000) - 87705797) ^ 0x559D873B) & 0xFFFFF000 | ((934308085 * v162 - ((258003434 * v162 + 297051398) & 0x177A47B8) - 996706721) >> 20)) ^ 0x8BB;
  unsigned int v171 = ((v166 ^ 0x6845490) & 0xFFC00000 | (v159 >> 10)) ^ 0x1F9033;
  unsigned int v172 = v171 - ((2 * v171) & 0xEAC13A2C) + 1969265942;
  unsigned int v173 = ((v167 ^ 0xEF9FD3DA) & 0xFFFFFF80 | (v165 >> 25)) ^ 0x5C;
  int v174 = v173 - ((2 * v173) & 0x6C52075A) + 908657581;
  unsigned int v175 = ((2 * ((v174 ^ 0x362903AD) + (v172 ^ 0x75609D16))) & 0xD35FEDEC)
       + (((v174 ^ 0x362903AD) + (v172 ^ 0x75609D16)) ^ 0x69AFF6F6);
  int v176 = v175 - ((2 * v175 + 992138074) & 0x63CFDF6E) - 1887872668;
  unsigned int v177 = ((2 * v169) & 0xD0C51D60 ^ 0x9F449BE6)
       + (v169 & 0x686EAEBC ^ 0x305D9204)
       + (((v169 ^ 0xA041A34A) + 1) ^ 0x7779FEF1)
       + ((2 * ((v169 ^ 0xA041A34A) + 1)) & 0xEEF3FDE2);
  unsigned int v178 = ((v170 - ((2 * v170) & 0xEC1CCC92) + 1980655177) ^ v172 ^ v174 ^ 0x3547F8F2) + (v169 ^ 0x37D0F209) + 1;
  int v179 = v178 - ((2 * v178) & 0x13B9E6E4) + 165475186;
  unsigned int v180 = ((v176 ^ v169) & 0x686EAEBC ^ 0xD7F71EFA)
       + ((2 * (v176 ^ v169)) & 0x505D5970 ^ 0x50114000)
       - 1850530807
       + ((v177 - ((2 * v177 + 826696248) & 0x36378C4A) + 868153153) ^ 0x5941509C ^ (((2
                                                                                     * (v176 & 0x97915143 ^ 0x39AD9307)) & 0x2B132684)
                                                                                   - (v176 & 0x97915143 ^ 0x39AD9307)
                                                                                   - 361347907));
  unsigned int v181 = v179 ^ 0x82D8998A ^ (v180 - ((2 * v180) & 0x1608D5F0) - 1962644744);
  LODWORD(v415) = v181 - ((2 * v181 - 149138106) & 0xE573C10E) - 297268436;
  unsigned int v182 = v181 - ((2 * v181 - 149138106) & 0xE573C10E) - 297268438;
  unsigned int v183 = v169 ^ 0xC82F0DF6;
  unsigned int v184 = 2
       * (((v169 ^ 0xC82F0DF6) & (v182 ^ 0xF2B9E087)) - ((2 * ((v169 ^ 0xC82F0DF6) & (v182 ^ 0xF2B9E087))) & 0x34005C66))
       + 872438886;
  unsigned int v185 = ((v183 + (v182 ^ 0xF2B9E087)) ^ 0x367B7BFE)
       + ((2 * (v183 + (v182 ^ 0xF2B9E087))) & 0x6CF6F7FC)
       + (v184 ^ 0x32044F67)
       + ((2 * v184) & 0xF3F7D9FC ^ 0x9FFF6733)
       + 1;
  HIDWORD(a16) = v179;
  LODWORD(a20) = v185 - ((2 * v185 + 117498370) & 0x71E47F8) + 1192203517;
  unsigned int v186 = -1296439527 * (a20 ^ 0x838F23FC) - ((1702088242 * (a20 ^ 0x838F23FC)) & 0x8267C1B4) + 1093918938;
  LODWORD(a21) = (v182 ^ 0xD461F78)
               + (v174 ^ 0x362903AD)
               + 1
               - ((2 * ((v182 ^ 0xD461F78) + (v174 ^ 0x362903AD) + 1)) & 0xB72C78BE)
               - 610911137;
  LODWORD(a33) = v179 ^ v182;
  unsigned int v188 = (((-1342177280 * (v182 ^ 0xF2B9E087) - ((3 * (v182 ^ 0xF2B9E087)) >> 1 << 30) - 492057291) ^ 0xE2ABCD35) & 0xF0000000 | ((1360347771 * (v182 ^ 0xF2B9E087) - ((573211894 * (v182 ^ 0xF2B9E087)) & 0x73D5D57A) - 1175786819) >> 4)) ^ 0xB9EAEAB;
  unsigned int v189 = v188 - ((2 * v188) & 0xBF87B890) + 1606671432;
  unsigned int v190 = v187 - ((2 * v187) & 0xBD951588) - 557151548;
  int v191 = (((-1367751104 * (a20 ^ 0x838F23FC) - ((1559465088 * (a20 ^ 0x838F23FC)) & 0x75BDEB80) + 987690493) ^ 0x3ADEF5FD) & 0xFFFFFFC0 | (v186 >> 26)) ^ 0x10;
  int v192 = v191 - 2 * (v191 & 0x3E06903F ^ (v186 >> 26) & 9);
  unsigned int v193 = (-1325400064 * (v179 ^ v182 ^ 0xFB6513F5) - ((1644167168 * (v179 ^ v182 ^ 0xFB6513F5)) & 0x44444444) + 578598415) ^ 0x227CB60F | ((-1690437711 * (v179 ^ v182 ^ 0xFB6513F5) - ((914091874 * (v179 ^ v182 ^ 0xFB6513F5)) & 0xD6B7563E) - 346313953) >> 8);
  unsigned int v194 = ((2 * v193) & 0xB9B7F60C ^ 0x196B604) + (v193 ^ 0xDC30A0AD);
  int v195 = (((2 * ((v190 ^ v189) & 0x2FAAA59A ^ 0xE802418)) | 0x4CF02BB6)
        - ((v190 ^ v189) & 0x2FAAA59A ^ 0xE802418)
        + 1502079525) ^ 0x7CE0375B;
  unsigned int v196 = (((2 * v195) | 0x6D270096) - v195 + 1231847349) ^ 0x6383825B | ((((v190 ^ v189) & 0x40044A60 ^ 0xB860F5B) - 1) & 0x40044B7A | (v190 ^ v189) & 0x90511005) ^ 0x8005595E;
  int v197 = v194 + 589563130 + ((v192 + 1040617526) ^ 0x560DAECA ^ (v196 + 1745567485 + (~(2 * v196) | 0x2FE98207)));
  unsigned int v198 = ((2 * v197) & 0xC9F7FF7C) + (v197 ^ 0xE4FBFFBE);
  unsigned int v199 = (1815720012 * v198 - 2 * ((1815720012 * v198 + 202339224) & 0x1F9C09DC ^ (1815720012 * v198) & 4) - 877953677) ^ 0x1F9C09DB | ((((907860006 * v198 + 1443346892) & 0xAA4C1E58) - 453930003 * v198 + 2144736237) >> 30);
  unsigned int v200 = (((-1118111680 * (v190 ^ 0xDECA8AC4) - ((2058743936 * (v190 ^ 0xDECA8AC4)) & 0x72591480) - 1188263338) ^ 0xB92C8A56) & 0xFFFFFFC0 | ((-420123679 * (v190 ^ 0xDECA8AC4) - ((-840247358 * (v190 ^ 0xDECA8AC4)) & 0xD0ED5F1C) + 1752608654) >> 26)) ^ 0x1A;
  unsigned int v201 = v200 - 1113580550 + (~(2 * v200) | 0x84BFC80D);
  unsigned int v202 = v199 - ((2 * v199) & 0xA2CAF4DC) + 1365604974;
  unsigned int v203 = (166454526 * ((v192 + 1040617526) ^ 0x3E069036)
        - ((332909052 * ((v192 + 1040617526) ^ 0x3E069036)) & 0x4BB3A47C)) & 0xFFFFFFFE | ((-2064256385
                                                                                          * ((v192 + 1040617526) ^ 0x3E069036)
                                                                                          - ((166454526
                                                                                            * ((v192 + 1040617526) ^ 0x3E069036)) & 0x8257BF70)
                                                                                          + 1093394360) >> 31);
  unsigned int v204 = ((2 * (v203 - 1512451522)) & 0xFEF37CEA ^ 0x4AB32468) + ((v203 - 1512451522) ^ 0xDAA06C4B);
  unsigned int v205 = ((-1038913808 * v194 - ((-2077827616 * v194 + 2095852736) & 0xB87339E0) + 447722322) ^ 0xDC399CF2) & 0xFFFFFFF0 | ((2082551535 * v194 - ((-129864226 * v194 + 1204732620) & 0xB212103C) + 2096130436) >> 28);
  unsigned int v206 = v204
       - 2138685045
       + (v201 ^ 0xECC56197 ^ v202)
       - ((2 * (v204 - 2138685045 + (v201 ^ 0xECC56197 ^ v202))) & 0x4525E832)
       - 1567427559;
  int v207 = (v205 ^ 5) - ((2 * v205) & 0x40011B04) - 1610576510;
  unsigned int v208 = (((-860618752 * (v202 ^ 0x51657A6E) - ((157810688 * (v202 ^ 0x51657A6E)) & 0xAE00000) + 91334720) ^ 0x571A840) & 0xFFFC0000 | ((1042658093 * (v202 ^ 0x51657A6E) - ((1011574362 * (v202 ^ 0x51657A6E)) & 0x34AA38B2) + 441785433) >> 14)) ^ 0x6954;
  unsigned int v209 = (((1115684864 * v204 - ((83886080 * v204 + 922746880) & 0x76000000) + 1453960687) ^ 0xBB29ADEF) & 0xFF800000 | ((-2050956155 * v204 - ((193054986 * v204 + 1858056814) & 0xD4EBA80E) - 1579832002) >> 9)) ^ 0x753AEA;
  unsigned int v210 = ((1834029632 * (v207 ^ 0x292799B ^ v206) - ((-626908032 * (v207 ^ 0x292799B ^ v206)) & 0x945C8A80) - 902937249) ^ 0xCA2E455F) & 0xFFFFFFC0 | ((1840596041 * (v207 ^ 0x292799B ^ v206) - ((-613775214 * (v207 ^ 0x292799B ^ v206)) & 0xE4C928EE) - 228289417) >> 26);
  unsigned int v211 = ((2 * v210) & 0xFF5AFFFE ^ 0x78) + (v210 ^ 0xFFAD7FC3);
  unsigned int v212 = v208 - ((2 * v208) & 0x8EBAC4B0) - 950181288;
  unsigned int v213 = ((v209 - ((2 * v209) & 0xC0714D8A) - 533158203) ^ 0x2765C49D ^ v212) + 5406721 + v211;
  unsigned int v214 = ((-913686536 * (v207 ^ 0xA0008D82) - ((-1827373072 * (v207 ^ 0xA0008D82)) & 0xA4D17400) + 1382595073) ^ 0x5268BA01) & 0xFFFFFFF8 | ((-114210817 * (v207 ^ 0xA0008D82) - ((1919062014 * (v207 ^ 0xA0008D82)) & 0x40DA4006) + 544022531) >> 29);
  unsigned int v215 = ((2 * v214) & 0xE9FFB3FE ^ 2) + (v214 ^ 0x74FFD9FE);
  unsigned int v216 = (v213 ^ 0x7B31EBDF) - v215 + ((2 * v213) & 0xF663D7BE);
  unsigned int v217 = 1305674127 * v211 - ((-1683619042 * v211 - 1664023778) & 0xDE28E110) + 1031598615;
  int v218 = (207130915 * v216 + 638037600) & 0x7F6E411E ^ (207130915 * v216) & 4;
  unsigned int v219 = (((806940672 * v211 - ((1613881344 * v211 + 271704064) & 0xDB9DA000) - 169359647) ^ 0x6DCED6E1) & 0xFFFFF000 | (v217 >> 20)) ^ 0xEF1;
  int v220 = v219 - 2 * (v219 & 0x7C6294CA ^ (v217 >> 20) & 2) + 2086835400;
  unsigned int v221 = (1657047320 * v216 - ((-980872656 * v216 + 1618667008) & 0xAD5F6320) + 116204693) ^ 0xD6AFB195;
  unsigned int v222 = ((-1543503872 * (v212 ^ 0xC75D6258) - ((((v212 ^ 0xC75D6258) + 8 * v212) << 27) & 0x58000000) + 776147340) ^ 0x2E43118C) & 0xFC000000 | ((49236329 * (v212 ^ 0xC75D6258) - ((98472658 * (v212 ^ 0xC75D6258)) & 0x4BEB9C18) + 636866060) >> 6);
  int v223 = ((2 * v222) & 0x37ED5DF4 ^ 0x12D0C70) + (v222 ^ 0x1B6179C2);
  unsigned int v224 = (v220 ^ 0x839D6B37) + v223 - ((2 * ((v220 ^ 0x839D6B37) + v223) - 938302962) & 0xF22BC2BA) + 1562325604;
  unsigned int v225 = ((-922746880 * v215 - ((301989888 * v215 + 301989888) & 0x56000000) - 201050444) ^ 0x2B0436B4) & 0xFF000000 | ((-116661559 * v215 - ((303547794 * v215 + 527135122) & 0x1503CC18) - 365453611) >> 8);
  int v226 = (v225 ^ 0x53D731D) + ((2 * v225) & 0xA6FE5F6 ^ 0x501C5) - v223 + 1;
  unsigned int v227 = v226 - ((2 * v226 + 763197434) & 0xD9ADA518) + 60133001;
  unsigned int v228 = (v221 & 0xFFFFFFF8 | ((2 * v218 - 207130915 * v216 - 628486011) >> 29))
       - 2 * ((v221 & 0x77BC2138 | ((2 * v218 - 207130915 * v216 - 628486011) >> 29) & 0x77BC2139) ^ v221 & 0x10)
       + 2008817961;
  int v229 = v220 ^ v227 ^ v228;
  unsigned int v230 = (v229 ^ 0x18F79892)
       + ((1003479026 * (v228 ^ 0x515F35FD ^ v224)) & 0xEFD67BB6)
       + ((501739513 * (v228 ^ 0x515F35FD ^ v224)) ^ 0xF7EB3DDB)
       + 135578150;
  int v231 = ((2 * v230) & 0x7FEFFEEC)
       + (v230 ^ 0x3FF7FF76)
       - ((2 * (((2 * v230) & 0x7FEFFEEC) + (v230 ^ 0x3FF7FF76)) + 25399336) & 0x1305B54)
       + 89781694;
  HIDWORD(v416) = v220;
  LODWORD(a27) = v220 ^ v231;
  unsigned int v232 = v220 ^ v231 ^ 0xFCFAB962;
  unsigned int v233 = 1654073321 * v232 - ((-986820654 * v232) & 0x9F47B2E8) - 811345548;
  unsigned int v234 = (((669581312 * v232 - ((1339162624 * v232) & 0x83AC0000) + 1104572306) ^ 0x41D66F92) & 0xFFFF0000 | HIWORD(v233)) ^ 0xCFA3;
  int v235 = v234 - 2 * (v234 & 0x5F27B17F ^ HIWORD(v233) & 0xC) + 1596436851;
  int v236 = (v231 ^ 0x7F67D255) + 1;
  unsigned int v417 = v236 + (v228 ^ 0x77BC2129) - ((2 * (v236 + (v228 ^ 0x77BC2129))) & 0xF1081764) - 125563982;
  LODWORD(a31) = v236 + (v229 ^ 0xE708676D) - ((2 * (v236 + (v229 ^ 0xE708676D))) & 0xD2154480) - 385179072;
  unsigned int v237 = -1730838528 * (v417 ^ 0xF8840BB2) - ((833290240 * (v417 ^ 0xF8840BB2)) & 0xB2BF0000) - 648051234;
  unsigned int v238 = (((24903680 * (v231 ^ 0x80982DAA) - ((49807360 * (v231 ^ 0x80982DAA)) & 0x4CB00000) - 1504026065) ^ 0xA65A622F) & 0xFFFC0000 | ((-1954414497 * (v231 ^ 0x80982DAA) - ((386138302 * (v231 ^ 0x80982DAA)) & 0xDAEE1888) + 1836518468) >> 14)) ^ 0x1B5DC;
  unsigned int v239 = v238 - ((2 * v238) & 0xFA817BF8) - 46088708;
  int v240 = ((83886080 * (a31 ^ 0xE90AA240)
         - ((((a31 ^ 0xE90AA240) + 4 * (_DWORD)a31) << 25) & 0xAE000000)
         - 681572238) ^ 0xD7600872) & 0xFF000000 | ((1118063365 * (a31 ^ 0xE90AA240)
  unsigned int v241 = ((2 * v240) & 0xF7FFF1B8 ^ 0x1B55110) + (v240 ^ 0xFB255055);
  unsigned int v242 = ((v237 & 0xE71B8000 ^ 0x87118000) - ((2 * (v237 & 0xE71B8000 ^ 0x87118000)) & 0x8110000) + 476612835) ^ 0x5AE8FE63;
  unsigned int v243 = ((2 * v242) | 0xCE010B7C) - v242 + 419396162;
  unsigned int v244 = (1201746347 * (v417 ^ 0xF8840BB2) - ((-1891474602 * (v417 ^ 0xF8840BB2)) & 0xC15CF926) - 525435757) >> 17;
  HIDWORD(v83) = ((v243 ^ 0xE78AF33E | v244 & 0xD4D ^ 0x45)
                - 2 * ((v243 ^ 0xE78AF33E | v244 & 0xD4D ^ 0x45) & 0x20E1CF ^ (v243 ^ 0xE78AF33E) & 2)
                + 10543565) ^ 0xA0E1CD;
  LODWORD(v83) = v243 ^ 0xE7FFFFFF;
  int v245 = (v83 >> 24) - ((2 * (v83 >> 24)) & 0xDB60B8A);
  unsigned int v246 = ((v237 & 0x8040000 ^ 0x48040C96) - (v237 & 0x8040000) + (v237 & 0x18E40000 ^ 0xA00000)) & 0xFFFC000F;
  HIDWORD(v83) = v246 ^ 0xE00006;
  LODWORD(v83) = v246 ^ 0x50000000;
  int v247 = (v245 + 115017157) ^ 0x6DB05C5 | ((v83 >> 24) - ((2 * (v83 >> 24)) & 0x480000A6) + 613851475) ^ 0x2496A153;
  unsigned int v248 = v247 - ((2 * v247) & 0xDEC1185C) + 1868598318;
  unsigned int v249 = -500708777 * v241 - ((-1001417554 * v241 - 2143180168) & 0xEBF48EC2) + 907746461;
  HIDWORD(v83) = v248 ^ 0x52;
  LODWORD(v83) = v248 ^ 0xAA56C400;
  int v250 = ((v244 & 0x12 ^ 0x9DB58103) + (v244 & 0x72A0 ^ 0x20087409) - 2) ^ 0x86A3458A ^ ((v83 >> 8)
                                                                                       - ((2 * (v83 >> 8)) & 0x8FB7EDB4)
                                                                                       + 1205597914);
  int v251 = (((v239 ^ 0xA2670C8F ^ v235) + 67110692 + v241) ^ 0xDFBEBE79)
       + ((2 * ((v239 ^ 0xA2670C8F ^ v235) + 67110692 + v241)) & 0xBF7D7CF2)
       + 541147527
       + v250;
  unsigned int v252 = 1045608448 * v241 - ((2091216896 * v241 + 223592448) & 0x9490A000) + 1358051173;
  unsigned int v253 = (((1396588544 * (((2 * v251) & 0xBDA7EFFE) + (v251 ^ 0xDED3F7FF))
          - ((-1501790208 * (((2 * v251) & 0xBDA7EFFE) + (v251 ^ 0xDED3F7FF)) - 1971552256) & 0xFC570000)
          + 1131013240) ^ 0xFE2BA478) & 0xFFFFC000 | ((-598913799 * (((2 * v251) & 0xBDA7EFFE) + (v251 ^ 0xDED3F7FF))
                                                     - ((-1197827598 * (((2 * v251) & 0xBDA7EFFE) + (v251 ^ 0xDED3F7FF))
                                                       + 889334258) & 0xB65650EE)
                                                     - 173261456) >> 18)) ^ 0x16CA;
  unsigned int v254 = (((-1543503872 * (v235 ^ 0x5F27B173) - (((v235 ^ 0x5F27B173) << 27) & 0x28000000) - 1781147838) ^ 0x95D5D742) & 0xFC000000 | (((~(17335762 * (v235 ^ 0x5F27B173)) | 0x69EE24C9) - 2138815767 * (v235 ^ 0x5F27B173u) - 888607332) >> 6)) ^ 0x32C23B6;
  int v255 = ((v249 >> 20) & 0xDFC ^ 0xD5C) + ((v249 >> 21) ^ 0x7F7FA951);
  int v256 = v255 - 2139074302;
  unsigned int v257 = v255
       + (((v255 - 2139074302) | v252 ^ 0x4A485765) ^ 0x58AA000)
       - ((2 * ((v255 - 2139074302) | v252 ^ 0x4A485765)) & 0xF4EABFFE)
       + 1;
  unsigned int v258 = ((809500672 * v250 - ((1619001344 * v250) & 0xA7800000) - 739922761) ^ 0xD3E5ACB7) & 0xFFC00000 | ((-321459007 * v250 - ((1504565634 * v250) & 0x7F45C092u) + 1067638857) >> 10);
  unsigned int v259 = ((2 * v258) & 0xD5EDDFFE ^ 0xDD170) + (v258 ^ 0x6AF90747);
  unsigned int v260 = (v252 ^ ((v252 ^ 0xB5B7A89A) - ((2 * (v252 ^ 0xB5B7A89A) + 2) & 0x3DD21000) - 1628894960) ^ 0xB00B0534 ^ (v257 - ((2 * v257 - 169123326) & 0xC954B6BC) - 543159201))
       + v256;
  unsigned int v261 = (v254 - ((2 * v254) & 0xC6A7556C) - 481056074) ^ 0xA65AC12F;
  unsigned int v262 = v253 - ((2 * v253) & 0x8A12D732) + 1158245273;
  int v263 = (v261 ^ v262) - v259 - ((2 * ((v261 ^ v262) - v259) + 1441652734) & 0x4512F632) + 226519832;
  int v264 = v260 - ((2 * v260) & 0x1C21CDA8) + 235988692;
  unsigned int v265 = 2
       * (((v263 ^ 0xA2897B19) & (v264 ^ 0xE10E6D4)) - ((2 * ((v263 ^ 0xA2897B19) & (v264 ^ 0xE10E6D4))) & 0x513E7B56))
       - 784434346;
  unsigned int v266 = (v264 ^ 0xAC999DCD ^ v263) + (v265 ^ 0x6E4285EB) + 1082327363 + ((2 * v265) & 0x7EF9FD78 ^ 0x2278F428);
  unsigned int v267 = ((5843480 * (((2 * v266) & 0xED5D3E2E) + (v266 ^ 0xF6AE9F17))
         - ((11686960 * (((2 * v266) & 0xED5D3E2E) + (v266 ^ 0xF6AE9F17)) - 720330832) & 0xAC858660)
         + 1087050511) ^ 0x5642C337) & 0xFFFFFFF8 | ((1074472259 * (((2 * v266) & 0xED5D3E2E) + (v266 ^ 0xF6AE9F17))
                                                    - ((-2146022778 * (((2 * v266) & 0xED5D3E2E) + (v266 ^ 0xF6AE9F17))
                                                      + 983700470) & 0x82E04BB6)
                                                    - 557764650) >> 29);
  unsigned int v268 = ((2 * v267) & 0xBADF55BE ^ 4) + (v267 ^ 0xDD6FAADD);
  unsigned int v269 = ((423272448 * v259 - ((846544896 * v259 - 965394432) & 0xFC750000) - 512414349) ^ 0x7E3A8D73) & 0xFFFFE000 | ((-1340552747 * v259 - ((1613861802 * v259 - 1671023702) & 0xDCBBE298) - 1131345119) >> 19);
  unsigned int v270 = ((-404862976 * (v262 ^ 0x45096B99) - ((-809725952 * (v262 ^ 0x45096B99)) & 0xA06AC000) - 801808289) ^ 0xD035605F) & 0xFFFFF800 | ((790428617 * (v262 ^ 0x45096B99) - ((238679954 * (v262 ^ 0x45096B99)) & 0x81BB488) + 68016708) >> 21);
  unsigned int v271 = ((2 * v270) & 0xD4CFBDDE ^ 0x40) + (v270 ^ 0xEA67DECF);
  unsigned int v272 = (((-1582301184 * (v264 ^ 0xE10E6D4) - ((1130364928 * (v264 ^ 0xE10E6D4)) & 0x6FE00000) + 939075110) ^ 0x37F92626) & 0xFFF00000 | ((502667803 * (v264 ^ 0xE10E6D4) - ((65811510 * (v264 ^ 0xE10E6D4)) & 0x366BFE0u) - 2118950928) >> 12)) ^ 0x81B35;
  unsigned int v273 = v272 - ((2 * v272) & 0xAD579552);
  unsigned int v274 = ((2 * v269) & 0x794FF2EA ^ 0x1282) + (v269 ^ 0x3CA7F4BE) + v271 + v268;
  int v275 = v274 - ((2 * v274 + 922810746) & 0x312367D2) + 336736422;
  HIDWORD(v83) = ~v271;
  LODWORD(v83) = 1620640691 * v271 - ((-1053685914 * v271 + 165061574) & 0xADF94F76) + 1541929374;
  int v276 = ((v83 >> 1) & 0x6FD3EFDE ^ 0x2B5243DC) + ((v83 >> 2) ^ 0xA256DE01);
  unsigned int v277 = -2010583713 * v268 - ((273799870 * v268 - 1894889346) & 0xAC95E8D4) + 500308137;
  unsigned int v278 = (-1207959552 * ((v273 - 693384535) ^ 0xD6ABCAA9)
        - ((1879048192 * ((v273 - 693384535) ^ 0xD6ABCAA9)) & 0xBFFFFFFF)
        - 544978045) ^ 0xDF844B83 | ((-763743529 * ((v273 - 693384535) ^ 0xD6ABCAA9)
                                    - ((619996590 * ((v273 - 693384535) ^ 0xD6ABCAA9)) & 0x5CB6C9D2)
                                    - 1369742103) >> 5);
  int v279 = ((2 * v278) & 0x6EFF75FE ^ 0xAE5344E) + (v278 ^ 0xB20D61D8) + v276;
  unsigned int v280 = (((470482944 * ((v273 - 693384535) ^ 0xCE3A7940 ^ v275)
          - ((940965888 * ((v273 - 693384535) ^ 0xCE3A7940 ^ v275)) & 0x99840000)
          - 859668656) ^ 0xCCC27F50) & 0xFFFF0000 | ((-642049013 * ((v273 - 693384535) ^ 0xCE3A7940 ^ v275)
                                                    - ((326514710 * ((v273 - 693384535) ^ 0xCE3A7940 ^ v275)) & 0x18C206A4)
                                                    + 207684434) >> 16)) ^ 0xC61;
  unsigned int v281 = v280 - ((2 * v280) & 0x22ED3DC0);
  unsigned int v282 = (((-312541184 * v268 - ((-625082368 * v268 + 1216217088) & 0xA57A0000) + 1996259446) ^ 0x52BD8076) & 0xFFFF0000 | HIWORD(v277)) ^ 0xD64A;
  int v283 = v282 - 2 * (v282 & 0x6D3C39DF ^ HIWORD(v277) & 0x10) + 1832663503;
  unsigned int v284 = 475398709
       * (((2 * (v276 + 1209403410 + (v283 ^ 0x92C3C630))) & 0x7B7FBF72)
        + ((v276 + 1209403410 + (v283 ^ 0x92C3C630)) ^ 0xBDBFDFB9));
  unsigned int v285 = v281 + 292986592;
  unsigned int v286 = ((v281 + 292986592) ^ 0xEE89611F) - 936133571 + v284 + 1;
  unsigned int v287 = (v279 - 2 * ((v279 + 278285586) & 0x3667723D ^ v279 & 1) + 1191034702) ^ 0xDB5B4BF3 ^ v283;
  LODWORD(STACK[0x228]) = v285 ^ 0x11769EE0;
  unsigned int v288 = ((v285 ^ 0x11769EE0) + v287) ^ 0xF736DC6F;
  unsigned int v289 = (2 * ((v285 ^ 0x11769EE0) + v287)) & 0xEE6DB8DE;
  unsigned int v290 = v287 - 936133571 + v284;
  unsigned int v291 = v290 ^ 0xFB8FDFF5;
  unsigned int v292 = (2 * v290) & 0xF71FBFEA;
  unsigned int v293 = v288 + 147399569 + v289;
  unsigned int v294 = ((v286 ^ 0x70FCFFDC) - 1895628764 + ((2 * v286) & 0xE1F9FFB8)) & v293;
  int v295 = 2 * (v294 - ((2 * v294) & 0x7CCD8CC2)) + 2093845698;
  unsigned int v296 = v291 + v292 + (v295 ^ 0xF76D1C49) + ((2 * v295) & 0xE8BEDEE8 ^ 0x1765E77F) + 1;
  int v297 = -260289343 * v296
       - 2 * ((-260289343 * v296 + 353709952) & 0x1AA00A3E ^ (-260289343 * v296) & 0x12)
       + 1337276844;
  unsigned int v298 = ((2 * ((v283 ^ 0x6D3C39CF) + (v297 ^ 0x1AA00A2C))) & 0xDFABFB76)
       + (((v283 ^ 0x6D3C39CF) + (v297 ^ 0x1AA00A2C)) ^ 0xEFD5FDBB);
  LODWORD(STACK[0x163C]) = v118;
  LODWORD(STACK[0x1640]) = v182;
  LODWORD(STACK[0x1648]) = v231 ^ 0x80982DAA;
  LODWORD(STACK[0x164C]) = v297;
  LODWORD(a19) = v285 ^ v297;
  LODWORD(a35) = v293 + (v297 ^ 0x1AA00A2C) - ((2 * (v293 + (v297 ^ 0x1AA00A2C))) & 0x97AB3DF2) - 875192583;
  unsigned int v299 = (-469762048 * v296 - ((-939524096 * v296) & 0xEFFFFFFF) - 150890709) ^ 0xF701972B | ((2118451577 * v296
                                                                                             - 2
                                                                                             * ((2118451577 * v296
                                                                                               + 388649856) & 0x7D0C0C7A ^ (2118451577 * v296) & 8)
                                                                                             + 339107826) >> 6);
  unsigned int v300 = v299 ^ 0xEE4A6FCA;
  unsigned int v301 = (2 * v299) & 0xDF7CBFF6 ^ 0x3682062;
  unsigned int v302 = ((652943360 * v298 - ((232144896 * v298 + 658456576) & 0x2F164000) - 1423259117) ^ 0x178B2A13) & 0xFFFFE000 | ((-574539943 * v298 - ((-1149079886 * v298 - 667338246) & 0x9BF68EAC) - 1172839341) >> 19);
  unsigned int v303 = ((2 * v302) & 0xFFBF33BC ^ 0x333C) + (v302 ^ 0x7FDF8061);
  int v304 = ((485871272 * (a19 ^ 0xBD694CC) - ((32218448 * (a19 ^ 0xBD694CC)) & 0x4D345F0) - 2107006209) ^ 0x8269A2FF) & 0xFFFFFFF8 | ((-1013007915 * (a19 ^ 0xBD694CC) - ((-2026015830 * (a19 ^ 0xBD694CC)) & 0x91D2F90E) + 1223261319) >> 29);
  unsigned int v305 = ((2 * v304) & 0xFB4DFBFE ^ 4) + (v304 ^ 0xFDA6FDFD);
  unsigned int v306 = -381521339 * v303 - 2 * ((-381521339 * v303 + 1023060778) & 0x554B42B3 ^ (-381521339 * v303) & 1) + 306572764;
  int v307 = (~(1114785024 * v303 - 89445888) | 0x426D18FF) - 1590091136 * v303 - 601945875;
  int v308 = ((-1275068416 * (a35 ^ 0xCBD59EF9) - ((1744830464 * (a35 ^ 0xCBD59EF9)) & 0x78000000) + 1069142797) ^ 0x3FB9D30D) & 0xFC000000 | ((-1206758611 * (a35 ^ 0xCBD59EF9) - ((1881450074 * (a35 ^ 0xCBD59EF9)) & 0xC9A013E0) + 1691355632) >> 6);
  unsigned int v309 = ((2 * v308) & 0xEDFDFE5E ^ 0x124804E) + (v308 ^ 0xF76DBF08);
  int v310 = v309 - (v303 + v305) + v300 + v301 - 426579241;
  int v311 = -536870912 * ((3 * (_BYTE)v310) & 3) - 1342177280 * v310;
  unsigned int v312 = 1518309211 * v310 - ((889134774 * v310 + 1642013288) & 0x6C1BA13E) - 1493343789;
  unsigned int v313 = 1497170921 * v305 - ((-1300625454 * v305 + 42707922) & 0xACDACFB2) + 1471364546;
  unsigned int v314 = ((-200301568 * v305 - ((-400603136 * v305 + 783239168) & 0xB369B800) - 250838583) ^ 0xD9B4DDC9) & 0xFFFFFC00 | (v313 >> 22);
  unsigned int v315 = ((2 * v314) & 0xF7FEFEC6 ^ 0x282) + (v314 ^ 0xFBFF7E3A);
  int v316 = ((v306 >> 25) ^ 0x6A | v307 ^ 0x5EC973EC)
       - 2 * (((v306 >> 25) ^ 0x6A | v307 ^ 0x5EC973EC) & 0x6D45CA5F ^ ((v306 >> 25) ^ 0x6A) & 2)
       - 314193315;
  unsigned int v317 = (((v311 - 24406161) ^ 0xBE8B976F) & 0xF0000000 | (v312 >> 4)) ^ 0xB60DD09;
  unsigned int v318 = v317 - ((2 * v317) & 0xD487D818) - 364647412;
  unsigned int v319 = 585138875 * (v318 ^ 0xEA43EC0C) - ((1170277750 * (v318 ^ 0xEA43EC0C)) & 0x7C1754DA) - 1106531731;
  unsigned int v320 = -2101673984 * (v318 ^ 0xEA43EC0C) - ((91619328 * (v318 ^ 0xEA43EC0C)) & 0xB0A00000);
  unsigned int v321 = (((~(160651776 * v309 + 726432256) | 0xBA095BFF) - 2067157760 * v309 + 950112072) ^ 0x22FB5247) & 0xFFFFFF00 | ((-1350252115 * v309 - ((520721242 * v309 + 338381946) & 0x3142672E) - 1028204076) >> 24);
  unsigned int v322 = ((2 * v321) & 0xFFDFFF76 ^ 0x130) + (v321 ^ 0xFFEFFF23);
  unsigned int v323 = v315
       + (((v316 ^ 0x7062651 ^ v318) - v322 - 1048645) ^ 0x76BF3BDF)
       + ((2 * ((v316 ^ 0x7062651 ^ v318) - v322 - 1048645)) & 0xED7E77BE)
       + 1544799733;
  unsigned int v324 = 1393874611 * v323 - ((640265574 * v323 + 989813014) & 0x38B4DA8E) - 1713759790;
  unsigned int v325 = -1248329728 * v323 - ((1798307840 * v323 - 927989760) & 0x8A800000) - 1449380989;
  unsigned int v326 = (((v320 + 1481655694) ^ 0x5850458E) & 0xFFFF0000 | HIWORD(v319)) ^ 0xBE0B;
  unsigned int v327 = 44292883 * v322 - ((88585766 * v322 + 246683710) & 0x2DC77404) + 2117977633;
  LOBYTE(v322) = ((v108 & 0x18 ^ 0xE) + 26) & 0x18;
  unsigned int v328 = ((16 * v313) | 0xFBFFFFFF) - 2046820352 * v315 + 831139824;
  unsigned int v329 = ((2 * ((v325 ^ 0x45443383) & 0xFFF80000 | (v324 >> 13))) & 0xBBFBFFFC ^ 0x1C5A4)
       + (((v325 ^ 0x45443383) & 0xFFF80000 | (v324 >> 13)) ^ 0x5DFD1D2D);
  unsigned int v330 = ((v328 ^ 0x38A2FEF) & 0xFE000000 | ((-1084615357 * v315
                                            - ((2125736582 * v315 + 1640043566) & 0x40232A34)
                                            + 284303153) >> 7)) ^ 0x140232A;
  int v331 = v330 - ((2 * v330) & 0x722334BE) - 1190028705;
  int v332 = v326 - ((2 * v326) & 0x3850BEB6) + 472407899;
  int v333 = v332 ^ 0x1C285F5B;
  unsigned int v334 = -1037212931 * (v332 ^ 0x1C285F5B) - ((73057786 * (v332 ^ 0x1C285F5B)) & 0xE3D73E8) - 2028029452;
  unsigned int v335 = (v331 ^ 0xA539C504 ^ v332)
       - v329
       + 1576927230
       - ((2 * ((v331 ^ 0xA539C504 ^ v332) - v329 + 1576927230)) & 0xC56A51E0)
       + 1656039664;
  unsigned int v336 = ((((v327 ^ 0x16E3BA02) << (v322 ^ 8)) - ((2 * ((v327 ^ 0x16E3BA02) << (v322 ^ 8))) & 0xFF3005F2) - 6814983) ^ 0xFF9802F9) << (v322 ^ 0x10);
  unsigned int v337 = ((v327 >> 7) & 0x1F4FFF6 ^ 0x24C774)
       + ((v327 >> 8) ^ 0xDEEC9C41)
       + (v336 ^ 0xF49F7FED)
       + ((2 * v336) & 0xE93EFFDA);
  int v338 = v337 - 2 * ((v337 + 208011288) & 0xBC3075F ^ v337 & 7) + 942212976;
  unsigned int v339 = (((102760448 * v329 - ((205520896 * v329 + 411041792) & 0x9DC00000) - 616932863) ^ 0xCEFA5A01) & 0xFFE00000 | ((-1155489743 * v329 - ((1983987810 * v329 + 1900445892) & 0xD4F95BF0) - 1558188454) >> 11)) ^ 0x1D4F95;
  BOOL v340 = (v335 ^ v338) == 1769353128;
  unsigned int v341 = (-637534208 * (v335 ^ v338 ^ 0x69762FA8)
        - ((-1275068416 * (v335 ^ v338 ^ 0x69762FA8)) & 0xBBBBBBBB)
        + 1547794310) ^ 0x5C417786 | ((1553902573 * (v335 ^ v338 ^ 0x69762FA8)
                                     - ((960321498 * (v335 ^ v338 ^ 0x69762FA8)) & 0x49E4F5B6)
                                     - 1527612709) >> 7);
  unsigned int v342 = ((2 * v341) & 0xF3DDDCBE ^ 0x291C8AA) + (v341 ^ 0x78A70AAA);
  unsigned int v343 = (((802160640 * v333 - ((1604321280 * v333) & 0x8A200000) + 1158900598) ^ 0x45136B76) & 0xFFF00000 | (v334 >> 12)) ^ 0x871EB;
  unsigned int v344 = v343 - ((2 * v343) & 0xB1568444) + 1487618594;
  unsigned int v345 = (((-1685487616 * (v338 ^ 0xBC30758) - ((923992064 * (v338 ^ 0xBC30758)) & 0x84CF0000) + 1114083267) ^ 0x42678FC3) & 0xFFFF8000 | ((-1013762285 * (v338 ^ 0xBC30758) - ((119959078 * (v338 ^ 0xBC30758)) & 0x6F0E99E6u) - 1215869709) >> 17)) ^ 0x5BC3;
  unsigned int v346 = v339 - ((2 * v339) & 0xA2CEE35A) - 781749843;
  unsigned int v347 = (v346 ^ 0xD16771AD)
       + (((v344 ^ 0x58AB4222) - v342 + 2045701727) ^ 0xFC7FFDEF)
       + ((2 * ((v344 ^ 0x58AB4222) - v342 + 2045701727)) & 0xF8FFFBDE)
       + 355297996;
  v342 -= 2045701727;
  unsigned int v348 = v342 + ((v345 - ((2 * v345) & 0xB898A910) + 1548506248) ^ v344 ^ v346 ^ 0xD5806707);
  unsigned int v349 = v348 - ((2 * v348) & 0xDEF19FF0) - 277295112;
  unsigned int v350 = v349 ^ 0x8BDD4BDE ^ (-174343781 * (((2 * v347) & 0xD7FFECBC) + (v347 ^ 0xEBFFF65E))
                            - ((-348687562 * (((2 * v347) & 0xD7FFECBC) + (v347 ^ 0xEBFFF65E)) + 69455404) & 0xC94B084C)
                            + 1723296572);
  int v351 = 698029099 * v350 - ((322316374 * v350) & 0x1816EEEA) - 1945405579;
  LODWORD(a28) = v346 ^ v351;
  int v352 = v346 ^ v351 ^ 0x5D6C06D8;
  LODWORD(a39) = v342 + (v351 ^ 0x8C0B7775) - ((2 * (v342 + (v351 ^ 0x8C0B7775))) & 0x6185848C) - 1329413562;
  int v353 = a39 ^ 0xB0C2C246;
  unsigned int v354 = -1656869415 * v353 - ((981228466 * v353) & 0x2D16C0B4) + 378232922;
  unsigned int v355 = 1541872627 * v350 - ((399390694 * v350) & 0x1EAA6790) + 257242056;
  unsigned int v356 = -1670394880 * v350 - ((954177536 * v350) & 0x9917F800);
  unsigned int v357 = -244398080 * v353 - ((-488796160 * v353) & 0xC72F8000) - 476592548;
  unsigned int v358 = ((v357 & 0x6E12C000 ^ 0xF3FFFAA6) - ((2 * (v357 & 0x6E12C000 ^ 0xF3FFFAA6)) & 0x8C008000) + 1148990536) ^ 0x47845000;
  unsigned int v359 = v357 ^ 0xE397C65C;
  if (v340) {
    int v360 = -2048;
  }
  else {
    int v360 = v358;
  }
  unsigned int v361 = (v360 & v359) - ((2 * (v360 & v359)) & 0x811BB000);
  LODWORD(v416) = v349;
  LODWORD(a29) = v349 ^ v351;
  int v362 = v349 ^ v351 ^ 0x6373B88D;
  unsigned int v363 = -2139717463 * v362 - ((15532370 * v362) & 0x5607155E) - 1425831249;
  unsigned int v364 = ((v356 - 863240516) ^ 0xCC8BFEBC) & 0xFFFFFC00 | (v355 >> 22);
  unsigned int v365 = (v361 - 1064444524) ^ 0xC08DDD94 | (v354 >> 21) ^ 0xB4;
  unsigned int v366 = ((2 * v365) & 0xDEA7FFF6) + (v365 ^ 0xEF53FFFB);
  unsigned int v367 = (((1079279616 * v362 - ((-2136408064 * v362) & 0xEA9A0000) + 1968007152) ^ 0x754D67F0) & 0xFFFF8000 | (v363 >> 17)) ^ 0x5581;
  unsigned int v368 = ((-1511489536 * v352 - ((1271988224 * v352) & 0x65850000) - 1295863652) ^ 0xB2C2B09C) & 0xFFFF8000 | ((-1585755183 * v352 - ((1123456930 * v352) & 0xCDFF6500) + 1728033408) >> 17);
  unsigned int v369 = ((2 * v368) & 0xFD3EDFBE ^ 0x46BE) + (v368 ^ 0xFE9F5CA0);
  unsigned int v370 = (v364 ^ 0xB6EFBDEA) + ((2 * v364) & 0x6DDF7BAE ^ 0x2A) + v369 - v366;
  int v371 = v367 - 2 * (v367 & 0x262018BE ^ (v363 >> 17) & 0xC) - 1507845966;
  unsigned int v372 = v371 ^ 0xCBAF9F4B ^ (v370 - ((2 * v370 + 1938400394) & 0xDB1F0FF2) - 1487644098);
  unsigned int v373 = -1470272127 * (v371 ^ 0xA62018B2) - ((12245762 * (v371 ^ 0xA62018B2)) & 0x6F67342) - 2089076319;
  unsigned int v374 = ((322961408 * v369 - ((645922816 * v369 - 159383552) & 0xCF000000) - 487286293) ^ 0x67B499EB) & 0xFFC00000 | ((2045702221 * v369 - 1945610835 - ((64872602 * v369 + 28349402) & 0x6601856) + 107) >> 10);
  unsigned int v375 = ((2 * v374) & 0x4BE1D8E6 ^ 0x19806) + (v374 ^ 0xA5F02070);
  unsigned int v376 = ((1952016048 * v372 - ((-390935200 * v372) & 0xFAAC8560) - 44678469) ^ 0xFD5642BB) & 0xFFFFFFF0 | ((1732613739 * v372 - ((-829739818 * v372) & 0xC0E26170) - 529452872) >> 28);
  unsigned int v377 = ((2 * v376) & 0xDFDFF76E ^ 0xC) + (v376 ^ 0x6FEFFBB9);
  unsigned int v378 = ((805306368 * v366 + 1661665141) ^ 0x730AFF75) & 0xF0000000 | ((-832121027 * v366
                                                                       - ((80588410 * v366 + 33319010) & 0x418FCB4)
                                                                       - 150293877) >> 4);
  unsigned int v379 = ((2 * v378) & 0xED3FFBA8 ^ 0x18B88) + (v378 ^ 0xFEBF3A31);
  unsigned int v380 = (((-(((v371 ^ 0xA62018B2) << 25) & 0x4E000000) - 2130706432 * (v371 ^ 0xA62018B2) - 1481380420) ^ 0xA7B3EDBC) & 0xFF000000 | (v373 >> 8)) ^ 0x837B39;
  int v381 = v380 - 2 * (v380 & 0x35424A37 ^ (v373 >> 8) & 4) + 893536819;
  int v382 = v381 ^ 0x35424A33;
  unsigned int v383 = -2131561189 * (v381 ^ 0x35424A33) - ((31844918 * (v381 ^ 0x35424A33)) & 0xDECED942) - 278434655;
  unsigned int v384 = v381 ^ 0x80E57481 ^ (v375
                            + v379
                            - v377
                            - 2 * ((v375 + v379 - v377 + 324997488) & 0x35A73EBF ^ (v375 + v379 - v377) & 0xD)
                            - 1996074974);
  unsigned int v385 = ((496806528 * v377 - ((993613056 * v377 + 414006528) & 0x7EE95C00) - 875868936) ^ 0x3F74AE78) & 0xFFFFFF80 | ((-1875166891 * v377 - ((544633514 * v377 - 432973190) & 0xD7F8A676) + 1595211896) >> 25);
  int v386 = ((2 * v385) & 0x5BF9B5FE ^ 0xEA) + (v385 ^ 0x2DFCDA8A);
  unsigned int v387 = ((1433600000 * v384 - ((-1427767296 * v384) & 0xEA4A0000) + 1965412592) ^ 0x7525D0F0) & 0xFFFF0000 | ((-940223117 * v384 - ((-1880446234 * v384) & 0xEB080D8E) - 175896889) >> 16);
  unsigned int v388 = ((2 * v387) & 0xECDB6DEE ^ 0x16908) + (v387 ^ 0x766D4373);
  unsigned int v389 = ((254803968 * v379 - ((509607936 * v379 - 125829120) & 0xC6000000) + 1598958005) ^ 0x630E29B5) & 0xFFF00000 | ((1690743027 * v379 - ((-913481242 * v379 - 1957650552) & 0xDEDF3D92) - 1256722803) >> 12);
  int v390 = v389 ^ 0x7FD20916;
  unsigned int v391 = (2 * v389) & 0xFFB9FFDE ^ 0x19EDD2;
  unsigned int v392 = ((793882624 * v382 - ((1587765248 * v382) & 0x65460000) - 1297936742) ^ 0xB2A30E9A) & 0xFFFFF000 | (v383 >> 20);
  unsigned int v393 = ((2 * v392) & 0xDEE47FF6 ^ 0x1DE4) + (v392 ^ 0x6F72310D);
  unsigned int v394 = v390 + v393 + v391 - v386 + v388;
  unsigned int v395 = ((-1214853120 * v386 + 935380397 - ((1865261056 * v386 - 414343168) & 0x88340000) + 3656) ^ 0x441A03F5) & 0xFFFFF000 | ((-1417971347 * v386 - ((116847322 * v386 + 77493466) & 0x56636F8u) - 587049495) >> 20);
  unsigned int v396 = (((-1296039936 * v388 - ((1702887424 * v388 + 293601280) & 0x56800000) - 1273674340) ^ 0xAB55459C) & 0xFFC00000 | ((335323851 * v388 - ((133776790 * v388 + 36124742) & 0xB40905A) + 1051976784) >> 10)) ^ 0x16812;
  LODWORD(a37) = v396 - 721139032 + (~(2 * v396) | 0x55F76AAF) + 1;
  int v397 = (a37 ^ 0xD5044AA8) + ((2 * v395) & 0x5DFFDFBE ^ 0x1016) + (v395 ^ 0xAEFFE7F4);
  unsigned int v398 = v397 + 1358958625 - ((2 * (v397 + 1358958625)) & 0xAF659326) + 1471334803;
  unsigned int v399 = ((-150994944 * v393 - ((771751936 * v393 + 637534208) & 0x24000000) - 446159265) ^ 0x1268265F) & 0xFF000000 | ((-1642794761 * v393 - ((1009377774 * v393 + 643426726) & 0x3881D756) + 258859134) >> 8);
  unsigned int v400 = v397 + (v399 ^ 0xFD77761C) + ((2 * v399) & 0xFBD66DEE ^ 0x11001C6) + 1393874611 + 631;
  unsigned int v401 = (((-1941453952 * v394 - ((412059392 * v394 + 772657664) & 0x3DD4B200) + 368132678) ^ 0x9EEA5946) & 0xFFFFFF80 | ((18386823 * (v394 - 1187783285) - ((36773646 * (v394 - 1187783285) - 1349048054) & 0x96A246C6) - 1558399000) >> 25)) ^ 0x65;
  unsigned int v402 = v401 - ((2 * v401) & 0xCD7B143E) + 1723697695;
  unsigned int v403 = ((2 * ((v402 ^ 0x66BD8A1F) + (v398 ^ 0x8E60D1DF))) & 0xB7EEF4DE)
       + (((v402 ^ 0x66BD8A1F) + (v398 ^ 0x8E60D1DF)) ^ 0xDBF77A6F);
  int v404 = 1101043327 * v403 - ((54603006 * v403 + 339374558) & 0x14D2A972) + 881233320;
  int v405 = v402 ^ (v400 - ((2 * v400) & 0x4A058CAE) + 620938839);
  LODWORD(STACK[0x1644]) = v231;
  LODWORD(STACK[0x1650]) = v351;
  unsigned int v406 = malloc(0x408uLL);
  STACK[0x240] = 0LL;
  STACK[0x558] = (unint64_t)v406;
  LODWORD(STACK[0x1654]) = 641693137 * (v405 ^ 0x49D618F1 ^ v404)
                         - ((209644450 * (v405 ^ 0x49D618F1 ^ v404)) & 0x146C0A06)
                         + 171312387;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_18A26FDB0[(335 * (v406 != 0LL)) | v44])( v406,  v407,  v408,  v409,  v410,  v411,  v412,  v413,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  v415,  v416,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40);
}

uint64_t sub_1886FED10( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  HIDWORD(v111) = BYTE3(a49) ^ 0xC57EF81C;
  HIDWORD(v109) = a45 ^ LODWORD(STACK[0x230]) ^ a43;
  LODWORD(STACK[0x230]) = (v68 >> 8) ^ 0xC417F444;
  HIDWORD(v113) = HIBYTE(v68) ^ 0x3422683;
  HIDWORD(a10) = (LODWORD(STACK[0x228]) ^ v65) - ((2 * (LODWORD(STACK[0x228]) ^ v65)) & 0x37844916) - 1681775477;
  HIDWORD(v110) = v69 + v65 - ((2 * (v69 + v65)) & 0xF5F0164A) + 2063076133;
  LODWORD(v113) = HIBYTE(v64) ^ 0x8A9A595B;
  STACK[0x228] = a1;
  STACK[0x240] = a1;
  int v70 = v62 ^ v63;
  LODWORD(v111) = v66 + v70 - ((2 * (v66 + v70)) & 0x45F78D42) - 1560557919;
  LODWORD(v112) = a37 ^ v62;
  LODWORD(v109) = a47 ^ 0xA2DF9EC2;
  HIDWORD(v112) = (v67 ^ 0x43BF4C48) + v70 - ((2 * ((v67 ^ 0x43BF4C48) + v70)) & 0xD7022434) + 1803620890;
  int v71 = ((v109 ^ HIDWORD(v112) ^ 0x368F792D)
       + 1397463675
       + (~(2 * (v109 ^ HIDWORD(v112) ^ 0x368F792D) + 19492322) | 0xFA9238ED)) ^ 0x368F792D;
  unsigned int v72 = (v71 + 1397463675 + (~(2 * v71 + 19492322) | 0xFA9238ED)) ^ 0x368F792D;
  unsigned int v73 = LODWORD(STACK[0x13CC]) + ((v72 + 1397463675 + (~(2 * v72 + 19492322) | 0xFA9238ED)) ^ 0x2B6E389);
  unsigned int v74 = (v73 ^ 0xEFFBAFEB) + 268718101 + ((2 * v73) & 0xDFF75FD6);
  unsigned int v75 = ((v74 & 0xFFFFFFFE) - ((2 * v74) & 0x4F49684) + 41569090) ^ 0x7B29C7CF;
  LODWORD(v110) = (LODWORD(STACK[0x1650]) ^ a49) >> 8;
  int v76 = v110 ^ 0x56606F;
  int32x4_t v77 = vdupq_n_s32(STACK[0x220]);
  int8x16_t v78 = (int8x16_t)vdupq_n_s32( (LODWORD(STACK[0x220]) ^ 0x102EFACE)
                   - ((2 * (LODWORD(STACK[0x220]) ^ 0x102EFACE) + 2) & 0x668D5AC8u)
                   + 860269925);
  LODWORD(STACK[0x220]) = 110461394 * v75 + 62625494;
  LODWORD(a53) = 4 * v75;
  LODWORD(STACK[0x218]) = 220922788 * v75;
  LODWORD(a51) = 8 * v75;
  int v116 = 110461391 * v75 + 62625494;
  v115[0] = -49 * v75 - 42 + v75;
  v114[0] = -96 * v75;
  LODWORD(a59) = 220922782 * v75;
  LODWORD(a16) = 11 * (LODWORD(STACK[0x238]) ^ 0x3D5);
  LODWORD(a57) = a16 ^ 0x246;
  v79.i64[0] = 0x2F0000002FLL;
  v79.i64[1] = 0x2F0000002FLL;
  int8x16_t v80 = veorq_s8((int8x16_t)v77, (int8x16_t)vdupq_n_s32(0x63CC9BCAu));
  int8x16_t v81 = veorq_s8((int8x16_t)v77, v78);
  v77.i64[0] = 0x100000001LL;
  v77.i64[1] = 0x100000001LL;
  v82.i64[0] = 0x3400000034LL;
  v82.i64[1] = 0x3400000034LL;
  LODWORD(STACK[0x200]) = 110461393 * v75;
  LODWORD(a55) = 110461393 * v75 + 62625494;
  LOBYTE(v70) = -49 * v75 - 42 - ((-98 * v75) & 0xAC);
  uint64_t v83 = v116 + v75 - ((220922784 * v75) & 0x7772DA8);
  uint64_t v84 = a55 - ((LODWORD(STACK[0x200]) << (a16 ^ 0x46)) & 0x7772DAC);
  int v85 = LODWORD(STACK[0x220]) - (STACK[0x218] & 0x7772DAC);
  char v86 = ((v70 ^ 0xD6) & v76) + 101 - ((2 * ((v70 ^ 0xD6) & v76)) & 0xCA);
  char v87 = (((v115[0] - (v114[0] & 0xA8)) ^ 0xD6) & v76)
      + 101
      - ((2 * (((v115[0] - (v114[0] & 0xA8)) ^ 0xD6) & v76)) & 0xCA);
  int v88 = ((v84 ^ 0xBB96D6) & v76) - 47625627 - ((2 * ((v84 ^ 0xBB96D6) & v76)) & 0x5294CA);
  int v89 = ((v85 ^ 0xBB96D6) & v76) - 47625627 - ((2 * ((v85 ^ 0xBB96D6) & v76)) & 0x5294CA);
  int v90 = 4 * v88;
  int v91 = 4 * v89;
  char v92 = (((v70 ^ 0xD6) + v76) ^ 0xB3)
      + ((2 * ((v70 ^ 0xD6) + v76)) & 0x66)
      + ((4 * v86) ^ 0xB5)
      + ((2 * v86) ^ 0xB0)
      + ((8 * v86) & 0xB8 ^ 0xD7)
      + ((4 * v86) & 0xF4 ^ 0x94);
  char v93 = ((((v115[0] - (v114[0] & 0xA8)) ^ 0xD6) + v76) ^ 0xB3)
      + ((2 * (((v115[0] - (v114[0] & 0xA8)) ^ 0xD6) + v76)) & 0x66)
      + ((4 * v87) ^ 0xB5)
      + ((2 * v87) ^ 0xB0)
      + ((8 * v87) & 0xB8 ^ 0xD7)
      + ((4 * v87) & 0xF4 ^ 0x94)
      + 1;
  unsigned __int8 v94 = (v92 + 110 - ((2 * (v92 + 1) + 100) & 0x76)) ^ LODWORD(STACK[0x230]);
  v95.i32[0] = v94;
  unsigned __int8 v96 = (v93 + 109 - ((2 * v93 + 100) & 0x76)) ^ LODWORD(STACK[0x230]);
  v95.i32[1] = v96;
  v95.i32[2] = (((((v84 ^ 0xD6) + v76) ^ 0xB3)
                                + ((2 * ((v84 ^ 0xD6) + v76)) & 0x66)
                                + (v90 ^ 0xB5)
                                + ((2 * v88) ^ 0xB0)
                                + ((8 * v88) & 0xB8 ^ 0xD7)
                                + (v90 & 0xF4 ^ 0x94)
                                + 110
                                - ((2
                                  * ((((v84 ^ 0xD6) + v76) ^ 0xB3)
                                   + ((2 * ((v84 ^ 0xD6) + v76)) & 0x66)
                                   + (v90 ^ 0xB5)
                                   + ((2 * v88) ^ 0xB0)
                                   + ((8 * v88) & 0xB8 ^ 0xD7)
                                   + (v90 & 0xF4 ^ 0x94)
                                   + 1)
                                  + 100) & 0x76)) ^ LODWORD(STACK[0x230]));
  v95.i32[3] = (((((v85 ^ 0xD6) + v76) ^ 0xB3)
                                + ((2 * ((v85 ^ 0xD6) + v76)) & 0x66)
                                + (v91 ^ 0xB5)
                                + ((2 * v89) ^ 0xB0)
                                + ((8 * v89) & 0xB8 ^ 0xD7)
                                + (v91 & 0xF4 ^ 0x94)
                                + 110
                                - ((2
                                  * ((((v85 ^ 0xD6) + v76) ^ 0xB3)
                                   + ((2 * ((v85 ^ 0xD6) + v76)) & 0x66)
                                   + (v91 ^ 0xB5)
                                   + ((2 * v89) ^ 0xB0)
                                   + ((8 * v89) & 0xB8 ^ 0xD7)
                                   + (v91 & 0xF4 ^ 0x94)
                                   + 1)
                                  + 100) & 0x76)) ^ LODWORD(STACK[0x230]));
  uint64_t v97 = (v95.i32[3] ^ 0x30621CC2)
      + ((((((v85 ^ 0x3BB96D6) + v76) ^ 0x9AFFFDB3)
         + ((2 * ((v85 ^ 0x3BB96D6) + v76)) & 0x35FFFB66)
         + (v91 ^ 0xE42731B5)
         + ((2 * v89) ^ 0x95AC6CB0)
         + ((8 * v89) & 0xDEFBCFB8 ^ 0x37B5BCD7)
         + (v91 & 0xDFFDF0F4 ^ 0xD4A52094)
         - 1477570706
         - ((2
           * ((((v85 ^ 0x3BB96D6) + v76) ^ 0x9AFFFDB3)
            + ((2 * ((v85 ^ 0x3BB96D6) + v76)) & 0x35FFFB66)
            + (v91 ^ 0xE42731B5)
            + ((2 * v89) ^ 0x95AC6CB0)
            + ((8 * v89) & 0xDEFBCFB8 ^ 0x37B5BCD7)
            + (v91 & 0xDFFDF0F4 ^ 0xD4A52094)
            + 1)
           - 922885276) & 0x86DE3B76)) ^ LODWORD(STACK[0x230])) & 0x2C ^ 0xE95C22C)
      - ((v95.i32[3] ^ 0x30621CC2) & 0x142C);
  v98.i32[0] = dword_188743840[((v94 ^ 0x30621CC2) + (v94 & 0x2C ^ 0xE95C22C) - ((v94 ^ 0x30621CC2) & 0x142C)) ^ 0x3EF7CA1E];
  v98.i32[1] = dword_188743840[((v96 ^ 0x30621CC2) + (v96 & 0x2C ^ 0xE95C22C) - ((v96 ^ 0x30621CC2) & 0x142C)) ^ 0x3EF7CA1E];
  v98.i32[2] = dword_188743840[((v95.i32[2] ^ 0x30621CC2)
                              + ((((((v84 ^ 0x3BB96D6) + v76) ^ 0x9AFFFDB3)
                                 + ((2 * ((v84 ^ 0x3BB96D6) + v76)) & 0x35FFFB66)
                                 + (v90 ^ 0xE42731B5)
                                 + ((2 * v88) ^ 0x95AC6CB0)
                                 + ((8 * v88) & 0xDEFBCFB8 ^ 0x37B5BCD7)
                                 + (v90 & 0xDFFDF0F4 ^ 0xD4A52094)
                                 - 1477570706
                                 - ((2
                                   * ((((v84 ^ 0x3BB96D6) + v76) ^ 0x9AFFFDB3)
                                    + ((2 * ((v84 ^ 0x3BB96D6) + v76)) & 0x35FFFB66)
                                    + (v90 ^ 0xE42731B5)
                                    + ((2 * v88) ^ 0x95AC6CB0)
                                    + ((8 * v88) & 0xDEFBCFB8 ^ 0x37B5BCD7)
                                    + (v90 & 0xDFFDF0F4 ^ 0xD4A52094)
                                    + 1)
                                   - 922885276) & 0x86DE3B76)) ^ LODWORD(STACK[0x230])) & 0x2C ^ 0xE95C22C)
                              - ((v95.i32[2] ^ 0x30621CC2) & 0x142C)) ^ 0x3EF7CA1E];
  v98.i32[3] = dword_188743840[v97 ^ 0x3EF7CA1E];
  int32x4_t v99 = (int32x4_t)veorq_s8(v95, v79);
  int32x4_t v100 = vaddq_s32( vaddq_s32(v98, vdupq_n_s32(0xD3FE08B3)),  (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32((int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v99, v99), v82), v99),  vdupq_n_s32(0x4E5u)),  (int8x16_t)vdupq_n_s32(0x3465EF5u)));
  int8x16_t v101 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( v100,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v100, v100), (int8x16_t)vdupq_n_s32(0x514D9764u))),  vdupq_n_s32(0x28A6CBB2u)),  (int8x16_t)vdupq_n_s32(a39 ^ a41));
  int32x4_t v102 = vaddq_s32((int32x4_t)veorq_s8(v80, v101), v77);
  int32x4_t v103 = (int32x4_t)veorq_s8(v101, (int8x16_t)vdupq_n_s32(0x73E26104u));
  int32x4_t v104 = vaddq_s32( vaddq_s32( vaddq_s32(v103, (int32x4_t)veorq_s8((int8x16_t)v102, (int8x16_t)vdupq_n_s32(0xCBF7DAFD))),  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v102, v102), (int8x16_t)vdupq_n_s32(0x97EFB5FA))),  vdupq_n_s32(0x34082503u));
  int32x4_t v105 = vaddq_s32( (int32x4_t)veorq_s8( veorq_s8(v81, (int8x16_t)vdupq_n_s32(0xE507D09C)),  (int8x16_t)vaddq_s32( vsubq_s32( v104,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v104, v104),  (int8x16_t)vdupq_n_s32(0x7320F192u))),  vdupq_n_s32(0x399078C9u))),  v103);
  int32x4_t v106 = vaddq_s32( vsubq_s32(v105, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v105, v105), (int8x16_t)vdupq_n_s32(0x67DC43C8u))),  vdupq_n_s32(0x33EE21E4u));
  *(_DWORD *)(STACK[0x240] + 4LL * ((v116 - (a59 & 0xAC)) ^ 0xD6u)) = v106.i32[0];
  unint64_t v107 = STACK[0x228];
  *(_DWORD *)(STACK[0x228] + 4 * (v83 & 0xFE ^ 0xD6)) = v106.i32[1];
  *(_DWORD *)(v107 + 4LL * (v84 ^ 0xD6u)) = v106.i32[2];
  *(_DWORD *)(v107 + 4LL * (v85 & 0xFE ^ 0xD6u)) = v106.i32[3];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[SLODWORD(STACK[0x238])] - 4LL))( v97,  2817396589LL,  5164LL,  214LL,  v84,  252LL,  44LL,  v83,  a9,  a10,  v109,  v110,  v111,  v112,  v113,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

void sub_1886FF54C()
{
}

uint64_t sub_1886FF564( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16)
{
  int8x16_t v16 = malloc(0x408uLL);
  STACK[0x520] = (unint64_t)v16;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(317 * (v16 != 0LL)) ^ a16] - 12LL))();
}

uint64_t sub_1886FF5A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34, uint64_t a35, int a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, int a48, uint64_t a49, unsigned int a50)
{
  int v52 = (v50 - 551) | 0x103;
  int v53 = ((LODWORD(STACK[0x13C8]) ^ LODWORD(STACK[0x1654]) ^ 0x5436DFA6)
       - ((2 * (LODWORD(STACK[0x13C8]) ^ LODWORD(STACK[0x1654]) ^ 0x5436DFA6) + 665484882) & 0x615A063A)
       + 1149387334) ^ 0x5436DFA6;
  unsigned int v54 = ((v53 - (((v53 << ((v52 + 126) ^ 0xA0)) + 665484882) & 0x615A063A) + 1149387334) ^ 0x30AD031D)
      + (a48 ^ 0xCBE86F51);
  unsigned int v55 = ((2 * v54) & 0xBB5DDFFE) + (v54 ^ 0x5DAEEFFF);
  int v56 = 2 * v55 - ((4 * v55 + 155467780) & 0x22F39EF0) - 1776554117;
  unsigned int v57 = v55 + (v56 & 0x4E2B4962 ^ 0xC0344BC1) + ((2 * v56) & 0x9C449284 ^ 0x7FBF6D7F) - 917917166;
  unsigned int v58 = 856959805 * (((v57 | 1) - ((2 * v57) & 0x49E15F6C) - 1527730250) ^ 0xA4F0AFB6);
  char v59 = (v52 - 87) ^ 0xCD;
  int v60 = ((v58 - ((v58 << v59) & 0xE6) + 115) ^ ((LODWORD(STACK[0x1650]) ^ LODWORD(STACK[0x1644]) ^ a50) >> 16) ^ 0x26) ^ 0x480211C4;
  *(_DWORD *)(a1 + 4LL * ((v58 - ((v58 << v59) & 0xE6) + 115) ^ 0x73u)) = a34 ^ a36 ^ a15 ^ 0xDEF8FFEA ^ dword_1887400E0[(v60 - ((2 * v60) & 0x80000040) + 1342212128) ^ 0x18029974];
  return ((uint64_t (*)(void))(*(void *)(v51
                                        + 8LL
                                        * ((v52 + 871980926) ^ 0x33F96182 ^ (1328 * (((36 - v52) | (v52 - 36)) >= 0))))
                            - 4LL))();
}

void sub_1886FF804()
{
}

uint64_t sub_1886FF814()
{
  int v2 = malloc(0x404uLL);
  *(void *)(v1 + 32) = v2;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v2 == 0LL) * (v0 + 522)) ^ v0] - (v0 - 153) + 299LL))();
}

uint64_t sub_1886FF858( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, int a29, uint64_t a30, int a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, int a45)
{
  LODWORD(STACK[0x238]) = v47;
  int v48 = (v46 - 267) | 0x102;
  int v49 = LODWORD(STACK[0x13C8]) ^ a14;
  unsigned int v50 = ((((((2 * v49) ^ 0xCB52936A) - ((v48 + 1831953854) & (2 * ((2 * v49) ^ 0xCB52936A))) + 915977077) & 0x95729B3C ^ 0x7B1CF793)
        - 1) ^ 0xFE0E6DB2)
      + (v49 ^ 0xE79120E0);
  int v51 = v50 - 2 * (v50 & 0x65A949B7 ^ v49 & 2) - 441890379;
  unsigned int v52 = ((((((2 * v51) ^ 0xCB52936A) - ((2 * ((2 * v51) ^ 0xCB52936A)) & 0x6D3166E8) + 915977077) & 0x95729B3C ^ 0x7B1CF793)
        - 1) ^ 0xFE0E6DB2)
      + (v51 ^ 0xE79120E0);
  int v53 = v52 - 2 * (v52 & 0x65A949B7 ^ v51 & 2) - 441890379;
  int v54 = LODWORD(STACK[0x1688]) ^ 0x14C6C8B2;
  LODWORD(STACK[0x220]) = v54;
  unsigned int v55 = (((v53 ^ 0xE5A949B5) + v54) ^ 0xEBDDBD7F) + 337789569 + ((2 * ((v53 ^ 0xE5A949B5) + v54)) & 0xD7BB7AFE);
  unsigned int v56 = ((v55 & 0xFFFFFFFE) - ((2 * v55) & 0xDB9F0524) + 1842315923) ^ 0x4EC96B54;
  int v57 = -270667542 - 354362931 * v56;
  int v58 = -708725862 * v56;
  int v59 = 11 * (v48 ^ 0x11F);
  LODWORD(STACK[0x228]) = v59;
  unsigned int v60 = (((v57 - (v58 & 0xD4)) ^ v45) ^ 8)
      + (((v57 - (v58 & 0xDFBBE1D4)) ^ v45) & 0xA9 ^ (v59 + 483137114))
      - ((((v57 - (v58 & 0xD4)) ^ v45) ^ 8) & 0xA9);
  int v61 = ((2 * v60) ^ 0x3908BFC2) - ((2 * ((2 * v60) ^ 0x3908BFC2)) & 0x2F8CB0) + 18335320;
  int v62 = *((_DWORD *)&unk_188741600
        + (((v60 ^ 0x1C845FE1) + 4736832) ^ 0xFEFDDCEF)
        + ((2 * ((v60 ^ 0x1C845FE1) + 4736832)) & 0x7DFBB9DE)
        + (v61 & 0x908E80 ^ 0x3096C1)
        + ((2 * v61) & 0x1211C00 ^ 0xFFDEF3FF)
        + 14815825);
  unsigned int v63 = 519009017 * v62 - ((1038018034 * v62 - 32584682) & 0xECE89504) - 176443251;
  unsigned int v64 = (16 * (v63 ^ (125540296 * v62 - ((116862864 * v62 + 7758000) & 0x7FB3D00) + 70831835))) ^ 0xD89D4010;
  *(_DWORD *)(a1 + 4LL * ((v57 - (v58 & 0xD4)) ^ 0xEAu)) = a45 ^ a31 ^ a29 ^ v63 ^ 0x2E0CCDF2 ^ (v64 - ((2 * v64) & 0x1CFBF6E0) - 1904346242);
  return ((uint64_t (*)(void))(qword_18A26FDB0[v48 ^ 0x19] - 8LL))();
}

void sub_1886FFBD8()
{
}

uint64_t sub_1886FFBE8()
{
  int v0 = STACK[0x228];
  uint64_t v1 = malloc(0x408uLL);
  STACK[0x548] = (unint64_t)v1;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v1 != 0LL) * (v0 ^ 0x33B)) ^ v0]
                            - ((v0 - 717131464) & 0x2ABE8FF7)
                            + 875LL))();
}

uint64_t sub_1886FFC50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, int a28, int a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, int a44)
{
  int v47 = ((a13 ^ 0x43756E4E ^ LODWORD(STACK[0x13C4]))
       - ((2 * (a13 ^ 0x43756E4E ^ LODWORD(STACK[0x13C4])) + 1847707204) & 0x78D67BE2)
       + 863772947) ^ 0x67742BED;
  int v48 = ((v47 - ((2 * v47 + 1847707204) & 0x78D67BE2) + 863772947) ^ 0x3C6B3DF1) + LODWORD(STACK[0x13CC]);
  unsigned int v49 = (v48 ^ 0x7BAFFFA7) - 2075131815 + ((2 * v48) & 0xF75FFF4E);
  unsigned int v50 = ((v49 & 0xFFFFFFFE) - ((2 * v49) & 0xC5F0A520) - 487042416) ^ 0x554E576D;
  int v51 = 1983336414 * v50;
  int v52 = ((2 * ((991668207 * v50 + 800020394 - (v51 & 0x5F5EAF54)) ^ LODWORD(STACK[0x163C]) ^ v44)) & 8)
      - 174266813
  unsigned int v53 = (((v52 ^ 0xD8056F44) + 1) ^ 0x3FFE2DF5)
      + ((2 * ((v52 ^ 0xD8056F44) + 1)) & 0x7FFC5BEA)
      + dword_188746C10[v52 ^ 0xF59CE643];
  *(_DWORD *)(a1 + 4LL * ((-17 * v50 - 86 - (v51 & 0x54)) ^ 0xAAu)) = a44 ^ a27 ^ a29 ^ 0xDE32E253 ^ (v53 - ((2 * v53 + 130950682) & 0x8CE56E3C) + 1247398443);
  return ((uint64_t (*)(void))(*(void *)(v46 + 8LL * v45) - 8LL))();
}

void sub_1886FFE44()
{
}

uint64_t sub_1886FFE54()
{
  *int v2 = v2[623];
  return ((uint64_t (*)(void))(*(void *)(v3
}

uint64_t sub_1886FFECC()
{
  uint64_t v5 = 4LL * (v3 - 595498550);
  unsigned int v6 = *(_DWORD *)(v0 + 4LL * (v3 - 595498551));
  int v7 = (*(_DWORD *)(v0 + v5) ^ 0x2BD32E2F ^ (1566083941 * (v6 ^ 0xA0EC9AC7 ^ (v6 >> 30))
                                           - ((447813322 * (v6 ^ 0xA0EC9AC7 ^ (v6 >> 30))) & 0x167F69D4)
                                           - 1958759190))
     - v3;
  *(_DWORD *)(v0 + v5) = v7 - ((2 * v7 + 1190997100) & 0x41D9358A) - 999608069;
  STACK[0x570] = *(void *)(v1 + 8LL * (v2 + 1771230042));
  LODWORD(STACK[0x578]) = v2 + 829909778;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = (v2 + 829909778) ^ 0x46;
  LODWORD(STACK[0x590]) = v2 + 829909703;
  STACK[0x580] = (v3 - 1000966418);
  STACK[0x598] = 3889499427LL;
  *(_DWORD *)(v4 - 192) = 1431737413 * ((((2 * (v4 - 200)) | 0x57470A48) - (v4 - 200) + 1415346908) ^ 0x15FD1A36)
                        + 40706419
                        + v2;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v4 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v4 - 188)] - 12LL))();
}

uint64_t sub_18870004C()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((4 * (v1 >= 0xE7D50D23)) ^ 0x16B)) - 8LL))();
}

uint64_t sub_1887000BC()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (v2 + 1771229876 + 4 * (v1 <= 0xE7D50F92) + 364)) - 8LL))();
}

uint64_t sub_188700100()
{
  int v2 = v0 - v1 - 119;
  LODWORD(xmmword_18C723288) = 552377029;
  free((void *)STACK[0x238]);
  int8x16_t v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  uint64_t v4 = (v2 + 1771229913) | 0x112u;
  v5.i64[0] = 0x8000000080000000LL;
  v5.i64[1] = 0x8000000080000000LL;
  v6.i64[0] = 0x800000008LL;
  v6.i64[1] = 0x800000008LL;
  v7.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v7.i32[2] = *((_DWORD *)&xmmword_18C723288 + v4 - 307);
  int8x16_t v8 = vextq_s8(v3, v7, 0xCuLL);
  int8x16_t v9 = v7;
  v9.i32[3] = unk_18C723298;
  int8x16_t v10 = (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8(vandq_s8(v8, v5), (int8x16_t)vdupq_n_s32(0x83D880BB)),  vdupq_n_s32(0xE08097FE));
  int32x4_t v11 = (int32x4_t)veorq_s8(vandq_s8(v9, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x282C1AC1u));
  int8x16_t v12 = (int8x16_t)vsubq_s32( vaddq_s32( v11,  (int32x4_t)veorq_s8( vandq_s8(v9, (int8x16_t)vdupq_n_s32(0x195BE464u)),  (int8x16_t)vdupq_n_s32(0x9153E424))),  (int32x4_t)vandq_s8((int8x16_t)v11, (int8x16_t)vdupq_n_s32(0x195BE465u)));
  int8x16_t v13 = veorq_s8(v12, (int8x16_t)vdupq_n_s32(0x919B6460));
  int32x4_t v14 = (int32x4_t)veorq_s8(vandq_s8(v13, (int8x16_t)vdupq_n_s32(0x12F2047Cu)), vandq_s8(v12, v6));
  int8x16_t v15 = (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v13, veorq_s8(v10, (int8x16_t)vdupq_n_s32(0xE45918B8))),  vaddq_s32(v14, v14)),  vdupq_n_s32(0x92F20474)),  1uLL);
  v13.i32[0] = *((_DWORD *)&STACK[0x1978] + ((BYTE4(xmmword_18C723288) & 1) == 0));
  v13.i32[1] = *((_DWORD *)&STACK[0x1978] + (~DWORD2(xmmword_18C723288) & 1LL));
  v13.i32[2] = *((_DWORD *)&STACK[0x1978] + (~*((_DWORD *)&xmmword_18C723288 + v4 - 307) & 1LL));
  v13.i32[3] = *((_DWORD *)&STACK[0x1978] + (~unk_18C723298 & 1LL));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v13),  (int8x16_t)vdupq_n_s32(0x5BC8CB7Cu)),  v15);
  return ((uint64_t (*)(void))(qword_18A26FDB0[v2 + 1771230166] - 4LL))();
}

uint64_t sub_18870015C@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, uint64_t a3@<X7>, int a4@<W8>)
{
  int8x16_t v8 = (unsigned int *)(a3 + 4 * (v4 + a1));
  unsigned int v9 = ((a4 + 83 + (v5 & 0x80000000) - 1530468725) ^ 0x45CDF854) + 1397022135;
  uint64_t v10 = v4 + 1;
  int v11 = *(_DWORD *)(a3 + 4 * (v10 + a1));
  unsigned int v12 = (v7 - (v11 & 0x7FFFFFFE ^ 0x6EE3A074 | v7) + (v11 & 0x7FFFFFFE ^ 0x6EE3A074 | 0xD6FDA951)) ^ 0x98F293E1 | v9 ^ 0xB44FEE78;
  *int8x16_t v8 = v8[397] ^ *((_DWORD *)&STACK[0x1970] + ((v11 & 1) == 0)) ^ ((v12 - ((2 * v12) & 0xCFCF7ACC) + 1743240550) >> 1) ^ 0xAAE34ADB;
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * ((111 * (v10 != v6 + 3)) ^ a4)) - 8LL))();
}

uint64_t sub_188700254( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = (const float *)&dword_18C723614;
  int8x16_t v12 = (int8x16_t)vld1q_dup_f32(v11);
  uint64_t v13 = (v8 - 137) ^ 0x165LL;
  v14.i64[0] = 0x8000000080000000LL;
  v14.i64[1] = 0x8000000080000000LL;
  v10.i32[0] = *(_DWORD *)(a8 + 4 * v13);
  v10.i32[1] = dword_18C72361C;
  v10.i32[2] = dword_18C723620;
  int8x16_t v15 = vextq_s8(v12, v10, 0xCuLL);
  int8x16_t v16 = v10;
  v16.i32[3] = dword_18C723624;
  int32x4_t v17 = (int32x4_t)veorq_s8( vorrq_s8( vandq_s8((int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v15, v14), vdupq_n_s32(0xF4FBA778)), v14),  vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu))),  (int8x16_t)vdupq_n_s32(0x20EC9AC4u));
  v18.i32[0] = *(_DWORD *)(v9 + 4LL * ((*(_DWORD *)(a8 + 4 * v13) & 1) == 0));
  v18.i32[1] = *(_DWORD *)(v9 + 4 * (~dword_18C72361C & 1LL));
  v18.i32[2] = *(_DWORD *)(v9 + 4 * (~dword_18C723620 & 1LL));
  v18.i32[3] = *(_DWORD *)(v9 + 4 * (~dword_18C723624 & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v18),  (int8x16_t)vdupq_n_s32(0x846C1158)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v17,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v17, v17),  (int8x16_t)vdupq_n_s32(0x75F214C0u))),  vdupq_n_s32(0x3AF90A60u)),  1uLL));
  return (*(uint64_t (**)(void))(a7 + 8LL * v8))();
}

void sub_188700380()
{
}

uint64_t sub_18870038C@<X0>(uint64_t a1@<X6>, _DWORD *a2@<X7>, int a3@<W8>)
{
  unsigned int v3 = (*a2 & 0x7FFFFFFE ^ 0x5B685218 | 0xEEE4E9E) - (*a2 & 0x7FFFFFFE ^ 0x5B685218 | 0xF111B161) - 250498719;
  unsigned int v4 = ((v3 & 0xDAF60658 ^ 0x82140058) + (v3 ^ 0x5CEA4E02) - ((v3 ^ 0x5CEA4E02) & 0xDAF60658)) ^ 0xF376CE18 | (-125735466 - ((2099326414 - (a2[623] | 0x7FFFFFFF)) & (((a3 + 309142218) | 0x84000900) + 1502803641))) ^ 0x888149D2;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x1970] + ((*a2 & 1) == 0)) ^ ((v4 - ((2 * v4) & 0x8CE78C0) - 2073609120) >> 1) ^ 0xDB230A58;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (((4 * (LODWORD(STACK[0x470]) > 0x26F)) | (8 * (LODWORD(STACK[0x470]) > 0x26F))) ^ a3))
                            - 12LL))();
}

uint64_t sub_1887004C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  LODWORD(STACK[0x470]) = 0;
  int v12 = LODWORD(STACK[0x470])++;
  *(_DWORD *)(v8 + 3208) = v12 + 1823406260;
  uint64_t v13 = (*(_DWORD *)(v9 + 3160) - 9361301);
  v10[12] = *(void *)(a7 + 8LL * (v7 + 1771230042));
  LODWORD(STACK[0x578]) = v7 - 1104744166;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = (v7 - 1104744166) ^ 0xB4;
  LODWORD(STACK[0x590]) = (v7 - 1104744166) ^ 0xC4;
  v10[14] = v13;
  v10[17] = 1064810320LL;
  *(_DWORD *)(v11 - 192) = 1431737413
                         * ((-1244081122 - ((v11 - 200) | 0xB5D8D41E) + ((v11 - 200) | 0x4A272BE1)) ^ 0xF479B4F3)
                         + 40706419
                         + v7;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v11 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v11 - 188)])();
}

uint64_t sub_1887005CC()
{
  int v8 = STACK[0x218];
  if (v2 >= v3) {
    int v9 = *(_DWORD *)(v7 + 3160) + 1;
  }
  else {
    int v9 = v5;
  }
  *(_DWORD *)(v7 + 3160) = v9;
  int v10 = v1 ^ (v1 >> 11);
  unsigned int v11 = ((v10 << 7) ^ 0x7C43AB00) - ((2 * ((v10 << 7) ^ 0x7C43AB00)) & 0xF282A100) - 113159947;
  unsigned int v12 = (v11 & 0x910C4680 ^ 0xB1060355) + (v11 & 0xC201000 ^ 0x1001) - 2;
  unsigned int v13 = ((v12 & 0x18280480 ^ 0x12A8A101) + (v12 & 0x85045200 ^ 0x64201) - 2) ^ v10;
  unsigned int v14 = (((v13 << 15) ^ 0x136B0000) - ((2 * ((v13 << 15) ^ 0x136B0000)) & 0xC6160000) - 485807858) & 0xEFC60000 ^ 0x87040000;
  unsigned int v15 = (v14 - ((2 * v14) & 0xD5000000) - 359019906) & 0xFFD60000 ^ v13;
  *(_BYTE *)(v6 + (v8 - 2107439651)) = ((v15 ^ (v15 >> 18) ^ 0xE7)
                                                    - ((2 * (v15 ^ (v15 >> 18) ^ 0xE7)) & 0x3A)
                                                    - 99) ^ 0x22;
  return (*(uint64_t (**)(uint64_t))(v0
                                            + 8LL
                                            * ((493
                                              * (v8
                                               - (((v15 ^ (v15 >> 18) ^ 0xE7)
                                                                  - ((2 * (v15 ^ (v15 >> 18) ^ 0xE7)) & 0x3A)
                                                                  - 99) != 0x22) == v4 + 742)) ^ 0x2E6)))(627745143LL);
}

uint64_t sub_18870074C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unsigned int v72 = (v71 - 936414716) & 0xA16363F8;
  STACK[0x238] = (unint64_t)malloc(__size);
  uint32_t v73 = arc4random();
  LODWORD(xmmword_18C723288) = (v72 ^ 0xA0EC998D) + v73 - ((2 * v73) & 0x41D9358A);
  int v74 = xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30);
  DWORD1(xmmword_18C723288) = ((1812433253 * v74) ^ 0xFCEBF533)
                            + ((-670100790 * v74) & 0xF9D7EA66)
                            - 2
  return ((uint64_t (*)(void))(qword_18A26FDB0[v72] - 12LL))();
}

void sub_1887008A8()
{
}

uint64_t sub_1887008C4@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,timeval *a60,uint64_t a61,_DWORD *a62)
{
  int v67 = v63 + v62 - 900;
  LODWORD(STACK[0x3A8]) = a1 + 1;
  gettimeofday(a60, 0LL);
  a62[2] = LODWORD(a60->tv_sec) - 1595106619 - ((2 * LODWORD(a60->tv_sec)) & 0x41D9358A);
  **(_DWORD **)(v64 + 3552) = v67 + a62[6] + 176123258 - ((2 * a62[6]) & 0x41D9358A);
  uint32_t v68 = arc4random();
  a62[3] = v68 - 1595106619 - ((2 * v68) & 0x41D9358A);
  uint32_t v69 = arc4random();
  **(_DWORD **)(v65 + 105) = v69 - 1595106619 - ((2 * v69) & 0x41D9358A);
  int v70 = ((2 * STACK[0x238]) & 0xCAF7B2FA) + (STACK[0x238] ^ 0x657BD97D);
  LODWORD(STACK[0x240]) = v70 - ((2 * v70 + 889736454) & 0x821B2518) + 1536276751;
  LODWORD(STACK[0x230]) = 1619667694;
  LODWORD(STACK[0x228]) = 1372585206;
  LODWORD(STACK[0x220]) = -521503233;
  LODWORD(STACK[0x218]) = 1400897332;
  int v71 = (DWORD1(xmmword_18C723288) ^ 0x144DD41 ^ (1664525
                                                * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))
                                                - ((3329050
                                                  * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0x43508F08)
                                                - 1582807164))
      + (**(_DWORD **)(v65 + 105) ^ 0xA0EC9AC5);
  unsigned int v72 = (v71 ^ 0xF9FEFDBC) + 1865209692 + ((2 * v71) & 0xF3FDFB78);
  DWORD1(xmmword_18C723288) = v72 + 935380397 - ((2 * v72 + 766006736) & 0x41D9358A);
  STACK[0x570] = qword_18A26FDB0[(v67 + 32554563) ^ 0x1FFFFFFF985DEB2BLL];
  LODWORD(STACK[0x58C]) = (v67 + 32554563) ^ 0x28;
  LODWORD(STACK[0x590]) = (v67 + 32554563) | 0x60;
  *(_DWORD *)(v66 - 192) = 1431737413
                         * ((((v66 - 200) | 0x34987F39) - (v66 - 200) + ((v66 - 200) & 0xCB6780C0)) ^ 0x8AC6E02B)
                         + 40706419
                         + v67;
  LODWORD(STACK[0x578]) = v67 + 32554563;
  LODWORD(STACK[0x588]) = 0;
  STACK[0x580] = 965695858LL;
  STACK[0x598] = 965695856LL;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v66 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v66 - 188)] - 12LL))();
}

uint64_t sub_188700BEC()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_188700C34()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((102 * (v2 > 0x398F5BDF)) ^ (v1 - 1771229710))) - 8LL))();
}

uint64_t sub_188700C90()
{
  int v8 = v0 ^ (v5 + 162);
  LODWORD(xmmword_18C723288) = dword_18C723C44;
  STACK[0x570] = *(void *)(v1 + 8 * ((v8 - 546889639) ^ 0x75D44D07LL));
  STACK[0x580] = 4134625118LL;
  LODWORD(STACK[0x578]) = v6;
  LODWORD(STACK[0x588]) = v8 - 546889682;
  LODWORD(STACK[0x58C]) = v8 - 546889639;
  LODWORD(STACK[0x590]) = (v8 - 546889639) ^ 0x89;
  STACK[0x598] = (v4 - 2025551869);
  *(_DWORD *)(v7 - 192) = 1431737413 * ((((2 * v3) | 0xE14972FC) - v3 + 257640066) ^ 0x4EFA266C) + 40706419 + v8;
  STACK[0x23C8] = v2;
  sub_1886DF534(v7 - 200);
  return ((uint64_t (*)(unint64_t *))(qword_18A26FDB0[*(int *)(v7 - 188)] - 12LL))(&STACK[0x1527]);
}

uint64_t sub_188700D88()
{
}

uint64_t sub_188700E10()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_188700E98@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  *(_DWORD *)(*(void *)(a1 + 105) + 4LL * ((a2 ^ 0x90D3297F) + v5)) ^= 0xBB93E97C ^ *(_DWORD *)(STACK[0x238]
                                                                                                + 4LL
                                                                                                * ((a2 ^ 0x90D3297F) + v5));
  return ((uint64_t (*)(void))(*(void *)(v3
                                        + 8LL
                                        * (int)(((v6 & ~(((a2 ^ 0x410FB5EE) + 1591737287) ^ (((v4 - 1 - (a2 ^ 0x410FB5EE)) | ((a2 ^ 0x410FB5EEu) - (v4 - 1))) >> 31)))
                                               * (v2 + (((a2 ^ 0x410FB5EE) + 1576008491) & 0xF76D7DEB) + 282)) ^ ((a2 ^ 0x410FB5EE) - 1091547543)))
                            - 8LL))();
}

void sub_188700F7C()
{
}

uint64_t sub_188700F84@<X0>(int a1@<W8>)
{
  *unsigned int v1 = v1[623];
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((228
}

uint64_t sub_188701000@<X0>(int a1@<W8>)
{
  uint64_t v5 = 4LL * (v3 - 1784778625);
  unsigned int v6 = *(_DWORD *)(v1 + 4LL * (v3 - 1784778626));
  int v7 = (*(_DWORD *)(v1 + v5) ^ 0xF7273A6D ^ (1566083941 * (v6 ^ 0xA0EC9AC7 ^ (v6 >> 30))
                                           - ((-1162799414 * (v6 ^ 0xA0EC9AC7 ^ (v6 >> 30))) & 0xAF974150)
                                           + 1472962728))
     - v3;
  *(_DWORD *)(v1 + v5) = v7 - ((2 * v7 + 1422073602) & 0x41D9358A) + 189672006;
  STACK[0x570] = *(void *)(v2 + 8 * ((a1 - 896931825) ^ 0x60F715F9LL));
  STACK[0x580] = 4235119639LL;
  LODWORD(STACK[0x578]) = 1;
  LODWORD(STACK[0x588]) = a1 - 896931690;
  LODWORD(STACK[0x58C]) = a1 - 896931825;
  LODWORD(STACK[0x590]) = (a1 - 896931825) ^ 0x35;
  STACK[0x598] = (v3 - 1844626281);
  *(_DWORD *)(v4 - 192) = 1431737413 * ((((v4 - 200) | 0xCB6D12A5) - ((v4 - 200) & 0xCB6D12A5)) ^ 0x75338DB7)
                        + 40706419
                        + a1;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v4 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v4 - 188)] - 8LL))();
}

uint64_t sub_188701188()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((706 * (v1 < 0xFC6ECC17)) ^ 0xC2)) - 4LL))();
}

uint64_t sub_188701208()
{
}

uint64_t sub_188701264()
{
  unsigned int v1 = (((v0 - 613) | 0x4A) + 342687658) | 0x82002D43;
  LODWORD(xmmword_18C723288) = 552377029;
  free((void *)STACK[0x238]);
  int v2 = (v1 + 1771230008) | 0x110;
  int8x16_t v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  v4.i64[0] = 0x8000000080000000LL;
  v4.i64[1] = 0x8000000080000000LL;
  v5.i64[0] = -1LL;
  v5.i64[1] = -1LL;
  v6.i64[0] = 0x1200000012LL;
  v6.i64[1] = 0x1200000012LL;
  v7.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v7.i32[2] = HIDWORD(xmmword_18C723288);
  int8x16_t v8 = vextq_s8(v3, v7, 0xCuLL);
  int8x16_t v9 = v7;
  v9.i32[3] = unk_18C723298;
  int8x16_t v10 = (int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v8, v4), vdupq_n_s32(0xA14AD7A3));
  int32x4_t v11 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( vandq_s8(v9, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)),  (int8x16_t)vdupq_n_s32(0x3372BBDBu)),  v5),  (int8x16_t)vdupq_n_s32(0xF6B411CD));
  int8x16_t v12 = (int8x16_t)vaddq_s32( vsubq_s32( v11,  (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v11, v11), (int8x16_t)vdupq_n_s32(0xD9B878BC))),  vdupq_n_s32(0x6CDC3C5Eu));
  int8x16_t v13 = veorq_s8(v12, (int8x16_t)vdupq_n_s32(0x89F60C8D));
  int32x4_t v14 = (int32x4_t)veorq_s8(vandq_s8(v13, (int8x16_t)vdupq_n_s32(0x317F009Bu)), vandq_s8(v12, v6));
  int8x16_t v15 = (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32((int32x4_t)vorrq_s8(v13, vandq_s8(v10, v4)), vaddq_s32(v14, v14)),  vdupq_n_s32(0x317F0089u)),  1uLL);
  v13.i32[0] = *((_DWORD *)&STACK[0x18E8] + ((BYTE4(xmmword_18C723288) & 1) == 0));
  v13.i32[1] = *((_DWORD *)&STACK[0x18E8] + (DWORD2(xmmword_18C723288) & ((2 * (v2 ^ 0xB7)) ^ 0x249u) ^ 1LL));
  v13.i32[2] = *((_DWORD *)&STACK[0x18E8] + (~HIDWORD(xmmword_18C723288) & 1LL));
  v13.i32[3] = *((_DWORD *)&STACK[0x18E8] + (~unk_18C723298 & 1LL));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v13),  (int8x16_t)vdupq_n_s32(0x9E207695)),  v15);
  return ((uint64_t (*)(void))(qword_18A26FDB0[v2] - 4LL))();
}

uint64_t sub_188701364()
{
  char v0 = STACK[0x74F];
  int v1 = STACK[0x828];
  int v2 = *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4));
  LODWORD(STACK[0x830]) = v2;
  int v3 = v2 ^ v1;
  int v4 = STACK[0x81C];
  unint64_t v5 = 83590351
     * ((((v4 ^ 0x9395C89B) & v3) * (LODWORD(STACK[0x820]) ^ 0x4FB7F35)) ^ ((((v4 ^ 0x9395C89B) & v3)
                                                                           * (LODWORD(STACK[0x820]) ^ 0x4FB7F35)) >> 16));
  char v6 = byte_18873E240[v5 >> 24] ^ v0 ^ byte_18873EB80[(v5 >> 24) + 1] ^ byte_18873F7A0[(v5 >> 24) + 1] ^ (-49 * ((((v4 ^ 0x9B) & v3) * (LOBYTE(STACK[0x820]) ^ 0x35)) ^ ((((v4 ^ 0x9395C89B) & v3) * (LODWORD(STACK[0x820]) ^ 0x4FB7F35)) >> 16))) ^ (47 * ((83590351 * ((((v4 ^ 0x9395C89B) & v3) * (LODWORD(STACK[0x820]) ^ 0x4FB7F35)) ^ ((((v4 ^ 0x9395C89B) & v3) * (LODWORD(STACK[0x820]) ^ 0x4FB7F35)) >> 16))) >> 24));
  LOBYTE(STACK[0x837]) = v6;
  LODWORD(STACK[0x838]) = ((2 * v6) & 0xFBB3FCBC) + (v6 ^ 0xFDD9FE5E);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(361 * (v6 > 47)) ^ LODWORD(STACK[0x824])] - 12LL))();
}

uint64_t sub_188701470()
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((2046
                                * (((v0 + 9) ^ (LOBYTE(STACK[0x837]) < ((v0 - 1216534063) & 0x7F ^ 0x71u))) & 1)) ^ v0)))();
}

uint64_t sub_1887014B4()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((13 * (LOBYTE(STACK[0x837]) <= ((v0 - 276939396) & 0xE4 ^ 0x24u))) ^ v0))
                            - 12LL))();
}

uint64_t sub_188701500()
{
  int v2 = v0 - 444;
  char v3 = v0 + 11;
  __int16 v4 = (~LOBYTE(STACK[0x837]) + (v0 + 68)) ^ (~LOBYTE(STACK[0x837]) + v0 + 68);
  BOOL v5 = (((unsigned __int16)(-v4 | v4) >> (v3 ^ 1)) & 1) == 0;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (v2 ^ 0x14A ^ (v5 | (2 * v5)))) - 8LL))();
}

uint64_t sub_18870155C@<X0>(int a1@<W8>)
{
  int v4 = a1 ^ (v3 - 63);
  int v5 = (v4 ^ 0x7A071A2F) + 328583641;
  char v6 = (uint64_t (*)(void))(*(void *)(v2
                                     + 8LL
                                     * (int)((69
                                            * (((LODWORD(STACK[0x818]) + 634986467) & ((v5 ^ 0x101831u)
                                                                                     + LODWORD(STACK[0x838])
                                                                                     - 2112493473)) >> 31)) ^ (v1 + v4 + 527)))
                         - 12LL);
  LODWORD(STACK[0x884]) = v5;
  return v6();
}

void sub_18870166C()
{
  int v5 = STACK[0x884];
  LODWORD(STACK[0x888]) = STACK[0x884];
  int v6 = v5 - v1 - 318;
  LODWORD(STACK[0x88C]) = v6;
  int v7 = v6 ^ (v3 + 506);
  LODWORD(STACK[0x890]) = v7;
  unsigned int v8 = (16 * LODWORD(STACK[0x818]) - ((32 * LODWORD(STACK[0x818]) - 1155269536) & 0xCB3DE4C0) + 1127280795) ^ 0xE59EF26B | ((v7 ^ 0x80101B02) + v0);
  uint64_t v9 = v4[503] + LODWORD(STACK[0xDB0]) - 962405456;
  unint64_t v10 = 83590351
      * ((83590351 * ((v9 ^ LODWORD(STACK[0x830])) & 0x7FFFFFFF)) ^ ((83590351
                                                                                  * ((v9 ^ LODWORD(STACK[0x830])) & 0x7FFFFFFF)) >> 16));
  LOBYTE(STACK[0x5C3]) = byte_18873E240[v10 >> 24] ^ byte_18873EB80[(v10 >> 24) + 1] ^ byte_18873F7A0[(v10 >> 24) + 1] ^ (v8 - ((2 * v8) & 0xF0) + 120) ^ v10 ^ (47 * ((83590351 * ((83590351 * ((v9 ^ LODWORD(STACK[0x830])) & 0x7FFFFFFF)) ^ ((83590351 * ((v9 ^ LODWORD(STACK[0x830])) & 0x7FFFFFFF)) >> 16))) >> 24)) ^ 0x78;
  v4[20] = *(void *)(v2 + 8LL * (v5 + 1040));
  v4[21] = v9;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_18870178C@<X0>(int a1@<W8>)
{
  int v3 = a1 - 1442646553;
  sub_188725908(*(void *)(v2 + 4024));
  return ((uint64_t (*)(void))(qword_18A26FDB0[(2 * (((*(void *)(v1 + 64) == 0LL) ^ (v3 + 126)) & 1)) & 0xDF | (32 * (((*(void *)(v1 + 64) == 0LL) ^ (v3 + 1771230078)) & 1)) | (v3 + 1771230094)]
                            - 8LL))();
}

uint64_t sub_1887017BC()
{
  int v1 = (v0 + 97357491) & 0x63C54777;
  STACK[0x238] = (unint64_t)malloc(STACK[0x220]);
  uint32_t v2 = arc4random();
  LODWORD(xmmword_18C723288) = (v1 ^ 0xA0EC99B3) + v2 - ((2 * v2) & 0x41D9358A);
  DWORD1(xmmword_18C723288) = ((1812433253 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0x75FEF7AC)
                            + (((xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))
                              * (v1 - 670101676)) & 0xEBFDEF58)
                            + 720216858
                            - ((2
                              * (((1812433253
                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0x75FEF7AC)
                               + (((xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))
                                 * (v1 - 670101676)) & 0xEBFDEF58))
                              + 335679658) & 0x41D9358A);
  return ((uint64_t (*)(void))(qword_18A26FDB0[v1] - 8LL))();
}

void sub_188701900()
{
}

uint64_t sub_18870191C@<X0>(int a1@<W6>, int a2@<W8>)
{
  int v6 = v2 - a1 - 202;
  LODWORD(STACK[0x2C0]) = a2 + 1;
  int v7 = (_DWORD *)STACK[0x200];
  gettimeofday((timeval *)STACK[0x200], 0LL);
  int v8 = v6 + 176123258 + *v7 - ((2 * *v7) & 0x41D9358A);
  uint64_t v9 = (_DWORD *)STACK[0x218];
  v9[1] = *(_DWORD *)(STACK[0x218] + 24) - 1595106619 - ((2 * *(_DWORD *)(STACK[0x218] + 24)) & 0x41D9358A);
  v9[2] = v8;
  uint32_t v10 = arc4random();
  v9[3] = v10 - 1595106619 - ((2 * v10) & 0x41D9358A);
  uint32_t v11 = arc4random();
  **(_DWORD **)(v4 + 105) = v11 - 1595106619 - ((2 * v11) & 0x41D9358A);
  int v12 = ((2 * STACK[0x238]) & 0x6DF55FF4) + (STACK[0x238] ^ 0xB6FAAFFA);
  LODWORD(STACK[0x240]) = v12 - ((2 * v12 + 302686220) & 0x7C7786A2) + 121705303;
  LODWORD(STACK[0x230]) = v3 + 2120358445;
  int v13 = (DWORD1(xmmword_18C723288) ^ 0x945DE068 ^ (1664525
                                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))
                                                 - ((3329050
                                                   * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0x6962F55A)
                                                 + 884046509))
      + (**(_DWORD **)(v4 + 105) ^ 0xA0EC9AC5);
  unsigned int v14 = (v13 ^ 0xBACDE53F) + 1070351458 + ((2 * v13) & 0x759BCA7E);
  DWORD1(xmmword_18C723288) = v14 - ((2 * v14 + 181120190) & 0x41D9358A) - 1504546524;
  STACK[0x570] = qword_18A26FDB0[(v6 - 1753885513) ^ 0x2DE302A1LL];
  LODWORD(STACK[0x588]) = (v6 - 1753885513) ^ 0xF5;
  LODWORD(STACK[0x58C]) = v6 - 1753885513;
  LODWORD(STACK[0x590]) = (v6 - 1753885513) | 0x88;
  *(_DWORD *)(v5 - 192) = 1431737413
                        * ((-769063906 - ((v5 - 200) | 0xD229041E) + ((v5 - 200) | 0x2DD6FBE1)) ^ 0x938864F3)
                        + 40706419
                        + v6;
  LODWORD(STACK[0x578]) = 1;
  STACK[0x580] = 3135030291LL;
  STACK[0x598] = 3135030293LL;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v5 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v5 - 188)] - 4LL))();
}

uint64_t sub_188701C24()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
                                        * ((v3 + v2 + 534) ^ ((4 * (v1 >= 0xBADCC413)) | (8 * (v1 >= 0xBADCC413)))))
                            - 8LL))();
}

uint64_t sub_188701C60()
{
  BOOL v3 = ((((~v2 + v1) ^ (~(_DWORD)v2 + v1)) - 1) & ~(~v2 + v1)) >= 0;
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (int)(v2 ^ 0xBADCC497 ^ ((4 * v3) | (8 * v3)))) - 8LL))();
}

uint64_t sub_188701CD0@<X0>(int a1@<W8>)
{
  int v8 = v4 + a1 - 537;
  LODWORD(xmmword_18C723288) = dword_18C723C44;
  int v9 = v4 + a1 - 1285623312;
  STACK[0x570] = *(void *)(v1 + 8LL * (v8 + 1771230040));
  STACK[0x580] = 2267438428LL;
  LODWORD(STACK[0x578]) = v6;
  LODWORD(STACK[0x588]) = v9 ^ 0x6E;
  LODWORD(STACK[0x58C]) = v9;
  LODWORD(STACK[0x590]) = v9 ^ 0x3E;
  STACK[0x598] = (v3 + 1197086971);
  STACK[0x23C8] = v5;
  *(_DWORD *)(v7 - 192) = 1431737413 * (((v2 | 0x7E8199B1) + (~v2 | 0x817E664E)) ^ 0xC0DF06A2) + 40706419 + v8;
  sub_1886DF534(v7 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v7 - 188)] - 12LL))();
}

uint64_t sub_188701DC4()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((240 * (v1 >= 0x87265D5C)) ^ (v2 + 1771230493))) - 8LL))();
}

uint64_t sub_188701E20()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_188701E8C()
{
  int v6 = (2 * v0) ^ 0x468;
  *(_DWORD *)(*(void *)(v4 + 105) + 4LL * (v3 - 1070351641 + v6)) ^= 0xC0237839 ^ *(_DWORD *)(STACK[0x238] + 4LL * (v3 - 1070351641 + v6));
  return (*(uint64_t (**)(void))(v2 + 8LL * ((113 * ((((v6 - 1842607983) | 0x4412402) ^ v1) + v5 != 1646334879)) ^ v6)))();
}

void sub_188701F30()
{
}

uint64_t sub_188701F48()
{
  *uint64_t v2 = v2[623];
  return (*(uint64_t (**)(void))(v3
                              + 8LL
                              * ((716
                                * (v4 + v1 + v5 + 2 * (v0 ^ 0x274) - 184 == ((2 * (v0 ^ 0x274)) ^ 0x191) + 653171249)) ^ (2 * (v0 ^ 0x274)))))();
}

uint64_t sub_188701FA4()
{
  uint64_t v5 = 4LL * (v3 - 702841733);
  unsigned int v6 = *(_DWORD *)(v0 + 4LL * (v3 - 702841734));
  int v7 = (*(_DWORD *)(v0 + v5) ^ 0xF9101205 ^ (1566083941 * (v6 ^ 0x1BF7EBD3 ^ ((v6 >> 30) | 0xBB1B7114))
                                           - ((-1162799414 * (v6 ^ 0x1BF7EBD3 ^ ((v6 >> 30) | 0xBB1B7114))) & 0xB3F91180)
                                           + 1509722304))
     - v3;
  *(_DWORD *)(v0 + v5) = v7 - ((2 * v7 + 1405683466) & 0x41D9358A) - 892264886;
  STACK[0x570] = *(void *)(v1 + 8LL * (v2 + 1771230040));
  STACK[0x580] = 3295007066LL;
  LODWORD(STACK[0x578]) = 1;
  LODWORD(STACK[0x588]) = v2 + 1151367270;
  LODWORD(STACK[0x58C]) = v2 + 1151367284;
  LODWORD(STACK[0x590]) = (v2 + 1151367284) ^ 0x6A;
  STACK[0x598] = (v3 - 1702801962);
  *(_DWORD *)(v4 - 192) = 1431737413
                        * ((1794860574 - ((v4 - 200) | 0x6AFB661E) + ((v4 - 200) | 0x950499E1)) ^ 0x2B5A06F3)
                        + 40706419
                        + v2;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v4 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v4 - 188)] - 8LL))();
}

uint64_t sub_18870213C()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((v2 + 1771230429) ^ (2 * (v1 < 0xC465D15A)))) - 8LL))();
}

uint64_t sub_188702180()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (2 * (v1 > 0xC465D3C9) + 552)) - 8LL))();
}

uint64_t sub_1887021FC()
{
  int v2 = v0 - v1 - 298;
  LODWORD(xmmword_18C723288) = 552377029;
  free((void *)STACK[0x238]);
  int8x16_t v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  v4.i64[0] = 0x8000000080000000LL;
  v4.i64[1] = 0x8000000080000000LL;
  int32x4_t v5 = vdupq_n_s32(0x60662301u);
  v6.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v6.i32[2] = HIDWORD(xmmword_18C723288);
  int8x16_t v7 = vextq_s8(v3, v6, 0xCuLL);
  int8x16_t v8 = v6;
  v8.i32[3] = unk_18C723298;
  int8x16_t v9 = vbicq_s8(v4, v7);
  int8x16_t v10 = veorq_s8(vandq_s8(v8, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x583E2076u));
  int32x4_t v11 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v10, (int8x16_t)vdupq_n_s32(0x9F99DCFE)),  (int32x4_t)vorrq_s8(v10, (int8x16_t)v5)),  v5),  (int8x16_t)vdupq_n_s32(0xE74B664C));
  v12.i32[0] = *((_DWORD *)&STACK[0x2210] + ((BYTE4(xmmword_18C723288) & 1) == 0));
  v12.i32[1] = *((_DWORD *)&STACK[0x2210] + ((BYTE8(xmmword_18C723288) & 1) == 0));
  v12.i32[2] = *((_DWORD *)&STACK[0x2210] + (~HIDWORD(xmmword_18C723288) & 1LL));
  v12.i32[3] = *((_DWORD *)&STACK[0x2210] + (~unk_18C723298 & 1LL));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v12),  (int8x16_t)vdupq_n_s32(0x9C86BDAE)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)v11, v9),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v11, v11),  (int8x16_t)vdupq_n_s32(0x678FA692u))),  vdupq_n_s32(0xB3C7D349)),  1uLL));
  return ((uint64_t (*)(void))(qword_18A26FDB0[(v2 + 1771230366) ^ 0x14] - 12LL))();
}

uint64_t sub_18870225C(uint64_t a1, uint64_t a2)
{
  int v7 = STACK[0x200];
  if (v3 <= 0xF60052F9) {
    int v8 = *(_DWORD *)(v5 + 3160) + 1;
  }
  else {
    int v8 = v4;
  }
  *(_DWORD *)(v5 + 3160) = v8;
  int v9 = v2 ^ (v2 >> 11);
  unsigned int v10 = (((v9 << 7) ^ 0x7C43AB00) - ((2 * ((v9 << 7) ^ 0x7C43AB00)) & 0x7B966B00) + 1036727762) & 0x9D2C5680 ^ 0x9C0C0000;
  int v11 = (((2 * v10) & 0x20100800) - v10 - 273165347) ^ 0x6CB7D61C;
  unsigned int v12 = (v11 - ((2 * v11) & 0xE6009880) + 1929595970) ^ v9;
  unsigned int v13 = (((v12 << 15) ^ 0xED2A8000) - ((2 * ((v12 << 15) ^ 0xED2A8000)) & 0x481F0000) - 1542457457) & 0xEFC60000 ^ 0x88C60000;
  unsigned int v14 = (-1210226291 - (v13 | 0xB7DD698D) + (v13 | 0x48229672)) ^ v12;
  *(_BYTE *)(*(void *)(v6 + 592) + (v7 - 1462163619)) = ((v14 ^ (v14 >> 18) ^ 0x60)
                                                                       - ((2 * (v14 ^ (v14 >> 18) ^ 0x60)) & 0x8A)
                                                                       - 59) ^ 0xB1;
  BOOL v15 = v7 - (((v14 ^ (v14 >> 18) ^ 0x60) - ((2 * (v14 ^ (v14 >> 18) ^ 0x60)) & 0x8A) - 59) != 0xB1) != 1462163618;
  int8x16_t v16 = (uint64_t (*)(uint64_t))(*(void *)(a2 + 8LL * (v15 | (4 * v15) | 0x1C8)) - 8LL);
  LODWORD(STACK[0x1008]) = 551;
  return v16(2583212107LL);
}

uint64_t sub_188702270@<X0>(int a1@<W8>)
{
  *unsigned int v3 = v3[623];
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((654 * (v5 + v1 + ((a1 - 471) ^ (v2 - 2)) == ((a1 - 471) | 0x88) + 138299844)) ^ (a1 - 11))))();
}

uint64_t sub_1887022C8@<X0>(int a1@<W8>)
{
  uint64_t v5 = 4LL * (v3 - 1474750581);
  unsigned int v6 = *(_DWORD *)(v1 + 4LL * (v3 - 1474750582));
  int v7 = (*(_DWORD *)(v1 + v5) ^ 0xE41E7635 ^ (1566083941 * (v6 ^ 0xB09E2F2F ^ ((v6 >> 30) | 0x1072B5E8))
                                           - ((-1162799414 * (v6 ^ 0xB09E2F2F ^ ((v6 >> 30) | 0x1072B5E8))) & 0x89E5D9E0)
                                           + 1156771056))
     - v3;
  *(_DWORD *)(v1 + v5) = v7 - ((2 * v7 + 802017514) & 0x41D9358A) - 120356038;
  STACK[0x570] = *(void *)(v2 + 8 * ((a1 - 810335862) ^ 0x66206E70LL));
  LODWORD(STACK[0x578]) = a1 - 810335862;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = (a1 - 810335862) & 0xEF24EFDA;
  LODWORD(STACK[0x590]) = (a1 - 810335862) ^ 0x38;
  STACK[0x580] = (v3 - 1526769932);
  STACK[0x598] = 4242947944LL;
  *(_DWORD *)(v4 - 192) = 1431737413
                        * ((644274477 - ((v4 - 200) | 0x2666D92D) + ((v4 - 200) | 0xD99926D2)) ^ 0x67C7B9C0)
                        + 40706419
                        + a1;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v4 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v4 - 188)])();
}

uint64_t sub_188702460()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * (4 * (v1 < 0xFCE63F68) + 473)) - 4LL))();
}

uint64_t sub_1887024BC()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((4 * (v1 > 0xFCE641D7)) ^ 0x1D9)) - 4LL))();
}

uint64_t sub_188702520()
{
  unsigned int v1 = v0 ^ 0x966D2DC1;
  LODWORD(xmmword_18C723288) = 552377029;
  free((void *)STACK[0x240]);
  int v2 = (v1 + 1771230005) | 0x7C;
  int8x16_t v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  v4.i64[0] = 0x8000000080000000LL;
  v4.i64[1] = 0x8000000080000000LL;
  int32x4_t v5 = vdupq_n_s32(0x7DB00431u);
  v6.i64[0] = 0x8000000080000000LL;
  v6.i64[1] = 0x8000000080000000LL;
  v7.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v7.i32[2] = HIDWORD(xmmword_18C723288);
  int8x16_t v8 = vextq_s8(v3, v7, 0xCuLL);
  int8x16_t v9 = v7;
  v9.i32[3] = dword_18C723298[0];
  int8x16_t v10 = (int8x16_t)vaddq_s32((int32x4_t)vorrq_s8(v8, v4), vdupq_n_s32(0x502CF80Fu));
  int32x4_t v11 = (int32x4_t)veorq_s8(vandq_s8(v9, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x44B663B2u));
  int8x16_t v12 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v11, v11), (int8x16_t)vdupq_n_s32(0xFD8F33C4)),  v11),  vdupq_n_s32(0x138661Du)),  (int8x16_t)vdupq_n_s32(0x25220E1Du));
  int32x4_t v13 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v12, (int8x16_t)vdupq_n_s32(0x824FFBCE)),  (int32x4_t)vorrq_s8(v12, (int8x16_t)v5)),  v5),  (int8x16_t)vdupq_n_s32(0xC20F6AB8));
  v14.i32[0] = *((_DWORD *)&STACK[0x1908] + (DWORD1(xmmword_18C723288) & ((v2 ^ 0x14u) - 231) ^ 1LL));
  v14.i32[1] = *((_DWORD *)&STACK[0x1908] + ((BYTE8(xmmword_18C723288) & 1) == 0));
  v14.i32[2] = *((_DWORD *)&STACK[0x1908] + (~HIDWORD(xmmword_18C723288) & 1LL));
  v14.i32[3] = *((_DWORD *)&STACK[0x1908] + ((dword_18C723298[0] & 1) == 0));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v14),  (int8x16_t)vdupq_n_s32(0x11510E72u)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)v13, vandq_s8(v10, v6)),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v13, v13),  (int8x16_t)vdupq_n_s32(0x78718402u))),  vdupq_n_s32(0x3C38C201u)),  1uLL));
  return ((uint64_t (*)(void))(qword_18A26FDB0[v2 ^ 0x204] - 8LL))();
}

uint64_t sub_188702614(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5 + 8LL * (((v3 + 8 == a3) * (((v4 - 486) | 0x10E) ^ 0x110)) ^ v4)))();
}

uint64_t sub_18870264C(uint64_t a1, int a2)
{
  LODWORD(STACK[0x228]) = a2;
  STACK[0x1978] = 0x8BB9799912B1C946LL;
  LODWORD(STACK[0x278]) = *(_DWORD *)(v5 + 3208) - 1823406259;
  uint64_t v9 = *(unsigned int *)(v6 + 3160);
  v7[12] = *(void *)(v3 + 8 * ((v2 + 1638771844) ^ 0x1FFFFFFFF81AD966LL));
  LODWORD(STACK[0x578]) = v2 + 1638771844;
  LODWORD(STACK[0x588]) = 0;
  v7[14] = 1074171621LL;
  LODWORD(STACK[0x58C]) = (v2 + 1638771844) & 0xFE3BFB0C;
  LODWORD(STACK[0x590]) = v2 + 1638771759;
  v7[17] = v9;
  *(void *)(v4 + 448) = &STACK[0x570];
  *(_DWORD *)(v8 - 192) = 1431737413 * ((((2 * (v8 - 200)) | 0xF8DCFDD6) - (v8 - 200) + 59867413) ^ 0x4230E1F9)
                        + 40706419
                        + v2;
  sub_1886DF534(v8 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v8 - 188)] - 4LL))();
}

uint64_t sub_188702754()
{
  int v1 = (v0 + 307996852) & 0x57372BFE;
  STACK[0x238] = (unint64_t)malloc(STACK[0x218]);
  uint32_t v2 = arc4random();
  LODWORD(xmmword_18C723288) = v2 - 1595106619 - ((v2 << (((v0 - 76) & 0xFE) + 3)) & 0x41D9358A);
  int v3 = xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30);
  unsigned int v4 = (1812433253 * v3) ^ 0xFFFB77AB;
  unsigned int v5 = (-670100790 * v3) & ((v1 - 1942286889) & 0x73C4F2FE ^ 0xFFF6ED82);
  DWORD1(xmmword_18C723288) = v4 + v5 - 1594809573 - ((2 * (v4 + v5) - 2146889556) & 0x41D9358A);
  return ((uint64_t (*)(void))qword_18A26FDB0[v1])();
}

void sub_188702894()
{
}

void sub_1887028B0()
{
}

uint64_t sub_188702AAC@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, uint64_t a3@<X7>, int a4@<W8>)
{
  uint64_t v8 = (unsigned int *)(a2 + 4 * (v4 + a3));
  unsigned int v9 = (a4 ^ 0x353) + (v5 & 0x80000000 ^ 0x83D880BB) - 528444007;
  uint64_t v10 = v4 + 1;
  int v11 = *(_DWORD *)(a2 + 4 * (v10 + a3));
  unsigned int v12 = (v11 & 0x7FFFFFFE ^ 0x282C1AC1) + (v11 & v7 ^ 0x9153E424) - ((v11 & 0x7FFFFFFE ^ 0x282C1AC1) & (v7 + 1));
  *uint64_t v8 = v8[397] ^ *((_DWORD *)&STACK[0x1978] + ((v11 & 1) == 0)) ^ (((v12 ^ 0x919B6460 | v9 ^ 0xE45918B8)
                                                                   - 2 * ((v12 ^ 0x919B6460) & 0x12F2047C ^ v12 & 8)
                                                                   - 1829632908) >> 1) ^ 0x5BC8CB7C;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((799 * (v10 == v6 + 3)) ^ a4)) - 4LL))();
}

uint64_t sub_188702BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v10 = v8 - 3;
  int v11 = (const float *)&dword_18C723614;
  int8x16_t v12 = (int8x16_t)vld1q_dup_f32(v11);
  v13.i64[0] = 0x8000000080000000LL;
  v13.i64[1] = 0x8000000080000000LL;
  v14.i64[0] = 0xA0000000ALL;
  v14.i64[1] = 0xA0000000ALL;
  uint64_t v15 = (v10 + 74);
  v9.i64[0] = *(void *)&dword_18C723618;
  v9.i32[2] = *(_DWORD *)(a7 + 4 * (v15 ^ 0x24A));
  int8x16_t v16 = vextq_s8(v12, v9, 0xCuLL);
  int8x16_t v17 = v9;
  v17.i32[3] = dword_18C723624;
  int32x4_t v18 = (int32x4_t)veorq_s8( vorrq_s8(vandq_s8(v17, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), vandq_s8(v16, v13)),  (int8x16_t)vdupq_n_s32(0xA0EC9AC4));
  int32x4_t v19 = (int32x4_t)veorq_s8(vandq_s8((int8x16_t)v18, (int8x16_t)vdupq_n_s32(0x1127C21Eu)), vandq_s8(v17, v14));
  v20.i32[0] = *(_DWORD *)(v7 + 4LL * ((dword_18C723618 & 1) == 0));
  v20.i32[1] = *(_DWORD *)(v7 + 4 * (~dword_18C72361C & 1LL));
  v20.i32[2] = *(_DWORD *)(v7 + 4 * (~*(_DWORD *)(a7 + 4 * (v15 ^ 0x24A)) & 1LL));
  v20.i32[3] = *(_DWORD *)(v7 + 4 * (~dword_18C723624 & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v20),  (int8x16_t)vdupq_n_s32(0x1A22284Cu)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32(v18, vaddq_s32(v19, v19)),  vdupq_n_s32(0x1127C215u)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a6 + 8LL * (v10 ^ 7)) - 4LL))();
}

void sub_188702CD8()
{
}

uint64_t sub_188702CE4@<X0>(uint64_t a1@<X5>, _DWORD *a2@<X6>, int a3@<W8>)
{
  unsigned int v3 = (((a3 - 1845420451) | 0x46C0C42)
      - (((a3 - 1074824497) & 0xD67DAFCF ^ 0xE992D2B5) & *a2 ^ 0x2EA3D62A)
      + 241339357
      + ((2 * (((a3 - 1074824497) & 0xD67DAFCF ^ 0xE992D2B5) & *a2 ^ 0x2EA3D62A)) & 0xB6608DAC)) ^ 0xA68BB9E6;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x1978] + ((*a2 & 1) == 0)) ^ ((((v3 - ((2 * v3) & 0x350D3364) - 1702454862) ^ 0x968DD592 | ((a2[623] & 0x80000000) - 1584853624) & 0x80000000)
                                                                       + 993637813
                                                                       - 2
                                                                       * (((v3 - ((2 * v3) & 0x350D3364) - 1702454862) ^ 0x968DD592) & 0x3B39B5BD ^ (v3 - ((2 * v3) & 0x350D3364) - 1702454862) & 8)) >> 1) ^ 0xF2D139C;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((104 * (LODWORD(STACK[0x278]) > 0x26F)) ^ a3)) - 12LL))();
}

uint64_t sub_188702E18@<X0>(int a1@<W8>)
{
  int v4 = v2 + v1 - 724;
  LODWORD(STACK[0x278]) = a1 + 1;
  gettimeofday((timeval *)STACK[0x200], 0LL);
  int v5 = (_DWORD *)STACK[0x240];
  int v6 = v4 + *(_DWORD *)(STACK[0x240] + 16) + 176123258 - ((2 * *(_DWORD *)(STACK[0x240] + 16)) & 0x41D9358A);
  v5[1] = *(_DWORD *)(STACK[0x240] + 24) - 1595106619 - ((2 * *(_DWORD *)(STACK[0x240] + 24)) & 0x41D9358A);
  v5[2] = v6;
  uint32_t v7 = arc4random();
  v5[3] = v7 - 1595106619 - ((2 * v7) & 0x41D9358A);
  uint32_t v8 = arc4random();
  *int v5 = v8 - 1595106619 - ((2 * v8) & 0x41D9358A);
  LODWORD(STACK[0x230]) = -657836292;
  int v9 = (DWORD1(xmmword_18C723288) ^ 0x9BB7A87A ^ (1664525
                                                * (xmmword_18C723288 ^ 0xEFA940D3 ^ ((xmmword_18C723288 >> 30) | 0x4F45DA14))
                                                - ((3329050
                                                  * (xmmword_18C723288 ^ 0xEFA940D3 ^ ((xmmword_18C723288 >> 30) | 0x4F45DA14))) & 0x76B6657E)
                                                + 995832511))
     + (*(_DWORD *)STACK[0x240] ^ 0xA0EC9AC5);
  unsigned int v10 = (v9 ^ 0xEBBDF2F7) + 416676735 + ((2 * v9) & 0xD77BE5EE);
  DWORD1(xmmword_18C723288) = v10 - ((2 * v10 + 1993876244) & 0x41D9358A) - 1671910321;
  STACK[0x570] = qword_18A26FDB0[(v4 - 99200787) ^ 0x1FFFFFFF90837E9DLL];
  LODWORD(STACK[0x58C]) = v4 - 99200710;
  LODWORD(STACK[0x590]) = (v4 - 99200787) ^ 0x11;
  *(_DWORD *)(v3 - 192) = 1431737413
                        * ((-741454645 - ((v3 - 200) | 0xD3CE4CCB) + ((v3 - 200) | 0x2C31B334)) ^ 0x926F2C26)
                        + 40706419
                        + v4;
  LODWORD(STACK[0x578]) = v4 - 99200787;
  LODWORD(STACK[0x588]) = 0;
  STACK[0x580] = 1857207511LL;
  STACK[0x598] = 1857207509LL;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v3 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v3 - 188)] - 8LL))();
}

uint64_t sub_188703118()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((97 * (v1 < (STACK[0x230] & 0x2735CB2F ^ 0x6EB2BEF9u))) ^ (v2 + v3 + 557))))();
}

uint64_t sub_188703164()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((97 * (v1 > 0x6EB2BF44)) ^ (v2 - 1771229320))))();
}

uint64_t sub_1887031B4()
{
  int v7 = v3 + v0 - 556;
  LODWORD(xmmword_18C723288) = dword_18C723C44;
  int v8 = v3 + v0 - 487826471;
  STACK[0x570] = *(void *)(v1 + 8 * (v8 ^ 0x79598BF5LL));
  LODWORD(STACK[0x578]) = v8;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = v8 ^ 0x55;
  LODWORD(STACK[0x590]) = v8 ^ 0x70;
  STACK[0x580] = (v4 - 263031797);
  STACK[0x598] = 153644937LL;
  STACK[0x23C8] = v5;
  *(_DWORD *)(v6 - 192) = 1431737413 * ((((2 * v2) | 0xE295A88) - v2 - 118795588) ^ 0xB94A3256) + 40706419 + v7;
  sub_1886DF534(v6 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v6 - 188)] - 8LL))();
}

uint64_t sub_1887032AC()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((744 * (v1 >= 0x9286F89)) ^ 0xEA)) - 12LL))();
}

uint64_t sub_188703324()
{
  return ((uint64_t (*)(void))(*(void *)(v0
                                        + 8LL
}

uint64_t sub_188703390()
{
  *(_DWORD *)(STACK[0x240] + 4LL * (v5 - 416677458 + v0 + 490)) ^= 0x733655DE ^ *(_DWORD *)(STACK[0x238] + 4LL * (v5 - 416677458 + v0 + 490));
}

void sub_18870342C()
{
}

uint64_t sub_18870343C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x498] = v69;
  STACK[0x388] = STACK[0x238];
  return a67(a69);
}

uint64_t sub_18870345C(void *a1)
{
}

uint64_t sub_1887034DC()
{
  **(_DWORD **)(v2 + 680) = STACK[0x41C];
  **(void **)(v2 + 688) = v0;
  STACK[0x368] = *(void *)(v3 + 4072);
  CFRelease(*(CFTypeRef *)(v2 + 488));
  CFRelease(*(CFTypeRef *)(v2 + 696));
}

uint64_t sub_18870357C()
{
  LODWORD(STACK[0x181C]) = v2;
  unint64_t v5 = STACK[0x368];
  uint64_t v6 = (char *)&STACK[0x19A0] + STACK[0x368];
  v3[63] = STACK[0x368];
  v3[64] = v6;
  STACK[0x368] = v5 + (((v1 + 1771230149) | 0x288) ^ (v1 - 1065840088) & 0xA91A41DD ^ 0x2E9LL);
  LODWORD(STACK[0x375]) = -1010000701;
  LOWORD(STACK[0x379]) = -15938;
  LOBYTE(STACK[0x37B]) = -65;
  int v7 = (char *)&STACK[0x19A0] + v5;
  *((void *)v7 + 1) = 0LL;
  v3[65] = v7 + 8;
  *((_DWORD *)v6 + 4) = 1807441107;
  uint64_t v8 = *(void *)(v0 + 8LL * (v1 + 1771230044));
  unint64_t v9 = 591644117
     * ((((v4 - 200) | 0x807F0AF9DFC2FD84LL) - (v4 - 200) + ((v4 - 200) & 0x7F80F506203D0278LL)) ^ 0x64642A3044C7B7C3LL);
  STACK[0x23D8] = (unint64_t)(v6 + 0x7182805D305DBF7CLL);
  *(_DWORD *)(v4 - 176) = -922504226 - v9 + v1;
  STACK[0x23C8] = v8 - v9;
  sub_18871DC68(v4 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[(v1 + 1771230044) ^ (30 * (*(_DWORD *)(v4 - 192) != 803790352)) ^ 0x204])(*(void *)v3[65]);
}

uint64_t sub_1887036F0(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((44 * (((a1 == 0) ^ v2) & 1)) | v2)) - 12LL))();
}

uint64_t sub_188703724(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1 + 8LL * (int)(((((v2 - 844) | 0x93) + ((v2 - 551) ^ 0xFFFFFE26)) * (a1 == 0)) ^ v2)))();
}

uint64_t sub_188703764@<X0>(int a1@<W8>)
{
  int v4 = (a1 - 32) ^ 0x575;
  BOOL v5 = (*(_DWORD *)(v2 + 16) - 1807441120 + v4 - 1054) > 0xFFFFFFF8;
  uint64_t v6 = (uint64_t (*)(void))(*(void *)(v1 + 8LL * (((4 * v5) | (8 * v5)) ^ a1)) - 12LL);
  LODWORD(STACK[0x1024]) = v4;
  *(void *)(v3 + 2840) = 1687668172LL;
  return v6();
}

uint64_t sub_1887037BC(unint64_t a1)
{
  unint64_t v4 = sub_188725908(a1);
  STACK[0x368] = *(void *)(v3 + 504);
  if (LODWORD(STACK[0x181C]) == ((((v1 + 158661790) & 0xF68B02B7) + 224) ^ 0x187)) {
    int v5 = 1;
  }
  else {
    int v5 = v2;
  }
  return ((uint64_t (*)(unint64_t))qword_18A26FDB0[(57 * v5) ^ (v1 - 114)])(v4);
}

uint64_t sub_188703820()
{
  v3[445] = &STACK[0x2328];
  LODWORD(STACK[0x2300]) = v1 + 3;
  LODWORD(STACK[0x2328]) = 1896455922;
  v3[446] = &STACK[0x2320];
  STACK[0x2320] = 0LL;
  unint64_t v4 = off_18C723C60[0];
  v2[753] = *off_18C723C60[0] - 109;
  v2[754] = v4[1] - 109;
  v2[755] = v4[2] - 109;
  v2[756] = v4[3] - 109;
  v2[757] = v4[4] - 109;
  v2[758] = v4[5] - 109;
  v2[759] = v4[6] - 109;
  v2[760] = v4[7] + ((v0 - 66) ^ 0xD6);
  v2[761] = v4[8] - 109;
  v2[762] = v4[9] - 109;
  v2[763] = v4[10] - 109;
  v2[764] = v4[11] - 109;
  v2[765] = v4[12] - 109;
  v2[766] = v4[13] - 109;
  v2[767] = v4[14] - 109;
  v2[768] = v4[15] - 109;
  v2[769] = v4[16] - 109;
  v2[770] = v4[17] - 109;
  v2[771] = v4[18] - 109;
  v2[772] = v4[19] - 109;
  v2[773] = v4[20] - 109;
  v2[774] = v4[21] - 109;
  v2[775] = off_18C723C60[0][22] - 109;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v6 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x1919], SystemEncoding);
  v3[447] = v6;
  return ((uint64_t (*)(void))qword_18A26FDB0[(82 * (v6 == 0LL)) ^ v0])();
}

uint64_t sub_1887039E0()
{
  unsigned __int8 v5 = v0 + v1 - 12;
  uint64_t v6 = MGCopyAnswer();
  *(void *)(v4 + 200) = v6;
  return (*(uint64_t (**)(void))(v3 + 8LL * ((21 * ((v5 ^ (v6 == 0)) & 1)) ^ v2)))();
}

uint64_t sub_188703A1C()
{
  unint64_t v2 = STACK[0x368];
  STACK[0x1838] = STACK[0x368];
  STACK[0x1840] = (unint64_t)&STACK[0x19A0] + v2;
  STACK[0x368] = v2 + 64;
  STACK[0x1848] = ((32 * (((unint64_t)&STACK[0x19A0] + v2) & 1)) ^ 0x20)
  CFTypeID v3 = CFGetTypeID((CFTypeRef)STACK[0x16F0]);
  unint64_t v4 = v3 ^ 0xF9FEFFB6EEFF3F3FLL;
  unint64_t v5 = (2 * v3) & 0xF3FDFF6DDDFE7E7ELL;
  CFTypeID TypeID = CFStringGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((491
                                          * (v4
                                           + (TypeID ^ 0x878224260484927LL)
                                           + v5
                                           - ((2 * TypeID) & 0xEF0FBB7B3F6F6DB0LL) != 0x27721F94F478866LL)) ^ v0))
                            - 4LL))();
}

uint64_t sub_188703B24()
{
  int v3 = v0 + 732;
  uint64_t v4 = (v0 - 176) | 0x98u;
  CFTypeID v5 = CFGetTypeID(*(CFTypeRef *)(v1 + 200));
  uint64_t v6 = v5 ^ 0x7DFFFEF4E7BB67F9LL;
  unint64_t v7 = (v4 ^ 0xFBFFFDE9CF76CF28LL) & (2 * v5);
  CFTypeID TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((43
                                          * (v6
                                           + (TypeID ^ 0xA604142602A23402LL)
                                           - ((2 * TypeID) & 0xB3F7D7B3FABB97FALL)
                                           + v7 == 0x2404131AEA5D9BFBLL)) ^ v3))
                            - 8LL))();
}

uint64_t sub_188703BD8()
{
  int Length = CFDataGetLength(*(CFDataRef *)(v2 + 200));
  unsigned int v4 = Length - ((((v0 - 74) | 0x68) ^ 0xDA3E6C4E) & (2 * Length)) - 316721573;
  LODWORD(STACK[0x157C]) = v4 ^ 0x9C16A8A9;
  LODWORD(STACK[0x50C]) = v4 ^ 0x9C16A8A9;
  CFTypeID v5 = malloc(v4 ^ 0xED1F365B);
  STACK[0x1580] = (unint64_t)v5;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL
}

uint64_t sub_188703C74()
{
  uint64_t v5 = (v1 + ((v0 - 802595996) & 0x2FD6A3A6) - 4) ^ v2;
  uint64_t v6 = (void *)(*(void *)(v4 + 544) + *(void *)(v4 + 536) - 0x36CE54996FAFFCB8LL);
  v9.length = (((v0 + 91) | 1) ^ v5 ^ 0x5EEFDFF347FDF498LL)
  *uint64_t v6 = 0LL;
  v6[1] = v9.length;
  v9.location = 0LL;
  CFDataGetBytes(*(CFDataRef *)(v4 + 200), v9, (UInt8 *)STACK[0x1580]);
  unint64_t v7 = sub_18872562C(v5, 0x32u, 2114404905);
  *(void *)(v4 + 480) = v7;
  return (*(uint64_t (**)(void))(v3 + 8LL * ((428 * (v7 == 0)) ^ v0)))();
}

uint64_t sub_188703D68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v8 = (v5 ^ 0xB3DF969E29C6FE7FLL)
     + (v4 & 0x538DFCFE)
  *(void *)(v6 + 57) = v8;
  *(_BYTE *)(v6 + 72) = v8 < 0xA75F8CCC;
  CFRange v9 = *(uint64_t (**)(void))(a3
                           + 8LL
                           * ((615
                             * ((v5 ^ 0xB3DF969E29C6FE7FLL)
                              + (v4 & 0x538DFCFE)
                              + (unint64_t)(v3 - 337) != 0xB3DF969E29C6FE83LL)) ^ v3));
  LODWORD(STACK[0x83C]) = v3;
  v7[102] = 0x4D144E4826E20E2FLL;
  v7[103] = 0x4C7E728791431256LL;
  v7[104] = 0x3037FA4F1307F3CFLL;
  return v9();
}

uint64_t sub_188703E1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x4B0]) = v63;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 8LL * ((655 * ((((unsigned __int16)(v64 + 112) | 0x100) ^ LOWORD(STACK[0x157C]) ^ 0xE0E7 ^ 0x7F60u) > (unsigned __int16)(((v64 + 112) | 0x100) - 371))) ^ ((v64 + 112) | 0x100))))( *(void *)(v65 + 89),  1771229876LL,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_188703E60()
{
  int v3 = *(char **)(v1 + 512);
  STACK[0x1528] = (unint64_t)(v3 + 0x7182805D305DBF8CLL);
  sub_1887259EC(aV, v3, 0xFuLL);
  unint64_t v4 = *(void *)(v1 + 512);
  *(void *)(v4 + 24) = 0LL;
  v4 += 24LL;
  STACK[0x1530] = v4;
  *(_DWORD *)(v4 + 8) = 1807441107;
  STACK[0x1538] = v4 + 8;
  unint64_t v5 = 591644117 * ((((v2 - 200) | 0x8B14B09692D2CF00LL) - ((v2 - 200) & 0x8B14B09692D2CF00LL)) ^ 0x6F0F905F09D78547LL);
  STACK[0x23C8] = qword_18A26FDB0[v0] - v5;
  STACK[0x23D8] = STACK[0x1528];
  *(_DWORD *)(v2 - 176) = v0 - v5 + 1601233026;
  sub_18871DC68(v2 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(int)(v0 ^ (11 * (*(_DWORD *)(v2 - 192) != 803790352)) ^ 0x2C6)]
                                         - 4LL))(*(void *)STACK[0x1530]);
}

uint64_t sub_188703F74(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (int)((30 * ((((((v2 + 1386544200) & 0xAD5B073A) - 836) ^ (a1 == 0)) & 1) == 0)) ^ (v2 + 1386544200) & 0xAD5B073A))
                            - (((v2 + 1386544200) & 0xAD5B073A)
                             - 836)
                            + 218LL))();
}

uint64_t sub_188703FC8(unint64_t a1)
{
  unint64_t v3 = sub_188725908(a1);
  return ((uint64_t (*)(unint64_t))qword_18A26FDB0[((v1 ^ 1) * ((v2 - 63) ^ 0x1C9)) ^ v2])(v3);
}

uint64_t sub_188704000()
{
  LODWORD(STACK[0x12A4]) = -45000;
  unint64_t v4 = STACK[0x368];
  *(void *)(v2 + 3480) = STACK[0x368];
  *(void *)(v2 + 3488) = (char *)&STACK[0x19A0] + v4;
  STACK[0x368] = v4 + 32;
  LODWORD(STACK[0x409]) = -689983530;
  LOWORD(STACK[0x40D]) = -11055;
  LOBYTE(STACK[0x40F]) = -46;
  unint64_t v5 = (char *)&STACK[0x19A0] + v4;
  *((void *)v5 + 1) = 0LL;
  *(void *)(v2 + 3496) = (char *)&STACK[0x19A0] + v4 + 8;
  *((_DWORD *)v5 + 4) = 1807441107;
  uint64_t v6 = *(void *)(v1 + 8LL * (v0 + 1771230044));
  unint64_t v7 = 591644117
     * ((((v3 - 200) | 0xD7617BA6A4DD07CBLL) - (v3 - 200) + ((v3 - 200) & 0x289E84595B22F830LL)) ^ 0x337A5B6F3FD84D8CLL);
  *(_DWORD *)(v3 - 176) = -922504226 - v7 + v0;
  STACK[0x23D8] = (unint64_t)(v5 + 0x7182805D305DBF7CLL);
  STACK[0x23C8] = v6 - v7;
  sub_18871DC68(v3 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[(((v0 + 1771230110) ^ 0x1A8) + 170) ^ (v0 + 1771230044) ^ (637 * (*(_DWORD *)(v3 - 192) == 803790352))])(**(void **)(v2 + 3496));
}

uint64_t sub_188704018(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1 + 8LL * (((((v2 - 37) | 0x25) + 564) * (a1 != 0)) ^ (v2 + 225))))();
}

uint64_t sub_188704044()
{
  uint64_t v3 = *(uint64_t (**)(void))(v0
                           + 8LL
                           * ((249
                             * ((((*(_DWORD *)STACK[0x1538] - 1807441122) < 0xFFFFFFF1) ^ (((v1 - 46) ^ 0x97) + v1 - 40)) & 1)) ^ (v1 + 210)));
  LODWORD(STACK[0x113C]) = (v1 + 210) ^ 0x397;
  *(void *)(v2 + 3120) = 2041999737LL;
  return v3();
}

uint64_t sub_1887040D0@<X0>(unint64_t a1@<X0>, int a2@<W8>)
{
  unsigned int v4 = (a2 & 0xDD3BF6C3) + 650463844;
  sub_188725908(a1);
  sub_1887259EC(aW, *(char **)(v2 + 512), 0xDuLL);
  *(void *)STACK[0x1530] = 0LL;
  *(_DWORD *)STACK[0x1538] = 1807441107;
  uint64_t v5 = qword_18A26FDB0[v4];
  uint64_t v6 = 591644117
     * ((2 * ((v3 - 200) & 0x462613B438D8D8C8LL) - (v3 - 200) - 0x462613B438D8D8CDLL) ^ 0x5DC2CC825C226D74LL);
  STACK[0x23D8] = STACK[0x1528];
  STACK[0x23C8] = v5 - v6;
  *(_DWORD *)(v3 - 176) = v4 - v6 + 1601233026;
  sub_18871DC68(v3 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(v4 + 1068) ^ v4 ^ (211
                                                                             * (*(_DWORD *)(v3 - 192) == 10 * (v4 ^ 0xB2) + 803790142))]
                                         - 4LL))(*(void *)STACK[0x1530]);
}

uint64_t sub_1887040F8()
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(v1 + 200));
  unint64_t v6 = ((Length << ((v0 + 25) ^ 1u)) & 0xCFF36EBBFFBDF3DALL) + (Length ^ 0xE7F9B75DFFDEF9EDLL);
  *(void *)(v4 + 3992) = v6;
  unint64_t v7 = malloc(v6 + 0x180648A200210614LL);
  *(void *)(v4 + 4000) = v7;
  *(void *)(v3 + 8) = v7;
}

uint64_t sub_1887041AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t CString = CFStringGetCString(*(CFStringRef *)(v66 + 200), *(char **)(v67 + 4000), v64, SystemEncoding);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 + 8LL * ((1444 * (((_BYTE)CString << (((v63 + 95) | 1) - 74)) + ~(_BYTE)CString != -1)) ^ v63)) - 8LL))( CString,  1771229876LL,  v65,  v70,  v71,  v72,  v73,  v74,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_18870422C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = (*(void *)(v66 + 3992) + v64) / 2
      - ((((*(void *)(v66 + 3992) + v64) / 2) << (((v63 - 105) | 0x70) ^ 0xF3u)) & (((v63 - 105) ^ 0x966D2CC9)
                                                                                    + 1622445619))
      + 2073091519;
  LODWORD(STACK[0x50C]) = v67 ^ 0xA99434D;
  unint64_t v68 = sub_18872562C(v67 ^ 0x7B90DDBFu, 0x32u, -192082295);
  *(void *)(v65 + 48) = v68;
  return ((uint64_t (*)(unint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(521 * (v68 != 0)) ^ v63] - 8LL))( v68,  1771229876LL,  qword_18A26FDB0,  v69,  v70,  v71,  v72,  v73,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_1887042E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 8LL * (int)((((v63 - a2 - 1011) ^ 0x966D2A90) * (v64 != 1896455922)) ^ v63)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

void sub_188704334(int a1@<W8>)
{
  int v3 = a1 ^ 0x24;
  int v4 = v2 ^ v1;
  if ((v2 ^ v1) <= 1) {
    int v4 = 1;
  }
  LODWORD(STACK[0x1264]) = (v3 ^ 0x62473200) + v4;
  JUMPOUT(0x188704364LL);
}

uint64_t sub_1887043D0@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * ((227
                                          * ((*(char *)(*(void *)(v3 + 4000)
                                                                    + ((v2
                                                                      + ((a2 - 546477197) & 0xB6FFBD5F)
                                                                      - ((4 * LODWORD(STACK[0x1464]) + 1994600528) & 0x6B8B7868)
                                                                      + 1523197713) ^ 0xB5C5BC34))
                                                          - 48) > 9)) ^ a2))
                            - 4LL))();
}

uint64_t sub_188704478@<X0>(int a1@<W1>, uint64_t a2@<X2>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(a2
                                        + 8LL
                                        * (a3 ^ 0x563 | (4
}

uint64_t sub_1887044D4(uint64_t a1, int a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3
                              + 8LL
}

uint64_t sub_1887048E8@<X0>(int a1@<W1>, uint64_t a2@<X2>, int a3@<W8>)
{
  int v6 = (uint64_t (*)(void))(*(void *)(a2
                                     + 8LL
                                     * ((7 * (((a3 + v4 - v5 + 1133114526) & (v3 + 1305133025)) >= 0)) ^ (a1 + v4 + 802)))
                         - 4LL);
  LODWORD(STACK[0x7D4]) = v4 - v5 + 463;
  return v6();
}

void sub_1887049F8()
{
  LODWORD(STACK[0x260]) = -45002;
  JUMPOUT(0x188704A70LL);
}

uint64_t sub_188704B48(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5 = (v3 + 190) | 0x85u;
  unint64_t v6 = ((unint64_t)&STACK[0x48C] ^ 0xDF79FA5FF7EFFFAFLL)
     + 0x208605A008100051LL
     + ((2LL * (void)&STACK[0x48C]) & 0xBEF3F4BFEFDFFF58LL);
  STACK[0x218] = ((2 * (v6 % 0x25)) & 0x5ALL)
               + ((v6 % 0x25) ^ v5 ^ 0x7503567BE57BFD7ALL)
               - 0x7503567BE57BFFDDLL;
  STACK[0x238] = STACK[0x2B8];
  uint64_t v7 = *(void *)(v4 + 544) + *(void *)(v4 + 536) - 0x36CE54996FAFFCB8LL;
  STACK[0x240] = v7;
  STACK[0x200] = v7 + 16;
  return ((uint64_t (*)(uint64_t))(*(void *)(a3
                                                      + 8LL
                                                      * (int)((89
                                                             * ((((_DWORD)v5 - 323) ^ 0xE2246547)
                                                              + (_DWORD)v5
                                                              - a2
                                                              - 664 != 2022805854)) ^ v5))
                                          - 12LL))(4115865718LL);
}

uint64_t sub_188704C94(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x228]) = a4;
  *(void *)(v5 + 16) = 0x469BC48CDF937453LL;
  LODWORD(STACK[0x48C]) = *(_DWORD *)(v7 + 3208) - 1823406259;
  uint64_t v11 = *(unsigned int *)(v8 + 3160);
  v9[12] = *(void *)(a3 + 8 * ((v4 - 1034051331) ^ 0x58CACEE1LL));
  LODWORD(STACK[0x578]) = v4 - 1034051331;
  LODWORD(STACK[0x588]) = 0;
  v9[14] = v6;
  LODWORD(STACK[0x58C]) = v4 - 1034051249;
  LODWORD(STACK[0x590]) = (v4 - 1034051331) ^ 0xAD;
  v9[17] = v11;
  *(_DWORD *)(v10 - 192) = 1431737413 * ((~((v10 - 200) | 0x2B3CC358) + ((v10 - 200) & 0x2B3CC358)) ^ 0x6A9DA3B5)
                         + 40706419
                         + v4;
  *(void *)(v5 + 448) = &STACK[0x570];
  sub_1886DF534(v10 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v10 - 188)] - 4LL))();
}

uint64_t sub_188704D88()
{
  STACK[0x238] = (unint64_t)malloc(STACK[0x218]);
  uint32_t v0 = arc4random();
  LODWORD(xmmword_18C723288) = v0 - 1595106619 - ((2 * v0) & 0x41D9358A);
  DWORD1(xmmword_18C723288) = ((1812433253 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0xBF5D6B74)
                            + ((1477382858 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0x7EBAD6E8)
                            - 510709934
                            - ((2
                              * (((1812433253
                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0xBF5D6B74)
                               + ((1477382858
  return ((uint64_t (*)(void))sub_188704EC4)();
}

void sub_188704EC4()
{
}

void sub_188704EE0()
{
}

uint64_t sub_1887050C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = v11 + 4 * (v10 + a2);
  int v13 = *(_DWORD *)(v12 + 904);
  unsigned int v14 = (((2 * (v13 & 0x7FFFFFFE ^ 0x3E9F83D6)) & 0x18048144) - (v13 & 0x7FFFFFFE ^ 0x3E9F83D6) - 201474211) ^ 0xF98FBE5F;
  unsigned int v15 = (((2 * v14) & 0xA7D42370) - v14 - 1407848890) ^ 0xB814F656;
  *(_DWORD *)(v11 + 4 * (v10 + a2 + ((v8 - 1017) | 0xA0u))) = *(_DWORD *)(v12 + 2488) ^ *((_DWORD *)&STACK[0x2218]
                                                                                        + ((v13 & 1) == 0)) ^ (((v15 | ~v9 & 0x80000000) - ((2 * v15) & 0xCED58544) - 412433758) >> 1) ^ 0xAC261502;
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((v10 + 1 == a3 + 3) ^ v8)) - 8LL))();
}

uint64_t sub_1887051B8@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  uint64_t v5 = (const float *)&dword_18C723614;
  int8x16_t v6 = (int8x16_t)vld1q_dup_f32(v5);
  v7.i64[0] = 0x8000000080000000LL;
  v7.i64[1] = 0x8000000080000000LL;
  uint64_t v8 = (a2 + 749);
  v4.i64[0] = *(void *)&dword_18C723618;
  v4.i32[2] = *(_DWORD *)(v3 + 4 * (v8 ^ 0x328));
  int8x16_t v9 = vextq_s8(v6, v4, 0xCuLL);
  int8x16_t v10 = v4;
  v10.i32[3] = dword_18C723624;
  int8x16_t v11 = vandq_s8(v9, v7);
  int32x4_t v12 = (int32x4_t)vorrq_s8(v11, (int8x16_t)vdupq_n_s32(0x40014221u));
  int8x16_t v13 = (int8x16_t)vsubq_s32( (int32x4_t)vorrq_s8( (int8x16_t)vaddq_s32( (int32x4_t)vbicq_s8((int8x16_t)vdupq_n_s32(0x80400002), v11),  v12),  (int8x16_t)vdupq_n_s32(0x782A0CCu)),  (int32x4_t)vandq_s8((int8x16_t)v12, (int8x16_t)vdupq_n_s32(0x80010201)));
  int32x4_t v14 = (int32x4_t)veorq_s8(vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x542E0F42u));
  int8x16_t v15 = veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v14, v14), (int8x16_t)vdupq_n_s32(0x1741CB04u)),  v14),  vdupq_n_s32(0x745F1A7Eu)),  (int8x16_t)vdupq_n_s32(0xFFA0E586));
  int32x4_t v16 = (int32x4_t)vorrq_s8( veorq_s8( (int8x16_t)vsubq_s32( (int32x4_t)vandq_s8(v15, (int8x16_t)vdupq_n_s32(0x76F87082u)),  (int32x4_t)vorrq_s8(v15, (int8x16_t)vdupq_n_s32(0x76F87083u))),  (int8x16_t)vdupq_n_s32(0x89C51AFF)),  veorq_s8(v13, (int8x16_t)vdupq_n_s32(0x47C2E0EEu)));
  v17.i32[0] = *(_DWORD *)(v2 + 4LL * ((dword_18C723618 & 1) == 0));
  v17.i32[1] = *(_DWORD *)(v2 + 4 * (~dword_18C72361C & 1LL));
  v17.i32[2] = *(_DWORD *)(v2 + 4 * (~*(_DWORD *)(v3 + 4 * (v8 ^ 0x328)) & 1LL));
  v17.i32[3] = *(_DWORD *)(v2 + 4 * (~dword_18C723624 & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v17),  (int8x16_t)vdupq_n_s32(0x8E065F9E)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v16,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v16, v16),  (int8x16_t)vdupq_n_s32(0x4654AF36u))),  vdupq_n_s32(0xA32A579B)),  1uLL));
  return (*(uint64_t (**)(void))(a1 + 8LL * a2))();
}

void sub_188705394()
{
}

uint64_t sub_1887053A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  unsigned int v10 = ((-206746338 - (*v9 & 0x7FFFFFFE ^ 0x60AD9B40 | 0xF3AD4D1E) + (*v9 & 0x7FFFFFFE ^ 0x60AD9B40 | 0xC52B2E1)) | (((-1552488934 - (((v8 - a7 - 975) ^ 0x166D2D4B) & v9[623])) ^ (((v8 - 1636832243) & 0xF7FD3D6F) - 1019204454)) + 1201031713) ^ 0xC2720A20) ^ 0x4C13B365;
  v9[623] = v9[396] ^ *((_DWORD *)&STACK[0x2218] + ((*v9 & 1) == 0)) ^ ((v10 - ((2 * v10) & 0xE4076F5E) - 234637393) >> 1) ^ 0xA692AF84;
  return ((uint64_t (*)(void))(*(void *)(a8 + 8LL * ((31 * (LODWORD(STACK[0x48C]) < 0x270)) ^ v8)) - 8LL))();
}

uint64_t sub_1887054BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v13 = LODWORD(STACK[0x48C])++;
  *(_DWORD *)(v9 + 3208) = v13 + 1823406260;
  uint64_t v14 = (*(_DWORD *)(v10 + 3160) + 1738392579);
  v11[12] = *(void *)(a8 + 8 * ((v8 + 428243621) ^ 0x1FFFFFFFAFF3A753LL));
  v11[14] = 2812564200LL;
  LODWORD(STACK[0x578]) = 1;
  LODWORD(STACK[0x588]) = v8 + 428243590;
  LODWORD(STACK[0x58C]) = v8 + 428243621;
  LODWORD(STACK[0x590]) = (v8 + 428243621) ^ 0x15;
  v11[17] = v14;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  *(_DWORD *)(v12 - 192) = 1431737413 * ((2 * ((v12 - 200) & 0xDE1E798) - (v12 - 200) + 1914574949) ^ 0xCC408777)
                         + 40706419
                         + v8;
  sub_1886DF534(v12 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v12 - 188)] - 4LL))();
}

uint64_t sub_188705704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v10 = STACK[0x228];
  int v11 = 4 * (v4 ^ (v4 - 45));
  if (v5 >= v6) {
    int v12 = *(_DWORD *)(v9 + 3160) + 1;
  }
  else {
    int v12 = v7;
  }
  *(_DWORD *)(v9 + 3160) = v12;
  int v13 = v3 ^ (v3 >> 11);
  unsigned int v14 = (((v13 << (v11 ^ 0x53)) ^ 0x7C43AB00) - ((2 * ((v13 << (v11 ^ 0x53)) ^ 0x7C43AB00)) & 0x11F0A100) - 1996992311) & 0x9D2C5680 ^ 0xC00A520A;
  unsigned int v15 = (v14 - ((2 * v14) & 0x82580C14) + 1639810842) ^ v13;
  unsigned int v16 = ((v15 << 15) ^ 0x81630000) - ((2 * ((v15 << 15) ^ 0x81630000)) & 0x360000) + 1774785;
  unsigned int v17 = ((v16 & 0xEFC60000 ^ 0x21420000) - ((2 * v16) & 0x1C080000) + 506790387) ^ 0x1E3D0DF2;
  unsigned int v18 = (((2 * v17) & 0xCE0C1002) - v17 - 1728564076) ^ v15;
  *(_BYTE *)(v8 + (v10 - 738572342)) = (((8 * (v4 ^ (v4 - 45))) ^ 0xDC ^ v18 ^ (v18 >> 18) ^ 0x12)
                                                    + ((4 * (v4 ^ (v4 - 45)) + 99) & 0xDF ^ 0x5E)
                                                    - ((2 * ((8 * (v4 ^ (v4 - 45))) ^ 0xDC ^ v18 ^ (v18 >> 18) ^ 0x12)) & 0x80)
                                                    - 9) ^ 0xD3;
  return ((uint64_t (*)(uint64_t, uint64_t))(*(void *)(a3
                                                               + 8LL
                                                               * ((62
                                                                 * (v10
                                                                  - ((((2 * v11) ^ 0xDC ^ v18 ^ (v18 >> 18) ^ 0x12)
                                                                                     + ((v11 + 99) & 0xDF ^ 0x5E)
                                                                                     - ((2
                                                                                       * ((2 * v11) ^ 0xDC ^ v18 ^ (v18 >> 18) ^ 0x12)) & 0x80)
                                                                                     - 9) != 0xD3) == 738572341)) ^ v11))
                                                   - 12LL))( 4115865718LL,  1771229876LL);
}

uint64_t sub_188705860()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 344));
  unint64_t v4 = v3 ^ 0xFFFAFEBEFCFAA736LL;
  unint64_t v5 = (2 * v3) & 0xFFF5FD7DF9F54E6CLL;
  CFTypeID TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((1897
                                          * (v4
                                           + (TypeID ^ 0x81198C1870F00A55LL)
                                           + v5
                                           - ((2 * TypeID) & 0xFDCCE7CF1E1FEB54LL)
                                           + 1 == ((v0 + 1089043454) & 0xBF1682FD ^ 0x81148AD76DEAB339LL))) ^ v0))
                            - 12LL))();
}

uint64_t sub_188705920()
{
  Boolean Value = CFNumberGetValue(*(CFNumberRef *)(v1 + 344), kCFNumberSInt64Type, &STACK[0x2A8]);
  BOOL v3 = (((Value << (v0 + 72)) & 0xDE) + (Value ^ 0xEF)) != 239;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(v3 | (4 * v3)) ^ v0] - ((v0 - 1247506239) & 0x4A5B6FF7) + 1126LL))();
}

uint64_t sub_188705990()
{
  LODWORD(STACK[0x478]) = 1896455930;
  uint64_t v2 = malloc(8uLL);
  uint64_t v3 = qword_18A26FDB0[(7 * (v2 != 0LL)) ^ v0];
  *(void *)(v1 + 672) = v2;
  return ((uint64_t (*)(void))(v3 - ((v0 - 1843300541) & 0x6DDE86FF ^ 0x2B1LL)))();
}

uint64_t sub_1887059F8()
{
  uint64_t v3 = *(_BYTE **)(v1 + 672);
  *uint64_t v3 = (HIBYTE(STACK[0x2A8]) - ((STACK[0x2A8] >> 55) & 0x14) + 10) ^ 0xA;
  v3[1] = (v0 - 19 + HIWORD(STACK[0x2A8]) - ((STACK[0x2A8] >> 47) & 0xB6) - 4) ^ 0x5B;
  v3[2] = (((unsigned __int16)WORD2(STACK[0x2A8]) >> 8) - ((STACK[0x2A8] >> 39) & 0x5A) - 83) ^ 0xAD;
  v3[3] = (HIDWORD(STACK[0x2A8]) - ((STACK[0x2A8] >> 31) & 0x12) + 9) ^ 9;
  v3[4] = (HIBYTE(LODWORD(STACK[0x2A8])) - ((LODWORD(STACK[0x2A8]) >> 23) & 0xAA) + 85) ^ 0x55;
  v3[5] = (HIWORD(LODWORD(STACK[0x2A8])) - ((LODWORD(STACK[0x2A8]) >> 15) & 0x68) + 52) ^ 0x34;
  v3[6] = (BYTE1(LODWORD(STACK[0x2A8])) - ((LODWORD(STACK[0x2A8]) >> 7) & 0xCE) - 25) ^ 0xE7;
  v3[7] = (LOBYTE(STACK[0x2A8]) - ((2 * LOBYTE(STACK[0x2A8])) & 0xFC) - 2) ^ 0xFE;
  unint64_t v4 = sub_18872562C(8LL, 0x32u, -293215619);
  v2[506] = v4;
  unint64_t v5 = (uint64_t (*)(void))qword_18A26FDB0[((8 * (v4 == 0)) | (32 * (v4 == 0))) ^ (v0 - 531)];
  LODWORD(STACK[0x5C4]) = v0 - 531;
  v2[23] = 0x4728B10D04CD0B16LL;
  v2[24] = 0x7673F758A717B582LL;
  v2[25] = 0x7F576AAF775ADF1FLL;
  return v5();
}

uint64_t sub_188705BB8()
{
  LODWORD(STACK[0x264]) = v0;
  return ((uint64_t (*)(uint64_t))(*(void *)(v1
                                                      + 8LL
                                                      * ((1871 * (((v2 - 2113655833) | 0x14690140) - v3 != 8)) ^ (v2 + 975)))
                                          - 12LL))(1788291484LL);
}

uint64_t sub_188705BF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  STACK[0x308] = 0x5A72C1CEA1245FC3LL;
  LODWORD(STACK[0x310]) = 1258455831;
  int v59 = off_18C723280;
  v58[786] = *off_18C723280 - 49;
  v58[787] = v59[1] - 49;
  v58[788] = v59[2] - 49;
  v58[789] = v59[3] - 49;
  v58[790] = v59[4] - 49;
  v58[791] = ((v57 + 39) | 0x4B) + v59[5] - 124;
  v58[792] = v59[6] - 49;
  v58[793] = v59[7] + ((v57 + 33) & 0xBF ^ 0x75);
  v58[794] = v59[8] - 49;
  v58[795] = v59[9] - 49;
  v58[796] = v59[10] - 49;
  v58[797] = v59[11] - 49;
  v58[798] = v59[12] - 49;
  v58[799] = v59[13] - 49;
  v58[800] = v59[14] - 49;
  v58[801] = v59[15] - 49;
  v58[802] = v59[16] - 49;
  v58[803] = v59[17] - 49;
  v58[804] = v59[18] - 49;
  v58[805] = v59[19] - 49;
  v58[806] = v59[20] - 49;
  v58[807] = v59[21] - 49;
  v58[808] = off_18C723280[22] - 49;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v61 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x193A], SystemEncoding);
  return ((uint64_t (*)(CFStringRef, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(900 * (v61 != 0LL)) ^ v57] - 8LL))( v61,  v62,  v63,  v64,  qword_18A26FDB0,  v65,  v66,  v67,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

uint64_t sub_188705DC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  BOOL v66 = MGCopyAnswer() == 0;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(98 * v66) ^ a66] - ((a66 - 1771231087) ^ 0x966D2D47LL)))();
}

uint64_t sub_188705E20()
{
  *(void *)(v1 + 448) = qword_18A26FDB0[v0 + 1771230075]
                        - 591644117
                        * ((((2 * (v3 - 200)) | 0x8477F5200305A3F4LL) - (v3 - 200) + 0x3DC4056FFE7D2E06LL) ^ 0x2620DA599A879BBDLL);
  *(_DWORD *)(v3 - 176) = -922504226
                        - 591644117 * ((((2 * (v3 - 200)) | 0x305A3F4) - (v3 - 200) - 25350650) ^ 0x9A879BBD)
                        + v0;
  *(void *)(v1 + 464) = aXUs;
  sub_18871DC68(v3 - 200);
  return 4294922296LL;
}

uint64_t sub_188705E38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, unint64_t a22, char *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  a65 = v67;
  unint64_t v70 = STACK[0x368];
  unint64_t v71 = (unint64_t)&STACK[0x19A0] + STACK[0x368];
  STACK[0x368] += 64LL;
  a23 = (char *)&STACK[0x19A0] + v70;
  a24 = v68;
  uint64_t v72 = (((_DWORD)v69 + 1771806264) & 0x966461DB)
      - 0x59A8333BBF339609LL
      + ((v71 & 1 ^ (~v71 | 0x7FFFFFFFFFFFFFELL)) << ((v69 + 64) | 0x40))
      - 16 * (v71 & 1);
  a22 = (v72 ^ 0x9964A37AE2123493LL) - 0x1001410600500432LL + ((2 * v72) & 0x4C26990801989460LL ^ 0x4C26990801989440LL);
  a66 = v69;
  uint64_t v73 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, char *, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 + 8LL * (int)(v69 ^ (766 * (&a9 != (uint64_t *)-8768LL)))) - 4LL);
  a64 = 126;
  return v73( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  (char *)&STACK[0x19A0] + v70,  v68,  a25,  v70,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
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

uint64_t sub_188705F38(const void *a1)
{
  uint64_t v3 = v1;
  CFTypeID v4 = CFGetTypeID(a1);
  uint64_t v5 = (((v2 - 727548263) & 0x2B5D837D) - 0x1400C1421A4483ACLL) ^ v4;
  unint64_t v6 = (2 * v4) & 0xD7FE7D7BCB76FF60LL;
  CFTypeID TypeID = CFStringGetTypeID();
  BOOL v8 = (TypeID ^ 0x8040A02614E0423LL) + v6 - (((v2 + 329) ^ 0xEFF7EBFB3D63F536LL) & (2 * TypeID)) + v5 == 0xF40348C0470983D3LL;
  return ((uint64_t (*)(void))(*(void *)(v3 + 8LL * (((4 * v8) | (8 * v8)) ^ v2)) - 4LL))();
}

uint64_t sub_188705FF8()
{
  CFIndex Length = CFStringGetLength(v2);
  uint64_t v4 = ((((v0 - 854) ^ 0xDF) - 0x381C120422040F21LL) & (2 * Length))
     + ((((v0 - 854) | 0xD0) + 0x63F1F6FDEEFDF806LL) ^ Length);
  STACK[0x1390] = v4;
  uint64_t v5 = malloc(v4 - 0x63F1F6FDEEFDF8DBLL);
  STACK[0x1398] = (unint64_t)v5;
  STACK[0x358] = (unint64_t)v5;
  return (*(uint64_t (**)(const __CFString *))(v1 + 8LL * ((52 * (v5 == 0LL)) ^ v0)))(v2);
}

uint64_t sub_1887060B8()
{
  CFTypeID v3 = CFGetTypeID(v2);
  unint64_t v4 = v3 ^ 0xEBDF7EFEEFFAF7FALL;
  unint64_t v5 = (2 * v3) & 0xD7BEFDFDDFF5EFF4LL;
  CFTypeID TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((21
                                          * (v4
                                           + (TypeID ^ 0xC0041106002A2400LL)
                                           + v5
                                           - ((2 * TypeID) & 0x7FF7DDF3FFABB7FELL)
                                           + 1 == (((v0 - 498) | 0x22u) ^ 0xABE39004F0251B45LL))) ^ v0))
                            - 12LL))();
}

uint64_t sub_188706164()
{
  int Length = CFDataGetLength(v2);
  int v4 = Length - ((((v0 - 190) | 0x15A) - 633443492) & (2 * Length)) - 316721573;
  LODWORD(STACK[0x12C4]) = v4 ^ 0x9C16A8A9;
  LODWORD(STACK[0x4E4]) = v4 ^ 0x9C16A8A9;
  unint64_t v5 = malloc(v4 ^ 0xED1F365B);
  STACK[0x12C8] = (unint64_t)v5;
  return ((uint64_t (*)(const __CFData *))(*(void *)(v1 + 8LL * ((123 * (v5 == 0LL)) ^ v0)) - 4LL))(v2);
}

uint64_t sub_1887061FC( const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  uint64_t v26 = (v24 + (v23 ^ 0x47) - 285) ^ v25;
  uint64_t v27 = (void *)(a23 + a22 - 0x2F322EB8A28E5A01LL);
  v37.length = (v26 ^ 0xFFEB95EFFE75BBBBLL) + ((2 * v26) & 0x1FCEB7776LL) + 0x146A10018A4445LL;
  *uint64_t v27 = 0LL;
  v27[1] = v37.length;
  v37.location = 0LL;
  CFDataGetBytes(a1, v37, (UInt8 *)STACK[0x12C8]);
  unint64_t v28 = sub_18872562C(v26, 0x32u, 1510496678);
  STACK[0x1548] = v28;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_18A26FDB0[((v28 != 0) * ((v23 - 346) ^ 0x3D8)) ^ v23])( v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17);
}

uint64_t sub_1887062DC()
{
  unint64_t v6 = (v4 & 0xEFAFEDCC) + ((v1 + 638384471) & 0xD9F3058B ^ 0x1840182AD11FAE8LL) + (v3 ^ 0xFE7BFE7D77D7F6E6LL);
  *(void *)(v5 + 3840) = v6;
  *(_BYTE *)(v5 + 3855) = v6 < 0x24E9F1CE;
  int v7 = *(uint64_t (**)(void))(v0 + 8LL * (((v6 == 619311566) * v2) ^ v1));
  LODWORD(STACK[0xBDC]) = v1;
  *(void *)(v5 + 1744) = 0x6BF9A53086F889A6LL;
  *(void *)(v5 + 1752) = 0x4A54A3FFBBF13D54LL;
  *(void *)(v5 + 1760) = 0x3405B9CF181927FFLL;
  return v7();
}

uint64_t sub_1887063A0@<X0>( uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  LODWORD(STACK[0x25C]) = a7;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8LL * ((((((unsigned __int16)(v59 + 420) | 9) ^ LOWORD(STACK[0x12C4]) ^ 0x222A ^ 0xBD74u) <= ((unsigned __int16)(((v59 + 420) | 9) + 11166) ^ 0x2D4Au)) * (((((v59 + 420) | 9) + 91) | 0x25) ^ 0x1AD)) ^ ((v59 + 420) | 9))))( *(void *)(v60 + 3512),  1171779811LL,  a1,  a2,  a3,  a4,  a5,  a6,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,
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

uint64_t sub_1887063F8( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  unsigned int v31 = v28 - 457;
  CFTypeID v32 = CFGetTypeID(v30);
  uint64_t v33 = v32 ^ 0x79DAFEB5E5BFB73DLL;
  unint64_t v34 = (2 * v32) & 0xF3B5FD6BCB7F6E7ALL;
  CFTypeID TypeID = CFNumberGetTypeID();
  return ((uint64_t (*)(const void *))(*(void *)(v29
                                                           + 8LL
                                                           * (int)((885
                                                                  * (v34
                                                                   + v33
                                                                   + (TypeID ^ 0x811E0A1040B2081CLL)
                                                                   + (v31 ^ 0xC4LL)
                                                                   - ((2 * TypeID) & 0xFDC3EBDF7E9BEFC6LL) == 0xFAF908C62671BF5ALL)) ^ v31))
                                               - 4LL))(v30);
}

uint64_t sub_1887064C0(const __CFNumber *a1)
{
  Boolean Value = CFNumberGetValue(a1, kCFNumberSInt64Type, &STACK[0x4E8]);
  return ((uint64_t (*)(const __CFNumber *))(qword_18A26FDB0[(1198
                                                                      * ((((2 * Value) & 0xCA)
                                                                                         + (Value ^ 0xE5)) != 229)) ^ v1]
                                                     - ((v1 + 20) ^ 0xDDLL)))(a1);
}

uint64_t sub_188706520( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  LODWORD(STACK[0x4E4]) = 1896455930;
  uint64_t v27 = malloc(8uLL);
  *(void *)(v26 + 208) = v27;
  return ((uint64_t (*)(uint64_t))(qword_18A26FDB0[(1178 * (v27 != 0LL)) ^ v25] - ((v25 - 173) | 0xC1u) + 213LL))(a25);
}

uint64_t sub_18870657C()
{
  int v2 = *(_BYTE **)(v1 + 208);
  *int v2 = (LOBYTE(STACK[0x4EF]) + ~(((v0 + 93) ^ 0xE6) & (2 * LOBYTE(STACK[0x4EF]))) - 29) ^ 0xE2;
  v2[1] = (HIWORD(STACK[0x4E8]) - ((STACK[0x4E8] >> 47) & 0xCE) + 103) ^ 0x67;
  v2[2] = (((unsigned __int16)WORD2(STACK[0x4E8]) >> 8) - ((STACK[0x4E8] >> 39) & 0xCE) + 103) ^ 0x67;
  v2[3] = (HIDWORD(STACK[0x4E8]) - ((STACK[0x4E8] >> 31) & 0x14) + 10) ^ 0xA;
  v2[4] = (HIBYTE(LODWORD(STACK[0x4E8])) - ((LODWORD(STACK[0x4E8]) >> 23) & 0x9A) - 51) ^ 0xCD;
  v2[5] = (HIWORD(LODWORD(STACK[0x4E8])) - ((LODWORD(STACK[0x4E8]) >> 15) & 0x32) + 25) ^ 0x19;
  v2[6] = (BYTE1(LODWORD(STACK[0x4E8])) - ((LODWORD(STACK[0x4E8]) >> 7) & 0x32) - 103) ^ 0x99;
  v2[7] = (LOBYTE(STACK[0x4E8]) - ((2 * LOBYTE(STACK[0x4E8])) & 0x3C) + 30) ^ 0x1E;
  unint64_t v3 = sub_18872562C(8LL, 0x32u, -1880847222);
  *(void *)(v1 + 296) = v3;
  int v4 = (uint64_t (*)(void))(qword_18A26FDB0[(((v3 == 0) << 6) | ((v3 == 0) << 7)) ^ (v0 + 667)] - 8LL);
  LODWORD(STACK[0x8BC]) = v0 + 667;
  STACK[0x8C0] = 0x4A2EF9BB44035CELL;
  STACK[0x8C8] = 0x79D2101CBF32930DLL;
  STACK[0x8D0] = 0x3F9ACC699846B97LL;
  return v4();
}

uint64_t sub_18870674C@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x3A0]) = a1;
  return (*(uint64_t (**)(void, uint64_t))(v1
                                                    + 8LL
                                                    * ((119
                                                      * (((8 << ((v3 + (((v2 ^ 0xF) + 50) & 0xFD) - 93) ^ (v3 - 1))) & 0x1FDD6) != 8)) ^ v2 ^ 0x20F)))( *(void *)(v4 + 208),  1171779811LL);
}

uint64_t sub_18870679C(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(STACK[0x230]) = a3;
  *(void *)(v7 + 736) = 0x9645DFAD0F4D6F72LL;
  LODWORD(STACK[0x3E8]) = *(_DWORD *)(v5 + 3208) - 1823406259;
  uint64_t v10 = *(unsigned int *)(v6 + 3160);
  v8[12] = *(void *)(a2 + 8 * ((v3 + 934397895) ^ 0x1FFFFFFFCE1EF5BBLL));
  LODWORD(STACK[0x578]) = v3 + 934397895;
  LODWORD(STACK[0x588]) = 0;
  v8[14] = 1074171621LL;
  LODWORD(STACK[0x58C]) = (v3 + 934397895) ^ 0x1C;
  LODWORD(STACK[0x590]) = (v3 + 934397895) ^ 0x96;
  v8[17] = v10;
  *(void *)(v4 + 448) = &STACK[0x570];
  *(_DWORD *)(v9 - 192) = 1431737413 * ((v9 - 1523856494 - 2 * ((v9 - 200) & 0xA52BCC5A)) ^ 0x1B755348) + 40706419 + v3;
  sub_1886DF534(v9 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v9 - 188)] - 4LL))();
}

uint64_t sub_188706898()
{
  int v1 = 2 * (v0 ^ (v0 - 327));
  STACK[0x240] = (unint64_t)malloc(STACK[0x218]);
  uint32_t v2 = arc4random();
  unsigned int v3 = (v1 ^ 0xA0EC985B) + v2 - ((2 * v2) & 0x41D9358A);
  LODWORD(xmmword_18C723288) = v3;
  unsigned int v4 = v3 ^ 0x2D53F0B ^ ((v3 >> (((2 * (v0 ^ (v0 - 71))) ^ 0x62) + 34)) | 0xA239A5CC);
  DWORD1(xmmword_18C723288) = ((1812433253 * v4) ^ 0x23FC5EFE)
                            + ((1477382858 * v4) & 0x47F8BDFC)
                            + 2096118728
                            - ((2 * (((1812433253 * v4) ^ 0x23FC5EFE) + ((1477382858 * v4) & 0x47F8BDFC)) + 939999750) & 0x41D9358A);
  return ((uint64_t (*)(uint64_t))(qword_18A26FDB0[v1] - 4LL))(2096118728LL);
}

void sub_1887069CC()
{
}

void sub_1887069E8()
{
}

uint64_t sub_188706BE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v12 = (v10 | 0x7FFFFFFF) + 1345124367;
  int v13 = *(_DWORD *)(a7 + 4 * (a4 + v9 + (v8 ^ 0x300u)));
  unsigned int v14 = (((2 * (v13 & 0x7FFFFFFE ^ 0x44B663B2)) & 0xFD8F33C4) - (v13 & 0x7FFFFFFE ^ 0x44B663B2) + 20473373) ^ 0x25220E1D;
  unsigned int v15 = (v11 - (v14 | v11) + (v14 | 0x824FFBCE)) ^ 0xC20F6AB8;
  *(_DWORD *)(a7 + 4 * (a4 + v9) + 3996) = *(_DWORD *)(a7 + 4 * (a4 + v9) + 5584) ^ *((_DWORD *)&STACK[0x1908]
                                                                                    + ((v13 & 1) == 0)) ^ (((v15 | v12 & 0x80000000) - ((2 * v15) & 0x78718402) + 1010352641) >> 1) ^ 0x11510E72;
  return ((uint64_t (*)(void))(*(void *)(a6 + 8LL * (((4 * (v9 + 1 != a8 + 3)) | (16 * (v9 + 1 != a8 + 3))) ^ v8)) - 8LL))();
}

uint64_t sub_188706CE4@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  unsigned int v4 = (const float *)&dword_18C723614;
  int8x16_t v5 = (int8x16_t)vld1q_dup_f32(v4);
  int8x16_t v6 = (int8x16_t)vdupq_n_s32(0x7FFFFFFEu);
  v7.i64[0] = 0x8000000080000000LL;
  v7.i64[1] = 0x8000000080000000LL;
  int8x16_t v8 = (int8x16_t)vdupq_n_s32(0x674A1FE6u);
  v9.i64[0] = 0x1600000016LL;
  v9.i64[1] = 0x1600000016LL;
  v3.i64[0] = *(void *)&dword_18C723618;
  v3.i32[2] = dword_18C723620;
  int8x16_t v10 = vextq_s8(v5, v3, 0xCuLL);
  int8x16_t v11 = v3;
  v11.i32[3] = dword_18C723624;
  int8x16_t v12 = vandq_s8((int8x16_t)vsubq_s32(vdupq_n_s32(0x74677199u), (int32x4_t)vorrq_s8(v10, v6)), v7);
  int32x4_t v13 = (int32x4_t)veorq_s8(vandq_s8(v11, v6), (int8x16_t)vdupq_n_s32(0x7EC92FE8u));
  int32x4_t v14 = (int32x4_t)veorq_s8( (int8x16_t)vsubq_s32( vaddq_s32( v13,  (int32x4_t)veorq_s8(vandq_s8(v11, v8), (int8x16_t)vdupq_n_s32(0x1021006u))),  (int32x4_t)vandq_s8((int8x16_t)v13, v8)),  (int8x16_t)vdupq_n_s32(0x276F2BC6u));
  int8x16_t v15 = (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v14, v14), (int8x16_t)vdupq_n_s32(0xD26828E4)),  v14),  vdupq_n_s32(0x96CBEB8D));
  int8x16_t v16 = veorq_s8(v15, (int8x16_t)vdupq_n_s32(0x88CB6A81));
  int32x4_t v17 = (int32x4_t)veorq_s8(vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x456549DFu)), vandq_s8(v15, v9));
  uint32x4_t v18 = (uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8(v16, v12), vaddq_s32(v17, v17)), vdupq_n_s32(0x456549C9u));
  v16.i32[0] = *(_DWORD *)(v2 + 4LL * ((dword_18C723618 & 1) == 0));
  v16.i32[1] = *(_DWORD *)(v2 + 4 * (dword_18C72361C & (((a2 - 600) | 0x204) ^ 0x395u) ^ 1LL));
  v16.i32[2] = *(_DWORD *)(v2 + 4 * (~dword_18C723620 & 1LL));
  v16.i32[3] = *(_DWORD *)(v2 + 4LL * ((dword_18C723624 & 1) == 0));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v16),  (int8x16_t)vdupq_n_s32(0x2DFFCB96u)),  (int8x16_t)vshrq_n_u32(v18, 1uLL));
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * a2) - 8LL))();
}

void sub_188706E98()
{
}

uint64_t sub_188706EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, _DWORD *a7)
{
  unsigned int v8 = (((2 * (*a7 & 0x7FFFFFFE ^ 0x7AC99A06)) | 0x30D1466) - (*a7 & 0x7FFFFFFE ^ 0x7AC99A06) + 2121889229) ^ 0xDBA38AF1;
  a7[623] = a7[396] ^ *((_DWORD *)&STACK[0x1908] + ((*a7 & 1) == 0)) ^ (((v8 | ((((a7[623] & 0x80000000) - 1359903670) ^ (v7 - a5 + 2073040924))
                                                                              - 109853562) & 0x80000000)
                                                                       - ((2 * v8) & 0x8BC856CC)
                                                                       + 1172581223) >> 1) ^ 0x2DBF7AC1;
  return ((uint64_t (*)(void))(*(void *)(a6 + 8LL * ((13 * (LODWORD(STACK[0x3E8]) > 0x26F)) ^ v7)) - 8LL))();
}

uint64_t sub_188706F90@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  LODWORD(STACK[0x3E8]) = 0;
  int v7 = LODWORD(STACK[0x3E8])++;
  *(_DWORD *)(v3 + 3208) = v7 + 1823406260;
  uint64_t v8 = (*(_DWORD *)(v4 + 3160) - 2012211460);
  v5[12] = *(void *)(a1 + 8LL * (a2 + 1771230042));
  LODWORD(STACK[0x578]) = a2 - 553187814;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = a2 - 553187853;
  LODWORD(STACK[0x590]) = (a2 - 553187814) ^ 0x3C;
  v5[14] = v8;
  v5[17] = 3356927457LL;
  *(_DWORD *)(v6 - 192) = 1431737413 * (((~(v6 - 200) & 0x90E6B23E) - (~(v6 - 200) | 0x90E6B23F)) ^ 0x2EB82D2D)
                        + 40706419
                        + a2;
  *(void *)(v2 + 448) = &STACK[0x570];
  sub_1886DF534(v6 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v6 - 188)] - 4LL))();
}

uint64_t sub_188707684(uint64_t a1, uint64_t a2)
{
  int v7 = STACK[0x230];
  if (v3 >= v4) {
    int v8 = *(_DWORD *)(v6 + 3160) + 1;
  }
  else {
    int v8 = 1074171621;
  }
  *(_DWORD *)(v6 + 3160) = v8;
  int v9 = (v2 >> 11) ^ v2;
  unsigned int v10 = (((v9 << 7) ^ 0x7C43AB00) - ((2 * ((v9 << 7) ^ 0x7C43AB00)) & 0xF0C22300) - 127856157) & 0x9D2C5680 ^ 0x10041200;
  unsigned int v11 = (v10 - ((2 * v10) & 0x20182100) - 1872807726) & 0xFFFDFF80 ^ v9;
  unsigned int v12 = ((v11 << 15) ^ 0xDEAB0000) - ((2 * ((v11 << 15) ^ 0xDEAB0000)) & 0xA0F0000) - 2063084048;
  unsigned int v13 = ((v12 & 0xEFC60000 ^ 0xEC020000)
       + (v12 & 0xEEC60000 ^ 0x2CD755F)
       - ((v12 & 0xEFC60000 ^ 0xEC020000) & 0xEEC60000)) ^ 0xCFFF3446;
  unsigned int v14 = (((2 * v13) & 0x7BB80020) - v13 + 1109611305) ^ v11;
  *(_BYTE *)(v5 + (v7 - 1128370669)) = ((v14 ^ (v14 >> 18) ^ 0xC3)
                                                    - ((2 * (v14 ^ (v14 >> 18) ^ 0xC3)) & 0x60)
                                                    - 80) ^ 0x61;
  return ((uint64_t (*)(uint64_t))(*(void *)(a2
                                                      + 8LL
                                                      * ((289
                                                        * (v7
                                                         - (((v14 ^ (v14 >> 18) ^ 0xC3)
                                                                            - ((2 * (v14 ^ (v14 >> 18) ^ 0xC3)) & 0x60)
                                                                            - 80) != 0x61) == 1128370668)) ^ 0x201))
                                          - 12LL))(3637661167LL);
}

void sub_188707804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v5[104];
  v5[105] = v6;
  uint64_t v7 = v5[103];
  v5[106] = v7;
  v5[107] = v5[102];
  int v8 = STACK[0x83C];
  LODWORD(STACK[0x874]) = STACK[0x83C];
  LODWORD(STACK[0x878]) = v8 - 337;
  uint64_t v9 = v7 + *(void *)(v4 + 480) - 0x4C7E728791431256LL;
  unsigned int v10 = 83590351 * ((v8 + 2147483306) & (*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ v9));
  unint64_t v11 = 83590351 * (v10 ^ HIWORD(v10));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v11 >> 24] ^ *(_BYTE *)(v6 + *(void *)(v3 + 89) - 0x3037FA4F1307F3CFLL) ^ byte_188743410[v11 >> 24] ^ byte_188744EB0[(v11 >> 24) + 3] ^ v11 ^ (-111 * BYTE3(v11));
  v5[20] = *(void *)(a3 + 8LL * (v8 ^ 0x46D));
  v5[21] = v9;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_18870790C()
{
  uint64_t v2 = v1[106] + 1LL;
  uint64_t v3 = v1[105] + 1LL;
  uint64_t v4 = v1[107];
  unsigned __int8 v5 = *(_BYTE *)(v0 + 72);
  uint64_t v6 = (uint64_t (*)(void))qword_18A26FDB0[(615 * (v5 & 1)) ^ LODWORD(STACK[0x874])];
  LODWORD(STACK[0x83C]) = STACK[0x874];
  v1[102] = v4 + 1;
  v1[103] = v2;
  v1[104] = v3;
  return v6();
}

uint64_t sub_1887079A0@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
}

uint64_t sub_1887079E0()
{
  *uint64_t v3 = v3[623];
  return (*(uint64_t (**)(void))(v4
                              + 8LL
                              * ((1945 * (v1 + v5 + 93 * (v0 ^ 0x325) - 409 + v2 + 93 * (v0 ^ 0x325) - 837 == 334924831)) ^ (93 * (v0 ^ 0x325)))))();
}

uint64_t sub_188707A40()
{
  uint64_t v5 = 4LL * (v2 - 1467853497);
  unsigned int v6 = *(_DWORD *)(v0 + 4LL * (v2 - 1467853498));
  int v7 = (*(_DWORD *)(v0 + v5) ^ 0x626DC3C9 ^ (1566083941 * (v6 ^ 0xC9261EFF ^ ((v6 >> 30) | 0x69CA8438))
                                           - ((-1162799414 * (v6 ^ 0xC9261EFF ^ ((v6 >> 30) | 0x69CA8438))) & 0x8502B218)
                                           - 1031710452))
     - v2;
  *(_DWORD *)(v0 + v5) = v7 - 127253121 + ~((2 * v7 + 788223346) & 0x41D9358A);
  STACK[0x570] = *(void *)(v1 + 8 * ((v3 - 1359009162) ^ 0x456C5762LL));
  STACK[0x580] = 3357011397LL;
  LODWORD(STACK[0x578]) = 1;
  LODWORD(STACK[0x588]) = v3 - 1359009122;
  LODWORD(STACK[0x58C]) = v3 - 1359009162;
  LODWORD(STACK[0x590]) = (v3 - 1359009162) ^ 0x18;
  STACK[0x598] = (v2 + 1889157901);
  *(_DWORD *)(v4 - 192) = 1431737413 * ((~((v4 - 200) | 0xA015FCAE) + ((v4 - 200) & 0xA015FCAE)) ^ 0xE1B49C43)
                        + 40706419
                        + v3;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v4 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v4 - 188)] - 12LL))();
}

uint64_t sub_188707BD4()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((250 * (v1 < 0xC817EDC5)) ^ 0x32C)) - 4LL))();
}

uint64_t sub_188707C48()
{
  return ((uint64_t (*)(void))(*(void *)(v0 + 8LL * ((250 * (v1 > 0xC817F034)) ^ 0x32C)) - 4LL))();
}

uint64_t sub_188707CB0()
{
  unsigned int v1 = (v0 + 37748574) | 0x942D2C41;
  LODWORD(xmmword_18C723288) = 552377029;
  free((void *)STACK[0x238]);
  unsigned int v2 = (v1 + 1838600880) & 0xFBFC016D;
  int8x16_t v3 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  uint64_t v4 = v2 ^ 0xDE;
  int32x4_t v5 = vdupq_n_s32(0x290256AEu);
  v6.i64[0] = 0x8000000080000000LL;
  v6.i64[1] = 0x8000000080000000LL;
  v7.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v7.i32[2] = *((_DWORD *)&xmmword_18C723288 + v4 - 436);
  int8x16_t v8 = vextq_s8(v3, v7, 0xCuLL);
  int8x16_t v9 = v7;
  v9.i32[3] = dword_18C723298[0];
  int8x16_t v10 = (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v8, v6), vdupq_n_s32(0xA4C6E895)),  (int8x16_t)vdupq_n_s32(0x45CDF854u)),  vdupq_n_s32(0x5344DDB7u));
  int8x16_t v11 = veorq_s8(vandq_s8(v9, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x6EE3A074u));
  int32x4_t v12 = (int32x4_t)vorrq_s8( veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8(v11, (int8x16_t)vdupq_n_s32(0xD6FDA951)),  (int32x4_t)vorrq_s8(v11, (int8x16_t)v5)),  v5),  (int8x16_t)vdupq_n_s32(0x98F293E1)),  veorq_s8(v10, (int8x16_t)vdupq_n_s32(0xB44FEE78)));
  v13.i32[0] = *((_DWORD *)&STACK[0x1970] + ((BYTE4(xmmword_18C723288) & 1) == 0));
  v13.i32[1] = *((_DWORD *)&STACK[0x1970] + (~DWORD2(xmmword_18C723288) & 1LL));
  v13.i32[2] = *((_DWORD *)&STACK[0x1970] + (~*((_DWORD *)&xmmword_18C723288 + v4 - 436) & 1LL));
  v13.i32[3] = *((_DWORD *)&STACK[0x1970] + (~dword_18C723298[0] & 1LL));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v13),  (int8x16_t)vdupq_n_s32(0xAAE34ADB)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v12,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v12, v12),  (int8x16_t)vdupq_n_s32(0xCFCF7ACC))),  vdupq_n_s32(0x67E7BD66u)),  1uLL));
  return ((uint64_t (*)(void))(qword_18A26FDB0[v2] - 8LL))();
}

uint64_t sub_188707E10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = ((v5 - 597) ^ 0xFFFFFFFF8258D88DLL) + a1;
  int8x16_t v7 = &STACK[0x2240] + 3 * (v6 ^ 0x4773BFFFFEFF7F45LL) + 3 * ((2 * v6) & 0x8EE77FFFFDFEFE8ALL) + 0x9A4C00003018231LL;
  *(_DWORD *)int8x16_t v7 = v4 + 74;
  *(&STACK[0x2240] + 3 * v6 + 1) = 0LL;
  *((_DWORD *)v7 + 4) = v3;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((1924 * (a1 + 1 == v2 + 12)) ^ v5)))();
}

uint64_t sub_188707EAC()
{
  int v4 = (void *)(*(void *)(v3 + 3952) + *(void *)(v3 + 3960));
  v7.length = (v1 ^ 0xDFD7ABEFEBFBEFELL) + ((2LL * v1) & 0x1FD7F7DFCLL) - 0xDFD7ABEFEBFBEFELL;
  *int v4 = 0LL;
  v4[1] = v7.length;
  v7.location = 0LL;
  CFDataGetBytes(*(CFDataRef *)(v2 + 344), v7, *(UInt8 **)(v3 + 3824));
  unint64_t v5 = sub_18872562C(v1, 0x32u, 1083624239);
  *(void *)(v3 + 3440) = v5;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v5 != 0) * (((v0 - 680) ^ 0x184) + 1256)) ^ (v0 - 672)] - 4LL))();
}

uint64_t sub_188707F64()
{
  unint64_t v6 = (v2 & 0x17FD53AB6LL) + 0xB888E162649EF1LL + ((((v1 - 2138569723) & 0x7F77FA7E) - 0xB888E1401562DBLL) ^ v3);
  *(void *)(v4 + 153) = v6;
  *(_BYTE *)(v4 + 168) = v6 < 0x224F3C4C;
  CFRange v7 = (uint64_t (*)(void))(*(void *)(v0 + 8LL * (v1 | (8 * (v6 == 575618124)))) - 4LL);
  LODWORD(STACK[0x10A4]) = v1;
  v5[371] = 0x2267DA485117D562LL;
  v5[372] = 0x59A998F17C77D64CLL;
  v5[373] = 0x7BF2703CA5C0A842LL;
  return v7();
}

uint64_t sub_18870802C@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x2D4]) = a1;
  return ((uint64_t (*)(uint64_t, void))(*(void *)(v1
                                                              + 8LL
                                                              * ((615
                                                                * (((unsigned __int16)((v2 + 350) ^ LOWORD(STACK[0x13FC]) ^ 0xE94C) ^ 0x762Au) <= (unsigned __int16)(((v2 + 957) ^ 0x2EB8) - 11594))) ^ (v2 + 350)))
                                                  - 12LL))( 1788291484LL,  *(void *)(v3 + 3824));
}

uint64_t sub_188708068( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LODWORD(STACK[0x3A8]) = 0;
  int v14 = LODWORD(STACK[0x3A8])++;
  *(_DWORD *)(v10 + 3208) = v14 + 1823406260;
  uint64_t v15 = (*(_DWORD *)(v11 + 3160) - 1241927659);
  v12[12] = *(void *)(a8 + 8 * ((v8 - 1837571599) ^ 0x28E60F99LL));
  LODWORD(STACK[0x578]) = v8 - 1837571599;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = (v8 - 1837571599) ^ 0x2E;
  LODWORD(STACK[0x590]) = v8 - 1837571564;
  v12[14] = v15;
  v12[17] = 4127211258LL;
  *(_DWORD *)(v13 - 192) = 1431737413 * ((v13 - 200) ^ 0xBE5E9F12) + 40706419 + v8;
  *(void *)(v9 + 448) = &STACK[0x570];
  sub_1886DF534(v13 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v13 - 188)] - 12LL))();
}

void sub_188708FCC()
{
}

void sub_188709174( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char v68 = ((2 * LOBYTE(STACK[0xACC])) & 0x8A ^ 0x88) + (LOBYTE(STACK[0xACC]) ^ 0xA3);
  uint64_t v69 = *(void *)(v66 + 392) + LODWORD(STACK[0xA4C]);
  LOBYTE(STACK[0x5C3]) = byte_188744090[v67[190]] ^ LOBYTE(STACK[0xACC]) ^ 0x23 ^ (v68 - ((2 * v68 + 22) & 0x12) + 116);
  v67[20] = qword_18A26FDB0[a66 ^ 0x58B] - 12LL;
  v67[21] = v69;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_188709200()
{
  int v0 = STACK[0xB20];
  unsigned int v1 = LODWORD(STACK[0x1378]) - 1856348656;
  LODWORD(STACK[0xB2C]) = v1;
  BOOL v2 = v1 < 0x7DC82B5F;
  LOBYTE(STACK[0xB33]) = v2;
  BOOL v3 = v0 + 1082814111 < v1;
  uint64_t v4 = (uint64_t (*)(void))qword_18A26FDB0[(13 * !v3) | LODWORD(STACK[0xB24])];
  LODWORD(STACK[0xD14]) = STACK[0xB24];
  LODWORD(STACK[0xD18]) = v0;
  return v4();
}

uint64_t sub_188709284()
{
  unsigned int v1 = LODWORD(STACK[0xD1C]) + 1082814112;
  char v2 = LOBYTE(STACK[0xB33]) ^ (v1 < 0x7DC82B5F);
  int v3 = v1 < LODWORD(STACK[0xB2C]);
  if ((v2 & 1) != 0) {
    int v3 = LOBYTE(STACK[0xB33]);
  }
  uint64_t v4 = (uint64_t (*)(void))qword_18A26FDB0[(13 * (v0 & ~v3)) | LODWORD(STACK[0xD20])];
  LODWORD(STACK[0xD14]) = STACK[0xD20];
  LODWORD(STACK[0xD18]) = STACK[0xD28];
  return v4();
}

void sub_1887092F8()
{
  int v2 = STACK[0xD18];
  LODWORD(STACK[0xD1C]) = STACK[0xD18];
  int v3 = STACK[0xD14];
  LODWORD(STACK[0xD20]) = STACK[0xD14];
  LODWORD(STACK[0xD24]) = v3 + 154;
  uint64_t v4 = (v2 + 1);
  LODWORD(STACK[0xD28]) = v4;
  unint64_t v5 = v1[463] + v4 - 1027456193 + ((unint64_t)(v4 < 0x3D3DBCC1) << 32);
  unsigned int v6 = 83590351 * ((v5 ^ *(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0x73FD9180))) & 0x7FFFFFFF);
  unint64_t v7 = (v6 ^ HIWORD(v6)) * (v3 + 83589853);
  LOBYTE(STACK[0x5C3]) = byte_18873E550[(v7 >> 24) + 1] ^ byte_188746B10[v7 >> 24] ^ byte_18873CC10[v7 >> 24] ^ v7 ^ (-43 * BYTE3(v7));
  v1[20] = *(void *)(v0 + 8LL * (v3 + 884)) - 8LL;
  v1[21] = v5 - 0xE550F9B8A5EBC69LL;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_1887093FC()
{
  uint64_t v1 = v0[42];
  uint64_t v2 = v0[44] + 1LL;
  int v3 = (uint64_t (*)(void))qword_18A26FDB0[(501 * (v0[44] != 0x7F4E408B0F8103B0LL)) ^ LODWORD(STACK[0x67C])];
  uint64_t v4 = v0[43] + 1LL;
  LODWORD(STACK[0x644]) = STACK[0x67C];
  v0[39] = v2;
  v0[40] = v4;
  v0[41] = v1 + 1;
  return v3();
}

uint64_t sub_188709458(uint64_t a1, uint64_t a2)
{
  int v5 = LODWORD(STACK[0x680]) + 222;
  *(void *)(v4 + 3856) = &STACK[0x22A8];
  STACK[0x22A8] = *(void *)(v3 + 608);
  STACK[0x238] = STACK[0x2A0];
  return (*(uint64_t (**)(uint64_t))(a2
                                            + 8LL
                                            * (((38 * (v5 ^ 0x2A7) == 456) * ((v5 ^ (v2 + 661)) + 1771230325)) ^ v5)))(2583212107LL);
}

uint64_t sub_188709614(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(a2 + 8LL * (((v4 + 8 == 38 * (v5 ^ 0x2A7) + a4) * (v6 + (v5 ^ (v7 + 661)) + 449)) ^ v5)))();
}

uint64_t sub_188709654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  LODWORD(STACK[0x200]) = a5;
  *(void *)(v10 + 704) = 0x1F97460E869FF6D1LL;
  LODWORD(STACK[0x3A8]) = *(_DWORD *)(v8 + 3208) - 1823406259;
  unint64_t v12 = *(unsigned int *)(v9 + 3160);
  STACK[0x570] = *(void *)(a2 + 8LL * (v5 + 1771230046));
  LODWORD(STACK[0x578]) = v5 - 708484355;
  LODWORD(STACK[0x588]) = 0;
  STACK[0x580] = v7;
  LODWORD(STACK[0x58C]) = (v5 - 708484355) ^ 0x64;
  LODWORD(STACK[0x590]) = v5 - 708484313;
  STACK[0x598] = v12;
  *(void *)(v6 + 448) = &STACK[0x570];
  *(_DWORD *)(v11 - 192) = 1431737413 * ((v11 - 1544602913 - 2 * ((v11 - 200) & 0xA3EF3BA7)) ^ 0x1DB1A4B5)
                         + 40706419
                         + v5;
  sub_1886DF534(v11 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v11 - 188)] - 12LL))();
}

void sub_188709750()
{
}

uint64_t sub_188709958@<X0>(unint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X7>, int a4@<W8>)
{
  unsigned int v8 = (v4 & 0x80000000) - 1588930653;
  uint64_t v9 = v7 + 4 * (a1 + v5);
  int v10 = *(_DWORD *)(v9 + 1320);
  unsigned int v11 = (((v10 & 0x7FFFFFFE ^ 0x3372BBDB) - 1) ^ 0xF6B411CD)
      - ((2 * (((v10 & 0x7FFFFFFE ^ 0x3372BBDB) - 1) ^ 0xF6B411CD)) & 0xD9B878BC)
      + 1826372702;
  *(_DWORD *)(v7 + 4 * (((a4 + 401) ^ a1) + v5)) = *(_DWORD *)(v9 + 2904) ^ *((_DWORD *)&STACK[0x18E8]
                                                                                          + ((v10 & 1) == 0)) ^ (((v11 ^ 0x89F60C8D | v8 & 0x80000000) + v6 - 2 * ((v11 ^ 0x89F60C8D) & (v6 + 18) ^ v11 & 0x12)) >> 1) ^ 0x9E207695;
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * ((1553 * (v5 + 1 == a2 + 3)) ^ a4)) - 4LL))();
}

uint64_t sub_188709A44@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  int v6 = (const float *)(v4 + 908);
  int8x16_t v7 = (int8x16_t)vld1q_dup_f32(v6);
  v8.i64[0] = 0x8000000080000000LL;
  v8.i64[1] = 0x8000000080000000LL;
  v5.i64[0] = *(void *)(v4 + 912);
  v5.i32[2] = *(_DWORD *)(v4 + 920);
  int8x16_t v9 = vextq_s8(v7, v5, 0xCuLL);
  int8x16_t v10 = v5;
  v10.i32[3] = *(_DWORD *)(v4 + 4LL * (a2 - 360) + 28);
  int32x4_t v11 = (int32x4_t)veorq_s8(vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x246F9B64u));
  int32x4_t v12 = (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8( (int8x16_t)vaddq_s32(v11, v11),  (int8x16_t)vdupq_n_s32(0x1F9A3F2Au)),  v11),  vdupq_n_s32(0xF032E06B)),  (int8x16_t)vdupq_n_s32(0xB4E1E35u));
  v13.i32[0] = *(_DWORD *)(v3 + 4LL * ((*(_DWORD *)(v4 + 912) & 1) == 0));
  v13.i32[1] = *(_DWORD *)(v3 + 4LL * ((*(_DWORD *)(v4 + 916) & 1) == 0));
  v13.i32[2] = *(_DWORD *)(v3 + 4 * (~*(_DWORD *)(v4 + 920) & 1LL));
  v13.i32[3] = *(_DWORD *)(v3 + 4 * (~v10.i32[3] & 1LL));
  *(int8x16_t *)(v4 + 908) = veorq_s8( veorq_s8(veorq_s8(*(int8x16_t *)v4, v13), (int8x16_t)vdupq_n_s32(0xB5C3A786)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8((int8x16_t)v12, vbicq_s8(v8, v9)),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v12, v12),  (int8x16_t)vdupq_n_s32(0xCD71455C))),  vdupq_n_s32(0x66B8A2AEu)),  1uLL));
  return (*(uint64_t (**)(void))(a1 + 8LL * v2))();
}

void sub_188709B94()
{
}

uint64_t sub_188709BA0@<X0>(char a1@<W6>, uint64_t a2@<X7>, int a3@<W8>)
{
  unsigned int v5 = (((*v4 & 0x7FFFFFFE ^ 0x82448215) << (a1 + (a3 ^ (v3 + 94)) + 2)) | 0x5A5D17A)
     - (*v4 & 0x7FFFFFFE ^ 0x82448215)
     - 47376573;
  v4[623] = v4[396] ^ *((_DWORD *)&STACK[0x18E8] + ((*v4 & 1) == 0)) ^ (((v5 ^ 0xA07AF06C | ((((v3 + a3 - 226) ^ 0x166D2D4B) & v4[623])
                                                                                           - 1658206314) & 0x80000000)
                                                                       - 2
                                                                       * ((v5 ^ 0xA07AF06C) & 0x5880289E ^ v5 & 0x12)
                                                                       - 662689652) >> 1) ^ 0xEADFE297;
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * ((485 * (LODWORD(STACK[0x3A8]) > 0x26F)) ^ a3)) - 4LL))();
}

void sub_188709C9C(uint64_t a1, uint64_t a2)
{
  int v5 = STACK[0x1008];
  LODWORD(STACK[0x100C]) = 6 * (LODWORD(STACK[0x1008]) ^ 0x27E);
  STACK[0x2E0] = v2;
  STACK[0x2A0] = STACK[0x238];
  free(*(void **)(v3 + 592));
  uint64_t v7 = *(void *)(v3 + 616);
  unsigned int v8 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)((LODWORD(STACK[0x100C]) ^ 0xFD1BB0F2) & dword_18C724718)) ^ v7) & 0x7FFFFFFF);
  unint64_t v9 = 83590351 * (v8 ^ HIWORD(v8));
  LOBYTE(STACK[0x5C3]) = byte_188744BB0[v9 >> 24] ^ byte_18873E440[v9 >> 24] ^ byte_18873F490[(v9 >> 24) + 1] ^ v9 ^ (-127 * BYTE3(v9)) ^ 0x82;
  *(void *)(v4 + 160) = *(void *)(a2 + 8LL * (v5 + 772));
  *(void *)(v4 + 168) = v7;
  JUMPOUT(0x188709120LL);
}

void sub_188709D74()
{
  LODWORD(STACK[0x3EC]) = 0;
  JUMPOUT(0x188709DD4LL);
}

uint64_t sub_188709E38()
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(379 * (LODWORD(STACK[0x1858]) != LODWORD(STACK[0x1324]))) ^ LODWORD(STACK[0x8A8])]
                            - 4LL))();
}

void sub_188709E80()
{
}

uint64_t sub_188709F00()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((7
                                          * ((*(char *)(*(void *)(v3 + 3336)
                                                                    + ((v0
                                                                      - ((v1
                                                                        - 384
                                                                        + 4 * LODWORD(STACK[0x1858])
                                                                        + 2051800495) & (((v1 + 104921953) | 0x902C2D41)
                                                                                       + 1505100501))
                                                                      - 1254647683) ^ 0x78119811))
                                                          - 48) < 0xA)) ^ v1))
                            - 12LL))();
}

void sub_188709FA8()
{
}

uint64_t sub_18870A034()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
}

uint64_t sub_18870A078@<X0>(int a1@<W8>)
{
  int v5 = v1 + 1476232077;
  unsigned int v6 = (v2 - 333380774) & 0xD9B260C3;
  uint64_t v7 = (uint64_t (*)(void))(*(void *)(v4
                                     + 8LL
                                     * ((v3 + v2 + 1547735206 + 738) ^ (16
                                                                      * ((((v6 ^ 0x624C4A09) + a1) & (v5 + 1046646591) & 0x80000000) == 0))))
                         - 8LL);
  LODWORD(STACK[0x8A4]) = v6;
  return v7();
}

void sub_18870A098()
{
  unsigned __int8 v0 = byte_188747930[LOBYTE(STACK[0x97D]) ^ 0xA7LL];
  int v1 = STACK[0xAD0];
  int v2 = LODWORD(STACK[0xAD0]);
  int v3 = ((2 * LODWORD(STACK[0xAD0])) & 0x1DC ^ 0xC4) + (v2 ^ 0x7EF7B58D);
  LODWORD(STACK[0xADC]) = v3;
  unsigned int v4 = ((v2 ^ 0x2C382C20) & 0xFFFFFFE0 | v1 & 0x1F ^ 0x204901D) ^ 0x6F16097E;
  unsigned int v5 = ((((2 * v4) & 0x82404B1A) - v4 + 446355570) ^ 0xA44F9222) + 1;
  unsigned int v6 = (v5 ^ 0xF973FFE7) + v3 + ((2 * v5) & 0xF2E7FFCE);
  LODWORD(STACK[0xAE0]) = v6 - ((2 * v6 + 254317654) & 0x40CF88C4) - 1476653427;
  LOBYTE(STACK[0x5C3]) = v0 ^ 0x64 ^ ((((v0 >> 2) & 0x30 ^ 0xB0) & 0x9F) - ((v0 >> 2) & 0x30 ^ 0xB0 | 0xD9));
  JUMPOUT(0x188709118LL);
}

void sub_18870A6BC()
{
  char v0 = byte_188744FC0[(((2 * (LOBYTE(STACK[0x974]) ^ 0x17)) | 0x3B15D306) - (LOBYTE(STACK[0x974]) ^ 0x17u) + 1651840637) ^ 0x9D8AE9B9LL];
  LOBYTE(STACK[0x5C3]) = (51 * v0 - ((102 * v0 + 72) & 0x96) - 17) ^ (102 * v0
                                                                    - 2 * ((102 * v0 + 8) & 0x2E ^ (102 * v0) & 2)
                                                                    + 117) ^ 0xB1;
  JUMPOUT(0x1886F4BF8LL);
}

void sub_18870AB18()
{
  unsigned int v0 = (((2 * (LODWORD(STACK[0xAD4]) ^ 0x7D773F5F)) & 0x6AAA3BD0)
  int v1 = ((2 * LODWORD(STACK[0xAD4])) ^ 0x7CD4) - ((2 * ((2 * LODWORD(STACK[0xAD4])) ^ 0x7CD4)) & 0xD4) + 363;
  unsigned int v2 = (v1 & 0x92) + (v1 & 0xB2 ^ 0xFFFFFFDF) + (v1 & 0x92 | 0xDA839064) + 1;
  unsigned int v3 = (((v2 & 0x5C7A9300 ^ 0x4620300) + (v2 ^ 0xDA19D46F) - ((v2 ^ 0xDA19D46F) & 0x5C7A9300)) ^ 0x5CE0D78B)
     + (LODWORD(STACK[0xAD4]) ^ 0x3ED2);
  LOBYTE(v3) = (((2 * v3) & 0x2C) + (v3 ^ 0x96) - ((2 * (((2 * v3) & 0x2C) + (v3 ^ 0x96)) + 20) & 0x3E) - 119) ^ byte_18873F9C0[(v0 - ((2 * v0) & 0x49244F72) - 1533925447) ^ 0x309337EBLL];
  LOBYTE(v0) = ((2 * v3) ^ 0x1E) - ((2 * ((2 * v3) ^ 0x1E)) & 0xEF);
  LOBYTE(STACK[0x5C3]) = (((v3 ^ 0x8F) - 28) ^ 0xDF)
                       + ((2 * ((v3 ^ 0x8F) - 28)) & 0xBF)
                       + ((v0 - 10) & 0xC8)
                       - ((2 * v0 + 12) & 0x10)
                       + 97;
  JUMPOUT(0x1886F4BF8LL);
}

uint64_t sub_18870ACA8()
{
  uint64_t v2 = v1[201] + 1LL;
  uint64_t v3 = v1[200] + 1LL;
  unint64_t v4 = v1[202];
  unint64_t v5 = v4 + 1;
  v4 -= 0xE6F339E95E3C98LL;
  BOOL v6 = v4 < 0xD115BBFA;
  BOOL v7 = v4 >= *(void *)(v0 + 272);
  char v8 = *(_BYTE *)(v0 + 287);
  char v9 = v8 ^ v6;
  char v10 = !v7;
  if ((v9 & 1) == 0) {
    char v8 = v10;
  }
  int32x4_t v11 = (uint64_t (*)(void))(qword_18A26FDB0[(61 * (v8 & 1)) ^ LODWORD(STACK[0xB6C])] - 8LL);
  LODWORD(STACK[0xB34]) = STACK[0xB6C];
  v1[197] = v5;
  v1[198] = v2;
  v1[199] = v3;
  return v11();
}

void sub_18870AD40()
{
  uint64_t v3 = v2[199];
  v2[200] = v3;
  uint64_t v4 = v2[198];
  v2[201] = v4;
  v2[202] = v2[197];
  int v5 = STACK[0xB34];
  LOBYTE(v3) = *(_BYTE *)(*(void *)(v1 + 568) + (LODWORD(STACK[0xB34]) ^ 0xA5C5DF2A52EF6D72LL) + v3);
  LODWORD(STACK[0xB6C]) = STACK[0xB34];
  uint64_t v6 = v4 + v2[442] - 0xCCDBE4E70573A43LL;
  unsigned int v7 = 83590351 * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ v6) & 0x7FFFFFFF);
  unint64_t v8 = 83590351 * (v7 ^ HIWORD(v7));
  char v9 = byte_188744BB0[v8 >> 24];
  LODWORD(STACK[0xB70]) = v5 ^ 0xFE;
  LOBYTE(STACK[0x5C3]) = v9 ^ v3 ^ byte_18873E440[v8 >> 24] ^ byte_18873F490[(v8 >> 24) + 1] ^ v8 ^ (-127 * BYTE3(v8));
  v2[20] = *(void *)(v0 + 8LL * (v5 + 1125)) - 12LL;
  v2[21] = v6;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_18870AE38()
{
  uint64_t v1 = v0[230] + 1LL;
  unint64_t v2 = v0[231];
  int v3 = (212 * (v2 >> 3 != 0xCFB667DABF5089FLL)) ^ LODWORD(STACK[0xC54]);
  LODWORD(STACK[0xC1C]) = STACK[0xC54];
  uint64_t v4 = v0[229] + 1LL;
  int v5 = (uint64_t (*)(void))(qword_18A26FDB0[v3] - 4LL);
  v0[226] = v2 + 1;
  v0[227] = v1;
  v0[228] = v4;
  return v5();
}

uint64_t sub_18870AEA4@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x4FC]) = a1;
  return sub_18870AED8(*(void *)(v1 + 3448));
}

uint64_t sub_18870AED8@<X0>(int a1@<W8>)
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(v2
                                     + 8LL
                                     * (((((unsigned __int16)a1 ^ 0x7FDFB873)
                                        + ((2 * (a1 ^ 0x4281)) & 0x1F5E4)
                                        - 37945552 != ((v1 + 775878564) & 0xD1C107E6) + 2107438908)
                                       * (v1 - 802)) ^ v1))
                         - 12LL);
  STACK[0x200] = v3;
  return v4();
}

uint64_t sub_18870AF54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v68 = *(void *)(v67 + 240) + *(void *)(v67 + 232) - 0x3405737C11AC427ALL;
  STACK[0x238] = STACK[0x430];
  STACK[0x240] = v68;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 + 8LL * ((191 * (((v66 + 431 * (v63 ^ 0x2E4) - 862) ^ (v66 + 610) ^ 0x256AA177) == 627745681)) ^ (431 * (v63 ^ 0x2E4)))) - 4LL))( 627745143LL,  a2,  278526796LL,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           v64,
           a58,
           a1,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_18870B120(int a1)
{
}

uint64_t sub_18870B158(uint64_t a1, int a2)
{
  LODWORD(STACK[0x218]) = a2;
  STACK[0x1970] = 0x1824B799109468LL;
  LODWORD(STACK[0x470]) = *(_DWORD *)(v5 + 3208) - 1823406259;
  uint64_t v9 = *(unsigned int *)(v6 + 3160);
  v7[12] = *(void *)(v3 + 8 * ((v2 - 699619382) ^ 0x6CB9D5BCLL));
  LODWORD(STACK[0x578]) = v2 - 699619382;
  LODWORD(STACK[0x588]) = 0;
  v7[14] = v4;
  LODWORD(STACK[0x58C]) = (v2 - 699619382) | 0x48;
  LODWORD(STACK[0x590]) = (v2 - 699619382) ^ 0x44;
  v7[17] = v9;
  *(_DWORD *)(v8 - 192) = 1431737413 * (((~(v8 - 200) & 0x55E4C474) - (~(v8 - 200) | 0x55E4C475)) ^ 0xEBBA5B67)
                        + 40706419
                        + v2;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v8 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v8 - 188)])();
}

uint64_t sub_18870B258( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x238] = (unint64_t)malloc(__size);
  uint32_t v71 = arc4random();
  LODWORD(xmmword_18C723288) = v71 - 1595106619 - ((2 * v71) & 0x41D9358A);
  DWORD1(xmmword_18C723288) = ((1812433253 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0xAE9F33EF)
                            + ((1477382858 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0x5D3E67DE)
                            - 229808425
                            - ((2
                              * (((1812433253
                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) ^ 0xAE9F33EF)
                               + ((1477382858
                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0x5D3E67DE)
                               + 1742766145)
                              + 1392547746) & 0x41D9358A);
  return ((uint64_t (*)(void))sub_18870B39C)();
}

void sub_18870B39C()
{
}

void sub_18870B3B8()
{
}

uint64_t sub_18870B5B8@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,timeval *a62)
{
  int v65 = v62 ^ (v63 - 97);
  LODWORD(STACK[0x470]) = a1 + 1;
  gettimeofday(a62, 0LL);
  int v66 = (_DWORD *)STACK[0x240];
  int v67 = *(_DWORD *)(STACK[0x240] + 16) - 1595106619 - ((2 * *(_DWORD *)(STACK[0x240] + 16)) & 0x41D9358A);
  v66[1] = *(_DWORD *)(STACK[0x240] + 24) - 1595106619 - ((v65 - 1418983361) & (2 * *(_DWORD *)(STACK[0x240] + 24)));
  v66[2] = v67;
  uint32_t v68 = arc4random();
  v66[3] = v68 - 1595106619 - ((2 * v68) & 0x41D9358A);
  uint32_t v69 = arc4random();
  *int v66 = v69 - 1595106619 - ((2 * v69) & 0x41D9358A);
  LODWORD(STACK[0x230]) = v63 + 387056292;
  LODWORD(STACK[0x228]) = v63 + 290198002;
  LODWORD(STACK[0x220]) = v63 - 519290380;
  int v70 = (DWORD1(xmmword_18C723288) ^ 0xBBEBDE2B ^ (1664525
                                                 * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))
                                                 - ((3329050
                                                   * (xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30))) & 0x360E89DC)
                                                 + 453461230))
      + (*(_DWORD *)STACK[0x240] ^ 0xA0EC9AC5);
  unsigned int v71 = (v70 ^ 0xF773F3AF) + 854817920 + ((2 * v70) & 0xEEE7E75E);
  DWORD1(xmmword_18C723288) = v71 - ((2 * v71 + 724639650) & 0x41D9358A) + 1988438678;
  STACK[0x570] = qword_18A26FDB0[(v65 + 851154110) ^ 0x1FFFFFFFC928C2AALL];
  LODWORD(STACK[0x588]) = v65 + 851154113;
  LODWORD(STACK[0x58C]) = v65 + 851154110;
  LODWORD(STACK[0x590]) = v65 + 851154172;
  *(_DWORD *)(v64 - 192) = 1431737413 * ((v64 - 200) ^ 0xBE5E9F12) + 40706419 + v65;
  LODWORD(STACK[0x578]) = 1;
  STACK[0x580] = 859674424LL;
  STACK[0x598] = 859674426LL;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v64 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v64 - 188)] - 4LL))();
}

uint64_t sub_18870B890()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((58 * (v3 >= (STACK[0x230] & 0x5280D33F) + 859673609)) ^ (v2 + v1 + 790))))();
}

uint64_t sub_18870B8D8()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * ((58 * (v3 <= 0x333D99A7)) ^ (v2 + v1 + 790))))();
}

uint64_t sub_18870B914()
{
  unsigned int v7 = (v0 + 2368985) | 0x96490443;
  LODWORD(xmmword_18C723288) = dword_18C723C44;
  STACK[0x570] = *(void *)(v1 + 8 * ((int)(v7 + 1305126362) ^ 0x1FFFFFFFE437D386LL));
  STACK[0x580] = 1605946492LL;
  LODWORD(STACK[0x578]) = v3;
  LODWORD(STACK[0x588]) = (v7 + 1305126362) ^ 0x2C;
  LODWORD(STACK[0x58C]) = v7 + 1305126362;
  LODWORD(STACK[0x590]) = v7 + 1305126389;
  STACK[0x598] = (v4 + 751128573);
  STACK[0x23C8] = v2;
  *(_DWORD *)(v6 - 192) = 1431737413 * (((v5 | 0xF19A01E8) - (v5 & 0xF19A01E8)) ^ 0x4FC49EFA) + 40706419 + v7;
  sub_1886DF534(v6 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v6 - 188)] - 8LL))();
}

uint64_t sub_18870BA18()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * (((v1 >= 0x5FB8CC7C) * ((STACK[0x228] & 0x5F6EEDFF) - 120073497)) ^ 0x11C)))();
}

uint64_t sub_18870BAA4()
{
  return (*(uint64_t (**)(void))(v0 + 8LL * (int)(((v1 <= 0x5FB8CC7F) * (STACK[0x220] & 0x8FAEBDFD ^ 0x7282D19)) ^ 0x11C)))();
}

uint64_t sub_18870BB2C()
{
  int v4 = v0 + 120073249;
  uint64_t v5 = 4LL * (((v0 + 120073249) ^ 0xCA24AEBC) + v3);
  *(_DWORD *)(STACK[0x240] + v5) ^= 0x2CB36E1B ^ *(_DWORD *)(STACK[0x238] + v5);
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((740 * (((v2 - 1 - v4) | (v4 - (v2 - 1))) >= 0)) ^ (((v4 + 1737673714) ^ (v4 - 1891303410))
                                                                                   + v4))))();
}

void sub_18870BBE4()
{
}

uint64_t sub_18870BBEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t (*a57)(uint64_t),uint64_t a58,uint64_t a59)
{
  STACK[0x2D8] = v59;
  STACK[0x430] = STACK[0x238];
  return a57(a59);
}

uint64_t sub_18870BC10(void *a1)
{
  return ((uint64_t (*)(void))qword_18A26FDB0[(573
                                            * (LODWORD(STACK[0x4FC]) == ((((v1 - 214) ^ 0x966D2D4B) + 36790845) & 0xFDCE9E9F)
                                                                      - 539)) ^ (v1 - 214) ^ 0x966D2D4B])();
}

uint64_t sub_18870BC2C()
{
  uint64_t v2 = v1[304] + 1LL;
  uint64_t v3 = v1[303] + 1LL;
  uint64_t v4 = v1[305];
  unsigned __int8 v5 = *(_BYTE *)(v0 + 167);
  uint64_t v6 = (uint64_t (*)(void))qword_18A26FDB0[(966 * (v5 & 1)) ^ LODWORD(STACK[0xEA4])];
  LODWORD(STACK[0xE6C]) = STACK[0xEA4];
  v1[300] = v4 + 1;
  v1[301] = v2;
  v1[302] = v3;
  return v6();
}

void sub_18870BCC0()
{
  uint64_t v1 = *(void *)(v0 + 2416);
  *(void *)(v0 + 2424) = v1;
  uint64_t v2 = *(void *)(v0 + 2408);
  *(void *)(v0 + 2432) = v2;
  *(void *)(v0 + 2440) = *(void *)(v0 + 2400);
  int v3 = STACK[0xE6C];
  LODWORD(STACK[0xEA4]) = STACK[0xE6C];
  LODWORD(STACK[0xEA8]) = v3 ^ 0xC5;
  unsigned int v4 = 83590351
     * (((v3 ^ 0xC5) + 2147483620) & (*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v2 + *(_DWORD *)(v0 + 3640) - 1328611145)));
  unint64_t v5 = 83590351 * (v4 ^ HIWORD(v4));
  LOBYTE(STACK[0x5C3]) = byte_188744BB0[v5 >> 24] ^ *(_BYTE *)(v1 + *(void *)(v0 + 4016) - 0x41B8689786B18ABLL) ^ byte_18873E440[v5 >> 24] ^ byte_18873F490[(v5 >> 24) + 1] ^ v5 ^ (-127 * BYTE3(v5));
  JUMPOUT(0x18870BDC8LL);
}

uint64_t sub_18870BDDC()
{
  uint64_t v1 = *(void *)(v0 + 2600) + 1LL;
  uint64_t v2 = (uint64_t (*)(void))(qword_18A26FDB0[(1429 * (*(void *)(v0 + 2600) == 1946437544LL)) ^ LODWORD(STACK[0xF44])]
                         - 4LL);
  LODWORD(STACK[0xF2C]) = STACK[0xF44];
  *(void *)(v0 + 2592) = v1;
  return v2();
}

uint64_t sub_18870BE24()
{
  int v2 = LODWORD(STACK[0xF48]) + 1432242700;
  LODWORD(STACK[0x22F8]) = 1896455931;
  STACK[0x22F0] = *(void *)(v1 + 3608);
  v0[85] = &STACK[0x2310];
  LODWORD(STACK[0x22E8]) = 438484898;
  LODWORD(STACK[0x2310]) = 1896455922;
  v0[86] = &STACK[0x2308];
  STACK[0x2308] = 0LL;
  int v3 = off_18C723C48[0];
  LOBYTE(STACK[0x1989]) = *off_18C723C48[0] + ((v2 - 118) ^ 0x87);
  LOBYTE(STACK[0x198A]) = -95 * (v2 ^ 0xC2) + v3[1] - 23;
  LOBYTE(STACK[0x198B]) = v3[2] - 52;
  LOBYTE(STACK[0x198C]) = v3[3] - 52;
  LOBYTE(STACK[0x198D]) = v3[4] - 52;
  LOBYTE(STACK[0x198E]) = v3[5] - 52;
  LOBYTE(STACK[0x198F]) = v3[6] - 52;
  LOBYTE(STACK[0x1990]) = v3[7] - 52;
  LOBYTE(STACK[0x1991]) = v3[8] - 52;
  LOBYTE(STACK[0x1992]) = v3[9] - 52;
  LOBYTE(STACK[0x1993]) = v3[10] - 52;
  LOBYTE(STACK[0x1994]) = v3[11] - 52;
  LOBYTE(STACK[0x1995]) = v3[12] - 52;
  LOBYTE(STACK[0x1996]) = v3[13] - 52;
  LOBYTE(STACK[0x1997]) = v3[14] - 52;
  LOBYTE(STACK[0x1998]) = v3[15] - 52;
  LOBYTE(STACK[0x1999]) = v3[16] - 52;
  LOBYTE(STACK[0x199A]) = v3[17] - 52;
  LOBYTE(STACK[0x199B]) = v3[18] - 52;
  LOBYTE(STACK[0x199C]) = v3[19] - 52;
  LOBYTE(STACK[0x199D]) = v3[20] - 52;
  LOBYTE(STACK[0x199E]) = v3[21] - 52;
  LOBYTE(STACK[0x199F]) = off_18C723C48[0][22] - 52;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v5 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x1989], SystemEncoding);
  v0[87] = v5;
  return ((uint64_t (*)(void))qword_18A26FDB0[(1921 * (v5 != 0LL)) ^ v2])();
}

uint64_t sub_18870BE58()
{
  uint64_t v1 = v0[340] + 1LL;
  uint64_t v2 = v0[341];
  int v3 = (19 * ((unint64_t)(v2 - 0x68AD387F046A2F23LL) > 7)) ^ LODWORD(STACK[0xFC4]);
  LODWORD(STACK[0xF8C]) = STACK[0xFC4];
  uint64_t v4 = v0[339] + 1LL;
  CFStringRef v5 = (uint64_t (*)(void))qword_18A26FDB0[v3];
  v0[336] = v2 + 1;
  v0[337] = v1;
  v0[338] = v4;
  return v5();
}

void sub_18870BEC4()
{
  uint64_t v2 = v1[338];
  v1[339] = v2;
  uint64_t v3 = v1[337];
  v1[340] = v3;
  v1[341] = v1[336];
  int v4 = STACK[0xF8C];
  LODWORD(STACK[0xFC4]) = STACK[0xF8C];
  uint64_t v5 = (v4 - 1607763597) & 0x5FD48498;
  LOBYTE(v2) = *(_BYTE *)(v1[419] + (v5 ^ 0xCA65CC91DF031E6CLL) + v2);
  LODWORD(STACK[0xFC8]) = v5;
  LODWORD(v5) = 83590351
              * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v3
                                                                                      + *(_DWORD *)(v0 + 664)
                                                                                      - 709690755)) & 0x7FFFFFFF);
  unint64_t v6 = 83590351 * (v5 ^ WORD1(v5));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v6 >> 24] ^ v2 ^ byte_188743410[v6 >> 24] ^ byte_188744EB0[(v6 >> 24) + 3] ^ v6 ^ (-111 * BYTE3(v6));
  JUMPOUT(0x1886F4BF0LL);
}

uint64_t sub_18870BFCC()
{
  uint64_t v1 = *(void *)(v0 + 2784) + 1LL;
  uint64_t v2 = *(void *)(v0 + 2776) + 1LL;
  unint64_t v3 = *(void *)(v0 + 2792);
  unint64_t v4 = v3 + 1;
  v3 -= 0x27559F17FB925E75LL;
  char v5 = *(_BYTE *)(v0 + 3399) ^ (v3 < 0x99B8966C);
  char v6 = v3 < *(void *)(v0 + 3384);
  if ((v5 & 1) != 0) {
    char v6 = *(_BYTE *)(v0 + 3399);
  }
  unsigned int v7 = (uint64_t (*)(void))qword_18A26FDB0[(149 * (v6 & 1)) ^ LODWORD(STACK[0x1000])];
  LODWORD(STACK[0xFCC]) = STACK[0x1000];
  *(void *)(v0 + 2752) = v4;
  *(void *)(v0 + 2760) = v1;
  *(void *)(v0 + 2768) = v2;
  LODWORD(STACK[0x1134]) = STACK[0x1004];
  return v7();
}

void sub_18870C060()
{
  uint64_t v2 = *(void *)(v1 + 2768);
  *(void *)(v1 + 2776) = v2;
  uint64_t v3 = *(void *)(v1 + 2760);
  *(void *)(v1 + 2784) = v3;
  *(void *)(v1 + 2792) = *(void *)(v1 + 2752);
  int v4 = STACK[0xFCC];
  LODWORD(STACK[0x1000]) = STACK[0xFCC];
  LOBYTE(v2) = *(_BYTE *)(v2 + *(void *)(v0 + 336) - 0x796AE6C61244D31ELL);
  unsigned int v5 = 83590351
     * ((v4 ^ 0x7FFFFEE8) & (*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v3
                                                                                                 + *(_DWORD *)(v1 + 3896)
                                                                                                 - 1901732074)));
  unint64_t v6 = 83590351 * (v5 ^ HIWORD(v5));
  char v7 = byte_188744BB0[v6 >> 24];
  LODWORD(STACK[0x1004]) = v4 ^ 0x9E;
  LOBYTE(STACK[0x5C3]) = v7 ^ v2 ^ byte_18873E440[v6 >> 24] ^ byte_18873F490[(v6 >> 24) + 1] ^ v6 ^ (-127 * BYTE3(v6));
  JUMPOUT(0x1886F4BF8LL);
}

void sub_18870C160()
{
  LODWORD(STACK[0x1088]) = (**(_DWORD **)(v0 + 384) ^ 0x71099EF2)
                         - 2
                         * (((**(_DWORD **)(v0 + 384) ^ 0x71099EF2) + 16) & 0x5D3B04E2 ^ (**(_DWORD **)(v0 + 384) ^ 0x71099EF2) & 2)
                         - 583334672;
  char v2 = STACK[0x108B];
  LODWORD(STACK[0x108C]) = LODWORD(STACK[0x17A4]) - 574109955;
  unsigned int v3 = 83590351
     * (((LODWORD(STACK[0x1078]) + *(_DWORD *)(v1 + 2912) - 892355951) ^ *(_DWORD *)(qword_18C724710
                                                                                   + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x5C3]) = v2 ^ byte_188743530[v4 >> 24] ^ byte_18873E970[(v4 >> 24) + 1] ^ byte_18873F8B0[(v4 >> 24) + 2] ^ v4 ^ (-55 * BYTE3(v4)) ^ 0xDD;
  JUMPOUT(0x1886F4BF4LL);
}

void sub_18870C298()
{
  char v1 = STACK[0x108A];
  unint64_t v2 = STACK[0x480];
  *(void *)(v0 + 2944) = STACK[0x480];
  LODWORD(STACK[0x109C]) = LODWORD(STACK[0x17A4]) - 86726047;
  unsigned int v3 = 83590351
     * (((LODWORD(STACK[0x108C]) + v2 - 120014001) ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x5C3]) = v1 ^ byte_18873E340[v4 >> 24] ^ byte_18873FAC0[(v4 >> 24) + 1] ^ byte_188743C60[v4 >> 24] ^ v4 ^ (-103 * BYTE3(v4)) ^ 0x3B;
  JUMPOUT(0x1886F6FB8LL);
}

void sub_18870C39C()
{
  char v1 = STACK[0x1089];
  LODWORD(STACK[0x10A0]) = LODWORD(STACK[0x17A4]) - 430020061;
  unsigned int v2 = 83590351
     * (((LODWORD(STACK[0x109C]) + *(_DWORD *)(v0 + 2944) - 607397908) ^ *(_DWORD *)(qword_18C724710
                                                                                   + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = v1 ^ byte_18873E340[v3 >> 24] ^ byte_18873FAC0[(v3 >> 24) + 1] ^ byte_188743C60[v3 >> 24] ^ v3 ^ (-103 * BYTE3(v3)) ^ 4;
  JUMPOUT(0x18870C48CLL);
}

void sub_18870C4A0()
{
  char v1 = STACK[0x1088];
  LODWORD(STACK[0x107C]) = LODWORD(STACK[0x17A4]) + 1357102641;
  unsigned int v2 = 83590351
     * (((LODWORD(STACK[0x10A0]) + *(_DWORD *)(v0 + 2944) - 264103893) ^ *(_DWORD *)(qword_18C724710
                                                                                   + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = v1 ^ byte_18873E340[v3 >> 24] ^ byte_18873FAC0[(v3 >> 24) + 1] ^ byte_188743C60[v3 >> 24] ^ v3 ^ (-103 * BYTE3(v3)) ^ 0xE0;
  JUMPOUT(0x1886F6FB8LL);
}

void sub_18870C5A0()
{
  LODWORD(STACK[0x28C]) = 0;
  JUMPOUT(0x18870C600LL);
}

uint64_t sub_18870C6F8(void *a1)
{
  int v3 = v1 + v2 + 1087;
  free(a1);
  int v4 = LODWORD(STACK[0x46C]) != (((v3 - 928) | 0x60) ^ 0xFE);
  return ((uint64_t (*)(void))(qword_18A26FDB0[((16 * v4) | (v4 << 6)) ^ v3] - (((v3 - 556) | 0x80u) ^ 0x29ALL)))();
}

uint64_t sub_18870C780()
{
  STACK[0x368] = *(void *)(v4 + 3360);
  CFRelease(*(CFTypeRef *)(v3 + 73));
  CFRelease(*(CFTypeRef *)(v4 + 3656));
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((v1 == ((v0 + 199481025) & 0xF41C2A5B ^ 0xFFFF5223)) * (v0 ^ 0x241)) ^ v0))
                            - 4LL))();
}

void sub_18870C87C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5[324];
  v5[325] = v6;
  int v7 = STACK[0xF2C];
  LODWORD(STACK[0xF44]) = STACK[0xF2C];
  int v8 = (v7 - 2004830326) | 0x22210121;
  LODWORD(STACK[0xF48]) = v8;
  v6 -= 1946437536LL;
  char v9 = byte_1887404E0[v6];
  uint64_t v10 = v5[451] + v6;
  unsigned int v11 = 83590351 * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ v10) & 0x7FFFFFFF);
  unint64_t v12 = 83590351 * ((v11 >> (v8 ^ 0xA5)) ^ v11);
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v12 >> 24] ^ (v9 - 31) ^ byte_188743410[v12 >> 24] ^ byte_188744EB0[(v12 >> 24) + 3] ^ v12 ^ (-111 * BYTE3(v12));
  v5[20] = *(void *)(a5 + 8LL * (v7 + 1139)) - 8LL;
  v5[21] = v10;
  JUMPOUT(0x18870C97CLL);
}

void sub_18870C98C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x22F8]) = STACK[0x27C];
  STACK[0x22F0] = a69;
  STACK[0x368] = *(void *)(v70 + 3360);
  CFRelease(*(CFTypeRef *)(v69 + 73));
  CFRelease(*(CFTypeRef *)(v70 + 3656));
  JUMPOUT(0x18870C9D0LL);
}

uint64_t sub_18870CB9C()
{
  uint64_t v2 = MGCopyAnswer();
  *(void *)(v1 + 488) = v2;
  return ((uint64_t (*)(void))(2523737411LL
                            - ((v0 - 1098942312) & 0xD7EDAFCF)
                            + qword_18A26FDB0[((v2 == 0) * ((8 * v0) ^ 0x270B)) ^ v0]
                            - 4))();
}

uint64_t sub_18870CC08()
{
  unint64_t v3 = STACK[0x368];
  v2[509] = STACK[0x368];
  v2[510] = (char *)&STACK[0x19A0] + v3;
  STACK[0x368] = v3 + 64;
  v2[511] = ((16 - 16 * (&STACK[0x19A0] + v3)) & 0x10 | (32
                                                                                         * (((unint64_t)((16 - 16 * (&STACK[0x19A0] + v3)) & 0x10) >> 4) & 1))) ^ 0xC77C6FDECCDADD1CLL;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)STACK[0x1810]);
  uint64_t v5 = (297 * ((((v0 ^ 0x2340) - 1032) | 0x80) ^ 0xD3u)) ^ v4 ^ 0x6DDBFEB7E7FB64CELL;
  unint64_t v6 = (2 * v4) & 0xDBB7FD6FCFF6CF6ALL;
  CFTypeID TypeID = CFStringGetTypeID();
  BOOL v8 = v5 + v6 + (TypeID ^ 0xC646802389A4582LL) - ((2 * TypeID) & 0xE7372FFB8ECB74FALL) == 0x7A4066BA2095AD37LL;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((v8 | (4 * v8)) + (v0 ^ 0x2340))))();
}

uint64_t sub_18870CD14()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 488));
  unint64_t v4 = v3 ^ 0xFBDABEF6FDBEEFBALL;
  unint64_t v5 = (v3 << (v0 + 49)) & 0xF7B57DEDFB7DDF74LL;
  CFTypeID TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((v4
                                          + (TypeID ^ 0x6284108012823420LL)
                                          + v5
                                          - ((TypeID << ((v0 + 84) ^ 0x25u)) & 0x3AF7DEFFDAFB97BELL) == 0x5E5ECF77104123DALL) | v0))
                            - 4LL))();
}

uint64_t sub_18870CDC4()
{
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(v2 + 488));
  int v4 = Length - 316721569 - ((Length << (((v0 - 53) & 0xDDu) + 52)) & 0xDA3E6CB6) - 4;
  LODWORD(STACK[0x15B4]) = v4 ^ 0x9C16A8A9;
  LODWORD(STACK[0x41C]) = v4 ^ 0x9C16A8A9;
  unint64_t v5 = malloc(v4 ^ 0xED1F365B);
  STACK[0x15B8] = (unint64_t)v5;
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * (((((v0 - 546) ^ (v5 == 0LL)) & 1) == 0) | (16 * ((((v0 - 546) ^ (v5 == 0LL)) & 1) == 0)) | v0)))();
}

uint64_t sub_18870CE74()
{
  int v4 = (void *)(v3[511] + v3[510] + 0x38839021332522E4LL);
  v7.length = (v1 ^ 0xF9FBE3EBB7AFFFCFLL) + 0x6041C1448500031LL + ((v1 << (v0 ^ 0xCCu)) & 0x16F5FFF9ELL);
  *int v4 = 0LL;
  v4[1] = v7.length;
  v7.location = 0LL;
  CFDataGetBytes(*(CFDataRef *)(v2 + 488), v7, (UInt8 *)STACK[0x15B8]);
  unint64_t v5 = sub_18872562C(v1, 0x32u, 352690792);
  v3[458] = v5;
  return ((uint64_t (*)(void))qword_18A26FDB0[(46 * (v5 != 0)) ^ v0])();
}

uint64_t sub_18870CF48()
{
  unint64_t v6 = (v3 ^ 0x772FCBFDAE60DDFDLL) - 0x772FCBFD2C0A3914LL + (v1 & 0x15CC1BBFALL);
  *int v4 = v6 < (unint64_t)((v2 - 693) | 2u) + 2186716367u;
  v5[513] = v6;
  CFRange v7 = *(uint64_t (**)(void))(v0 + 8LL * ((488 * (v6 != 2186716393)) ^ v2));
  LODWORD(STACK[0x11AC]) = v2;
  v5[404] = 0x5ADAA287DB3DA8F0LL;
  v5[405] = 0x4D9B3D877FF3B150LL;
  v5[406] = 0x79417AE517149F7LL;
  return v7();
}

uint64_t sub_18870D00C@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x444]) = a8;
  return ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 + 8LL * ((462 * ((unsigned __int16)((154 * ((v64 + 224) ^ 0xF8) + 18778) ^ LOWORD(STACK[0x15B4]) ^ 0xD47C) < 2u)) ^ (v64 + 224))) - 8LL))( *(void *)(v65 + 145),  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_18870D048()
{
  uint64_t v2 = v1[408] + 1LL;
  uint64_t v3 = v1[407] + 1LL;
  uint64_t v4 = v1[409];
  char v5 = *v0;
  unint64_t v6 = (uint64_t (*)(void))qword_18A26FDB0[(488 * (v5 & 1)) ^ LODWORD(STACK[0x11E0])];
  LODWORD(STACK[0x11AC]) = STACK[0x11E0];
  v1[404] = v4 + 1;
  v1[405] = v2;
  v1[406] = v3;
  return v6();
}

void sub_18870D0DC()
{
  uint64_t v2 = *(void *)(v1 + 3248);
  *(void *)(v1 + 3256) = v2;
  uint64_t v3 = *(void *)(v1 + 3240);
  *(void *)(v1 + 3264) = v3;
  *(void *)(v1 + 3272) = *(void *)(v1 + 3232);
  int v4 = STACK[0x11AC];
  LODWORD(STACK[0x11E0]) = STACK[0x11AC];
  uint64_t v5 = (v4 - 691);
  LOBYTE(v2) = *(_BYTE *)(v5 + v2 + *(void *)(v0 + 145) - 0x79417AE51714A11LL);
  LODWORD(STACK[0x11E4]) = v5;
  LODWORD(v5) = 83590351
              * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v3
                                                                                      + *(_DWORD *)(v1 + 3664)
                                                                                      - 2146677072)) & 0x7FFFFFFF);
  unint64_t v6 = 83590351 * (v5 ^ WORD1(v5));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v6 >> 24] ^ v2 ^ byte_188743410[v6 >> 24] ^ byte_188744EB0[(v6 >> 24) + 3] ^ v6 ^ (-111 * BYTE3(v6));
  JUMPOUT(0x18870D1D4LL);
}

uint64_t sub_18870D1EC(void *a1)
{
  int v3 = v1 + v2 + 319;
  free(a1);
  return ((uint64_t (*)(void))qword_18A26FDB0[(573 * (LODWORD(STACK[0x474]) == ((v3 + 36790845) & 0xFDCE9E9F) - 539)) ^ v3])();
}

void sub_18870D200()
{
}

uint64_t sub_18870D268( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x22E0]) = STACK[0x37C];
  *(void *)(v68 + 208) = a67;
  STACK[0x368] = *(void *)(v70 + 224);
  CFRelease(*(CFTypeRef *)(v70 + 288));
  CFRelease(*(CFTypeRef *)(v70 + 304));
  return (*(uint64_t (**)(void))(v69 + 8LL * (((v67 ^ 0x325) + (v67 ^ 0x1C0) + 943) ^ v67 ^ 0x325)))();
}

uint64_t sub_18870D2E8()
{
  LODWORD(STACK[0x22D0]) = 438484909;
  int v2 = off_18C723C68[0];
  LOBYTE(STACK[0x21F1]) = *off_18C723C68[0] - 87;
  LOBYTE(STACK[0x21F2]) = v2[1] - 87;
  LOBYTE(STACK[0x21F3]) = v2[2] - 87;
  LOBYTE(STACK[0x21F4]) = v2[3] - 87;
  LOBYTE(STACK[0x21F5]) = v2[4] - 87;
  LOBYTE(STACK[0x21F6]) = v2[5] - 87;
  LOBYTE(STACK[0x21F7]) = v2[6] - 87;
  LOBYTE(STACK[0x21F8]) = v2[7] + ((((v0 + 82) | 0x28) + 58) ^ (v0 - 3) & 0x1F);
  LOBYTE(STACK[0x21F9]) = v2[8] - 87;
  LOBYTE(STACK[0x21FA]) = v2[9] - 87;
  LOBYTE(STACK[0x21FB]) = v2[10] - 87;
  LOBYTE(STACK[0x21FC]) = v2[11] - 87;
  LOBYTE(STACK[0x21FD]) = v2[12] - 87;
  LOBYTE(STACK[0x21FE]) = v2[13] - 87;
  LOBYTE(STACK[0x21FF]) = v2[14] - 87;
  LOBYTE(STACK[0x2200]) = v2[15] - 87;
  LOBYTE(STACK[0x2201]) = v2[16] - 87;
  LOBYTE(STACK[0x2202]) = v2[17] - 87;
  LOBYTE(STACK[0x2203]) = v2[18] - 87;
  LOBYTE(STACK[0x2204]) = v2[19] - 87;
  LOBYTE(STACK[0x2205]) = v2[20] - 87;
  LOBYTE(STACK[0x2206]) = v2[21] - 87;
  LOBYTE(STACK[0x2207]) = off_18C723C68[0][22] - 87;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v4 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x21F1], SystemEncoding);
  *(void *)(v1 + 3656) = v4;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(690 * (v4 != 0LL)) ^ v0] - 4LL))();
}

uint64_t sub_18870D498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = MGCopyAnswer();
  STACK[0x1570] = v7;
  return (*(uint64_t (**)(void))(a5
                              + 8LL
                              * (((v7 != 0) * (((v5 - 672247177) & 0x2811AEF7) + ((v5 - 1771230253) ^ 0x6992D0B6))) ^ v5)))();
}

uint64_t sub_18870D500@<X0>(int a1@<W8>)
{
  int v5 = v1 + 1476232084;
  unsigned int v6 = (v4 - 1881115980) & 0xD9B260C3;
  uint64_t v7 = (uint64_t (*)(void))(*(void *)(v3
                                     + 8LL
                                     * ((v2 + v4 + 738) ^ (16
                                                         * ((((v6 ^ 0x624C4A09) + a1) & (v5 + 1046646591) & 0x80000000) == 0))))
                         - 8LL);
  LODWORD(STACK[0x8A4]) = v6;
  return v7();
}

uint64_t sub_18870D514()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 488));
  uint64_t v4 = v3 ^ 0x6DDA7FFDE4FB37B2LL;
  unint64_t v5 = (2 * v3) & 0xDBB4FFFBC9F66F64LL;
  CFTypeID TypeID = CFNumberGetTypeID();
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * ((75
                                * (v4 + (TypeID ^ 0x8113041874A20306LL) + v5 - ((2 * TypeID) & 0xFDD9F7CF16BBF9F2LL) + 1 == ((2 * v0) ^ 0xEEED8416599D3EF1LL))) ^ v0)))();
}

uint64_t sub_18870D5BC()
{
  Boolean Value = CFNumberGetValue(*(CFNumberRef *)(v1 + 488), kCFNumberSInt64Type, &STACK[0x460]);
  return ((uint64_t (*)(void))qword_18A26FDB0[(127
}

void sub_18870D628()
{
}

uint64_t sub_18870D6C8@<X0>(char a1@<W8>)
{
  int v8 = STACK[0x8A4];
  LODWORD(STACK[0x8A8]) = STACK[0x8A4];
  int v9 = (v8 - 328746511) & 0x1398477F;
  LODWORD(STACK[0x8AC]) = v9;
  int v10 = v8 ^ (v6 + 61);
  LODWORD(STACK[0x8B0]) = v10;
  char v11 = (v9 - ((32 * a1 + 64) & 0x20) + 16 * a1 + v10 + 56) ^ 0x17 | (v4 + 63);
  uint64_t v12 = v7[479] + (LODWORD(STACK[0x1858]) - 1634533322);
  unsigned int v13 = 83590351 * ((v12 ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4))) & 0x7FFFFFFF);
  unint64_t v14 = 83590351 * (v13 ^ HIWORD(v13));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v14 >> 24] ^ byte_188743410[v14 >> 24] ^ byte_188744EB0[(v14 >> 24) + 3] ^ v14 ^ (-111 * BYTE3(v14)) ^ (v11 - ((2 * v11) & 0x80) - 64) ^ 0xC0;
  v7[20] = *(void *)(v5 + 8LL * (v8 ^ 0x599)) - 8LL;
  v7[21] = v12;
  uint64_t v1 = v7[21];
  LOBYTE(STACK[0x603]) = STACK[0x5C3];
  uint64_t v2 = (*(uint64_t (**)(void))(qword_18C724740
                            + 32LL
  return ((uint64_t (*)(uint64_t))v7[20])(v2);
}

uint64_t sub_18870D804()
{
  return sub_18870357C();
}

uint64_t sub_18870D824()
{
  *(void *)(v2 + 632) = *(void *)(v3 + 3696) + 0x5A72C1CEA1245FC3LL;
  unsigned int v4 = LODWORD(STACK[0x1378]) - ((2 * LODWORD(STACK[0x1378]) + 656696674) & 0xFB5FCD00) + 289544502;
  LODWORD(STACK[0x18AC]) = v4;
  unsigned int v5 = v4 ^ 0xC251097A;
  unsigned int v6 = v4 << (v0 ^ 0x8D);
  LODWORD(STACK[0x18B0]) = v6;
  unsigned int v7 = v5 - 1021618384 + (v6 & 0x7FFDDFFE ^ 0x7B5DCD0A);
  LODWORD(STACK[0x18B4]) = v7;
  *(_BYTE *)(v2 + 659) = v7 < 0x31A472F;
  int v8 = (uint64_t (*)(void))(*(void *)(v1 + 8LL * ((62 * (v7 != 52053807)) ^ v0)) - 8LL);
  LODWORD(STACK[0x8FC]) = v0;
  LODWORD(STACK[0x900]) = 1167352042;
  return v8();
}

void sub_18870D900()
{
  unint64_t v2 = LODWORD(STACK[0x900]);
  LODWORD(STACK[0x904]) = v2;
  int v3 = STACK[0x8FC];
  LODWORD(STACK[0x908]) = STACK[0x8FC];
  LODWORD(STACK[0x90C]) = v3 ^ 0x34F;
  unint64_t v4 = (v2 | ((unint64_t)(v2 < 0x459460EA) << 32)) - 1167352042;
  v1[128] = v4;
  unint64_t v5 = v1[463] + v4;
  v1[129] = v5;
  v1[72] = v5 - 0xE550F9B8A5EBC69LL;
  v1[70] = *(void *)(v0 + 8LL * (v3 ^ 0x67B)) - 4LL;
  JUMPOUT(0x188713810LL);
}

void sub_18870D978()
{
  LODWORD(STACK[0x3D4]) = -45002;
  JUMPOUT(0x18870D9F8LL);
}

uint64_t sub_18870DAB0@<X0>( uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  uint64_t v63 = (v60 - 325342503) & 0x136455FE;
  unint64_t v64 = ((unint64_t)&STACK[0x278] ^ 0x6BECA5FFDFE7B4EFLL)
      - 0x6BECA5FFDFE7B4EFLL
      + ((2LL * (void)&STACK[0x278]) & 0xD7D94BFFBFCF69D8LL);
  STACK[0x218] = ((v64 % (v63 - 465)) ^ 0x9FFEF8DEE5FCCE55LL)
               + 0x600107211A0331BBLL
               + ((2 * (v64 % (v63 - 465))) & 0x2ALL);
  STACK[0x238] = STACK[0x388];
  uint64_t v65 = *(void *)(v62 + 4088) + *(void *)(v62 + 4080) + 0x38839021332522E4LL;
  STACK[0x240] = v65;
  STACK[0x200] = v65 + 16;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 8LL * (int)(((v63 - 486) | a7) ^ 0x110 ^ v63)))( 639156063LL,  a1,  617098335LL,  a2,  a3,  a4,  a5,  a6,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60);
}

uint64_t sub_18870DBE8()
{
  int v0 = STACK[0xDB0];
  uint64_t v1 = (uint64_t (*)(void))(qword_18A26FDB0[(703 * (LODWORD(STACK[0xDB0]) == 962405475)) ^ LODWORD(STACK[0x888])] - 12LL);
  LODWORD(STACK[0xDA8]) = STACK[0x88C];
  LODWORD(STACK[0xDAC]) = v0 + 1;
  return v1();
}

uint64_t sub_18870DC40(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))qword_18A26FDB0[(624
                                                                   * (*(void *)(v2 + 3344) + 1LL != *(void *)(v1 + 576))) ^ LODWORD(STACK[0x898])])( a1,  1771229876LL);
}

uint64_t sub_18870DC80@<X0>(int a1@<W1>, uint64_t a2@<X2>, int a3@<W8>)
{
  **(void **)(v4 + 185) = *(void *)(v4 + 209);
  **(_DWORD **)(v4 + 193) = STACK[0x15F4];
  unsigned int v6 = (a3 + 773417603) & 0xD1E69575 ^ (v3 - 304);
  LODWORD(STACK[0x2330]) = 438484897;
  int v7 = a1 + v6 + 980;
  int v8 = a1 + v6 + 194;
  unint64_t v9 = 591644117 * ((v5 - 200) ^ 0xE41B20C99B054A47LL);
  STACK[0x23C8] = *(void *)(a2 + 8LL * v8) - v9;
  *(_DWORD *)(v5 - 176) = -922504226 - v9 + v6;
  STACK[0x23D8] = (unint64_t)&STACK[0x3336B5A2487B6C94];
  uint64_t v10 = sub_18871DC68(v5 - 200);
  return ((uint64_t (*)(uint64_t))qword_18A26FDB0[v8 ^ 0x379 ^ (1910 * (*(_DWORD *)(v5 - 192) == (v7 ^ 0x3D3)))])(v10);
}

void sub_18870DCB4()
{
  LODWORD(STACK[0x334]) = 0;
  JUMPOUT(0x18870DD2CLL);
}

uint64_t sub_18870DE10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x200]) = v64;
  STACK[0x230] = STACK[0x4A8];
  STACK[0x240] = a23 + a22 - 0x2F322EB8A28E5A01LL;
  LODWORD(STACK[0x218]) = v67 - 312;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 + 8LL * ((((((v63 ^ 5) - 1041692537) & 0x3E16F77D) == 349) * (v63 ^ 5 ^ (v67 - 312) ^ (v67 + 54))) ^ v63 ^ 5)) - 4LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           v65,
           a58,
           a1,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_18870DF6C(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(STACK[0x228]) = a3;
  *(void *)(v9 + 744) = 0xC87ADF7451726FABLL;
  LODWORD(STACK[0x47C]) = *(_DWORD *)(v7 + 3208) - 1823406259;
  uint64_t v12 = *(unsigned int *)(v8 + 3160);
  v10[12] = *(void *)(v4 + 8LL * (v3 + 1771230046));
  LODWORD(STACK[0x578]) = v3 + 1760431127;
  LODWORD(STACK[0x588]) = 0;
  v10[14] = v6;
  LODWORD(STACK[0x58C]) = (v3 + 1760431127) ^ 0x1B;
  LODWORD(STACK[0x590]) = v3 + 1760431254;
  v10[17] = v12;
  *(void *)(v5 + 448) = &STACK[0x570];
  *(_DWORD *)(v11 - 192) = 1431737413 * ((v11 - 200) ^ 0xBE5E9F12) + 40706419 + v3;
  sub_1886DF534(v11 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v11 - 188)] - 12LL))();
}

uint64_t sub_18870E03C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x220] = v71;
  STACK[0x230] = (unint64_t)malloc(__size);
  uint32_t v73 = arc4random();
  LODWORD(xmmword_18C723288) = v73 - 1595106619 - ((v73 << (89 * (v72 ^ (v72 + 3)) + 68)) & 0x41D9358A);
  int v74 = xmmword_18C723288 ^ 0xA0EC9AC7 ^ (xmmword_18C723288 >> 30);
  DWORD1(xmmword_18C723288) = ((1812433253 * v74) ^ 0x35FFFA5D)
                            + ((1477382858 * v74) & 0x6BFFF4BA)
                            + 1793892457
                            - ((((((1812433253 * v74) ^ 0x35FFFA5D) + ((1477382858 * v74) & 0x6BFFF4BA) + 1968026826) << (((89 * (v72 ^ (v72 + 3)) + 83) | 2) - 17))
                              + 694460852) & 0x41D9358A);
  return ((uint64_t (*)(void))(qword_18A26FDB0[89 * (v72 ^ (v72 + 3))] - 4LL))();
}

void sub_18870E180()
{
}

uint64_t sub_18870E19C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  STACK[0x220] = v5;
  int8x16_t v7 = (int8x16_t)vld1q_dup_f32((const float *)&xmmword_18C723288);
  v8.i64[0] = 0x8000000080000000LL;
  v8.i64[1] = 0x8000000080000000LL;
  int8x16_t v9 = (int8x16_t)vdupq_n_s32(0x2BCA4B78u);
  v6.i64[0] = *(void *)((char *)&xmmword_18C723288 + 4);
  v6.i32[2] = HIDWORD(xmmword_18C723288);
  int8x16_t v10 = vextq_s8(v7, v6, 0xCuLL);
  int8x16_t v11 = v6;
  v11.i32[3] = dword_18C723298[0];
  int8x16_t v12 = vandq_s8((int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v10, v8), vdupq_n_s32(0xE6A307A8)), v8);
  int32x4_t v13 = (int32x4_t)veorq_s8(vandq_s8(v11, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x879898u));
  int32x4_t v14 = (int32x4_t)veorq_s8( vorrq_s8( (int8x16_t)vsubq_s32( vaddq_s32( v13,  (int32x4_t)veorq_s8(vandq_s8(v11, v9), (int8x16_t)vdupq_n_s32(0x2B484361u))),  (int32x4_t)vandq_s8((int8x16_t)v13, v9)),  v12),  (int8x16_t)vdupq_n_s32(0xBA14925u));
  v15.i32[0] = *((_DWORD *)&STACK[0x1910] + !(BYTE4(xmmword_18C723288) & 1));
  v15.i32[1] = *((_DWORD *)&STACK[0x1910] + ((BYTE8(xmmword_18C723288) & 1) == 0));
  v15.i32[2] = *((_DWORD *)&STACK[0x1910] + (~HIDWORD(xmmword_18C723288) & 1LL));
  v15.i32[3] = *((_DWORD *)&STACK[0x1910] + ((dword_18C723298[0] & 1) == 0));
  xmmword_18C723288 = (__int128)veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C7238BC, v15),  (int8x16_t)vdupq_n_s32(0x43332D23u)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v14,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v14, v14),  (int8x16_t)vdupq_n_s32(0x49050A20u))),  vdupq_n_s32(0x24828510u)),  1uLL));
  return (*(uint64_t (**)(void))(a5 + 5640))();
}

uint64_t sub_18870EC8C@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>)
{
  unsigned int v8 = ((v5 & 0x80000000) - 425523288) & 0x80000000;
  int v9 = *(_DWORD *)(a2 + 4 * (v6 + a3 + ((a5 + 1431888053) & 0xAAA71F8C)));
  int v10 = (((v9 & 0x7FFFFFFE ^ 0x879898) + (v9 & v7 ^ 0x2B484361) - ((v9 & 0x7FFFFFFE ^ 0x879898) & v7)) | v8) ^ 0xBA14925;
  *(_DWORD *)(a2 + 4 * (v6 + a3) + 2588) = *(_DWORD *)(a2 + 4 * (v6 + a3) + 4176) ^ *((_DWORD *)&STACK[0x1910]
                                                                                    + ((v9 & 1) == 0)) ^ ((v10 - ((2 * v10) & 0x49050A20u) + 612533520) >> 1) ^ 0x43332D23;
  return (*(uint64_t (**)(void))(a1 + 8LL * (((16 * (v6 + 1 != a4 + 3)) | (32 * (v6 + 1 != a4 + 3))) ^ a5)))();
}

uint64_t sub_18870ED74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v8 = (const float *)&dword_18C723614;
  int8x16_t v9 = (int8x16_t)vld1q_dup_f32(v8);
  v10.i64[0] = 0x8000000080000000LL;
  v10.i64[1] = 0x8000000080000000LL;
  v11.i64[0] = -1LL;
  v11.i64[1] = -1LL;
  v7.i64[0] = *(void *)&dword_18C723618;
  v7.i32[2] = dword_18C723620;
  int8x16_t v12 = vextq_s8(v9, v7, 0xCuLL);
  int8x16_t v13 = v7;
  v13.i32[3] = dword_18C723624;
  int32x4_t v14 = (int32x4_t)vorrq_s8( veorq_s8( (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( (int8x16_t)vaddq_s32( (int32x4_t)vandq_s8(v12, v10),  vdupq_n_s32(0xB99D479F)),  (int8x16_t)vdupq_n_s32(0x98DC47BF)),  vdupq_n_s32(0x13663A48u)),  (int8x16_t)vdupq_n_s32(0xB4A73A68)),  veorq_s8( (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8( vandq_s8(v13, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)),  (int8x16_t)vdupq_n_s32(0x62D7223Du)),  v11),  (int8x16_t)vdupq_n_s32(0x423BB8F8u)));
  v15.i32[0] = *(_DWORD *)(v6 + 4LL * ((dword_18C723618 & 1) == 0));
  v15.i32[1] = *(_DWORD *)(v6 + 4 * (dword_18C72361C & (((v5 + 268) | 1u) - 916) ^ 1LL));
  v15.i32[2] = *(_DWORD *)(v6 + 4 * (~dword_18C723620 & 1LL));
  v15.i32[3] = *(_DWORD *)(v6 + 4 * (~dword_18C723624 & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v15),  (int8x16_t)vdupq_n_s32(0x40203815u)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( v14,  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v14, v14),  (int8x16_t)vdupq_n_s32(0x45495EFAu))),  vdupq_n_s32(0x22A4AF7Du)),  1uLL));
  return (*(uint64_t (**)(void))(a5 + 8LL * v5))();
}

void sub_18870EEE0()
{
}

uint64_t sub_18870EEEC()
{
  uint64_t v1 = v0[122] + 1LL;
  uint64_t v2 = v0[123];
  int v3 = ((((unint64_t)(v2 - 0x4A2EF9BB44035CDLL) > 7) << 6) | (((unint64_t)(v2 - 0x4A2EF9BB44035CDLL) > 7) << 7)) ^ LODWORD(STACK[0x8F4]);
  LODWORD(STACK[0x8BC]) = STACK[0x8F4];
  uint64_t v4 = v0[121] + 1LL;
  int v5 = (uint64_t (*)(void))(qword_18A26FDB0[v3] - 8LL);
  v0[118] = v2 + 1;
  v0[119] = v1;
  v0[120] = v4;
  return v5();
}

void sub_18870EF5C()
{
  uint64_t v2 = v1[120];
  v1[121] = v2;
  uint64_t v3 = v1[119];
  v1[122] = v3;
  v1[123] = v1[118];
  int v4 = STACK[0x8BC];
  LODWORD(STACK[0x8F4]) = STACK[0x8BC];
  LODWORD(STACK[0x8F8]) = v4 - 830;
  unsigned int v5 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v3 + *(_DWORD *)(v0 + 296) + 1087204595)) & 0x7FFFFFFF);
  unint64_t v6 = 83590351 * ((v5 >> ((v4 - 62) ^ 0x32)) ^ v5);
  LOBYTE(STACK[0x5C3]) = byte_188744CB0[v6 >> 24] ^ *(_BYTE *)(v2 + *(void *)(v0 + 208) - 0x3F9ACC699846B97LL) ^ byte_18873E860[(v6 >> 24) + 2] ^ byte_188744DB0[v6 >> 24] ^ v6 ^ (23 * ((83590351 * ((v5 >> ((v4 - 62) ^ 0x32)) ^ v5)) >> 24));
  JUMPOUT(0x188714470LL);
}

uint64_t sub_18870F058()
{
  int v1 = LODWORD(STACK[0x904]) + 1;
  unsigned int v2 = LODWORD(STACK[0x904]) - 1115298234;
  char v3 = *(_BYTE *)(v0 + 659) ^ (v2 < 0x31A472F);
  char v4 = v2 < LODWORD(STACK[0x18B4]);
  if ((v3 & 1) != 0) {
    char v4 = *(_BYTE *)(v0 + 659);
  }
  unsigned int v5 = (uint64_t (*)(void))(qword_18A26FDB0[(62 * (v4 & 1)) ^ LODWORD(STACK[0x908])] - 8LL);
  LODWORD(STACK[0x8FC]) = STACK[0x908];
  LODWORD(STACK[0x900]) = v1;
  return v5();
}

uint64_t sub_18870F0CC@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x18BC]) = (STACK[0x18B0] & 0x575FFFF4 ^ 0x535FCD00)
                         + (((a1 ^ 0x546) - 1597617493 + ((a1 - 1525563329) | 0x1028084D)) ^ LODWORD(STACK[0x18AC]));
  uint64_t v3 = *v2 + 32;
  LODWORD(STACK[0x544]) = 0;
  char v4 = (void *)v2[462];
  *unsigned int v2 = v3;
  v2[1] = (uint64_t)v4;
  v2[10] = (uint64_t)v4;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL
                                             * (((2 * (v4 != &unk_1887469F3)) | (4 * (v4 != &unk_1887469F3))) ^ a1))
                            - 8LL))();
}

uint64_t sub_18870F168()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * (((*(void *)(v2 + 3696) == 0LL) * ((v0 ^ 0x424) + v0 - 289 - 1020)) ^ v0))
                            - 12LL))();
}

uint64_t sub_18870F1A0()
{
  *(void *)(v2 + 3912) = &unk_1887469F3;
  BOOL v4 = LODWORD(STACK[0x18BC]) != -1414529030
    && ((LODWORD(STACK[0x18BC]) + 6) & (((v0 - 708) | 1) ^ 0xAE))
     - 1153011878
     - ((2 * (LODWORD(STACK[0x18BC]) + 6)) & 0x1A)
     + 237 == ((v0 - 831) | 0xC8) - 1153011878;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((247 * v4) ^ v0)) - 8LL))();
}

uint64_t sub_18870F1AC()
{
  unsigned int v2 = STACK[0x930];
  int v3 = LODWORD(STACK[0x930]) + 1;
  int v4 = LODWORD(STACK[0x934]) + 1;
  LODWORD(STACK[0x948]) = v4;
  v2 += 856410378;
  char v5 = *(_BYTE *)(v1 + 183) ^ (v2 < 0x53FD3AF3);
  int v6 = v2 < LODWORD(STACK[0x16D8]);
  if ((v5 & 1) != 0) {
    int v6 = *(unsigned __int8 *)(v1 + 183);
  }
  uint64_t v7 = qword_18A26FDB0[LODWORD(STACK[0x938]) | (16 * (v0 & ~v6))];
  LODWORD(STACK[0x924]) = STACK[0x938];
  LODWORD(STACK[0x928]) = v4;
  LODWORD(STACK[0x92C]) = v3;
  return ((uint64_t (*)(void))(v7 - 12))();
}

void sub_18870F224()
{
  LODWORD(STACK[0x364]) = STACK[0x948];
  JUMPOUT(0x18870F230LL);
}

void sub_18870F2A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  v64[72] = v64[160];
  v64[70] = qword_18A26FDB0[a63 ^ (v63 - 1288)] - 12LL;
  JUMPOUT(0x18871B8BCLL);
}

void sub_18870F2CC()
{
  LOBYTE(STACK[0xB0F]) = (LOBYTE(STACK[0xB08]) ^ 0xAF)
                       + ((2 * LOBYTE(STACK[0xB08])) & 0xDA)
                       + 0x80
                       - ((2 * ((LOBYTE(STACK[0xB08]) ^ 0xAF) + ((2 * LOBYTE(STACK[0xB08])) & 0xDA) + 0x80) + 6) & 4)
                       + 69;
  *(void *)(v0 + 576) = *(void *)(v0 + 1416);
  JUMPOUT(0x188714F00LL);
}

uint64_t sub_18870F320()
{
  int v0 = LODWORD(STACK[0xA94]) + 1185167700 - 2 * ((LODWORD(STACK[0xA94]) + 16) & 0x46A43947 ^ STACK[0x950] & 3);
  LODWORD(STACK[0x984]) = v0;
  return ((uint64_t (*)(void))qword_18A26FDB0[(91 * ((v0 ^ 0x46A43944u) < LODWORD(STACK[0x1804]))) ^ LODWORD(STACK[0x960])])();
}

void sub_18870F380()
{
}

uint64_t sub_18870F46C()
{
  uint64_t v3 = v2[208];
  uint64_t v4 = v2[210];
  int v5 = (unint64_t)(v4 - 0x24CED77C3AF5DC70LL) < *(void *)(v1 + 352);
  int v6 = STACK[0xBA8];
  uint64_t v7 = qword_18A26FDB0[(158 * (v0 & ~v5)) ^ LODWORD(STACK[0xBA8])];
  uint64_t v8 = v2[209] + 1LL;
  LODWORD(STACK[0x8B4]) = STACK[0xBAC];
  LODWORD(STACK[0xB74]) = v6;
  v2[205] = v4 + 1;
  v2[206] = v8;
  v2[207] = v3 + 1;
  return ((uint64_t (*)(void))(v7 - 4))();
}

void sub_18870F504()
{
  uint64_t v1 = *(void *)(v0 + 1656);
  *(void *)(v0 + 1664) = v1;
  uint64_t v2 = *(void *)(v0 + 1648);
  *(void *)(v0 + 1672) = v2;
  *(void *)(v0 + 1680) = *(void *)(v0 + 1640);
  int v3 = STACK[0xB74];
  LODWORD(STACK[0xBA8]) = STACK[0xB74];
  int v4 = 2 * (v3 ^ 0x237);
  LODWORD(STACK[0xBAC]) = v4;
  unint64_t v6 = 83590351 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x5C3]) = byte_188744CB0[v6 >> 24] ^ *(_BYTE *)(v1 + *(void *)(v0 + 3720) - 0x5EDEBCB257407475LL) ^ byte_18873E860[(v6 >> 24) + 2] ^ byte_188744DB0[v6 >> 24] ^ v6 ^ (23 * BYTE3(v6));
  JUMPOUT(0x1886F4BF8LL);
}

uint64_t sub_18870F60C()
{
  uint64_t v2 = *(void *)(v1 + 1776) + 1LL;
  uint64_t v3 = *(void *)(v1 + 1768) + 1LL;
  uint64_t v4 = *(void *)(v1 + 1784);
  int v5 = *(unsigned __int8 *)(v1 + 3855);
  unint64_t v6 = (uint64_t (*)(void))qword_18A26FDB0[(71 * (v0 & ~v5)) ^ LODWORD(STACK[0xC14])];
  LODWORD(STACK[0xBDC]) = STACK[0xC14];
  *(void *)(v1 + 1744) = v4 + 1;
  *(void *)(v1 + 1752) = v2;
  *(void *)(v1 + 1760) = v3;
  return v6();
}

void sub_18870F6A0()
{
  uint64_t v3 = v2[220];
  v2[221] = v3;
  uint64_t v4 = v2[219];
  v2[222] = v4;
  v2[223] = v2[218];
  int v5 = STACK[0xBDC];
  LODWORD(STACK[0xC14]) = STACK[0xBDC];
  LODWORD(STACK[0xC18]) = v5 - 285;
  uint64_t v6 = v4 + *(void *)(v1 + 33) - 0x4A54A3FFBBF13D54LL;
  unsigned int v7 = 83590351 * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ v6) & 0x7FFFFFFF);
  unint64_t v8 = 83590351 * (v7 ^ HIWORD(v7));
  LOBYTE(STACK[0x5C3]) = byte_188744CB0[v8 >> ((v5 - 29) ^ 0x18u)] ^ *(_BYTE *)(v3 + v2[439] - 0x3405B9CF181927FFLL) ^ byte_18873E860[(v8 >> ((v5 - 29) ^ 0x18u)) + 2] ^ byte_188744DB0[v8 >> ((v5 - 29) ^ 0x18u)] ^ v8 ^ (23 * (v8 >> ((v5 - 29) ^ 0x18u)));
  v2[20] = *(void *)(v0 + 8LL * (v5 ^ 0x44B)) - 4LL;
  v2[21] = v6;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_18870F7B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return ((uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_18A26FDB0[(269 * (LODWORD(STACK[0x161C]) != LODWORD(STACK[0x160C]))) ^ LODWORD(STACK[0xC60])])( a1,  qword_18A26FDB0,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_18870F7F8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v65 = STACK[0xC64];
  LODWORD(STACK[0x161C]) = a9 + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 8LL * ((25 * (*(_BYTE *)(*(void *)(v64 + 192) + (((a9 + 1) << ((v65 - 4) ^ (v65 - 5))) - 1508574736)) == 0)) ^ v65)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,  a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64);
}

uint64_t sub_18870F804(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(qword_18A26FDB0[(((LODWORD(STACK[0x1344]) == LODWORD(STACK[0x1704])) << 7) | ((LODWORD(STACK[0x1344]) == LODWORD(STACK[0x1704])) << 8)) ^ LODWORD(STACK[0xD30])]
                                                   - 4LL))( a1,  1771229876LL);
}

void sub_18870F850()
{
}

uint64_t sub_18870F8D0(uint64_t a1, int a2, uint64_t a3)
{
  return ((uint64_t (*)(void))(*(void *)(a3
                                        + 8LL
                                        * ((229
                                          * ((*(char *)(*(void *)(v5 + 177)
                                                                    + ((v4 - a2 + 490748188) & 0x4C52951E ^ 0x7E9E1D7D ^ (v3 - ((4 * LODWORD(STACK[0x1344]) + 641212288) & 0xFD3C3AF4) - 1850069701)))
                                                          - 48) > 9)) ^ v4))
                            - 4LL))();
}

uint64_t sub_18870F97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3
                              + 8LL
}

uint64_t sub_18870F9DC(uint64_t a1, int a2, uint64_t a3)
{
  BOOL v7 = (((a2 + v5 + 15) ^ 0xDE) + *(_BYTE *)(*(void *)(v6 + 177) + (v4 ^ v3))) > 9u;
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * ((v7 | (2 * v7)) ^ (a2 + v5 + 477))) - 8LL))();
}

uint64_t sub_18870F9E8()
{
  uint64_t v3 = v2[272] + 1LL;
  uint64_t v4 = v2[271] + 1LL;
  unint64_t v5 = v2[273];
  unint64_t v6 = v5 + 1;
  v5 -= 0x3DAAEDBD47175D36LL;
  BOOL v7 = v5 < 0x76830D68;
  BOOL v8 = v5 >= *(void *)(v1 + 41);
  int v9 = *(unsigned __int8 *)(v1 + 56);
  char v10 = v9 ^ v7;
  int v11 = !v8;
  if ((v10 & 1) == 0) {
    int v9 = v11;
  }
  int8x16_t v12 = (uint64_t (*)(void))(qword_18A26FDB0[(27 * (v0 & ~v9)) ^ LODWORD(STACK[0xDA0])] - 12LL);
  LODWORD(STACK[0xD6C]) = STACK[0xDA0];
  v2[268] = v6;
  v2[269] = v3;
  v2[270] = v4;
  return v12();
}

uint64_t sub_18870FA80()
{
  int v2 = STACK[0xDFC];
  int v3 = -905433537 * (LODWORD(STACK[0xDFC]) + LODWORD(STACK[0xE24]) + LODWORD(STACK[0xE28])) - LODWORD(STACK[0xDEC]);
  unsigned int v4 = LODWORD(STACK[0xDF8]) ^ 0xE5C35550;
  unsigned int v5 = (((v3 - 273249452) % 0x101u) ^ 0xF62F37EE)
     + ((v3 + v4 + LODWORD(STACK[0xDF0]) + 993136971) ^ 0x320407B)
     + ((2 * ((v3 - 273249452) % 0x101u)) & 0x3DC)
     - ((2 * (v3 + v4 + LODWORD(STACK[0xDF0]) + 993136971)) & 0xF9BF7F08)
     + 1;
  unsigned int v6 = v5 - ((2 * v5 + 224464684) & 0x98702FAA) - 756506773;
  int v7 = v6 ^ LODWORD(STACK[0xDF4]);
  unsigned int v8 = ((2 * (v4 + (v7 ^ 0xA7DFD1FC) + 1)) & 0xDFFF2D7A) + ((v4 + (v7 ^ 0xA7DFD1FC) + 1) ^ 0xEFFF96BD);
  unsigned int v9 = ((LODWORD(STACK[0xDF0]) + 1266386423) ^ 0x58202E03 ^ v7)
     - 910563399
     - ((2 * ((LODWORD(STACK[0xDF0]) + 1266386423) ^ 0x58202E03 ^ v7)) & 0x9373CF72);
  int v11 = (((LOBYTE(STACK[0xDF0]) - 9) ^ 3 ^ v7)
       - 71
  unsigned int v12 = (v11 ^ 0xF7F86FAF) + 2 * v11;
  unsigned int v13 = v12 + 972027636;
  HIDWORD(v14) = v7 ^ 0x18202E03;
  LODWORD(v14) = v7 ^ 0x40000000;
  int v15 = ((2 * (v14 >> 29)) & 0x7FABEEF8) + ((v14 >> 29) ^ 0xBFD5F77C);
  BOOL v16 = ((v12 + 134713425) & (v15 + 1076496516)) == ((2 * ((v12 + 134713425) & (v15 + 1076496516))) & 0x9F77FCE8);
  unsigned int v17 = 702600786 - v12;
  if (v16) {
    unsigned int v17 = v13;
  }
  unsigned int v18 = v17 + v15 - ((2 * (v17 + v15) + 478364610) & 0xE33C8BA2) - 2103374;
  int v19 = (v2 - 220959089) < LODWORD(STACK[0x13F4]);
  unsigned int v10 = (v9 & 0xFFFFFFFB ^ 0x40F9E79D) - ((2 * (v9 & 0xFFFFFFFB ^ 0x40F9E79D)) & 0xC3576226) + 1638641939;
  unsigned int v20 = (v6 ^ 0xA5CACCB0)
      + (((v10 ^ 0x1975F4E6 ^ v18) - v8 - 268462403) ^ 0x69D5FBFF)
      + ((2 * ((v10 ^ 0x1975F4E6 ^ v18) - v8 - 268462403)) & 0xD3ABF7FE)
      - 1775631359;
  unsigned int v21 = v20 - ((2 * v20) & 0x8C9B8588) + 1179501252;
  unsigned int v22 = ((2 * v21) & 0xFAD7F592 ^ 0x52814480) + (v21 ^ 0x56AB5C8F);
  LODWORD(STACK[0xE14]) = v22 + 1811281856;
  unsigned int v23 = (((v9 ^ 0xC9B9E7B9) - v22 - 43255095) ^ 0xFFB4FAEB)
      - 1261469922
      + ((2 * ((v9 ^ 0xC9B9E7B9) - v22 - 43255095)) & 0xFF69F5D6);
  LODWORD(STACK[0xE18]) = v23;
  unsigned int v24 = v22 + v8 - ((2 * (v22 + v8) + 623434996) & 0xCB86AAA0) - 128465974;
  LODWORD(STACK[0xE1C]) = v24;
  unsigned int v25 = v6 ^ 0xF3E08845 ^ v21;
  LODWORD(STACK[0xE20]) = v25;
  uint64_t v26 = qword_18A26FDB0[LODWORD(STACK[0xE00]) ^ (435 * (v0 & ~v19))];
  LODWORD(STACK[0xDD4]) = STACK[0xE00];
  LODWORD(STACK[0xDD8]) = v2 + 1;
  LODWORD(STACK[0xDDC]) = v24;
  LODWORD(STACK[0xDE0]) = v25;
  LODWORD(STACK[0xDE4]) = v23;
  LODWORD(STACK[0xDE8]) = v22 + 1811281856;
  return ((uint64_t (*)(void))(v26 - 8))();
}

void sub_18870FE50()
{
  int v3 = (LODWORD(STACK[0xE04]) + 85828938) & 0x525283D6;
  int v4 = LODWORD(STACK[0x13D4]) - LODWORD(STACK[0x13D0]);
  LODWORD(STACK[0x1688]) = v4;
  LODWORD(STACK[0x168C]) = v4 ^ (v3 - 1911024409);
  *(void *)(v1 + 104) = v2[10];
  LODWORD(STACK[0xBB0]) = v3;
  LODWORD(STACK[0xBB4]) = STACK[0xE1C];
  LODWORD(STACK[0xBB8]) = 190099902;
  LODWORD(STACK[0xBBC]) = STACK[0xE18];
  LODWORD(STACK[0xBC0]) = STACK[0xBBC];
  int v5 = STACK[0xBB8];
  LODWORD(STACK[0xBC4]) = STACK[0xBB8];
  LODWORD(STACK[0xBC8]) = STACK[0xBB4];
  int v6 = STACK[0xBB0];
  LODWORD(STACK[0xBCC]) = STACK[0xBB0];
  LODWORD(STACK[0xBD0]) = (v6 - 1878185934) | 0x6600149;
  v2[72] = *(void *)(v1 + 104) + (v5 - 190099902);
  v2[70] = *(void *)(v0 + 8LL * (v6 ^ 0x731)) - 8LL;
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_18870FEC4()
{
  uint64_t v1 = v0[296] + 1LL;
  unint64_t v2 = v0[297];
  int v3 = (114 * (v2 >> 3 != 0x24143731E42DBD5LL)) ^ LODWORD(STACK[0xE64]);
  LODWORD(STACK[0xE2C]) = STACK[0xE64];
  uint64_t v4 = v0[295] + 1LL;
  int v5 = (uint64_t (*)(void))(qword_18A26FDB0[v3] - 12LL);
  v0[292] = v2 + 1;
  v0[293] = v1;
  v0[294] = v4;
  return v5();
}

uint64_t sub_18870FF30@<X0>( uint64_t a1@<X2>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  LODWORD(STACK[0x3C4]) = a6;
  unint64_t v63 = *(void *)(v62 + 368);
  STACK[0x220] = v63;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8LL * (int)((((v61 + 1753219588) | 0x2411818) - 1791039021) | (2 * ((0xFFFFFFF8 >> ((((v61 + 4) | 0x18) - 79) & 0x5F ^ 0x54)) & 1)))) - 4LL))( v63,  1771229876LL,  a1,  ((v61 + 1753219588) | 0x2411818u) + 8,  a2,  a3,  a4,  a5,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,
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
           a58,
           a59,
           a60,
           a61);
}

uint64_t sub_18870FF8C()
{
  uint64_t v2 = v1[312] + 1LL;
  uint64_t v3 = v1[311] + 1LL;
  unint64_t v4 = v1[313];
  unint64_t v5 = v4 + 1;
  v4 -= 0x25333FF2F12F1C87LL;
  char v6 = *(_BYTE *)(v0 + 151) ^ (v4 < 0x8DAA09B8);
  char v7 = v4 < *(void *)(v0 + 136);
  if ((v6 & 1) != 0) {
    char v7 = *(_BYTE *)(v0 + 151);
  }
  unsigned int v8 = (uint64_t (*)(void))qword_18A26FDB0[(62 * (v7 & 1)) ^ LODWORD(STACK[0xEE4])];
  LODWORD(STACK[0xEAC]) = STACK[0xEE4];
  v1[308] = v5;
  v1[309] = v2;
  v1[310] = v3;
  LODWORD(STACK[0x1050]) = STACK[0xEE8];
  return v8();
}

void sub_188710020()
{
  int v1 = STACK[0x1050];
  LODWORD(STACK[0x1054]) = LODWORD(STACK[0x1050]) - 168;
  unsigned int v2 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(((v1 - 168) ^ 0xFD1BB2CB) & dword_18C724718)) ^ (*(_DWORD *)(v0 + 120)
                                                                                            + *(_DWORD *)(v0 + 552)
                                                                                            + 268502019)) & 0x7FFFFFFF);
  unint64_t v3 = 83590351 * (v2 ^ HIWORD(v2));
  LOBYTE(STACK[0x5C3]) = byte_18873E860[(v3 >> 24) + 2] ^ byte_188744CB0[v3 >> 24] ^ byte_188744DB0[v3 >> 24] ^ v3 ^ (23 * BYTE3(v3));
  JUMPOUT(0x18870911CLL);
}

uint64_t sub_1887100EC()
{
  uint64_t v1 = v0[320] + 1LL;
  uint64_t v2 = v0[321];
  int v3 = ((2 * ((unint64_t)(v2 - 0x137BAE6D893CE545LL) < 8)) | (4
                                                                   * ((unint64_t)(v2 - 0x137BAE6D893CE545LL) < 8))) ^ LODWORD(STACK[0xF24]);
  LODWORD(STACK[0xEEC]) = STACK[0xF24];
  uint64_t v4 = v0[319] + 1LL;
  unint64_t v5 = (uint64_t (*)(void))(qword_18A26FDB0[v3] - 4LL);
  v0[316] = v2 + 1;
  v0[317] = v1;
  v0[318] = v4;
  return v5();
}

void sub_18871015C()
{
  uint64_t v1 = *(void *)(v0 + 2544);
  *(void *)(v0 + 2552) = v1;
  uint64_t v2 = *(void *)(v0 + 2536);
  *(void *)(v0 + 2560) = v2;
  *(void *)(v0 + 2568) = *(void *)(v0 + 2528);
  int v3 = STACK[0xEEC];
  LODWORD(STACK[0xF24]) = STACK[0xEEC];
  LODWORD(STACK[0xF28]) = v3 - 801;
  unsigned int v4 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(((v3 - 801) ^ 0xFD1BB2FD) & dword_18C724718)) ^ (v2
                                                                                            + *(_DWORD *)(v0 + 3416)
                                                                                            - 1407299231)) & 0x7FFFFFFF);
  unint64_t v5 = 83590351 * (v4 ^ HIWORD(v4));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v5 >> 24] ^ *(_BYTE *)(v1 + *(void *)(v0 + 4064) - 0x9FE356ABC379C48LL) ^ byte_188743410[v5 >> 24] ^ byte_188744EB0[(v5 >> 24) + 3] ^ v5 ^ (-111 * BYTE3(v5));
  JUMPOUT(0x188710254LL);
}

void sub_188710268()
{
  LODWORD(STACK[0x3AC]) = 0;
  JUMPOUT(0x18871BCFCLL);
}

uint64_t sub_188710284()
{
  LODWORD(STACK[0x324]) = STACK[0x107C];
  BOOL v2 = **(_DWORD **)(v0 + 384) != 1896455922;
  *(void *)(v1 + 2928) = STACK[0x480];
  return ((uint64_t (*)(void))(qword_18A26FDB0[(236 * v2) ^ LODWORD(STACK[0x105C])] - 4LL))();
}

void sub_1887102D4(uint64_t a1, uint64_t a2)
{
  int v5 = STACK[0x1060];
  *(void *)(v3 + 249) = v4[363] - 0x3336B5A2487B4944LL;
  int v6 = STACK[0x107C];
  LODWORD(STACK[0x10E4]) = v5;
  LODWORD(STACK[0x10E8]) = v6;
  LODWORD(STACK[0x10EC]) = 255400886;
  int v7 = STACK[0x10EC];
  LODWORD(STACK[0x10F0]) = STACK[0x10EC];
  LODWORD(STACK[0x10F4]) = STACK[0x10E8];
  int v8 = STACK[0x10E4];
  LODWORD(STACK[0x10F8]) = STACK[0x10E4];
  LODWORD(STACK[0x10FC]) = v8 + 1771230248;
  uint64_t v9 = **(void **)(v3 + 249) + (v7 - 255400886);
  v4[382] = v9;
  v4[72] = v9;
  v4[70] = *(void *)(a2 + 8LL * (v8 ^ (v2 - 961)));
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_188710598()
{
  unsigned int v2 = STACK[0x1114];
  int v3 = LODWORD(STACK[0x1114]) + 1;
  LODWORD(STACK[0x1130]) = v3;
  v2 += 237973022;
  char v4 = *(_BYTE *)(v1 + 3895) ^ (v2 < 0x4B6CEADE);
  int v5 = v2 < LODWORD(STACK[0x1440]);
  if ((v4 & 1) != 0) {
    int v5 = *(unsigned __int8 *)(v1 + 3895);
  }
  int v6 = (uint64_t (*)(void))(qword_18A26FDB0[(984 * (v0 & ~v5)) ^ LODWORD(STACK[0x1118])] - 4LL);
  LODWORD(STACK[0x110C]) = STACK[0x1118];
  LODWORD(STACK[0x1110]) = v3;
  return v6();
}

void sub_188710614()
{
  unsigned int v2 = STACK[0x1130];
  LODWORD(STACK[0xB10]) = LODWORD(STACK[0x111C]) ^ 0x833244BD;
  LODWORD(STACK[0xB14]) = v2;
  *(void *)(v1 + 1544) = (unint64_t)(v2 < v0) << 32;
  uint64_t v3 = *(void *)(v1 + 1544);
  int v4 = STACK[0xB14];
  LODWORD(STACK[0xB20]) = STACK[0xB14];
  int v5 = STACK[0xB10];
  LODWORD(STACK[0xB24]) = STACK[0xB10];
  LODWORD(STACK[0xB28]) = v5 + 154;
  unsigned int v6 = 83590351
     * (((*(_DWORD *)(v1 + 3704) + v4 + v3 - 1027456193) ^ *(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0x73FD9180))) & (v5 + 2147483149));
  unint64_t v7 = 83590351 * (v6 ^ HIWORD(v6));
  LOBYTE(STACK[0x5C3]) = byte_188746B10[v7 >> 24] ^ byte_18873E550[(v7 >> 24) + 1] ^ byte_18873CC10[v7 >> 24] ^ v7 ^ (-43 * BYTE3(v7)) ^ 0x80;
  JUMPOUT(0x188714FF8LL);
}

uint64_t sub_188710644()
{
  uint64_t v2 = *(void *)(v1 + 3200) + 1LL;
  uint64_t v3 = *(void *)(v1 + 3192) + 1LL;
  unint64_t v4 = *(void *)(v1 + 3208);
  unint64_t v5 = v4 + 1;
  v4 -= 0x7033BD7D72DD4C93LL;
  BOOL v6 = v4 < 0x4C7FC26D;
  BOOL v7 = v4 >= *(void *)(v1 + 3400);
  int v8 = *(unsigned __int8 *)(v1 + 3411);
  char v9 = v8 ^ v6;
  int v10 = !v7;
  if ((v9 & 1) == 0) {
    int v8 = v10;
  }
  int v11 = (uint64_t (*)(void))(qword_18A26FDB0[(202 * (v0 & ~v8)) ^ LODWORD(STACK[0x11A4])] - 4LL);
  LODWORD(STACK[0x116C]) = STACK[0x11A4];
  *(void *)(v1 + 3168) = v5;
  *(void *)(v1 + 3176) = v2;
  *(void *)(v1 + 3184) = v3;
  return v11();
}

uint64_t sub_1887106DC@<X0>( uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  LODWORD(STACK[0x3A4]) = a7;
  unsigned int v64 = (v62 + 282) ^ LODWORD(STACK[0x1494]) ^ 0xFFFFF6BC;
  unint64_t v65 = *(void *)(v63 + 3976);
  STACK[0x220] = v65;
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8LL * ((727 * (((unsigned __int16)v64 ^ 0x6976u) > 1)) ^ (v62 + 282))))( v65,  1771229876LL,  a1,  a2,  a3,  a4,  a5,  a6,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62);
}

uint64_t sub_188710714()
{
  int v0 = LODWORD(STACK[0x11F0]) + 1;
  uint64_t v1 = (uint64_t (*)(void))(qword_18A26FDB0[(LODWORD(STACK[0x11F0]) == 38914697) | ((LODWORD(STACK[0x11F0]) == 38914697) << 6) | LODWORD(STACK[0x11FC])]
                         - 12LL);
  LODWORD(STACK[0x11E8]) = STACK[0x11F4];
  LODWORD(STACK[0x11EC]) = v0;
  return v1();
}

uint64_t sub_18871076C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * (LODWORD(STACK[0x11F8]) ^ (4
                                                                   * (LODWORD(STACK[0x166C]) != LODWORD(STACK[0x11F8])
                                                                                              + ((LODWORD(STACK[0x11F8])
                                                                                                - 954) | 0x20A)
                                                                                              - 1860))))
                            - 12LL))();
}

uint64_t sub_1887107A0@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((25 * (*(void *)(v2 + 88) != 0LL)) ^ a2))
                            + 2523737411LL
                            - ((a2 - 696309119) & 0xBFEDFFFF)))();
}

void sub_1887107F4(unint64_t a1)
{
  *(void *)(v1 + 88) = *(void *)(v2 + 3672);
  JUMPOUT(0x1886F73D8LL);
}

void sub_188710894()
{
  uint64_t v1 = (unint64_t *)((char *)&STACK[0x2380] + v0);
  v1[3] = 0xAE763C50EE97D81CLL;
  *uint64_t v1 = 0xD896B8C93368D1FDLL;
  v1[1] = 0xAE763C50EE97D81CLL;
  v1[2] = 0xD896B8C93368D1FDLL;
  JUMPOUT(0x1887108D8LL);
}

void sub_188710954( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57)
{
  uint64_t v58 = *(unsigned __int8 **)(v57 + 3912);
  uint64_t v59 = v58[5];
  uint64_t v60 = v58[2] ^ 0x1CLL;
  int v61 = byte_18873E760[v59 ^ 0x3E];
  int v62 = v58[9] ^ 0x7B ^ byte_18873E760[v58[9] ^ 0xFLL];
  LODWORD(STACK[0x240]) = a1;
  int v63 = byte_188743F90[v60];
  STACK[0x568] = 0LL;
  unsigned int v64 = (((v62 - ((2 * v62) & 0x1CA)) << 16) - 756744192) ^ 0xD2E50000;
  STACK[0x530] = 0LL;
  STACK[0x538] = 0LL;
  STACK[0x548] = 0LL;
  STACK[0x550] = 0LL;
  int v65 = v64 - ((2 * v64) & 0x62D20000) + 828983944;
  STACK[0x520] = 0LL;
  STACK[0x528] = 0LL;
  LODWORD(STACK[0x544]) = 1876086006;
  int v66 = (((((25 * v63 - ((a57 + 50 * v63) & 0x70) - 9) ^ 0xE)
         - ((2 * ((25 * v63 - (((_BYTE)a57 + 50 * (_BYTE)v63) & 0x70) - 9) ^ 0xE)) & 0x146)) << 8)
       + 61383424) ^ 0x3A8A300;
  int v67 = v58[4] ^ byte_188746A10[v58[4] ^ 0x58LL];
  int v68 = ((((v67 ^ 0x84) - ((2 * v67) & 0xA4)) << 24) + 1375731712) ^ 0x52000000;
  LODWORD(v59) = (v68 - ((2 * v68) & 0x34000000) + 440324732) ^ 0x1A3ED27C | (v59
                                                                            + 1459116165
                                                                            + (~(2 * v59) | 0xD20FFFFF)
                                                                            + 1) ^ 0x56F85885;
  int v69 = *v58 ^ 0x13 ^ byte_188746A10[*v58 ^ 0xF4LL];
  unsigned int v70 = ((((v69 - 2 * (v69 & 1) + 21) << 24) ^ 0x1000000)
       - ((((v69 - 2 * (v69 & 1) + 21) << 25) - 671088640) & 0xAC000000)
       + 1109017731) ^ 0x561A4483 | (v66 - ((2 * v66) & 0x5C39AA00) - 1373842067) ^ 0xAE1CD56D;
  int v71 = byte_188744190[v58[7] ^ 0x5ALL] ^ 0x63;
  int v72 = (v59 - 802745720 - ((2 * v59) & 0xA04E2510)) ^ 0xD0271288 | (v71 - ((2 * v71) & 0xDE) - 1731092625) ^ 0x98D19F6F;
  int v73 = v72 - ((2 * v72) & 0x16511498) + 187206220;
  uint64_t v74 = v58[13];
  int v75 = byte_188743F90[v58[6] ^ 0xC6LL];
  int v76 = v58[12] ^ 0x83 ^ byte_188746A10[v58[12] ^ 0xCBLL];
  unsigned int v77 = (((v76 - ((2 * v76) & 0x1C)) << 24) - 1912602624) ^ 0x8E000000;
  int v78 = byte_188744190[v58[15] ^ 0xC7LL] ^ 8;
  unsigned int v79 = (v77 - ((2 * v77) & 0x7C000000) - 1099167380) ^ 0xBE7C096C | (v78 - ((2 * v78) & 0x16) + 1395081995) ^ 0x5327430B;
  int v80 = (25 * v75 - ((a57 + 50 * v75) & 0x9C) - 115) ^ 0xD5;
  unsigned int v81 = (((v80 - ((2 * v80) & 0x22)) << 8) - 681242368) ^ 0xD7651100;
  int v82 = byte_188743F90[v58[10] ^ 0x45LL];
  int v83 = v58[8] ^ byte_188746A10[v58[8] ^ 0x60LL];
  unsigned int v84 = (((((v83 ^ 0x58) - ((2 * (v83 ^ 0x58)) & 0xE8)) << 24) - 201326592) ^ 0xF4000000) - ((v83 & 1) << 25) + 23501857;
  int v85 = (25 * v82 - ((50 * (_BYTE)v82 + 62) & 0x38) + 91) ^ 0x20;
  unsigned int v86 = (((v85 - ((2 * v85) & 0x62)) << 8) - 1610796800) ^ 0x9FFD3100;
  LODWORD(v60) = (v84 ^ 0x1669C21 | v65 ^ 0x31694A88) - ((2 * (v84 ^ 0x1669C21 | v65 ^ 0x31694A88)) & 0xE8CB5650);
  uint64_t v87 = v58[3];
  int v88 = (v81 - ((2 * v81) & 0x47911400) + 600345201) ^ 0x23C88A71 | v73 ^ 0xB288A4C;
  LODWORD(STACK[0x13B8]) = (2 * v88) & 0x97D0DEF6;
  LODWORD(STACK[0x13BC]) = v88 - 873959557;
  int v89 = v74 ^ 0x98 ^ byte_18873E760[v74 ^ 0xBF];
  int v90 = (((v89 - ((2 * v89) & 0x94)) << 16) + 1984561152) ^ 0x764A0000;
  int v91 = v90 - ((2 * v90) & 0xFFC0000) + 134143818;
  unint64_t v92 = STACK[0x1458];
  int v93 = byte_188744190[v87 ^ 0x62];
  LODWORD(v74) = v91 ^ 0x7FEDF4A | (v79 - ((2 * v79) & 0xB067ED72) + 1479800505) ^ 0x5833F6B9;
  int v94 = *(unsigned __int8 *)(STACK[0x1458] + 11);
  int v95 = byte_188743F90[*(unsigned __int8 *)(STACK[0x1458] + 14) ^ 0xF8LL];
  unsigned int v96 = (((((25 * v95 - ((a57 + 50 * v95) & 0x4A) + 100) ^ 0x2D)
         - ((2 * ((25 * v95 - ((a57 + 50 * v95) & 0x4A) + 100) ^ 0x2D)) & 0x166)) << 8)
       - 1983597824) ^ 0x89C4B300;
  int v97 = (v96 - ((2 * v96) & 0x679DC00) + 54324834) ^ 0x33CEE62 | (v74 - ((2 * v74) & 0x1A953C0A) - 1924489723) ^ 0x8D4A9E05;
  int v98 = v97 + 95985116 - ((2 * v97) & 0xB713BF8) + 32;
  LODWORD(STACK[0x13C0]) = v98;
  unsigned int v99 = 2 * ((v94 ^ 0xCF) & 0x7F) + (v94 ^ 0xE37F5FB0);
  uint64_t v100 = *(unsigned __int8 *)(v92 + 1);
  int v101 = byte_188744190[v99
                      - ((4 - 4 * (_BYTE)v94) & 4)
                      - 1669292481
                      + ((2 * v99 - ((4 * v99 + 4) & 0x2C) + 25) & 0x46 ^ 0x80000263)] ^ 0x63;
  int v102 = (((v86 - ((2 * v86) & 0x514AC400) + 1755669038) ^ 0x68A5622E | (v60 - 194663640) ^ 0xF465AB28)
        - ((2 * ((v86 - ((2 * v86) & 0x514AC400) + 1755669038) ^ 0x68A5622E | (v60 - 194663640) ^ 0xF465AB28)) & 0x7F762096)
        - 1078259637) ^ 0xBFBB104B | (v101 - ((2 * v101) & 0x16C) + 1616290742) ^ 0x6056A3B6;
  int v103 = v102 - ((2 * v102) & 0x75237DC4) - 1164853534;
  LODWORD(STACK[0x13C4]) = v103;
  LODWORD(v58) = v100 ^ byte_18873E760[v100 ^ 0xC] ^ 0xFE;
  LODWORD(v58) = ((((_DWORD)v58 - ((2 * (_DWORD)v58) & 0x77777777)) << 16) + 45809664) ^ 0x2BB0000;
  LODWORD(v58) = (_DWORD)v58 - ((2 * (_DWORD)v58) & 0x75360000) + 983238174;
  LODWORD(STACK[0x13C8]) = (_DWORD)v58;
  LODWORD(v58) = v58 ^ 0x3A9B061E;
  LODWORD(STACK[0x13CC]) = (_DWORD)v58;
  int v104 = ((v93 ^ 0x92) - ((2 * (v93 ^ 0x92)) & 0x56) + 1326362667) ^ 0x4F0EB02B | (v70
                                                                                 - ((2 * v70) & 0xF72A6A2)
                                                                                 + 129586001) ^ 0x7B95351;
  unsigned int v105 = v58 | (v104 - ((2 * v104) & 0xE8619F86) - 198127677) ^ 0xF430CFC3;
  LODWORD(STACK[0x13D0]) = (2 * v105) & 0x298D9172;
  LODWORD(STACK[0x13D4]) = v105 + 348571833;
  LODWORD(STACK[0x13D8]) = v103 ^ 0xFD00FF54;
  LODWORD(STACK[0x13DC]) = v98 ^ 0x5A0982DE;
  STACK[0x13E0] = STACK[0x518];
  STACK[0x13E8] = STACK[0x560];
  unsigned int v106 = LODWORD(STACK[0x18BC]) + 1640853826;
  LODWORD(STACK[0x13F4]) = v106;
  LOBYTE(STACK[0x13FB]) = v106 < 0xD7D713C;
  LODWORD(STACK[0xDD4]) = STACK[0x240];
  LODWORD(STACK[0xDD8]) = 447283886;
  LODWORD(STACK[0xDDC]) = -1620882378;
  LODWORD(STACK[0xDE0]) = 1956743481;
  LODWORD(STACK[0xDE4]) = 579497377;
  LODWORD(STACK[0xDE8]) = -1903671316;
  LODWORD(STACK[0xDEC]) = STACK[0xDE8];
  LODWORD(STACK[0xDF0]) = STACK[0xDE4];
  LODWORD(STACK[0xDF4]) = STACK[0xDE0];
  LODWORD(STACK[0xDF8]) = STACK[0xDDC];
  int v107 = STACK[0xDD8];
  LODWORD(STACK[0xDFC]) = STACK[0xDD8];
  int v108 = STACK[0xDD4];
  LODWORD(STACK[0xE00]) = STACK[0xDD4];
  LODWORD(STACK[0xE04]) = v108 - 1466967614;
  unint64_t v109 = (v107 - 447283886);
  STACK[0xE08] = v109;
  STACK[0x750] = STACK[0x13E0] + v109;
  JUMPOUT(0x188711200LL);
}

uint64_t sub_188711210()
{
  unsigned int v1 = (LODWORD(STACK[0x964]) - 1761632879) & 0xB354BFF5;
  LODWORD(STACK[0x544]) = 0;
  STACK[0x240] = *(void *)(v0 + 72);
  int v2 = (v1 - 868) | 0xA1;
  free((void *)STACK[0x240]);
  free((void *)STACK[0x568]);
  free((void *)STACK[0x548]);
  free((void *)STACK[0x530]);
  free((void *)STACK[0x520]);
  free((void *)STACK[0x538]);
  free((void *)STACK[0x550]);
  free((void *)STACK[0x528]);
  if (LODWORD(STACK[0x544]) == ((v1 - 868) & 0xFFFFFF5E)) {
    int v3 = 0;
  }
  else {
    int v3 = -42885;
  }
  unint64_t v4 = STACK[0x510];
  LODWORD(STACK[0x1630]) = (v3 ^ 0x1ADFDC9F) + ((2 * v3) & 0x35BEB03E) + (((v2 + 223) | 0x44) ^ 0xF7E6EEB3);
  STACK[0x510] = v4 - 32;
  LODWORD(v4) = (LODWORD(STACK[0x18AC]) ^ 0xC2483F5E) + 804507349 + (STACK[0x18B0] & 0x7FCFB3B6 ^ 0x7B4F8102);
  LODWORD(STACK[0x1634]) = v4;
  LOBYTE(STACK[0x163B]) = v4 < 0x6FDBA8B0;
  unint64_t v5 = (uint64_t (*)(void))(qword_18A26FDB0[(109 * ((_DWORD)v4 != 1876666544)) ^ v2] - 12LL);
  LODWORD(STACK[0x7E4]) = v2;
  LODWORD(STACK[0x7E8]) = 16042420;
  return v5();
}

uint64_t sub_188711394@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((13 * (LODWORD(STACK[0x1630]) != (((a1 ^ 0x1C7) + 361) ^ 0x12C6CD7A))) ^ a1))
                            - ((285 * (a1 ^ 0x1C7u)) ^ 0x35FLL)))();
}

uint64_t sub_1887113E0()
{
  STACK[0x308] = *(void *)(v2 + 632);
  int v3 = STACK[0x137C];
  LODWORD(STACK[0x310]) = STACK[0x137C];
  LODWORD(STACK[0x300]) = -1307522574;
  if (v3 == 1258455831) {
    int v4 = 31911768;
  }
  else {
    int v4 = LODWORD(STACK[0x1378]) + 360260126;
  }
  LODWORD(STACK[0x43C]) = v4;
  unint64_t v5 = sub_18872562C((v4 - 31911768), 0x32u, -502495127);
  STACK[0x290] = v5 + 0x2061722DFEAF01F1LL;
}

void sub_1887114AC()
{
}

void sub_1887114C8()
{
}

uint64_t sub_1887115E8()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((v0 - 1771229421) ^ (13 * (v2 == 0)))) - 12LL))();
}

void sub_188711638()
{
}

uint64_t sub_18871166C()
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((107 * (v2 != 0)) ^ (v0 - 1771229068))) - 4LL))();
}

uint64_t sub_1887116C4@<X0>(int a1@<W8>)
{
  int v2 = (a1 - 1155721467) | 0x210;
  int v3 = STACK[0x2B0];
  LODWORD(STACK[0x2B0]) += (v2 + 208) ^ 0x301;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((((v3 - 987433688) < 0xC) * (5 * (v2 ^ 0x2F1) - 804)) ^ v2)))();
}

uint64_t sub_188711718(uint64_t a1, int a2, uint64_t a3)
{
  int v7 = v5 - 1152;
  BOOL v8 = (((a2 + v5 + 0x80 + 15) ^ 0xDE) + *(_BYTE *)(*(void *)(v6 + 177) + (v4 ^ v3))) > 9u;
  return ((uint64_t (*)(void))(*(void *)(a3 + 8LL * ((v8 | (2 * v8)) ^ (a2 + v7 + 477))) - 8LL))();
}

void sub_188711730()
{
}

uint64_t sub_1887117D8(uint64_t a1, char a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3
                              + 8LL
                              * ((25 * ((v3 + a2 + ((v4 + 53) | 8) - 92 + 28) < 6u)) ^ (v4 | 0x200))))();
}

uint64_t sub_188711828@<X0>(int a1@<W1>, uint64_t a2@<X2>, int a3@<W8>)
{
  int v7 = v4 + v3 + 32;
  int v8 = 8 * (v5 ^ (v6 + 18));
  BOOL v10 = a3 + 2051303344 > v8 - 177 || v7 + 930423998 >= 0;
  int v11 = (uint64_t (*)(void))(*(void *)(a2 + 8LL * ((179 * v10) ^ (a1 + v5 + 640))) - 4LL);
  LODWORD(STACK[0xD2C]) = v8;
  return v11();
}

void sub_1887118C0()
{
  LODWORD(STACK[0x31C]) = -45002;
  STACK[0x220] = *(void *)(v0 + 177);
  JUMPOUT(0x18871192CLL);
}

uint64_t sub_188711A28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  uint64_t v63 = (v61 + 2071089072) & 0x848DAEEF;
  unint64_t v64 = ((unint64_t)&STACK[0x2F4] ^ 0x57FDFFEDFFD1FEACLL)
      - 0x57FDFFEDFFD1FEACLL
      + ((2LL * (void)&STACK[0x2F4]) & 0xAFFBFFDBFFA3FD58LL);
  STACK[0x218] = 2 * ((v64 % 0x25) & 0x1F) + ((v64 % 0x25) ^ v63 ^ 0x75F3DF3B51FA9E30LL) - 0x75F3DF3B51FA9ECFLL;
  STACK[0x240] = STACK[0x4B8];
  STACK[0x200] = *(void *)(v62 + 129) + *(void *)(v62 + 105) - 0x62FB7EA664E2A76ELL;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8LL * (int)((v63 + 996) ^ v63)) - ((v63 + 352) ^ 0x24BLL)))( 4024083341LL,  a2,  a3,  a4,  2130582064LL,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61);
}

uint64_t sub_188711BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
}

uint64_t sub_188711C28(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x228]) = a4;
  STACK[0x2208] = 0xB92C5F8D2024EF52LL;
  LODWORD(STACK[0x2F4]) = *(_DWORD *)(v5 + 3208) - 1823406259;
  uint64_t v9 = *(unsigned int *)(v6 + 3160);
  v7[12] = *(void *)(a3 + 8LL * (v4 + 1771230046));
  LODWORD(STACK[0x578]) = v4 + 1853189419;
  LODWORD(STACK[0x588]) = 0;
  v7[14] = 1074171621LL;
  LODWORD(STACK[0x58C]) = v4 + 1853189348;
  LODWORD(STACK[0x590]) = v4 + 1853189358;
  v7[17] = v9;
  *(_DWORD *)(v8 - 192) = 1431737413
                        * ((1814896354 - ((v8 - 200) | 0x6C2D1EE2) + ((v8 - 200) | 0x93D2E11D)) ^ 0x2D8C7E0F)
                        + 40706419
                        + v4;
  STACK[0x23C8] = (unint64_t)&STACK[0x570];
  sub_1886DF534(v8 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v8 - 188)] - 8LL))();
}

void sub_188711D2C()
{
}

uint64_t sub_188711ED8@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, uint64_t a3@<X7>, int a4@<W8>)
{
  int v8 = *(_DWORD *)(a2 + 4 * (((29 * (a4 ^ 0x341u)) ^ v7) + v5));
  unsigned int v9 = (v6 - (v8 & 0x7FFFFFFE ^ 0xA2EC1EE3 | v6) + (v8 & 0x7FFFFFFE ^ 0xA2EC1EE3 | 0x4E8060B5)) ^ 0xCC80E492;
  *(_DWORD *)(a2 + 4 * (v7 + v5) + 4172) = *(_DWORD *)(a2 + 4 * (v7 + v5) + 5760) ^ *((_DWORD *)&STACK[0x2208]
                                                                                    + ((v8 & 1) == 0)) ^ (((v9 | ~v4 & 0x80000000) - ((2 * v9) & 0xB2C0E0D0) + 1499492456) >> 1) ^ 0xC94D766;
  return (*(uint64_t (**)(void))(a1 + 8LL * ((1914 * (v5 + 1 == a3 + 3)) ^ a4)))();
}

uint64_t sub_188711FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v10 = (const float *)&dword_18C723614;
  int8x16_t v11 = (int8x16_t)vld1q_dup_f32(v10);
  v12.i64[0] = 0x8000000080000000LL;
  v12.i64[1] = 0x8000000080000000LL;
  v13.i64[0] = 0x1200000012LL;
  v13.i64[1] = 0x1200000012LL;
  v9.i64[0] = *(void *)&dword_18C723618;
  v9.i32[2] = dword_18C723620;
  int8x16_t v14 = vextq_s8(v11, v9, 0xCuLL);
  int8x16_t v15 = v9;
  v15.i32[3] = *(_DWORD *)(a7 + 4 * (((v7 - 433) | 0xCu) ^ 0x288LL));
  int32x4_t v16 = (int32x4_t)veorq_s8( vorrq_s8( vandq_s8( (int8x16_t)vaddq_s32( (int32x4_t)veorq_s8(vandq_s8(v14, v12), (int8x16_t)vdupq_n_s32(0xA10004C6)),  vdupq_n_s32(0xF1B7B4BB)),  v12),  vandq_s8(v15, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu))),  (int8x16_t)vdupq_n_s32(0x20EC9AC4u));
  int32x4_t v17 = (int32x4_t)veorq_s8(vandq_s8((int8x16_t)v16, (int8x16_t)vdupq_n_s32(0x64E1A336u)), vandq_s8(v15, v13));
  v18.i32[0] = *(_DWORD *)(v8 + 4LL * ((dword_18C723618 & 1) == 0));
  v18.i32[1] = *(_DWORD *)(v8 + 4 * (~dword_18C72361C & 1LL));
  v18.i32[2] = *(_DWORD *)(v8 + 4 * (~dword_18C723620 & 1LL));
  v18.i32[3] = *(_DWORD *)(v8 + 4 * (~v15.i32[3] & 1LL));
  *(int8x16_t *)&dword_18C723614 = veorq_s8( veorq_s8( veorq_s8((int8x16_t)xmmword_18C723288, v18),  (int8x16_t)vdupq_n_s32(0x52543EC0u)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32(v16, vaddq_s32(v17, v17)),  vdupq_n_s32(0xE4E1A324)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a6 + 8LL * v7) - 8LL))();
}

void sub_1887120FC()
{
}

uint64_t sub_188712108@<X0>(uint64_t a1@<X5>, _DWORD *a2@<X6>, unsigned int a3@<W8>)
{
  unsigned int v4 = ((((v3 + a3 - 105382841) | 0x648014A) ^ 0x166D2D4B) & ((a2[623] & 0x80000000) - 1109937363) | *a2 & 0x7FFFFFFE) ^ 0x20EC9AC4;
  a2[623] = a2[396] ^ *((_DWORD *)&STACK[0x2208] + ((*a2 & 1) == 0)) ^ ((v4 - ((2 * v4) & 0xB5A0B4FC) - 623879553) >> 1) ^ 0x4D4CC26D;
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (int)((1736
                                               * ((((LODWORD(STACK[0x2F4]) ^ a3) & STACK[0x2F4]) >> (__clz(LODWORD(STACK[0x2F4]) ^ a3 | 1) ^ 0x1F)) & 1)) ^ (a3 + 99)))
                            - 12LL))();
}

uint64_t sub_1887121F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(STACK[0x2F4]) = 0;
  return sub_1886F9168(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_188712200( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x450] = v69;
  STACK[0x4B8] = STACK[0x240];
  return a67(a69);
}

uint64_t sub_18871221C(void *a1)
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(914 * (LODWORD(STACK[0x3C4]) == 0)) ^ 0x1AB] - 4LL))();
}

uint64_t sub_1887122C4@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = 91 * (a1 ^ 0x30E);
  LODWORD(STACK[0x2280]) = STACK[0x3B4];
  STACK[0x2278] = a64;
  CFRelease(*(CFTypeRef *)(v66 + 3736));
  CFRelease(*(CFTypeRef *)(v66 + 3984));
  return (*(uint64_t (**)(void))(v64 + 8LL * ((349 * (v65 + ((v67 - 1429074487) & 0x552DF4BF) == -1771228682)) ^ v67)))();
}

uint64_t sub_188712360()
{
  LODWORD(STACK[0x2270]) = 438484904;
  io_registry_entry_t v1 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/product");
}

uint64_t sub_1887123F4@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  unsigned int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  LODWORD(STACK[0x1334]) = a2 + 206274657;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a2 + 206274657, @"product-id", v4, 0);
  *(void *)(v3 + 3624) = CFProperty;
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((63 * (CFProperty != 0LL)) ^ v2)) - 12LL))();
}

uint64_t sub_188712458()
{
  STACK[0x368] = STACK[0x1598];
  *(void *)(v2 + 624) = STACK[0x15A0] & 0x10 ^ 0xB7DF66BDFEF5ADB3LL;
  CFTypeID v4 = CFGetTypeID(*(CFTypeRef *)(v3 + 3624));
  unint64_t v5 = v4 ^ 0xE9FB3EBDFDBEAFB7LL;
  unint64_t v6 = (v4 << (((v0 - 59) | 0x36) ^ 0x76u)) & 0xD3F67D7BFB7D5F6ELL;
  CFTypeID TypeID = CFStringGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((224
                                          * (v5
                                           + (TypeID ^ 0x8C2CA842699E0426LL)
                                           + v6
                                           - ((2 * TypeID) & 0xE7A6AF7B2CC3F7B2LL) == 0x7627E700675CB3DDLL)) ^ v0))
                            - 12LL))();
}

uint64_t sub_18871253C()
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(v3 + 3624));
  unint64_t v5 = ((2 * Length) & 0xE7B36DBDDFEDF4BALL) + (Length ^ 0x73D9B6DEEFF6FA5DLL);
  *(void *)(v2 + 184) = v5;
  unint64_t v6 = malloc(v5 - 0x73D9B6DEEFF6FA5CLL);
  *(void *)(v2 + 192) = v6;
  STACK[0x2C8] = (unint64_t)v6;
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * ((852 * (v6 != 0LL)) ^ v0)) - 4LL))();
}

uint64_t sub_1887125D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t CString = CFStringGetCString(*(CFStringRef *)(v67 + 3624), *(char **)(v66 + 192), v64, SystemEncoding);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v65 + 8LL * ((1834 * ((((2 * CString) & 0x5E) + (CString ^ 0x2F)) != 47)) ^ (v63 + 467))) - ((v63 + 376) ^ 0x2E7LL)))( CString,  v65,  v70,  v71,  v72,  v73,  v74,  v75,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_188712674( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = (*(void *)(v65 + 184) + v64) / 2 - ((2 * ((*(void *)(v65 + 184) + v64) / 2)) & 0x3B8F85A6) - 1647852845;
  LODWORD(STACK[0x2B4]) = v67 ^ 0xECCE5C21;
  unint64_t v68 = sub_18872562C((v63 - 679478512) & 0xBEED2F4B ^ v67 ^ 0xBAAEF98, 0x32u, -183037251);
  *(void *)(v66 + 3904) = v68;
  return ((uint64_t (*)(unint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(421 * (v68 == 0)) ^ v63] - 8LL))( v68,  qword_18A26FDB0,  v69,  v70,  v71,  v72,  v73,  v74,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_188712720( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 8LL * (int)((((((v63 - 221) | 0x10D) - 1771230676) ^ 0x966D2DD6) * (v64 != 1896455922)) ^ (v63 - 221))))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

void sub_188712770(int a1@<W8>)
{
  int v2 = (a1 - 795017408) & 0x2F62FFAB;
  unsigned int v3 = v1 ^ 0x9DC7C2D3;
  if ((v1 ^ 0x9DC7C2D3) <= 1) {
    unsigned int v3 = 1;
  }
  LODWORD(STACK[0x160C]) = v3 + 754286844 + v2;
  JUMPOUT(0x1887127B4LL);
}

uint64_t sub_188712814@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8LL
                              * ((70
                                * ((*(char *)(*(void *)(v3 + 192)
                                                          + ((v2
                                                            - 2 * ((v2 + 638908912) & 0x68FE58DE ^ v2 & 8)
                                                            - 1894559034) ^ (a2 + 635) ^ 0xE8FE5C57))
                                                - 48) < 0xA)) ^ a2)))();
}

uint64_t sub_1887128B4(uint64_t a1, uint64_t a2)
{
  BOOL v6 = (*(char *)(*(void *)(v5 + 192) + (v2 ^ 0xE8FE58D7LL)) - 48) < 0xA;
  return ((uint64_t (*)(void))(*(void *)(a2 + 8LL * ((v6 | (8 * v6)) ^ (v3 + v4 + 609))) - 8LL))();
}

uint64_t sub_1887131B4@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  BOOL v6 = a2 + 762311043 >= 0 || v2 + 1695028313 > v3 + v4;
  int v7 = (uint64_t (*)(void))(*(void *)(a1 + 8LL * (((8 * v6) | (32 * v6)) ^ (v3 + v4 + 334))) - 8LL);
  LODWORD(STACK[0xC5C]) = v3 + v4 + 531;
  return v7();
}

void sub_1887132A0()
{
  LODWORD(STACK[0x4E0]) = -45002;
  STACK[0x220] = *(void *)(v0 + 192);
  JUMPOUT(0x188713314LL);
}

uint64_t sub_1887133DC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = v2 ^ 0x353u;
  unint64_t v8 = ((unint64_t)&STACK[0x3E8] ^ 0xB7FFB3FFFFFBFBEELL)
     + ((2LL * (void)&STACK[0x3E8]) & 0x6FFF67FFFFF7F7D8LL)
     + 0x48004C00000402C0LL
     + v7;
  STACK[0x218] = ((v8 % 0x25) ^ 0xCFDDF9FBB7DD5E59LL)
               + 0x302206044822A1B7LL
               + ((2 * (v8 % 0x25)) & 0x32LL);
  STACK[0x240] = STACK[0x3C8];
  STACK[0x200] = *(void *)(v6 + 624) + *(void *)(v5 + 105) + 0x48209942010A526DLL;
  LODWORD(STACK[0x228]) = v4 - 692;
}

void sub_188713528(char a1@<W8>)
{
  int v3 = STACK[0xC5C];
  LODWORD(STACK[0xC60]) = STACK[0xC5C];
  LODWORD(STACK[0xC64]) = v3 - 7;
  LODWORD(STACK[0xC68]) = (v3 - 2042101192) | 0x10252901;
  char v4 = ((((v3 + 56) | 1) ^ 0xF4) + 16 * a1) ^ 0x8F | (v1 - 111);
  unsigned int v5 = 83590351
     * (((*(_DWORD *)(v2 + 3904) + LODWORD(STACK[0x161C]) - 754287368) ^ *(_DWORD *)(qword_18C724710
                                                                                   + (int)(dword_18C724718 & 0xFD1BB2E4))) & 0x7FFFFFFF);
  unint64_t v6 = 83590351 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x5C3]) = byte_188744BB0[v6 >> 24] ^ byte_18873E440[v6 >> 24] ^ byte_18873F490[(v6 >> 24) + 1] ^ (v4 - ((2 * v4) & 0x40) + 32) ^ v6 ^ (-127 * BYTE3(v6)) ^ 0x20;
  JUMPOUT(0x1886F4BF8LL);
}

void sub_188713638(uint64_t a1@<X2>, int a2@<W8>)
{
  int v4 = STACK[0xD2C];
  LODWORD(STACK[0xD30]) = STACK[0xD2C];
  unsigned int v5 = (v4 + 868252430) & 0xCC3F8571;
  LODWORD(STACK[0xD34]) = v5;
  unsigned int v6 = (v4 + 71370650) | 0x922C2501;
  LODWORD(STACK[0xD38]) = v6;
  int v7 = ((a2 << (v5 ^ 0x34))
      - 2 * (((a2 << (v5 ^ 0x34)) + (v6 ^ 0x322B564B)) & 0x60E9D810 ^ (a2 << (v5 ^ 0x34)) & 0x10)
      + 87053063) ^ 0x60E9D807 | (v2 - 1217059650);
  uint64_t v8 = v3[512] + (LODWORD(STACK[0x1344]) - 1987180576);
  unsigned int v9 = 83590351 * ((v8 ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4))) & 0x7FFFFFFF);
  unint64_t v10 = 83590351 * (v9 ^ HIWORD(v9));
  LOBYTE(STACK[0x5C3]) = byte_18873E240[v10 >> 24] ^ byte_18873EB80[(v10 >> 24) + 1] ^ byte_18873F7A0[(v10 >> 24) + 1] ^ (v7 - ((2 * v7) & 0x94) + 74) ^ v10 ^ (47 * BYTE3(v10)) ^ 0x4A;
  v3[20] = *(void *)(a1 + 8LL * (v4 ^ 0x5C4)) - 4LL;
  v3[21] = v8;
  JUMPOUT(0x188709120LL);
}

uint64_t sub_1887137A0()
{
  int v1 = v0 + 494;
  unint64_t v2 = sub_188725908(STACK[0x328] - 0xE550F9B8A5EBC69LL);
  return ((uint64_t (*)(unint64_t))(qword_18A26FDB0[(150 * (STACK[0x398] != 0x2061722DFEAF01F1LL)) ^ v1]
                                                   - ((3 * (v1 ^ 0x26Fu)) ^ 0x39BLL)))(v2);
}

uint64_t sub_1887137C8()
{
  unint64_t v0 = sub_188725908(STACK[0x290] - 0x2061722DFEAF01F1LL);
  return ((uint64_t (*)(unint64_t))(qword_18A26FDB0[(120 * (STACK[0x308] == 0x5A72C1CEA1245FC3LL)) ^ 0x220]
                                                   - 12LL))(v0);
}

uint64_t sub_1887137E0()
{
  int v4 = v0 - v1 - 1147;
  sub_188725908(*(void *)(v3 + 3672));
  return ((uint64_t (*)(void))(qword_18A26FDB0[(2 * (((*(void *)(v2 + 64) == 0LL) ^ (v4 + 126)) & 1)) & 0xDF | (32 * (((*(void *)(v2 + 64) == 0LL) ^ (v4 + 1771230078)) & 1)) | (v4 + 1771230094)]
                            - 8LL))();
}

uint64_t sub_18871381C()
{
  uint64_t v2 = NAAP();
  *(void *)(v1 + 3456) = v2;
  return ((uint64_t (*)(void))qword_18A26FDB0[(41 * (v2 != 0LL)) ^ (v0 | 0x100)])();
}

uint64_t sub_188713860(uint64_t a1, int a2, uint64_t a3)
{
  unsigned int v5 = (((v3 - 916134320) & 0x369B1770) + 71567288) | 0x92292443;
  LODWORD(STACK[0x2340]) = 1896455922;
  STACK[0x2338] = 0LL;
  int v6 = a2 + v5 + 980;
  int v7 = a2 + v5 + 194;
  unint64_t v8 = 591644117 * ((v4 - 200) ^ 0xE41B20C99B054A47LL);
  STACK[0x23C8] = *(void *)(a3 + 8LL * v7) - v8;
  *(_DWORD *)(v4 - 176) = -922504226 - v8 + v5;
  STACK[0x23D8] = (unint64_t)&STACK[0x3336B5A2487B6C94];
  uint64_t v9 = sub_18871DC68(v4 - 200);
  return ((uint64_t (*)(uint64_t))qword_18A26FDB0[v7 ^ 0x379 ^ (1910 * (*(_DWORD *)(v4 - 192) == (v6 ^ 0x3D3)))])(v9);
}

uint64_t sub_1887138AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8LL * ((1803 * (*(_BYTE *)(*(void *)(v5 + 3456) + v4) != 48)) ^ v3)))();
}

uint64_t sub_1887138F4(uint64_t a1, int a2)
{
  uint64_t v5 = (v2 - a2 - 337);
  size_t v6 = strlen(*(const char **)(v4 + 3456));
  unint64_t v7 = (v6 ^ 0x77E9FD5DFE45FC3FLL) - 0x77E9FD5DE87D7537LL + ((v5 ^ 0xEFD3FABB6AE6D535LL) & (2 * v6));
  unint64_t v8 = (((v2 + 338) | 0x104u) ^ (v3 - 1238322072) ^ 0x7EDF8877CE7AF059LL)
     + ((2LL * (v3 - 1238322072)) & 0xFDBF10EF9CF5E7FELL)
     - 0x7EDF8877B8B26CF7LL;
  BOOL v9 = v7 < 0x15C88708;
  BOOL v10 = v7 > v8;
  if (v9 != v8 < 0x15C88708) {
    BOOL v10 = v9;
  }
  return ((uint64_t (*)(void))(qword_18A26FDB0[(1324 * v10) ^ v2] - 8LL))();
}

uint64_t sub_188713A04()
{
  int v3 = strlen(*(const char **)(v2 + 3456));
  *(void *)(v1 + 185) = &STACK[0x2338];
  *(void *)(v1 + 193) = &STACK[0x2340];
  unsigned int v4 = (((v0 + 109) | 0x200)
      + ((v0 - 1771230213) ^ 0x3105B978)
      + ((2 * v3) & 0xEC99EBFE)
      + (v3 ^ 0xF64CF5FF)
      + (~(2 * (((2 * v3) & 0xEC99EBFE) + (v3 ^ 0xF64CF5FF)) + 325456898) | 0xC494E423)) >> 1;
  LODWORD(STACK[0x15F4]) = v4 ^ 0x3FD35805;
  unint64_t v5 = sub_18872562C(v4 ^ 0x4EDAC6F7, 0x32u, 1643813027);
  *(void *)(v1 + 209) = v5;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(1008 * (v5 != 0)) ^ v0] - 8LL))();
}

uint64_t sub_188713AF0(uint64_t a1, int a2)
{
  int v3 = a2 + v2 + 220;
  free((void *)STACK[0x2E8]);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(319 * (LODWORD(STACK[0x260]) == (v3 ^ 0xDB))) ^ v3] - 8LL))();
}

uint64_t sub_188713B0C@<X0>(uint64_t a1@<X6>, int a2@<W8>)
{
  int v7 = LODWORD(STACK[0x2C0])++;
  *(_DWORD *)(v3 + 3208) = v7 + 1823406260;
  uint64_t v8 = (*(_DWORD *)(v4 + 3160) - 163121130);
  v5[12] = *(void *)(a1 + 8LL * (a2 + 1771230042));
  LODWORD(STACK[0x578]) = a2 + 1102782159;
  LODWORD(STACK[0x588]) = 0;
  LODWORD(STACK[0x58C]) = (a2 + 1102782159) ^ 0x6F;
  LODWORD(STACK[0x590]) = a2 + 1102782355;
  v5[14] = v8;
  v5[17] = 911050491LL;
  *(_DWORD *)(v6 - 192) = 1431737413 * ((v6 - 502115798 - 2 * ((v6 - 200) & 0xE21252F2)) ^ 0x5C4CCDE0) + 40706419 + a2;
  *(void *)(v2 + 448) = &STACK[0x570];
  sub_1886DF534(v6 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[*(int *)(v6 - 188)] - 8LL))();
}

uint64_t sub_188713BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10 = STACK[0x228];
  if (v6 >= v7) {
    int v11 = *(_DWORD *)(v8 + 3160) + 1;
  }
  else {
    int v11 = 1074171621;
  }
  *(_DWORD *)(v8 + 3160) = v11;
  unsigned int v12 = ((((v5 ^ (v5 >> 11)) << 7) ^ 0x7C43AB00)
       + 353966317
       + ~((2 * (((v5 ^ (v5 >> 11)) << 7) ^ 0x7C43AB00)) & 0x2A323100)) & 0x9D2C5680 ^ v5 ^ (v5 >> 11);
  unsigned int v13 = ((((v12 << 15) ^ 0x4BEB0000) - ((2 * ((v12 << 15) ^ 0x4BEB0000)) & 0xF9CD0000) + 2095485134) & 0xEFC60000 ^ 0xD34AC635)
      - 1;
  unsigned int v14 = ((v13 & 0x6AC24624 ^ 0x42430041) + (v13 ^ 0x39847624) - ((v13 ^ 0x39847624) & 0x6ACAB000)) ^ v12;
  int v15 = ((v14 ^ (v14 >> 18) ^ 0xEF) + (~(2 * (v14 ^ (v14 >> 18) ^ 0xEF)) | 0x5D) - 46) ^ 0x63;
  *(_BYTE *)(*(void *)(v9 + 592) + (v10 - 2048739865)) = v15;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5
                                                              + 8LL
                                                              * ((1879 * (v10 - (v15 != 0) == 2048739864)) ^ 0x3DE)))( 2048739864LL,  1590628619LL,  512696004LL);
}

uint64_t sub_188713D44()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((21 * (((v1 ^ (v3 + 54)) ^ (v0 + 8 == ((v1 - 546) ^ 0x1A9B553B))) & 1)) ^ v1)))();
}

uint64_t sub_188713E0C@<X0>(int a1@<W8>)
{
  STACK[0x368] = 0LL;
  STACK[0x410] = v7;
  unint64_t v14 = qword_18C724710;
  if (qword_18C724710) {
    JUMPOUT(0x188714998LL);
  }
  int v15 = a1 - 1771230301;
  qword_18C724710 = v8;
  dword_18C724718 = 255;
  do
  {
    *(_DWORD *)(v8 + 4 * v14) |= ~*(_DWORD *)(v8 + 4 * (*(_DWORD *)(v8 + 4 * v14) & 0x3ELL)) << 16;
    BOOL v16 = v14 >= 0x3B;
    v14 += 4LL;
  }

  while (!v16);
  byte_18C724508 = 1;
  int v1 = 2 * (v15 ^ (v11 - 111));
  int v2 = v9 + v15 + 201;
  uint64_t v3 = *(void *)(v10 + 8LL * v2);
  unint64_t v4 = 591644117
     * ((((v13 - 200) | 0xB2C8AEF4238A5EE6LL) - (v13 - 200) + ((v13 - 200) & 0x4D37510BDC75A118LL)) ^ 0x56D38E3DB88F14A1LL);
  *(_DWORD *)(v13 - 176) = v15 - v4 - 922504226;
  *(void *)(v12 + 464) = aXUs;
  *(void *)(v12 + 448) = v3 - v4;
  uint64_t v5 = sub_18871DC68(v13 - 200);
  return ((uint64_t (*)(uint64_t))qword_18A26FDB0[(468 * (*(_DWORD *)(v13 - 192) == (v1 ^ 0x32E))) ^ (v2 | 0x232)])(v5);
}

uint64_t sub_188713E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * (int)(((((v5 - 2072950605) & 0xE5218AE7) - 224)
                                               * (**(void **)(v6 + 9) == 0LL)) ^ (v5 + 1771230087)))
                            - 12LL))();
}

uint64_t sub_188713F00(unint64_t a1)
{
  unint64_t v4 = sub_188725908(a1);
  STACK[0x368] = *(void *)(v3 + 504);
}

uint64_t sub_188713F60@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
}

uint64_t sub_188713FA8()
{
  unint64_t v3 = sub_18872562C(25LL, 0x32u, -50786942);
  *(void *)(v2 + 3672) = v3;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(1606 * (((v0 ^ (v1 - 5)) ^ (v3 == 0)) & 1)) ^ v0] - 12LL))();
}

void sub_188714004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v7 + 320) = &STACK[0x2260];
  LODWORD(STACK[0x11E8]) = v6;
  LODWORD(STACK[0x11EC]) = 38914673;
  int v9 = STACK[0x11EC];
  LODWORD(STACK[0x11F0]) = STACK[0x11EC];
  int v10 = STACK[0x11E8];
  LODWORD(STACK[0x11F4]) = STACK[0x11E8];
  int v11 = v5 + v10;
  LODWORD(STACK[0x11F8]) = (v11 + 1123) | 0x18;
  LODWORD(STACK[0x11FC]) = v11 + 1155;
  uint64_t v12 = **(void **)(v7 + 320);
  uint64_t v13 = v9 - 38914673;
  v8[414] = v13;
  uint64_t v14 = v12 + v13;
  v8[415] = v14;
  v8[72] = v14;
  v8[70] = *(void *)(a5 + 8LL * (v11 + 1282));
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_188714094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8LL * ((v5 + v6 + 469) ^ (1370 * (v7 != 0)))))();
}

uint64_t sub_1887140C4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8LL * ((366 * ((v2 ^ ((a1 ^ 0x61) + 32)) & 1)) ^ a1)))();
}

uint64_t sub_188714210()
{
  int v5 = (char *)STACK[0x1590];
  *(_DWORD *)int v5 = 130;
  v5 += 4;
  *(void *)(v4 + 3552) = v5;
  sub_1887259EC(*(char **)(v3 + 592), v5, 0x400uLL);
  STACK[0x338] = 2052LL;
  BOOL v6 = IOConnectCallStructMethod( v1 - 2011963979,  0x21u,  (const void *)STACK[0x1590],  0x804uLL,  (void *)STACK[0x1590],  &STACK[0x338]) == ((v0 - 892877323) & 0x3538376D ^ 0xFFFFFFB4) + ((v0 - 1966788531) & 0x753ACD5F);
  return ((uint64_t (*)(void))(*(void *)(v2 + 8LL * (v6 | v0)) - 12LL))();
}

void sub_1887142BC()
{
  STACK[0x368] = STACK[0x1588];
  *(void *)(v1 + 312) = &STACK[0x22B0];
  LODWORD(STACK[0x22B0]) = 1896454898;
  LODWORD(STACK[0x644]) = v0 ^ 0x1F5;
  *(void *)(v2 + 312) = 0x7F4E408B0F80FFB1LL;
  *(void *)(v2 + 320) = 0x7354EA4EF5C728C6LL;
  *(void *)(v2 + 328) = 0x1674F372F8D6A97ELL;
  uint64_t v4 = *(void *)(v2 + 320);
  uint64_t v3 = *(void *)(v2 + 328);
  uint64_t v5 = *(void *)(v2 + 312);
  *(void *)(v2 + 336) = v3;
  *(void *)(v2 + 344) = v4;
  *(void *)(v2 + 352) = v5;
  LODWORD(v5) = STACK[0x644];
  LODWORD(STACK[0x67C]) = STACK[0x644];
  LOBYTE(v3) = *(_BYTE *)(v3 + *(void *)(v1 + 592) - 0x1674F372F8D6A97ELL);
  unsigned int v6 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ (v4 + *(_DWORD *)(v1 + 608) + 171497274)) & 0x7FFFFFFF);
  unint64_t v7 = (v6 ^ HIWORD(v6)) * (((_DWORD)v5 + 221) ^ 0x4FB7D02);
  char v8 = byte_188744BB0[v7 >> 24];
  LODWORD(STACK[0x680]) = v5 + 221;
  LOBYTE(STACK[0x5C3]) = v8 ^ v3 ^ byte_18873E440[v7 >> 24] ^ byte_18873F490[(v7 >> 24) + 1] ^ v7 ^ (-127 * BYTE3(v7));
  JUMPOUT(0x188714460LL);
}

uint64_t sub_18871447C@<X0>(unint64_t a1@<X0>, int a2@<W8>)
{
  int v5 = a2 - 1771230621;
  sub_188725908(a1);
  **(void **)(v4 + 3568) = 0LL;
  **(_DWORD **)(v4 + 3560) = v2;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((**(void **)(v3 + 688) == 0LL) * (((v5 + 985164404) & 0x2EDA6AF4) - 184)) ^ (v5 + 1771230635)]
                            - 4LL))();
}

void sub_1887144F8(unint64_t a1)
{
  **(void **)(v1 + 688) = 0LL;
  **(_DWORD **)(v1 + 680) = 1896455922;
  JUMPOUT(0x18871452CLL);
}

void sub_18871458C(unint64_t a1)
{
  STACK[0x22F0] = 0LL;
  LODWORD(STACK[0x22F8]) = 1896455922;
  JUMPOUT(0x1887145B8LL);
}

void sub_1887145F4(unint64_t a1)
{
  STACK[0x22D8] = 0LL;
  LODWORD(STACK[0x22E0]) = 1896455922;
  JUMPOUT(0x188714634LL);
}

uint64_t sub_188714678@<X0>(unint64_t a1@<X0>, int a2@<W8>)
{
  int v5 = (((a2 + 32) | 0x211) - 1145020610) & 0x443F9FDF;
  sub_188725908(a1);
  **(void **)(v4 + 3856) = 0LL;
  **(_DWORD **)(v3 + 312) = 1896455922;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((**(void **)(v2 + 233) != 0LL) * (v5 + 290)) ^ v5] - 8LL))();
}

uint64_t sub_1887146FC(unint64_t a1)
{
  **(void **)(v4 + 233) = 0LL;
  **(_DWORD **)(v5 + 2816) = v3;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((*(void *)(v2 + 136) != 0LL) * ((v1 + 1089967592) & 0xBF0869DE ^ 0x4AC)) ^ (v1 + 1089967592) & 0xBF0869DE]
                            - 8LL))();
}

void sub_188714778(unint64_t a1)
{
  *(void *)(v1 + 136) = 0LL;
  LODWORD(STACK[0x2298]) = v2;
  JUMPOUT(0x18871479CLL);
}

void sub_1887147E8(unint64_t a1)
{
  *(void *)(v1 + 112) = 0LL;
  LODWORD(STACK[0x2280]) = v2;
  JUMPOUT(0x18871481CLL);
}

void sub_188714864(unint64_t a1)
{
  *(void *)(v1 + 88) = 0LL;
  **(_DWORD **)(v2 + 72) = 1896455922;
  JUMPOUT(0x1887148A4LL);
}

void sub_1887148DC(unint64_t a1)
{
  *(void *)(v1 + 64) = 0LL;
  LODWORD(STACK[0x2250]) = 1896455922;
  JUMPOUT(0x188714904LL);
}

void sub_1887149EC()
{
  LODWORD(STACK[0x2340]) = v0;
  STACK[0x2338] = 0LL;
  JUMPOUT(0x188714A18LL);
}

void sub_188714AA0(uint64_t a1, unint64_t a2)
{
  STACK[0x240] = *(void *)(v3 + 3952) + *(void *)(v3 + 3960);
  LODWORD(STACK[0x230]) = v2 + 706143559;
  LODWORD(STACK[0x228]) = v2 ^ 0xC85A7A7A;
  STACK[0x238] = STACK[0x3D8];
  STACK[0x218] = a2;
  *(int32x4_t *)&STACK[0x200] = vdupq_n_s32(0x7FFFFFFEu);
  JUMPOUT(0x1886F2124LL);
}

uint64_t sub_188714D04()
{
  LODWORD(STACK[0x166C]) = -45000;
  *(void *)(v1 + 72) = &STACK[0x2268];
  return ((uint64_t (*)(void))(qword_18A26FDB0[(35
                                             * (SLODWORD(STACK[0x2268]) < (int)(((v0 - 1073052801) ^ 0xC00A80EA)
                                                                              + 1896454803))) ^ (v0 - 1073052801) ^ 0xC00A80EA]
                            - 8LL))();
}

uint64_t sub_188714D2C()
{
  v2[460] = *(void *)(v1 + 184);
  unsigned int v3 = ((LODWORD(STACK[0x320]) - 744475498) & 0xFFFFFFF0 ^ 0xEC6DCD5F)
     + ((2 * (LODWORD(STACK[0x320]) - 744475498)) & 0xD8DB9AA0);
  LODWORD(STACK[0x1378]) = v3;
  LODWORD(STACK[0x137C]) = v3 + 1586804168;
  unint64_t v4 = sub_18872562C(v3 + ((11 * (v0 ^ 0x216) + 667227809) & 0xD83AE7A4 ^ 0x13923311), 0x32u, 948295290);
  v2[462] = v4;
  v2[463] = v4 + 0xE550F9B8A5EBC69LL;
  *(void *)(v1 + 72) = v4 + 0xE550F9B8A5EBC69LL;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(1565 * (v4 != 0)) ^ v0] - 12LL))();
}

uint64_t sub_188714E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = 6 * (v5 ^ 0x1F3u);
  LODWORD(STACK[0x1440]) = v6 + 520953716;
  *(_BYTE *)(v7 + 3895) = (v6 + 520953716) < 0x4B6CEADE;
  uint64_t v9 = *(void *)(a5 + 8LL * (v5 + ((v6 != 744475498) << 6)));
  LODWORD(STACK[0xB10]) = v8;
  LODWORD(STACK[0xB14]) = 1027456193;
  *(void *)(v7 + 1544) = 0LL;
  LODWORD(STACK[0x110C]) = v5 ^ 0x40;
  LODWORD(STACK[0x1110]) = 1027456193;
  return ((uint64_t (*)(void))(v9 - (v8 ^ 0x1F6)))();
}

void sub_188714E98()
{
  uint64_t v2 = LODWORD(STACK[0x1110]);
  LODWORD(STACK[0x1114]) = v2;
  int v3 = STACK[0x110C];
  LODWORD(STACK[0x1118]) = STACK[0x110C];
  LODWORD(STACK[0x111C]) = v3 - 2093857937;
  unint64_t v4 = v2 - 1027456193 + ((unint64_t)(v2 < v0) << 32);
  v1[386] = v4;
  unint64_t v5 = v1[460] + v4;
  v1[387] = v5;
  v1[72] = v5 - 0x2061722DFEAF01F1LL;
  JUMPOUT(0x188714F00LL);
}

void sub_188715000(unint64_t a1)
{
}

uint64_t sub_18871509C@<X0>(uint64_t a1@<X1>, int a2@<W3>, int a3@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1
                                        + 8LL
                                        * (((v3 + 8 == a2) * ((a3 - 175 - v4 - 339) ^ LODWORD(STACK[0x228]) ^ a3)) ^ (a3 - 175)))
                            - 4LL))();
}

uint64_t sub_1887150D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x4C8] = v69;
  STACK[0x3C8] = STACK[0x240];
  return a67(a69);
}

uint64_t sub_188715100(void *a1)
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(1990 * (LODWORD(STACK[0x404]) == 0)) ^ 0x31D] - 8LL))();
}

uint64_t sub_188715190( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x2298]) = STACK[0x2B4];
  *(void *)(v72 + 136) = a71;
  STACK[0x368] = STACK[0x1588];
  CFRelease(*(CFTypeRef *)(v75 + 3624));
  uint64_t v76 = IOObjectRelease(STACK[0x1334]);
  return ((uint64_t (*)(uint64_t))(*(void *)(v73
                                                      + 8LL
}

uint64_t sub_188715240()
{
  LODWORD(STACK[0x2288]) = 438484905;
  v1[74] = malloc(0x400uLL);
  v1[75] = malloc(0x401uLL);
  v1[76] = sub_18872562C(1024LL, 0x32u, -922922145);
  unint64_t v2 = sub_18872562C(1025LL, 0x32u, 1999705887);
  v1[77] = v2;
  if (v1[74]) {
    BOOL v3 = v1[75] == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  int v6 = !v3 && v1[76] != 0LL && v2 != 0;
  return ((uint64_t (*)(void))qword_18A26FDB0[(v6 * ((v0 + 533) ^ 0x3EC)) ^ v0])();
}

uint64_t sub_1887152DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = 13 * (v5 ^ 0x34Du);
  unint64_t v7 = ((unint64_t)&STACK[0x2C0] ^ 0x7BE7BF9FFD7FDFFBLL)
     - 0x7BE7BF9FFD7FDFFBLL
     + ((2LL * (void)&STACK[0x2C0]) & 0xF7CF7F3FFAFFBFF0LL);
  STACK[0x220] = ((2 * (v7 % 0x25)) & 0x76LL)
               + 0x4A80D00A45000455LL
               + ((v7 % 0x25) ^ 0xB57F2FF5BAFFFB34LL ^ v6);
  STACK[0x238] = STACK[0x4A0];
  unint64_t v8 = STACK[0x1590];
  STACK[0x218] = STACK[0x1590];
  STACK[0x200] = v8 + 16;
  return (*(uint64_t (**)(void))(a5 + 8LL * (int)((v6 + 1771230723 + v6 - 1771230020 - 45) ^ v6)))();
}

uint64_t sub_1887154C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8LL * (((v5 + 8 == a3) * (v7 + v6 + 847 + v8 + v6 - 143 - 45)) ^ v6)))();
}

uint64_t sub_1887154F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  LODWORD(STACK[0x228]) = a4;
  *(void *)(v6 + 8) = 0x5C6DE4D5C565540ALL;
  LODWORD(STACK[0x2C0]) = *(_DWORD *)(v7 + 3208) - 1823406259;
  uint64_t v11 = *(unsigned int *)(v8 + 3160);
  v9[12] = *(void *)(a5 + 8LL * (v5 + 1771230046));
  LODWORD(STACK[0x578]) = v5 - 745822838;
  LODWORD(STACK[0x588]) = 0;
  v9[14] = 1074171621LL;
  LODWORD(STACK[0x58C]) = v5 - 745822875;
  LODWORD(STACK[0x590]) = v5 - 745822817;
  v9[17] = v11;
  *(void *)(v6 + 448) = &STACK[0x570];
  *(_DWORD *)(v10 - 192) = 1431737413
                         * ((((2 * ((v10 - 200) ^ 0x1AE58C55)) | 0x11D256D4) - ((v10 - 200) ^ 0x1AE58C55) - 149498730) ^ 0xAC52382D)
                         + 40706419
                         + v5;
  sub_1886DF534(v10 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[*(int *)(v10 - 188)])();
}

void sub_1887155E4()
{
}

uint64_t sub_188715784( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v12 = ~v9 & 0x80000000;
  uint64_t v13 = a8 + 4 * (v10 + v11);
  int v14 = *(_DWORD *)(v13 + 1156);
  unsigned int v15 = (a4 - (v14 & 0x7FFFFFFE ^ 0x583E2076 | a4) + (v14 & 0x7FFFFFFE ^ 0x583E2076 | 0x9F99DCFE)) ^ 0xE74B664C;
  *(_DWORD *)(a8 + 4 * (v10 + v11 + ((v8 - 457) | 0x100u))) = *(_DWORD *)(v13 + 2740) ^ *((_DWORD *)&STACK[0x2210]
                                                                                        + ((v14 & 1) == 0)) ^ (((v15 | v12) - ((2 * v15) & 0x678FA692) - 1278749879) >> 1) ^ 0x9C86BDAE;
  return ((uint64_t (*)(void))(*(void *)(a7 + 8LL * ((1535 * (v10 + 1 == a3 + 3)) ^ v8)) - 12LL))();
}

uint64_t sub_188715850@<X0>(uint64_t a1@<X6>, uint64_t a2@<X7>, int a3@<W8>)
{
  int v5 = (const float *)(a2 + 908);
  int8x16_t v6 = (int8x16_t)vld1q_dup_f32(v5);
  uint64_t v7 = 4LL * (a3 + 362) - 1680;
  v8.i64[0] = 0x8000000080000000LL;
  v8.i64[1] = 0x8000000080000000LL;
  v4.i64[0] = *(void *)(a2 + 912);
  v4.i32[2] = *(_DWORD *)(a2 + v7);
  int8x16_t v9 = vextq_s8(v6, v4, 0xCuLL);
  int8x16_t v10 = v4;
  v10.i32[3] = *(_DWORD *)(a2 + 924);
  int8x16_t v11 = vorrq_s8(vandq_s8(v9, v8), (int8x16_t)vdupq_n_s32(0x653447EFu));
  int32x4_t v12 = (int32x4_t)veorq_s8(vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x8CAC9A45));
  int32x4_t v13 = (int32x4_t)veorq_s8( (int8x16_t)vsubq_s32( vaddq_s32( v12,  (int32x4_t)veorq_s8( vandq_s8(v10, (int8x16_t)vdupq_n_s32(0x52A8B61Au)),  (int8x16_t)vdupq_n_s32(0x5200241Au))),  (int32x4_t)vandq_s8((int8x16_t)v12, (int8x16_t)vdupq_n_s32(0x52A8B61Bu))),  (int8x16_t)vdupq_n_s32(0xFEE8B69A));
  v14.i32[0] = *(_DWORD *)(v3 + 4LL * ((*(_DWORD *)(a2 + 912) & 1) == 0));
  v14.i32[1] = *(_DWORD *)(v3 + 4LL * ((*(_DWORD *)(a2 + 916) & 1) == 0));
  v14.i32[2] = *(_DWORD *)(v3 + 4 * (~*(_DWORD *)(a2 + v7) & 1LL));
  v14.i32[3] = *(_DWORD *)(v3 + 4 * (~v10.i32[3] & 1LL));
  *(int8x16_t *)(a2 + 908) = veorq_s8( veorq_s8(veorq_s8(*(int8x16_t *)a2, v14), (int8x16_t)vdupq_n_s32(0xB82F930A)),  (int8x16_t)vshrq_n_u32( (uint32x4_t)vaddq_s32( vsubq_s32( (int32x4_t)vorrq_s8( (int8x16_t)v13,  veorq_s8( v11,  (int8x16_t)vdupq_n_s32(0xE53447EF))),  (int32x4_t)vandq_s8( (int8x16_t)vaddq_s32(v13, v13),  (int8x16_t)vdupq_n_s32(0xF52B1C02))),  vdupq_n_s32(0xFA958E01)),  1uLL));
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * a3) - 8LL))();
}

void sub_1887159D0()
{
}

uint64_t sub_1887159DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _DWORD *a8)
{
  unsigned int v9 = ((v8 - 2113140031) | 0x14612000) ^ 0x12684BC8 ^ ((*a8 & 0x7FFFFFFE ^ 0xEEC8F6CB) - 1);
  unsigned int v10 = ((((2 * v9) & 0xD8DB6A62) - v9 + 328354510) | (((a6 + v8 - 376254421) & a8[623]) - 1988445198) & 0x80000000) ^ 0x59B34043;
  a8[623] = a8[396] ^ *((_DWORD *)&STACK[0x2210] + ((*a8 & 1) == 0)) ^ ((v10 - ((2 * v10) & 0x7CF7EA48) - 1099172572) >> 1) ^ 0x9A58AE98;
  return ((uint64_t (*)(void))(*(void *)(a7 + 8LL * ((35 * (LODWORD(STACK[0x2C0]) > 0x26F)) ^ v8)) - 4LL))();
}

uint64_t sub_188715AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  LODWORD(STACK[0x2C0]) = 0;
  return sub_188713B0C(a7, v7);
}

uint64_t sub_188715AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  STACK[0x4C0] = v5;
  STACK[0x4A0] = STACK[0x238];
  *(void *)(v8 + 3728) = *(void *)(v7 + 600) + 1LL;
}

uint64_t sub_188715B68()
{
  int v2 = MEMORY[0x1895CA8E8](0LL, &STACK[0x2FC]);
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((366
                                          * ((((93 * (v0 ^ 0x29A)) ^ 0xEBB5FCFE) & (2 * v2)) + (v2 ^ 0xF5DAFFAE) == -170197074)) | v0))
                            - 4LL))();
}

uint64_t sub_188715BC4()
{
  BOOL v1 = IOServiceMatching((const char *)&STACK[0x1951]) != 0LL;
  return ((uint64_t (*)(void))(qword_18A26FDB0[(v1 * (((2 * v0) ^ 0x682) + 612)) ^ v0] - 4LL))();
}

uint64_t sub_188715C58(const __CFDictionary *a1)
{
  kern_return_t MatchingServices;
  MatchingServices = IOServiceGetMatchingServices(STACK[0x2FC], a1, (io_iterator_t *)&STACK[0x4D8]);
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * ((482
                                          * (((MatchingServices << (v1 + 113)) & (((v1 - 368) | 0x282) ^ 0x77FFFC26))
                                           + (MatchingServices ^ 0x3BFFFFC2) == 1006632898)) ^ v1))
                            - 4LL))();
}

uint64_t sub_188715CBC()
{
  io_object_t v2 = IOIteratorNext(STACK[0x4D8]);
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((26
                                          * (((v2 << ((v0 + 90) ^ 0xEB)) & 0x987FFF6C) + ((v0 - 16) ^ v2 ^ 0x4C3FFD36) == 1279262646)) ^ (v0 + 90)))
                            - 12LL))();
}

uint64_t sub_188715D34@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
}

uint64_t sub_188715D90()
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(v0 + 1771230800) ^ (42 * (v1 == 0))] - 12LL))();
}

uint64_t sub_188715DD8@<X0>(int a1@<W8>)
{
  kern_return_t v2;
  uint64_t v2 = IOServiceOpen(a1 - 1279262646, *MEMORY[0x1895FBBE0], 0, (io_connect_t *)&STACK[0x394]);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(380
                                             * (((v2 << (((v1 - 21) & 0xDF) - 74)) & 0x75EEC5FE) + (v2 ^ 0xBAF762FF) == -1158192385)) | v1]
                            - 12LL))();
}

uint64_t sub_188715E70()
{
  *(_DWORD *)(v0 + 3212) = ((2 * LODWORD(STACK[0x394])) & 0xFFFF55F6)
                         - 135497904
                         + (LODWORD(STACK[0x394]) ^ 0xE99287B0 ^ (v1 - 679658133) & 0xBEEFED5F);
  uint64_t v3 = IOObjectRelease(v2);
  return sub_188716000(v3);
}

uint64_t sub_188715EBC@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  return ((uint64_t (*)(void))(*(void *)(a1 + 8LL * ((a2 + 1771230800) ^ (42 * (v2 == 0)))) - 12LL))();
}

uint64_t sub_188715EF8()
{
  return ((uint64_t (*)(void))qword_18A26FDB0[(v0 + 1771230345) ^ (1370 * (v1 != 0))])();
}

uint64_t sub_188715F3C()
{
  unint64_t v1 = sub_188725908(*(void *)(v0 + 608));
  return sub_188715F54(v1, v2, v3, v4, (uint64_t)qword_18A26FDB0);
}

uint64_t sub_188715F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * (int)(((((v6 - 1531788734) ^ 0x3B1FEE9B)
                                                + ((v6 - 1531788734) & 0xFFFFF5FF)
                                                - 991946330)
                                               * (v7 == 0)) | (v5 + v6 + 263)))
                            - 8LL))();
}

void sub_188715FAC()
{
}

uint64_t sub_188716000()
{
  uint64_t v4 = IOObjectRelease(STACK[0x4D8]);
  return ((uint64_t (*)(uint64_t))(*(void *)(v3
                                                      + 8LL
                                                      * (int)(((*(_DWORD *)(v1 + 3212) != v0)
                                                             * (5 * ((v2 - 1994469717) & 0xE07407AB ^ 0x3E1) - 322)) | (v2 - 1994469717) & 0xE07407AB))
                                          - 12LL))(v4);
}

void sub_188716054()
{
}

void sub_18871609C()
{
  unsigned int v1 = 83590351 * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0x73FD9180)) ^ LODWORD(STACK[0x918])) & 0x7FFFFFFF);
  LOBYTE(STACK[0x5C3]) = byte_188742410[(LODWORD(STACK[0x90C]) - 436) & *(void *)(v0 + 1024) | (16 * ((83590351 * (v1 ^ HIWORD(v1))) >> 24))] ^ LOBYTE(STACK[0x74F]) ^ (-49 * (v1 ^ BYTE2(v1)));
  JUMPOUT(0x1886F4BF8LL);
}

uint64_t sub_18871613C()
{
  unsigned __int8 v1 = MGGetBoolAnswer();
  return ((uint64_t (*)(void))qword_18A26FDB0[(((v1 ^ (v0 + 34)) & 1) * ((v0 - 278) ^ 0x1BB)) ^ v0])();
}

uint64_t sub_188716178()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
}

void sub_1887161C4()
{
  unsigned int v1 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFF912136CLL)) ^ LODWORD(STACK[0x940])) & 0x7FFFFFFF);
  unint64_t v2 = 83590351 * ((v1 >> (LODWORD(STACK[0x93C]) - 59)) ^ v1);
  unsigned int v3 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x8BA2CDCC)) ^ (LODWORD(STACK[0x934])
                                                                             + *(_DWORD *)(v0 + 672)
                                                                             - 1938276051)) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x5C3]) = byte_1887454F0[v2 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_188743630[(v2 >> 24) + 2] ^ byte_188743E90[v2 >> 24] ^ byte_18873E340[v4 >> 24] ^ v2 ^ byte_18873FAC0[(v4 >> 24) + 1] ^ byte_188743C60[v4 >> 24] ^ (41 * BYTE3(v2)) ^ v4 ^ (-103 * BYTE3(v4));
  JUMPOUT(0x188709118LL);
}

uint64_t sub_188716324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5
                              + 8LL
                              * (int)((((3 * ((v5 - 1771049520) & 0xFFFD3F7B ^ (v6 + 155))) ^ 0x2D1) * (a1 != 0)) ^ (v5 + 1140))))();
}

uint64_t sub_188716378@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  unsigned int v4 = (a2 + 594628086) & 0xDC8EB3FA;
  BOOL v5 = **(_DWORD **)(v2 + 264) - 1807441120 < v4 - 1029;
  int v6 = (uint64_t (*)(void))(*(void *)(a1 + 8LL * (((2 * v5) | (32 * v5)) ^ a2)) - 4LL);
  LODWORD(STACK[0x75C]) = v4;
  *(void *)(v3 + 592) = 1966804502LL;
  return v6();
}

void sub_188716400( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char v66 = STACK[0x74F];
  unsigned int v67 = (STACK[0x950] & 0xFFFFFFF0 ^ 0x46A4394F)
      - 981502398
      + ((2 * (STACK[0x950] & 0xFFFFFFF0 ^ 0x46A4394F)) & 0x8AFEEC80 ^ 0xFFFFFFFB)
      + 1;
  LODWORD(STACK[0x988]) = v67;
  char v68 = v66 - 54 * (LOBYTE(STACK[0x970]) ^ 0x82) + ((101 * (LOBYTE(STACK[0x970]) ^ 0x82)) ^ 0x7F);
  char v69 = v68 - ((2 * v68 + 50) & 0x3E) + 88;
  LOBYTE(STACK[0x98E]) = v69;
  LOBYTE(STACK[0x98F]) = v69 ^ 7;
  uint64_t v70 = *(void *)(v64 + 392) + (v67 ^ 0xC57F7642);
  v65[144] = v70;
  v65[72] = v70;
  v65[70] = qword_18A26FDB0[a64 ^ 0x431];
  JUMPOUT(0x18871B8BCLL);
}

void sub_1887164B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char v66 = STACK[0x74F];
  LOBYTE(STACK[0x99F]) = byte_18873E760[LOBYTE(STACK[0x98F])];
  char v67 = ((-54 * (LOBYTE(STACK[0x988]) ^ 0x42)) & 0xF4) + v66 + ((101 * (LOBYTE(STACK[0x988]) ^ 0x42)) ^ 0x7A);
  unsigned int v68 = (STACK[0x950] & 0xFFFFFFF4 ^ 0x46A4394F)
      + 236431014
      + ((2 * (STACK[0x950] & 0xFFFFFFF4 ^ 0x46A4394F)) & 0x1C2F4D48 ^ 0xFFFFFFFB)
      + 1;
  LODWORD(STACK[0x9A0]) = v68;
  LOBYTE(STACK[0x9A7]) = v67 - ((2 * v67 + 124) & 0x64) - 16;
  uint64_t v69 = *(void *)(v64 + 392) + (v68 ^ 0xE17A6A6);
  v65[147] = v69;
  v65[72] = v69;
  v65[70] = qword_18A26FDB0[a64 ^ 0x436] - 12LL;
  JUMPOUT(0x18871B8BCLL);
}

void sub_188716594()
{
  char v2 = STACK[0x74F];
  int v3 = LOBYTE(STACK[0x98E]);
  int v4 = LOBYTE(STACK[0x99F]);
  int v5 = (v3 ^ v4 ^ 0x6F) + 1;
  v3 ^= 0x53u;
  unsigned int v6 = v3 + (v5 ^ 0xFFFFFFBD) + ((2 * v5) & 0x7A) + 67;
  LOBYTE(STACK[0x9B3]) = byte_188744190[LOBYTE(STACK[0x9A7]) ^ 0xFLL];
  unsigned int v7 = (STACK[0x950] & 0xFFFFFFF3 ^ 0x46A4394C)
     + 1766949151
     - ((2 * (STACK[0x950] & 0xFFFFFFF3 ^ 0x46A4394C)) & 0xD2A3023E);
  LODWORD(STACK[0x9B4]) = v7;
  int v8 = ((v6 - ((2 * v6) & 0xFFFFFF96) - 53) ^ v4 ^ ((v4 ^ 0x3C) - ((2 * (v4 ^ 0x3C) + 2) & 0x66) + 52) ^ 0x3B) + v3;
  int v9 = (v8 ^ 0xDE) + ((2 * v8) & 0xBC) + 34;
  int v10 = (((v9 - ((2 * v9) & 0x13C)) << 16) + 1872625664) ^ 0x6F9E0000;
  LODWORD(STACK[0x9B8]) = v10 - 802745720 - ((2 * v10) & 0x204E0000) + 3592;
  char v11 = v2 + ((-54 * (LOBYTE(STACK[0x9A0]) ^ 0xA6)) & 0xBF) + ((101 * (LOBYTE(STACK[0x9A0]) ^ 0xA6)) ^ 0x5F) - 70;
  LOBYTE(STACK[0x9BF]) = v11 - ((2 * v11 + 62) & 0xBB) + 124;
  uint64_t v12 = *(void *)(v0 + 392) + (v7 ^ 0x6951811F);
  *(void *)(v1 + 1200) = v12;
  *(void *)(v1 + 576) = v12;
  JUMPOUT(0x1887164A4LL);
}

void sub_188716730()
{
  unsigned int v2 = LOBYTE(STACK[0x74F])
     + ((10 * (LOBYTE(STACK[0x9B4]) ^ 0x1F)) & 0x32)
     + ((101 * (LOBYTE(STACK[0x9B4]) ^ 0x1F)) ^ 0xFFFFFF99)
     - 103;
  unsigned int v3 = v2 - ((2 * v2 + 12) & 0xFFFFFF94) - 48;
  int v4 = byte_188746A10[v3 ^ 0xAALL];
  LOBYTE(STACK[0x9CB]) = byte_188744190[LOBYTE(STACK[0x9BF]) ^ 0x8DLL];
  unsigned int v5 = (STACK[0x950] & 0xFFFFFFF5 ^ 0x46A4394E)
     + 1811600175
     - ((2 * (STACK[0x950] & 0xFFFFFFF5 ^ 0x46A4394E)) & 0xD7F5A65E);
  LODWORD(STACK[0x9CC]) = v5;
  int v6 = ((((v4 ^ v3 ^ 0x92) - ((2 * (v4 ^ v3 ^ 0x92)) & 0x3C)) << 24) + 503316480) ^ 0x1E000000;
  LODWORD(STACK[0x9D0]) = v6 - 1430356493 - ((2 * v6) & 0x54000000);
  *(void *)(v1 + 576) = *(void *)(v0 + 392) + (v5 ^ 0x6BFAD32F);
  *(void *)(v1 + 560) = qword_18A26FDB0[((85
                                                                         * (qword_18C723CA0 ^ 0xA1 ^ qword_18C723C90)) ^ byte_188748960[byte_188748860[(85 * (qword_18C723CA0 ^ 0xA1 ^ qword_18C723C90))] ^ 0xDB])
                                        + 1179]
                        - 4LL;
  JUMPOUT(0x18871B8BCLL);
}

void sub_1887168BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  char v66 = STACK[0x74F];
  char v67 = LOBYTE(STACK[0x9CC]) ^ 0x2F;
  unsigned int v68 = ((LOBYTE(STACK[0x9B3]) ^ 0x92) - 2059167164 - ((2 * LOBYTE(STACK[0x9B3])) & 0x88)) ^ 0x85439A44 | LODWORD(STACK[0x9D0]) ^ 0xAABE7DF3;
  LODWORD(STACK[0x9D4]) = v68 + 292740434 - ((2 * v68) & 0x22E5BAA4);
  char v69 = ~(-101 * v67) + v66 + 54 * v67 + ((-108 * v67) & 0xCF) + ((-54 * v67) ^ 0xE6);
  unsigned int v70 = (STACK[0x950] & 0xFFFFFFFD ^ 0x46A43946)
      + 1072938909
      - ((2 * (STACK[0x950] & 0xFFFFFFFD ^ 0x46A43946)) & 0x7FE77F3A);
  LODWORD(STACK[0x9D8]) = v70;
  unsigned __int8 v71 = byte_188743F90[(v69 - ((2 * v69 - 90) & 0x8C) - 103) ^ 0xC3LL];
  LOBYTE(STACK[0x9DF]) = 25 * v71 - ((a64 + 50 * v71) & 0xCF) + 38;
  uint64_t v72 = *(void *)(v64 + 392) + (v70 ^ 0x3FF3BF9D);
  *(void *)(v65 + 1232) = v72;
  *(void *)(v65 + 576) = v72;
  JUMPOUT(0x1887164A8LL);
}

void sub_188716A14( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char v67 = STACK[0x74F];
  unsigned int v68 = ((((LOBYTE(STACK[0x9DF]) ^ 0x93) - ((2 * (LOBYTE(STACK[0x9DF]) ^ 0x93)) & 0xFFFFFFDF)) << 8) + 1061809920) ^ 0x3F49EF00;
  LODWORD(STACK[0x9EC]) = v68 + 117694317 - ((2 * v68) & 0xE07BE00);
  char v69 = ((74 * (LOBYTE(STACK[0x9D8]) ^ 0x9D)) & 0x6E) + v67 + ((101 * (LOBYTE(STACK[0x9D8]) ^ 0x9D)) ^ 0xB7);
  unsigned int v70 = STACK[0x950] & 0xFFFFFFF1 ^ 0x46A4394E;
  LODWORD(STACK[0x9F0]) = v70;
  int v71 = v70 - 2008921969 - ((2 * v70) & 0x1084911E);
  LODWORD(STACK[0x9F4]) = v71;
  LOBYTE(STACK[0x9FB]) = (v69 - ((2 * v69 + 2) & 0xBB) + 94) ^ 0xB7;
  *(void *)(v66 + 576) = *(void *)(v65 + 392) + (v71 ^ 0x8842488F);
  *(void *)(v66 + 560) = qword_18A26FDB0[a65 ^ 0x7FA] - 4LL;
  JUMPOUT(0x18871B8BCLL);
}

void sub_188716B20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  int v66 = byte_188743F90[LOBYTE(STACK[0x9FB])];
  unsigned int v67 = LOBYTE(STACK[0x74F]) + 101 * (LOBYTE(STACK[0x9F4]) ^ 0xFFFFFF8F);
  int v68 = 2 * v67;
  char v69 = v67 + ((2 * v67) & 0x80) - 64;
  int v70 = 25 * v66 - ((a64 + 50 * (_BYTE)v66) & 0xF0) - 73;
  int v71 = ((((v70 ^ 0xA) - ((2 * v70) & 0x18A)) << 8) + 2120205568) ^ 0x7E5FC500;
  int v72 = ((LOBYTE(STACK[0x9CB]) ^ 0x92) + 1669218765 - ((2 * (LOBYTE(STACK[0x9CB]) ^ 0x92)) & 0x19A)) ^ 0x637E41CD | LODWORD(STACK[0x9EC]) ^ 0x703DF6D;
  LODWORD(STACK[0x9FC]) = v72 - ((2 * v72) & 0x20A34AF2) + 1347528057;
  unsigned int v73 = (v71 - 220926248 - ((2 * v71) & 0x65A9DC00)) ^ 0xF2D4EED8 | LODWORD(STACK[0x9B8]) ^ 0xD0272090;
  LODWORD(STACK[0xA00]) = v73 + 1392987408 - ((2 * v73) & 0xA60E9A20);
  LOBYTE(v73) = 4 * v67;
  LOBYTE(v67) = (2 * v67 + ((4 * v67) & 0x20 ^ 0x7E) + 18) & 0x70;
  LOBYTE(v67) = (v69 ^ 0xF8) + (v67 ^ 0x6F) + ((2 * v67) ^ 0x20) - 127;
  LOBYTE(v67) = (v67 ^ 0xDF) + ((2 * v67) & 0xBF) + 54;
  int v74 = ((((v68 ^ 0x10) - (v73 & 0x18) + 13) & 0x1A) - ((2 * ((v68 ^ 0x10) - (v73 & 0x18) + 13)) & 4) + 66) ^ 0x4A;
  int v75 = STACK[0x950];
  unsigned int v76 = (v75 & 0xFFFFFFFB ^ 0x46A43944)
      + 1542486884
      + ((2 * ((v75 & 0xFFFFFFFB ^ 0x46A43944) & 0x5BF07B7A ^ (v75 | 0x7FFFFFE5))) ^ 0x3D)
      + 1;
  LODWORD(STACK[0xA04]) = v76;
  unint64_t v77 = (v74 & 0xFE ^ 0xFFFFFFFFA0F10447LL)
      - ((2 * v74) & 0x70LL)
      + v67
  LOBYTE(v77) = byte_188743F90[(v77 + 0x6DDFCF29EC177748LL - ((2 * v77) & 0x1D82EEE90LL)) ^ 0x6DDFCF29EC17775DLL];
  LOBYTE(STACK[0xA0A]) = -25 * v77;
  LOBYTE(STACK[0xA0B]) = (a64 + 50 * v77) & 0x66;
  LODWORD(STACK[0xA0C]) = (v75 & 0xFFFFFFFC ^ 0x46A43947)
                        - 1440937609
                        + ((2 * ((v75 & 0xFFFFFFFC ^ 0x46A43947) & 0x2A1D097C ^ (v75 | 0x7FFFFFF7))) ^ 0x17)
                        + 1;
  uint64_t v78 = *(void *)(v64 + 392) + (v76 ^ 0x5BF07B64);
  *(void *)(v65 + 1280) = v78;
  *(void *)(v65 + 576) = v78;
  JUMPOUT(0x188716580LL);
}

void sub_188716E10()
{
  char v2 = ((-54 * (LOBYTE(STACK[0xA04]) ^ 0x64)) & 0xBC)
     + LOBYTE(STACK[0x74F])
     + ((101 * (LOBYTE(STACK[0xA04]) ^ 0x64)) ^ 0x5E);
  int v3 = (((((LOBYTE(STACK[0xA0A]) + LOBYTE(STACK[0xA0B]) + 13) ^ 0x6E)
        - ((2 * ((LOBYTE(STACK[0xA0A]) + LOBYTE(STACK[0xA0B]) + 13) ^ 0x6E)) & 0x5E)) << 8)
      + 2009214720) ^ 0x77C22F00;
  LOBYTE(STACK[0xA1B]) = v2 - ((2 * v2 + 52) & 0x48) - 2;
  int v4 = (v3 + 38368393 - ((2 * v3) & 0x492E800)) ^ 0x2497489 | LODWORD(STACK[0x9D4]) ^ 0x1172DD52;
  LODWORD(STACK[0xA1C]) = v4 + 71659337 - ((2 * v4) & 0x88ADE92);
  uint64_t v5 = *(void *)(v0 + 392) + (LODWORD(STACK[0xA0C]) ^ 0xAA1D0977);
  *(void *)(v1 + 1296) = v5;
  *(void *)(v1 + 576) = v5;
  JUMPOUT(0x18871B8B4LL);
}

void sub_188716F28()
{
  uint64_t v2 = LOBYTE(STACK[0xA1B]);
  int v3 = byte_188746A10[v2 ^ 8];
  int v4 = LOBYTE(STACK[0x74F])
     + ((74 * (LOBYTE(STACK[0xA0C]) ^ 0x77)) & 0x62)
     + ((101 * (LOBYTE(STACK[0xA0C]) ^ 0x77)) ^ 0x31)
     + 64;
  int v5 = STACK[0x950];
  unsigned int v6 = STACK[0x950] & 0xFFFFFFFA ^ 0x46A43945;
  LODWORD(STACK[0xA2C]) = v6;
  v5 |= 0x7FFFFFEFu;
  LODWORD(STACK[0xA30]) = v5;
  int v7 = v6 - 1413027226 + ((2 * (v6 & 0x2BC6EA72 ^ v5)) ^ 0x29) + 1;
  LODWORD(STACK[0xA34]) = v7;
  LODWORD(v2) = ((((v3 ^ v2 ^ 0xC3) - ((2 * (v3 ^ v2 ^ 0xC3)) & 0x36)) << 24) + 452984832) ^ 0x1B000000;
  LODWORD(STACK[0xA38]) = v2 + 1244760883 - ((2 * v2) & 0x94000000);
  LODWORD(v2) = v4 - ((2 * v4 + 14) & 0x44) - 23;
  int v8 = (v2 ^ 0x3E) - 40040662 - ((2 * (v2 ^ 0x3E)) & 0x54);
  LODWORD(STACK[0xA3C]) = v8;
  v8 ^= 0xFD9D072A;
  LODWORD(v2) = v8 + (v2 ^ 0x4171208) - ((2 * (v2 ^ 0x1D)) & 0x1D4) - 68620821;
  LODWORD(v2) = v2 - ((2 * v2) & 0x31FF7668) - 1728070860;
  LODWORD(STACK[0xA40]) = v2;
  LODWORD(STACK[0xA44]) = ((v2 ^ 0x44CA) & v8) - ((2 * ((v2 ^ 0x44CA) & v8)) & 0x5721375A) + 730897331;
  *(void *)(v1 + 576) = *(void *)(v0 + 392) + (v7 ^ 0xABC6EA66);
  JUMPOUT(0x188716F18LL);
}

void sub_1887170F8()
{
  unsigned int v2 = LOBYTE(STACK[0x74F])
     + ((-54 * (LOBYTE(STACK[0xA34]) ^ 0x66)) & 0xFFFFFFDF)
     + ((101 * (LOBYTE(STACK[0xA34]) ^ 0x66)) ^ 0xFFFFFFEF);
  int v3 = (v2 + 17 - ((2 * (v2 + 17)) & 0x1A) + 13) ^ 0xD;
  int v4 = v3 - ((2 * v3 + 112) & 0x4A) + 93;
  int v5 = byte_188744190[(LODWORD(STACK[0xA3C]) ^ LODWORD(STACK[0xA40]) ^ 0x9A9D43E0)
                    + 25231901
                    + ((2 * LODWORD(STACK[0xA44]) - 12) ^ 0xA95FCAB9)
                    + ((2 * (2 * LODWORD(STACK[0xA44]) - 12)) & 0xFCFDFBC4 ^ 0xAC406A84)] ^ 8;
  unsigned int v6 = (v5 - 2143347683 - ((2 * v5) & 0x3A)) ^ 0x803F1C1D | LODWORD(STACK[0xA00]) ^ 0x53074D10;
  LODWORD(STACK[0xA48]) = v6 - 56069138 - ((2 * v6) & 0xF950E7DC);
  int v7 = byte_18873E760[v4 ^ 0x77LL];
  unsigned int v8 = STACK[0x950] & 0xFFFFFFF7 ^ 0x46A4394C;
  LODWORD(STACK[0xA4C]) = v8;
  unsigned int v9 = v8 + 1717847929 + ((2 * v8) & 0xCCC88EE2 ^ 0xFFFFFFEF) + 1;
  LODWORD(STACK[0xA50]) = v9;
  LOBYTE(v2) = (v2 + 18) ^ v7;
  unsigned int v10 = (v4 ^ v7) & 0xFFFFFFFE ^ 0x50;
  int v11 = (2 * v10) & 0x2C;
  v10 += 22;
  unsigned int v12 = ((v10 - v11) & 0xFFFFFFFE | v2 & 1) ^ 0x45;
  int v13 = v12 - 2 * (v12 & 0x72 ^ v10 & 2) - 16;
  int v14 = (((v13 - ((2 * v13) & 0x12E)) << 16) + 2123825152) ^ 0x7E970000;
  LODWORD(STACK[0xA54]) = v14 + 1069888480 - ((2 * v14) & 0x7F8A0000);
  *(void *)(v1 + 576) = *(void *)(v0 + 392) + (v9 ^ 0x66644779);
  *(void *)(v1 + 560) = qword_18A26FDB0[((85
                                                                         * ((qword_18C723C90 + qword_18C723CA0) ^ 0xA1)) ^ byte_188747F60[byte_188747E60[(85 * ((qword_18C723C90 + qword_18C723CA0) ^ 0xA1))] ^ 0x63])
                                        + 1127]
                        - 12LL;
  JUMPOUT(0x18871B8BCLL);
}

void sub_1887177CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  char v66 = 2 * ((5 * (LOBYTE(STACK[0xAAC]) ^ 0xCF)) & 0x1F)
      + LOBYTE(STACK[0x74F])
      + ((101 * (LOBYTE(STACK[0xAAC]) ^ 0xCF)) ^ 0x9F);
  int v67 = LOBYTE(STACK[0xAA5]) ^ LOBYTE(STACK[0xAA6]) ^ 0x9B;
  unsigned int v68 = (((v67 - ((2 * v67) & 0x11111111)) << 16) - 2004353024) ^ 0x88880000;
  int v69 = byte_188746A10[LOBYTE(STACK[0xAA7]) ^ 8LL] ^ LOBYTE(STACK[0xAA7]) ^ 0xF1;
  unsigned int v70 = (((v69 - ((2 * v69) & 0x12)) << 24) - 1996488704) ^ 0x89000000;
  unsigned int v71 = (v70 - 1182953216 - ((2 * v70) & 0x72000000)) ^ 0xB97D9100 | LODWORD(STACK[0xA48]) ^ 0xFCA873EE;
  LODWORD(STACK[0xAB0]) = v71 - ((2 * v71) & 0x8741817A) - 1012875075;
  unsigned int v72 = (v68 + 986785201 - ((2 * v68) & 0x75A20000)) ^ 0x3AD125B1 | LODWORD(STACK[0xA8C]) ^ 0xA41C5B65;
  LODWORD(STACK[0xAB4]) = v72 - ((2 * v72) & 0x54F8E8AA) + 712799317;
  unsigned int v73 = (STACK[0x950] & 0xFFFFFFF8 ^ 0x46A43947)
      + 806673559
      - ((2 * (STACK[0x950] & 0xFFFFFFF8 ^ 0x46A43947)) & 0x6029B92E);
  LODWORD(STACK[0xAB8]) = v73;
  LOBYTE(v72) = byte_188743F90[(v66 - ((2 * v66 + 50) & 0x34) + 51) ^ 0x43LL];
  LOBYTE(STACK[0xABF]) = 25 * v72 - ((a64 + 50 * v72) & 0xD2) + 40;
  uint64_t v74 = *(void *)(v64 + 392) + (v73 ^ 0x3014DC97);
  *(void *)(v65 + 1456) = v74;
  *(void *)(v65 + 576) = v74;
  JUMPOUT(0x1887174CCLL);
}

void sub_188717A04()
{
  char v1 = ((-54 * (LOBYTE(STACK[0xAB8]) ^ 0x97)) & 0xF7)
     + LOBYTE(STACK[0x74F])
     + ((101 * (LOBYTE(STACK[0xAB8]) ^ 0x97)) ^ 0x7B);
  int v2 = (((LOBYTE(STACK[0xABF]) - ((2 * LOBYTE(STACK[0xABF])) & 0xEC)) << 8) + 387937792) ^ 0x171F7600;
  unsigned int v3 = (v2 - ((2 * v2) & 0x6CC1C600) + 912319402) ^ 0x3660E3AA | LODWORD(STACK[0xA58]) ^ 0x96C4255B;
  int v4 = v3 - ((2 * v3) & 0x2E7718D2) - 1757705111;
  int v5 = byte_188744190[(v1 - ((2 * v1 + 122) & 0x56) - 24) ^ 0x67LL] ^ 0x92;
  int v6 = LODWORD(STACK[0x1650]) ^ LODWORD(STACK[0x954]) ^ v4 ^ (v5 - ((2 * v5) & 0x77777777) + 122947515);
  unsigned int v7 = LODWORD(STACK[0x95C]) ^ LODWORD(STACK[0xA90]) ^ LODWORD(STACK[0x1650]) ^ 0xAD699127;
  int v8 = (((LODWORD(STACK[0x1644]) ^ 0xA34DFFB ^ v6) + 1) ^ 0x3DB73FF9)
     + LODWORD(STACK[0x17B8])
     + ((2 * ((LODWORD(STACK[0x1644]) ^ 0xA34DFFB ^ v6) + 1)) & 0x7B6E7FF2);
  int v9 = LODWORD(STACK[0xAB0]) ^ LODWORD(STACK[0x958]) ^ LODWORD(STACK[0x1644]);
  unsigned int v10 = (v6 ^ ((v6 ^ 0x8AACF251) - ((2 * (v6 ^ 0x8AACF251) + 2) & 0xF615F2EA) - 83166858) ^ 0xAAB341F0 ^ (v8 - ((2 * v8) & 0x49D56A56) + 619361579))
      + LODWORD(STACK[0x1648]);
  HIDWORD(v11) = v9 ^ ~LODWORD(STACK[0x1650]);
  LODWORD(v11) = v9 ^ LODWORD(STACK[0x1650]) ^ 0x55ED4A66;
  int v12 = ((v11 >> 1) - ((2 * (v11 >> 1)) & 0xBD3B44B0) - 560094632) ^ LODWORD(STACK[0x17BC]);
  int v13 = 2 * ((v7 & STACK[0x1648]) - ((2 * (v7 & STACK[0x1648])) & 0xC803BC2)) - 1937753150;
  HIDWORD(v11) = v12 ^ 0x284CF73E;
  LODWORD(v11) = v12;
  unsigned int v14 = (v11 >> 31) - ((2 * (v11 >> 31)) & 0x6E8D4440) - 1220107744;
  unsigned int v15 = LODWORD(STACK[0x1648]) + v7;
  unsigned int v16 = ((2 * v13) & 0x79C0F5F4 ^ 0xE6FF8A7B) + (v13 ^ 0x4F9FBEC7) + (v15 ^ 0x73DFFB9E) + ((2 * v15) & 0xE7BFF73C);
  unsigned int v17 = v16 - 2 * ((v16 + 1224769374) & 0x4EBA72AF ^ v15 & 1);
  unsigned int v18 = LODWORD(STACK[0xAB4]) ^ LODWORD(STACK[0x94C]) ^ LODWORD(STACK[0x1644]) ^ LODWORD(STACK[0x1650]) ^ LODWORD(STACK[0x163C]);
  unsigned int v19 = (v10 - ((2 * v10) & 0x50F4226A) - 1468395211) ^ LODWORD(STACK[0x163C]);
  uint64_t v20 = v0[51];
  uint64_t v21 = v0[52];
  uint64_t v22 = v0[53];
  uint64_t v23 = v0[54];
  unsigned int v24 = (v17 + 398127628) ^ LODWORD(STACK[0x163C]);
  int v25 = *(_DWORD *)(v20 + 4LL * (BYTE2(v24) ^ 0x51u));
  unsigned int v26 = HIBYTE(v24) ^ 0x6B;
  unsigned int v27 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v14) ^ 0xE)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v18) ^ 0xC0u)) ^ *(_DWORD *)(v22 + 4LL * (((v17 + 12) ^ LODWORD(STACK[0x163C])) ^ 0x35u)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v19) ^ 0xCCu));
  int v28 = *(_DWORD *)(v20 + 4LL * (BYTE2(v14) ^ 0x9Du)) ^ *(_DWORD *)(v21 + 4LL * v26);
  unsigned int v29 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v19) ^ 0x5D)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v18) ^ 0xC5u)) ^ *(_DWORD *)(v22 + 4LL * (((v11 >> 31) - ((2 * (v11 >> 31)) & 0x40) + 32) ^ 0xA7u)) ^ *(_DWORD *)(v23 + 4LL * (((unsigned __int16)((v17 - 3572) ^ LODWORD(STACK[0x163C])) >> 8) ^ 0x6Bu));
  unsigned int v30 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v18) ^ 0x86)) ^ v25 ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v14) ^ 0xBu)) ^ *(_DWORD *)(v22 + 4LL * (v19 ^ 0x5Du));
  unsigned int v31 = v28 ^ *(_DWORD *)(v22
                        + 4LL
                        * ((LOBYTE(STACK[0xAB4]) ^ LOBYTE(STACK[0x94C]) ^ LOBYTE(STACK[0x1644]) ^ LOBYTE(STACK[0x1650]) ^ LOBYTE(STACK[0x163C])) ^ 0xD1u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v19) ^ 0x1Eu));
  unsigned int v32 = *(_DWORD *)(v23 + 4LL * (BYTE1(v30) ^ 0xBEu)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v27) ^ 0x66)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v29) ^ 0x89u)) ^ *(_DWORD *)(v22 + 4LL * ((v28 ^ *(_BYTE *)(v22 + 4LL * ((LOBYTE(STACK[0xAB4]) ^ LOBYTE(STACK[0x94C]) ^ LOBYTE(STACK[0x1644]) ^ LOBYTE(STACK[0x1650]) ^ LOBYTE(STACK[0x163C])) ^ 0xD1u)) ^ *(_BYTE *)(v23 + 4LL * (BYTE1(v19) ^ 0x1Eu))) ^ 0xC7u));
  unsigned int v33 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v29) ^ 0x88)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v31) ^ 0xC9u)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v30) ^ 0x77u)) ^ *(_DWORD *)(v22 + 4LL * ((*(_BYTE *)(v21 + 4LL * (HIBYTE(v14) ^ 0xE)) ^ *(_BYTE *)(v23 + 4LL * (BYTE1(v18) ^ 0xC0u)) ^ *(_BYTE *)(v22 + 4LL * (((v17 + 12) ^ LODWORD(STACK[0x163C])) ^ 0x35u)) ^ *(_BYTE *)(v20 + 4LL * (BYTE2(v19) ^ 0xCCu))) ^ 0xB9u));
  int v34 = *(_DWORD *)(v20 + 4LL * (BYTE2(v27) ^ 0x53u));
  unsigned int v35 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v30) ^ 0x1C)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v31) ^ 6u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v27) ^ 0x44u)) ^ *(_DWORD *)(v22 + 4LL * ((*(_BYTE *)(v21 + 4LL * (HIBYTE(v19) ^ 0x5D)) ^ *(_BYTE *)(v20 + 4LL * (BYTE2(v18) ^ 0xC5u)) ^ *(_BYTE *)(v22 + 4LL * (((v11 >> 31) - ((2 * (v11 >> 31)) & 0x40) + 32) ^ 0xA7u)) ^ *(_BYTE *)(v23 + 4LL * (((unsigned __int16)((v17 - 3572) ^ LODWORD(STACK[0x163C])) >> 8) ^ 0x6Bu))) ^ 0x9Au));
  unsigned int v36 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v31) ^ 0x2B)) ^ v34 ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v29) ^ 0xE8u)) ^ *(_DWORD *)(v22 + 4LL * ((*(_BYTE *)(v21 + 4LL * (HIBYTE(v18) ^ 0x86)) ^ v25 ^ *(_BYTE *)(v23 + 4LL * (BYTE1(v14) ^ 0xBu)) ^ *(_BYTE *)(v22 + 4LL * (v19 ^ 0x5Du))) ^ 0x6Fu));
  unsigned int v37 = BYTE2(v36) ^ 0xD1;
  BOOL v38 = v18 == -2033860399;
  char v39 = v32 ^ 0xE7;
  if (v38) {
    char v39 = -1;
  }
  int v40 = *(_DWORD *)(v23 + 4LL * (BYTE1(v36) ^ 0xE5u));
  unsigned int v41 = ((v40 & 0x9242F0B3 ^ 0x880DFEF8) - ((2 * (v40 & 0x9242F0B3 ^ 0x880DFEF8)) & 0x41E30E6) + 34543991) ^ 0x8D5A472D;
  unsigned int v42 = (v41 | 0x6BA38899) - (v41 | 0x945C7766) - 1805879450;
  unsigned int v43 = HIBYTE(v36) ^ 0xB8;
  int v44 = *(_DWORD *)(v22 + 4LL * (v36 ^ 0x41u));
  int v45 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v32) ^ 0x59)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v33) ^ 0xA0u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v35) ^ 0xBFu));
  unsigned int v46 = (v44 & 0x40000000 | ((v44 & 0x40000000u) >> 30 << 31)) ^ 0x7DEBFEFF;
  unsigned int v47 = v35 ^ 0x12;
  unsigned int v48 = ((2 * (v40 & 0x6DBD0F4C ^ 0xA1E95140)) | 0x7983EA42) - (v40 & 0x6DBD0F4C ^ 0xA1E95140) + 1128139487;
  unsigned int v49 = ((v44 & 0xBFFFFFFF ^ 0x4642DB8A) - ((2 * (v44 & 0xBFFFFFFF ^ 0x4642DB8A)) & 0x62873442) - 1320969695) ^ 0xCD6F7EEB;
  int v50 = ((2 * v49) | 0x4E74FF0E) - v49 - 658145159;
  unsigned int v51 = -1900618325 - v46;
  if (((v46 - 2112618239) & ~v45) == 0) {
    unsigned int v51 = v46 - 1830887507;
  }
  unsigned int v52 = (v45 ^ 0xEE51D194) - 281730732 + v51 - ((2 * ((v45 ^ 0xEE51D194) - 281730732 + v51)) & 0xF1D86EAA) - 118737067;
  unsigned int v53 = HIBYTE(v35) ^ 0xCD;
  uint64_t v54 = v0[53];
  unsigned int v55 = *(_DWORD *)(v20 + 4LL * (BYTE2(v35) ^ 0x4Au)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v33) ^ 0x8F)) ^ v48 ^ *(_DWORD *)(v22 + 4LL * (((v39 & (v32 ^ 0xE7)) - ((2 * (v39 & (v32 ^ 0xE7))) & 0xF8) + 124) ^ 0x7Cu)) ^ v42;
  int v56 = v52 ^ v50;
  int v57 = *(_DWORD *)(v22 + 4LL * v47);
  unsigned int v58 = *(_DWORD *)(v22 + 4LL * (v33 ^ 0xE9u)) ^ *(_DWORD *)(v20 + 4LL * v37) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v32) ^ 0xE9u)) ^ *(_DWORD *)(v21 + 4LL * v53);
  int v59 = v57 ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v33) ^ 0x92u)) ^ *(_DWORD *)(v21 + 4LL * v43) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v32) ^ 0xB4u));
  unsigned int v60 = ((2 * v59) ^ 0xBD3B2728) - 2 * (((2 * v59) ^ 0xBD3B2728) & 0x939C0F6 ^ (2 * v59) & 0x16) + 154779872;
  unsigned int v61 = (((v59 ^ 0x5E9D9394) - 817144982) ^ 0x27F5DFF6)
      + ((2 * ((v59 ^ 0x5E9D9394) - 817144982)) & 0x4FEBBFEC)
      + (v60 & 0x9E96B6D4 ^ 0xCD1910E1)
      + ((2 * v60) & 0x352C4DA8 ^ 0xEFDFFE7F);
  int v62 = *(_DWORD *)(v20 + 4LL * (BYTE2(v55) ^ 0x9Eu)) ^ *(_DWORD *)(v21
                                                                  + 4LL
                                                                  * (((((v56 ^ 0x3E9935D6u) >> (BYTE1(v56) & 0x18 ^ 0x10))
                                                                                      - 774768572
                                                                                      + (~(2
                                                                                         * ((v56 ^ 0x3E9935D6u) >> (BYTE1(v56) & 0x18 ^ 0x10))) | 0x5C5C0F77)
                                                                                      + 1) ^ 0xD1D1F844) >> (BYTE1(v56) & 0x18 ^ 8)));
  int v63 = *(_DWORD *)(v23 + 4LL * (BYTE1(v58) ^ 0xBEu));
  int v64 = v63 ^ 0x33EE21E4;
  unsigned int v65 = v61 + 318803946;
  if (v61 + 318803946 >= 0xD41D2597) {
    char v66 = 49;
  }
  else {
    char v66 = -56;
  }
  char v67 = v61 + v66;
  if (v65 >= 0xD41D2597) {
    char v70 = -122;
  }
  else {
    char v70 = -17;
  }
  unsigned int v68 = v64 + (v63 ^ 0x11AE2E6B ^ v62) + 1 - ((2 * (v64 + (v63 ^ 0x11AE2E6B ^ v62) + 1)) & 0xD28D2106) + 1766232195;
  int v69 = (v62 ^ 0x22400F8F) - ((2 * (v62 ^ 0x22400F8F) + 2) & 0x7C8F405A) + 1044881454;
  unsigned int v71 = ((v62 ^ v69 ^ v68 ^ 0x8ABEC0DE) + v64 - ((2 * ((v62 ^ v69 ^ v68 ^ 0x8ABEC0DE) + v64)) & 0x30D45414) - 1737872886) ^ *(_DWORD *)(v54 + 4LL * (v67 + v70 + 51));
  int v72 = (v71 ^ 0xBBB97E5A) - 2 * (((v71 ^ 0xBBB97E5A) + 224267568) & 0xB4323D7 ^ (v71 ^ 0xBBB97E5A) & 2) - 392089339;
  if ((v71 ^ 0xBBB97E50) >= 0xA2A1F2D0)
  {
    char v73 = 5;
  }

  else
  {
    int v72 = v71 ^ 0x30FA5D8F;
    char v73 = -43;
  }

  BOOL v38 = v72 == -1958534187;
  unsigned int v74 = *(_DWORD *)(v20 + 4LL * ((BYTE2(v65) - ((v65 >> 15) & 0xE6) - 13) ^ 0xF3u));
  int v75 = ((4 * v74) ^ 0x7145B04) - 2 * (((4 * v74) ^ 0x7145B04) & 0x12FFCBC ^ (4 * v74) & 0x10) + 19922094;
  unsigned int v76 = ((v75 & 0x4220080 ^ 0x6980C09D | v75 & 0x80003900) - 1) ^ 0x7DB2DF9D;
  unsigned int v77 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v58) ^ 0x77));
  unsigned int v78 = ((((4 * v77) ^ 0x71EB9AC4) - ((2 * ((4 * v77) ^ 0x71EB9AC4)) & 0x69771F90) + 884707275) & 0x84223980 | (v77 >> 30)) ^ 0x4220981;
  unsigned int v79 = (v78 - 1238497739 + ((2 * (v78 & 0xFFFE007F ^ (v77 >> 30))) ^ 0xFFFFFFFD)) ^ ((((((2 * v76) | 0xCFE98E92)
                                                                                       - v76
                                                                                       - 1744095049) | (v74 >> 30) ^ 2) ^ 0x73E4E0C8)
                                                                                    - 2
                                                                                    * ((((((2 * v76) | 0xCFE98E92)
                                                                                        - v76
                                                                                        - 1744095049) | (v74 >> 30) ^ 2) ^ 0x73E4E0C8) & 0x23CC683D ^ (((2 * v76) | 0xCFE98E92) - v76 - 1744095049) & 4)
                                                                                    - 1546885063);
  HIDWORD(v80) = v79 ^ 2;
  LODWORD(v80) = v79 ^ 0x81F2E250;
  unsigned int v81 = *(_DWORD *)(v54 + 4LL * (v56 ^ 0xD6u)) ^ *(_DWORD *)(v20
                                                                            + 4LL
                                                                            * (((BYTE2(v58) ^ 0x90)
                                                                              - ((v58 >> 15) & 0x52)
                                                                              + 553) ^ 0x223)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v55) ^ 0x95)) ^ *(_DWORD *)(v23 + 4LL * ((BYTE1(v65) - ((v65 >> 7) & 0x82) + 65) ^ 0x41u));
  int v82 = ((v80 >> 2) - ((2 * (v80 >> 2)) & 0x2C4B1318) + 371558796) ^ 0xF321AA9B | (((2
                                                                                   * ((v77 ^ v74) & 0x1EF7719F ^ 0x5C975611)) | 0x6947F888)
                                                                                 - ((v77 ^ v74) & 0x1EF7719F ^ 0x5C975611)
                                                                                 + 1264321468) ^ 0xF483DA45;
  unsigned int v83 = *(_DWORD *)(v54 + 4LL * (v55 ^ 0xF7u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v56) ^ 0x35u)) ^ (v82 - ((2 * v82) & 0xD0EF8484) - 394804670);
  unsigned int v84 = *(_DWORD *)(v20 + 4LL * (BYTE2(v56) ^ 0x99u)) ^ *(_DWORD *)(v21 + 4LL * HIBYTE(v65)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v55) ^ 0x1Eu)) ^ *(_DWORD *)(v54 + 4LL * (v58 ^ 0x2Bu));
  if (v38) {
    unsigned __int8 v85 = v73;
  }
  else {
    unsigned __int8 v85 = v71 ^ 0x8F;
  }
  unsigned int v86 = *(_DWORD *)(v20 + 4LL * (BYTE2(v81) ^ 0x52u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v71) ^ 0xBB)) ^ *(_DWORD *)(v54 + 4LL * (v84 ^ 0x28u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v83) ^ 0x9Bu));
  unsigned int v87 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v81) ^ 0x77)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v84) ^ 0xF2u)) ^ *(_DWORD *)(v54 + 4LL * (v85 ^ 0xD5u)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v83) ^ 0x9Du));
  unsigned int v88 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v83) ^ 0x6B)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v71) ^ 0x7Eu)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v84) ^ 0x1Eu)) ^ *(_DWORD *)(v54 + 4LL * (v81 ^ 0xFDu));
  int v89 = *(_DWORD *)(v23 + 4LL * (BYTE1(v81) ^ 0x84u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v84) ^ 0x91)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v71) ^ 0xB9u)) ^ *(_DWORD *)(v54 + 4LL * ((*(_BYTE *)(v54 + 4LL * (v55 ^ 0xF7u)) ^ *(_BYTE *)(v23 + 4LL * (BYTE1(v56) ^ 0x35u)) ^ (v82 - ((2 * v82) & 0x84) + 66)) ^ 0x70u));
  unsigned int v90 = v89 ^ ((v89 ^ 0x1472CA2C) - ((2 * (v89 ^ 0x1472CA2C) + 706825360) & 0x2A9D0A6E) + 1247751039) ^ ((v89 ^ 0xA1626C6B) - ((2 * (v89 ^ 0xA1626C6B) + 2) & 0xBE93B4D6) + 1598675564) ^ 0x949ACCC8;
  unsigned int v91 = v90 - ((2 * v90 + 1780567182) & 0x62ECAE38) - 427360925;
  unsigned int v92 = *(_DWORD *)(v20 + 4LL * (BYTE2(v87) ^ 0xC6u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v86) ^ 0xD)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v88) ^ 0x54u)) ^ *(_DWORD *)(v54 + 4LL * ((v90 - ((2 * v90 - 114) & 0x38) + 99) ^ 0x1Cu));
  unsigned int v93 = *(_DWORD *)(v20 + 4LL * (BYTE2(v88) ^ 0xEu)) ^ *(_DWORD *)(v54 + 4LL * (v86 ^ 0xD0u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v87) ^ 0x24)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v91) ^ 0x57u));
  int v94 = *(_DWORD *)(v20 + 4LL * (BYTE2(v86) ^ 9u));
  int v95 = *(_DWORD *)(v20 + 4LL * (BYTE2(v91) ^ 0x76u)) ^ *(_DWORD *)(v54 + 4LL * (v87 ^ 0xB9u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v88) ^ 0x24)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v86) ^ 0x79u));
  unsigned int v96 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v91) ^ 0x31)) ^ v94 ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v87) ^ 0x6Eu)) ^ *(_DWORD *)(v54 + 4LL * (v88 ^ 0x6Fu));
  unsigned int v97 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v93) ^ 0x3D)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v95) ^ 0xE5u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v96) ^ 0xD7u)) ^ *(_DWORD *)(v54 + 4LL * (v92 ^ 0xAu));
  char v98 = v97 ^ 0x74;
  unsigned int v99 = 2 * ((v97 ^ 0xB9CCCF74) % 0x3E02A4EC);
  char v100 = (((v93 & 0x18 ^ 0xAD) - 1) ^ 0x53) - 98;
  unsigned int v101 = ((((v95 ^ 0x47E571DCu) >> (v100 ^ 0x9D))
         - ((2 * ((v95 ^ 0x47E571DCu) >> (v100 ^ 0x9D))) & 0x99ED2F6E)
         - 856254537) ^ 0xCCF697B7) >> (v100 & 0x18);
  uint64_t v102 = v54;
  int v103 = *(_DWORD *)(v54 + 4LL * (v96 ^ 0x9Bu)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v95) ^ 0x71u));
  unsigned int v104 = *(_DWORD *)(v20 + 4LL * (BYTE2(v96) ^ 0xF5u)) ^ *(_DWORD *)(v54 + 4LL * (v93 ^ 0x27u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v92) ^ 0x4Bu)) ^ *(_DWORD *)(v21 + 4LL * ((v101 - ((2 * v101) & 0x8F) - 57) ^ 0xC7u));
  unsigned int v105 = *(_DWORD *)(v23 + 4LL * (BYTE1(v93) ^ 0xB6u)) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v92) ^ 0x2Du)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v96) ^ 0xF2)) ^ *(_DWORD *)(v54 + 4LL * (v95 ^ 0xDCu));
  int v106 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v92) ^ 0x47));
  int v107 = *(_DWORD *)(v20 + 4LL * (BYTE2(v93) ^ 0x76u));
  int v108 = *(_DWORD *)(v54
                   + 4LL
                   * ((*(_BYTE *)(v20 + 4LL * (BYTE2(v96) ^ 0xF5u)) ^ *(_BYTE *)(v54
                                                                                                + 4LL
                                                                                                * (v93 ^ 0x27u)) ^ *(_BYTE *)(v23 + 4LL * (BYTE1(v92) ^ 0x4Bu)) ^ *(_BYTE *)(v21 + 4LL * ((v101 - ((2 * v101) & 0x8F) - 57) ^ 0xC7u))) ^ 0x3Cu)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v97) ^ 0xCFu));
  LODWORD(STACK[0x240]) = v108;
  unsigned int v109 = v103 ^ v107 ^ v106;
  int v110 = *(_DWORD *)(v20 + 4LL * (BYTE2(v105) ^ 0xDCu));
  int v111 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v105) ^ 0xC));
  int v112 = v111 ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v109) ^ 0x27u));
  unsigned int v113 = (v112 & 0xD146BF88 ^ 0x400008 | 0x7198C709) - (v112 & 0xD146BF88 ^ 0x400008 | 0x8E6738F6) - 1905837834;
  int v114 = ((v112 & 0x2EB94077 ^ 0x4204013) - ((2 * (v112 & 0x2EB94077 ^ 0x4204013)) & 0x49708022) + 637297681) ^ 0x75346672;
  unsigned int v115 = ((v113 & 0xF0C392E8 ^ 0x820380AA) + (v113 ^ 0x71D87745) - ((v113 ^ 0x71D87745) & 0xF04392E8)) ^ 0x23C592AE | (v114 - ((2 * v114) & 0x447E0C3E) + 574565919) ^ 0x7A6E2C1F;
  unsigned int v116 = v108 ^ (v115 - ((2 * v115) & 0xD1D03646) + 1760041763);
  int v117 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v104) ^ 0xA0));
  unsigned int v118 = v117 ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v109) ^ 0xEAu)) ^ v110 ^ *(_DWORD *)(v54
                                                                                  + 4LL * (v97 ^ 0x74u));
  int v119 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v118) ^ 0xAE));
  unsigned int v120 = v119 & 0xFDFFFFFF;
  unsigned int v121 = ((2 * v119) & 0xEB8FFAAC ^ 0xAC85C820)
       + (v119 & 0xFDFFFFFF ^ 0x29BD1BE7)
       + (((v119 ^ 0xA185194E) + 1) ^ 0xFFDAF7FF)
       + ((2 * ((v119 ^ 0xA185194E) + 1)) & 0xFFB5EFFE);
  int v122 = *(_DWORD *)(v20 + 4LL * (BYTE2(v116) ^ 0xF7u));
  if ((v99 & 0x6D7F6D4E) + (((v97 ^ 0xB9CCCF74) % 0x3E02A4EC) ^ 0x76BFB6A7) == 1992275623) {
    char v123 = (((v97 ^ 0xB9CCCF74) % 0x3E02A4EC) ^ 0xF1) + 15 + (v99 & 0xE2);
  }
  else {
    char v123 = 0;
  }
  LODWORD(STACK[0x238]) = v122 ^ 0x81C516C1;
  BOOL v38 = ((v121 - 2007168341) & (v122 ^ 0x81C516C1)) == ((2 * ((v121 - 2007168341) & (v122 ^ 0x81C516C1))) & 0x2D655E72);
  unsigned int v124 = (v107 ^ ((v107 ^ 0x7E3AE93E) - ((2 * (v107 ^ 0x7E3AE93E) + 2) & 0x3D295B92) - 1634423350) ^ 0x4266B253 ^ ((v106 ^ 0x5C7AE6B1) + (v107 ^ v106 ^ 0x22400F8F) + 1 - ((2 * ((v106 ^ 0x5C7AE6B1) + (v107 ^ v106 ^ 0x22400F8F) + 1)) & 0xBA6E12B6) + 1563887963))
       + (v106 ^ 0x5C7AE6B1);
  unsigned int v125 = v103 ^ (v124 - ((2 * v124) & 0xFEEBB1C) - 2013831794);
  unsigned int v126 = BYTE1(v105) ^ 0x69;
  int v127 = *(_DWORD *)(v20 + 4LL * (BYTE2(v104) ^ 0xB4u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v97) ^ 0xB9));
  int v128 = *(_DWORD *)(v20 + 4LL * (BYTE2(v97) ^ 0xCCu));
  int v129 = *(_DWORD *)(v23 + 4LL * (BYTE1(v104) ^ 0x2Du));
  int v130 = v129 ^ v128 ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v125) ^ 0x80));
  HIDWORD(v131) = v130 ^ 4;
  LODWORD(v131) = v130 ^ 0xEE51D190;
  int v132 = (v131 >> 3) - ((2 * (v131 >> 3)) & 0x6DBE7FEE) - 1226883081;
  unsigned int v133 = v125 ^ 0x39;
  int v134 = *(_DWORD *)(v102 + 4LL * (v105 ^ 0x33u));
  HIDWORD(v131) = v134;
  LODWORD(v131) = v134 ^ 0xB0CC4200;
  int v135 = v132 ^ ((v131 >> 3) - ((2 * (v131 >> 3)) & 0x13BADB9C) + 165506510);
  HIDWORD(v131) = v135 ^ 0x1EB1DB95;
  LODWORD(v131) = v135 ^ 0x60000000;
  unsigned int v136 = (v131 >> 29) - ((2 * (v131 >> 29)) & 0xD14EA442) + 1755796001;
  unsigned int v137 = v110 ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v125) ^ 0x47u)) ^ v117 ^ *(_DWORD *)(v102
                                                                                  + 4LL
                                                                                  * (((v98 - v123) ^ 0xAB) + ((2 * (v98 - v123)) & 0x56) + 85));
  unsigned int v138 = LODWORD(STACK[0x240]) ^ *(_DWORD *)(v20 + 4LL * (BYTE2(v125) ^ 0x6Fu)) ^ v111;
  LODWORD(STACK[0x218]) = BYTE1(v136) ^ 0x19;
  LODWORD(STACK[0x230]) = v138 ^ 0x9B;
  int v139 = *(_DWORD *)(v23 + 4LL * v126);
  LODWORD(STACK[0x228]) = ((v131 >> 29) - ((2 * (v131 >> 29)) & 0x42) + 33) ^ 0xA7;
  uint64_t v140 = v102;
  unsigned int v141 = v127 ^ v139 ^ *(_DWORD *)(v102 + 4LL * v133);
  int v142 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v137) ^ 0xAE)) ^ 0x5C7AE6B1;
  unsigned int v143 = *(_DWORD *)(v20 + 4LL * (BYTE2(v138) ^ 0xA0u)) ^ 0x81C516C1;
  int v144 = 2 * ((v143 & v142) - ((2 * (v143 & v142)) & 0x3EE97BE8)) + 1055489000;
  unsigned int v145 = ((v143 + v142) ^ 0x1FEFF3FF)
       + ((2 * (v143 + v142)) & 0x3FDFE7FE)
       + (v144 ^ 0x34F33B7D)
       + ((2 * v144) & 0xEBCB7ED4 ^ 0x963D892F)
       + 1;
  LODWORD(STACK[0x240]) = v145 - ((2 * v145 - 1410623784) & 0xCCF133E6) + 1013867871;
  LODWORD(STACK[0x220]) = v141 ^ 0x94;
  int v146 = v128 ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v109) ^ 0xDA));
  LOWORD(v128) = (v109 ^ 0x28) - ((2 * (v109 ^ 0x28)) & 0x174) + 22458;
  unsigned int v147 = (v127 ^ 0xDDBFF070) + (v127 ^ v139 ^ 0x11AE2E6B) + 1;
  unsigned int v148 = (v139 ^ ((v139 ^ 0xCC11DE1B) - ((2 * (v139 ^ 0xCC11DE1B) + 2) & 0x360BB2AA) - 1694115498) ^ 0xB7448A2A ^ (v147 - ((2 * v147) & 0x3F5EE536) + 531591835))
       + (v127 ^ 0xDDBFF070);
  unsigned int v149 = v146 ^ v134 ^ v129;
  unsigned int v150 = (v148 + 439962699 + (~(2 * v148) | 0xCB8D676B)) ^ *(_DWORD *)(v102
                                                                     + 4LL
                                                                     * (((v128 & 0x13BF ^ 0xA61981A9)
                                                                       + (v128 & 0xC40 ^ 0x10200401)
                                                                       - 1) ^ 0xB63992FC));
  LODWORD(STACK[0x200]) = v118;
  unsigned int v151 = *(_DWORD *)(v20 + 4LL * (BYTE2(v150) ^ 0xA0u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v149) ^ 0xB7)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v118) ^ 0x77u)) ^ 0xEE51D194;
  unsigned int v152 = *(_DWORD *)(v102 + 4LL * (v116 ^ 0xC8u)) ^ 0xB0CC4200;
  int v153 = (v152 + v151) ^ 0x3F5FDFFF;
  int v154 = (2 * (v152 + v151)) & 0x7EBFBFFE;
  unsigned int v155 = HIBYTE(v116) ^ 0x49;
  int v156 = ((2 * (v120 ^ 0x6CA7C1A7)) | 0x3E3A1B96) - (v120 ^ 0x6CA7C1A7) + 1625485877;
  unsigned int v157 = (v156 & 0x8AEB15EE ^ 0x6A1524) + (v156 ^ 0xAF912ACB) - ((v156 ^ 0xAF912ACB) & 0x8AEB15EE);
  int v158 = 2 * ((v152 & v151) - ((2 * (v152 & v151)) & 0x78AA964C)) + 2024445516;
  unsigned int v159 = v158 ^ 0xF619FE8D;
  unsigned int v160 = (2 * v158) & 0xE2992E7C ^ 0x1FEED3E7;
  int v161 = *(_DWORD *)(v20 + 4LL * (BYTE2(v118) ^ 0xE1u)) ^ *(_DWORD *)(v23 + 4LL * (BYTE1(v116) ^ 0x66u)) ^ *(_DWORD *)(v102 + 4LL * (v149 ^ 0x74u)) ^ *(_DWORD *)(v21 + 4LL * (HIBYTE(v150) ^ 0xA4));
  unsigned int v162 = v121 - 272676472;
  if (!v38) {
    unsigned int v162 = -553307086 - v121;
  }
  int v163 = *(_DWORD *)(v23 + 4LL * LODWORD(STACK[0x218]));
  int v164 = *(_DWORD *)(v23 + 4LL * (BYTE1(v137) ^ 0x77u));
  int v165 = *(_DWORD *)(v23 + 4LL * (BYTE1(v141) ^ 0xC9u));
  int v166 = *(_DWORD *)(v23 + 4LL * (BYTE1(v138) ^ 0x8Du));
  int v167 = *(_DWORD *)(v23 + 4LL * (BYTE1(v149) ^ 0x95u));
  int v168 = *(_DWORD *)(v23 + 4LL * (BYTE1(v150) ^ 0x54u));
  unsigned int v169 = HIBYTE(v136) ^ 0x8C;
  int v170 = *(_DWORD *)(v20 + 4LL * (BYTE2(v141) ^ 0xC8u));
  int v171 = *(_DWORD *)(v20 + 4LL * (BYTE2(v137) ^ 0xE1u));
  int v172 = *(_DWORD *)(v20 + 4LL * (BYTE2(v136) ^ 0x3Fu));
  int v173 = *(_DWORD *)(v20 + 4LL * (BYTE2(v149) ^ 0x99u));
  int v174 = *(_DWORD *)(v21 + 4LL * v169);
  int v175 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v141) ^ 0x50));
  int v176 = *(_DWORD *)(v21 + 4LL * (HIBYTE(v138) ^ 0xFC));
  int v177 = *(_DWORD *)(v21 + 4LL * v155);
  unsigned int v178 = v153 + v154 + v159 + v160 + 1 - ((2 * (v153 + v154 + v159 + v160 + 1) + 1675193984) & 0xC7FAB04C) - 1779822746;
  HIDWORD(v179) = v168 ^ 0x33EE21E4;
  LODWORD(v179) = v168;
  int v180 = (v179 >> 31) - ((2 * (v179 >> 31)) & 0xF5AB7C2E) - 86655465;
  HIDWORD(v179) = v177 ^ v173 ^ 0x5DBFF070;
  LODWORD(v179) = v177 ^ ~v173;
  uint64_t v181 = v140;
  unsigned int v182 = v157 ^ v167 ^ *(_DWORD *)(v140 + 4LL * (v150 ^ 0x4Au)) ^ (LODWORD(STACK[0x238])
                                                                                  - 1734491869
                                                                                  + v162
                                                                                  - ((2
                                                                                    * (LODWORD(STACK[0x238])
                                                                                     - 1734491869
                                                                                     + v162)) & 0xF36FF44C)
                                                                                  - 105383386);
  int v183 = *(_DWORD *)(v140 + 4LL * LODWORD(STACK[0x228]));
  int v184 = *(_DWORD *)(v140 + 4LL * LODWORD(STACK[0x220]));
  HIDWORD(v179) = ((v179 >> 31) - ((2 * (v179 >> 31)) & 0x6DAC7696) + 920009547) ^ v180;
  LODWORD(v179) = HIDWORD(v179) ^ 0xCC03855C;
  unsigned int v185 = v170 ^ v164 ^ *(_DWORD *)(v140 + 4LL * LODWORD(STACK[0x230])) ^ 0xAF853482 ^ v174;
  int v186 = v161;
  unsigned int v187 = ((2 * ((v183 ^ v175 ^ v171 ^ v166 ^ 0xA1D06E82) + 1401411191)) & 0x2DF7FD5E)
       + (((v183 ^ v175 ^ v171 ^ v166 ^ 0xA1D06E82) + 1401411191) ^ 0x96FBFEAF)
       + (v161 ^ 0x5E2F917D);
  unsigned int v188 = (v176 ^ v165 ^ *(_DWORD *)(v140 + 4LL * (v137 ^ 0x3Cu)) ^ 0xF3919425 ^ v172) - 1947476229;
  unsigned int v189 = v188 ^ 0xFDAF7C99;
  unsigned int v190 = (2 * v188) & 0xFB5EF932;
  int v191 = ((v179 >> 1) - ((2 * (v179 >> 1)) & 0x55E22780) + 720442304) ^ *(_DWORD *)(v181
                                                                                  + 4LL
                                                                                  * (LODWORD(STACK[0x200]) ^ 0x3Cu));
  unsigned int v192 = ((2 * v191) & 0x4FFE17F4 ^ 0x4E6204E0) + (v191 ^ 0x90CE5D8B);
  LODWORD(v181) = v189
                + v190
                + v192
                + ((2 * v192 - 1342052340) ^ 0x80A40301)
                - ((2 * (2 * v192 - 1342052340)) & 0xFEB7F9FC)
                - 1157913626;
  unsigned int v193 = (v187 - ((2 * v187 + 302514852) & 0x16F746B6) - 192961363) ^ 0xF7FE4AF3;
  unsigned int v194 = ((1705919010 * v193) & 0x5F6DFBF0) + ((-220782319 * v193) ^ 0xAFB6FDF8) + 2004876992;
  int v195 = ((2 * (v185 + 1269039754)) & 0x7FFB5FFA) + ((v185 + 1269039754) ^ 0x3FFDAFFD) + (v178 ^ 0x6D1A00CF);
  LODWORD(v181) = (v181 - ((2 * v181 + 1029939468) & 0xC9362E20) - 2092111978) ^ 0x6273FC38;
  LODWORD(v181) = ((1659417479 * v181) ^ 0x5B7FFDFD) + ((-976132338 * v181) & 0xB6FFFBFA);
  unsigned int v196 = (v195 - ((2 * v195 + 303112) & 0x4D9154E4) + 1724578422) ^ 0xED72BEF6;
  unsigned int v197 = (v163 ^ v184 ^ 0xEA6BE3A9 ^ LODWORD(STACK[0x240])) - 1381455132;
  int v198 = ((2 * v197) & 0x7D6DDB9A) + (v197 ^ 0x3EB6EDCD) + (v182 ^ 0xE16A7B);
  unsigned int v199 = (v198 - ((2 * v198 - 2104351640) & 0xA27304F0) - 1836936020) ^ 0xEFE813C7;
  unsigned int v200 = ((1749830113 * v199) ^ 0x7F57F5CD) + ((-795307070 * v199) & 0xFEAFEB9A);
  unsigned int v201 = v194 + ((1964916222 * v196) & 0xCDEBF7EC) + ((-1165025537 * v196) ^ 0x66F5FBF6);
  unsigned int v202 = v201 - 8471108;
  int v203 = v181 + v200 - ((2 * (v181 + v200) + 1246763116) & 0x72538D1C) - 565062972;
  unsigned int v204 = v201 + 1909655378;
  unsigned int v205 = ((v201 + 1909655378) ^ 0xB929C68E ^ v203)
       - ((2 * ((v201 + 1909655378) ^ 0xB929C68E ^ v203)) & 0x8FB3B604)
       - 942023934;
  int v206 = v181 - (v201 - 8471108) - ((2 * (v181 - (v201 - 8471108)) + 72839386) & 0x1841BA62) + 1045206430;
  unsigned int v207 = v194
       + ((1590614140 * v199) & 0xFFFC1FAC)
       + ((795307070 * v199) ^ 0x7FFE0FD7)
       + v200
       + 1572203430
       + (v206 ^ 0xF3DF22CE);
  int v208 = v207 - ((2 * v207 + 2004493310) & 0x763A9F08) - 1227202173;
  unsigned int v209 = (v203 ^ ((v203 ^ 0x46D63971) - ((2 * (v203 ^ 0x46D63971) + 2) & 0x7075A36) + 58961180) ^ 0xCA747CA8 ^ ((v205 ^ 0x382624FD) + v202 - ((2 * ((v205 ^ 0x382624FD) + v202) - 458714322) & 0xE1BC2E7A) - 483237676))
       + v204;
  unsigned int v210 = v209 - ((2 * v209) & 0xE0C7DB1E) - 261886577;
  int v211 = 2
       * (((v208 ^ 0x3B1D4F84) & (v206 ^ 0xC20DD31)) - ((2 * ((v208 ^ 0x3B1D4F84) & (v206 ^ 0xC20DD31))) & 0x34E391EE))
       - 1260154386;
  int v212 = (v206 ^ 0x373D92B5 ^ v208) + (v211 ^ 0xB1C5C15) + 1073754629 + ((2 * v211) & 0x7FFF9BF4 ^ 0x69C703D4);
  unsigned int v213 = ((2 * v212) & 0xFE25A29E) + (v212 ^ 0x7F12D14F);
  unsigned int v214 = (v210 ^ 0xF063ED8F)
       - v213
       + 2131939663
       - ((2 * ((v210 ^ 0xF063ED8F) - v213 + 2131939663)) & 0x8432846A)
       + 1108951605;
  int v215 = v214 ^ v208;
  LODWORD(v181) = (2 * (v215 & 0x800)) ^ 0x1000 | v215 & 0x800;
  BOOL v38 = (((_DWORD)v181 - 2048) & (v210 ^ v203 ^ 0x494A2800)) == ((2
                                                                * (((_DWORD)v181 - 2048) & (v210 ^ v203 ^ 0x494A2800))) & 0x1DCC4C28);
  unsigned int v216 = (v215 & 0xFFFFF7FF ^ 0x98B9444C)
       + (v215 & 0xB67781FF ^ 0x264681B3)
       - ((v215 & 0xFFFFF7FF ^ 0x98B9444C) & 0xB67781FF);
  int v217 = v181 + 123654143;
  unsigned int v218 = (v216 & 0xA32BD104 ^ 0x215105) + (v216 & 0x5CD42EFB);
  int v219 = v181 ^ 0x75EDFFF;
  if (v38) {
    int v219 = v217;
  }
  int v220 = ((v210 ^ v203 ^ 0x494A2B01)
        - 123656191
        + v219
        - ((2 * ((v210 ^ v203 ^ 0x494A2B01) - 123656191 + v219)) & 0x36FEE772)
        + 461337529) ^ (v218 - 1);
  unsigned int v221 = ((2 * (v213 - 2131939663 + (v220 ^ 0x4C94E2BF))) & 0x7F7FFEFE)
       + ((v213 - 2131939663 + (v220 ^ 0x4C94E2BF)) ^ 0xBFBFFF7F);
  unsigned int v222 = ((2 * ((v178 ^ 0x92E5FF30) + (v214 ^ 0xBDE6BDCA) + 1)) & 0xFBF93E7E)
       + (((v178 ^ 0x92E5FF30) + (v214 ^ 0xBDE6BDCA) + 1) ^ 0x7DFC9F3F);
  unsigned int v223 = ((2 * ((v182 ^ 0xFF1E9584) + (v220 ^ 0xB36B1D40) + 1)) & 0x1FFEBFF8)
       + (((v182 ^ 0xFF1E9584) + (v220 ^ 0xB36B1D40) + 1) ^ 0xFFF5FFC);
  unsigned int v224 = v222 - ((2 * v222 - 72472868) & 0xA05116F6) - 838885655;
  unsigned int v225 = ((2 * ((v186 ^ 0xA1D06E82) + (v215 ^ 0x86FBF24E) + 1)) & 0xBD7FDFAE)
       + (((v186 ^ 0xA1D06E82) + (v215 ^ 0x86FBF24E) + 1) ^ 0xDEBFEFD7);
  unsigned int v226 = v223 - 2 * ((v223 + 124995136) & 0x6F922B3 ^ v223 & 0x11) - 429102878;
  unsigned int v227 = v225 - ((2 * v225 + 1701879372) & 0x49AC7DC0) + 1468960262;
  unsigned int v228 = v192 + v221 + ((2 * v221 - 2139094782) ^ 0x81141341) - ((2 * (2 * v221 - 2139094782)) & 0xFDD7D97C) - 42115394;
  int v229 = *(_DWORD *)(STACK[0x17E8] + 4LL * (BYTE2(v227) ^ 0xD6u));
  unsigned int v230 = v228 - ((2 * v228 + 1016991536) & 0xB5BA8388) + 2032945500;
  int v231 = *(_DWORD *)(STACK[0x17F0] + 4LL * (HIBYTE(v224) ^ 0x50));
  HIDWORD(v232) = v231 ^ 0x11639837 ^ v229;
  LODWORD(v232) = v231 ^ ~v229;
  int v233 = (v232 >> 30) - ((2 * (v232 >> 30)) & 0xB73FFACA) + 1537211749;
  HIDWORD(v232) = v233 ^ 0x1FFD65;
  LODWORD(v232) = v233 ^ 0x5B800000;
  int v234 = (v232 >> 23) - ((2 * (v232 >> 23)) & 0xB6EF8984) - 612907838;
  HIDWORD(v232) = *(_DWORD *)(STACK[0x17E0] + 4LL * (BYTE1(v226) ^ 0x22u)) ^ 0x996194;
  LODWORD(v232) = *(_DWORD *)(STACK[0x17E0] + 4LL * (BYTE1(v226) ^ 0x22u));
  int v235 = (v232 >> 30) - ((2 * (v232 >> 30)) & 0x60E79E64) - 1334587598;
  HIDWORD(v232) = v234 ^ 0x52;
  LODWORD(v232) = v234 ^ 0xA4F11400;
  int v236 = ((v232 >> 9) - ((2 * (v232 >> 9)) & 0x7AFB60FE) - 1115836289) ^ v235;
  HIDWORD(v232) = v236 ^ 1;
  LODWORD(v232) = v236 ^ 0xD0E7F4C;
  unsigned int v237 = (v222 - ((2 * v222 - 36) & 0xF6) - 23) ^ 0x7B;
  int v238 = *(_DWORD *)(STACK[0x17F8] + 4LL * ((v228 - ((2 * v228 + 48) & 0x88) + 92) ^ 0xC4u)) ^ 0x67BF7E06 ^ ((v232 >> 2) - ((2 * (v232 >> 2)) & 0x8AB561EE) - 983912201);
  unsigned int v239 = HIBYTE(v230) ^ 0x5A;
  unsigned int v240 = ((v238 & 0xA2CFB8DB ^ 0xC090C9)
        + (v238 & 0x8285908B ^ 0x9E254122)
        - ((v238 & 0xA2CFB8DB ^ 0xC090C9) & 0x8285908B)) ^ 0x8CB7D1A0;
  int v241 = ((2 * v240) | 0x2F42E124) - v240 + 1751027566;
  int v242 = *(_DWORD *)(STACK[0x17E8] + 4LL * (BYTE2(v226) ^ 0xF9u));
  int v243 = *(_DWORD *)(STACK[0x17E0] + 4LL * (BYTE1(v230) ^ 0x41u));
  unsigned int v244 = BYTE2(v230) ^ 0xDD;
  int v245 = *(_DWORD *)(STACK[0x17E8] + 4LL * (BYTE2(v224) ^ 0x28u));
  int v246 = *(_DWORD *)(STACK[0x17E8] + 4LL * v244);
  int v247 = *(_DWORD *)(STACK[0x17E0] + 4LL * (BYTE1(v227) ^ 0x3Eu));
  int v248 = *(_DWORD *)(STACK[0x17F8] + 4LL * v237);
  int v249 = *(_DWORD *)(STACK[0x17F0] + 4LL * (HIBYTE(v227) ^ 0x24));
  unsigned int v250 = v241 ^ 0x7B16082 | ((v238 & 0x5D304724 ^ 0xAB6C6D8F) - 1) ^ 0xEA5C2C8E;
  int v251 = *(_DWORD *)(STACK[0x17F0] + 4LL * v239);
  int v252 = *(_DWORD *)(STACK[0x17F0] + 4LL * (HIBYTE(v226) ^ 6)) ^ *(_DWORD *)(STACK[0x17F8]
                                                                           + 4LL * (v227 ^ 0xE0u)) ^ *(_DWORD *)(STACK[0x17E0] + 4LL * (BYTE1(v224) ^ 0x8Bu));
  int v253 = STACK[0x164C];
  int v254 = *(_DWORD *)(STACK[0x17F8] + 4LL * (v226 ^ 0xA2u));
  int v255 = STACK[0x1654];
  int v256 = v252 ^ LODWORD(STACK[0x164C]) ^ LODWORD(STACK[0x1654]) ^ v246;
  HIDWORD(v232) = v256 ^ 0x32740975;
  LODWORD(v232) = v256 ^ 0x80000000;
  unsigned int v257 = v250 - ((2 * v250) & 0x92DD01DE) + 1231978735;
  int v258 = STACK[0x1640];
  LODWORD(STACK[0x974]) = LODWORD(STACK[0x1654]) ^ LODWORD(STACK[0x164C]) ^ LODWORD(STACK[0x1640]) ^ v257;
  int v259 = LODWORD(STACK[0x1800]) ^ ((v232 >> 30) - 1691857799 + (~(2 * (v232 >> 30)) | 0xC9AF670F));
  unsigned int v260 = v247 ^ v245 ^ v254 ^ v253 ^ v255 ^ v258 ^ v251;
  LODWORD(STACK[0x978]) = v260;
  LODWORD(STACK[0x97C]) = v249 ^ v248 ^ v242 ^ v253 ^ v255 ^ v258 ^ v243;
  HIDWORD(v232) = v259;
  LODWORD(v232) = v259 ^ 0x87B9253C;
  unsigned int v261 = (v232 >> 2) - ((2 * (v232 >> 2)) & 0xD9220AAE) - 326040233;
  LODWORD(STACK[0x980]) = v261;
  LODWORD(STACK[0xAC8]) = LOWORD(STACK[0x976]);
  LODWORD(STACK[0xACC]) = HIBYTE(v261);
  LODWORD(STACK[0xAD0]) = HIWORD(v260);
  v261 >>= 16;
  LODWORD(STACK[0xAD4]) = v261;
  LOBYTE(STACK[0xADB]) = v261;
  LOBYTE(v260) = byte_188744FC0[v260 ^ 0x6CLL];
  LOBYTE(STACK[0x5C3]) = ((~(102 * v260 + 72) | 0x6F) + 51 * v260 + 109) ^ (102 * v260
                                                                          - 2
                                                                          * ((102 * v260 + 8) & 0x3A ^ (102 * v260) & 2)) ^ 0x71;
  JUMPOUT(0x18870A8FCLL);
}

void sub_18871A338()
{
  LOBYTE(STACK[0x5C3]) = (LOBYTE(STACK[0xAF3]) ^ 0xD8) & STACK[0x74F];
  JUMPOUT(0x1886F4BF8LL);
}

void sub_18871A364()
{
  LOBYTE(STACK[0x5C3]) = LOBYTE(STACK[0x74F]) ^ LOBYTE(STACK[0xB0F]) ^ LODWORD(STACK[0xB08]) ^ LODWORD(STACK[0xAD4]) ^ LOBYTE(STACK[0xB0E]) ^ 0xEF;
  JUMPOUT(0x1886F4BF8LL);
}

void sub_18871A414()
{
}

uint64_t sub_18871A4A0@<X0>(uint64_t a1@<X8>)
{
}

void sub_18871A4D0(void *a1)
{
}

uint64_t sub_18871A520( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  **(_DWORD **)(v74 + 3560) = STACK[0x50C];
  **(void **)(v74 + 3568) = a71;
  STACK[0x368] = *(void *)(v73 + 528);
  CFRelease(*(CFTypeRef *)(v73 + 200));
  CFRelease(*(CFTypeRef *)(v74 + 3576));
  return (*(uint64_t (**)(void))(v72
                              + 8LL
                              * (int)((((v71 - 2146686904) | 0x16610503) + 1771230346) ^ v71 ^ (1003
                                                                                              * ((((-v71 | v71) >> ((v71 + 80) ^ 0x4F)) & 1) == 0)))))();
}

uint64_t sub_18871A720(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (v2 ^ ((a1 == 0) * v3))) - ((((v2 - 233) | 0x198u) + 239) ^ 0x28FLL)))();
}

uint64_t sub_18871A760@<X0>(int a1@<W8>)
{
  uint64_t v4 = (a1 - 260) | 0x441u;
  int v5 = (uint64_t (*)(void))(*(void *)(v1
                                     + 8LL
                                     * ((654 * (*(_DWORD *)(v2 + 16) - 1807441114 < (((a1 - 88) | 1) ^ 0xFFFFFEB8))) ^ a1))
                         - (v4 ^ 0x4DD));
  LODWORD(STACK[0xD3C]) = v4;
  *(void *)(v3 + 2096) = 165538427LL;
  return v5();
}

void sub_18871A7CC()
{
  uint64_t v2 = *(void *)(v1 + 2096);
  *(void *)(v1 + 2104) = v2;
  int v3 = STACK[0xD3C];
  LODWORD(STACK[0xD50]) = STACK[0xD3C];
  LODWORD(STACK[0xD54]) = v3 - 1771231114;
  LODWORD(STACK[0xD58]) = v3 - 447;
  v2 -= 165538427LL;
  LOBYTE(STACK[0xD5F]) = *((_BYTE *)&STACK[0x409] + v2);
  uint64_t v4 = **(void **)(v1 + 3496) + v2;
  *(void *)(v1 + 2128) = v4;
  *(void *)(v1 + 576) = v4;
  *(void *)(v1 + 560) = *(void *)(v0 + 8LL * (v3 ^ 0x1D6)) - 4LL;
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_18871A85C(uint64_t a1)
{
  return ((uint64_t (*)(void))(*(void *)(v1 + 8LL * (((a1 != 0) * (v2 - 104)) ^ v2)) - 8LL))();
}

uint64_t sub_18871A88C(unint64_t a1)
{
  int v4 = v2 + 326;
  unint64_t v5 = sub_188725908(a1);
  uint64_t v6 = (v2 - 154);
  STACK[0x368] = *(void *)(v3 + 3480);
  if (LODWORD(STACK[0x12A4]) == (v4 ^ 0x287)) {
    int v7 = 1;
  }
  else {
    int v7 = v1;
  }
  return ((uint64_t (*)(unint64_t))(qword_18A26FDB0[(8 * v7) | (16 * v7) | v4] - (v6 ^ 0xAF)))(v5);
}

uint64_t sub_18871A8F0()
{
  int v2 = v1 - v0 - 337;
  LODWORD(STACK[0x2318]) = 438484896;
  int v3 = MGGetBoolAnswer();
  return ((uint64_t (*)(void))(qword_18A26FDB0[(v3 * ((v1 ^ 0x33D) + 1771229876 + v2 + 317)) ^ v1] - 8LL))();
}

uint64_t sub_18871AA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8LL * ((38 * (((STACK[0x2338] == 0) ^ (v5 - 84)) & 1)) ^ v5)))();
}

void sub_18871AA6C()
{
}

uint64_t sub_18871AACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5 + 8LL * (v6 | (2 * (v5 + 1 != v7 + 12)))) - (((v6 + 285) | 0x44u) ^ 0x452LL)))();
}

uint64_t sub_18871AB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * ((230
                                          * (*(_DWORD *)(v6 + 24 * (v5 + ((v7 - 865) | 0x200u)) - 2389498304LL) != v8)) ^ v7))
                            - 4LL))();
}

uint64_t sub_18871AB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_18871AACC(a1, a2, a3, a4, a5);
}

uint64_t sub_18871AB84@<X0>(int a1@<W8>)
{
  int v3 = v1 + 11;
  *(void *)(v2 + 112) = &STACK[0x3336B5A2487B6B8C];
  LODWORD(STACK[0x34C]) = a1;
  unint64_t v4 = sub_18872562C(a1 - 744476356 + ((v1 - 499) | 0x258u), 0x32u, -843709004);
  STACK[0x480] = v4 + 0x2061722DFEAF01F1LL;
  return ((uint64_t (*)(void))qword_18A26FDB0[((v4 != 0) * (v3 + 1072)) ^ v3])();
}

uint64_t sub_18871AC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  LODWORD(STACK[0x2B0]) = 987433689;
  LODWORD(STACK[0x17A4]) = 694123958;
  int v7 = (v5 - 648) | 0x305;
  int v8 = STACK[0x2250];
  *(void *)(v6 + 384) = &STACK[0x2250];
  int v9 = *(uint64_t (**)(void))(a5 + 8LL * (((v8 != 1896455922) * (v7 ^ 0x36B)) ^ (v5 + 327)));
  LODWORD(STACK[0x1058]) = v7;
  return v9();
}

uint64_t sub_18871AC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_18871ACB4()
{
  unint64_t v4 = *(char **)(v2 + 3488);
  v1[31] = v4 + 0x7182805D305DBF8CLL;
  sub_1887259EC(aV, v4, 0xFuLL);
  uint64_t v5 = *(void *)(v2 + 3488);
  *(void *)(v5 + 24) = 0LL;
  v5 += 24LL;
  v1[32] = v5;
  *(_DWORD *)(v5 + 8) = 1807441107;
  v1[33] = v5 + 8;
  uint64_t v6 = qword_18A26FDB0[v0];
  STACK[0x23D8] = v1[31];
  STACK[0x23C8] = v6
                - 591644117
                * ((2 * ((v3 - 200) & 0x227232F5C56AA7C0LL) - (v3 - 200) - 0x227232F5C56AA7C5LL) ^ 0x3996EDC3A190127CLL);
  *(_DWORD *)(v3 - 176) = v0
                        - 591644117 * ((2 * ((v3 - 200) & 0xC56AA7C0) - (v3 - 200) + 982865979) ^ 0xA190127C)
                        + 1601233026;
  sub_18871DC68(v3 - 200);
  return ((uint64_t (*)(void))(qword_18A26FDB0[v0 ^ (21 * (*(_DWORD *)(v3 - 192) == 803790352)) ^ 0x362 ^ (26 * (v0 ^ 0xA8))]
                                         - 12LL))(*(void *)v1[32]);
}

uint64_t sub_18871ADE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
}

uint64_t sub_18871AE4C@<X0>(int a1@<W8>)
{
  int v4 = (a1 - 166) | 0x2B;
  uint64_t v5 = *(uint64_t (**)(void))(v1
                           + 8LL
                           * ((795
                             * (((a1 + 374089737) | 0x80210408) + **(_DWORD **)(v2 + 264) - 36211245 >= (v4 ^ 0xFFFFFF4E))) ^ a1));
  LODWORD(STACK[0xC6C]) = v4;
  *(void *)(v3 + 1888) = 1534643044LL;
  return v5();
}

uint64_t sub_18871AEE4(unint64_t a1)
{
  unint64_t v5 = *(void *)(v2 + 248);
  **(void **)(v2 + 256) = 0LL;
  **(_DWORD **)(v2 + 264) = 1807441107;
  uint64_t v6 = qword_18A26FDB0[v1 + 1771230044];
  unint64_t v7 = 591644117
     * ((-2LL - ((~(v4 - 200) | 0xCC8E7951834DA055LL) + ((v4 - 200) | 0x337186AE7CB25FAALL))) ^ 0x289559981848EA12LL);
  STACK[0x23D8] = v5;
  STACK[0x23C8] = v6 - v7;
  *(_DWORD *)(v4 - 176) = -922504226 - v7 + v1;
  sub_18871DC68(v4 - 200);
  return ((uint64_t (*)(void))qword_18A26FDB0[((*(_DWORD *)(v4 - 192) == 803790352) * (v1 + 1771231314)) ^ ((v1 ^ 0x966D2C1F) + v1 + 1771230044)])(**(void **)(v2 + 256));
}

uint64_t sub_18871AEFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1 + 8LL * (((a1 == 0) * ((v2 ^ 0x3BA) - 537)) ^ v2)))();
}

uint64_t sub_18871AF2C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * (int)(((v0 + ((2 * v3) ^ 0x528) + ((v3 - 1611711709) & 0xF67DEFEB) - 333) * v2) | v3)))();
}

uint64_t sub_18871AF68()
{
  int Length = CFDataGetLength(*(CFDataRef *)(v2 + 344));
  int v5 = Length - ((v0 - 633444260) & (2 * Length)) - 316721573;
  LODWORD(STACK[0x13FC]) = v5 ^ 0x9C16A8A9;
  LODWORD(STACK[0x478]) = v5 ^ 0x9C16A8A9;
  uint64_t v6 = malloc(v5 ^ 0xED1F365B);
  *(void *)(v3 + 3824) = v6;
}

void sub_18871AFF8()
{
}

void sub_18871B060()
{
}

void sub_18871B108()
{
  int v4 = STACK[0x1058];
  LODWORD(STACK[0x105C]) = STACK[0x1058];
  int v5 = v4 ^ (v1 + 235);
  LODWORD(STACK[0x1060]) = v5;
  LODWORD(STACK[0x1064]) = v5;
  uint64_t v6 = *(void *)(v2 + 112) + 24 * v0;
  *(void *)(v3 + 2904) = v6;
  LOBYTE(v6) = *(_BYTE *)(v6 - 0x3336B5A2487B494CLL);
  unint64_t v7 = STACK[0x480];
  *(void *)(v3 + 2912) = STACK[0x480];
  int v8 = STACK[0x17A4];
  LODWORD(STACK[0x1078]) = LODWORD(STACK[0x17A4]) + (v5 ^ 0x9DBDEAF1);
  LODWORD(v7) = 83590351
              * (((v8 + v7 - 694123958) ^ *(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x8BA2CDCC))) & 0x7FFFFFFF);
  unint64_t v9 = 83590351 * (v7 ^ WORD1(v7));
  LOBYTE(STACK[0x5C3]) = v6 ^ byte_188743530[v9 >> 24] ^ byte_18873E970[(v9 >> 24) + 1] ^ byte_18873F8B0[(v9 >> 24) + 2] ^ v9 ^ (-55 * BYTE3(v9)) ^ 0xEA;
  JUMPOUT(0x1886F4BF4LL);
}

uint64_t sub_18871B244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  STACK[0x398] = STACK[0x480];
  LODWORD(STACK[0x320]) = STACK[0x34C];
  return ((uint64_t (*)(void))(*(void *)(a5
                                        + 8LL
                                        * (int)((53
                                               * (((((v5 + 2137460990) & 0x8098EF5B) - 1593241435) & 0x5EF6EF9F) == 0x39F)) ^ (v5 + 2137460990) & 0x8098EF5B))
                            - 4LL))();
}

uint64_t sub_18871B304(unint64_t a1)
{
  unint64_t v2 = sub_188725908(a1);
  STACK[0x2350] = 0LL;
  LODWORD(STACK[0x2358]) = v1;
  return sub_18871AA30(v2, v3, v4, v5, (uint64_t)qword_18A26FDB0);
}

uint64_t sub_18871B330()
{
  return (*(uint64_t (**)(void))(v0
                              + 8LL
                              * (((**(void **)(v1 + 256) == 0LL)
                                * ((((LODWORD(STACK[0xC84]) + 1294404517) | 2) ^ 0x3BA) - 537)) ^ ((LODWORD(STACK[0xC84])
                                                                                                  + 1294404517) | 2))))();
}

uint64_t sub_18871B348( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  LODWORD(STACK[0x2240]) = 438484906;
  unsigned int v19 = off_18C723C50;
  v18[25] = v17 + 117 + *off_18C723C50 + 53;
  v18[26] = v19[1] - 22;
  v18[27] = v19[2] + ((v17 + 127) ^ 0x55);
  v18[28] = v19[3] - 22;
  v18[29] = v19[4] - 22;
  v18[30] = v19[5] - 22;
  v18[31] = v19[6] - 22;
  v18[32] = v19[7] - 22;
  v18[33] = v19[8] - 22;
  v18[34] = v19[9] - 22;
  v18[35] = v19[10] - 22;
  v18[36] = v19[11] - 22;
  v18[37] = v19[12] - 22;
  v18[38] = v19[13] - 22;
  v18[39] = v19[14] - 22;
  v18[40] = v19[15] - 22;
  v18[41] = v19[16] - 22;
  v18[42] = v19[17] - 22;
  v18[43] = v19[18] - 22;
  v18[44] = v19[19] - 22;
  v18[45] = v19[20] - 22;
  v18[46] = v19[21] - 22;
  v18[47] = off_18C723C50[22] - 22;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v21 = CFStringCreateWithCString(0LL, (const char *)&STACK[0x2221], SystemEncoding);
  STACK[0x1468] = (unint64_t)v21;
  return ((uint64_t (*)(CFStringRef, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(694 * (v21 != 0LL)) | v17] - 4LL))( v21,  v22,  v23,  v24,  qword_18A26FDB0,  v25,  v26,  v27,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17);
}

uint64_t sub_18871B4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = MGCopyAnswer();
  *(void *)(v6 + 344) = v8;
  return (*(uint64_t (**)(void))(a5 + 8LL * (((v8 != 0) * ((20 * (v5 ^ 0x2A5)) ^ 0x143)) ^ v5)))();
}

uint64_t sub_18871B524()
{
  unsigned int v4 = (v0 + 388726086) & 0xE8D48374;
  unint64_t v5 = STACK[0x368];
  v3[493] = STACK[0x368];
  v3[494] = (char *)&STACK[0x19A0] + v5;
  STACK[0x368] = v5 + 64;
  v3[495] = (((v4 + 49) | 6) - 16 * (&STACK[0x19A0] + v5) + 105) & 0x10;
  CFTypeID v6 = CFGetTypeID(*(CFTypeRef *)(v2 + 344));
  uint64_t v7 = v6 ^ 0x6DFBFEBCF6FAF7BFLL;
  unint64_t v8 = (2 * v6) & 0xDBF7FD79EDF5EF7ELL;
  CFTypeID TypeID = CFStringGetTypeID();
  return (*(uint64_t (**)(void))(v1
                              + 8LL
                              * (int)((241
                                     * (v7
                                      + v8
                                      + (TypeID ^ (v4 - 579 - 0x73999FED8672F60ALL))
                                      - ((2 * TypeID) & 0xE7333FDB0CE5E9B8LL) != 0xFA625ECF708802E2LL)) ^ v4)))();
}

uint64_t sub_18871B618()
{
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(v2 + 344));
  uint64_t v4 = v3 ^ 0x69FEFFF5F4FBE7B1LL;
  unint64_t v5 = (2 * v3) & 0xD3FDFFEBE9F7CF62LL;
  CFTypeID TypeID = CFDataGetTypeID();
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
                                        * ((78
                                          * ((v0 + 274)
                                           + v4
                                           + v5
                                           + (TypeID ^ 0xA004152694083100LL)
                                           - ((((v0 - 663) | 0x44Au) - 0x40082A4D2810665CLL) & (2 * TypeID)) != 0xA03151C89041C6ALL)) ^ v0))
                            - 4LL))();
}

uint64_t sub_18871B72C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
}

uint64_t sub_18871B76C()
{
  unint64_t v2 = sub_18872562C(20LL, 0x32u, -608920269);
  *(void *)(v1 + 4024) = v2;
  return ((uint64_t (*)(void))(qword_18A26FDB0[((v2 != 0) * (((v0 - 25298110) & 0x97EF2FFB) + 1771231567)) ^ v0] - 12LL))();
}

void sub_18871B7D4()
{
  *(void *)(v1 + 80) = &STACK[0x2260];
  LODWORD(STACK[0xDA8]) = v0;
  LODWORD(STACK[0xDAC]) = 962405456;
  int v3 = STACK[0xDAC];
  LODWORD(STACK[0xDB0]) = STACK[0xDAC];
  int v4 = STACK[0xDA8];
  unsigned int v5 = 235 * (LODWORD(STACK[0xDA8]) ^ 0x966D2D49);
  LODWORD(STACK[0xDB4]) = v5;
  LODWORD(STACK[0xDB8]) = v4 ^ 0x966D2F45;
  LODWORD(STACK[0xDBC]) = v4 + 1771230775;
  uint64_t v6 = **(void **)(v1 + 80);
  int v7 = (v3 << (v5 ^ 0xD7)) - 1924810912;
  LODWORD(STACK[0xDC0]) = v7;
  int v8 = v7 ^ 0x36DFDFBD;
  v7 *= 2;
  LODWORD(STACK[0xDC4]) = v7;
  uint64_t v9 = v6 + (v7 & 0x6DBFBF78) + v8 + (v4 ^ 0x5F4D0D08);
  *(void *)(v2 + 2232) = v9;
  *(void *)(v2 + 576) = v9;
  JUMPOUT(0x18871B8B0LL);
}

void sub_18871B914()
{
  unsigned int v2 = LOBYTE(STACK[0x74F])
     + ((-54 * (LOBYTE(STACK[0xA50]) ^ 0x79)) & 0xFFFFFFF7)
     + ((101 * (LOBYTE(STACK[0xA50]) ^ 0x79)) ^ 0x7B)
     - 123;
  int v3 = v2 - ((2 * v2) & 0x12) + 9;
  int v4 = LODWORD(STACK[0xA38]) ^ 0x4A318B33 | LODWORD(STACK[0xA54]) ^ 0x3FC533E0;
  LODWORD(STACK[0xA58]) = v4 - 1765530277 - ((2 * v4) & 0x2D884AB6);
  int v5 = ((2 * v3) ^ 0x12) - ((2 * ((2 * v3) ^ 0x12)) & 0x5C) - 18;
  unsigned int v6 = (v3 ^ 0x31) - ((2 * v3) & 0xC) + (v5 & 0x70 ^ 0xFFFFFFB6) + ((2 * v5) & 0xFFFFFFA0) - 80;
  int v7 = byte_188746A10[v6 ^ 0xF6LL];
  int v8 = STACK[0x950];
  unsigned int v9 = STACK[0x950] & 0xFFFFFFF2 ^ 0x46A4394D;
  LODWORD(STACK[0xA5C]) = v9;
  int v10 = v9 - 1252337815 - ((2 * v9) & 0x6AB5AED2);
  LODWORD(STACK[0xA60]) = v10;
  int v11 = ((((v7 ^ v6 ^ 0x1F) - ((2 * (v7 ^ v6 ^ 0x1F)) & 0xB6)) << 24) + 1526726656) ^ 0x5B000000;
  LODWORD(STACK[0xA64]) = v11 - ((2 * v11) & 0x42000000) + 553653543;
  LODWORD(STACK[0xA68]) = (v8 & 0xFFFFFFF6 ^ 0x46A4394D)
                        - 1117481574
                        + ((2 * ((v8 & 0xFFFFFFF6 ^ 0x46A4394D) & 0x3D6495B2 ^ (v8 | 0x7FFFFFDF))) ^ 0x51)
                        + 1;
  *(void *)(v1 + 576) = *(void *)(v0 + 392) + (v10 ^ 0xB55AD769);
  *(void *)(v1 + 560) = 0x188717370LL;
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_18871BAF0()
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(v2 + 344));
  unint64_t v4 = (((((v0 - 947474040) & 0x38794FFFu) - 478) ^ 0xD5BEEABFDFFDF72CLL) & (2 * Length))
     + (Length ^ 0x6ADF755FEFFEFBFDLL);
  *(void *)(v2 + 120) = v4;
  int v5 = malloc(v4 - 0x6ADF755FEFFEFBFCLL);
  *(void *)(v2 + 128) = v5;
  STACK[0x500] = (unint64_t)v5;
  return (*(uint64_t (**)(void))(v1 + 8LL * ((868 * (v5 != 0LL)) ^ v0)))();
}

uint64_t sub_18871BB98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  uint64_t CString = CFStringGetCString(*(CFStringRef *)(v13 + 344), *(char **)(v13 + 128), v12, SystemEncoding);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[(921 * (((((_DWORD)CString << (v11 + 42)) & 0x7A) + (CString ^ 0x3D)) != ((v11 - 8) ^ 0xF2))) ^ v11] - 8LL))( CString,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  a9,  a10,  a11);
}

uint64_t sub_18871BC1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unsigned int v13 = LODWORD(STACK[0x16A0]) - ((v11 + 537003833 + (LODWORD(STACK[0x16A0]) << (v11 + 50))) & 0xE2133DE4) - 2130009354;
  LODWORD(STACK[0x478]) = v13;
  unint64_t v14 = sub_18872562C(v13 ^ 0x71099EF2, 0x32u, -1293645864);
  *(void *)(v12 + 552) = v14;
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[((8 * (v14 == 0)) | (16 * (v14 == 0))) ^ v11] - 8LL))( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  a9,  a10,  a11);
}

uint64_t sub_18871BD68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
}

void sub_18871BE24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  LODWORD(STACK[0x2268]) = STACK[0x478];
  *(void *)(v19 + 88) = a19;
  STACK[0x368] = *(void *)(v21 + 3944);
  CFRelease(*(CFTypeRef *)(v20 + 344));
  JUMPOUT(0x188714D0CLL);
}

uint64_t sub_18871BE74()
{
  unsigned int v0 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ LODWORD(STACK[0xDC8])) & 0x7FFFFFFF);
  unint64_t v1 = 83590351 * (v0 ^ HIWORD(v0));
  BOOL v2 = LOBYTE(STACK[0x74F]) != (byte_18873E860[(v1 >> 24) + 2] ^ byte_188744CB0[v1 >> 24] ^ byte_188744DB0[v1 >> 24] ^ v1 ^ (23 * BYTE3(v1)));
  int v3 = (uint64_t (*)(void))(qword_18A26FDB0[(4 * v2) | (8 * v2) | LODWORD(STACK[0xDBC])] - 12LL);
  LODWORD(STACK[0xF4C]) = STACK[0xDB4];
  return v3();
}

void sub_18871BF34()
{
  int v3 = STACK[0xF4C];
  LODWORD(STACK[0xF50]) = STACK[0xF4C];
  LODWORD(STACK[0xF54]) = v3 + 455;
  int v4 = v3 ^ (v0 - 174);
  LODWORD(STACK[0xF58]) = v4;
  uint64_t v5 = **(void **)(v1 + 80);
  int v6 = (LODWORD(STACK[0xDC0]) ^ 0x33FFBBDF) + (STACK[0xDC4] & 0x67FF77BC) + v4 + 898832086;
  LODWORD(STACK[0xF5C]) = v6;
  uint64_t v7 = v5 + v6;
  *(void *)(v2 + 2640) = v7;
  *(void *)(v2 + 576) = v7;
  JUMPOUT(0x18871B8B8LL);
}

uint64_t sub_18871BFA8()
{
  char v1 = STACK[0x74F];
  LOBYTE(STACK[0xF6F]) = STACK[0x74F];
  unsigned int v3 = 83590351 * (v2 ^ HIWORD(v2));
  uint64_t v4 = HIBYTE(v3);
  LODWORD(STACK[0xF70]) = v4;
  LOBYTE(STACK[0xF77]) = v3;
  char v5 = byte_18873E240[v4];
  char v6 = byte_18873EB80[v4 + 1];
  *(void *)(v0 + 2664) = v4;
  char v7 = byte_18873F7A0[v4 + 1];
  LOBYTE(STACK[0xF86]) = HIBYTE(v3);
  char v8 = v6 ^ v5 ^ v7 ^ (47 * HIBYTE(v3)) ^ v3 ^ v1;
  LOBYTE(STACK[0xF87]) = v8;
  LODWORD(STACK[0xF88]) = ((2 * v8) & 0xFBFFFCB4) + (v8 ^ 0xFDFFFE5A);
  unsigned int v9 = (uint64_t (*)(void))(qword_18A26FDB0[(39 * (v8 > 47)) ^ LODWORD(STACK[0xF50])] - 12LL);
  LODWORD(STACK[0x810]) = STACK[0xF58];
  LODWORD(STACK[0x814]) = 1512497180;
  return v9();
}

uint64_t sub_18871C0C4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * ((60
                                * ((char)(byte_18873E860[LODWORD(STACK[0xF70]) + 2] ^ byte_188744CB0[*(void *)(v3 + 2664)] ^ byte_188744DB0[*(void *)(v3 + 2664)] ^ (LOBYTE(STACK[0xF86]) * (((a1 + 41) | 0x10) + 65)) ^ LOBYTE(STACK[0xF77]) ^ LOBYTE(STACK[0xF6F])) < (char)((a1 - v1 + 98) ^ 0x71))) ^ a1)))();
}

void sub_18871C158()
{
  int v7 = LODWORD(STACK[0xF88]) + 1546051987;
  LODWORD(STACK[0x810]) = v3;
  LODWORD(STACK[0x814]) = v7;
  LODWORD(STACK[0x818]) = STACK[0x814];
  int v0 = STACK[0x810];
  LODWORD(STACK[0x81C]) = LODWORD(STACK[0x810]) ^ 0x7A071A2F;
  int v1 = v4 + v0;
  LODWORD(STACK[0x820]) = (v1 + 401) | 0x26A;
  LODWORD(STACK[0x824]) = v1 + 527;
  uint64_t v2 = **(void **)(v5 + 80)
     + (int)((LODWORD(STACK[0xF5C]) ^ 0xFFFDFF7E) + 128484 + ((2 * LODWORD(STACK[0xF5C])) & 0xFFFBFEFC) + 2719);
  *(void *)(v6 + 792) = v2;
  *(void *)(v6 + 576) = v2;
  JUMPOUT(0x18871B8B8LL);
}

uint64_t sub_18871C178()
{
  uint64_t v4 = (v1 - 1002795447) & 0x3BC56EF7;
  unint64_t v5 = (v4 ^ 0x95208AA09DAB0D6CLL) + *(void *)(v2 + 120);
  *(void *)(v2 + 136) = v5;
  *(_BYTE *)(v2 + 151) = v5 < 0x8DAA09B8;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8LL * ((62 * (v5 != 2376731064)) ^ v1));
  LODWORD(STACK[0xEAC]) = v1;
  v3[308] = 0x25333FF37ED92640LL;
  v3[309] = 0x63B19E5E211EA8A1LL;
  v3[310] = 0x3A2E5F89025478BALL;
  LODWORD(STACK[0x1050]) = v4;
  return v6();
}

void sub_18871C228()
{
  uint64_t v2 = v1[310];
  v1[311] = v2;
  uint64_t v3 = v1[309];
  v1[312] = v3;
  v1[313] = v1[308];
  int v4 = STACK[0xEAC];
  LODWORD(STACK[0xEE4]) = STACK[0xEAC];
  LODWORD(STACK[0xEE8]) = v4 ^ 0x341;
  unint64_t v6 = 83590351 * (v5 ^ HIWORD(v5));
  LOBYTE(STACK[0x5C3]) = byte_188744CB0[v6 >> 24] ^ *(_BYTE *)(v2 + *(void *)(v0 + 128) - 0x3A2E5F89025478BALL) ^ byte_18873E860[(v6 >> 24) + 2] ^ byte_188744DB0[v6 >> 24] ^ v6 ^ (23 * BYTE3(v6));
  JUMPOUT(0x188714470LL);
}

uint64_t sub_18871C324()
{
  int v3 = v0 - v1 - 471;
  int v4 = (uint64_t (*)(void))(*(void *)(v2
                                     + 8LL * (((((v0 - 202) | 0x280) ^ 0x65C) * (LOBYTE(STACK[0xF87]) > 0x40u)) ^ v0))
                         - 12LL);
  LODWORD(STACK[0x810]) = v3;
  return v4();
}

uint64_t sub_18871C364()
{
  unsigned int v0 = 83590351
     * ((LODWORD(STACK[0xC88]) + 2147483352) & (*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFD0E9218CLL)) ^ LODWORD(STACK[0xC90])));
  unint64_t v1 = 83590351 * (v0 ^ HIWORD(v0));
  return ((uint64_t (*)(void))(qword_18A26FDB0[(430
                                             * ((LOBYTE(STACK[0xC8F]) - 21) != (byte_18873EA80[v1 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_18873FBD0[v1 >> 24] ^ byte_18873F6A0[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0xC80])]
                            - 12LL))();
}

uint64_t sub_18871C440()
{
  int v3 = v0 ^ 0x198;
  uint64_t v4 = *(void *)(v2 + 1896) + 1LL;
  unsigned int v5 = *(uint64_t (**)(void))(v1
                           + 8LL
                           * ((29
                             * (((*(void *)(v2 + 1896) == 1534643058LL) ^ ((v0 ^ 0x98) - 124)) & 1)) ^ v0));
  LODWORD(STACK[0xC6C]) = v3;
  *(void *)(v2 + 1888) = v4;
  return v5();
}

void sub_18871C48C()
{
  uint64_t v2 = v1[236];
  v1[237] = v2;
  int v3 = STACK[0xC6C];
  LODWORD(STACK[0xC80]) = STACK[0xC6C];
  LODWORD(STACK[0xC84]) = v3 - 1294404320;
  LODWORD(STACK[0xC88]) = (v3 - 1294404320) ^ 0xB2D8F4F8;
  v2 -= 1534643044LL;
  LOBYTE(STACK[0xC8F]) = *(_BYTE *)(v1[436] + v2);
  uint64_t v4 = **(void **)(v0 + 256) + v2;
  v1[240] = v4;
  v1[72] = v4;
  JUMPOUT(0x18871B8B4LL);
}

uint64_t sub_18871C4F8()
{
  uint64_t v2 = *(void *)(v1 + 2016);
  unsigned int v3 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x8BA2CDCC)) ^ LODWORD(STACK[0xD08])) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  *(_BYTE *)(v2 + *(void *)(v1 + 3880) - 0x7D2E92B84B1CDE0ELL) = byte_1887455F0[v4 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_18873CAF0[(v4 >> 24) + 1] ^ byte_1887404F0[(v4 >> 24) + 1] ^ v4 ^ (87 * BYTE3(v4));
  uint64_t v5 = v2 + 1;
  uint64_t v6 = *(void *)(v1 + 2008) + 1LL;
  unint64_t v7 = *(void *)(v1 + 2024);
  unint64_t v8 = v7 + 1;
  v7 -= 0x5746D39FD0B21A50LL;
  char v9 = *(_BYTE *)(v1 + 3535) ^ (v7 < 0x50C8EBB5);
  int v10 = v7 < *(void *)(v1 + 3520);
  if ((v9 & 1) != 0) {
    int v10 = *(unsigned __int8 *)(v1 + 3535);
  }
  int v11 = (uint64_t (*)(void))(qword_18A26FDB0[(238 * (v0 & ~v10)) ^ LODWORD(STACK[0xD00])] - 4LL);
  LODWORD(STACK[0xCCC]) = STACK[0xD00];
  *(void *)(v1 + 1984) = v8;
  *(void *)(v1 + 1992) = v5;
  *(void *)(v1 + 2000) = v6;
  return v11();
}

uint64_t sub_18871C634@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,_DWORD *a54)
{
  *a54 = STACK[0x1434];
  int v54 = a1 ^ (v57 + 544);
  uint64_t v55 = sub_188725908(*(void *)(v58 + 3864) - 0x2061722DFEAF01F1LL);
  return ((uint64_t (*)(uint64_t))(qword_18A26FDB0[((STACK[0x308] == 0x5A72C1CEA1245FC3LL) * (v54 - 424)) ^ v54]
}

uint64_t sub_18871C64C()
{
  unsigned int v0 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFD0E9218CLL)) ^ LODWORD(STACK[0x1048])) & 0x7FFFFFFF);
  unint64_t v1 = (unint64_t)(83590351 * (v0 ^ HIWORD(v0))) >> (LODWORD(STACK[0x1040]) - 1);
  BOOL v2 = (LOBYTE(STACK[0x1047]) - 90) != (byte_18873EA80[v1] ^ LOBYTE(STACK[0x74F]) ^ byte_18873FBD0[v1] ^ byte_18873F6A0[v1] ^ (-49 * (v0 ^ BYTE2(v0))) ^ (-61 * v1));
  return ((uint64_t (*)(void))(qword_18A26FDB0[((4 * v2) | (8 * v2)) ^ LODWORD(STACK[0x1038])] - 8LL))();
}

uint64_t sub_18871C728()
{
  uint64_t v2 = (((LODWORD(STACK[0x103C]) + 164) | 0xA8u) ^ 0x2BCLL) + *(void *)(v1 + 2848);
  unsigned int v3 = (uint64_t (*)(void))(*(void *)(v0 + 8LL * ((560 * (v2 == 1687668179)) ^ LODWORD(STACK[0x103C]))) - 12LL);
  LODWORD(STACK[0x1024]) = LODWORD(STACK[0x103C]) + 691;
  *(void *)(v1 + 2840) = v2;
  return v3();
}

uint64_t sub_18871C788()
{
  uint64_t v6 = v5[355];
  v5[356] = v6;
  int v7 = STACK[0x1024];
  LODWORD(STACK[0x1038]) = STACK[0x1024];
  int v8 = (v7 - 771) | 0x50;
  LODWORD(STACK[0x103C]) = v8;
  v6 -= 1687668172LL;
  char v9 = *((_BYTE *)&STACK[0x375] + v6);
  LODWORD(STACK[0x1040]) = v8 - 1100314712;
  LOBYTE(STACK[0x1047]) = v9;
  uint64_t v10 = **(void **)(v4 + 520) + v6;
  v5[359] = v10;
  v5[72] = v10;
  v5[70] = *(void *)(v3 + 8LL * (v7 ^ 0xD7));
  unint64_t v0 = ((v5[72] - qword_18C724728) & 0xFFFFFFFFFFFFFFF0LL) + qword_18C724720;
  uint64_t v1 = (*(uint64_t (**)(void, unint64_t *, uint64_t))(qword_18C724740
                                                                      + 32LL * *(unsigned __int8 *)(v0 + 8)
                                                                      + 8))( *(void *)v0,  &STACK[0x78F],  1LL);
  LOBYTE(STACK[0x74F]) = STACK[0x78F];
  return ((uint64_t (*)(uint64_t))v5[70])(v1);
}

void sub_18871C81C()
{
  unsigned int v1 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0xFD1BB2E4)) ^ LODWORD(STACK[0x1100])) & 0x7FFFFFFF);
  unint64_t v2 = 83590351 * (v1 ^ HIWORD(v1));
  unsigned int v3 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (int)(dword_18C724718 & 0x8BA2CDCC)) ^ (LODWORD(STACK[0x10F4])
                                                                             + *(_DWORD *)(v0 + 2928)
                                                                             - 2051226594)) & 0x7FFFFFFF);
  unint64_t v4 = 83590351 * (v3 ^ HIWORD(v3));
  LOBYTE(STACK[0x5C3]) = byte_18873CD20[v2 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_188743410[v2 >> 24] ^ byte_188744EB0[(v2 >> 24) + 3] ^ byte_18873E340[v4 >> 24] ^ byte_18873FAC0[(v4 >> 24) + 1] ^ v2 ^ byte_188743C60[v4 >> 24] ^ (-111 * BYTE3(v2)) ^ v4 ^ (-103 * BYTE3(v4));
  JUMPOUT(0x18870911CLL);
}

uint64_t sub_18871C974()
{
  unsigned int v0 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFD0E9218CLL)) ^ LODWORD(STACK[0x1160])) & 0x7FFFFFFF);
  unint64_t v1 = 83590351 * ((v0 >> (LODWORD(STACK[0x1154]) - 105)) ^ v0);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(472
                                             * (((LODWORD(STACK[0x1158]) ^ 0x1D) + LOBYTE(STACK[0x115F])) != (byte_18873EA80[v1 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_18873FBD0[v1 >> 24] ^ byte_18873F6A0[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1))))) ^ LODWORD(STACK[0x1150])]
                            - 4LL))();
}

uint64_t sub_18871CA58()
{
  int v3 = (v0 - 177) | 0x226;
  uint64_t v4 = *(void *)(v2 + 3128) + 1LL;
  uint64_t v5 = *(uint64_t (**)(void))(v1
                           + 8LL
  LODWORD(STACK[0x113C]) = v3;
  *(void *)(v2 + 3120) = v4;
  return v5();
}

void sub_18871CB1C()
{
  uint64_t v4 = v3[390];
  v3[391] = v4;
  int v5 = STACK[0x113C];
  LODWORD(STACK[0x1150]) = STACK[0x113C];
  LODWORD(STACK[0x1154]) = v5 - 373;
  v4 -= 2041999737LL;
  char v6 = *(_BYTE *)(*(void *)(v2 + 512) + v4);
  LODWORD(STACK[0x1158]) = (v5 + 1233256804) | 0x36494AA4;
  LOBYTE(STACK[0x115F]) = v6;
  uint64_t v7 = **(void **)(v1 + 9) + v4;
  v3[394] = v7;
  v3[72] = v7;
  v3[70] = *(void *)(v0 + 8LL * (v5 ^ 0x7FC)) - 12LL;
  JUMPOUT(0x18871B8BCLL);
}

uint64_t sub_18871CB90()
{
  int v0 = LOBYTE(STACK[0x74F]);
  int v1 = STACK[0xBC4];
  int v2 = (v1 + (~(LODWORD(STACK[0xBD0]) + 2 * v1 + 57) | 0x6B) - 115) ^ 0x4A;
  unsigned int v3 = (((4 * (STACK[0xBC0] & 1)) ^ 4) & 0xFFFFFFFD | (2 * (STACK[0xBC0] & 1)))
     + ((((LODWORD(STACK[0xBC0]) + 1266386423) ^ 1)
       - ((2 * (LODWORD(STACK[0xBC0]) + 1266386423)) & 0x4C53CF9C)
       - 1507203122) ^ 0xA629E7CE)
     - 2;
  unsigned int v4 = ((2 * v3) & 0x7FDAFF96) + (v3 ^ 0xBFED7FCB);
  LODWORD(STACK[0xBD4]) = v4 - 191432130;
  int v5 = v0 + ((-54 * v2) & 0xB6) + ((101 * v2) ^ 0xDB) + 93;
  unsigned int v6 = LODWORD(STACK[0xBC8]) ^ 0xF95CB8FB ^ (v5 - ((2 * v5) & 0x156) + 480243115);
  unsigned int v7 = v6 - ((2 * v6 - 687666590) & 0xCB86AAA0) + 1363466881;
  LODWORD(STACK[0xBD8]) = v7;
  BOOL v8 = (((v4 + 1074954293) % 3) ^ 0x56FDFDFF) + 2 * ((v4 + 1074954293) % 3) != 1459486207;
  uint64_t v9 = qword_18A26FDB0[v8 | (32 * v8) | LODWORD(STACK[0xBCC])];
  LODWORD(STACK[0xBB0]) = STACK[0xBCC];
  LODWORD(STACK[0xBB4]) = v7;
  LODWORD(STACK[0xBB8]) = v1 + 1;
  LODWORD(STACK[0xBBC]) = v4 - 191432130;
  return ((uint64_t (*)(void))(v9 - 8))();
}

uint64_t sub_18871CD98()
{
  unsigned int v1 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + (dword_18C724718 & 0xFFFFFFFFD0E9218CLL)) ^ LODWORD(STACK[0xCC0])) & 0x7FFFFFFF);
  unint64_t v2 = 83590351 * ((v1 >> (LODWORD(STACK[0xCB8]) ^ (v0 + 16))) ^ v1);
  return ((uint64_t (*)(void))(qword_18A26FDB0[(21
                                             * ((LOBYTE(STACK[0xCBF]) - 20) != (byte_18873EA80[v2 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_18873FBD0[v2 >> 24] ^ byte_18873F6A0[v2 >> 24] ^ v2 ^ (-61 * BYTE3(v2))))) ^ LODWORD(STACK[0xCB0])]
                            - 8LL))();
}

void sub_18871CE70()
{
}

uint64_t sub_18871CE78()
{
  unsigned int v0 = 83590351
     * ((*(_DWORD *)(qword_18C724710 + ((LODWORD(STACK[0xD58]) - 790028682) & dword_18C724718)) ^ LODWORD(STACK[0xD60])) & 0x7FFFFFFF);
  unint64_t v1 = 83590351 * ((v0 >> (LODWORD(STACK[0xD54]) - 59)) ^ v0);
  BOOL v2 = (LOBYTE(STACK[0xD5F]) - 109) == (byte_18873EA80[v1 >> 24] ^ LOBYTE(STACK[0x74F]) ^ byte_18873FBD0[v1 >> 24] ^ byte_18873F6A0[v1 >> 24] ^ v1 ^ (-61 * BYTE3(v1)));
  return ((uint64_t (*)(void))qword_18A26FDB0[(2 * v2) | (8 * v2) | LODWORD(STACK[0xD50])])();
}

uint64_t sub_18871CF68(uint64_t a1, int a2)
{
  int v5 = (v2 + 303) | 0x90;
  uint64_t v6 = (v2 - a2 - 791);
  uint64_t v7 = *(void *)(v4 + 2104) - 2523737427LL + v6 + 9;
  BOOL v8 = (uint64_t (*)(void))(*(void *)(v3
                                     + 8LL
                                     * (((*(void *)(v4 + 2104) - 2523737427LL + v6 == 165538425) * (v5 + 719)) ^ v2))
                         - 8LL);
  LODWORD(STACK[0xD3C]) = v5;
  *(void *)(v4 + 2096) = v7;
  return v8();
}

uint64_t sub_18871CFC8()
{
  return ((uint64_t (*)(void))(*(void *)(v1
                                        + 8LL
}

uint64_t sub_18871D710(unint64_t a1)
{
  int v4 = v1 + ((v3 + 340262405) | 0x82252D0A);
  unint64_t v5 = sub_188725908(a1);
  return ((uint64_t (*)(unint64_t))qword_18A26FDB0[((v4 + 3) * v2) ^ v3])(v5);
}

uint64_t sub_18871D874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8LL * ((29 * ((((v5 - 1196882552) ^ (a1 == 0)) & 1) == 0)) ^ v5)))();
}

uint64_t sub_18871D8CC(unint64_t a1)
{
  unint64_t v4 = sub_188725908(a1);
  STACK[0x368] = *(void *)(v3 + 3480);
  return ((uint64_t (*)(unint64_t))(qword_18A26FDB0[(((v2 - 510127878) & 0x1E67ED71 ^ (v2 - 392))
                                                                    * ((v1 & 1) == 0)) ^ v2]
                                                   - 4LL))(v4);
}

uint64_t sub_18871D934(void *a1)
{
  return ((uint64_t (*)(void))(qword_18A26FDB0[(319 * (LODWORD(STACK[0x4B0]) == (v2 ^ (v2 + 69) ^ 0xDB))) ^ v2 ^ (v2 + 69)]
                            - 8LL))();
}

uint64_t sub_18871D948( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  int v27 = v25 + v26 + 873;
  free(a1);
}

uint64_t sub_18871D9A4@<X0>( const void *a1@<X0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, CFTypeRef cf, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  int v64 = a2 ^ 0x1C;
  LODWORD(STACK[0x2250]) = STACK[0x4E4];
  *(void *)(v62 + 64) = a61;
  STACK[0x368] = v61;
  CFRelease(a1);
  CFRelease(cf);
  return ((uint64_t (*)(void))(qword_18A26FDB0[((((v64 - 1872163984) | 0x6042102) ^ (v63 + 242))
                                             + ((v64 + 1001127588) & 0xC45401C2)) ^ v64]
                            - 8LL))();
}

uint64_t sub_18871DAC0()
{
  return ((uint64_t (*)(void))(*(void *)(v2
                                        + 8LL
                                        * (((v0 + 8 == ((v1 - 1041692537) & 0x3E16F77D) + 726757712)
                                          * (v1 ^ LODWORD(STACK[0x218]) ^ (v3 + 54))) ^ v1))
                            - 4LL))();
}

uint64_t sub_18871DB14( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t (*a57)(uint64_t),uint64_t a58,uint64_t a59)
{
  STACK[0x4D0] = v59;
  STACK[0x4A8] = STACK[0x230];
  return a57(a59);
}

void sub_18871DB30(void *a1)
{
}

void sub_18871DB4C()
{
}

uint64_t sub_18871DB70(uint64_t a1, int a2, uint64_t a3)
{
}

uint64_t sub_18871DC4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x380] = v69;
  STACK[0x2B8] = STACK[0x238];
  return a67(a69);
}

void sub_18871DC68(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_18871DD24()
{
  return (*(uint64_t (**)(void))(v2
                              + 8LL
                              * (int)((v0 - 203129265) ^ 0x53555E77 ^ (1440
                                                                     * (((*v1 - (v0 - 203129265)) | (v0 - 203129265 - *v1)) >> 31)))))();
}

uint64_t sub_18871DD6C()
{
  int v3 = v0;
  sub_188724168(qword_18C724740);
  uint64_t v4 = qword_18C724778[0] + 888;
  do
  {
    uint64_t v5 = *(void *)(v4 + 16);
    if ((*(_DWORD *)(v4 + 24) & 9) == 1) {
      munmap(*(void **)v4, *(void *)(v4 + 8));
    }
    uint64_t v4 = v5;
  }

  while (v5);
  uint64_t v6 = qword_18C724780 + 888;
  do
  {
    uint64_t v7 = *(void *)(v6 + 16);
    if ((*(_DWORD *)(v6 + 24) & 9) == 1) {
      munmap(*(void **)v6, *(void *)(v6 + 8));
    }
    uint64_t v6 = v7;
  }

  while (v7);
  *int v3 = v1;
  uint64_t result = v2;
  *(_DWORD *)(v2 + 8) = 132501039;
  return result;
}

uint64_t sub_1887221A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, _DWORD *a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  LODWORD(STACK[0x460]) = 1550037883;
  *a40 = -982842460;
  unint64_t v59 = *(unsigned int *)(v56 + 3160);
  STACK[0x358] = *(void *)(a3 + 8 * ((v55 + 3875266) ^ 0x5FAC0242LL));
  LODWORD(STACK[0x360]) = v55 + 3875266;
  STACK[0x368] = v59;
  LODWORD(STACK[0x370]) = 0;
  LODWORD(STACK[0x374]) = (v55 + 3875266) ^ 0x33;
  LODWORD(STACK[0x378]) = (v55 + 3875266) ^ 0x40;
  STACK[0x380] = v57;
  *(void *)(v58 - 112) = &STACK[0x358];
  *(_DWORD *)(v58 - 104) = 1431737413 * ((~((v58 - 112) | 0x5D3F0642) + ((v58 - 112) & 0x5D3F0642)) ^ 0x1C9E66AF)
                         + 963210645
                         + v55;
  sub_1886DF534(v58 - 112);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[*(int *)(v58 - 100)] - 8LL))( v60,  v61,  v62,  v63,  v64,  v65,  v66,  v67,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_1887222A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,size_t __size)
{
  int v61 = (a17 - 1967345457) & 0x15D26FEF;
  malloc(__size);
  uint32_t v62 = arc4random();
  LODWORD(xmmword_18C723288) = v62 - 1595106619 - ((v61 + 1104753570) & (2 * v62));
  LODWORD(STACK[0x290]) = 1;
  LODWORD(STACK[0x294]) = 1307753447;
  uint64_t v63 = ((v61 + 40) | 0x89u) + 882858342;
  int v64 = ((1477382858 * (*v60 ^ 0xA0EC9AC7 ^ (*v60 >> 30))) & 0x693EB7FE)
      + 1307753447
      + ((1812433253 * (*v60 ^ 0xA0EC9AC7 ^ (*v60 >> 30))) ^ v63);
  uint64_t v65 = (2 * v64 + 2061226038) & 0x41D9358A;
  v60[1] = v64 - v65 + 509248224;
  uint64_t v66 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_18A26FDB0[v61] - 8LL);
  return v66( v66,  v65,  1104754058LL,  v63,  qword_18A26FDB0,  1812433253LL,  v67,  v68,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40);
}

void sub_1887223DC()
{
}

void sub_1887223E8()
{
  LODWORD(STACK[0x2B4]) = *v0;
  STACK[0x2B8] = 1694975499LL;
  JUMPOUT(0x188721C4CLL);
}

void sub_18872247C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, _DWORD *a39, uint64_t a40, uint64_t a41, timeval *a42, _DWORD *a43, _DWORD *a44, _DWORD *a45, _DWORD *a46)
{
  int v49 = v46 ^ 0x5F70E3B0;
  LODWORD(STACK[0x294]) = v48 + v47 - 1;
  LODWORD(STACK[0x290]) = v47;
  gettimeofday(a42, 0LL);
  *a43 = v49 + LODWORD(a42->tv_sec) - ((2 * LODWORD(a42->tv_sec)) & 0x41D9358A) + 1098627484;
  *a45 = *a44 - 1595106619 - ((2 * *a44) & 0x41D9358A);
  uint32_t v50 = arc4random();
  *a46 = v50 - 1595106619 - ((2 * v50) & 0x41D9358A);
  uint32_t v51 = arc4random();
  *a39 = v51 - 1595106619 - ((2 * v51) & 0x41D9358A);
  LODWORD(STACK[0x298]) = 1242080415;
  LODWORD(STACK[0x29C]) = 982363217;
  LODWORD(STACK[0x2A0]) = 595311131;
  JUMPOUT(0x188720B78LL);
}

uint64_t sub_188722600( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51)
{
  HIDWORD(a18) = a22;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))STACK[0x2D8])( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38,  a39,  a40,  a41,  a42,  a43,  a44,  a45,  a46,  a47,  a48,  a49,
           a50,
           a51);
}

void sub_18872263C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,void *a57)
{
}

void *sub_188722664(unint64_t a1)
{
  uint64_t v1 = qword_18C723C90 - qword_18C723C98 - (void)&v258;
  qword_18C723C98 = 1435369301 * v1 - 0x3FCCDB3BD4E106A1LL;
  qword_18C723C90 = 1435369301 * (v1 ^ 0x3FCCDB3BD4E106A1LL);
  char v2 = dword_18C724788++;
  uint64_t v3 = qword_18C724778[v2 & 1];
  if (!v3) {
    return 0LL;
  }
  if ((*(_BYTE *)(v3 + 880) & 2) != 0)
  {
    uint64_t v5 = (unsigned int *)(v3 + 884);
    do
      unsigned int v6 = __ldaxr(v5);
    while (__stlxr(1u, v5));
    if (v6)
    {
      int v7 = 0;
      while (1)
      {
        if (!*v5)
        {
          do
            unsigned int v8 = __ldaxr(v5);
          while (__stlxr(1u, v5));
          if (!v8) {
            break;
          }
        }

        if ((++v7 & 0x3F) == 0) {
          sched_yield();
        }
      }
    }
  }

  if (a1 <= 0xE0)
  {
    unint64_t v9 = (a1 + 31) & 0xFFFFFFFFFFFFFFF0LL;
    if (a1 < 0xF) {
      unint64_t v9 = 32LL;
    }
    unint64_t v10 = v9 >> 3;
    unint64_t v11 = *(unsigned int *)v3;
    unint64_t v12 = v11 >> ((v9 >> 3) & 0xFE);
    if ((v12 & 3) != 0)
    {
      uint64_t v13 = ((v11 >> ((v9 >> 3) & 0xFE)) & 1 | v10) ^ 1;
      uint64_t v14 = v3 + 16 * v13;
      uint64_t v15 = v14 + 72;
      uint64_t v16 = *(void *)(v14 + 88);
      uint64_t result = (void *)(v16 + 16);
      uint64_t v18 = *(void *)(v16 + 16);
      if (v15 == v18)
      {
        *(_DWORD *)uint64_t v3 = v11 & ~(1 << v13);
      }

      else
      {
        *(void *)(v18 + 24) = v15;
        *(void *)(v15 + 16) = v18;
      }

      *(void *)(v16 + 8) = (8LL * v13) | 3;
      unsigned int v35 = (uint64_t *)(v16 + 8LL * v13);
LABEL_30:
      v35[1] |= 1uLL;
      *unsigned int v35 = qword_18C724748 ^ v3;
      goto LABEL_99;
    }

    if (v9 > *(void *)(v3 + 8))
    {
      if ((_DWORD)v12)
      {
        int v22 = ((_DWORD)v12 << v10) & ((2 << v10) | -(2 << v10));
        unsigned int v23 = (v22 - 1) & ~v22;
        int v24 = (v23 >> 12) & 0x10;
        unsigned int v25 = v23 >> v24;
        unsigned int v26 = v24 & 0xFFFFFFF0 | (v25 >> 5) & 0xF;
        unsigned int v27 = v25 >> ((v25 >> 5) & 8);
        unsigned int v28 = v26 & 0xFFFFFFF8 | (v27 >> 2) & 7;
        unsigned int v29 = v27 >> ((v27 >> 2) & 4);
        unsigned int v30 = (v28 & 0xFFFFFFFC | (v29 >> 1) & 2 | (v29 >> ((v29 >> 1) & 2) >> 1) & 1)
            + (v29 >> ((v29 >> 1) & 2) >> (((v29 >> ((v29 >> 1) & 2)) & 2) != 0));
        uint64_t v31 = v3 + 16LL * v30;
        uint64_t v32 = v31 + 72;
        uint64_t v33 = *(void *)(v31 + 88);
        uint64_t result = (void *)(v33 + 16);
        uint64_t v34 = *(void *)(v33 + 16);
        if (v32 == v34)
        {
          *(_DWORD *)uint64_t v3 = v11 & ~(1 << v30);
        }

        else
        {
          *(void *)(v34 + 24) = v32;
          *(void *)(v32 + 16) = v34;
        }

        uint64_t v108 = 8 * v30;
        uint64_t v109 = v108 - v9;
        if (v108 - v9 > 0x1F)
        {
          *(void *)(v33 + 8) = v9 | 3;
          int v110 = (uint64_t *)(v33 + v9);
          *int v110 = qword_18C724748 ^ v3;
          v110[1] = v109 | 1;
          *(void *)(v33 + v108) = v109;
          unint64_t v111 = *(void *)(v3 + 8);
          if (v111)
          {
            uint64_t v112 = *(void *)(v3 + 32);
            unint64_t v113 = v111 >> 3;
            uint64_t v114 = v3 + ((2 * v111) & 0x7FFFFFFF0LL) + 72;
            int v115 = 1 << v113;
            if ((*(_DWORD *)v3 & v115) != 0)
            {
              uint64_t v116 = *(void *)(v114 + 16);
            }

            else
            {
              *(_DWORD *)v3 |= v115;
              uint64_t v116 = v114;
            }

            *(void *)(v114 + 16) = v112;
            *(void *)(v116 + 24) = v112;
            *(void *)(v112 + 16) = v116;
            *(void *)(v112 + 24) = v114;
          }

          *(void *)(v3 + 8) = v109;
          *(void *)(v3 + 32) = v110;
          goto LABEL_99;
        }

        *(void *)(v33 + 8) = v108 | 3;
        unsigned int v35 = (uint64_t *)(v33 + v108);
        goto LABEL_30;
      }

      int v58 = *(_DWORD *)(v3 + 4);
      if (v58)
      {
        unsigned int v59 = (v58 - 1) & ~v58;
        int v60 = (v59 >> 12) & 0x10;
        unsigned int v61 = v59 >> v60;
        unsigned int v62 = v60 & 0xFFFFFFF0 | (v61 >> 5) & 0xF;
        unsigned int v63 = v61 >> ((v61 >> 5) & 8);
        unsigned int v64 = v62 & 0xFFFFFFF8 | (v63 >> 2) & 7;
        unsigned int v65 = v63 >> ((v63 >> 2) & 4);
        uint64_t v66 = *(void *)(v3
                        + 8LL
                        * ((v64 & 0xFFFFFFFC | (v65 >> 1) & 2 | (v65 >> ((v65 >> 1) & 2) >> 1) & 1)
                         + (v65 >> ((v65 >> 1) & 2) >> (((v65 >> ((v65 >> 1) & 2)) & 2) != 0)))
                        + 600);
        unint64_t v67 = (*(void *)(v66 + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9;
        uint64_t v68 = 32LL;
        if (!*(void *)(v66 + 32)) {
          uint64_t v68 = 40LL;
        }
        for (uint64_t i = *(void *)(v66 + v68); i; uint64_t i = *(void *)(i + v70))
        {
          if ((*(void *)(i + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9 < v67)
          {
            unint64_t v67 = (*(void *)(i + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9;
            uint64_t v66 = i;
          }

          if (*(void *)(i + 32)) {
            uint64_t v70 = 32LL;
          }
          else {
            uint64_t v70 = 40LL;
          }
        }

        uint64_t v71 = *(void *)(v66 + 48);
        uint64_t v72 = *(void **)(v66 + 24);
        if (v72 != (void *)v66)
        {
          uint64_t v73 = *(void *)(v66 + 16);
          *(void *)(v73 + 24) = v72;
          v72[2] = v73;
          if (!v71) {
            goto LABEL_225;
          }
LABEL_186:
          uint64_t v163 = v3 + 8LL * *(unsigned int *)(v66 + 56);
          if (v66 == *(void *)(v163 + 600))
          {
            *(void *)(v163 + 600) = v72;
            if (!v72)
            {
              *(_DWORD *)(v3 + 4) &= ~(1 << *(_DWORD *)(v66 + 56));
              goto LABEL_225;
            }
          }

          else
          {
            uint64_t v164 = 40LL;
            if (*(void *)(v71 + 32) == v66) {
              uint64_t v164 = 32LL;
            }
            *(void *)(v71 + v164) = v72;
            if (!v72) {
              goto LABEL_225;
            }
          }

          v72[6] = v71;
          uint64_t v165 = *(void *)(v66 + 32);
          if (v165)
          {
            v72[4] = v165;
            *(void *)(v165 + 48) = v72;
          }

          uint64_t v166 = *(void *)(v66 + 40);
          if (v166)
          {
            v72[5] = v166;
            *(void *)(v166 + 48) = v72;
          }

          goto LABEL_225;
        }

        unsigned int v160 = (void *)(v66 + 40);
        int v161 = *(void **)(v66 + 40);
        if (v161 || (unsigned int v160 = (void *)(v66 + 32), (v161 = *(void **)(v66 + 32)) != 0LL))
        {
          do
          {
            do
            {
              unsigned int v162 = v160;
              uint64_t v72 = v161;
              unsigned int v160 = v161 + 5;
              int v161 = (void *)v161[5];
            }

            while (v161);
            unsigned int v160 = v72 + 4;
            int v161 = (void *)v72[4];
          }

          while (v161);
          *unsigned int v162 = 0LL;
          if (v71) {
            goto LABEL_186;
          }
        }

        else
        {
          uint64_t v72 = 0LL;
          if (v71) {
            goto LABEL_186;
          }
        }

LABEL_225:
        if (v67 > 0x1F)
        {
          *(void *)(v66 + 8) = v9 | 3;
          *(void *)(v66 + v9) = qword_18C724748 ^ v3;
          uint64_t v197 = v66 + v9;
          *(void *)(v197 + 8) = v67 | 1;
          *(void *)(v197 + v67) = v67;
          unint64_t v198 = *(void *)(v3 + 8);
          if (v198)
          {
            uint64_t v199 = *(void *)(v3 + 32);
            unint64_t v200 = v198 >> 3;
            uint64_t v201 = v3 + ((2 * v198) & 0x7FFFFFFF0LL) + 72;
            int v202 = 1 << v200;
            if ((*(_DWORD *)v3 & v202) != 0)
            {
              uint64_t v203 = *(void *)(v201 + 16);
            }

            else
            {
              *(_DWORD *)v3 |= v202;
              uint64_t v203 = v201;
            }

            *(void *)(v201 + 16) = v199;
            *(void *)(v203 + 24) = v199;
            *(void *)(v199 + 16) = v203;
            *(void *)(v199 + 24) = v201;
          }

          *(void *)(v3 + 8) = v67;
          *(void *)(v3 + 32) = v197;
          uint64_t result = (void *)(v66 + 16);
        }

        else
        {
          unint64_t v195 = v67 + v9;
          *(void *)(v66 + 8) = v195 | 3;
          unsigned int v196 = (uint64_t *)(v66 + v195);
          v196[1] |= 1uLL;
          *unsigned int v196 = qword_18C724748 ^ v3;
          uint64_t result = (void *)(v66 + 16);
        }

        goto LABEL_99;
      }
    }

    goto LABEL_76;
  }

  if (a1 > 0xFFFFFFFFFFFFFF7FLL)
  {
    unint64_t v9 = -1LL;
    goto LABEL_76;
  }

  unint64_t v9 = (a1 + 31) & 0xFFFFFFFFFFFFFFF0LL;
  int v19 = *(_DWORD *)(v3 + 4);
  unsigned int v270 = (_DWORD *)(v3 + 4);
  if (v19)
  {
    unint64_t v20 = -(uint64_t)v9;
    if (v9 >= 0x100)
    {
      if (v9 >> 24)
      {
        unsigned int v21 = 31;
      }

      else
      {
        unint64_t v36 = (a1 + 31) >> 8;
        unsigned int v37 = ((v36 + 1048320) >> 16) & 8;
        LODWORD(v36) = (_DWORD)v36 << v37;
        LODWORD(v36) = ((_DWORD)v36 << (((v36 + 520192) >> 16) & 4) << (((((_DWORD)v36 << (((v36 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
        unsigned int v21 = ((v9 >> (v36 + 21)) & 1 | (2 * v36)) + 28;
      }
    }

    else
    {
      unsigned int v21 = 0;
    }

    uint64_t v38 = *(void *)(v3 + 8LL * v21 + 600);
    if (v38)
    {
      uint64_t v39 = 0LL;
      uint64_t v40 = 0LL;
      int v41 = 57 - (v21 >> 1);
      if (v21 == 31) {
        LOBYTE(v41) = 0;
      }
      unint64_t v42 = v9 << v41;
      while (1)
      {
        unint64_t v45 = (*(void *)(v38 + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9;
        if (v45 < v20)
        {
          unint64_t v20 = (*(void *)(v38 + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9;
          uint64_t v40 = v38;
          if (!v45) {
            break;
          }
        }

        uint64_t v43 = *(void *)(v38 + 40);
        uint64_t v38 = *(void *)(v38 + 8 * (v42 >> 63) + 32);
        if (v43 != v38 && v43 != 0) {
          uint64_t v39 = v43;
        }
        v42 *= 2LL;
        if (!v38) {
          goto LABEL_48;
        }
      }

      uint64_t v39 = v38;
      uint64_t v40 = v38;
    }

    else
    {
      uint64_t v39 = 0LL;
      uint64_t v40 = 0LL;
LABEL_48:
      if (!(v39 | v40))
      {
        int v46 = ((2 << v21) | -(2 << v21)) & v19;
        if (!v46) {
          goto LABEL_76;
        }
        uint64_t v40 = 0LL;
        unsigned int v47 = (v46 - 1) & ~v46;
        int v48 = (v47 >> 12) & 0x10;
        unsigned int v49 = v47 >> v48;
        unsigned int v50 = v48 & 0xFFFFFFF0 | (v49 >> 5) & 0xF;
        unsigned int v51 = v49 >> ((v49 >> 5) & 8);
        unsigned int v52 = v50 & 0xFFFFFFF8 | (v51 >> 2) & 7;
        unsigned int v53 = v51 >> ((v51 >> 2) & 4);
        uint64_t v39 = *(void *)(v3
                        + 8LL
                        * ((v52 & 0xFFFFFFFC | (v53 >> 1) & 2 | (v53 >> ((v53 >> 1) & 2) >> 1) & 1)
                         + (v53 >> ((v53 >> 1) & 2) >> (((v53 >> ((v53 >> 1) & 2)) & 2) != 0)))
                        + 600);
      }

      if (!v39)
      {
LABEL_58:
        unint64_t v271 = v20;
        uint64_t v272 = v40;
        if (!v40 || v271 >= *(void *)(v3 + 8) - v9) {
          goto LABEL_76;
        }
        uint64_t v273 = v272 + v9;
        uint64_t v55 = *(void *)(v272 + 48);
        uint64_t v56 = *(void **)(v272 + 24);
        if (v56 == (void *)v272)
        {
          int v117 = (void *)(v272 + 40);
          unsigned int v118 = *(void **)(v272 + 40);
          if (v118 || (int v117 = (void *)(v272 + 32), (v118 = *(void **)(v272 + 32)) != 0LL))
          {
            do
            {
              do
              {
                int v119 = v117;
                uint64_t v56 = v118;
                int v117 = v118 + 5;
                unsigned int v118 = (void *)v118[5];
              }

              while (v118);
              int v117 = v56 + 4;
              unsigned int v118 = (void *)v56[4];
            }

            while (v118);
            *int v119 = 0LL;
            if (!v55) {
              goto LABEL_212;
            }
          }

          else
          {
            uint64_t v56 = 0LL;
            if (!v55) {
              goto LABEL_212;
            }
          }
        }

        else
        {
          uint64_t v57 = *(void *)(v272 + 16);
          *(void *)(v57 + 24) = v56;
          v56[2] = v57;
          if (!v55) {
            goto LABEL_212;
          }
        }

        uint64_t v120 = v272;
        uint64_t v121 = v3 + 8LL * *(unsigned int *)(v272 + 56);
        if (v272 == *(void *)(v121 + 600))
        {
          *(void *)(v121 + 600) = v56;
          if (!v56)
          {
            *v270 &= ~(1 << *(_DWORD *)(v120 + 56));
            goto LABEL_212;
          }
        }

        else
        {
          uint64_t v122 = 40LL;
          if (*(void *)(v55 + 32) == v272) {
            uint64_t v122 = 32LL;
          }
          *(void *)(v55 + v122) = v56;
          if (!v56)
          {
LABEL_212:
            if (v271 > 0x1F)
            {
              *(void *)(v272 + 8) = v9 | 3;
              uint64_t v182 = v273;
              unint64_t v183 = v271;
              uint64_t v184 = v271 | 1;
              *(void *)uint64_t v273 = qword_18C724748 ^ v3;
              *(void *)(v182 + 8) = v184;
              *(void *)(v182 + v183) = v183;
              if (v183 > 0xFF)
              {
                unsigned int v259 = 31;
                if (!(v183 >> 24))
                {
                  unsigned int v189 = (((v271 >> 8) + 1048320) >> 16) & 8;
                  unsigned int v190 = (v271 >> 8) << v189;
                  unsigned int v191 = (v190 << (((v190 + 520192) >> 16) & 4) << ((((v190 << (((v190 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                       - (((v190 + 520192) >> 16) & 4 | v189 | (((v190 << (((v190 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
                  unsigned int v259 = ((v271 >> (v191 + 21)) & 1 | (2 * v191)) + 28;
                }

                unsigned int v260 = v259;
                uint64_t v261 = v3 + 8LL * v259 + 600;
                uint64_t v192 = v273;
                *(_DWORD *)(v273 + 56) = v259;
                unsigned int v257 = (_BYTE *)(v192 + 32);
                uint64_t v193 = qword_18A26FDB0[((85 * ((qword_18C723C90 + qword_18C723C98) ^ 0xA1)) ^ byte_188748760[byte_188748660[(85 * ((qword_18C723C90 + qword_18C723C98) ^ 0xA1))] ^ 0x4D])
                                     + 1239]
                     - 4LL;
LABEL_268:
                uint64_t v256 = v193;
                unsigned int v230 = v257;
                unint64_t v231 = -(int)v257 & 7;
                if (v231 > 0x10) {
                  LODWORD(v231) = 16;
                }
                switch((int)v231)
                {
                  case 1:
                    goto LABEL_277;
                  case 2:
                    goto LABEL_276;
                  case 3:
                    goto LABEL_275;
                  case 4:
                    goto LABEL_274;
                  case 5:
                    goto LABEL_273;
                  case 6:
                    goto LABEL_272;
                  case 7:
                    *unsigned int v257 = 0;
                    unsigned int v230 = v257 + 1;
LABEL_272:
                    *v230++ = 0;
LABEL_273:
                    *v230++ = 0;
LABEL_274:
                    *v230++ = 0;
LABEL_275:
                    *v230++ = 0;
LABEL_276:
                    *v230++ = 0;
LABEL_277:
                    *v230++ = 0;
                    break;
                  default:
                    break;
                }

                switch(16LL - v231)
                {
                  case 0LL:
                    __asm { BR              X8 }

                    return result;
                  case 1LL:
                    goto LABEL_312;
                  case 2LL:
                    goto LABEL_311;
                  case 3LL:
                    goto LABEL_310;
                  case 4LL:
                    goto LABEL_309;
                  case 5LL:
                    goto LABEL_308;
                  case 6LL:
                    goto LABEL_307;
                  case 7LL:
                    *v230++ = 0;
LABEL_307:
                    *v230++ = 0;
LABEL_308:
                    *v230++ = 0;
LABEL_309:
                    *v230++ = 0;
LABEL_310:
                    *v230++ = 0;
LABEL_311:
                    *v230++ = 0;
LABEL_312:
                    *unsigned int v230 = 0;
                    __asm { BR              X8 }

                    return result;
                  default:
                    __asm { BR              X15 }

                    return result;
                }
              }

              unint64_t v185 = v183 >> 3;
              uint64_t v186 = v3 + ((2 * v183) & 0x7FFFFFFF0LL) + 72;
              int v187 = 1 << v185;
              if ((v187 & *(_DWORD *)v3) != 0)
              {
                uint64_t v188 = *(void *)(v186 + 16);
              }

              else
              {
                *(_DWORD *)v3 |= v187;
                uint64_t v188 = v186;
              }

              uint64_t v194 = v273;
              *(void *)(v186 + 16) = v273;
              *(void *)(v188 + 24) = v194;
              *(void *)(v194 + 16) = v188;
              *(void *)(v194 + 24) = v186;
            }

            else
            {
              uint64_t v179 = v272;
              unint64_t v180 = v271 + v9;
              *(void *)(v272 + 8) = v180 | 3;
              uint64_t v181 = (uint64_t *)(v179 + v180);
              v181[1] |= 1uLL;
              *uint64_t v181 = qword_18C724748 ^ v3;
            }

            unsigned int v81 = (uint64_t *)v272;
LABEL_98:
            uint64_t result = v81 + 2;
            goto LABEL_99;
          }
        }

        v56[6] = v55;
        uint64_t v150 = *(void *)(v272 + 32);
        if (v150)
        {
          v56[4] = v150;
          *(void *)(v150 + 48) = v56;
        }

        uint64_t v151 = *(void *)(v272 + 40);
        if (v151)
        {
          v56[5] = v151;
          *(void *)(v151 + 48) = v56;
        }

        goto LABEL_212;
      }
    }

    do
    {
      if ((*(void *)(v39 + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9 < v20)
      {
        unint64_t v20 = (*(void *)(v39 + 8) & 0xFFFFFFFFFFFFFFF8LL) - v9;
        uint64_t v40 = v39;
      }

      if (*(void *)(v39 + 32)) {
        uint64_t v54 = 32LL;
      }
      else {
        uint64_t v54 = 40LL;
      }
      uint64_t v39 = *(void *)(v39 + v54);
    }

    while (v39);
    goto LABEL_58;
  }

LABEL_76:
  unint64_t v274 = v9;
  unint64_t v74 = *(void *)(v3 + 8);
  if (v9 <= v74)
  {
    unint64_t v80 = v74 - v274;
    unsigned int v81 = *(uint64_t **)(v3 + 32);
    if (v74 - v274 < 0x20)
    {
      *(void *)(v3 + 8) = 0LL;
      *(void *)(v3 + 32) = 0LL;
      v81[1] = v74 | 3;
      unsigned int v83 = (uint64_t *)((char *)v81 + v74);
      *(uint64_t *)((char *)v81 + v74 + 8) |= 1uLL;
    }

    else
    {
      unint64_t v82 = v274;
      unsigned int v83 = (uint64_t *)((char *)v81 + v274);
      *(void *)(v3 + 32) = (char *)v81 + v274;
      *(void *)(v3 + 8) = v80;
      v83[1] = v80 | 1;
      *(uint64_t *)((char *)v81 + v74) = v80;
      v81[1] = v82 | 3;
    }

    *unsigned int v83 = qword_18C724748 ^ v3;
    goto LABEL_98;
  }

  unint64_t v75 = *(void *)(v3 + 16);
  int v275 = (uint64_t *)(v3 + 16);
  if (v274 < v75)
  {
    unint64_t v76 = v274;
    uint64_t v77 = v75 - v274;
    *int v275 = v77;
    uint64_t v78 = *(void *)(v3 + 40);
    unsigned int v79 = (uint64_t *)(v78 + v76);
    *(void *)(v3 + 40) = v78 + v76;
    v79[1] = v77 | 1;
    *(void *)(v78 + 8) = v76 | 3;
    *unsigned int v79 = qword_18C724748 ^ v3;
    uint64_t result = (void *)(v78 + 16);
    goto LABEL_99;
  }

  if (v75)
  {
    if ((*(_DWORD *)(v3 + 880) & 1) != 0 && *((void *)&xmmword_18C724758 + 1) <= v274)
    {
      unint64_t v84 = (qword_18C724750 + v274 + 62) & -qword_18C724750;
      unint64_t v85 = *(void *)(v3 + 872);
      if (!v85 || (unint64_t v86 = *(void *)(v3 + 856), v86 + v84 > v86) && v86 + v84 <= v85)
      {
        if (v84 > v274)
        {
          unsigned int v87 = (char *)mmap(0LL, (qword_18C724750 + v274 + 62) & -qword_18C724750, 3, 4098, -1, 0LL);
          if (v87 != (char *)-1LL)
          {
            uint64_t v88 = -((_DWORD)v87 + 16) & 0xFLL;
            unsigned int v81 = (uint64_t *)&v87[v88];
            *unsigned int v81 = v88;
            v81[1] = v84 - v88 - 32;
            int v89 = &v87[v84 - 32];
            *(void *)int v89 = qword_18C724748 ^ v3;
            *(_OWORD *)(v89 + 8) = xmmword_18873CA30;
            unint64_t v90 = *(void *)(v3 + 24);
            unint64_t v91 = *(void *)(v3 + 856) + v84;
            *(void *)(v3 + 856) = v91;
            if (v91 > *(void *)(v3 + 864)) {
              *(void *)(v3 + 864) = v91;
            }
            goto LABEL_98;
          }
        }
      }
    }
  }

  uint64_t result = 0LL;
  unint64_t v92 = (xmmword_18C724758 + v274 + 95) & -(uint64_t)xmmword_18C724758;
  if (v92 > v274)
  {
    unint64_t v93 = *(void *)(v3 + 872);
    if (!v93 || (uint64_t result = 0LL, v94 = *(void *)(v3 + 856), v94 + v92 > v94) && v94 + v92 <= v93)
    {
      int v95 = (char *)mmap(0LL, (xmmword_18C724758 + v274 + 95) & -(uint64_t)xmmword_18C724758, 3, 4098, -1, 0LL);
      BOOL v96 = v95 != (char *)-1LL;
      else {
        unint64_t v97 = v92;
      }
      if (v95 == (char *)-1LL)
      {
LABEL_303:
        int v255 = __error();
        uint64_t result = 0LL;
        *int v255 = 12;
        goto LABEL_99;
      }

      unint64_t v98 = *(void *)(v3 + 856) + v92;
      *(void *)(v3 + 856) = v98;
      if (v98 > *(void *)(v3 + 864)) {
        *(void *)(v3 + 864) = v98;
      }
      unint64_t v99 = *(void *)(v3 + 40);
      int v276 = (uint64_t **)(v3 + 40);
      unint64_t v277 = v99;
      if (v99)
      {
        unint64_t v100 = *(void *)(v3 + 888);
        uint64_t v101 = *(void *)(v3 + 896);
        if (v95 == (char *)(v100 + v101)
          && (*(_DWORD *)(v3 + 912) & 9) == 1
          && v277 >= v100
          && v277 < (unint64_t)v95)
        {
          *(void *)(v3 + 896) = v101 + v92;
          uint64_t v102 = v275;
          unint64_t v103 = *v275 + v92;
          unint64_t v104 = v277;
          if (((v277 + 16) & 0xF) != 0) {
            uint64_t v105 = -((_DWORD)v277 + 16) & 0xFLL;
          }
          else {
            uint64_t v105 = 0LL;
          }
          unint64_t v106 = v277 + v105;
          uint64_t v107 = v103 - v105;
          *int v276 = (uint64_t *)v106;
          *uint64_t v102 = v107;
          *(void *)(v106 + 8) = v107 | 1;
          *(void *)(v104 + v103 + 8) = 80LL;
          *(void *)(v3 + 48) = qword_18C724768;
          goto LABEL_301;
        }

        char v123 = (void **)(v3 + 888);
        unsigned int v124 = &v95[v92];
        unsigned int v125 = (unint64_t *)(v3 + 888);
        if (*v123 == &v95[v92])
        {
          unsigned int v125 = (unint64_t *)(v3 + 888);
          if ((*(_DWORD *)(v3 + 912) & 9) == 1)
          {
            *(void *)(v3 + 888) = v95;
            *(void *)(v3 + 896) += v92;
            else {
              uint64_t v126 = 0LL;
            }
            int v127 = &v95[v126];
            else {
              uint64_t v128 = 0LL;
            }
            int v129 = &v124[v128];
            unint64_t v130 = v274;
            unsigned int v278 = (uint64_t *)v127;
            int v279 = &v127[v274];
            unint64_t v131 = v129 - v127 - v274;
            *((void *)v127 + 1) = v274 | 3;
            *(void *)&v127[v130] = qword_18C724748 ^ v3;
            if (v129 == (char *)*v276)
            {
              unint64_t v204 = *v275 + v131;
              *int v275 = v204;
              unsigned int v205 = v279;
              *int v276 = (uint64_t *)v279;
              *((void *)v205 + 1) = v204 | 1;
            }

            else
            {
              if (v129 != *(char **)(v3 + 32))
              {
                unint64_t v132 = *((void *)v129 + 1);
                if ((v132 & 3) != 1)
                {
LABEL_260:
                  unint64_t v280 = v131;
                  *((void *)v129 + 1) = v132 & 0xFFFFFFFFFFFFFFFELL;
                  unsigned int v218 = v279;
                  *((void *)v279 + 1) = v131 | 1;
                  *(void *)&v218[v131] = v131;
                  if (v131 <= 0xFF)
                  {
                    unint64_t v219 = v131 >> 3;
                    uint64_t v220 = v3 + ((2 * v131) & 0x7FFFFFFF0LL) + 72;
                    int v221 = 1 << v219;
                    if ((v221 & *(_DWORD *)v3) != 0)
                    {
                      uint64_t v222 = *(void *)(v220 + 16);
                    }

                    else
                    {
                      *(_DWORD *)v3 |= v221;
                      uint64_t v222 = v220;
                    }

                    int v229 = v279;
                    *(void *)(v220 + 16) = v279;
                    *(void *)(v222 + 24) = v229;
                    *((void *)v229 + 2) = v222;
                    *((void *)v229 + 3) = v220;
                    goto LABEL_280;
                  }

                  unsigned int v262 = 31;
                  if (!(v131 >> 24))
                  {
                    unsigned int v223 = (((v280 >> 8) + 1048320) >> 16) & 8;
                    unsigned int v224 = (v280 >> 8) << v223;
                    unsigned int v225 = (v224 << (((v224 + 520192) >> 16) & 4) << ((((v224 << (((v224 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                         - (((v224 + 520192) >> 16) & 4 | v223 | (((v224 << (((v224 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
                    unsigned int v262 = ((v280 >> (v225 + 21)) & 1 | (2 * v225)) + 28;
                  }

                  unsigned int v263 = v262;
                  uint64_t v226 = v3 + 8LL * v262 + 600;
                  unsigned int v227 = v279;
                  *((_DWORD *)v279 + 14) = v262;
                  uint64_t v264 = v226;
                  uint64_t v265 = v3 + 4;
                  unsigned int v257 = v227 + 32;
                  goto LABEL_298;
                }

                unint64_t v133 = v132 & 0xFFFFFFFFFFFFFFF8LL;
                if (v132 <= 0xFF)
                {
                  uint64_t v134 = *((void *)v129 + 2);
                  uint64_t v135 = *((void *)v129 + 3);
                  if (v135 == v134)
                  {
                    *(_DWORD *)v3 &= ~(1 << (v132 >> 3));
                  }

                  else
                  {
                    *(void *)(v134 + 24) = v135;
                    *(void *)(v135 + 16) = v134;
                  }

                  goto LABEL_259;
                }

                uint64_t v208 = *((void *)v129 + 6);
                unsigned int v209 = (char *)*((void *)v129 + 3);
                if (v209 == v129)
                {
                  int v211 = v129 + 40;
                  int v212 = (void *)*((void *)v129 + 5);
                  if (v212 || (int v211 = v129 + 32, (v212 = (void *)*((void *)v129 + 4)) != 0LL))
                  {
                    do
                    {
                      do
                      {
                        unsigned int v213 = v211;
                        unsigned int v209 = (char *)v212;
                        int v211 = v212 + 5;
                        int v212 = (void *)v212[5];
                      }

                      while (v212);
                      int v211 = v209 + 32;
                      int v212 = (void *)*((void *)v209 + 4);
                    }

                    while (v212);
                    *unsigned int v213 = 0LL;
                    if (!v208) {
                      goto LABEL_259;
                    }
                  }

                  else
                  {
                    unsigned int v209 = 0LL;
                    if (!v208) {
                      goto LABEL_259;
                    }
                  }
                }

                else
                {
                  uint64_t v210 = *((void *)v129 + 2);
                  *(void *)(v210 + 24) = v209;
                  *((void *)v209 + 2) = v210;
                  if (!v208) {
                    goto LABEL_259;
                  }
                }

                uint64_t v214 = v3 + 8LL * *((unsigned int *)v129 + 14);
                if (v129 != *(char **)(v214 + 600))
                {
                  uint64_t v215 = 40LL;
                  *(void *)(v208 + v215) = v209;
                  if (!v209) {
                    goto LABEL_259;
                  }
                  goto LABEL_253;
                }

                *(void *)(v214 + 600) = v209;
                if (v209)
                {
LABEL_253:
                  *((void *)v209 + 6) = v208;
                  uint64_t v216 = *((void *)v129 + 4);
                  if (v216)
                  {
                    *((void *)v209 + 4) = v216;
                    *(void *)(v216 + 48) = v209;
                  }

                  uint64_t v217 = *((void *)v129 + 5);
                  if (v217)
                  {
                    *((void *)v209 + 5) = v217;
                    *(void *)(v217 + 48) = v209;
                  }

                  goto LABEL_259;
                }

                *(_DWORD *)(v3 + 4) &= ~(1 << *((_DWORD *)v129 + 14));
LABEL_259:
                v129 += v133;
                v131 += v133;
                unint64_t v132 = *((void *)v129 + 1);
                goto LABEL_260;
              }

              unint64_t v206 = *(void *)(v3 + 8) + v131;
              *(void *)(v3 + 8) = v206;
              unsigned int v207 = v279;
              *(void *)(v3 + 32) = v279;
              *((void *)v207 + 1) = v206 | 1;
              *(void *)&v207[v206] = v206;
            }

LABEL_280:
            unsigned int v81 = v278;
            goto LABEL_98;
          }
        }

        while (1)
        {
          unint64_t v136 = *v125;
          if (*v125 <= v277)
          {
            unint64_t v137 = v125[1];
            unint64_t v138 = v136 + v137;
            if (v136 + v137 > v277) {
              break;
            }
          }

          unsigned int v125 = (unint64_t *)v125[2];
        }

        if (((v138 - 79) & 0xF) != 0) {
          uint64_t v139 = (79 - (int)v138) & 0xFLL;
        }
        else {
          uint64_t v139 = 0LL;
        }
        unint64_t v140 = v138 + v139 - 95;
        unsigned int v141 = (_BYTE *)(v277 + 32);
        if (v140 >= v277 + 32) {
          int v142 = (char *)v140;
        }
        else {
          int v142 = (char *)v277;
        }
        unsigned int v143 = v142 + 16;
        unint64_t v144 = v97 - 80;
        else {
          uint64_t v145 = 0LL;
        }
        int v146 = &v95[v145];
        uint64_t v147 = v144 - v145;
        *int v276 = (uint64_t *)v146;
        *int v275 = v147;
        *((void *)v146 + 1) = v147 | 1;
        *(void *)&v95[v144 + 8] = 80LL;
        *(void *)(v3 + 48) = qword_18C724768;
        *((void *)v142 + 1) = 51LL;
        *((void *)v142 + 6) = qword_18C724748 ^ v3;
        if (((v143 ^ v123) & 7) != 0)
        {
          uint64_t v148 = 0LL;
          do
          {
            unsigned int v149 = &v143[v148 * 8];
            *unsigned int v149 = v123[v148];
            v149[1] = BYTE1(v123[v148]);
            v149[2] = BYTE2(v123[v148]);
            v149[3] = BYTE3(v123[v148]);
            v149[4] = BYTE4(v123[v148]);
            v149[5] = BYTE5(v123[v148]);
            v149[6] = BYTE6(v123[v148]);
            v149[7] = HIBYTE(v123[v148++]);
          }

          while ((_DWORD)(v148 * 8) != 32);
        }

        else
        {
          unint64_t v167 = -(int)v123 & 7;
          int v168 = v142 + 16;
          switch((int)v167)
          {
            case 1:
              goto LABEL_206;
            case 2:
              goto LABEL_205;
            case 3:
              goto LABEL_204;
            case 4:
              goto LABEL_203;
            case 5:
              goto LABEL_202;
            case 6:
              goto LABEL_201;
            case 7:
              char v169 = *(_BYTE *)v123;
              char v123 = (void **)(v3 + 889);
              *unsigned int v143 = v169;
              int v168 = v142 + 17;
LABEL_201:
              char v170 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v168++ = v170;
LABEL_202:
              char v171 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v168++ = v171;
LABEL_203:
              char v172 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v168++ = v172;
LABEL_204:
              char v173 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v168++ = v173;
LABEL_205:
              char v174 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v168++ = v174;
LABEL_206:
              char v175 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *int v168 = v175;
              int v176 = v168 + 1;
              break;
            default:
              int v176 = v142 + 16;
              break;
          }

          BOOL v177 = v167 <= 0x20;
          char v178 = 32 - v167;
          if (!v177) {
            char v178 = 0;
          }
          uint64_t v232 = v178 & 7;
          switch(v232)
          {
            case 0LL:
              break;
            case 1LL:
              goto LABEL_288;
            case 2LL:
              goto LABEL_287;
            case 3LL:
              goto LABEL_286;
            case 4LL:
              goto LABEL_285;
            case 5LL:
              goto LABEL_284;
            case 6LL:
              goto LABEL_283;
            case 7LL:
              char v233 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v176++ = v233;
LABEL_283:
              char v234 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v176++ = v234;
LABEL_284:
              char v235 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v176++ = v235;
LABEL_285:
              char v236 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v176++ = v236;
LABEL_286:
              char v237 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v176++ = v237;
LABEL_287:
              char v238 = *(_BYTE *)v123;
              char v123 = (void **)((char *)v123 + 1);
              *v176++ = v238;
LABEL_288:
              *int v176 = *(_BYTE *)v123;
              break;
            default:
              __asm { BR              X2 }

              return result;
          }
        }

        *(void *)(v3 + 888) = v95;
        *(void *)(v3 + 896) = v97;
        *(_DWORD *)(v3 + 912) = v96;
        *(void *)(v3 + 904) = v143;
        unsigned int v239 = (char *)(v137 + v136);
        memset_pattern16(v142 + 56, &unk_18873CA50, ((v239 - v142 - 57) & 0xFFFFFFFFFFFFFFF8LL) + 8);
        if (v142 != (char *)v277)
        {
          unint64_t v240 = v277;
          unint64_t v241 = (unint64_t)&v142[-v277];
          unint64_t v281 = (unint64_t)&v142[-v277];
          *((void *)v142 + 1) &= ~1uLL;
          *(void *)(v240 + 8) = (unint64_t)&v142[-v240] | 1;
          *(void *)int v142 = &v142[-v240];
          if ((unint64_t)&v142[-v240] > 0xFF)
          {
            unsigned int v266 = 31;
            if (!(v241 >> 24))
            {
              unsigned int v246 = (((v281 >> 8) + 1048320) >> 16) & 8;
              unsigned int v247 = (v281 >> 8) << v246;
              unsigned int v248 = (v247 << (((v247 + 520192) >> 16) & 4) << ((((v247 << (((v247 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                   - (((v247 + 520192) >> 16) & 4 | v246 | (((v247 << (((v247 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
              unsigned int v266 = ((v281 >> (v248 + 21)) & 1 | (2 * v248)) + 28;
            }

            unsigned int v267 = v266;
            uint64_t v249 = v3 + 8LL * v266 + 600;
            *(_DWORD *)(v277 + 56) = v266;
            uint64_t v268 = v249;
            uint64_t v269 = v3 + 4;
            unsigned int v257 = v141;
LABEL_298:
            uint64_t v193 = qword_18A26FDB0[v228];
            goto LABEL_268;
          }

          unint64_t v242 = v241 >> 3;
          uint64_t v243 = v3 + ((2 * v241) & 0x7FFFFFFF0LL) + 72;
          int v244 = 1 << v242;
          if ((v244 & *(_DWORD *)v3) != 0)
          {
            uint64_t v245 = *(void *)(v243 + 16);
          }

          else
          {
            *(_DWORD *)v3 |= v244;
            uint64_t v245 = v243;
          }

          unint64_t v250 = v277;
          *(void *)(v243 + 16) = v277;
          *(void *)(v245 + 24) = v250;
          *(void *)(v250 + 16) = v245;
          *(void *)(v250 + 24) = v243;
        }
      }

      else
      {
        unint64_t v152 = *(void *)(v3 + 24);
        *(void *)(v3 + 888) = v95;
        *(void *)(v3 + 896) = v92;
        *(_DWORD *)(v3 + 912) = v96;
        uint64_t v153 = qword_18C724748;
        *(void *)(v3 + 56) = 4095LL;
        *(void *)(v3 + 64) = v153;
        *(void *)(v3 + 88) = v3 + 72;
        *(void *)(v3 + 96) = v3 + 72;
        *(void *)(v3 + 112) = v3 + 88;
        *(void *)(v3 + 104) = v3 + 88;
        *(void *)(v3 + 128) = v3 + 104;
        *(void *)(v3 + 120) = v3 + 104;
        *(void *)(v3 + 136) = v3 + 120;
        *(void *)(v3 + 144) = v3 + 120;
        *(void *)(v3 + 160) = v3 + 136;
        *(void *)(v3 + 152) = v3 + 136;
        *(void *)(v3 + 176) = v3 + 152;
        *(void *)(v3 + 168) = v3 + 152;
        *(void *)(v3 + 184) = v3 + 168;
        *(void *)(v3 + 192) = v3 + 168;
        *(void *)(v3 + 208) = v3 + 184;
        *(void *)(v3 + 200) = v3 + 184;
        *(void *)(v3 + 224) = v3 + 200;
        *(void *)(v3 + 216) = v3 + 200;
        *(void *)(v3 + 232) = v3 + 216;
        *(void *)(v3 + 240) = v3 + 216;
        *(void *)(v3 + 248) = v3 + 232;
        *(void *)(v3 + 256) = v3 + 232;
        *(void *)(v3 + 264) = v3 + 248;
        *(void *)(v3 + 272) = v3 + 248;
        *(void *)(v3 + 280) = v3 + 264;
        *(void *)(v3 + 288) = v3 + 264;
        *(void *)(v3 + 296) = v3 + 280;
        *(void *)(v3 + 304) = v3 + 280;
        *(void *)(v3 + 312) = v3 + 296;
        *(void *)(v3 + 320) = v3 + 296;
        *(void *)(v3 + 328) = v3 + 312;
        *(void *)(v3 + 336) = v3 + 312;
        *(void *)(v3 + 344) = v3 + 328;
        *(void *)(v3 + 352) = v3 + 328;
        *(void *)(v3 + 360) = v3 + 344;
        *(void *)(v3 + 368) = v3 + 344;
        *(void *)(v3 + 376) = v3 + 360;
        *(void *)(v3 + 384) = v3 + 360;
        *(void *)(v3 + 392) = v3 + 376;
        *(void *)(v3 + 400) = v3 + 376;
        *(void *)(v3 + 408) = v3 + 392;
        *(void *)(v3 + 416) = v3 + 392;
        *(void *)(v3 + 424) = v3 + 408;
        *(void *)(v3 + 432) = v3 + 408;
        *(void *)(v3 + 440) = v3 + 424;
        *(void *)(v3 + 448) = v3 + 424;
        *(void *)(v3 + 456) = v3 + 440;
        *(void *)(v3 + 464) = v3 + 440;
        *(void *)(v3 + 472) = v3 + 456;
        *(void *)(v3 + 480) = v3 + 456;
        *(void *)(v3 + 488) = v3 + 472;
        *(void *)(v3 + 504) = v3 + 488;
        *(void *)(v3 + 512) = v3 + 488;
        *(void *)(v3 + 496) = v3 + 472;
        *(void *)(v3 + 528) = v3 + 504;
        *(void *)(v3 + 520) = v3 + 504;
        *(void *)(v3 + 544) = v3 + 520;
        *(void *)(v3 + 536) = v3 + 520;
        *(void *)(v3 + 560) = v3 + 536;
        *(void *)(v3 + 552) = v3 + 536;
        *(void *)(v3 + 576) = v3 + 552;
        *(void *)(v3 + 568) = v3 + 552;
        *(void *)(v3 + 592) = v3 + 568;
        *(void *)(v3 + 584) = v3 + 568;
        unint64_t v154 = v3 + (*(void *)(v3 - 8) & 0xFFFFFFFFFFFFFFF8LL);
        unint64_t v155 = v154 - 16;
        uint64_t v156 = (uint64_t)&v95[v92 + 16 - v154];
        if ((v154 & 0xF) != 0) {
          uint64_t v157 = -(int)v154 & 0xFLL;
        }
        else {
          uint64_t v157 = 0LL;
        }
        int v158 = (uint64_t *)(v155 + v157);
        uint64_t v159 = v156 - v157 - 80;
        *int v276 = v158;
        *int v275 = v159;
        v158[1] = v159 | 1;
        *(void *)&v95[v92 - 72] = 80LL;
        *(void *)(v3 + 48) = qword_18C724768;
      }

LABEL_301:
      if (*v275 > v274)
      {
        unint64_t v251 = v274;
        uint64_t v252 = *v275 - v274;
        *int v275 = v252;
        int v253 = *v276;
        int v254 = (uint64_t *)((char *)*v276 + v251);
        *int v276 = v254;
        v254[1] = v252 | 1;
        v253[1] = v251 | 3;
        *int v254 = qword_18C724748 ^ v3;
        uint64_t result = v253 + 2;
        goto LABEL_99;
      }

      goto LABEL_303;
    }
  }

LABEL_99:
  if ((*(_BYTE *)(v3 + 880) & 2) != 0) {
    atomic_store(0, (unsigned int *)(v3 + 884));
  }
  return result;
}

unint64_t sub_188724168(unint64_t result)
{
  if (!result) {
    return result;
  }
  unint64_t v2 = result;
  uint64_t v3 = (char *)(result - 16);
  uint64_t v4 = qword_18C724748 ^ *(void *)(result - 16 + (*(void *)(result - 8) & 0xFFFFFFFFFFFFFFF8LL));
  if ((*(_BYTE *)(v4 + 0x370) & 2) != 0)
  {
    uint64_t v1 = (unsigned int *)(v4 + 884);
    do
      unsigned int v5 = __ldaxr(v1);
    while (__stlxr(1u, v1));
    if (v5)
    {
      int v6 = 0;
      while (1)
      {
        if (!*v1)
        {
          do
            unsigned int v7 = __ldaxr(v1);
          while (__stlxr(1u, v1));
          if (!v7) {
            break;
          }
        }

        if ((++v6 & 0x3F) == 0) {
          uint64_t result = sched_yield();
        }
      }
    }
  }

  uint64_t v8 = *(void *)(v2 - 8);
  unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = &v3[v8 & 0xFFFFFFFFFFFFFFF8LL];
  if ((v8 & 1) == 0)
  {
    unint64_t v11 = *(void *)v3;
    if ((v8 & 3) == 0)
    {
      size_t v14 = v9 + v11 + 32;
      uint64_t result = munmap(&v3[-v11], v14);
      if (!(_DWORD)result) {
        *(void *)(v4 + 856) -= v14;
      }
      goto LABEL_119;
    }

    v3 -= v11;
    v9 += v11;
    if (v3 != *(char **)(v4 + 32))
    {
      if (v11 <= 0xFF)
      {
        uint64_t v12 = *((void *)v3 + 2);
        uint64_t v13 = *((void *)v3 + 3);
        if (v13 == v12)
        {
          *(_DWORD *)v4 &= ~(1 << (v11 >> 3));
        }

        else
        {
          *(void *)(v12 + 24) = v13;
          *(void *)(v13 + 16) = v12;
        }

        goto LABEL_42;
      }

      uint64_t v15 = *((void *)v3 + 6);
      uint64_t v16 = (char *)*((void *)v3 + 3);
      if (v16 == v3)
      {
        uint64_t v18 = v3 + 40;
        int v19 = (void *)*((void *)v3 + 5);
        if (v19 || (uint64_t v18 = v3 + 32, (v19 = (void *)*((void *)v3 + 4)) != 0LL))
        {
          do
          {
            do
            {
              unint64_t v20 = v18;
              uint64_t v16 = (char *)v19;
              uint64_t v18 = v19 + 5;
              int v19 = (void *)v19[5];
            }

            while (v19);
            uint64_t v18 = v16 + 32;
            int v19 = (void *)*((void *)v16 + 4);
          }

          while (v19);
          *unint64_t v20 = 0LL;
          if (!v15) {
            goto LABEL_42;
          }
        }

        else
        {
          uint64_t v16 = 0LL;
          if (!v15) {
            goto LABEL_42;
          }
        }
      }

      else
      {
        uint64_t v17 = *((void *)v3 + 2);
        *(void *)(v17 + 24) = v16;
        *((void *)v16 + 2) = v17;
        if (!v15) {
          goto LABEL_42;
        }
      }

      uint64_t v21 = v4 + 8LL * *((unsigned int *)v3 + 14);
      if (v3 == *(char **)(v21 + 600))
      {
        *(void *)(v21 + 600) = v16;
        if (!v16)
        {
          *(_DWORD *)(v4 + 4) &= ~(1 << *((_DWORD *)v3 + 14));
          goto LABEL_42;
        }
      }

      else
      {
        uint64_t v22 = 40LL;
        *(void *)(v15 + v22) = v16;
        if (!v16) {
          goto LABEL_42;
        }
      }

      *((void *)v16 + 6) = v15;
      uint64_t v23 = *((void *)v3 + 4);
      if (v23)
      {
        *((void *)v16 + 4) = v23;
        *(void *)(v23 + 48) = v16;
      }

      uint64_t v24 = *((void *)v3 + 5);
      if (v24)
      {
        *((void *)v16 + 5) = v24;
        *(void *)(v24 + 48) = v16;
      }

      goto LABEL_42;
    }

    if ((~*((_DWORD *)v10 + 2) & 3LL) == 0)
    {
      *(void *)(v4 + 8) = v9;
      *((void *)v10 + 1) &= ~1uLL;
      *((void *)v3 + 1) = v9 | 1;
      *(void *)unint64_t v10 = v9;
      goto LABEL_119;
    }
  }

LABEL_42:
  unint64_t v25 = *((void *)v10 + 1);
  if ((v25 & 2) != 0)
  {
    *((void *)v10 + 1) = v25 & 0xFFFFFFFFFFFFFFFELL;
    *((void *)v3 + 1) = v9 | 1;
    *(void *)&v3[v9] = v9;
LABEL_49:
    if (v9 <= 0xFF)
    {
      unint64_t v28 = v9 >> 3;
      uint64_t v29 = v4 + ((2 * v9) & 0x7FFFFFFF0LL) + 72;
      int v30 = 1 << v28;
      if ((*(_DWORD *)v4 & v30) != 0)
      {
        uint64_t v31 = *(void *)(v29 + 16);
      }

      else
      {
        *(_DWORD *)v4 |= v30;
        uint64_t v31 = v29;
      }

      *(void *)(v29 + 16) = v3;
      *(void *)(v31 + 24) = v3;
      *((void *)v3 + 2) = v31;
      *((void *)v3 + 3) = v29;
      goto LABEL_119;
    }

    if (v9 >> 24)
    {
      unsigned int v32 = 31;
    }

    else
    {
      unsigned int v41 = (((v9 >> 8) + 1048320) >> 16) & 8;
      unsigned int v42 = (v9 >> 8) << v41;
      unsigned int v43 = (v42 << (((v42 + 520192) >> 16) & 4) << ((((v42 << (((v42 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
          - (((v42 + 520192) >> 16) & 4 | v41 | (((v42 << (((v42 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
      unsigned int v32 = ((v9 >> (v43 + 21)) & 1 | (2 * v43)) + 28;
    }

    *((_DWORD *)v3 + 14) = v32;
    int v44 = v3 + 32;
    unsigned int v45 = -((_DWORD)v3 + 32) & 7;
    switch(v45)
    {
      case 1u:
        goto LABEL_74;
      case 2u:
        goto LABEL_73;
      case 3u:
        goto LABEL_72;
      case 4u:
        goto LABEL_71;
      case 5u:
        goto LABEL_70;
      case 6u:
        goto LABEL_69;
      case 7u:
        *int v44 = 0;
        int v44 = v3 + 33;
LABEL_69:
        *v44++ = 0;
LABEL_70:
        *v44++ = 0;
LABEL_71:
        *v44++ = 0;
LABEL_72:
        *v44++ = 0;
LABEL_73:
        *v44++ = 0;
LABEL_74:
        *v44++ = 0;
        break;
      default:
        break;
    }

    int v46 = (char **)(v4 + 8LL * v32 + 600);
    uint64_t v47 = 16LL - v45;
    uint64_t v66 = v47;
    uint64_t v65 = v47 & 7;
    switch(v66)
    {
      case 0LL:
        goto LABEL_130;
      case 1LL:
        goto LABEL_129;
      case 2LL:
        goto LABEL_128;
      case 3LL:
        goto LABEL_127;
      case 4LL:
        goto LABEL_126;
      case 5LL:
        goto LABEL_125;
      case 6LL:
        goto LABEL_124;
      case 7LL:
        *v44++ = 0;
LABEL_124:
        *v44++ = 0;
LABEL_125:
        *v44++ = 0;
LABEL_126:
        *v44++ = 0;
LABEL_127:
        *v44++ = 0;
LABEL_128:
        *v44++ = 0;
LABEL_129:
        *int v44 = 0;
LABEL_130:
        int v67 = *(_DWORD *)(v4 + 4);
        if ((v67 & (1 << v32)) == 0)
        {
          *(_DWORD *)(v4 + 4) = v67 | (1 << v32);
          *int v46 = v3;
          *((void *)v3 + 6) = v46;
          goto LABEL_139;
        }

        uint64_t v68 = *v46;
        if (v32 == 31) {
          LOBYTE(v69) = 0;
        }
        else {
          int v69 = 57 - (v32 >> 1);
        }
        unint64_t v70 = v9 << v69;
        while (1)
        {
          uint64_t v71 = v68;
          if ((*((void *)v68 + 1) & 0xFFFFFFFFFFFFFFF8LL) == v9) {
            break;
          }
          uint64_t v72 = &v68[8 * (v70 >> 63)];
          unint64_t v74 = (char *)*((void *)v72 + 4);
          uint64_t v73 = (char **)(v72 + 32);
          uint64_t v68 = v74;
          v70 *= 2LL;
          if (!v74)
          {
            *uint64_t v73 = v3;
            *((void *)v3 + 6) = v71;
LABEL_139:
            *((void *)v3 + 2) = v3;
            *((void *)v3 + 3) = v3;
            goto LABEL_141;
          }
        }

        uint64_t v75 = *((void *)v68 + 2);
        *(void *)(v75 + 24) = v3;
        *((void *)v68 + 2) = v3;
        *((void *)v3 + 2) = v75;
        *((void *)v3 + 3) = v68;
        *((void *)v3 + 6) = 0LL;
LABEL_141:
        uint64_t v76 = *(void *)(v4 + 56) - 1LL;
        *(void *)(v4 + 56) = v76;
        if (v76) {
          goto LABEL_119;
        }
        char v49 = 0;
        break;
      default:
        __asm { BR              X16 }

        return result;
    }

LABEL_143:
    uint64_t v77 = *(void *)(v4 + 904);
    if (!v77 || (*(_DWORD *)(v77 + 24) & 9) != 1)
    {
      size_t v78 = 0LL;
      goto LABEL_158;
    }

    size_t v78 = 0LL;
    uint64_t result = *(void *)v77;
    size_t v79 = *(void *)(v77 + 8);
    uint64_t v80 = *(void *)v77 + 16LL;
    if ((v80 & 0xF) != 0) {
      uint64_t v81 = -(int)v80 & 0xFLL;
    }
    else {
      uint64_t v81 = 0LL;
    }
    unint64_t v82 = (char *)(result + v81);
    unint64_t v83 = *(void *)(result + v81 + 8);
    unint64_t v84 = v83 & 0xFFFFFFFFFFFFFFF8LL;
    if ((v83 & 3) != 1 || result + v81 + (v83 & 0xFFFFFFFFFFFFFFF8LL) < result + v79 - 80)
    {
LABEL_158:
      *(void *)(v4 + 56) = 4095LL;
      if (v2 + v78) {
        char v90 = 0;
      }
      else {
        char v90 = v49;
      }
      if ((v90 & 1) != 0 && *(void *)v1 > *(void *)(v4 + 48)) {
        *(void *)(v4 + 48) = -1LL;
      }
      goto LABEL_119;
    }

    uint64_t v86 = *(void *)(v77 + 16);
    if (v82 == *(char **)(v4 + 32))
    {
      *(void *)(v4 + 32) = 0LL;
      *(void *)(v4 + 8) = 0LL;
      goto LABEL_181;
    }

    uint64_t v87 = *((void *)v82 + 6);
    uint64_t v88 = (char *)*((void *)v82 + 3);
    if (v88 == v82)
    {
      unint64_t v91 = v82 + 40;
      unint64_t v92 = (void *)*((void *)v82 + 5);
      if (v92 || (unint64_t v91 = v82 + 32, (v92 = (void *)*((void *)v82 + 4)) != 0LL))
      {
        do
        {
          do
          {
            unint64_t v93 = v91;
            uint64_t v88 = (char *)v92;
            unint64_t v91 = v92 + 5;
            unint64_t v92 = (void *)v92[5];
          }

          while (v92);
          unint64_t v91 = v88 + 32;
          unint64_t v92 = (void *)*((void *)v88 + 4);
        }

        while (v92);
        *unint64_t v93 = 0LL;
        if (!v87) {
          goto LABEL_181;
        }
      }

      else
      {
        uint64_t v88 = 0LL;
        if (!v87) {
          goto LABEL_181;
        }
      }
    }

    else
    {
      uint64_t v89 = *((void *)v82 + 2);
      *(void *)(v89 + 24) = v88;
      *((void *)v88 + 2) = v89;
      if (!v87) {
        goto LABEL_181;
      }
    }

    uint64_t v94 = v4 + 8LL * *((unsigned int *)v82 + 14);
    if (v82 == *(char **)(v94 + 600))
    {
      *(void *)(v94 + 600) = v88;
      if (!v88)
      {
        *(_DWORD *)(v4 + 4) &= ~(1 << *((_DWORD *)v82 + 14));
        goto LABEL_181;
      }
    }

    else
    {
      uint64_t v95 = 40LL;
      *(void *)(v87 + v95) = v88;
      if (!v88)
      {
LABEL_181:
        uint64_t result = munmap((void *)result, v79);
        if ((_DWORD)result)
        {
          if (v83 >= 0x100)
          {
            if (v83 >> 24)
            {
              unsigned int v98 = 31;
            }

            else
            {
              unsigned int v99 = (((v83 >> 8) + 1048320) >> 16) & 8;
              unsigned int v100 = (v83 >> 8) << v99;
              unsigned int v101 = (v100 << (((v100 + 520192) >> 16) & 4) << ((((v100 << (((v100 + 520192) >> 16) & 4)) + 245760) >> 16) & 2) >> 15)
                   - (((v100 + 520192) >> 16) & 4 | v99 | (((v100 << (((v100 + 520192) >> 16) & 4)) + 245760) >> 16) & 2);
              unsigned int v98 = ((v84 >> (v101 + 21)) & 1 | (2 * v101)) + 28;
            }
          }

          else
          {
            unsigned int v98 = 0;
          }

          *((_DWORD *)v82 + 14) = v98;
          uint64_t v102 = v82 + 32;
          unsigned int v103 = -((_DWORD)v82 + 32) & 7;
          switch(v103)
          {
            case 1u:
              goto LABEL_195;
            case 2u:
              goto LABEL_194;
            case 3u:
              goto LABEL_193;
            case 4u:
              goto LABEL_192;
            case 5u:
              goto LABEL_191;
            case 6u:
              goto LABEL_190;
            case 7u:
              *uint64_t v102 = 0;
              uint64_t v102 = v82 + 33;
LABEL_190:
              *v102++ = 0;
LABEL_191:
              *v102++ = 0;
LABEL_192:
              *v102++ = 0;
LABEL_193:
              *v102++ = 0;
LABEL_194:
              *v102++ = 0;
LABEL_195:
              *v102++ = 0;
              break;
            default:
              break;
          }

          unint64_t v104 = (char **)(v4 + 8LL * v98 + 600);
          uint64_t v105 = 16LL - v103;
          uint64_t v107 = v105;
          uint64_t v106 = v105 & 7;
          switch(v107)
          {
            case 0LL:
              goto LABEL_206;
            case 1LL:
              goto LABEL_205;
            case 2LL:
              goto LABEL_204;
            case 3LL:
              goto LABEL_203;
            case 4LL:
              goto LABEL_202;
            case 5LL:
              goto LABEL_201;
            case 6LL:
              goto LABEL_200;
            case 7LL:
              *v102++ = 0;
LABEL_200:
              *v102++ = 0;
LABEL_201:
              *v102++ = 0;
LABEL_202:
              *v102++ = 0;
LABEL_203:
              *v102++ = 0;
LABEL_204:
              *v102++ = 0;
LABEL_205:
              *uint64_t v102 = 0;
LABEL_206:
              int v108 = *(_DWORD *)(v4 + 4);
              int v109 = 1 << v98;
              if ((v108 & (1 << v98)) == 0)
              {
                size_t v78 = 0LL;
                *(_DWORD *)(v4 + 4) = v108 | v109;
                *unint64_t v104 = v82;
                *((void *)v82 + 6) = v104;
                goto LABEL_215;
              }

              int v110 = *v104;
              if (v98 == 31) {
                LOBYTE(v111) = 0;
              }
              else {
                int v111 = 57 - (v98 >> 1);
              }
              unint64_t v112 = v84 << v111;
              while (1)
              {
                unint64_t v113 = v110;
                if ((*((void *)v110 + 1) & 0xFFFFFFFFFFFFFFF8LL) == v84) {
                  break;
                }
                uint64_t v114 = &v110[8 * (v112 >> 63)];
                uint64_t v116 = (char *)*((void *)v114 + 4);
                int v115 = (char **)(v114 + 32);
                int v110 = v116;
                v112 *= 2LL;
                if (!v116)
                {
                  size_t v78 = 0LL;
                  *int v115 = v82;
                  *((void *)v82 + 6) = v113;
LABEL_215:
                  *((void *)v82 + 2) = v82;
                  *((void *)v82 + 3) = v82;
                  goto LABEL_158;
                }
              }

              size_t v78 = 0LL;
              uint64_t v117 = *((void *)v110 + 2);
              *(void *)(v117 + 24) = v82;
              *((void *)v113 + 2) = v82;
              *((void *)v82 + 2) = v117;
              *((void *)v82 + 3) = v113;
              *((void *)v82 + 6) = 0LL;
              break;
            default:
              __asm { BR              X15 }

              return result;
          }
        }

        else
        {
          *(void *)(v4 + 856) -= v79;
          *(void *)(v4 + 904) = v86;
          size_t v78 = v79;
        }

        goto LABEL_158;
      }
    }

    *((void *)v88 + 6) = v87;
    uint64_t v96 = *((void *)v82 + 4);
    if (v96)
    {
      *((void *)v88 + 4) = v96;
      *(void *)(v96 + 48) = v88;
    }

    uint64_t v97 = *((void *)v82 + 5);
    if (v97)
    {
      *((void *)v88 + 5) = v97;
      *(void *)(v97 + 48) = v88;
    }

    goto LABEL_181;
  }

  if (v10 == *(char **)(v4 + 40))
  {
    uint64_t v1 = (unsigned int *)(v4 + 16);
    unint64_t v33 = *(void *)(v4 + 16) + v9;
    *(void *)(v4 + 16) = v33;
    *(void *)(v4 + 40) = v3;
    *((void *)v3 + 1) = v33 | 1;
    if (v3 == *(char **)(v4 + 32))
    {
      *(void *)(v4 + 32) = 0LL;
      *(void *)(v4 + 8) = 0LL;
    }

    if (v33 <= *(void *)(v4 + 48)) {
      goto LABEL_119;
    }
    unint64_t v34 = *(void *)(v4 + 40);
    if (!v34) {
      goto LABEL_119;
    }
    if (*(void *)v1 >= 0x51uLL)
    {
      unint64_t v35 = v4 + 888;
      uint64_t v36 = v4 + 888;
      do
      {
        if (*(void *)v36 <= v34 && *(void *)v36 + *(void *)(v36 + 8) > v34) {
          break;
        }
        uint64_t v36 = *(void *)(v36 + 16);
      }

      while (v36);
      if ((*(_DWORD *)(v36 + 24) & 9) == 1)
      {
        unint64_t v37 = *(void *)(v36 + 8);
        unint64_t v38 = v37 - v2;
        if (v37 >= v2)
        {
          unint64_t v39 = *(void *)v36;
          unint64_t v40 = *(void *)v36 + v37;
          while (v35 < v39 || v35 >= v40)
          {
            unint64_t v35 = *(void *)(v35 + 16);
            if (!v35)
            {
              uint64_t result = munmap( (void *)(v39 + v38),  ((*(void *)v1 + (void)xmmword_18C724758 - 81LL) / (unint64_t)xmmword_18C724758 - 1)
                       * xmmword_18C724758);
              char v49 = 1;
              if (v2)
              {
                if ((_DWORD)result)
                {
                  unint64_t v2 = 0LL;
                }

                else
                {
                  *(void *)(v36 + 8) -= v2;
                  *(void *)(v4 + 856) -= v2;
                  uint64_t v60 = *(void *)(v4 + 40);
                  unint64_t v61 = *(void *)(v4 + 16) - v2;
                  if (((v60 + 16) & 0xF) != 0) {
                    uint64_t v62 = -((_DWORD)v60 + 16) & 0xFLL;
                  }
                  else {
                    uint64_t v62 = 0LL;
                  }
                  uint64_t v63 = v60 + v62;
                  unint64_t v64 = v61 - v62;
                  *(void *)(v4 + 40) = v63;
                  *(void *)(v4 + 16) = v64;
                  *(void *)(v63 + 8) = v64 | 1;
                  *(void *)(v60 + v61 + 8) = 80LL;
                  *(void *)(v4 + 48) = qword_18C724768;
                }
              }

              goto LABEL_143;
            }
          }
        }
      }
    }

    unint64_t v2 = 0LL;
    char v49 = 1;
    goto LABEL_143;
  }

  if (v10 == *(char **)(v4 + 32))
  {
    unint64_t v48 = *(void *)(v4 + 8) + v9;
    *(void *)(v4 + 8) = v48;
    *(void *)(v4 + 32) = v3;
    *((void *)v3 + 1) = v48 | 1;
    *(void *)&v3[v48] = v48;
    goto LABEL_119;
  }

  v9 += v25 & 0xFFFFFFFFFFFFFFF8LL;
  if (v25 <= 0xFF)
  {
    uint64_t v27 = *((void *)v10 + 2);
    uint64_t v26 = *((void *)v10 + 3);
    if (v26 == v27)
    {
      *(_DWORD *)v4 &= ~(1 << (v25 >> 3));
    }

    else
    {
      *(void *)(v27 + 24) = v26;
      *(void *)(v26 + 16) = v27;
    }

    goto LABEL_104;
  }

  uint64_t v50 = *((void *)v10 + 6);
  unsigned int v51 = (char *)*((void *)v10 + 3);
  if (v51 == v10)
  {
    unsigned int v53 = v10 + 40;
    uint64_t v54 = (void *)*((void *)v10 + 5);
    if (v54 || (unsigned int v53 = v10 + 32, (v54 = (void *)*((void *)v10 + 4)) != 0LL))
    {
      do
      {
        do
        {
          uint64_t v55 = v53;
          unsigned int v51 = (char *)v54;
          unsigned int v53 = v54 + 5;
          uint64_t v54 = (void *)v54[5];
        }

        while (v54);
        unsigned int v53 = v51 + 32;
        uint64_t v54 = (void *)*((void *)v51 + 4);
      }

      while (v54);
      *uint64_t v55 = 0LL;
      if (!v50) {
        goto LABEL_104;
      }
    }

    else
    {
      unsigned int v51 = 0LL;
      if (!v50) {
        goto LABEL_104;
      }
    }
  }

  else
  {
    uint64_t v52 = *((void *)v10 + 2);
    *(void *)(v52 + 24) = v51;
    *((void *)v51 + 2) = v52;
    if (!v50) {
      goto LABEL_104;
    }
  }

  uint64_t v56 = v4 + 8LL * *((unsigned int *)v10 + 14);
  if (v10 == *(char **)(v56 + 600))
  {
    *(void *)(v56 + 600) = v51;
    if (!v51)
    {
      *(_DWORD *)(v4 + 4) &= ~(1 << *((_DWORD *)v10 + 14));
      goto LABEL_104;
    }

    goto LABEL_99;
  }

  uint64_t v57 = 40LL;
  *(void *)(v50 + v57) = v51;
  if (v51)
  {
LABEL_99:
    *((void *)v51 + 6) = v50;
    uint64_t v58 = *((void *)v10 + 4);
    if (v58)
    {
      *((void *)v51 + 4) = v58;
      *(void *)(v58 + 48) = v51;
    }

    uint64_t v59 = *((void *)v10 + 5);
    if (v59)
    {
      *((void *)v51 + 5) = v59;
      *(void *)(v59 + 48) = v51;
    }
  }

LABEL_104:
  *((void *)v3 + 1) = v9 | 1;
  *(void *)&v3[v9] = v9;
  *(void *)(v4 + 8) = v9;
LABEL_119:
  if ((*(_BYTE *)(v4 + 880) & 2) != 0) {
    atomic_store(0, (unsigned int *)(v4 + 884));
  }
  return result;
}

uint64_t sub_188724D10(void *a1)
{
  unint64_t v2 = sub_188722664(0x10uLL);
  if (v2) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  *a1 = v2;
  return v3;
}

double sub_188724D44(uint64_t a1, __int128 *a2, unsigned int a3, uint64_t a4)
{
  if (a3)
  {
    if (a3 < 8
      || a3 - 1 > 0xF
      || (~(_DWORD)a4 & 0xFu) < (((_BYTE)a3 - 1) & 0xFu)
      || (unint64_t)a2 - a1 - (a4 & 0xF) < 0x20)
    {
      uint64_t v4 = a4;
      unsigned int v5 = a2;
      goto LABEL_4;
    }

    uint64_t v6 = a3;
    if (a3 >= 0x20)
    {
      uint64_t v7 = a3 & 0xFFFFFFE0;
      uint64_t v8 = (__int128 *)(a1 + (a4 & 0xF));
      __int128 v9 = *v8;
      __int128 v10 = v8[1];
      *a2 = *v8;
      a2[1] = v10;
      if (v7 == a3) {
        return *(double *)&v9;
      }
      if ((a3 & 0x18) == 0)
      {
        a3 -= v7;
        unsigned int v5 = (__int128 *)((char *)a2 + v7);
        uint64_t v4 = a4 + v7;
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    uint64_t v4 = a4 + (a3 & 0xFFFFFFF8);
    unsigned int v5 = (__int128 *)((char *)a2 + (a3 & 0xFFFFFFF8));
    a3 -= a3 & 0xFFFFFFF8;
    unint64_t v11 = (void *)((char *)a2 + v7);
    uint64_t v12 = v7 + a4;
    uint64_t v13 = v7 - (v6 & 0xFFFFFFF8);
    do
    {
      *(void *)&__int128 v9 = *(void *)(a1 + (v12 & 0xF));
      *v11++ = v9;
      v12 += 8LL;
      v13 += 8LL;
    }

    while (v13);
    if ((v6 & 0xFFFFFFF8) == v6) {
      return *(double *)&v9;
    }
    do
    {
LABEL_4:
      *(_BYTE *)unsigned int v5 = *(_BYTE *)(a1 + (v4 & 0xF));
      unsigned int v5 = (__int128 *)((char *)v5 + 1);
      ++v4;
      --a3;
    }

    while (a3);
  }

  return *(double *)&v9;
}

void *sub_188724E30(void *result, char *a2, int a3, uint64_t a4)
{
  {
    char v4 = *a2++;
    *(_BYTE *)(*result + (a4++ & 0xF)) = v4;
  }

  return result;
}

unint64_t sub_188724E54(unint64_t result)
{
  if (result) {
    return sub_188724168(result);
  }
  return result;
}

uint64_t sub_188724E60(void **a1)
{
  unint64_t v2 = sub_188722664(0x18uLL);
  if (!v2) {
    goto LABEL_18;
  }
  uint64_t v3 = v2;
  *a1 = v2;
  sub_188725BAC(v2, 0, 0x10uLL);
  char v4 = sub_188722664(0x18uLL);
  if (!v4) {
    goto LABEL_18;
  }
  unsigned int v5 = v4;
  *uint64_t v3 = v4;
  sub_188725BAC(v4, 0, 0x10uLL);
  uint64_t v6 = sub_188722664(0x18uLL);
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  *unsigned int v5 = v6;
  sub_188725BAC(v6, 0, 0x10uLL);
  uint64_t v8 = sub_188722664(0x18uLL);
  if (!v8) {
    goto LABEL_18;
  }
  __int128 v9 = v8;
  *uint64_t v7 = v8;
  sub_188725BAC(v8, 0, 0x10uLL);
  __int128 v10 = sub_188722664(0x18uLL);
  if (!v10) {
    goto LABEL_18;
  }
  unint64_t v11 = v10;
  *__int128 v9 = v10;
  sub_188725BAC(v10, 0, 0x10uLL);
  uint64_t v12 = sub_188722664(0x18uLL);
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  *unint64_t v11 = v12;
  sub_188725BAC(v12, 0, 0x10uLL);
  size_t v14 = sub_188722664(0x18uLL);
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v15 = v14;
  *uint64_t v13 = v14;
  sub_188725BAC(v14, 0, 0x10uLL);
  uint64_t v16 = sub_188722664(0x18uLL);
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = v16;
  *uint64_t v15 = v16;
  sub_188725BAC(v16, 0, 0x10uLL);
  uint64_t v18 = sub_188722664(0x18uLL);
  if (!v18) {
    goto LABEL_18;
  }
  int v19 = v18;
  *uint64_t v17 = v18;
  sub_188725BAC(v18, 0, 0x10uLL);
  unint64_t v20 = sub_188722664(0x18uLL);
  if (!v20) {
    goto LABEL_18;
  }
  uint64_t v21 = v20;
  *int v19 = v20;
  sub_188725BAC(v20, 0, 0x10uLL);
  uint64_t v22 = sub_188722664(0x18uLL);
  if (!v22) {
    goto LABEL_18;
  }
  uint64_t v23 = v22;
  *uint64_t v21 = v22;
  sub_188725BAC(v22, 0, 0x10uLL);
  uint64_t v24 = sub_188722664(0x18uLL);
  if (!v24) {
    goto LABEL_18;
  }
  unint64_t v25 = v24;
  *uint64_t v23 = v24;
  sub_188725BAC(v24, 0, 0x10uLL);
  uint64_t v26 = sub_188722664(0x18uLL);
  if (!v26) {
    goto LABEL_18;
  }
  uint64_t v27 = v26;
  *unint64_t v25 = v26;
  sub_188725BAC(v26, 0, 0x10uLL);
  unint64_t v28 = sub_188722664(0x18uLL);
  if (!v28) {
    goto LABEL_18;
  }
  uint64_t v29 = v28;
  *uint64_t v27 = v28;
  sub_188725BAC(v28, 0, 0x10uLL);
  int v30 = sub_188722664(0x18uLL);
  if (!v30) {
    goto LABEL_18;
  }
  uint64_t v31 = v30;
  *uint64_t v29 = v30;
  sub_188725BAC(v30, 0, 0x10uLL);
  unsigned int v32 = sub_188722664(0x18uLL);
  if (v32)
  {
    *uint64_t v31 = v32;
    sub_188725BAC(v32, 0, 0x10uLL);
    return 0LL;
  }

  else
  {
LABEL_18:
    sub_188725128(*a1);
    *a1 = 0LL;
    return 0xFFFFFFFFLL;
  }

uint64_t *sub_188725098(uint64_t *result, _BYTE *a2, int a3, uint64_t a4)
{
  {
    uint64_t v4 = result[1];
    if (v4) {
      BOOL v5 = v4 == a4;
    }
    else {
      BOOL v5 = 1;
    }
    uint64_t v6 = result;
    if (!v5)
    {
      uint64_t v6 = result;
      do
      {
        uint64_t v6 = (uint64_t *)*v6;
        uint64_t v7 = v6[1];
        if (v7) {
          BOOL v8 = v7 == a4;
        }
        else {
          BOOL v8 = 1;
        }
      }

      while (!v8);
    }

    *a2++ = *((_BYTE *)v6 + 16);
    ++a4;
  }

  return result;
}

uint64_t *sub_1887250E4(uint64_t *result, char *a2, int a3, uint64_t a4)
{
  {
    char v4 = *a2;
    BOOL v5 = result;
    do
    {
      BOOL v5 = (uint64_t *)*v5;
      uint64_t v6 = v5[1];
      if (v6) {
        BOOL v7 = v6 == a4;
      }
      else {
        BOOL v7 = 1;
      }
    }

    while (!v7);
    if (!v6) {
      v5[1] = a4;
    }
    *((_BYTE *)v5 + 16) = v4;
    ++a2;
    ++a4;
  }

  return result;
}

void *sub_188725128(void *result)
{
  if (result)
  {
    do
    {
      uint64_t v1 = (void *)*result;
      sub_188724168((unint64_t)result);
      uint64_t result = v1;
    }

    while (v1);
  }

  return result;
}

uint64_t sub_188725154(void *a1)
{
  unint64_t v2 = sub_188722664(0x10uLL);
  if (v2) {
    uint64_t v3 = 0LL;
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  *a1 = v2;
  return v3;
}

uint64_t sub_188725188(uint64_t result, _BYTE *a2, int a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v4 = result + a4 * (result | 1);
    do
    {
      *a2++ = *(_BYTE *)(result + (v4 & 0xF));
      v4 += result | 1;
      --a3;
    }

    while (a3);
  }

  return result;
}

void *sub_1887251B0(void *result, char *a2, int a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v4 = *result | 1LL;
    uint64_t v5 = *result + v4 * a4;
    do
    {
      char v6 = *a2++;
      *(_BYTE *)(*result + (v5 & 0xF)) = v6;
      v5 += v4;
      --a3;
    }

    while (a3);
  }

  return result;
}

unint64_t sub_1887251E0(unint64_t result)
{
  if (result) {
    return sub_188724168(result);
  }
  return result;
}

uint64_t sub_1887251EC(void *a1)
{
  uint64_t v1 = a1;
  unsigned int v19 = a1 ^ sub_1887251EC;
  unint64_t v2 = sub_188722664(0x100uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0LL;
    uint64_t v18 = v1;
    *uint64_t v1 = v2;
    int v5 = (_DWORD)v2 + 2;
    for (uint64_t i = 1LL; ; ++i)
    {
      unsigned int v19 = v5 + v4 * 8 + v19 * &v19;
      BOOL v7 = &v3[v4];
      LOBYTE(v3[v4 + 1]) = v19 & 3;
      char v8 = v19;
      int v9 = (v5 + v4 * 8) & 3;
      __int128 v10 = sub_188722664(~(-2 << ((v5 + v4 * 8) & 3)));
      if (!v10) {
        break;
      }
      if (v9)
      {
        int v11 = -1 << v9;
        *__int128 v10 = ((v8 * v8) ^ 1) & 1;
        if (v9 != 1)
        {
          char v12 = (((v8 * v8) ^ 1) * ((v8 * v8) ^ 1)) ^ 1;
          v10[1] = v12 & 1;
          char v13 = (v12 * v12) ^ 1;
          v10[2] = v13 & 1;
          if (v11 != -4)
          {
            char v14 = (v13 * v13) ^ 1;
            v10[3] = v14 & 1;
            char v15 = (v14 * v14) ^ 1;
            v10[4] = v15 & 1;
            if (v11 != -6)
            {
              v10[5] = (v15 & 1) == 0;
              v10[6] = (v15 & 1) != 0;
            }
          }
        }
      }

      v3[v4] = v10;
      v4 += 2LL;
      if (v4 == 32) {
        return 0LL;
      }
    }

    *BOOL v7 = 0LL;
    uint64_t v1 = v18;
    do
    {
      if (*v7) {
        sub_188724168(*v7);
      }
      v7 -= 2;
    }

    while (i-- > 1);
    unint64_t v2 = v3;
  }

  sub_188724168((unint64_t)v2);
  *uint64_t v1 = 0LL;
  return 0xFFFFFFFFLL;
}

uint64_t sub_188725390(uint64_t result, _BYTE *a2, int a3, char a4)
{
  if (a3)
  {
    int v5 = a3;
    uint64_t v7 = result;
    do
    {
      uint64_t result = sub_1887255A0(*(void *)(v7 + 16LL * (a4 & 0xF)), 0, *(unsigned __int8 *)(v7 + 16LL * (a4 & 0xF) + 8));
      *a2++ = result;
      ++a4;
      --v5;
    }

    while (v5);
  }

  return result;
}

uint64_t sub_1887253EC(uint64_t result, char *a2, int a3, char a4)
{
  if (a3)
  {
    int v5 = a3;
    uint64_t v7 = (void *)result;
    do
    {
      char v8 = *a2++;
      uint64_t result = sub_1887254F4( *(void *)(*v7 + 16LL * (a4 & 0xF)),  0,  *(unsigned __int8 *)(*v7 + 16LL * (a4 & 0xF) + 8),  v8);
      ++a4;
      --v5;
    }

    while (v5);
  }

  return result;
}

unint64_t *sub_18872544C(unint64_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_188724168(*result);
    sub_188724168(v1[2]);
    sub_188724168(v1[4]);
    sub_188724168(v1[6]);
    sub_188724168(v1[8]);
    sub_188724168(v1[10]);
    sub_188724168(v1[12]);
    sub_188724168(v1[14]);
    sub_188724168(v1[16]);
    sub_188724168(v1[18]);
    sub_188724168(v1[20]);
    sub_188724168(v1[22]);
    sub_188724168(v1[24]);
    sub_188724168(v1[26]);
    sub_188724168(v1[28]);
    sub_188724168(v1[30]);
    return (unint64_t *)sub_188724168((unint64_t)v1);
  }

  return result;
}

uint64_t sub_1887254F4(uint64_t result, unsigned int a2, int a3, char a4)
{
  uint64_t v4 = result;
  if (a3)
  {
    char v5 = &v16 ^ a2;
    unsigned __int8 v6 = v5 ^ a4;
    unsigned __int8 v7 = v5 + a4;
    if ((a4 & 1) != 0) {
      unsigned __int8 v7 = v6;
    }
    int v8 = *(unsigned __int8 *)(result + a2);
    unsigned __int8 v9 = v7 ^ a4;
    if (*(_BYTE *)(result + a2))
    {
      unsigned __int8 v9 = 0;
      unsigned __int8 v10 = 0;
    }

    else
    {
      unsigned __int8 v10 = v7;
    }

    BOOL v11 = v8 == 1;
    if (v8 == 1) {
      unsigned __int8 v12 = a4 - v7;
    }
    else {
      unsigned __int8 v12 = v9;
    }
    if (v11) {
      unsigned __int8 v13 = v7;
    }
    else {
      unsigned __int8 v13 = v10;
    }
    int v14 = 2 * a2;
    uint64_t v15 = (a3 - 1);
    sub_1887254F4(result, (2 * a2) | 1, v15, v12);
    return sub_1887254F4(v4, (v14 + 2), v15, v13);
  }

  else
  {
    *(_BYTE *)(result + a2) = a4;
  }

  return result;
}

uint64_t sub_1887255A0(uint64_t a1, unsigned int a2, int a3)
{
  if (a3)
  {
    int v5 = 2 * a2;
    uint64_t v6 = (a3 - 1);
    char v7 = sub_1887255A0(a1, (2 * a2) | 1, v6);
    char v8 = sub_1887255A0(a1, (v5 + 2), v6);
    unsigned __int8 v9 = v8 ^ v7;
    if (*(_BYTE *)(a1 + a2)) {
      unsigned __int8 v9 = *(_BYTE *)(a1 + a2);
    }
    if (*(_BYTE *)(a1 + a2) == 1) {
      return (v8 + v7);
    }
    else {
      return v9;
    }
  }

  else
  {
    return *(unsigned __int8 *)(a1 + a2);
  }

unint64_t sub_18872562C(uint64_t a1, unsigned int a2, int a3)
{
  if ((unint64_t)(a1 - 16777217) >= 0xFFFFFFFFFF000000LL)
  {
    uint64_t v7 = (a1 >> 4) + 1;
    while (1)
    {
      char v8 = sub_188722664(16 * v7 + 31);
      if (!v8) {
        break;
      }
      unint64_t v9 = (unint64_t)v8;
      unsigned __int8 v10 = (char *)v8 + ((qword_18C724720 - (void)v8) & 0xF);
      unint64_t v11 = (unint64_t)(v10 + 16);
      unint64_t v3 = ((unint64_t)&v10[-qword_18C724720 + 16] & 0xFFFFFFFFFFFFFFF0LL) + qword_18C724728;
      if (v3) {
        BOOL v12 = v3 + a1 >= v3;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12)
      {
        unint64_t v13 = qword_18C724738;
        unint64_t v14 = qword_18C724730;
        if (qword_18C724738 == qword_18C724730)
        {
          unint64_t v14 = v11 + 16 * v7 + 16;
          unint64_t v13 = (unint64_t)(v10 + 16);
        }

        if (v11 <= v13) {
          unint64_t v13 = (unint64_t)(v10 + 16);
        }
        qword_18C724738 = v13;
        if (v11 + 16 * v7 + 16 >= v14) {
          uint64_t v15 = v11 + 16 * v7 + 16;
        }
        else {
          uint64_t v15 = v14;
        }
        qword_18C724730 = v15;
        if (!((v15 - v13) >> 60))
        {
          unsigned int v32 = v7;
          v33[0] = (qword_18C724720 - (_BYTE)v8) & 0xF;
          unsigned __int8 v16 = qword_18C724720 + a3 + qword_18C724728;
          unsigned int v17 = a2 / 0x21;
          unsigned int v18 = a2 / 0x21 + 1;
          for (unsigned int i = a3 & 0xFFFE | 1; ; i /= v21)
          {
            unsigned int v20 = i <= v17 ? i : v18;
            unsigned int v21 = i <= v17 ? v18 : i;
            do
            {
              unsigned int v22 = v21;
              unsigned int v21 = v20;
              unsigned int v20 = v22 % v20;
            }

            while (v20);
            if (v21 == 1) {
              break;
            }
          }

          for (unsigned int j = a3 | 1; ; j /= v25)
          {
            unsigned int v24 = j >= v7 ? v7 : j;
            unsigned int v25 = j <= v7 ? v7 : j;
            do
            {
              unsigned int v26 = v25;
              unsigned int v25 = v24;
              unsigned int v24 = v26 % v24;
            }

            while (v24);
            if (v25 == 1) {
              break;
            }
          }

          unsigned int v27 = (qword_18C724720 + a3 + qword_18C724728);
          v10[8] = v27 % v18;
          if (((*(uint64_t (**)(char *))(qword_18C724740 + 32LL * (v16 % v18)))(v10) & 0x80000000) == 0)
          {
            if (!v32)
            {
LABEL_44:
              (*(void (**)(char *, unsigned int *, uint64_t, uint64_t))(qword_18C724740
                                                                               + 32LL * v10[8]
                                                                               + 16))( v10,  &v32,  4LL,  16LL);
              (*(void (**)(char *, char *, uint64_t, uint64_t))(qword_18C724740
                                                                       + 32LL * v10[8]
                                                                       + 16))( v10,  v33,  1LL,  20LL);
              return v3;
            }

            int v28 = 0;
            unsigned int v29 = j % v32;
            while (1)
            {
              unsigned int v27 = (v27 + i) % v18;
              *(_BYTE *)(v11 + 16LL * v29 + 8) = v27;
              unsigned int v29 = (v29 + j) % v32;
              if (++v28 >= v32) {
                goto LABEL_44;
              }
            }

            if (v28)
            {
              int v30 = -v28;
              do
              {
                unsigned int v29 = (v29 - j) % v32;
                (*(void (**)(void))(qword_18C724740 + 32LL * *(unsigned __int8 *)(v11 + 16LL * v29 + 8) + 24))(*(void *)(v11 + 16LL * v29));
                BOOL v12 = __CFADD__(v30++, 1);
              }

              while (!v12);
            }
          }
        }

        if (v10) {
          sub_188724168(v9);
        }
        return 0LL;
      }
    }
  }

  return 0LL;
}

unint64_t sub_188725908(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = ((result - qword_18C724728) & 0xFFFFFFFFFFFFFFF0LL) + qword_18C724720;
    unint64_t v2 = v1 - 16;
    (*(void (**)(void, int *, uint64_t, uint64_t))(qword_18C724740 + 32LL * *(unsigned __int8 *)(v1 - 8) + 8))( *(void *)(v1 - 16),  &v5,  4LL,  16LL);
    (*(void (**)(void, _BYTE *, uint64_t, uint64_t))(qword_18C724740 + 32LL * *(unsigned __int8 *)(v1 - 8) + 8))( *(void *)(v1 - 16),  v6,  1LL,  20LL);
    if ((v5 & 0x80000000) == 0)
    {
      unint64_t v3 = (unsigned __int8 *)(v1 - 8);
      uint64_t v4 = -1LL;
      do
      {
        (*(void (**)(void))(qword_18C724740 + 32LL * *v3 + 24))(*((void *)v3 - 1));
        ++v4;
        v3 += 16;
      }

      while (v4 < v5);
    }

    return sub_188724168(v2 - v6[0]);
  }

  return result;
}

char *sub_1887259EC(char *result, char *a2, unint64_t a3)
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
        uint64_t result = (char *)((uint64_t (*)(void))((char *)&loc_188725B0C + 4 * byte_18873CAC3[(v13 >> 3) & 7]))();
        break;
    }
  }

  return result;
}

_BYTE *sub_188725BAC(_BYTE *result, char a2, unint64_t a3)
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
      *uint64_t result = a2;
      break;
    default:
      uint64_t result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_188725C3C + 4 * byte_18873CADA[(v5 >> 3) & 7]))();
      break;
  }

  return result;
}

uint64_t sub_188725CA0(char a1, unsigned int a2)
{
  return byte_188747F60[(byte_188747E60[a2] ^ a1)] ^ a2;
}

uint64_t sub_188725CCC(unsigned int a1)
{
  return byte_188747F60[byte_188747E60[a1] ^ 0xAF] ^ a1;
}

uint64_t sub_188725CF8(char a1, unsigned int a2)
{
  return byte_188748160[(byte_188748060[a2] ^ a1)] ^ a2;
}

uint64_t sub_188725D24(unsigned int a1)
{
  return byte_188748160[byte_188748060[a1] ^ 0x16] ^ a1;
}

uint64_t sub_188725D50(char a1, unsigned int a2)
{
  return byte_188748360[(byte_188748260[a2] ^ a1)] ^ a2;
}

uint64_t sub_188725D7C(unsigned int a1)
{
  return byte_188748360[byte_188748260[a1] ^ 0x7D] ^ a1;
}

uint64_t sub_188725DA8(char a1, unsigned int a2)
{
  return byte_188748560[(byte_188748460[a2] ^ a1)] ^ a2;
}

uint64_t sub_188725DD4(unsigned int a1)
{
  return byte_188748560[byte_188748460[a1] ^ 0xD9] ^ a1;
}

uint64_t sub_188725E00(char a1, unsigned int a2)
{
  return byte_188748760[(byte_188748660[a2] ^ a1)] ^ a2;
}

uint64_t sub_188725E2C(unsigned int a1)
{
  return byte_188748760[byte_188748660[a1] ^ 0x79] ^ a1;
}

uint64_t sub_188725E58(char a1, unsigned int a2)
{
  return byte_188748960[(byte_188748860[a2] ^ a1)] ^ a2;
}

uint64_t sub_188725E84(unsigned int a1)
{
  return byte_188748960[byte_188748860[a1] ^ 0xFB] ^ a1;
}

uint64_t sub_188725EB0(unsigned int a1)
{
  return byte_188748760[byte_188748660[a1] ^ 0xCD] ^ a1;
}

uint64_t sub_188725EDC(unsigned int a1)
{
  return byte_188748160[byte_188748060[a1] ^ 0xF9] ^ a1;
}

uint64_t sub_188725F08(unsigned int a1)
{
  return byte_188748160[~byte_188748060[a1]] ^ a1;
}

uint64_t sub_188725F34(unsigned int a1)
{
  return byte_188748760[byte_188748660[a1] ^ 0x35] ^ a1;
}

uint64_t sub_188725F60(unsigned int a1)
{
  return byte_188747F60[byte_188747E60[a1] ^ 0x2F] ^ a1;
}

uint64_t sub_188725F8C(unsigned int a1)
{
  return byte_188748960[byte_188748860[a1] ^ 0x86] ^ a1;
}

uint64_t sub_188725FB8(unsigned int a1)
{
  return byte_188748960[byte_188748860[a1] ^ 0xDB] ^ a1;
}

uint64_t sub_188725FE4(unsigned int a1)
{
  return byte_188747F60[byte_188747E60[a1] ^ 0x63] ^ a1;
}

uint64_t sub_188726010(unsigned int a1)
{
  return byte_188748560[byte_188748460[a1] ^ 0x1A] ^ a1;
}

uint64_t sub_18872603C(unsigned int a1)
{
  return byte_188748960[byte_188748860[a1] ^ 0x2A] ^ a1;
}

uint64_t sub_188726068(unsigned int a1)
{
  return byte_188748760[byte_188748660[a1] ^ 0x4D] ^ a1;
}

uint64_t sub_188726094()
{
  uint64_t v0 = ccrng();
  sub_188735A58(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  sub_188735A58(0LL, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t sub_188726100(uint64_t a1, unsigned int a2)
{
  unint64_t v4 = *(unsigned int (**)(uint64_t, void, uint64_t))sub_1887398B4();
  uint64_t v5 = sub_1887398B4();
  BOOL v6 = v4(v5, a2, a1) == 0;
  return sub_188735A58(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

uint64_t sub_188726154( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, void *a7, unint64_t *a8)
{
  uint64_t v39 = a1;
  uint64_t v40 = a3;
  uint64_t v43 = *MEMORY[0x1895F89C0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_encrypt_mode();
  MEMORY[0x1895F8858]();
  unsigned int v41 = (char *)&v34 - v14;
  bzero((char *)&v34 - v14, v14);
  MEMORY[0x1895F8858]();
  bzero((char *)&v34 - v15, v15);
  uint64_t v16 = 0xFFFFFFFFLL;
  unint64_t v37 = &v34;
  unint64_t v38 = a8;
  uint64_t v36 = a7;
  if (!a4)
  {
    BOOL v18 = (a2 & 0xFFFFFFFFFFFFFFF7LL) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }

    unint64_t v35 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }

  if (a8)
  {
    unint64_t v17 = *v38;
    unint64_t v35 = a6 + 8;
    if (v17 >= a6 + 8)
    {
LABEL_15:
      uint64_t v19 = 0LL;
      unsigned int v20 = a6 >> 3;
      else {
        uint64_t v21 = v20;
      }
      do
      {
        uint64_t v22 = *a5++;
        *((void *)&__s[v19++] + 1) = v22;
      }

      while (v21 != v19);
      uint64_t v23 = 0LL;
      *(void *)&__s[0] = v40;
      uint64_t v24 = 1LL;
      uint64_t v39 = v20;
      do
      {
        uint64_t v40 = v23;
        uint64_t v25 = 0LL;
        unsigned int v26 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1LL, &unk_18C7247E8, v26, v26, 16LL) & 1) == 0) {
              goto LABEL_6;
            }
          }

          else
          {
            cccbc_clear_iv();
            sub_188736438();
          }

          uint64_t v27 = *v26;
          v26 += 2;
          unint64_t v28 = v27 ^ bswap64(v24 + v25++);
          *(void *)&__s[v25 % v20] = v28;
        }

        while (v21 != v25);
        uint64_t v23 = v40 + 1;
        v24 += v39;
      }

      while (v40 != 5);
      unsigned int v29 = v36;
      *uint64_t v36 = *(void *)&__s[0];
      int v30 = v29 + 1;
      uint64_t v31 = (uint64_t *)__s + 1;
      do
      {
        uint64_t v32 = *v31;
        v31 += 2;
        *v30++ = v32;
        --v21;
      }

      while (v21);
      uint64_t v16 = 0LL;
      unint64_t *v38 = v35 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4) {
        return v16;
      }
LABEL_31:
      cc_clear();
      return v16;
    }
  }

LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t sub_188726460( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  unint64_t v11 = *a8;
  uint64_t v9 = sub_188726154(a1, a2, a3, a4, a5, a6, a7, &v11);
  sub_188735A58(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t sub_1887264C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unint64_t a6, void *a7, void *a8)
{
  uint64_t v43 = a5;
  uint64_t v41 = a1;
  uint64_t v46 = *MEMORY[0x1895F89C0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_decrypt_mode();
  MEMORY[0x1895F8858]();
  int v44 = (char *)&v35 - v14;
  bzero((char *)&v35 - v14, v14);
  MEMORY[0x1895F8858]();
  bzero((char *)&v35 - v15, v15);
  uint64_t v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6)) {
    goto LABEL_33;
  }
  uint64_t v37 = a3;
  unsigned int v17 = a6 >> 3;
  unint64_t v38 = &v35;
  uint64_t v39 = a8;
  uint64_t v36 = a7;
  unint64_t v42 = a6;
  if (!a4)
  {
    BOOL v18 = (a2 & 0xFFFFFFFFFFFFFFF7LL) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }

    cccbc_init();
    goto LABEL_15;
  }

  if (a8 && *v39 >= v42 - 8)
  {
LABEL_15:
    *(void *)&__s[0] = *v43;
    uint64_t v19 = v17 - 1;
    if (v17 != 1)
    {
      unsigned int v20 = (void *)__s + 1;
      uint64_t v21 = v43 + 1;
      uint64_t v22 = v17 - 1;
      do
      {
        uint64_t v23 = *v21++;
        *unsigned int v20 = v23;
        v20 += 2;
        --v22;
      }

      while (v22);
    }

    int v24 = 6 * v17 - 6;
    LODWORD(v41) = 1 - v17;
    int v25 = 5;
    uint64_t v40 = (unint64_t *)&__s[v17 - 2];
    do
    {
      LODWORD(v43) = v25;
      if (v42 >= 0x10)
      {
        unsigned int v26 = v40;
        int v27 = v19;
        unsigned int v28 = v24;
        do
        {
          unint64_t *v26 = *(void *)&__s[v27 % v19] ^ bswap64(v28);
          if (a4)
          {
            if ((a4(0LL, &unk_18C7247E8, v26, v26, 16LL) & 1) == 0) {
              goto LABEL_6;
            }
          }

          else
          {
            cccbc_clear_iv();
            sub_188736438();
          }

          --v28;
          v26 -= 2;
          BOOL v29 = __OFSUB__(v27--, 1);
        }

        while (!((v27 < 0) ^ v29 | (v27 == 0)));
      }

      int v25 = (_DWORD)v43 - 1;
      v24 += v41;
    }

    while ((_DWORD)v43);
    if (*(void *)&__s[0] == v37)
    {
      int v30 = v36;
      if ((_DWORD)v19)
      {
        uint64_t v31 = (uint64_t *)__s + 1;
        uint64_t v32 = v19;
        do
        {
          uint64_t v33 = *v31;
          v31 += 2;
          *v30++ = v33;
          --v32;
        }

        while (v32);
      }

      uint64_t v16 = 0LL;
      *uint64_t v39 = (8 * v19);
    }

    else
    {
      uint64_t v16 = 0xFFFFFFFFLL;
    }

LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4) {
      return v16;
    }
LABEL_34:
    cc_clear();
    return v16;
  }

uint64_t sub_188726824( uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  uint64_t v11 = *a8;
  uint64_t v9 = sub_1887264C8(a1, a2, a3, a4, a5, a6, a7, &v11);
  sub_188735A58(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t sub_18872688C(unsigned int a1, _DWORD *a2)
{
  uint64_t v2 = a1 + 15LL;
  uint64_t v3 = v2 << 31 >> 31;
  BOOL v4 = v3 != v2 || v3 < 0;
  int v5 = v4;
  if (!v4) {
    *a2 = v3 & 0xFFFFFFF8;
  }
  return v5 ^ 1u;
}

uint64_t sub_1887268B8(unint64_t a1, unint64_t *a2)
{
  uint64_t v2 = a1 >= 0xFFFFFFFFFFFFFFF1LL;
  BOOL v3 = v2 << 63 >> 63 != v2 || v2 << 63 >> 63 == -1;
  int v4 = v3;
  if (!v3) {
    *a2 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  }
  return v4 ^ 1u;
}

BOOL sub_1887268E8(unsigned int a1, unsigned int *a2)
{
  unsigned int v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL sub_1887268FC(unint64_t a1, unint64_t *a2)
{
  unint64_t v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

uint64_t sub_188726910()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  v22[0] = *MEMORY[0x1895F89C0];
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v18 = __s;
  *((void *)&v18 + 1) = v22;
  size_t v19 = 4096LL;
  uint64_t v12 = 3758097090LL;
  if (v6 && v4)
  {
    mach_port_t v13 = sub_188726B70();
    if (!v13)
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_new_vek",  ":",  179,  "",  0,  "",  "");
      uint64_t v12 = 3758097084LL;
      goto LABEL_16;
    }

    mach_port_t v14 = v13;
    if (!ccder_blob_encode_body_tl()
      || !sub_188738160(&v18, v8)
      || !sub_188738160(&v18, v10)
      || !sub_188738278(&v18, v11)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_14;
    }

    input[0] = *((void *)&v18 + 1);
    input[1] = (uint64_t)v22 - *((void *)&v18 + 1);
    uint64_t v15 = IOConnectCallMethod(v14, 0x4Au, input, 2u, 0LL, 0LL, 0LL, 0LL, __s, &v19);
    if ((_DWORD)v15)
    {
      uint64_t v12 = v15;
      goto LABEL_16;
    }

    *(void *)&__int128 v17 = __s;
    *((void *)&v17 + 1) = &__s[v19];
    if (!v2)
    {
      uint64_t v12 = 0LL;
      goto LABEL_16;
    }

    uint64_t v12 = 0LL;
    if ((sub_188737FC4(&v17, 0, v2) & 1) == 0) {
LABEL_14:
    }
      uint64_t v12 = 3758097098LL;
  }

LABEL_16:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v12;
}

uint64_t sub_188726B70()
{
  if (qword_18C7247A0 != -1) {
    dispatch_once(&qword_18C7247A0, &unk_18A274058);
  }
  dispatch_sync((dispatch_queue_t)qword_18C7247A8, &unk_18A273FD8);
  uint64_t result = dword_18C724790;
  if (!dword_18C724790)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_18C724790;
  }

  return result;
}

unint64_t sub_188726BF8(char *a1, const void *a2, size_t a3)
{
  unint64_t v3 = (unint64_t)a1;
  if (a1)
  {
    int v6 = open_dprotected_np(a1, 1793, 4, 0, 384LL);
    if (v6 == -1)
    {
      uint64_t v10 = __error();
      uint64_t v11 = strerror(*v10);
      syslog(3, "could not create file: %s (%s)\n", (const char *)v3, v11);
      return 0LL;
    }

    else
    {
      int v7 = v6;
      ssize_t v8 = write(v6, a2, a3);
      unint64_t v3 = v8 != -1;
      if (v8 == -1)
      {
        uint64_t v12 = __error();
        mach_port_t v13 = strerror(*v12);
        syslog(3, "failed to write restore bag to disk %s\n", v13);
      }

      close(v7);
    }
  }

  return v3;
}

const char *sub_188726CC8(char *a1, void *a2, size_t *a3)
{
  unint64_t v3 = a1;
  memset(&v14, 0, sizeof(v14));
  if (a1)
  {
    if (!stat(a1, &v14))
    {
      size_t st_size = v14.st_size;
      int v7 = open(v3, 0);
      if (v7 == -1)
      {
        uint64_t v12 = __error();
        mach_port_t v13 = strerror(*v12);
        syslog(3, "could not open file: %s (%s)\n", v3, v13);
      }

      else
      {
        int v8 = v7;
        uint64_t v9 = calloc(st_size, 1uLL);
        unint64_t v3 = (const char *)(v9 != 0LL);
        if (!v9)
        {
LABEL_7:
          close(v8);
          return v3;
        }

        uint64_t v10 = v9;
        if (read(v8, v9, st_size) == st_size)
        {
          *a2 = v10;
          *a3 = st_size;
          goto LABEL_7;
        }

        close(v8);
        free(v10);
      }
    }

    return 0LL;
  }

  return v3;
}

uint64_t sub_188726DD0(unsigned int a1, const void *a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v3 = sub_188726B70();
  if (v3) {
    return IOConnectCallMethod(v3, 0x6Cu, input, 1u, a2, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_delete_xart_leak",  ":",  268,  "",  0,  "",  "");
  return 3758097084LL;
}

char *sub_188726EB4(char *result, uint64_t a2, uint64_t a3)
{
  v9[2] = *(char **)MEMORY[0x1895F89C0];
  if (result)
  {
    v9[0] = result;
    v9[1] = 0LL;
    uint64_t result = (char *)fts_open(v9, 84, 0LL);
    if (result)
    {
      uint64_t v5 = (FTS *)result;
      int v6 = fts_read((FTS *)result);
      if (v6)
      {
        int v7 = v6;
        do
        {
          int fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
              }
            }

            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }

          int v7 = fts_read(v5);
        }

        while (v7);
      }

      return (char *)fts_close(v5);
    }
  }

  return result;
}

char *sub_188726FB0(char *result, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (result)
  {
    mach_port_t v3 = result;
    bzero(v8, 0x400uLL);
    uint64_t result = realpath_DARWIN_EXTSN(v3, v8);
    if (result)
    {
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 0x40000000LL;
      v6[2] = sub_18872708C;
      v6[3] = &unk_18A273F18;
      int v7 = a2;
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 0x40000000LL;
      v4[2] = sub_18872713C;
      v4[3] = &unk_18A273F38;
      int v5 = a2;
      return sub_188726EB4(v8, (uint64_t)v6, (uint64_t)v4);
    }
  }

  return result;
}

uint64_t sub_18872708C(uint64_t a1, uint64_t a2)
{
  int v4 = sub_1887270E4(*(const char **)(a2 + 48));
  int v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || v4 == v5) {
    printf(" dir: %s %i\n", *(const char **)(a2 + 48), v4);
  }
  return 1LL;
}

uint64_t sub_1887270E4(const char *a1)
{
  int v1 = open_dprotected_np(a1, 0, 0, 1);
  if (v1 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  uint64_t v3 = fcntl(v1, 63);
  if ((v2 & 0x80000000) == 0) {
    close(v2);
  }
  return v3;
}

uint64_t sub_18872713C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1887270E4(*(const char **)(a2 + 48));
  int v5 = *(_DWORD *)(a1 + 32);
  if (v5 == -1 || (_DWORD)result == v5) {
    return printf("file: %s %i\n", *(const char **)(a2 + 48), result);
  }
  return result;
}

uint64_t sub_188727190()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1896086B0], "IODeviceTree:/filesystems");
  if (v0)
  {
    io_object_t v1 = v0;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
    BOOL v3 = CFProperty != 0LL;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v1);
  }

  else
  {
    BOOL v3 = 0;
  }

  size_t __len = 1023LL;
  bzero(__big, 0x400uLL);
  if ((byte_18C724798 & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0LL, 0LL) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
      byte_18C724799 = 1;
    }
    byte_18C724798 = 1;
  }

  unsigned int v4 = byte_18C724799;
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n",  "aks",  "",  "",  "",  "aks_fs_supports_enhanced_apfs",  ":",  437,  "",  0,  "",  v3,  byte_18C724799,  "");
  return v3 | v4;
}

uint64_t sub_188727310(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  bzero(v4, 0x400uLL);
  bzero(__str, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v4))
  {
    snprintf(__str, 0x400uLL, "%s/mobile", v4);
    sub_1887273E0(v4, (uint64_t)&off_18A272AF8, 35LL);
    if ((sub_188727190() & 1) == 0) {
      sub_1887273E0(__str, (uint64_t)&off_18A273188, 72LL);
    }
  }

  return 0LL;
}

void sub_1887273E0(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  bzero(__str, 0x400uLL);
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    uint64_t v6 = a2 + 16;
    do
    {
      snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v6 - 16));
      if (stat(__str, &v7))
      {
        printf("stat failed: %s\n");
      }

      else
      {
        sub_1887270E4(__str);
        printf("%s: mode=%o, u/g=%i:%i class=%i%s\n");
      }

      v6 += 48LL;
      --a3;
    }

    while (a3);
  }

uint64_t sub_188727520(const char *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  bzero(v3, 0x400uLL);
  if (realpath_DARWIN_EXTSN(a1, v3)) {
    sub_1887273E0(v3, (uint64_t)&off_18A273188, 72LL);
  }
  return 0LL;
}

const char *sub_1887275A4()
{
  return sub_1887275F8("<user>", (uint64_t)&off_18A273188, 72LL);
}

const char *sub_1887275F8(const char *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v4 = result;
    uint64_t v5 = (const char **)(a2 + 16);
    uint64_t v6 = (const char **)(a2 + 16);
    do
    {
      char v7 = *(_BYTE *)v6;
      v6 += 6;
      if ((v7 & 1) != 0) {
        uint64_t result = (const char *)printf("%s%s\n", v4, *(v5 - 2));
      }
      uint64_t v5 = v6;
      --v3;
    }

    while (v3);
  }

  return result;
}

uint64_t sub_188727660()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  int v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  unsigned int v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v16 = __s;
  *((void *)&v16 + 1) = &v20;
  size_t v17 = 4096LL;
  uint64_t v10 = 3758097090LL;
  if (v4 && v2)
  {
    mach_port_t v11 = sub_188726B70();
    if (v11)
    {
      mach_port_t v12 = v11;
      if (!ccder_blob_encode_body_tl()
        || !sub_188738160(&v16, v6)
        || !sub_188738278(&v16, v9)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_10;
      }

      input[0] = v8;
      input[1] = *((void *)&v16 + 1);
      uint64_t input[2] = (uint64_t)&v20 - *((void *)&v16 + 1);
      uint64_t v13 = IOConnectCallMethod(v12, 0x4Cu, input, 3u, 0LL, 0LL, 0LL, 0LL, __s, &v17);
      if ((_DWORD)v13)
      {
        uint64_t v10 = v13;
        goto LABEL_12;
      }

      *(void *)&__int128 v15 = __s;
      *((void *)&v15 + 1) = &__s[v17];
      if (!ccder_blob_decode_range() || (uint64_t v10 = 0LL, (sub_1887381CC(&v15, 0, v2) & 1) == 0)) {
LABEL_10:
      }
        uint64_t v10 = 3758097098LL;
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_new_kek",  ":",  508,  "",  0,  "",  "");
      uint64_t v10 = 3758097084LL;
    }
  }

LABEL_12:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t sub_188727898()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v16 = __s;
  *((void *)&v16 + 1) = &v20;
  size_t v17 = 4096LL;
  uint64_t v10 = 3758097090LL;
  if (v6 && v4)
  {
    mach_port_t v11 = sub_188726B70();
    if (!v11)
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_new_sibling_vek",  ":",  543,  "",  0,  "",  "");
      uint64_t v10 = 3758097084LL;
      goto LABEL_15;
    }

    mach_port_t v12 = v11;
    if (!ccder_blob_encode_body_tl()
      || !sub_188738160(&v16, v8)
      || !sub_188738278(&v16, v9)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_13;
    }

    input[0] = *((void *)&v16 + 1);
    input[1] = (uint64_t)&v20 - *((void *)&v16 + 1);
    uint64_t v13 = IOConnectCallMethod(v12, 0x63u, input, 2u, 0LL, 0LL, 0LL, 0LL, __s, &v17);
    if ((_DWORD)v13)
    {
      uint64_t v10 = v13;
      goto LABEL_15;
    }

    *(void *)&__int128 v15 = __s;
    *((void *)&v15 + 1) = &__s[v17];
    if (!v2)
    {
      uint64_t v10 = 0LL;
      goto LABEL_15;
    }

    uint64_t v10 = 0LL;
    if ((sub_188737FC4(&v15, 0, v2) & 1) == 0) {
LABEL_13:
    }
      uint64_t v10 = 3758097098LL;
  }

LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v10;
}

uint64_t sub_188727AE4()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  v22[0] = *MEMORY[0x1895F89C0];
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v18 = __s;
  *((void *)&v18 + 1) = v22;
  size_t v19 = 4096LL;
  uint64_t v12 = 3758097090LL;
  if (v8 && v6 && v4 && v2)
  {
    mach_port_t v13 = sub_188726B70();
    if (v13)
    {
      mach_port_t v14 = v13;
      if (!sub_188738160(&v18, v4)
        || !ccder_blob_encode_body_tl()
        || !sub_188738160(&v18, v8)
        || !sub_188738160(&v18, v10)
        || !sub_188738278(&v18, v11)
        || !ccder_blob_encode_tl())
      {
        goto LABEL_14;
      }

      input[0] = *((void *)&v18 + 1);
      input[1] = (uint64_t)v22 - *((void *)&v18 + 1);
      uint64_t v15 = IOConnectCallMethod(v14, 0x4Du, input, 2u, 0LL, 0LL, 0LL, 0LL, __s, &v19);
      if ((_DWORD)v15)
      {
        uint64_t v12 = v15;
        goto LABEL_16;
      }

      *(void *)&__int128 v17 = __s;
      *((void *)&v17 + 1) = &__s[v19];
      if (!ccder_blob_decode_range() || (uint64_t v12 = 0LL, (sub_1887381CC(&v17, 0, v2) & 1) == 0)) {
LABEL_14:
      }
        uint64_t v12 = 3758097098LL;
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_rewrap_kek",  ":",  582,  "",  0,  "",  "");
      uint64_t v12 = 3758097084LL;
    }
  }

uint64_t sub_188727D40()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  __int128 v18 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unsigned int v11 = v10;
  uint64_t v12 = v0;
  v24[0] = *MEMORY[0x1895F89C0];
  uint64_t v13 = 3758097098LL;
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v20 = __s;
  *((void *)&v20 + 1) = v24;
  size_t v21 = 4096LL;
  mach_port_t v14 = sub_188726B70();
  if (!v14)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_set_protection",  ":",  616,  "",  0,  "",  "");
    uint64_t v13 = 3758097084LL;
    goto LABEL_14;
  }

  mach_port_t v15 = v14;
  if (sub_188738160(&v20, v3)
    && sub_188738160(&v20, v5)
    && sub_188738160(&v20, v7)
    && sub_188738278(&v20, v12)
    && ccder_blob_encode_tl())
  {
    input[0] = v11;
    input[1] = v9;
    uint64_t input[2] = *((void *)&v20 + 1);
    uint64_t input[3] = (uint64_t)v24 - *((void *)&v20 + 1);
    uint64_t v16 = IOConnectCallMethod(v15, 0x54u, input, 4u, 0LL, 0LL, 0LL, 0LL, __s, &v21);
    if ((_DWORD)v16)
    {
      uint64_t v13 = v16;
      goto LABEL_14;
    }

    *(void *)&__int128 v19 = __s;
    *((void *)&v19 + 1) = &__s[v21];
    if (!v21) {
      goto LABEL_13;
    }
    if (!v18)
    {
LABEL_13:
      uint64_t v13 = 0LL;
      goto LABEL_14;
    }

    uint64_t v13 = 0LL;
    if ((sub_1887381CC(&v19, 0, v18) & 1) == 0) {
      uint64_t v13 = 3758097098LL;
    }
  }

LABEL_14:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v13;
}

  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v9;
}

uint64_t sub_188727F88()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned int v12 = v11;
  uint64_t v13 = v0;
  v24[0] = *MEMORY[0x1895F89C0];
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v20 = __s;
  *((void *)&v20 + 1) = v24;
  size_t v21 = 4096LL;
  if (!v6)
  {
    uint64_t v17 = 3758097090LL;
    goto LABEL_15;
  }

  mach_port_t v14 = sub_188726B70();
  if (!v14)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_unwrap_vek_with_acm",  ":",  653,  "",  0,  "",  "");
    uint64_t v17 = 3758097084LL;
    goto LABEL_15;
  }

  mach_port_t v15 = v14;
  if (!sub_188738160(&v20, v4)
    || !sub_188738160(&v20, v6)
    || !sub_188738160(&v20, v8)
    || !sub_188738160(&v20, v10)
    || !sub_188738278(&v20, v13)
    || !ccder_blob_encode_tl())
  {
    goto LABEL_13;
  }

  input[0] = *((void *)&v20 + 1);
  input[1] = (uint64_t)v24 - *((void *)&v20 + 1);
  uint64_t input[2] = v12;
  uint64_t v16 = IOConnectCallMethod(v15, 0x4Bu, input, 3u, 0LL, 0LL, 0LL, 0LL, __s, &v21);
  if ((_DWORD)v16)
  {
    uint64_t v17 = v16;
    goto LABEL_15;
  }

  *(void *)&__int128 v19 = __s;
  *((void *)&v19 + 1) = &__s[v21];
  if (!v2)
  {
    uint64_t v17 = 0LL;
    goto LABEL_15;
  }

  uint64_t v17 = 0LL;
  if ((sub_188737FC4(&v19, 0, v2) & 1) == 0) {
LABEL_13:
  }
    uint64_t v17 = 3758097098LL;
LABEL_15:
  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v17;
}

uint64_t sub_1887281F0()
{
  return sub_188727F88();
}

void sub_1887281FC(const char *a1, char a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    bzero(&v13, 0x878uLL);
    bzero(v12, 0x400uLL);
    if (realpath_DARWIN_EXTSN(a1, v12))
    {
      uint64_t v4 = (char *)malloc(0x818uLL);
      memset_s(v4, 0x818uLL, 0, 0x818uLL);
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 0x40000000LL;
      v11[2] = sub_188728468;
      v11[3] = &unk_18A273F98;
      v11[4] = v4;
      sub_188726EB4(v12, (uint64_t)&unk_18A273F78, (uint64_t)v11);
      if (!statfs(v12, &v13))
      {
        if ((a2 & 1) != 0) {
          printf("Free Blocks:%lld blocks of size:%d\n");
        }
        else {
          printf("%lld,%d\n");
        }
      }

      uint64_t v5 = v4 + 340;
      for (uint64_t i = 1LL; i != 5; ++i)
      {
        if ((a2 & 1) != 0)
        {
          uint64_t v9 = &v4[296 * i];
          printf( "%s:\n \tNum files:\t%u,\n \tNum hardlinks:\t%u,\n \tNum compressed:\t%u,\n \tTotal Size:\t%lld,\n \tMin File Size:\t%lld,\n \tMax File Size:\t%lld,\n",  off_18C723CA8[i],  *(_DWORD *)v9,  *((_DWORD *)v9 + 2),  *((_DWORD *)v9 + 1),  *((void *)v9 + 2),  *((void *)v9 + 3),  *((void *)v9 + 4));
          printf("\tSize Distribution:");
          printf("%i", *((_DWORD *)v9 + 10));
          for (uint64_t j = 0LL; j != 252; j += 4LL)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[j]);
          }
        }

        else
        {
          uint64_t v7 = &v4[296 * i];
          printf( "%i,%u,%u,%u,%lld,%lld,%lld,",  i,  *(_DWORD *)v7,  *((_DWORD *)v7 + 2),  *((_DWORD *)v7 + 1),  *((void *)v7 + 2),  *((void *)v7 + 3),  *((void *)v7 + 4));
          printf("%i", *((_DWORD *)v7 + 10));
          for (uint64_t k = 0LL; k != 252; k += 4LL)
          {
            putchar(44);
            printf("%i", *(_DWORD *)&v5[k]);
          }
        }

        putchar(10);
        v5 += 296;
      }

      free(v4);
    }
  }

uint64_t sub_188728460()
{
  return 1LL;
}

uint64_t sub_188728468(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1887270E4(*(const char **)(a2 + 48));
  if ((result - 7) >= 0xFFFFFFFA)
  {
    uint64_t v5 = *(void *)(a2 + 96);
    int64_t v6 = *(void *)(v5 + 96);
    uint64_t v7 = *(void *)(a1 + 32);
    ++*(_DWORD *)(v7 + 296LL * result);
    if ((*(_BYTE *)(v5 + 116) & 0x20) != 0) {
      ++*(_DWORD *)(v7 + 296LL * result + 4);
    }
    uint64_t v8 = v7 + 296LL * result;
    int64_t v10 = *(void *)(v8 + 32);
    uint64_t v9 = (int64_t *)(v8 + 32);
    *(v9 - 2) += v6;
    if (v6 > v10) {
      *uint64_t v9 = v6;
    }
    uint64_t v11 = v7 + 296LL * result;
    int64_t v14 = *(void *)(v11 + 24);
    unsigned int v12 = (int64_t *)(v11 + 24);
    int64_t v13 = v14;
    if (v14) {
      BOOL v15 = v6 < v13;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      *unsigned int v12 = v6;
    }
    if (v6) {
      unint64_t v16 = v7 + 296LL * result + 4 * (63 - __clz(v6));
    }
    else {
      unint64_t v16 = v7 + 296LL * result;
    }
    ++*(_DWORD *)(v16 + 40);
  }

  return result;
}

uint64_t sub_188728570(unsigned int a1, uint64_t a2)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = 1LL;
  input[1] = a1;
  uint64_t input[2] = a2;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  mach_port_t v2 = sub_188726B70();
  if (v2) {
    return IOConnectCallMethod(v2, 0x56u, input, 3u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kext_set_options",  ":",  820,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188728658(unsigned int a1, uint64_t *a2)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v2 = 3758097084LL;
  if (!a2) {
    return 3758097090LL;
  }
  input[0] = 0LL;
  input[1] = a1;
  uint64_t input[2] = 0LL;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  mach_port_t v4 = sub_188726B70();
  if (v4)
  {
    uint64_t v2 = IOConnectCallMethod(v4, 0x56u, input, 3u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (!(_DWORD)v2) {
      *a2 = output;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kext_get_options",  ":",  841,  "",  0,  "",  "");
  }

  return v2;
}

uint64_t sub_18872876C()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x10u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_internal_state",  ":",  857,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188728810(unsigned int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x86u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_run_internal_test",  ":",  871,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_1887288F4()
{
  int v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  mach_port_t v4 = v3;
  int v6 = v5;
  uint64_t v8 = v7;
  int v10 = v9;
  uint64_t v12 = v11;
  unsigned int v14 = v13;
  int v15 = v0;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  mach_port_t v16 = sub_188726B70();
  if (v16)
  {
    input[0] = v15;
    input[1] = v14;
    uint64_t input[2] = v12;
    uint64_t input[3] = v10;
    if (!v14 || (uint64_t v17 = 3758097090LL, v4) && v2)
    {
      uint64_t v17 = IOConnectCallMethod(v16, 0x36u, input, 4u, v8, v6, 0LL, 0LL, __src, &__count);
      if (!(_DWORD)v17 && v14)
      {
        __int128 v18 = calloc(__count, 1uLL);
        *mach_port_t v4 = v18;
        if (v18)
        {
          memcpy(v18, __src, __count);
          uint64_t v17 = 0LL;
          *mach_port_t v2 = __count;
        }

        else
        {
          uint64_t v17 = 3758097085LL;
        }
      }
    }
  }

  else
  {
    uint64_t v17 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_escrow",  ":",  890,  "",  0,  "",  "");
  }

  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v17;
}

void sub_188728ACC()
{
  if (!dword_18C724790) {
    dword_18C724790 = sub_1887295A4("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

uint64_t sub_188728B08()
{
  if (qword_18C7247A0 != -1) {
    dispatch_once(&qword_18C7247A0, &unk_18A274058);
  }
  dispatch_sync((dispatch_queue_t)qword_18C7247A8, &unk_18A274018);
  uint64_t result = dword_18C724794;
  if (!dword_18C724794)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStoreTest");
    return dword_18C724794;
  }

  return result;
}

void sub_188728B90()
{
  if (!dword_18C724794) {
    dword_18C724794 = sub_1887295A4("IOService:/IOResources/AppleKeyStoreTest", "AppleKeyStoreTest");
  }
}

uint64_t sub_188728BCC( mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a4;
  input[1] = a3;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  bzero(outputStruct, 0x400uLL);
  size_t v19 = 1024LL;
  uint64_t v11 = IOConnectCallMethod(a1, 0xFu, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v19);
  if ((_DWORD)v11) {
    return v11;
  }
  uint64_t v17 = 3758097084LL;
  if (outputCnt == 1)
  {
    *a7 = output;
    else {
      return 0LL;
    }
  }

  return v17;
}

uint64_t sub_188728D00( mach_port_t a1, const void *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, _DWORD *a13)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a4;
  input[1] = a3;
  uint64_t output = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint32_t outputCnt = 3;
  bzero(outputStruct, 0x400uLL);
  size_t v26 = 1024LL;
  uint64_t v17 = IOConnectCallMethod(a1, 0x13u, input, 2u, a2, 0x10uLL, &output, &outputCnt, outputStruct, &v26);
  if ((_DWORD)v17) {
    return v17;
  }
  uint64_t v23 = 3758097084LL;
  if (outputCnt == 3)
  {
    int v24 = v30;
    *a7 = output;
    *a10 = v24;
    *a13 = v31;
    else {
      return 0LL;
    }
  }

  return v23;
}

uint64_t sub_188728E58( mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, size_t *a8)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 2, a4, a5, a6, (uint64_t)a7, (uint64_t)a8, a2);
  uint64_t v11 = IOConnectCallMethod( a1,  0x14u,  input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  a7,  a8);
  free(*(void **)&inputStructCnt[1]);
  return v11;
}

uint64_t sub_188728F14( mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, uint64_t a11, unsigned int a12, void *outputStruct, size_t *a14, _DWORD *a15)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  input[1] = a6;
  uint64_t input[2] = a9;
  uint64_t input[3] = a12;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 4, a4, a5, a6, a7, a8, a2);
  uint64_t v16 = IOConnectCallMethod( a1,  0x15u,  input,  4u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  &output,  &outputCnt,  outputStruct,  a14);
  if ((_DWORD)v16)
  {
    uint64_t v17 = v16;
  }

  else if (outputCnt == 1)
  {
    uint64_t v17 = 0LL;
    *a15 = output;
  }

  else
  {
    uint64_t v17 = 3758097084LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v17;
}

uint64_t sub_188729024( mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  input[1] = a6;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  size_t outputStructCnt = 1024LL;
  sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  uint64_t v15 = IOConnectCallMethod( a1,  0x10u,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  outputStruct,  &outputStructCnt);
  if ((_DWORD)v15)
  {
    uint64_t v21 = v15;
  }

  else if (sub_18873A32C(outputStruct, outputStructCnt, 2u, v16, v17, v18, v19, v20, a7))
  {
    uint64_t v21 = 3758097084LL;
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v21;
}

uint64_t sub_18872915C( mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  input[1] = a6;
  uint64_t input[2] = a9;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(outputStruct, 0x400uLL);
  size_t v25 = 1024LL;
  sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a2);
  uint64_t v17 = IOConnectCallMethod( a1,  0x17u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  outputStruct,  &v25);
  if ((_DWORD)v17)
  {
    uint64_t v23 = v17;
  }

  else if (sub_18873A32C(outputStruct, v25, 2u, v18, v19, v20, v21, v22, a10))
  {
    uint64_t v23 = 3758097084LL;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v23;
}

uint64_t sub_1887292A4(mach_port_t a1, void *inputStruct, unsigned int a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a3;
  return IOConnectCallMethod(a1, 0x11u, input, 1u, inputStruct, 0x10uLL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_188729314( mach_port_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 1, a4, a5, a6, a7, a8, a3);
  uint64_t v9 = IOConnectCallMethod( a1,  0x12u,  input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  0LL,  0LL);
  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t sub_1887293C0()
{
  int v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  mach_port_t v4 = v3;
  int v6 = v5;
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  mach_port_t v7 = sub_188726B70();
  if (v7)
  {
    if (v6) {
      size_t v8 = 18LL;
    }
    else {
      size_t v8 = 0LL;
    }
    uint64_t v9 = IOConnectCallMethod(v7, 0x5Du, input, 1u, v6, v8, 0LL, 0LL, __src, &__count);
    size_t v10 = __count;
    if ((_DWORD)v9)
    {
      uint64_t v12 = v9;
    }

    else if (__count - 32769 < 0xFFFFFFFFFFFF8000LL)
    {
      uint64_t v12 = 3758097090LL;
    }

    else
    {
      uint64_t v11 = calloc(__count, 1uLL);
      *mach_port_t v4 = v11;
      size_t v10 = __count;
      if (v11)
      {
        *mach_port_t v2 = __count;
        memcpy(v11, __src, v10);
        uint64_t v12 = 0LL;
        size_t v10 = __count;
      }

      else
      {
        uint64_t v12 = 3758097085LL;
      }
    }
  }

  else
  {
    uint64_t v12 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_internal_info_for_key",  ":",  1246,  "",  0,  "",  "");
    size_t v10 = 0x8000LL;
  }

  memset_s(__src, v10, 0, v10);
  return v12;
}

dispatch_queue_t sub_18872957C()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0LL);
  qword_18C7247A8 = (uint64_t)result;
  return result;
}

uint64_t sub_1887295A4(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;
  connect = 0;
  mach_port_t v3 = *MEMORY[0x1896086B0];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x1896086B0], path);
  int v5 = (task_port_t *)MEMORY[0x1895FBBE0];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1895FBBE0], 0, &connect), IOObjectRelease(v6), v7))
  {
    size_t v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      size_t v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }

  dispatch_queue_t result = connect;
  if (connect)
  {
    uint64_t v12 = IOConnectCallMethod(connect, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_188729698()
{
  return ccder_sizeof();
}

uint64_t sub_188729708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a2 + a3;
  if (!ccder_blob_encode_implicit_uint64()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_body_tl()
    || !ccder_blob_encode_implicit_uint64())
  {
    return 4294967273LL;
  }

  int v3 = ccder_blob_encode_tl();
  uint64_t result = 4294967273LL;
  if (v3)
  {
    if (a2 == v6) {
      return 0LL;
    }
    else {
      return 4294967273LL;
    }
  }

  return result;
}

uint64_t sub_1887297E8(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&__int128 v6 = a1;
  *((void *)&v6 + 1) = a1 + a2;
  if (!ccder_blob_decode_range()
    || !sub_1887395F8(&v6, 0x8000000000000000LL, a3)
    || !sub_188736E28(&v6, 0x8000000000000001LL, (uint64_t)(a3 + 1), 16)
    || !sub_188736E28(&v6, 0x8000000000000002LL, (uint64_t)(a3 + 3), 40)
    || !sub_188736E28(&v6, 0x8000000000000003LL, (uint64_t)(a3 + 8), 16))
  {
    return 4294967277LL;
  }

  int v4 = sub_1887395F8(&v6, 0x8000000000000004LL, a3 + 10);
  uint64_t result = 4294967277LL;
  if (v4)
  {
    if ((void)v6 == *((void *)&v6 + 1)) {
      return 0LL;
    }
    else {
      return 4294967277LL;
    }
  }

  return result;
}

uint64_t sub_1887298C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  memset(__s, 0, sizeof(__s));
  int v9 = 40;
  *(void *)a4 = 0LL;
  uuid_copy((unsigned __int8 *)(a4 + 8), (const unsigned __int8 *)(a1 + 32));
  *(void *)(a4 + 80) = 1LL;
  sub_188739910(a4 + 64, 0x10u);
  ccsha256_di();
  if (j__ccpbkdf2_hmac())
  {
    uint64_t v7 = 4294967286LL;
  }

  else
  {
    uint64_t v6 = sub_188726460((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6LL, 0LL, (uint64_t *)a1, 0x20u, (void *)(a4 + 24), &v9);
    if ((_DWORD)v6)
    {
      uint64_t v7 = v6;
    }

    else if (v9 == 40)
    {
      uint64_t v7 = 0LL;
    }

    else
    {
      uint64_t v7 = 4294967286LL;
    }
  }

  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_1887299F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  memset(__s, 0, sizeof(__s));
  int v9 = 32;
  if (*(void *)a1)
  {
    uint64_t v7 = 4294967284LL;
  }

  else
  {
    ccsha256_di();
    uint64_t v6 = sub_188726824((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6LL, 0LL, (void *)(a1 + 24), 0x28u, (void *)a4, &v9);
    if ((_DWORD)v6)
    {
      uint64_t v7 = v6;
      goto LABEL_8;
    }

    if (v9 != 32)
    {
LABEL_9:
      uint64_t v7 = 4294967286LL;
    }

    else
    {
      cccurve25519_make_pub();
      else {
        uint64_t v7 = 0LL;
      }
    }
  }

LABEL_8:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_188729B30()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  int v4 = v3;
  uint64_t v6 = v5;
  unsigned int v8 = v7;
  unsigned int v10 = v9;
  int v11 = v0;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 3758097098LL;
  bzero(v18, 0x1000uLL);
  *(void *)&__int128 v16 = v18;
  *((void *)&v16 + 1) = &v19;
  mach_port_t v13 = sub_188726B70();
  if (v13)
  {
    mach_port_t v14 = v13;
    if (sub_188738160(&v16, v2) && ccder_blob_encode_tl())
    {
      input[0] = v11;
      input[1] = v10;
      uint64_t input[2] = v6;
      uint64_t input[3] = v4;
      uint64_t input[4] = v8;
      uint64_t input[5] = *((void *)&v16 + 1);
      input[6] = (uint64_t)&v19 - *((void *)&v16 + 1);
      return IOConnectCallMethod(v14, 0x21u, input, 7u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_create_for_bag_and_kek",  ":",  50,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return v12;
}

uint64_t sub_188729CD8()
{
  return sub_188729B30();
}

uint64_t sub_188729D08(int a1)
{
  return sub_188729D14(a1, 0, 0LL);
}

uint64_t sub_188729D14(int a1, unsigned int a2, BOOL *a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(v6, 0x22u, input, 2u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = 0LL;
      if (a3) {
        *a3 = output != 0;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_aks_stash_load",  ":",  77,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_188729E34(int a1, _BYTE *a2)
{
  BOOL v4 = 0;
  if (!a2) {
    return sub_188729D14(a1, 1u, &v4);
  }
  *a2 = 0;
  uint64_t result = sub_188729D14(a1, 1u, &v4);
  if (!(_DWORD)result) {
    *a2 = v4;
  }
  return result;
}

uint64_t sub_188729E8C()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x25u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_destroy",  ":",  125,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188729F30(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x24u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_commit",  ":",  138,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872A014(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x33u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_enable",  ":",  154,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872A0F8(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x35u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_persist",  ":",  170,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872A1DC(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1634431856) {
    return 0xFFFFFFFFLL;
  }
  free(a1[1]);
  free(a1);
  return 0LL;
}

uint64_t sub_18872A234(int a1, uint64_t a2, unint64_t a3, int a4, void ***a5)
{
  mach_port_t v14 = 0LL;
  if (!a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  if (sub_18872A338(a4, &v14) || (unsigned int v9 = calloc(0x20uLL, 1uLL)) == 0LL)
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }

  else
  {
    unsigned int v10 = v9;
    int v11 = sub_18872A418(v14, a2, a3, (uint64_t)v9);
    uint64_t v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE && !v11 && !sub_18872A4B8(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      uint64_t v12 = 0LL;
      if (a5)
      {
        *a5 = v14;
        mach_port_t v14 = 0LL;
      }
    }

    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }

  if (v14) {
    sub_18872A1DC(v14);
  }
  return v12;
}

uint64_t sub_18872A338(int a1, void *a2)
{
  mach_port_t v6 = calloc(0x20uLL, 1uLL);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = v6;
  *((void *)v6 + 2) = 20LL;
  unsigned int v8 = calloc(0x14uLL, 1uLL);
  *((void *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }

  *unsigned int v7 = 1634431856;
  v7[6] = a1;
  uint64_t result = CCRandomCopyBytes();
  if ((_DWORD)result)
  {
    unsigned int v10 = (void *)*((void *)v7 + 1);
    if (v10) {
      free(v10);
    }
    goto LABEL_19;
  }

  if (a1 == 3) {
    int v9 = 2000;
  }
  else {
    int v9 = 10000000;
  }
  if (a1 == 2) {
    int v9 = 1000;
  }
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t sub_18872A418(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 != 1634431856 || !a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a4 && (a1[6] - 4) >= 0xFFFFFFFD)
  {
    ccsha256_di();
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18872A4B8(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  rsize_t __n = 0LL;
  __s = 0LL;
  uint64_t v10 = 3758097090LL;
  mach_port_t v14 = 0LL;
  if ((a2 || !a3) && a4 && a5)
  {
    mach_port_t v11 = sub_188726B70();
    if (v11)
    {
      mach_port_t v12 = v11;
      if (!sub_1887375D0(&v14, (uint64_t)off_18C724070, *(void *)(a5 + 8))
        && !sub_1887375D0(&v14, (uint64_t)off_18C724068, a4)
        && !sub_18873798C(&v14, (uint64_t)off_18C724078, *(unsigned int *)(a5 + 4))
        && !sub_18873798C(&v14, (uint64_t)off_18C724080, *(unsigned int *)(a5 + 24))
        && (a3 < 1 || !sub_1887375D0(&v14, (uint64_t)off_18C723D38, a2))
        && !sub_188737EB0(&v14)
        && !sub_188737290(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        uint64_t input[2] = __n;
        uint64_t v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_set_prederived_configuration",  ":",  218,  "",  0,  "",  "");
      uint64_t v10 = 3758097084LL;
    }
  }

  sub_188736BC0(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }

  return v10;
}

uint64_t sub_18872A6E0()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!v1) {
    return 0LL;
  }
  mach_port_t v2 = v1;
  int v3 = v0;
  uint64_t result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  *(_DWORD *)uint64_t result = 1634431856;
  mach_port_t v6 = sub_188726B70();
  if (!v6)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_get_prederived_configuration",  ":",  384,  "",  0,  "",  "");
LABEL_16:
    sub_18872A1DC((void **)v5);
    return 0LL;
  }

  mach_port_t v7 = v6;
  bzero(outputStruct, 0x8000uLL);
  v13[0] = 0x8000LL;
  uint64_t input = v3;
  if (IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, v13) || v13[0] > 0x8000) {
    goto LABEL_16;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  __int128 v15 = 0u;
  __int128 v17 = 0u;
  uint64_t v18 = 0LL;
  __int128 v14 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v13[1] = (size_t)off_18C724070;
  __int128 v16 = (unint64_t)off_18C724078;
  uint64_t v19 = off_18C724080;
  sub_1887366B4();
  uint64_t v9 = ccder_decode_tl();
  if (v9)
  {
    uint64_t v10 = (const void *)v9;
    mach_port_t v11 = calloc(*(void *)(v5 + 16), 1uLL);
    *(void *)(v5 + 8) = v11;
    if (!v11)
    {
      int v12 = 0;
      if (!Mutable) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    memcpy(v11, v10, *(void *)(v5 + 16));
    *(_DWORD *)(v5 + 4) = sub_1887368CC();
    *(_DWORD *)(v5 + 24) = sub_1887368CC();
  }

  int v12 = 1;
  if (Mutable) {
LABEL_10:
  }
    CFRelease(Mutable);
LABEL_11:
  if (!v12 || !*(void *)(v5 + 16)) {
    goto LABEL_16;
  }
  *mach_port_t v2 = v5;
  return 1LL;
}

uint64_t sub_18872A9A0(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  memset(v9, 0, sizeof(v9));
  if (a3) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = v4 || a4 == 0LL;
  else {
    uint64_t v7 = sub_18872AA68(a1, (uint64_t)v9, 32);
  }
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_18872AA68(int a1, uint64_t a2, int a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    return IOConnectCallMethod(v6, 0xCu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unlock_bag",  ":",  807,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872AB64(int a1, uint64_t a2, int a3, uint64_t a4, int a5, void ***a6)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  memset(__s, 0, sizeof(__s));
  memset(v17, 0, sizeof(v17));
  __int128 v16 = 0LL;
  if (!a6) {
    goto LABEL_17;
  }
  uint64_t v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3) {
    goto LABEL_17;
  }
  int v11 = sub_18872A338(*((_DWORD *)v7 + 6), &v16);
  int v12 = v16;
  if (v11 || (v13 = sub_18872A418(v16, a4, a5, (uint64_t)v17), int v12 = v16, v13))
  {
LABEL_15:
    if (v12) {
      sub_18872A1DC(v12);
    }
LABEL_17:
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }

  if (sub_18872A4B8(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    int v12 = v16;
    goto LABEL_15;
  }

  sub_18872A1DC(v7);
  uint64_t v14 = 0LL;
  *a6 = v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t sub_18872ACC4(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return sub_18872ACDC(a1, a2, 0LL, 0, a3, -1, a4);
}

uint64_t sub_18872ACDC(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  input[6] = *MEMORY[0x1895F89C0];
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_188726B70();
  if (v15)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      uint64_t input[2] = a1;
      uint64_t input[3] = a2;
      uint64_t input[4] = a3;
      uint64_t input[5] = a4;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(v15, 2u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v14) {
        *a7 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_create_bag",  ":",  187,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_18872AE30(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return sub_18872ACDC(a1, a2, 0LL, 0, 2u, a3, a4);
}

uint64_t sub_18872AE48(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return sub_18872ACDC(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t sub_18872AE70(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return sub_18872ACDC(a1, a2, 0LL, 0, 0x8000002u, a3, a4);
}

uint64_t sub_18872AE8C(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return sub_18872ACDC(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t sub_18872AEB8()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x42u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_invalidate_sync_bags",  ":",  544,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_18872AF5C(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097084LL;
  mach_port_t v11 = sub_188726B70();
  if (v11)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      uint64_t input[2] = a4;
      return IOConnectCallMethod(v11, 0x43u, input, 3u, a1, a2, 0LL, 0LL, 0LL, 0LL);
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unlock_with_sync_bag",  ":",  557,  "",  0,  "",  "");
  }

  return v10;
}

uint64_t sub_18872B07C(const void *a1, int a2, _DWORD *a3)
{
  output[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 3758097084LL;
  mach_port_t v7 = sub_188726B70();
  if (v7)
  {
    uint64_t v6 = 3758097090LL;
    if (a1)
    {
      if (a3)
      {
        output[0] = 0LL;
        uint32_t outputCnt = 1;
        uint64_t v6 = IOConnectCallMethod(v7, 6u, 0LL, 0, a1, a2, output, &outputCnt, 0LL, 0LL);
        if (!(_DWORD)v6) {
          *a3 = output[0];
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_load_bag",  ":",  574,  "",  0,  "",  "");
  }

  return v6;
}

uint64_t sub_18872B194(const void *a1, int a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a1) {
      return IOConnectCallMethod(v5, 0x57u, 0LL, 0, a1, a2, 0LL, 0LL, 0LL, 0LL);
    }
    return 3758097090LL;
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_invalidate_bag",  ":",  596,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_18872B260(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unload_bag",  ":",  612,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872B344(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x37u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unload_session_bags",  ":",  629,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872B428()
{
  int v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        uint64_t input = v5;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          uint64_t v9 = calloc(__count, 1uLL);
          *uint64_t v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0LL;
            *mach_port_t v2 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_save_bag",  ":",  646,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_18872B5B0( int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  input[12] = *MEMORY[0x1895F89C0];
  mach_port_t v21 = sub_188726B70();
  if (v21)
  {
    input[0] = a1;
    input[1] = a11;
    uint64_t input[2] = a10;
    uint64_t input[3] = a2;
    uint64_t input[4] = a3;
    uint64_t input[5] = a4;
    input[6] = a5;
    uint64_t input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(v21, 0xFu, input, 0xCu, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (a13)
    {
      if (!(_DWORD)result) {
        *a13 = output;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_change_secret_opts",  ":",  678,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_18872B720( int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return sub_18872B5B0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t sub_18872B744(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return sub_18872B5B0(a1, a2, a3, a4, a5, 0LL, 0, 0LL, 0, 0xFFu, a6, 0, a7);
}

uint64_t sub_18872B780(int a1, _OWORD *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  size_t v7 = 16LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2)
    {
      __int128 outputStruct = 0uLL;
      uint64_t input = a1;
      uint64_t v4 = IOConnectCallMethod(v5, 0x17u, &input, 1u, 0LL, 0LL, 0LL, 0LL, &outputStruct, &v7);
      if (!(_DWORD)v4) {
        *a2 = outputStruct;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_bag_uuid",  ":",  729,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_18872B8A4(int a1, void *a2, size_t *a3)
{
  return sub_18872B8B8(a1, (uint64_t)&unk_1887498B0, a2, a3);
}

uint64_t sub_18872B8B8(int a1, uint64_t a2, void *a3, size_t *a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int16 v23 = 0;
  memset(__src, 0, sizeof(__src));
  size_t __count = 34LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v8 = sub_188726B70();
  if (v8)
  {
    uint64_t v14 = 3758097090LL;
    if (a3 && a4)
    {
      mach_port_t v15 = v8;
      uint64_t input = a1;
      sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v16 = IOConnectCallMethod( v15,  0x44u,  &input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
        if ((_DWORD)v16)
        {
          uint64_t v14 = v16;
        }

        else
        {
          __int128 v17 = calloc(__count, 1uLL);
          *a3 = v17;
          uint64_t v14 = 3758097085LL;
          if (v17)
          {
            memcpy(v17, __src, __count);
            uint64_t v14 = 0LL;
            *a4 = __count;
          }
        }
      }

      else
      {
        uint64_t v14 = 3758097085LL;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_copy_volume_cookie_persona",  ":",  760,  "",  0,  "",  "");
    uint64_t v14 = 3758097084LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t sub_18872BA64(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0xDu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lock_bag",  ":",  790,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872BB48(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 7u, input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_lock_state",  ":",  824,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_18872BC60(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_188726B70();
  if (v15)
  {
    uint64_t v14 = 3758097090LL;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      size_t v18 = *a6;
      uint64_t v16 = IOConnectCallMethod(v15, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if ((_DWORD)v16)
      {
        return v16;
      }

      else
      {
        *a6 = v18;
        uint64_t v14 = 0LL;
        if (a7) {
          *a7 = output;
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_wrap_key",  ":",  848,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_18872BDC8(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v12 = 3758097084LL;
  mach_port_t v13 = sub_188726B70();
  if (v13)
  {
    uint64_t v12 = 3758097090LL;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          size_t v15 = *a6;
          uint64_t v12 = IOConnectCallMethod(v13, 0xBu, input, 2u, a1, a2, 0LL, 0LL, a5, &v15);
          if (!(_DWORD)v12) {
            *a6 = v15;
          }
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unwrap_key",  ":",  877,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_18872BF0C(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_188726B70();
  if (v15)
  {
    uint64_t v14 = 3758097090LL;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      uint64_t input[2] = a5;
      uint64_t input[3] = a6;
      size_t v17 = 108LL;
      return IOConnectCallMethod(v15, 0x18u, input, 4u, a1, a2, 0LL, 0LL, a7, &v17);
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_rewrap_key_for_backup",  ":",  901,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_18872C04C(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 0xEu, input, a1 != 0, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_system",  ":",  922,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_18872C168(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  mach_port_t v8 = sub_188726B70();
  if (v8)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(v8, 5u, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_system_with_passcode",  ":",  950,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872C26C(int a1, int a2)
{
  return sub_18872C168(a1, a2, 0LL, 0);
}

uint64_t sub_18872C278(int a1, uint64_t a2, unsigned int a3)
{
  return sub_18872C298(a1, a2, a3);
}

uint64_t sub_18872C28C(int a1, uint64_t a2, unsigned int a3)
{
  return sub_18872C298(a1, a2, a3);
}

uint64_t sub_18872C298(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v7 = sub_188726B70();
  if (v7)
  {
    mach_port_t v13 = v7;
    input[0] = a1;
    input[1] = a3;
    sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v6 = IOConnectCallMethod( v13,  0x41u,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  0LL,  0LL);
      uint64_t v14 = *(void **)&inputStructCnt[1];
    }

    else
    {
      uint64_t v14 = 0LL;
      uint64_t v6 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_keybag_for_volume_with_cookie_persona",  ":",  987,  "",  0,  "",  "");
    uint64_t v14 = 0LL;
  }

  free(v14);
  return v6;
}

uint64_t sub_18872C400()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097085LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  mach_port_t v11 = sub_188726B70();
  if (v11)
  {
    mach_port_t v17 = v11;
    input[0] = v8;
    input[1] = v6;
    sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, v9);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod( v17,  0x6Eu,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
      if ((_DWORD)v18)
      {
        uint64_t v10 = v18;
      }

      else
      {
        uint64_t v19 = calloc(__count, 1uLL);
        *uint64_t v4 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          uint64_t v10 = 0LL;
          *mach_port_t v2 = __count;
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_enable_volume",  ":",  1014,  "",  0,  "",  "");
    uint64_t v10 = 3758097084LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_18872C5B0(uint64_t a1)
{
  uint64_t v2 = 3758097084LL;
  uint64_t v13 = 0LL;
  int v12 = 0;
  mach_port_t v3 = sub_188726B70();
  if (v3)
  {
    mach_port_t v9 = v3;
    sub_18873A250(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      uint64_t v2 = IOConnectCallMethod(v9, 0x6Fu, 0LL, 0, v13, v12, 0LL, 0LL, 0LL, 0LL);
      uint64_t v10 = v13;
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v2 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_disable_volume",  ":",  1044,  "",  0,  "",  "");
    uint64_t v10 = 0LL;
  }

  free(v10);
  return v2;
}

uint64_t sub_18872C6B4(uint64_t a1, void *a2)
{
  uint64_t v4 = 3758097084LL;
  uint64_t v16 = 0LL;
  int v15 = 0;
  size_t v14 = 16LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    mach_port_t v11 = v5;
    sub_18873A250(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x70u, 0LL, 0, v16, v15, 0LL, 0LL, a2, &v14);
      int v12 = v16;
    }

    else
    {
      int v12 = 0LL;
      uint64_t v4 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_copy_current_bag_uuid",  ":",  1066,  "",  0,  "",  "");
    int v12 = 0LL;
  }

  free(v12);
  return v4;
}

uint64_t sub_18872C7C8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v13 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v14 = sub_188726B70();
  if (v14)
  {
    mach_port_t v20 = v14;
    mach_port_t v21 = 0LL;
    uint64_t v13 = 3758097090LL;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      uint64_t input[2] = a6;
      sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      size_t v23 = 108LL;
      uint64_t v13 = IOConnectCallMethod( v20,  0x71u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  a7,  &v23);
      mach_port_t v21 = *(void **)&inputStructCnt[1];
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_rewrap_key",  ":",  1087,  "",  0,  "",  "");
    mach_port_t v21 = 0LL;
  }

  free(v21);
  return v13;
}

uint64_t sub_18872C948( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v15 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v16 = sub_188726B70();
  if (v16)
  {
    mach_port_t v22 = v16;
    size_t v23 = 0LL;
    uint64_t v15 = 3758097090LL;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      uint64_t input[2] = a8;
      sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      size_t v25 = 108LL;
      uint64_t v15 = IOConnectCallMethod( v22,  0x71u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  outputStruct,  &v25);
      size_t v23 = *(void **)&inputStructCnt[1];
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_rewrap_ek",  ":",  1113,  "",  0,  "",  "");
    size_t v23 = 0LL;
  }

  free(v23);
  return v15;
}

uint64_t sub_18872CADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 __s = 0u;
  __int128 v16 = 0u;
  uint64_t v14 = 0LL;
  memset(v13, 0, sizeof(v13));
  uint64_t v8 = sub_1887297E8(a1, a2, v13);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = sub_1887299F8((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!(_DWORD)v9)
    {
      __int128 v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      __int128 v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }

  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return sub_1887359A8(v9);
}

uint64_t sub_18872CBC8(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = sub_1887297E8(a1, a2, v6);
  if (!(_DWORD)v4) {
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  }
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return sub_1887359A8(v4);
}

uint64_t sub_18872CC70(__int128 *a1, void *a2, unsigned int a3, void *a4, void *a5)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v6 = a1[1];
  __int128 v12 = *a1;
  __int128 v13 = v6;
  __int128 v7 = a1[3];
  __int128 v14 = a1[2];
  __int128 v15 = v7;
  unsigned int v10 = *a5;
  int __s = 1;
  uint64_t v8 = sub_188735FD4((uint64_t)&__s, 0LL, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return sub_1887359A8(v8);
}

uint64_t sub_18872CD2C(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097084LL;
  mach_port_t v11 = sub_188726B70();
  if (v11)
  {
    uint64_t v10 = 3758097090LL;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64LL;
      return IOConnectCallMethod(v11, 0x82u, input, 2u, a2, a3, 0LL, 0LL, a4, a5);
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_unwrap_key",  ":",  1193,  "",  0,  "",  "");
  }

  return v10;
}

uint64_t sub_18872CE44(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097084LL;
  mach_port_t v11 = sub_188726B70();
  if (v11)
  {
    uint64_t v10 = 3758097090LL;
    if (a2 && a4)
    {
      input[0] = a1;
      return IOConnectCallMethod(v11, 0x81u, input, 1u, a2, a3, 0LL, 0LL, a4, a5);
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_wrap_key",  ":",  1212,  "",  0,  "",  "");
  }

  return v10;
}

uint64_t sub_18872CF5C(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 0x83u, input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_get_handle",  ":",  1231,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_18872D074(int a1, unsigned __int8 *a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2)
    {
      uint64_t v10 = 0LL;
      input[0] = a1;
      size_t v8 = 16LL;
      *(void *)src = 0LL;
      uint64_t v6 = IOConnectCallMethod(v5, 0x84u, input, 1u, 0LL, 0LL, 0LL, 0LL, src, &v8);
      if ((_DWORD)v6)
      {
        return v6;
      }

      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0LL;
      }

      else
      {
        return 3758604298LL;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_get_uuid",  ":",  1253,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_18872D1B8(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  if (a5)
  {
    int v7 = a4;
    int v9 = a2;
    *a5 = -1;
    int v11 = sub_18872CADC((uint64_t)a1, a2, a3, a4, a6);
    __int128 v12 = (FILE **)MEMORY[0x1895F89E0];
    __int128 v13 = (FILE *)*MEMORY[0x1895F89E0];
    if (!v11)
    {
      fprintf( v13,  "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":",  1302,  "",  0,  "",  "");
      uint64_t v17 = 0LL;
      goto LABEL_9;
    }

    fprintf( v13,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":",  1290,  "",  0,  "",  v11,  "");
    uint64_t v14 = sub_18872B07C(a1, v9, a5);
    if ((_DWORD)v14)
    {
      uint64_t v17 = v14;
      fprintf( *v12,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":",  1292,  "",  0,  "",  v14,  "");
    }

    else
    {
      int v15 = sub_18872A6E0();
      int v16 = *a5;
      if (v15)
      {
        uint64_t v17 = sub_18872A9A0(v16, a3, v7, 0LL);
        if (!(_DWORD)v17) {
          goto LABEL_9;
        }
        fprintf( *v12,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":");
      }

      else
      {
        uint64_t v17 = sub_18872AA68(v16, a3, v7);
        if (!(_DWORD)v17) {
          goto LABEL_9;
        }
        fprintf( *v12,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":");
      }
    }
  }

  else
  {
    uint64_t v17 = 3758097090LL;
  }

  if (*a5 != -1)
  {
    sub_18872B260(*a5);
    *a5 = -1;
  }

LABEL_9:
  sub_18872A1DC(0LL);
  return v17;
}

  memset_s(__s, v6, 0, v6);
  return v3;
}

uint64_t sub_18872D3E4(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v8 = 3758097084LL;
  uint64_t v19 = 0LL;
  int v18 = 0;
  mach_port_t v9 = sub_188726B70();
  if (v9)
  {
    mach_port_t v15 = v9;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    sub_18873A250(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      uint64_t v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0LL, 0LL, 0LL, 0LL);
      int v16 = v19;
    }

    else
    {
      int v16 = 0LL;
      uint64_t v8 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_create",  ":",  1324,  "",  0,  "",  "");
    int v16 = 0LL;
  }

  free(v16);
  return v8;
}

uint64_t sub_18872D534(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v11 = sub_188726B70();
  if (v11)
  {
    mach_port_t v17 = v11;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a5;
    sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v10 = IOConnectCallMethod( v17,  0x75u,  input,  4u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  0LL,  0LL);
      int v18 = *(void **)&inputStructCnt[1];
    }

    else
    {
      int v18 = 0LL;
      uint64_t v10 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_create_with_flags",  ":",  1346,  "",  0,  "",  "");
    int v18 = 0LL;
  }

  free(v18);
  return v10;
}

uint64_t sub_18872D694()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  bzero(__src, 0x2000uLL);
  size_t __count = 0x2000LL;
  uint64_t input = v5;
  uint64_t v6 = 3758097090LL;
  if (v4 && v2)
  {
    mach_port_t v7 = sub_188726B70();
    if (v7)
    {
      uint64_t v8 = IOConnectCallMethod(v7, 0x61u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      if ((_DWORD)v8)
      {
        uint64_t v6 = v8;
      }

      else
      {
        if (__count)
        {
          mach_port_t v9 = calloc(__count, 1uLL);
          *uint64_t v4 = v9;
          if (!v9)
          {
            uint64_t v6 = 3758097085LL;
            goto LABEL_10;
          }

          memcpy(v9, __src, __count);
          size_t v10 = __count;
        }

        else
        {
          size_t v10 = 0LL;
          *uint64_t v4 = 0LL;
        }

        uint64_t v6 = 0LL;
        *uint64_t v2 = v10;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_list",  ":",  1372,  "",  0,  "",  "");
      uint64_t v6 = 3758097084LL;
    }
  }

LABEL_10:
  memset_s(__src, 0x2000uLL, 0, 0x2000uLL);
  return v6;
}

    uint64_t v13 = v12 | !v11;
  }

  return v13 & 1;
}

uint64_t sub_18872D83C(int a1, uint64_t a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  uint64_t v15 = 0LL;
  int v14 = 0;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    mach_port_t v11 = v5;
    input[0] = a1;
    sub_18873A250(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x62u, input, 1u, v15, v14, 0LL, 0LL, 0LL, 0LL);
      uint64_t v12 = v15;
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v4 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_delete",  ":",  1394,  "",  0,  "",  "");
    uint64_t v12 = 0LL;
  }

  free(v12);
  return v4;
}

uint64_t sub_18872D978(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t v12 = 3758097084LL;
  mach_port_t v13 = sub_188726B70();
  if (v13)
  {
    uint64_t v12 = 3758097090LL;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      uint64_t input[2] = a2;
      uint64_t input[3] = a3;
      return IOConnectCallMethod(v13, 0x26u, input, 4u, 0LL, 0LL, 0LL, 0LL, a5, a6);
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_auth_token_create",  ":",  1415,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_18872DAA8(int a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  rsize_t __n = 0LL;
  int __s = 0LL;
  uint64_t v7 = 3758097090LL;
  uint64_t v20 = 0LL;
  mach_port_t v8 = sub_188726B70();
  if (v8)
  {
    mach_port_t v9 = v8;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (!sub_18872DDE0(a4, @"GracePeriod", TypeID, (uint64_t)off_18C723E90, &v20))
    {
      CFTypeID v11 = CFNumberGetTypeID();
      if (!sub_18872DDE0(a4, @"BackOffDelay", v11, (uint64_t)off_18C723E98, &v20))
      {
        CFTypeID v12 = CFNumberGetTypeID();
        if (!sub_18872DDE0(a4, @"MaxUnlockAttempts", v12, (uint64_t)off_18C723EA0, &v20))
        {
          CFTypeID v13 = CFNumberGetTypeID();
          if (!sub_18872DDE0(a4, @"EscrowPasscodePeriod", v13, (uint64_t)off_18C723EA8, &v20))
          {
            CFTypeID v14 = CFNumberGetTypeID();
            if (!sub_18872DDE0(a4, @"EscrowTokenPeriod", v14, (uint64_t)off_18C723EB0, &v20))
            {
              CFTypeID v15 = CFDataGetTypeID();
              if (!sub_18872DDE0(a4, @"UserUUID", v15, (uint64_t)off_18C724098, &v20))
              {
                CFTypeID v16 = CFDataGetTypeID();
                if (!sub_18872DDE0(a4, @"BindKEKToKB", v16, (uint64_t)off_18C7240D8, &v20))
                {
                  CFTypeID v17 = CFBooleanGetTypeID();
                  if (!sub_18872DDE0( a4,  @"InactivityRebootEnabled",  v17,  (uint64_t)off_18C7242B0,  &v20))
                  {
                    CFTypeID v18 = CFBooleanGetTypeID();
                    if (!sub_18872DDE0( a4,  @"OnenessAutomaticMode",  v18,  (uint64_t)off_18C7242B8,  &v20)
                      && !sub_188737EB0(&v20)
                      && (!a2 || !sub_1887375D0(&v20, (uint64_t)off_18C723D38, a2))
                      && !sub_188737290(&v20, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      uint64_t input[2] = __n;
                      uint64_t v7 = IOConnectCallMethod(v9, 0x1Eu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_configuration",  ":",  1488,  "",  0,  "",  "");
    uint64_t v7 = 3758097084LL;
  }

  sub_188736BC0(&v20);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }

  return v7;
}

uint64_t sub_18872DDE0(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  value = 0LL;
  uint64_t result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if ((_DWORD)result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        uint64_t v10 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v10)
          || sub_18873798C(a5, a4, v10))
        {
          return 0xFFFFFFFFLL;
        }

        return 0LL;
      }

      if (CFBooleanGetTypeID() == a3)
      {
        CFBooleanGetValue((CFBooleanRef)value);
      }

      else
      {
        if (CFDataGetTypeID() != a3) {
          return 0xFFFFFFFFLL;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFDataGetLength((CFDataRef)value);
      }

      return 0LL;
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_18872DEE4()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  int v3 = v0;
  uint64_t v50 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (v2)
    {
      mach_port_t v6 = v5;
      bzero(outputStruct, 0x8000uLL);
      v46[0] = 0x8000LL;
      uint64_t input = v3;
      uint64_t v7 = IOConnectCallMethod(v6, 0x1Fu, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, v46);
      if ((_DWORD)v7)
      {
        return v7;
      }

      else if (v46[0] > 0x8000)
      {
        return 3758604298LL;
      }

      else
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        bzero(v47, 0x250uLL);
        v46[1] = (size_t)off_18C723E90;
        v47[4] = off_18C723E98;
        v47[9] = off_18C723EA0;
        v47[14] = off_18C723EA8;
        v47[19] = off_18C723EB0;
        v47[24] = off_18C723EB8;
        v47[29] = off_18C724098;
        v47[34] = off_18C7240D0;
        v47[39] = off_18C7240E0;
        v47[44] = off_18C7240E8;
        v47[49] = off_18C7240F0;
        v47[54] = off_18C724270;
        v47[59] = off_18C724278;
        v47[64] = off_18C7242A8;
        v47[69] = off_18C7242A0;
        sub_1887366B4();
        uint64_t v9 = v47[0];
        uint64_t v10 = v47[5];
        uint64_t v11 = v47[10];
        uint64_t v12 = v47[15];
        uint64_t v13 = v47[20];
        uint64_t v14 = v47[25];
        uint64_t v15 = v47[30];
        unsigned int v45 = v2;
        uint64_t v16 = v47[35];
        uint64_t v38 = v47[40];
        uint64_t v39 = v47[45];
        uint64_t v40 = v47[50];
        uint64_t v41 = v47[55];
        uint64_t v42 = v47[60];
        uint64_t v43 = v47[65];
        uint64_t v44 = v47[70];
        CFTypeID TypeID = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"GracePeriod", TypeID, v9);
        CFTypeID v18 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"BackOffDelay", v18, v10);
        CFTypeID v19 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"MaxUnlockAttempts", v19, v11);
        CFTypeID v20 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"EscrowPasscodePeriod", v20, v12);
        CFTypeID v21 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"EscrowTokenPeriod", v21, v13);
        CFTypeID v22 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"ConfigFlags", v22, v14);
        CFTypeID v23 = CFDataGetTypeID();
        sub_18872E45C(Mutable, @"UserUUID", v23, v15);
        CFTypeID v24 = CFDataGetTypeID();
        sub_18872E45C(Mutable, @"GroupUUID", v24, v16);
        CFTypeID v25 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"RecoveryIterations", v25, v38);
        CFTypeID v26 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"RecoveryFlags", v26, v39);
        CFTypeID v27 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"RecoveryTargetIterations", v27, v40);
        CFTypeID v28 = CFBooleanGetTypeID();
        sub_18872E45C(Mutable, @"MementoSupported", v28, v41);
        CFTypeID v29 = CFBooleanGetTypeID();
        sub_18872E45C(Mutable, @"MementoBlobExists", v29, v42);
        CFTypeID v30 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"MementoPasscodeGeneration", v30, v43);
        CFTypeID v31 = CFNumberGetTypeID();
        sub_18872E45C(Mutable, @"PasscodeGeneration", v31, v44);
        char v32 = sub_1887368CC();
        uint64_t v33 = (const void *)*MEMORY[0x189604DE0];
        uint64_t v34 = (const void *)*MEMORY[0x189604DE8];
        if ((v32 & 2) != 0) {
          uint64_t v35 = (const void *)*MEMORY[0x189604DE8];
        }
        else {
          uint64_t v35 = (const void *)*MEMORY[0x189604DE0];
        }
        CFDictionarySetValue(Mutable, @"InactivityRebootEnabled", v35);
        if ((v32 & 8) != 0) {
          uint64_t v36 = v34;
        }
        else {
          uint64_t v36 = v33;
        }
        CFDictionarySetValue(Mutable, @"OnenessAutomaticMode", v36);
        uint64_t v4 = 0LL;
        *unsigned int v45 = Mutable;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_configuration",  ":",  1556,  "",  0,  "",  "");
  }

  return v4;
}

void sub_18872E45C(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      CFIndex valuePtr = sub_1887368CC();
      CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
      if (!v7) {
        return;
      }
LABEL_12:
      CFNumberRef v11 = v7;
      CFDictionaryAddValue(a1, a2, v7);
      CFRelease(v11);
      return;
    }

    if (CFBooleanGetTypeID() == a3)
    {
      int v8 = sub_188736B68();
      uint64_t v9 = (const void **)MEMORY[0x189604DE8];
      if (!v8) {
        uint64_t v9 = (const void **)MEMORY[0x189604DE0];
      }
      CFDictionaryAddValue(a1, a2, *v9);
    }

    else if (CFDataGetTypeID() == a3)
    {
      CFIndex valuePtr = 0LL;
      uint64_t v10 = (const UInt8 *)ccder_decode_tl();
      if (v10)
      {
        CFNumberRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v10, valuePtr);
        goto LABEL_12;
      }
    }
  }

uint64_t sub_18872E590(int a1, unsigned int a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a1;
  mach_port_t v3 = sub_188726B70();
  if (v3) {
    return IOConnectCallMethod(v3, 0x1Au, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_hold",  ":",  1654,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_18872E670(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a1;
  mach_port_t v2 = sub_188726B70();
  if (v2) {
    return IOConnectCallMethod(v2, 0x1Bu, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_drop",  ":",  1672,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_18872E74C(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  mach_port_t v4 = sub_188726B70();
  if (v4)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(v4, 0x64u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_promote",  ":",  1687,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872E838(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x91u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_oneness_heartbeat",  ":",  1707,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_18872E910(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x65u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_consume",  ":",  1722,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_18872E9E8(int a1, uint64_t a2)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  int v14 = 0;
  mach_port_t v4 = sub_188726B70();
  if (v4)
  {
    mach_port_t v10 = v4;
    sub_18873A250((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    uint64_t input[2] = v14;
    uint64_t v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v12 = v15;
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_recover_with_escrow_bag",  ":",  1739,  "",  0,  "",  "");
    uint64_t v12 = 0LL;
    uint64_t v11 = 3758097084LL;
  }

  free(v12);
  return v11;
}

uint64_t sub_18872EB48()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  mach_port_t v4 = v3;
  int v6 = v5;
  uint64_t v7 = (const void *)v0;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 3758097090LL;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  mach_port_t v9 = sub_188726B70();
  if (v9)
  {
    if (v7 && v4 && v2)
    {
      uint64_t v10 = IOConnectCallMethod(v9, 0x29u, 0LL, 0, v7, v6, 0LL, 0LL, __src, &__count);
      if ((_DWORD)v10)
      {
        uint64_t v8 = v10;
      }

      else
      {
        uint64_t v11 = calloc(__count, 1uLL);
        *mach_port_t v4 = v11;
        if (v11)
        {
          memcpy(v11, __src, __count);
          uint64_t v8 = 0LL;
          *mach_port_t v2 = __count;
        }

        else
        {
          uint64_t v8 = 3758097085LL;
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fdr_hmac_data",  ":",  1758,  "",  0,  "",  "");
    uint64_t v8 = 3758097084LL;
  }

  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v8;
}

uint64_t sub_18872ECE4(int a1, unsigned int a2, _DWORD *a3)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(v6, 0x28u, input, 2u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (a3)
    {
      if (!(_DWORD)result) {
        *a3 = output;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_generation",  ":",  1781,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_18872EDF8(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  uint64_t v9 = 3758097084LL;
  CFTypeID v21 = 0LL;
  int v20 = 0;
  mach_port_t v10 = sub_188726B70();
  if (v10)
  {
    mach_port_t v16 = v10;
    if (a2) {
      CFTypeID v17 = a2;
    }
    else {
      CFTypeID v17 = "";
    }
    sub_18873A250((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      uint64_t input[2] = (uint64_t)v21;
      uint64_t input[3] = v20;
      uint64_t v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      CFTypeID v18 = v21;
    }

    else
    {
      CFTypeID v18 = 0LL;
      uint64_t v9 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_aks_verify_password",  ":",  1807,  "",  0,  "",  "");
    CFTypeID v18 = 0LL;
  }

  free(v18);
  return v9;
}

uint64_t sub_18872EF80(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_18872EDF8(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_18872EF88(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_18872EDF8(a1, a2, a3, a4, a5, 1u);
}

uint64_t sub_18872EF90()
{
  return 3758097084LL;
}

uint64_t sub_18872F038(int a1, int a2, void *a3, size_t *a4)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  size_t __count = 256LL;
  input[0] = a1;
  input[1] = a2;
  uint64_t result = 3758097090LL;
  if (a3 && a4)
  {
    mach_port_t v7 = sub_188726B70();
    if (v7)
    {
      memset(__src, 0, sizeof(__src));
      uint64_t result = IOConnectCallMethod(v7, 0x31u, input, 2u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      if (!(_DWORD)result)
      {
        if (__count > 0x100)
        {
          return 3758604298LL;
        }

        else
        {
          uint64_t v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            uint64_t result = 0LL;
            *a4 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_create_signing_key",  ":",  1859,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_18872F1C8()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v17 = *MEMORY[0x1895F89C0];
  size_t __count = 0x8000LL;
  input[0] = v0;
  input[1] = v5;
  uint64_t result = 3758097090LL;
  if (v3)
  {
    mach_port_t v7 = v4;
    if (v4)
    {
      uint64_t v8 = v3;
      size_t v9 = v2;
      mach_port_t v10 = v1;
      mach_port_t v11 = sub_188726B70();
      if (v11)
      {
        mach_port_t v12 = v11;
        bzero(__src, 0x8000uLL);
        uint64_t result = IOConnectCallMethod(v12, 0x31u, input, 2u, v10, v9, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count > 0x8000)
          {
            return 3758604298LL;
          }

          else
          {
            uint64_t v13 = calloc(__count, 1uLL);
            *uint64_t v8 = v13;
            if (v13)
            {
              memcpy(v13, __src, __count);
              uint64_t result = 0LL;
              *mach_port_t v7 = __count;
            }

            else
            {
              return 3758097085LL;
            }
          }
        }
      }

      else
      {
        fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_create_signing_key_with_params",  ":",  1881,  "",  0,  "",  "");
        return 3758097084LL;
      }
    }
  }

  return result;
}

uint64_t sub_18872F370()
{
  return sub_18872F388();
}

uint64_t sub_18872F388()
{
  int v0 = MEMORY[0x1895F8858]();
  size_t v2 = v1;
  mach_port_t v4 = v3;
  uint32_t v6 = v5;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  size_t __count = 15360LL;
  input[0] = v0;
  input[1] = v7;
  uint64_t input[2] = v8;
  mach_port_t v9 = sub_188726B70();
  if (v9)
  {
    mach_port_t v10 = v9;
    bzero(__src, 0x3C00uLL);
    uint64_t v11 = IOConnectCallMethod(v10, v6, input, 3u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }

    else if (__count > 0x3C00)
    {
      return 3758604298LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      if (v4 && v2)
      {
        if (__count)
        {
          uint64_t v13 = calloc(__count, 1uLL);
          *mach_port_t v4 = v13;
          if (!v13) {
            return 3758097085LL;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }

        else
        {
          size_t v14 = 0LL;
        }

        uint64_t v12 = 0LL;
        *size_t v2 = v14;
      }
    }
  }

  else
  {
    uint64_t v12 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "remote_session_operate",  ":",  2017,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_18872F540( int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, void *a8, size_t *a9)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  memset(__src, 0, sizeof(__src));
  size_t __count = 256LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  uint64_t v9 = 3758097090LL;
  uint64_t input[2] = a5;
  if (a8 && a9)
  {
    mach_port_t v12 = sub_188726B70();
    if (v12)
    {
      mach_port_t v18 = v12;
      sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v19 = IOConnectCallMethod( v18,  0x32u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
        if ((_DWORD)v19)
        {
          uint64_t v9 = v19;
        }

        else if (__count > 0x100)
        {
          uint64_t v9 = 3758604298LL;
        }

        else
        {
          int v20 = calloc(__count, 1uLL);
          *a8 = v20;
          uint64_t v9 = 3758097085LL;
          if (v20)
          {
            memcpy(v20, __src, __count);
            uint64_t v9 = 0LL;
            *a9 = __count;
          }
        }
      }

      else
      {
        uint64_t v9 = 3758097085LL;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_sign_signing_key",  ":",  1911,  "",  0,  "",  "");
      uint64_t v9 = 3758097084LL;
    }
  }

  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t sub_18872F740( int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  uint64_t v10 = 3758097084LL;
  input[0] = a2;
  input[1] = a1;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v11 = sub_188726B70();
  if (v11)
  {
    mach_port_t v17 = v11;
    sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod( v17,  0x2Cu,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  &output,  &outputCnt,  0LL,  0LL);
      uint64_t v10 = v18;
      if (a9 && !(_DWORD)v18) {
        *a9 = output;
      }
    }

    else
    {
      uint64_t v10 = 3758097085LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_remote_session",  ":",  1938,  "",  0,  "",  "");
  }

  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_18872F8B8(int a1, int a2, uint64_t a3, uint64_t a4)
{
  mach_port_t v17 = 0LL;
  int __s = 0LL;
  uint64_t v4 = 3758097084LL;
  rsize_t __n = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v5 = 3758097090LL;
  rsize_t __smax = 0LL;
  if (!a3 || !a4) {
    goto LABEL_12;
  }
  int v8 = -536870212;
  *(void *)&__int128 v19 = a3;
  *((void *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4)) {
    goto LABEL_19;
  }
  uint64_t v16 = 0LL;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    int v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    uint64_t v5 = 3758097084LL;
LABEL_12:
    uint64_t v12 = __s;
    uint64_t v4 = v5;
    goto LABEL_13;
  }

  sub_1887395F8(&v19, 0x8000000000000001LL, &v16);
  if (v16)
  {
    uint64_t v5 = sub_18872F388();
    if ((_DWORD)v5) {
      syslog(3, "error: validating v1 local signing key failed: %d");
    }
    goto LABEL_12;
  }

  uint64_t v11 = sub_18872F038(a1, 11, &__s, &__n);
  if ((_DWORD)v11)
  {
    uint64_t v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }

  uint64_t v12 = __s;
  if (__s && __n)
  {
    uint64_t v5 = sub_18872F540(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if ((_DWORD)v5) {
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    }
    goto LABEL_12;
  }

LABEL_13:
  if (v12)
  {
    memset_s(v12, __n, 0, __n);
    free(__s);
  }

  if (v17)
  {
    memset_s(v17, __smax, 0, __smax);
    free(v17);
  }

  return v4;
}

uint64_t sub_18872FA8C()
{
  return sub_18872F388();
}

uint64_t sub_18872FAA4()
{
  return sub_18872F388();
}

uint64_t sub_18872FABC()
{
  return sub_18872F388();
}

uint64_t sub_18872FAD8()
{
  return sub_18872F388();
}

uint64_t sub_18872FAF0()
{
  return sub_18872F388();
}

uint64_t sub_18872FB08()
{
  int v0 = MEMORY[0x1895F8858]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        input[0] = v5;
        input[1] = 0LL;
        uint64_t result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            uint64_t v9 = calloc(__count, 1uLL);
            *uint64_t v4 = v9;
            if (v9)
            {
              memcpy(v9, __src, __count);
              uint64_t result = 0LL;
              *size_t v2 = __count;
            }

            else
            {
              return 3758097085LL;
            }
          }

          else
          {
            return 3758097136LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drain_backup_keys",  ":",  2072,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_18872FCA0()
{
  int v0 = MEMORY[0x1895F8858]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        input[0] = v5;
        input[1] = 1LL;
        uint64_t result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298LL;
            }

            else
            {
              uint64_t v9 = calloc(__count, 1uLL);
              *uint64_t v4 = v9;
              if (v9)
              {
                memcpy(v9, __src, __count);
                uint64_t result = 0LL;
                *size_t v2 = __count / 0x7C;
              }

              else
              {
                return 3758097085LL;
              }
            }
          }

          else
          {
            return 3758097136LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drain_backup_keys_info",  ":",  2100,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_18872FE94(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    input[0] = a1;
    return IOConnectCallMethod(v2, 0x16u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_clear_backup_bag",  ":",  2129,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_18872FF78()
{
  int v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  uint64_t v8 = v7;
  int v10 = v9;
  int v11 = v0;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  mach_port_t v12 = sub_188726B70();
  if (!v12)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_backup_bag",  ":",  2146,  "",  0,  "",  "");
    return 3758097084LL;
  }

  mach_port_t v13 = v12;
  if (v4)
  {
    if (!v2) {
      return 3758097090LL;
    }
    __int128 outputStruct = __src;
    p_count = &__count;
    uint64_t v16 = 1LL;
  }

  else
  {
    p_count = 0LL;
    __int128 outputStruct = 0LL;
    uint64_t v16 = 0LL;
  }

  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  input[0] = v11;
  input[1] = v10;
  uint64_t input[2] = v16;
  uint64_t input[3] = v8;
  uint64_t input[4] = v6;
  uint64_t result = IOConnectCallMethod(v13, 0x15u, input, 5u, 0LL, 0LL, 0LL, 0LL, outputStruct, p_count);
  if (v4 && !(_DWORD)result)
  {
    uint64_t v18 = calloc(__count, 1uLL);
    *uint64_t v4 = v18;
    if (v18)
    {
      memcpy(v18, __src, __count);
      uint64_t result = 0LL;
      *mach_port_t v2 = __count;
    }

    else
    {
      return 3758097085LL;
    }
  }

  return result;
}

uint64_t sub_18873014C(int a1, _DWORD *a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      input[0] = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 0x52u, input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_make_public_backup_bag",  ":",  2178,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_188730264()
{
  return sub_18872F388();
}

uint64_t sub_18873027C()
{
  return sub_18872F388();
}

uint64_t sub_188730298()
{
  return sub_18872F388();
}

uint64_t sub_1887302B0()
{
  return sub_1887302BC();
}

uint64_t sub_1887302BC()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint32_t v4 = v3;
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = v0;
  *(void *)mach_port_t v12 = 4096LL;
  uint64_t v5 = 3758097084LL;
  int v18 = 0;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 __s = 0u;
  mach_port_t v6 = sub_188726B70();
  if (v6)
  {
    if (v2)
    {
      mach_port_t v7 = v6;
      bzero(outputStruct, 0x1000uLL);
      uint64_t v8 = IOConnectCallMethod(v7, v4, input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, (size_t *)v12);
      if ((_DWORD)v8)
      {
        return v8;
      }

      else
      {
        uint64_t v5 = 0LL;
        if (!sub_188738574((uint64_t)outputStruct, v12[0], (char *)&__s))
        {
          __int128 v9 = v16;
          *(_OWORD *)(v2 + 32) = v15;
          *(_OWORD *)(v2 + 48) = v9;
          *(_WORD *)(v2 + 64) = v17;
          __int128 v10 = v14;
          *(_OWORD *)uint64_t v2 = __s;
          *(_OWORD *)(v2 + 16) = v10;
        }
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_get_device_state",  ":",  2224,  "",  0,  "",  "");
  }

  return v5;
}

uint64_t sub_188730450()
{
  return sub_1887302BC();
}

uint64_t sub_18873045C()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  size_t v4 = v3;
  mach_port_t v6 = v5;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 3758097084LL;
  v12[0] = 4096LL;
  uint64_t input = v0;
  mach_port_t v8 = sub_188726B70();
  if (v8)
  {
    if (v2)
    {
      mach_port_t v9 = v8;
      bzero(outputStruct, 0x1000uLL);
      memset_s(v2, 0x10uLL, 0, 0x10uLL);
      uint64_t v10 = IOConnectCallMethod(v9, 0x39u, &input, 1u, v6, v4, 0LL, 0LL, outputStruct, v12);
      if ((_DWORD)v10)
      {
        return v10;
      }

      else
      {
        uint64_t v17 = 0LL;
        __int128 v21 = 0u;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v16 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v22 = 0u;
        uint64_t v23 = 0LL;
        v12[1] = (size_t)off_18C723FD8;
        __int128 v15 = (unint64_t)off_18C723FE0;
        int v18 = off_18C723FE8;
        *(void *)&__int128 v21 = off_18C723FF0;
        sub_1887366B4();
        *uint64_t v2 = sub_1887368CC();
        v2[1] = sub_1887368CC();
        v2[2] = sub_1887368CC();
        uint64_t v7 = 0LL;
        v2[3] = sub_1887368CC();
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_remote_peer_get_state",  ":",  2255,  "",  0,  "",  "");
  }

  return v7;
}

uint64_t sub_1887306C0(int a1, const void *a2, size_t a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v5 = sub_188726B70();
  if (v5) {
    return IOConnectCallMethod(v5, 0x3Au, input, 1u, a2, a3, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_remote_peer_drop",  ":",  2292,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1887307A8(int a1, int a2)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v3 = sub_188726B70();
  if (v3)
  {
    if (a2) {
      uint32_t v4 = 32;
    }
    else {
      uint32_t v4 = 8;
    }
    return IOConnectCallMethod(v3, v4, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lock_device",  ":",  2307,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_188730898(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x8Du, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lock_cx",  ":",  2327,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188730970(int a1, uint64_t a2, int a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_188726B70();
  if (v3) {
    return IOConnectCallMethod(v3, 9u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unlock_device",  ":",  2342,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188730A50()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x13u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_obliterate_class_d",  ":",  2355,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188730AF4(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  mach_port_t v12 = sub_188726B70();
  if (v12)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(v12, 0x3Fu, input, 4u, a5, a6, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_migrate_s_key",  ":",  2367,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_188730C08( int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, void *a7, size_t *a8)
{
  uint64_t input[4] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  input[1] = a4;
  uint64_t input[2] = a2;
  uint64_t input[3] = a3;
  size_t __count = 2048LL;
  mach_port_t v12 = sub_188726B70();
  if (v12)
  {
    mach_port_t v13 = v12;
    bzero(__src, 0x800uLL);
    uint64_t v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0LL, 0LL, __src, &__count);
    if ((_DWORD)v14)
    {
      return v14;
    }

    else if (__count > 0x800)
    {
      return 3758604298LL;
    }

    else
    {
      uint64_t v15 = 0LL;
      if (a7 && a8)
      {
        if (__count)
        {
          __int128 v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16) {
            return 3758097085LL;
          }
          memcpy(v16, __src, __count);
          size_t v17 = __count;
        }

        else
        {
          size_t v17 = 0LL;
        }

        uint64_t v15 = 0LL;
        *a8 = v17;
      }
    }
  }

  else
  {
    uint64_t v15 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_register",  ":",  2388,  "",  0,  "",  "");
  }

  return v15;
}

uint64_t sub_188730DB4(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x3Cu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_unregister",  ":",  2412,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188730E8C(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  size_t __count = 2048LL;
  mach_port_t v9 = sub_188726B70();
  if (v9)
  {
    mach_port_t v10 = v9;
    bzero(__src, 0x800uLL);
    uint64_t v11 = IOConnectCallMethod(v10, 0x3Du, input, 1u, a2, a3, 0LL, 0LL, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }

    else if (__count > 0x800)
    {
      return 3758604298LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      if (a4 && a5)
      {
        if (__count)
        {
          mach_port_t v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13) {
            return 3758097085LL;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }

        else
        {
          size_t v14 = 0LL;
        }

        uint64_t v12 = 0LL;
        *a5 = v14;
      }
    }
  }

  else
  {
    uint64_t v12 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_request_unlock",  ":",  2429,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_188731030(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  size_t __count = 2048LL;
  sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(void *)&inputStructCnt[1])
  {
    uint64_t v17 = 3758097085LL;
    goto LABEL_12;
  }

  mach_port_t v15 = sub_188726B70();
  if (!v15)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_unlock",  ":",  2460,  "",  0,  "",  "");
    uint64_t v17 = 3758097084LL;
    goto LABEL_12;
  }

  uint64_t v16 = IOConnectCallMethod( v15,  0x3Eu,  input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
  if ((_DWORD)v16)
  {
    uint64_t v17 = v16;
    goto LABEL_12;
  }

  if (__count > 0x800)
  {
    uint64_t v17 = 3758604298LL;
    goto LABEL_12;
  }

  uint64_t v17 = 0LL;
  if (a6 && a7)
  {
    if (!__count)
    {
      size_t v19 = 0LL;
      goto LABEL_11;
    }

    int v18 = calloc(__count, 1uLL);
    *a6 = v18;
    uint64_t v17 = 3758097085LL;
    if (v18)
    {
      memcpy(v18, __src, __count);
      size_t v19 = __count;
LABEL_11:
      uint64_t v17 = 0LL;
      *a7 = v19;
    }
  }

uint64_t sub_188731214(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18873125C(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a6 && a3 && a4 && a5 && a3 + a4 > a3)
  {
    sub_1887366B4();
    if (a2)
    {
      if (*a6 == 8LL)
      {
        uint64_t v10 = sub_1887368CC();
        uint64_t result = 0LL;
        *a5 = v10;
        return result;
      }

      return 0xFFFFFFFFLL;
    }

    uint64_t v11 = ccder_decode_tl();
    if (!v11) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v12 = v11;
    uint64_t result = 0LL;
    *a5 = v12;
    *a6 = 0LL;
  }

  return result;
}

uint64_t sub_188731384(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1887313CC(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8LL;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t result = sub_18873125C((uint64_t)off_18C724018, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t sub_188731438(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8LL;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t result = sub_18873125C((uint64_t)off_18C724010, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t sub_1887314A4(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x47u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_fail",  ":",  2589,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_18873157C(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x49u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_set_healthy",  ":",  2605,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188731654(int a1, uint64_t a2, uint64_t a3)
{
  return sub_18873165C(a1, a2, a3, 0x45u);
}

uint64_t sub_18873165C(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v5 = sub_188726B70();
  if (v5) {
    return IOConnectCallMethod(v5, a4, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "__aks_se_set_secret",  ":",  2621,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188731744(int a1, uint64_t a2, uint64_t a3)
{
  return sub_18873165C(a1, a2, a3, 0x8Cu);
}

uint64_t sub_18873174C(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_188726B70();
  if (v3) {
    return IOConnectCallMethod(v3, 0x46u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_recover",  ":",  2649,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188731828(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_188726B70();
  if (v3) {
    return IOConnectCallMethod(v3, 0x69u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_change_secret_epilogue",  ":",  2665,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188731904()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = v0;
  input[1] = v3;
  uint64_t input[2] = v4;
  bzero(__s, 0x1000uLL);
  __n[0] = 4096LL;
  mach_port_t v5 = sub_188726B70();
  if (!v5)
  {
    uint64_t v8 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_get_reset_token_for_memento_secret",  ":",  2683,  "",  0,  "",  "");
    goto LABEL_10;
  }

  uint64_t v6 = IOConnectCallMethod(v5, 0x48u, input, 3u, 0LL, 0LL, 0LL, 0LL, __s, __n);
  if ((_DWORD)v6)
  {
    uint64_t v8 = v6;
    goto LABEL_10;
  }

  if (__n[0] - 4097 < 0xFFFFFFFFFFFFF000LL)
  {
    uint64_t v8 = 3758604298LL;
    goto LABEL_10;
  }

  uint64_t v15 = 0LL;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __n[1] = (rsize_t)off_18C724088;
  __int128 v13 = (unint64_t)off_18C724090;
  sub_1887366B4();
  if ((void)v11)
  {
    ccder_decode_tl();
LABEL_9:
    uint64_t v8 = 0LL;
    goto LABEL_10;
  }

  if (!*((void *)&v13 + 1)) {
    goto LABEL_9;
  }
  unint64_t v7 = sub_1887368CC();
  if (v7 > 0xFF) {
    goto LABEL_9;
  }
  uint64_t v8 = 0LL;
  *uint64_t v2 = v7;
LABEL_10:
  memset_s(__s, __n[0], 0, __n[0]);
  return v8;
}

uint64_t sub_188731B70()
{
  return sub_188731904();
}

uint64_t sub_188731B84(int a1, const void *a2, size_t a3)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v5 = sub_188726B70();
  if (v5)
  {
    if (a2) {
      size_t v6 = a3;
    }
    else {
      size_t v6 = 0LL;
    }
    return IOConnectCallMethod(v5, 0x58u, input, 1u, a2, v6, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_set_nonce",  ":",  2737,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_188731C70()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  size_t v6 = v5;
  uint64_t v8 = v7;
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = v0;
  bzero(&__s, 0x1000uLL);
  size_t __n = 4096LL;
  uint64_t v9 = 3758097090LL;
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = 3758097090LL;
      if (v4)
      {
        if (v2)
        {
          mach_port_t v10 = sub_188726B70();
          if (v10)
          {
            uint64_t v11 = IOConnectCallMethod(v10, 0x5Au, input, 1u, 0LL, 0LL, 0LL, 0LL, &__s, &__n);
            if ((_DWORD)v11)
            {
              uint64_t v9 = v11;
            }

            else if (__n - 4097 < 0xFFFFFFFFFFFFF005LL)
            {
              uint64_t v9 = 3758604298LL;
            }

            else
            {
              __int128 v12 = calloc(5uLL, 1uLL);
              *uint64_t v4 = v12;
              if (v12)
              {
                *uint64_t v2 = 5LL;
                int v13 = __s;
                v12[4] = v19;
                *(_DWORD *)__int128 v12 = v13;
                __int128 v14 = calloc(__n - 5, 1uLL);
                *uint64_t v8 = v14;
                uint64_t v9 = 3758097085LL;
                if (v14)
                {
                  size_t v15 = __n;
                  *size_t v6 = __n - 5;
                  memcpy(v14, v20, v15);
                  uint64_t v9 = 0LL;
                }
              }

              else
              {
                uint64_t v9 = 3758097085LL;
              }
            }
          }

          else
          {
            fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_get_reset_sig",  ":",  2759,  "",  0,  "",  "");
            uint64_t v9 = 3758097084LL;
          }
        }
      }
    }
  }

  memset_s(&__s, __n, 0, __n);
  return v9;
}

uint64_t sub_188731E80()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = v0;
  size_t v5 = 4096LL;
  bzero(__src, 0x1000uLL);
  size_t __count = 4096LL;
  uint64_t v6 = 3758097090LL;
  if (v4 && v2)
  {
    mach_port_t v7 = sub_188726B70();
    if (v7)
    {
      uint64_t v8 = IOConnectCallMethod(v7, 0x59u, input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      size_t v5 = __count;
      if ((_DWORD)v8)
      {
        uint64_t v6 = v8;
      }

      else if (__count - 4097 < 0xFFFFFFFFFFFFF000LL)
      {
        uint64_t v6 = 3758604298LL;
      }

      else
      {
        uint64_t v9 = calloc(__count, 1uLL);
        *uint64_t v4 = v9;
        size_t v5 = __count;
        if (v9)
        {
          *uint64_t v2 = __count;
          memcpy(v9, __src, v5);
          uint64_t v6 = 0LL;
          size_t v5 = __count;
        }

        else
        {
          uint64_t v6 = 3758097085LL;
        }
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_get_reset_pubkey",  ":",  2791,  "",  0,  "",  "");
      size_t v5 = 4096LL;
      uint64_t v6 = 3758097084LL;
    }
  }

  memset_s(__src, v5, 0, v5);
  return v6;
}

uint64_t sub_188732040(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x5Bu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_delete_reset_token",  ":",  2815,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188732118(unsigned int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x5Eu, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_support_in_rm",  ":",  2832,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1887321F0(BOOL *a1)
{
  output[1] = *MEMORY[0x1895F89C0];
  output[0] = 0LL;
  uint32_t outputCnt = 1;
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    uint64_t result = IOConnectCallMethod(v2, 0x6Bu, 0LL, 0, 0LL, 0LL, output, &outputCnt, 0LL, 0LL);
    if (a1)
    {
      if (!(_DWORD)result) {
        *a1 = output[0] != 0;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_support_in_rm_is_set",  ":",  2848,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_1887322F0()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x5Fu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_stage_stash",  ":",  2865,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188732394()
{
  return sub_188727D40();
}

uint64_t sub_1887323B4()
{
  return sub_188727F88();
}

uint64_t sub_1887323D0()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v11 = __s;
  *((void *)&v11 + 1) = &v14;
  *(void *)__int128 v12 = 4096LL;
  uint64_t v6 = 3758097090LL;
  if (v4 && v2)
  {
    mach_port_t v7 = sub_188726B70();
    if (v7)
    {
      mach_port_t v8 = v7;
      if (sub_188738160(&v11, v4) && sub_188738278(&v11, v5))
      {
        uint64_t v6 = 3758097098LL;
        if (ccder_blob_encode_tl())
        {
          uint64_t v9 = IOConnectCallMethod( v8,  0x55u,  0LL,  0,  *((const void **)&v11 + 1),  (size_t)&v14 - *((void *)&v11 + 1),  0LL,  0LL,  __s,  (size_t *)v12);
          if (!(_DWORD)v9) {
            uint64_t v9 = sub_188738AB8((uint64_t)__s, *(uint64_t *)v12, v2);
          }
          uint64_t v6 = v9;
        }
      }

      else
      {
        uint64_t v6 = 3758097098LL;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_get_blob_state",  ":",  2900,  "",  0,  "",  "");
      uint64_t v6 = 3758097084LL;
    }
  }

  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v6;
}

uint64_t sub_1887325A4()
{
  return sub_1887323D0();
}

uint64_t sub_18873260C()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v3 = v0;
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097098LL;
  uint64_t output = 0LL;
  input[0] = v5;
  uint32_t outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v9 = __s;
  *((void *)&v9 + 1) = &output;
  if (v2)
  {
    mach_port_t v6 = sub_188726B70();
    if (v6)
    {
      mach_port_t v7 = v6;
      if (sub_188738278(&v9, v3))
      {
        if (ccder_blob_encode_tl())
        {
          uint64_t v4 = IOConnectCallMethod( v7,  0x4Eu,  input,  1u,  *((const void **)&v9 + 1),  (size_t)&input[-1] - *((void *)&v9 + 1),  &output,  &outputCnt,  0LL,  0LL);
          if (!(_DWORD)v4) {
            *mach_port_t v2 = output;
          }
        }
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_get_size",  ":",  2943,  "",  0,  "",  "");
      uint64_t v4 = 3758097084LL;
    }
  }

  else
  {
    uint64_t v4 = 3758097090LL;
  }

  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v4;
}

uint64_t sub_1887327A8()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = v8;
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v15 = __s;
  *((void *)&v15 + 1) = input;
  size_t v16 = 4096LL;
  uint64_t v9 = 3758097090LL;
  if (v6 && v4)
  {
    mach_port_t v10 = sub_188726B70();
    if (!v10)
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_import",  ":",  2971,  "",  0,  "",  "");
      uint64_t v9 = 3758097084LL;
      goto LABEL_14;
    }

    mach_port_t v11 = v10;
    if (!ccder_blob_encode_body_tl()
      || !sub_188738160(&v15, v6)
      || !sub_188738278(&v15, v7)
      || !ccder_blob_encode_tl())
    {
      goto LABEL_12;
    }

    uint64_t v12 = IOConnectCallMethod( v11,  0x4Fu,  input,  1u,  *((const void **)&v15 + 1),  (size_t)input - *((void *)&v15 + 1),  0LL,  0LL,  __s,  &v16);
    if ((_DWORD)v12)
    {
      uint64_t v9 = v12;
      goto LABEL_14;
    }

    *(void *)&__int128 v14 = __s;
    *((void *)&v14 + 1) = &__s[v16];
    if (!v2)
    {
      uint64_t v9 = 0LL;
      goto LABEL_14;
    }

    uint64_t v9 = 0LL;
    if ((sub_1887381CC(&v14, 0, v2) & 1) == 0) {
LABEL_12:
    }
      uint64_t v9 = 3758097098LL;
  }

uint64_t sub_1887329D8()
{
  return sub_18873260C();
}

uint64_t sub_1887329E8()
{
  return sub_18873260C();
}

uint64_t sub_1887329F8()
{
  return sub_188727660();
}

uint64_t sub_188732A10()
{
  return sub_188727AE4();
}

uint64_t sub_188732A2C()
{
  return sub_188726910();
}

uint64_t sub_188732A6C()
{
  return sub_188726910();
}

uint64_t sub_188732AB8()
{
  return sub_188727D40();
}

uint64_t sub_188732AD8(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t result = sub_1887323D0();
  if (!(_DWORD)result) {
    return 3758604312LL;
  }
  return result;
}

uint64_t sub_188732B90()
{
  return sub_188727D40();
}

uint64_t sub_188732BB0()
{
  return sub_188727F88();
}

uint64_t sub_188732BD4()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 3758097098LL;
  bzero(v13, 0x1000uLL);
  bzero(v12, 0x1000uLL);
  *(void *)&__int128 v11 = v13;
  *((void *)&v11 + 1) = &v14;
  *(void *)&__int128 v10 = v12;
  *((void *)&v10 + 1) = v13;
  if (sub_188738160(&v11, v7)
    && sub_188738160(&v11, v5)
    && ccder_blob_encode_tl()
    && sub_188738160(&v10, v3)
    && sub_188738160(&v10, v1)
    && ccder_blob_encode_tl())
  {
    return sub_188727D40();
  }

  return v8;
}

uint64_t sub_188732D64()
{
  return sub_188727D40();
}

uint64_t sub_188732D80()
{
  return sub_188727D40();
}

uint64_t sub_188732DD0()
{
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  bzero(v5, 0x4000uLL);
  uint64_t result = sub_188727D40();
  if (!(_DWORD)result)
  {
    if (ccder_decode_sequence_tl() && ccder_decode_tl())
    {
      __memcpy_chk();
      if (v3) {
        *uint64_t v3 = 0;
      }
      if (v1) {
        *uint64_t v1 = 0;
      }
      return 0LL;
    }

    else
    {
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_188732F28()
{
  return sub_188727D40();
}

uint64_t sub_188732F48(int a1)
{
  uint64_t v1 = 8LL;
  if (a1) {
    uint64_t v1 = 12LL;
  }
  uint64_t v4 = v1;
  uint64_t v2 = sub_188727D40();
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v4, v2);
  return v2;
}

uint64_t sub_188732FC0()
{
  uint64_t v0 = sub_188727D40();
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t sub_18873301C()
{
  uint64_t v0 = sub_188727D40();
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t sub_188733078()
{
  return sub_188727F88();
}

uint64_t sub_188733098()
{
  return sub_188727D40();
}

uint64_t sub_1887330B8()
{
  unsigned int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = 3758097084LL;
  input[0] = v0;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (v4)
  {
    mach_port_t v8 = sub_188726B70();
    if (v8)
    {
      mach_port_t v14 = v8;
      if (v6) {
        __int128 v15 = v6;
      }
      else {
        __int128 v15 = "";
      }
      sub_18873A250((char **)&inputStructCnt[1], inputStructCnt, 2, v9, v10, v11, v12, v13, (uint64_t)v15);
      uint64_t v16 = IOConnectCallMethod( v14,  0x50u,  input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
      if ((_DWORD)v16)
      {
        uint64_t v7 = v16;
      }

      else
      {
        uint64_t v17 = calloc(__count, 1uLL);
        *uint64_t v4 = v17;
        if (v17)
        {
          memcpy(v17, __src, __count);
          uint64_t v7 = 0LL;
          *uint64_t v2 = (int)__count;
        }

        else
        {
          uint64_t v7 = 3758097085LL;
        }
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_absinthe_collection",  ":",  3220,  "",  0,  "",  "");
    }
  }

  else
  {
    uint64_t v7 = 3758097090LL;
  }

  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v7;
}

uint64_t sub_1887332B8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  input[1] = *MEMORY[0x1895F89C0];
  __int128 v21 = 0LL;
  input[0] = a1;
  int v20 = 0;
  uint64_t v7 = 3758097090LL;
  if (a2 && a6 && a7)
  {
    mach_port_t v11 = sub_188726B70();
    if (v11)
    {
      mach_port_t v17 = v11;
      sub_18873A250(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      size_t v19 = *a7;
      uint64_t v7 = IOConnectCallMethod(v17, 0x51u, input, 1u, v21, v20, 0LL, 0LL, a6, &v19);
      if (!(_DWORD)v7) {
        *a7 = (int)v19;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_absinthe_generate",  ":",  3253,  "",  0,  "",  "");
      uint64_t v7 = 3758097084LL;
    }
  }

  free(v21);
  return v7;
}

uint64_t sub_188733440(unsigned int a1)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = 0LL;
  input[1] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x53u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drop_auxiliary_auth_by_uid",  ":",  3280,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188733518(int a1)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = 1LL;
  input[1] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x53u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drop_auxiliary_auth_by_handle",  ":",  3296,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1887335F4()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x5Cu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lower_iteration_count",  ":",  3310,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188733698(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x6Au, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_secret_drop",  ":",  3326,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188733770(uint64_t a1, uint64_t a2)
{
  return 3758097084LL;
}

uint64_t sub_188733838()
{
  return sub_1887293C0();
}

uint64_t sub_188733848()
{
  int v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  input[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = 3758097090LL;
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096LL;
  mach_port_t v4 = sub_188726B70();
  if (!v4)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_internal_state",  ":",  3379,  "",  0,  "",  "");
    uint64_t v3 = 3758097084LL;
    goto LABEL_11;
  }

  if (!v2)
  {
LABEL_11:
    rsize_t v6 = 4096LL;
    goto LABEL_9;
  }

  uint64_t v5 = IOConnectCallMethod(v4, 0x8Eu, input, 1u, 0LL, 0LL, 0LL, 0LL, __s, &__n);
  rsize_t v6 = __n;
  if ((_DWORD)v5)
  {
    uint64_t v3 = v5;
  }

  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000LL)
  {
    else {
      uint64_t v3 = 0LL;
    }
    rsize_t v6 = __n;
  }

uint64_t sub_1887339C0(const void *a1, size_t a2, void *a3, size_t *a4)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = 266LL;
  uint64_t result = 3758097090LL;
  if (a3 && a4)
  {
    mach_port_t v9 = sub_188726B70();
    if (v9)
    {
      size_t v10 = *a4;
      uint64_t result = IOConnectCallMethod(v9, 0x68u, input, 1u, a1, a2, 0LL, 0LL, a3, &v10);
      if (!(_DWORD)result) {
        *a4 = (int)v10;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fairplay_wrap",  ":",  3405,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_188733AE4(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = ((unint64_t)a1 << 8) | 1;
  uint64_t result = 3758097090LL;
  if (a4 && a5)
  {
    mach_port_t v10 = sub_188726B70();
    if (v10)
    {
      size_t v11 = *a5;
      uint64_t result = IOConnectCallMethod(v10, 0x68u, input, 1u, a2, a3, 0LL, 0LL, a4, &v11);
      if (!(_DWORD)result) {
        *a5 = (int)v11;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_fairplay_generate_csk_internal",  ":",  3429,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_188733C10(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_188733AE4(0, a1, a2, a3, a4);
}

uint64_t sub_188733C28(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_188733AE4(1u, a1, a2, a3, a4);
}

uint64_t sub_188733C40()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  mach_port_t v4 = v3;
  size_t v6 = v5;
  mach_port_t v8 = v7;
  uint64_t v9 = v0;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  memset(v19, 0, sizeof(v19));
  bzero(__s, 0x4000uLL);
  size_t v15 = 0x4000LL;
  input[0] = 1LL;
  input[1] = v9;
  mach_port_t v10 = sub_188726B70();
  if (v10)
  {
    uint64_t v11 = IOConnectCallMethod(v10, 0x87u, input, 2u, v8, v6, 0LL, 0LL, __s, &v15);
    if ((_DWORD)v11)
    {
      uint64_t v13 = v11;
    }

    else
    {
      __memcpy_chk();
      *uint64_t v2 = 44LL;
      uint64_t v12 = calloc(0x2CuLL, 1uLL);
      *mach_port_t v4 = v12;
      if (v12)
      {
        __memcpy_chk();
        uint64_t v13 = 0LL;
      }

      else
      {
        uint64_t v13 = 3758097085LL;
      }
    }
  }

  else
  {
    uint64_t v13 = 3758097084LL;
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_bak_get_beacon_internal",  ":",  3465,  "",  0,  "",  "");
  }

  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v13;
}

uint64_t sub_188733E10()
{
  uint64_t v0 = sub_188733C40();
  if ((_DWORD)v0) {
    return v0;
  }
  else {
    return 3758604312LL;
  }
}

uint64_t sub_188733F50()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  mach_port_t v4 = v3;
  size_t v6 = v5;
  mach_port_t v8 = v7;
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = 2LL;
  input[1] = v0;
  int v36 = 0;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v27 = 0u;
  memset(v26, 0, sizeof(v26));
  bzero(__s, 0x4000uLL);
  size_t v24 = 0x4000LL;
  mach_port_t v9 = sub_188726B70();
  if (v9)
  {
    uint64_t v10 = IOConnectCallMethod(v9, 0x87u, input, 2u, 0LL, 0LL, 0LL, 0LL, __s, &v24);
    if ((_DWORD)v10)
    {
      uint64_t v11 = v10;
    }

    else
    {
      uint64_t v11 = 3758097085LL;
      __memcpy_chk();
      uint64_t v12 = calloc(0x28uLL, 1uLL);
      *mach_port_t v8 = v12;
      if (v12)
      {
        *size_t v6 = 40LL;
        __int128 v13 = *(_OWORD *)&v26[1];
        __int128 v14 = *(_OWORD *)&v26[3];
        v12[4] = v26[5];
        *(_OWORD *)uint64_t v12 = v13;
        *((_OWORD *)v12 + 1) = v14;
        size_t v15 = calloc(0x91uLL, 1uLL);
        *mach_port_t v4 = v15;
        if (v15)
        {
          uint64_t v11 = 0LL;
          *uint64_t v2 = 145LL;
          __int128 v16 = v28;
          *size_t v15 = v27;
          v15[1] = v16;
          __int128 v17 = v29;
          __int128 v18 = v30;
          __int128 v19 = v32;
          v15[4] = v31;
          v15[5] = v19;
          v15[2] = v17;
          v15[3] = v18;
          __int128 v20 = v33;
          __int128 v21 = v34;
          __int128 v22 = v35;
          *((_BYTE *)v15 + 144) = v36;
          v15[7] = v21;
          v15[8] = v22;
          v15[6] = v20;
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_bak_get_swizzler_internal",  ":",  3525,  "",  0,  "",  "");
    uint64_t v11 = 3758097084LL;
  }

  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v26, 0xC4uLL, 0, 0xC4uLL);
  return v11;
}

uint64_t sub_1887341A0()
{
  return sub_188733F50();
}

uint64_t sub_1887341B8(uint64_t a1)
{
  mach_port_t v2 = sub_188728B08();
  if (v2) {
    return IOConnectCallMethod(v2, 0xCu, 0LL, 0, *(const void **)a1, *(void *)(a1 + 8), 0LL, 0LL, 0LL, 0LL);
  }
  else {
    return 3758097084LL;
  }
}

uint64_t sub_188734210()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  uint64_t v3 = (void *)v0;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  bzero(__src, 0x4000uLL);
  size_t __count = 0x4000LL;
  mach_port_t v4 = sub_188726B70();
  if (v4)
  {
    uint64_t v5 = 3758097090LL;
    if (v3 && v2)
    {
      uint64_t v6 = IOConnectCallMethod(v4, 0x96u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      if ((_DWORD)v6)
      {
        uint64_t v5 = v6;
      }

      else
      {
        uint64_t v7 = calloc(__count, 1uLL);
        *uint64_t v3 = v7;
        if (v7)
        {
          size_t v8 = __count;
          *mach_port_t v2 = __count;
          memcpy(v7, __src, v8);
          uint64_t v5 = 0LL;
        }

        else
        {
          uint64_t v5 = 3758097085LL;
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_dsme_key",  ":",  3574,  "",  0,  "",  "");
    uint64_t v5 = 3758097084LL;
  }

  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v5;
}

BOOL sub_18873439C(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t sub_1887343B0()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x73u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_prewarm_sps",  ":",  3601,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188734454(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = 4294967285LL;
  if (a3 && a4 <= 0x30)
  {
    uint64_t v4 = 3758097084LL;
    mach_port_t v5 = sub_188726B70();
    if (v5)
    {
      mach_port_t v6 = v5;
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_uint64();
      ccder_sizeof_raw_octet_string();
      size_t v7 = ccder_sizeof();
      MEMORY[0x1895F8858]();
      mach_port_t v9 = (char *)v11 - v8;
      bzero((char *)v11 - v8, v7);
      ccder_encode_raw_octet_string();
      ccder_encode_uint64();
      ccder_encode_raw_octet_string();
      else {
        return 3758097090LL;
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_sealed_hashes_set",  ":",  3618,  "",  0,  "",  "");
    }
  }

  return v4;
}

uint64_t sub_188734664(const void *a1, size_t a2)
{
  mach_port_t v4 = sub_188726B70();
  if (v4) {
    return IOConnectCallMethod(v4, 0x90u, 0LL, 0, a1, a2, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_measure_and_seal_cryptex_manifest",  ":",  3648,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188734718()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x95u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_seal_cryptex_manifest_lock",  ":",  3662,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1887347BC(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_188726B70();
  if (v3) {
    return IOConnectCallMethod(v3, 0x85u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lkgp_recover",  ":",  3678,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188734898(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x8Au, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_memento_efface_blob",  ":",  3694,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188734970()
{
  int v0 = MEMORY[0x1895F8858]();
  mach_port_t v2 = v1;
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = v0;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096LL;
  mach_port_t v3 = sub_188726B70();
  if (v3)
  {
    uint64_t v4 = IOConnectCallMethod(v3, 0x8Bu, input, 1u, 0LL, 0LL, 0LL, 0LL, __s, &__n);
    rsize_t v5 = __n;
    if ((_DWORD)v4)
    {
      uint64_t v6 = v4;
    }

    else
    {
      uint64_t v6 = 3758097090LL;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000LL)
      {
        else {
          uint64_t v6 = 0LL;
        }
        rsize_t v5 = __n;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_memento_get_state",  ":",  3712,  "",  0,  "",  "");
    uint64_t v6 = 3758097084LL;
    rsize_t v5 = 4096LL;
  }

  memset_s(__s, v5, 0, v5);
  return v6;
}

uint64_t sub_188734AEC()
{
  mach_port_t v0 = sub_188726B70();
  if (v0) {
    return IOConnectCallMethod(v0, 0x89u, &input, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_jcop_supports_updated_kud_policy",  ":",  3732,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188734B90(uint64_t a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  input[0] = a1;
  mach_port_t v1 = sub_188726B70();
  if (v1) {
    return IOConnectCallMethod(v1, 0x97u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_cx_window",  ":",  3748,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_188734C64()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  outputStruct[512] = *MEMORY[0x1895F89C0];
  size_t v5 = 4096LL;
  if (!v0) {
    return 4294967285LL;
  }
  mach_port_t v1 = (void *)v0;
  mach_port_t v2 = sub_188726B70();
  if (v2)
  {
    mach_port_t v3 = v2;
    bzero(outputStruct, 0x1000uLL);
    uint64_t result = IOConnectCallMethod(v3, 0x98u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v5);
    if (!(_DWORD)result)
    {
      if (v5 == 8)
      {
        uint64_t result = 0LL;
        *mach_port_t v1 = outputStruct[0];
      }

      else
      {
        return 3758604298LL;
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_cx_window",  ":",  3765,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_188734DB8()
{
  return 0LL;
}

uint64_t sub_188734DC4()
{
  return 0LL;
}

unint64_t sub_188734E34(unsigned int a1)
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t sub_188734E7C(uint64_t a1)
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t sub_188734EB8()
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t sub_188734F08()
{
  v1.tv_sec = 0LL;
  *(void *)&v1.tv_usec = 0LL;
  gettimeofday(&v1, 0LL);
  return v1.tv_sec;
}

uint64_t sub_188734F34()
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t sub_188734F84()
{
  v1.tv_sec = 0LL;
  *(void *)&v1.tv_usec = 0LL;
  gettimeofday(&v1, 0LL);
  return v1.tv_sec;
}

uint64_t sub_188734FB0(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t sub_188734FC0(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

void *sub_188734FD8(unsigned int a1, unsigned int a2)
{
  uint64_t v2 = a1 + 1LL;
  uint64_t v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n",  "aks",  "",  "",  "",  "circular_queue_init",  ":",  337,  "",  0,  "",  "");
    return 0LL;
  }

  else
  {
    size_t v5 = calloc(0x20uLL, 1uLL);
    uint64_t v6 = v5;
    if (v5)
    {
      v5[1] = 0LL;
      size_t v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)size_t v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      uint64_t v8 = calloc(v7, 1uLL);
      v6[2] = v7;
      v6[3] = v8;
    }
  }

  return v6;
}

uint64_t sub_1887350B4(_DWORD *a1)
{
  unsigned int v3 = a1[2];
  unsigned int v2 = a1[3];
  uint64_t result = v2 - v3;
  if (v2 < v3) {
    return (result + a1[1]);
  }
  return result;
}

uint64_t sub_1887350D0(unsigned int *a1, const void *a2)
{
  unsigned int v3 = a1[3];
  unsigned int v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((void *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2]) {
    a1[2] = (v4 + 1) % a1[1];
  }
  return 0LL;
}

uint64_t sub_188735138(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
    unsigned int v2 = a1[2];
  }

  memset_s((void *)(*((void *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  uint64_t result = 0LL;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t sub_1887351C0(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
  return 0LL;
}

uint64_t sub_188735204(int *a1, void *a2, unsigned int *a3)
{
  unsigned int v7 = a1[2];
  unsigned int v6 = a1[3];
  unsigned int v8 = v6 - v7;
  if (v6 < v7) {
    v8 += a1[1];
  }
  if (!v8) {
    return 0LL;
  }
  unsigned int v9 = *a1 * v8;
  uint64_t v10 = (char *)calloc(v9, 1uLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  unsigned int v12 = a1[2];
  unsigned int v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13) {
      goto LABEL_13;
    }
    unsigned int v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((void *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17) {
      goto LABEL_13;
    }
    uint64_t v10 = &v11[*a1 * v17];
    __int128 v14 = (const void *)*((void *)a1 + 3);
    size_t v15 = *a1 * (v8 - v17);
  }

  else
  {
    __int128 v14 = (const void *)(*((void *)a1 + 3) + *a1 * v12);
    size_t v15 = *a1 * v8;
  }

  memcpy(v10, v14, v15);
LABEL_13:
  unsigned int v18 = a1[1];
  int v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  uint64_t result = 0LL;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t sub_18873532C(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
  rsize_t v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void sub_18873534C(void *a1)
{
  *((void *)a1 + 1) = 0LL;
  rsize_t v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((void *)a1 + 2), 0, *((void *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t sub_1887353B4(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL sub_1887353BC(uint8x16_t *a1)
{
  int8x16_t v1 = (int8x16_t)vmovl_high_u8(*a1);
  int8x16_t v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  int8x16_t v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8( vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8),  vorr_s8( (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL),  (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0LL;
}

BOOL sub_188735400(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  int v2 = 0;
  do
  {
    int v3 = *a1++;
    v2 |= v3;
    --a2;
  }

  while (a2);
  return v2 != 0;
}

_DWORD *sub_18873542C(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result != 0);
  }
  return result;
}

uint64_t sub_188735440(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t sub_188735448(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t sub_188735450(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t sub_188735458(int a1)
{
  return a1 | 0x40u;
}

uint64_t sub_188735460(char a1)
{
  char v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14) {
    char v1 = -1;
  }
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t sub_188735488(char a1)
{
  if ((a1 & 0x1Fu) > 0x13) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a1 & 0x1F;
  }
}

uint64_t sub_188735498(char a1)
{
  unsigned int v1 = a1 & 0x1F;
  if (v1 > 0x13) {
    unsigned int v1 = -1;
  }
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t sub_1887354C0(char a1)
{
  return a1 & 0xF;
}

BOOL sub_1887354C8(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t sub_1887354D8()
{
  return cc_cmp_safe();
}

uint64_t sub_1887354EC(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  unsigned int v4 = a1;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  char v24 = 0;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v17 = 0u;
  size_t v5 = (FILE **)MEMORY[0x1895F89E0];
  if (a3 >= 0x41)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n",  "aks",  "",  "",  "",  "dump_bytes_internal",  ":",  782,  "",  0,  "",  "",  a1,  a3,  "",  "");
    unsigned int v4 = "";
  }

  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }

  unint64_t v6 = 0LL;
  unint64_t v15 = v3;
  do
  {
    unsigned int v7 = v5;
    if (v3 - v6 >= 0x40) {
      uint64_t v8 = 64LL;
    }
    else {
      uint64_t v8 = v3 - v6;
    }
    if (v8)
    {
      unsigned int v9 = (unsigned __int8 *)(a2 + v6);
      uint64_t v10 = __str;
      uint64_t v11 = v8;
      do
      {
        int v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }

      while (v11);
    }

    size_t v5 = v7;
    fprintf( *v7,  "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n",  "aks",  "",  "",  "",  "dump_bytes_internal",  ":",  792,  "",  0,  "",  "",  v4,  "",  v6,  v8 + v6,  "",  __str,  "",  "");
    v6 += v8;
    unint64_t v3 = v15;
  }

  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *sub_1887356C8(unsigned __int8 *a1, unint64_t a2)
{
  if (a2 >= 0x10) {
    uint64_t v2 = 16LL;
  }
  else {
    uint64_t v2 = a2;
  }
  if (v2)
  {
    unsigned int v4 = byte_18C7247B0;
    uint64_t v5 = v2;
    do
    {
      int v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }

    while (v5);
  }

  byte_18C7247B0[2 * v2] = 0;
  return byte_18C7247B0;
}

uint64_t sub_188735758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  memset(__s, 0, sizeof(__s));
  if (a4 == 3)
  {
    ccsha256_di();
    cchmac();
    uint64_t v5 = 0LL;
    *(_WORD *)a3 = __s[0];
    *(_BYTE *)(a3 + 2) = BYTE2(__s[0]);
  }

  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v5;
}

uint64_t sub_188735820(const char *a1, uint64_t a2, uint64_t a3)
{
  char v6 = 0;
  __int16 v5 = 0;
  sub_188735758(a2, a3, (uint64_t)&v5, 3LL);
  return sub_1887354EC(a1, (uint64_t)&v5, 3uLL);
}

char *sub_188735874(char *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = a2 >> 1;
    unint64_t v3 = &result[a2 - 1];
    do
    {
      char v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }

    while (v2);
  }

  return result;
}

uint64_t sub_1887358A4(unsigned __int8 *a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    char v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        unint64_t v9 = a2 >> 1;
        uint64_t v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1) {
              uint64_t v11 = 1LL;
            }
            else {
              uint64_t v11 = a2 >> 1;
            }
            int v12 = v10;
            do
            {
              int v13 = *v6;
              unsigned int v14 = v13 - 48;
              unsigned int v15 = v13 - 97;
              else {
                char v16 = v13 - 55;
              }
              char v17 = v13 - 87;
              if (v15 > 5) {
                char v17 = v16;
              }
              if (v14 < 0xA) {
                char v17 = v14;
              }
              char v18 = 16 * v17;
              int v19 = v6[1];
              unsigned int v20 = v19 - 48;
              unsigned int v21 = v19 - 97;
              else {
                char v22 = v19 - 55;
              }
              char v23 = v19 - 87;
              if (v21 > 5) {
                char v23 = v22;
              }
              if (v20 < 0xA) {
                char v23 = v20;
              }
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }

            while (v11);
          }

          uint64_t v5 = 0LL;
          *a3 = v10;
          *a4 = v9;
        }

        else
        {
          return 4294967279LL;
        }
      }
    }
  }

  return v5;
}

uint64_t sub_1887359A8(uint64_t result)
{
  return result;
}

uint64_t sub_1887359C4(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return 4294967285LL;
  }
  if (a2 && *(void *)a2 && (size_t v7 = *(void *)(a2 + 8)) != 0)
  {
    uint64_t v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      unint64_t v9 = *(const void **)a2;
      a1[1] = *(void *)(a2 + 8);
      memcpy(v8, v9, *(void *)(a2 + 8));
      return 0LL;
    }

    else
    {
      return 4294967279LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *a1 = 0LL;
    a1[1] = 0LL;
  }

  return result;
}

uint64_t sub_188735A58(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n",  "aks",  "",  "",  "",  "REQUIRE_func",  ":",  1043,  "",  0,  "",  a3,  a2,  "");
    abort();
  }

  return result;
}

uint64_t sub_188735AC8(__int128 *a1, __int128 *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  memset(v14, 0, sizeof(v14));
  sub_188739910((uint64_t)v14, 0x20u);
  cccurve25519_make_pub();
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  int __s = 0x1000000;
  __int128 v4 = a2[1];
  __int128 v10 = *a2;
  __int128 v11 = v4;
  __int128 v5 = a1[1];
  __int128 v12 = *a1;
  __int128 v13 = v5;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v14, 0x20uLL, 0, 0x20uLL);
  return 0LL;
}

uint64_t sub_188735BB0( int *a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  unsigned int v30 = 0;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  memset(__s, 0, sizeof(__s));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7) {
    goto LABEL_40;
  }
  if (!a1)
  {
LABEL_14:
    if (a2)
    {
      if (sub_18872688C(a5, &v30))
      {
        if (*a7 < v30) {
          goto LABEL_40;
        }
        char v18 = 0LL;
        unsigned int v19 = 0;
        unsigned int v20 = a2;
        unsigned int v21 = a4;
        goto LABEL_38;
      }
    }

    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5) {
          goto LABEL_40;
        }
        unsigned int v30 = a5;
        ccaes_cbc_encrypt_mode();
        sub_188736428();
LABEL_39:
        uint64_t v8 = 0LL;
        *a7 = v30;
        goto LABEL_40;
      }

      if (sub_18872688C(a5, &v30))
      {
        if (*a7 < v30) {
          goto LABEL_40;
        }
        if ((a3 & 8) != 0)
        {
          ccsha256_di();
          cchkdf();
          char v18 = __s;
        }

        else
        {
          char v18 = a1 + 2;
        }

        unsigned int v19 = 32;
        unsigned int v20 = 0LL;
        unsigned int v21 = a4;
LABEL_38:
        goto LABEL_39;
      }
    }

    uint64_t v8 = 4294967285LL;
    if ((a3 & 8) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }

  int v14 = *a1;
  if ((*a1 - 1) >= 2)
  {
    if (v14) {
      goto LABEL_40;
    }
    goto LABEL_14;
  }

  if ((a3 & 4) != 0) {
    unsigned int v15 = 64;
  }
  else {
    unsigned int v15 = 72;
  }
  unsigned int v30 = v15;
  if (!a2 && a5 == 32 && *a7 >= v15)
  {
    if (v14 == 1)
    {
      sub_188735AC8((__int128 *)(a1 + 9), &v32);
    }

    else
    {
      __int128 v23 = *(_OWORD *)(a1 + 5);
      __int128 v32 = *(_OWORD *)(a1 + 1);
      __int128 v33 = v23;
      __int128 v24 = *(_OWORD *)(a1 + 13);
      __int128 v34 = *(_OWORD *)(a1 + 9);
      __int128 v35 = v24;
    }

    if ((a3 & 0x80) == 0)
    {
      __int128 v25 = v33;
      *(_OWORD *)a6 = v32;
      *(_OWORD *)(a6 + 16) = v25;
      if ((a3 & 4) != 0)
      {
        ccaes_cbc_encrypt_mode();
        sub_188736428();
        goto LABEL_34;
      }

      int v29 = 40;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        __int128 v27 = (void *)(a6 + 32);
        uint64_t v26 = __s;
      }

      else
      {
        uint64_t v26 = &v34;
        __int128 v27 = (void *)(a6 + 32);
      }

      if (!sub_188726460((uint64_t)v26, 0x20u, 0xA6A6A6A6A6A6A6A6LL, 0LL, a4, 0x20u, v27, &v29))
      {
LABEL_34:
        uint64_t v8 = 0LL;
        *a7 = v15;
        if ((a3 & 8) == 0) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
  }

LABEL_40:
  if ((a3 & 8) != 0) {
LABEL_41:
  }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_42:
  memset_s(&v32, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t sub_188735F18(__int128 *a1, uint64_t a2, __int128 *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v7 = 0u;
  __int128 v3 = a1[1];
  __int128 v9 = *a1;
  __int128 v10 = v3;
  __int128 v4 = a3[1];
  __int128 v11 = *a3;
  int __s = 0x1000000;
  __int128 v12 = v4;
  cccurve25519();
  ccsha256_di();
  ccdigest();
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0LL;
}

uint64_t sub_188735FD4( uint64_t a1, uint64_t (*a2)(void, void *, unint64_t *, unint64_t *, uint64_t), char a3, void *a4, unsigned int a5, void *a6, unsigned int *a7)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unsigned int v22 = 0;
  memset(v24, 0, sizeof(v24));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if (!a1) {
      goto LABEL_6;
    }
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
      {
LABEL_6:
        if (a5 <= 0x28)
        {
          if (a2)
          {
            if (sub_1887268E8(a5, &v22) && *a7 >= v22)
            {
              unsigned int v15 = 0LL;
              unsigned int v16 = 0;
              char v17 = a2;
              goto LABEL_30;
            }
          }

          else if ((a3 & 4) != 0)
          {
            if ((a5 & 0xF) == 0 && *a7 >= a5)
            {
              unsigned int v22 = a5;
              ccaes_cbc_decrypt_mode();
              sub_188736428();
LABEL_31:
              uint64_t v8 = 0LL;
              *a7 = v22;
              goto LABEL_35;
            }
          }

          else if (sub_1887268E8(a5, &v22) && *a7 >= v22)
          {
            if ((a3 & 8) != 0)
            {
              ccsha256_di();
              cchkdf();
              unsigned int v15 = v24;
            }

            else
            {
              unsigned int v15 = (_OWORD *)(a1 + 8);
            }

            unsigned int v16 = 32;
            char v17 = 0LL;
LABEL_30:
            goto LABEL_40;
          }
        }

LABEL_38:
        uint64_t v8 = 4294967285LL;
        goto LABEL_35;
      }

LABEL_22:
      uint64_t v8 = 0xFFFFFFFFLL;
      goto LABEL_35;
    }

    unsigned int v22 = 32;
    if (*a7 < 0x20) {
      goto LABEL_38;
    }
    memset(__s, 0, sizeof(__s));
    if ((a3 & 4) != 0)
    {
      if (a5 != 64) {
        goto LABEL_38;
      }
      sub_188735F18((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      ccaes_cbc_decrypt_mode();
      sub_188736428();
    }

    else
    {
      if (a5 != 72) {
        goto LABEL_38;
      }
      sub_188735F18((__int128 *)a4, a1 + 4, (__int128 *)(a1 + 36));
      if (a3 < 0) {
        goto LABEL_22;
      }
      int v21 = 32;
      if ((a3 & 8) != 0)
      {
        ccsha256_di();
        cchkdf();
        char v18 = a4 + 4;
        unsigned int v19 = v24;
      }

      else
      {
        char v18 = a4 + 4;
        unsigned int v19 = __s;
      }

      if (sub_188726824((uint64_t)v19, 0x20u, 0xA6A6A6A6A6A6A6A6LL, 0LL, v18, 0x28u, a6, &v21))
      {
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_40:
        uint64_t v8 = 4294967277LL;
        goto LABEL_35;
      }
    }

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    uint64_t v8 = 0LL;
    *a7 = 32;
  }

LABEL_35:
  if ((a3 & 8) != 0) {
    memset_s(v24, 0x20uLL, 0, 0x20uLL);
  }
  return v8;
}

uint64_t sub_188736324(uint64_t a1, void *a2, size_t *a3)
{
  size_t v5 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  char v6 = calloc(v5, 1uLL);
  if (!v6) {
    return 4294967279LL;
  }
  __int128 v7 = v6;
  ccec_export_pub();
  uint64_t result = 0LL;
  *a2 = v7;
  *a3 = v5;
  return result;
}

unint64_t sub_1887363A0()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

unint64_t sub_1887363C0()
{
  return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t sub_1887363E4()
{
  return ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
}

unint64_t sub_188736408()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

uint64_t sub_188736428()
{
  return cccbc_one_shot();
}

uint64_t sub_188736430()
{
  return ccecb_one_shot();
}

uint64_t sub_188736438()
{
  return cccbc_update();
}

BOOL sub_188736440()
{
  return !MEMORY[0x1895CAB4C]() && ccn_read_uint() == 0;
}

uint64_t sub_1887364B8()
{
  return 1LL;
}

uint64_t sub_1887364EC(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a5 + 8) >= *(void *)a5)
  {
    char v13 = 0;
  }

  else
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    while (1)
    {
      BOOL v11 = sub_1887365E8( *(const void **)(*(void *)(a5 + 24) + v9),  *(void *)(*(void *)(a5 + 24) + v9)
            + *(unsigned __int8 *)(*(void *)(*(void *)(a5 + 24) + v9) + 1LL)
            + 2LL,
              a1);
      if (v11) {
        break;
      }
      ++v10;
      v9 += 40LL;
      if (v10 >= *(void *)a5) {
        goto LABEL_10;
      }
    }

    int v14 = (void *)(*(void *)(a5 + 24) + v9);
    if (v14[1])
    {
      char v12 = 0;
      *(_BYTE *)(a5 + 16) = 1;
    }

    else
    {
      ++*(void *)(a5 + 8);
      v14[1] = a3;
      _OWORD v14[2] = a3 + a4;
      v14[3] = a3;
      v14[4] = a3 + a4;
      char v12 = 1;
    }

BOOL sub_1887365D0(unsigned __int8 *a1, const void *a2)
{
  return sub_1887365E8(a1, (uint64_t)&a1[a1[1] + 2], a2);
}

BOOL sub_1887365E8(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = sub_188736650((uint64_t)a1);
  return v5 == sub_188736650((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_188736650(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t sub_1887366B4()
{
  uint64_t result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      uint64_t result = ccder_blob_decode_tl();
      if ((_DWORD)result) {
        return 0LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_188736788(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    sub_1887366B4();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0LL;
        *a3 = 0LL;
      }
    }
  }

  return 0LL;
}

BOOL sub_1887367F4(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = sub_1887365E8(*(const void **)a5, *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1LL) + 2LL, a1);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }

  return !v8;
}

uint64_t sub_188736854(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0LL;
  }
  if (result)
  {
    sub_1887366B4();
    return 0LL;
  }

  return result;
}

uint64_t sub_1887368CC()
{
  return 0LL;
}

uint64_t sub_188736934(uint64_t result)
{
  if (result)
  {
    sub_1887366B4();
    return 0LL;
  }

  return result;
}

double sub_1887369D0(__int128 *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  __int128 v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0LL;
    *a3 = 0;
    double result = *(double *)&v8;
    *a1 = v8;
  }

  return result;
}

uint64_t sub_188736A3C( uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, uint64_t), uint64_t a4)
{
  *(void *)&__int128 v12 = a1;
  *((void *)&v12 + 1) = a2;
  uint64_t v6 = ccder_blob_decode_range();
  if ((_DWORD)v6)
  {
    uint64_t v11 = 0LL;
    uint64_t v7 = v12;
    if (sub_188736AEC(&v12, &v10, &v11))
    {
      do
      {
        uint64_t v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4)) {
          break;
        }
        *(void *)&__int128 v12 = v8;
        uint64_t v7 = v8;
      }

      while ((sub_188736AEC(&v12, &v10, &v11) & 1) != 0);
    }
  }

  return v6;
}

uint64_t sub_188736AEC(__int128 *a1, void *a2, void *a3)
{
  __int128 v7 = *a1;
  uint64_t result = ccder_blob_decode_tag();
  if ((_DWORD)result)
  {
    uint64_t result = ccder_blob_decode_len();
    if ((_DWORD)result)
    {
      *a1 = v7;
      *a2 = 0LL;
      *a3 = 0LL;
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_188736B68()
{
  return 0LL;
}

uint64_t sub_188736BC0(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    unint64_t v2 = *a1;
    if (!*a1) {
      break;
    }
    __int128 v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }

    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }

  return 0LL;
}

uint64_t sub_188736C38(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = (void **)a1;
  uint64_t result = (uint64_t)sub_188736CCC(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (uint64_t i = *v2; i != (void *)result; uint64_t i = (void *)*i)
      unint64_t v2 = (void **)i;
    *unint64_t v2 = *(void **)result;
    uint64_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }

    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0LL;
  }

  return result;
}

void *sub_188736CCC(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      unint64_t v2 = (void *)*v2;
    }

    while (v2);
  }

  return v2;
}

uint64_t sub_188736D4C(void *a1, unsigned __int8 *a2, int a3, void *a4, void *a5)
{
  uint64_t v8 = sub_188736CCC(a1, a2);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = 1LL;
  if (a4)
  {
    if (a5)
    {
      uint64_t v10 = v8[1] + v8[2];
      *(void *)&__int128 v15 = v8[1];
      *((void *)&v15 + 1) = v10;
      uint64_t v9 = ccder_blob_decode_sequence_tl();
      if ((_DWORD)v9)
      {
        if (sub_188736E28(&v15, 12LL, 0LL, 0))
        {
          uint64_t v11 = v15;
          if (ccder_blob_decode_tag())
          {
            if (ccder_blob_decode_len())
            {
              uint64_t v13 = 0LL;
              uint64_t v12 = v15;
              if (a3)
              {
                uint64_t v13 = (v15 - v11);
                uint64_t v12 = v11;
              }

              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }

  return v9;
}

uint64_t sub_188736E28(__int128 *a1, uint64_t a2, uint64_t a3, int a4)
{
  __int128 v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4) {
    return 0LL;
  }
  *a1 = v8;
  return 1LL;
}

uint64_t sub_188736EB4(void *a1, char *__s, void *a3, size_t a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  memset(v18, 0, sizeof(v18));
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  v11[0] = 12;
  v11[1] = strlen(__s);
  __int128 v7 = (unsigned __int8 *)sub_188736FDC((uint64_t)v11);
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v7)
  {
    __memcpy_chk();
    __src = 0LL;
    uint64_t v10 = 0LL;
    if (sub_188736D4C(a1, v7, 0, &__src, &v10))
    {
      if (v10 == a4)
      {
        memcpy(a3, __src, a4);
        return 0LL;
      }

      else
      {
        return 4294967277LL;
      }
    }

    else
    {
      return 4294967293LL;
    }
  }

  return result;
}

uint64_t sub_188736FDC(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x1895F89E0], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0LL;
  }

  return a1;
}

uint64_t sub_1887370D8(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v4 = sub_188736D4C(a1, a2, 1, &v7, &v8);
  uint64_t v5 = v4;
  if (a3 && (_DWORD)v4) {
    *a3 = sub_1887368CC();
  }
  return v5;
}

uint64_t sub_188737130(void *a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v4 = sub_188736D4C(a1, a2, 1, &v7, &v8);
  uint64_t v5 = v4;
  if (a3 && (_DWORD)v4) {
    *a3 = sub_188736B68();
  }
  return v5;
}

uint64_t sub_188737188(uint64_t a1)
{
  if (a1) {
    return sub_1887366B4() - 1;
  }
  else {
    return 4294967285LL;
  }
}

uint64_t sub_1887371C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (unsigned __int8 *)sub_188736FDC(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
  }

  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n",  "aks",  "",  "",  "",  "_merge_dict_cb",  ":",  647,  "",  0,  "",  "");
  return 0LL;
}

uint64_t sub_188737290(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          do
          {
            v10 += v7[2];
            uint64_t v7 = (void *)*v7;
            v9 -= 16LL;
            --v8;
          }

          while (v7);
          if (v8 >= 0xF000000000000001LL && (rsize_t v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0LL))
          {
            __int128 v13 = v12;
            __int128 v14 = (void *)*a1;
            if (*a1)
            {
              __int128 v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                __int128 v14 = (void *)*v14;
              }

              while (v14);
            }

            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_188739680);
            size_t v16 = ccder_sizeof();
            __int128 v17 = (char *)calloc(v16, 1uLL);
            char v18 = v17;
            if (v17)
            {
              uint64_t v25 = v17;
              uint64_t v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              uint64_t v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1LL))
              {
                uint64_t v22 = v20 - 16;
                char v23 = ccder_blob_encode_body();
                uint64_t v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }

              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }

              uint64_t v3 = 0LL;
              *a2 = v18;
              *a3 = v16;
              char v18 = 0LL;
            }

            else
            {
              uint64_t v3 = 4294967279LL;
            }

LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }

          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }

  return v3;
}

uint64_t sub_188737454(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_188736650(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      uint64_t v7 = (char *)calloc(v6, 1uLL);
      if (!v7) {
        return 4294967279LL;
      }
      unint64_t v8 = v7;
      size_t v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        int v9 = ccder_blob_encode_body();
        uint64_t v10 = v16;
        if (!v9) {
          uint64_t v10 = 0LL;
        }
        __int128 v17 = v10;
        int v11 = ccder_blob_encode_tl();
        __int128 v12 = v17;
        if (!v11) {
          __int128 v12 = 0LL;
        }
        if (v12 && v12 == v8)
        {
          __int128 v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            __int128 v15 = v14;
            uint64_t result = 0LL;
            v15[1] = v8;
            v15[2] = v6;
            *__int128 v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }

      memset_s(v8, v6, 0, v6);
      free(v8);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_1887375C0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_188737454(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_1887375D0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    size_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      __int128 v15 = &v6[v5];
      int v8 = ccder_blob_encode_body();
      int v9 = v15;
      if (!v8) {
        int v9 = 0LL;
      }
      size_t v16 = v9;
      int v10 = ccder_blob_encode_tl();
      int v11 = v16;
      if (!v10) {
        int v11 = 0LL;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (__int128 v13 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        __int128 v14 = v13;
        uint64_t result = 0LL;
        v14[1] = v7;
        _OWORD v14[2] = v5;
        *__int128 v14 = *a1;
        *a1 = v14;
      }

      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_18873773C(void *a1, char *__s, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  memset(v14, 0, sizeof(v14));
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v10 = 0u;
  __int128 v9 = 0u;
  __int128 v8 = 0u;
  v7[0] = 12;
  v7[1] = strlen(__s);
  uint64_t v5 = sub_188736FDC((uint64_t)v7);
  uint64_t result = 4294967285LL;
  if (a3)
  {
    if (v5)
    {
      __memcpy_chk();
      return sub_1887375D0(a1, v5, a3);
    }
  }

  return result;
}

uint64_t sub_188737828(void *a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v4 = ccder_sizeof();
    uint64_t v5 = (char *)calloc(v4, 1uLL);
    if (v5)
    {
      size_t v6 = v5;
      __int128 v14 = &v5[v4];
      int v7 = ccder_blob_encode_body();
      __int128 v8 = v14;
      if (!v7) {
        __int128 v8 = 0LL;
      }
      uint64_t v15 = v8;
      int v9 = ccder_blob_encode_tl();
      __int128 v10 = v15;
      if (!v9) {
        __int128 v10 = 0LL;
      }
      BOOL v11 = v10 && v10 == v6;
      if (v11 && (__int128 v12 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        __int128 v13 = v12;
        uint64_t result = 0LL;
        v13[1] = v6;
        size_t v13[2] = v4;
        *__int128 v13 = *a1;
        *a1 = v13;
      }

      else
      {
LABEL_18:
        memset_s(v6, v4, 0, v4);
        free(v6);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_18873798C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  v25[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v10 = 8LL;
  }

  else
  {
    uint64_t v6 = 9LL;
    uint64_t v7 = 48LL;
    uint64_t v8 = 1LL;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      uint64_t v9 = a3 >> v7;
      --v6;
      v7 -= 8LL;
      if ((_DWORD)v5 != v9)
      {
        uint64_t v8 = v6 - 1;
        goto LABEL_8;
      }
    }

    uint64_t v6 = 2LL;
LABEL_8:
    else {
      uint64_t v10 = v8;
    }
  }

  v25[0] = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v12 = ccder_sizeof();
    __int128 v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      __int128 v14 = v13;
      uint64_t v15 = v10;
      do
      {
        *((_BYTE *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }

      while (v15);
      char v23 = &v13[v12];
      int v16 = ccder_blob_encode_body();
      __int128 v17 = v23;
      if (!v16) {
        __int128 v17 = 0LL;
      }
      __int128 v24 = v17;
      int v18 = ccder_blob_encode_tl();
      unint64_t v19 = v24;
      if (!v18) {
        unint64_t v19 = 0LL;
      }
      BOOL v20 = v19 && v19 == v14;
      if (v20 && (int v21 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        uint64_t v22 = v21;
        uint64_t result = 0LL;
        v22[1] = v14;
        void v22[2] = v12;
        *uint64_t v22 = *a1;
        *a1 = v22;
      }

      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_188737BA0(void *a1, uint64_t a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    strlen(__s);
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    uint64_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v15 = &v6[v5];
      int v8 = ccder_blob_encode_body();
      uint64_t v9 = v15;
      if (!v8) {
        uint64_t v9 = 0LL;
      }
      int v16 = v9;
      int v10 = ccder_blob_encode_tl();
      BOOL v11 = v16;
      if (!v10) {
        BOOL v11 = 0LL;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (__int128 v13 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        __int128 v14 = v13;
        uint64_t result = 0LL;
        v14[1] = v7;
        _OWORD v14[2] = v5;
        *__int128 v14 = *a1;
        *a1 = v14;
      }

      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_188737D14(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0LL;
  int __s = 0LL;
  rsize_t __n = 0LL;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    size_t v5 = 0LL;
    if (a3)
    {
      if (sub_188737290(a3, &__s, &__n))
      {
        uint64_t v3 = 0LL;
        size_t v5 = 0LL;
      }

      else
      {
        size_t v5 = ccder_sizeof();
        uint64_t v7 = (char *)calloc(v5, 1uLL);
        uint64_t v3 = v7;
        if (v7)
        {
          uint64_t v15 = &v7[v5];
          int v18 = v3;
          unint64_t v19 = v15;
          int v8 = ccder_blob_encode_body();
          uint64_t v9 = v19;
          if (!v8) {
            uint64_t v9 = 0LL;
          }
          int v18 = v3;
          unint64_t v19 = v9;
          int v10 = ccder_blob_encode_tl();
          BOOL v11 = v19;
          if (!v10) {
            BOOL v11 = 0LL;
          }
          BOOL v12 = v11 && v11 == v3;
          if (v12 && (__int128 v13 = calloc(0x18uLL, 1uLL)) != 0LL)
          {
            uint64_t v4 = 0LL;
            v13[1] = v3;
            size_t v13[2] = v5;
            *__int128 v13 = *a1;
            *a1 = v13;
            uint64_t v3 = 0LL;
          }

          else
          {
LABEL_23:
            uint64_t v4 = 0xFFFFFFFFLL;
          }
        }

        else
        {
          uint64_t v4 = 4294967279LL;
        }
      }
    }
  }

  else
  {
    size_t v5 = 0LL;
  }

  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }

  if (v3)
  {
    memset_s(v3, v5, 0, v5);
    free(v3);
  }

  return v4;
}

BOOL sub_188737EB0(void *a1)
{
  return *a1 == 0LL;
}

uint64_t sub_188737EC0()
{
  return ccder_sizeof();
}

uint64_t sub_188737ED8()
{
  uint64_t v0 = ccder_sizeof();
  return ccder_sizeof() + v0;
}

uint64_t sub_188737F1C(__int128 *a1, uint64_t a2)
{
  __int128 v4 = *a1;
  if (a2)
  {
    uint64_t result = ccder_blob_encode_body_tl();
    if (!(_DWORD)result) {
      return result;
    }
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0LL;
    }
  }

  else if (!ccder_blob_encode_body_tl() || (ccder_blob_encode_tl() & 1) == 0)
  {
    return 0LL;
  }

  *a1 = v4;
  return 1LL;
}

uint64_t sub_188737FC4(__int128 *a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 20);
  __int128 v11 = *a1;
  if (a2)
  {
    __int128 v14 = *a1;
    BOOL v12 = 0LL;
    uint64_t v13 = 0LL;
    if ((ccder_blob_decode_range() & 1) == 0) {
      return 0LL;
    }
    uint64_t v6 = (uint64_t)v12;
    unsigned int v8 = v13 - (_DWORD)v12;
    __int128 v11 = v14;
  }

  else
  {
    LODWORD(v14) = v5;
    uint64_t result = sub_1887380C8(&v11, 4LL, v6, &v14);
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v8 = v14;
  }

  __int128 v14 = v11;
  BOOL v12 = 0LL;
  uint64_t v13 = 0LL;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0LL;
  }
  __int128 v11 = v14;
  int v10 = *v12;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1LL;
}

uint64_t sub_1887380C8(__int128 *a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  __int128 v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0LL;
  }
  if (a3)
  {
    if (a4) {
      *a4 = 0;
    }
  }

  *a1 = v8;
  return 1LL;
}

uint64_t sub_188738160(__int128 *a1, uint64_t a2)
{
  __int128 v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!(_DWORD)result) {
      return result;
    }
  }

  *a1 = v4;
  return 1LL;
}

uint64_t sub_1887381CC(__int128 *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v5 = a3[1];
  __int128 v9 = *a1;
  if (a2)
  {
    __int128 v12 = *a1;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t result = ccder_blob_decode_range();
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v6 = v10;
    unsigned int v8 = v11 - v10;
    __int128 v9 = v12;
  }

  else
  {
    LODWORD(v12) = v5;
    uint64_t result = sub_1887380C8(&v9, 4LL, v6, &v12);
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v8 = v12;
  }

  *a3 = v6;
  a3[1] = v8;
  *a1 = v9;
  return 1LL;
}

uint64_t sub_188738278(__int128 *a1, uint64_t a2)
{
  __int128 v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl() & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = ccder_blob_encode_tl();
    if (!(_DWORD)result) {
      return result;
    }
  }

  *a1 = v4;
  return 1LL;
}

uint64_t sub_1887382E8(__int128 *a1)
{
  __int128 v3 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0LL;
  }
  *a1 = v3;
  return 1LL;
}

uint64_t sub_188738368(unsigned int *a1, int a2, void *a3, _DWORD *a4)
{
  __int128 v12 = 0LL;
  if (sub_18873798C(&v12, (uint64_t)off_18C723F80, *a1)
    || sub_18873798C(&v12, (uint64_t)off_18C723F88, a1[1])
    || sub_18873798C(&v12, (uint64_t)off_18C723F90, *((void *)a1 + 1))
    || sub_18873798C(&v12, (uint64_t)off_18C723FA0, a1[4])
    || sub_18873798C(&v12, (uint64_t)off_18C723FB0, a1[5])
    || sub_18873798C(&v12, (uint64_t)off_18C723FC8, *(void *)((char *)a1 + 26))
    || sub_18873798C(&v12, (uint64_t)off_18C723FD0, *(void *)((char *)a1 + 34))
    || sub_18873798C(&v12, (uint64_t)off_18C723CD8, *(int *)((char *)a1 + 42))
    || sub_18873798C(&v12, (uint64_t)off_18C723EA0, *(unsigned int *)((char *)a1 + 46))
    || sub_1887375D0(&v12, (uint64_t)off_18C724098, (uint64_t)a1 + 50)
    || a2
    && (sub_18873798C(&v12, (uint64_t)off_18C723FB8, *((char *)a1 + 66))
     || sub_18873798C(&v12, (uint64_t)off_18C723FC0, *((char *)a1 + 67))
     || sub_18873798C(&v12, (uint64_t)off_18C724298, *(void *)(a1 + 17))
     || sub_18873798C(&v12, (uint64_t)off_18C7242E0, *(void *)(a1 + 19)))
    || (uint64_t v10 = 0LL, v11 = 0LL, sub_188737290(&v12, &v10, &v11)))
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v8 = 0LL;
    *a3 = v10;
    *a4 = v11;
  }

  sub_188736BC0(&v12);
  return v8;
}

uint64_t sub_188738574(uint64_t a1, int a2, char *__s)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v7, 0x228uLL);
      v7[4] = off_18C723F88;
      v7[9] = off_18C723F90;
      v7[14] = off_18C723FA0;
      v7[19] = off_18C723FB0;
      v7[24] = off_18C723FB8;
      v7[29] = off_18C723FC0;
      v7[34] = off_18C723FC8;
      v7[39] = off_18C723FD0;
      v7[44] = off_18C723CD8;
      v7[49] = off_18C723EA0;
      v7[54] = off_18C724098;
      __int128 v9 = off_18C724298;
      uint64_t v10 = off_18C7242E0;
      sub_1887366B4();
      *(_DWORD *)int __s = sub_1887368CC();
      *((_DWORD *)__s + 1) = sub_1887368CC();
      *((void *)__s + 1) = sub_1887368CC();
      *((_DWORD *)__s + 4) = sub_1887368CC();
      *((_DWORD *)__s + 5) = sub_1887368CC();
      *(void *)(__s + 26) = sub_1887368CC();
      *(void *)(__s + 34) = sub_1887368CC();
      *(_DWORD *)(__s + 42) = sub_1887368CC();
      *(_DWORD *)(__s + 46) = sub_1887368CC();
      sub_188736E28(&v8, 4LL, (uint64_t)(__s + 50), 16);
      __s[66] = sub_1887368CC();
      __s[67] = sub_1887368CC();
      *(void *)(__s + 68) = sub_1887368CC();
      uint64_t v6 = sub_1887368CC();
      uint64_t result = 0LL;
      *(void *)(__s + 76) = v6;
    }
  }

  return result;
}

uint64_t sub_1887387D8(uint64_t a1, int a2, _BYTE *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_1887366B4())
    {
      void *__s = sub_1887368CC();
      *((_DWORD *)__s + 1) = sub_1887368CC();
      *((_DWORD *)__s + 2) = sub_1887368CC();
      int v6 = sub_1887368CC();
      uint64_t result = 0LL;
      *((_DWORD *)__s + 3) = v6;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_18873893C(uint64_t a1, int a2, void *__s, void *a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    uint64_t v12 = 0LL;
    v10[0] = 0u;
    __int128 v11 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v10[1] = (unint64_t)off_18C724240;
    uint64_t v13 = off_18C723D78;
    sub_1887366B4();
    if (sub_188736E28(v10, 4LL, (uint64_t)__s, 16)
      && sub_188736E28((__int128 *)((char *)&v11 + 8), 4LL, (uint64_t)a4, 16))
    {
      return sub_188736E28(&v15, 4LL, a5, 16) - 1;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_188738AB8(uint64_t a1, uint64_t a2, _DWORD *__s)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    __int128 v24 = 0u;
    uint64_t v26 = 0LL;
    __int128 v27 = 0u;
    uint64_t v28 = 0LL;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v33 = 0LL;
    __int128 v34 = 0u;
    uint64_t v35 = 0LL;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v40 = 0LL;
    __int128 v41 = 0u;
    uint64_t v42 = 0LL;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v8 = 0u;
    uint64_t v9 = 0LL;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v15 = 0LL;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v21 = 0LL;
    __int128 v23 = 0u;
    uint64_t v10 = off_18C723D58;
    *(void *)&__int128 v13 = off_18C723D50;
    uint64_t v16 = off_18C723D70;
    *(void *)&__int128 v19 = off_18C723FF8;
    uint64_t v22 = off_18C723FA0;
    uint64_t v25 = off_18C723FA8;
    int v29 = off_18C723EA0;
    __int128 v32 = off_18C723F90;
    uint64_t v36 = off_18C723F98;
    uint64_t v39 = off_18C724158;
    uint64_t v43 = off_18C7241C0;
    sub_1887366B4();
    void *__s = sub_1887368CC();
    if (sub_188736E28((__int128 *)((char *)&v8 + 8), 4LL, (uint64_t)(__s + 1), 16)
      && sub_188736E28(&v12, 4LL, (uint64_t)(__s + 5), 16)
      && (__s[9] = sub_1887368CC(),
          __s[10] = sub_1887368CC(),
          __s[11] = sub_1887368CC(),
          __s[12] = sub_1887368CC(),
          __s[15] = sub_1887368CC(),
          __s[13] = sub_1887368CC(),
          __s[14] = sub_1887368CC(),
          sub_188738D9C((__int128 *)((char *)&v20 + 8))))
    {
      int v6 = __s[9];
      if ((v6 & 0x400) != 0)
      {
        *((void *)__s + 9) = sub_1887368CC();
        int v6 = __s[9];
      }

      if ((v6 & 0x800) != 0)
      {
        int v7 = sub_1887368CC();
        uint64_t result = 0LL;
        __s[20] = v7;
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_188738D9C(__int128 *a1)
{
  __int128 v4 = *a1;
  uint64_t v2 = ccder_blob_decode_range();
  if ((v2 & 1) != 0) {
    *a1 = v4;
  }
  return v2;
}

uint64_t sub_188738E20(int *a1, void *a2, _DWORD *a3)
{
  __int128 v11 = 0LL;
  uint64_t v3 = 4294967273LL;
  if (a2 && a3)
  {
    if (a1 && (int v7 = *a1) != 0)
    {
      if ((v7 & 1) != 0)
      {
        sub_18873773C(&v11, "persona_uuid", (uint64_t)(a1 + 1));
        int v7 = *a1;
      }

      if ((v7 & 2) != 0) {
        sub_18873773C(&v11, "volume_uuid", (uint64_t)(a1 + 5));
      }
      uint64_t v9 = 0LL;
      size_t v10 = 0LL;
      if (!sub_188737290(&v11, &v9, &v10))
      {
        uint64_t v3 = 0LL;
        *a2 = v9;
        *a3 = v10;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      *a2 = 0LL;
      *a3 = 0;
    }
  }

  sub_188736BC0(&v11);
  return v3;
}

uint64_t sub_188738EF4(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0LL;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (sub_1887366B4())
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }

  sub_188736BC0(&v6);
  return v3;
}

uint64_t sub_188738FD4(uint64_t a1, void *a2, _DWORD *a3)
{
  size_t v10 = 0LL;
  uint64_t v3 = 4294967273LL;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!sub_18873773C(&v10, "options", a1) && !sub_18873773C(&v10, "kc", a1 + 8))
      {
        uint64_t v8 = 0LL;
        size_t v9 = 0LL;
        if (!sub_188737290(&v10, &v8, &v9))
        {
          uint64_t v3 = 0LL;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      *a2 = 0LL;
      *a3 = 0;
    }
  }

  sub_188736BC0(&v10);
  return v3;
}

uint64_t sub_18873909C(uint64_t a1, uint64_t a2, char *__s)
{
  int v6 = 0LL;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_1887366B4())
    {
      sub_188736EB4(&v6, "options", __s, 8uLL);
      sub_188736EB4(&v6, "kc", __s + 8, 4uLL);
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }

  sub_188736BC0(&v6);
  return v3;
}

uint64_t sub_18873915C(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    if (off_18C723CD0) {
      sub_1887366B4();
    }
    return 0LL;
  }

  return result;
}

uint64_t sub_188739540(__int128 *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  __int128 v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0) {
    return 0LL;
  }
  if (a3 && a4)
  {
    uint64_t result = (uint64_t)calloc(0LL, 1uLL);
    if (!result) {
      return result;
    }
    *a3 = result;
    *a4 = 0;
  }

  *a1 = v8;
  return 1LL;
}

uint64_t sub_1887395F8(__int128 *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0LL;
  }
  __int128 v6 = *a1;
  uint64_t result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccn_read_uint())
    {
      return 0LL;
    }

    else
    {
      *a1 = v6;
      if (a3) {
        *a3 = 0LL;
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_188739680(const void **a1, void **a2)
{
  uint64_t v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293LL;
  }

  int v2 = memcmp(v5, __s2, 0LL);
  if (v2 > 0) {
    return 1LL;
  }
  else {
    return ((v2 < 0) << 31 >> 31);
  }
}

uint64_t sub_1887397A8()
{
  sub_188735A58( &off_18A272A60 != 0LL,  36,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284LL;
}

uint64_t sub_1887398B4()
{
  sub_188735A58( &off_18A272A60 != 0LL,  62,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58( sub_188726094 != 0LL,  63,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_188726094();
}

uint64_t sub_188739910(uint64_t a1, unsigned int a2)
{
  sub_188735A58( &off_18A272A60 != 0LL,  70,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58( sub_188726100 != 0LL,  71,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_188726100(a1, a2);
}

uint64_t sub_188739984( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_188735A58( &off_18A272A60 != 0LL,  78,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_188739A40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_188735A58( &off_18A272A60 != 0LL,  86,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_188739B04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_188735A58( &off_18A272A60 != 0LL,  94,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_188739BC8( unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_188735A58( &off_18A272A60 != 0LL,  106,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_188739C94( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  sub_188735A58( &off_18A272A60 != 0LL,  115,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_188739D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_188735A58( &off_18A272A60 != 0LL,  123,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t sub_188739DFC()
{
  sub_188735A58( &off_18A272A60 != 0LL,  131,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0]();
}

uint64_t sub_188739E58(uint64_t a1, uint64_t a2)
{
  sub_188735A58( &off_18A272A60 != 0LL,  139,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2);
}

uint64_t sub_188739ECC(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  147,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_188739F38(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  155,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_188739FA4(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  163,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_18873A010(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  171,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_18873A07C(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  179,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_18873A0E8(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  187,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_18873A154(uint64_t a1)
{
  sub_188735A58( &off_18A272A60 != 0LL,  195,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_188735A58(0LL, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_18873A1C0(int a1)
{
  return -a1 & 3;
}

char *sub_18873A1CC(_DWORD *a1, const void *a2, int a3)
{
  uint64_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }

  else
  {
    *a1 = 0;
  }

  return v3;
}

char *sub_18873A250( char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      __int128 v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }

    while (v13);
  }

  uint64_t result = (char *)calloc(1uLL, v12);
  uint64_t v16 = result;
  uint64_t v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4LL;
    do
    {
      __int128 v19 = v22;
      __int128 v20 = *v22;
      v22 += 2;
      uint64_t result = sub_18873A1CC(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }

    while (a3 != v17);
  }

  *(_DWORD *)uint64_t v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t sub_18873A32C( unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 < 4) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = a3;
  if (*a1 >= a3)
  {
    __int128 v19 = (void **)&a9;
    if (!a3) {
      return 0LL;
    }
    __int128 v11 = (char *)(a1 + 1);
    while (1)
    {
      unsigned int v12 = v19;
      int v13 = *v19;
      v19 += 2;
      unsigned int v16 = *(_DWORD *)v11;
      __int128 v14 = v11 + 4;
      size_t v15 = v16;
      if (v16 > a2) {
        break;
      }
      if (v13)
      {
        int v17 = (size_t *)v12[1];
        if (*v17 < v15) {
          return 0xFFFFFFFFLL;
        }
        memcpy(v13, v14, v15);
        *int v17 = v15;
      }

      __int128 v11 = &v14[v15];
      if (!--v9) {
        return 0LL;
      }
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x1895F8220]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x189603588]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallStructMethod( mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CC8]( *(void *)&connection,  *(void *)&selector,  inputStruct,  inputStructCnt,  outputStruct,  outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort( io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x189607CF8](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x189608318](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x189613710]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

void NSLog(NSString *format, ...)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895F9750]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1895F9758]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1895F9760]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x1895F97D0]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x1895F97D8]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x1895F97E0]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x1895F97F0]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x1895F9868]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1895F9880]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x1895F98C0]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x1895F98D0]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x1895F98D8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1895F98E0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1895F98E8]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x1895F98F8]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1895F9900]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x1895F9908]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x1895F9910]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1895F9918]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x1895F9960]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1895F9970]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1895F9990]();
}

uint64_t ccder_encode_raw_octet_string()
{
  return MEMORY[0x1895F99A8]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x1895F99C8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1895F99D0]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x1895F99E0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x1895F9A00]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x1895F9A10]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1895F9B68]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1895F9BA8]();
}

uint64_t ccecb_one_shot()
{
  return MEMORY[0x1895F9C88]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1895F9F08]();
}

uint64_t cchmac()
{
  return MEMORY[0x1895F9F20]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1895FA098]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1895FA0D0]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1895FA0F8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FA4B8]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1895FB4A8](a1, a2, *(void *)&a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1895FCB88](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int sched_yield(void)
{
  return MEMORY[0x1895FCE08]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}