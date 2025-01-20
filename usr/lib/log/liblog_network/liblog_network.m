uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  v3 = a2;
  if (!strcmp(a1, "in_addr"))
  {
    v5 = 0LL;
LABEL_18:
    v4 = ((uint64_t (*)(void *))(&OSLogCopyFormattedString_formatters)[2 * v5 + 1])(v3);
    goto LABEL_19;
  }

  if (!strcmp(a1, "in6_addr"))
  {
    v5 = 1LL;
    goto LABEL_18;
  }

  if (!strcmp(a1, "sockaddr"))
  {
    v5 = 2LL;
    goto LABEL_18;
  }

  if (!strcmp(a1, "tcp_flags"))
  {
    v5 = 3LL;
    goto LABEL_18;
  }

  if (!strcmp(a1, "tcp_state"))
  {
    v5 = 4LL;
    goto LABEL_18;
  }

  if (!strcmp(a1, "tcp_packets"))
  {
    v5 = 5LL;
    goto LABEL_18;
  }

  if (!strcmp(a1, "quic_packets"))
  {
    v5 = 6LL;
    goto LABEL_18;
  }

  if (!strcmp(a1, "data"))
  {
    v5 = 7LL;
    goto LABEL_18;
  }

  v4 = 0LL;
LABEL_19:

  return v4;
}

uint64_t NWOLCopyFormattedStringIPv4Address(void *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  int v15 = 0;
  *(void *)v16 = 0LL;
  uint64_t v17 = 0LL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    if ([v2 bytes] && objc_msgSend(v2, "length"))
    {
      if ([v2 length] == 4)
      {
        v3 = (int *)[v2 bytes];

        goto LABEL_8;
      }

      id v12 = objc_alloc(MEMORY[0x189607928]);
      v13 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<fail decode - size> %zu != %lu",  objc_msgSend(v2, "length"),  4);
      uint64_t v8 = [v12 initWithString:v13];
    }

    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<NULL>"];
    }

    goto LABEL_16;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x189607928]);
    id v10 = objc_alloc(NSString);
    [v1 description];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)[v10 initWithFormat:@"<fail decode - data type> %@", v7];
    uint64_t v8 = [v9 initWithString:v11];

    goto LABEL_12;
  }

  int v15 = [v1 unsignedIntValue];
  v3 = &v15;
LABEL_8:
  v4 = inet_ntop(2, v3, v16, 0x10u);
  id v5 = objc_alloc(MEMORY[0x189607928]);
  v6 = v5;
  if (!v4)
  {
    uint64_t v8 = [v5 initWithString:@"<failed conversion>"];
    goto LABEL_16;
  }

  [NSString stringWithUTF8String:v16];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 initWithString:v7];
LABEL_12:

LABEL_16:
  return v8;
}

uint64_t NWOLCopyFormattedStringIPv6Address(void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    if ([v2 bytes] && objc_msgSend(v2, "length"))
    {
      if ([v2 length] != 16)
      {
        id v5 = objc_alloc(MEMORY[0x189607928]);
        uint64_t v6 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<fail decode - size> %zu != %lu",  objc_msgSend(v2, "length"),  16);
        goto LABEL_11;
      }

      *(_OWORD *)int v15 = 0u;
      memset(v16, 0, sizeof(v16));
      v3 = inet_ntop(30, (const void *)[v2 bytes], v15, 0x2Eu);
      id v4 = objc_alloc(MEMORY[0x189607928]);
      id v5 = v4;
      if (v3)
      {
        uint64_t v6 = [NSString stringWithUTF8String:v15];
LABEL_11:
        v13 = (void *)v6;
        uint64_t v11 = [v5 initWithString:v6];

        goto LABEL_12;
      }

      id v12 = @"<failed conversion>";
    }

    else
    {
      id v4 = objc_alloc(MEMORY[0x189607928]);
      id v12 = @"<NULL>";
    }

    uint64_t v11 = [v4 initWithString:v12];
LABEL_12:

    goto LABEL_13;
  }

  id v7 = objc_alloc(MEMORY[0x189607928]);
  id v8 = objc_alloc(NSString);
  [v1 description];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)[v8 initWithFormat:@"<fail decode - data type> %@", v9];
  uint64_t v11 = [v7 initWithString:v10];

LABEL_13:
  return v11;
}

