BOOL OTICDPRecordSilentContextReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  OTCDPRecoveryInformation *v17;
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0LL;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0LL;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(&OBJC_CLASS___OTCDPRecoveryInformation);
        objc_storeStrong((id *)(a1 + 16), v17);
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    v17 = objc_alloc_init(&OBJC_CLASS___OTEscrowAuthenticationInformation);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (OTEscrowAuthenticationInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0LL;
    }

    goto LABEL_25;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}
}

LABEL_5:
  return v5;
}

  return v5;
}

uint64_t OTWalrusReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_31;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL OTSecureElementPeerIdentityReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 8LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_32:
    unint64_t v12 = 0;
    goto LABEL_33;
  }

  if ((*((_BYTE *)v4 + 68) & 2) != 0) {
    goto LABEL_32;
  }
LABEL_26:
  authenticationAuthToken = self->_authenticationAuthToken;
  if ((unint64_t)authenticationAuthToken | *((void *)v4 + 2)
    && !-[NSString isEqual:](authenticationAuthToken, "isEqual:"))
  {
    goto LABEL_32;
  }

  authenticationEscrowproxyUrl = self->_authenticationEscrowproxyUrl;
  if ((unint64_t)authenticationEscrowproxyUrl | *((void *)v4 + 4))
  {
  }

  authenticationIcloudEnvironment = self->_authenticationIcloudEnvironment;
  else {
    unint64_t v12 = 1;
  }
LABEL_33:

  return v12;
}

uint64_t OTEscrowAuthenticationInformationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48LL;
          goto LABEL_42;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24LL;
          goto LABEL_42;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8LL;
          goto LABEL_42;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56LL;
          goto LABEL_42;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0LL;
          *(_BYTE *)(a1 + 68) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1LL || v24 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v25 = *(_BYTE *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0LL;
                  goto LABEL_46;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v22 = 0LL;
          }
LABEL_46:
          BOOL v33 = v22 != 0;
          uint64_t v34 = 64LL;
          goto LABEL_51;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0LL;
          *(_BYTE *)(a1 + 68) |= 2u;
          break;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16LL;
          goto LABEL_42;
        case 8u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32LL;
          goto LABEL_42;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40LL;
LABEL_42:
          v32 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result) {
            return result;
          }
          continue;
      }

      while (1)
      {
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1LL || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(_BYTE *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_48;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          uint64_t v28 = 0LL;
          goto LABEL_50;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_48:
      if (*(_BYTE *)(a2 + *v5)) {
        uint64_t v28 = 0LL;
      }
LABEL_50:
      BOOL v33 = v28 != 0;
      uint64_t v34 = 65LL;
LABEL_51:
      *(_BYTE *)(a1 + v34) = v33;
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  v7 = (int *)MEMORY[0x189611CD8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0LL;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v10 = 0LL;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24LL;
        goto LABEL_45;
      case 2u:
        char v20 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadataClientMetadata);
        objc_storeStrong((id *)(a1 + 56), v20);
        if (!PBReaderPlaceMark()
          || (OTEscrowRecordMetadataClientMetadataReadFrom((uint64_t)v20, a2) & 1) == 0)
        {
          goto LABEL_60;
        }

        goto LABEL_48;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0LL;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1LL || v25 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v26 = *(_BYTE *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0LL;
                goto LABEL_52;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v23 = 0LL;
        }
LABEL_52:
        uint64_t v33 = 16LL;
        goto LABEL_57;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 32LL;
        goto LABEL_45;
      case 5u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0LL;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1LL || v30 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v31 = *(_BYTE *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0LL;
                goto LABEL_56;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v23 = 0LL;
        }
LABEL_56:
        uint64_t v33 = 8LL;
LABEL_57:
        *(void *)(a1 + v33) = v23;
        goto LABEL_58;
      case 6u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 64LL;
        goto LABEL_45;
      case 7u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 80LL;
        goto LABEL_45;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40LL;
        goto LABEL_45;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88LL;
        goto LABEL_45;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48LL;
LABEL_45:
        v32 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_58;
      case 0xBu:
        char v20 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadataPasscodeGeneration);
        objc_storeStrong((id *)(a1 + 72), v20);
        if (PBReaderPlaceMark()
          && (OTEscrowRecordMetadataPasscodeGenerationReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
LABEL_48:
          PBReaderRecallMark();

LABEL_58:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

LABEL_60:
        return 0LL;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_58;
    }
  }

  return v21;
}

BOOL OTAccountSettingsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(&OBJC_CLASS___OTWalrus);
        objc_storeStrong((id *)(a1 + 8), v17);
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___OTWebAccess);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (OTWebAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0LL;
    }

    goto LABEL_25;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_8:
      goto LABEL_9;
    }

    [v5 cdpInfo];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 recoveryKey];
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      [v5 cdpInfo];
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 recoveryKey];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = v14;
      if (![v16 isEqualToString:&stru_18A04F9E0])
      {
        LOBYTE(v7) = 0;
        goto LABEL_18;
      }

      uint64_t v17 = v12;
    }

    else
    {
      uint64_t v17 = v12;
    }

    [v5 cdpInfo];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [v15 usePreviouslyCachedRecoveryKey] ^ 1;

    if (!v13)
    {

LABEL_20:
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    unint64_t v12 = v17;
LABEL_18:

    goto LABEL_20;
  }

  LOBYTE(v7) = 0;
