double sub_100004170(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  double result;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = sub_100004288(a2);
  v5 = malloc(104 * v4 + 208);
  *(void *)(a1 + 16) = v5;
  v5[4] = unk_100020490;
  v5[5] = unk_1000204A0;
  *((void *)v5 + 12) = 0LL;
  *v5 = unk_100020450;
  v5[1] = unk_100020460;
  v5[2] = xmmword_100020470;
  v5[3] = unk_100020480;
  if (!v4)
  {
    v7 = 1LL;
    goto LABEL_10;
  }

  v6 = 0LL;
  v7 = 1LL;
  do
  {
    v8 = *(void *)(a2 + 16);
    if (*(_BYTE *)(v8 + v6 + 80))
    {
      v8 = *(void *)(a2 + 16);
    }

    v9 = *(void *)(a1 + 16) + 104 * v7++;
    v10 = (__int128 *)(v8 + v6);
    v11 = *v10;
    v12 = v10[2];
    *(_OWORD *)(v9 + 16) = v10[1];
    *(_OWORD *)(v9 + 32) = v12;
    *(_OWORD *)v9 = v11;
    v13 = v10[3];
    v14 = v10[4];
    v15 = v10[5];
    *(void *)(v9 + 96) = *((void *)v10 + 12);
    *(_OWORD *)(v9 + 64) = v14;
    *(_OWORD *)(v9 + 80) = v15;
    *(_OWORD *)(v9 + 48) = v13;
LABEL_7:
    v6 += 104LL;
    --v4;
  }

  while (v4);
  v5 = *(_OWORD **)(a1 + 16);
LABEL_10:
  v16 = (char *)v5 + 104 * v7;
  *((void *)v16 + 12) = 0LL;
  result = 0.0;
  *((_OWORD *)v16 + 4) = 0u;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  return result;
}

uint64_t sub_100004288(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  v1 = *(char **)(a1 + 16);
  uint64_t v5 = 0LL;
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = 0LL;
  if (v1)
  {
    do
    {
      if (!memcmp(v1, v4, 0x68uLL)) {
        break;
      }
      ++v2;
      v1 += 104;
    }

    while (v2 != 1024);
  }

  return v2;
}

uint64_t sub_1000042FC(uint64_t result)
{
  if (!result) {
    return result;
  }
  memset(v36, 170, sizeof(v36));
  sub_100004170((uint64_t)v36, result);
  uint64_t v1 = sub_100004288((uint64_t)v36);
  uint64_t v2 = (const char *)v36[0];
  if (!v36[0]) {
    uint64_t v2 = "command";
  }
  printf("usage: %s", v2);
  if (v1)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = v1;
    while (!*(_BYTE *)(v36[2] + v3))
    {
LABEL_17:
      v3 += 104LL;
      if (!--v4)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = v1;
        while (2)
        {
          if (!*(void *)(v36[2] + v7 + 8) || *(_BYTE *)(v36[2] + v7)) {
            goto LABEL_31;
          }
          printf(" [--%s", *(const char **)(v36[2] + v7 + 8));
          if (v36[2])
          {
            uint64_t v9 = *(void *)(v36[2] + v7 + 48);
            if (*(void *)(v36[2] + v7 + 56))
            {
              if (!v9) {
                goto LABEL_30;
              }
LABEL_27:
              v10 = *(const char **)(v36[2] + v7 + 40);
              if (!v10) {
                v10 = "arg";
              }
              printf(" %s", v10);
            }

            else if (v9 || *(void *)(v36[2] + v7 + 88))
            {
              goto LABEL_27;
            }
          }

LABEL_30:
          putchar(93);
LABEL_31:
          v7 += 104LL;
          if (!--v8)
          {
            uint64_t v11 = 16LL;
            uint64_t v12 = v1;
            do
            {
              if (*(void *)(v36[2] + v11)) {
                printf(" [%s]", *(const char **)(v36[2] + v11));
              }
              v11 += 104LL;
              --v12;
            }

            while (v12);
            uint64_t v13 = 0LL;
            uint64_t v14 = v1;
            do
            {
              if (*(void *)(v36[2] + v13 + 24))
              {
                if (*(_BYTE *)(v36[2] + v13 + 32)) {
                  printf(" [<%s>]");
                }
                else {
                  printf(" <%s>");
                }
              }

              v13 += 104LL;
              --v14;
            }

            while (v14);
            goto LABEL_42;
          }

          continue;
        }
      }
    }

    printf(" [-%c", *(char *)(v36[2] + v3));
    if (v36[2])
    {
      uint64_t v5 = *(void *)(v36[2] + v3 + 48);
      if (*(void *)(v36[2] + v3 + 56))
      {
        if (!v5) {
          goto LABEL_16;
        }
      }

      else if (!v5 && !*(void *)(v36[2] + v3 + 88))
      {
        goto LABEL_16;
      }

      v6 = *(const char **)(v36[2] + v3 + 40);
      if (!v6) {
        v6 = "arg";
      }
      printf(" %s", v6);
    }

  syncingPolicy = self->_syncingPolicy;
  if (syncingPolicy) {
    [v4 setObject:syncingPolicy forKey:@"syncingPolicy"];
  }
  voucher = self->_voucher;
  if (voucher) {
    [v4 setObject:voucher forKey:@"voucher"];
  }
  voucherSignature = self->_voucherSignature;
  if (voucherSignature) {
    [v4 setObject:voucherSignature forKey:@"voucherSignature"];
  }
  tlkSharesForVouchedIdentitys = self->_tlkSharesForVouchedIdentitys;
  if (tlkSharesForVouchedIdentitys) {
    [v4 setObject:tlkSharesForVouchedIdentitys forKey:@"tlkSharesForVouchedIdentity"];
  }
  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity) {
    [v4 setObject:secureElementIdentity forKey:@"secureElementIdentity"];
  }
  uint64_t v24 = (__int16)self->_has;
  if ((v24 & 0x80) != 0)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isInheritedAccount));
    [v4 setObject:v25 forKey:@"isInheritedAccount"];

    uint64_t v24 = (__int16)self->_has;
    if ((v24 & 0x100) == 0)
    {
LABEL_42:
      if ((v24 & 0x200) == 0) {
        goto LABEL_43;
      }
LABEL_47:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_warnedTooManyPeers));
      [v4 setObject:v27 forKey:@"warnedTooManyPeers"];

      if ((*(_WORD *)&self->_has & 0x20) == 0) {
        goto LABEL_52;
      }
LABEL_48:
      sendingMetricsPermitted = self->_sendingMetricsPermitted;
      if (sendingMetricsPermitted >= 3) {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_sendingMetricsPermitted));
      }
      else {
        uint64_t v29 = *(&off_100020820 + sendingMetricsPermitted);
      }
      [v4 setObject:v29 forKey:@"sendingMetricsPermitted"];

      goto LABEL_52;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_42;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_warmedEscrowCache));
  [v4 setObject:v26 forKey:@"warmedEscrowCache"];

  uint64_t v24 = (__int16)self->_has;
  if ((v24 & 0x200) != 0) {
    goto LABEL_47;
  }
LABEL_43:
  if ((v24 & 0x20) != 0) {
    goto LABEL_48;
  }
LABEL_52:
  oldPeerID = self->_oldPeerID;
  if (oldPeerID) {
    [v4 setObject:oldPeerID forKey:@"oldPeerID"];
  }
  return v4;
}

LABEL_16:
    putchar(93);
    goto LABEL_17;
  }

LABEL_42:
  putchar(10);
  if (v36[1]) {
    printf("\n%s\n", (const char *)v36[1]);
  }
  puts("\npositional arguments:");
  if (!v1)
  {
    puts("\noptional arguments:");
    puts("\noptional commands:");
    return putchar(10);
  }

  uint64_t v15 = 0LL;
  uint64_t v16 = v1;
  do
  {
    if (*(void *)(v36[2] + v15 + 24)) {
      printf("  %-31s %s\n", *(const char **)(v36[2] + v15 + 24), *(const char **)(v36[2] + v15 + 72));
    }
    v15 += 104LL;
    --v16;
  }

  while (v16);
  puts("\noptional arguments:");
  uint64_t v17 = 88LL;
  uint64_t v18 = v1;
  do
  {
    if (!*(_BYTE *)(v36[2] + v17 - 88)) {
      goto LABEL_80;
    }
    if (*(void *)(v36[2] + v17 - 80))
    {
      printf("  -%c", *(char *)(v36[2] + v17 - 88));
      uint64_t v19 = v36[2];
      uint64_t v20 = *(void *)(v36[2] + v17 - 40);
      if (*(void *)(v36[2] + v17 - 32))
      {
        if (!v20) {
          goto LABEL_63;
        }
      }

      else if (!v20 && !*(void *)(v36[2] + v17))
      {
        goto LABEL_63;
      }

      v22 = *(const char **)(v36[2] + v17 - 48);
      if (!v22) {
        v22 = "arg";
      }
      printf(" %s", v22);
      uint64_t v19 = v36[2];
LABEL_63:
      uint64_t v23 = v19 + v17;
      if (*(void *)(v19 + v17 - 80))
      {
        uint64_t v25 = v23 - 40;
        uint64_t v24 = *(void *)(v23 - 40);
        if (*(void *)(v25 + 8))
        {
          if (v24) {
            goto LABEL_72;
          }
        }

        else if (v24 || *(void *)(v19 + v17))
        {
LABEL_72:
          strlen(*(const char **)(v19 + v17 - 80));
          if (*(void *)(v19 + v17 - 48)) {
            v27 = *(const char **)(v19 + v17 - 48);
          }
          else {
            v27 = "arg";
          }
          strlen(v27);
          printf(", --%s %-*s");
          goto LABEL_79;
        }

        if (*(void *)(v19 + v17 - 48)) {
          v26 = *(const char **)(v19 + v17 - 48);
        }
        else {
          v26 = "arg";
        }
        strlen(v26);
        printf(", --%-*s");
      }

      goto LABEL_79;
    }

    uint64_t v21 = *(void *)(v36[2] + v17 - 40);
    if (*(void *)(v36[2] + v17 - 32))
    {
      if (v21) {
        goto LABEL_78;
      }
    }

    else if (v21 || *(void *)(v36[2] + v17))
    {
LABEL_78:
      printf("  -%c %-*s");
      goto LABEL_79;
    }

    printf("  -%-30c");
LABEL_79:
    puts(*(const char **)(v36[2] + v17 - 16));
LABEL_80:
    v17 += 104LL;
    --v18;
  }

  while (v18);
  uint64_t v28 = v1;
  while (2)
  {
    if (*(void *)(v36[2] + v18 + 8) && !*(_BYTE *)(v36[2] + v18))
    {
      uint64_t v29 = *(void *)(v36[2] + v18 + 48);
      if (*(void *)(v36[2] + v18 + 56))
      {
        if (!v29) {
          goto LABEL_86;
        }
LABEL_89:
        memset(v46, 170, 22);
        *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v44 = v30;
        __int128 v42 = v30;
        __int128 v43 = v30;
        __int128 v40 = v30;
        __int128 v41 = v30;
        __int128 v38 = v30;
        __int128 v39 = v30;
        *(_OWORD *)v37 = v30;
        uint64_t v31 = *(void *)(v36[2] + v18 + 88);
        v32 = *(const char **)(v36[2] + v18 + 40);
        if (!v32) {
          v32 = "arg";
        }
        if (v31) {
          v33 = "%s %s...";
        }
        else {
          v33 = "%s %s";
        }
        if (v31) {
          v34 = "%s [repeatable]";
        }
        else {
          v34 = "%s";
        }
        snprintf(__str, 0x1EuLL, v33, *(void *)(v36[2] + v18 + 8), v32);
        snprintf(v37, 0x80uLL, v34, *(void *)(v36[2] + v18 + 72));
        printf("  --%-28s %s\n", __str, v37);
      }

      else
      {
        if (v29 || *(void *)(v36[2] + v18 + 88)) {
          goto LABEL_89;
        }
LABEL_86:
        printf("  --%-28s %s\n", *(const char **)(v36[2] + v18 + 8), *(const char **)(v36[2] + v18 + 72));
      }
    }

    v18 += 104LL;
    if (--v28) {
      continue;
    }
    break;
  }

  puts("\noptional commands:");
  uint64_t v35 = 0LL;
  do
  {
    if (*(void *)(v36[2] + v35 + 16)) {
      printf("  %-30s %s\n", *(const char **)(v36[2] + v35 + 16), *(const char **)(v36[2] + v35 + 72));
    }
    v35 += 104LL;
    --v1;
  }

  while (v1);
  return putchar(10);
}

char **sub_1000048C4(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(_DWORD **)(a1 + 56);
  if (v4) {
    *uint64_t v4 = *(_DWORD *)(a1 + 64);
  }
  result = *(char ***)(a1 + 48);
  if (result) {
    result = (char **)asprintf(result, "%.1048576s", a2);
  }
  v6 = *(void ***)(a1 + 88);
  if (v6)
  {
    uint64_t v7 = **(void **)(a1 + 96);
    **(void **)(a1 + 88) = realloc(*v6, 8 * (v7 + 1));
    result = (char **)asprintf((char **)(**(void **)(a1 + 88) + 8 * v7), "%.1048576s", a2);
    **(void **)(a1 + 96) = v7 + 1;
  }

  return result;
}