uint64_t NWOLCopyFormattedStringSockaddr(void *a1)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    v3 = (unsigned __int8 *)[v2 bytes];
    unint64_t v4 = [v2 length];
    if (v3 && (unint64_t v5 = v4) != 0)
    {
      if (v4 > 1)
      {
        unint64_t v17 = *v3;
        if (v4 >= v17)
        {
          switch(v3[1])
          {
            case 1u:
              id v20 = objc_alloc(MEMORY[0x189607928]);
              uint64_t v21 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"AF_UNIX:%.*s",  *v3 - 2,  v3 + 2,  v41,  v42,  v43);
              goto LABEL_25;
            case 2u:
              if (v17 <= 0xF)
              {
                id v20 = objc_alloc(MEMORY[0x189607928]);
                id v22 = objc_alloc(NSString);
                uint64_t v23 = *v3;
                uint64_t v24 = 16LL;
                goto LABEL_24;
              }

              int v28 = getnameinfo((const sockaddr *)v3, v17, v45, 0x10u, v44, 6u, 10);
              if (v28) {
                goto LABEL_42;
              }
              int v29 = *((unsigned __int16 *)v3 + 1);
              id v6 = objc_alloc(MEMORY[0x189607928]);
              id v30 = objc_alloc(NSString);
              if (!v29) {
                goto LABEL_51;
              }
              uint64_t v7 = objc_msgSend(v30, "initWithFormat:", @"%s:%s", v45, v44);
              goto LABEL_6;
            case 0x12u:
              uint64_t v25 = v3[5];
              uint64_t v26 = v3[6];
              if (v25 + v26 + (unint64_t)v3[7] + 8 > v17)
              {
                id v20 = objc_alloc(MEMORY[0x189607928]);
                uint64_t v21 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<fail decode - size> %d < %zu + %d + %d + %d",  *v3,  8,  v3[5],  v3[6],  v3[7]);
                goto LABEL_25;
              }

              if (!(v26 | v25) && !*((_WORD *)v3 + 1))
              {
                id v15 = objc_alloc(MEMORY[0x189607928]);
                v16 = @"<fail decode - no information>";
                goto LABEL_9;
              }

              [MEMORY[0x189607940] string];
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              id v8 = v31;
              uint64_t v32 = v3[5];
              if (v3[6])
              {
                v33 = &v3[v32];
                objc_msgSend(v31, "appendFormat:", @"%x", v3[v32 + 8]);
                if (v3[6] >= 2u)
                {
                  uint64_t v34 = 9LL;
                  do
                  {
                    objc_msgSend(v8, "appendFormat:", @":%x", v33[v34]);
                    unint64_t v35 = v34 - 7;
                    ++v34;
                  }

                  while (v35 < v3[6]);
                }

                LODWORD(v32) = v3[5];
              }

              if ((_DWORD)v32)
              {
                if ([v8 length]) {
                  v36 = @"%%%.*s";
                }
                else {
                  v36 = @"%.*s";
                }
                objc_msgSend(v8, "appendFormat:", v36, v3[5], v3 + 8);
              }

              else if (*((_WORD *)v3 + 1))
              {
                if ([v8 length]) {
                  v39 = @"%%%d";
                }
                else {
                  v39 = @"%d";
                }
                objc_msgSend(v8, "appendFormat:", v39, *((unsigned __int16 *)v3 + 1), v40);
              }

              id v9 = objc_alloc(MEMORY[0x189607928]);
              goto LABEL_12;
            case 0x1Eu:
              if (v17 > 0x1B)
              {
                int v28 = getnameinfo((const sockaddr *)v3, v17, v45, 0x46u, v44, 6u, 10);
                if (v28)
                {
LABEL_42:
                  int v37 = v28;
                  id v6 = objc_alloc(MEMORY[0x189607928]);
                  uint64_t v7 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<failed conversion> %s",  gai_strerror(v37),  v40);
                }

                else
                {
                  int v38 = *((unsigned __int16 *)v3 + 1);
                  id v6 = objc_alloc(MEMORY[0x189607928]);
                  id v30 = objc_alloc(NSString);
                  if (v38) {
                    uint64_t v7 = objc_msgSend(v30, "initWithFormat:", @"%s.%s", v45, v44);
                  }
                  else {
LABEL_51:
                  }
                    uint64_t v7 = objc_msgSend(v30, "initWithFormat:", @"%s", v45, v40);
                }

                goto LABEL_6;
              }

              id v20 = objc_alloc(MEMORY[0x189607928]);
              id v22 = objc_alloc(NSString);
              uint64_t v23 = *v3;
              uint64_t v24 = 28LL;
LABEL_24:
              uint64_t v21 = objc_msgSend( v22,  "initWithFormat:",  @"<fail decode - size> %d < %lu",  v23,  v24,  v41,  v42,  v43);
LABEL_25:
              v27 = (void *)v21;
              uint64_t v14 = [v20 initWithString:v21];

              break;
            default:
              id v20 = objc_alloc(MEMORY[0x189607928]);
              uint64_t v21 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<fail decode - address family> %d",  v3[1],  v40,  v41,  v42,  v43);
              goto LABEL_25;
          }

          goto LABEL_13;
        }

        id v18 = objc_alloc(MEMORY[0x189607928]);
        id v8 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<fail decode - size> %d > %zu",  *v3,  v5);
        id v9 = v18;
      }

      else
      {
        id v6 = objc_alloc(MEMORY[0x189607928]);
        uint64_t v7 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<fail decode - size> %zu < %lu",  1,  2);
LABEL_6:
        id v8 = (void *)v7;
        id v9 = v6;
      }