LABEL_10:

  return v7;
}

  if ([v7 length] >= a4)
  {
    *(void *)&uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s2[0] = v18;
    __s2[1] = v18;
    uint64_t v19 = [v7 length] - a4;
    ccsha256_di();
    char v20 = v7;
    [v20 bytes];
    ccdigest();
    v16 = a5;
    if (a4 < 0x21)
    {
      char v26 = v20;
      if (!memcmp((const void *)([v26 bytes] + v19), __s2, a4))
      {
        objc_msgSend( MEMORY[0x189603F48], "dataWithBytes:length:", objc_msgSend(v26, "bytes"), v19);
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }

      if (a5)
      {
        char v27 = (void *)MEMORY[0x189607870];
        [NSString stringWithFormat:@"Checksum does not match"];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = v27;
        unint64_t v25 = 2LL;
LABEL_20:
        [v24 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:v25 description:v23];
        *v16 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x189607870];
      objc_msgSend( NSString,  "stringWithFormat:",  @"checksumsize (%zu) too long (expected %zu)",  a4,  32);
      goto LABEL_14;
    }
  }

  else
  {
    v16 = a5;
    if (a5)
    {
      uint64_t v17 = (void *)MEMORY[0x189607870];
      objc_msgSend( NSString,  "stringWithFormat:",  @"Length (%zu) shorter than checksumsize (%zu)",  objc_msgSend(v7, "length"),  a4);
LABEL_14:
      char v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:@"com.apple.security.OctagonTrust.OTInheritanceKey" code:3 description:v21];
      *v16 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

id getkSecureBackupEscrowDateKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupEscrowDateKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupEscrowDateKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowDateKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupEscrowDateKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupEscrowDateKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupRemainingAttemptsKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr;
  if (!getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRemainingAttemptsKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRemainingAttemptsKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupRecordLabelKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupRecordLabelKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupRecordLabelKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordLabelKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecordLabelKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecordLabelKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupRecordStatusKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupRecordStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordStatusKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecordStatusKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecordStatusKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupRecordIDKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupRecordIDKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupRecordIDKeySymbolLoc_ptr;
  if (!getkSecureBackupRecordIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecordIDKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecordIDKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupPeerInfoSerialNumberKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr;
  if (!getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupPeerInfoSerialNumberKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPeerInfoSerialNumberKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupCoolOffEndKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupCoolOffEndKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupCoolOffEndKeySymbolLoc_ptr;
  if (!getkSecureBackupCoolOffEndKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupCoolOffEndKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupCoolOffEndKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupRecoveryStatusKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  v0 = (id *)getkSecureBackupRecoveryStatusKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupRecoveryStatusKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryStatusKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupRecoveryStatusKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecoveryStatusKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

uint64_t CloudServicesLibrary()
{
  if (CloudServicesLibraryCore_frameworkLibrary) {
    return CloudServicesLibraryCore_frameworkLibrary;
  }
  CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

id getkSecureBackupClientMetadataKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupClientMetadataKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupClientMetadataKeySymbolLoc_ptr;
  if (!getkSecureBackupClientMetadataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupClientMetadataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupClientMetadataKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupUsesMultipleiCSCKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupUsesMultipleiCSCKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesMultipleiCSCKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupBottleIDKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupBottleIDKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupBottleIDKeySymbolLoc_ptr;
  if (!getkSecureBackupBottleIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupBottleIDKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupBottleIDKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupEscrowedSPKIKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr;
  if (!getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupEscrowedSPKIKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupEscrowedSPKIKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupPeerInfoDataKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupPeerInfoDataKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupPeerInfoDataKeySymbolLoc_ptr;
  if (!getkSecureBackupPeerInfoDataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupPeerInfoDataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPeerInfoDataKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupSerialNumberKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupSerialNumberKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupSerialNumberKeySymbolLoc_ptr;
  if (!getkSecureBackupSerialNumberKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupSerialNumberKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupSerialNumberKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupBuildVersionKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupBuildVersionKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupBuildVersionKeySymbolLoc_ptr;
  if (!getkSecureBackupBuildVersionKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupBuildVersionKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupBuildVersionKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupPasscodeGenerationKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr;
  if (!getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupPasscodeGenerationKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPasscodeGenerationKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupNumericPassphraseLengthKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  if (!getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupNumericPassphraseLengthKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupUsesComplexPassphraseKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupUsesComplexPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupUsesNumericPassphraseKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupUsesNumericPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupPassphraseKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupPassphraseKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupUseCachedPassphraseKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupUseCachedPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUseCachedPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupRecoveryKeyKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
  if (!getkSecureBackupRecoveryKeyKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupRecoveryKeyKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupUsesRecoveryKeyKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupUsesRecoveryKeyKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupSilentRecoveryAttemptKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr;
  if (!getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupSilentRecoveryAttemptKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupSilentRecoveryAttemptKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupContainsiCDPDataKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr;
  if (!getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupContainsiCDPDataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupContainsiCDPDataKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupNonViableRepairKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupNonViableRepairKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupNonViableRepairKeySymbolLoc_ptr;
  if (!getkSecureBackupNonViableRepairKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupNonViableRepairKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupNonViableRepairKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupAuthenticationAppleID()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationAppleID");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupAuthenticationAuthToken()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationAuthToken");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationAuthTokenSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupAuthenticationDSID()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupAuthenticationDSIDSymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupAuthenticationDSIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationDSIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationDSID");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationDSIDSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupAuthenticationEscrowProxyURL()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationEscrowProxyURL");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationEscrowProxyURLSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupAuthenticationiCloudEnvironment()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationiCloudEnvironment");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationiCloudEnvironmentSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupAuthenticationPassword()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationPassword");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupFMiPUUIDKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupFMiPUUIDKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupFMiPUUIDKeySymbolLoc_ptr;
  if (!getkSecureBackupFMiPUUIDKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupFMiPUUIDKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupFMiPUUIDKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupFMiPRecoveryKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr;
  if (!getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupFMiPRecoveryKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupFMiPRecoveryKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id getkSecureBackupIDMSRecoveryKey()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr;
  uint64_t v7 = getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr;
  if (!getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    uint64_t v0 = (id *)dlsym(v1, "kSecureBackupIDMSRecoveryKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupIDMSRecoveryKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

LABEL_25:
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_secureBackupUsesComplexPassphrase];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v17 forKey:@"secure_backup_uses_complex_passphrase"];

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_secureBackupUsesNumericPassphrase];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v5 forKey:@"secure_backup_uses_numeric_passphrase"];
  }

  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_deviceColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceEnclosureColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceMid) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModelClass) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModelVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

  v4[4] = self->_secureBackupUsesComplexPassphrase;
  *((_BYTE *)v4 + 104) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v4[5] = self->_secureBackupUsesNumericPassphrase;
    *((_BYTE *)v4 + 104) |= 0x10u;
  }

  self->_secureBackupUsesComplexPassphrase = *((void *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
  {
LABEL_5:
    self->_secureBackupUsesNumericPassphrase = *((void *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }

LABEL_6:
  deviceColor = self->_deviceColor;
  if (deviceColor) {
    [v3 setObject:deviceColor forKey:@"device_color"];
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor) {
    [v3 setObject:deviceEnclosureColor forKey:@"device_enclosure_color"];
  }
  deviceMid = self->_deviceMid;
  if (deviceMid) {
    [v3 setObject:deviceMid forKey:@"device_mid"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }
  deviceModelClass = self->_deviceModelClass;
  if (deviceModelClass) {
    [v3 setObject:deviceModelClass forKey:@"device_model_class"];
  }
  deviceModelVersion = self->_deviceModelVersion;
  if (deviceModelVersion) {
    [v3 setObject:deviceModelVersion forKey:@"device_model_version"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"device_name"];
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_devicePlatform];
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKey:@"device_platform"];
  }

  return v3;
}

  uint64_t v6 = v4;
  if (self->_deviceColor)
  {
    objc_msgSend(v4, "setDeviceColor:");
    uint64_t v4 = v6;
  }

  if (self->_deviceEnclosureColor)
  {
    objc_msgSend(v6, "setDeviceEnclosureColor:");
    uint64_t v4 = v6;
  }

  if (self->_deviceMid)
  {
    objc_msgSend(v6, "setDeviceMid:");
    uint64_t v4 = v6;
  }

  if (self->_deviceModel)
  {
    objc_msgSend(v6, "setDeviceModel:");
    uint64_t v4 = v6;
  }

  if (self->_deviceModelClass)
  {
    objc_msgSend(v6, "setDeviceModelClass:");
    uint64_t v4 = v6;
  }

  if (self->_deviceModelVersion)
  {
    objc_msgSend(v6, "setDeviceModelVersion:");
    uint64_t v4 = v6;
  }

  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    uint64_t v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_devicePlatform;
    *((_BYTE *)v4 + 104) |= 1u;
  }
}

  char v8 = -[NSString copyWithZone:](self->_deviceColor, "copyWithZone:", a3);
  unsigned int v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  unint64_t v10 = -[NSString copyWithZone:](self->_deviceEnclosureColor, "copyWithZone:", a3);
  uint64_t v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  unint64_t v12 = -[NSString copyWithZone:](self->_deviceMid, "copyWithZone:", a3);
  char v13 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v12;

  BOOL v14 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  int v15 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_deviceModelClass, "copyWithZone:", a3);
  uint64_t v17 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v16;

  uint64_t v18 = -[NSString copyWithZone:](self->_deviceModelVersion, "copyWithZone:", a3);
  uint64_t v19 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v18;

  char v20 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  char v21 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v6 + 8) = self->_devicePlatform;
    *(_BYTE *)(v6 + 104) |= 1u;
  }

  return (id)v6;
}

  uint64_t v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceColor:](self, "setDeviceColor:");
    uint64_t v4 = v6;
  }

  if (*((void *)v4 + 7))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
    uint64_t v4 = v6;
  }

  if (*((void *)v4 + 8))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceMid:](self, "setDeviceMid:");
    uint64_t v4 = v6;
  }

  if (*((void *)v4 + 9))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModel:](self, "setDeviceModel:");
    uint64_t v4 = v6;
  }

  if (*((void *)v4 + 10))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModelClass:](self, "setDeviceModelClass:");
    uint64_t v4 = v6;
  }

  if (*((void *)v4 + 11))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModelVersion:](self, "setDeviceModelVersion:");
    uint64_t v4 = v6;
  }

  if (*((void *)v4 + 12))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceName:](self, "setDeviceName:");
    uint64_t v4 = v6;
  }

  if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    self->_devicePlatform = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

    v5 = 0;
  }
}