uint64_t start(int a1, char *const *a2)
{
  uint64_t v186 = 0LL;
  uint64_t v185 = 0LL;
  uint64_t v184 = 0LL;
  uint64_t v183 = 0LL;
  uint64_t v182 = 0LL;
  uint64_t v181 = 0LL;
  uint64_t v180 = 0LL;
  uint64_t v179 = 0LL;
  uint64_t v178 = 0LL;
  uint64_t v177 = 0LL;
  uint64_t v176 = 0LL;
  uint64_t v175 = 0LL;
  uint64_t v174 = 0LL;
  uint64_t v173 = 0LL;
  uint64_t v172 = 0LL;
  uint64_t v170 = 0LL;
  uint64_t v171 = 0LL;
  uint64_t v168 = 0LL;
  uint64_t v169 = 0LL;
  uint64_t v166 = 0LL;
  uint64_t v167 = 0LL;
  uint64_t v164 = 0LL;
  uint64_t v165 = 0LL;
  uint64_t v162 = 0LL;
  uint64_t v163 = 0LL;
  uint64_t v161 = 0LL;
  int v160 = 0;
  uint64_t v158 = 0LL;
  uint64_t v159 = 0LL;
  uint64_t v156 = 0LL;
  uint64_t v157 = 0LL;
  uint64_t v154 = 0LL;
  uint64_t v155 = 0LL;
  uint64_t v152 = 0LL;
  uint64_t v153 = 0LL;
  uint64_t v150 = 0LL;
  uint64_t v151 = 0LL;
  uint64_t v149 = 0LL;
  int v148 = 0;
  uint64_t v146 = 0LL;
  uint64_t v147 = 0LL;
  uint64_t v144 = 0LL;
  v145 = 0LL;
  uint64_t v142 = 0LL;
  uint64_t v143 = 0LL;
  uint64_t v140 = 0LL;
  uint64_t v141 = 0LL;
  uint64_t v138 = 0LL;
  uint64_t v139 = 0LL;
  uint64_t v136 = 0LL;
  uint64_t v137 = 0LL;
  uint64_t v134 = 0LL;
  uint64_t v135 = 0LL;
  int v133 = 0;
  memset(v222, 170, sizeof(v222));
  v196[0] = 115LL;
  __int128 v197 = 0u;
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  uint64_t v200 = 0LL;
  __int128 v202 = 0u;
  v196[1] = "secret";
  *(void *)&__int128 v199 = &v157;
  v201 = "escrow secret";
  uint64_t v204 = 101LL;
  __int128 v208 = 0u;
  uint64_t v209 = 0LL;
  __int128 v206 = 0u;
  __int128 v207 = 0u;
  __int128 v211 = 0u;
  uint64_t v203 = 0LL;
  uint64_t v212 = 0LL;
  v205 = "bottleID";
  *(void *)&__int128 v208 = &v159;
  v210 = "bottle record id";
  uint64_t v221 = 0LL;
  uint64_t v218 = 0LL;
  __int128 v220 = 0u;
  __int128 v216 = 0u;
  __int128 v217 = 0u;
  uint64_t v213 = 114LL;
  __int128 v215 = 0u;
  v214 = "skipRateLimiting";
  *(void *)&__int128 v217 = &v156;
  v219 = " enter values YES or NO, option defaults to NO, This gives you the opportunity to skip the rate limiting check "
         "when performing the cuttlefish health check";
  LOBYTE(v222[0]) = 106;
  *((void *)&v222[0] + 1) = "json";
  memset(&v222[1], 0, 17);
  *(_OWORD *)((char *)&v222[2] + 8) = 0u;
  *((void *)&v222[3] + 1) = (char *)&v150 + 4;
  LODWORD(v222[4]) = 1;
  *((void *)&v222[4] + 1) = "Output in JSON";
  LOBYTE(v222[5]) = 0;
  *(_OWORD *)((char *)&v222[5] + 8) = 0u;
  BYTE8(v222[6]) = 105;
  *(void *)&v222[7] = "recordID";
  BYTE8(v222[8]) = 0;
  *(_OWORD *)((char *)&v222[7] + 8) = 0u;
  *(void *)&v222[9] = 0LL;
  *((void *)&v222[9] + 1) = &v155;
  *(void *)&v222[10] = 0LL;
  DWORD2(v222[10]) = 1;
  *(void *)&v222[11] = "recordID";
  BYTE8(v222[11]) = 0;
  memset(&v222[18], 0, 24);
  memset(&v222[16], 0, 24);
  memset(&v222[14], 0, 32);
  *(void *)&v222[13] = 111LL;
  v222[12] = 0u;
  *((void *)&v222[13] + 1) = "overrideForAccountScript";
  *(void *)&v222[16] = &v154;
  *((void *)&v222[17] + 1) = " enter values YES or NO, option defaults to NO, This flag is only meant for the setup acc"
                               "ount for icloud cdp signin script";
  *((void *)&v222[25] + 1) = 0LL;
  *((void *)&v222[23] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[24] + 8) = 0u;
  *(_OWORD *)((char *)&v222[21] + 8) = 0u;
  *(_OWORD *)((char *)&v222[22] + 8) = 0u;
  *((void *)&v222[19] + 1) = 99LL;
  *(_OWORD *)((char *)&v222[20] + 8) = 0u;
  *(void *)&v222[20] = "overrideEscrowCache";
  *((void *)&v222[22] + 1) = &v153;
  *(void *)&v222[24] = " enter values YES or NO, option defaults to NO, include this if you want to force an escrow rec"
                         "ord fetch from cuttlefish for the freshest of escrow records";
  LOBYTE(v222[26]) = 69;
  *((void *)&v222[26] + 1) = "enable";
  memset(&v222[27], 0, 17);
  *(_OWORD *)((char *)&v222[28] + 8) = 0u;
  *((void *)&v222[29] + 1) = (char *)&v151 + 4;
  LODWORD(v222[30]) = 1;
  *((void *)&v222[30] + 1) = "Enable something (pair with a modification command)";
  LOBYTE(v222[31]) = 0;
  *(_OWORD *)((char *)&v222[31] + 8) = 0u;
  BYTE8(v222[32]) = 80;
  *(void *)&v222[33] = "pause";
  BYTE8(v222[34]) = 0;
  *(_OWORD *)((char *)&v222[33] + 8) = 0u;
  v222[35] = 0u;
  *(void *)&v222[36] = &v151;
  DWORD2(v222[36]) = 1;
  *(void *)&v222[37] = "Pause something (pair with a modification command)";
  BYTE8(v222[37]) = 0;
  memset(&v222[38], 0, 17);
  *((void *)&v222[39] + 1) = "notifyIdMS";
  memset(&v222[40], 0, 17);
  *(_OWORD *)((char *)&v222[41] + 8) = 0u;
  *((void *)&v222[42] + 1) = &v150;
  LODWORD(v222[43]) = 1;
  *((void *)&v222[43] + 1) = "Notify IdMS on reset";
  LOBYTE(v222[44]) = 1;
  BYTE8(v222[45]) = 0;
  *(_OWORD *)((char *)&v222[44] + 8) = 0u;
  *(void *)&v222[46] = "forceFetch";
  BYTE8(v222[47]) = 0;
  *(_OWORD *)((char *)&v222[46] + 8) = 0u;
  v222[48] = 0u;
  *(void *)&v222[49] = &v149;
  DWORD2(v222[49]) = 1;
  *(void *)&v222[50] = "Force fetch from cuttlefish";
  BYTE8(v222[50]) = 0;
  memset(&v222[51], 0, 17);
  *((void *)&v222[52] + 1) = "repair";
  memset(&v222[53], 0, 17);
  *(_OWORD *)((char *)&v222[54] + 8) = 0u;
  *((void *)&v222[55] + 1) = &v148;
  LODWORD(v222[56]) = 1;
  *((void *)&v222[56] + 1) = "Perform repair as part of health check";
  LOBYTE(v222[57]) = 0;
  *((void *)&v222[64] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[63] + 8) = 0u;
  *((void *)&v222[62] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[61] + 8) = 0u;
  *(_OWORD *)((char *)&v222[60] + 8) = 0u;
  *(_OWORD *)((char *)&v222[59] + 8) = 0u;
  *((void *)&v222[58] + 1) = 97LL;
  *(_OWORD *)((char *)&v222[57] + 8) = 0u;
  *(void *)&v222[59] = "machineID";
  *((void *)&v222[61] + 1) = &v152;
  *(void *)&v222[63] = "machineID override";
  LOBYTE(v222[65]) = 103;
  *((void *)&v222[65] + 1) = "guitarfish";
  memset(&v222[66], 0, 17);
  *(_OWORD *)((char *)&v222[67] + 8) = 0u;
  *((void *)&v222[68] + 1) = &v133;
  LODWORD(v222[69]) = 1;
  *((void *)&v222[69] + 1) = "Flag to indicate the account is Guitarfish";
  LOBYTE(v222[70]) = 0;
  *((void *)&v222[77] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[76] + 8) = 0u;
  *((void *)&v222[75] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[74] + 8) = 0u;
  *(_OWORD *)((char *)&v222[73] + 8) = 0u;
  *(_OWORD *)((char *)&v222[72] + 8) = 0u;
  *((void *)&v222[71] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[70] + 8) = 0u;
  *(void *)&v222[72] = "altDSID";
  *((void *)&v222[74] + 1) = &v147;
  *(void *)&v222[76] = "altDSID (for sign-in/out)";
  memset(&v222[83], 0, 32);
  *(void *)&v222[78] = 0LL;
  memset(&v222[79], 0, 56);
  *((void *)&v222[78] + 1) = "entropy";
  *(void *)&v222[81] = &v157;
  *((void *)&v222[82] + 1) = "escrowed entropy in JSON";
  *((void *)&v222[90] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[89] + 8) = 0u;
  *((void *)&v222[88] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[87] + 8) = 0u;
  *(_OWORD *)((char *)&v222[86] + 8) = 0u;
  *(_OWORD *)((char *)&v222[85] + 8) = 0u;
  *(void *)&v222[85] = "appleID";
  *((void *)&v222[87] + 1) = &v144;
  *(void *)&v222[89] = "AppleID";
  memset(&v222[96], 0, 32);
  *(void *)&v222[91] = 0LL;
  memset(&v222[92], 0, 56);
  *((void *)&v222[91] + 1) = "dsid";
  *(void *)&v222[94] = &v143;
  *((void *)&v222[95] + 1) = "DSID";
  LOBYTE(v222[96]) = 1;
  *((void *)&v222[103] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[102] + 8) = 0u;
  *((void *)&v222[101] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[100] + 8) = 0u;
  *(_OWORD *)((char *)&v222[99] + 8) = 0u;
  *(_OWORD *)((char *)&v222[98] + 8) = 0u;
  *(void *)&v222[98] = "container";
  *((void *)&v222[100] + 1) = &v146;
  *(void *)&v222[102] = "CloudKit container name";
  memset(&v222[109], 0, 32);
  *(void *)&v222[104] = 0LL;
  memset(&v222[105], 0, 56);
  *((void *)&v222[104] + 1) = "context";
  *(void *)&v222[107] = &v158;
  *((void *)&v222[108] + 1) = "Context name";
  *((void *)&v222[116] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[115] + 8) = 0u;
  *((void *)&v222[114] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[113] + 8) = 0u;
  *(_OWORD *)((char *)&v222[112] + 8) = 0u;
  *(_OWORD *)((char *)&v222[111] + 8) = 0u;
  *(void *)&v222[111] = "radar";
  *((void *)&v222[113] + 1) = &v145;
  *(void *)&v222[115] = "Radar number";
  memset(&v222[122], 0, 32);
  *(void *)&v222[117] = 0LL;
  memset(&v222[118], 0, 56);
  *((void *)&v222[117] + 1) = "wrapping-key";
  *(void *)&v222[120] = &v142;
  *((void *)&v222[121] + 1) = "Wrapping key (for joinWithCustodianRecoveryKey)";
  LOBYTE(v222[122]) = 1;
  *((void *)&v222[129] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[128] + 8) = 0u;
  *((void *)&v222[127] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[126] + 8) = 0u;
  *(_OWORD *)((char *)&v222[125] + 8) = 0u;
  *(_OWORD *)((char *)&v222[124] + 8) = 0u;
  *(void *)&v222[124] = "wrapped-key";
  *((void *)&v222[126] + 1) = &v141;
  *(void *)&v222[128] = "Wrapped key (for joinWithCustodianRecoveryKey)";
  BYTE8(v222[128]) = 1;
  memset(&v222[135], 0, 32);
  *(void *)&v222[130] = 0LL;
  memset(&v222[131], 0, 56);
  *((void *)&v222[130] + 1) = "claim-token";
  *(void *)&v222[133] = &v140;
  *((void *)&v222[134] + 1) = "Claim token for inheritance";
  LOBYTE(v222[135]) = 1;
  *((void *)&v222[142] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[141] + 8) = 0u;
  *((void *)&v222[140] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[139] + 8) = 0u;
  *(_OWORD *)((char *)&v222[138] + 8) = 0u;
  *(_OWORD *)((char *)&v222[137] + 8) = 0u;
  *(void *)&v222[137] = "custodianUUID";
  *((void *)&v222[139] + 1) = &v139;
  *(void *)&v222[141] = "UUID for joinWithCustodianRecoveryKey";
  BYTE8(v222[141]) = 1;
  memset(&v222[148], 0, 32);
  *(void *)&v222[143] = 0LL;
  memset(&v222[144], 0, 56);
  *((void *)&v222[143] + 1) = "inheritanceUUID";
  *(void *)&v222[146] = &v138;
  *((void *)&v222[147] + 1) = "UUID for joinWithInheritanceKey";
  LOBYTE(v222[148]) = 1;
  *((void *)&v222[155] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[154] + 8) = 0u;
  *((void *)&v222[153] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[152] + 8) = 0u;
  *(_OWORD *)((char *)&v222[151] + 8) = 0u;
  *(_OWORD *)((char *)&v222[150] + 8) = 0u;
  *(void *)&v222[150] = "timeout";
  *((void *)&v222[152] + 1) = &v137;
  *(void *)&v222[154] = "timeout for command (in s)";
  memset(&v222[161], 0, 32);
  *(void *)&v222[156] = 0LL;
  memset(&v222[157], 0, 56);
  *((void *)&v222[156] + 1) = "idms-target-context";
  *(void *)&v222[159] = &v135;
  *((void *)&v222[160] + 1) = "idmsTargetContext";
  LOBYTE(v222[161]) = 1;
  *((void *)&v222[168] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[167] + 8) = 0u;
  *((void *)&v222[166] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[165] + 8) = 0u;
  *(_OWORD *)((char *)&v222[164] + 8) = 0u;
  *(_OWORD *)((char *)&v222[163] + 8) = 0u;
  *(void *)&v222[163] = "idms-cuttlefish-password";
  *((void *)&v222[165] + 1) = &v134;
  *(void *)&v222[167] = "idmsCuttlefishPassword";
  BYTE8(v222[167]) = 1;
  LOBYTE(v222[169]) = 0;
  *((void *)&v222[169] + 1) = 0LL;
  *(void *)&v222[170] = "start";
  *((void *)&v222[170] + 1) = 0LL;
  LOBYTE(v222[171]) = 0;
  *(_OWORD *)((char *)&v222[171] + 8) = 0u;
  *((void *)&v222[172] + 1) = (char *)&v186 + 4;
  LODWORD(v222[173]) = 1;
  *((void *)&v222[173] + 1) = "Start Octagon state machine";
  LOBYTE(v222[174]) = 1;
  *(void *)&v222[176] = 0LL;
  BYTE8(v222[175]) = 0;
  *(_OWORD *)((char *)&v222[174] + 8) = 0u;
  *((void *)&v222[176] + 1) = "sign-in";
  *(void *)&v222[177] = 0LL;
  BYTE8(v222[177]) = 0;
  v222[178] = 0u;
  *(void *)&v222[179] = &v186;
  DWORD2(v222[179]) = 1;
  *(void *)&v222[180] = "Inform Cuttlefish container of sign in";
  BYTE8(v222[180]) = 1;
  *((void *)&v222[182] + 1) = 0LL;
  memset(&v222[181], 0, 17);
  *(void *)&v222[183] = "sign-out";
  *((void *)&v222[183] + 1) = 0LL;
  LOBYTE(v222[184]) = 0;
  *(_OWORD *)((char *)&v222[184] + 8) = 0u;
  *((void *)&v222[185] + 1) = (char *)&v185 + 4;
  LODWORD(v222[186]) = 1;
  *((void *)&v222[186] + 1) = "Inform Cuttlefish container of sign out";
  LOBYTE(v222[187]) = 1;
  *(void *)&v222[189] = 0LL;
  BYTE8(v222[188]) = 0;
  *(_OWORD *)((char *)&v222[187] + 8) = 0u;
  *((void *)&v222[189] + 1) = "status";
  *(void *)&v222[190] = 0LL;
  BYTE8(v222[190]) = 0;
  v222[191] = 0u;
  *(void *)&v222[192] = (char *)&v181 + 4;
  DWORD2(v222[192]) = 1;
  *(void *)&v222[193] = "Report Octagon status";
  BYTE8(v222[193]) = 0;
  *((void *)&v222[195] + 1) = 0LL;
  memset(&v222[194], 0, 17);
  *(void *)&v222[196] = "resetoctagon";
  *((void *)&v222[196] + 1) = 0LL;
  LOBYTE(v222[197]) = 0;
  *(_OWORD *)((char *)&v222[197] + 8) = 0u;
  *((void *)&v222[198] + 1) = &v185;
  LODWORD(v222[199]) = 1;
  *((void *)&v222[199] + 1) = "Reset and establish new Octagon trust";
  LOBYTE(v222[200]) = 1;
  *(void *)&v222[202] = 0LL;
  BYTE8(v222[201]) = 0;
  *(_OWORD *)((char *)&v222[200] + 8) = 0u;
  *((void *)&v222[202] + 1) = "resetProtectedData";
  *(void *)&v222[203] = 0LL;
  BYTE8(v222[203]) = 0;
  v222[204] = 0u;
  *(void *)&v222[205] = (char *)&v184 + 4;
  DWORD2(v222[205]) = 1;
  *(void *)&v222[206] = "Reset ProtectedData";
  BYTE8(v222[206]) = 1;
  *((void *)&v222[208] + 1) = 0LL;
  memset(&v222[207], 0, 17);
  *(void *)&v222[209] = "reset";
  *((void *)&v222[209] + 1) = 0LL;
  LOBYTE(v222[210]) = 0;
  *(_OWORD *)((char *)&v222[210] + 8) = 0u;
  *((void *)&v222[211] + 1) = &v184;
  LODWORD(v222[212]) = 1;
  *((void *)&v222[212] + 1) = "Reset Octagon trust";
  LOBYTE(v222[213]) = 1;
  *(void *)&v222[215] = 0LL;
  *((void *)&v222[250] + 1) = (char *)&v180 + 4;
  memset(&v222[376], 0, 17);
  BYTE8(v222[372]) = 0;
  *(void *)&v222[375] = "Store an inheritance key";
  BYTE8(v222[375]) = 1;
  *((void *)&v222[377] + 1) = 0LL;
  v222[373] = 0u;
  *(void *)&v222[374] = (char *)&v169 + 4;
  DWORD2(v222[374]) = 1;
  BYTE8(v222[370]) = 0;
  *(_OWORD *)((char *)&v222[369] + 8) = 0u;
  *((void *)&v222[371] + 1) = "store-inheritance-key";
  *(void *)&v222[372] = 0LL;
  LODWORD(v222[368]) = 1;
  *((void *)&v222[368] + 1) = "Generate an inheritance key";
  LOBYTE(v222[369]) = 1;
  *(void *)&v222[371] = 0LL;
  LOBYTE(v222[366]) = 0;
  *(_OWORD *)((char *)&v222[366] + 8) = 0u;
  *((void *)&v222[367] + 1) = &v170;
  memset(&v222[363], 0, 17);
  *(void *)&v222[365] = "generate-inheritance-key";
  *((void *)&v222[365] + 1) = 0LL;
  BYTE8(v222[359]) = 0;
  *(void *)&v222[362] = "Create an inheritance key";
  BYTE8(v222[362]) = 1;
  *((void *)&v222[364] + 1) = 0LL;
  v222[360] = 0u;
  *(void *)&v222[361] = (char *)&v170 + 4;
  DWORD2(v222[361]) = 1;
  BYTE8(v222[357]) = 0;
  *(_OWORD *)((char *)&v222[356] + 8) = 0u;
  *((void *)&v222[358] + 1) = "create-inheritance-key";
  *(void *)&v222[359] = 0LL;
  LODWORD(v222[355]) = 1;
  *((void *)&v222[355] + 1) = "Check a custodian recovery key for existence";
  LOBYTE(v222[356]) = 1;
  *(void *)&v222[358] = 0LL;
  LOBYTE(v222[353]) = 0;
  *(_OWORD *)((char *)&v222[353] + 8) = 0u;
  *((void *)&v222[354] + 1) = (char *)&v173 + 4;
  memset(&v222[350], 0, 17);
  *(void *)&v222[352] = "check-custodian-recovery-key";
  *((void *)&v222[352] + 1) = 0LL;
  BYTE8(v222[346]) = 0;
  *(void *)&v222[349] = "Remove a custodian recovery key";
  BYTE8(v222[349]) = 1;
  *((void *)&v222[351] + 1) = 0LL;
  v222[347] = 0u;
  *(void *)&v222[348] = &v174;
  DWORD2(v222[348]) = 1;
  BYTE8(v222[344]) = 0;
  *(_OWORD *)((char *)&v222[343] + 8) = 0u;
  *((void *)&v222[345] + 1) = "remove-custodian-recovery-key";
  *(void *)&v222[346] = 0LL;
  LODWORD(v222[342]) = 1;
  *((void *)&v222[342] + 1) = "Preflight join with a custodian recovery key";
  LOBYTE(v222[343]) = 1;
  *(void *)&v222[345] = 0LL;
  LOBYTE(v222[340]) = 0;
  *(_OWORD *)((char *)&v222[340] + 8) = 0u;
  *((void *)&v222[341] + 1) = (char *)&v174 + 4;
  memset(&v222[337], 0, 17);
  *(void *)&v222[339] = "preflight-join-with-custodian-recovery-key";
  *((void *)&v222[339] + 1) = 0LL;
  BYTE8(v222[333]) = 0;
  *(void *)&v222[336] = "Join with a custodian recovery key";
  BYTE8(v222[336]) = 1;
  *((void *)&v222[338] + 1) = 0LL;
  v222[334] = 0u;
  *(void *)&v222[335] = &v175;
  DWORD2(v222[335]) = 1;
  BYTE8(v222[331]) = 0;
  *(_OWORD *)((char *)&v222[330] + 8) = 0u;
  *((void *)&v222[332] + 1) = "join-with-custodian-recovery-key";
  *(void *)&v222[333] = 0LL;
  LODWORD(v222[329]) = 1;
  *((void *)&v222[329] + 1) = "Create a custodian recovery key";
  LOBYTE(v222[330]) = 1;
  *(void *)&v222[332] = 0LL;
  LOBYTE(v222[327]) = 0;
  *(_OWORD *)((char *)&v222[327] + 8) = 0u;
  *((void *)&v222[328] + 1) = (char *)&v175 + 4;
  memset(&v222[324], 0, 17);
  *(void *)&v222[326] = "create-custodian-recovery-key";
  *((void *)&v222[326] + 1) = 0LL;
  BYTE8(v222[320]) = 0;
  *(void *)&v222[323] = "Reset an account's CDP contents (escrow records, kvs data, cuttlefish)";
  BYTE8(v222[323]) = 1;
  *((void *)&v222[325] + 1) = 0LL;
  v222[321] = 0u;
  *(void *)&v222[322] = &v176;
  DWORD2(v222[322]) = 1;
  BYTE8(v222[318]) = 0;
  *(_OWORD *)((char *)&v222[317] + 8) = 0u;
  *((void *)&v222[319] + 1) = "reset-account-cdp-contents";
  *(void *)&v222[320] = 0LL;
  LODWORD(v222[316]) = 1;
  *((void *)&v222[316] + 1) = "Silent record recovery";
  LOBYTE(v222[317]) = 0;
  *(void *)&v222[319] = 0LL;
  LOBYTE(v222[314]) = 0;
  *(_OWORD *)((char *)&v222[314] + 8) = 0u;
  *((void *)&v222[315] + 1) = (char *)&v176 + 4;
  memset(&v222[311], 0, 17);
  *(void *)&v222[313] = "recover-record-silent";
  *((void *)&v222[313] + 1) = 0LL;
  BYTE8(v222[307]) = 0;
  *(void *)&v222[310] = "Recover record";
  BYTE8(v222[310]) = 0;
  *((void *)&v222[312] + 1) = 0LL;
  v222[308] = 0u;
  *(void *)&v222[309] = &v177;
  DWORD2(v222[309]) = 1;
  BYTE8(v222[305]) = 0;
  *(_OWORD *)((char *)&v222[304] + 8) = 0u;
  *((void *)&v222[306] + 1) = "recover-record";
  *(void *)&v222[307] = 0LL;
  LODWORD(v222[303]) = 1;
  *((void *)&v222[303] + 1) = "Fetch All Escrow Records";
  LOBYTE(v222[304]) = 0;
  *(void *)&v222[306] = 0LL;
  LOBYTE(v222[301]) = 0;
  *(_OWORD *)((char *)&v222[301] + 8) = 0u;
  *((void *)&v222[302] + 1) = (char *)&v177 + 4;
  memset(&v222[298], 0, 17);
  *(void *)&v222[300] = "fetchAllEscrowRecords";
  *((void *)&v222[300] + 1) = 0LL;
  BYTE8(v222[294]) = 0;
  *(void *)&v222[297] = "Fetch Escrow Records";
  BYTE8(v222[297]) = 0;
  *((void *)&v222[299] + 1) = 0LL;
  v222[295] = 0u;
  *(void *)&v222[296] = &v178;
  DWORD2(v222[296]) = 1;
  BYTE8(v222[292]) = 0;
  *(_OWORD *)((char *)&v222[291] + 8) = 0u;
  *((void *)&v222[293] + 1) = "fetchEscrowRecords";
  *(void *)&v222[294] = 0LL;
  LODWORD(v222[290]) = 1;
  *((void *)&v222[290] + 1) = "Trigger a TapToRadar";
  LOBYTE(v222[291]) = 1;
  *(void *)&v222[293] = 0LL;
  LOBYTE(v222[288]) = 0;
  *(_OWORD *)((char *)&v222[288] + 8) = 0u;
  *((void *)&v222[289] + 1) = (char *)&v178 + 4;
  memset(&v222[285], 0, 17);
  *(void *)&v222[287] = "taptoradar";
  *((void *)&v222[287] + 1) = 0LL;
  BYTE8(v222[281]) = 0;
  *(void *)&v222[284] = "Trigger a refetch of the CKKS policy";
  BYTE8(v222[284]) = 0;
  *((void *)&v222[286] + 1) = 0LL;
  v222[282] = 0u;
  *(void *)&v222[283] = &v179;
  DWORD2(v222[283]) = 1;
  BYTE8(v222[279]) = 0;
  *(_OWORD *)((char *)&v222[278] + 8) = 0u;
  *((void *)&v222[280] + 1) = "ckks-policy";
  *(void *)&v222[281] = 0LL;
  LODWORD(v222[277]) = 1;
  *((void *)&v222[277] + 1) = "Simulate receiving a Octagon push notification";
  LOBYTE(v222[278]) = 1;
  *(void *)&v222[280] = 0LL;
  LOBYTE(v222[275]) = 0;
  *(_OWORD *)((char *)&v222[275] + 8) = 0u;
  *((void *)&v222[276] + 1) = &v162;
  memset(&v222[272], 0, 17);
  *(void *)&v222[274] = "simulate-receive-push";
  *((void *)&v222[274] + 1) = 0LL;
  BYTE8(v222[268]) = 0;
  *(void *)&v222[271] = "Check Octagon Health status";
  BYTE8(v222[271]) = 0;
  *((void *)&v222[273] + 1) = 0LL;
  v222[269] = 0u;
  *(void *)&v222[270] = (char *)&v162 + 4;
  DWORD2(v222[270]) = 1;
  BYTE8(v222[266]) = 0;
  *(_OWORD *)((char *)&v222[265] + 8) = 0u;
  *((void *)&v222[267] + 1) = "health";
  *(void *)&v222[268] = 0LL;
  LODWORD(v222[264]) = 1;
  *((void *)&v222[264] + 1) = "Store any pending Escrow Request prerecords";
  LOBYTE(v222[265]) = 0;
  *(void *)&v222[267] = 0LL;
  LOBYTE(v222[262]) = 0;
  *(_OWORD *)((char *)&v222[262] + 8) = 0u;
  *((void *)&v222[263] + 1) = (char *)&v179 + 4;
  memset(&v222[259], 0, 17);
  *(void *)&v222[261] = "er-store";
  *((void *)&v222[261] + 1) = 0LL;
  BYTE8(v222[255]) = 0;
  *(void *)&v222[258] = "Delete all Escrow Request requests";
  BYTE8(v222[258]) = 0;
  *((void *)&v222[260] + 1) = 0LL;
  v222[256] = 0u;
  *(void *)&v222[257] = &v180;
  DWORD2(v222[257]) = 1;
  BYTE8(v222[253]) = 0;
  *(_OWORD *)((char *)&v222[252] + 8) = 0u;
  *((void *)&v222[254] + 1) = "er-reset";
  *(void *)&v222[255] = 0LL;
  LODWORD(v222[251]) = 1;
  *((void *)&v222[251] + 1) = "Report status on any pending Escrow Request requests";
  LOBYTE(v222[252]) = 0;
  *(void *)&v222[254] = 0LL;
  BYTE8(v222[214]) = 0;
  *((void *)&v222[248] + 1) = 0LL;
  LOBYTE(v222[249]) = 0;
  *(_OWORD *)((char *)&v222[249] + 8) = 0u;
  *((void *)&v222[247] + 1) = 0LL;
  memset(&v222[246], 0, 17);
  *(void *)&v222[248] = "er-status";
  DWORD2(v222[244]) = 1;
  *(void *)&v222[245] = "Trigger an Escrow Request request";
  BYTE8(v222[245]) = 1;
  BYTE8(v222[242]) = 0;
  v222[243] = 0u;
  *(void *)&v222[244] = &v181;
  BYTE8(v222[240]) = 0;
  *(_OWORD *)((char *)&v222[239] + 8) = 0u;
  *((void *)&v222[241] + 1) = "er-trigger";
  *(void *)&v222[242] = 0LL;
  LODWORD(v222[238]) = 1;
  *((void *)&v222[238] + 1) = "Depart from Octagon Trust";
  LOBYTE(v222[239]) = 1;
  *(void *)&v222[241] = 0LL;
  *((void *)&v222[228] + 1) = "recover";
  LOBYTE(v222[236]) = 0;
  *(_OWORD *)((char *)&v222[236] + 8) = 0u;
  *((void *)&v222[237] + 1) = &v182;
  memset(&v222[233], 0, 17);
  *(void *)&v222[235] = "depart";
  *((void *)&v222[235] + 1) = 0LL;
  DWORD2(v222[231]) = 1;
  *(void *)&v222[232] = "Recover using this bottle";
  BYTE8(v222[232]) = 0;
  *((void *)&v222[234] + 1) = 0LL;
  *(void *)&v222[229] = 0LL;
  BYTE8(v222[229]) = 0;
  v222[230] = 0u;
  *(void *)&v222[231] = (char *)&v182 + 4;
  *(void *)&v222[228] = 0LL;
  BYTE8(v222[227]) = 0;
  *(_OWORD *)((char *)&v222[226] + 8) = 0u;
  *((void *)&v222[224] + 1) = &v183;
  LODWORD(v222[225]) = 1;
  *((void *)&v222[225] + 1) = "Fetch all viable bottles";
  LOBYTE(v222[226]) = 0;
  *(void *)&v222[222] = "allBottles";
  *((void *)&v222[222] + 1) = 0LL;
  LOBYTE(v222[223]) = 0;
  *(_OWORD *)((char *)&v222[223] + 8) = 0u;
  *(_OWORD *)((char *)&v222[213] + 8) = 0u;
  *((void *)&v222[215] + 1) = "user-controllable-views";
  *((void *)&v222[221] + 1) = 0LL;
  memset(&v222[220], 0, 17);
  *(void *)&v222[218] = (char *)&v183 + 4;
  DWORD2(v222[218]) = 1;
  *(void *)&v222[219] = "Modify or view user-controllable views status (If one of --enable or --pause is passed, will modify status)";
  BYTE8(v222[219]) = 1;
  *(void *)&v222[216] = 0LL;
  BYTE8(v222[216]) = 0;
  v222[217] = 0u;
  *(void *)&v222[378] = "join-with-inheritance-key";
  *((void *)&v222[378] + 1) = 0LL;
  LOBYTE(v222[379]) = 0;
  *(_OWORD *)((char *)&v222[379] + 8) = 0u;
  *((void *)&v222[380] + 1) = &v169;
  LODWORD(v222[381]) = 1;
  *((void *)&v222[381] + 1) = "Join with an inheritance key";
  LOBYTE(v222[382]) = 1;
  *(void *)&v222[384] = 0LL;
  BYTE8(v222[383]) = 0;
  *(_OWORD *)((char *)&v222[382] + 8) = 0u;
  *((void *)&v222[384] + 1) = "preflight-join-with-inheritance-key";
  *(void *)&v222[385] = 0LL;
  BYTE8(v222[385]) = 0;
  v222[386] = 0u;
  *(void *)&v222[387] = (char *)&v168 + 4;
  DWORD2(v222[387]) = 1;
  *(void *)&v222[388] = "Preflight join with an inheritance key";
  BYTE8(v222[388]) = 1;
  *((void *)&v222[390] + 1) = 0LL;
  memset(&v222[389], 0, 17);
  *(void *)&v222[391] = "remove-inheritance-key";
  *((void *)&v222[391] + 1) = 0LL;
  LOBYTE(v222[392]) = 0;
  *(_OWORD *)((char *)&v222[392] + 8) = 0u;
  *((void *)&v222[393] + 1) = &v168;
  LODWORD(v222[394]) = 1;
  *((void *)&v222[394] + 1) = "Remove an inheritance key";
  LOBYTE(v222[395]) = 1;
  *(void *)&v222[397] = 0LL;
  BYTE8(v222[396]) = 0;
  *(_OWORD *)((char *)&v222[395] + 8) = 0u;
  *((void *)&v222[397] + 1) = "check-inheritance-key";
  *(void *)&v222[398] = 0LL;
  BYTE8(v222[398]) = 0;
  v222[399] = 0u;
  *(void *)&v222[400] = (char *)&v167 + 4;
  DWORD2(v222[400]) = 1;
  *(void *)&v222[401] = "Check an inheritance key for existence";
  BYTE8(v222[401]) = 1;
  *((void *)&v222[403] + 1) = 0LL;
  memset(&v222[402], 0, 17);
  *(void *)&v222[404] = "recreate-inheritance-key";
  *((void *)&v222[404] + 1) = 0LL;
  LOBYTE(v222[405]) = 0;
  *(_OWORD *)((char *)&v222[405] + 8) = 0u;
  *((void *)&v222[406] + 1) = &v167;
  LODWORD(v222[407]) = 1;
  *((void *)&v222[407] + 1) = "Recreate an inheritance key";
  LOBYTE(v222[408]) = 1;
  *(void *)&v222[410] = 0LL;
  BYTE8(v222[409]) = 0;
  *(_OWORD *)((char *)&v222[408] + 8) = 0u;
  *((void *)&v222[410] + 1) = "create-inheritance-key-with-claim-wrapping";
  *(void *)&v222[411] = 0LL;
  BYTE8(v222[411]) = 0;
  v222[412] = 0u;
  *(void *)&v222[413] = (char *)&v166 + 4;
  DWORD2(v222[413]) = 1;
  *(void *)&v222[414] = "Create an inheritance key given claim+wrapping key";
  BYTE8(v222[414]) = 1;
  *((void *)&v222[416] + 1) = 0LL;
  memset(&v222[415], 0, 17);
  *(void *)&v222[417] = "tlk-recoverability";
  *((void *)&v222[417] + 1) = 0LL;
  LOBYTE(v222[418]) = 0;
  *(_OWORD *)((char *)&v222[418] + 8) = 0u;
  *((void *)&v222[419] + 1) = (char *)&v161 + 4;
  LODWORD(v222[420]) = 1;
  *((void *)&v222[420] + 1) = "Evaluate tlk recoverability for an account";
  LOBYTE(v222[421]) = 1;
  *(void *)&v222[423] = 0LL;
  BYTE8(v222[422]) = 0;
  *(_OWORD *)((char *)&v222[421] + 8) = 0u;
  *((void *)&v222[423] + 1) = "set-machine-id-override";
  *(void *)&v222[424] = 0LL;
  BYTE8(v222[424]) = 0;
  v222[425] = 0u;
  *(void *)&v222[426] = &v161;
  DWORD2(v222[426]) = 1;
  *(void *)&v222[427] = "Set machineID override";
  BYTE8(v222[427]) = 0;
  *((void *)&v222[429] + 1) = 0LL;
  memset(&v222[428], 0, 17);
  *(void *)&v222[430] = "remove-recovery-key";
  *((void *)&v222[430] + 1) = 0LL;
  LOBYTE(v222[431]) = 0;
  *(_OWORD *)((char *)&v222[431] + 8) = 0u;
  *((void *)&v222[432] + 1) = (char *)&v172 + 4;
  LODWORD(v222[433]) = 1;
  *((void *)&v222[433] + 1) = "Remove a recovery key";
  LOBYTE(v222[434]) = 1;
  *(void *)&v222[436] = 0LL;
  BYTE8(v222[435]) = 0;
  *(_OWORD *)((char *)&v222[434] + 8) = 0u;
  *((void *)&v222[436] + 1) = "set-recovery-key";
  *(void *)&v222[437] = 0LL;
  BYTE8(v222[437]) = 0;
  v222[438] = 0u;
  *(void *)&v222[439] = &v173;
  DWORD2(v222[439]) = 1;
  *(void *)&v222[440] = "Set a recovery key";
  BYTE8(v222[440]) = 1;
  *((void *)&v222[442] + 1) = 0LL;
  memset(&v222[441], 0, 17);
  *(void *)&v222[443] = "join-with-recovery-key";
  *((void *)&v222[443] + 1) = 0LL;
  LOBYTE(v222[444]) = 0;
  *(_OWORD *)((char *)&v222[444] + 8) = 0u;
  *((void *)&v222[445] + 1) = &v172;
  LODWORD(v222[446]) = 1;
  *((void *)&v222[446] + 1) = "Join with a recovery key";
  LOBYTE(v222[447]) = 1;
  *(void *)&v222[449] = 0LL;
  BYTE8(v222[448]) = 0;
  *(_OWORD *)((char *)&v222[447] + 8) = 0u;
  *((void *)&v222[449] + 1) = "check-recovery-key";
  *(void *)&v222[450] = 0LL;
  BYTE8(v222[450]) = 0;
  v222[451] = 0u;
  *(void *)&v222[452] = (char *)&v171 + 4;
  DWORD2(v222[452]) = 1;
  *(void *)&v222[453] = "Check a recovery key";
  BYTE8(v222[453]) = 1;
  *((void *)&v222[455] + 1) = 0LL;
  memset(&v222[454], 0, 17);
  *(void *)&v222[456] = "preflight-join-with-recovery-key";
  *((void *)&v222[456] + 1) = 0LL;
  LOBYTE(v222[457]) = 0;
  *(_OWORD *)((char *)&v222[457] + 8) = 0u;
  *((void *)&v222[458] + 1) = &v171;
  *((void *)&v222[465] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[464] + 8) = 0u;
  *(_OWORD *)((char *)&v222[463] + 8) = 0u;
  *(_OWORD *)((char *)&v222[462] + 8) = 0u;
  LODWORD(v222[459]) = 1;
  *((void *)&v222[459] + 1) = "Preflight join with a recovery key";
  LOBYTE(v222[460]) = 1;
  *((void *)&v222[467] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[466] + 8) = 0u;
  *((void *)&v222[461] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[460] + 8) = 0u;
  *(void *)&v222[462] = "recoveryKey";
  *((void *)&v222[464] + 1) = &v136;
  *(void *)&v222[466] = "recovery key";
  LOBYTE(v222[468]) = 0;
  *((void *)&v222[468] + 1) = 0LL;
  *(void *)&v222[469] = "enable-walrus";
  *((void *)&v222[469] + 1) = 0LL;
  LOBYTE(v222[470]) = 0;
  *(_OWORD *)((char *)&v222[470] + 8) = 0u;
  *((void *)&v222[471] + 1) = (char *)&v164 + 4;
  LODWORD(v222[472]) = 1;
  *((void *)&v222[472] + 1) = "Enable Walrus Setting";
  LOBYTE(v222[473]) = 1;
  *(void *)&v222[475] = 0LL;
  BYTE8(v222[474]) = 0;
  *(_OWORD *)((char *)&v222[473] + 8) = 0u;
  *((void *)&v222[475] + 1) = "disable-walrus";
  *(void *)&v222[476] = 0LL;
  v222[477] = 0u;
  BYTE8(v222[476]) = 0;
  *(void *)&v222[478] = &v164;
  DWORD2(v222[478]) = 1;
  *(void *)&v222[479] = "Disable Walrus Setting";
  BYTE8(v222[479]) = 1;
  *((void *)&v222[481] + 1) = 0LL;
  memset(&v222[480], 0, 17);
  *(void *)&v222[482] = "enable-webaccess";
  *((void *)&v222[482] + 1) = 0LL;
  LOBYTE(v222[483]) = 0;
  *(_OWORD *)((char *)&v222[483] + 8) = 0u;
  *((void *)&v222[484] + 1) = (char *)&v163 + 4;
  LODWORD(v222[485]) = 1;
  *((void *)&v222[485] + 1) = "Enable Web Access Setting";
  LOBYTE(v222[486]) = 1;
  *(void *)&v222[488] = 0LL;
  BYTE8(v222[487]) = 0;
  *(_OWORD *)((char *)&v222[486] + 8) = 0u;
  *((void *)&v222[488] + 1) = "disable-webaccess";
  *(void *)&v222[489] = 0LL;
  v222[490] = 0u;
  BYTE8(v222[489]) = 0;
  *(void *)&v222[491] = &v163;
  DWORD2(v222[491]) = 1;
  *(void *)&v222[492] = "Disable Web Access Setting";
  BYTE8(v222[492]) = 1;
  *((void *)&v222[494] + 1) = 0LL;
  memset(&v222[493], 0, 17);
  *(void *)&v222[495] = "fetch-account-state";
  *((void *)&v222[495] + 1) = 0LL;
  LOBYTE(v222[496]) = 0;
  *(_OWORD *)((char *)&v222[496] + 8) = 0u;
  *((void *)&v222[497] + 1) = &v166;
  LODWORD(v222[498]) = 1;
  *((void *)&v222[498] + 1) = "Fetch Account Settings";
  LOBYTE(v222[499]) = 1;
  *(void *)&v222[501] = 0LL;
  BYTE8(v222[500]) = 0;
  *(_OWORD *)((char *)&v222[499] + 8) = 0u;
  *((void *)&v222[501] + 1) = "fetch-account-wide-state";
  *(void *)&v222[502] = 0LL;
  v222[503] = 0u;
  BYTE8(v222[502]) = 0;
  *(void *)&v222[504] = (char *)&v165 + 4;
  DWORD2(v222[504]) = 1;
  *(void *)&v222[505] = "Fetch Account Wide Settings";
  BYTE8(v222[505]) = 1;
  *((void *)&v222[507] + 1) = 0LL;
  memset(&v222[506], 0, 17);
  *(void *)&v222[508] = "fetch-account-wide-state-default";
  *((void *)&v222[508] + 1) = 0LL;
  LOBYTE(v222[509]) = 0;
  *(_OWORD *)((char *)&v222[509] + 8) = 0u;
  *((void *)&v222[510] + 1) = &v165;
  LODWORD(v222[511]) = 1;
  *((void *)&v222[511] + 1) = "Fetch Account Wide Settings with Default";
  LOBYTE(v222[512]) = 1;
  *(void *)&v222[514] = 0LL;
  BYTE8(v222[513]) = 0;
  *(_OWORD *)((char *)&v222[512] + 8) = 0u;
  *((void *)&v222[514] + 1) = "print-account-metadata";
  *(void *)&v222[515] = 0LL;
  BYTE8(v222[515]) = 0;
  v222[516] = 0u;
  *(void *)&v222[517] = (char *)&v149 + 4;
  DWORD2(v222[517]) = 1;
  *(void *)&v222[518] = "Print Account Metadata";
  BYTE8(v222[518]) = 1;
  *((void *)&v222[520] + 1) = 0LL;
  memset(&v222[519], 0, 17);
  *(void *)&v222[521] = "reroll";
  *((void *)&v222[521] + 1) = 0LL;
  LOBYTE(v222[522]) = 0;
  *(_OWORD *)((char *)&v222[522] + 8) = 0u;
  *((void *)&v222[523] + 1) = &v160;
  LODWORD(v222[524]) = 1;
  *((void *)&v222[524] + 1) = "Reroll PeerID";
  LOBYTE(v222[525]) = 1;
  *((void *)&v222[532] + 1) = 0LL;
  *(_OWORD *)((char *)&v222[531] + 8) = 0u;
  *(_OWORD *)((char *)&v222[530] + 8) = 0u;
  *(_OWORD *)((char *)&v222[529] + 8) = 0u;
  *(_OWORD *)((char *)&v222[528] + 8) = 0u;
  *(_OWORD *)((char *)&v222[527] + 8) = 0u;
  *(_OWORD *)((char *)&v222[526] + 8) = 0u;
  *(_OWORD *)((char *)&v222[525] + 8) = 0u;
  v132[0] = "otctl";
  v132[1] = "Control and report on Octagon Trust";
  v132[2] = v196;
  memset(v195, 170, sizeof(v195));
  sub_100004170((uint64_t)v195, (uint64_t)v132);
  unint64_t v2 = sub_100004288((uint64_t)v195);
  uint64_t v3 = (option *)calloc(v2 + 1, 0x20uLL);
  size_t v4 = 2 * v2 + 2;
  uint64_t v5 = (char *)malloc(v4);
  v6 = v5;
  unint64_t v7 = 0LL;
  unint64_t v8 = 0LL;
  uint64_t v9 = (char *)v195[2];
  v10 = (char *)v195[2] + 48;
  do
  {
    if (v7 >= v2) {
      goto LABEL_13;
    }
    uint64_t v11 = (const char *)*((void *)v10 - 5);
    if (v11)
    {
      v3[v7].name = v11;
      uint64_t v13 = *(void *)v10;
      uint64_t v12 = (int *)*((void *)v10 + 1);
      if (v12)
      {
        int v14 = 2 * (v13 != 0);
      }

      else if (v13)
      {
        int v14 = 1;
      }

      else
      {
        int v14 = *((void *)v10 + 5) != 0LL;
      }

      uint64_t v15 = &v3[v7];
      v15->has_arg = v14;
      v15->flag = v12;
      v15->val = *((_DWORD *)v10 + 4);
      ++v7;
    }

    ++v8;
    v10 += 104;
  }

  while (v8 <= v2);
  if (v7 < v2)
  {
    uint64_t v16 = &v3[v7];
    v16->name = 0LL;
    v16->has_arg = 0;
    v16->flag = 0LL;
    v16->val = 0;
LABEL_14:
    size_t v17 = 0LL;
    uint64_t v18 = v9 + 48;
    unint64_t v19 = v2;
    while (1)
    {
      if (*((_BYTE *)v18 - 48))
      {
        if (v17 >= v4) {
          goto LABEL_25;
        }
        v5[v17] = *((_BYTE *)v18 - 48);
        size_t v20 = v17 + 1;
        if (!v18[1] && (*v18 || v18[5]))
        {
          if (v20 >= v4)
          {
LABEL_25:
            char v124 = 0;
            goto LABEL_28;
          }

          v5[v20] = 58;
          v17 += 2LL;
        }

        else
        {
          ++v17;
        }
      }

      v18 += 13;
      if (!--v19)
      {
        char v124 = 0;
        goto LABEL_27;
      }
    }
  }

LABEL_13:
  if (v2) {
    goto LABEL_14;
  }
  size_t v17 = 0LL;
  char v124 = 1;
LABEL_27:
  v5[v17] = 0;
LABEL_28:
  int v194 = 0;
  do
  {
    while (1)
    {
      int v21 = getopt_long(a1, a2, v6, v3, &v194);
      if (v21) {
        break;
      }
      if (!v194)
      {
LABEL_167:
        sub_1000042FC((uint64_t)v195);
        exit(1);
      }

      if ((v124 & 1) == 0)
      {
        uint64_t v23 = 0LL;
        p_name = &v3[v194].name;
        unint64_t v25 = v2;
        do
        {
          v26 = (char *)v195[2] + v23;
          v27 = *(const char **)((char *)v195[2] + v23 + 8);
          if (v27)
          {
            if (*p_name)
            {
              size_t v28 = strlen(*(const char **)((char *)v195[2] + v23 + 8));
              if (!strncmp(*p_name, v27, v28))
              {
                __int128 v29 = *((_OWORD *)v26 + 5);
                __int128 v191 = *((_OWORD *)v26 + 4);
                __int128 v192 = v29;
                uint64_t v193 = *((void *)v26 + 12);
                __int128 v30 = *((_OWORD *)v26 + 1);
                __int128 v187 = *(_OWORD *)v26;
                __int128 v188 = v30;
                __int128 v31 = *((_OWORD *)v26 + 3);
                __int128 v189 = *((_OWORD *)v26 + 2);
                __int128 v190 = v31;
                sub_1000048C4((uint64_t)&v187, optarg);
              }
            }
          }

          v23 += 104LL;
          --v25;
        }

        while (v25);
      }
    }

    if (v21 == -1)
    {
      uint64_t v39 = optind;
      if (optind >= a1)
      {
LABEL_71:
        free(v195[2]);
        free(v3);
        free(v6);
      }

      else
      {
        unint64_t v40 = 0LL;
        do
        {
          unint64_t v41 = v40;
          if ((v124 & 1) == 0)
          {
            uint64_t v42 = 0LL;
            __int128 v43 = (char *)v195[2];
            __int128 v44 = (const char **)((char *)v195[2] + 16);
            while (!*v44 || strcmp(a2[v39], *v44))
            {
              ++v42;
              v44 += 13;
              if (v2 == v42) {
                goto LABEL_60;
              }
            }

            v47 = &v43[104 * v42];
            __int128 v48 = *((_OWORD *)v47 + 5);
            __int128 v191 = *((_OWORD *)v47 + 4);
            __int128 v192 = v48;
            uint64_t v193 = *((void *)v47 + 12);
            __int128 v49 = *((_OWORD *)v47 + 1);
            __int128 v187 = *(_OWORD *)v47;
            __int128 v188 = v49;
            __int128 v50 = *((_OWORD *)v47 + 3);
            __int128 v189 = *((_OWORD *)v47 + 2);
            __int128 v190 = v50;
            sub_1000048C4((uint64_t)&v187, 0LL);
            goto LABEL_71;
          }

  return v6;
}

LABEL_60:
          v36 = v195[2];
          if (v41 >= v2) {
            goto LABEL_50;
          }
          v45 = (char *)v195[2] + 104 * v41 + 24;
          unint64_t v40 = v41;
          while (!*v45)
          {
            ++v40;
            v45 += 13;
            if (v2 == v40) {
              goto LABEL_49;
            }
          }

          v46 = (void *)*((void *)v195[2] + 13 * v40 + 6);
          if (v46)
          {
            void *v46 = a2[v39];
            ++v40;
          }

          ++v39;
        }

        while ((_DWORD)v39 != a1);
        free(v195[2]);
        free(v3);
        free(v6);
        if (v41 >= v2) {
          goto LABEL_51;
        }
      }

      v51 = objc_autoreleasePoolPush();
      id v131 = 0LL;
      uint64_t v52 = objc_claimAutoreleasedReturnValue(+[OTControl controlObject:error:](&OBJC_CLASS___OTControl, "controlObject:error:", 1LL, &v131));
      id v53 = v131;
      if (v53 || !v52)
      {
        objc_msgSend( objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description")), "UTF8String");
        errx(1, "no OTControl failed: %s");
      }

      if (v158) {
        v54 = (char **)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v158,  4LL));
      }
      else {
        v54 = (char **)OTDefaultContext;
      }
      v129 = v54;
      if (v146)
      {
        v127 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v146,  4LL));
      }

      else
      {
        v127 = @"com.apple.security.keychain";
        v55 = @"com.apple.security.keychain";
      }

      if (v147) {
        v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v147,  4LL));
      }
      else {
        v125 = 0LL;
      }
      if (v143) {
        uint64_t v110 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v143,  4LL));
      }
      else {
        uint64_t v110 = 0LL;
      }
      if (v144) {
        uint64_t v121 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v144,  4LL));
      }
      else {
        uint64_t v121 = 0LL;
      }
      if (v156) {
        v112 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v156,  4LL));
      }
      else {
        v112 = @"NO";
      }
      if (v142) {
        v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v142,  4LL));
      }
      else {
        v119 = 0LL;
      }
      if (v141) {
        v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v141,  4LL));
      }
      else {
        v118 = 0LL;
      }
      if (v140) {
        uint64_t v111 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v140,  4LL));
      }
      else {
        uint64_t v111 = 0LL;
      }
      if (v139) {
        v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v139,  4LL));
      }
      else {
        v117 = 0LL;
      }
      if (v138) {
        v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v138,  4LL));
      }
      else {
        v116 = 0LL;
      }
      if (v137)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v137,  4LL));
        double v57 = (double)(uint64_t)[v56 integerValue];
      }

      else
      {
        double v57 = 600.0;
      }

      if (v135) {
        uint64_t v58 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v135,  4LL));
      }
      else {
        uint64_t v58 = 0LL;
      }
      if (v134) {
        uint64_t v59 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v134,  4LL));
      }
      else {
        uint64_t v59 = 0LL;
      }
      if (v154) {
        v115 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v154,  4LL));
      }
      else {
        v115 = @"NO";
      }
      context = v51;
      if (v153) {
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v153,  4LL));
      }
      else {
        v60 = @"NO";
      }
      v114 = v60;
      unsigned int v107 = -[__CFString isEqualToString:](v60, "isEqualToString:", @"YES");
      v61 = (void *)v58;
      if (v136) {
        v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v136,  4LL));
      }
      else {
        v113 = 0LL;
      }
      v122 = (void *)v52;
      v123 = -[OTControlCLI initWithOTControl:](objc_alloc(&OBJC_CLASS___OTControlCLI), "initWithOTControl:", v52);
      id v62 = objc_alloc(&OBJC_CLASS___OTControlArguments);
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 UUIDString]);
      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"otctl-flowID-%@",  v64));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v67 = (void *)objc_claimAutoreleasedReturnValue([v66 UUIDString]);
      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"otctl-deviceSessionID-%@",  v67));
      id v69 = [v62 initWithContainerName:v127 contextID:v129 altDSID:v125 flowID:v65 deviceSessionID:v68];

      v70 = objc_alloc(&OBJC_CLASS___EscrowRequestCLI);
      id v130 = 0LL;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[SecEscrowRequest request:](&OBJC_CLASS___SecEscrowRequest, "request:", &v130));
      id v72 = v130;
      v73 = -[EscrowRequestCLI initWithEscrowRequest:](v70, "initWithEscrowRequest:", v71);

      if (v72)
      {
        objc_msgSend( objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "description")), "UTF8String");
        errx(1, "SecEscrowRequest failed: %s");
      }

      v74 = v61;
      v75 = v122;
      v76 = (void *)v59;
      v109 = v73;
      if ((_DWORD)v185)
      {
        v77 = v123;
        uint64_t v78 = -[OTControlCLI resetOctagon:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:isGuitarfish:timeout:]( v123,  "resetOctagon:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:isGuitarfish:timeout:",  v69,  v74,  v59,  (_DWORD)v150 != 0,  v133 != 0,  v57);
LABEL_128:
        uint64_t v37 = v78;
        v79 = (void *)v110;
        v80 = (void *)v121;
LABEL_134:
        v83 = (void *)v111;
        v82 = v112;
LABEL_135:

        objc_autoreleasePoolPop(context);
        return v37;
      }

      v77 = v123;
      if (HIDWORD(v184))
      {
        LOBYTE(v106) = (_DWORD)v150 != 0;
        v80 = (void *)v121;
        v79 = (void *)v110;
        uint64_t v81 = -[OTControlCLI resetProtectedData:appleID:dsid:idmsTargetContext:idmsCuttlefishPassword:isGuitarfish:notifyIdMS:]( v123,  "resetProtectedData:appleID:dsid:idmsTargetContext:idmsCuttlefishPassword:isGuitarfish:notifyIdMS:",  v69,  v121,  v110,  v74,  v59,  v133 != 0,  v106);
LABEL_133:
        uint64_t v37 = v81;
        goto LABEL_134;
      }

      if ((_DWORD)v184)
      {
        v80 = (void *)v121;
        v79 = (void *)v110;
        uint64_t v81 = -[OTControlCLI reset:appleID:isGuitarfish:dsid:]( v123,  "reset:appleID:isGuitarfish:dsid:",  v69,  v121,  v133 != 0,  v110);
        goto LABEL_133;
      }

      if (HIDWORD(v183))
      {
        v83 = (void *)v111;
        v82 = v112;
        if (HIDWORD(v151) && (_DWORD)v151)
        {
          sub_1000042FC((uint64_t)v132);
          uint64_t v37 = 1LL;
          v79 = (void *)v110;
          v80 = (void *)v121;
        }

        else
        {
          v79 = (void *)v110;
          v80 = (void *)v121;
          if (v151) {
            uint64_t v84 = -[OTControlCLI setUserControllableViewsSyncStatus:enabled:]( v123,  "setUserControllableViewsSyncStatus:enabled:",  v69,  HIDWORD(v151) != 0);
          }
          else {
            uint64_t v84 = -[OTControlCLI fetchUserControllableViewsSyncStatus:]( v123,  "fetchUserControllableViewsSyncStatus:",  v69);
          }
          uint64_t v37 = v84;
        }

        goto LABEL_135;
      }

      if ((_DWORD)v183)
      {
        uint64_t v78 = -[OTControlCLI fetchAllBottles:control:overrideEscrowCache:]( v123,  "fetchAllBottles:control:overrideEscrowCache:",  v69,  v122,  v107);
        goto LABEL_128;
      }

      if (HIDWORD(v182))
      {
        if (v157) {
          uint64_t v85 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v157,  4LL));
        }
        else {
          uint64_t v85 = 0LL;
        }
        v108 = (void *)v85;
        if (v159)
        {
          uint64_t v86 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v159,  4LL));
          v87 = (void *)v86;
          if (v85 && v86)
          {
            v88 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v85,  0LL);
            if (!v88) {
              errx(1, "bad base64 string passed to --entropy");
            }
            v89 = v88;
            uint64_t v37 = -[OTControlCLI recoverUsingBottleID:entropy:arguments:control:]( v123,  "recoverUsingBottleID:entropy:arguments:control:",  v87,  v88,  v69,  v122);

            goto LABEL_159;
          }
        }

        else
        {
          v87 = 0LL;
        }

        sub_1000042FC((uint64_t)v132);
        uint64_t v37 = 1LL;