LABEL_12:
      uint64_t v14 = [v9 initWithString:v8];
    }

    else
    {
      id v15 = objc_alloc(MEMORY[0x189607928]);
      v16 = @"<NULL>";
LABEL_9:
      uint64_t v14 = [v15 initWithString:v16];
    }

LABEL_13:
    goto LABEL_14;
  }

  id v10 = objc_alloc(MEMORY[0x189607928]);
  id v11 = objc_alloc(NSString);
  [v1 description];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v11 initWithFormat:@"<fail decode - data type> %@", v12];
  uint64_t v14 = [v10 initWithString:v13];

LABEL_14:
  return v14;
}

uint64_t NWOLCopyFormattedStringTCPFlags(void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    char v2 = [v1 unsignedCharValue];
    id v3 = objc_alloc(MEMORY[0x189607928]);
    id v4 = objc_alloc(NSString);
    unint64_t v5 = "F";
    id v6 = "";
    if ((v2 & 1) == 0) {
      unint64_t v5 = "";
    }
    uint64_t v7 = "S";
    if ((v2 & 2) == 0) {
      uint64_t v7 = "";
    }
    id v8 = "R";
    if ((v2 & 4) == 0) {
      id v8 = "";
    }
    id v9 = "P";
    if ((v2 & 8) == 0) {
      id v9 = "";
    }
    id v10 = ".";
    if ((v2 & 0x10) == 0) {
      id v10 = "";
    }
    id v11 = "U";
    if ((v2 & 0x20) == 0) {
      id v11 = "";
    }
    id v12 = "E";
    if ((v2 & 0x40) == 0) {
      id v12 = "";
    }
    if (v2 < 0) {
      id v6 = "C";
    }
    snprintf(__str, 9uLL, "%s%s%s%s%s%s%s%s", v5, v7, v8, v9, v10, v11, v12, v6);
    v13 = (void *)objc_msgSend(v4, "initWithFormat:", @"[%s]", __str);
    uint64_t v14 = [v3 initWithString:v13];
  }

  else
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<failed conversion>"];
  }

  return v14;
}

uint64_t NWOLCopyFormattedStringTCPState(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v2 = [v1 intValue];
    id v3 = objc_alloc(MEMORY[0x189607928]);
    if (v2 < 0xB)
    {
      uint64_t v4 = [NSString stringWithUTF8String:tcpstates[v2]];
    }

    else
    {
      uint64_t v4 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%d", v2);
    }

    id v6 = (void *)v4;
    uint64_t v5 = [v3 initWithString:v4];
  }

  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<failed conversion>"];
  }

  return v5;
}