LABEL_11:
  *(void *)(v5 + 32) = self->_secureBackupUsesComplexPassphrase;
  *(_BYTE *)(v5 + 104) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(void *)(v5 + 40) = self->_secureBackupUsesNumericPassphrase;
    *(_BYTE *)(v5 + 104) |= 0x10u;
  }

  return v7;
}

LABEL_41:
  return v12;
}

LABEL_9:
  uint64_t v4 = 0LL;
LABEL_10:
  v5 = -[NSString hash](self->_deviceColor, "hash", v14);
  uint64_t v6 = -[NSString hash](self->_deviceEnclosureColor, "hash");
  uint64_t v7 = -[NSString hash](self->_deviceMid, "hash");
  char v8 = -[NSString hash](self->_deviceModel, "hash");
  unsigned int v9 = -[NSString hash](self->_deviceModelClass, "hash");
  unint64_t v10 = -[NSString hash](self->_deviceModelVersion, "hash");
  uint64_t v11 = -[NSString hash](self->_deviceName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v12 = 2654435761u * self->_devicePlatform;
  }
  else {
    unint64_t v12 = 0LL;
  }
  return v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

uint64_t OTEscrowRecordMetadataClientMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 104) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_65;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0LL;
              goto LABEL_67;
            }
          }

          *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v19 = 0LL;
          }
LABEL_67:
          uint64_t v47 = 16LL;
          goto LABEL_84;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 104) |= 4u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1LL || v27 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v28 = *(_BYTE *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0LL;
                  goto LABEL_71;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v19 = 0LL;
          }
LABEL_71:
          uint64_t v47 = 24LL;
          goto LABEL_84;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 104) |= 8u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1LL || v32 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v33 = *(_BYTE *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0LL;
                  goto LABEL_75;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v19 = 0LL;
          }
LABEL_75:
          uint64_t v47 = 32LL;
          goto LABEL_84;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 104) |= 0x10u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1LL || v37 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v38 = *(_BYTE *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0LL;
                  goto LABEL_79;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v19 = 0LL;
          }
LABEL_79:
          uint64_t v47 = 40LL;
          goto LABEL_84;
        case 5u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 48LL;
          goto LABEL_56;
        case 6u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 56LL;
          goto LABEL_56;
        case 7u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 64LL;
          goto LABEL_56;
        case 8u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 72LL;
          goto LABEL_56;
        case 9u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 80LL;
          goto LABEL_56;
        case 0xAu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 88LL;
          goto LABEL_56;
        case 0xBu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 96LL;