LABEL_159:
        v79 = (void *)v110;
        v83 = (void *)v111;
        v80 = (void *)v121;
        v82 = v112;

LABEL_160:
        v77 = v123;
        goto LABEL_135;
      }

      if ((_DWORD)v182)
      {
        uint64_t v78 = -[OTControlCLI depart:](v123, "depart:", v69);
        goto LABEL_128;
      }

      if (HIDWORD(v186))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI startOctagonStateMachine:](v123, "startOctagonStateMachine:", v69);
LABEL_174:
        uint64_t v37 = v90;
LABEL_175:
        v79 = (void *)v110;
        v80 = (void *)v121;
        v82 = v112;
LABEL_176:
        v83 = (void *)v111;
        v75 = v122;
        goto LABEL_135;
      }

      if ((_DWORD)v186)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI signIn:](v123, "signIn:", v69);
        goto LABEL_174;
      }

      if (HIDWORD(v185))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI signOut:](v123, "signOut:", v69);
        goto LABEL_174;
      }

      if (HIDWORD(v181))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI status:json:](v123, "status:json:", v69, HIDWORD(v150) != 0);
        goto LABEL_174;
      }

      if ((_DWORD)v178)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI fetchEscrowRecords:json:overrideEscrowCache:]( v123,  "fetchEscrowRecords:json:overrideEscrowCache:",  v69,  HIDWORD(v150) != 0,  v107);
        goto LABEL_174;
      }

      if (HIDWORD(v177))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI fetchAllEscrowRecords:json:overrideEscrowCache:]( v123,  "fetchAllEscrowRecords:json:overrideEscrowCache:",  v69,  HIDWORD(v150) != 0,  v107);
        goto LABEL_174;
      }

      if ((_DWORD)v161)
      {
        if (v152)
        {
          v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v152,  4LL));
          id v92 = objc_claimAutoreleasedReturnValue([v91 description]);
          printf("machineID: %s\n", (const char *)[v92 UTF8String]);
        }

        else
        {
          puts("unsetting machineID");
          v91 = 0LL;
        }

        uint64_t v37 = -[OTControlCLI setMachineIDOverride:machineID:json:]( v123,  "setMachineIDOverride:machineID:json:",  v69,  v91,  HIDWORD(v150) != 0);

        v77 = v123;
        goto LABEL_175;
      }

      if ((_DWORD)v177)
      {
        if (v155) {
          v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v155,  4LL));
        }
        else {
          v93 = 0LL;
        }
        if (v157)
        {
          uint64_t v95 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v157,  4LL));
          v96 = (void *)v95;
          if (v93 && v95 && v121)
          {
            uint64_t v37 = -[OTControlCLI performEscrowRecovery:recordID:appleID:secret:overrideForAccountScript:overrideEscrowCache:]( v123,  "performEscrowRecovery:recordID:appleID:secret:overrideForAccountScript:overrideEscrowCache:",  v69,  v93,  v121,  v95,  -[__CFString isEqualToString:](v115, "isEqualToString:", @"YES"),  v107);
LABEL_200:

LABEL_206:
            v79 = (void *)v110;
            v83 = (void *)v111;
            v80 = (void *)v121;
            v75 = v122;
            v82 = v112;
            goto LABEL_160;
          }
        }

        else
        {
          v96 = 0LL;
        }

        sub_1000042FC((uint64_t)v132);
        uint64_t v37 = 1LL;
        goto LABEL_200;
      }

      if (HIDWORD(v176))
      {
        if (v157)
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v157,  4LL));
          if (v94 && v121)
          {
            uint64_t v37 = -[OTControlCLI performSilentEscrowRecovery:appleID:secret:]( v123,  "performSilentEscrowRecovery:appleID:secret:",  v69,  v121,  v94);
LABEL_205:

            goto LABEL_206;
          }
        }

        else
        {
          v94 = 0LL;
        }

        sub_1000042FC((uint64_t)v132);
        uint64_t v37 = 1LL;
        goto LABEL_205;
      }

      if (HIDWORD(v162))
      {
        v82 = v112;
        id v97 = -[__CFString isEqualToString:](v112, "isEqualToString:", @"YES");
        v77 = v123;
        uint64_t v37 = -[OTControlCLI healthCheck:skipRateLimitingCheck:repair:json:]( v123,  "healthCheck:skipRateLimitingCheck:repair:json:",  v69,  v97,  v148 != 0,  HIDWORD(v150) != 0);
        v79 = (void *)v110;
        v80 = (void *)v121;
        goto LABEL_176;
      }

      if ((_DWORD)v162)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI simulateReceivePush:json:](v123, "simulateReceivePush:json:", v69, HIDWORD(v150) != 0);
        goto LABEL_174;
      }

      if (HIDWORD(v161))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI tlkRecoverability:](v123, "tlkRecoverability:", v69);
        goto LABEL_174;
      }

      if ((_DWORD)v179)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI refetchCKKSPolicy:](v123, "refetchCKKSPolicy:", v69);
        goto LABEL_174;
      }

      if (HIDWORD(v178))
      {
        if (!v145) {
          v145 = "1";
        }
        v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
        v77 = v123;
        uint64_t v37 = -[OTControlCLI tapToRadar:description:radar:]( v123,  "tapToRadar:description:radar:",  @"action",  @"description",  v98);

        goto LABEL_175;
      }

      if ((_DWORD)v176)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI resetAccountCDPContentsWithArguments:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:]( v123,  "resetAccountCDPContentsWithArguments:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:",  v69,  v74,  v59,  (_DWORD)v150 != 0);
        goto LABEL_174;
      }

      if (HIDWORD(v175))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI createCustodianRecoveryKeyWithArguments:uuidString:json:timeout:]( v123,  "createCustodianRecoveryKeyWithArguments:uuidString:json:timeout:",  v69,  v117,  HIDWORD(v150) != 0,  v57);
        goto LABEL_174;
      }

      if ((_DWORD)v175)
      {
        if (v119 && v118 && v117)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI joinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:]( v123,  "joinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:",  v69,  v119,  v118,  v117,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v174))
      {
        if (v119 && v118 && v117)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI preflightJoinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:]( v123,  "preflightJoinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:",  v69,  v119,  v118,  v117,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if ((_DWORD)v174)
      {
        if (v117)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI removeCustodianRecoveryKeyWithArguments:uuidString:timeout:]( v123,  "removeCustodianRecoveryKeyWithArguments:uuidString:timeout:",  v69,  v117,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v173))
      {
        if (v117)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI checkCustodianRecoveryKeyWithArguments:uuidString:timeout:]( v123,  "checkCustodianRecoveryKeyWithArguments:uuidString:timeout:",  v69,  v117,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v172))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI removeRecoveryKeyWithArguments:](v123, "removeRecoveryKeyWithArguments:", v69);
        goto LABEL_174;
      }

      if ((_DWORD)v173)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI setRecoveryKeyWithArguments:](v123, "setRecoveryKeyWithArguments:", v69);
        goto LABEL_174;
      }

      if ((_DWORD)v172)
      {
        if (v113)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI joinWithRecoveryKeyWithArguments:recoveryKey:]( v123,  "joinWithRecoveryKeyWithArguments:recoveryKey:",  v69,  v113);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v171))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI checkRecoveryKeyWithArguments:](v123, "checkRecoveryKeyWithArguments:", v69);
        goto LABEL_174;
      }

      if ((_DWORD)v171)
      {
        if (v113)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI preflightJoinWithRecoveryKeyWithArguments:recoveryKey:]( v123,  "preflightJoinWithRecoveryKeyWithArguments:recoveryKey:",  v69,  v113);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v170))
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI createInheritanceKeyWithArguments:uuidString:json:timeout:]( v123,  "createInheritanceKeyWithArguments:uuidString:json:timeout:",  v69,  v116,  HIDWORD(v150) != 0,  v57);
        goto LABEL_174;
      }

      if ((_DWORD)v170)
      {
        v77 = v123;
        uint64_t v90 = -[OTControlCLI generateInheritanceKeyWithArguments:json:timeout:]( v123,  "generateInheritanceKeyWithArguments:json:timeout:",  v69,  HIDWORD(v150) != 0,  v57);
        goto LABEL_174;
      }

      if (HIDWORD(v169))
      {
        if (v119 && v118 && v116)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI storeInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:]( v123,  "storeInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:",  v69,  v119,  v118,  v116,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if ((_DWORD)v169)
      {
        if (v119 && v118 && v116)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI joinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:]( v123,  "joinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:",  v69,  v119,  v118,  v116,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v168))
      {
        if (v119 && v118 && v116)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI preflightJoinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:]( v123,  "preflightJoinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:",  v69,  v119,  v118,  v116,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if ((_DWORD)v168)
      {
        if (v116)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI removeInheritanceKeyWithArguments:uuidString:timeout:]( v123,  "removeInheritanceKeyWithArguments:uuidString:timeout:",  v69,  v116,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if (HIDWORD(v167))
      {
        if (v116)
        {
          v77 = v123;
          uint64_t v90 = -[OTControlCLI checkInheritanceKeyWithArguments:uuidString:timeout:]( v123,  "checkInheritanceKeyWithArguments:uuidString:timeout:",  v69,  v116,  v57);
          goto LABEL_174;
        }

        goto LABEL_313;
      }

      if ((_DWORD)v167)
      {
        if (v119 && v118 && v111)
        {
          v77 = v123;
          v83 = (void *)v111;
          uint64_t v99 = -[OTControlCLI recreateInheritanceKeyWithArguments:uuidString:wrappingKey:wrappedKey:claimToken:json:timeout:]( v123,  "recreateInheritanceKeyWithArguments:uuidString:wrappingKey:wrappedKey:claimToken:json:timeout:",  v69,  v116,  v119,  v118,  v111,  HIDWORD(v150) != 0,  v57);
LABEL_284:
          uint64_t v37 = v99;
          v79 = (void *)v110;
          v80 = (void *)v121;
          v75 = v122;
          v82 = v112;
          goto LABEL_135;
        }
      }

      else
      {
        if (!HIDWORD(v166))
        {
          if (HIDWORD(v164))
          {
            v77 = v123;
            uint64_t v90 = -[OTControlCLI enableWalrusWithArguments:timeout:]( v123,  "enableWalrusWithArguments:timeout:",  v69,  v57);
            goto LABEL_174;
          }

          if ((_DWORD)v164)
          {
            v77 = v123;
            uint64_t v90 = -[OTControlCLI disableWalrusWithArguments:timeout:]( v123,  "disableWalrusWithArguments:timeout:",  v69,  v57);
            goto LABEL_174;
          }

          if (HIDWORD(v163))
          {
            v77 = v123;
            uint64_t v90 = -[OTControlCLI enableWebAccessWithArguments:timeout:]( v123,  "enableWebAccessWithArguments:timeout:",  v69,  v57);
            goto LABEL_174;
          }

          if ((_DWORD)v163)
          {
            v77 = v123;
            uint64_t v90 = -[OTControlCLI disableWebAccessWithArguments:timeout:]( v123,  "disableWebAccessWithArguments:timeout:",  v69,  v57);
            goto LABEL_174;
          }

          if ((_DWORD)v166)
          {
            v77 = v123;
            uint64_t v90 = -[OTControlCLI fetchAccountSettingsWithArguments:json:]( v123,  "fetchAccountSettingsWithArguments:json:",  v69,  HIDWORD(v150) != 0);
            goto LABEL_174;
          }

          if (HIDWORD(v165))
          {
            BOOL v100 = (_DWORD)v149 != 0;
            BOOL v101 = HIDWORD(v150) != 0;
            v77 = v123;
            v102 = v123;
            id v103 = v69;
            uint64_t v104 = 0LL;
          }

          else
          {
            if (!(_DWORD)v165)
            {
              if ((_DWORD)v181)
              {
                uint64_t v105 = -[EscrowRequestCLI trigger](v73, "trigger");
              }

              else if (HIDWORD(v180))
              {
                uint64_t v105 = -[EscrowRequestCLI status](v73, "status");
              }

              else if ((_DWORD)v180)
              {
                uint64_t v105 = -[EscrowRequestCLI reset](v73, "reset");
              }

              else
              {
                if (!HIDWORD(v179))
                {
                  if (HIDWORD(v149))
                  {
                    v77 = v123;
                    uint64_t v90 = -[OTControlCLI printAccountMetadataWithArguments:json:]( v123,  "printAccountMetadataWithArguments:json:",  v69,  HIDWORD(v150) != 0);
                    goto LABEL_174;
                  }

                  if (v160)
                  {
                    v77 = v123;
                    uint64_t v90 = -[OTControlCLI rerollWithArguments:json:]( v123,  "rerollWithArguments:json:",  v69,  HIDWORD(v150) != 0);
                    goto LABEL_174;
                  }

                  goto LABEL_313;
                }

                uint64_t v105 = -[EscrowRequestCLI storePrerecordsInEscrow](v73, "storePrerecordsInEscrow");
              }

              uint64_t v37 = v105;
              goto LABEL_206;
            }

            BOOL v100 = (_DWORD)v149 != 0;
            BOOL v101 = HIDWORD(v150) != 0;
            v77 = v123;
            v102 = v123;
            id v103 = v69;
            uint64_t v104 = 1LL;
          }

          uint64_t v90 = -[OTControlCLI fetchAccountWideSettingsWithArguments:useDefault:forceFetch:json:]( v102,  "fetchAccountWideSettingsWithArguments:useDefault:forceFetch:json:",  v103,  v104,  v100,  v101);
          goto LABEL_174;
        }

        if (v119 && v111)
        {
          v77 = v123;
          v83 = (void *)v111;
          uint64_t v99 = -[OTControlCLI createInheritanceKeyWithClaimTokenAndWrappingKey:uuidString:claimToken:wrappingKey:json:timeout:]( v123,  "createInheritanceKeyWithClaimTokenAndWrappingKey:uuidString:claimToken:wrappingKey:json:timeout:",  v69,  v116,  v111,  v119,  HIDWORD(v150) != 0,  v57);
          goto LABEL_284;
        }
      }

LABEL_313:
      sub_1000042FC((uint64_t)v132);
      uint64_t v37 = 1LL;
      goto LABEL_206;
    }

    if (v21 == 104) {
      goto LABEL_167;
    }
    if ((v124 & 1) != 0)
    {
      uint64_t v22 = 0LL;
    }

    else
    {
      uint64_t v22 = 0LL;
      v32 = (char *)v195[2];
      while (v21 != *v32)
      {
        ++v22;
        v32 += 104;
        if (v2 == v22) {
          goto LABEL_49;
        }
      }

      __int128 v33 = *((_OWORD *)v32 + 5);
      __int128 v191 = *((_OWORD *)v32 + 4);
      __int128 v192 = v33;
      uint64_t v193 = *((void *)v32 + 12);
      __int128 v34 = *((_OWORD *)v32 + 1);
      __int128 v187 = *(_OWORD *)v32;
      __int128 v188 = v34;
      __int128 v35 = *((_OWORD *)v32 + 3);
      __int128 v189 = *((_OWORD *)v32 + 2);
      __int128 v190 = v35;
      sub_1000048C4((uint64_t)&v187, optarg);
    }
  }

  while (v22 != v2);