uint64_t NWOLCopyFormattedStringTCPPackets(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    uint64_t v10 = 0LL;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0LL;
    id v3 = (unsigned __int8 *)[v2 bytes];
    if ([v2 length])
    {
      if (*v3 != 1)
      {
        id v7 = objc_alloc(MEMORY[0x189607928]);
        id v8 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unsupported verison: %u",  *v3);
        uint64_t v6 = [v7 initWithString:v8];

        goto LABEL_11;
      }

      nw_log_ring_parse();
      id v4 = objc_alloc(MEMORY[0x189607928]);
      if (v11[5]) {
        uint64_t v5 = (const __CFString *)v11[5];
      }
      else {
        uint64_t v5 = &stru_18A112CD0;
      }
    }

    else
    {
      id v4 = objc_alloc(MEMORY[0x189607928]);
      uint64_t v5 = @"<failed conversion>";
    }

    uint64_t v6 = [v4 initWithString:v5];
LABEL_11:
    _Block_object_dispose(&v10, 8);

    goto LABEL_12;
  }

  uint64_t v6 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<failed conversion>"];
LABEL_12:

  return v6;
}

void sub_187B37034( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t NWOLCopyFormattedStringQUICPackets(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    uint64_t v14 = __Block_byref_object_copy_;
    id v15 = __Block_byref_object_dispose_;
    id v16 = 0LL;
    id v3 = (_BYTE *)[v2 bytes];
    if ([v2 length])
    {
      uint64_t v9 = MEMORY[0x1895F87A8];
      LOBYTE(v10) = *v3;
      nw_log_ring_parse();
      id v4 = objc_alloc(MEMORY[0x189607928]);
      if (v12[5]) {
        uint64_t v5 = (const __CFString *)v12[5];
      }
      else {
        uint64_t v5 = &stru_18A112CD0;
      }
      uint64_t v6 = objc_msgSend( v4,  "initWithString:",  v5,  v9,  3221225472,  __NWOLCopyFormattedStringQUICPackets_block_invoke,  &unk_18A112968,  &v11,  v10);
    }

    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<failed conversion>"];
    }

    uint64_t v7 = v6;
    _Block_object_dispose(&v11, 8);
  }

  else
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<failed conversion>"];
  }

  return v7;
}