LABEL_56:
          v41 = *(void **)(a1 + v40);
          *(void *)(a1 + v40) = v39;

          continue;
        case 0xCu:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v19 = 0LL;
          *(_BYTE *)(a1 + 104) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result) {
            return result;
          }
          continue;
      }

      while (1)
      {
        uint64_t v44 = *v3;
        unint64_t v45 = *(void *)(a2 + v44);
        if (v45 == -1LL || v45 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v46 = *(_BYTE *)(*(void *)(a2 + *v7) + v45);
        *(void *)(a2 + v44) = v45 + 1;
        v19 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0) {
          goto LABEL_81;
        }
        v42 += 7;
        BOOL v14 = v43++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0LL;
          goto LABEL_83;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_81:
      if (*(_BYTE *)(a2 + *v5)) {
        uint64_t v19 = 0LL;
      }
LABEL_83:
      uint64_t v47 = 8LL;
LABEL_84:
      *(void *)(a1 + v47) = v19;
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_7:
  return v5;
}

  unsigned int v25 = 0LL;
LABEL_10:

  return v25;
}

  return v14;
}

uint64_t OTEscrowRecordMetadataPasscodeGenerationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_31;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_31:
        *(void *)(a1 + 8) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL OTEscrowMoveRequestContextReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((_DWORD)v17 == 2)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8LL;
        goto LABEL_24;
      }

      if ((_DWORD)v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16LL;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 24LL;
    goto LABEL_24;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTWebAccessReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_31;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL OTCurrentSecureElementIdentitiesReadFrom(char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((_DWORD)v17 != 2)
      {
        if ((_DWORD)v17 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0LL;
          }
          goto LABEL_29;
        }

        unsigned int v18 = objc_alloc_init(&OBJC_CLASS___OTSecureElementPeerIdentity);
        uint64_t v19 = 8LL;
        goto LABEL_23;
      }

      unsigned int v18 = objc_alloc_init(&OBJC_CLASS___OTSecureElementPeerIdentity);
      [a1 addTrustedPeerSecureElementIdentities:v18];
LABEL_25:
      if (!PBReaderPlaceMark() || !OTSecureElementPeerIdentityReadFrom((uint64_t)v18, a2))
      {

        return 0LL;
      }

      PBReaderRecallMark();

LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    unsigned int v18 = objc_alloc_init(&OBJC_CLASS___OTSecureElementPeerIdentity);
    uint64_t v19 = 16LL;
LABEL_23:
    objc_storeStrong((id *)&a1[v19], v18);
    goto LABEL_25;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18745B174( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18745B428( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18745B708( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_18745B9D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18745BCB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_18745BF68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_18745C2FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_18745CE10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
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

id getSecureBackupClass()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  uint64_t v0 = (void *)getSecureBackupClass_softClass;
  uint64_t v7 = getSecureBackupClass_softClass;
  if (!getSecureBackupClass_softClass)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __getSecureBackupClass_block_invoke;
    v3[3] = &unk_18A04F398;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18745D008( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class __getSecureBackupClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("SecureBackup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getSecureBackupClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    abort_report_np();
    return (Class)CloudServicesLibrary_642();
  }

  return result;
}

uint64_t CloudServicesLibrary_642()
{
  if (CloudServicesLibraryCore_frameworkLibrary_643) {
    return CloudServicesLibraryCore_frameworkLibrary_643;
  }
  CloudServicesLibraryCore_frameworkLibrary_643 = _sl_dlopen();
  uint64_t v0 = CloudServicesLibraryCore_frameworkLibrary_643;
  if (!CloudServicesLibraryCore_frameworkLibrary_643)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

LABEL_31:
        uint64_t v31 = -[OTEscrowRecord recordId](v20, "recordId");
        if (!v31
          || (unint64_t v32 = (void *)v31,
              -[OTEscrowRecord recordId](v20, "recordId"),
              char v33 = (void *)objc_claimAutoreleasedReturnValue(),
              char v34 = [v33 isEqualToString:&stru_18A04F9E0],
              v33,
              v32,
              v34))
        {
          -[OTEscrowRecord label](v20, "label");
          unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 stringByReplacingOccurrencesOfString:*MEMORY[0x18960AFD0] withString:&stru_18A04F9E0];
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v37 = (void *)[v36 mutableCopy];
          -[OTEscrowRecord setRecordId:](v20, "setRecordId:", v37);
        }

        -[OTEscrowRecord serialNumber](v20, "serialNumber");
        char v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          -[OTEscrowRecord serialNumber](v20, "serialNumber");
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v40 = [v39 peerInfo];
        if (!v40)
        {

          if (!v38) {
            goto LABEL_43;
          }
LABEL_42:

          goto LABEL_43;
        }

        v41 = (void *)v40;
        -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        char v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 peerInfo];
        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v44 = [v43 length];

        if (v38)
        {
        }

        unint64_t v17 = v78;
        if (v44)
        {
          -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
          [v45 peerInfo];
          char v46 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v47 = (const void *)SOSPeerInfoCreateFromData();

          v57 = (void *)SOSPeerInfoCopySerialNumber();
          -[OTEscrowRecord setSerialNumber:](v20, "setSerialNumber:", v57);

          v58 = -[OTEscrowRecord serialNumber](v20, "serialNumber");
          if (!v58
            || (v59 = (void *)v58,
                -[OTEscrowRecord serialNumber](v20, "serialNumber"),
                v60 = (void *)objc_claimAutoreleasedReturnValue(),
                v61 = [v60 isEqualToString:&stru_18A04F9E0],
                v60,
                v59,
                v61))
          {
            secLogObjForScope();
            v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( &dword_18744F000,  v62,  OS_LOG_TYPE_DEFAULT,  "attempted to use peer info's serial number and failed, using metadata",  buf,  2u);
            }
            v63 = -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
            [v63 serial];
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[OTEscrowRecord setSerialNumber:](v20, "setSerialNumber:", v64);
          }

          if (v47) {
            CFRelease(v47);
          }
          goto LABEL_59;
        }

LABEL_43:
        v48 = -[OTEscrowRecord serialNumber](v20, "serialNumber");
        if (v48)
        {
          -[OTEscrowRecord serialNumber](v20, "serialNumber");
          uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
          if (([v6 isEqualToString:&stru_18A04F9E0] & 1) == 0) {
            goto LABEL_51;
          }
        }
        v49 = -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        v50 = [v49 serial];
        if (!v50)
        {

          if (!v48) {
            goto LABEL_59;
          }
LABEL_51:

          goto LABEL_59;
        }

        v51 = (void *)v50;
        v52 = -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
        [v52 serial];
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = [v53 isEqualToString:&stru_18A04F9E0];

        if (v48)
        {
        }

        unint64_t v17 = v78;
        if ((v54 & 1) == 0)
        {
          v55 = -[OTEscrowRecord escrowInformationMetadata](v20, "escrowInformationMetadata");
          [v55 serial];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[OTEscrowRecord setSerialNumber:](v20, "setSerialNumber:", v56);
        }

LABEL_59:
        -[os_log_s addObject:](v17, "addObject:", v20);
      }

      v80 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }

    while (v80);
  }

  v65 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = 1;
    _os_signpost_emit_with_name_impl( &dword_18744F000,  v67,  OS_SIGNPOST_INTERVAL_END,  v72,  "FetchEscrowRecords",  " OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = v72;
    v88 = 2048;
    v89 = (double)(unint64_t)v65 / 1000000000.0;
    v90 = 1026;
    v91 = 1;
    _os_log_impl( &dword_18744F000,  v68,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEscrowRecords  OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name =OctagonSignpostNameFetchEscrowRecords}d ",  buf,  0x1Cu);
  }

  uint64_t v6 = v73;
  unint64_t v12 = v71;
  if (a4)
  {
    [MEMORY[0x18960AF90] filterRecords:v17];
    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v69 = v17;
    unint64_t v17 = v69;
  }

  unsigned int v18 = v69;