LABEL_49:
  v36 = v195[2];
LABEL_50:
  free(v36);
  free(v3);
  free(v6);
LABEL_51:
  putchar(10);
  sub_1000042FC((uint64_t)v132);
  return 1LL;
}

void sub_1000076DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000077B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007884( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007958( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007B04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000093AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100009528( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100009778( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100009894( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009970( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009A44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009B48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009C24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009CF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A068( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000A38C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000A6C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000A8A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000AA7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000AB60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000ACCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000ADD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000AFB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000B194( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000B314( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000B5EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000B920( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000BC54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000BE38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C010( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C3C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_10000C68C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void sub_10000C854( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CA1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CBE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CDAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CE9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000D264( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000D3D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000D5A8(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (!(v3 | v4))
  {
    NSLog(@"Must provide either an AppleID or a DSID to fetch a PET");
    exit(1);
  }

  uint64_t v5 = (void *)v4;
  id v6 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  [v6 setUsername:v3];
  [v6 setAuthenticationType:1];
  [v6 setIsUsernameEditable:0];
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10000D734;
  uint64_t v19 = sub_10000D744;
  id v20 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  id v8 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000D74C;
  v12[3] = &unk_100020770;
  uint64_t v14 = &v15;
  uint64_t v9 = v7;
  uint64_t v13 = v9;
  [v8 authenticateWithContext:v6 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void sub_10000D71C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000D734(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000D744(uint64_t a1)
{
}

void sub_10000D74C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    NSLog(@"error fetching PET: %@", v5);
    exit(1);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D7D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      id v9 = @"error";
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
      id v10 = v5;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      sub_10000D8EC(v6);
    }

    else
    {
      uint64_t v7 = __stderrp;
      id v8 = objc_claimAutoreleasedReturnValue([v3 description]);
      fprintf(v7, "Error rerolling: %s\n", (const char *)[v8 UTF8String]);
    }
  }

  else
  {
    puts("Reroll successful.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

void sub_10000D8EC(void *a1)
{
  id v1 = sub_10000D9B4(a1);
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v6 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v2,  3LL,  &v6));
  id v4 = v6;

  if (v3)
  {
    id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v3, 4LL);
    puts(-[NSString UTF8String](v5, "UTF8String"));
  }

  else
  {
    id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    NSLog(@"error during JSONification: %@", v5);
  }
}

id sub_10000D9B4(void *a1)
{
  if (a1)
  {
    id v1 = [a1 mutableCopy];
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "allKeys", 0));
    id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          id v8 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:v7]);
          id v9 = sub_10000DAF8(v8);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          [v1 setObject:v10 forKeyedSubscript:v7];
        }

        id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v4);
    }
  }

  else
  {
    id v1 = 0LL;
  }

  return v1;
}

id sub_10000DAF8(void *a1)
{
  id v2 = a1;
  if (!v2)
  {
    id v8 = 0LL;
    goto LABEL_10;
  }

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError, v1);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v38[0] = @"code";
    id v4 = v2;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    v38[1] = @"domain";
    v39[0] = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    v39[1] = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  2LL));
    id v8 = [v7 mutableCopy];

    id v9 = (NSISO8601DateFormatter *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v10 = sub_10000D9B4(v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    [v8 setObject:v11 forKeyedSubscript:@"userInfo"];
LABEL_4:

    goto LABEL_10;
  }

  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v2)
    || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12), (objc_opt_isKindOfClass(v2, v13) & 1) != 0))
  {
    id v15 = v2;
    goto LABEL_9;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData, v14);
  if ((objc_opt_isKindOfClass(v2, v17) & 1) != 0)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue([v2 base64EncodedStringWithOptions:0]);
    goto LABEL_9;
  }

  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDictionary, v18);
  if ((objc_opt_isKindOfClass(v2, v19) & 1) != 0)
  {
    uint64_t v21 = sub_10000D9B4(v2);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_9;
  }

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray, v20);
  if ((objc_opt_isKindOfClass(v2, v22) & 1) == 0)
  {
    uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSDate, v23);
    if ((objc_opt_isKindOfClass(v2, v32) & 1) != 0)
    {
      id v11 = v2;
      id v9 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v9, "stringFromDate:", v11));
      goto LABEL_4;
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue([v2 description]);
LABEL_9:
    id v8 = v15;
    goto LABEL_10;
  }

  id v24 = v2;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v24 count]));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = sub_10000DAF8(*(void *)(*((void *)&v33 + 1) + 8LL * (void)i));
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        objc_msgSend(v8, "addObject:", v31, (void)v33);
      }

      id v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v27);
  }