void sub_187B371B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t NWOLCopyFormattedStringData(void *a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v2 = v1;
    if ([v2 bytes] && objc_msgSend(v2, "length"))
    {
      uint64_t v26 = [v2 bytes];
      v27[0] = 0LL;
      v27[1] = 0LL;
      char v28 = 0;
      id v25 = v2;
      uint64_t v3 = [v2 length];
      *(void *)&__int128 v4 = 0x2020202020202020LL;
      *((void *)&v4 + 1) = 0x2020202020202020LL;
      __int128 v29 = v4;
      *(_OWORD *)id v30 = v4;
      *(_OWORD *)&v30[15] = v4;
      char v31 = 0;
      if (v3)
      {
        unint64_t v5 = v3;
        unint64_t v6 = 0LL;
        uint64_t v7 = &stru_18A112CD0;
        do
        {
          if (v5 - v6 >= 0x10) {
            uint64_t v9 = 16LL;
          }
          else {
            uint64_t v9 = v5 - v6;
          }
          if (!(_DWORD)v9) {
            goto LABEL_6;
          }
          uint64_t v10 = 3LL * (v9 - 1);
          uint64_t v11 = (char *)&v29 + 1;
          uint64_t v12 = (unsigned __int8 *)(v26 + v6);
          uint64_t v13 = (char *)v27;
          uint64_t v14 = v9;
          do
          {
            unsigned int v16 = *v12++;
            unint64_t v15 = v16;
            if (v16 - 32 >= 0x5F) {
              char v17 = 46;
            }
            else {
              char v17 = v15;
            }
            char v18 = NWOLCopyFormattedStringData_hexChars[v15 >> 4];
            char *v13 = v17;
            *(v11 - 1) = v18;
            _BYTE *v11 = NWOLCopyFormattedStringData_hexChars[v15 & 0xF];
            if (!v10) {
              *((_BYTE *)v27 + (v9 - 1) + 1) = 0;
            }
            v10 -= 3LL;
            v11 += 3;
            ++v13;
            --v14;
          }

          while (v14);
          if (v9 <= 0xF) {
LABEL_6:
          }
            memset(&v30[3 * v9 - 16], 32, 3 * (16 - v9) - 1);
          id v8 = (__CFString *)[objc_alloc(NSString) initWithFormat:@"%@%4zu   %s   %s\n", v7, v6, &v29, v27];

          v6 += v9;
          uint64_t v7 = v8;
        }

        while (v6 < v5);
      }

      else
      {
        id v8 = &stru_18A112CD0;
      }

      uint64_t v23 = [objc_alloc(MEMORY[0x189607928]) initWithString:v8];

      id v2 = v25;
    }

    else
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x189607928]) initWithString:@"<NULL>"];
    }
  }

  else
  {
    id v19 = objc_alloc(MEMORY[0x189607928]);
    id v20 = objc_alloc(NSString);
    [v1 description];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = (void *)[v20 initWithFormat:@"<fail decode - data type> %@", v21];
    uint64_t v23 = [v19 initWithString:v22];
  }

  return v23;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __NWOLCopyFormattedStringQUICPackets_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  memset(v10, 0, sizeof(v10));
  quic_shorthand_describe_entry();
  id v2 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"\t%s", v10);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(void *)(v4 + 40))
  {
    uint64_t v5 = [v2 stringByAppendingFormat:@"\n%@", *(void *)(v4 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

  else
  {
    id v8 = v2;
    uint64_t v7 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v8;
  }

  return 1LL;
}

BOOL __NWOLCopyFormattedStringTCPPackets_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (a2 == 16)
  {
    unsigned int v5 = *(_DWORD *)a3;
    unsigned int v4 = *(_DWORD *)(a3 + 4);
    unsigned int v6 = *(unsigned __int16 *)(a3 + 8);
    uint64_t v7 = *(unsigned __int16 *)(a3 + 10);
    unsigned int v8 = *(unsigned __int8 *)(a3 + 14);
    char v9 = *(_BYTE *)(a3 + 15);
    unsigned int v10 = nw_log_delta_to_ms();
    id v11 = objc_alloc(NSString);
    uint64_t v12 = "rcv";
    if ((v9 & 1) == 0) {
      uint64_t v12 = "snd";
    }
    int v37 = v12;
    int v38 = v11;
    unint64_t v13 = v10 / 0x3E8uLL;
    uint64_t v36 = v10 % 0x3E8;
    uint64_t v14 = bswap32(v5);
    uint64_t v39 = v7;
    uint64_t v15 = (v8 & 1) + (_DWORD)v7 + ((v8 >> 1) & 1) + (_DWORD)v14;
    uint64_t v16 = bswap32(v4);
    char v17 = "";
    uint64_t v18 = bswap32(v6) >> 16;
    if ((v8 & 1) != 0) {
      id v19 = "F";
    }
    else {
      id v19 = "";
    }
    id v20 = "S";
    if ((v8 & 2) == 0) {
      id v20 = "";
    }
    uint64_t v21 = "R";
    if ((v8 & 4) == 0) {
      uint64_t v21 = "";
    }
    id v22 = "P";
    if ((v8 & 8) == 0) {
      id v22 = "";
    }
    uint64_t v23 = ".";
    if ((v8 & 0x10) == 0) {
      uint64_t v23 = "";
    }
    uint64_t v24 = "U";
    if ((v8 & 0x20) == 0) {
      uint64_t v24 = "";
    }
    id v25 = "E";
    if ((v8 & 0x40) == 0) {
      id v25 = "";
    }
    uint64_t v26 = "C";
    if ((v8 & 0x80u) == 0) {
      uint64_t v26 = "";
    }
    snprintf(__str, 9uLL, "%s%s%s%s%s%s%s%s", v19, v20, v21, v22, v23, v24, v25, v26);
    unsigned int v27 = (v9 & 6) - 2;
    if (v27 <= 4) {
      char v17 = (&off_18A112988)[v27];
    }
    char v28 = (void *)objc_msgSend( v38,  "initWithFormat:",  @"\t %s %4u.%.03us seq %10u:%-10u ack %-10u win %-5u len %-4u [%s]%s",  v37,  v13,  v36,  v14,  v15,  v16,  v18,  v39,  __str,  v17);
    __int128 v29 = v28;
    uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(void *)(v30 + 40))
    {
      uint64_t v31 = [v28 stringByAppendingFormat:@"\n%@", *(void *)(v30 + 40)];
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 8LL);
      v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;
    }

    else
    {
      id v34 = v28;
      v33 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v34;
    }
  }

  return a2 == 16;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x1895FB4D8](*(void *)&a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1895FB5D8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

uint64_t nw_log_delta_to_ms()
{
  return MEMORY[0x189609900]();
}

uint64_t nw_log_ring_parse()
{
  return MEMORY[0x189609920]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

uint64_t quic_shorthand_describe_entry()
{
  return MEMORY[0x189617050]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}