LABEL_70:

  return v18;
}

LABEL_94:
  return v20;
}

void sub_18745FB24(_Unwind_Exception *a1)
{
}

void sub_187460620( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_55:
  return v21;
}

void sub_187461134( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_187461430( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_187461704( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

LABEL_50:
    goto LABEL_51;
  }

  secLogObjForScope();
  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( &dword_18744F000,  v18,  OS_LOG_TYPE_DEFAULT,  "successfully registered recovery key for SOS",  (uint8_t *)&buf,  2u);
  }

  [v7 sbd];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v19;
  if (v19) {
    unint64_t v21 = v19;
  }
  else {
    unint64_t v21 = objc_alloc_init((Class)getSecureBackupClass());
  }
  char v33 = v21;

  [v33 backupForRecoveryKeyWithInfo:0];
  char v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    secLogObjForScope();
    unsigned int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v34;
      _os_log_impl( &dword_18744F000,  v35,  OS_LOG_TYPE_DEFAULT,  "octagon-register-recovery-key: failed to perform backup: %@",  (uint8_t *)&buf,  0xCu);
    }

    if (a5) {
      *a5 = v34;
    }
  }

  else
  {
    secLogObjForScope();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18744F000, v36, OS_LOG_TYPE_DEFAULT, "created iCloud Identity backup", (uint8_t *)&buf, 2u);
    }
  }

  if (v34) {
    goto LABEL_51;
  }
LABEL_19:
  uint64_t v23 = 1LL;
LABEL_52:

  return v23;
}

  return v9;
}

void sub_187462070( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1874623E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1874628B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187462B30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1874634C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

LABEL_27:
      }
    }

    if (v10 != 3 && v12 != 3)
    {
      secLogObjForScope();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_18744F000,  v26,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: recovery key will not work for both SOS and Octagon",  (uint8_t *)&buf,  2u);
      }

      if (!a5) {
        goto LABEL_99;
      }
      if (v10 == 1 && v12 == 1)
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:64 description:@"Recovery key is not registered"];
        unint64_t v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:
        unsigned int v25 = 0LL;
        *a5 = v27;
        goto LABEL_100;
      }

      if (v12 != 2 && v10 != 2)
      {
        if (v52)
        {
          unint64_t v27 = v52;
          goto LABEL_95;
        }

        uint64_t v31 = SOSCCIsSOSTrustAndSyncingEnabled();
        if (v11) {
          unint64_t v32 = v31;
        }
        else {
          unint64_t v32 = 0;
        }
        if (v32 == 1)
        {
          unint64_t v27 = v11;
          goto LABEL_95;
        }
      }

      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:67 description:@"Recovery key is not correct"];
      unint64_t v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_95;
    }

    if (v10 != 3) {
      goto LABEL_72;
    }
    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      [v8 dataUsingEncoding:4];
      char v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        if (!a5)
        {
LABEL_99:
          unsigned int v25 = 0LL;
          goto LABEL_100;
        }

        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:41 description:@"Malformed recovery key"];
        unint64_t v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_95;
      }

      [v7 sbd];
      char v29 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v30 = v29;
      if (v29) {
        v51 = v29;
      }
      else {
        v51 = objc_alloc_init((Class)getSecureBackupClass());
      }

      v60 = 0LL;
      char v33 = [v51 restoreKeychainWithBackupPassword:v28 error:&v60];
      char v34 = v60;
      if (v33)
      {
        secLogObjForScope();
        unsigned int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( &dword_18744F000,  v35,  OS_LOG_TYPE_DEFAULT,  "restoreKeychainWithBackupPassword succeeded",  (uint8_t *)&buf,  2u);
        }
      }

      else
      {
        secLogObjForScope();
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v34;
          _os_log_impl( &dword_18744F000,  v36,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: restoreKeychainWithBackupPassword returned error: %@",  (uint8_t *)&buf,  0xCu);
        }

        if (v12 != 3)
        {
          if (a5)
          {
            if (v34)
            {
              unint64_t v37 = v34;
            }

            else
            {
              [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:66 description:@"Restore Keychain With Backup Password Failed"];
              unint64_t v37 = (id)objc_claimAutoreleasedReturnValue();
            }

            *a5 = v37;
          }

          goto LABEL_99;
        }
      }
    }

    if (v12 == 1)
    {
      if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0 && [v7 octagonCapableRecordsExist])
      {
        secLogObjForScope();
        char v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( &dword_18744F000,  v38,  OS_LOG_TYPE_DEFAULT,  "Recovery key exists in SOS but not in Octagon and this platform does not support SOS.  Octagon records exist , forcing iCSC restore",  (uint8_t *)&buf,  2u);
        }

        if (!a5) {
          goto LABEL_99;
        }
        objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:description:",  *MEMORY[0x18960AFE0],  65,  @"recover with recovery key configuration not supported, forcing iCSC restore");
        unint64_t v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_95;
      }

      uint64_t v39 = 1;
    }

    else
    {
LABEL_72:
      uint64_t v39 = 0;
    }

    *(void *)&buf = 0LL;
    *((void *)&buf + 1) = &buf;
    v67 = 0x3032000000LL;
    v68 = __Block_byref_object_copy_;
    v69 = __Block_byref_object_dispose_;
    v70[0] = 0LL;
    obj = 0LL;
    [v7 makeOTControl:&obj];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v70, obj);
    if (v40)
    {
      if (v39)
      {
        v41 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
        char v42 = [v7 isGuitarfish];
        v54[0] = MEMORY[0x1895F87A8];
        v54[1] = 3221225472LL;
        v54[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke;
        v54[3] = &unk_18A04F348;
        p_buf = &buf;
        v55 = v40;
        v56 = v7;
        v57 = v8;
        LOBYTE(v50) = v42;
        [v55 resetAndEstablish:v41 resetReason:5 idmsTargetContext:0 idmsCuttlefishPassword:0 notifyIdMS:0 accountSettings:0 isGuitarfish:v50 reply:v54];

        unsigned int v43 = v55;
        goto LABEL_82;
      }

      if (v12 == 3)
      {
        unsigned int v43 = (id)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
        v53[0] = MEMORY[0x1895F87A8];
        v53[1] = 3221225472LL;
        v53[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_93;
        v53[3] = &unk_18A04F230;
        v53[4] = &buf;
        [v40 recoverWithRecoveryKey:v43 recoveryKey:v8 reply:v53];
LABEL_82:

        uint64_t v47 = *(void **)(*((void *)&buf + 1) + 40LL);
        if (a5 && v47)
        {
          *a5 = v47;
          uint64_t v47 = *(void **)(*((void *)&buf + 1) + 40LL);
        }

        unsigned int v25 = v47 == 0LL;
        goto LABEL_93;
      }

      secLogObjForScope();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl( &dword_18744F000,  v48,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: joining with recovery key failed, recovery key is not correct in Octagon",  v64,  2u);
      }

      if (a5)
      {
        [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:67 description:@"Recovery key is not correct"];
        char v46 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_91;
      }
    }

    else
    {
      secLogObjForScope();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v45 = *(void *)(*((void *)&buf + 1) + 40LL);
        *(_DWORD *)v64 = 138412290;
        v65 = v45;
        _os_log_impl( &dword_18744F000,  v44,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: unable to create otcontrol: %@",  v64,  0xCu);
      }

      if (a5)
      {
        char v46 = *(id *)(*((void *)&buf + 1) + 40LL);
LABEL_91:
        unsigned int v25 = 0LL;
        *a5 = v46;
LABEL_93:

        _Block_object_dispose(&buf, 8);
LABEL_100:

        goto LABEL_101;
      }
    }

    unsigned int v25 = 0LL;
    goto LABEL_93;
  }

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x18960AFE0] code:41 description:@"Malformed Recovery Key" underlying:v63];
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();

  secLogObjForScope();
  char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_18744F000,  v24,  OS_LOG_TYPE_DEFAULT,  "octagon-recover-with-rk: recovery failed validation with error:%@",  (uint8_t *)&buf,  0xCu);
  }

  if (a5)
  {
    uint64_t v11 = v11;
    unsigned int v25 = 0LL;
    *a5 = v11;
  }

  else
  {
    unsigned int v25 = 0LL;
  }