LABEL_10:
  return v8;
}

void sub_10000DE3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
    id v8 = v10;
    if (*(_BYTE *)(a1 + 32))
    {
      sub_10000D8EC(v10);
LABEL_9:

      goto LABEL_10;
    }

    id v9 = objc_claimAutoreleasedReturnValue([v10 description]);
    puts((const char *)[v9 UTF8String]);
LABEL_8:

    goto LABEL_9;
  }

  if (*(_BYTE *)(a1 + 32))
  {
    uint64_t v13 = @"error";
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    uint64_t v14 = v8;
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    sub_10000D8EC(v9);
    goto LABEL_8;
  }

  id v11 = __stderrp;
  id v12 = objc_claimAutoreleasedReturnValue([v6 description]);
  fprintf(v11, "Failed to fetch account metadata: %s\n", (const char *)[v12 UTF8String]);

LABEL_10:
}

void sub_10000DF8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      id v9 = @"error";
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
      uint64_t v10 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      sub_10000D8EC(v6);
    }

    else
    {
      uint64_t v7 = __stderrp;
      id v8 = objc_claimAutoreleasedReturnValue([v3 description]);
      fprintf(v7, "Failed to set machineID override: %s\n", (const char *)[v8 UTF8String]);
    }
  }

  else
  {
    puts("successfully set machineID override!");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

void sub_10000E0A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      uint64_t v23 = @"error";
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      id v24 = v8;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      sub_10000D8EC(v9);
    }

    else
    {
      id v15 = __stderrp;
      id v16 = objc_claimAutoreleasedReturnValue([v6 description]);
      fprintf(v15, "Failed to fetch account settings: %s\n", (const char *)[v16 UTF8String]);
    }
  }

  else
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v21[0] = @"walrus";
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 walrus]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 enabled]));
      v21[1] = @"webAccess";
      v22[0] = v11;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 webAccess]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v12 enabled]));
      v22[1] = v13;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));

      sub_10000D8EC(v14);
    }

    else
    {
      puts("successfully fetched account settings!");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 walrus]);
      else {
        uint64_t v18 = @"NO";
      }
      printf("walrus enabled? %s\n", (const char *)-[__CFString UTF8String](v18, "UTF8String"));

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 webAccess]);
      else {
        uint64_t v20 = @"NO";
      }
      printf("web access enabled? %s\n", (const char *)-[__CFString UTF8String](v20, "UTF8String"));
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

void sub_10000E310(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "disabling walrus failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successfully disabled walrus");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000E3DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "enabling walrus failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successfully enabled walrus");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000E4A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "enabling web access failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successfully enabled web access");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000E574(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "disabling webAccess failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successfully disabled webAccess");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000E640(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = __stderrp;
    id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
    fprintf( v7,  "createInheritanceKeyWithClaimTokenAndWrappingKey failed: %s\n",  (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
    id v12 = v11;
    if (*(_BYTE *)(a1 + 56)) {
      sub_10000D8EC(v11);
    }
    else {
      sub_10000E74C("Created inheritance key with claim+wrappingkey", v11);
    }
  }
}

void sub_10000E74C(const char *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"uuid"]);
  printf("%s %s\n", a1, (const char *)[v4 UTF8String]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (([v10 isEqualToString:@"uuid"] & 1) == 0)
        {
          id v11 = v10;
          id v12 = (const char *)[v11 UTF8String];
          id v13 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v11]);
          printf("\t%s: %s\n", v12, (const char *)[v13 UTF8String]);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }
}

void sub_10000E8DC(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = __stderrp;
    id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
    fprintf(v7, "recreateInheritanceKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
    id v12 = v11;
    if (*(_BYTE *)(a1 + 56)) {
      sub_10000D8EC(v11);
    }
    else {
      sub_10000E74C("Recreated inheritance key", v11);
    }
  }
}