LABEL_101:
  return v25;
}

void sub_187463F50(_Unwind_Exception *a1)
{
}

LABEL_19:
    uint64_t v14 = 0LL;
    goto LABEL_20;
  }

  uint64_t v10 = (id *)(*((void *)&buf + 1) + 40LL);
  obj[0] = *(id *)(*((void *)&buf + 1) + 40LL);
  [v7 makeOTControl:obj];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v10, obj[0]);
  if (!v11)
  {
    secLogObjForScope();
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = *(void **)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)uint64_t v26 = 138412290;
      unint64_t v27 = v18;
      _os_log_impl(&dword_18744F000, v17, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v26, 0xCu);
    }

    if (a5)
    {
      uint64_t v16 = *(id *)(*((void *)&buf + 1) + 40LL);
      uint64_t v11 = 0LL;
      goto LABEL_17;
    }

    uint64_t v11 = 0LL;
    goto LABEL_19;
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x18960AFA0]) initWithConfiguration:v7];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __81__OTClique_Framework__preflightRecoverOctagonUsingRecoveryKey_recoveryKey_error___block_invoke;
  v20[3] = &unk_18A04F2F8;
  v20[4] = &v22;
  v20[5] = &buf;
  [v11 preflightRecoverOctagonUsingRecoveryKey:v12 recoveryKey:v8 reply:v20];

  if (a5)
  {
    uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v13) {
      *a5 = v13;
    }
  }

  uint64_t v14 = *((_BYTE *)v23 + 24) != 0;
LABEL_20:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

void sub_1874642B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1874645D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_187464904( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_16:
  [MEMORY[0x189607968] numberWithBool:self->_containsIcdpData];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v13 forKey:@"contains_icdp_data"];

  has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    [MEMORY[0x189607968] numberWithBool:self->_nonViableRepair];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v9 forKey:@"non_viable_repair"];
  }

  return v4;
}

  PBDataWriterWriteBOOLField();
  uint64_t v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    uint64_t v4 = v6;
  }

  v4[24] = self->_containsIcdpData;
  v4[32] |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    v4[25] = self->_nonViableRepair;
    v4[32] |= 2u;
  }

  self->_containsIcdpData = v4[24];
  *(_BYTE *)&self->_has |= 1u;
  v5 = v4[32];
  if ((v5 & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_11:
  if ((v5 & 2) != 0)
  {
LABEL_12:
    self->_nonViableRepair = v4[25];
    *(_BYTE *)&self->_has |= 2u;
  }

LABEL_13:
}
}
}