void sub_10000E9E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  __int128 v14 = v5;
  if (!v5)
  {
    id v12 = "does not exist";
    if (a2) {
      id v12 = "exists";
    }
    printf("successful check of inheritance key: %s\n", v12);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    if (a2) {
      *(_DWORD *)(v13 + 24) = 0;
    }
    else {
      *(_DWORD *)(v13 + 24) = 1;
    }
    goto LABEL_10;
  }

  id v6 = __stderrp;
  id v7 = objc_claimAutoreleasedReturnValue([v5 description]);
  fprintf(v6, "checking inheritance key failed: %s\n", (const char *)[v7 UTF8String]);

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  id v8 = v14;
  if (v9 > 0.0)
  {
    unsigned int v10 = [v14 isRetryable];
    id v8 = v14;
    if (v10)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v14 retryInterval];
      sleep(v11);
LABEL_10:
      id v8 = v14;
    }
  }
}

void sub_10000EAEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "remove inheritance key failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successful removal of inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000EBB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "preflight joinWithInheritanceKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successful preflight join from inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000EC84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "joinWithInheritanceKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successful join from inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000ED50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
    printf("storeInheritanceKey failed: %s\n", (const char *)[v4 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v5 > 0.0 && [v7 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v7 retryInterval];
      sleep(v6);
    }
  }

  else
  {
    puts("successful store of inheritance key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000EE04(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v5 description]);
    printf("generateInheritanceKey failed: %s\n", (const char *)[v7 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v8 > 0.0 && [v6 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v6 retryInterval];
      sleep(v9);
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 dictionary]);
    double v11 = v10;
    if (*(_BYTE *)(a1 + 56)) {
      sub_10000D8EC(v10);
    }
    else {
      sub_10000E74C("Generated inheritance key", v10);
    }
  }
}

void sub_10000EF00(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    id v7 = __stderrp;
    id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
    fprintf(v7, "createInheritanceKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
    id v12 = v11;
    if (*(_BYTE *)(a1 + 56)) {
      sub_10000D8EC(v11);
    }
    else {
      sub_10000E74C("Created inheritance key", v11);
    }
  }
}

void sub_10000F00C(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v3 = __stderrp;
    id v8 = objc_claimAutoreleasedReturnValue([a3 description]);
    fprintf(v3, "preflight join with recovery key failed: %s\n", (const char *)[v8 UTF8String]);
  }

  else
  {
    double v6 = (const char *)[*(id *)(a1 + 32) UTF8String];
    id v7 = "failure";
    if (a2) {
      id v7 = "success";
    }
    printf("preflight joined using recovery key %s, in octagon: %s\n", v6, v7);
    if (a2) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    }
  }
}

void sub_10000F0C8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "joining with recovery key failed: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    printf( "successfully joined using recovery key %s, in octagon\n", (const char *)[*(id *)(a1 + 32) UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

void sub_10000F164(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "set recovery key failed: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    printf( "successfully registered recovery key %s, in octagon\n", (const char *)[*(id *)(a1 + 32) UTF8String]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

void sub_10000F200(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "remove recovery key failed: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("successful removal of recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_10000F28C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  __int128 v14 = v5;
  if (!v5)
  {
    id v12 = "does not exist";
    if (a2) {
      id v12 = "exists";
    }
    printf("successful check of custodian recovery key: %s\n", v12);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
    if (a2) {
      *(_DWORD *)(v13 + 24) = 0;
    }
    else {
      *(_DWORD *)(v13 + 24) = 1;
    }
    goto LABEL_10;
  }

  double v6 = __stderrp;
  id v7 = objc_claimAutoreleasedReturnValue([v5 description]);
  fprintf(v6, "checking custodian recovery key failed: %s\n", (const char *)[v7 UTF8String]);

  [*(id *)(a1 + 32) timeIntervalSinceNow];
  id v8 = v14;
  if (v9 > 0.0)
  {
    unsigned int v10 = [v14 isRetryable];
    id v8 = v14;
    if (v10)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v14 retryInterval];
      sleep(v11);
LABEL_10:
      id v8 = v14;
    }
  }
}

void sub_10000F390(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "remove custodian recovery key failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successful removal of custodian recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000F45C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "preflightJoinWithCustodianRecoveryKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successful preflight join from custodian recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000F528(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "joinWithCustodianRecoveryKey failed: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("successful join from custodian recovery key");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_10000F5F4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = __stderrp;
    id v8 = objc_claimAutoreleasedReturnValue([v5 description]);
    fprintf(v7, "createCustodianRecoveryKey failed: %s\n", (const char *)[v8 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v9 > 0.0 && [v6 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v6 retryInterval];
      sleep(v10);
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
    id v12 = v11;
    if (*(_BYTE *)(a1 + 56)) {
      sub_10000D8EC(v11);
    }
    else {
      sub_10000E74C("Created custodian key", v11);
    }
  }
}

uint64_t sub_10000F700(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v3, "Error resetting account cdp content: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("Succeeded resetting account cdp content");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000F78C(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v3 = __stderrp;
    id v6 = objc_claimAutoreleasedReturnValue([a3 description]);
    fprintf(v3, "Error setting user controllable views: %s\n", (const char *)[v6 UTF8String]);
  }

  else
  {
    if (a2) {
      id v5 = @"enabled";
    }
    else {
      id v5 = @"paused";
    }
    printf( "User controllable views are currently %s.\n", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_10000F83C(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v3 = __stderrp;
    id v6 = objc_claimAutoreleasedReturnValue([a3 description]);
    fprintf(v3, "Error setting user controllable views: %s\n", (const char *)[v6 UTF8String]);
  }

  else
  {
    if (a2) {
      id v5 = @"enabled";
    }
    else {
      id v5 = @"paused";
    }
    printf( "User controllable views are now %s.\n", (const char *)-[__CFString UTF8String](v5, "UTF8String"));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_10000F8EC(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "Error trigger TTR: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("Trigger TTR completed.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_10000F978(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "Error refetching CKKS policy: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("CKKS refetch completed.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_10000FA04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      double v9 = @"error";
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
      double v10 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      sub_10000D8EC(v6);
    }

    else
    {
      double v7 = __stderrp;
      id v8 = objc_claimAutoreleasedReturnValue([v3 description]);
      fprintf(v7, "Error simulating push: %s\n", (const char *)[v8 UTF8String]);
    }
  }

  else
  {
    if (*(_BYTE *)(a1 + 40)) {
      sub_10000D8EC(&__NSDictionary0__struct);
    }
    else {
      puts("Simulated push sent.");
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

void sub_10000FB30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      __int128 v15 = @"error";
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      __int128 v16 = v8;
      double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      sub_10000D8EC(v9);
    }

    else
    {
      id v12 = __stderrp;
      id v13 = objc_claimAutoreleasedReturnValue([v6 description]);
      fprintf(v12, "Error checking health: %s\n", (const char *)[v13 UTF8String]);
    }
  }

  else
  {
    if (v5)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
      double v11 = v10;
      if (*(_BYTE *)(a1 + 40))
      {
        sub_10000D8EC(v10);
      }

      else
      {
        puts("Checking Octagon Health completed.");
        id v14 = objc_claimAutoreleasedReturnValue([v11 description]);
        puts((const char *)[v14 UTF8String]);
      }
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

void sub_10000FCAC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = secLogObjForScope("clique");
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      int v22 = 138412290;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "findOptimalBottleIDsWithContextData errored: %@\n",  (uint8_t *)&v22,  0xCu);
    }
  }

  else
  {
    if (v12)
    {
      int v22 = 138412546;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "findOptimalBottleIDsWithContextData succeeded: %@, %@\n",  (uint8_t *)&v22,  0x16u);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v15 = v9;

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8LL);
  __int128 v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v7;
  id v18 = v7;

  uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v8;
  id v21 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000FE48(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10000FE7C(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
}

uint64_t sub_10000FEB0(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    id v3 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v3, "Error recovering: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    id v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) description]);
    printf("Succeeded recovering bottled peer %s\n", (const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000FF6C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      BOOL v12 = __stderrp;
      id v13 = objc_claimAutoreleasedReturnValue([v8 description]);
      fprintf(v12, "Error fetching status: %s\n", (const char *)[v13 UTF8String]);

      goto LABEL_59;
    }

    uint64_t v84 = @"error";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    uint64_t v85 = v10;
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v85,  &v84,  1LL));
    sub_10000D8EC(v11);

    goto LABEL_7;
  }

  if (v7)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    if (*(_BYTE *)(a1 + 48))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTControlCLI annotateStatus:](&OBJC_CLASS___OTControlCLI, "annotateStatus:", v7));
      sub_10000D8EC(v10);
LABEL_7:

      goto LABEL_59;
    }

    id v14 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"containerName"]);
    id v15 = (const char *)[v14 UTF8String];
    id v16 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"contextID"]);
    printf("Status for %s,%s:\n", v15, (const char *)[v16 UTF8String]);

    id v17 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"activeAccount"]);
    printf("Active account: %s\n", (const char *)[v17 UTF8String]);

    putchar(10);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"state"]);
    id v19 = objc_claimAutoreleasedReturnValue([v18 description]);
    printf("State: %s\n", (const char *)[v19 UTF8String]);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"stateFlags"]);
    id v21 = [v20 count];
    if (v21)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"stateFlags"]);
      id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
      int v22 = (const char *)[v4 UTF8String];
    }

    else
    {
      int v22 = "none";
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"statePendingFlags"]);
    if ([v23 count])
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"statePendingFlags"]);
      id v25 = objc_claimAutoreleasedReturnValue([v24 description]);
      printf("Flags: %s; Flags Pending: %s\n\n", v22, (const char *)[v25 UTF8String]);
    }

    else
    {
      printf("Flags: %s; Flags Pending: %s\n\n", v22, "none");
    }

    uint64_t v70 = a1;

    if (v21)
    {
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"contextDump"]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    v73 = v26;
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"peers"]);
    id v30 = [v29 countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v79;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v79 != v32) {
            objc_enumerationMutation(v29);
          }
          __int128 v34 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"peerID"]);
          if (v35)
          {
            [v27 setObject:v34 forKeyedSubscript:v35];
            [v28 addObject:v35];
          }
        }

        id v31 = [v29 countByEnumeratingWithState:&v78 objects:v83 count:16];
      }

      while (v31);
    }

    id v72 = v7;

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKeyedSubscript:@"custodian_recovery_keys"]);
    id v38 = [v37 countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v75;
      do
      {
        for (j = 0LL; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)j);
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"peerID"]);
          if (v43) {
            [v36 setObject:v42 forKeyedSubscript:v43];
          }
        }

        id v39 = [v37 countByEnumeratingWithState:&v74 objects:v82 count:16];
      }

      while (v39);
    }

    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKeyedSubscript:@"self"]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"peerID"]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"stableInfo"]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"dynamicInfo"]);
    if (v45)
    {
      id v48 = [v28 mutableCopy];
      [*(id *)(v70 + 32) printPeer:v44 prefix:@"    Self: "];
      putchar(10);
      [v27 setObject:v44 forKeyedSubscript:v45];
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"included"]);
      puts("Trusted peers (by me):");
      id v69 = v48;
      if (v49 && [v49 count])
      {
        [*(id *)(v70 + 32) printPeers:v49 egoPeerID:v45 informationOnPeers:v27 informationOnCRKs:v36];
        [v48 removeObjectsInArray:v49];
      }

      else
      {
        puts("    No trusted peers.");
      }

      v68 = v49;
      putchar(10);
      v66 = v47;
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"excluded"]);
      puts("Excluded peers (by me):");
      id v7 = v72;
      if (v50 && [v50 count])
      {
        [*(id *)(v70 + 32) printPeers:v50 egoPeerID:v45 informationOnPeers:v27 informationOnCRKs:v36];
        v51 = v69;
        [v69 removeObjectsInArray:v50];
      }

      else
      {
        puts("    No excluded peers.");
        v51 = v69;
      }

      putchar(10);
      puts("Other peers (included/excluded by others):");
      v67 = v45;
      if ([v51 count]) {
        [*(id *)(v70 + 32) printPeers:v51 egoPeerID:v45 informationOnPeers:v27 informationOnCRKs:v36];
      }
      else {
        puts("    No other peers.");
      }
      uint64_t v52 = v68;
      putchar(10);
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"recovery_encryption_public_key"]);
      v54 = v46;
      if (v53)
      {
        v55 = (void *)v53;
        v56 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"recovery_signing_public_key"]);

        if (v56)
        {
          puts("Recovery Key:");
          double v57 = objc_alloc(&OBJC_CLASS___NSData);
          uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"recovery_signing_public_key"]);
          v71 = -[NSData initWithData:](v57, "initWithData:", v58);

          id v7 = v72;
          uint64_t v59 = objc_alloc(&OBJC_CLASS___NSData);
          v60 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"recovery_encryption_public_key"]);
          v61 = -[NSData initWithData:](v59, "initWithData:", v60);

          id v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v71, "base64EncodedStringWithOptions:", 0LL));
          v63 = v61;
          id v64 = objc_claimAutoreleasedReturnValue( -[NSData base64EncodedStringWithOptions:]( v61, "base64EncodedStringWithOptions:", 0LL));
          printf("    Encryption public key: %s\n", (const char *)[v64 UTF8String]);
          id v65 = v62;
          printf("    Signing public key: %s\n", (const char *)[v65 UTF8String]);
          putchar(10);

          uint64_t v52 = v68;
        }
      }

      id v9 = 0LL;
      v46 = v54;
      v47 = v66;
      v45 = v67;
    }

    else
    {
      puts("No current identity for this device.\n");
      if ([v28 count])
      {
        puts("All peers currently in this account:");
        [*(id *)(v70 + 32) printPeers:v28 egoPeerID:0 informationOnPeers:v27 informationOnCRKs:v36];
      }

      else
      {
        puts("No peers currently exist for this account.");
      }

      id v9 = 0LL;
      id v7 = v72;
    }

    putchar(10);
  }

  else if (*(_BYTE *)(a1 + 48))
  {
    sub_10000D8EC(&off_100021660);
  }

  else
  {
    fwrite("Fetching status had no error and gave no result!\n", 0x31uLL, 1uLL, __stderrp);
  }

LABEL_59:
}

void sub_1000108A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = __stderrp;
    id v5 = objc_claimAutoreleasedReturnValue([v3 description]);
    fprintf(v4, "Error resetting: %s\n", (const char *)[v5 UTF8String]);

    [*(id *)(a1 + 32) timeIntervalSinceNow];
    if (v6 > 0.0 && [v8 isRetryable])
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      [v8 retryInterval];
      sleep(v7);
    }
  }

  else
  {
    puts("reset and establish:");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }
}

void sub_100010974(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "Error departing clique: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("Departing clique completed.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_100010A00(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "Error signing out: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("Sign out complete.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_100010A8C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "Error signing in: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("Sign in complete.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

void sub_100010B18(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue([a2 description]);
    fprintf(v2, "Error starting state machine: %s\n", (const char *)[v4 UTF8String]);
  }

  else
  {
    puts("state machine started.");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }

LABEL_11:
      id v13 = 0;
      goto LABEL_12;
    }

LABEL_8:
    id v13 = 0;
LABEL_13:

    goto LABEL_14;
  }

  id v13 = 0;
LABEL_14:

  return v13;
}

LABEL_10:
  return v4;
}

  BOOL v12 = -[NSData copyWithZone:](self->_syncingPolicy, "copyWithZone:", a3);
  id v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = -[NSData copyWithZone:](self->_voucher, "copyWithZone:", a3);
  id v15 = (void *)v5[13];
  v5[13] = v14;

  id v16 = -[NSData copyWithZone:](self->_voucherSignature, "copyWithZone:", a3);
  id v17 = (void *)v5[14];
  v5[14] = v16;

  uint64_t v32 = 0u;
  __int128 v33 = 0u;
  id v30 = 0u;
  id v31 = 0u;
  id v18 = self->_tlkSharesForVouchedIdentitys;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)i), "copyWithZone:", a3, (void)v30);
        [v5 addTlkSharesForVouchedIdentity:v23];
      }

      uint64_t v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
    }

    while (v20);
  }

  __int16 v24 = -[NSData copyWithZone:](self->_secureElementIdentity, "copyWithZone:", a3);
  id v25 = (void *)v5[8];
  v5[8] = v24;

  id v26 = (__int16)self->_has;
  if ((v26 & 0x80) != 0)
  {
    *((_BYTE *)v5 + 120) = self->_isInheritedAccount;
    *((_WORD *)v5 + 62) |= 0x80u;
    id v26 = (__int16)self->_has;
    if ((v26 & 0x100) == 0)
    {
LABEL_19:
      if ((v26 & 0x200) == 0) {
        goto LABEL_20;
      }
LABEL_29:
      *((_BYTE *)v5 + 122) = self->_warnedTooManyPeers;
      *((_WORD *)v5 + 62) |= 0x200u;
      if ((*(_WORD *)&self->_has & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_19;
  }

  *((_BYTE *)v5 + 121) = self->_warmedEscrowCache;
  *((_WORD *)v5 + 62) |= 0x100u;
  id v26 = (__int16)self->_has;
  if ((v26 & 0x200) != 0) {
    goto LABEL_29;
  }
LABEL_20:
  if ((v26 & 0x20) != 0)
  {
LABEL_21:
    *((_DWORD *)v5 + 1_Block_object_dispose(va, 8) = self->_sendingMetricsPermitted;
    *((_WORD *)v5 + 62) |= 0x20u;
  }

void sub_10001176C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100011788(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011798(uint64_t a1)
{
}

void sub_1000117A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CKRetryAfter"]);

  id v5 = obj;
  if (obj)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (!*(void *)(v6 + 40))
    {
LABEL_5:
      objc_storeStrong((id *)(v6 + 40), obj);
      id v5 = obj;
      goto LABEL_6;
    }

    [obj doubleValue];
    double v8 = v7;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
    id v5 = obj;
    if (v8 < v9)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
      goto LABEL_5;
    }
  }

LABEL_6:
}

LABEL_22:
  attemptedJoin = self->_attemptedJoin;
  if (attemptedJoin >= 3) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_attemptedJoin));
  }
  else {
    id v16 = *(&off_1000207F0 + attemptedJoin);
  }
  [v4 setObject:v16 forKey:@"attemptedJoin"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_26:
    cdpState = self->_cdpState;
    if (cdpState >= 3) {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_cdpState));
    }
    else {
      id v18 = *(&off_100020808 + cdpState);
    }
    [v4 setObject:v18 forKey:@"cdpState"];
  }

  id v27 = -[NSString copyWithZone:](self->_oldPeerID, "copyWithZone:", a3, (void)v30);
  uint64_t v28 = (void *)v5[6];
  v5[6] = v27;

  return v5;
}

LABEL_39:
  PBDataWriterWriteInt32Field(v5, self->_attemptedJoin, 7LL);
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field(v5, self->_cdpState, 8LL);
LABEL_14:
  syncingPolicy = self->_syncingPolicy;
  if (syncingPolicy) {
    PBDataWriterWriteDataField(v5, syncingPolicy, 11LL);
  }
  voucher = self->_voucher;
  if (voucher) {
    PBDataWriterWriteDataField(v5, voucher, 12LL);
  }
  voucherSignature = self->_voucherSignature;
  if (voucherSignature) {
    PBDataWriterWriteDataField(v5, voucherSignature, 13LL);
  }
  id v23 = 0u;
  __int16 v24 = 0u;
  id v21 = 0u;
  int v22 = 0u;
  id v13 = self->_tlkSharesForVouchedIdentitys;
  id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v14)
  {
    id v15 = v14;
    id v16 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteDataField(v5, *(void *)(*((void *)&v21 + 1) + 8LL * (void)i), 14LL);
      }

      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v15);
  }

  secureElementIdentity = self->_secureElementIdentity;
  if (secureElementIdentity) {
    PBDataWriterWriteDataField(v5, secureElementIdentity, 15LL);
  }
  id v19 = (__int16)self->_has;
  if ((v19 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_isInheritedAccount, 18LL);
    id v19 = (__int16)self->_has;
    if ((v19 & 0x100) == 0)
    {
LABEL_31:
      if ((v19 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_43;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_31;
  }

  PBDataWriterWriteBOOLField(v5, self->_warmedEscrowCache, 19LL);
  id v19 = (__int16)self->_has;
  if ((v19 & 0x200) == 0)
  {
LABEL_32:
    if ((v19 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  self->_attemptedJoin = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 62) & 8) != 0)
  {
LABEL_13:
    self->_cdpState = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 8u;
  }

LABEL_43:
  PBDataWriterWriteBOOLField(v5, self->_warnedTooManyPeers, 20LL);
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_33:
  }
    PBDataWriterWriteInt32Field(v5, self->_sendingMetricsPermitted, 22LL);
LABEL_34:
  oldPeerID = self->_oldPeerID;
  if (oldPeerID) {
    PBDataWriterWriteStringField(v5, oldPeerID, 23LL);
  }
}

  self->_warnedTooManyPeers = *((_BYTE *)v4 + 122);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 62) & 0x20) != 0)
  {
LABEL_33:
    self->_sendingMetricsPermitted = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x20u;
  }

LABEL_36:
  *((_DWORD *)v4 + _Block_object_dispose(va, 8) = self->_attemptedJoin;
  *((_WORD *)v4 + 62) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_cdpState;
    *((_WORD *)v4 + 62) |= 8u;
  }

LABEL_14:
  if (self->_syncingPolicy) {
    objc_msgSend(v13, "setSyncingPolicy:");
  }
  if (self->_voucher) {
    objc_msgSend(v13, "setVoucher:");
  }
  if (self->_voucherSignature) {
    objc_msgSend(v13, "setVoucherSignature:");
  }
  if (-[OTAccountMetadataClassC tlkSharesForVouchedIdentitysCount](self, "tlkSharesForVouchedIdentitysCount"))
  {
    [v13 clearTlkSharesForVouchedIdentitys];
    double v7 = -[OTAccountMetadataClassC tlkSharesForVouchedIdentitysCount](self, "tlkSharesForVouchedIdentitysCount");
    if (v7)
    {
      double v8 = v7;
      for (i = 0LL; i != v8; ++i)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[OTAccountMetadataClassC tlkSharesForVouchedIdentityAtIndex:]( self,  "tlkSharesForVouchedIdentityAtIndex:",  i));
        [v13 addTlkSharesForVouchedIdentity:v10];
      }
    }
  }

  if (self->_secureElementIdentity) {
    objc_msgSend(v13, "setSecureElementIdentity:");
  }
  double v11 = (__int16)self->_has;
  BOOL v12 = v13;
  if ((v11 & 0x80) != 0)
  {
    *((_BYTE *)v13 + 120) = self->_isInheritedAccount;
    *((_WORD *)v13 + 62) |= 0x80u;
    double v11 = (__int16)self->_has;
    if ((v11 & 0x100) == 0)
    {
LABEL_28:
      if ((v11 & 0x200) == 0) {
        goto LABEL_29;
      }
      goto LABEL_40;
    }
  }

  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_28;
  }

  *((_BYTE *)v13 + 121) = self->_warmedEscrowCache;
  *((_WORD *)v13 + 62) |= 0x100u;
  double v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_29:
    if ((v11 & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }

  double v7 = 0LL;
LABEL_15:
  double v8 = (unint64_t)-[NSData hash](self->_syncingPolicy, "hash");
  double v9 = (unint64_t)-[NSData hash](self->_voucher, "hash");
  uint64_t v10 = (unint64_t)-[NSData hash](self->_voucherSignature, "hash");
  double v11 = (unint64_t)-[NSMutableArray hash](self->_tlkSharesForVouchedIdentitys, "hash");
  BOOL v12 = (unint64_t)-[NSData hash](self->_secureElementIdentity, "hash");
  id v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    id v14 = 2654435761LL * self->_isInheritedAccount;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_17:
      id v15 = 2654435761LL * self->_warmedEscrowCache;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      id v16 = 0LL;
      if ((v13 & 0x20) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      id v17 = 0LL;
      return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_oldPeerID, "hash");
    }
  }

  else
  {
    id v14 = 0LL;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_17;
    }
  }

  id v15 = 0LL;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  id v16 = 2654435761LL * self->_warnedTooManyPeers;
  if ((v13 & 0x20) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  id v17 = 2654435761LL * self->_sendingMetricsPermitted;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_oldPeerID, "hash");
}

  if (*((void *)v4 + 10)) {
    -[OTAccountMetadataClassC setSyncingPolicy:](self, "setSyncingPolicy:");
  }
  if (*((void *)v4 + 13)) {
    -[OTAccountMetadataClassC setVoucher:](self, "setVoucher:");
  }
  if (*((void *)v4 + 14)) {
    -[OTAccountMetadataClassC setVoucherSignature:](self, "setVoucherSignature:");
  }
  id v15 = 0u;
  id v16 = 0u;
  id v13 = 0u;
  id v14 = 0u;
  double v7 = *((id *)v4 + 11);
  double v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    double v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[OTAccountMetadataClassC addTlkSharesForVouchedIdentity:]( self,  "addTlkSharesForVouchedIdentity:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i),  (void)v13);
      }

      double v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }

  if (*((void *)v4 + 8)) {
    -[OTAccountMetadataClassC setSecureElementIdentity:](self, "setSecureElementIdentity:");
  }
  BOOL v12 = *((_WORD *)v4 + 62);
  if ((v12 & 0x80) != 0)
  {
    self->_isInheritedAccount = *((_BYTE *)v4 + 120);
    *(_WORD *)&self->_has |= 0x80u;
    BOOL v12 = *((_WORD *)v4 + 62);
    if ((v12 & 0x100) == 0)
    {
LABEL_31:
      if ((v12 & 0x200) == 0) {
        goto LABEL_32;
      }
      goto LABEL_43;
    }
  }

  else if ((*((_WORD *)v4 + 62) & 0x100) == 0)
  {
    goto LABEL_31;
  }

  self->_warmedEscrowCache = *((_BYTE *)v4 + 121);
  *(_WORD *)&self->_has |= 0x100u;
  BOOL v12 = *((_WORD *)v4 + 62);
  if ((v12 & 0x200) == 0)
  {
LABEL_32:
    if ((v12 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

LABEL_40:
  *((_BYTE *)v13 + 122) = self->_warnedTooManyPeers;
  *((_WORD *)v13 + 62) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_30:
    *((_DWORD *)v13 + 1_Block_object_dispose(va, 8) = self->_sendingMetricsPermitted;
    *((_WORD *)v13 + 62) |= 0x20u;
  }

LABEL_31:
  if (self->_oldPeerID)
  {
    objc_msgSend(v13, "setOldPeerID:");
    BOOL v12 = v13;
  }
}

LABEL_25:
  *((_DWORD *)v5 + _Block_object_dispose(va, 8) = self->_attemptedJoin;
  *((_WORD *)v5 + 62) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 9) = self->_cdpState;
    *((_WORD *)v5 + 62) |= 8u;
  }

LABEL_78:
    id v18 = 0;
    goto LABEL_79;
  }

  if ((*((_WORD *)v4 + 62) & 0x200) != 0) {
    goto LABEL_78;
  }
LABEL_71:
  if ((v15 & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_sendingMetricsPermitted != *((_DWORD *)v4 + 18)) {
      goto LABEL_78;
    }
  }

  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_78;
  }

  oldPeerID = self->_oldPeerID;
  else {
    id v18 = 1;
  }
LABEL_79:

  return v18;
}

LABEL_34:
  if (*((void *)v4 + 6)) {
    -[OTAccountMetadataClassC setOldPeerID:](self, "setOldPeerID:");
  }
}

LABEL_12:
    uint64_t v6 = 0;
  }

id objc_msgSend_createInheritanceKeyWithClaimTokenAndWrappingKey_uuidString_claimToken_wrappingKey_json_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "createInheritanceKeyWithClaimTokenAndWrappingKey:uuidString:claimToken:wrappingKey:json:timeout:");
}

id objc_msgSend_joinWithCustodianRecoveryKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_joinWithInheritanceKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_performEscrowRecovery_recordID_appleID_secret_overrideForAccountScript_overrideEscrowCache_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performEscrowRecovery:recordID:appleID:secret:overrideForAccountScript:overrideEscrowCache:");
}

id objc_msgSend_preflightJoinWithCustodianRecoveryKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "preflightJoinWithCustodianRecoveryKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_preflightJoinWithInheritanceKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightJoinWithInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_recreateInheritanceKeyWithArguments_uuidString_wrappingKey_wrappedKey_claimToken_json_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "recreateInheritanceKeyWithArguments:uuidString:wrappingKey:wrappedKey:claimToken:json:timeout:");
}

id objc_msgSend_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAccountCDPContents:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:");
}

id objc_msgSend_resetAccountCDPContentsWithArguments_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAccountCDPContentsWithArguments:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:");
}

id objc_msgSend_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:reply:");
}

id objc_msgSend_resetOctagon_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_isGuitarfish_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetOctagon:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:isGuitarfish:timeout:");
}

id objc_msgSend_resetProtectedData_appleID_dsid_idmsTargetContext_idmsCuttlefishPassword_isGuitarfish_notifyIdMS_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "resetProtectedData:appleID:dsid:idmsTargetContext:idmsCuttlefishPassword:isGuitarfish:notifyIdMS:");
}

id objc_msgSend_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:");
}

id objc_msgSend_storeInheritanceKeyWithArguments_wrappingKey_wrappedKey_uuidString_timeout_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeInheritanceKeyWithArguments:wrappingKey:wrappedKey:uuidString:timeout:");
}

id objc_msgSend_webAccess(void *a1, const char *a2, ...)
{
  return [a1 webAccess];
}