LABEL_12:
  *(_BYTE *)(v5 + 24) = self->_containsIcdpData;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 25) = self->_nonViableRepair;
    *(_BYTE *)(v5 + 32) |= 2u;
  }

  return (id)v5;
}

  uint64_t v8 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = 2654435761LL * self->_usesMultipleIcsc;
  if ((*(_BYTE *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v10 = 2654435761LL * self->_nonViableRepair;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

  return (char)a4;
}

LABEL_49:
    uint64_t v9 = 0;
  }

uint64_t OTCDPRecoveryInformationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16LL;
          goto LABEL_30;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0LL;
          *(_BYTE *)(a1 + 32) |= 8u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1LL || v24 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v25 = *(_BYTE *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0LL;
                  goto LABEL_69;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v22 = 0LL;
          }
LABEL_69:
          BOOL v57 = v22 != 0;
          uint64_t v58 = 27LL;
          goto LABEL_90;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8LL;
LABEL_30:
          uint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose((const void *)(v8 - 112), 8) = v17;

          continue;
        case 4u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0LL;
          *(_BYTE *)(a1 + 32) |= 0x10u;
          while (2)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1LL || v31 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v32 = *(_BYTE *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v14 = v28++ >= 9;
                if (v14)
                {
                  uint64_t v29 = 0LL;
                  goto LABEL_73;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v29 = 0LL;
          }
LABEL_73:
          BOOL v57 = v29 != 0;
          uint64_t v58 = 28LL;
          goto LABEL_90;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0LL;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1LL || v37 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v38 = *(_BYTE *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  uint64_t v35 = 0LL;
                  goto LABEL_77;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v35 = 0LL;
          }
LABEL_77:
          BOOL v57 = v35 != 0;
          uint64_t v58 = 26LL;
          goto LABEL_90;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0LL;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (2)
          {
            uint64_t v42 = *v3;
            unint64_t v43 = *(void *)(a2 + v42);
            if (v43 == -1LL || v43 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v44 = *(_BYTE *)(*(void *)(a2 + *v7) + v43);
              *(void *)(a2 + v42) = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (v14)
                {
                  uint64_t v41 = 0LL;
                  goto LABEL_81;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v41 = 0LL;
          }
LABEL_81:
          BOOL v57 = v41 != 0;
          uint64_t v58 = 24LL;
          goto LABEL_90;
        case 7u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0LL;
          *(_BYTE *)(a1 + 32) |= 0x20u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1LL || v49 >= *(void *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }

            else
            {
              char v50 = *(_BYTE *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v4_Block_object_dispose((const void *)(v8 - 112), 8) = v49 + 1;
              v47 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  uint64_t v47 = 0LL;
                  goto LABEL_85;
                }

                continue;
              }
            }

            break;
          }

          if (*(_BYTE *)(a2 + *v5)) {
            uint64_t v47 = 0LL;
          }
LABEL_85:
          BOOL v57 = v47 != 0;
          uint64_t v58 = 29LL;
          goto LABEL_90;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0LL;
          *(_BYTE *)(a1 + 32) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result) {
            return result;
          }
          continue;
      }

      while (1)
      {
        uint64_t v54 = *v3;
        unint64_t v55 = *(void *)(a2 + v54);
        if (v55 == -1LL || v55 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v56 = *(_BYTE *)(*(void *)(a2 + *v7) + v55);
        *(void *)(a2 + v54) = v55 + 1;
        v53 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0) {
          goto LABEL_87;
        }
        v51 += 7;
        BOOL v14 = v52++ >= 9;
        if (v14)
        {
          uint64_t v53 = 0LL;
          goto LABEL_89;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
      if (*(_BYTE *)(a2 + *v5)) {
        uint64_t v53 = 0LL;
      }
LABEL_89:
      BOOL v57 = v53 != 0;
      uint64_t v58 = 25LL;
LABEL_90:
      *(_BYTE *)(a1 + v5_Block_object_dispose((const void *)(v8 - 112), 8) = v57;
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTEscrowRecordReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  unint64_t v7 = 0x18C6D5000uLL;
  char v8 = (int *)MEMORY[0x189611CD8];
  unint64_t v9 = 0x18C6D5000uLL;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5)) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    char v10 = 0;
    unsigned int v11 = 0;
    unint64_t v12 = 0LL;
    while (1)
    {
      uint64_t v13 = *v3;
      unint64_t v14 = *(void *)(a2 + v13);
      if (v14 == -1LL || v14 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v15 = *(_BYTE *)(*(void *)(a2 + *v8) + v14);
      *(void *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0) {
        goto LABEL_12;
      }
      v10 += 7;
      BOOL v16 = v11++ >= 9;
      if (v16)
      {
        unint64_t v12 = 0LL;
        int v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    int v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5)) {
      unint64_t v12 = 0LL;
    }
LABEL_14:
    if (v17 || (v12 & 7) == 4) {
      return *(_BYTE *)(a2 + *v5) == 0;
    }
    switch((v12 >> 3))
    {
      case 1u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 2u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1LL || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(_BYTE *)(*(void *)(a2 + *v8) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_87;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            uint64_t v21 = 0LL;
            goto LABEL_89;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v21 = 0LL;
        }
LABEL_89:
        uint64_t v68 = *(int *)(v9 + 740);
        goto LABEL_110;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 4u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1LL || v28 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v29 = *(_BYTE *)(*(void *)(a2 + *v8) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v21 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v16 = v26++ >= 9;
              if (v16)
              {
                uint64_t v21 = 0LL;
                goto LABEL_93;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v21 = 0LL;
        }
LABEL_93:
        uint64_t v68 = 24LL;
        goto LABEL_110;
      case 3u:
        unint64_t v30 = v7;
        unint64_t v31 = v9;
        char v32 = objc_alloc_init(&OBJC_CLASS___OTEscrowRecordMetadata);
        objc_storeStrong((id *)(a1 + 40), v32);
        if (PBReaderPlaceMark() && (OTEscrowRecordMetadataReadFrom((uint64_t)v32, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          unint64_t v9 = v31;
          unint64_t v7 = v30;
LABEL_120:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0LL;
      case 4u:
        uint64_t v33 = PBReaderReadString();
        uint64_t v34 = 64LL;
        goto LABEL_85;
      case 9u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 8u;
        while (2)
        {
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 == -1LL || v39 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v40 = *(_BYTE *)(*(void *)(a2 + *v8) + v39);
            *(void *)(a2 + v3_Block_object_dispose((const void *)(v8 - 112), 8) = v39 + 1;
            v21 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v16 = v37++ >= 9;
              if (v16)
              {
                uint64_t v21 = 0LL;
                goto LABEL_97;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v21 = 0LL;
        }
LABEL_97:
        uint64_t v68 = 32LL;
        goto LABEL_110;
      case 0xAu:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v43 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 0x10u;
        while (2)
        {
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 == -1LL || v45 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v46 = *(_BYTE *)(*(void *)(a2 + *v8) + v45);
            *(void *)(a2 + v44) = v45 + 1;
            v43 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              BOOL v16 = v42++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_101;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v43) = 0;
        }
LABEL_101:
        uint64_t v69 = 80LL;
        goto LABEL_119;
      case 0xBu:
        uint64_t v33 = PBReaderReadString();
        uint64_t v34 = 72LL;
        goto LABEL_85;
      case 0xCu:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v43 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 0x40u;
        while (2)
        {
          uint64_t v49 = *v3;
          unint64_t v50 = *(void *)(a2 + v49);
          if (v50 == -1LL || v50 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v51 = *(_BYTE *)(*(void *)(a2 + *v8) + v50);
            *(void *)(a2 + v49) = v50 + 1;
            v43 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              BOOL v16 = v48++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_105;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v43) = 0;
        }
LABEL_105:
        uint64_t v69 = 88LL;
        goto LABEL_119;
      case 0xDu:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v21 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 1u;
        while (2)
        {
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 == -1LL || v55 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v56 = *(_BYTE *)(*(void *)(a2 + *v8) + v55);
            *(void *)(a2 + v54) = v55 + 1;
            v21 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              BOOL v16 = v53++ >= 9;
              if (v16)
              {
                uint64_t v21 = 0LL;
                goto LABEL_109;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v21 = 0LL;
        }
LABEL_109:
        uint64_t v68 = 8LL;
LABEL_110:
        *(void *)(a1 + v6_Block_object_dispose((const void *)(v8 - 112), 8) = v21;
        goto LABEL_120;
      case 0xEu:
        uint64_t v33 = PBReaderReadString();
        uint64_t v34 = 96LL;
        goto LABEL_85;
      case 0xFu:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v43 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 0x20u;
        while (2)
        {
          uint64_t v59 = *v3;
          unint64_t v60 = *(void *)(a2 + v59);
          if (v60 == -1LL || v60 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v61 = *(_BYTE *)(*(void *)(a2 + *v8) + v60);
            *(void *)(a2 + v59) = v60 + 1;
            v43 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              BOOL v16 = v58++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_114;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v43) = 0;
        }
LABEL_114:
        uint64_t v69 = 84LL;
        goto LABEL_119;
      case 0x10u:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v43 = 0LL;
        *(_BYTE *)(a1 + *(int *)(v7 + 736)) |= 0x80u;
        while (2)
        {
          uint64_t v64 = *v3;
          unint64_t v65 = *(void *)(a2 + v64);
          if (v65 == -1LL || v65 >= *(void *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }

          else
          {
            char v66 = *(_BYTE *)(*(void *)(a2 + *v8) + v65);
            *(void *)(a2 + v64) = v65 + 1;
            v43 |= (unint64_t)(v66 & 0x7F) << v62;
            if (v66 < 0)
            {
              v62 += 7;
              BOOL v16 = v63++ >= 9;
              if (v16)
              {
                LODWORD(v43) = 0;
                goto LABEL_118;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v43) = 0;
        }
LABEL_118:
        uint64_t v69 = 104LL;
LABEL_119:
        *(_DWORD *)(a1 + v69) = v43;
        goto LABEL_120;
      case 0x11u:
        uint64_t v33 = PBReaderReadString();
        uint64_t v34 = 56LL;
        goto LABEL_85;
      case 0x12u:
        uint64_t v33 = PBReaderReadString();
        uint64_t v34 = 48LL;
LABEL_85:
        v67 = *(void **)(a1 + v34);
        *(void *)(a1 + v34) = v33;

        goto LABEL_120;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_120;
    }
  }

BOOL OTICDPRecordContextReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    unint64_t v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        int v17 = objc_alloc_init(&OBJC_CLASS___OTCDPRecoveryInformation);
        objc_storeStrong((id *)(a1 + 16), v17);
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    int v17 = objc_alloc_init(&OBJC_CLASS___OTEscrowAuthenticationInformation);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (OTEscrowAuthenticationInformationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0LL;
    }

    goto LABEL_25;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

LABEL_21:
  unint64_t v28 = 0LL;
LABEL_22:

  return v28;
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x189611CF8]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x189611D00]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x189611D10]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x189611D20]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x189611D28]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x189611D38]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x189611D40]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x189611D48]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x189611D50]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x189611D58]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x189611D60]();
}

uint64_t SOSCCCopyMyPeerInfo()
{
  return MEMORY[0x18960B000]();
}

uint64_t SOSCCCopyMyPeerWithNewDeviceRecoverySecret()
{
  return MEMORY[0x18960B008]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x18960B010]();
}

uint64_t SOSCCPushResetCircle()
{
  return MEMORY[0x18960B020]();
}

uint64_t SOSCCRegisterRecoveryPublicKey()
{
  return MEMORY[0x18960B028]();
}

uint64_t SOSCCRequestToJoinCircleAfterRestore()
{
  return MEMORY[0x18960B030]();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return MEMORY[0x18960B038]();
}

uint64_t SOSPeerInfoCopyBackupKey()
{
  return MEMORY[0x18960B040]();
}

uint64_t SOSPeerInfoCopySerialNumber()
{
  return MEMORY[0x18960B050]();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return MEMORY[0x18960B058]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x18960B528]();
}

uint64_t SecPasswordValidatePasswordFormat()
{
  return MEMORY[0x18960B530]();
}

uint64_t SecRKCreateRecoveryKeyString()
{
  return MEMORY[0x18960B5D8]();
}

uint64_t SecRKCreateRecoveryKeyWithError()
{
  return MEMORY[0x18960B5E0]();
}

uint64_t SecRKRegisterBackupPublicKey()
{
  return MEMORY[0x18960B5E8]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _OctagonSignpostCreate()
{
  return MEMORY[0x18960B768]();
}

uint64_t _OctagonSignpostGetNanoseconds()
{
  return MEMORY[0x18960B770]();
}

uint64_t _OctagonSignpostLogSystem()
{
  return MEMORY[0x18960B778]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1895F9780]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1895F9788]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1895F9C80]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1895FA460]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1895FA468]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1895FA470]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1895FA478]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166A8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

uint64_t secLogObjForScope()
{
  return MEMORY[0x18960BE90]();
}

uint64_t objc_msgSend__fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error_);
}

uint64_t objc_msgSend_handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error_);
}

uint64_t objc_msgSend_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply_);
}

uint64_t objc_msgSend_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error_);
}

uint64_t objc_msgSend_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply_);
}

uint64_t objc_msgSend_restoreKeychainAsyncWithPassword_keybagDigest_haveBottledPeer_viewsNotToBeRestored_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_restoreKeychainAsyncWithPassword_keybagDigest_haveBottledPeer_viewsNotToBeRestored_error_);
}