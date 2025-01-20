id NBSCLog()
{
  if (qword_413E8 != -1) {
    dispatch_once(&qword_413E8, &stru_2C250);
  }
  return (id)qword_413E0;
}

void sub_39C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.NBSC");
  v2 = (void *)qword_413E0;
  qword_413E0 = (uint64_t)v1;
}

id NBSCLogFormatParser()
{
  if (qword_413F8 != -1) {
    dispatch_once(&qword_413F8, &stru_2C270);
  }
  return (id)qword_413F0;
}

void sub_3A34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.NBSC");
  v2 = (void *)qword_413F0;
  qword_413F0 = (uint64_t)v1;
}

uint64_t CToText::Init(CToText *this, const char *__filename)
{
  v3 = fopen(__filename, "rb");
  if (!v3) {
    return 1LL;
  }
  v4 = v3;
  if (fread(this, 0xBD0uLL, 1uLL, v3)) {
    return 0LL;
  }
  fclose(v4);
  return 2LL;
}

uint64_t CToText::SetConvertMode(CToText *this, int a2)
{
  this->TenMap.Dat = 0;
  switch(a2)
  {
    case 0:
      uint64_t result = 0LL;
      this->EvNo = 0;
      return result;
    case 1:
      uint64_t result = 0LL;
      unsigned __int8 v4 = 4;
      this->EvNo = 4;
      goto LABEL_6;
    case 2:
      uint64_t result = 0LL;
      this->EvNo = 1;
      unsigned __int8 v4 = 8;
LABEL_6:
      this->TenMap.Dat = v4;
      return result;
    case 3:
      uint64_t result = 0LL;
      int v5 = 20;
      goto LABEL_10;
    case 4:
      uint64_t result = 0LL;
      int v5 = 21;
      goto LABEL_10;
    case 5:
      uint64_t result = 0LL;
      int v5 = 22;
LABEL_10:
      this->EvNo = v5;
      break;
    default:
      uint64_t result = 1LL;
      break;
  }

  return result;
}

uint64_t CToText::BrlToText(CToText *this, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  this->TextStr = (int *)v4;
  *(_WORD *)(v4 + 8) = 0;
  *(void *)uint64_t v4 = 0LL;
  uint64_t v5 = *(void *)(a2 + 16);
  this->VoiceStr = (int *)v5;
  *(_WORD *)(v5 + 8) = 0;
  *(void *)uint64_t v5 = 0LL;
  this->Rep = 0;
  unsigned __int8 v6 = *(_BYTE *)a2;
  if (this->EvNo == 21)
  {
    unsigned __int8 v7 = *(_BYTE *)a2;
  }

  else
  {
    unsigned __int8 v7 = v6 - 1;
    if ((v6 - 1) >= 0x40u)
    {
      if (*(_BYTE *)a2) {
        return 3LL;
      }
      unsigned __int8 v7 = 64;
    }
  }

  this->cCh = v7;
  this->cChOld = this->cCh;
  *(_DWORD *)(a2 + 24) = (this->TenMap.Dat >> 2) & 1;
  return this->Rep;
}

uint64_t CToText::EventCall(CToText *this)
{
  int EvNo = this->EvNo;
  switch(EvNo)
  {
    case 0:
      CToText::Func0(this);
      return 0LL;
    case 1:
      return CToText::Func1(this);
    case 4:
      CToText::Func4(this);
      return 0LL;
    case 5:
      return CToText::Func5(this);
    default:
      if ((EvNo - 13) > 6)
      {
        if (EvNo == 21)
        {
          CToText::Func21(this);
        }

        else if (EvNo == 20)
        {
          unint64_t cCh = this->cCh;
          if (cCh > 0x40)
          {
            int v4 = 3;
          }

          else
          {
            int v4 = 0;
            *this->TextStr = dword_26248[cCh];
          }

          this->Rep = v4;
        }

        else
        {
          CToText::Func2(this);
        }
      }

      else
      {
        CToText::Func13(this);
      }

      return 0LL;
  }
}

uint64_t CToText::Func0(CToText *this)
{
  uint64_t cCh = this->cCh;
  if (this->cCh > 0x2Eu)
  {
    if ((_DWORD)cCh == 47)
    {
      this->int EvNo = 4;
      this->TenMap.Dat |= 0x30u;
      goto LABEL_18;
    }

    if ((_DWORD)cCh == 53)
    {
      int v7 = 18;
      goto LABEL_17;
    }

    if ((_DWORD)cCh != 64) {
      goto LABEL_13;
    }
    int v3 = 0;
    TextStr = this->TextStr;
    int v5 = 32;
LABEL_11:
    int *TextStr = v5;
    goto LABEL_19;
  }

  if ((_DWORD)cCh == 21)
  {
    int v3 = 0;
    TextStr = this->TextStr;
    int v5 = 33;
    goto LABEL_11;
  }

  if ((_DWORD)cCh == 35)
  {
    int v7 = 19;
LABEL_17:
    this->int EvNo = v7;
    goto LABEL_18;
  }

  if ((_DWORD)cCh != 37)
  {
LABEL_13:
    unsigned int v6 = this->m_pcKanDat[4 * cCh];
    this->int EvNo = v6;
    if ((v6 + 95) <= 0x3Eu)
    {
      int v3 = 0;
      *this->TextStr = v6 + 65216;
      this->int EvNo = 0;
      goto LABEL_19;
    }

    if (v6 >= 0x14)
    {
      this->int EvNo = 0;
      int v3 = 4;
      goto LABEL_19;
    }

LABEL_18:
    int v3 = 1;
    goto LABEL_19;
  }

  this->TenMap.Dat |= 4u;
  this->int EvNo = 4;
  wcscpy(this->VoiceStr, dword_26228);
  int v3 = 2;
LABEL_19:
  this->Rep = v3;
  return 0LL;
}

uint64_t CToText::Func1(CToText *this)
{
  uint64_t cCh = this->cCh;
  if ((_DWORD)cCh == 35)
  {
    if ((this->TenMap.Dat & 8) != 0) {
      goto LABEL_15;
    }
    if ((this->TenMap.Dat & 0x14) == 0)
    {
      uint64_t v2 = 0LL;
      *(void *)&this->int EvNo = 0x100000000LL;
      return v2;
    }

    int v4 = 4;
    goto LABEL_14;
  }

  if ((_DWORD)cCh != 64)
  {
    uint64_t v5 = 4 * cCh + 252 * this->EvNo;
    int v6 = this->m_pcKanDat[v5];
    if (this->m_pcKanDat[v5])
    {
      if ((v6 - 48) > 9)
      {
        uint64_t v2 = 0LL;
        this->int EvNo = this->TenMap.Dat & 4;
        return v2;
      }

      uint64_t v2 = 0LL;
      *this->TextStr = v6;
      goto LABEL_11;
    }

    if ((this->TenMap.Dat & 8) != 0)
    {
LABEL_15:
      uint64_t v2 = 0LL;
      this->Rep = 3;
      return v2;
    }

    int v4 = this->TenMap.Dat & 4;
LABEL_14:
    this->int EvNo = v4;
    return 1LL;
  }

  if ((this->TenMap.Dat & 8) != 0) {
    goto LABEL_15;
  }
  uint64_t v2 = 0LL;
  *this->TextStr = 32;
  unsigned __int8 Dat = this->TenMap.Dat;
  this->TenMap.unsigned __int8 Dat = Dat & 0xEF;
  this->int EvNo = Dat & 4;
LABEL_11:
  this->Rep = 0;
  return v2;
}

uint64_t CToText::Func4(CToText *this)
{
  uint64_t cCh = this->cCh;
  if (this->cCh <= 0x20u)
  {
    if (this->cCh <= 0x10u)
    {
      if ((_DWORD)cCh == 3)
      {
        if ((~this->TenMap.Dat & 0x30) != 0) {
          goto LABEL_29;
        }
        TextStr = this->TextStr;
        int v6 = 65378;
        goto LABEL_28;
      }

      if ((_DWORD)cCh != 15) {
        goto LABEL_29;
      }
      this->TenMap.Dat &= ~0x20u;
      p_int EvNo = &this->EvNo;
      uint64_t v8 = 13LL;
    }

    else
    {
      switch((_DWORD)cCh)
      {
        case 0x11:
          this->TenMap.Dat &= ~0x20u;
          p_int EvNo = &this->EvNo;
          uint64_t v8 = 15LL;
          break;
        case 0x13:
          this->TenMap.Dat &= ~0x20u;
          p_int EvNo = &this->EvNo;
          uint64_t v8 = 14LL;
          break;
        case 0x1F:
          unsigned __int8 Dat = this->TenMap.Dat;
          *(void *)&this->int EvNo = 0x100000005LL;
          this->TenMap.unsigned __int8 Dat = Dat & 0xDC | 2;
          return 0LL;
        default:
LABEL_29:
          int v11 = this->m_pcKanDat[252 * this->EvNo + 4 * cCh];
          if (v11)
          {
            if ((char)v11 >= 33)
            {
              *this->TextStr = v11;
              this->TenMap.Dat &= ~0x20u;
LABEL_42:
              this->Rep = 0;
              return 0LL;
            }

            this->int EvNo = v11;
            this->TenMap.Dat &= ~0x20u;
            int v12 = 1;
          }

          else
          {
            this->TenMap.Dat &= ~0x20u;
            int v12 = 3;
          }

          this->Rep = v12;
          return 0LL;
      }
    }

    goto LABEL_34;
  }

  if (this->cCh > 0x34u)
  {
    if ((_DWORD)cCh != 53)
    {
      if ((_DWORD)cCh != 59)
      {
        if ((_DWORD)cCh != 64) {
          goto LABEL_29;
        }
        int v4 = this->TenMap.Dat;
        if ((~v4 & 0x30) == 0)
        {
          TextStr = this->TextStr;
          int v6 = 65380;
LABEL_28:
          int *TextStr = v6;
          unsigned __int8 v10 = this->TenMap.Dat & 0xCF;
          goto LABEL_44;
        }

        v13 = this->TextStr;
        int v14 = 32;
LABEL_41:
        int *v13 = v14;
        if ((v4 & 0x10) == 0) {
          goto LABEL_42;
        }
        unsigned __int8 v10 = this->TenMap.Dat & 0xEF;
LABEL_44:
        this->TenMap.unsigned __int8 Dat = v10;
        *(void *)&this->int EvNo = 0LL;
        return 0LL;
      }

      this->TenMap.Dat &= ~0x20u;
      p_int EvNo = &this->EvNo;
      unint64_t v9 = 0x100000001LL;
LABEL_35:
      *(void *)p_int EvNo = v9;
      return 0LL;
    }

    this->TenMap.Dat &= ~0x20u;
    p_int EvNo = &this->EvNo;
    uint64_t v8 = 17LL;
LABEL_34:
    unint64_t v9 = v8 & 0xFFFF0000FFFFFFFFLL | 0x100000000LL;
    goto LABEL_35;
  }

  if ((_DWORD)cCh == 33)
  {
    this->TenMap.Dat &= ~0x20u;
    p_int EvNo = &this->EvNo;
    uint64_t v8 = 16LL;
    goto LABEL_34;
  }

  if ((_DWORD)cCh == 35)
  {
    int v4 = this->TenMap.Dat;
    if ((~v4 & 0x30) == 0)
    {
      TextStr = this->TextStr;
      int v6 = 12302;
      goto LABEL_28;
    }

    v13 = this->TextStr;
    int v14 = 45;
    goto LABEL_41;
  }

  if ((_DWORD)cCh != 51) {
    goto LABEL_29;
  }
  unsigned __int8 v2 = this->TenMap.Dat;
  if ((v2 & 4) == 0) {
    goto LABEL_29;
  }
  *(void *)&this->int EvNo = 0x200000000LL;
  this->TenMap.unsigned __int8 Dat = v2 & 0xFB;
  wcscpy(this->VoiceStr, dword_2623C);
  return 0LL;
}

uint64_t CToText::Func5(CToText *this)
{
  uint64_t cCh = this->cCh;
  switch((_DWORD)cCh)
  {
    case 3:
      if (this->cChOld == 31)
      {
        uint64_t v2 = 0LL;
        *this->TextStr = 34;
        this->TenMap.Dat &= ~1u;
        p_int EvNo = &this->EvNo;
        uint64_t v5 = 4LL;
        goto LABEL_22;
      }

      uint64_t cCh = 3LL;
LABEL_14:
      int v8 = this->m_pcKanDat[4 * cCh + 1260];
      if (!v8)
      {
        this->int EvNo = 4;
        return 1LL;
      }

      if ((v8 - 65) <= 0x19)
      {
        *this->TextStr = v8;
        unsigned __int8 Dat = this->TenMap.Dat;
        if ((Dat & 1) == 0) {
          this->int EvNo = 4;
        }
        uint64_t v2 = 0LL;
        this->TenMap.unsigned __int8 Dat = Dat & 0xFD;
        goto LABEL_4;
      }

      uint64_t v2 = 0LL;
      p_int EvNo = &this->EvNo;
      uint64_t v5 = 0x400000004LL;
LABEL_22:
      *(void *)p_int EvNo = v5;
      return v2;
    case 0x40:
      uint64_t v2 = 0LL;
      *this->TextStr = 32;
      unsigned __int8 v3 = this->TenMap.Dat;
      this->TenMap.unsigned __int8 Dat = v3 & 0xEE;
      this->int EvNo = v3 & 4;
LABEL_4:
      this->Rep = 0;
      return v2;
    case 0x2F:
      uint64_t v2 = 0LL;
      p_int EvNo = &this->EvNo;
      uint64_t v5 = 0x100000004LL;
      goto LABEL_22;
  }

  if ((_DWORD)cCh != 31) {
    goto LABEL_14;
  }
  uint64_t v2 = 0LL;
  unsigned __int8 v6 = this->TenMap.Dat;
  if ((v6 & 2) != 0) {
    unsigned __int8 v7 = v6 | 1;
  }
  else {
    unsigned __int8 v7 = v6 & 0xFC | 2;
  }
  this->TenMap.unsigned __int8 Dat = v7;
  this->Rep = 1;
  return v2;
}

uint64_t CToText::Func13(CToText *this)
{
  unsigned int cCh = this->cCh;
  if (cCh > 0x10)
  {
    if (this->cCh <= 0x20u)
    {
      if (cCh == 17)
      {
        int EvNo = this->EvNo;
        if (EvNo == 15)
        {
          TextStr = this->TextStr;
          int v4 = 61;
          goto LABEL_31;
        }

        goto LABEL_34;
      }

      if (cCh == 19)
      {
        int EvNo = this->EvNo;
        if (EvNo == 14)
        {
          TextStr = this->TextStr;
          int v4 = 60;
          goto LABEL_31;
        }

LABEL_34:
        this->Rep = 3;
        int v5 = 4 * (EvNo < 18);
        goto LABEL_35;
      }
    }

    else
    {
      switch(cCh)
      {
        case '!':
          int EvNo = this->EvNo;
          if (EvNo == 16)
          {
            TextStr = this->TextStr;
            int v4 = 62;
            goto LABEL_31;
          }

          goto LABEL_34;
        case '#':
          int EvNo = this->EvNo;
          if (EvNo == 13)
          {
            TextStr = this->TextStr;
            int v4 = 95;
            goto LABEL_31;
          }

          goto LABEL_34;
        case '5':
          int EvNo = this->EvNo;
          if (EvNo == 13)
          {
            TextStr = this->TextStr;
            int v4 = 40;
LABEL_31:
            int *TextStr = v4;
            int v5 = 4;
            goto LABEL_32;
          }

          goto LABEL_34;
      }
    }

LABEL_33:
    int EvNo = this->EvNo;
    goto LABEL_34;
  }

  if (this->cCh > 7u)
  {
    if (cCh == 8)
    {
      int EvNo = this->EvNo;
      if (EvNo == 13)
      {
        TextStr = this->TextStr;
        int v4 = 126;
        goto LABEL_31;
      }

      goto LABEL_34;
    }

    if (cCh == 16)
    {
      int EvNo = this->EvNo;
      if (EvNo == 13)
      {
        TextStr = this->TextStr;
        int v4 = 96;
        goto LABEL_31;
      }

      goto LABEL_34;
    }

    goto LABEL_33;
  }

  if (cCh == 1)
  {
    int EvNo = this->EvNo;
    if (EvNo == 13)
    {
      TextStr = this->TextStr;
      int v4 = 58;
      goto LABEL_31;
    }

    if ((EvNo - 17) <= 1)
    {
      *this->TextStr = 41;
      int v5 = 4 * (EvNo < 0x12);
      goto LABEL_32;
    }

    goto LABEL_34;
  }

  if (cCh != 5) {
    goto LABEL_33;
  }
  int EvNo = this->EvNo;
  if (EvNo != 19) {
    goto LABEL_34;
  }
  int v5 = 0;
  *this->TextStr = 12303;
LABEL_32:
  this->Rep = 0;
LABEL_35:
  this->int EvNo = v5;
  return 0LL;
}

uint64_t CToText::Func20(CToText *this)
{
  unint64_t cCh = this->cCh;
  if (cCh > 0x40)
  {
    int v2 = 3;
  }

  else
  {
    int v2 = 0;
    *this->TextStr = dword_26248[cCh];
  }

  this->Rep = v2;
  return 0LL;
}

uint64_t CToText::Func21(CToText *this)
{
  unsigned __int8 cCh = this->cCh;
  if (cCh)
  {
    if ((this->cCh & 0x80) == 0)
    {
      uint64_t v2 = (cCh & 0x3F) - 1LL;
      int v3 = dword_26248[v2];
      TextStr = this->TextStr;
      int *TextStr = v3;
      if ((cCh & 0x40) == 0)
      {
        if ((cCh & 0x3F) != 0x38LL && ((0x1694125077D577D5uLL >> v2) & 1) != 0) {
          int *TextStr = v3 + 32;
        }
LABEL_15:
        int v6 = 0;
        goto LABEL_16;
      }

      if ((cCh & 0x3F) != 0x38LL && ((0xE96BEDAF882A882ALL >> v2) & 1) == 0) {
        goto LABEL_15;
      }
    }

    int v6 = 3;
  }

  else
  {
    int v6 = 0;
    *this->TextStr = 32;
  }

LABEL_16:
  this->Rep = v6;
  return 0LL;
}

  v13 = 0LL;
  int v14 = v11;
  do
    v15 = *(_DWORD *)(a1 + (v11 << 10) + 465948 + 4 * v13++);
  while (v15 != 32);
  v16 = 0LL;
  LODWORD(v17) = v13;
LABEL_19:
  v17 = (int)v17;
  while (1)
  {
    v18 = *(_DWORD *)(a1 + (v11 << 10) + 465948 + 4 * v17);
    if (!v18 || v18 == 44) {
      break;
    }
    ++v17;
    if ((v18 - 65382) < 0x3A || (v18 - 32) <= 0x5F)
    {
      *(_DWORD *)(a3 + 4 * v16++) = v18;
      goto LABEL_19;
    }
  }

  v19 = a1 + ((unint64_t)v11 << 10);
  if (*(_DWORD *)(v19 + 4 * wcslen((const __int32 *)(v19 + 465944)) + 465940) == 33)
  {
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 40) = 256LL;
    v20 = *(_DWORD *)(a2 - 4);
    if (v20 != 32 && v20 != 12288) {
      *(_WORD *)(a1 + 40) = 1280;
    }
  }

  if (*(_DWORD *)(v19 + 4 * wcslen((const __int32 *)(a1 + (v14 << 10) + 465944)) + 465940) == 34)
  {
    if ((*(_WORD *)(a1 + 16) & 0x80) != 0 || (*(_WORD *)(a1 + 48) & 0x80) != 0)
    {
      v22 = *(_DWORD *)(a2 - 4);
      v21 = v22 != 32 && v22 != 12288;
    }

    else
    {
      v21 = 0;
    }

    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 40) = 0LL;
    *(_WORD *)(a1 + 40) = (v21 << 10) | 0x200;
  }

  uint64_t result = (v13 - 1);
  *(_DWORD *)(a3 + 4LL * v16) = 0;
  return result;
}

uint64_t CToText::Func2(CToText *this)
{
  uint64_t cCh = this->cCh;
  if (this->cCh <= 0x1Au)
  {
    switch(this->cCh)
    {
      case 0u:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65383;
        break;
      case 1u:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65438;
        break;
      case 2u:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65384;
        break;
      case 3u:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65439;
        break;
      case 5u:
        int EvNo = this->EvNo;
        if (EvNo != 3) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65379;
        break;
      case 8u:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65385;
        break;
      case 9u:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65387;
        break;
      case 0xAu:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65386;
        break;
      case 0xBu:
        int EvNo = this->EvNo;
        if (EvNo != 8) {
          goto LABEL_38;
        }
        TextStr = this->TextStr;
        int v4 = 65388;
        break;
      default:
        goto LABEL_37;
    }

    goto LABEL_36;
  }

  if (this->cCh > 0x34u)
  {
    if ((_DWORD)cCh == 53)
    {
      int EvNo = this->EvNo;
      if (EvNo == 2)
      {
        TextStr = this->TextStr;
        int v4 = 40;
        goto LABEL_36;
      }

      goto LABEL_38;
    }

    if ((_DWORD)cCh == 64)
    {
      int v5 = this->EvNo;
      switch(v5)
      {
        case 2:
          int v6 = 65381;
          break;
        case 10:
          int v6 = 65377;
          break;
        case 7:
          int v6 = 63;
          break;
        default:
          p_int EvNo = &this->EvNo;
          uint64_t v12 = 3LL;
          goto LABEL_48;
      }

      *this->TextStr = v6;
      goto LABEL_52;
    }
  }

  else
  {
    if ((_DWORD)cCh == 27)
    {
      int EvNo = this->EvNo;
      if (EvNo == 8)
      {
        TextStr = this->TextStr;
        int v4 = 65390;
        goto LABEL_36;
      }

      goto LABEL_38;
    }

    if ((_DWORD)cCh == 43)
    {
      int EvNo = this->EvNo;
      if (EvNo == 8)
      {
        TextStr = this->TextStr;
        int v4 = 65389;
LABEL_36:
        int *TextStr = v4;
LABEL_52:
        *(void *)&this->int EvNo = 0LL;
        return 0LL;
      }

      goto LABEL_38;
    }
  }

LABEL_37:
  int EvNo = this->EvNo;
LABEL_38:
  uint64_t v7 = 4 * cCh + 252 * EvNo;
  if (this->m_pcKanDat[v7])
  {
    if ((this->m_pcKanDat[v7] + 95) <= 0x3Eu)
    {
      uint64_t v8 = 0LL;
      unint64_t v9 = &this->m_pcKanDat[v7];
      do
      {
        int v10 = v9[v8];
        if (!v9[v8]) {
          break;
        }
        ++v8;
      }

      while (v8 != 3);
      this->TextStr[v8] = 0;
      goto LABEL_52;
    }

    p_int EvNo = &this->EvNo;
    uint64_t v12 = 0x400000000LL;
  }

  else
  {
    p_int EvNo = &this->EvNo;
    uint64_t v12 = 0x300000000LL;
  }

LABEL_48:
  *(void *)p_int EvNo = v12;
  return 0LL;
}

void ktoau::~ktoau(ktoau *this)
{
  uint64_t v2 = (FILE *)*((void *)this + 8);
  if (v2) {
    fclose(v2);
  }
  int v3 = (FILE *)*((void *)this + 9);
  if (v3) {
    fclose(v3);
  }
  int v4 = (FILE *)*((void *)this + 10);
  if (v4) {
    fclose(v4);
  }
  int v5 = (FILE *)*((void *)this + 11);
  if (v5) {
    fclose(v5);
  }
  int v6 = (FILE *)*((void *)this + 12);
  if (v6) {
    fclose(v6);
  }
  uint64_t v7 = (FILE *)*((void *)this + 13);
  if (v7) {
    fclose(v7);
  }
  uint64_t v8 = (FILE *)*((void *)this + 14);
  if (v8) {
    fclose(v8);
  }
  unint64_t v9 = (FILE *)*((void *)this + 15);
  if (v9) {
    fclose(v9);
  }
  int v10 = (FILE *)*((void *)this + 16);
  if (v10) {
    fclose(v10);
  }
  int v11 = (FILE *)*((void *)this + 17);
  if (v11) {
    fclose(v11);
  }
}

uint64_t ktoau::Init(ktoau *this, char *a2)
{
  int v4 = getenv("HOME");
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = "var/mobile";
  }
  strcpy(__dst, v5);
  strcat(__dst, "/Library/Accessibility/ktoa_u_kwa_v5.dic");
  int v6 = fopen(__dst, "rb");
  *((void *)this + 8) = v6;
  if (!v6) {
    return 1LL;
  }
  uint64_t v7 = (char *)this + 144;
  uint64_t v8 = 44288LL;
  do
  {
    if (!fread(v7, 4uLL, 1uLL, *((FILE **)this + 8))) {
      return 2LL;
    }
    v7 += 8;
    --v8;
  }

  while (v8);
  strcpy(__dst, a2);
  strcat(__dst, "ktoa_u_hir.dic");
  unint64_t v9 = fopen(__dst, "rb");
  *((void *)this + 9) = v9;
  if (!v9) {
    return 3LL;
  }
  int v10 = (char *)this + 354448;
  uint64_t v11 = 6241LL;
  while (1)
  {
    uint64_t v12 = 4LL;
    if (!fread(v10, 4uLL, 1uLL, *((FILE **)this + 9))) {
      break;
    }
    v10 += 8;
    if (!--v11)
    {
      strcpy(__dst, a2);
      strcat(__dst, "ktoa_u_kat.dic");
      v13 = fopen(__dst, "rb");
      *((void *)this + 10) = v13;
      if (!v13) {
        return 5LL;
      }
      int v14 = (char *)this + 404376;
      uint64_t v15 = 7056LL;
      do
      {
        if (!fread(v14, 4uLL, 1uLL, *((FILE **)this + 10))) {
          return 6LL;
        }
        v14 += 8;
        --v15;
      }

      while (v15);
      strcpy(__dst, a2);
      strcat(__dst, "setubiu.dic");
      v16 = fopen(__dst, "rb");
      *((void *)this + 11) = v16;
      if (!v16) {
        return 7LL;
      }
      strcpy(__dst, a2);
      strcat(__dst, "settouu.dic");
      v17 = fopen(__dst, "rb");
      *((void *)this + 12) = v17;
      if (!v17) {
        return 8LL;
      }
      strcpy(__dst, a2);
      strcat(__dst, "suushiu.dic");
      v18 = fopen(__dst, "rb");
      *((void *)this + 13) = v18;
      if (!v18) {
        return 9LL;
      }
      strcpy(__dst, a2);
      strcat(__dst, "tan1u.dic");
      v19 = fopen(__dst, "rb");
      *((void *)this + 14) = v19;
      if (!v19) {
        return 10LL;
      }
      strcpy(__dst, a2);
      strcat(__dst, "tan2u.dic");
      v20 = fopen(__dst, "rb");
      *((void *)this + 15) = v20;
      if (!v20) {
        return 11LL;
      }
      strcpy(__dst, a2);
      strcat(__dst, "kigou.txt");
      v21 = fopen(__dst, "rb");
      *((void *)this + 16) = v21;
      if (!v21) {
        return 12LL;
      }
      if (!fread(&__ptr, 2uLL, 1uLL, v21)) {
        return 13LL;
      }
      uint64_t v12 = 14LL;
      if (__ptr == 255 && v25 == 254)
      {
        strcpy(__dst, a2);
        strcat(__dst, "userdic.txt");
        v22 = fopen(__dst, "rb");
        *((void *)this + 17) = v22;
        if (!v22 || fread(&__ptr, 2uLL, 1uLL, v22) && __ptr == 255 && v25 == 254)
        {
          return 0LL;
        }

        else
        {
          uint64_t v12 = 0LL;
          *((void *)this + 17) = 0LL;
        }
      }

      return v12;
    }
  }

  return v12;
}

void ktoau::SetBitReverse(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2)
  {
    int v3 = a2 + 1;
    do
    {
      *(v3 - 1) = (unsigned __int16)~(_WORD)v2;
      int v4 = *v3++;
      LOWORD(v2) = v4;
    }

    while (v4);
  }

size_t ktoau::IsKanjiMatch(uint64_t a1, __int32 *a2, __int32 *a3)
{
  size_t result = ktoau::IsUserMatch(a1, a2, a3);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v7 = (_DWORD *)(a1 + 460824);
  bzero((void *)(a1 + 460824), 0x1400uLL);
  *(_DWORD *)(a1 + 471064) = 0;
  fseek(*(FILE **)(a1 + 64), *(void *)(a1 + 8LL * (unsigned __int16)(*a2 - 19968) + 144), 0);
  v22 = (__int32 *)(a1 + 460828);
  uint64_t v8 = a1 + 460824;
  while (1)
  {
LABEL_5:
    unint64_t v9 = &v23;
    bzero(&v23, 0x400uLL);
    do
      fread(v9, 2uLL, 1uLL, *(FILE **)(a1 + 64));
    while (*v9++);
    __int16 v11 = v23;
    if (!v23)
    {
      __int32 v14 = *a2;
      if (*a2) {
        break;
      }
      goto LABEL_14;
    }

    uint64_t v12 = v24;
    do
    {
      *(v12 - 1) = (unsigned __int16)~v11;
      int v13 = *v12++;
      __int16 v11 = v13;
    }

    while (v13);
    __int32 v14 = v23;
    if (v23 != *a2) {
      break;
    }
    if (v23 == 32)
    {
      int v15 = 0;
      uint64_t v16 = 0LL;
      goto LABEL_18;
    }

LABEL_14:
    uint64_t v17 = 0LL;
    do
    {
      if (v14 != a2[v17])
      {
        if (*(_DWORD *)(a1 + 471064)) {
          return ktoau::SelectList(a1, (uint64_t)a2, (uint64_t)a3);
        }
        goto LABEL_5;
      }

      uint64_t v16 = v17 + 1;
      __int32 v14 = v24[v17++];
    }

    while (v14 != 32);
    int v15 = v16;
LABEL_18:
    switch(v24[wcslen(&v23) - 2])
    {
      case '&':
        __int32 v18 = a2[v16];
        int v19 = 24066;
        goto LABEL_25;
      case '(':
        __int32 v18 = a2[v16];
        int v19 = 21306;
        goto LABEL_25;
      case ')':
      case '*':
        __int32 v18 = a2[v16];
        int v19 = 30010;
        goto LABEL_25;
      case '+':
      case '.':
        __int32 v18 = a2[v16];
        int v19 = 26449;
LABEL_25:
        if (v18 == v19) {
          goto LABEL_26;
        }
        continue;
      default:
LABEL_26:
        uint64_t v20 = *(int *)(a1 + 471064);
        if ((_DWORD)v20)
        {
          wcscpy((__int32 *)(v8 + (v20 << 10) + 4), &v23);
          uint64_t v21 = *(int *)(a1 + 471064);
          *(_DWORD *)(v8 + (v21 << 10)) = v15;
        }

        else
        {
          wcscpy(v22, &v23);
          *uint64_t v7 = v15;
          LODWORD(v21) = *(_DWORD *)(a1 + 471064);
        }

        *(_DWORD *)(a1 + 471064) = v21 + 1;
        break;
    }
  }

  if (!*(_DWORD *)(a1 + 471064)) {
    return 0LL;
  }
  return ktoau::SelectList(a1, (uint64_t)a2, (uint64_t)a3);
}

    uint64_t v8 = aYoung;
    goto LABEL_15;
  }

  int v5 = EChk1(a1);
  if (v5)
  {
    strcpy(a2, &aYourselves[20 * v5]);
    int v6 = a1;
    return strlen(v6);
  }

  unint64_t v9 = EChk2(a1);
  if (v9)
  {
    strcpy(a2, &byte_3EA88[20 * v9]);
    return strlen(a1) + 1;
  }

  LODWORD(result) = EChk5(a1);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  size_t result = EChk3(a1);
  if ((_DWORD)result)
  {
    uint64_t v8 = &byte_3EB14;
    goto LABEL_15;
  }

  return result;
}

size_t ktoau::IsUserMatch(uint64_t a1, _DWORD *a2, __int32 *a3)
{
  size_t result = *(void *)(a1 + 136);
  if (!result) {
    return result;
  }
  fseek((FILE *)result, 0LL, 0);
  fread(__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 136));
  bzero(__ptr, 0x400uLL);
  size_t result = fread(__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 136));
  if (!result) {
    return result;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = __ptr;
  while (1)
  {
    while (*(_DWORD *)&__ptr[4 * v7] != 13)
    {
      ++v7;
      uint64_t v8 = &__ptr[4 * v7];
      size_t result = fread(v8, 2uLL, 1uLL, *(FILE **)(a1 + 136));
      if (!result) {
        return result;
      }
    }

    size_t v9 = fread(v8, 2uLL, 1uLL, *(FILE **)(a1 + 136));
    if (v20 != *a2) {
      goto LABEL_13;
    }
    *(_DWORD *)uint64_t v8 = 0;
    int v10 = v20;
    if (v20 == 44) {
      break;
    }
    uint64_t v11 = 0LL;
    while (v10 == a2[v11])
    {
      int v10 = *(_DWORD *)&__ptr[4 * (v11++ + 3)];
      if (v10 == 44)
      {
        int v12 = v11 + 2;
        goto LABEL_15;
      }
    }

LABEL_13:
    uint64_t v8 = __ptr;
    bzero(__ptr, 0x400uLL);
    size_t result = fread(__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 136));
    uint64_t v7 = 0LL;
    if (!result) {
      return result;
    }
  }

  int v12 = 2;
LABEL_15:
  int v13 = 0;
  int v14 = v12;
LABEL_16:
  int v15 = v14 + 1;
  uint64_t v16 = (const __int32 *)&__ptr[4 * v14 + 4];
  while (1)
  {
    int v14 = v15;
    __int32 v17 = *v16;
    if (!*v16) {
      break;
    }
    if ((v17 - 65382) < 0x3A || (v17 - 33) <= 0x5E)
    {
      a3[v13] = v17;
LABEL_26:
      size_t v9 = 1LL;
LABEL_27:
      v13 += v9;
      goto LABEL_16;
    }

    if (v17 == 12288 || v17 == 32)
    {
      a3[v13] = 32;
      goto LABEL_26;
    }

    size_t v9 = ktoau::ZenToHan(v9, v16, v18);
    int v15 = v14 + 1;
    ++v16;
    if ((_DWORD)v9)
    {
      wcscat(a3, v18);
      size_t v9 = wcslen(v18);
      goto LABEL_27;
    }
  }

  size_t result = (v12 - 2);
  a3[v13] = 0;
  return result;
}

    if ((int)v7 > 9600)
    {
LABEL_20:
      uint64_t v16 = (_DWORD *)&m_iInitErrCode;
      __int32 v17 = 2;
LABEL_76:
      v16[3] = v17;
      return;
    }

    if (m_iWordLapFlg)
    {
      if (v9)
      {
        int v14 = 0LL;
      }

      else
      {
        LODWORD(v14) = 0;
      }

      if ((*(unsigned __int8 *)(m_sPinStrBuf + 2LL * ((int)v7 + (int)v14 - 1)) | 0x80) == 0xC0)
      {
        v28 = (int)v14;
        v29 = v14 - 1;
        while (v28 >= 2)
        {
          v30 = v28 - 1;
          v31 = *(unsigned __int16 *)(m_sPinKeyBuf + 2 * v7 - 2 + 2 * v28--);
          if (v223 != v31)
          {
            v29 = v30;
            break;
          }
        }

        m_iBeforeCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * (v29 + (int)v7));
        v222 = ++m_iPinBlockCount;
        goto LABEL_185;
      }

      v32 = v14 - 1;
      if ((int)v14 <= 0)
      {
        v55 = m_sPinKeyBuf;
        v56 = (_DWORD *)&m_iInitErrCode;
LABEL_184:
        m_iBeforeCol = *(unsigned __int16 *)(v55 + 2LL * (v32 + (int)v7));
        v222 = m_iPinBlockCount + 1;
        v56[2] = m_iPinBlockCount + 1;
        goto LABEL_185;
      }

      v33 = v14;
      v34 = 2LL;
      v35 = v14;
      v36 = ((unint64_t)v14 << 32) - 0x100000000LL;
      while (1)
      {
        v37 = v35 - 1;
        v34 += 2LL;
        v36 -= 0x100000000LL;
        --v35;
      }

      v52 = (unsigned __int8 *)(m_sPinStrBuf + 2 * (v7 + v14) - v34);
      v53 = v35;
      while (1)
      {
        v54 = *v52;
        v52 -= 2;
        if ((v54 | 0x80) != 0xC0) {
          break;
        }
        int v13 = v53-- <= 1;
        if (v13) {
          goto LABEL_179;
        }
      }

      if (v35 < 2)
      {
LABEL_179:
        v55 = m_sPinKeyBuf;
        v56 = &m_iInitErrCode;
        if ((int)v14 > 1)
        {
          while (v223 == *(unsigned __int16 *)(m_sPinKeyBuf + 2 * v7 - 2 + 2 * v33))
          {
            if (v33-- <= 2)
            {
              v32 = 0;
              goto LABEL_184;
            }
          }

          v32 = v33 - 1;
        }

        goto LABEL_184;
      }

      v154 = (v35 - 1);
      v155 = v154;
      while (*(unsigned __int16 *)(m_sPinKeyBuf + 2 * v7 + 2 * v155) == *(unsigned __int16 *)(m_sPinKeyBuf
                                                                                             + 2 * v7
                                                                                             + 2 * v155
                                                                                             + 2))
      {
        int v13 = v155-- <= 1;
        if (v13)
        {
          LODWORD(v155) = 0;
          break;
        }
      }

      m_iBeforeCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * ((int)v155 + (int)v7));
      v183 = m_iMaxCol + m_iMaxCol * m_iPinBlockCount;
      *(_WORD *)(m_sPinKeyBuf + 2LL * v183) = 0;
      *(_WORD *)(v6 + 2LL * v183) = 0;
      v184 = &v8[v154];
      v185 = v184[1];
      v186 = 2 * v154;
      if (v185)
      {
        v187 = (unsigned __int16 *)(v186 + 2 * v7 + v6 + 4);
        v188 = &v224;
        do
        {
          *v188++ = v185;
          v189 = *v187++;
          v185 = v189;
        }

        while (v189);
      }

      else
      {
        v188 = &v224;
      }

      *v188 = 0;
      v190 = (int)v34;
      bzero(v184, (int)v34);
      v191 = m_iPinBlockCount;
      v192 = (_WORD *)(m_sPinStrBuf + 2LL * ((int)v5 + (int)v5 * m_iPinBlockCount));
      v193 = v224;
      if (v224)
      {
        v194 = (unsigned __int16 *)v225;
        do
        {
          *v192++ = v193;
          v195 = *v194++;
          v193 = v195;
        }

        while (v195);
      }

      *v192 = 0;
      v196 = v191 * v4;
      v197 = (_WORD *)(m_sPinKeyBuf + 2LL * v196 + 2 * v154);
      v198 = v197[1];
      if (v198)
      {
        v199 = (unsigned __int16 *)(v186 + 2LL * v196 + m_sPinKeyBuf + 4);
        v200 = &v224;
        do
        {
          *v200++ = v198;
          v201 = *v199++;
          v198 = v201;
        }

        while (v201);
      }

      else
      {
        v200 = &v224;
      }

      *v200 = 0;
      bzero(v197, v190);
      v104 = m_iPinBlockCount + 1;
      v105 = (_WORD *)(m_sPinKeyBuf + 2LL * (m_iPinBlockCount + 1) * (int)v5);
      v202 = v224;
      if (v224)
      {
        v203 = (unsigned __int16 *)v225;
        do
        {
          *v105++ = v202;
          v204 = *v203++;
          v202 = v204;
        }

        while (v204);
      }

      goto LABEL_153;
    }

    if ((((unsigned __int16)m_PinInfo | (BYTE2(m_PinInfo) << 16)) & 0x10000) == 0)
    {
      v220 = 0;
      v27 = m_iPinBlockCount;
LABEL_127:
      v79 = IsLap(v223, v5);
      if (!v79)
      {
        if (strlen(__s) == 1 && *__s == 64) {
          return;
        }
        if (*v8)
        {
          v89 = 0LL;
          v91 = v89;
        }

        else
        {
          v91 = 0;
        }

        v109 = v222;
        v110 = v91;
        if (v91 >= 1) {
          v91 = 1;
        }
        v111 = v91 - 1;
        while (v110 >= 2)
        {
          v112 = v110 - 1;
          v113 = *(unsigned __int16 *)(m_sPinKeyBuf + 2 * v7 - 2 + 2 * v110--);
          if (v223 != v113)
          {
            v111 = v112;
            break;
          }
        }

        m_iBeforeCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * (v111 + (int)v7));
        ++v222;
        m_iPinBlockCount = v109 + 1;
        goto LABEL_185;
      }

      m_iBeforeCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * (int)(v79 + v7 - 1));
      LODWORD(v80) = (unsigned __int16)*v8;
      if (*v8)
      {
        v80 = 0LL;
      }

      v82 = v5 + v5 * v27;
      *(_WORD *)(m_sPinKeyBuf + 2LL * v82) = 0;
      *(_WORD *)(v6 + 2LL * v82) = 0;
      v83 = v79;
      v84 = &v8[v79];
      v85 = *v84;
      if (*v84)
      {
        v86 = (unsigned __int16 *)(2 * v7 + 2LL * v79 + v6 + 2);
        v87 = &v224;
        do
        {
          *v87++ = v85;
          v88 = *v86++;
          v85 = v88;
        }

        while (v88);
      }

      else
      {
        v87 = &v224;
      }

      *v87 = 0;
      v92 = (int)(2 * (v80 - v79));
      bzero(v84, v92);
      v93 = m_iPinBlockCount;
      v94 = (_WORD *)(m_sPinStrBuf + 2LL * (v4 + v4 * m_iPinBlockCount) + 2LL * v220);
      v95 = v224;
      if (v224)
      {
        v96 = (unsigned __int16 *)v225;
        do
        {
          *v94++ = v95;
          v97 = *v96++;
          v95 = v97;
        }

        while (v97);
      }

      *v94 = 0;
      v98 = v93 * v5;
      v99 = (__int16 *)(m_sPinKeyBuf + 2LL * v98 + 2 * v83);
      v100 = *v99;
      if (*v99)
      {
        v101 = (unsigned __int16 *)(2LL * v98 + 2 * v83 + m_sPinKeyBuf + 2);
        v102 = &v224;
        do
        {
          *v102++ = v100;
          v103 = *v101++;
          v100 = v103;
        }

        while (v103);
      }

      else
      {
        v102 = &v224;
      }

      *v102 = 0;
      bzero(v99, v92);
      v104 = m_iPinBlockCount + 1;
      v105 = (_WORD *)(m_sPinKeyBuf + 2LL * (m_iPinBlockCount + 1) * (int)v5 + 2LL * v220);
      v106 = v224;
      if (v224)
      {
        v107 = (unsigned __int16 *)v225;
        do
        {
          *v105++ = v106;
          v108 = *v107++;
          v106 = v108;
        }

        while (v108);
      }

uint64_t ktoau::SelectList(uint64_t IsKei, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = IsKei;
  uint64_t v6 = *(void *)(IsKei + 8);
  *(void *)(IsKei + 8) = 0LL;
  *(void *)(IsKei + 16) = v6;
  uint64_t v7 = *(void *)(IsKei + 40);
  *(void *)(IsKei + 40) = 0LL;
  *(void *)(IsKei + 48) = v7;
  uint64_t v8 = (int *)(IsKei + 471064);
  if (*(int *)(IsKei + 471064) < 1)
  {
    int v11 = 0;
    goto LABEL_47;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  int v11 = 0;
  uint64_t v12 = IsKei + 460816;
  while (1)
  {
    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 38)
    {
      *(_WORD *)(v5 + 8) |= 2u;
      *(_BYTE *)(v5 + 32) = *(_BYTE *)(v5 + 32) & 0xC7 | (8 * (v10 & 7));
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 40)
    {
      *(_WORD *)(v5 + 8) |= 4u;
      *(_BYTE *)(v5 + 33) = *(_BYTE *)(v5 + 33) & 0xF8 | v10 & 7;
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 41)
    {
      *(_WORD *)(v5 + 8) |= 8u;
      *(_BYTE *)(v5 + 33) = *(_BYTE *)(v5 + 33) & 0xC7 | (8 * (v10 & 7));
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 42)
    {
      *(_WORD *)(v5 + 8) |= 0x10u;
      *(_BYTE *)(v5 + 34) = *(_BYTE *)(v5 + 34) & 0xF8 | v10 & 7;
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 43)
    {
      *(_WORD *)(v5 + 8) |= 0x20u;
      *(_BYTE *)(v5 + 34) = *(_BYTE *)(v5 + 34) & 0xC7 | (8 * (v10 & 7));
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 46)
    {
      *(_WORD *)(v5 + 8) |= 0x40u;
      *(_BYTE *)(v5 + 35) = *(_BYTE *)(v5 + 35) & 0xF8 | v10 & 7;
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 35)
    {
      *(_WORD *)(v5 + 8) |= 0x80u;
      *(_BYTE *)(v5 + 35) = *(_BYTE *)(v5 + 35) & 0xC7 | (8 * (v10 & 7));
    }

    if (*(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4) == 37)
    {
      *(_WORD *)(v5 + 8) |= 0x200u;
      IsKei = wcslen((const __int32 *)(v12 + v9 + 8));
      if (*(_DWORD *)(v12 + 4 * IsKei + v9) == 120 && (*(_WORD *)(v5 + 16) & 0x81) != 0) {
        break;
      }
    }

    IsKei = wcslen((const __int32 *)(v12 + v9 + 8));
    if (*(_DWORD *)(v12 + v9 + 4 * IsKei + 4) == 33)
    {
      *(_WORD *)(v5 + 8) |= 0x100u;
      if ((*(_WORD *)(v5 + 16) & 0x80) != 0
        || (*(_WORD *)(v5 + 48) & 0x80) != 0
        || (IsKei = ktoau::IsKei(IsKei, (const __int32 *)(a2 + 4LL * *(int *)(v12 + v9 + 8))), (_DWORD)IsKei))
      {
        IsKei = ktoau::IsKei(IsKei, (const __int32 *)(a2 + 4LL * *(int *)(v5 + v9 + 460824)));
        if ((_DWORD)IsKei) {
          *(void *)(v5 + 8) = 1024LL;
        }
        break;
      }
    }

    if (v9)
    {
      int v13 = *(_DWORD *)(v12 + v9 + 4 * wcslen((const __int32 *)(v12 + v9 + 8)) + 4);
      IsKei = wcslen((const __int32 *)(v12 + v9 - 1016));
      if (v13 > *(_DWORD *)(v12 + 4 * IsKei + v9 - 1020)) {
        int v11 = v10;
      }
    }

    ++v10;
    v9 += 1024LL;
    if (v10 >= *v8)
    {
      if (!v11) {
        goto LABEL_47;
      }
      goto LABEL_36;
    }
  }

  int v11 = v10;
  if (!(_DWORD)v10) {
    goto LABEL_47;
  }
LABEL_36:
  uint64_t v14 = v11;
  IsKei = wcslen((const __int32 *)(v5 + ((uint64_t)v11 << 10) + 460824));
  if (*(_DWORD *)(v5 + ((uint64_t)v11 << 10) + 460824 + 4 * IsKei - 8) == 120 && (*(_WORD *)(v5 + 16) & 0x81) == 0)
  {
    if (!--v11) {
      goto LABEL_47;
    }
    uint64_t v14 = v11;
  }

  int v15 = (const __int32 *)(v5 + (v14 << 10) + 460824);
  IsKei = wcslen(v15);
  if (v15[IsKei - 1] == 35)
  {
    IsKei = ktoau::IsKanjiNa(v5, (int *)(a2 + 4LL * *v15), 1);
    if (!(_DWORD)IsKei)
    {
      IsKei = ktoau::IsHiraNa(v5, (unsigned int *)(a2 + 4LL * *v15), 1);
      if (!(_DWORD)IsKei)
      {
        IsKei = ktoau::IsKataNa(v5, (int *)(a2 + 4LL * *v15), 1);
        if (!(_DWORD)IsKei)
        {
          IsKei = ktoau::IsSetubiNa(v5, (__int32 *)(a2 + 4LL * *v15), 0);
          if (!(_DWORD)IsKei)
          {
            IsKei = ktoau::IsKei(IsKei, (const __int32 *)(a2 + 4LL * *v15));
            if (!(_DWORD)IsKei)
            {
              *(_WORD *)(v5 + 8) &= ~0x80u;
              --v11;
            }
          }
        }
      }
    }
  }

LABEL_47:
  __int16 v16 = *(_WORD *)(v5 + 8);
  if ((v16 & 2) != 0)
  {
    if (*(_DWORD *)(a2 {
    if ((v16 & 4) == 0)
    }
    {
LABEL_49:
      if ((v16 & 8) == 0) {
        goto LABEL_50;
      }
      goto LABEL_61;
    }
  }

  else if ((v16 & 4) == 0)
  {
    goto LABEL_49;
  }

  if ((v16 & 8) == 0)
  {
LABEL_50:
    if ((v16 & 0x10) == 0) {
      goto LABEL_51;
    }
    goto LABEL_64;
  }

LABEL_61:
  if (*(_DWORD *)(a2 {
  if ((v16 & 0x10) == 0)
  }
  {
LABEL_51:
    if ((v16 & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_67;
  }

LABEL_64:
  if ((v16 & 0x20) == 0)
  {
LABEL_52:
    if ((v16 & 0x40) == 0) {
      goto LABEL_53;
    }
    goto LABEL_70;
  }

LABEL_67:
  if (*(_DWORD *)(a2 {
  if ((v16 & 0x40) == 0)
  }
  {
LABEL_53:
    if ((v16 & 0x80) == 0) {
      goto LABEL_81;
    }
    goto LABEL_73;
  }

LABEL_70:
  if ((v16 & 0x80) == 0) {
    goto LABEL_81;
  }
LABEL_73:
  __int32 v17 = (int *)(a2 + 4LL * *(int *)(v5 + ((((unint64_t)*(unsigned __int8 *)(v5 + 35) >> 3) & 7) << 10) + 460824));
  if (ktoau::IsKei(IsKei, v17))
  {
    uint64_t v18 = 1024LL;
  }

  else
  {
    if (!ktoau::IsKanjiNa(v5, v17, 1)
      && !ktoau::IsHiraNa(v5, (unsigned int *)v17, 1)
      && !ktoau::IsKataNa(v5, v17, 1)
      && !ktoau::IsSetubiNa(v5, v17, 0))
    {
      goto LABEL_81;
    }

    uint64_t v18 = 128LL;
  }

  int v11 = (*(unsigned __int8 *)(v5 + 35) >> 3) & 7;
  *(void *)(v5 + 8) = v18;
LABEL_81:
  uint64_t v19 = 0LL;
  do
    int v20 = *(_DWORD *)(v5 + ((uint64_t)v11 << 10) + 460828 + 4 * v19++);
  while (v20 != 32);
  uint64_t v21 = 0LL;
  LODWORD(v22) = v19;
LABEL_84:
  uint64_t v22 = (int)v22;
  while (1)
  {
    int v23 = *(_DWORD *)(v5 + ((uint64_t)v11 << 10) + 460828 + 4 * v22);
    if (!v23 || v23 == 44) {
      break;
    }
    ++v22;
    if ((v23 - 65382) < 0x3A || (v23 - 32) <= 0x5F)
    {
      *(_DWORD *)(a3 + 4 * v21++) = v23;
      goto LABEL_84;
    }
  }

  uint64_t result = (v19 - 1);
  *(_DWORD *)(a3 + 4LL * v21) = 0;
  return result;
}

uint64_t ktoau::IsKanjiNa(uint64_t a1, int *a2, int a3)
{
  while (1)
  {
    int v6 = *a2;
    if (*a2 != 12288 && v6 != 32) {
      break;
    }
    ++a2;
  }

  fseek(*(FILE **)(a1 + 64), *(void *)(a1 + 8LL * (unsigned __int16)(v6 - 19968) + 144), 0);
  do
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = &v14;
        bzero(&v14, 0x400uLL);
        do
          fread(v8, 2uLL, 1uLL, *(FILE **)(a1 + 64));
        while (*v8++);
        __int32 v10 = v14;
        if (!v14)
        {
          uint64_t result = 0LL;
          if (*a2) {
            return result;
          }
          goto LABEL_16;
        }

        int v11 = (int *)v15;
        do
        {
          *(v11 - 1) = (unsigned __int16)~(_WORD)v10;
          int v12 = *v11++;
          LOWORD(v10) = v12;
        }

        while (v12);
        __int32 v10 = v14;
        if (v14 != *a2) {
          return 0LL;
        }
        if (v14 == 32) {
          break;
        }
LABEL_16:
        uint64_t v13 = 0LL;
        while (v10 == a2[v13])
        {
          __int32 v10 = *(_DWORD *)&v15[v13 * 4];
          ++v13;
          if (v10 == 32) {
            goto LABEL_19;
          }
        }
      }

LABEL_19:
      if (a3 == 1) {
        break;
      }
      if (!a3) {
        return 1LL;
      }
    }
  }

  while (*(_DWORD *)&v15[4 * wcslen(&v14) - 8] != 33);
  return 1LL;
}

          uint64_t v13 = 0LL;
          while (v12 == a2[v13])
          {
            uint64_t result = v13 + 1;
            int v12 = v21[v13++];
            if (v12 == 32) {
              goto LABEL_22;
            }
          }
        }
      }

      else
      {
        int v12 = *a2;
        if (!*a2) {
          goto LABEL_19;
        }
      }

      bzero(&__ptr, 0x400uLL);
      uint64_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104));
      uint64_t v8 = 0LL;
    }

    while (result);
  }

  return result;
}

uint64_t ktoau::IsKei(uint64_t a1, const __int32 *a2)
{
  if (!dword_3B9DC) {
    return 0LL;
  }
  for (i = &dword_3B9DC; ; i += 10)
  {
    size_t v4 = wcslen(i);
    if (!wcsncmp(a2, i, v4)) {
      break;
    }
    if (!i[10]) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t ktoau::IsHiraNa(uint64_t a1, unsigned int *a2, int a3)
{
  while (1)
  {
    unsigned int v6 = *a2;
    if (*a2 != 12288 && v6 != 32) {
      break;
    }
    ++a2;
  }

  if (v6 - 12432 >= 0xFFFFFFB2)
  {
    int IsHiraIndex = ktoau::IsHiraIndex(a1, a2);
    if (IsHiraIndex != -1)
    {
      int v8 = IsHiraIndex;
      uint64_t v9 = *(void *)(a1 + 8LL * IsHiraIndex + 354448);
      if (v9)
      {
        fseek(*(FILE **)(a1 + 72), v9, 0);
        while (1)
        {
          __int32 v10 = &v19;
          bzero(&v19, 0x400uLL);
          do
            size_t v11 = fread(v10, 2uLL, 1uLL, *(FILE **)(a1 + 72));
          while (*v10++);
          __int16 v13 = v19;
          if (v19)
          {
            __int32 v14 = (int *)v20;
            do
            {
              *(v14 - 1) = (unsigned __int16)~v13;
              int v15 = *v14++;
              __int16 v13 = v15;
            }

            while (v15);
          }

          __int32 v16 = v19;
          if (v19 == 32)
          {
LABEL_18:
            if (a3 == 1)
            {
              if (*(_DWORD *)&v20[4 * wcslen(&v19) - 8] == 33) {
                return 1LL;
              }
            }

            else if (!a3)
            {
              return 1LL;
            }
          }

          else
          {
            uint64_t v17 = 0LL;
            while (v16 == a2[v17])
            {
              __int32 v16 = *(_DWORD *)&v20[v17 * 4];
              ++v17;
              if (v16 == 32) {
                goto LABEL_18;
              }
            }
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t ktoau::IsKataNa(uint64_t a1, int *a2, int a3)
{
  while (1)
  {
    int v6 = *a2;
    if (*a2 != 12288 && v6 != 32) {
      break;
    }
    ++a2;
  }

  if ((v6 - 12533) >= 0xFFFFFFAD)
  {
    int IsKataIndex = ktoau::IsKataIndex(a1, a2);
    if (IsKataIndex != -1)
    {
      int v8 = IsKataIndex;
      fseek(*(FILE **)(a1 + 80), *(void *)(a1 + 8LL * IsKataIndex + 404376), 0);
      while (1)
      {
        uint64_t v9 = &v18;
        bzero(&v18, 0x400uLL);
        do
          size_t v10 = fread(v9, 2uLL, 1uLL, *(FILE **)(a1 + 80));
        while (*v9++);
        __int16 v12 = v18;
        if (v18)
        {
          __int16 v13 = (int *)v19;
          do
          {
            *(v13 - 1) = (unsigned __int16)~v12;
            int v14 = *v13++;
            __int16 v12 = v14;
          }

          while (v14);
        }

        __int32 v15 = v18;
        if (v18 == 32)
        {
LABEL_17:
          if (a3 == 1)
          {
            if (*(_DWORD *)&v19[4 * wcslen(&v18) - 8] == 33) {
              return 1LL;
            }
          }

          else if (!a3)
          {
            return 1LL;
          }
        }

        else
        {
          uint64_t v16 = 0LL;
          while (v15 == a2[v16])
          {
            __int32 v15 = *(_DWORD *)&v19[v16 * 4];
            ++v16;
            if (v15 == 32) {
              goto LABEL_17;
            }
          }
        }
      }
    }
  }

  return 0LL;
}

size_t ktoau::IsSetubiNa(uint64_t a1, __int32 *a2, int a3)
{
  while (1)
  {
    __int32 v6 = *a2;
    if (*a2 != 12288 && v6 != 32) {
      break;
    }
    ++a2;
  }

  fseek(*(FILE **)(a1 + 88), 0LL, 0);
  bzero(&__ptr, 0x400uLL);
  size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 88));
  if (result)
  {
    uint64_t v8 = 0LL;
    do
    {
      while (*(_DWORD *)&v16[4 * v8 - 4])
      {
        ++v8;
        size_t result = fread(&v16[4 * v8 - 4], 2uLL, 1uLL, *(FILE **)(a1 + 88));
        if (!result) {
          return result;
        }
      }

      __int16 v9 = __ptr;
      if (__ptr)
      {
        size_t v10 = (int *)v16;
        do
        {
          *(v10 - 1) = (unsigned __int16)~v9;
          int v11 = *v10++;
          __int16 v9 = v11;
        }

        while (v11);
        __int32 v12 = __ptr;
        if (__ptr == *a2)
        {
          if (__ptr != 32) {
            goto LABEL_18;
          }
LABEL_21:
          int v14 = *(_DWORD *)&v16[4 * wcslen(&__ptr) - 8];
        }
      }

      else
      {
        __int32 v12 = *a2;
        if (!*a2)
        {
LABEL_18:
          uint64_t v13 = 0LL;
          while (v12 == a2[v13])
          {
            __int32 v12 = *(_DWORD *)&v16[v13 * 4];
            ++v13;
            if (v12 == 32) {
              goto LABEL_21;
            }
          }
        }
      }

      bzero(&__ptr, 0x400uLL);
      size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 88));
      uint64_t v8 = 0LL;
    }

    while (result);
  }

  return result;
}

size_t ktoau::IsHiraMatch(uint64_t a1, unsigned int *a2, __int32 *a3)
{
  if (*a2 - 12432 >= 0xFFFFFFB2)
  {
    size_t IsUserMatch = ktoau::IsUserMatch(a1, a2, a3);
    size_t v3 = IsUserMatch;
    if ((_DWORD)IsUserMatch) {
      return v3;
    }
    int IsHiraIndex = ktoau::IsHiraIndex(IsUserMatch, a2);
    if (IsHiraIndex != -1)
    {
      int v10 = IsHiraIndex;
      uint64_t v11 = *(void *)(a1 + 8LL * IsHiraIndex + 354448);
      if (v11)
      {
        fseek(*(FILE **)(a1 + 72), v11, 0);
        while (1)
        {
          __int32 v12 = &v36;
          bzero(&v36, 0x400uLL);
          do
            size_t v13 = fread(v12, 2uLL, 1uLL, *(FILE **)(a1 + 72));
          while (*v12++);
          __int16 v15 = v36;
          if (v36)
          {
            uint64_t v16 = v37;
            do
            {
              *(v16 - 1) = (unsigned __int16)~v15;
              int v17 = *v16++;
              __int16 v15 = v17;
            }

            while (v17);
          }

          __int32 v18 = v36;
          if (v36 == 32)
          {
            size_t v3 = 0LL;
            size_t v20 = 0LL;
LABEL_19:
            uint64_t IsKei = wcslen(&v36);
            switch(v37[IsKei - 2])
            {
              case '!':
                uint64_t v22 = (void *)(a1 + 8);
                if ((*(_WORD *)(a1 + 8) & 0x80) == 0 && (*(_WORD *)(a1 + 40) & 0x80) == 0)
                {
                  uint64_t v23 = IsKei;
                  uint64_t IsKei = ktoau::IsKei(IsKei, (const __int32 *)&a2[v20]);
                  if (!(_DWORD)IsKei && v37[v23 - 3] != 119) {
                    return 0LL;
                  }
                }

                int v24 = ktoau::IsKei(IsKei, (const __int32 *)&a2[v20]);
                void *v22 = 0LL;
                if (v24) {
                  goto LABEL_25;
                }
                __int16 v25 = 256;
                goto LABEL_51;
              case '#':
                v26 = (__int32 *)&a2[v20];
                if (!ktoau::IsKanjiNa(a1, v26, 1)
                  && !ktoau::IsHiraNa(a1, (unsigned int *)v26, 1)
                  && !ktoau::IsKataNa(a1, v26, 1))
                {
                  size_t IsSetubiNa = ktoau::IsSetubiNa(a1, v26, 0);
                }

                if (ktoau::IsKanjiNa(a1, v26, 1)
                  || ktoau::IsHiraNa(a1, (unsigned int *)v26, 1)
                  || ktoau::IsKataNa(a1, v26, 1)
                  || (size_t v28 = ktoau::IsSetubiNa(a1, v26, 0), (_DWORD)v28)
                  || !ktoau::IsKei(v28, v26))
                {
                  *(void *)(a1 + 8) = 128LL;
                }

                else
                {
                  *(void *)(a1 + 8) = 0LL;
                  uint64_t v22 = (void *)(a1 + 8);
LABEL_25:
                  __int16 v25 = 1024;
LABEL_51:
                  *(_WORD *)uint64_t v22 = v25;
                }

                goto LABEL_52;
              case '&':
                if (a2[v20] != 24066) {
                  goto LABEL_52;
                }
                __int16 v29 = *(_WORD *)(a1 + 8) | 2;
                break;
              case '(':
                if (a2[v20] != 21306) {
                  goto LABEL_52;
                }
                __int16 v29 = *(_WORD *)(a1 + 8) | 4;
                break;
              case ')':
                if (a2[v20] != 30010) {
                  goto LABEL_52;
                }
                __int16 v29 = *(_WORD *)(a1 + 8) | 8;
                break;
              case '*':
                if (a2[v20] != 30010) {
                  goto LABEL_52;
                }
                __int16 v29 = *(_WORD *)(a1 + 8) | 0x10;
                break;
              case '+':
                if (a2[v20] != 26449) {
                  goto LABEL_52;
                }
                __int16 v29 = *(_WORD *)(a1 + 8) | 0x20;
                break;
              case '.':
                if (a2[v20] != 26449) {
                  goto LABEL_52;
                }
                __int16 v29 = *(_WORD *)(a1 + 8) | 0x40;
                break;
              default:
                goto LABEL_52;
            }

            *(_WORD *)(a1 + 8) = v29;
LABEL_52:
            uint64_t v30 = 0LL;
            *(void *)(a1 + 40) = 0LL;
            int v31 = v3;
LABEL_53:
            int v32 = v31 + 1;
            v33 = &v37[v31];
            while (1)
            {
              __int32 v35 = *v33++;
              __int32 v34 = v35;
              if (!v35 || v34 == 44) {
                break;
              }
              int v31 = v32;
              if ((v34 - 65382) >= 0x3A && (v34 - 33) > 0x5E)
              {
                ++v32;
                if (v34 != 32) {
                  continue;
                }
              }

              a3[v30++] = v34;
              goto LABEL_53;
            }

            a3[v30] = 0;
            return v3;
          }

          uint64_t v19 = 0LL;
          while (v18 == a2[v19])
          {
            size_t v20 = v19 + 1;
            __int32 v18 = v37[v19++];
            if (v18 == 32)
            {
              size_t v3 = v20;
              goto LABEL_19;
            }
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t ktoau::IsHiraIndex(uint64_t a1, unsigned int *a2)
{
  unsigned int v2 = *a2;
  if (*a2 - 12432 < 0xFFFFFFB2) {
    return 0xFFFFFFFFLL;
  }
  int v3 = a2[1];
  if ((v2 & 1) != 0 || v2 - 12364 >= 0x17) {
    int v5 = -12354;
  }
  else {
    int v5 = -12355;
  }
  int v6 = v5 + v2 - (v2 & 1 & (v2 - 12394 > 0xFFFFFFFA));
  BOOL v11 = v2 == 12400 || v2 == 12403 || v2 == 12406 || v2 == 12409 || v2 == 12412;
  int v12 = v6 - v11;
  if (v2 == 12407 || v2 == 12401 || v2 == 12413 || v2 == 12404 || v2 == 12410) {
    v12 -= 2;
  }
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  if (v3 <= 12353) {
    return (79 * v12);
  }
  if (v3 == 12446) {
    unsigned int v18 = *a2;
  }
  else {
    unsigned int v18 = a2[1];
  }
  if (v18 >> 4 >= 0x309 && v18 != 12540) {
    return (79 * v12 + 79);
  }
  if (v3 == 12540)
  {
    if (v2 - 12354 > 0x3C || ((1LL << (v2 - 66)) & 0x1000E10060180601LL) == 0)
    {
      if (v2 - 12420 > 0xB)
      {
        int v19 = v18;
        goto LABEL_51;
      }

      int v19 = v18;
      if (((1 << (v2 + 124)) & 0x821) == 0) {
        goto LABEL_51;
      }
    }

    int v19 = 12354;
LABEL_51:
    goto LABEL_64;
  }

  int v19 = v18;
LABEL_64:
  BOOL v20 = v18 - 12394 < 0xFFFFFFFB;
  if ((v18 & 1) == 0) {
    BOOL v20 = 1;
  }
  if (v18 - 12364 < 0x17 && (v18 & 1) == 0) {
    int v21 = v18 - 1;
  }
  else {
    int v21 = v19;
  }
  int32x4_t v22 = vdupq_n_s32(v18);
  if (!v20) {
    int v21 = v18 - 1;
  }
  else {
    unsigned int v23 = v21;
  }
  return v23 + 79 * v12 - 12353;
}

size_t ktoau::IsKataMatch(uint64_t a1, int *a2, __int32 *a3)
{
  if (*a2 == 65288 || (*a2 - 12533) >= 0xFFFFFFAD)
  {
    size_t IsUserMatch = ktoau::IsUserMatch(a1, a2, a3);
    size_t v6 = IsUserMatch;
    if ((_DWORD)IsUserMatch) {
      return v6;
    }
    int IsKataIndex = ktoau::IsKataIndex(IsUserMatch, a2);
    if (IsKataIndex != -1)
    {
      int v9 = IsKataIndex;
      fseek(*(FILE **)(a1 + 80), *(void *)(a1 + 8LL * IsKataIndex + 404376), 0);
      while (1)
      {
        int v10 = &v35;
        bzero(&v35, 0x400uLL);
        do
          size_t v11 = fread(v10, 2uLL, 1uLL, *(FILE **)(a1 + 80));
        while (*v10++);
        __int16 v13 = v35;
        if (v35)
        {
          int v14 = v36;
          do
          {
            *(v14 - 1) = (unsigned __int16)~v13;
            int v15 = *v14++;
            __int16 v13 = v15;
          }

          while (v15);
        }

        __int32 v16 = v35;
        if (v35 == 32)
        {
          size_t v6 = 0LL;
          size_t v18 = 0LL;
LABEL_18:
          uint64_t IsKei = wcslen(&v35);
          switch(v36[IsKei - 2])
          {
            case '!':
              BOOL v20 = (void *)(a1 + 8);
              if ((*(_WORD *)(a1 + 8) & 0x80) == 0 && (*(_WORD *)(a1 + 40) & 0x80) == 0)
              {
                uint64_t v21 = IsKei;
                uint64_t IsKei = ktoau::IsKei(IsKei, &a2[v18]);
                if (!(_DWORD)IsKei && v36[v21 - 3] != 119) {
                  return 0LL;
                }
              }

              int v22 = ktoau::IsKei(IsKei, &a2[v18]);
              void *v20 = 0LL;
              if (v22) {
                goto LABEL_24;
              }
              __int16 v23 = 256;
              goto LABEL_50;
            case '#':
              int v24 = &a2[v18];
              if (!ktoau::IsKanjiNa(a1, v24, 1)
                && !ktoau::IsHiraNa(a1, (unsigned int *)v24, 1)
                && !ktoau::IsKataNa(a1, v24, 1))
              {
                size_t IsSetubiNa = ktoau::IsSetubiNa(a1, v24, 0);
              }

              if (ktoau::IsKanjiNa(a1, v24, 1)
                || ktoau::IsHiraNa(a1, (unsigned int *)v24, 1)
                || ktoau::IsKataNa(a1, v24, 1)
                || (size_t v26 = ktoau::IsSetubiNa(a1, v24, 0), (_DWORD)v26)
                || !ktoau::IsKei(v26, v24))
              {
                *(void *)(a1 + 8) = 128LL;
              }

              else
              {
                *(void *)(a1 + 8) = 0LL;
                BOOL v20 = (void *)(a1 + 8);
LABEL_24:
                __int16 v23 = 1024;
LABEL_50:
                *(_WORD *)BOOL v20 = v23;
              }

              goto LABEL_51;
            case '&':
              if (a2[v18] != 24066) {
                goto LABEL_51;
              }
              __int16 v27 = *(_WORD *)(a1 + 8) | 2;
              break;
            case '(':
              if (a2[v18] != 21306) {
                goto LABEL_51;
              }
              __int16 v27 = *(_WORD *)(a1 + 8) | 4;
              break;
            case ')':
              if (a2[v18] != 30010) {
                goto LABEL_51;
              }
              __int16 v27 = *(_WORD *)(a1 + 8) | 8;
              break;
            case '*':
              if (a2[v18] != 30010) {
                goto LABEL_51;
              }
              __int16 v27 = *(_WORD *)(a1 + 8) | 0x10;
              break;
            case '+':
              if (a2[v18] != 26449) {
                goto LABEL_51;
              }
              __int16 v27 = *(_WORD *)(a1 + 8) | 0x20;
              break;
            case '.':
              if (a2[v18] != 26449) {
                goto LABEL_51;
              }
              __int16 v27 = *(_WORD *)(a1 + 8) | 0x40;
              break;
            default:
              goto LABEL_51;
          }

          *(_WORD *)(a1 + 8) = v27;
LABEL_51:
          uint64_t v28 = 0LL;
          *(void *)(a1 + 40) = 0LL;
          int v29 = v6;
LABEL_52:
          int v30 = v29 + 1;
          int v31 = &v36[v29];
          while (1)
          {
            __int32 v33 = *v31++;
            __int32 v32 = v33;
            if (!v33 || v32 == 44) {
              break;
            }
            int v29 = v30;
            if ((v32 - 65382) >= 0x3A && (v32 - 33) > 0x5E)
            {
              ++v30;
              if (v32 != 32) {
                continue;
              }
            }

            a3[v28++] = v32;
            goto LABEL_52;
          }

          a3[v28] = 0;
          return v6;
        }

        uint64_t v17 = 0LL;
        while (v16 == a2[v17])
        {
          size_t v18 = v17 + 1;
          __int32 v16 = v36[v17++];
          if (v16 == 32)
          {
            size_t v6 = v18;
            goto LABEL_18;
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t ktoau::IsKataIndex(uint64_t a1, int *a2)
{
  int v2 = *a2;
  if (*a2 == 65288) {
    return 0LL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if ((v2 - 12535) >= 0xFFFFFFAB)
  {
    BOOL v4 = (v2 - 12515) > 0x13 || ((1 << (v2 + 29)) & 0x98015) == 0;
    if (v4 && ((v2 - 12451) > 0x20 || ((1LL << (v2 + 93)) & 0x100000055LL) == 0))
    {
      if (v2 == 12532) {
        int v5 = 12454;
      }
      else {
        int v5 = *a2;
      }
      BOOL v6 = (v2 - 12490) < 0xFFFFFFFB;
      if ((v2 & 1) == 0) {
        BOOL v6 = 1;
      }
      if (!v6) {
        int v5 = v2 - 1;
      }
      int v7 = a2[1];
      if (v7)
      {
        int v8 = v5 - 12450;
        if (v7 > 12448)
        {
          if (v7 < 0x30F5 || v7 == 12540)
          {
            if (v7 == 12540)
            {
              if ((v2 - 12450) <= 0x3C
                && ((1LL << (v2 + 94)) & 0x1000E10060180601LL) != 0
                || (int v9 = 12540, (v2 - 12516) <= 0xB) && ((1 << (v2 + 28)) & 0x821) != 0)
              {
                int v9 = 12450;
              }

              if ((v2 - 12461) <= 0x3D
                && ((1LL << (v2 + 83)) & 0x200400E040300C03LL) != 0
                || v2 == 12452)
              {
                int v9 = 12452;
              }

              if ((v2 - 12463) <= 0x3C
                && ((1LL << (v2 + 81)) & 0x108201C020600C03LL) != 0
                || v2 == 12454)
              {
                int v9 = 12454;
              }

              if ((v2 - 12465) <= 0x3B
                && ((1LL << (v2 + 79)) & 0x801038010600C03LL) != 0
                || v2 == 12456)
              {
                int v9 = 12456;
              }

              if ((v2 - 12467) <= 0x3A
                && ((1LL << (v2 + 77)) & 0x420870008600C03LL) != 0
                || v2 == 12458)
              {
                int v9 = 12458;
              }
            }

            else
            {
              int v9 = a2[1];
              if ((v7 - 12449) <= 0x22 && ((1LL << (v7 + 95)) & 0x400000155LL) != 0
                || (v7 - 12515) <= 4 && ((1 << (v7 + 29)) & 0x15) != 0)
              {
                int v9 = v7 + 1;
              }
            }

            if (v7 == 12532) {
              int v10 = 12454;
            }
            else {
              int v10 = v9;
            }
            BOOL v11 = (v7 - 12490) < 0xFFFFFFFB;
            if ((v7 & 1) == 0) {
              BOOL v11 = 1;
            }
            if (!v11) {
              int v10 = v7 - 1;
            }
            return (v10 + 87 * v8 - 12449);
          }

          else
          {
            return (87 * v8 + 87);
          }
        }

        else
        {
          return (87 * v8);
        }
      }
    }
  }

  return result;
}

uint64_t ktoau::IsSettouu(uint64_t a1, __int32 *a2, uint64_t a3)
{
  if (!fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 96))) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  int v24 = a2 + 1;
  while (1)
  {
    while (v26[v6 - 1])
    {
      if (!fread(&v26[v6++], 2uLL, 1uLL, *(FILE **)(a1 + 96))) {
        return 0LL;
      }
    }

    __int16 v7 = __ptr;
    if (__ptr) {
      break;
    }
    __int32 v10 = *a2;
    if (!*a2)
    {
LABEL_13:
      uint64_t v12 = 0LL;
      while (v10 == a2[v12])
      {
        uint64_t v11 = v12 + 1;
        __int32 v10 = v26[v12++];
        if (v10 == 32) {
          goto LABEL_16;
        }
      }
    }

LABEL_30:
    bzero(&__ptr, 0x400uLL);
    uint64_t v6 = 0LL;
    if (!fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 96))) {
      return 0LL;
    }
  }

  int v8 = v26;
  do
  {
    *(v8 - 1) = (unsigned __int16)~v7;
    int v9 = *v8++;
    __int16 v7 = v9;
  }

  while (v9);
  __int32 v10 = __ptr;
  if (__ptr != *a2) {
    goto LABEL_30;
  }
  if (__ptr != 32) {
    goto LABEL_13;
  }
  uint64_t v11 = 0LL;
LABEL_16:
  uint64_t v13 = 0LL;
  int v14 = v11;
LABEL_17:
  int v15 = v14 + 1;
  uint64_t v16 = 4LL * v14 + 4;
  while (1)
  {
    int v17 = *(_DWORD *)((char *)&v26[-1] + v16);
    if (!v17 || v17 == 44) {
      break;
    }
    int v14 = v15;
    if ((v17 - 65382) >= 0x3A && (v17 - 33) > 0x5E)
    {
      ++v15;
      v16 += 4LL;
      if (v17 != 32) {
        continue;
      }
    }

    *(_DWORD *)(a3 + 4 * v13++) = v17;
    goto LABEL_17;
  }

  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  size_t v18 = wcslen(&__ptr);
  int v19 = v26[v18 - 2];
  if (v19 == 35)
  {
    BOOL v20 = v24;
    if (ktoau::IsSetubiNa(a1, v24, 0)
      || ktoau::IsKanjiNa(a1, v20, 1)
      || ktoau::IsHiraNa(a1, (unsigned int *)v20, 1)
      || (uint64_t IsKataNa = ktoau::IsKataNa(a1, v20, 1), (_DWORD)IsKataNa))
    {
      *(void *)(a1 + 40) = 128LL;
      goto LABEL_51;
    }

    if (ktoau::IsKei(IsKataNa, v20))
    {
      __int16 v22 = *(_WORD *)(a1 + 8) | 0x400;
LABEL_50:
      *(_WORD *)(a1 + 8) = v22;
      goto LABEL_51;
    }

    goto LABEL_30;
  }

  switch(v19)
  {
    case '&':
      if (*v24 != 24066) {
        return 0LL;
      }
      __int16 v22 = 2;
      goto LABEL_50;
    case '(':
      if (*v24 != 21306) {
        return 0LL;
      }
      __int16 v22 = 4;
      goto LABEL_50;
    case ')':
      if (*v24 != 30010) {
        return 0LL;
      }
      __int16 v22 = 8;
      goto LABEL_50;
    case '*':
      if (*v24 != 30010) {
        return 0LL;
      }
      __int16 v22 = 16;
      goto LABEL_50;
    case '+':
      if (*v24 != 26449) {
        return 0LL;
      }
      __int16 v22 = 32;
      goto LABEL_50;
    case '.':
      if (*v24 != 26449) {
        return 0LL;
      }
      __int16 v22 = 64;
      goto LABEL_50;
    default:
      if (v19 == 80) {
        *(_WORD *)(a1 + 40) = 1024;
      }
      break;
  }

      bzero(&v19, 0x400uLL);
      __int16 v7 = 0LL;
    }

    while (fread(&v19, 2uLL, 1uLL, *(FILE **)(a1 + 88)));
  }

LABEL_51:
  *(_DWORD *)(a3 + 4LL * v13) = 0;
  return v11;
}

uint64_t ktoau::IsMojiMode(uint64_t a1, int *a2)
{
  int v2 = *a2;
  int v3 = 65281;
  BOOL v4 = &dword_26500;
  do
  {
    if (v2 == v3) {
      return 9LL;
    }
    int v5 = *v4++;
    int v3 = v5;
  }

  while (v5);
  int v6 = 19968;
  __int16 v7 = &dword_26554;
  do
  {
    if (v2 == v6) {
      return 14LL;
    }
    int v8 = *v7++;
    int v6 = v8;
  }

  while (v8);
  if ((v2 - 19968) >> 8 < 0xAD)
  {
    if (v2 != 20189) {
      return 12LL;
    }
LABEL_9:
    else {
      return 7LL;
    }
  }

  uint64_t result = 12LL;
  if (v2 != 19132 && v2 != 19410)
  {
    uint64_t result = 9LL;
    if ((v2 - 65345) >= 0x1A && (v2 - 65313) >= 0x1A)
    {
      if (v2 == 12540) {
        return 13LL;
      }
      if (v2 < 32) {
        return 1LL;
      }
      if (v2 == 32) {
        return 2LL;
      }
      goto LABEL_9;
    }
  }

  return result;
}

uint64_t ktoau::IsSetubiu(uint64_t a1, __int32 *a2, uint64_t a3)
{
  int v6 = (_DWORD *)(a1 + 465944);
  bzero((void *)(a1 + 460824), 0x1400uLL);
  v6[1281] = 0;
  fseek(*(FILE **)(a1 + 88), 0LL, 0);
  bzero(&v19, 0x400uLL);
  if (fread(&v19, 2uLL, 1uLL, *(FILE **)(a1 + 88)))
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a1 + 465944;
    do
    {
      while (v20[v7 - 1])
      {
        if (!fread(&v20[v7++], 2uLL, 1uLL, *(FILE **)(a1 + 88))) {
          goto LABEL_31;
        }
      }

      __int16 v9 = v19;
      if (v19)
      {
        __int32 v10 = v20;
        do
        {
          *(v10 - 1) = (unsigned __int16)~v9;
          int v11 = *v10++;
          __int16 v9 = v11;
        }

        while (v11);
        __int32 v12 = v19;
        if (v19 != *a2) {
          goto LABEL_30;
        }
        if (v19 != 32) {
          goto LABEL_14;
        }
        int v13 = 0;
LABEL_17:
        int v15 = v20[wcslen(&v19) - 2];
        if (v15 == 34)
        {
          if ((*(_WORD *)(a1 + 8) & 0x80) == 0 && (*(_WORD *)(a1 + 40) & 0x280) == 0) {
            goto LABEL_30;
          }
        }

        else if (v15 == 33 && (*(_WORD *)(a1 + 8) & 0x80) == 0 && (*(_WORD *)(a1 + 40) & 0x80) == 0)
        {
          goto LABEL_30;
        }

        uint64_t v16 = (int)v6[1281];
        if ((_DWORD)v16)
        {
          wcscpy((__int32 *)(v8 + (v16 << 10) + 4), &v19);
          uint64_t v17 = (int)v6[1281];
          *(_DWORD *)(v8 + (v17 << 10)) = v13;
        }

        else
        {
          wcscpy((__int32 *)(a1 + 465948), &v19);
          *int v6 = v13;
          LODWORD(v17) = v6[1281];
        }

        v6[1281] = v17 + 1;
      }

      else
      {
        __int32 v12 = *a2;
        if (!*a2)
        {
LABEL_14:
          uint64_t v14 = 0LL;
          while (v12 == a2[v14])
          {
            int v13 = v14 + 1;
            __int32 v12 = v20[v14++];
            if (v12 == 32) {
              goto LABEL_17;
            }
          }
        }
      }

LABEL_31:
  if (v6[1281]) {
    return ktoau::SelectSetubiList(a1, (uint64_t)a2, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t ktoau::SelectSetubiList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = (int *)(a1 + 471068);
  if (*(int *)(a1 + 471068) < 1)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = a1 + 465940;
    while (1)
    {
      uint64_t v11 = v9;
      if (*(_DWORD *)(v10 + 4 * wcslen((const __int32 *)(v10 + 4))) == 33
        && (*(_WORD *)(a1 + 48) & 0x200) == 0
        && (!ktoau::IsSetubiNa(a1, (__int32 *)(a2 + 4), 1)
         || ktoau::IsKanjiNa(a1, (int *)(a2 + 4), 0)))
      {
        break;
      }

      if (*(_DWORD *)(v10 + 4 * wcslen((const __int32 *)(v10 + 4))) == 34
        && ((*(_WORD *)(a1 + 48) & 0x200) != 0 || ktoau::IsSetubiNa(a1, (__int32 *)(a2 + 4), 1)))
      {
        __int16 v12 = 512;
        goto LABEL_15;
      }

      uint64_t v9 = v11 + 1;
      v10 += 1024LL;
      if (v11 + 1 >= *v8) {
        goto LABEL_16;
      }
    }

    __int16 v12 = 256;
LABEL_15:
    *(_WORD *)(a1 + 40) |= v12;
  }

uint64_t ktoau::IsNaSetubiu(uint64_t a1, __int32 *a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 471068) = 0;
  fseek(*(FILE **)(a1 + 88), 0LL, 0);
  bzero(&__ptr, 0x400uLL);
  if (!fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 88))) {
    return 0LL;
  }
  for (uint64_t i = 0LL; ; uint64_t i = 0LL)
  {
    while (v23[i - 1])
    {
      if (!fread(&v23[i++], 2uLL, 1uLL, *(FILE **)(a1 + 88))) {
        return 0LL;
      }
    }

    __int16 v7 = __ptr;
    if (__ptr) {
      break;
    }
    __int32 v10 = *a2;
    if (!*a2)
    {
LABEL_14:
      uint64_t v13 = 0LL;
      while (v10 == a2[v13])
      {
        uint64_t v12 = v13 + 1;
        __int32 v10 = v23[v13++];
        if (v10 == 32)
        {
          uint64_t v11 = v12;
          goto LABEL_18;
        }
      }
    }

LABEL_20:
    bzero(&__ptr, 0x400uLL);
    if (!fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 88))) {
      return 0LL;
    }
  }

  uint64_t v8 = v23;
  do
  {
    *(v8 - 1) = (unsigned __int16)~v7;
    int v9 = *v8++;
    __int16 v7 = v9;
  }

  while (v9);
  __int32 v10 = __ptr;
  if (__ptr != *a2) {
    goto LABEL_20;
  }
  if (__ptr != 32) {
    goto LABEL_14;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
LABEL_18:
  size_t v14 = wcslen(&__ptr);
  uint64_t v16 = 0LL;
  *(void *)(a1 + 8) = 1024LL;
  *(void *)(a1 + 40) = 0LL;
  int v17 = v11;
LABEL_24:
  int v18 = v17 + 1;
  unint64_t v19 = &v23[v17];
  while (1)
  {
    int v21 = *v19++;
    int v20 = v21;
    if (v21 == 44) {
      break;
    }
    int v17 = v18;
    if ((v20 - 65382) >= 0x3A && (v20 - 33) > 0x5E)
    {
      ++v18;
      if (v20 != 32) {
        continue;
      }
    }

    *(_DWORD *)(a3 + 4 * v16++) = v20;
    goto LABEL_24;
  }

  *(_DWORD *)(a3 + 4LL * v16) = 0;
  return v11;
}

size_t ktoau::IsSuushiu(uint64_t a1, int *a2, uint64_t a3)
{
  int v6 = *a2;
  if ((*a2 - 12450) >= 0x55
    && (v6 - 19968) >> 8 >= 0xAD
    && (v6 - 12354) > 0x4D)
  {
    return 0LL;
  }

  fseek(*(FILE **)(a1 + 104), 0LL, 0);
  bzero(&__ptr, 0x400uLL);
  size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 104));
  if (result)
  {
    uint64_t v8 = 0LL;
    do
    {
      while (v21[v8 - 1])
      {
        size_t result = fread(&v21[v8++], 2uLL, 1uLL, *(FILE **)(a1 + 104));
        if (!result) {
          return result;
        }
      }

      __int16 v9 = __ptr;
      if (__ptr)
      {
        __int32 v10 = v21;
        do
        {
          *(v10 - 1) = (unsigned __int16)~v9;
          int v11 = *v10++;
          __int16 v9 = v11;
        }

        while (v11);
        int v12 = __ptr;
        if (__ptr == *a2)
        {
          if (__ptr == 32)
          {
            size_t result = 0LL;
LABEL_22:
            uint64_t v14 = 0LL;
            int v15 = result;
LABEL_23:
            int v16 = v15 + 1;
            int v17 = &v21[v15];
            while (1)
            {
              int v19 = *v17++;
              int v18 = v19;
              if (!v19) {
                break;
              }
              int v15 = v16;
              if ((v18 - 65382) >= 0x3A && (v18 - 33) > 0x5E)
              {
                ++v16;
                if (v18 != 32) {
                  continue;
                }
              }

              *(_DWORD *)(a3 + 4 * v14++) = v18;
              goto LABEL_23;
            }

            *(_DWORD *)(a3 + 4LL * v14) = 0;
            return result;
          }

size_t ktoau::IsTan1u(uint64_t a1, int *a2, uint64_t a3)
{
  size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 112));
  if (result)
  {
    uint64_t v7 = 0LL;
    do
    {
      while (v20[v7 - 1])
      {
        size_t result = fread(&v20[v7++], 2uLL, 1uLL, *(FILE **)(a1 + 112));
        if (!result) {
          return result;
        }
      }

      __int16 v8 = __ptr;
      if (__ptr)
      {
        __int16 v9 = v20;
        do
        {
          *(v9 - 1) = (unsigned __int16)~v8;
          int v10 = *v9++;
          __int16 v8 = v10;
        }

        while (v10);
        int v11 = __ptr;
        if (__ptr == *a2)
        {
          if (__ptr == 32)
          {
            size_t result = 0LL;
LABEL_20:
            uint64_t v13 = 0LL;
            int v14 = result;
LABEL_21:
            int v15 = v14 + 1;
            int v16 = &v20[v14];
            while (1)
            {
              int v18 = *v16++;
              int v17 = v18;
              if (!v18) {
                break;
              }
              int v14 = v15;
              if ((v17 - 65382) >= 0x3A && (v17 - 33) > 0x5E)
              {
                ++v15;
                if (v17 != 32) {
                  continue;
                }
              }

              *(_DWORD *)(a3 + 4 * v13++) = v17;
              goto LABEL_21;
            }

            *(_DWORD *)(a3 + 4LL * v13) = 0;
            return result;
          }

LABEL_17:
          uint64_t v12 = 0LL;
          while (v11 == a2[v12])
          {
            size_t result = v12 + 1;
            int v11 = v20[v12++];
            if (v11 == 32) {
              goto LABEL_20;
            }
          }
        }
      }

      else
      {
        int v11 = *a2;
        if (!*a2) {
          goto LABEL_17;
        }
      }

      bzero(&__ptr, 0x400uLL);
      size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 112));
      uint64_t v7 = 0LL;
    }

    while (result);
  }

  return result;
}

size_t ktoau::TanKanji2Set(uint64_t a1, int *a2, __int32 *a3)
{
  int v3 = *a2;
  int v9 = a2[1];
  int v10 = *(a2 - 1);
  fseek(*(FILE **)(a1 + 120), 0LL, 0);
  bzero(&v22, 0x400uLL);
  size_t result = fread(&v22, 2uLL, 1uLL, *(FILE **)(a1 + 120));
  if (result)
  {
    uint64_t v11 = 0LL;
    do
    {
      while (v23[v11 - 1])
      {
        size_t result = fread(&v23[v11++], 2uLL, 1uLL, *(FILE **)(a1 + 120));
        if (!result) {
          return result;
        }
      }

      __int16 v12 = v22;
      if (v22)
      {
        uint64_t v13 = v23;
        do
        {
          *(v13 - 1) = (unsigned __int16)~v12;
          int v14 = *v13++;
          __int16 v12 = v14;
        }

        while (v14);
        int v15 = v22;
        if (v22 == *a2)
        {
          if (v22 == 32)
          {
            int v21 = 0;
LABEL_27:
            uint64_t v17 = 0LL;
LABEL_28:
            uint64_t v18 = v21 + 1LL;
            while (1)
            {
              __int32 v19 = v23[v18 - 1];
              if (!v19) {
                break;
              }
              int v21 = v18;
              if ((v19 - 65382) >= 0x3A && (v19 - 33) > 0x5E)
              {
                ++v18;
                if (v19 != 32) {
                  continue;
                }
              }

              a3[v17++] = v19;
              goto LABEL_28;
            }

            a3[v17] = 0;
            LODWORD(result) = ktoau::TanKanji2SetSub(result, a3, v3, v9, v10, (uint64_t)a2);
            else {
              return result;
            }
          }

          goto LABEL_24;
        }
      }

      else if (!*a2)
      {
        int v15 = 0;
LABEL_24:
        uint64_t v16 = 0LL;
        while (v15 == a2[v16])
        {
          int v21 = v16 + 1;
          int v15 = v23[v16++];
          if (v15 == 32) {
            goto LABEL_27;
          }
        }
      }

      bzero(&v22, 0x400uLL);
      size_t result = fread(&v22, 2uLL, 1uLL, *(FILE **)(a1 + 120));
      uint64_t v11 = 0LL;
    }

    while (result);
  }

  return result;
}

uint64_t ktoau::TanKanji2SetSub(int a1, __int32 *a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t result = 0LL;
  if (a3 > 27441)
  {
    if (a3 <= 33617)
    {
      if (a3 <= 30096)
      {
        if (a3 <= 28416)
        {
          if (a3 <= 27926)
          {
            if (a3 <= 27713)
            {
              if (a3 <= 27530)
              {
                if (a3 <= 27490)
                {
                  if (a3 != 27442)
                  {
                    if (a3 == 27468)
                    {
LABEL_970:
                      uint64_t v16 = (const __int32 *)&unk_28DDC;
                      goto LABEL_3770;
                    }

                    if (a3 != 27490) {
                      return result;
                    }
                    if (a5 != 21462 && a5 != 12426 && a4 != 12435 && (a4 - 12415) > 1)
                    {
                      if (a4 != 12417 && a4 != 12414) {
                        return 0LL;
                      }
                      if (a5 == 14690 || a5 == 12860)
                      {
                        uint64_t v11 = (const __int32 *)&unk_2975C;
                        goto LABEL_3850;
                      }

                      goto LABEL_2842;
                    }

LABEL_1242:
                    uint64_t v11 = (const __int32 *)&unk_29414;
                    goto LABEL_3850;
                  }

                  if (a4 == 12377) {
                    goto LABEL_2300;
                  }
                  if (a4 != 12375) {
                    return 0LL;
                  }
                  int v70 = *(_DWORD *)(a6 + 8);
                  if (v70 != 12356 && (((v70 - 12363) < 9) & v70) == 0)
                  {
LABEL_2300:
                    uint64_t v11 = (const __int32 *)&unk_2A434;
                    goto LABEL_3850;
                  }

LABEL_725:
                  uint64_t v11 = (const __int32 *)&unk_28B30;
                  goto LABEL_3850;
                }

                if (a3 != 27491)
                {
                  if (a3 == 27497)
                  {
                    if ((a4 - 12363) > 8)
                    {
                      if ((a4 - 12414) <= 0x15 && ((1 << (a4 - 126)) & 0x20001F) != 0)
                      {
                        uint64_t v11 = (const __int32 *)&unk_2A228;
                        goto LABEL_3850;
                      }

                      if (a4 != 12356) {
                        return 0LL;
                      }
                    }

                    else if ((a4 & 1) == 0)
                    {
                      return 0LL;
                    }

                    uint64_t v11 = (const __int32 *)&unk_2A21C;
                    goto LABEL_3850;
                  }

                  if (a3 != 27515) {
                    return result;
                  }
                  goto LABEL_946;
                }

                goto LABEL_1702;
              }

              if (a3 <= 27596)
              {
                if (a3 != 27531)
                {
                  if (a3 == 27572)
                  {
                    uint64_t v11 = (const __int32 *)&unk_28D5C;
                    goto LABEL_3850;
                  }

                  if (a3 == 27578)
                  {
                    uint64_t result = 0LL;
                    if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                    {
                      uint64_t v11 = (const __int32 *)&unk_296B8;
                      goto LABEL_3850;
                    }
                  }

                  return result;
                }

                goto LABEL_1692;
              }

              switch(a3)
              {
                case 27597:
                  if (a5 == 12362)
                  {
                    uint64_t v11 = (const __int32 *)&unk_2A240;
                    goto LABEL_3850;
                  }

                  break;
                case 27604:
                  if (a4 == 12409)
                  {
                    uint64_t v11 = (const __int32 *)&unk_2A0BC;
                    goto LABEL_3850;
                  }

                  break;
                case 27704:
                  if ((a4 - 12363) > 8)
                  {
                    if (a4 != 12356) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) == 0)
                  {
                    return 0LL;
                  }

                  uint64_t v11 = (const __int32 *)&unk_28CD8;
                  goto LABEL_3850;
                default:
                  return result;
              }

              return 0LL;
            }

            if (a3 <= 27834)
            {
              if (a3 <= 27776)
              {
                if (a3 == 27714)
                {
                  if (a4 >> 1 == 6208)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29170;
                    goto LABEL_3850;
                  }

                  return 0LL;
                }

                if (a3 == 27738)
                {
                  if ((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
                  {
                    if (a4 == 12425)
                    {
                      uint64_t v11 = (const __int32 *)&unk_28D20;
                      goto LABEL_3850;
                    }

                    if (a4 != 12428) {
                      return 0LL;
                    }
                  }

                  uint64_t v11 = (const __int32 *)&unk_28D10;
                  goto LABEL_3850;
                }

                if (a3 != 27770) {
                  return result;
                }
                uint64_t result = 0LL;
                char v18 = a4 - 87;
                if (((1LL << v18) & 0x15) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_293CC;
                  goto LABEL_3850;
                }

                if (((1LL << v18) & 0x48000000000LL) == 0) {
                  return result;
                }
LABEL_3218:
                uint64_t v11 = (const __int32 *)&unk_28A10;
                goto LABEL_3850;
              }

              if (a3 == 27777)
              {
                int v84 = 12415;
LABEL_2979:
                if (a4 != v84) {
                  return 0LL;
                }
LABEL_2980:
                uint64_t v11 = (const __int32 *)&unk_2958C;
                goto LABEL_3850;
              }

              if (a3 == 27784)
              {
                uint64_t v11 = (const __int32 *)&unk_29B20;
                goto LABEL_3850;
              }

              if (a3 != 27832) {
                return result;
              }
              if ((a4 - 12363) <= 8)
              {
                if ((a4 & 1) == 0) {
                  return 0LL;
                }
                goto LABEL_3095;
              }

              int v27 = 12356;
              goto LABEL_3094;
            }

            if (a3 > 27874)
            {
              if (a3 != 27875)
              {
                if (a3 != 27880)
                {
                  if (a3 != 27891) {
                    return result;
                  }
                  if ((a4 - 12364) > 8)
                  {
                    if (a4 != 12356) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) != 0)
                  {
                    return 0LL;
                  }

                  uint64_t v11 = dword_28CE8;
                  goto LABEL_3850;
                }

                if ((a4 - 12364) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) != 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_29B48;
                goto LABEL_3850;
              }

              uint64_t v11 = (const __int32 *)&unk_28B84;
              goto LABEL_3850;
            }

            if (a3 == 27835)
            {
              if ((a4 - 12425) < 5
                || a4 == 12387
                || (a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_297B8;
                goto LABEL_3850;
              }

              if ((a4 - 12410) <= 8)
              {
                uint64_t v11 = (const __int32 *)&unk_297C4;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 == 27841)
            {
              if (a4 != 12420) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29248;
              goto LABEL_3850;
            }

            int v26 = 27850;
LABEL_836:
            if (a3 != v26) {
              return result;
            }
            if (a4 == 12417) {
              goto LABEL_2907;
            }
            int v12 = 12414;
            goto LABEL_2329;
          }

          if (a3 <= 28186)
          {
            if (a3 <= 28039)
            {
              if (a3 <= 28013)
              {
                if (a3 == 27927)
                {
                  uint64_t v11 = (const __int32 *)&unk_2947C;
                  goto LABEL_3850;
                }

                if (a3 != 27963)
                {
                  if (a3 != 27969) {
                    return result;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28CD8;
                  goto LABEL_3850;
                }

                if (a4 != 12363) {
                  return 0LL;
                }
LABEL_1791:
                uint64_t v16 = (const __int32 *)&unk_28B38;
                goto LABEL_3770;
              }

              if (a3 == 28014)
              {
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v16 = (const __int32 *)&unk_29708;
                goto LABEL_3770;
              }

              if (a3 != 28020)
              {
                if (a3 != 28024) {
                  return result;
                }
                if ((a4 - 12372) < 0xFFFFFFF7 || (a4 & 1) == 0)
                {
                  BOOL v36 = (a4 & 1) == 0 || (a4 - 12382) < 0xFFFFFFF7;
                  uint64_t v11 = (const __int32 *)&unk_29A58;
                  goto LABEL_3850;
                }

LABEL_1567:
                uint64_t v11 = (const __int32 *)&unk_28A64;
                goto LABEL_3850;
              }

              int v24 = 12403;
LABEL_2088:
              if (a4 != v24) {
                return 0LL;
              }
              goto LABEL_3022;
            }

            if (a3 <= 28150)
            {
              if (a3 != 28040)
              {
                if (a3 == 28092)
                {
                  if (a4 != 12375) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_2A474;
                }

                else
                {
                  if (a3 != 28113) {
                    return result;
                  }
                  if (a4 != 12420) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_298D0;
                }

                goto LABEL_3850;
              }

              if ((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
              {
                if (a4 == 12360)
                {
                  uint64_t v11 = (const __int32 *)&unk_28A10;
                  goto LABEL_3850;
                }

                return 0LL;
              }

              goto LABEL_2458;
            }

            if (a3 != 28151)
            {
              if (a3 == 28155)
              {
                int v66 = 12360;
                goto LABEL_2823;
              }

              if (a3 != 28168) {
                return result;
              }
              if ((a4 - 12414) >= 5)
              {
                int v41 = 12435;
                goto LABEL_2669;
              }

              goto LABEL_2670;
            }

            uint64_t result = 0LL;
            char v86 = a4 - 86;
            if (((1LL << v86) & 0x20001F0000000000LL) == 0)
            {
              if (((1LL << v86) & 0x45) == 0) {
                return result;
              }
              goto LABEL_3307;
            }

LABEL_2730:
            uint64_t v11 = (const __int32 *)&unk_28A20;
            goto LABEL_3850;
          }

          if (a3 <= 28315)
          {
            if (a3 <= 28203)
            {
              if (a3 != 28187)
              {
                if (a3 != 28193)
                {
                  if (a3 != 28201) {
                    return result;
                  }
                  if (a4 != 12418 && a4 != 12356) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28D6C;
                  goto LABEL_3850;
                }

                if ((a4 - 12425) >= 5)
                {
                  if ((a4 - 12373) > 8)
                  {
                    if (a4 != 12387) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) == 0)
                  {
                    return 0LL;
                  }
                }

                wcscpy(a2, dword_29EAC);
                BOOL v53 = a4 == 12373 || a4 == 12425;
                goto LABEL_2818;
              }

              if (a4 == 12425 || a4 == 12387)
              {
                uint64_t v16 = (const __int32 *)&unk_28AB4;
                goto LABEL_3770;
              }

              if (a5 == 30446)
              {
                uint64_t v11 = (const __int32 *)&unk_29470;
                goto LABEL_3850;
              }

LABEL_3315:
              uint64_t v11 = (const __int32 *)&unk_28AB4;
              goto LABEL_3850;
            }

            if (a3 != 28204)
            {
              if (a3 != 28288)
              {
                if (a3 != 28310) {
                  return result;
                }
                if (a4 != 12360) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_298FC;
                goto LABEL_3850;
              }

              if (a4 != 12385 && a4 != 12383) {
                return 0LL;
              }
              uint64_t v16 = (const __int32 *)&unk_29438;
              goto LABEL_3770;
            }

LABEL_1226:
            uint64_t v11 = (const __int32 *)&unk_29380;
            goto LABEL_3850;
          }

          if (a3 > 28356)
          {
            if (a3 != 28357)
            {
              if (a3 != 28369)
              {
                if (a3 != 28402) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_2A5F4;
                goto LABEL_3850;
              }

              if (a4 != 12425) {
                return 0LL;
              }
              if (*(_DWORD *)(a6 + 8) != 12363)
              {
LABEL_2237:
                uint64_t v11 = (const __int32 *)&unk_28F8C;
                goto LABEL_3850;
              }

              uint64_t v16 = (const __int32 *)&unk_28F80;
              goto LABEL_3770;
            }

            if ((a4 - 12380) >= 0xFFFFFFFB && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2A340;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
LABEL_3187:
            uint64_t v11 = (const __int32 *)&unk_2A2D0;
            goto LABEL_3850;
          }

          if (a3 != 28316)
          {
            if (a3 == 28322)
            {
              if (a4 != 12428) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_28C38;
              goto LABEL_3850;
            }

            if (a3 != 28342) {
              return result;
            }
            goto LABEL_1705;
          }

          if (a4 != 12417 && a4 != 12414) {
            return 0LL;
          }
LABEL_2518:
          uint64_t v11 = (const __int32 *)&unk_2936C;
          goto LABEL_3850;
        }

        if (a3 <= 29104)
        {
          if (a3 <= 28824)
          {
            if (a3 <= 28527)
            {
              if (a3 <= 28436)
              {
                if (a3 == 28417)
                {
                  uint64_t v11 = (const __int32 *)&unk_291AC;
                  goto LABEL_3850;
                }

                if (a3 == 28418)
                {
                  uint64_t v11 = (const __int32 *)&unk_2A120;
                  goto LABEL_3850;
                }

                if (a3 != 28431) {
                  return result;
                }
                int v14 = (const __int32 *)&unk_297B0;
                goto LABEL_2816;
              }

              if (a3 != 28437)
              {
                if (a3 == 28508)
                {
                  uint64_t v11 = (const __int32 *)&unk_29B84;
                }

                else
                {
                  if (a3 != 28516) {
                    return result;
                  }
                  if ((a4 - 12356) < 7
                    || a4 == 12431
                    || a4 == 12387
                    || (a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29910;
                  }

                  else
                  {
                    uint64_t v11 = (const __int32 *)&unk_29920;
                  }
                }

                goto LABEL_3850;
              }

              if ((a4 - 12364) > 8)
              {
                if (a4 != 12356) {
                  return 1LL;
                }
              }

              else if ((a4 & 1) != 0)
              {
                return 1LL;
              }

LABEL_3153:
              uint64_t v11 = (const __int32 *)&unk_28A20;
              goto LABEL_3850;
            }

            if (a3 <= 28654)
            {
              if (a3 == 28528)
              {
                if (a4 == 12360)
                {
                  uint64_t v11 = (const __int32 *)&unk_29E68;
                  goto LABEL_3850;
                }

                return 0LL;
              }

              if (a3 != 28548)
              {
                if (a3 != 28608) {
                  return result;
                }
                if (a4 != 12375) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_293BC;
                goto LABEL_3850;
              }

LABEL_1105:
              int v21 = 12435;
              goto LABEL_1940;
            }

            if (a3 == 28655)
            {
              uint64_t result = 0LL;
              if ((a4 - 12364) <= 8 && (a4 & 1) == 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29D30;
                goto LABEL_3850;
              }

              return result;
            }

            if (a3 != 28810)
            {
              if (a3 != 28818) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_29784;
              goto LABEL_3850;
            }

            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            goto LABEL_3281;
          }

          if (a3 > 28981)
          {
            if (a3 > 29032)
            {
              switch(a3)
              {
                case 29033:
                  if (a4 == 12431)
                  {
                    uint64_t v11 = (const __int32 *)&unk_2A0A8;
                    goto LABEL_3850;
                  }

                  return 0LL;
                case 29053:
                  if ((a4 - 12425) < 5 || a4 == 12387)
                  {
                    uint64_t v11 = (const __int32 *)&unk_292AC;
                    goto LABEL_3850;
                  }

                  if (a4 == 12390)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29B94;
                    goto LABEL_3850;
                  }

                  return 0LL;
                case 29087:
                  uint64_t result = 0LL;
                  if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                  {
                    uint64_t v11 = (const __int32 *)&unk_298DC;
                    goto LABEL_3850;
                  }

                  break;
              }

              return result;
            }

            if (a3 == 28982)
            {
              if (a4 == 12427)
              {
                uint64_t v11 = (const __int32 *)&unk_29BC0;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 != 28988)
            {
              if (a3 == 29031)
              {
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_299CC;
                  goto LABEL_3850;
                }
              }

              return result;
            }

            goto LABEL_1669;
          }

          if (a3 <= 28952)
          {
            if (a3 == 28825)
            {
              uint64_t v11 = (const __int32 *)&unk_290C0;
              goto LABEL_3850;
            }

            if (a3 == 28857)
            {
              uint64_t v11 = (const __int32 *)&unk_29EA0;
              goto LABEL_3850;
            }

            if (a3 != 28858) {
              return result;
            }
            uint64_t result = 0LL;
            goto LABEL_1905;
          }

          if (a3 == 28953)
          {
LABEL_1711:
            if ((a4 - 12373) <= 8)
            {
              if ((a4 & 1) == 0) {
                return 0LL;
              }
LABEL_2849:
              if (a5 == 25163)
              {
                uint64_t v11 = (const __int32 *)&unk_2A280;
                goto LABEL_3850;
              }

              goto LABEL_2851;
            }

LABEL_1078:
            uint64_t v11 = (const __int32 *)&unk_2A24C;
            goto LABEL_3850;
          }

          if (a3 == 28961)
          {
            if ((a4 - 12363) > 8)
            {
              if (a4 == 12356) {
                goto LABEL_3739;
              }
            }

            else if ((a4 & 1) != 0)
            {
              goto LABEL_3739;
            }

            if ((a4 & 0xFFFFFFFD) != 0x3055) {
              return 0LL;
            }
            goto LABEL_3739;
          }

          if (a3 != 28966) {
            return result;
          }
          if ((a4 - 12425) < 5 || a4 == 12387)
          {
            uint64_t v11 = (const __int32 *)&unk_299B0;
            goto LABEL_3850;
          }

          uint64_t result = 0LL;
LABEL_2102:
          uint64_t v11 = (const __int32 *)&unk_28A20;
          goto LABEL_3850;
        }

        if (a3 <= 29975)
        {
          if (a3 <= 29358)
          {
            if (a3 <= 29237)
            {
              if (a3 == 29105)
              {
                if ((a4 - 12380) >= 0xFFFFFFFB && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_29FA8;
                  goto LABEL_3850;
                }

                uint64_t result = 0LL;
                if ((a4 - 12356) <= 0x19 && ((1 << (a4 - 68)) & 0x2020A81) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_298A4;
                  goto LABEL_3850;
                }

                return result;
              }

              if (a3 == 29123)
              {
                if (a4 != 12420 && a4 != 12360) {
                  return 0LL;
                }
                wcscpy(a2, (const __int32 *)&unk_297B0);
                BOOL v53 = a4 == 12420;
                goto LABEL_2818;
              }

              if (a3 != 29190) {
                return result;
              }
              int v15 = 12380;
LABEL_2883:
              if (a4 != v15) {
                return 0LL;
              }
              goto LABEL_2884;
            }

            if (a3 == 29238)
            {
              if (a5 == 12362)
              {
                uint64_t v11 = (const __int32 *)&unk_2A140;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 != 29245)
            {
              int v39 = 29309;
              goto LABEL_1082;
            }

            int v64 = 12420;
            goto LABEL_3076;
          }

          if (a3 <= 29553)
          {
            if (a3 != 29359)
            {
              if (a3 == 29378)
              {
LABEL_1972:
                uint64_t v11 = (const __int32 *)&unk_29258;
              }

              else
              {
                if (a3 != 29401) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_29BFC;
              }

              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2A068;
              goto LABEL_3850;
            }

            return result;
          }

          if (a3 == 29554)
          {
            goto LABEL_2747;
          }

          if (a3 == 29575)
          {
            if (a4 == 12356)
            {
              uint64_t v11 = (const __int32 *)&unk_2A468;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 29694) {
            return result;
          }
          if (a4 != 12431)
          {
            if ((a4 - 12425) > 4)
            {
              uint64_t result = 0LL;
            }

            goto LABEL_3038;
          }

LABEL_2778:
          uint64_t v16 = (const __int32 *)&unk_2947C;
          goto LABEL_3770;
        }

        if (a3 <= 30010)
        {
          if (a3 > 29986)
          {
            switch(a3)
            {
              case 29987:
                uint64_t v11 = (const __int32 *)&unk_29708;
                goto LABEL_3850;
              case 29992:
                if (a4 == 12356)
                {
                  uint64_t v11 = (const __int32 *)&unk_2A400;
                  goto LABEL_3850;
                }

                return 0LL;
              case 30003:
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_2938C;
                  goto LABEL_3850;
                }

                break;
            }

            return result;
          }

          if (a3 == 29976)
          {
            uint64_t result = 0LL;
            goto LABEL_2410;
          }

          if (a3 == 29978)
          {
            if (a4 != 12384) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29A88;
            goto LABEL_3850;
          }

          if (a3 != 29983) {
            return result;
          }
          if ((a4 - 12370) < 0xFFFFFFF9 || (a4 & 1) == 0)
          {
            if (a4 == 12420)
            {
LABEL_2954:
              uint64_t v16 = (const __int32 *)&unk_28C44;
              goto LABEL_3770;
            }

            if (a4 != 12360)
            {
              if (a4 != 12356)
              {
                if ((a4 - 12376) <= 4 && (a4 & 1) == 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_29AF8;
                  goto LABEL_3850;
                }

                if ((a4 - 12414) >= 5 && a4 != 12435)
                {
                  if (a4 == 12428)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29750;
                    goto LABEL_3850;
                  }

                  return 0LL;
                }

                goto LABEL_1551;
              }

LABEL_3160:
              uint64_t v11 = (const __int32 *)&unk_28D54;
              goto LABEL_3850;
            }

            goto LABEL_2953;
          }

          int v20 = (const __int32 *)&unk_28B38;
          goto LABEL_2734;
        }

        if (a3 <= 30063)
        {
          if (a3 == 30011) {
            goto LABEL_1722;
          }
          if (a3 == 30031)
          {
            if ((a4 - 12425) > 4)
            {
              if (a4 == 12414)
              {
                uint64_t v11 = (const __int32 *)&unk_28B98;
                goto LABEL_3850;
              }

              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28B8C;
            goto LABEL_3850;
          }

          int v26 = 30041;
          goto LABEL_836;
        }

        if (a3 == 30064)
        {
          if (a4 == 12394)
          {
            uint64_t v11 = (const __int32 *)&unk_28BA8;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 30067)
        {
          if (a3 != 30094) {
            return result;
          }
          if (a4 != 12435) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_29C18;
          goto LABEL_3850;
        }

        if ((a4 - 12414) < 5)
        {
LABEL_2603:
          uint64_t v11 = (const __int32 *)&unk_299D8;
          goto LABEL_3850;
        }

        int v68 = 12435;
LABEL_2602:
        if (a4 != v68) {
          return 0LL;
        }
        goto LABEL_2603;
      }

      if (a3 <= 32079)
      {
        if (a3 <= 31068)
        {
          if (a3 <= 30451)
          {
            if (a3 <= 30289)
            {
              if (a3 <= 30170)
              {
                if (a3 == 30097)
                {
                  if (((a4 - 12356) > 0x1F || ((1 << (a4 - 68)) & 0x8000007B) == 0 && a4 != 12358)
                    && a4 != 12431)
                  {
                    return 0LL;
                  }

                  uint64_t v11 = (const __int32 *)&unk_29100;
                  goto LABEL_3850;
                }

                if (a3 != 30130)
                {
                  if (a3 != 30149) {
                    return result;
                  }
                  uint64_t v11 = (const __int32 *)&unk_29414;
                  goto LABEL_3850;
                }

                if (a4 != 12428) {
                  return 0LL;
                }
                if (a5 == 27671)
                {
                  uint64_t v11 = (const __int32 *)&unk_2941C;
                  goto LABEL_3850;
                }

LABEL_2485:
                uint64_t v11 = (const __int32 *)&unk_2942C;
                goto LABEL_3850;
              }

              if (a3 == 30171)
              {
                if ((a4 - 12363) <= 8)
                {
                  if ((a4 & 1) == 0) {
                    return 0LL;
                  }
                  goto LABEL_3151;
                }

                if ((a4 - 12414) > 0x15 || ((1 << (a4 - 126)) & 0x20001F) == 0)
                {
                  int v89 = 12356;
LABEL_3150:
                  if (a4 != v89) {
                    return 0LL;
                  }
                }

LABEL_3151:
                uint64_t v11 = (const __int32 *)&unk_29784;
                goto LABEL_3850;
              }

              if (a3 != 30185)
              {
                if (a3 != 30202) {
                  return result;
                }
                if (a4 != 12428) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_2A538;
                goto LABEL_3850;
              }

              if (a4 != 12369) {
                return 0LL;
              }
              goto LABEL_3153;
            }

            if (a3 > 30332)
            {
              switch(a3)
              {
                case 30333:
                  if (a4 == 12369)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29E44;
                  }

                  else
                  {
                    if ((a4 - 12363) > 8)
                    {
                      if (a4 != 12373 && a4 != 12356) {
                        return 0LL;
                      }
                    }

                    else if ((a4 & 1) == 0)
                    {
                      return 0LL;
                    }

                    uint64_t v11 = (const __int32 *)&unk_2A018;
                  }

                  break;
                case 30423:
                  uint64_t v11 = (const __int32 *)&unk_29EE0;
                  break;
                case 30427:
                  uint64_t v11 = (const __int32 *)&unk_297B0;
                  break;
                default:
                  return result;
              }

              goto LABEL_3850;
            }

            if (a3 == 30290)
            {
              int v17 = 12360;
              goto LABEL_2780;
            }

            if (a3 != 30330)
            {
              if (a3 != 30331) {
                return result;
              }
LABEL_1696:
              goto LABEL_1697;
            }

            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2A04C;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
LABEL_3281:
            uint64_t v11 = (const __int32 *)&unk_2936C;
            goto LABEL_3850;
          }

          if (a3 <= 30692)
          {
            if (a3 <= 30495)
            {
              if (a3 != 30452)
              {
                if (a3 == 30465)
                {
                  if (a4 != 12415) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_299BC;
                }

                else
                {
                  if (a3 != 30495) {
                    return result;
                  }
                  if (a4 != 12387) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28FAC;
                }

                goto LABEL_3850;
              }

              if (a4 == 12368) {
                goto LABEL_2500;
              }
              if (a4 == 12387 || (a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
LABEL_2377:
                uint64_t v11 = (const __int32 *)&unk_297B8;
                goto LABEL_3850;
              }

              if (a4 != 12385) {
                return 0LL;
              }
LABEL_1704:
              uint64_t v11 = (const __int32 *)&unk_29818;
              goto LABEL_3850;
            }

            if (a3 != 30496)
            {
              if (a3 != 30528)
              {
                if (a3 != 30568) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_2A5AC;
                goto LABEL_3850;
              }

LABEL_1684:
              if ((a4 - 12363) <= 8)
              {
                if ((a4 & 1) == 0) {
                  return 0LL;
                }
                goto LABEL_2292;
              }

              int v51 = 12356;
              goto LABEL_2291;
            }

            if ((a4 - 12363) > 8)
            {
              if (a4 == 12356) {
                goto LABEL_2630;
              }
              if ((a4 - 12382) < 0xFFFFFFF7)
              {
LABEL_2629:
                goto LABEL_2630;
              }
            }

            if ((a4 & 1) == 0) {
              goto LABEL_2629;
            }
LABEL_2630:
            uint64_t v11 = (const __int32 *)&unk_2A31C;
            goto LABEL_3850;
          }

          if (a3 > 30771)
          {
            switch(a3)
            {
              case 30772:
                uint64_t v11 = (const __int32 *)&unk_29FDC;
                goto LABEL_3850;
              case 30952:
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_29404;
                goto LABEL_3850;
              case 31034:
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_297D0;
                  goto LABEL_3850;
                }

                break;
            }

            return result;
          }

          if (a3 == 30693)
          {
            int v14 = (const __int32 *)&unk_2958C;
            goto LABEL_2816;
          }

          if (a3 != 30740)
          {
            if (a3 != 30741) {
              return result;
            }
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28D80;
            goto LABEL_3850;
          }

          if ((a4 - 12363) > 8)
          {
            if (a4 != 12356)
            {
              BOOL v60 = (a4 & 1) == 0;
              goto LABEL_3673;
            }
          }

          else if ((a4 & 1) == 0)
          {
            BOOL v60 = 1;
LABEL_3673:
            uint64_t result = 0LL;
LABEL_3675:
            uint64_t v11 = (const __int32 *)&unk_28E5C;
            goto LABEL_3850;
          }

          uint64_t v11 = (const __int32 *)&unk_29404;
          goto LABEL_3850;
        }

        if (a3 <= 31560)
        {
          if (a3 <= 31308)
          {
            if (a3 <= 31215)
            {
              switch(a3)
              {
                case 31069:
                  uint64_t v11 = (const __int32 *)&unk_28BDC;
                  goto LABEL_3850;
                case 31085:
                  uint64_t v11 = (const __int32 *)&unk_29638;
                  goto LABEL_3850;
                case 31105:
                  uint64_t result = 0LL;
                  if ((a4 - 12374) <= 4 && ((1 << (a4 - 86)) & 0x15) != 0)
                  {
                    uint64_t v11 = (const __int32 *)&unk_291D4;
                    goto LABEL_3850;
                  }

                  break;
              }

              return result;
            }

            if (a3 != 31216)
            {
              if (a3 != 31227)
              {
                if (a3 != 31292) {
                  return result;
                }
                if ((a4 - 12364) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) != 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_28DE8;
                goto LABEL_3850;
              }

              goto LABEL_1044;
            }

            int v68 = 12360;
            goto LABEL_2602;
          }

          if (a3 <= 31434)
          {
            if (a3 == 31309)
            {
LABEL_1716:
              int v51 = 12435;
LABEL_2291:
              if (a4 != v51) {
                return 0LL;
              }
LABEL_2292:
              uint64_t v11 = (const __int32 *)&unk_28A64;
              goto LABEL_3850;
            }

            if (a3 != 31354)
            {
              if (a3 != 31361) {
                return result;
              }
              goto LABEL_1684;
            }

            if ((a4 - 12363) <= 8)
            {
              if ((a4 & 1) == 0) {
                return 0LL;
              }
              goto LABEL_1701;
            }

            if (a4 != 12375)
            {
              int v45 = 12356;
LABEL_1700:
              if (a4 != v45) {
                return 0LL;
              }
              goto LABEL_1701;
            }

LABEL_3062:
            uint64_t v11 = (const __int32 *)&unk_29194;
            goto LABEL_3850;
          }

          if (a3 != 31435)
          {
            if (a3 != 31478)
            {
              if (a3 != 31505) {
                return result;
              }
              uint64_t result = 0LL;
              if (a4 > 12386)
              {
                if (a4 != 12387 && a4 != 12431)
                {
                  if (a4 != 12415) {
                    return result;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28A00;
                  goto LABEL_3850;
                }
              }

              else if ((a4 - 12356) >= 7)
              {
                return result;
              }

              uint64_t v11 = (const __int32 *)&unk_299E4;
              goto LABEL_3850;
            }

            if ((a4 - 12356) <= 0x1F && (((1 << (a4 - 68)) & 0x8000007B) != 0 || a4 == 12358)
              || a4 == 12431)
            {
              uint64_t v11 = (const __int32 *)&unk_291E0;
              goto LABEL_3850;
            }

            goto LABEL_3640;
          }

          if (a5 <= 26396)
          {
            if (a5 == 20808 || a5 == 22805) {
              goto LABEL_3817;
            }
            int v88 = 25163;
          }

          else if (a5 > 32206)
          {
            if (a5 == 38555) {
              goto LABEL_3817;
            }
            int v88 = 32207;
          }

          else
          {
            if (a5 == 26397) {
              goto LABEL_3817;
            }
            int v88 = 30446;
          }

          if (a5 != v88) {
            goto LABEL_2518;
          }
LABEL_3817:
          uint64_t v11 = (const __int32 *)&unk_28A40;
          goto LABEL_3850;
        }

        if (a3 <= 32012)
        {
          if (a3 > 31724)
          {
            if (a3 == 31725 || a3 == 31840)
            {
              uint64_t v11 = (const __int32 *)&unk_28C98;
            }

            else
            {
              if (a3 != 31896) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_29FC0;
            }

            goto LABEL_3850;
          }

          if (a3 == 31561)
          {
            if (a4 == 12375)
            {
              uint64_t v11 = (const __int32 *)&unk_29EEC;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 31572)
          {
            if (a3 != 31689) {
              return result;
            }
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_29DE8;
            goto LABEL_3850;
          }

          if (a4 == 12360) {
            goto LABEL_2320;
          }
          return 0LL;
        }

        if (a3 <= 32065)
        {
          if (a3 == 32013)
          {
LABEL_1257:
            if (a4 != 12417 && a4 != 12414) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_297C4;
            goto LABEL_3850;
          }

          if (a3 == 32027)
          {
            uint64_t v11 = (const __int32 *)&unk_2A18C;
            goto LABEL_3850;
          }

          if (a3 != 32048) {
            return result;
          }
          if (a4 != 12420)
          {
            int v28 = 12363;
            goto LABEL_2158;
          }

LABEL_2159:
          uint64_t v11 = (const __int32 *)&unk_29604;
          goto LABEL_3850;
        }

        if (a3 != 32066)
        {
          if (a3 == 32068)
          {
            uint64_t v11 = (const __int32 *)&unk_28EA0;
            goto LABEL_3850;
          }

          if (a3 != 32076) {
            return result;
          }
          if ((*(_DWORD *)(a6 + 8) != 12390 || *(_DWORD *)(a6 + 12) != 12400) && (a4 - 12385) > 2)
          {
            goto LABEL_3315;
          }

LABEL_1487:
          uint64_t v11 = (const __int32 *)&unk_2936C;
          goto LABEL_3850;
        }

        uint64_t result = 0LL;
        if (a4 <= 12424)
        {
          if (a4 != 12360)
          {
            if (a4 != 12387) {
              return result;
            }
LABEL_2800:
            uint64_t v11 = (const __int32 *)&unk_29868;
            goto LABEL_3850;
          }
        }

        else
        {
          if (a4 != 12431) {
            return result;
          }
        }

LABEL_81:
        uint64_t v11 = (const __int32 *)&unk_28D54;
        goto LABEL_3850;
      }

      if (a3 <= 32783)
      {
        if (a3 > 32330)
        {
          if (a3 > 32675)
          {
            if (a3 > 32754)
            {
              if (a3 == 32755)
              {
LABEL_1687:
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_28CBC;
                  goto LABEL_3850;
                }

                return result;
              }

              if (a3 != 32769)
              {
                if (a3 != 32771) {
                  return result;
                }
                if (a4 != 12360) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_29594;
                goto LABEL_3850;
              }

              if (a4 != 12369)
              {
                int v67 = 12356;
                goto LABEL_2580;
              }

              goto LABEL_3685;
            }

            if (a3 != 32676)
            {
              if (a3 != 32701)
              {
                if (a3 != 32722) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_28FDC;
                goto LABEL_3850;
              }

              if (a4 != 12400) {
                return 0LL;
              }
              goto LABEL_2073;
            }

            if (a4 != 12428)
            {
              if (a4 == 12364)
              {
                uint64_t v11 = (const __int32 *)&unk_29324;
                goto LABEL_3850;
              }

              return 0LL;
            }
          }

          else
          {
            if (a3 > 32621)
            {
              if (a3 != 32622)
              {
                if (a3 != 32624)
                {
                  if (a3 != 32654) {
                    return result;
                  }
                  if (a4 != 12375) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_2A0F4;
                  goto LABEL_3850;
                }

                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_2A058;
                  goto LABEL_3850;
                }

                return result;
              }

              if ((a4 - 12363) <= 8)
              {
                if ((a4 & 1) == 0) {
                  return 0LL;
                }
                goto LABEL_3160;
              }

              int v79 = 12356;
              goto LABEL_3159;
            }

            if (a3 == 32331)
            {
              if ((a4 - 12364) > 8)
              {
                if (a4 != 12356) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) != 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_29374;
              goto LABEL_3850;
            }

            if (a3 == 32341)
            {
              uint64_t v11 = (const __int32 *)&unk_29BEC;
              goto LABEL_3850;
            }

            if (a3 != 32368) {
              return result;
            }
            if (a4 != 12428)
            {
              if (a4 != 12426) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_28EA0;
              goto LABEL_3850;
            }
          }

          uint64_t v11 = (const __int32 *)&unk_28AC4;
          goto LABEL_3850;
        }

        if (a3 <= 32179)
        {
          if (a3 > 32117)
          {
            if (a3 != 32118)
            {
              if (a3 != 32153)
              {
                if (a3 != 32154) {
                  return result;
                }
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_29CB8;
                goto LABEL_3850;
              }

LABEL_1503:
              if ((a4 - 12364) > 8)
              {
                if (a4 != 12356) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) != 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_28A64;
              goto LABEL_3850;
            }

            goto LABEL_1546;
          }

          if (a3 == 32080)
          {
            char v71 = a4 - 99;
            if (((1LL << v71) & 0x1000002492000LL) != 0)
            {
              wcscpy(a2, dword_293D8);
              int v62 = 12400;
              goto LABEL_2324;
            }

            if (((1LL << v71) & 0x100000000001LL) == 0)
            {
LABEL_3779:
            }

            uint64_t v11 = (const __int32 *)&unk_293E4;
            goto LABEL_3850;
          }

          if (a3 != 32094)
          {
            if (a3 != 32097) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_2A440;
            goto LABEL_3850;
          }

          if ((a4 - 12425) < 5 || a4 == 12387)
          {
LABEL_1789:
            uint64_t v11 = (const __int32 *)&unk_27C0C;
            goto LABEL_3850;
          }

LABEL_946:
          uint64_t v11 = (const __int32 *)&unk_2958C;
          goto LABEL_3850;
        }

        if (a3 > 32243)
        {
          switch(a3)
          {
            case 32244:
              uint64_t v11 = (const __int32 *)&unk_28A84;
              break;
            case 32283:
              uint64_t v11 = (const __int32 *)&unk_2A03C;
              break;
            case 32299:
LABEL_1309:
              uint64_t v11 = (const __int32 *)&unk_28A74;
              break;
            default:
              return result;
          }

          goto LABEL_3850;
        }

        if (a3 != 32180)
        {
          if (a3 == 32224)
          {
            if (a4 == 12417) {
              goto LABEL_2455;
            }
            int v58 = 12414;
            goto LABEL_2454;
          }

          if (a3 != 32232) {
            return result;
          }
          int v24 = 12435;
          goto LABEL_2088;
        }

        if ((a4 - 12425) < 5 || a4 == 12387)
        {
          uint64_t v11 = (const __int32 *)&unk_29CB8;
          goto LABEL_3850;
        }

        int v33 = 12376;
        goto LABEL_935;
      }

      if (a3 <= 33260)
      {
        if (a3 > 32971)
        {
          if (a3 > 33191)
          {
            if (a3 == 33192)
            {
              if (a4 != 12428 && a4 != 12425) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29070;
              goto LABEL_3850;
            }

            if (a3 != 33256)
            {
              if (a3 != 33258) {
                return result;
              }
              if (a4 == 12425)
              {
                uint64_t v11 = (const __int32 *)&unk_297E8;
                goto LABEL_3850;
              }

              if (a4 != 12378) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_297DC;
              goto LABEL_3850;
            }

            goto LABEL_1690;
          }

          if (a3 != 32972)
          {
            if (a3 != 33029)
            {
              if (a3 != 33073) {
                return result;
              }
              if ((a4 - 12364) > 8)
              {
                if (a4 != 12356)
                {
                  uint64_t result = 0LL;
                  if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29D58;
                    goto LABEL_3850;
                  }

                  return result;
                }
              }

              else if ((a4 & 1) != 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_28A74;
              goto LABEL_3850;
            }

            if (a4 == 12363)
            {
              uint64_t v11 = (const __int32 *)&unk_29264;
              goto LABEL_3850;
            }

            if (a4 != 12360)
            {
              uint64_t result = 0LL;
              if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_28BF8;
                goto LABEL_3850;
              }

              return result;
            }

            goto LABEL_2720;
          }

          if ((a4 - 12363) <= 8)
          {
            if ((a4 & 1) == 0) {
              return 0LL;
            }
            goto LABEL_3129;
          }

          int v63 = 12356;
LABEL_3128:
          if (a4 != v63) {
            return 0LL;
          }
LABEL_3129:
          uint64_t v11 = (const __int32 *)&unk_29FFC;
          goto LABEL_3850;
        }

        if (a3 <= 32883)
        {
          if (a3 == 32784) {
            goto LABEL_1546;
          }
          if (a3 == 32842)
          {
            if (a4 != 12363) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29610;
            goto LABEL_3850;
          }

          if (a3 != 32862) {
            return result;
          }
LABEL_1708:
          int v50 = a4 - 12363;
          if ((a4 - 12363) > 8)
          {
            if (a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) == 0)
          {
            return 0LL;
          }

          wcscpy(a2, (const __int32 *)&unk_28A10);
          BOOL v53 = (v50 & 0xFFFFFFF7) == 0;
          goto LABEL_2818;
        }

        if (a3 == 32884) {
          goto LABEL_1708;
        }
        if (a3 != 32933)
        {
          if (a3 != 32946) {
            return result;
          }
          if ((a4 - 12414) >= 5 && a4 != 12435)
          {
            if ((a4 - 12383) <= 9)
            {
              uint64_t v11 = (const __int32 *)&unk_28C28;
              goto LABEL_3850;
            }

            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_28C14;
          goto LABEL_3850;
        }

        if ((a4 - 12387) <= 0x2A && ((1LL << (a4 - 99)) & 0x7C000000001LL) != 0)
        {
          uint64_t v11 = (const __int32 *)&unk_2A0C8;
          goto LABEL_3850;
        }

LABEL_2101:
        if (a4 != 12360) {
          return 0LL;
        }
        goto LABEL_2102;
      }

      if (a3 > 33390)
      {
        if (a3 > 33508)
        {
          switch(a3)
          {
            case 33509:
              if (a4 == 12375)
              {
                uint64_t v11 = (const __int32 *)&unk_297B0;
                goto LABEL_3850;
              }

              if ((a4 - 12356) <= 0xF)
              {
                uint64_t v11 = (const __int32 *)&unk_28E74;
                goto LABEL_3850;
              }

              return 0LL;
            case 33510:
              uint64_t result = 0LL;
              switch(a4)
              {
                case 12367:
                case 12369:
                case 12373:
                  goto LABEL_3290;
                case 12368:
                case 12370:
                case 12371:
                case 12372:
                case 12374:
                  return result;
                case 12375:
                  goto LABEL_1972;
                default:
                  if (a4 != 12363 && a4 != 12356) {
                    return result;
                  }
LABEL_3290:
                  uint64_t v11 = (const __int32 *)&unk_292F8;
                  break;
              }

              break;
            case 33538:
              uint64_t v11 = (const __int32 *)&unk_2A34C;
              break;
            default:
              return result;
          }
        }

        else
        {
          switch(a3)
          {
            case 33391:
              if ((a4 - 12363) > 8)
              {
                if (a4 != 12373 && a4 != 12356) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_28C70;
              break;
            case 33459:
              if (a4 == 12375)
              {
                uint64_t v11 = (const __int32 *)&unk_2A2A8;
                goto LABEL_3850;
              }

              if (a4 != 12400) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2A29C;
              break;
            case 33503:
              if (a4 != 12418) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2A548;
              break;
            default:
              return result;
          }
        }

        goto LABEL_3850;
      }

      if (a3 > 33287)
      {
        if (a3 != 33288)
        {
          if (a3 != 33296)
          {
            if (a3 != 33310) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_28FAC;
            goto LABEL_3850;
          }

          int v22 = 12417;
          goto LABEL_2152;
        }

        uint64_t result = 0LL;
        if ((a4 - 12374) <= 4 && ((1 << (a4 - 86)) & 0x15) != 0)
        {
          uint64_t v11 = (const __int32 *)&unk_29278;
          goto LABEL_3850;
        }

        return result;
      }

      if (a3 == 33261)
      {
        if ((a4 - 12358) <= 0xF)
        {
          int v74 = 1 << (a4 - 70);
          if ((v74 & 0x8A20) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_29880;
            goto LABEL_3850;
          }

          if ((v74 & 5) != 0) {
            goto LABEL_3345;
          }
        }

        int v69 = 12431;
        goto LABEL_3344;
      }

      if (a3 != 33267)
      {
        if (a3 == 33268)
        {
          uint64_t result = 0LL;
          if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_29784;
            goto LABEL_3850;
          }
        }

        return result;
      }

      if ((a4 - 12425) < 5)
      {
LABEL_1916:
        uint64_t v11 = (const __int32 *)&unk_29784;
        goto LABEL_3850;
      }

      if (a4 != 12415)
      {
        if (a4 != 12387) {
          return 0LL;
        }
        goto LABEL_1916;
      }

LABEL_3251:
      uint64_t v11 = (const __int32 *)&unk_29774;
      goto LABEL_3850;
    }

    if (a3 > 36793)
    {
      if (a3 <= 38280)
      {
        if (a3 <= 36932)
        {
          if (a3 <= 36878)
          {
            if (a3 > 36847)
            {
              switch(a3)
              {
                case 36861:
                  goto LABEL_81;
                case 36862:
                case 36863:
                case 36866:
                case 36868:
                case 36869:
                  return result;
                case 36864:
                  if ((a4 - 12363) > 8)
                  {
                    if (a4 != 12356) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) == 0)
                  {
                    return 0LL;
                  }

                  uint64_t v11 = (const __int32 *)&unk_29D1C;
                  goto LABEL_3850;
                case 36865:
                  goto LABEL_873;
                case 36867:
                  if (a4 == 12370 || a4 == 12364)
                  {
                    uint64_t v11 = (const __int32 *)&unk_29EF8;
                    goto LABEL_3850;
                  }

                  if ((a4 - 12373) > 8)
                  {
                    if (a4 != 12428) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) == 0)
                  {
                    return 0LL;
                  }

                  uint64_t v11 = (const __int32 *)&unk_29F00;
                  goto LABEL_3850;
                case 36870:
                  if (a4 != 12425) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28CCC;
                  goto LABEL_3850;
                default:
                  if (a3 != 36848)
                  {
                    if (a3 != 36855) {
                      return result;
                    }
                    if ((a4 - 12356) < 7 || a4 == 12431 || a4 == 12387)
                    {
                      uint64_t v16 = (const __int32 *)&unk_2A334;
                      goto LABEL_3770;
                    }

                    return 0LL;
                  }

                  if (a4 != 12409) {
                    return 0LL;
                  }
                  break;
              }

              goto LABEL_2853;
            }

            if (a3 > 36813)
            {
              if (a3 == 36814)
              {
                if (a4 == 12360)
                {
                  uint64_t v11 = (const __int32 *)&unk_293B0;
                  goto LABEL_3850;
                }

                return 0LL;
              }

              if (a3 != 36820)
              {
                if (a3 != 36843) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_2A030;
                goto LABEL_3850;
              }

              if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
LABEL_2706:
                uint64_t v11 = (const __int32 *)&unk_2A1D4;
                goto LABEL_3850;
              }

LABEL_2705:
              goto LABEL_2706;
            }

            if (a3 == 36794)
            {
              if (a4 != 12426) {
                return 0LL;
              }
              goto LABEL_2425;
            }

            if (a3 != 36796)
            {
              if (a3 != 36799) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_2A5E4;
              goto LABEL_3850;
            }

            goto LABEL_2730;
          }

          if (a3 <= 36913)
          {
            switch(a3)
            {
              case 36889:
LABEL_2882:
                int v15 = 12387;
                goto LABEL_2883;
              case 36890:
                if ((a4 - 12425) <= 4)
                {
                  if (a5 == 22823) {
                    uint64_t v11 = (const __int32 *)&unk_29054;
                  }
                  else {
LABEL_1925:
                  }
                    uint64_t v11 = (const __int32 *)&unk_29064;
                  goto LABEL_3850;
                }

                if ((a4 - 12356) <= 0x1F && (((1 << (a4 - 68)) & 0x8000007B) != 0 || a4 == 12358)
                  || a4 == 12431)
                {
                  uint64_t v11 = (const __int32 *)&unk_29E50;
                  goto LABEL_3850;
                }

                if ((a4 & 0xFFFFFFFD) == 0x3058)
                {
                  uint64_t v11 = (const __int32 *)&unk_29E5C;
                  goto LABEL_3850;
                }

                return 0LL;
              case 36891:
              case 36892:
              case 36894:
              case 36897:
                return result;
              case 36893:
                if ((a4 & 1) == 0) {
                  return 0LL;
                }
                goto LABEL_3777;
              case 36895:
                uint64_t v57 = (a4 - 12363);
                if (v57 != 57) {
                  goto LABEL_2976;
                }
                uint64_t v11 = (const __int32 *)&unk_29CAC;
                goto LABEL_3850;
              case 36896:
                goto LABEL_1560;
              case 36898:
                goto LABEL_1532;
              case 36899:
                switch(a4)
                {
                  case 12394:
                    goto LABEL_1936;
                  case 12428:
                    uint64_t v11 = (const __int32 *)&unk_28A64;
                    break;
                  case 12397:
LABEL_1936:
                    uint64_t v11 = (const __int32 *)&unk_2A4AC;
                    break;
                  default:
                    return 0LL;
                }

                break;
              default:
                if (a3 != 36879) {
                  return result;
                }
                uint64_t result = 0LL;
                goto LABEL_1925;
            }

            goto LABEL_3850;
          }

          if (a3 != 36914)
          {
            if (a3 == 36920)
            {
              if (a4 != 12420)
              {
                if (a4 != 12428 && a4 != 12425) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_28A30;
                goto LABEL_3850;
              }

              goto LABEL_2073;
            }

            if (a3 != 36930) {
              return result;
            }
            int v33 = 12370;
LABEL_935:
            if (a4 != v33) {
              return 0LL;
            }
            goto LABEL_3675;
          }

LABEL_1565:
          uint64_t v11 = (const __int32 *)&unk_28FB4;
          goto LABEL_3850;
        }

        if (a3 <= 36985)
        {
          if (a3 <= 36952)
          {
            switch(a3)
            {
              case 36938:
                uint64_t result = 0LL;
                uint64_t v11 = dword_2A3C0;
                goto LABEL_3850;
              case 36939:
                uint64_t result = 0LL;
                uint64_t v11 = (const __int32 *)&unk_28CB0;
                goto LABEL_3850;
              case 36940:
              case 36941:
              case 36943:
              case 36944:
              case 36945:
              case 36946:
              case 36947:
                return result;
              case 36942:
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_28DFC;
                  goto LABEL_3850;
                }

                if ((a4 - 12385) <= 5)
                {
                  uint64_t v11 = (const __int32 *)&unk_28E0C;
                  goto LABEL_3850;
                }

                if (a4 != 12372 && a4 != 12366) {
                  return 0LL;
                }
                uint64_t v16 = (const __int32 *)&unk_28E1C;
                goto LABEL_3770;
              case 36948:
                uint64_t result = 0LL;
                uint64_t v11 = (const __int32 *)&unk_29D3C;
                goto LABEL_3850;
              case 36949:
                uint64_t v11 = (const __int32 *)&unk_28BE8;
                goto LABEL_3850;
              default:
                if (a3 != 36933) {
                  return result;
                }
                if (a4 == 12428 || a4 == 12425) {
                  goto LABEL_1754;
                }
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_28B8C;
                break;
            }

            goto LABEL_3850;
          }

          if (a3 > 36964)
          {
            if (a3 != 36965)
            {
              if (a3 == 36973)
              {
LABEL_1532:
                int v47 = 12387;
                goto LABEL_2514;
              }

              if (a3 != 36984) {
                return result;
              }
              uint64_t result = 0LL;
              char v43 = a4 - 99;
              if (((1LL << v43) & 0x7C000000001LL) == 0)
              {
                if (((1LL << v43) & 0x1000002492000LL) == 0) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_29BA4;
                goto LABEL_3850;
              }

              goto LABEL_2431;
            }
          }

          else if (a3 != 36953)
          {
            if (a3 == 36960)
            {
              uint64_t result = 0LL;
              if ((a4 - 12356) <= 0x11 && ((1 << (a4 - 68)) & 0x22801) != 0)
              {
                if (a5 == 32257) {
                  uint64_t v11 = (const __int32 *)&unk_29054;
                }
                else {
                  uint64_t v11 = (const __int32 *)&unk_29064;
                }
                goto LABEL_3850;
              }

              return result;
            }

            if (a3 != 36963) {
              return result;
            }
            uint64_t result = 0LL;
            if (a4 > 12386)
            {
              if (a4 != 12431)
              {
                if (a4 != 12387) {
                  return result;
                }
LABEL_3079:
                uint64_t v11 = (const __int32 *)&unk_29414;
                goto LABEL_3850;
              }
            }

            else if ((a4 - 12356) >= 7)
            {
              return result;
            }

            if (a5 != 27671) {
              goto LABEL_2485;
            }
            goto LABEL_2216;
          }

          if (a4 != 12363) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_2A40C;
          goto LABEL_3850;
        }

        if (a3 <= 37324)
        {
          if (a3 <= 37239)
          {
            if (a3 != 36986)
            {
              if (a3 != 37197)
              {
                if (a3 != 37239) {
                  return result;
                }
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_295E4;
                goto LABEL_3850;
              }

              if ((a4 - 12380) < 0xFFFFFFFB || (a4 & 1) == 0)
              {
                uint64_t v11 = (const __int32 *)&unk_2A008;
                goto LABEL_3850;
              }

              goto LABEL_2553;
            }

LABEL_1692:
            if (((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
              && (a4 - 12425) >= 5
              && a4 != 12387)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_29710;
            goto LABEL_3850;
          }

          if (a3 != 37240)
          {
            if (a3 != 37266)
            {
              if (a3 != 37304) {
                return result;
              }
              if (a4 != 12377 && a4 != 12375) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2A09C;
              goto LABEL_3850;
            }

            if (a4 != 12417 && a4 != 12414) {
              return 0LL;
            }
            goto LABEL_2345;
          }

          if (a4 != 12387)
          {
LABEL_2668:
            int v41 = 12356;
LABEL_2669:
            if (a4 != v41) {
              return 0LL;
            }
          }

LABEL_2670:
          uint64_t v11 = (const __int32 *)&unk_28E1C;
          goto LABEL_3850;
        }

        if (a3 <= 37618)
        {
          if (a3 == 37325)
          {
            if (a4 == 12397 || a4 == 12394)
            {
              uint64_t v11 = (const __int32 *)&unk_298C4;
              goto LABEL_3850;
            }

            if ((a4 - 12372) < 0xFFFFFFF7 || (a4 & 1) == 0)
            {
              if ((a4 - 12373) > 8)
              {
                if (a4 != 12356) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }
            }

            goto LABEL_3841;
          }

          if (a3 != 37327)
          {
            if (a3 != 37347) {
              return result;
            }
LABEL_817:
            goto LABEL_1567;
          }

          goto LABEL_1226;
        }

        if (a3 != 37619)
        {
          if (a3 == 37723)
          {
            if (a4 == 12360)
            {
              uint64_t v11 = (const __int32 *)&unk_29DAC;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 38263) {
            return result;
          }
          if (a4 != 12369)
          {
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28CD8;
            goto LABEL_3850;
          }

          goto LABEL_3281;
        }

        if ((a4 - 12425) >= 5)
        {
LABEL_3189:
          if (a4 != 12387) {
            return 0LL;
          }
        }

        goto LABEL_3777;
      }

      if (a3 > 38971)
      {
        if (a3 <= 39365)
        {
          if (a3 > 39164)
          {
            if (a3 <= 39320)
            {
              switch(a3)
              {
                case 39165:
                  if (a4 == 12365)
                  {
                    uint64_t v11 = (const __int32 *)&unk_289E8;
                    goto LABEL_3850;
                  }

                  return 0LL;
                case 39166:
                  uint64_t v11 = (const __int32 *)&unk_28CBC;
                  break;
                case 39178:
                  uint64_t v11 = (const __int32 *)&unk_2A424;
                  break;
                default:
                  return result;
              }

              goto LABEL_3850;
            }

            if (a3 == 39321)
            {
              if ((a4 - 12425) < 5 || a4 == 12387)
              {
                uint64_t v11 = (const __int32 *)&unk_28F24;
                goto LABEL_3850;
              }

              if (a4 == 12375)
              {
                uint64_t v11 = (const __int32 *)&unk_295C4;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 == 39336)
            {
              uint64_t v11 = (const __int32 *)&unk_28F24;
              goto LABEL_3850;
            }

            if (a3 != 39348) {
              return result;
            }
            int v44 = 12428;
LABEL_1904:
            if (a4 != v44) {
              return 0LL;
            }
            goto LABEL_1905;
          }

          if (a3 <= 39134)
          {
            if (a3 != 38972)
            {
              if (a3 == 39000)
              {
                uint64_t v11 = (const __int32 *)&unk_2907C;
                goto LABEL_3850;
              }

              if (a3 == 39131)
              {
                uint64_t result = 0LL;
                if ((a4 - 12400) <= 0x23 && ((1LL << (a4 - 112)) & 0x800001249LL) != 0)
                {
                  wcscpy(a2, (const __int32 *)&unk_28E5C);
                  if (a4 == 12400) {
                    return 2LL;
                  }
                  else {
                    return 1LL;
                  }
                }
              }

              return result;
            }

            uint64_t result = 0LL;
            char v73 = a4 - 99;
            if (((1LL << v73) & 0x7C000000001LL) == 0)
            {
              if (((1LL << v73) & 0x10000F8000000LL) == 0) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_28F5C;
              goto LABEL_3850;
            }

            goto LABEL_2419;
          }

          if (a3 != 39135)
          {
            if (a3 != 39154)
            {
              if (a3 != 39164) {
                return result;
              }
LABEL_1072:
              wcscpy(a2, (const __int32 *)&unk_28DF4);
              int v40 = 12431;
              goto LABEL_2817;
            }

            goto LABEL_1718;
          }

          uint64_t result = 0LL;
          if (a4 > 12386)
          {
            if (a4 > 12424)
            {
              if (a4 != 12431 && a4 != 12425) {
                return result;
              }
            }

            else if (a4 != 12387)
            {
              if (a4 != 12409) {
                return result;
              }
              goto LABEL_3281;
            }
          }

          else if ((a4 - 12356) >= 7)
          {
            return result;
          }

          uint64_t v11 = (const __int32 *)&unk_28EA0;
          goto LABEL_3850;
        }

        if (a3 > 39639)
        {
          if (a3 <= 40179)
          {
            if (a3 == 39640)
            {
              if ((a4 - 12363) > 8)
              {
                uint64_t result = 0LL;
                if ((a4 - 12356) > 0x3D
                  || ((1LL << (a4 - 68)) & 0x2400000002220001LL) == 0)
                {
                  return result;
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_295D8;
              goto LABEL_3850;
            }

            if (a3 != 39729)
            {
              if (a3 != 39854) {
                return result;
              }
              if (a4 != 12420) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29BB0;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            if ((a4 - 12364) <= 8 && (a4 & 1) == 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2A52C;
              goto LABEL_3850;
            }

            return result;
          }

          if (a3 == 40180)
          {
            int v14 = (const __int32 *)&unk_28B84;
            goto LABEL_2816;
          }

          if (a3 == 40599)
          {
            if (a4 == 12375)
            {
              uint64_t v11 = (const __int32 *)&unk_2A49C;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 40665) {
            return result;
          }
          if ((a4 - 12380) >= 0xFFFFFFFB && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_2A35C;
            goto LABEL_3850;
          }
        }

        else
        {
          if (a3 <= 39448)
          {
            if (a3 == 39366)
            {
              int v75 = 12369;
              goto LABEL_2826;
            }

            if (a3 == 39368)
            {
              int v31 = 12369;
LABEL_1918:
              if (a4 != v31) {
                return 0LL;
              }
              goto LABEL_1919;
            }

            if (a3 != 39442) {
              return result;
            }
            if ((a4 - 12364) <= 8)
            {
              if ((a4 & 1) != 0) {
                return 0LL;
              }
              goto LABEL_3077;
            }

            int v64 = 12356;
LABEL_3076:
            if (a4 != v64) {
              return 0LL;
            }
LABEL_3077:
            uint64_t v11 = (const __int32 *)&unk_29A3C;
            goto LABEL_3850;
          }

          if (a3 != 39449)
          {
            if (a3 == 39472)
            {
              uint64_t v11 = (const __int32 *)&unk_29AC8;
              goto LABEL_3850;
            }

            if (a3 != 39514) {
              return result;
            }
            if (a4 != 12363)
            {
              if ((a4 - 12363) > 8)
              {
                if (a4 != 12356) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_29298;
              goto LABEL_3850;
            }

            uint64_t v16 = (const __int32 *)&unk_29298;
            goto LABEL_3770;
          }

          uint64_t result = 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_2A368;
        goto LABEL_3850;
      }

      if (a3 <= 38597)
      {
        if (a3 <= 38476)
        {
          if (a3 > 38449)
          {
            switch(a3)
            {
              case 38450:
                uint64_t v11 = (const __int32 *)&unk_2A2F8;
                break;
              case 38459:
                uint64_t v11 = (const __int32 *)&unk_29C08;
                break;
              case 38463:
                if (a4 == 12397)
                {
                  uint64_t v11 = (const __int32 *)&unk_28ADC;
                  goto LABEL_3850;
                }

                if (a4 != 12427) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_28ACC;
                break;
              default:
                return result;
            }

            goto LABEL_3850;
          }

          if (a3 == 38281)
          {
            int v12 = 12376;
            goto LABEL_2329;
          }

          if (a3 == 38283) {
            goto LABEL_891;
          }
          if (a3 != 38306) {
            return result;
          }
          uint64_t result = 0LL;
          if (a4 > 12394)
          {
            if (a4 != 12395)
            {
              if (a4 != 12431) {
                return result;
              }
              goto LABEL_3065;
            }
          }

          else if (a4 != 12375 && a4 != 12377)
          {
            return result;
          }

          uint64_t v11 = (const __int32 *)&unk_28B24;
          goto LABEL_3850;
        }

        if (a3 > 38554)
        {
          if (a3 == 38555)
          {
            if (a4 != 12393 && a4 != 12384) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29674;
            goto LABEL_3850;
          }

          if (a3 != 38560)
          {
            if (a3 != 38597) {
              return result;
            }
            if (a4 != 12420) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_28E48;
            goto LABEL_3850;
          }

          if (a4 == 12428 || (a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_28C8C;
            goto LABEL_3850;
          }

          uint64_t result = 0LL;
          if ((a4 - 12387) <= 0x2A && ((1LL << (a4 - 99)) & 0x5C000000001LL) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_28C98;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 == 38477)
        {
          uint64_t v76 = 2LL;
          switch(a4)
          {
            case 12425:
            case 12427:
            case 12428:
              goto LABEL_3591;
            case 12426:
              int v77 = *(_DWORD *)(a6 + 8);
              if ((v77 - 12383) <= 0x2C && ((1LL << (v77 - 95)) & 0x120000000081LL) != 0)
              {
                uint64_t v76 = 1LL;
LABEL_2452:
                wcscpy(a2, (const __int32 *)&unk_28D54);
                uint64_t result = v76;
              }

              else
              {
                if (v77 == 27880)
                {
LABEL_3591:
                  uint64_t v11 = (const __int32 *)&unk_28AA4;
                  goto LABEL_3850;
                }

LABEL_3856:
                uint64_t result = 0LL;
                if ((a5 - 12391) <= 0x22 && ((1LL << (a5 - 103)) & 0x400001001LL) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_28D54;
                  goto LABEL_3850;
                }
              }

              break;
            case 12429:
              goto LABEL_2452;
            default:
              goto LABEL_3856;
          }

          return result;
        }

        if (a3 != 38500)
        {
          if (a3 == 38501)
          {
            uint64_t result = 0LL;
            uint64_t v25 = (a4 - 12387);
            if (v25 <= 0x2A)
            {
              if (((1LL << (a4 - 99)) & 0x5C000000001LL) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29008;
              }

              else
              {
                if (v25 != 41) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_28FF4;
              }

              goto LABEL_3850;
            }
          }

          return result;
        }

        goto LABEL_1663;
      }

      if (a3 > 38685)
      {
        if (a3 <= 38749)
        {
          switch(a3)
          {
            case 38686:
              uint64_t v11 = (const __int32 *)&unk_28E24;
              break;
            case 38706:
              if (a4 != 12431) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2947C;
              break;
            case 38745:
              uint64_t v11 = (const __int32 *)&unk_29B20;
              break;
            default:
              return result;
          }

          goto LABEL_3850;
        }

        if (a3 != 38750)
        {
          if (a3 == 38911)
          {
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_29288;
            goto LABEL_3850;
          }

          if (a3 != 38928) {
            return result;
          }
          if (a4 != 12369 && a4 != 12363) {
            return 0LL;
          }
          goto LABEL_3070;
        }

        if (a4 != 12378) {
          return 0LL;
        }
        goto LABEL_2778;
      }

      if (a3 > 38626)
      {
        if (a3 != 38627)
        {
          if (a3 == 38642)
          {
            uint64_t v11 = (const __int32 *)&unk_28CA4;
          }

          else
          {
            if (a3 != 38663) {
              return result;
            }
            if (a4 != 12360) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29498;
          }

          goto LABEL_3850;
        }

        uint64_t result = 0LL;
        if (a4 > 12372)
        {
          if (a4 == 12373)
          {
            uint64_t v11 = (const __int32 *)&unk_29F60;
          }

          else
          {
            if (a4 != 12375) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_29F70;
          }

          goto LABEL_3850;
        }

        if (a4 == 12356 || a4 == 12367)
        {
          uint64_t v11 = (const __int32 *)&unk_294A4;
          goto LABEL_3850;
        }

        return result;
      }

      if (a3 == 38598)
      {
        if ((a4 - 12356) < 7 || a4 == 12431 || a4 == 12387)
        {
          uint64_t v11 = (const __int32 *)&unk_29894;
          goto LABEL_3850;
        }

        if ((a4 - 12414) <= 4)
        {
          uint64_t v11 = (const __int32 *)&unk_298A4;
          goto LABEL_3850;
        }

        return 0LL;
      }

      if (a3 == 38614)
      {
        if (a4 != 12418) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_2A568;
        goto LABEL_3850;
      }

      if (a3 != 38626) {
        return result;
      }
      if (a4 != 12428) {
        return 0LL;
      }
      goto LABEL_2851;
    }

    if (a3 <= 35468)
    {
      if (a3 <= 35210)
      {
        if (a3 <= 34393)
        {
          if (a3 <= 33975)
          {
            if (a3 <= 33852)
            {
              if (a3 == 33618)
              {
                if (a4 != 12435)
                {
                  if (a4 == 12428) {
                    goto LABEL_1701;
                  }
                  if (a4 != 12416) {
                    return 0LL;
                  }
                }

                uint64_t v11 = (const __int32 *)&unk_295A8;
                goto LABEL_3850;
              }

              if (a3 == 33804)
              {
                if (a4 != 12360) {
                  return 0LL;
                }
                goto LABEL_2249;
              }

              if (a3 != 33806) {
                return result;
              }
              if (a4 == 12403)
              {
                uint64_t v11 = (const __int32 *)&unk_28BB4;
                goto LABEL_3850;
              }

              if (a4 != 12360)
              {
                if ((a4 - 12414) > 2)
                {
                  if (a4 == 12428)
                  {
                    uint64_t v11 = (const __int32 *)&unk_28BD0;
                    goto LABEL_3850;
                  }

                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_28BC0;
                goto LABEL_3850;
              }

LABEL_1905:
              uint64_t v11 = (const __int32 *)&unk_28B84;
              goto LABEL_3850;
            }

            if (a3 == 33853)
            {
              if (a4 != 12392 && a4 != 12385) {
                return 0LL;
              }
              goto LABEL_3769;
            }

            if (a3 != 33879)
            {
              if (a3 != 33900) {
                return result;
              }
              if ((a4 - 12425) < 5 || a4 == 12387)
              {
                uint64_t v11 = (const __int32 *)&unk_29C60;
                goto LABEL_3850;
              }

              return 1LL;
            }

            if (a4 == 12375)
            {
              uint64_t v11 = (const __int32 *)&unk_29E20;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
LABEL_3038:
            uint64_t v11 = (const __int32 *)&unk_29488;
            goto LABEL_3850;
          }

          if (a3 <= 34179)
          {
            if (a3 != 33976)
            {
              if (a3 == 33988)
              {
                if (a4 == 12360)
                {
LABEL_2902:
                  uint64_t v11 = (const __int32 *)&unk_29DF8;
                  goto LABEL_3850;
                }

                return 0LL;
              }

              if (a3 != 34065) {
                return result;
              }
              if ((a4 - 12414) >= 5 && a4 != 12435)
              {
                if (a4 == 12429)
                {
                  uint64_t v11 = (const __int32 *)&unk_2A1A8;
                  goto LABEL_3850;
                }

                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_2A1C0;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28AC4;
              goto LABEL_3850;
            }

            return result;
          }

          if (a3 == 34180)
          {
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12373 && a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_2A024;
            goto LABEL_3850;
          }

          if (a3 != 34214)
          {
            if (a3 != 34384) {
              return result;
            }
            if (a4 == 12417)
            {
              uint64_t v11 = (const __int32 *)&unk_29140;
              goto LABEL_3850;
            }

            if (a4 != 12370) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29130;
            goto LABEL_3850;
          }

          goto LABEL_1565;
        }

        if (a3 > 35009)
        {
          if (a3 > 35185)
          {
            if (a3 == 35186)
            {
              uint64_t v11 = (const __int32 *)&unk_28B8C;
              goto LABEL_3850;
            }

            if (a3 != 35201)
            {
              if (a3 != 35206) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_292B8;
              goto LABEL_3850;
            }

            int v14 = (const __int32 *)&unk_28B38;
            goto LABEL_2816;
          }

          if (a3 == 35010)
          {
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            goto LABEL_3131;
          }

          if (a3 == 35036)
          {
            uint64_t v11 = (const __int32 *)&unk_2A1FC;
            goto LABEL_3850;
          }

          if (a3 != 35090) {
            return result;
          }
          if (a4 != 12417) {
            return 0LL;
          }
          goto LABEL_725;
        }

        if (a3 > 34927)
        {
          if (a3 == 34928)
          {
            if (a4 == 12360)
            {
              uint64_t v11 = (const __int32 *)&unk_29AA8;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 == 34987)
          {
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2A0D4;
            }

            else
            {
              uint64_t v11 = (const __int32 *)&unk_2A0E4;
            }

            goto LABEL_3850;
          }

          if (a3 != 35009) {
            return result;
          }
          if ((a4 - 12363) <= 8)
          {
LABEL_2053:
            if ((a4 & 1) == 0) {
              return 0LL;
            }
            goto LABEL_2867;
          }

          if (a4 != 12390)
          {
LABEL_2866:
            if (a4 != 12356) {
              return 0LL;
            }
LABEL_2867:
            uint64_t v11 = (const __int32 *)&unk_29664;
            goto LABEL_3850;
          }

          goto LABEL_1487;
        }

        if (a3 == 34394)
        {
          if (a4 == 12429) {
            goto LABEL_2840;
          }
          if (a4 != 12375) {
            return 0LL;
          }
          goto LABEL_3062;
        }

        if (a3 != 34892)
        {
          if (a3 != 34920) {
            return result;
          }
          if (a4 != 12428)
          {
            if (a4 == 12431) {
              goto LABEL_2904;
            }
            uint64_t result = 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_29488;
          goto LABEL_3850;
        }

        uint64_t result = 0LL;
        if (a4 <= 12386)
        {
          goto LABEL_1858;
        }

        if (a4 == 12431)
        {
LABEL_1858:
          uint64_t v11 = (const __int32 *)&unk_295B4;
          goto LABEL_3850;
        }

        if (a4 != 12394)
        {
          if (a4 != 12387) {
            return result;
          }
          if (a5 == 12434) {
            goto LABEL_1858;
          }
LABEL_3777:
          uint64_t v11 = (const __int32 *)&unk_28B38;
          goto LABEL_3850;
        }

LABEL_301:
        uint64_t v11 = (const __int32 *)&unk_290D0;
        goto LABEL_3850;
      }

      if (a3 <= 35369)
      {
        if (a3 > 35327)
        {
          if (a3 > 35341)
          {
            if (a3 != 35342)
            {
              if (a3 == 35351)
              {
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_29530;
                  goto LABEL_3850;
                }
              }

              else if (a3 == 35352)
              {
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_28C4C;
                  goto LABEL_3850;
                }
              }

              return result;
            }

            goto LABEL_1549;
          }

          if (a3 != 35328)
          {
            if (a3 != 35336)
            {
              if (a3 != 35338) {
                return result;
              }
LABEL_647:
              if (a4 != 12397) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29A98;
              goto LABEL_3850;
            }

            goto LABEL_1226;
          }

          uint64_t result = 0LL;
          if (a4 > 12377)
          {
            if (a4 == 12378)
            {
              uint64_t v11 = (const __int32 *)&unk_28BA8;
              goto LABEL_3850;
            }

            if (a4 != 12431)
            {
              if (a4 != 12387) {
                return result;
              }
              goto LABEL_1791;
            }
          }

          else if ((a4 - 12356) >= 7)
          {
            return result;
          }

          goto LABEL_3777;
        }

        if (a3 > 35241)
        {
          if (a3 == 35242)
          {
            if (a4 == 12375)
            {
              uint64_t v11 = (const __int32 *)&unk_29A70;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 35299)
          {
            if (a3 != 35302) {
              return result;
            }
            uint64_t result = 0LL;
            uint64_t v38 = (a4 - 12387);
            if (((1LL << (a4 - 99)) & 0x5C000000001LL) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_29A3C;
              goto LABEL_3850;
            }

            if (v38 != 41) {
              return result;
            }
            goto LABEL_3720;
          }

          if (a4 == 12356 || (a4 - 12363) <= 8)
          {
            uint64_t v11 = (const __int32 *)&unk_28E5C;
            goto LABEL_3850;
          }

          uint64_t result = 0LL;
          uint64_t v97 = (a4 - 12387);
          if (((1LL << (a4 - 99)) & 0x5C000000001LL) == 0)
          {
            if (v97 != 41) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_28E64;
            goto LABEL_3850;
          }

LABEL_2639:
          uint64_t v11 = (const __int32 *)&unk_28E74;
          goto LABEL_3850;
        }

        if (a3 == 35211)
        {
          if ((a4 - 12425) < 5
            || (uint64_t result = 0LL, (a4 - 12356) <= 0x22)
            && ((1LL << (a4 - 68)) & 0x408000011LL) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_29438;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 != 35223)
        {
          if (a3 != 35226) {
            return result;
          }
          if (a4 != 12417 && a4 != 12414)
          {
            if (a4 != 12360) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_28F40;
            goto LABEL_3850;
          }

          goto LABEL_2345;
        }

LABEL_1663:
        if ((a4 - 12363) > 8)
        {
          if (a4 != 12356) {
            return 0LL;
          }
        }

        else if ((a4 & 1) == 0)
        {
          return 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_29948;
        goto LABEL_3850;
      }

      if (a3 <= 35426)
      {
        if (a3 <= 35379)
        {
          switch(a3)
          {
            case 35370:
              if (a4 == 12428)
              {
                uint64_t v11 = (const __int32 *)&unk_2A2BC;
                goto LABEL_3850;
              }

              if (a4 == 12397)
              {
                uint64_t v11 = (const __int32 *)&unk_29A98;
                goto LABEL_3850;
              }

              return 0LL;
            case 35373:
              if (a4 != 12369) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2938C;
              goto LABEL_3850;
            case 35377:
              uint64_t result = 0LL;
              if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_291A0;
                goto LABEL_3850;
              }

              break;
          }

          return result;
        }

        if (a3 == 35380)
        {
          if (a4 == 12360)
          {
            uint64_t v11 = (const __int32 *)&unk_29C24;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 == 35388)
        {
          uint64_t result = 0LL;
          if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_299F0;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 != 35424) {
          return result;
        }
        goto LABEL_1176;
      }

      if (a3 <= 35439)
      {
        if (a3 == 35427)
        {
          if (a4 == 12391)
          {
            uint64_t v11 = (const __int32 *)&unk_2938C;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 35430)
        {
          if (a3 != 35435) {
            return result;
          }
          int v27 = 12403;
LABEL_3094:
          if (a4 != v27) {
            return 0LL;
          }
          goto LABEL_3095;
        }

        if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
        {
          uint64_t v11 = (const __int32 *)&unk_29768;
          goto LABEL_3850;
        }

        if (a4 != 12415) {
          return 0LL;
        }
        goto LABEL_3251;
      }

      if (a3 == 35440)
      {
        uint64_t v11 = (const __int32 *)&unk_29114;
        goto LABEL_3850;
      }

      if (a3 != 35441)
      {
        if (a3 != 35465) {
          return result;
        }
        if (a4 == 12363 || a4 == 12369) {
          goto LABEL_3070;
        }
        if (a4 != 12428) {
          return 0LL;
        }
        goto LABEL_3069;
      }

      uint64_t result = 0LL;
LABEL_2851:
      uint64_t v11 = (const __int32 *)&unk_2A290;
      goto LABEL_3850;
    }

    if (a3 <= 36059)
    {
      if (a3 > 35616)
      {
        if (a3 > 35702)
        {
          switch(a3)
          {
            case 36011:
              if (a5 == 23556 || a5 == 12426) {
                goto LABEL_1309;
              }
              uint64_t v11 = (const __int32 *)&unk_29018;
              goto LABEL_3850;
            case 36012:
              if (a4 != 12417) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29150;
              goto LABEL_3850;
            case 36013:
            case 36014:
            case 36016:
            case 36017:
            case 36018:
            case 36019:
            case 36020:
            case 36021:
            case 36025:
            case 36026:
              return result;
            case 36015:
              if (a4 == 12360) {
                goto LABEL_2902;
              }
              if (a4 != 12417 && a4 != 12414) {
                return 0LL;
              }
              goto LABEL_2974;
            case 36022:
              uint64_t v11 = (const __int32 *)&unk_2A58C;
              goto LABEL_3850;
            case 36023:
              goto LABEL_1072;
            case 36024:
              uint64_t result = 0LL;
              return result;
            case 36027:
              if (a4 != 12420) {
                return 0LL;
              }
              uint64_t v16 = (const __int32 *)&unk_29E68;
              goto LABEL_3770;
            case 36028:
              goto LABEL_2884;
            default:
              if (a3 == 35703) {
                goto LABEL_1735;
              }
              if (a3 != 36000) {
                return result;
              }
              uint64_t result = 0LL;
              goto LABEL_2666;
          }
        }

        if (a3 != 35617)
        {
          if (a3 == 35641)
          {
            uint64_t v11 = (const __int32 *)&unk_291C4;
          }

          else
          {
            if (a3 != 35698) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_29A1C;
          }

          goto LABEL_3850;
        }

        goto LABEL_970;
      }

      if (a3 <= 35499)
      {
        if (a3 <= 35479)
        {
          switch(a3)
          {
            case 35469:
              if (a4 == 12417)
              {
                uint64_t v11 = (const __int32 *)&unk_29F9C;
                goto LABEL_3850;
              }

              return 0LL;
            case 35473:
              if (a4 == 12363)
              {
                uint64_t v11 = (const __int32 *)&unk_2A5B8;
                goto LABEL_3850;
              }

              return 0LL;
            case 35475:
              if ((a4 - 12356) < 7
                || (uint64_t result = 0LL, (a4 - 12387) <= 0x2C)
                && ((1LL << (a4 - 99)) & 0x104000000001LL) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29B08;
                goto LABEL_3850;
              }

              break;
          }

          return result;
        }

        if (a3 == 35480)
        {
          if ((a4 - 12372) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_29214;
          }

          else
          {
            uint64_t v11 = (const __int32 *)&unk_2A3B4;
          }

          goto LABEL_3850;
        }

        if (a3 != 35486)
        {
          if (a3 != 35492) {
            return result;
          }
          uint64_t v11 = (const __int32 *)&unk_28E0C;
          goto LABEL_3850;
        }

        goto LABEL_2718;
      }

      if (a3 > 35530)
      {
        if (a3 > 35557)
        {
          if (a3 == 35558)
          {
            if (a4 == 12417)
            {
              uint64_t v11 = (const __int32 *)&unk_29E84;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 35586) {
            return result;
          }
          if (a4 != 12428) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_28BDC;
          goto LABEL_3850;
        }

        if (a3 != 35531)
        {
          if (a3 != 35533) {
            return result;
          }
          if (a4 != 12356) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_2A57C;
          goto LABEL_3850;
        }

        if (a4 != 12369) {
          return 0LL;
        }
LABEL_1551:
        uint64_t v11 = (const __int32 *)&unk_29708;
        goto LABEL_3850;
      }

      if (a3 == 35500)
      {
LABEL_1705:
        if (a4 == 12363 || a4 == 12356)
        {
          uint64_t v16 = (const __int32 *)&unk_28E5C;
          goto LABEL_3770;
        }

        uint64_t result = 0LL;
        goto LABEL_2907;
      }

      if (a3 != 35501)
      {
        if (a3 != 35519) {
          return result;
        }
        if (a4 != 12409) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_29E44;
        goto LABEL_3850;
      }

LABEL_1176:
      if ((a4 - 12414) >= 5)
      {
        int v91 = 12435;
        goto LABEL_2917;
      }

LABEL_1177:
      uint64_t v11 = (const __int32 *)&unk_28C70;
      goto LABEL_3850;
    }

    if (a3 <= 36338)
    {
      if (a3 <= 36117)
      {
        if (a3 <= 36073)
        {
          if (a3 == 36060)
          {
            if (a4 == 12360)
            {
              uint64_t v11 = (const __int32 *)&unk_29790;
              goto LABEL_3850;
            }

            return 0LL;
          }

          int v29 = 36068;
          goto LABEL_1598;
        }

        if (a3 == 36074)
        {
LABEL_1702:
          uint64_t result = 0LL;
          goto LABEL_1704;
        }

        if (a3 != 36092)
        {
          if (a3 != 36104) {
            return result;
          }
LABEL_873:
          goto LABEL_1754;
        }
      }

      else
      {
        if (a3 > 36228)
        {
          if (a3 != 36229 && a3 != 36234)
          {
            if (a3 != 36275) {
              return result;
            }
            if ((a4 - 12425) <= 4)
            {
              uint64_t v16 = (const __int32 *)&unk_2936C;
              goto LABEL_3770;
            }

            uint64_t result = 0LL;
LABEL_2974:
            uint64_t v11 = (const __int32 *)&unk_2936C;
            goto LABEL_3850;
          }

          goto LABEL_2101;
        }

        if (a3 != 36118)
        {
          if (a3 == 36208)
          {
            if (a5 == 23567 || a5 == 16488) {
              uint64_t v11 = (const __int32 *)&unk_29C70;
            }
            else {
              uint64_t v11 = (const __int32 *)&unk_29C80;
            }
            goto LABEL_3850;
          }

          if (a3 != 36215) {
            return result;
          }
          if (a4 <= 12424)
          {
            if (a4 == 12365 || a4 == 12371) {
              goto LABEL_3769;
            }
            if (a4 == 12387) {
              goto LABEL_301;
            }
          }

          else if ((a4 - 12425) < 5)
          {
            goto LABEL_301;
          }

          uint64_t result = 0LL;
          goto LABEL_301;
        }
      }

      uint64_t v11 = (const __int32 *)&unk_29504;
      goto LABEL_3850;
    }

    if (a3 <= 36492)
    {
      if (a3 > 36366)
      {
        if (a3 == 36367)
        {
          wcscpy(a2, (const __int32 *)&unk_28AA4);
          int v40 = 12414;
          goto LABEL_2817;
        }

        if (a3 == 36466)
        {
          uint64_t v11 = (const __int32 *)&unk_2A5CC;
          goto LABEL_3850;
        }

        if (a3 != 36468) {
          return result;
        }
LABEL_2458:
        uint64_t v11 = (const __int32 *)&unk_2988C;
        goto LABEL_3850;
      }

      if (a3 == 36339)
      {
        uint64_t result = 0LL;
        switch(a4)
        {
          case 12397:
            goto LABEL_2884;
          case 12398:
          case 12399:
          case 12401:
          case 12402:
          case 12404:
          case 12405:
            return result;
          case 12400:
          case 12403:
          case 12406:
            goto LABEL_3675;
          default:
            break;
        }

        return result;
      }

      if (a3 != 36362) {
        return result;
      }
    }

    else
    {
      if (a3 > 36636)
      {
        if (a3 == 36637)
        {
          uint64_t v11 = (const __int32 *)&unk_290DC;
          goto LABEL_3850;
        }

        if (a3 == 36706) {
          goto LABEL_1441;
        }
        if (a3 != 36766) {
          return result;
        }
        if (a4 != 12417) {
          return 0LL;
        }
        goto LABEL_1242;
      }

      if (a3 != 36493)
      {
        if (a3 != 36578)
        {
          if (a3 != 36605) {
            return result;
          }
          if ((a4 - 12356) > 0x19 || ((1 << (a4 - 68)) & 0x2022881) == 0)
          {
            if (a4 == 12435)
            {
              uint64_t v11 = (const __int32 *)&unk_293A4;
              goto LABEL_3850;
            }

            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_29398;
          goto LABEL_3850;
        }

        if ((a4 - 12364) > 8)
        {
        }

        else if ((a4 & 1) != 0)
        {
          if (a4 == 12369) {
            goto LABEL_2102;
          }
LABEL_3728:
          if ((a4 & 0xFFFFFFFD) == 0x3058)
          {
            uint64_t v11 = (const __int32 *)&unk_29E94;
            goto LABEL_3850;
          }

          return 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_296B8;
        goto LABEL_3850;
      }
    }

    uint64_t v11 = (const __int32 *)&unk_28BF8;
    goto LABEL_3850;
  }

  if (a3 > 23499)
  {
    if (a3 > 25306)
    {
      if (a3 <= 25829)
      {
        if (a3 > 25495)
        {
          if (a3 > 25561)
          {
            if (a3 <= 25665)
            {
              if (a3 > 25612)
              {
                if (a3 <= 25657)
                {
                  if (a3 != 25613)
                  {
                    int v10 = 25620;
                    goto LABEL_707;
                  }

                  uint64_t result = 0LL;
                  if (a4 <= 12386)
                  {
                    goto LABEL_2295;
                  }

                  if (a4 > 12396)
                  {
                    if (a4 != 12431)
                    {
                      int v93 = 12397;
                      goto LABEL_3745;
                    }
                  }

                  else if (a4 != 12387)
                  {
                    int v93 = 12394;
LABEL_3745:
                    if (a4 != v93) {
                      return result;
                    }
                    uint64_t v11 = (const __int32 *)&unk_29CE4;
                    goto LABEL_3850;
                  }

LABEL_2295:
                  uint64_t v11 = (const __int32 *)&unk_29CF0;
                  goto LABEL_3850;
                }

                if (a3 != 25658)
                {
                  if (a3 != 25662) {
                    return result;
                  }
                  goto LABEL_1789;
                }

                if (a4 != 12431 && a4 != 12360) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_29358;
                goto LABEL_3850;
              }

              if (a3 != 25562)
              {
                if (a3 != 25563)
                {
                  if (a3 != 25569) {
                    return result;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28F30;
                  goto LABEL_3850;
                }

                goto LABEL_1524;
              }

LABEL_1698:
              if (a4 != 12370)
              {
                int v45 = 12364;
                goto LABEL_1700;
              }

LABEL_1701:
              uint64_t v11 = (const __int32 *)&unk_289F0;
              goto LABEL_3850;
            }

            if (a3 > 25745)
            {
              if (a3 <= 25773)
              {
                if (a3 != 25746)
                {
                  if (a3 != 25771) {
                    return result;
                  }
                  int v22 = 12391;
LABEL_2152:
                  if (a4 != v22) {
                    return 0LL;
                  }
LABEL_3739:
                  uint64_t v11 = (const __int32 *)&unk_28B84;
                  goto LABEL_3850;
                }

LABEL_1116:
                uint64_t v11 = (const __int32 *)&unk_28FAC;
                goto LABEL_3850;
              }

              if (a3 != 25774)
              {
                if (a3 != 25793) {
                  return result;
                }
                if (a4 != 12377 && a4 != 12375) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_2A418;
                goto LABEL_3850;
              }

              if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
LABEL_2840:
                uint64_t v11 = (const __int32 *)&unk_28C08;
                goto LABEL_3850;
              }

              goto LABEL_2841;
            }

            if (a3 != 25666)
            {
              if (a3 != 25688)
              {
                if (a3 != 25731) {
                  return result;
                }
LABEL_1549:
                uint64_t result = 0LL;
                return result;
              }

              goto LABEL_1716;
            }

LABEL_2841:
            goto LABEL_2842;
          }

          if (a3 <= 25521)
          {
            switch(a3)
            {
              case 25496:
                goto LABEL_1661;
              case 25499:
                if (a4 != 12369) {
                  return 0LL;
                }
                if (a5 != 25163) {
                  goto LABEL_1919;
                }
                uint64_t v11 = (const __int32 *)&unk_28F68;
                break;
              case 25505:
                goto LABEL_2841;
              case 25506:
                uint64_t v11 = (const __int32 *)&unk_29D9C;
                break;
              case 25509:
                if (a4 != 12377 && a4 != 12375) {
                  return 0LL;
                }
                goto LABEL_1911;
              case 25511:
                int v52 = 12360;
                goto LABEL_1847;
              case 25512:
                goto LABEL_1607;
              default:
                return result;
            }

            goto LABEL_3850;
          }

          if (a3 <= 25538)
          {
            if (a3 != 25522)
            {
              if (a3 != 25524)
              {
                int v10 = 25531;
LABEL_707:
                if (a3 != v10) {
                  return result;
                }
                if ((a4 - 12363) <= 8)
                {
                  if ((a4 & 1) == 0) {
                    return 0LL;
                  }
                  goto LABEL_2048;
                }

                if (a4 == 12387)
                {
LABEL_2048:
                  uint64_t v11 = (const __int32 *)&unk_28DF4;
                  goto LABEL_3850;
                }

                goto LABEL_2047;
              }

              goto LABEL_2485;
            }

            int v23 = 12370;
            goto LABEL_2482;
          }

          if (a3 == 25539)
          {
            uint64_t v11 = (const __int32 *)&unk_29CC8;
            goto LABEL_3850;
          }

          if (a3 != 25551)
          {
            if (a3 != 25552) {
              return result;
            }
            if (a4 != 12370) {
              return 0LL;
            }
            goto LABEL_1391;
          }

LABEL_1722:
          if ((a4 - 12363) > 8)
          {
            if (a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) == 0)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_28E38;
          goto LABEL_3850;
        }

        if (a3 <= 25406)
        {
          if (a3 > 25344)
          {
            if (a3 <= 25374)
            {
              if (a3 == 25345)
              {
                uint64_t v11 = (const __int32 *)&unk_297B0;
                goto LABEL_3850;
              }

              if (a3 != 25351)
              {
                if (a3 == 25369) {
                  goto LABEL_1698;
                }
                return result;
              }

              goto LABEL_1529;
            }

            if (a3 != 25375)
            {
              if (a3 != 25391)
              {
                int v39 = 25405;
LABEL_1082:
                if (a3 != v39) {
                  return result;
                }
                goto LABEL_1441;
              }

              if ((a4 - 12425) >= 5)
              {
                int v65 = 12387;
                goto LABEL_2286;
              }

              goto LABEL_3720;
            }

            uint64_t v16 = (const __int32 *)&unk_29230;
LABEL_3770:
            wcscpy(a2, v16);
            return 2LL;
          }

          if (a3 > 25323)
          {
            if (a3 == 25324)
            {
              uint64_t v11 = (const __int32 *)&unk_28F74;
              goto LABEL_3850;
            }

            if (a3 != 25325)
            {
              if (a3 != 25342) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_29518;
              goto LABEL_3850;
            }

            if ((a4 - 12356) < 7 || a4 == 12431 || a4 == 12387)
            {
              uint64_t v11 = (const __int32 *)&unk_29A2C;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            goto LABEL_3720;
          }

          if (a3 == 25307)
          {
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_29994;
            goto LABEL_3850;
          }

          if (a3 != 25309) {
            return result;
          }
          if ((a4 - 12380) < 0xFFFFFFFB || (a4 & 1) == 0)
          {
            uint64_t v11 = (const __int32 *)&unk_29FEC;
            goto LABEL_3850;
          }

LABEL_2553:
          uint64_t v11 = (const __int32 *)&unk_29F84;
          goto LABEL_3850;
        }

        if (a3 > 25446)
        {
          if (a3 <= 25465)
          {
            switch(a3)
            {
              case 25447:
                if (a4 != 12370) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_29744;
                goto LABEL_3850;
              case 25448:
                int v21 = 12390;
                break;
              case 25454:
                int v21 = 12360;
                break;
              default:
                return result;
            }

            goto LABEL_1940;
          }

          if (a3 != 25466)
          {
            if (a3 == 25467)
            {
              uint64_t v11 = (const __int32 *)&unk_29FB4;
            }

            else
            {
              if (a3 != 25475) {
                return result;
              }
LABEL_1231:
              uint64_t v11 = (const __int32 *)&unk_28E5C;
            }

            goto LABEL_3850;
          }

LABEL_1607:
          uint64_t result = 0LL;
          wcscpy(a2, (const __int32 *)&unk_28D54);
          int v40 = 12373;
          goto LABEL_2817;
        }

        if (a3 > 25419)
        {
          if (a3 != 25420)
          {
            if (a3 != 25429)
            {
              if (a3 == 25436)
              {
                uint64_t result = 0LL;
                if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
                {
LABEL_1842:
                  uint64_t v11 = (const __int32 *)&unk_29C34;
                  goto LABEL_3850;
                }
              }

              return result;
            }

            char v61 = a4 - 99;
            if ((a4 - 12387) > 0x30)
            {
LABEL_1616:
              if (a4 != 12360) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2962C;
              goto LABEL_3850;
            }

            if (((1LL << v61) & 0x7C000000001LL) == 0)
            {
              if (((1LL << v61) & 0x10000F8000000LL) == 0) {
                goto LABEL_1616;
              }
LABEL_2662:
              uint64_t v11 = (const __int32 *)&unk_2942C;
              goto LABEL_3850;
            }

LABEL_2842:
            uint64_t v11 = (const __int32 *)&unk_28E5C;
            goto LABEL_3850;
          }

          goto LABEL_2866;
        }

        if (a3 != 25407)
        {
          if (a3 != 25417) {
            return result;
          }
          goto LABEL_1616;
        }

        if ((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
        {
          uint64_t v11 = (const __int32 *)&unk_29230;
          goto LABEL_3850;
        }

LABEL_2803:
        uint64_t v11 = (const __int32 *)&unk_28D78;
        goto LABEL_3850;
      }

      if (a3 <= 26291)
      {
        if (a3 <= 26027)
        {
          if (a3 <= 25944)
          {
            if (a3 <= 25914)
            {
              switch(a3)
              {
                case 25830:
                  uint64_t v11 = (const __int32 *)&unk_296AC;
                  break;
                case 25903:
                  if (a4 != 12360) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_29744;
                  break;
                case 25913:
                  if (a4 != 12417 && a4 != 12414) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_28EE8;
                  break;
                default:
                  return result;
              }

              goto LABEL_3850;
            }

            if (a3 != 25915)
            {
              if (a3 != 25918)
              {
                if (a3 != 25937) {
                  return result;
                }
                if ((a4 - 12356) < 7 || a4 == 12431 || a4 == 12387)
                {
                  uint64_t v11 = (const __int32 *)&unk_29164;
                  goto LABEL_3850;
                }

                goto LABEL_3366;
              }

              goto LABEL_1711;
            }

            if (a4 != 12417 && a4 != 12414) {
              return 0LL;
            }
LABEL_3640:
            uint64_t v11 = (const __int32 *)&unk_29150;
            goto LABEL_3850;
          }

          if (a3 <= 25967)
          {
            if (a3 == 25945)
            {
              if (a4 == 12431)
              {
                uint64_t v11 = (const __int32 *)&unk_28B8C;
                goto LABEL_3850;
              }

              if (a4 == 12360)
              {
                uint64_t v11 = (const __int32 *)&unk_2923C;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 != 25954)
            {
              if (a3 != 25955) {
                return result;
              }
              int v14 = (const __int32 *)&unk_28A54;
LABEL_2816:
              wcscpy(a2, v14);
              int v40 = 12425;
              goto LABEL_2817;
            }

            int v47 = 12360;
            goto LABEL_2514;
          }

          if (a3 == 25968)
          {
            if (a4 == 12360)
            {
              uint64_t v11 = (const __int32 *)&unk_29AB8;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 == 25972)
          {
            if ((a4 - 12356) < 7
              || (uint64_t result = 0LL, (a4 - 12387) <= 0x2C)
              && ((1LL << (a4 - 99)) & 0x104000000001LL) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_29AE8;
              goto LABEL_3850;
            }

            return result;
          }

          if (a3 != 25975) {
            return result;
          }
          if ((a4 - 12363) <= 8)
          {
            if ((a4 & 1) == 0) {
              return 0LL;
            }
            goto LABEL_2980;
          }

          int v84 = 12356;
          goto LABEL_2979;
        }

        if (a3 <= 26118)
        {
          if (a3 > 26044)
          {
            if (a3 != 26045)
            {
              if (a3 == 26088)
              {
                if ((a4 - 12372) < 0xFFFFFFF7 || (a4 & 1) == 0)
                {
                  if ((a4 - 12373) > 8)
                  {
                    if (a4 != 12356) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) == 0)
                  {
                    return 0LL;
                  }
                }

                uint64_t v11 = (const __int32 *)&unk_29750;
                goto LABEL_3850;
              }

              if (a3 != 26089) {
                return result;
              }
              if ((a4 - 12363) > 8)
              {
                if (a4 != 12414)
                {
LABEL_2976:
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }

LABEL_2977:
              uint64_t v11 = (const __int32 *)&unk_29C44;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2979C;
              goto LABEL_3850;
            }

            return result;
          }

          if (a3 != 26028)
          {
            if (a3 != 26029)
            {
              if (a3 != 26032) {
                return result;
              }
              if (a4 != 12383)
              {
                if (a4 != 12375) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_29A48;
                goto LABEL_3850;
              }

LABEL_2904:
              uint64_t v11 = (const __int32 *)&unk_2947C;
              goto LABEL_3850;
            }

            char v54 = a4 - 88;
            if ((a4 - 12376) <= 0x35)
            {
              if (((1LL << v54) & 0x3E000000000800LL) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29DC8;
                goto LABEL_3850;
              }

              if (((1LL << v54) & 0x40001) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29DD8;
                goto LABEL_3850;
              }
            }

LABEL_1547:
            goto LABEL_2974;
          }

LABEL_1552:
          if (a5 == 25613 || a5 == 22823) {
            uint64_t v11 = (const __int32 *)&unk_29B30;
          }
          else {
            uint64_t v11 = (const __int32 *)&unk_28A10;
          }
          goto LABEL_3850;
        }

        if (a3 <= 26193)
        {
          if (a3 != 26119)
          {
            if (a3 != 26126)
            {
              if (a3 != 26144) {
                return result;
              }
              if (a4 != 12360) {
                goto LABEL_1044;
              }
LABEL_2073:
              uint64_t v11 = (const __int32 *)&unk_28C44;
              goto LABEL_3850;
            }

            if (a4 == 12363)
            {
LABEL_1998:
              uint64_t v16 = (const __int32 *)&unk_289F0;
              goto LABEL_3770;
            }

            if ((a4 - 12372) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
LABEL_3022:
              uint64_t v11 = (const __int32 *)&unk_289F0;
              goto LABEL_3850;
            }

            if (a4 != 12425) {
              return 0LL;
            }
LABEL_3677:
            uint64_t v11 = (const __int32 *)&unk_2A264;
            goto LABEL_3850;
          }

          goto LABEL_1696;
        }

        if (a3 == 26194)
        {
          uint64_t result = 0LL;
          if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_296C4;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 == 26262)
        {
          if (a4 == 12363)
          {
            uint64_t v11 = (const __int32 *)&unk_29DB8;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 26286) {
          return result;
        }
LABEL_1429:
        uint64_t v16 = (const __int32 *)&unk_28EA0;
        goto LABEL_3770;
      }

      if (a3 <= 26409)
      {
        if (a3 <= 26376)
        {
          switch(a3)
          {
            case 26354:
              uint64_t result = 0LL;
              if (a4 <= 12424)
              {
                if (a4 == 12364 || a4 == 12370)
                {
                  uint64_t v11 = (const __int32 *)&unk_28FAC;
                  goto LABEL_3850;
                }

                if (a4 != 12387) {
                  return result;
                }
              }

              else if ((a4 - 12425) >= 5)
              {
                return result;
              }

              uint64_t v11 = (const __int32 *)&unk_292D8;
              goto LABEL_3850;
            case 26355:
              goto LABEL_1441;
            case 26356:
              if (a4 != 12369) {
                return 0LL;
              }
              goto LABEL_3591;
            case 26357:
            case 26358:
            case 26359:
            case 26361:
            case 26362:
            case 26363:
            case 26364:
            case 26365:
            case 26366:
              return result;
            case 26360:
              if ((a4 - 12363) > 8)
              {
                if (a4 != 12356) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }

              if (a5 != 25163 && a5 != 12365) {
                goto LABEL_2890;
              }
              uint64_t v11 = (const __int32 *)&unk_28F68;
              goto LABEL_3850;
            case 26367:
              goto LABEL_1524;
            case 26368:
              if (a4 != 12418) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29654;
              goto LABEL_3850;
            default:
              if (a3 == 26292)
              {
                if (a4 != 12428) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_2A2E8;
              }

              else
              {
                if (a3 != 26333) {
                  return result;
                }
                if ((a4 - 12373) > 8)
                {
                  if (a4 != 12369) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_296C4;
              }

              goto LABEL_3850;
          }
        }

        if (a3 <= 26394)
        {
          if (a3 != 26377)
          {
            if (a3 != 26391) {
              return result;
            }
            if (a4 != 12425) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_2A4F0;
            goto LABEL_3850;
          }

          goto LABEL_1522;
        }

        if (a3 != 26395)
        {
          if (a3 != 26399) {
            return result;
          }
          if (a4 != 12377 && a4 != 12375) {
            return 0LL;
          }
          goto LABEL_3218;
        }

LABEL_1690:
        uint64_t v11 = (const __int32 *)&unk_29948;
        goto LABEL_3850;
      }

      if (a3 <= 26892)
      {
        if (a3 <= 26542)
        {
          if (a3 == 26410)
          {
            if (a4 == 12384)
            {
              uint64_t v11 = (const __int32 *)&unk_2A304;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 26469)
          {
            if (a3 != 26524) {
              return result;
            }
            if (a4 != 12383)
            {
              uint64_t v11 = (const __int32 *)&unk_28DD0;
              goto LABEL_3850;
            }

            goto LABEL_2954;
          }

          uint64_t result = 0LL;
          uint64_t v55 = (a4 - 12394);
          if (((1LL << (a4 - 106)) & 0x480000005LL) == 0)
          {
            if (v55 != 33) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_28EA0;
            goto LABEL_3850;
          }

LABEL_2187:
          uint64_t v11 = (const __int32 *)&unk_28A20;
          goto LABEL_3850;
        }

        if (a3 == 26543)
        {
          if (a4 != 12428 && a4 != 12425) {
            return 0LL;
          }
          int v14 = (const __int32 *)&unk_28DF4;
          goto LABEL_2816;
        }

        if (a3 != 26579)
        {
          if (a3 != 26628) {
            return result;
          }
          if (a4 != 12360) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_28CCC;
          goto LABEL_3850;
        }

        if (a4 == 12414 || a4 == 12417)
        {
          uint64_t v11 = (const __int32 *)&unk_28A30;
          goto LABEL_3850;
        }

        if (a4 != 12415) {
          return 0LL;
        }
LABEL_3243:
        uint64_t v11 = (const __int32 *)&unk_2958C;
        goto LABEL_3850;
      }

      if (a3 <= 27082)
      {
        if (a3 != 26893)
        {
          if (a3 == 27005)
          {
            if (a4 != 12375) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_28F5C;
          }

          else
          {
            if (a3 != 27010) {
              return result;
            }
            if (a4 != 12397) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_28F14;
          }

          goto LABEL_3850;
        }

        if (a4 != 12431)
        {
          int v81 = 12360;
          goto LABEL_3265;
        }

LABEL_3266:
        uint64_t v11 = (const __int32 *)&unk_29708;
        goto LABEL_3850;
      }

      if (a3 == 27083)
      {
        if (a5 == 36523) {
          uint64_t v11 = (const __int32 *)&unk_29570;
        }
        else {
          uint64_t v11 = (const __int32 *)&unk_29580;
        }
        goto LABEL_3850;
      }

      if (a3 != 27169)
      {
        if (a3 != 27425) {
          return result;
        }
        goto LABEL_1503;
      }

      uint64_t result = 0LL;
LABEL_2249:
      uint64_t v11 = (const __int32 *)&unk_297B0;
      goto LABEL_3850;
    }

    if (a3 <= 24539)
    {
      if (a3 <= 24230)
      {
        if (a3 <= 23814)
        {
          if (a3 > 23562)
          {
            if (a3 <= 23612)
            {
              switch(a3)
              {
                case 23563:
                  goto LABEL_647;
                case 23566:
                  if ((a4 - 12363) > 8)
                  {
                    if (a4 != 12356) {
                      return 0LL;
                    }
                  }

                  else if ((a4 & 1) == 0)
                  {
                    return 0LL;
                  }

                  uint64_t v11 = (const __int32 *)&unk_29F3C;
                  goto LABEL_3850;
                case 23567:
                  if (a4 != 12373) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_29970;
                  goto LABEL_3850;
                case 23569:
                  if (a4 != 12394)
                  {
                    int v34 = 12375;
                    goto LABEL_1768;
                  }

                  uint64_t v11 = (const __int32 *)&unk_29164;
                  break;
                default:
                  return result;
              }

              goto LABEL_3850;
            }

            if (a3 != 23613)
            {
              if (a3 != 23624)
              {
                if (a3 != 23626) {
                  return result;
                }
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_29F50;
                goto LABEL_3850;
              }

              uint64_t v11 = (const __int32 *)&unk_29314;
              goto LABEL_3850;
            }

            if ((a4 & 0xFFFFFFFD) == 0x304D)
            {
              uint64_t v16 = (const __int32 *)&unk_28A64;
            }

            else
            {
              uint64_t result = 0LL;
              uint64_t v16 = (const __int32 *)&unk_29690;
            }

            goto LABEL_3770;
          }

          if (a3 > 23516)
          {
            if (a3 == 23517)
            {
              if (a4 != 12363) {
                return 0LL;
              }
              uint64_t v16 = (const __int32 *)&unk_28A84;
              goto LABEL_3770;
            }

            if (a3 == 23519)
            {
LABEL_1044:
              if (((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
                && (a4 - 12425) >= 5
                && a4 != 12387)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_28C08;
              goto LABEL_3850;
            }

            if (a3 != 23556) {
              return result;
            }
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
LABEL_1391:
              uint64_t v11 = (const __int32 *)&unk_28D78;
              goto LABEL_3850;
            }

            if ((a4 - 12425) >= 5)
            {
              uint64_t result = 0LL;
              switch(a4)
              {
                case 12383:
                case 12390:
                  goto LABEL_3200;
                case 12388:
                case 12392:
                  goto LABEL_3266;
                default:
                  return result;
              }

              return result;
            }

LABEL_3200:
            uint64_t v11 = (const __int32 *)&unk_28B38;
            goto LABEL_3850;
          }

          if (a3 != 23500)
          {
            if (a3 != 23515) {
              return result;
            }
            if ((a4 - 12364) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) != 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28FCC;
            goto LABEL_3850;
          }

          if ((a4 - 12414) >= 5)
          {
            int v12 = 12435;
LABEL_2329:
            if (a4 != v12) {
              return 0LL;
            }
          }

LABEL_2907:
          uint64_t v11 = (const __int32 *)&unk_28E5C;
          goto LABEL_3850;
        }

        if (a3 <= 24110)
        {
          if (a3 <= 24038)
          {
            if (a3 == 23815)
            {
              if (a4 == 12417)
              {
                uint64_t v11 = (const __int32 *)&unk_29AC8;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 == 23849)
            {
              if ((a4 - 12373) > 8)
              {
                if (a4 != 12428) {
                  return 0LL;
                }
              }

              else if ((a4 & 1) == 0)
              {
                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_2A270;
              goto LABEL_3850;
            }

            if (a3 != 23884) {
              return result;
            }
            if (a4 != 12417 && a4 != 12414) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29028;
            goto LABEL_3850;
          }

          if (a3 == 24039)
          {
            if (a4 == 12415)
            {
              uint64_t v11 = (const __int32 *)&unk_29530;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 24046)
          {
            if (a3 != 24059) {
              return result;
            }
            goto LABEL_1116;
          }

LABEL_1529:
          uint64_t result = 0LL;
          int v46 = 30446;
LABEL_2279:
          if (a5 == v46) {
            goto LABEL_2280;
          }
LABEL_3103:
          uint64_t v11 = (const __int32 *)&unk_28D78;
          goto LABEL_3850;
        }

        if (a3 > 24178)
        {
          switch(a3)
          {
            case 24179:
              if (a4 == 12425)
              {
                uint64_t v11 = (const __int32 *)&unk_2A19C;
                goto LABEL_3850;
              }

              return 0LL;
            case 24184:
              if (a4 == 12379)
              {
                uint64_t v11 = (const __int32 *)&unk_2954C;
                goto LABEL_3850;
              }

              if (a4 == 12356)
              {
                uint64_t v11 = (const __int32 *)&unk_2953C;
                goto LABEL_3850;
              }

              return 0LL;
            case 24195:
              uint64_t result = 0LL;
              if ((a4 - 12356) <= 0x3D
                && ((1LL << (a4 - 68)) & 0x2400000000024901LL) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29518;
                goto LABEL_3850;
              }

              break;
          }

          return result;
        }

        if (a3 != 24111)
        {
          if (a3 != 24112)
          {
            if (a3 != 24178) {
              return result;
            }
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28B30;
              goto LABEL_3850;
            }

            int v92 = 12363;
            goto LABEL_2962;
          }

          goto LABEL_2705;
        }

        int v79 = 12403;
LABEL_3159:
        if (a4 != v79) {
          return 0LL;
        }
        goto LABEL_3160;
      }

      if (a3 <= 24426)
      {
        if (a3 <= 24340)
        {
          if (a3 <= 24314)
          {
            if (a3 == 24231)
            {
              uint64_t result = 0LL;
              char v72 = a4 - 87;
              if (((1LL << v72) & 0x7C000000001000LL) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_29620;
                goto LABEL_3850;
              }

              if (((1LL << v72) & 5) == 0) {
                return result;
              }
LABEL_2280:
              uint64_t v11 = (const __int32 *)&unk_29188;
              goto LABEL_3850;
            }

            if (a3 != 24310)
            {
              if (a3 != 24314) {
                return result;
              }
              goto LABEL_1487;
            }

LABEL_1679:
            uint64_t result = 0LL;
            if ((a4 - 12400) <= 9 && ((1 << (a4 - 112)) & 0x209) != 0)
            {
              wcscpy(a2, (const __int32 *)&unk_28C84);
              if (a4 == 12400) {
                return 2LL;
              }
              else {
                return 1LL;
              }
            }

            return result;
          }

          if (a3 != 24315)
          {
            if (a3 == 24321)
            {
              if (a4 == 12360)
              {
                uint64_t v11 = (const __int32 *)&unk_2A1EC;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 == 24324)
            {
              uint64_t result = 0LL;
              if ((a4 - 12400) <= 0x23 && ((1LL << (a4 - 112)) & 0x800001249LL) != 0)
              {
                wcscpy(a2, dword_2A3C0);
                uint64_t v11 = (const __int32 *)&unk_2A4DC;
                goto LABEL_3850;
              }
            }

            return result;
          }

LABEL_1535:
          if (((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
            && (a4 - 12425) >= 5
            && a4 != 12387)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_28E80;
          goto LABEL_3850;
        }

        if (a3 <= 24374)
        {
          if (a3 != 24341)
          {
            if (a3 == 24369)
            {
              if ((a4 - 12356) <= 0xF
                || (uint64_t result = 0LL, v59 = a4 - 85, (a4 - 12373) <= 0x38)
                && (((1LL << v59) & 0x1F0040000004101LL) != 0 || ((1LL << v59) & 0x120000000000LL) != 0))
              {
                uint64_t v11 = (const __int32 *)&unk_29844;
                goto LABEL_3850;
              }

              return result;
            }

            if (a3 != 24373) {
              return result;
            }
            if (a5 == 12435)
            {
              uint64_t v11 = (const __int32 *)&unk_28D90;
              goto LABEL_3850;
            }

            if (a5 == 12387)
            {
              uint64_t v11 = (const __int32 *)&unk_29E38;
              goto LABEL_3850;
            }

            goto LABEL_2953;
          }

LABEL_1441:
          if ((a4 - 12363) > 8)
          {
            if (a4 != 12387 && a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) == 0)
          {
            return 0LL;
          }

          v48 = (const __int32 *)&unk_28C78;
          if (a5 != 22823 && a5 != 25163 && a5 != 38263) {
            v48 = (const __int32 *)&unk_28A94;
          }
          wcscpy(a2, v48);
          int v40 = 12387;
          goto LABEL_2817;
        }

        if (a3 == 24375)
        {
          if (a4 == 12356)
          {
            unsigned int v87 = *(_DWORD *)(a6 + 8) - 12390;
            if (v87 <= 0x25 && ((1LL << v87) & 0x2800000001LL) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_291EC;
              goto LABEL_3850;
            }
          }

          else if ((a4 - 12356) >= 0x10)
          {
            uint64_t result = 0LL;
          }

          if (a5 == 26681 || a5 == 21147) {
            uint64_t v11 = (const __int32 *)&unk_291F8;
          }
          else {
            uint64_t v11 = (const __int32 *)&unk_29208;
          }
          goto LABEL_3850;
        }

        if (a3 == 24382)
        {
          if ((a4 - 12414) <= 0x15 && ((1 << (a4 - 126)) & 0x20001F) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_28F04;
            goto LABEL_3850;
          }

          if (a4 == 12369)
          {
            uint64_t v11 = (const __int32 *)&unk_29728;
            goto LABEL_3850;
          }

          if ((a4 - 12363) <= 8)
          {
            if ((a4 & 1) == 0) {
              return 0LL;
            }
            goto LABEL_2963;
          }

          int v92 = 12356;
LABEL_2962:
          if (a4 != v92) {
            return 0LL;
          }
LABEL_2963:
          uint64_t v11 = (const __int32 *)&unk_28A94;
          goto LABEL_3850;
        }

        if (a3 != 24403) {
          return result;
        }
        uint64_t result = 0LL;
        char v42 = a4 - 95;
        if (((1LL << v42) & 0x7C0000000010LL) != 0)
        {
          uint64_t v11 = (const __int32 *)&unk_29E08;
          goto LABEL_3850;
        }

        if (((1LL << v42) & 0x81) == 0) {
          return result;
        }
LABEL_3628:
        uint64_t v11 = (const __int32 *)&unk_289F0;
        goto LABEL_3850;
      }

      if (a3 <= 24466)
      {
        if (a3 <= 24452)
        {
          if (a3 == 24427)
          {
LABEL_1661:
            uint64_t v11 = (const __int32 *)&unk_28B30;
            goto LABEL_3850;
          }

          if (a3 != 24433)
          {
            if (a3 != 24448) {
              return result;
            }
            if ((a4 - 12363) > 8)
            {
              if (a4 != 12387) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28B38;
            goto LABEL_3850;
          }

          goto LABEL_1687;
        }

        if (a3 == 24453)
        {
LABEL_2666:
          uint64_t v16 = (const __int32 *)&unk_28FAC;
          goto LABEL_3770;
        }

        if (a3 == 24459)
        {
          uint64_t result = 0LL;
          if ((a4 - 12380) >= 0xFFFFFFFB && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_2A45C;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 != 24460) {
          return result;
        }
        if ((a4 - 12425) > 3)
        {
          if (a4 != 12429) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_294CC;
          goto LABEL_3850;
        }

LABEL_1754:
        uint64_t v11 = (const __int32 *)&unk_294C0;
        goto LABEL_3850;
      }

      if (a3 > 24516)
      {
        if (a3 == 24517)
        {
          if (a4 == 12378)
          {
            uint64_t v11 = (const __int32 *)&unk_2A110;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 == 24524)
        {
          if (a4 >> 1 == 6207)
          {
            uint64_t v11 = (const __int32 *)&unk_28B38;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 24536) {
          return result;
        }
        if (a4 != 12428) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_2A2DC;
        goto LABEL_3850;
      }

      if (a3 == 24467)
      {
        uint64_t v11 = (const __int32 *)&unk_298B0;
        goto LABEL_3850;
      }

      if (a3 != 24471)
      {
        if (a3 != 24481) {
          return result;
        }
        if (a4 > 12377) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_294D8;
        goto LABEL_3850;
      }

      uint64_t result = 0LL;
LABEL_2747:
      uint64_t v11 = (const __int32 *)&unk_28A00;
      goto LABEL_3850;
    }

    if (a3 <= 24862)
    {
      if (a3 <= 24676)
      {
        if (a3 <= 24612)
        {
          if (a3 <= 24597)
          {
            if (a3 != 24540)
            {
              if (a3 == 24555)
              {
                if ((a4 - 12363) > 8)
                {
                  if (a4 != 12356) {
                    return 0LL;
                  }
                }

                else if ((a4 & 1) == 0)
                {
                  return 0LL;
                }

                uint64_t v11 = (const __int32 *)&unk_28E8C;
                goto LABEL_3850;
              }

              if (a3 != 24594) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_290D0;
              goto LABEL_3850;
            }

            if (a4 != 12360)
            {
              if ((a4 & 0xFFFFFFFD) == 0x3058)
              {
                uint64_t v11 = (const __int32 *)&unk_28D48;
                goto LABEL_3850;
              }

              return 0LL;
            }

LABEL_2320:
            uint64_t v11 = (const __int32 *)&unk_28D3C;
            goto LABEL_3850;
          }

          if (a3 != 24598)
          {
            if (a3 != 24605)
            {
              if (a3 != 24608) {
                return result;
              }
              if ((a4 - 12425) >= 5 && a4 != 12387)
              {
                if (a4 == 12369)
                {
                  uint64_t v11 = (const __int32 *)&unk_29D00;
                  goto LABEL_3850;
                }

                return 0LL;
              }

              uint64_t v11 = (const __int32 *)&unk_29D0C;
              goto LABEL_3850;
            }

            goto LABEL_1674;
          }

          if (a4 == 12428)
          {
            uint64_t v11 = (const __int32 *)&unk_28B8C;
            goto LABEL_3850;
          }

          int v67 = 12376;
LABEL_2580:
          if (a4 == v67)
          {
LABEL_2581:
            uint64_t v11 = (const __int32 *)&unk_28D54;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 <= 24622)
        {
          if (a3 != 24613)
          {
            if (a3 == 24616)
            {
              uint64_t v11 = (const __int32 *)&unk_28D04;
            }

            else
            {
              if (a3 != 24618) {
                return result;
              }
              if (a4 != 12375) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_28EB4;
            }

            goto LABEL_3850;
          }

          if ((a4 - 12364) > 8)
          {
            if (a4 != 12356) {
              goto LABEL_3366;
            }
          }

          else if ((a4 & 1) != 0)
          {
LABEL_3366:
            if ((a4 & 0xFFFFFFFB) != 0x304B) {
              return 0LL;
            }
            goto LABEL_3640;
          }

LABEL_3124:
          uint64_t v11 = (const __int32 *)&unk_29158;
          goto LABEL_3850;
        }

        if (a3 != 24623)
        {
          if (a3 != 24651)
          {
            if (a3 != 24656) {
              return result;
            }
            if ((a4 - 12425) > 4 || a4 == 12426)
            {
              uint64_t v16 = (const __int32 *)&unk_28EDC;
            }

            else
            {
              uint64_t v16 = (const __int32 *)&unk_28B8C;
            }

            goto LABEL_3770;
          }

          if (a4 != 12356) {
            return 0LL;
          }
          goto LABEL_2187;
        }

        if (a4 != 12360) {
          return 0LL;
        }
LABEL_2720:
        uint64_t v11 = (const __int32 *)&unk_29214;
        goto LABEL_3850;
      }

      if (a3 > 24784)
      {
        if (a3 > 24824)
        {
          if (a3 != 24825)
          {
            if (a3 == 24858)
            {
              if (a4 == 12363)
              {
                uint64_t v11 = (const __int32 *)&unk_29308;
                goto LABEL_3850;
              }

              return 0LL;
            }

            if (a3 != 24859) {
              return result;
            }
            if (a4 == 12362)
            {
              uint64_t v11 = (const __int32 *)&unk_28B0C;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28B18;
              goto LABEL_3850;
            }

            return result;
          }

          goto LABEL_1441;
        }

        if (a3 == 24785)
        {
          uint64_t v11 = (const __int32 *)&unk_2A51C;
          goto LABEL_3850;
        }

        if (a3 == 24808)
        {
          if ((a4 - 12363) > 8)
          {
            if (a4 == 12417)
            {
              uint64_t v11 = (const __int32 *)&unk_296F8;
              goto LABEL_3850;
            }

            if (a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) == 0)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_296E8;
          goto LABEL_3850;
        }

        if (a3 != 24819) {
          return result;
        }
LABEL_1674:
        uint64_t v11 = (const __int32 *)&unk_28ADC;
        goto LABEL_3850;
      }

      if (a3 > 24744)
      {
        switch(a3)
        {
          case 24745:
            uint64_t v11 = (const __int32 *)&unk_29FD0;
            break;
          case 24746:
            uint64_t result = 0LL;
            if (((1 << (a4 - 68)) & 0x2222881) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28B40;
            }

            else
            {
              if (a4 != 12375) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_289F0;
            }

            break;
          case 24773:
            if (a4 != 12369) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_299FC;
            break;
          default:
            return result;
        }

        goto LABEL_3850;
      }

      if (a3 != 24677)
      {
        if (a3 == 24688)
        {
          if (a4 != 12418) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_28F9C;
          goto LABEL_3850;
        }

        if (a3 != 24724) {
          return result;
        }
        if (a4 != 12420)
        {
          if (a4 == 12375)
          {
            uint64_t v11 = (const __int32 *)&unk_28EA8;
            goto LABEL_3850;
          }

          if (a4 != 12356) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_28EA0;
          goto LABEL_3850;
        }

        goto LABEL_1429;
      }

      if ((a4 & 0xFFFFFFFD) != 0x3058) {
        return 0LL;
      }
LABEL_2953:
      uint64_t v11 = (const __int32 *)&unk_28C44;
      goto LABEL_3850;
    }

    if (a3 <= 25200)
    {
      if (a3 <= 25104)
      {
        if (a3 <= 24930)
        {
          switch(a3)
          {
            case 24863:
              if ((a4 & 0xFFFFFFFD) == 0x3058)
              {
                uint64_t v11 = (const __int32 *)&unk_28B24;
                goto LABEL_3850;
              }

              return 0LL;
            case 24910:
              if ((a4 - 12415) < 4 || a4 == 12435)
              {
                uint64_t v11 = (const __int32 *)&unk_291C4;
                goto LABEL_3850;
              }

              if (a4 != 12414) {
                return 0LL;
              }
              uint64_t v16 = (const __int32 *)&unk_29A64;
              break;
            case 24917:
              uint64_t v16 = (const __int32 *)&unk_29A70;
              break;
            default:
              return result;
          }

          goto LABEL_3770;
        }

        if (a3 != 24931)
        {
          if (a3 == 25040)
          {
            if (a4 == 12363)
            {
              uint64_t v11 = (const __int32 *)&unk_28EC0;
              goto LABEL_3850;
            }

            if ((a4 - 12365) <= 6)
            {
              uint64_t v11 = (const __int32 *)&unk_28ECC;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 25104) {
            return result;
          }
          if (((a4 - 12382) < 0xFFFFFFF7 || (a4 & 1) == 0)
            && (a4 - 12425) >= 5
            && a4 != 12387)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_28B84;
          goto LABEL_3850;
        }

        if (a4 != 12425 && a4 != 12428)
        {
          if (a4 == 12431)
          {
            uint64_t v11 = (const __int32 *)&unk_28FDC;
            goto LABEL_3850;
          }

          return 0LL;
        }

        goto LABEL_1905;
      }

      if (a3 > 25146)
      {
        if (a3 == 25147)
        {
          uint64_t result = 0LL;
          if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_2A378;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 != 25171)
        {
          if (a3 != 25173) {
            return result;
          }
          if (a5 == 19981
            || a5 == 21463
            || (v94 = (const __int32 *)(a6 - 8), int v95 = wcsncmp((const __int32 *)(a6 - 8), dword_2A158, 2uLL),
                                                 a5 == 36861)
            || !v95
            || (int v96 = wcsncmp(v94, dword_2A164, 2uLL), a5 == 25171)
            || !v96
            || !wcsncmp(v94, dword_2A170, 2uLL))
          {
            uint64_t v11 = (const __int32 *)&unk_2A17C;
          }

          else
          {
            uint64_t v11 = (const __int32 *)&unk_28AE8;
          }

          goto LABEL_3850;
        }

        goto LABEL_1549;
      }

      if (a3 != 25105)
      {
        if (a3 != 25110)
        {
          if (a3 != 25126) {
            return result;
          }
          uint64_t result = 0LL;
          if (a4 > 12366)
          {
            if (a4 == 12367)
            {
              uint64_t v11 = (const __int32 *)&unk_29B74;
              goto LABEL_3850;
            }

            if (a4 != 12431 && a4 != 12387) {
              return result;
            }
          }

          else if ((a4 - 12356) >= 7)
          {
            return result;
          }

          uint64_t v11 = (const __int32 *)&unk_29B64;
          goto LABEL_3850;
        }

LABEL_1522:
        if ((a4 - 12425) >= 5)
        {
          int v45 = 12387;
          goto LABEL_1700;
        }

        goto LABEL_1701;
      }

      int v30 = 12364;
      goto LABEL_2472;
    }

    if (a3 <= 25264)
    {
      switch(a3)
      {
        case 25233:
          if (a4 != 12360) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_297C4;
          goto LABEL_3850;
        case 25234:
        case 25235:
        case 25236:
        case 25238:
        case 25241:
        case 25242:
        case 25243:
          return result;
        case 25237:
          int v44 = 12370;
          goto LABEL_1904;
        case 25239:
          uint64_t v11 = (const __int32 *)&unk_2955C;
          goto LABEL_3850;
        case 25240:
          uint64_t result = 0LL;
          char v56 = a4 - 87;
          if (((1LL << v56) & 0x7C000000001000LL) != 0) {
            goto LABEL_3160;
          }
          if (((1LL << v56) & 5) == 0) {
            return result;
          }
LABEL_1911:
          uint64_t v11 = (const __int32 *)&unk_29B3C;
          goto LABEL_3850;
        case 25244:
          if ((a4 - 12363) > 8)
          {
            int v78 = 12356;
            goto LABEL_3008;
          }

          if ((a4 & 1) != 0) {
            goto LABEL_3009;
          }
          return 0LL;
        default:
          if (a3 == 25201)
          {
            char v90 = a4 - 68;
            if (((1 << v90) & 0x8000007B) == 0)
            {
              if (((1 << v90) & 0x2200) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_28A20;
                goto LABEL_3850;
              }

              if (a4 != 12358)
              {
LABEL_3828:
                if (a4 != 12431) {
                  return 0LL;
                }
              }
            }

            uint64_t v11 = (const __int32 *)&unk_28B4C;
            goto LABEL_3850;
          }

          if (a3 != 25215) {
            return result;
          }
          if ((a4 - 12425) < 5 || a4 == 12387)
          {
            uint64_t v11 = (const __int32 *)&unk_2997C;
            goto LABEL_3850;
          }

          break;
      }

LABEL_3264:
      int v81 = 12369;
LABEL_3265:
      if (a4 != v81) {
        return 0LL;
      }
      goto LABEL_3266;
    }

    if (a3 > 25276)
    {
      if (a3 == 25277)
      {
        if (a4 == 12435)
        {
          uint64_t v11 = (const __int32 *)&unk_29E14;
          goto LABEL_3850;
        }

        return 0LL;
      }

      if (a3 == 25285)
      {
        if ((a4 - 12364) <= 8 && (a4 & 1) == 0 || !wcsncmp((const __int32 *)(a6 + 4), dword_29D68, 2uLL))
        {
          uint64_t v11 = (const __int32 *)&unk_29D74;
        }

        else
        {
          uint64_t v11 = (const __int32 *)&unk_29D80;
        }

        goto LABEL_3850;
      }

      if (a3 != 25299) {
        return result;
      }
LABEL_891:
      if (a4 != 12369)
      {
        uint64_t v11 = (const __int32 *)&unk_28EF8;
        goto LABEL_3850;
      }

      goto LABEL_2515;
    }

    if (a3 != 25265)
    {
      if (a3 != 25276) {
        return result;
      }
      goto LABEL_1607;
    }

    if ((a4 - 12363) <= 8)
    {
      if ((a4 & 1) == 0) {
        return 0LL;
      }
      goto LABEL_3817;
    }

    if (a4 != 12360)
    {
      if (a4 != 12356) {
        return 0LL;
      }
      goto LABEL_3817;
    }

LABEL_3065:
    uint64_t v11 = (const __int32 *)&unk_28FE8;
    goto LABEL_3850;
  }

  if (a3 <= 21249)
  {
    if (a3 <= 20676)
    {
      if (a3 > 20240)
      {
        if (a3 > 20380)
        {
          if (a3 > 20497)
          {
            if (a3 <= 20604)
            {
              switch(a3)
              {
                case 20498:
                  uint64_t v11 = (const __int32 *)&unk_29EB8;
                  break;
                case 20511:
                  if (a4 != 12426) {
                    return 0LL;
                  }
LABEL_2890:
                  uint64_t v11 = (const __int32 *)&unk_28DF4;
                  break;
                case 20581:
                  int v34 = 12420;
LABEL_1768:
                  if (a4 != v34) {
                    return 0LL;
                  }
                  uint64_t v11 = (const __int32 *)&unk_293F8;
                  break;
                default:
                  return result;
              }

              goto LABEL_3850;
            }

            if (a3 <= 20662)
            {
              if (a3 == 20605)
              {
                uint64_t v11 = (const __int32 *)&unk_290F0;
              }

              else
              {
                if (a3 != 20633) {
                  return result;
                }
                if (a4 != 12431 && a4 != 12360) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_2A104;
              }

              goto LABEL_3850;
            }

            if (a3 != 20663)
            {
              if (a3 != 20670) {
                return result;
              }
              if ((a4 - 12363) > 8)
              {
                if (a4 != 12356)
                {
                  BOOL v49 = (a4 & 1) == 0;
                  goto LABEL_3702;
                }
              }

              else if ((a4 & 1) == 0)
              {
                BOOL v49 = 1;
LABEL_3702:
                uint64_t result = 0LL;
                if ((a4 - 12364) <= 8 && v49)
                {
                  uint64_t v11 = (const __int32 *)&unk_29340;
                  goto LABEL_3850;
                }

                return result;
              }

              uint64_t v11 = (const __int32 *)&unk_29330;
              goto LABEL_3850;
            }

            if ((a4 - 12414) >= 5)
            {
              int v89 = 12435;
              goto LABEL_3150;
            }

            goto LABEL_3151;
          }

          if (a3 <= 20444)
          {
            if (a3 != 20381)
            {
              if (a3 != 20415)
              {
                if (a3 != 20418) {
                  return result;
                }
                int v23 = 12387;
LABEL_2482:
                if (a4 != v23) {
                  return 0LL;
                }
LABEL_2483:
                uint64_t v11 = (const __int32 *)&unk_28FE8;
                goto LABEL_3850;
              }

              if (a4 != 12426) {
                return 0LL;
              }
LABEL_2419:
              uint64_t v11 = (const __int32 *)&unk_2A1E0;
              goto LABEL_3850;
            }

LABEL_2784:
            uint64_t v11 = (const __int32 *)&unk_28C70;
            goto LABEL_3850;
          }

          if (a3 == 20445)
          {
            if ((a4 - 12383) <= 9)
            {
              uint64_t v11 = (const __int32 *)&unk_2A210;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 == 20449)
          {
            uint64_t result = 0LL;
            if ((a4 - 12374) <= 4 && ((1 << (a4 - 86)) & 0x15) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_29A7C;
              goto LABEL_3850;
            }

            return result;
          }

          int v32 = 20462;
          goto LABEL_1256;
        }

        if (a3 <= 20308)
        {
          if (a3 <= 20275)
          {
            if (a3 == 20241)
            {
              uint64_t v11 = (const __int32 *)&unk_2917C;
              goto LABEL_3850;
            }

            if (a3 != 20250)
            {
              if (a3 != 20253) {
                return result;
              }
              if (a4 != 12431 && a4 != 12360) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_27FEC;
              goto LABEL_3850;
            }

            goto LABEL_1532;
          }

          if (a3 == 20276)
          {
            uint64_t v11 = (const __int32 *)&unk_2A074;
            goto LABEL_3850;
          }

          if (a3 == 20280) {
            goto LABEL_1679;
          }
          if (a3 != 20303) {
            return result;
          }
          goto LABEL_1105;
        }

        if (a3 <= 20340)
        {
          if (a3 == 20309)
          {
            if ((a4 - 12391) < 2 || a4 == 12425)
            {
              uint64_t v11 = (const __int32 *)&unk_28DAC;
              goto LABEL_3850;
            }

            if (a4 == 12428)
            {
              uint64_t v11 = (const __int32 *)&unk_28D9C;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 20313)
          {
            if (a3 != 20316) {
              return result;
            }
            goto LABEL_1560;
          }

          if (((a4 - 12380) < 0xFFFFFFFB || (a4 & 1) == 0)
            && (a4 - 12425) >= 5
            && a4 != 12387)
          {
            return 0LL;
          }

LABEL_2410:
          uint64_t v11 = (const __int32 *)&unk_2903C;
          goto LABEL_3850;
        }

        if (a3 == 20341)
        {
          uint64_t result = 0LL;
          if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_28B00;
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 != 20351)
        {
          if (a3 != 20363) {
            return result;
          }
          if (a4 != 12360) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_2A484;
          goto LABEL_3850;
        }

        if (a5 != 15192) {
          goto LABEL_2662;
        }
LABEL_2216:
        uint64_t v11 = (const __int32 *)&unk_2941C;
        goto LABEL_3850;
      }

      if (a3 <= 20113)
      {
        if (a3 <= 20026)
        {
          if (a3 <= 20005)
          {
            if (a3 == 19978)
            {
              if (a4 > 12378)
              {
                if (a4 == 12379 || a4 == 12387)
                {
LABEL_1697:
                  uint64_t v11 = (const __int32 *)&unk_299A0;
                  goto LABEL_3850;
                }
              }

              else if (a4 == 12364 || a4 == 12370)
              {
                goto LABEL_3628;
              }

              goto LABEL_1697;
            }

            if (a3 != 19979)
            {
              if (a3 != 19982) {
                return result;
              }
              uint64_t result = 0LL;
              if (a4 <= 12368)
              {
                if (a4 != 12360)
                {
                  if (a4 != 12363) {
                    return result;
                  }
LABEL_3070:
                  uint64_t v11 = (const __int32 *)&unk_2A3F0;
                  goto LABEL_3850;
                }

LABEL_2425:
                uint64_t v11 = (const __int32 *)&unk_29E08;
                goto LABEL_3850;
              }

              if (a4 == 12369) {
                goto LABEL_3070;
              }
              if (a4 != 12428) {
                return result;
              }
LABEL_3069:
              uint64_t v11 = (const __int32 *)&unk_2A3E4;
              goto LABEL_3850;
            }

            if (a4 == 12370 || a4 == 12364)
            {
LABEL_2345:
              uint64_t v11 = (const __int32 *)&unk_28D78;
              goto LABEL_3850;
            }

            if ((a4 - 12373) <= 0xE)
            {
LABEL_3311:
              uint64_t v11 = (const __int32 *)&unk_28D80;
              goto LABEL_3850;
            }

            if (a4 != 12429 && a4 != 12426)
            {
              goto LABEL_3311;
            }

LABEL_3769:
            uint64_t v16 = (const __int32 *)&unk_28D54;
            goto LABEL_3770;
          }

          if (a3 == 20006)
          {
            uint64_t result = 0LL;
            uint64_t v83 = (a4 - 12400);
            if (((1LL << (a4 - 112)) & 0x800001249LL) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28FDC;
              goto LABEL_3850;
            }

            if (v83 != 15) {
              return result;
            }
            goto LABEL_3739;
          }

          if (a3 == 20013)
          {
            if ((a4 - 12425) <= 4)
            {
              uint64_t v11 = (const __int32 *)&unk_29E08;
              goto LABEL_3850;
            }

            return 0LL;
          }

          int v37 = 20024;
LABEL_1628:
          if (a3 == v37)
          {
            uint64_t result = 0LL;
            if ((a4 - 12356) <= 0x3D && ((1LL << (a4 - 68)) & 0x2C00000000000001LL) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_29048;
              goto LABEL_3850;
            }
          }

          return result;
        }

        if (a3 <= 20093)
        {
          if (a3 != 20027)
          {
            if (a3 != 20055)
            {
              if (a3 == 20081)
              {
                if (a4 == 12428 || (uint64_t result = 0LL, (a4 - 12382) >= 0xFFFFFFF7) && (a4 & 1) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_2A44C;
                  goto LABEL_3850;
                }
              }

              return result;
            }

            if ((a4 - 12379) > 0x32 || ((1LL << (a4 - 91)) & 0x7C00000000101LL) == 0)
            {
              if ((a4 & 0xFFFFFFFD) == 0x3058)
              {
                uint64_t v11 = (const __int32 *)&unk_29A08;
                goto LABEL_3850;
              }

              return 0LL;
            }

LABEL_2853:
            uint64_t v11 = (const __int32 *)&unk_28C84;
            goto LABEL_3850;
          }

LABEL_3841:
          uint64_t v11 = (const __int32 *)&unk_28ADC;
          goto LABEL_3850;
        }

        if (a3 != 20094)
        {
          if (a3 == 20104)
          {
            if (a4 == 12417)
            {
              uint64_t v11 = (const __int32 *)&unk_2A3CC;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 20105) {
            return result;
          }
          if ((a4 - 12356) < 7 || a4 == 12431 || a4 == 12387)
          {
            uint64_t v11 = (const __int32 *)&unk_29C50;
            goto LABEL_3850;
          }

          return 1LL;
        }

        int v20 = (const __int32 *)&unk_29030;
LABEL_2734:
        wcscpy(a2, v20);
        int v40 = 12363;
LABEL_2817:
        BOOL v53 = a4 == v40;
LABEL_2818:
        if (v53) {
          return 2LL;
        }
        else {
          return 1LL;
        }
      }

      if (a3 <= 20194)
      {
        if (a3 <= 20131)
        {
          if (a3 == 20114)
          {
            uint64_t v11 = (const __int32 *)&unk_294B0;
            goto LABEL_3850;
          }

          if (a3 == 20123)
          {
            if (a4 == 12363)
            {
              uint64_t v11 = (const __int32 *)&unk_29610;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 20129) {
            return result;
          }
          if ((a4 - 12400) > 0x23 || ((1LL << (a4 - 112)) & 0x800001249LL) == 0)
          {
            if (a4 != 12367) {
              return 0LL;
            }
            uint64_t v16 = (const __int32 *)&unk_28B84;
            goto LABEL_3770;
          }

          goto LABEL_3187;
        }

        if (a3 != 20132)
        {
          if (a3 == 20181)
          {
            goto LABEL_2662;
          }

          if (a3 != 20184) {
            return result;
          }
          if (a4 == 12356 || (a4 - 12372) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            if (a5 == 32016 || a5 == 27671)
            {
              uint64_t v11 = (const __int32 *)&unk_2A134;
              goto LABEL_3850;
            }

            goto LABEL_1567;
          }

          uint64_t result = 0LL;
LABEL_3685:
          uint64_t v11 = (const __int32 *)&unk_28AA4;
          goto LABEL_3850;
        }

        if (a4 == 12431)
        {
          int v85 = *(_DWORD *)(a6 + 8);
          if ((v85 - 12382) < 0xFFFFFFF7 || (v85 & 1) == 0)
          {
LABEL_3167:
            uint64_t v11 = (const __int32 *)&unk_294E8;
            goto LABEL_3850;
          }

          uint64_t v16 = (const __int32 *)&unk_28DF4;
          goto LABEL_3770;
        }

        if ((a4 - 12374) > 6 || (a4 & 1) != 0)
        {
          uint64_t result = 0LL;
          switch(a4)
          {
            case 12356:
            case 12358:
            case 12362:
              goto LABEL_3849;
            case 12357:
            case 12359:
            case 12361:
              return result;
            case 12360:
              goto LABEL_3167;
            default:
              if (a4 == 12387) {
                goto LABEL_3849;
              }
              break;
          }

          return result;
        }

LABEL_3307:
        uint64_t v11 = (const __int32 *)&unk_28FAC;
        goto LABEL_3850;
      }

      if (a3 > 20224)
      {
        if (a3 == 20225)
        {
          if ((a4 - 12414) >= 5)
          {
            if (a4 == 12390)
            {
              uint64_t v11 = (const __int32 *)&unk_2909C;
              goto LABEL_3850;
            }

            if (a4 != 12435) {
              return 0LL;
            }
          }

          uint64_t v11 = (const __int32 *)&unk_2908C;
          goto LABEL_3850;
        }

        if (a3 == 20239)
        {
          uint64_t result = 0LL;
          if (a5 == 12385) {
            uint64_t v16 = (const __int32 *)&unk_2A14C;
          }
          else {
            uint64_t v16 = (const __int32 *)&unk_28AA4;
          }
          goto LABEL_3770;
        }

        if (a3 != 20240) {
          return result;
        }
        goto LABEL_1552;
      }

      if (a3 == 20195)
      {
LABEL_1524:
        if (a4 != 12431 && a4 != 12360) {
          return 0LL;
        }
        if (a5 == 32937 || a5 == 26085) {
          uint64_t v11 = (const __int32 *)&unk_28F68;
        }
        else {
LABEL_3849:
        }
          uint64_t v11 = (const __int32 *)&unk_28DF4;
        goto LABEL_3850;
      }

      if (a3 != 20208)
      {
        if (a3 != 20219) {
          return result;
        }
        if ((a4 - 12376) <= 4 && ((1 << (a4 - 88)) & 0x15) != 0)
        {
          uint64_t v11 = (const __int32 *)&unk_29F90;
          goto LABEL_3850;
        }

        uint64_t result = 0LL;
LABEL_3680:
        uint64_t v11 = (const __int32 *)&unk_28B78;
        goto LABEL_3850;
      }

      if ((a4 - 12364) <= 8)
      {
        if ((a4 & 1) != 0)
        {
          if (a4 == 12369)
          {
            uint64_t v11 = (const __int32 *)&unk_28C84;
            goto LABEL_3850;
          }

          return 0LL;
        }

LABEL_2521:
        uint64_t v11 = (const __int32 *)&unk_292AC;
        goto LABEL_3850;
      }

      uint64_t result = 0LL;
      if (a4 <= 12424)
      {
        if (a4 == 12356) {
          goto LABEL_2521;
        }
        if (a4 == 12379)
        {
          uint64_t v11 = (const __int32 *)&unk_292B8;
          goto LABEL_3850;
        }

        if (a4 != 12387) {
          return result;
        }
      }

      else if ((a4 - 12425) >= 5)
      {
        return result;
      }

      uint64_t v11 = (const __int32 *)&unk_292C4;
      goto LABEL_3850;
    }

    if (a3 > 21020)
    {
      if (a3 > 21108)
      {
        if (a3 > 21190)
        {
          switch(a3)
          {
            case 21209:
              goto LABEL_581;
            case 21210:
            case 21211:
            case 21212:
            case 21214:
            case 21216:
            case 21217:
            case 21219:
            case 21221:
            case 21222:
              return result;
            case 21213:
              uint64_t v11 = (const __int32 *)&unk_29958;
              goto LABEL_3850;
            case 21215:
              uint64_t v16 = (const __int32 *)&unk_2A234;
              goto LABEL_3770;
            case 21218:
              if (a4 != 12356) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29AD8;
              goto LABEL_3850;
            case 21220:
              if (a4 == 12417 || a4 == 12414)
              {
                uint64_t v11 = (const __int32 *)&unk_291B8;
                goto LABEL_3850;
              }

              if (a4 == 12375) {
                goto LABEL_3124;
              }
              return 0LL;
            case 21223:
              goto LABEL_1565;
            default:
              if (a3 == 21191)
              {
                if (a4 != 12414) {
                  return 0LL;
                }
                uint64_t v11 = (const __int32 *)&unk_2A388;
                goto LABEL_3850;
              }

              if (a3 != 21205) {
                return result;
              }
              if (a4 == 12367 || a4 == 12356)
              {
                uint64_t v11 = (const __int32 *)&unk_29F20;
                goto LABEL_3850;
              }

              uint64_t result = 0LL;
              if ((a4 - 12372) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
                uint64_t v16 = (const __int32 *)&unk_29F20;
                goto LABEL_3770;
              }

              break;
          }

          return result;
        }

        if (a3 > 21160)
        {
          if (a3 != 21161)
          {
            if (a3 != 21162)
            {
              if (a3 != 21172) {
                return result;
              }
              char v13 = a4 - 87;
              if (((1LL << v13) & 0x7C000000000001LL) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_2A4CC;
                goto LABEL_3850;
              }

              if (((1LL << v13) & 0x100000000001000LL) == 0)
              {
LABEL_3712:
              }

              uint64_t v11 = (const __int32 *)&unk_2A4B8;
              goto LABEL_3850;
            }

LABEL_581:
            if (a4 != 12417 && a4 != 12414) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_291B8;
LABEL_3850:
            wcscpy(a2, v11);
            return 1LL;
          }

          uint64_t result = 0LL;
          if ((a4 - 12372) >= 0xFFFFFFF7 && (a4 & 1) != 0)
          {
            if (a5 == 25163) {
              uint64_t v11 = (const __int32 *)&unk_2992C;
            }
            else {
              uint64_t v11 = (const __int32 *)&unk_2993C;
            }
            goto LABEL_3850;
          }

          return result;
        }

        if (a3 == 21109)
        {
LABEL_1560:
          if (a5 == 12369 || a5 == 33509 || a5 == 25163) {
            uint64_t v11 = (const __int32 *)&unk_29680;
          }
          else {
            uint64_t v11 = (const __int32 *)&unk_29690;
          }
          goto LABEL_3850;
        }

        if (a3 != 21152) {
          return result;
        }
LABEL_1558:
        if (a4 != 12360) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_28DC4;
        goto LABEL_3850;
      }

      if (a3 <= 21058)
      {
        if (a3 > 21045)
        {
          switch(a3)
          {
            case 21046:
              if (a4 != 12377 && a4 != 12375) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_29B14;
              goto LABEL_3850;
            case 21047:
              int v41 = 12387;
              goto LABEL_2669;
            case 21050:
              goto LABEL_1529;
            case 21051:
              uint64_t v11 = (const __int32 *)&unk_295F4;
              goto LABEL_3850;
            default:
              return result;
          }
        }

        if (a3 != 21021)
        {
          if (a3 != 21028)
          {
            if (a3 != 21029) {
              return result;
            }
            if (a4 != 12428) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_28E74;
            goto LABEL_3850;
          }

          goto LABEL_2639;
        }

        if (a4 == 12417)
        {
          if (a5 == 12356 || a5 == 21682 || a5 == 12365)
          {
            uint64_t v11 = (const __int32 *)&unk_2971C;
            goto LABEL_3850;
          }

          goto LABEL_2637;
        }

                              v278 = *v6;
LABEL_582:
                              if (v278 != 65391) {
                                goto LABEL_872;
                              }
                              v280 = *v9 | 0x20;
                              goto LABEL_873;
                            }
                          }

                          else
                          {
                            if (v353 <= 31477)
                            {
                              if (v353 <= 22889)
                              {
                                if (v353 == 20105) {
                                  goto LABEL_581;
                                }
                                v356 = 21344;
                              }

                              else
                              {
                                if (v353 == 22890 || v353 == 24605) {
                                  goto LABEL_581;
                                }
                                v356 = 24962;
                              }

                              goto LABEL_805;
                            }

                            if (v353 <= 35479) {
                              goto LABEL_799;
                            }
                          }

                          if (v353 == 35480 || v353 == 36036) {
                            goto LABEL_581;
                          }
                          v356 = 39164;
                          goto LABEL_805;
                        }

                        v380[0] = 0;
                        uint64_t result = ktoau::ZenToHan(result, a2 - 1, v380);
                        v239 = *a2;
                        v240 = 65288;
                        v241 = &dword_2A994;
                        while (v239 != v240)
                        {
                          v242 = *v241++;
                          v240 = v242;
                          if (!v242)
                          {
                            v243 = 40;
                            v244 = &dword_2A9C8;
                            while (v243 != v239)
                            {
                              v245 = *v244++;
                              v243 = v245;
                              if (!v245) {
                                goto LABEL_497;
                              }
                            }

                            break;
                          }
                        }

                        if ((*v9 & 0x20) == 0)
                        {
                          *int v9 = *v9 & 0xFE1F | 0x120;
                          if (*a2 != 40 && *a2 != 65288)
                          {
                            *v6++ = 32;
                            v7->i16[0] = v12;
                            uint64_t v7 = (int16x4_t *)((char *)v7 + 2);
                          }

                          goto LABEL_646;
                        }

LABEL_2636:
LABEL_2637:
        uint64_t v11 = (const __int32 *)&unk_29728;
        goto LABEL_3850;
      }

      if (a3 > 21065)
      {
        if (a3 == 21066)
        {
          if ((a4 - 12364) > 8)
          {
            if ((a4 - 12387) <= 0x2A && ((1LL << (a4 - 99)) & 0x7C000000001LL) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_2969C;
              goto LABEL_3850;
            }

            if (a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) != 0)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_28A30;
          goto LABEL_3850;
        }

        if (a3 != 21093)
        {
          if (a3 != 21106) {
            return result;
          }
          int v30 = 12387;
LABEL_2472:
          if (a4 != v30) {
            return 0LL;
          }
LABEL_2473:
          uint64_t v11 = (const __int32 *)&unk_28E30;
          goto LABEL_3850;
        }

        if ((a4 & 0xFFFFFFFD) != 0x304C)
        {
          if ((a4 - 12363) > 8)
          {
            if (a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) == 0)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_28AC4;
          goto LABEL_3850;
        }

LABEL_2884:
        uint64_t v11 = (const __int32 *)&unk_28C44;
        goto LABEL_3850;
      }

      if (a3 != 21059)
      {
        if (a3 != 21063) {
          return result;
        }
        uint64_t v11 = (const __int32 *)&unk_29C8C;
        goto LABEL_3850;
      }

      if ((a4 - 12425) < 5)
      {
LABEL_2824:
        uint64_t v11 = (const __int32 *)&unk_28A30;
        goto LABEL_3850;
      }

      int v66 = 12387;
LABEL_2823:
      if (a4 != v66) {
        return 0LL;
      }
      goto LABEL_2824;
    }

    if (a3 <= 20876)
    {
      if (a3 <= 20836)
      {
        if (a3 > 20803)
        {
          switch(a3)
          {
            case 20804:
              if (a5 != 12362) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_2934C;
              goto LABEL_3850;
            case 20805:
              if (a4 != 12390) {
                return 0LL;
              }
              goto LABEL_3628;
            case 20806:
              uint64_t result = 0LL;
              uint64_t v11 = (const __int32 *)&unk_295F4;
              break;
            case 20809:
              if ((a4 - 12425) >= 5)
              {
                int v52 = 12387;
LABEL_1847:
                if (a4 != v52) {
                  return 0LL;
                }
              }

              uint64_t v11 = (const __int32 *)&unk_294F8;
              goto LABEL_3850;
            case 20811:
LABEL_2889:
              return 0LL;
            default:
              return result;
          }

          goto LABEL_3850;
        }

        if (a3 == 20677)
        {
          if (a4 == 12363)
          {
            uint64_t v11 = (const __int32 *)&unk_292E8;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 20685)
        {
          if (a3 != 20778) {
            return result;
          }
          if (a4 == 12428)
          {
            uint64_t v11 = (const __int32 *)&unk_2A3A4;
            goto LABEL_3850;
          }

          if (a4 != 12375) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_2A398;
          goto LABEL_3850;
        }

        if ((a4 - 12363) > 8)
        {
          if (a4 != 12356) {
            return 0LL;
          }
        }

        else if ((a4 & 1) == 0)
        {
          return 0LL;
        }

        uint64_t v16 = (const __int32 *)&unk_29F10;
        goto LABEL_3770;
      }

      if (a3 <= 20859)
      {
        if (a3 != 20837)
        {
          if (a3 != 20840) {
            return result;
          }
          if (a4 == 12390)
          {
            uint64_t v11 = (const __int32 *)&unk_28F8C;
            goto LABEL_3850;
          }

          if (a4 == 12367)
          {
            uint64_t v11 = (const __int32 *)&unk_29BDC;
            goto LABEL_3850;
          }

          if (a4 != 12358) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_29BCC;
          goto LABEL_3850;
        }

        if (a4 != 12428 && a4 != 12426)
        {
          goto LABEL_2553;
        }

        goto LABEL_3200;
      }

      if (a3 != 20860)
      {
        int v37 = 20870;
        goto LABEL_1628;
      }

      int v75 = 12397;
LABEL_2826:
      if (a4 == v75)
      {
        uint64_t v11 = (const __int32 *)&unk_28DF4;
        goto LABEL_3850;
      }

      return 0LL;
    }

    if (a3 <= 20960)
    {
      if (a3 <= 20918)
      {
        if (a3 == 20877)
        {
          if (a4 == 12403)
          {
            uint64_t v11 = (const __int32 *)&unk_29644;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 == 20889) {
          goto LABEL_1044;
        }
        if (a3 != 20916) {
          return result;
        }
        int v19 = 12360;
        goto LABEL_3102;
      }

      if (a3 != 20919)
      {
        if (a3 == 20932)
        {
          if (a4 == 12414)
          {
            uint64_t v11 = (const __int32 *)&unk_295A8;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 20941) {
          return result;
        }
        uint64_t result = 0LL;
        if (a4 <= 12414)
        {
          if (a4 == 12360)
          {
            uint64_t v11 = (const __int32 *)&unk_29EC4;
            goto LABEL_3850;
          }

          if (a4 != 12387)
          {
            if (a4 != 12390) {
              return result;
            }
            goto LABEL_3200;
          }
        }

        else if ((a4 - 12425) >= 5)
        {
          if (a4 != 12415) {
            return result;
          }
LABEL_2455:
          uint64_t v11 = (const __int32 *)&unk_2958C;
          goto LABEL_3850;
        }

        uint64_t v11 = (const __int32 *)&unk_29ED4;
        goto LABEL_3850;
      }

      uint64_t result = 0LL;
      if (a4 <= 12413)
      {
        if (a4 != 12360)
        {
          if (a4 != 12383) {
            return result;
          }
          uint64_t v11 = (const __int32 *)&unk_2A490;
          goto LABEL_3850;
        }

LABEL_3326:
        wcscpy(a2, (const __int32 *)&unk_28A94);
        int v40 = 12420;
        goto LABEL_2817;
      }

      if (a4 != 12414 && a4 != 12417)
      {
        if (a4 != 12420) {
          return result;
        }
        goto LABEL_3326;
      }

LABEL_3131:
      uint64_t v11 = (const __int32 *)&unk_28D78;
      goto LABEL_3850;
    }

    if (a3 <= 20997)
    {
      switch(a3)
      {
        case 20961:
          if (a4 == 12390)
          {
            uint64_t v11 = (const __int32 *)&unk_28F8C;
            goto LABEL_3850;
          }

          if (a4 == 12381)
          {
            uint64_t v11 = dword_28CE8;
            goto LABEL_3850;
          }

          return 0LL;
        case 20985:
          uint64_t v11 = (const __int32 *)&unk_28D30;
          break;
        case 20986:
          if ((a4 - 12373) > 6)
          {
            if (((a4 - 12381) > 0x2B || ((1LL << (a4 - 93)) & 0x80000002245LL) == 0)
              && (a4 - 12425) > 3)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_298F0;
          }

          else
          {
            uint64_t v11 = (const __int32 *)&unk_28A40;
          }

          break;
        default:
          return result;
      }

      goto LABEL_3850;
    }

    if (a3 != 20998)
    {
      if (a3 == 20999) {
        goto LABEL_1552;
      }
      if (a3 != 21000) {
        return result;
      }
      if ((a4 - 12425) >= 5)
      {
        int v31 = 12387;
        goto LABEL_1918;
      }

LABEL_1919:
      uint64_t v11 = (const __int32 *)&unk_28DF4;
      goto LABEL_3850;
    }

    uint64_t result = 0LL;
LABEL_3095:
    uint64_t v11 = (const __int32 *)&unk_28E30;
    goto LABEL_3850;
  }

  if (a3 <= 21930)
  {
    if (a3 > 21511)
    {
      if (a3 > 21627)
      {
        if (a3 > 21692)
        {
          if (a3 > 21808)
          {
            if (a3 > 21913)
            {
              if (a3 == 21914)
              {
                uint64_t v11 = (const __int32 *)&unk_28FC0;
                goto LABEL_3850;
              }

              if (a3 == 21916)
              {
                uint64_t result = 0LL;
                if ((a4 - 12400) <= 0x23 && ((1LL << (a4 - 112)) & 0x800001249LL) != 0)
                {
                  uint64_t v11 = (const __int32 *)&unk_290B0;
                  goto LABEL_3850;
                }
              }

              return result;
            }

            if (a3 != 21809)
            {
              if (a3 != 21839) {
                return result;
              }
              int v12 = 12387;
              goto LABEL_2329;
            }

            if ((a4 - 12356) <= 0x1F)
            {
              if (((1 << (a4 - 68)) & 0x8000006F) != 0)
              {
LABEL_2312:
                uint64_t v11 = (const __int32 *)&unk_28DDC;
                goto LABEL_3850;
              }

              if (a4 == 12360)
              {
                uint64_t v11 = (const __int32 *)&unk_29964;
                goto LABEL_3850;
              }
            }

            if (a4 != 12431) {
              return 0LL;
            }
            goto LABEL_2312;
          }

          if (a3 == 21693)
          {
            if (a4 == 12406)
            {
              uint64_t v11 = (const __int32 *)&unk_28C58;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 != 21696)
          {
            if (a3 != 21764) {
              return result;
            }
            goto LABEL_970;
          }

          if (a4 == 12428)
          {
            uint64_t v11 = (const __int32 *)&unk_28B00;
            goto LABEL_3850;
          }

          int v82 = 12375;
LABEL_2587:
          if (a4 == v82)
          {
            uint64_t v11 = (const __int32 *)&unk_28AF4;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 > 21645)
        {
          if (a3 == 21646)
          {
            if (a4 == 12417)
            {
              uint64_t v11 = (const __int32 *)&unk_2A59C;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 == 21669) {
            goto LABEL_1558;
          }
          if (a3 != 21682) {
            return result;
          }
          if ((a4 - 12363) <= 8)
          {
            if ((a4 & 1) == 0) {
              return 0LL;
            }
            goto LABEL_3103;
          }

          int v19 = 12356;
LABEL_3102:
          if (a4 != v19) {
            return 0LL;
          }
          goto LABEL_3103;
        }

        if (a3 != 21628)
        {
          if (a3 == 21629)
          {
            if ((a4 & 0xFFFFFFFD) == 0x3058)
            {
              uint64_t v11 = (const __int32 *)&unk_2A328;
              goto LABEL_3850;
            }

            return 0LL;
          }

          if (a3 == 21644)
          {
            uint64_t result = 0LL;
            if ((a4 - 12414) <= 0x15)
            {
              if (((1 << (a4 - 126)) & 0x20005F) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_2A500;
              }

              else
              {
                if (a4 != 12425) {
                  return result;
                }
                uint64_t v11 = (const __int32 *)&unk_2A510;
              }

              goto LABEL_3850;
            }
          }

          return result;
        }

        uint64_t result = 0LL;
LABEL_2431:
        uint64_t v11 = (const __int32 *)&unk_28C70;
        goto LABEL_3850;
      }

      if (a3 <= 21559)
      {
        switch(a3)
        {
          case 21512:
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28B00;
              goto LABEL_3850;
            }

            if (a4 != 12431 && a4 != 12387) {
              return 0LL;
            }
            goto LABEL_1998;
          case 21513:
          case 21515:
          case 21517:
          case 21518:
          case 21519:
            return result;
          case 21514:
            goto LABEL_817;
          case 21516:
            if (a4 != 12376) {
              return 0LL;
            }
            uint64_t v11 = (const __int32 *)&unk_29F30;
            goto LABEL_3850;
          case 21520:
            goto LABEL_1231;
          case 21521:
            if (a4 == 12363)
            {
              uint64_t v16 = (const __int32 *)&unk_28AC4;
              goto LABEL_3770;
            }

            if ((a4 - 12363) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) == 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28AC4;
            break;
          default:
            if (a3 != 21547) {
              return result;
            }
            uint64_t v11 = (const __int32 *)&unk_29070;
            goto LABEL_3850;
        }

        goto LABEL_3850;
      }

      if (a3 <= 21584)
      {
        if (a3 == 21560)
        {
          if ((a4 - 12356) <= 0x1F)
          {
            int v80 = 1 << (a4 - 68);
            if ((v80 & 0x8000007F) != 0) {
              goto LABEL_2500;
            }
            if ((v80 & 0x2880) != 0) {
              goto LABEL_3640;
            }
          }

          int v21 = 12431;
LABEL_1940:
          if (a4 != v21) {
            return 0LL;
          }
LABEL_2500:
          uint64_t v11 = (const __int32 *)&unk_28E1C;
          goto LABEL_3850;
        }

        if (a3 != 21561)
        {
          if (a3 != 21574) {
            return result;
          }
          goto LABEL_3677;
        }

LABEL_1666:
        if ((a4 - 12363) > 8)
        {
          if (a4 != 12387)
          {
            int v65 = 12356;
LABEL_2286:
            if (a4 != v65) {
              return 0LL;
            }
          }
        }

        else if ((a4 & 1) == 0)
        {
          return 0LL;
        }

LABEL_3720:
        uint64_t v11 = (const __int32 *)&unk_28AA4;
        goto LABEL_3850;
      }

      if (a3 != 21585)
      {
        if (a3 != 21608)
        {
          if (a3 != 21610) {
            return result;
          }
          uint64_t v11 = (const __int32 *)&unk_2985C;
          goto LABEL_3850;
        }

        goto LABEL_1535;
      }

LABEL_1718:
      uint64_t v11 = (const __int32 *)&unk_28C84;
      goto LABEL_3850;
    }

    if (a3 <= 21434)
    {
      if (a3 > 21343)
      {
        if (a3 <= 21362)
        {
          if (a3 != 21344)
          {
            if (a3 != 21360)
            {
              if (a3 != 21361) {
                return result;
              }
              if (a4 == 12394)
              {
                uint64_t v11 = (const __int32 *)&unk_290C0;
                goto LABEL_3850;
              }

              if (a4 != 12358) {
                return 0LL;
              }
              uint64_t v11 = (const __int32 *)&unk_28EB4;
              goto LABEL_3850;
            }

            uint64_t result = 0LL;
            if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
            {
              uint64_t v11 = (const __int32 *)&unk_28C4C;
              goto LABEL_3850;
            }

            return result;
          }

          uint64_t result = 0LL;
          if (a4 > 12386)
          {
            if (a4 > 12424)
            {
              if (a4 != 12425 && a4 != 12431) {
                return result;
              }
            }

            else if (a4 != 12387)
            {
              if (a4 != 12417) {
                return result;
              }
              goto LABEL_3243;
            }
          }

          else if ((a4 - 12356) >= 7)
          {
            return result;
          }

          uint64_t v11 = (const __int32 *)&unk_29B54;
          goto LABEL_3850;
        }

        if (a3 == 21363)
        {
          if (a4 == 12385)
          {
            uint64_t v11 = (const __int32 *)&unk_29C9C;
            goto LABEL_3850;
          }

          return 0LL;
        }

        if (a3 != 21421)
        {
          if (a3 != 21427) {
            return result;
          }
          uint64_t result = 0LL;
          if (a4 <= 12387)
          {
            if (a4 == 12363)
            {
              uint64_t v11 = (const __int32 *)&unk_29440;
            }

            else
            {
              if (a4 != 12375) {
                return result;
              }
              uint64_t v11 = (const __int32 *)&unk_29454;
            }

            goto LABEL_3850;
          }

          if (a4 == 12388 || a4 == 12417)
          {
            uint64_t v11 = (const __int32 *)&unk_29464;
            goto LABEL_3850;
          }

          return result;
        }

        if ((a4 - 12356) <= 0x1F && (((1 << (a4 - 68)) & 0x8000007B) != 0 || a4 == 12358) || a4 == 12431)
        {
          uint64_t v11 = (const __int32 *)&unk_28B0C;
          goto LABEL_3850;
        }

LABEL_2515:
        uint64_t v11 = (const __int32 *)&unk_289F0;
        goto LABEL_3850;
      }

      if (a3 > 21269)
      {
        if (a3 == 21270)
        {
          if (a4 != 12369 && a4 != 12363) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_28D90;
          goto LABEL_3850;
        }

        if (a3 == 21322)
        {
          if (a4 != 12400) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_2A084;
          goto LABEL_3850;
        }

        int v29 = 21329;
LABEL_1598:
        if (a3 != v29) {
          return result;
        }
        if (a4 != 12375) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_2A55C;
        goto LABEL_3850;
      }

      if (a3 != 21250)
      {
        if (a3 != 21253) {
          return result;
        }
        uint64_t v11 = (const __int32 *)&unk_29A64;
        goto LABEL_3850;
      }

      if ((a4 - 12356) < 7 || a4 == 12431)
      {
LABEL_3345:
        uint64_t v11 = (const __int32 *)&unk_29874;
        goto LABEL_3850;
      }

      int v69 = 12387;
LABEL_3344:
      if (a4 != v69) {
        return 0LL;
      }
      goto LABEL_3345;
    }

    if (a3 > 21461)
    {
      if (a3 > 21480)
      {
        if (a3 == 21481)
        {
          if ((a4 - 12363) > 8)
          {
            if (a4 != 12356) {
              return 0LL;
            }
          }

          else if ((a4 & 1) == 0)
          {
            return 0LL;
          }

          uint64_t v11 = (const __int32 *)&unk_299D8;
          goto LABEL_3850;
        }

        if (a3 != 21483)
        {
          if (a3 != 21494) {
            return result;
          }
          uint64_t v11 = (const __int32 *)&unk_28AF4;
          goto LABEL_3850;
        }

        uint64_t result = 0LL;
        uint64_t v16 = (const __int32 *)&unk_29224;
        goto LABEL_3770;
      }

      if (a3 == 21462) {
        goto LABEL_2841;
      }
      if (a3 != 21463)
      {
        if (a3 != 21476) {
          return result;
        }
        if ((a4 - 12363) > 8)
        {
          if (a4 != 12356) {
            return 0LL;
          }
        }

        else if ((a4 & 1) == 0)
        {
          return 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_29498;
        goto LABEL_3850;
      }

      goto LABEL_3264;
    }

    if (a3 <= 21449)
    {
      if (a3 != 21435)
      {
        if (a3 != 21442) {
          return result;
        }
        if ((a4 - 12425) >= 5 && a4 != 12387)
        {
          if ((a4 & 0xFFFFFFFD) == 0x3058)
          {
            uint64_t v11 = (const __int32 *)&unk_296DC;
            goto LABEL_3850;
          }

          return 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_296D0;
        goto LABEL_3850;
      }

      int v46 = 12365;
      goto LABEL_2279;
    }

    if (a3 != 21450)
    {
      if (a3 != 21453)
      {
        int v32 = 21454;
LABEL_1256:
        if (a3 != v32) {
          return result;
        }
        goto LABEL_1257;
      }

      if (a4 == 12375 || a4 == 12377)
      {
        uint64_t v11 = (const __int32 *)&unk_2A090;
        goto LABEL_3850;
      }

      int v63 = 12376;
      goto LABEL_3128;
    }

    uint64_t result = 0LL;
    wcscpy(a2, dword_28CE8);
    int v62 = 12412;
LABEL_2324:
    if (a4 == v62) {
      return 2LL;
    }
    else {
      return 1LL;
    }
  }

  if (a3 > 22809)
  {
    if (a3 <= 23232)
    {
      if (a3 <= 22913)
      {
        if (a3 <= 22862)
        {
          switch(a3)
          {
            case 22810:
              if ((a4 - 12363) <= 8)
              {
                if ((a4 & 1) == 0) {
                  return 0LL;
                }
                goto LABEL_2336;
              }

              break;
            case 22823:
              if (a4 == 12365)
              {
LABEL_2336:
                uint64_t v11 = (const __int32 *)&unk_292B8;
                goto LABEL_3850;
              }

              break;
            case 22833:
              uint64_t result = 0LL;
              if (a4 > 12376)
              {
                if (a4 <= 12386)
                {
                  if (a4 == 12377)
                  {
                    uint64_t v11 = (const __int32 *)&unk_297FC;
                    goto LABEL_3850;
                  }

                  if (a4 != 12379) {
                    return result;
                  }
                  goto LABEL_3266;
                }

                if (a4 != 12387 && a4 != 12431) {
                  return result;
                }
              }

              else if ((a4 - 12356) >= 7)
              {
                return result;
              }

              uint64_t v11 = (const __int32 *)&unk_29808;
              goto LABEL_3850;
            default:
              return result;
          }

          if (a4 != 12356) {
            return 0LL;
          }
          goto LABEL_2336;
        }

        if (a3 == 22863)
        {
          int v82 = 12391;
          goto LABEL_2587;
        }

        if (a3 == 22890)
        {
          uint64_t v11 = (const __int32 *)&unk_29D48;
          goto LABEL_3850;
        }

        if (a3 != 22909) {
          return result;
        }
        if ((a4 - 12414) < 5 || a4 == 12435)
        {
          uint64_t v11 = (const __int32 *)&unk_29524;
          goto LABEL_3850;
        }

        if ((a4 - 12363) <= 8)
        {
          if ((a4 & 1) == 0) {
            return 0LL;
          }
          goto LABEL_2670;
        }

        goto LABEL_2668;
      }

      if (a3 > 22986)
      {
        if (a3 != 22987)
        {
          if (a3 != 22996)
          {
            if (a3 == 23041)
            {
              uint64_t result = 0LL;
              if ((a4 - 12382) >= 0xFFFFFFF7 && (a4 & 1) != 0)
              {
                uint64_t v11 = (const __int32 *)&unk_28BF8;
                goto LABEL_3850;
              }
            }

            return result;
          }

          if (a4 == 12397)
          {
            uint64_t v11 = (const __int32 *)&unk_28B68;
            goto LABEL_3850;
          }

          uint64_t result = 0LL;
          goto LABEL_3680;
        }

        goto LABEL_2636;
      }

      if (a3 != 22914)
      {
        if (a3 != 22956)
        {
          if (a3 != 22985) {
            return result;
          }
          if (a5 != 12362) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_29738;
          goto LABEL_3850;
        }

LABEL_1669:
        if ((a4 - 12363) > 8)
        {
          if (a4 != 12356) {
            return 0LL;
          }
        }

        else if ((a4 & 1) == 0)
        {
          return 0LL;
        }

        goto LABEL_3079;
      }

      int v58 = 12369;
LABEL_2454:
      if (a4 != v58) {
        return 0LL;
      }
      goto LABEL_2455;
    }

    if (a3 <= 23449)
    {
      if (a3 <= 23383)
      {
        switch(a3)
        {
          case 23233:
            if ((a4 - 12364) > 8)
            {
              if (a4 != 12356) {
                return 0LL;
              }
            }

            else if ((a4 & 1) != 0)
            {
              return 0LL;
            }

            uint64_t v11 = (const __int32 *)&unk_28DB8;
            goto LABEL_3850;
          case 23244:
            uint64_t v11 = (const __int32 *)&unk_293EC;
            break;
          case 23381:
            uint64_t v11 = (const __int32 *)&unk_28AE8;
            break;
          default:
            return result;
        }

        goto LABEL_3850;
      }

      switch(a3)
      {
        case 23384:
          if (a4 == 12376)
          {
            uint64_t v11 = (const __int32 *)&unk_29CD4;
            goto LABEL_3850;
          }

          return 0LL;
        case 23398:
          uint64_t result = 0LL;
          if ((a4 - 12400) <= 0x23 && ((1LL << (a4 - 112)) & 0x800001249LL) != 0)
          {
            uint64_t v11 = (const __int32 *)&unk_28F50;
            goto LABEL_3850;
          }

          break;
        case 23432:
LABEL_1735:
          uint64_t v11 = (const __int32 *)&unk_29850;
          goto LABEL_3850;
      }

      return result;
    }

    if (a3 <= 23480)
    {
      if (a3 == 23450)
      {
        if (a4 != 12417 && a4 != 12414) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_29E74;
        goto LABEL_3850;
      }

      if (a3 == 23451)
      {
        int v47 = 12390;
LABEL_2514:
        if (a4 != v47) {
          return 0LL;
        }
        goto LABEL_2515;
      }

      if (a3 != 23455) {
        return result;
      }
      uint64_t result = 0LL;
      if (a4 > 12424)
      {
        goto LABEL_783;
      }

      if (a4 != 12363)
      {
        if (a4 == 12387)
        {
LABEL_783:
          uint64_t v11 = (const __int32 *)&unk_29838;
          goto LABEL_3850;
        }

        if (a4 != 12398) {
          return result;
        }
      }

      uint64_t v11 = (const __int32 *)&unk_29828;
      goto LABEL_3850;
    }

    if (a3 != 23481)
    {
      if (a3 != 23492)
      {
        if (a3 != 23494) {
          return result;
        }
        if (a4 != 12363) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_2A310;
        goto LABEL_3850;
      }

      uint64_t result = 0LL;
      goto LABEL_2784;
    }

    int v17 = 12428;
LABEL_2780:
    if (a4 == v17)
    {
      uint64_t v11 = (const __int32 *)&unk_28B38;
      goto LABEL_3850;
    }

    return 0LL;
  }

  if (a3 <= 22265)
  {
    if (a3 <= 22131)
    {
      if (a3 <= 21956)
      {
        if (a3 == 21931)
        {
          if (a4 != 12377 && a4 != 12375) {
            return 0LL;
          }
          uint64_t v11 = (const __int32 *)&unk_29124;
        }

        else
        {
          if (a3 != 21942) {
            return result;
          }
          uint64_t v11 = (const __int32 *)&unk_28CF4;
        }

        goto LABEL_3850;
      }

      if (a3 == 21957)
      {
        if ((a4 - 12364) <= 8)
        {
          if ((a4 & 1) != 0) {
            return 0LL;
          }
          goto LABEL_2048;
        }

LABEL_2047:
        if (a4 == 12356) {
          goto LABEL_2048;
        }
        return 0LL;
      }

      if (a3 == 22022)
      {
        if ((a4 - 12363) > 8)
        {
          if (a4 != 12356) {
            return 0LL;
          }
        }

        else if ((a4 & 1) == 0)
        {
          return 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_29D8C;
        goto LABEL_3850;
      }

      if (a3 != 22107) {
        return result;
      }
      if ((a4 - 12414) >= 5)
      {
        int v31 = 12435;
        goto LABEL_1918;
      }

      goto LABEL_1919;
    }

    if (a3 <= 22255)
    {
      if (a3 == 22132) {
        goto LABEL_1666;
      }
      if (a3 == 22238) {
        goto LABEL_1535;
      }
      if (a3 != 22240) {
        return result;
      }
      if ((a4 - 12415) <= 1)
      {
        uint64_t v11 = (const __int32 *)&unk_28C64;
        goto LABEL_3850;
      }

      if ((a4 - 12425) >= 5)
      {
        int v91 = 12387;
LABEL_2917:
        if (a4 != v91) {
          return 0LL;
        }
        goto LABEL_1177;
      }

      goto LABEL_1177;
    }

    if (a3 != 22256)
    {
      if (a3 == 22258)
      {
        if (((a4 - 12387) > 0x30 || ((1LL << (a4 - 99)) & 0x11000F8000001LL) == 0)
          && (a4 - 12356) >= 7)
        {
          return 0LL;
        }

        uint64_t v11 = (const __int32 *)&unk_28B5C;
        goto LABEL_3850;
      }

      if (a3 != 22259) {
        return result;
      }
      goto LABEL_1226;
    }

    if ((a4 - 12425) >= 5)
    {
      int v28 = 12387;
LABEL_2158:
      if (a4 != v28) {
        return 0LL;
      }
      goto LABEL_2159;
    }

    goto LABEL_2159;
  }

  if (a3 <= 22614)
  {
    if (a3 <= 22518)
    {
      if (a3 != 22266)
      {
        if (a3 == 22312) {
          goto LABEL_1522;
        }
        if (a3 != 22475) {
          return result;
        }
        if (a4 == 12417 || a4 == 12414)
        {
          uint64_t v11 = (const __int32 *)&unk_29708;
          goto LABEL_3850;
        }

        int v17 = 12400;
        goto LABEL_2780;
      }

      uint64_t result = 0LL;
LABEL_2718:
      uint64_t v11 = (const __int32 *)&unk_294A4;
      goto LABEL_3850;
    }

    if (a3 == 22519) {
      goto LABEL_2841;
    }
    if (a3 != 22570)
    {
      if (a3 != 22577) {
        return result;
      }
      if ((a4 & 0xFFFFFFFD) != 0x3058)
      {
        if (a4 != 12431 && a4 != 12356) {
          return 0LL;
        }
        uint64_t v11 = (const __int32 *)&unk_2A258;
        goto LABEL_3850;
      }

      goto LABEL_1078;
    }

LABEL_1546:
    if (a4 == 12360) {
      goto LABEL_2974;
    }
    goto LABEL_1547;
  }

  if (a3 > 22769)
  {
    if (a3 == 22770)
    {
      uint64_t v11 = (const __int32 *)&unk_29708;
      goto LABEL_3850;
    }

    if (a3 != 22793)
    {
      if (a3 != 22806) {
        return result;
      }
      if ((a4 - 12373) > 8)
      {
        if (a4 != 12428) {
          return 0LL;
        }
      }

      else if ((a4 & 1) == 0)
      {
        return 0LL;
      }

      uint64_t v11 = (const __int32 *)&unk_28F04;
      goto LABEL_3850;
    }

    uint64_t result = 0LL;
    if (a4 <= 12424)
    {
      if (a4 == 12360) {
        goto LABEL_2048;
      }
      if (a4 != 12387) {
        return result;
      }
    }

    else if ((a4 - 12425) >= 5)
    {
      if (a4 == 12431) {
        goto LABEL_2048;
      }
      return result;
    }

    uint64_t v11 = (const __int32 *)&unk_29030;
    goto LABEL_3850;
  }

  if (a3 == 22615)
  {
    if ((a4 - 12425) >= 5)
    {
      int v78 = 12387;
LABEL_3008:
      if (a4 != v78) {
        return 0LL;
      }
    }

LABEL_3009:
    uint64_t v11 = (const __int32 *)&unk_28A74;
    goto LABEL_3850;
  }

  if (a3 != 22679)
  {
    if (a3 != 22730) {
      return result;
    }
    if ((a4 - 12373) > 8)
    {
      if (a4 != 12428) {
        return 0LL;
      }
    }

    else if ((a4 & 1) == 0)
    {
      return 0LL;
    }

    uint64_t v11 = (const __int32 *)&unk_28EDC;
    goto LABEL_3850;
  }

  if (a4 == 12420 || a4 == 12360)
  {
    uint64_t v11 = (const __int32 *)&unk_28AA4;
    goto LABEL_3850;
  }

  uint64_t result = 0LL;
  return result;
}

uint64_t ktoau::SetBuf(uint64_t a1, _DWORD *a2, _WORD *a3, int *a4, __int16 a5)
{
  int v5 = *a4;
  if (*a4)
  {
    int v6 = 0;
    uint64_t result = 0LL;
    __int16 v8 = a4 + 1;
    do
    {
      if (v6 || v5 != 32)
      {
        int v6 = 0;
        *a2++ = v5;
        *a3++ = a5;
        uint64_t result = (result + 1);
      }

      else
      {
        ++a5;
        int v6 = 1;
      }

      int v9 = *v8++;
      int v5 = v9;
    }

    while (v9);
  }

  else
  {
    uint64_t result = 0LL;
  }

  *a2 = 0;
  return result;
}

uint64_t ktoau::IsSetsubi(uint64_t a1, const __int32 *a2)
{
  if (!dword_306C0) {
    return 0LL;
  }
  uint64_t v3 = 1LL;
  for (uint64_t i = &dword_306C0; ; i += 20)
  {
    size_t v5 = wcslen(i);
    if (!wcsncmp(a2, i, v5)) {
      break;
    }
    int v6 = i[20];
    uint64_t v3 = (v3 + 1);
    if (!v6) {
      return 0LL;
    }
  }

  return v3;
}

BOOL ktoau::IsDoushi(uint64_t a1, const __int32 *a2)
{
  if (!dword_32510) {
    return *a2 == 25620;
  }
  uint64_t v3 = 1LL;
  for (uint64_t i = &dword_32510; ; i += 10)
  {
    size_t v5 = wcslen(i);
    if (!wcsncmp(a2, i, v5)) {
      break;
    }
    int v6 = i[10];
    uint64_t v3 = (v3 + 1);
    if (!v6) {
      return *a2 == 25620;
    }
  }

  return v3;
}

uint64_t ktoau::IsDoushiHira(uint64_t a1, _DWORD *a2)
{
  int v2 = 12356;
  uint64_t v3 = &dword_2658C;
  while (v2 != *a2)
  {
    int v4 = *v3++;
    int v2 = v4;
    if (!v4) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t ktoau::IsDoushiHira2(uint64_t a1, _DWORD *a2)
{
  int v2 = 12356;
  uint64_t v3 = &dword_265E0;
  while (v2 != *a2)
  {
    int v4 = *v3++;
    int v2 = v4;
    if (!v4) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t ktoau::IsHiraDoushi(int a1, __int32 *a2, __int32 *a3)
{
  if (!wcsncmp(a2, dword_26628, 4uLL))
  {
    __int32 v6 = a2[4];
    if ((v6 - 12425) < 5 || v6 == 12387)
    {
      size_t v5 = (const __int32 *)&unk_2663C;
      goto LABEL_48;
    }
  }

  if (!wcsncmp(a2, dword_26660, 4uLL))
  {
    __int32 v11 = a2[4];
    if ((v11 - 12425) < 5 || v11 == 12387)
    {
      size_t v5 = (const __int32 *)&unk_26674;
      goto LABEL_48;
    }
  }

  if (wcsncmp(a2, dword_26694, 4uLL) || a2[4] != 12428)
  {
    if (!wcsncmp(a2, dword_266C8, 4uLL))
    {
      unsigned __int32 v13 = a2[4] - 12400;
      if (v13 <= 0x23 && ((1LL << v13) & 0x800001249LL) != 0)
      {
        size_t v5 = (const __int32 *)&unk_266DC;
        goto LABEL_48;
      }
    }

    if (!wcsncmp(a2, dword_266FC, 3uLL))
    {
      __int32 v15 = a2[3];
      uint64_t v9 = 3LL;
      size_t v5 = (const __int32 *)&unk_2670C;
    }

    if (!wcsncmp(a2, dword_26728, 3uLL))
    {
      __int32 v16 = a2[3];
      uint64_t v9 = 3LL;
      size_t v5 = (const __int32 *)&unk_26738;
    }

    if (!wcsncmp(a2, dword_26750, 3uLL))
    {
      unsigned __int32 v17 = a2[3] - 12385;
      if (v17 <= 0x2C && ((1LL << v17) & 0x1F000000003FLL) != 0)
      {
        size_t v5 = (const __int32 *)&unk_26760;
        goto LABEL_62;
      }
    }

    if (!wcsncmp(a2, dword_26778, 3uLL))
    {
      __int32 v18 = a2[3];
      uint64_t v9 = 3LL;
      size_t v5 = (const __int32 *)&unk_26788;
    }

    if (!wcsncmp(a2, dword_267A0, 3uLL))
    {
      __int32 v19 = a2[3];
      uint64_t v9 = 3LL;
      size_t v5 = (const __int32 *)&unk_267B0;
      if (v19 == 12414 || v19 == 12417) {
        goto LABEL_49;
      }
    }

    if (!wcsncmp(a2, dword_267C8, 3uLL))
    {
      __int32 v20 = a2[3];
      uint64_t v9 = 3LL;
      size_t v5 = (const __int32 *)&unk_267D8;
    }

    if (wcsncmp(a2, dword_267F4, 3uLL))
    {
LABEL_20:
      if (!wcsncmp(a2, dword_2681C, 3uLL))
      {
        unsigned __int32 v22 = a2[3] - 12375;
        if (v22 <= 0x36 && ((1LL << v22) & 0x7C000000001001LL) != 0)
        {
          size_t v5 = (const __int32 *)&unk_2682C;
          goto LABEL_62;
        }
      }

      if (!wcsncmp(a2, dword_26844, 3uLL))
      {
        __int32 v23 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_26854;
      }

      if (!wcsncmp(a2, dword_2686C, 3uLL))
      {
        __int32 v8 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_2687C;
      }

      if (!wcsncmp(a2, dword_26898, 3uLL))
      {
        __int32 v24 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_268A8;
      }

      if (!wcsncmp(a2, dword_268C0, 3uLL))
      {
        __int32 v25 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_268D0;
      }

      if (!wcsncmp(a2, dword_268E8, 3uLL))
      {
        __int32 v10 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_268F8;
      }

      if (!wcsncmp(a2, dword_26914, 3uLL))
      {
        __int32 v26 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_26924;
      }

      if (!wcsncmp(a2, dword_26940, 3uLL))
      {
        __int32 v27 = a2[3];
        uint64_t v9 = 3LL;
        size_t v5 = (const __int32 *)&unk_26950;
      }

      if (wcsncmp(a2, dword_26968, 3uLL))
      {
LABEL_33:
        if (!wcsncmp(a2, dword_26990, 3uLL))
        {
          __int32 v29 = a2[3];
          uint64_t v9 = 3LL;
          size_t v5 = (const __int32 *)&unk_269A0;
        }

        if (!wcsncmp(a2, dword_269B8, 3uLL))
        {
          __int32 v30 = a2[3];
          uint64_t v9 = 3LL;
          size_t v5 = (const __int32 *)&unk_269C8;
        }

        if (!wcsncmp(a2, dword_269E0, 3uLL))
        {
          __int32 v33 = a2[3];
          uint64_t v9 = 3LL;
          size_t v5 = (const __int32 *)&unk_269F0;
        }

        if (!wcsncmp(a2, dword_26A08, 3uLL) && a2[3] == 12428)
        {
          size_t v5 = (const __int32 *)&unk_26A18;
LABEL_62:
          uint64_t v9 = 3LL;
          goto LABEL_49;
        }

        if (!wcsncmp(a2, dword_26A34, 3uLL) && a2[3] == 12360)
        {
          size_t v5 = (const __int32 *)&unk_26A44;
          goto LABEL_62;
        }

        if (!wcsncmp(a2, dword_26A5C, 3uLL))
        {
          __int32 v31 = a2[3];
          uint64_t v9 = 3LL;
          size_t v5 = (const __int32 *)&unk_26A6C;
        }

        if (!wcsncmp(a2, dword_26A88, 3uLL))
        {
          __int32 v32 = a2[3];
          uint64_t v9 = 3LL;
          size_t v5 = (const __int32 *)&unk_26A98;
        }

        if (!wcsncmp(a2, dword_26AB0, 3uLL) && a2[3] == 12360)
        {
          size_t v5 = (const __int32 *)&unk_26AC0;
          goto LABEL_62;
        }

        if (wcsncmp(a2, dword_26ADC, 3uLL))
        {
LABEL_131:
          if (!wcsncmp(a2, dword_26B04, 3uLL) && a2[3] == 12390)
          {
            size_t v5 = (const __int32 *)&unk_26B14;
            goto LABEL_62;
          }

          if (!wcsncmp(a2, dword_26B30, 3uLL) && (a2[3] & 0xFFFFFFFD) == 0x3058)
          {
            size_t v5 = (const __int32 *)&unk_26B40;
            goto LABEL_62;
          }

          if (!wcsncmp(a2, dword_26B58, 3uLL) && a2[3] == 12415)
          {
            size_t v5 = (const __int32 *)&unk_26B68;
            goto LABEL_62;
          }

          if (!wcsncmp(a2, dword_26B80, 3uLL))
          {
            __int32 v35 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26B90;
          }

          if (!wcsncmp(a2, dword_26BA8, 3uLL))
          {
            __int32 v36 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26BB8;
          }

          if (!wcsncmp(a2, dword_26BD0, 3uLL))
          {
            __int32 v38 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26BE0;
          }

          if (!wcsncmp(a2, dword_26BFC, 3uLL) && a2[3] == 12370)
          {
            size_t v5 = (const __int32 *)&unk_26C0C;
            goto LABEL_62;
          }

          if (!wcsncmp(a2, dword_26C24, 3uLL))
          {
            __int32 v39 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26C34;
          }

          if (!wcsncmp(a2, dword_26C50, 3uLL))
          {
            __int32 v40 = a2[3];
            if ((v40 - 12382) >= 0xFFFFFFF7 && (v40 & 1) != 0)
            {
              size_t v5 = (const __int32 *)&unk_26C60;
              goto LABEL_62;
            }
          }

          if (!wcsncmp(a2, dword_26C7C, 3uLL))
          {
            __int32 v37 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26C8C;
          }

          if (!wcsncmp(a2, dword_26CA8, 3uLL))
          {
            __int32 v41 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26CB8;
          }

          if (!wcsncmp(a2, dword_26CD0, 3uLL))
          {
            __int32 v45 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26CE0;
          }

          if (!wcsncmp(a2, dword_26CF8, 3uLL) && a2[3] == 12360)
          {
            size_t v5 = (const __int32 *)&unk_26D08;
            goto LABEL_62;
          }

          if (!wcsncmp(a2, dword_26D20, 3uLL))
          {
            __int32 v46 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26D30;
            if (v46 == 12360 || v46 == 12431) {
              goto LABEL_49;
            }
          }

          if (!wcsncmp(a2, dword_26D4C, 3uLL))
          {
            __int32 v47 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26D5C;
          }

          if (!wcsncmp(a2, dword_26D74, 3uLL))
          {
            __int32 v48 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26D84;
          }

          if (!wcsncmp(a2, dword_26DA0, 3uLL))
          {
            __int32 v49 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26DB0;
          }

          if (!wcsncmp(a2, dword_26DC8, 3uLL))
          {
            __int32 v50 = a2[3];
            if ((v50 - 12382) >= 0xFFFFFFF7 && (v50 & 1) != 0)
            {
              size_t v5 = (const __int32 *)&unk_26DD8;
              goto LABEL_62;
            }
          }

          if (!wcsncmp(a2, dword_26DF0, 3uLL))
          {
            __int32 v51 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26E00;
          }

          if (!wcsncmp(a2, dword_26E18, 3uLL))
          {
            __int32 v42 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26E28;
          }

          if (!wcsncmp(a2, dword_26E40, 3uLL))
          {
            __int32 v52 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26E50;
          }

          if (!wcsncmp(a2, dword_26E68, 3uLL))
          {
            __int32 v53 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26E78;
          }

          if (!wcsncmp(a2, dword_26E90, 3uLL))
          {
            __int32 v54 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26EA0;
          }

          if (!wcsncmp(a2, dword_26EBC, 3uLL))
          {
            __int32 v55 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26ECC;
          }

          if (!wcsncmp(a2, dword_26EE4, 3uLL))
          {
            __int32 v56 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26EF4;
          }

          if (!wcsncmp(a2, dword_26F10, 3uLL))
          {
            __int32 v43 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26F20;
          }

          if (!wcsncmp(a2, dword_26F38, 3uLL))
          {
            __int32 v57 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26F48;
          }

          if (!wcsncmp(a2, dword_26F64, 3uLL))
          {
            __int32 v58 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26F74;
          }

          if (!wcsncmp(a2, dword_26F90, 3uLL))
          {
            __int32 v59 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26FA0;
          }

          if (!wcsncmp(a2, dword_26FB8, 3uLL))
          {
            __int32 v44 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26FC8;
          }

          if (!wcsncmp(a2, dword_26FE4, 3uLL))
          {
            __int32 v60 = a2[3];
            uint64_t v9 = 3LL;
            size_t v5 = (const __int32 *)&unk_26FF4;
          }

          if (wcsncmp(a2, dword_2700C, 3uLL))
          {
LABEL_207:
            if (!wcsncmp(a2, dword_27034, 3uLL))
            {
              unsigned __int32 v62 = a2[3] - 12400;
              if (v62 <= 0x23 && ((1LL << v62) & 0x800001249LL) != 0)
              {
                size_t v5 = (const __int32 *)&unk_27044;
                goto LABEL_62;
              }
            }

            if (!wcsncmp(a2, dword_2705C, 2uLL))
            {
              __int32 v63 = a2[2];
              if ((v63 - 12382) >= 0xFFFFFFF7 && (v63 & 1) != 0)
              {
                size_t v5 = (const __int32 *)&unk_27068;
                goto LABEL_309;
              }
            }

            if (!wcsncmp(a2, dword_27078, 2uLL))
            {
              __int32 v64 = a2[2];
              if ((v64 - 12364) > 8)
              {
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_27084;
                if ((v64 - 12387) <= 0x2A
                  && ((1LL << (v64 - 99)) & 0x7C000000001LL) != 0
                  || v64 == 12356)
                {
                  goto LABEL_49;
                }
              }

              else if ((v64 & 1) == 0)
              {
                size_t v5 = (const __int32 *)&unk_27084;
                goto LABEL_309;
              }
            }

            if (!wcsncmp(a2, dword_27094, 2uLL))
            {
              __int32 v65 = a2[2];
              if ((v65 - 12382) >= 0xFFFFFFF7 && (v65 & 1) != 0)
              {
                size_t v5 = (const __int32 *)&unk_270A0;
                goto LABEL_309;
              }
            }

            if (wcsncmp(a2, dword_270B0, 2uLL))
            {
LABEL_212:
              if (!wcsncmp(a2, dword_270D0, 2uLL))
              {
                __int32 v67 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_270DC;
              }

              if (!wcsncmp(a2, dword_270EC, 2uLL))
              {
                __int32 v68 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_270F8;
                if (v68 == 12363 || v68 == 12369) {
                  goto LABEL_49;
                }
              }

              if (!wcsncmp(a2, dword_2710C, 2uLL))
              {
                unsigned __int32 v69 = a2[2] - 12400;
                if (v69 <= 0x23 && ((1LL << v69) & 0x800001249LL) != 0)
                {
                  size_t v5 = (const __int32 *)&unk_27118;
                  goto LABEL_309;
                }
              }

              if (!wcsncmp(a2, dword_27128, 2uLL))
              {
                __int32 v70 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_27134;
              }

              if (!wcsncmp(a2, dword_27144, 2uLL))
              {
                __int32 v71 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_27150;
                if ((v71 - 12387) <= 0x2A
                  && ((1LL << (v71 - 99)) & 0x7C000000001LL) != 0)
                {
                  goto LABEL_49;
                }

                if (v71 == 12360) {
                  goto LABEL_49;
                }
              }

              if (!wcsncmp(a2, dword_27160, 2uLL) && (a2[2] - 12414) < 5)
              {
                size_t v5 = (const __int32 *)&unk_2716C;
LABEL_309:
                uint64_t v9 = 2LL;
                goto LABEL_49;
              }

              if (!wcsncmp(a2, dword_2717C, 2uLL) && a2[2] == 12428)
              {
                size_t v5 = (const __int32 *)&unk_27188;
                goto LABEL_309;
              }

              if (!wcsncmp(a2, dword_2719C, 2uLL) && a2[2] == 12428)
              {
                size_t v5 = (const __int32 *)&unk_271A8;
                goto LABEL_309;
              }

              if (!wcsncmp(a2, dword_271B8, 2uLL))
              {
                __int32 v73 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_271C4;
              }

              if (!wcsncmp(a2, dword_271D8, 2uLL))
              {
                __int32 v74 = a2[2];
                if ((v74 - 12382) >= 0xFFFFFFF7 && (v74 & 1) != 0)
                {
                  size_t v5 = (const __int32 *)&unk_271E4;
                  goto LABEL_309;
                }

                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_271E4;
              }

              if (!wcsncmp(a2, dword_271F4, 2uLL))
              {
                __int32 v75 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_27200;
              }

              if (!wcsncmp(a2, dword_27210, 2uLL))
              {
                __int32 v72 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_2721C;
              }

              if (!wcsncmp(a2, dword_2722C, 2uLL))
              {
                __int32 v79 = a2[2];
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_27238;
              }

              if (!wcsncmp(a2, dword_27248, 2uLL))
              {
                __int32 v80 = a2[2];
                if ((v80 - 12382) >= 0xFFFFFFF7 && (v80 & 1) != 0)
                {
                  size_t v5 = (const __int32 *)&unk_27254;
                  goto LABEL_309;
                }
              }

              if (!wcsncmp(a2, dword_27264, 2uLL) && a2[2] == 12417)
              {
                size_t v5 = (const __int32 *)&unk_27270;
                goto LABEL_309;
              }

              if (wcsncmp(a2, dword_27284, 2uLL))
              {
LABEL_351:
                if (!wcsncmp(a2, dword_272A0, 2uLL))
                {
                  __int32 v76 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_272AC;
                }

                if (!wcsncmp(a2, dword_272C0, 2uLL))
                {
                  __int32 v82 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_272CC;
                }

                if (!wcsncmp(a2, dword_272DC, 2uLL))
                {
                  __int32 v77 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_272E8;
                }

                if (!wcsncmp(a2, dword_272FC, 2uLL))
                {
                  __int32 v83 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_27308;
                }

                if (!wcsncmp(a2, dword_27318, 2uLL))
                {
                  __int32 v84 = a2[2];
                  if ((v84 - 12382) >= 0xFFFFFFF7 && (v84 & 1) != 0)
                  {
                    size_t v5 = (const __int32 *)&unk_27324;
                    goto LABEL_309;
                  }

                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_27324;
                }

                if (!wcsncmp(a2, dword_27334, 2uLL))
                {
                  __int32 v85 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_27340;
                }

                if (!wcsncmp(a2, dword_27354, 2uLL))
                {
                  __int32 v86 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_27360;
                }

                if (!wcsncmp(a2, dword_27370, 2uLL))
                {
                  unsigned __int32 v87 = a2[2] - 12356;
                  if (v87 <= 0x19 && ((1 << v87) & 0x2022881) != 0)
                  {
                    size_t v5 = (const __int32 *)&unk_2737C;
                    goto LABEL_309;
                  }
                }

                if (!wcsncmp(a2, dword_2738C, 2uLL))
                {
                  unsigned __int32 v88 = a2[2] - 12400;
                  if (v88 <= 0x23 && ((1LL << v88) & 0x800001249LL) != 0)
                  {
                    size_t v5 = (const __int32 *)&unk_27398;
                    goto LABEL_62;
                  }
                }

                if (!wcsncmp(a2, dword_273A8, 2uLL))
                {
                  __int32 v78 = a2[3];
                  uint64_t v9 = 3LL;
                  size_t v5 = (const __int32 *)&unk_273B4;
                }

                if (!wcsncmp(a2, dword_273C8, 2uLL) && (a2[2] & 0xFFFFFFFD) == 0x3058)
                {
                  size_t v5 = (const __int32 *)&unk_273D4;
                  goto LABEL_309;
                }

                if (!wcsncmp(a2, dword_273E4, 2uLL))
                {
                  __int32 v89 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_273F0;
                  unsigned int v90 = v89 - 12379;
                  if (v90 <= 0x34 && ((1LL << v90) & 0x10000000000101LL) != 0) {
                    goto LABEL_49;
                  }
                }

                if (!wcsncmp(a2, dword_27400, 2uLL))
                {
                  __int32 v91 = a2[2];
                  if ((v91 - 12382) >= 0xFFFFFFF7 && (v91 & 1) != 0)
                  {
                    size_t v5 = (const __int32 *)&unk_2740C;
                    goto LABEL_309;
                  }
                }

                if (!wcsncmp(a2, dword_2741C, 2uLL))
                {
                  __int32 v92 = a2[2];
                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_27428;
                }

                if (!wcsncmp(a2, dword_2743C, 2uLL) && (a2[2] - 12425) < 4)
                {
                  size_t v5 = (const __int32 *)&unk_27448;
                  goto LABEL_309;
                }

                if (!wcsncmp(a2, dword_27458, 2uLL))
                {
                  __int32 v94 = a2[2];
                  if ((v94 - 12382) >= 0xFFFFFFF7 && (v94 & 1) != 0)
                  {
                    size_t v5 = (const __int32 *)&unk_27464;
                    goto LABEL_309;
                  }

                  uint64_t v9 = 2LL;
                  size_t v5 = (const __int32 *)&unk_27464;
                }

                if (!wcsncmp(a2, dword_27474, 2uLL))
                {
                  unsigned __int32 v95 = a2[2] - 12360;
                  if (v95 <= 0x39 && ((1LL << v95) & 0x240000000000001LL) != 0)
                  {
                    size_t v5 = (const __int32 *)&unk_27480;
                    goto LABEL_309;
                  }
                }

                if (!wcsncmp(a2, dword_27490, 2uLL) && a2[2] == 12360)
                {
                  size_t v5 = (const __int32 *)&unk_2749C;
                  goto LABEL_309;
                }

                if (wcsncmp(a2, dword_274AC, 2uLL))
                {
LABEL_430:
                  if (!wcsncmp(a2, dword_274C8, 2uLL))
                  {
                    __int32 v97 = a2[2];
                    if ((v97 - 12382) >= 0xFFFFFFF7 && (v97 & 1) != 0)
                    {
                      size_t v5 = (const __int32 *)&unk_274D4;
                      goto LABEL_309;
                    }

                    uint64_t v9 = 2LL;
                    size_t v5 = (const __int32 *)&unk_274D4;
                  }

                  if (!wcsncmp(a2, dword_274E8, 2uLL))
                  {
                    __int32 v93 = a2[2];
                    uint64_t v9 = 2LL;
                    size_t v5 = (const __int32 *)&unk_274F4;
                  }

                  if (!wcsncmp(a2, dword_27508, 2uLL) && a2[2] == 12360)
                  {
                    size_t v5 = (const __int32 *)&unk_27514;
                    goto LABEL_309;
                  }

                  if (wcsncmp(a2, dword_27528, 2uLL))
                  {
LABEL_451:
                    if (!wcsncmp(a2, dword_27544, 2uLL))
                    {
                      __int32 v101 = a2[2];
                      if ((v101 - 12364) > 8)
                      {
                        uint64_t v9 = 2LL;
                        size_t v5 = (const __int32 *)&unk_27550;
                        if ((v101 - 12400) <= 0x23
                          && ((1LL << (v101 - 112)) & 0x800001249LL) != 0
                          || v101 == 12356)
                        {
                          goto LABEL_49;
                        }
                      }

                      else if ((v101 & 1) == 0)
                      {
                        size_t v5 = (const __int32 *)&unk_27550;
                        goto LABEL_309;
                      }
                    }

                    if (!wcsncmp(a2, dword_27560, 2uLL) && a2[2] == 12360)
                    {
                      size_t v5 = (const __int32 *)&unk_2756C;
                      goto LABEL_309;
                    }

                    if (!wcsncmp(a2, dword_2757C, 2uLL))
                    {
                      __int32 v98 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_27588;
                    }

                    if (!wcsncmp(a2, dword_2759C, 2uLL))
                    {
                      __int32 v102 = a2[2];
                      if ((v102 - 12382) >= 0xFFFFFFF7 && (v102 & 1) != 0)
                      {
                        size_t v5 = (const __int32 *)&unk_275A8;
                        goto LABEL_309;
                      }

                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_275A8;
                    }

                    if (!wcsncmp(a2, dword_275B8, 2uLL))
                    {
                      __int32 v103 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_275C4;
                    }

                    if (!wcsncmp(a2, dword_275D4, 2uLL))
                    {
                      __int32 v104 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_275E0;
                      if ((v104 - 12370) <= 0x3D
                        && ((1LL << (v104 - 82)) & 0x2F80000000020001LL) != 0)
                      {
                        goto LABEL_49;
                      }

                      if (v104 == 12360) {
                        goto LABEL_49;
                      }
                    }

                    if (!wcsncmp(a2, dword_275F0, 2uLL))
                    {
                      __int32 v105 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_275FC;
                    }

                    if (!wcsncmp(a2, dword_27610, 2uLL))
                    {
                      __int32 v106 = a2[2];
                      if (v106 == 12428 || (v106 - 12382) >= 0xFFFFFFF7 && (v106 & 1) != 0)
                      {
                        size_t v5 = (const __int32 *)&unk_2761C;
                        goto LABEL_309;
                      }
                    }

                    if (!wcsncmp(a2, dword_2762C, 2uLL))
                    {
                      __int32 v107 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_27638;
                    }

                    if (!wcsncmp(a2, dword_27648, 2uLL))
                    {
                      __int32 v108 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_27654;
                      if ((v108 - 12387) <= 0x30
                        && ((1LL << (v108 - 99)) & 0x11000F8000001LL) != 0)
                      {
                        goto LABEL_49;
                      }
                    }

                    if (!wcsncmp(a2, dword_27664, 2uLL))
                    {
                      __int32 v109 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_27670;
                      if (v109 == 12394 || v109 == 12397) {
                        goto LABEL_49;
                      }
                    }

                    if (!wcsncmp(a2, dword_27680, 2uLL))
                    {
                      __int32 v111 = a2[2];
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_2768C;
                    }

                    if (wcsncmp(a2, dword_276A0, 2uLL))
                    {
LABEL_474:
                      if (!wcsncmp(a2, dword_276BC, 2uLL) && a2[2] == 12360)
                      {
                        size_t v5 = (const __int32 *)&unk_276C8;
                        goto LABEL_309;
                      }

                      if (!wcsncmp(a2, dword_276DC, 2uLL))
                      {
                        if ((__int32 v113 = a2[2], (v113 - 12356) <= 0x3D)
                          && ((1LL << (v113 - 68)) & 0x2400000080020881LL) != 0
                          || (v113 - 12425) < 5)
                        {
                          size_t v5 = (const __int32 *)&unk_276E8;
                          goto LABEL_309;
                        }
                      }

                      if (wcsncmp(a2, dword_276F8, 2uLL))
                      {
LABEL_529:
                        if (!wcsncmp(a2, dword_27714, 2uLL))
                        {
                          __int32 v115 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27720;
                        }

                        if (!wcsncmp(a2, dword_27730, 2uLL))
                        {
                          __int32 v116 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2773C;
                        }

                        if (!wcsncmp(a2, dword_2774C, 2uLL))
                        {
                          __int32 v110 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27758;
                        }

                        if (!wcsncmp(a2, dword_27768, 2uLL))
                        {
                          __int32 v118 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27774;
                          if (v118 == 12356
                            || (v118 - 12363) < 9
                            || (v118 - 12425) < 5
                            || (((v118 - 12373) < 9) & v118) != 0)
                          {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27784, 2uLL) && (a2[2] & 0xFFFFFFFD) == 0x3058)
                        {
                          size_t v5 = (const __int32 *)&unk_27790;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_277A0, 2uLL))
                        {
                          __int32 v119 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_277AC;
                        }

                        if (!wcsncmp(a2, dword_277C0, 2uLL))
                        {
                          __int32 v120 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_277CC;
                        }

                        if (!wcsncmp(a2, dword_277DC, 2uLL))
                        {
                          __int32 v121 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_277E8;
                        }

                        if (!wcsncmp(a2, dword_277F8, 2uLL))
                        {
                          __int32 v122 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27804;
                        }

                        if (!wcsncmp(a2, dword_27814, 2uLL))
                        {
                          __int32 v123 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27820;
                        }

                        if (!wcsncmp(a2, dword_27830, 2uLL))
                        {
                          __int32 v117 = a2[2];
                          if ((v117 - 12373) > 8)
                          {
                            if (v117 == 12428) {
                              goto LABEL_570;
                            }
                          }

                          else if ((v117 & 1) != 0)
                          {
LABEL_570:
                            size_t v5 = (const __int32 *)&unk_2783C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27850, 2uLL))
                        {
                          __int32 v124 = a2[2];
                          if ((v124 - 12363) < 9)
                          {
LABEL_600:
                            size_t v5 = (const __int32 *)&unk_2785C;
                            goto LABEL_309;
                          }

                          if ((v124 - 12373) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_2785C;
                            if ((v124 - 12387) <= 0x2A
                              && ((1LL << (v124 - 99)) & 0x7C000000001LL) != 0
                              || v124 == 12356)
                            {
                              goto LABEL_49;
                            }
                          }

                          else if ((v124 & 1) != 0)
                          {
                            goto LABEL_600;
                          }
                        }

                        if (!wcsncmp(a2, dword_27870, 2uLL))
                        {
                          __int32 v125 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2787C;
                        }

                        if (!wcsncmp(a2, dword_27890, 2uLL))
                        {
                          __int32 v126 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2789C;
                        }

                        if (!wcsncmp(a2, dword_278AC, 2uLL))
                        {
                          unsigned __int32 v127 = a2[2] - 12375;
                          if (v127 <= 0x3C && ((1LL << v127) & 0x10000F8000000001LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_278B8;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_278C8, 2uLL))
                        {
                          __int32 v128 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_278D4;
                          if ((v128 - 12373) > 8)
                          {
                            if (v128 == 12409) {
                              goto LABEL_49;
                            }
                          }

                          else if ((v128 & 1) != 0)
                          {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_278E4, 2uLL))
                        {
                          __int32 v129 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_278F0;
                          unsigned int v130 = v129 - 12375;
                          if (v130 <= 0x38 && ((1LL << v130) & 0x100000000001001LL) != 0) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27900, 2uLL))
                        {
                          __int32 v131 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2790C;
                          if (v131 == 12360 || v131 == 12431) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_2791C, 2uLL))
                        {
                          __int32 v132 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27928;
                        }

                        if (!wcsncmp(a2, dword_2793C, 2uLL))
                        {
                          __int32 v133 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27948;
                        }

                        if (!wcsncmp(a2, dword_27958, 2uLL) && a2[2] == 12360)
                        {
                          size_t v5 = (const __int32 *)&unk_27964;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_27978, 2uLL))
                        {
                          __int32 v134 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27984;
                        }

                        if (!wcsncmp(a2, dword_27994, 2uLL) && a2[2] == 12360)
                        {
                          size_t v5 = (const __int32 *)&unk_279A0;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_279B0, 2uLL))
                        {
                          __int32 v135 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_279BC;
                        }

                        if (!wcsncmp(a2, dword_279CC, 2uLL))
                        {
                          __int32 v136 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_279D8;
                        }

                        if (!wcsncmp(a2, dword_279E8, 2uLL))
                        {
                          __int32 v137 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_279F4;
                        }

                        if (!wcsncmp(a2, dword_27A04, 2uLL))
                        {
                          __int32 v138 = a2[2];
                          if ((v138 - 12373) <= 8)
                          {
                            if ((v138 & 1) == 0) {
                              goto LABEL_662;
                            }
LABEL_661:
                            size_t v5 = (const __int32 *)&unk_27A10;
                            goto LABEL_309;
                          }

                          unsigned int v139 = v138 - 12400;
                          if (v139 <= 0x23 && ((1LL << v139) & 0x800001249LL) != 0) {
                            goto LABEL_661;
                          }
                        }

LABEL_662:
                        if (!wcsncmp(a2, dword_27A20, 2uLL))
                        {
                          __int32 v140 = a2[2];
                          if ((v140 - 12373) > 8)
                          {
                            if (v140 == 12428) {
                              goto LABEL_665;
                            }
                          }

                          else if ((v140 & 1) != 0)
                          {
LABEL_665:
                            size_t v5 = (const __int32 *)&unk_27A2C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27A3C, 2uLL) && a2[2] == 12360)
                        {
                          size_t v5 = (const __int32 *)&unk_27A48;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_27A58, 2uLL))
                        {
                          __int32 v141 = a2[2];
                          if ((v141 - 12382) >= 0xFFFFFFF7 && (v141 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27A64;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27A64;
                        }

                        if (!wcsncmp(a2, dword_27A78, 2uLL))
                        {
                          __int32 v142 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27A84;
                        }

                        if (!wcsncmp(a2, dword_27A98, 2uLL))
                        {
                          unsigned __int32 v143 = a2[2] - 12400;
                          if (v143 <= 0x23 && ((1LL << v143) & 0x800001249LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27AA4;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27AB4, 2uLL))
                        {
                          __int32 v144 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27AC0;
                          if (v144 == 12360 || v144 == 12370) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27AD0, 2uLL))
                        {
                          __int32 v145 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27ADC;
                        }

                        if (!wcsncmp(a2, dword_27AEC, 2uLL))
                        {
                          __int32 v146 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27AF8;
                          if (v146 == 12414 || v146 == 12417) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27B0C, 2uLL))
                        {
                          __int32 v147 = a2[2];
                          if ((v147 - 12363) > 8)
                          {
                            if (v147 == 12356) {
                              goto LABEL_696;
                            }
                          }

                          else if ((v147 & 1) != 0)
                          {
LABEL_696:
                            size_t v5 = (const __int32 *)&unk_27B18;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27B2C, 2uLL))
                        {
                          __int32 v148 = a2[2];
                          if ((v148 - 12382) >= 0xFFFFFFF7 && (v148 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27B38;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27B48, 2uLL))
                        {
                          __int32 v149 = a2[2];
                          if ((v149 - 12364) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_27B54;
                            if ((v149 - 12387) <= 0x2A
                              && ((1LL << (v149 - 99)) & 0x7C000000001LL) != 0
                              || v149 == 12356)
                            {
                              goto LABEL_49;
                            }
                          }

                          else if ((v149 & 1) == 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27B54;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27B64, 2uLL))
                        {
                          __int32 v150 = a2[2];
                          if ((v150 - 12363) > 8)
                          {
                            if (v150 == 12356) {
                              goto LABEL_712;
                            }
                          }

                          else if ((v150 & 1) != 0)
                          {
LABEL_712:
                            size_t v5 = (const __int32 *)&unk_27B70;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27B84, 2uLL))
                        {
                          __int32 v151 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27B90;
                          if (v151 == 12390 || v151 == 12427) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27BA0, 2uLL))
                        {
                          __int32 v152 = a2[2];
                          if ((v152 - 12382) >= 0xFFFFFFF7 && (v152 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27BAC;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27BAC;
                        }

                        if (!wcsncmp(a2, dword_27BC0, 2uLL))
                        {
                          __int32 v153 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27BCC;
                          if (v153 == 12363) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27BE0, 2uLL))
                        {
                          __int32 v154 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27BEC;
                        }

                        if (!wcsncmp(a2, dword_27C00, 2uLL))
                        {
                          __int32 v155 = a2[2];
                          if ((v155 - 12414) < 5
                            || (unsigned int v156 = v155 - 12387, v156 <= 0x30) && ((1LL << v156) & 0x107C000000001LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27C0C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27C20, 2uLL))
                        {
                          __int32 v157 = a2[2];
                          if ((v157 - 12382) >= 0xFFFFFFF7 && (v157 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27C2C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27C3C, 2uLL) && a2[2] == 12409)
                        {
                          size_t v5 = (const __int32 *)&unk_27C48;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_27C58, 2uLL))
                        {
                          __int32 v158 = a2[2];
                          if ((v158 - 12382) >= 0xFFFFFFF7 && (v158 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27C64;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27C74, 2uLL))
                        {
                          __int32 v159 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27C80;
                        }

                        if (!wcsncmp(a2, dword_27C90, 2uLL))
                        {
                          __int32 v160 = a2[2];
                          if ((v160 - 12382) >= 0xFFFFFFF7 && (v160 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27C9C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27CB0, 2uLL))
                        {
                          __int32 v161 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27CBC;
                          if (v161 == 12416 || v161 == 12435) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27CCC, 2uLL))
                        {
                          __int32 v162 = a2[2];
                          if ((v162 - 12364) <= 8 && (v162 & 1) == 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27CD8;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27CD8;
                        }

                        if (!wcsncmp(a2, dword_27CE8, 2uLL))
                        {
                          __int32 v163 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27CF4;
                        }

                        if (!wcsncmp(a2, dword_27D08, 2uLL))
                        {
                          __int32 v164 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27D14;
                        }

                        if (!wcsncmp(a2, dword_27D24, 2uLL))
                        {
                          __int32 v165 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27D30;
                        }

                        if (!wcsncmp(a2, dword_27D40, 2uLL))
                        {
                          __int32 v166 = a2[2];
                          if ((v166 - 12364) > 8)
                          {
                            if (v166 == 12356) {
                              goto LABEL_775;
                            }
                          }

                          else if ((v166 & 1) == 0)
                          {
LABEL_775:
                            size_t v5 = (const __int32 *)&unk_27D4C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27D5C, 2uLL) && (a2[2] - 12383) < 0xA)
                        {
                          size_t v5 = (const __int32 *)&unk_27D68;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_27D7C, 2uLL))
                        {
                          __int32 v167 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27D88;
                          if (v167 == 12360 || v167 == 12431) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_27D98, 2uLL))
                        {
                          __int32 v168 = a2[2];
                          if ((v168 - 12363) > 8)
                          {
                            if (v168 == 12356) {
                              goto LABEL_786;
                            }
                          }

                          else if ((v168 & 1) != 0)
                          {
LABEL_786:
                            size_t v5 = (const __int32 *)&unk_27DA4;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27DB4, 2uLL))
                        {
                          __int32 v169 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27DC0;
                        }

                        if (!wcsncmp(a2, dword_27DD0, 2uLL))
                        {
                          __int32 v170 = a2[2];
                          if ((v170 - 12373) > 8)
                          {
                            if (v170 == 12428) {
                              goto LABEL_795;
                            }
                          }

                          else if ((v170 & 1) != 0)
                          {
LABEL_795:
                            size_t v5 = (const __int32 *)&unk_27DDC;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27DEC, 2uLL))
                        {
                          __int32 v171 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27DF8;
                        }

                        if (!wcsncmp(a2, dword_27E08, 2uLL))
                        {
                          __int32 v172 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27E14;
                        }

                        if (!wcsncmp(a2, dword_27E28, 2uLL))
                        {
                          __int32 v173 = a2[2];
                          if ((v173 - 12372) >= 0xFFFFFFF7 && (v173 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27E34;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27E44, 2uLL) && a2[2] == 12397)
                        {
                          size_t v5 = (const __int32 *)&unk_27E50;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_27E64, 2uLL))
                        {
                          __int32 v174 = a2[2];
                          if ((v174 - 12382) >= 0xFFFFFFF7 && (v174 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27E70;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27E84, 2uLL))
                        {
                          __int32 v175 = a2[2];
                          if ((v175 - 12382) >= 0xFFFFFFF7 && (v175 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27E90;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27EA4, 2uLL))
                        {
                          __int32 v176 = a2[2];
                          if ((v176 - 12382) >= 0xFFFFFFF7 && (v176 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27EB0;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27EB0;
                        }

                        if (!wcsncmp(a2, dword_27EC4, 2uLL) && a2[2] == 12360)
                        {
                          size_t v5 = (const __int32 *)&unk_27ED0;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_27EE0, 2uLL))
                        {
                          __int32 v177 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27EEC;
                        }

                        if (!wcsncmp(a2, dword_27F00, 2uLL))
                        {
                          __int32 v178 = a2[2];
                          if ((v178 - 12382) >= 0xFFFFFFF7 && (v178 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27F0C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27F1C, 2uLL))
                        {
                          __int32 v179 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27F28;
                        }

                        if (!wcsncmp(a2, dword_27F38, 2uLL))
                        {
                          __int32 v180 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27F44;
                        }

                        if (!wcsncmp(a2, dword_27F54, 2uLL))
                        {
                          __int32 v181 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27F60;
                        }

                        if (!wcsncmp(a2, dword_27F74, 2uLL))
                        {
                          __int32 v182 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27F80;
                        }

                        if (!wcsncmp(a2, dword_27F94, 2uLL))
                        {
                          unsigned __int32 v183 = a2[2] - 12414;
                          if (v183 <= 0x15 && ((1 << v183) & 0x20401F) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27FA0;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27FB0, 2uLL))
                        {
                          __int32 v184 = a2[2];
                          if ((v184 - 12382) >= 0xFFFFFFF7 && (v184 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27FBC;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27FBC;
                        }

                        if (!wcsncmp(a2, dword_27FCC, 2uLL))
                        {
                          __int32 v185 = a2[2];
                          if ((v185 - 12363) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_27FD8;
                            if ((v185 - 12387) <= 0x2A
                              && ((1LL << (v185 - 99)) & 0x7C000000001LL) != 0
                              || v185 == 12356)
                            {
                              goto LABEL_49;
                            }
                          }

                          else if ((v185 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_27FD8;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_27FEC, 2uLL))
                        {
                          __int32 v186 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_27FF8;
                          if (v186 == 12360 || v186 == 12431) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_28008, 2uLL))
                        {
                          __int32 v187 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28014;
                        }

                        if (!wcsncmp(a2, dword_28024, 2uLL))
                        {
                          __int32 v188 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28030;
                          if (v188 == 12414 || v188 == 12417) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_28040, 2uLL))
                        {
                          __int32 v189 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2804C;
                        }

                        if (!wcsncmp(a2, dword_28060, 2uLL))
                        {
                          __int32 v190 = a2[2];
                          if ((v190 - 12364) > 8)
                          {
                            if (v190 == 12356) {
                              goto LABEL_881;
                            }
                          }

                          else if ((v190 & 1) == 0)
                          {
LABEL_881:
                            size_t v5 = (const __int32 *)&unk_2806C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2807C, 2uLL))
                        {
                          __int32 v191 = a2[2];
                          if ((v191 - 12363) > 8)
                          {
                            unsigned int v192 = v191 - 12356;
                            if (v192 <= 0x3D && ((1LL << v192) & 0x2C00000002020001LL) != 0)
                            {
                              size_t v5 = (const __int32 *)&unk_28088;
                              goto LABEL_309;
                            }
                          }

                          else
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_28088;
                            if (v191 == 12364 || (v191 & 1) != 0) {
                              goto LABEL_49;
                            }
                          }
                        }

                        if (!wcsncmp(a2, dword_28098, 2uLL))
                        {
                          __int32 v193 = a2[2];
                          if ((v193 - 12382) >= 0xFFFFFFF7 && (v193 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_280A4;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_280B4, 2uLL))
                        {
                          __int32 v194 = a2[2];
                          if ((v194 - 12382) >= 0xFFFFFFF7 && (v194 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_280C0;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_280C0;
                        }

                        if (!wcsncmp(a2, dword_280D0, 2uLL))
                        {
                          __int32 v195 = a2[2];
                          if ((v195 - 12363) <= 8)
                          {
                            if ((v195 & 1) == 0) {
                              goto LABEL_908;
                            }
LABEL_907:
                            size_t v5 = (const __int32 *)&unk_280DC;
                            goto LABEL_309;
                          }

                          unsigned int v196 = v195 - 12356;
                          if (v196 <= 0x3D && ((1LL << v196) & 0x2400000000000001LL) != 0) {
                            goto LABEL_907;
                          }
                        }

LABEL_908:
                        if (!wcsncmp(a2, dword_280F0, 2uLL) && a2[2] == 12360)
                        {
                          size_t v5 = (const __int32 *)&unk_280FC;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_2810C, 2uLL))
                        {
                          __int32 v197 = a2[2];
                          if ((v197 - 12382) >= 0xFFFFFFF7 && (v197 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28118;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28118;
                        }

                        if (!wcsncmp(a2, dword_28128, 2uLL))
                        {
                          __int32 v198 = a2[2];
                          if ((v198 - 12382) >= 0xFFFFFFF7 && (v198 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28134;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28134;
                        }

                        if (!wcsncmp(a2, dword_28144, 2uLL))
                        {
                          unsigned __int32 v199 = a2[2] - 12414;
                          if (v199 <= 0x15 && ((1 << v199) & 0x20005F) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28150;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28164, 2uLL))
                        {
                          __int32 v200 = a2[2];
                          if ((v200 - 12363) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_28170;
                            if (v200 == 12356
                              || v200 == 12428
                              || (v200 - 12382) >= 0xFFFFFFF7 && (v200 & 1) != 0)
                            {
                              goto LABEL_49;
                            }
                          }

                          else if ((v200 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28170;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28170;
                        }

                        if (!wcsncmp(a2, dword_28184, 2uLL))
                        {
                          __int32 v201 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28190;
                        }

                        if (!wcsncmp(a2, dword_281A4, 2uLL))
                        {
                          __int32 v202 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_281B0;
                        }

                        if (!wcsncmp(a2, dword_281C4, 2uLL))
                        {
                          __int32 v203 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_281D0;
                        }

                        if (!wcsncmp(a2, dword_281E0, 2uLL))
                        {
                          __int32 v204 = a2[2];
                          if ((v204 - 12400) <= 0x23
                            && ((1LL << (v204 - 112)) & 0x800001249LL) != 0
                            || (v204 - 12356) < 7)
                          {
                            goto LABEL_952;
                          }

                          if ((v204 - 12373) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_281EC;
                            if (v204 == 12387 || v204 == 12431) {
                              goto LABEL_49;
                            }
                          }

                          else if ((v204 & 1) != 0)
                          {
LABEL_952:
                            size_t v5 = (const __int32 *)&unk_281EC;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_281FC, 2uLL))
                        {
                          unsigned __int32 v205 = a2[2] - 12356;
                          if (v205 <= 0x11 && ((1 << v205) & 0x22881) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28208;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2821C, 2uLL))
                        {
                          __int32 v206 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28228;
                        }

                        if (!wcsncmp(a2, dword_2823C, 2uLL))
                        {
                          __int32 v207 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28248;
                        }

                        if (!wcsncmp(a2, dword_2825C, 2uLL))
                        {
                          __int32 v208 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28268;
                        }

                        if (!wcsncmp(a2, dword_28278, 2uLL))
                        {
                          __int32 v209 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28284;
                        }

                        if (!wcsncmp(a2, dword_28298, 2uLL))
                        {
                          __int32 v210 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_282A4;
                        }

                        if (!wcsncmp(a2, dword_282B8, 2uLL))
                        {
                          __int32 v211 = a2[2];
                          if (v211 == 12356)
                          {
LABEL_980:
                            size_t v5 = (const __int32 *)&unk_282C4;
                            goto LABEL_309;
                          }

                          if ((v211 - 12382) >= 0xFFFFFFF7)
                          {
LABEL_979:
                            if ((v211 & 1) != 0) {
                              goto LABEL_980;
                            }
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_282C4;
                        }

                        if (!wcsncmp(a2, dword_282D4, 2uLL))
                        {
                          __int32 v212 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_282E0;
                        }

                        if (!wcsncmp(a2, dword_282F0, 2uLL))
                        {
                          __int32 v213 = a2[2];
                          if ((v213 - 12373) > 8)
                          {
                            if (v213 == 12428) {
                              goto LABEL_990;
                            }
                          }

                          else if ((v213 & 1) != 0)
                          {
LABEL_990:
                            size_t v5 = (const __int32 *)&unk_282FC;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28310, 2uLL))
                        {
                          __int32 v214 = a2[2];
                          if ((v214 - 12382) >= 0xFFFFFFF7 && (v214 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_2831C;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2831C;
                        }

                        if (!wcsncmp(a2, dword_2832C, 2uLL))
                        {
                          __int32 v215 = a2[2];
                          if ((v215 - 12363) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_28338;
                            if ((v215 - 12414) <= 0x15 && ((1 << (v215 - 126)) & 0x20001F) != 0
                              || v215 == 12356)
                            {
                              goto LABEL_49;
                            }
                          }

                          else if ((v215 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28338;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2834C, 2uLL))
                        {
                          unsigned __int32 v216 = a2[2] - 12379;
                          if (v216 <= 0x32 && ((1LL << v216) & 0x7C00000000101LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28358;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2836C, 2uLL))
                        {
                          __int32 v217 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28378;
                        }

                        if (!wcsncmp(a2, dword_2838C, 2uLL))
                        {
                          __int32 v218 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28398;
                        }

                        if (!wcsncmp(a2, dword_283A8, 2uLL))
                        {
                          __int32 v219 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_283B4;
                        }

                        if (!wcsncmp(a2, dword_283C4, 2uLL))
                        {
                          __int32 v220 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_283D0;
                        }

                        if (!wcsncmp(a2, dword_283E0, 2uLL))
                        {
                          __int32 v221 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_283EC;
                        }

                        if (!wcsncmp(a2, dword_283FC, 2uLL))
                        {
                          __int32 v222 = a2[2];
                          if ((v222 - 12363) > 8)
                          {
                            unsigned int v223 = v222 - 12356;
                            if (v223 > 0x3D || ((1LL << v223) & 0x2400000000000001LL) == 0) {
                              goto LABEL_1032;
                            }
                          }

                          else if ((v222 & 1) == 0)
                          {
                            goto LABEL_1032;
                          }

                          size_t v5 = (const __int32 *)&unk_28408;
                          goto LABEL_309;
                        }

LABEL_1032:
                        if (!wcsncmp(a2, dword_2841C, 2uLL))
                        {
                          if ((__int32 v224 = a2[2], (v224 - 12382) >= 0xFFFFFFF7) && (v224 & 1) != 0
                            || (unsigned int v225 = v224 - 12414, v225 <= 0x15) && ((1 << v225) & 0x20401F) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28428;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2843C, 2uLL))
                        {
                          __int32 v226 = a2[2];
                          if ((v226 - 12382) >= 0xFFFFFFF7 && (v226 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28448;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28458, 2uLL))
                        {
                          __int32 v227 = a2[2];
                          if ((v227 - 12373) > 8)
                          {
                            unsigned int v228 = v227 - 12387;
                            if (v228 > 0x29 || ((1LL << v228) & 0x20000000003LL) == 0) {
                              goto LABEL_1049;
                            }
                          }

                          else if ((v227 & 1) == 0)
                          {
                            goto LABEL_1049;
                          }

                          size_t v5 = (const __int32 *)&unk_28464;
                          goto LABEL_309;
                        }

LABEL_1049:
                        if (!wcsncmp(a2, dword_28474, 2uLL))
                        {
                          __int32 v229 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28480;
                        }

                        if (!wcsncmp(a2, dword_28490, 2uLL))
                        {
                          __int32 v230 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2849C;
                        }

                        if (!wcsncmp(a2, dword_284AC, 2uLL))
                        {
                          unsigned __int32 v231 = a2[2] - 12383;
                          if (v231 <= 0x2E && ((1LL << v231) & 0x500000000081LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_284B8;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_284C8, 2uLL))
                        {
                          __int32 v232 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_284D4;
                        }

                        if (!wcsncmp(a2, dword_284E4, 2uLL))
                        {
                          __int32 v233 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_284F0;
                        }

                        if (!wcsncmp(a2, dword_28500, 2uLL))
                        {
                          __int32 v234 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2850C;
                          if ((v234 - 12425) < 5
                            || (((v234 - 12373) < 9) & v234) != 0)
                          {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_2851C, 2uLL))
                        {
                          __int32 v235 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28528;
                        }

                        if (!wcsncmp(a2, dword_28538, 2uLL))
                        {
                          __int32 v236 = a2[2];
                          if ((v236 - 12363) > 8)
                          {
                            if (v236 == 12356) {
                              goto LABEL_1076;
                            }
                          }

                          else if ((v236 & 1) != 0)
                          {
LABEL_1076:
                            size_t v5 = (const __int32 *)&unk_28544;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28558, 2uLL))
                        {
                          __int32 v237 = a2[2];
                          if ((v237 - 12363) > 8)
                          {
                            if (v237 == 12356) {
                              goto LABEL_1081;
                            }
                          }

                          else if ((v237 & 1) != 0)
                          {
LABEL_1081:
                            size_t v5 = (const __int32 *)&unk_28564;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28574, 2uLL))
                        {
                          __int32 v238 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28580;
                          if ((v238 - 12356) <= 0x3D
                            && ((1LL << (v238 - 68)) & 0x24000000800249FFLL) != 0)
                          {
                            goto LABEL_49;
                          }

                          if (v238 == 12431) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, dword_28590, 2uLL))
                        {
                          unsigned __int32 v239 = a2[2] - 12414;
                          if (v239 <= 0x15 && ((1 << v239) & 0x20481F) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_2859C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_285AC, 2uLL))
                        {
                          __int32 v240 = a2[2];
                          if ((v240 - 12364) > 8)
                          {
                            if (v240 == 12356) {
                              goto LABEL_1094;
                            }
                          }

                          else if ((v240 & 1) == 0)
                          {
LABEL_1094:
                            size_t v5 = (const __int32 *)&unk_285B8;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_285C8, 2uLL))
                        {
                          __int32 v241 = a2[2];
                          if ((v241 - 12364) > 8)
                          {
                            if (v241 == 12356) {
                              goto LABEL_1099;
                            }
                          }

                          else if ((v241 & 1) == 0)
                          {
LABEL_1099:
                            size_t v5 = (const __int32 *)&unk_285D4;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_285E4, 2uLL))
                        {
                          __int32 v242 = a2[2];
                          if ((v242 - 12363) > 8)
                          {
                            if (((v242 - 12356) > 0x1F || ((1 << (v242 - 68)) & 0x80020001) == 0)
                              && (v242 - 12425) >= 5)
                            {
                              goto LABEL_1111;
                            }
                          }

                          else if ((v242 & 1) == 0)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_285F0;
                            if (v242 == 12367 || v242 == 12369) {
                              goto LABEL_49;
                            }
                            goto LABEL_1111;
                          }

                          size_t v5 = (const __int32 *)&unk_285F0;
                          goto LABEL_309;
                        }

LABEL_1111:
                        if (!wcsncmp(a2, dword_28600, 2uLL))
                        {
                          __int32 v243 = a2[2];
                          if ((v243 - 12363) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_2860C;
                            if (v243 == 12356 || v243 == 12360) {
                              goto LABEL_49;
                            }
                          }

                          else if ((v243 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_2860C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2861C, 2uLL))
                        {
                          unsigned __int32 v244 = a2[2] - 12400;
                          if (v244 <= 0x23 && ((1LL << v244) & 0x800001249LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28628;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28638, 2uLL))
                        {
                          __int32 v245 = a2[2];
                          if ((v245 - 12382) >= 0xFFFFFFF7 && (v245 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28644;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28654, 2uLL))
                        {
                          __int32 v246 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28660;
                        }

                        if (!wcsncmp(a2, dword_28674, 2uLL) && (a2[2] - 12425) < 5)
                        {
                          size_t v5 = (const __int32 *)&unk_28680;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_28694, 2uLL))
                        {
                          __int32 v247 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_286A0;
                        }

                        if (!wcsncmp(a2, dword_286B0, 2uLL))
                        {
                          __int32 v248 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_286BC;
                        }

                        if (!wcsncmp(a2, dword_286CC, 2uLL))
                        {
                          __int32 v249 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_286D8;
                        }

                        if (!wcsncmp(a2, dword_286EC, 2uLL))
                        {
                          unsigned __int32 v250 = a2[2] - 12400;
                          if (v250 <= 0x23 && ((1LL << v250) & 0x800001249LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_286F8;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28708, 2uLL))
                        {
                          __int32 v251 = a2[2];
                          if ((v251 - 12363) > 8)
                          {
                            if (v251 == 12356) {
                              goto LABEL_1148;
                            }
                          }

                          else if ((v251 & 1) != 0)
                          {
LABEL_1148:
                            size_t v5 = (const __int32 *)&unk_28714;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28724, 2uLL))
                        {
                          __int32 v252 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28730;
                        }

                        if (!wcsncmp(a2, dword_28740, 2uLL))
                        {
                          unsigned __int32 v253 = a2[2] - 12356;
                          if (v253 <= 0x3D && ((1LL << v253) & 0x2C00000000000001LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_2874C;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2875C, 2uLL))
                        {
                          __int32 v254 = a2[2];
                          if ((v254 - 12382) >= 0xFFFFFFF7 && (v254 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28768;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28768;
                        }

                        if (!wcsncmp(a2, dword_28778, 2uLL))
                        {
                          __int32 v255 = a2[2];
                          if ((v255 - 12363) > 8)
                          {
                            if (v255 == 12356)
                            {
LABEL_1172:
                              size_t v5 = (const __int32 *)&unk_28784;
                              goto LABEL_309;
                            }
                          }

                          else if ((v255 & 1) != 0)
                          {
                            goto LABEL_1172;
                          }
                        }

                        if (!wcsncmp(a2, dword_28798, 2uLL))
                        {
                          __int32 v256 = a2[2];
                          if ((v256 - 12373) > 8)
                          {
                            if (v256 == 12428) {
                              goto LABEL_1172;
                            }
                          }

                          else if ((v256 & 1) != 0)
                          {
                            goto LABEL_1172;
                          }
                        }

                        if (!wcsncmp(a2, dword_287A4, 2uLL) && a2[2] == 12417)
                        {
                          size_t v5 = (const __int32 *)&unk_287B0;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_287C0, 2uLL))
                        {
                          __int32 v257 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_287CC;
                        }

                        if (!wcsncmp(a2, dword_287DC, 2uLL))
                        {
                          __int32 v258 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_287E8;
                        }

                        if (!wcsncmp(a2, dword_287F8, 2uLL))
                        {
                          __int32 v259 = a2[2];
                          if ((v259 - 12363) > 8)
                          {
                            if (v259 == 12356) {
                              goto LABEL_1187;
                            }
                          }

                          else if ((v259 & 1) != 0)
                          {
LABEL_1187:
                            size_t v5 = (const __int32 *)&unk_28804;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28818, 2uLL))
                        {
                          unsigned __int32 v260 = a2[2] - 12400;
                          if (v260 <= 0x23 && ((1LL << v260) & 0x800001249LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28824;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28834, 2uLL))
                        {
                          __int32 v261 = a2[2];
                          if ((v261 - 12382) >= 0xFFFFFFF7 && (v261 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28840;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28850, 2uLL) && a2[2] >> 1 == 6208)
                        {
                          size_t v5 = (const __int32 *)&unk_2885C;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_2886C, 2uLL))
                        {
                          __int32 v262 = a2[2];
                          if ((v262 - 12382) >= 0xFFFFFFF7 && (v262 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28878;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_2888C, 2uLL))
                        {
                          __int32 v263 = a2[2];
                          if ((v263 - 12363) > 8)
                          {
                            uint64_t v9 = 2LL;
                            size_t v5 = (const __int32 *)&unk_28898;
                            if ((v263 - 12373) <= 0x3E
                              && ((1LL << (v263 - 85)) & 0x40003E0000000001LL) != 0
                              || v263 == 12356)
                            {
                              goto LABEL_49;
                            }
                          }

                          else if ((v263 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28898;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_288A8, 2uLL))
                        {
                          __int32 v264 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_288B4;
                        }

                        if (!wcsncmp(a2, dword_288C8, 2uLL))
                        {
                          __int32 v265 = a2[2];
                          if ((v265 - 12364) > 8)
                          {
                            if (v265 == 12356) {
                              goto LABEL_1217;
                            }
                          }

                          else if ((v265 & 1) == 0)
                          {
LABEL_1217:
                            size_t v5 = (const __int32 *)&unk_288D4;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_288E4, 2uLL))
                        {
                          __int32 v266 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_288F0;
                        }

                        if (!wcsncmp(a2, dword_28904, 2uLL))
                        {
                          __int32 v267 = a2[2];
                          if ((v267 - 12382) >= 0xFFFFFFF7 && (v267 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28910;
                            goto LABEL_309;
                          }
                        }

                        if (!wcsncmp(a2, dword_28920, 2uLL))
                        {
                          __int32 v268 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_2892C;
                        }

                        if (!wcsncmp(a2, dword_28940, 2uLL))
                        {
                          __int32 v269 = a2[2];
                          if ((v269 - 12363) <= 8)
                          {
                            if ((v269 & 1) == 0) {
                              goto LABEL_1237;
                            }
LABEL_1236:
                            size_t v5 = (const __int32 *)&unk_2894C;
                            goto LABEL_309;
                          }

                          if ((v269 - 12356) <= 0x3D
                            && ((1LL << (v269 - 68)) & 0x2400000082020001LL) != 0
                            || (v269 - 12425) < 5)
                          {
                            goto LABEL_1236;
                          }
                        }

LABEL_1237:
                        if (!wcsncmp(a2, dword_2895C, 2uLL))
                        {
                          __int32 v270 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_28968;
                        }

                        if (!wcsncmp(a2, dword_28978, 2uLL) && a2[2] == 12428)
                        {
                          size_t v5 = (const __int32 *)&unk_28984;
                          goto LABEL_309;
                        }

                        if (!wcsncmp(a2, dword_28994, 2uLL))
                        {
                          __int32 v271 = a2[2];
                          if ((v271 - 12382) >= 0xFFFFFFF7 && (v271 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_289A0;
                            goto LABEL_309;
                          }

                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_289A0;
                        }

                        if (!wcsncmp(a2, dword_289B0, 2uLL))
                        {
                          __int32 v272 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_289BC;
                        }

                        if (!wcsncmp(a2, dword_289CC, 2uLL))
                        {
                          __int32 v273 = a2[2];
                          uint64_t v9 = 2LL;
                          size_t v5 = (const __int32 *)&unk_289D8;
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_289E8, 1uLL))
                        {
                          __int32 v274 = a2[1];
                          if ((v274 - 12356) < 7
                            || (v274 - 12372) >= 0xFFFFFFF7 && (v274 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_289F0;
LABEL_1341:
                            uint64_t v9 = 1LL;
                            goto LABEL_49;
                          }

                          uint64_t v9 = 1LL;
                          size_t v5 = (const __int32 *)&unk_289F0;
                          if ((v274 - 12364) <= 0x36
                            && ((1LL << (v274 - 76)) & 0x7C008004800041LL) != 0)
                          {
                            goto LABEL_49;
                          }

                          unsigned int v275 = v274 - 12425;
                          if (v275 <= 0xA && ((1 << v275) & 0x45F) != 0) {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_289F8, 1uLL))
                        {
                          unsigned __int32 v276 = a2[1] - 12383;
                          if (v276 <= 0x2E && ((1LL << v276) & 0x7C0080000881LL) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28A00;
                            goto LABEL_1341;
                          }
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A08, 1uLL))
                        {
                          __int32 v277 = a2[1];
                          if (v277 == 12360)
                          {
LABEL_1273:
                            size_t v5 = (const __int32 *)&unk_28A10;
                            goto LABEL_1341;
                          }

                          if ((v277 - 12363) > 8)
                          {
                            uint64_t v9 = 1LL;
                            size_t v5 = (const __int32 *)&unk_28A10;
                          }

                          else if ((v277 & 1) != 0)
                          {
                            goto LABEL_1273;
                          }
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A18, 1uLL))
                        {
                          __int32 v278 = a2[1];
                          if ((v278 - 12373) <= 8)
                          {
                            if ((v278 & 1) == 0) {
                              goto LABEL_1286;
                            }
LABEL_1285:
                            size_t v5 = (const __int32 *)&unk_28A20;
                            goto LABEL_1341;
                          }

                          unsigned int v279 = v278 - 12356;
                          if (v279 <= 0xD && ((1 << v279) & 0x2011) != 0) {
                            goto LABEL_1285;
                          }
                        }

LABEL_1286:
                        if (!wcsncmp(a2, (const __int32 *)&unk_28A28, 1uLL))
                        {
                          __int32 v280 = a2[1];
                          if ((v280 - 12364) <= 8)
                          {
                            if ((v280 & 1) != 0) {
                              goto LABEL_1294;
                            }
LABEL_1293:
                            size_t v5 = (const __int32 *)&unk_28A30;
                            goto LABEL_1341;
                          }

                          if ((v280 - 12356) <= 0x3D
                            && ((1LL << (v280 - 68)) & 0x2400000080000011LL) != 0
                            || (v280 - 12425) < 5)
                          {
                            goto LABEL_1293;
                          }
                        }

LABEL_1294:
                        if (!wcsncmp(a2, (const __int32 *)&unk_28A38, 1uLL))
                        {
                          __int32 v281 = a2[1];
                          if ((v281 - 12382) >= 0xFFFFFFF7 && (v281 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28A40;
                            goto LABEL_1341;
                          }
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A4C, 1uLL))
                        {
                          __int32 v282 = a2[1];
                          uint64_t v9 = 1LL;
                          size_t v5 = (const __int32 *)&unk_28A54;
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A5C, 1uLL))
                        {
                          __int32 v283 = a2[1];
                          uint64_t v9 = 1LL;
                          size_t v5 = (const __int32 *)&unk_28A64;
                          if (v283 == 12356
                            || (v283 - 12363) < 0xA
                            || (v283 - 12414) < 5
                            || v283 == 12435)
                          {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A6C, 1uLL))
                        {
                          __int32 v284 = a2[1];
                          uint64_t v9 = 1LL;
                          size_t v5 = (const __int32 *)&unk_28A74;
                          if ((v284 - 12356) < 7
                            || v284 == 12387
                            || v284 == 12431
                            || (v284 - 12363) < 0xA
                            || (v284 - 12425) < 5)
                          {
                            goto LABEL_49;
                          }
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A7C, 1uLL))
                        {
                          __int32 v285 = a2[1];
                          uint64_t v9 = 1LL;
                          size_t v5 = (const __int32 *)&unk_28A84;
                        }

                        if (!wcsncmp(a2, (const __int32 *)&unk_28A8C, 1uLL))
                        {
                          __int32 v286 = a2[1];
                          if ((v286 - 12363) > 8)
                          {
                            uint64_t v9 = 1LL;
                            size_t v5 = (const __int32 *)&unk_28A94;
                            if (v286 == 12356 || v286 == 12387) {
                              goto LABEL_49;
                            }
                          }

                          else if ((v286 & 1) != 0)
                          {
                            size_t v5 = (const __int32 *)&unk_28A94;
                            goto LABEL_1341;
                          }
                        }

                        __int32 v287 = a2[1];
                        if (v287 != 12360)
                        {
                          if ((v287 - 12363) > 8)
                          {
                            unsigned int v288 = v287 - 12387;
                            if (v288 > 0x30 || ((1LL << v288) & 0x107C2F8000001LL) == 0) {
                              goto LABEL_1329;
                            }
                          }

                          else if ((v287 & 1) == 0)
                          {
LABEL_1329:
                            if (!wcsncmp(a2, (const __int32 *)&unk_28AAC, 1uLL))
                            {
                              __int32 v289 = a2[1];
                              uint64_t v9 = 1LL;
                              size_t v5 = (const __int32 *)&unk_28AB4;
                            }

                            __int32 v290 = a2[1];
                            if (v290 == 12356) {
                              goto LABEL_1340;
                            }
                            if ((v290 - 12373) > 8)
                            {
                              if (v290 != 12428) {
                                return 0LL;
                              }
                            }

                            else
                            {
LABEL_1337:
                              if ((v290 & 1) == 0) {
                                return 0LL;
                              }
                            }

LABEL_1340:
                            size_t v5 = (const __int32 *)&unk_28AC4;
                            goto LABEL_1341;
                          }
                        }

                        size_t v5 = (const __int32 *)&unk_28AA4;
                        goto LABEL_1341;
                      }

                      __int32 v114 = a2[2];
                      if ((v114 - 12364) > 8)
                      {
                        if (v114 != 12356) {
                          goto LABEL_529;
                        }
                      }

                      else if ((v114 & 1) != 0)
                      {
                        goto LABEL_529;
                      }

                      size_t v5 = (const __int32 *)&unk_27704;
                      goto LABEL_309;
                    }

                    __int32 v112 = a2[2];
                    if ((v112 - 12364) > 8)
                    {
                      if (v112 != 12356) {
                        goto LABEL_474;
                      }
                    }

                    else if ((v112 & 1) != 0)
                    {
                      goto LABEL_474;
                    }

                    size_t v5 = (const __int32 *)&unk_276AC;
                    goto LABEL_309;
                  }

                  __int32 v99 = a2[2];
                  if ((v99 - 12356) >= 7 && ((v99 - 12372) < 0xFFFFFFF7 || (v99 & 1) == 0))
                  {
                    if ((v99 - 12373) > 8)
                    {
                      uint64_t v9 = 2LL;
                      size_t v5 = (const __int32 *)&unk_27534;
                      if (v99 == 12356 || v99 == 12387 || v99 == 12431) {
                        goto LABEL_49;
                      }
                      goto LABEL_451;
                    }

                    if ((v99 & 1) == 0) {
                      goto LABEL_451;
                    }
                  }

                  size_t v5 = (const __int32 *)&unk_27534;
                  goto LABEL_309;
                }

                __int32 v96 = a2[2];
                if ((v96 - 12356) >= 7)
                {
                  if ((v96 - 12363) > 8)
                  {
                    unsigned int v100 = v96 - 12373;
                    if (v100 > 0x3A || ((1LL << v100) & 0x480000000004001LL) == 0) {
                      goto LABEL_430;
                    }
                  }

                  else if ((v96 & 1) == 0)
                  {
                    goto LABEL_430;
                  }
                }

                size_t v5 = (const __int32 *)&unk_274B8;
                goto LABEL_309;
              }

              __int32 v81 = a2[2];
              if ((v81 - 12364) > 8)
              {
                if (v81 != 12356) {
                  goto LABEL_351;
                }
              }

              else if ((v81 & 1) != 0)
              {
                goto LABEL_351;
              }

              size_t v5 = (const __int32 *)&unk_27290;
              goto LABEL_309;
            }

            __int32 v66 = a2[2];
            if ((v66 - 12425) >= 5)
            {
              if ((v66 - 12363) > 8)
              {
                uint64_t v9 = 2LL;
                size_t v5 = (const __int32 *)&unk_270BC;
                if (v66 == 12387 || v66 == 12417) {
                  goto LABEL_49;
                }
                goto LABEL_212;
              }

              if ((v66 & 1) == 0) {
                goto LABEL_212;
              }
            }

            size_t v5 = (const __int32 *)&unk_270BC;
            goto LABEL_309;
          }

          __int32 v61 = a2[3];
          if ((v61 - 12364) > 8)
          {
            if (v61 != 12356) {
              goto LABEL_207;
            }
          }

          else if ((v61 & 1) != 0)
          {
            goto LABEL_207;
          }

          size_t v5 = (const __int32 *)&unk_2701C;
          goto LABEL_62;
        }

        __int32 v34 = a2[3];
        if ((v34 - 12364) > 8)
        {
          if (v34 != 12356) {
            goto LABEL_131;
          }
        }

        else if ((v34 & 1) != 0)
        {
          goto LABEL_131;
        }

        size_t v5 = (const __int32 *)&unk_26AEC;
        goto LABEL_62;
      }

      __int32 v28 = a2[3];
      if ((v28 - 12356) >= 7)
      {
        if ((v28 - 12373) > 8)
        {
          uint64_t v9 = 3LL;
          size_t v5 = (const __int32 *)&unk_26978;
          if (v28 == 12387 || v28 == 12431) {
            goto LABEL_49;
          }
          goto LABEL_33;
        }

        if ((v28 & 1) == 0) {
          goto LABEL_33;
        }
      }

      size_t v5 = (const __int32 *)&unk_26978;
      goto LABEL_62;
    }

    __int32 v21 = a2[3];
    if ((v21 - 12373) > 8)
    {
    }

    else if ((v21 & 1) == 0)
    {
      goto LABEL_20;
    }

    size_t v5 = (const __int32 *)&unk_26804;
    goto LABEL_62;
  }

  size_t v5 = (const __int32 *)&unk_266A8;
LABEL_48:
  uint64_t v9 = 4LL;
LABEL_49:
  wcscpy(a3, v5);
  return v9;
}

size_t ktoau::IsHira2(uint64_t a1, const __int32 *a2, __int32 *a3)
{
  if (!dword_38398[0]) {
    return 0LL;
  }
  int v5 = 1;
  for (uint64_t i = dword_38398; ; i += 10)
  {
    size_t v7 = wcslen(i);
    if (!wcsncmp(a2, i, v7)) {
      break;
    }
    int v8 = i[10];
    ++v5;
    if (!v8) {
      return 0LL;
    }
  }

  wcscpy(a3, &dword_38398[10 * v5]);
  return wcslen(i);
}

size_t ktoau::IsHiraKatu(uint64_t a1, const __int32 *a2, __int32 *a3)
{
  if (!dword_32510) {
    return 0LL;
  }
  int v5 = &dword_32510;
  int v6 = 1;
  for (uint64_t i = dword_38398; ; i += 10)
  {
    size_t v8 = wcslen(v5);
    if (!wcsncmp(a2, v5, v8)) {
      break;
    }
    int v9 = v5[10];
    v5 += 10;
    ++v6;
    if (!v9) {
      return 0LL;
    }
  }

  wcscpy(a3, &dword_38398[10 * v6]);
  return wcslen(i);
}

size_t ktoau::ZenToHan(uint64_t a1, const __int32 *a2, __int32 *a3)
{
  *a3 = 0;
  if (!dword_38AF0[0]) {
    return 0LL;
  }
  int v5 = 0;
  for (uint64_t i = dword_38AF0; ; i += 6)
  {
    size_t v7 = wcslen(i);
    if (!wcsncmp(a2, i, v7)) {
      break;
    }
    v5 += 2;
    if (!i[6]) {
      return 0LL;
    }
  }

  wcscpy(a3, &dword_38AF0[3 * (v5 & 0xFFFFFFFE | 1)]);
  return wcslen(a3);
}

uint64_t ktoau::IsHenSuushi(uint64_t a1, __int32 *a2)
{
  uint64_t v4 = wcsncmp(a2, dword_2A604, 2uLL);
  if (!(_DWORD)v4)
  {
    unsigned int IsMojiMode = ktoau::IsMojiMode(v4, a2 + 2);
    if (IsMojiMode <= 0xE && ((1 << IsMojiMode) & 0x4108) != 0) {
      return 0LL;
    }
  }

  int IsKanjiNa = ktoau::IsKanjiNa(a1, a2, 0);
  uint64_t v6 = 0LL;
  if (!IsKanjiNa && dword_3A3BC)
  {
    uint64_t v6 = 1LL;
    for (uint64_t i = &dword_3A3BC; wcsncmp(i, a2, 1uLL); i += 3)
    {
      int v8 = i[3];
      uint64_t v6 = (v6 + 1);
      if (!v8) {
        return 0LL;
      }
    }
  }

  return v6;
}

uint64_t ktoau::SetHenSuushi(int a1, __int32 *a2, int16x4_t *a3, __int32 *a4, unsigned int a5)
{
  unsigned int v9 = 0;
  __int32 v10 = a2 - 1;
  __int32 v11 = a2 - 2;
  for (uint64_t i = a2 - 2; ; --i)
  {
    uint64_t v13 = i[1];
    unsigned int v14 = v13 - 48;
    if ((_DWORD)v13 != 48 && (_DWORD)v13 != 44) {
      break;
    }
    if ((_DWORD)v13 == 48) {
      ++v9;
    }
  }

  if (!v9)
  {
    uint64_t result = wcsncmp(a4, (const __int32 *)&unk_2A610, 1uLL);
    if ((_DWORD)result)
    {
      __int32 v28 = v10;
      BOOL v16 = 1;
      uint64_t result = wcsncmp(a4, (const __int32 *)&unk_2A644, 1uLL);
      if ((_DWORD)result) {
        goto LABEL_13;
      }
      if (((1LL << v13) & 0x2B5000000000000LL) == 0)
      {
        if (((1LL << v13) & 0x14A000000000000LL) == 0) {
          return result;
        }
LABEL_62:
        __int32 v18 = (const __int32 *)&unk_2A64C;
        goto LABEL_63;
      }

LABEL_52:
      __int32 v20 = (const __int32 *)&unk_28B30;
LABEL_53:
      __int32 v21 = a2;
LABEL_54:
      wcscpy(v21, v20);
      a3->i16[0] = a5;
      return 1LL;
    }

    if (((1LL << v13) & 0x2B5000000000000LL) == 0)
    {
      if (((1LL << v13) & 0x142000000000000LL) == 0)
      {
        if (v13 != 51) {
          return result;
        }
        goto LABEL_70;
      }

LABEL_56:
      __int32 v19 = (const __int32 *)&unk_2A634;
      goto LABEL_139;
    }

LABEL_49:
    __int32 v18 = (const __int32 *)&unk_2A618;
    goto LABEL_63;
  }

  __int32 v28 = a2 - 1;
  unsigned int v15 = v13 - 58;
  BOOL v16 = v15 < 0xFFFFFFF7;
  if (!wcsncmp(a4, (const __int32 *)&unk_2A610, 1uLL))
  {
    if (v15 >= 0xFFFFFFF7 && v9 - 8 > 0xFFFFFFF8)
    {
      if (v9 > 2)
      {
LABEL_70:
        __int32 v19 = (const __int32 *)&unk_2A624;
        goto LABEL_139;
      }

      goto LABEL_56;
    }

    goto LABEL_49;
  }

  if (!wcsncmp(a4, (const __int32 *)&unk_2A644, 1uLL))
  {
    if (v15 >= 0xFFFFFFF7) {
      goto LABEL_62;
    }
    goto LABEL_52;
  }

  unsigned int v14 = 0;
LABEL_13:
  if (!wcsncmp(a4, (const __int32 *)&unk_2A658, 1uLL)
    || !wcsncmp(a4, (const __int32 *)&unk_2A660, 1uLL)
    || !wcsncmp(a4, (const __int32 *)&unk_2A668, 1uLL))
  {
    if (v16)
    {
      if (v14 > 9) {
        return 0LL;
      }
      if (((1 << v14) & 0x2B5) != 0)
      {
LABEL_38:
        __int32 v18 = (const __int32 *)&unk_2A670;
        goto LABEL_63;
      }
    }

    else if (v9 - 8 <= 0xFFFFFFF8)
    {
      goto LABEL_38;
    }

    __int32 v19 = (const __int32 *)&unk_2A67C;
    goto LABEL_139;
  }

  if (!wcsncmp(a4, (const __int32 *)&unk_2A68C, 1uLL))
  {
    if (v16)
    {
      if (v14 > 9) {
        return 0LL;
      }
      if (((1 << v14) & 0x2B5) != 0)
      {
LABEL_68:
        __int32 v18 = (const __int32 *)&unk_2A694;
        goto LABEL_63;
      }
    }

    else if (v9 - 8 <= 0xFFFFFFF8)
    {
      goto LABEL_68;
    }

    __int32 v19 = (const __int32 *)&unk_2A6A0;
    goto LABEL_139;
  }

  if (wcsncmp(a4, (const __int32 *)&unk_2A6B0, 1uLL) && wcsncmp(a4, (const __int32 *)&unk_2A6B8, 1uLL))
  {
    if (wcsncmp(a4, (const __int32 *)&unk_2A6F8, 1uLL))
    {
      if (wcsncmp(a4, (const __int32 *)&unk_2A720, 1uLL)
        && wcsncmp(a4, (const __int32 *)&unk_2A728, 1uLL)
        && wcsncmp(a4, (const __int32 *)&unk_2A730, 2uLL))
      {
        if (wcsncmp(a4, (const __int32 *)&unk_2A748, 1uLL))
        {
          if (wcsncmp(a4, (const __int32 *)&unk_2A76C, 1uLL))
          {
            if (wcsncmp(a4, (const __int32 *)&unk_2A794, 1uLL) && wcsncmp(a4, (const __int32 *)&unk_2A79C, 2uLL))
            {
              if (wcsncmp(a4, (const __int32 *)&unk_2A7C0, 1uLL))
              {
                if (wcsncmp(a4, (const __int32 *)&unk_2A7E8, 1uLL))
                {
                  if (wcsncmp(a4, (const __int32 *)&unk_2A7F0, 1uLL))
                  {
                    if (!wcsncmp(a4, (const __int32 *)&unk_28A5C, 1uLL))
                    {
                      if (v16)
                      {
                        switch(v14)
                        {
                          case 1u:
                            __int32 v18 = (const __int32 *)&unk_2A8A8;
                            goto LABEL_183;
                          case 2u:
                            __int32 v18 = (const __int32 *)&unk_2A8B8;
                            goto LABEL_183;
                          case 3u:
                            __int32 v18 = (const __int32 *)&unk_2A8C8;
                            goto LABEL_183;
                          case 4u:
                            __int32 v18 = (const __int32 *)&unk_2A8D8;
                            goto LABEL_183;
                          case 5u:
                            __int32 v18 = (const __int32 *)&unk_2A8E8;
                            goto LABEL_183;
                          case 6u:
                            __int32 v18 = (const __int32 *)&unk_2A8F8;
                            goto LABEL_183;
                          case 7u:
                            __int32 v18 = (const __int32 *)&unk_2A908;
                            goto LABEL_183;
                          case 8u:
                            __int32 v18 = (const __int32 *)&unk_2A918;
                            goto LABEL_183;
                          case 9u:
                            __int32 v19 = (const __int32 *)&unk_2A928;
                            goto LABEL_186;
                          default:
                            break;
                        }
                      }

                      __int32 v20 = (const __int32 *)&unk_28A64;
                      goto LABEL_53;
                    }

                    return 0LL;
                  }

                  if (v16)
                  {
                    switch(v14)
                    {
                      case 2u:
                        __int32 v18 = (const __int32 *)&unk_2A824;
                        goto LABEL_183;
                      case 3u:
                        __int32 v18 = (const __int32 *)&unk_2A834;
                        goto LABEL_183;
                      case 4u:
                        if ((*i - 48) < 0xA)
                        {
                          __int32 v20 = (const __int32 *)&unk_28DF4;
                          goto LABEL_53;
                        }

                        __int32 v18 = (const __int32 *)&unk_2A844;
LABEL_183:
                        unsigned __int32 v22 = v28;
                        break;
                      case 5u:
                        __int32 v18 = (const __int32 *)&unk_2A854;
                        goto LABEL_183;
                      case 6u:
                        __int32 v18 = (const __int32 *)&unk_2A864;
                        goto LABEL_183;
                      case 7u:
                        __int32 v18 = (const __int32 *)&unk_2A874;
                        goto LABEL_183;
                      case 8u:
                        __int32 v18 = (const __int32 *)&unk_2A884;
                        goto LABEL_183;
                      case 9u:
                        __int32 v19 = (const __int32 *)&unk_2A894;
LABEL_186:
                        __int32 v26 = v28;
                        goto LABEL_140;
                      default:
                        goto LABEL_165;
                    }

                    goto LABEL_64;
                  }

                  if (v9 == 1)
                  {
                    __int32 v27 = i[1];
                    if (v27 == 50)
                    {
                      if ((*i - 48) >= 0xA)
                      {
                        __int32 v20 = (const __int32 *)&unk_2A808;
                        goto LABEL_151;
                      }
                    }

                    else if (v27 == 49 && (*i - 48) >= 0xA)
                    {
                      __int32 v20 = (const __int32 *)&unk_2A7F8;
LABEL_151:
                      __int32 v21 = v11;
                      goto LABEL_54;
                    }
                  }

LABEL_165:
                  __int32 v18 = (const __int32 *)&unk_2A818;
LABEL_63:
                  unsigned __int32 v22 = a2;
LABEL_64:
                  wcscpy(v22, v18);
                  a3->i16[0] = a5;
                  a3->i16[1] = a5;
                  return 2LL;
                }

                if (v16)
                {
                  if (v14 <= 9)
                  {
                    if (((1 << v14) & 0x2B5) == 0) {
                      goto LABEL_138;
                    }
LABEL_143:
                    __int32 v18 = (const __int32 *)&unk_29F84;
                    goto LABEL_63;
                  }

                  return 0LL;
                }

                if (v9 != 1) {
                  goto LABEL_143;
                }
LABEL_138:
                __int32 v19 = (const __int32 *)&unk_2A7C8;
LABEL_139:
                __int32 v26 = a2;
LABEL_140:
                wcscpy(v26, v19);
                a3->i16[0] = a5;
                a3->i16[1] = a5;
                uint64_t result = 3LL;
                goto LABEL_141;
              }

              if (v16)
              {
                if (v14 > 9) {
                  return 0LL;
                }
                if (((1 << v14) & 0x2B5) != 0) {
                  goto LABEL_143;
                }
                if (((1 << v14) & 0x142) != 0) {
                  goto LABEL_138;
                }
              }

              else
              {
                if (v9 - 8 <= 0xFFFFFFF8) {
                  goto LABEL_143;
                }
                if (v9 <= 2) {
                  goto LABEL_138;
                }
              }

              __int32 v19 = (const __int32 *)&unk_2A7D8;
              goto LABEL_139;
            }

            if (v16)
            {
              if (v14 > 9) {
                return 0LL;
              }
              if (((1 << v14) & 0x2B5) != 0)
              {
LABEL_106:
                __int32 v18 = (const __int32 *)&unk_2A7A4;
                goto LABEL_63;
              }
            }

            else if (v9 != 1)
            {
              goto LABEL_106;
            }

            __int32 v19 = (const __int32 *)&unk_2A7B0;
            goto LABEL_139;
          }

          if (v16)
          {
            if (v14 > 9) {
              return 0LL;
            }
            if (((1 << v14) & 0x2B7) == 0)
            {
LABEL_118:
              __int32 v19 = (const __int32 *)&unk_2A774;
              goto LABEL_139;
            }
          }

          else if (v9 - 8 > 0xFFFFFFF8)
          {
            if (v9 > 2)
            {
              __int32 v19 = (const __int32 *)&unk_2A784;
              goto LABEL_139;
            }

            goto LABEL_118;
          }

          __int32 v18 = (const __int32 *)&unk_28CB0;
          goto LABEL_63;
        }

        if (v16)
        {
          if (v14 > 9) {
            return 0LL;
          }
          if (((1 << v14) & 0x2B5) != 0)
          {
LABEL_102:
            __int32 v18 = (const __int32 *)&unk_2A750;
            goto LABEL_63;
          }
        }

        else if (v9 - 8 <= 0xFFFFFFF8)
        {
          goto LABEL_102;
        }

        __int32 v19 = (const __int32 *)&unk_2A75C;
        goto LABEL_139;
      }

      if (v16)
      {
        if (v14 > 9) {
          return 0LL;
        }
        if (((1 << v14) & 0x2B5) != 0)
        {
LABEL_78:
          __int32 v18 = (const __int32 *)&unk_2A090;
          goto LABEL_63;
        }
      }

      else if (v9 - 8 <= 0xFFFFFFF8)
      {
        goto LABEL_78;
      }

      __int32 v19 = (const __int32 *)&unk_2A738;
      goto LABEL_139;
    }

    if (v16)
    {
      if (v14 > 9) {
        return 0LL;
      }
      if (((1 << v14) & 0x2B5) == 0)
      {
        if (((1 << v14) & 0x142) != 0)
        {
LABEL_85:
          __int32 v19 = (const __int32 *)&unk_2A700;
          goto LABEL_139;
        }

LABEL_95:
        __int32 v19 = (const __int32 *)&unk_2A710;
        goto LABEL_139;
      }
    }

    else if (v9 - 8 > 0xFFFFFFF8)
    {
      if (v9 <= 2) {
        goto LABEL_85;
      }
      goto LABEL_95;
    }

    __int32 v18 = (const __int32 *)&unk_2A468;
    goto LABEL_63;
  }

  if (v16)
  {
    if (v14 > 9) {
      return 0LL;
    }
    if (((1 << v14) & 0x2B5) != 0)
    {
      __int32 v19 = dword_2A6C0;
      goto LABEL_139;
    }

    if (((1 << v14) & 0x142) != 0) {
      __int32 v25 = (const __int32 *)&unk_2A6D0;
    }
    else {
      __int32 v25 = (const __int32 *)&unk_2A6E4;
    }
    wcscpy(a2, v25);
    *a3 = vdup_n_s16(a5);
    return 4LL;
  }

  if (v9 - 8 > 0xFFFFFFF8)
  {
    int16x4_t v23 = vdup_n_s16(a5);
    if (v9 > 2) {
      __int32 v24 = (const __int32 *)&unk_2A6E4;
    }
    else {
      __int32 v24 = (const __int32 *)&unk_2A6D0;
    }
    wcscpy(a2, v24);
    *a3 = v23;
    return 4LL;
  }

  wcscpy(a2, dword_2A6C0);
  a3->i16[0] = a5;
  a3->i16[1] = a5;
  uint64_t result = 2LL;
LABEL_141:
  a3->i16[2] = a5;
  return result;
}

uint64_t ktoau::IsFukuKanji(int a1, const __int32 *a2, __int32 *a3)
{
  if (dword_3A500[0])
  {
    uint64_t v5 = 1LL;
    uint64_t v6 = dword_3A500;
    while (1)
    {
      size_t v7 = wcslen(v6);
      if (!wcsncmp(a2, v6, v7)) {
        break;
      }
      int v8 = v6[5];
      v6 += 5;
      uint64_t v5 = (v5 + 1);
      if (!v8) {
        goto LABEL_5;
      }
    }

    unsigned int v9 = &dword_3A500[5 * v5];
  }

  else
  {
LABEL_5:
    if (*a2 != 25620) {
      return 0LL;
    }
    uint64_t v5 = 1LL;
    unsigned int v9 = (const __int32 *)&unk_2A93C;
  }

  wcscpy(a3, v9);
  return v5;
}

uint64_t ktoau::IsKanSuujiLen(uint64_t IsMojiMode, uint64_t a2)
{
  LODWORD(v2) = 0;
  uint64_t v3 = (int *)(a2 + 4);
  do
  {
    unsigned int IsMojiMode = ktoau::IsMojiMode(IsMojiMode, v3);
    uint64_t v2 = (v2 + 1);
    ++v3;
  }

  while ((_DWORD)IsMojiMode == 14);
  return v2;
}

uint64_t ktoau::SetKanSuuji(uint64_t a1, __int32 *a2, _WORD *a3, int *a4, int a5)
{
  uint64_t v5 = a3;
  int v6 = *a4;
  if (*a4 == 21315)
  {
    char v7 = 0;
    *a2++ = 49;
    *a3 = a5;
    uint64_t v5 = a3 + 1;
    ++a5;
    int v8 = a4[1];
    ++a4;
    int v6 = v8;
    uint64_t result = 1LL;
  }

  else if (a4[1] == 21315)
  {
    uint64_t v10 = 0LL;
    int v11 = 12295;
    while (v6 != v11)
    {
      int v11 = dword_2A964[++v10];
      if ((_DWORD)v10 == 10)
      {
        int v12 = 0;
        goto LABEL_10;
      }
    }

    int v12 = v10 + 1;
LABEL_10:
    *a2++ = v12 + 47;
    *a3 = a5;
    int v13 = a4[2];
    a4 += 2;
    int v6 = v13;
    if (!v13)
    {
      __int16 v26 = a5 + 1;
      if (v12 == 3)
      {
        wcscpy(a2, dword_2A948);
        v5[1] = v26;
        v5[2] = v26;
        uint64_t result = 4LL;
        v5[3] = v26;
      }

      else
      {
        wcscpy(a2, dword_2A958);
        v5[1] = v26;
        v5[2] = v26;
        return 3LL;
      }

      return result;
    }

    char v7 = 0;
    a5 += 2;
    uint64_t result = 1LL;
    uint64_t v5 = a3 + 1;
  }

  else
  {
    uint64_t result = 0LL;
    char v7 = 1;
  }

  if (v6 == 30334)
  {
    char v14 = 0;
    *a2++ = 49;
    *v5++ = a5;
    uint64_t result = (result + 1);
    ++a5;
    ++a4;
  }

  else if (a4[1] == 30334)
  {
    int v15 = 12295;
    uint64_t v16 = 1LL;
    while (v6 != v15)
    {
      int v15 = dword_2A964[v16++];
      if ((_DWORD)v16 == 11)
      {
        int v17 = 47;
        goto LABEL_22;
      }
    }

    int v17 = v16 + 47;
LABEL_22:
    char v14 = 0;
    *a2++ = v17;
    *v5++ = a5;
    uint64_t result = (result + 1);
    a5 += 2;
    a4 += 2;
  }

  else if ((v7 & 1) != 0)
  {
    char v14 = 1;
  }

  else
  {
    char v14 = 0;
    *a2++ = 48;
    *v5++ = a5;
    uint64_t result = (result + 1);
  }

  int v18 = *a4;
  if (*a4 == 21313)
  {
    *a2 = 49;
    *uint64_t v5 = a5++;
    ++a4;
  }

  else if (a4[1] == 21313)
  {
    int v19 = 12295;
    uint64_t v20 = 1LL;
    while (v18 != v19)
    {
      int v19 = dword_2A964[v20++];
      if ((_DWORD)v20 == 11)
      {
        int v21 = 47;
        goto LABEL_35;
      }
    }

    int v21 = v20 + 47;
LABEL_35:
    *a2 = v21;
    *uint64_t v5 = a5;
    a5 += 2;
    a4 += 2;
  }

  else
  {
    if ((v14 & 1) != 0)
    {
      if (!v18) {
        return result;
      }
      goto LABEL_39;
    }

    *a2 = 48;
    *uint64_t v5 = a5++;
  }

  ++v5;
  ++a2;
  int v18 = *a4;
  if (!*a4)
  {
    *a2 = 48;
    *uint64_t v5 = a5;
    return (result + 2);
  }

  LODWORD(result) = result + 1;
  do
  {
LABEL_39:
    uint64_t v22 = 0LL;
    int v23 = 12295;
    while (v18 != v23)
    {
      int v23 = dword_2A964[++v22];
      if ((_DWORD)v22 == 10)
      {
        int v24 = 0;
        goto LABEL_44;
      }
    }

    int v24 = v22 + 1;
LABEL_44:
    *a2++ = v24 + 47;
    *v5++ = a5;
    uint64_t result = (result + 1);
    int v25 = a4[1];
    ++a4;
    int v18 = v25;
    ++a5;
  }

  while (v25);
  return result;
}

uint64_t ktoau::IsKanSuuji(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = 0LL;
  int v3 = 12295;
  while (*a2 != v3)
  {
    int v3 = dword_2A964[++v2];
    if ((_DWORD)v2 == 10) {
      return 0LL;
    }
  }

  return (v2 + 1);
}

size_t ktoau::TanKanji1Set(uint64_t a1, int *a2, uint64_t a3)
{
  int v3 = *a2;
  BOOL v4 = *a2 == 19132 || v3 == 19410;
  unsigned int v5 = v3 - 64256;
  if (!v4 && v5 < 0xFFFF5300) {
    return 0LL;
  }
  fseek(*(FILE **)(a1 + 112), 0LL, 0);
  bzero(&__ptr, 0x400uLL);
  size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 112));
  if (result)
  {
    uint64_t v10 = 0LL;
    do
    {
      while (v24[v10 - 1])
      {
        size_t result = fread(&v24[v10++], 2uLL, 1uLL, *(FILE **)(a1 + 112));
        if (!result) {
          return result;
        }
      }

      __int16 v11 = __ptr;
      if (__ptr)
      {
        int v12 = v24;
        do
        {
          *(v12 - 1) = (unsigned __int16)~v11;
          int v13 = *v12++;
          __int16 v11 = v13;
        }

        while (v13);
        int v14 = __ptr;
        if (__ptr == *a2)
        {
          if (__ptr == 32)
          {
            size_t result = 0LL;
LABEL_26:
            uint64_t v16 = 0LL;
            int v17 = result;
LABEL_27:
            int v18 = v17 + 1;
            int v19 = &v24[v17];
            while (1)
            {
              int v21 = *v19++;
              int v20 = v21;
              if (!v21) {
                break;
              }
              int v17 = v18;
              if ((v20 - 65382) > 0x39)
              {
                ++v18;
                if (v20 != 32) {
                  continue;
                }
              }

              *(_DWORD *)(a3 + 4 * v16++) = v20;
              goto LABEL_27;
            }

            *(_DWORD *)(a3 + 4LL * v16) = 0;
            return result;
          }

LABEL_23:
          uint64_t v15 = 0LL;
          while (v14 == a2[v15])
          {
            size_t result = v15 + 1;
            int v14 = v24[v15++];
            if (v14 == 32) {
              goto LABEL_26;
            }
          }
        }
      }

      else
      {
        int v14 = *a2;
        if (!*a2) {
          goto LABEL_23;
        }
      }

      bzero(&__ptr, 0x400uLL);
      size_t result = fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 112));
      uint64_t v10 = 0LL;
    }

    while (result);
  }

  return result;
}

size_t ktoau::IsJoshi(uint64_t a1, const __int32 *a2, __int32 *a3)
{
  if (!dword_3B4B4[0]) {
    return 0LL;
  }
  int v5 = 1;
  for (uint64_t i = dword_3B4B4; ; i += 10)
  {
    size_t v7 = wcslen(i);
    if (!wcsncmp(a2, i, v7)) {
      break;
    }
    int v8 = i[10];
    ++v5;
    if (!v8) {
      return 0LL;
    }
  }

  wcscpy(a3, &dword_3B4B4[10 * v5]);
  return wcslen(i);
}

size_t ktoau::IsSetKei(uint64_t a1, const __int32 *a2, __int32 *a3)
{
  if (!dword_3B9DC[0]) {
    return 0LL;
  }
  int v5 = 1;
  for (uint64_t i = dword_3B9DC; ; i += 10)
  {
    size_t v7 = wcslen(i);
    if (!wcsncmp(a2, i, v7)) {
      break;
    }
    int v8 = i[10];
    ++v5;
    if (!v8) {
      return 0LL;
    }
  }

  wcscpy(a3, &dword_3B9DC[10 * v5]);
  return wcslen(i);
}

uint64_t ktoau::IsHirakiKako(uint64_t a1, int *a2)
{
  int v2 = *a2;
  int v3 = 65288;
  BOOL v4 = &dword_2A994;
  while (v2 != v3)
  {
    int v5 = *v4++;
    int v3 = v5;
    if (!v5)
    {
      int v6 = 40;
      size_t v7 = &dword_2A9C8;
      while (v6 != v2)
      {
        int v8 = *v7++;
        int v6 = v8;
        if (!v8) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return 1LL;
}

uint64_t ktoau::IsToziKako(uint64_t a1, int *a2)
{
  int v2 = *a2;
  int v3 = 12289;
  BOOL v4 = &dword_2A9E4;
  while (v2 != v3)
  {
    int v5 = *v4++;
    int v3 = v5;
    if (!v5)
    {
      int v6 = 46;
      size_t v7 = &dword_2AA38;
      while (v6 != v2)
      {
        int v8 = *v7++;
        int v6 = v8;
        if (!v8) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return 1LL;
}

size_t ktoau::IsTokuSuji(uint64_t a1, int *a2, __int32 *a3)
{
  int v3 = *(a2 - 1);
  unsigned int v4 = v3 - 49;
  unsigned int v5 = v3 - 65297;
  if (v4 < 9 || v5 < 9) {
    return 0LL;
  }
  int IsKanjiNa = ktoau::IsKanjiNa(a1, a2, 0);
  size_t result = 0LL;
  if (!IsKanjiNa && dword_3BC84[0])
  {
    int v11 = 0;
    for (uint64_t i = dword_3BC84; ; i += 20)
    {
      size_t v13 = wcslen(i);
      if (!wcsncmp(a2, i, v13)) {
        break;
      }
      v11 += 2;
      if (!i[20]) {
        return 0LL;
      }
    }

    wcscpy(a3, &dword_3BC84[10 * (v11 & 0xFFFFFFFE | 1)]);
    return wcslen(i);
  }

  return result;
}

uint64_t ktoau::SetKigou(uint64_t a1, _DWORD *a2, uint64_t a3, _WORD *a4, __int16 a5)
{
  if (!fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 128))) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  p_ptr = &__ptr;
  while (1)
  {
    while (*(&__ptr + v10) != 13)
    {
      ++v10;
      p_ptr = &__ptr + v10;
      if (!fread(p_ptr, 2uLL, 1uLL, *(FILE **)(a1 + 128))) {
        return 0LL;
      }
    }

    size_t v12 = fread(p_ptr, 2uLL, 1uLL, *(FILE **)(a1 + 128));
    if (__ptr == *a2 && (v23 == 32 || v23 == a2[1])) {
      break;
    }
    p_ptr = &__ptr;
    bzero(&__ptr, 0x400uLL);
    uint64_t v10 = 0LL;
    if (!fread(&__ptr, 2uLL, 1uLL, *(FILE **)(a1 + 128))) {
      return 0LL;
    }
  }

  int *p_ptr = 0;
  if (v23 == 32)
  {
    uint64_t v13 = 2LL;
  }

  else
  {
    if (v24 != 32) {
      return 0LL;
    }
    uint64_t v13 = 3LL;
  }

  unsigned __int32 v14 = *(&__ptr + v13);
  if (!v14) {
    return 0LL;
  }
  uint64_t v15 = 0LL;
  uint64_t v16 = &__ptr + v13;
  __int128 v17 = 0uLL;
  do
  {
    v21[6] = v17;
    v21[7] = v17;
    v21[4] = v17;
    v21[5] = v17;
    v21[2] = v17;
    v21[3] = v17;
    v21[0] = v17;
    v21[1] = v17;
    if (v14 >> 8 == 40 || v14 - 65376 < 0x40 || v14 - 32 <= 0x5F)
    {
      *(_DWORD *)(a3 + 4LL * (int)v15) = v14;
      uint64_t v15 = (v15 + 1);
    }

    else
    {
      size_t v12 = ktoau::ZenToHan(v12, v16, (__int32 *)v21);
      if ((_DWORD)v12)
      {
        wcscpy((__int32 *)(a3 + 4LL * (int)v15), (const __int32 *)v21);
        size_t v12 = wcslen((const __int32 *)v21);
        uint64_t v15 = (v15 + v12);
      }

      __int128 v17 = 0uLL;
    }

    __int32 v18 = v16[1];
    ++v16;
    unsigned __int32 v14 = v18;
  }

  while (v18);
  if ((int)v15 >= 1)
  {
    uint64_t v19 = v15;
    do
    {
      *a4++ = a5;
      --v19;
    }

    while (v19);
  }

  return v15;
}

uint64_t ktoau::KToA(uint64_t result, int *a2, int16x4_t *a3, __int32 *a4, int a5)
{
  int v6 = a4;
  size_t v7 = a3;
  unsigned int v9 = (unsigned __int16 *)result;
  *(void *)(result + 8) = 0LL;
  uint64_t v10 = (_WORD *)(result + 8);
  *(void *)(result + 40) = 0LL;
  int v11 = (void *)(result + 40);
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 48) = 0LL;
  *(void *)a4 = 0LL;
  *a3 = 0LL;
  *(_DWORD *)size_t result = 288;
  int v12 = 1;
  while (1)
  {
    size_t result = ktoau::IsMojiMode(result, a2);
    int v13 = result;
    int v14 = *a2;
    BOOL v15 = (*a2 - 12) < 2 || v14 == 1;
    if (v15)
    {
      if (a5 && (*v9 & 1) != 0)
      {
        *(void *)int v6 = 0x283400002838LL;
        v6 += 2;
        v7->i16[0] = v12;
        v7->i16[1] = v12;
        size_t v7 = (int16x4_t *)((char *)v7 + 4);
        int v14 = *a2;
      }

      goto LABEL_12;
    }

    if (!v14) {
      break;
    }
    if (v14 <= 32) {
      goto LABEL_12;
    }
    if (((1LL << v14) & 0xC000720200000000LL) != 0) {
      goto LABEL_15;
    }
    if (((1LL << v14) & 0x1000010400000000LL) != 0)
    {
LABEL_12:
      *v6++ = v14;
      v7->i16[0] = v12;
      size_t v7 = (int16x4_t *)((char *)v7 + 2);
      ++v12;
      ++a2;
      *unsigned int v9 = *v9 & 0xFE00 | (2 * result) | 0x120;
    }

    else
    {
LABEL_17:
      if (v14 == 65379)
      {
LABEL_15:
        *v6++ = v14;
        v7->i16[0] = v12;
        size_t v7 = (int16x4_t *)((char *)v7 + 2);
        ++v12;
        ++a2;
        *unsigned int v9 = *v9 & 0xFE00 | (2 * result) | 0x80;
      }

      else
      {
        if (v14 == 65378) {
          goto LABEL_12;
        }
        size_t result = ktoau::IsTokuSuji((uint64_t)v9, a2, v380);
        if ((_DWORD)result)
        {
          if ((*v9 & 0x20) == 0)
          {
            *v6++ = 32;
            v7->i16[0] = v12;
            size_t v7 = (int16x4_t *)((char *)v7 + 2);
          }

          __int32 v16 = v380[0];
          if (v380[0])
          {
            int v17 = 0;
            int v18 = 0;
            uint64_t v19 = &v380[1];
            __int16 v20 = v12;
            int v21 = v7;
            uint64_t v22 = v6;
            do
            {
              if (v16 != 32 || v17)
              {
                int v17 = 0;
                *v22++ = v16;
                v21->i16[0] = v20;
                int v21 = (int16x4_t *)((char *)v21 + 2);
                ++v18;
              }

              else
              {
                ++v20;
                int v17 = 1;
              }

              __int32 v23 = *v19++;
              __int32 v16 = v23;
            }

            while (v23);
          }

          else
          {
            int v18 = 0;
            uint64_t v22 = v6;
          }

          __int32 *v22 = 0;
          v6 += v18;
          size_t v7 = (int16x4_t *)((char *)v7 + 2 * v18);
          a2 += (int)result;
          unsigned __int16 v26 = *v9 & 0xFE00 | 0x99;
LABEL_45:
          *unsigned int v9 = v26;
          v12 += result;
        }

        else
        {
          int v24 = *a2;
          if (*a2 <= 127)
          {
            __int16 v25 = *v9;
            if ((*v9 & 0x1C) != 0x10 && (v25 & 0x20) == 0 && ((v25 & 0x1E) == 0xC || (v25 & 1) != 0))
            {
              *v6++ = 32;
              v7->i16[0] = v12;
              size_t v7 = (int16x4_t *)((char *)v7 + 2);
              int v24 = *a2;
            }

            *v6++ = v24;
            v7->i16[0] = v12;
            size_t v7 = (int16x4_t *)((char *)v7 + 2);
            ++a2;
            unsigned __int16 v26 = *v9 & 0xFE00 | (2 * v13) | 0x80;
LABEL_44:
            size_t result = 1LL;
            goto LABEL_45;
          }

          if (v13 == 6)
          {
            int v27 = (*v9 >> 1) & 0xF;
            if (v27 == 5 || v27 == 9)
            {
              *v6++ = 32;
              v7->i16[0] = v12;
              size_t v7 = (int16x4_t *)((char *)v7 + 2);
              int v24 = *a2;
            }

            *v6++ = v24;
            v7->i16[0] = v12;
            size_t v7 = (int16x4_t *)((char *)v7 + 2);
            ++a2;
            unsigned __int16 v26 = *v9 & 0xFE00 | 0x8C;
            goto LABEL_44;
          }

          v378 = v11;
          if ((*v10 & 0x400) != 0 && (size_t result = ktoau::IsSetKei(result, a2, v380), (_DWORD)result))
          {
            int v28 = result;
            uint64_t v29 = wcsncmp(a2, dword_2AA70, 3uLL);
            if ((_DWORD)v29)
            {
              *v6++ = 32;
              v7->i16[0] = v12;
              size_t v7 = (int16x4_t *)((char *)v7 + 2);
            }

            __int32 v30 = v380[0];
            if (v380[0])
            {
              int v31 = 0;
              int v32 = 0;
              __int32 v33 = &v380[1];
              __int16 v34 = v12;
              __int32 v35 = v7;
              __int32 v36 = v6;
              do
              {
                if (v30 != 32 || v31)
                {
                  int v31 = 0;
                  *v36++ = v30;
                  v35->i16[0] = v34;
                  __int32 v35 = (int16x4_t *)((char *)v35 + 2);
                  ++v32;
                }

                else
                {
                  ++v34;
                  int v31 = 1;
                }

                __int32 v37 = *v33++;
                __int32 v30 = v37;
              }

              while (v37);
            }

            else
            {
              int v32 = 0;
              __int32 v36 = v6;
            }

            *__int32 v36 = 0;
            a2 += v28;
            v12 += v28;
            v6 += v32;
            size_t v7 = (int16x4_t *)((char *)v7 + 2 * v32);
            unsigned __int16 v56 = *v9 & 0xFE1E | 0x81;
            *unsigned int v9 = v56;
            size_t result = ktoau::IsMojiMode(v29, a2 - 1);
            unsigned __int16 v57 = v56 & 0xFF81 | (2 * result);
LABEL_96:
            *unsigned int v9 = v57;
            int v11 = v378;
          }

          else if (v13 == 10)
          {
            __int128 v411 = 0u;
            __int128 v410 = 0u;
            __int128 v409 = 0u;
            __int128 v407 = 0u;
            __int128 v408 = 0u;
            __int128 v405 = 0u;
            __int128 v406 = 0u;
            __int128 v403 = 0u;
            __int128 v404 = 0u;
            __int128 v401 = 0u;
            __int128 v402 = 0u;
            __int128 v399 = 0u;
            __int128 v400 = 0u;
            __int128 v397 = 0u;
            __int128 v398 = 0u;
            __int128 v395 = 0u;
            __int128 v396 = 0u;
            __int128 v393 = 0u;
            __int128 v394 = 0u;
            __int128 v391 = 0u;
            __int128 v392 = 0u;
            __int128 v389 = 0u;
            __int128 v390 = 0u;
            __int128 v387 = 0u;
            __int128 v388 = 0u;
            __int128 v385 = 0u;
            __int128 v386 = 0u;
            __int128 v383 = 0u;
            __int128 v384 = 0u;
            __int128 v381 = 0u;
            __int128 v382 = 0u;
            *(_OWORD *)v380 = 0u;
            size_t result = ktoau::IsHiraMatch((uint64_t)v9, (unsigned int *)a2, v380);
            if ((_DWORD)result)
            {
              if ((*v9 & 0x20) == 0 && *(_DWORD *)v9)
              {
                *v6++ = 32;
                v7->i16[0] = v12;
                size_t v7 = (int16x4_t *)((char *)v7 + 2);
              }

              __int32 v58 = v380[0];
              if (v380[0])
              {
                int v59 = 0;
                int v60 = 0;
                __int32 v61 = &v380[1];
                __int16 v62 = v12;
                __int32 v63 = v7;
                __int32 v64 = v6;
                do
                {
                  if (v58 != 32 || v59)
                  {
                    int v59 = 0;
                    *v64++ = v58;
                    v63->i16[0] = v62;
                    __int32 v63 = (int16x4_t *)((char *)v63 + 2);
                    ++v60;
                  }

                  else
                  {
                    ++v62;
                    int v59 = 1;
                  }

                  __int32 v65 = *v61++;
                  __int32 v58 = v65;
                }

                while (v65);
              }

              else
              {
                int v60 = 0;
                __int32 v64 = v6;
              }

              *__int32 v64 = 0;
              a2 += (int)result;
              v12 += result;
              v6 += v60;
              size_t v7 = (int16x4_t *)((char *)v7 + 2 * v60);
              unsigned __int16 v66 = *v9 & 0xFE1E | 0x81;
              *unsigned int v9 = v66;
              size_t result = ktoau::IsMojiMode(result, a2 - 1);
              __int16 v67 = 2 * result;
              if ((_DWORD)result == 12) {
                __int16 v67 = 26;
              }
              *unsigned int v9 = v67 | v66 & 0xFF81;
            }

            else
            {
              BOOL v38 = 0;
LABEL_67:
              if ((*v9 & 0x80) != 0)
              {
                size_t result = ktoau::IsSetsubi(result, a2);
                if ((_DWORD)result)
                {
                  int v39 = *v9 & 0x1E;
                  if (v39 == 10) {
                    goto LABEL_70;
                  }
                  if (*a2 == 12373)
                  {
                    if (v39 == 18 || a2[1] == 12435)
                    {
LABEL_70:
                      *v6++ = 32;
                      v7->i16[0] = v12;
                      size_t v7 = (int16x4_t *)((char *)v7 + 2);
                    }
                  }

                  else if (v39 == 18)
                  {
                    goto LABEL_70;
                  }

                  int v40 = dword_306C0[20 * (int)result];
                  if (v40)
                  {
                    int v41 = 0;
                    int v42 = 0;
                    __int32 v43 = &dword_306C0[20 * (int)result + 1];
                    __int16 v44 = v12;
                    __int32 v45 = v7;
                    __int32 v46 = v6;
                    do
                    {
                      if (v40 != 32 || v41)
                      {
                        int v41 = 0;
                        *v46++ = v40;
                        v45->i16[0] = v44;
                        __int32 v45 = (int16x4_t *)((char *)v45 + 2);
                        ++v42;
                      }

                      else
                      {
                        ++v44;
                        int v41 = 1;
                      }

                      int v47 = *v43++;
                      int v40 = v47;
                    }

                    while (v47);
                  }

                  else
                  {
                    int v42 = 0;
                    __int32 v46 = v6;
                  }

                  *__int32 v46 = 0;
                  size_t result = wcslen(&dword_306C0[20 * (int)result - 20]);
                  v12 += result;
                  a2 += result;
                  v6 += v42;
                  *unsigned int v9 = *v9 & 0xFE00 | (2 * v13) | 0x181;
                  size_t v7 = (int16x4_t *)((char *)v7 + 2 * v42);
                  goto LABEL_136;
                }
              }

              if (v13 != 10)
              {
                if (!v38) {
                  goto LABEL_194;
                }
                goto LABEL_114;
              }

              size_t result = ktoau::IsHiraDoushi(result, a2, v380);
              if ((_DWORD)result)
              {
                if ((*v9 & 0x20) == 0 && *(_DWORD *)v9)
                {
                  *v6++ = 32;
                  v7->i16[0] = v12;
                  size_t v7 = (int16x4_t *)((char *)v7 + 2);
                }

                __int32 v48 = v380[0];
                if (v380[0])
                {
                  int v49 = 0;
                  int v50 = 0;
                  __int32 v51 = &v380[1];
                  __int16 v52 = v12;
                  __int32 v53 = v7;
                  __int32 v54 = v6;
                  do
                  {
                    if (v48 != 32 || v49)
                    {
                      int v49 = 0;
                      *v54++ = v48;
                      v53->i16[0] = v52;
                      __int32 v53 = (int16x4_t *)((char *)v53 + 2);
                      ++v50;
                    }

                    else
                    {
                      ++v52;
                      int v49 = 1;
                    }

                    __int32 v55 = *v51++;
                    __int32 v48 = v55;
                  }

                  while (v55);
                }

                else
                {
                  int v50 = 0;
                  __int32 v54 = v6;
                }

                __int32 v72 = v10;
                *__int32 v54 = 0;
                __int32 v73 = &a2[(int)result];
                int v74 = result + v12;
                __int32 v75 = &v6[v50];
                __int32 v76 = (_WORD *)v7 + v50;
                size_t result = ktoau::ZenToHan(result, v73, v75);
                *__int32 v76 = v74;
                if ((_DWORD)result == 2) {
                  v76[1] = v74;
                }
                __int32 v78 = *v73;
                a2 = (int *)(v73 + 1);
                __int32 v77 = v78;
                int v12 = v74 + 1;
                int v79 = 12356;
                __int32 v80 = &dword_2658C;
                int v6 = &v75[(int)result];
                size_t v7 = (int16x4_t *)&v76[(int)result];
                while (v79 != v77)
                {
                  int v81 = *v80++;
                  int v79 = v81;
                  if (!v81) {
                    goto LABEL_134;
                  }
                }

                size_t result = ktoau::IsMojiMode(result, a2);
                if ((_DWORD)result == 10 && (size_t result = ktoau::IsHiraDoushi(10, a2, v380), (_DWORD)result)
                  || (size_t result = ktoau::IsMojiMode(result, a2), (_DWORD)result == 12)
                  && (size_t result = ktoau::IsDoushi(result, a2), (_DWORD)result))
                {
                  __int16 v82 = *v9 | 0x20;
                  goto LABEL_135;
                }

LABEL_134:
                __int16 v82 = *v9 & 0xFEDF | 0x100;
LABEL_135:
                uint64_t v10 = v72;
                *unsigned int v9 = v82 & 0xFF20 | 0x95;
LABEL_136:
                *((void *)v9 + 1) = 0LL;
                *((void *)v9 + 5) = 0LL;
                int v11 = v378;
              }

              else
              {
                if (!v38)
                {
                  BOOL v38 = 0;
                  goto LABEL_194;
                }

LABEL_114:
                IsDoushuint64_t i = ktoau::IsDoushi(result, a2);
                if (!(_DWORD)IsDoushi) {
                  goto LABEL_157;
                }
                v374 = a2 + 1;
                IsDoushuint64_t i = ktoau::IsMojiMode(IsDoushi, a2 + 1);
                if ((_DWORD)IsDoushi != 10) {
                  goto LABEL_157;
                }
                int v69 = 12356;
                __int32 v70 = &dword_2658C;
                while (v69 != *v374)
                {
                  int v71 = *v70++;
                  int v69 = v71;
                  if (!v71) {
                    goto LABEL_157;
                  }
                }

                if ((uint64_t v83 = ktoau::IsMojiMode(IsDoushi, a2 + 2), (_DWORD)v83 == 12)
                  && (uint64_t v83 = ktoau::IsDoushi(v83, a2 + 2), (_DWORD)v83)
                  && (uint64_t v83 = ktoau::IsMojiMode(v83, a2 + 3), (_DWORD)v83 == 10)
                  || (IsDoushuint64_t i = ktoau::IsMojiMode(v83, a2 + 2), (_DWORD)IsDoushi == 10)
                  && (IsDoushuint64_t i = ktoau::IsHiraDoushi(10, a2 + 2, v380), (_DWORD)IsDoushi))
                {
                  if (*(_DWORD *)v9 && (*(_DWORD *)v9 & 0x20) == 0)
                  {
                    *v6++ = 32;
                    v7->i16[0] = v12;
                    size_t v7 = (int16x4_t *)((char *)v7 + 2);
                  }

                  size_t v84 = ktoau::TanKanji2Set((uint64_t)v9, a2, v380);
                  __int32 v85 = v380[0];
                  if (v380[0])
                  {
                    int v86 = 0;
                    int v87 = 0;
                    unsigned __int32 v88 = &v380[1];
                    __int16 v89 = v12;
                    unsigned int v90 = v7;
                    __int32 v91 = v6;
                    a2 += 2;
                    do
                    {
                      if (v85 != 32 || v86)
                      {
                        int v86 = 0;
                        *v91++ = v85;
                        v90->i16[0] = v89;
                        unsigned int v90 = (int16x4_t *)((char *)v90 + 2);
                        ++v87;
                      }

                      else
                      {
                        ++v89;
                        int v86 = 1;
                      }

                      __int32 v92 = *v88++;
                      __int32 v85 = v92;
                    }

                    while (v92);
                  }

                  else
                  {
                    int v87 = 0;
                    __int32 v91 = v6;
                    a2 += 2;
                  }

                  v363 = v10;
                  *__int32 v91 = 0;
                  __int32 v208 = &v6[v87];
                  __int32 v209 = (_WORD *)v7 + v87;
                  size_t result = ktoau::ZenToHan(v84, v374, v208);
                  *__int32 v209 = v12 + 1;
                  if ((_DWORD)result == 2) {
                    v209[1] = v12 + 1;
                  }
                  int v6 = &v208[(int)result];
                  *unsigned int v9 = *v9 & 0xFE00 | 0x1B5;
                  size_t v7 = (int16x4_t *)&v209[(int)result];
                  v12 += 2;
                  *((void *)v9 + 1) = 0LL;
                  *((void *)v9 + 5) = 0LL;
LABEL_430:
                  uint64_t v10 = v363;
                  int v11 = v378;
                }

                else
                {
LABEL_157:
                  size_t result = ktoau::IsDoushi(IsDoushi, a2);
                  if (!(_DWORD)result) {
                    goto LABEL_193;
                  }
                  __int32 v93 = a2 + 1;
                  size_t result = ktoau::IsMojiMode(result, a2 + 1);
                  if ((_DWORD)result != 10) {
                    goto LABEL_193;
                  }
                  v375 = a2 + 2;
                  size_t result = ktoau::IsMojiMode(result, a2 + 2);
                  if ((_DWORD)result != 10 || *v375 == 12356) {
                    goto LABEL_193;
                  }
                  int v94 = 12356;
                  unsigned __int32 v95 = &dword_265E0;
                  while (v94 != *v375)
                  {
                    int v96 = *v95++;
                    int v94 = v96;
                    if (!v96) {
                      goto LABEL_193;
                    }
                  }

                  v369 = a2 + 3;
                  uint64_t IsMojiMode = ktoau::IsMojiMode(result, a2 + 3);
                  if ((_DWORD)IsMojiMode != 12
                    || (uint64_t IsMojiMode = ktoau::IsDoushi(IsMojiMode, v369), !(_DWORD)IsMojiMode)
                    || (uint64_t IsMojiMode = ktoau::IsMojiMode(IsMojiMode, a2 + 4), (_DWORD)IsMojiMode != 10))
                  {
                    size_t result = ktoau::IsMojiMode(IsMojiMode, v369);
                    if ((_DWORD)result != 10 || (size_t result = ktoau::IsHiraDoushi(10, v369, v380), !(_DWORD)result))
                    {
LABEL_193:
                      BOOL v38 = 1;
                      goto LABEL_194;
                    }
                  }

                  if (*(_DWORD *)v9 && (*(_DWORD *)v9 & 0x20) == 0)
                  {
                    *v6++ = 32;
                    v7->i16[0] = v12;
                    size_t v7 = (int16x4_t *)((char *)v7 + 2);
                  }

                  size_t v98 = ktoau::TanKanji2Set((uint64_t)v9, a2, v380);
                  __int32 v99 = v380[0];
                  if (v380[0])
                  {
                    int v100 = 0;
                    int v101 = 0;
                    __int32 v102 = &v380[1];
                    __int16 v103 = v12;
                    __int32 v104 = v7;
                    __int32 v105 = v6;
                    a2 += 3;
                    do
                    {
                      if (v99 != 32 || v100)
                      {
                        int v100 = 0;
                        *v105++ = v99;
                        v104->i16[0] = v103;
                        __int32 v104 = (int16x4_t *)((char *)v104 + 2);
                        ++v101;
                      }

                      else
                      {
                        ++v103;
                        int v100 = 1;
                      }

                      __int32 v106 = *v102++;
                      __int32 v99 = v106;
                    }

                    while (v106);
                  }

                  else
                  {
                    int v101 = 0;
                    __int32 v105 = v6;
                    a2 += 3;
                  }

                  v365 = v10;
                  *__int32 v105 = 0;
                  unsigned __int32 v253 = &v6[v101];
                  __int32 v254 = (_WORD *)v7 + v101;
                  size_t v255 = ktoau::ZenToHan(v98, v93, v253);
                  *__int32 v254 = v12 + 1;
                  if ((_DWORD)v255 == 2) {
                    v254[1] = v12 + 1;
                  }
                  __int32 v256 = &v253[(int)v255];
                  __int32 v257 = &v254[(int)v255];
                  size_t result = ktoau::ZenToHan(v255, v375, v256);
                  *__int32 v257 = v12 + 2;
                  int v11 = v378;
                  if ((_DWORD)result == 2) {
                    v257[1] = v12 + 2;
                  }
                  int v6 = &v256[(int)result];
                  *unsigned int v9 = *v9 & 0xFE00 | 0x1B5;
                  size_t v7 = (int16x4_t *)&v257[(int)result];
                  v12 += 3;
                  *((void *)v9 + 1) = 0LL;
                  *((void *)v9 + 5) = 0LL;
                  uint64_t v10 = v365;
                }
              }
            }
          }

          else
          {
            BOOL v38 = v13 == 12;
            if (v13 == 12) {
              goto LABEL_67;
            }
            if (v13 == 8)
            {
              int v368 = 1;
              BOOL v373 = 0;
              int v366 = 0;
LABEL_292:
              int v145 = *a2;
              if (*a2 != 65288 && (v145 != 12540 || (*v9 & 0x1E) != 0x16)) {
                goto LABEL_299;
              }
LABEL_295:
              size_t result = ktoau::IsKataMatch((uint64_t)v9, a2, v380);
              int v146 = *a2;
              if ((_DWORD)result)
              {
                if (v146 == 65288)
                {
                  int v11 = v378;
                }

                else
                {
                  int v11 = v378;
                  if ((*v9 & 0x20) == 0 && *(_DWORD *)v9)
                  {
                    *v6++ = 32;
                    v7->i16[0] = v12;
                    size_t v7 = (int16x4_t *)((char *)v7 + 2);
                  }
                }

                __int32 v156 = v380[0];
                if (v380[0])
                {
                  int v157 = 0;
                  int v158 = 0;
                  __int32 v159 = &v380[1];
                  __int16 v160 = v12;
                  __int32 v161 = v7;
                  __int32 v162 = v6;
                  do
                  {
                    if (v156 != 32 || v157)
                    {
                      int v157 = 0;
                      *v162++ = v156;
                      v161->i16[0] = v160;
                      __int32 v161 = (int16x4_t *)((char *)v161 + 2);
                      ++v158;
                    }

                    else
                    {
                      ++v160;
                      int v157 = 1;
                    }

                    __int32 v163 = *v159++;
                    __int32 v156 = v163;
                  }

                  while (v163);
                }

                else
                {
                  int v158 = 0;
                  __int32 v162 = v6;
                }

                *__int32 v162 = 0;
                a2 += (int)result;
                v6 += v158;
                size_t v7 = (int16x4_t *)((char *)v7 + 2 * v158);
                unsigned __int16 v182 = *v9 & 0xFE00 | 0x9B;
              }

              else
              {
                int v145 = 65288;
                if (v146 == 65288) {
                  goto LABEL_299;
                }
                if ((*v9 & 0x20) != 0)
                {
                  int v11 = v378;
                }

                else
                {
                  int v11 = v378;
                  if (*(_DWORD *)v9)
                  {
                    int v201 = *(_DWORD *)v9 & 0x1F;
                    if (v201 != 23 && v201 != 27)
                    {
                      *v6++ = 32;
                      v7->i16[0] = v12;
                      size_t v7 = (int16x4_t *)((char *)v7 + 2);
                    }
                  }
                }

                int v205 = ktoau::ZenToHan(result, a2, v6);
                v7->i16[0] = v12;
                if (v205 == 2) {
                  v7->i16[1] = v12;
                }
                v6 += v205;
                size_t v7 = (int16x4_t *)((char *)v7 + 2 * v205);
                ++a2;
                unsigned __int16 v182 = *v9 & 0xFE00 | (2 * v13) | 0x81;
                size_t result = 1LL;
              }

              v12 += result;
              *unsigned int v9 = v182;
            }

            else
            {
              BOOL v38 = 0;
LABEL_194:
              int v107 = (*v9 >> 1) & 0xF;
              if (v107 == 8 || v107 == 3)
              {
                IsHenSuushuint64_t i = ktoau::IsHenSuushi((uint64_t)v9, a2);
                if (IsHenSuushi)
                {
                  int v110 = wcscpy(v380, &dword_3A3BC[3 * IsHenSuushi - 3]);
                  size_t result = ktoau::SetHenSuushi(v110, v6, v7, v380, v12);
                  ++a2;
                  ++v12;
                  *unsigned int v9 = *v9 & 0xFE00 | (2 * v13) | 0x81;
                  int v11 = v378;
                  goto LABEL_391;
                }

                size_t result = ktoau::IsSuushiu((uint64_t)v9, a2, (uint64_t)v380);
                if ((_DWORD)result)
                {
                  int v111 = result;
                  __int32 v112 = v380[0];
                  if (v380[0])
                  {
                    int v113 = 0;
                    size_t result = 0LL;
                    int v11 = v378;
                    __int32 v114 = &v380[1];
                    __int16 v115 = v12;
                    __int32 v116 = v7;
                    __int32 v117 = v6;
                    do
                    {
                      if (v112 != 32 || v113)
                      {
                        int v113 = 0;
                        *v117++ = v112;
                        v116->i16[0] = v115;
                        __int32 v116 = (int16x4_t *)((char *)v116 + 2);
                        size_t result = (result + 1);
                      }

                      else
                      {
                        ++v115;
                        int v113 = 1;
                      }

                      __int32 v118 = *v114++;
                      __int32 v112 = v118;
                    }

                    while (v118);
                  }

                  else
                  {
                    size_t result = 0LL;
                    __int32 v117 = v6;
                    int v11 = v378;
                  }

                  *__int32 v117 = 0;
                  *unsigned int v9 = *v9 & 0xFE00 | (2 * v13) | 0x81;
                  a2 += v111;
                  v12 += v111;
                  goto LABEL_390;
                }
              }

              BOOL v373 = v13 == 14;
              if ((v13 | 2) != 0xE)
              {
                int v368 = 0;
                int v123 = 0;
                if (!v38) {
                  goto LABEL_258;
                }
                goto LABEL_182;
              }

              BOOL v361 = v38;
              size_t result = ktoau::IsKanjiMatch((uint64_t)v9, a2, v380);
              if ((_DWORD)result)
              {
                int v119 = result;
                wcscpy(v379, v380);
                *((void *)v9 + 3) = *((void *)v9 + 1);
                int IsSettouu = ktoau::IsSettouu((uint64_t)v9, a2, (uint64_t)v380);
                int v367 = v119;
                if (v119 <= 2
                  && IsSettouu == 1
                  && !*((void *)v9 + 3)
                  && (size_t result = ktoau::IsKanjiNa((uint64_t)v9, a2 + 1, 0), (_DWORD)result)
                  && ((v368 = 0, int v145 = *a2, *a2 == 20803) || v145 == 21069))
                {
                  int v366 = v361;
LABEL_299:
                  if ((v13 == 12 || v13 == 10)
                    && ((v362 = (unsigned int *)(a2 + 1), ktoau::IsMojiMode(result, a2 + 1) == 12)
                     && !ktoau::TanKanji2SetSub(12, v380, a2[1], a2[2], v145, (uint64_t)v362)
                     || ktoau::IsHiraNa((uint64_t)v9, v362, 1)
                     || ktoau::IsKataNa((uint64_t)v9, (int *)v362, 1)
                     || (size_t IsSetubiNa = ktoau::IsSetubiNa((uint64_t)v9, (__int32 *)v362, 0), (_DWORD)IsSetubiNa)
                     || *a2 == 12362
                     || (size_t result = ktoau::IsMojiMode(IsSetubiNa, (int *)v362), result <= 0xE)
                     && ((1 << result) & 0x4108) != 0)
                    && (size_t result = ktoau::IsSettouu((uint64_t)v9, a2, (uint64_t)v380), (_DWORD)result))
                  {
                    if ((*v9 & 0x20) == 0)
                    {
                      *v6++ = 32;
                      v7->i16[0] = v12;
                      size_t v7 = (int16x4_t *)((char *)v7 + 2);
                    }

                    int v11 = v378;
                    __int32 v148 = v380[0];
                    if (v380[0])
                    {
                      int v149 = 0;
                      int v150 = 0;
                      __int32 v151 = &v380[1];
                      __int16 v152 = v12;
                      __int32 v153 = v7;
                      __int32 v154 = v6;
                      do
                      {
                        if (v148 != 32 || v149)
                        {
                          int v149 = 0;
                          *v154++ = v148;
                          v153->i16[0] = v152;
                          __int32 v153 = (int16x4_t *)((char *)v153 + 2);
                          ++v150;
                        }

                        else
                        {
                          ++v152;
                          int v149 = 1;
                        }

                        __int32 v155 = *v151++;
                        __int32 v148 = v155;
                      }

                      while (v155);
                    }

                    else
                    {
                      int v150 = 0;
                      __int32 v154 = v6;
                    }

                    *__int32 v154 = 0;
                    if ((v9[20] & 0x480) != 0)
                    {
                      __int16 v206 = 154;
                      __int16 v207 = -511;
                    }

                    else
                    {
                      if ((*v10 & 0x7E) != 0) {
                        __int16 v207 = -511;
                      }
                      else {
                        __int16 v207 = -481;
                      }
                      if ((*v10 & 0x7E) != 0) {
                        __int16 v206 = 154;
                      }
                      else {
                        __int16 v206 = 288;
                      }
                    }

                    v6 += v150;
                    size_t v7 = (int16x4_t *)((char *)v7 + 2 * v150);
                    ++v12;
                    *unsigned int v9 = (*v9 & 0xFE00 | (2 * v13) | 1) & v207 | v206;
                    ++a2;
                  }

                  else
                  {
                    if (v366)
                    {
                      size_t result = ktoau::IsMojiMode(result, a2 + 1);
                      if ((_DWORD)result == 10)
                      {
                        int v164 = (*v9 >> 1) & 0xF;
                        if (v164 != 3 && v164 != 8)
                        {
                          size_t result = ktoau::TanKanji2SetSub(10, v380, *a2, a2[1], *(a2 - 1), (uint64_t)a2);
                          if ((_DWORD)result)
                          {
                            __int32 v165 = a2 + 1;
                            v363 = v10;
                            if ((*v9 & 0x20) == 0)
                            {
                              *v6++ = 32;
                              v7->i16[0] = v12;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2);
                            }

                            size_t v166 = ktoau::TanKanji2Set((uint64_t)v9, a2, v380);
                            int v376 = v166;
                            __int32 v167 = v380[0];
                            if (v380[0])
                            {
                              int v168 = 0;
                              int v169 = 0;
                              __int32 v170 = &v380[1];
                              __int16 v171 = v12;
                              __int32 v172 = v7;
                              __int32 v173 = v6;
                              do
                              {
                                if (v167 != 32 || v168)
                                {
                                  int v168 = 0;
                                  *v173++ = v167;
                                  v172->i16[0] = v171;
                                  __int32 v172 = (int16x4_t *)((char *)v172 + 2);
                                  ++v169;
                                }

                                else
                                {
                                  ++v171;
                                  int v168 = 1;
                                }

                                __int32 v174 = *v170++;
                                __int32 v167 = v174;
                              }

                              while (v174);
                            }

                            else
                            {
                              int v169 = 0;
                              __int32 v173 = v6;
                            }

                            *__int32 v173 = 0;
                            int v263 = v12 + 1;
                            v6 += v169;
                            size_t v7 = (int16x4_t *)((char *)v7 + 2 * v169);
                            uint64_t v264 = ktoau::IsMojiMode(v166, a2 + 1);
                            if ((_DWORD)v264 == 10)
                            {
                              size_t v265 = ktoau::ZenToHan(v264, a2 + 1, v6);
                              v7->i16[0] = v263;
                              if ((_DWORD)v265 == 1)
                              {
                                if (*v6 != 12387) {
                                  goto LABEL_588;
                                }
                                unsigned __int16 v283 = *v9 | 0x20;
                              }

                              else
                              {
                                if ((_DWORD)v265 == 2) {
                                  v7->i16[1] = v263;
                                }
LABEL_588:
                                unsigned __int16 v283 = *v9 & 0xFFDF;
                              }

                              *unsigned int v9 = v283;
                              if (*v6 == 65421)
                              {
                                if (v6[1] >> 1 != 32719)
                                {
                                  int v284 = 65396;
LABEL_595:
                                  *int v6 = v284;
                                }
                              }

                              else if (*v6 == 65418 && v6[1] >> 1 != 32719)
                              {
                                int v284 = 65436;
                                goto LABEL_595;
                              }

                              v6 += (int)v265;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2 * (int)v265);
                              *v9 |= 1u;
                              __int32 v285 = a2 + 2;
                              int v263 = v12 + 2;
                              if (a2[2] != 12358) {
                                goto LABEL_744;
                              }
                              int v286 = *a2;
                              if (*a2 <= 28417)
                              {
                                if (v286 > 25341)
                                {
                                  if (v286 <= 25612)
                                  {
                                    if (v286 == 25342) {
                                      goto LABEL_743;
                                    }
                                    int v287 = 25539;
                                  }

                                  else
                                  {
                                    if (v286 == 25613 || v286 == 25972) {
                                      goto LABEL_743;
                                    }
                                    int v287 = 27468;
                                  }
                                }

                                else if (v286 <= 24916)
                                {
                                  if (v286 == 21521)
                                  {
                                    int v286 = *v165;
                                    int v287 = 12363;
                                  }

                                  else
                                  {
                                    int v287 = 21764;
                                  }
                                }

                                else
                                {
                                  if (v286 == 24917 || v286 == 25201) {
                                    goto LABEL_743;
                                  }
                                  int v287 = 25325;
                                }
                              }

                              else if (v286 <= 33309)
                              {
                                if (v286 <= 31068)
                                {
                                  if (v286 == 28418) {
                                    goto LABEL_743;
                                  }
                                  int v287 = 30097;
                                }

                                else
                                {
                                  if (v286 == 31069 || v286 == 32299) {
                                    goto LABEL_743;
                                  }
                                  int v287 = 32341;
                                }
                              }

                              else
                              {
                                if (v286 <= 35634)
                                {
                                  if (v286 != 33310 && v286 != 35475)
                                  {
                                    int v287 = 35617;
                                    goto LABEL_742;
                                  }

LABEL_743:
                                  *v6++ = 65395;
                                  v7->i16[0] = v263;
                                  size_t v7 = (int16x4_t *)((char *)v7 + 2);
                                  __int32 v285 = a2 + 3;
                                  int v263 = v12 + 3;
LABEL_744:
                                  uint64_t IsKanjiMatch = ktoau::IsDoushi(v265, v285 - 2);
                                  if (!(_DWORD)IsKanjiMatch) {
                                    goto LABEL_751;
                                  }
                                  int v347 = 12356;
                                  v348 = &dword_2658C;
                                  while (v347 != *(v285 - 1))
                                  {
                                    int v349 = *v348++;
                                    int v347 = v349;
                                    if (!v349) {
                                      goto LABEL_751;
                                    }
                                  }

                                  if (*v285 == 26041
                                    && (uint64_t IsKanjiMatch = ktoau::IsKanjiMatch((uint64_t)v9, v285, v380),
                                        !(_DWORD)IsKanjiMatch))
                                  {
                                    uint64_t IsKanjiMatch = (uint64_t)wcscpy(v6, dword_294A4);
                                    v7->i16[0] = v263;
                                    v7->i16[1] = v263;
                                    v6 += 2;
                                    size_t v7 = (int16x4_t *)((char *)v7 + 4);
                                    __int32 v165 = v285 + 1;
                                    ++v263;
                                  }

                                  else
                                  {
LABEL_751:
                                    __int32 v165 = v285;
                                  }

                                  uint64_t v264 = ktoau::IsDoushi(IsKanjiMatch, v165 - 2);
                                  if ((_DWORD)v264)
                                  {
                                    int v350 = 12356;
                                    v351 = &dword_2658C;
                                    while (v350 != *(v165 - 1))
                                    {
                                      int v352 = *v351++;
                                      int v350 = v352;
                                      if (!v352) {
                                        goto LABEL_759;
                                      }
                                    }

                                    if (*v165 == 20808)
                                    {
                                      uint64_t v264 = (uint64_t)wcscpy(v6, dword_2AB5C);
                                      v6 += 2;
                                      v7->i16[0] = v263;
                                      v7->i16[1] = v263;
                                      size_t v7 = (int16x4_t *)((char *)v7 + 4);
                                      ++v165;
                                      ++v263;
                                    }
                                  }

LABEL_759:
                                  __int16 v266 = 20;
LABEL_760:
                                  size_t result = ktoau::IsMojiMode(v264, v165);
                                  if ((_DWORD)result == 10 && v376 == 2)
                                  {
                                    size_t result = ktoau::ZenToHan(result, v165, v6);
                                    v7->i16[0] = v263;
                                    if ((_DWORD)result == 2) {
                                      v7->i16[1] = v263;
                                    }
                                    v6 += (int)result;
                                    ++v165;
                                    ++v263;
                                    size_t v7 = (int16x4_t *)((char *)v7 + 2 * (int)result);
                                  }

                                  *unsigned int v9 = *v9 & 0xFE01 | v266 | 0x180;
                                  *((void *)v9 + 1) = 0LL;
                                  *((void *)v9 + 5) = 0LL;
                                  a2 = v165;
                                  int v12 = v263;
                                  goto LABEL_430;
                                }

                                if (v286 == 35635 || v286 == 36855) {
                                  goto LABEL_743;
                                }
                                int v287 = 36889;
                              }

LABEL_742:
                              if (v286 == v287) {
                                goto LABEL_743;
                              }
                              goto LABEL_744;
                            }

                            __int16 v266 = 24;
                            goto LABEL_760;
                          }
                        }
                      }
                    }

                    if (!v373) {
                      goto LABEL_371;
                    }
                    v364 = v10;
                    unsigned int v175 = 0;
                    __int32 v176 = a2 + 1;
                    do
                    {
                      size_t result = ktoau::IsMojiMode(result, v176);
                      ++v175;
                      ++v176;
                    }

                    while ((_DWORD)result == 14);
                    BOOL v177 = v175 >= 2;
                    uint64_t v10 = v364;
                    if (v177)
                    {
                      if ((*v9 & 0x20) == 0)
                      {
                        *v6++ = 32;
                        v7->i16[0] = v12;
                        size_t v7 = (int16x4_t *)((char *)v7 + 2);
                      }

                      size_t v178 = 0LL;
                      __int32 v179 = a2;
                      do
                      {
                        size_t result = ktoau::IsMojiMode(result, ++v179);
                        ++v178;
                      }

                      while ((_DWORD)result == 14);
                      __int128 v411 = 0u;
                      __int128 v410 = 0u;
                      __int128 v409 = 0u;
                      __int128 v407 = 0u;
                      __int128 v408 = 0u;
                      __int128 v405 = 0u;
                      __int128 v406 = 0u;
                      __int128 v403 = 0u;
                      __int128 v404 = 0u;
                      __int128 v401 = 0u;
                      __int128 v402 = 0u;
                      __int128 v399 = 0u;
                      __int128 v400 = 0u;
                      __int128 v397 = 0u;
                      __int128 v398 = 0u;
                      __int128 v395 = 0u;
                      __int128 v396 = 0u;
                      __int128 v393 = 0u;
                      __int128 v394 = 0u;
                      __int128 v391 = 0u;
                      __int128 v392 = 0u;
                      __int128 v389 = 0u;
                      __int128 v390 = 0u;
                      __int128 v387 = 0u;
                      __int128 v388 = 0u;
                      __int128 v385 = 0u;
                      __int128 v386 = 0u;
                      __int128 v383 = 0u;
                      __int128 v384 = 0u;
                      __int128 v381 = 0u;
                      __int128 v382 = 0u;
                      *(_OWORD *)v380 = 0u;
                      __int32 v180 = wcsncpy(v380, a2, v178);
                      size_t result = ktoau::SetKanSuuji((uint64_t)v180, v6, v7, v380, v12);
                      v12 += v178;
                      v6 += (int)result;
                      *unsigned int v9 = *v9 & 0xFE00 | 0x91;
                      size_t v7 = (int16x4_t *)((char *)v7 + 2 * (int)result);
                      *((void *)v9 + 1) = 0LL;
                      *((void *)v9 + 5) = 0LL;
                      a2 = v179;
                      int v11 = v378;
                    }

                    else
                    {
LABEL_371:
                      int v11 = v378;
                      if (v366 && (size_t result = ktoau::IsNaSetubiu((uint64_t)v9, a2, (uint64_t)v380), (_DWORD)result))
                      {
                        *int v6 = 32;
                        __int32 v191 = v6 + 1;
                        v7->i16[0] = v12;
                        unsigned int v192 = (_WORD *)v7 + 1;
                        __int32 v193 = v380[0];
                        if (v380[0])
                        {
                          int v194 = 0;
                          int v195 = 0;
                          unsigned int v196 = &v380[1];
                          __int16 v197 = v12;
                          __int32 v198 = v192;
                          unsigned __int32 v199 = v191;
                          do
                          {
                            if (v193 != 32 || v194)
                            {
                              int v194 = 0;
                              *v199++ = v193;
                              *v198++ = v197;
                              ++v195;
                            }

                            else
                            {
                              ++v197;
                              int v194 = 1;
                            }

                            __int32 v200 = *v196++;
                            __int32 v193 = v200;
                          }

                          while (v200);
                        }

                        else
                        {
                          int v195 = 0;
                          unsigned __int32 v199 = v191;
                        }

                        *unsigned __int32 v199 = 0;
                        int v6 = &v191[v195];
                        size_t v7 = (int16x4_t *)&v192[v195];
                        v12 += result;
                        void *v378 = 0LL;
                        a2 += (int)result;
                      }

                      else if ((v13 | 2) == 0xE)
                      {
                        unsigned int v202 = *v9;
                        if ((v202 & 0x1E) != 0x1C && (v202 & 0x20) == 0
                          || ((v202 & 0x40) != 0
                           || (int v203 = (v202 >> 1) & 0xF, v203 == 5)
                           || v203 == 9
                           || (int v204 = ktoau::IsMojiMode(result, a2 + 1), v204 == 7)
                           || v204 == 10)
                          && (v202 & 0x20) == 0)
                        {
                          *v6++ = 32;
                          v7->i16[0] = v12;
                          size_t v7 = (int16x4_t *)((char *)v7 + 2);
                          LOWORD(v202) = *v9;
                          int v371 = 1;
                        }

                        else
                        {
                          int v371 = 0;
                        }

                        if ((v202 & 0x100) == 0 && !ktoau::IsKanjiMatch((uint64_t)v9, a2 + 1, v380))
                        {
                          size_t IsHiraMatch = ktoau::IsHiraMatch((uint64_t)v9, (unsigned int *)a2 + 1, v380);
                          if (!(_DWORD)IsHiraMatch)
                          {
                            BOOL v258 = ktoau::IsDoushi(IsHiraMatch, a2 + 1);
                            if (v258)
                            {
                              int v259 = 12356;
                              unsigned __int32 v260 = &dword_2658C;
                              while (v259 != a2[2])
                              {
                                int v261 = *v260++;
                                int v259 = v261;
                                if (!v261) {
                                  goto LABEL_516;
                                }
                              }
                            }

                            else
                            {
LABEL_516:
                              IsFukuKanjuint64_t i = ktoau::IsFukuKanji(v258, a2 + 1, v380);
                              if (!(_DWORD)IsFukuKanji
                                || (IsFukuKanjuint64_t i = ktoau::IsDoushi(IsFukuKanji, a2 + 2), !(_DWORD)IsFukuKanji)
                                || (LODWORD(IsFukuKanji) = ktoau::IsMojiMode(IsFukuKanji, a2 + 3),
                                    (_DWORD)IsFukuKanji != 10))
                              {
                                if (((ktoau::TanKanji2SetSub( IsFukuKanji,  v380,  *a2,  a2[1],  *(a2 - 1),  (uint64_t)a2) == 0) & ~v371) != 0)
                                {
                                  v380[0] = 0;
                                  ktoau::TanKanji1Set((uint64_t)v9, a2, (uint64_t)v380);
                                  goto LABEL_463;
                                }
                              }
                            }
                          }
                        }

                        v380[0] = 0;
                        ktoau::TanKanji2Set((uint64_t)v9, a2, v380);
LABEL_463:
                        __int32 v230 = v380[0];
                        int v11 = v378;
                        if (v380[0])
                        {
                          if (v380[0] != 32 || v380[1] != 0) {
                            goto LABEL_472;
                          }
                        }

                        size_t result = ktoau::SetKigou((uint64_t)v9, a2, (uint64_t)v6, v7, v12);
                        if (!(_DWORD)result)
                        {
                          __int32 v230 = 10276;
                          *(int32x2_t *)v380 = vdup_n_s32(0x2824u);
                          v380[2] = 0;
LABEL_472:
                          int v232 = 0;
                          size_t result = 0LL;
                          __int32 v233 = &v380[1];
                          __int16 v234 = v12;
                          __int32 v235 = v7;
                          __int32 v236 = v6;
                          do
                          {
                            if (v230 != 32 || v232)
                            {
                              int v232 = 0;
                              *v236++ = v230;
                              v235->i16[0] = v234;
                              __int32 v235 = (int16x4_t *)((char *)v235 + 2);
                              size_t result = (result + 1);
                            }

                            else
                            {
                              ++v234;
                              int v232 = 1;
                            }

                            __int32 v237 = *v233++;
                            __int32 v230 = v237;
                          }

                          while (v237);
                          *__int32 v236 = 0;
                          if (v373) {
                            __int16 v238 = 16;
                          }
                          else {
                            __int16 v238 = 28;
                          }
                          *unsigned int v9 = *v9 & 0xFE00 | v238 | 0x81;
                          ++a2;
                          ++v12;
LABEL_390:
                          *((void *)v9 + 1) = 0LL;
                          *((void *)v9 + 5) = 0LL;
                          goto LABEL_391;
                        }

                        *unsigned int v9 = *v9 & 0xFFE0 | (2 * v13) | 1;
                        a2 += 2;
                        v12 += 2;
LABEL_391:
                        v6 += (int)result;
                        size_t v7 = (int16x4_t *)((char *)v7 + 2 * (int)result);
                      }

                      else
                      {
                        if (v13 == 10)
                        {
                          unsigned int v210 = *v9;
                          if ((v210 & 0x40) != 0)
                          {
                            size_t result = ktoau::IsHira2(result, a2, v380);
                            if ((_DWORD)result)
                            {
                              *int v6 = 32;
                              __int32 v211 = v6 + 1;
                              v7->i16[0] = v12;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2);
                              __int32 v212 = v380[0];
                              if (v380[0])
                              {
                                int v213 = 0;
                                int v214 = 0;
                                __int32 v215 = &v380[1];
                                __int16 v216 = v12;
                                __int32 v217 = v7;
                                __int32 v218 = v211;
                                do
                                {
                                  if (v212 != 32 || v213)
                                  {
                                    int v213 = 0;
                                    *v218++ = v212;
                                    v217->i16[0] = v216;
                                    __int32 v217 = (int16x4_t *)((char *)v217 + 2);
                                    ++v214;
                                  }

                                  else
                                  {
                                    ++v216;
                                    int v213 = 1;
                                  }

                                  __int32 v219 = *v215++;
                                  __int32 v212 = v219;
                                }

                                while (v219);
                              }

                              else
                              {
                                int v214 = 0;
                                __int32 v218 = v211;
                              }

                              *__int32 v218 = 0;
                              a2 += (int)result;
                              v12 += result;
                              int v6 = &v211[v214];
                              __int16 v281 = *v9 & 0xFE00;
                              __int16 v282 = 149;
LABEL_605:
                              *unsigned int v9 = v281 | v282;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2 * v214);
                              goto LABEL_136;
                            }

                            unsigned int v210 = *v9;
                          }

                          if ((v210 & 0x80) != 0)
                          {
                            size_t result = ktoau::IsJoshi(result, a2, v380);
                            unsigned int v210 = *v9;
                            if ((_DWORD)result)
                            {
                              int v267 = (v210 >> 1) & 0xF;
                              if (v267 == 9 || v267 == 5)
                              {
                                int v268 = *(a2 - 1);
                                if (v268 != 41 && v268 != 8221)
                                {
                                  *v6++ = 32;
                                  v7->i16[0] = v12;
                                  size_t v7 = (int16x4_t *)((char *)v7 + 2);
                                }
                              }

                              __int32 v269 = v380[0];
                              if (v380[0])
                              {
                                int v270 = 0;
                                int v214 = 0;
                                __int32 v271 = &v380[1];
                                __int16 v272 = v12;
                                __int32 v273 = v7;
                                __int32 v274 = v6;
                                do
                                {
                                  if (v269 != 32 || v270)
                                  {
                                    int v270 = 0;
                                    *v274++ = v269;
                                    v273->i16[0] = v272;
                                    __int32 v273 = (int16x4_t *)((char *)v273 + 2);
                                    ++v214;
                                  }

                                  else
                                  {
                                    ++v272;
                                    int v270 = 1;
                                  }

                                  __int32 v275 = *v271++;
                                  __int32 v269 = v275;
                                }

                                while (v275);
                              }

                              else
                              {
                                int v214 = 0;
                                __int32 v274 = v6;
                              }

                              *__int32 v274 = 0;
                              a2 += (int)result;
                              v12 += result;
                              v6 += v214;
                              __int16 v281 = *v9 & 0xFE00;
                              __int16 v282 = 469;
                              goto LABEL_605;
                            }
                          }

                          if ((v210 & 0x20) == 0)
                          {
                            int v276 = (v210 >> 1) & 0xF;
                            if (v276 == 5 || v276 == 9) {
                              goto LABEL_572;
                            }
                          }

                          if ((v210 & 0x1E) == 0x1A)
                          {
                            if (*a2 == 12375) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2AB68, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2AB74, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                          }

                          if (*(a2 - 1) == 12367)
                          {
                            size_t result = wcsncmp(a2, dword_2AB80, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                          }

                          size_t result = ktoau::IsJoshi(result, a2 - 1, v380);
                          if ((_DWORD)result)
                          {
                            size_t result = wcsncmp(a2, dword_2AB8C, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2AB98, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABA4, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_27560, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABB0, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABBC, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABC8, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2AB74, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2AB68, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABD4, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABE0, 2uLL);
                            if (!(_DWORD)result) {
                              goto LABEL_572;
                            }
                            size_t result = wcsncmp(a2, dword_2ABEC, 2uLL);
                            if (!(_DWORD)result
                              || (size_t result = wcsncmp(a2, dword_2AB80, 2uLL), !(_DWORD)result)
                              || (size_t result = wcsncmp(a2, dword_2ABF8, 2uLL), !(_DWORD)result)
                              || (size_t result = wcsncmp(a2, dword_2AC04, 2uLL), !(_DWORD)result)
                              || (size_t result = wcsncmp(a2, dword_2AC10, 2uLL), !(_DWORD)result)
                              || (size_t result = wcsncmp(a2, dword_2AC1C, 2uLL), !(_DWORD)result)
                              || (size_t result = wcsncmp(a2, dword_2AC28, 2uLL), !(_DWORD)result)
                              || (size_t result = wcsncmp(a2, dword_2AC34, 2uLL), !(_DWORD)result))
                            {
LABEL_572:
                              *v6++ = 32;
                              v7->i16[0] = v12;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2);
                            }
                          }

                          size_t result = ktoau::ZenToHan(result, a2, v6);
                          int v277 = result;
                          v7->i16[0] = v12;
                          if ((_DWORD)result != 1)
                          {
                            if ((_DWORD)result == 2) {
                              v7->i16[1] = v12;
                            }
LABEL_872:
                            __int16 v280 = *v9 & 0xFFDF;
LABEL_873:
                            v6 += v277;
                            *unsigned int v9 = v280 & 0xFE20 | 0x195;
                            size_t v7 = (int16x4_t *)((char *)v7 + 2 * v277);
                            ++a2;
                            ++v12;
                            goto LABEL_136;
                          }

                          __int32 v278 = *v6;
                          if (*v6 != 65395 || v12 == 1) {
                            goto LABEL_582;
                          }
                          unsigned int v279 = a2[1] - 12353;
                          if (v279 <= 6 && ((1 << v279) & 0x55) != 0) {
                            goto LABEL_581;
                          }
                          __int32 v290 = a2 - 1;
                          int v289 = *(a2 - 1);
                          if (v289 <= 27467)
                          {
                            if (v289 == 20282) {
                              goto LABEL_581;
                            }
                            int v291 = 21764;
                          }

                          else
                          {
                            if (v289 == 27468 || v289 == 35036) {
                              goto LABEL_581;
                            }
                            int v291 = 35635;
                          }

                          if (v289 == v291) {
                            goto LABEL_581;
                          }
                          size_t result = wcsncmp(a2 - 1, dword_2AC40, 2uLL);
                          if (!(_DWORD)result) {
                            goto LABEL_581;
                          }
                          int v353 = *v290;
                          if (*v290 > 35616)
                          {
                            if (v353 == 35617 || v353 == 36000) {
                              goto LABEL_581;
                            }
                            int v354 = 36861;
                          }

                          else
                          {
                            if (v353 == 25613 || v353 == 30097) {
                              goto LABEL_581;
                            }
                            int v354 = 31069;
                          }

                          if (v353 == v354) {
                            goto LABEL_581;
                          }
                          int v355 = *(a2 - 2);
                          v377 = a2 - 2;
                          if (v355 == 25201) {
                            goto LABEL_581;
                          }
                          if (v355 == 21521)
                          {
                            if (v353 <= 24961)
                            {
                              if (v353 <= 21343)
                              {
                                if (v353 == 12363) {
                                  goto LABEL_581;
                                }
                                int v356 = 20105;
                              }

                              else
                              {
                                if (v353 == 21344 || v353 == 22890) {
                                  goto LABEL_581;
                                }
                                int v356 = 24605;
                              }

                              goto LABEL_805;
                            }

                            if (v353 <= 35479)
                            {
                              if (v353 == 24962) {
                                goto LABEL_581;
                              }
LABEL_799:
                              if (v353 == 31478) {
                                goto LABEL_581;
                              }
                              int v356 = 35186;
LABEL_805:
                              if (v353 != v356)
                              {
                                size_t result = wcsncmp(v377, dword_2AC4C, 2uLL);
                                if ((_DWORD)result)
                                {
                                  int v357 = *v290;
                                  if (*v290 > 27926)
                                  {
                                    if (v357 > 36889)
                                    {
                                      if (v357 > 38597)
                                      {
                                        int v358 = 39178;
                                      }

                                      else if (v357 > 36972)
                                      {
                                        if (v357 == 36973) {
                                          goto LABEL_581;
                                        }
                                        int v358 = 38360;
                                      }

                                      else
                                      {
                                        if (v357 == 36890) {
                                          goto LABEL_581;
                                        }
                                        int v358 = 36963;
                                      }
                                    }

                                    else if (v357 > 32079)
                                    {
                                      if (v357 > 35012)
                                      {
                                        if (v357 == 35013) {
                                          goto LABEL_581;
                                        }
                                        int v358 = 35206;
                                      }

                                      else
                                      {
                                        if (v357 == 32080) {
                                          goto LABEL_581;
                                        }
                                        int v358 = 32722;
                                      }
                                    }

                                    else if (v357 > 29400)
                                    {
                                      if (v357 == 29401) {
                                        goto LABEL_581;
                                      }
                                      int v358 = 31505;
                                    }

                                    else
                                    {
                                      if (v357 == 27927) {
                                        goto LABEL_581;
                                      }
                                      int v358 = 28516;
                                    }
                                  }

                                  else if (v357 > 21838)
                                  {
                                    if (v357 > 25125)
                                    {
                                      if (v357 > 25238)
                                      {
                                        if (v357 == 25239) {
                                          goto LABEL_581;
                                        }
                                        int v358 = 25285;
                                      }

                                      else
                                      {
                                        if (v357 == 25126) {
                                          goto LABEL_581;
                                        }
                                        int v358 = 25173;
                                      }
                                    }

                                    else if (v357 > 24466)
                                    {
                                      if (v357 == 24467) {
                                        goto LABEL_581;
                                      }
                                      int v358 = 24785;
                                    }

                                    else
                                    {
                                      if (v357 == 21839) {
                                        goto LABEL_581;
                                      }
                                      int v358 = 23244;
                                    }
                                  }

                                  else if (v357 > 20350)
                                  {
                                    if (v357 > 21493)
                                    {
                                      if (v357 == 21494) {
                                        goto LABEL_581;
                                      }
                                      int v358 = 21809;
                                    }

                                    else
                                    {
                                      if (v357 == 20351) {
                                        goto LABEL_581;
                                      }
                                      int v358 = 21172;
                                    }
                                  }

                                  else if (v357 > 20275)
                                  {
                                    if (v357 == 20276) {
                                      goto LABEL_581;
                                    }
                                    int v358 = 20303;
                                  }

                                  else
                                  {
                                    if (v357 == 20132) {
                                      goto LABEL_581;
                                    }
                                    int v358 = 20181;
                                  }

                                  if (v357 != v358)
                                  {
                                    size_t result = wcsncmp(v377, dword_2AC58, 2uLL);
                                    if ((_DWORD)result)
                                    {
                                      size_t result = wcsncmp(v377, dword_2AC64, 2uLL);
                                      if ((_DWORD)result)
                                      {
                                        size_t result = wcsncmp(v377, dword_2AC70, 2uLL);
                                        if ((_DWORD)result)
                                        {
                                          size_t result = wcsncmp(v377, dword_2AC7C, 4uLL);
                                          if ((_DWORD)result)
                                          {
                                            size_t result = wcsncmp(v377, dword_2AC8C, 2uLL);
                                            if ((_DWORD)result)
                                            {
                                              size_t result = wcsncmp(v377, dword_2AC98, 2uLL);
                                              if ((_DWORD)result)
                                              {
                                                v372 = a2 - 3;
                                                size_t result = wcsncmp(a2 - 3, dword_2ACA4, 3uLL);
                                                if ((_DWORD)result)
                                                {
                                                  size_t result = wcsncmp(v372, dword_2ACB4, 3uLL);
                                                  if ((_DWORD)result)
                                                  {
                                                    size_t result = wcsncmp(v372, dword_2ACC4, 3uLL);
                                                    if ((_DWORD)result)
                                                    {
                                                      size_t result = wcsncmp(v377, dword_2ACD4, 2uLL);
                                                      if ((_DWORD)result)
                                                      {
                                                        size_t result = wcsncmp(v377, dword_2ACE0, 2uLL);
                                                        if ((_DWORD)result)
                                                        {
                                                          size_t result = wcsncmp(v377, dword_2ACEC, 2uLL);
                                                          if ((_DWORD)result)
                                                          {
                                                            int v359 = *v290;
                                                            if (*v290 > 21511)
                                                            {
                                                              if (v359 == 21512) {
                                                                goto LABEL_581;
                                                              }
                                                              int v360 = 36898;
                                                            }

                                                            else
                                                            {
                                                              if (v359 == 12361) {
                                                                goto LABEL_581;
                                                              }
                                                              int v360 = 20250;
                                                            }

                                                            if (v359 != v360)
                                                            {
                                                              *int v6 = 65392;
                                                              goto LABEL_872;
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
                                      }
                                    }
                                  }
                                }
                              }

LABEL_497:
                        int v247 = 12289;
                        __int32 v248 = &dword_2A9E4;
                        do
                        {
                          if (v239 == v247) {
                            goto LABEL_646;
                          }
                          int v249 = *v248++;
                          int v247 = v249;
                        }

                        while (v249);
                        int v250 = 46;
                        __int32 v251 = &dword_2AA38;
                        do
                        {
                          if (v250 == v239) {
                            goto LABEL_646;
                          }
                          int v252 = *v251++;
                          int v250 = v252;
                        }

                        while (v252);
                        if (*(a2 - 1) >= 128)
                        {
                        }

                        else if ((v13 & 0xE) == 8)
                        {
                          goto LABEL_646;
                        }

                        if (v239 >> 8 != 40 && (*v9 & 0x20) == 0)
                        {
                          if (v239 <= 65292)
                          {
                            if (v239 != 8208 && v239 != 12288)
                            {
LABEL_645:
                              *v6++ = 32;
                              v7->i16[0] = v12;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2);
                              *unsigned int v9 = *v9 & 0xFF5F | 0x80;
                            }
                          }

                          else if (v239 != 65293 && v239 != 65306 && v239 != 65374)
                          {
                            goto LABEL_645;
                          }
                        }

LABEL_646:
                        int v292 = *a2;
                        int v293 = 65288;
                        v294 = &dword_2A994;
                        while (v292 != v293)
                        {
                          int v295 = *v294++;
                          int v293 = v295;
                          if (!v295)
                          {
                            int v296 = 40;
                            v297 = &dword_2A9C8;
                            while (v296 != v292)
                            {
                              int v298 = *v297++;
                              int v296 = v298;
                              if (!v298)
                              {
                                __int16 v299 = *v9;
                                if (!v368)
                                {
                                  unsigned __int16 v308 = v299 & 0xFE1F | 0x180;
                                  goto LABEL_666;
                                }

                                if ((v299 & 0x1E) == 0x10
                                  || (size_t result = ktoau::IsTokuSuji((uint64_t)v9, a2, v380), v299 = *v9, !(_DWORD)result))
                                {
                                  unsigned __int16 v308 = v299 & 0xFE01 | 0xB0;
                                  goto LABEL_666;
                                }

                                if ((v299 & 0x20) == 0)
                                {
                                  *v6++ = 32;
                                  v7->i16[0] = v12;
                                  size_t v7 = (int16x4_t *)((char *)v7 + 2);
                                }

                                __int32 v300 = v380[0];
                                if (v380[0])
                                {
                                  int v301 = 0;
                                  int v302 = 0;
                                  v303 = &v380[1];
                                  __int16 v304 = v12;
                                  v305 = v7;
                                  v306 = v6;
                                  do
                                  {
                                    if (v300 != 32 || v301)
                                    {
                                      int v301 = 0;
                                      *v306++ = v300;
                                      v305->i16[0] = v304;
                                      v305 = (int16x4_t *)((char *)v305 + 2);
                                      ++v302;
                                    }

                                    else
                                    {
                                      ++v304;
                                      int v301 = 1;
                                    }

                                    __int32 v307 = *v303++;
                                    __int32 v300 = v307;
                                  }

                                  while (v307);
                                }

                                else
                                {
                                  int v302 = 0;
                                  v306 = v6;
                                }

                                __int32 *v306 = 0;
                                a2 += (int)result;
                                v12 += result;
                                v6 += v302;
                                size_t v7 = (int16x4_t *)((char *)v7 + 2 * v302);
                                unsigned __int16 v57 = *v9 & 0xFE80 | 0x1B;
                                goto LABEL_96;
                              }
                            }

                            break;
                          }
                        }

                        unsigned __int16 v308 = *v9 & 0xFE1F | 0x120;
LABEL_666:
                        *unsigned int v9 = v308;
                        size_t result = ktoau::ZenToHan(result, a2, v6);
                        if ((_DWORD)result)
                        {
                          int v309 = *v6;
                          if (*v6 != 34)
                          {
                            v7->i16[0] = v12;
                            if ((_DWORD)result == 2) {
                              v7->i16[1] = v12;
                            }
                            if (v309 > 92)
                            {
                              if (v309 != 93)
                              {
                                if (v309 != 65377 || a2[2] < 32) {
                                  goto LABEL_721;
                                }
                                int v313 = a2[1];
                                int v314 = 12289;
                                v315 = &dword_2A9E4;
                                while (v313 != v314)
                                {
                                  int v316 = *v315++;
                                  int v314 = v316;
                                  if (!v316)
                                  {
                                    int v317 = 46;
                                    v318 = &dword_2AA38;
                                    while (v317 != v313)
                                    {
                                      int v319 = *v318++;
                                      int v317 = v319;
                                      if (!v319)
                                      {
                                        int v320 = 0;
                                        goto LABEL_720;
                                      }
                                    }

                                    break;
                                  }
                                }

                                int v320 = 1;
LABEL_720:
                                if (v320 | a5) {
                                  goto LABEL_721;
                                }
                                *(void *)(v6 + 1) = 0x2000000020LL;
                                v7->i16[1] = v12;
                                v7->i16[2] = v12;
                                v6 += 3;
                                size_t v7 = (int16x4_t *)((char *)v7 + 6);
                                unsigned __int16 v336 = *v9 & 0xFE1F | 0x120;
                                goto LABEL_729;
                              }
                            }

                            else
                            {
                              if (v309 == 32)
                              {
                                ++v6;
                                size_t v7 = (int16x4_t *)((char *)v7 + 2);
                                __int16 v329 = *v9 & 0xFE00 | (2 * v13);
                                __int16 v330 = 289;
                                goto LABEL_728;
                              }

                              if (v309 != 33)
                              {
                                if (v309 == 91 && !a5 && a2[2] >= 128)
                                {
                                  int v331 = 65378;
                                  goto LABEL_716;
                                }

LABEL_721:
                                v6 += (int)result;
                                size_t v7 = (int16x4_t *)((char *)v7 + 2 * (int)result);
                                unsigned int v333 = *v9;
                                __int16 v334 = v333 | 1;
                                *unsigned int v9 = v333 | 1;
                                int v335 = (v333 >> 1) & 0xF;
                                if (v335 == 9)
                                {
                                  if (!v368) {
                                    goto LABEL_723;
                                  }
LABEL_727:
                                  __int16 v329 = v334 & 0xFFE3;
                                  __int16 v330 = 18;
LABEL_728:
                                  unsigned __int16 v336 = v329 | v330;
                                }

                                else
                                {
                                  BOOL v15 = v335 == 5;
                                  char v337 = v368;
                                  if (!v15) {
                                    char v337 = 0;
                                  }
                                  if ((v337 & 1) != 0) {
                                    goto LABEL_727;
                                  }
LABEL_723:
                                  unsigned __int16 v336 = v334 & 0xFFE1 | (2 * v13);
                                }

LABEL_729:
                                *unsigned int v9 = v336;
LABEL_730:
                                __int16 v310 = *v9;
                                unsigned __int16 v338 = *v9 | 1;
                                *unsigned int v9 = v338;
                                int v339 = *a2;
                                int v340 = 65288;
                                v341 = &dword_2A994;
                                while (v339 != v340)
                                {
                                  int v342 = *v341++;
                                  int v340 = v342;
                                  if (!v342)
                                  {
                                    int v343 = 40;
                                    v344 = &dword_2A9C8;
                                    while (v343 != v339)
                                    {
                                      int v345 = *v344++;
                                      int v343 = v345;
                                      if (!v345)
                                      {
                                        __int16 v311 = 129;
                                        goto LABEL_737;
                                      }
                                    }

                                    break;
                                  }
                                }

                                unsigned __int16 v312 = v338 & 0xFF7F;
                                goto LABEL_739;
                              }

LABEL_693:
                              int v321 = a2[1];
                              int v322 = 12289;
                              v323 = &dword_2A9E4;
                              while (v321 != v322)
                              {
                                int v324 = *v323++;
                                int v322 = v324;
                                if (!v324)
                                {
                                  int v325 = 46;
                                  v326 = &dword_2AA38;
                                  while (v325 != v321)
                                  {
                                    int v327 = *v326++;
                                    int v325 = v327;
                                    if (!v327)
                                    {
                                      int v328 = 0;
                                      goto LABEL_702;
                                    }
                                  }

                                  break;
                                }
                              }

                              int v328 = 1;
LABEL_702:
                              if (!(v328 | a5))
                              {
                                v6[1] = 32;
                                v7->i16[1] = v12;
                                v6 += 2;
                                size_t v7 = (int16x4_t *)((char *)v7 + 4);
                                *(_DWORD *)unsigned int v9 = 288;
                                goto LABEL_730;
                              }

                              if (v309 != 93) {
                                goto LABEL_721;
                              }
                            }

                            unsigned int v332 = (*v9 >> 1) & 0xF;
                            if (v332 == 6)
                            {
                              if (a5) {
                                goto LABEL_721;
                              }
                            }

                            else if (a5 || v332 < 0xA)
                            {
                              goto LABEL_721;
                            }

                            int v331 = 65379;
LABEL_716:
                            *v6++ = v331;
                            size_t v7 = (int16x4_t *)((char *)v7 + 2);
                            goto LABEL_730;
                          }
                        }

                        size_t result = ktoau::SetKigou((uint64_t)v9, a2, (uint64_t)v6, v7, v12);
                        if ((_DWORD)result)
                        {
                          v6 += (int)result;
                          size_t v7 = (int16x4_t *)((char *)v7 + 2 * (int)result);
                          __int16 v310 = *v9 & 0xFFE0 | (2 * v13);
                          *unsigned int v9 = v310 | 1;
                          if (*a2 != 65374 && *a2 != 8208)
                          {
                            int v11 = v378;
                            goto LABEL_740;
                          }

                          __int16 v311 = 33;
LABEL_737:
                          unsigned __int16 v312 = v310 | v311;
                        }

                        else
                        {
                          *v6++ = *a2;
                          v7->i16[0] = v12;
                          size_t v7 = (int16x4_t *)((char *)v7 + 2);
                          unsigned __int16 v312 = *v9 & 0xFFE0 | (2 * v13);
                        }

LABEL_739:
                        int v11 = v378;
                        *unsigned int v9 = v312;
LABEL_740:
                        ++a2;
                        ++v12;
                      }
                    }
                  }
                }

                else if ((*v9 & 0x80) != 0 {
                       && v367 <= 2
                }
                       && (*v9 & 0x1E) == 0x1A
                       && ktoau::IsSetubiu((uint64_t)v9, a2, (uint64_t)v380) == 1
                       && *a2 != 20013
                       && *a2 != 22823
                       && ((v370 = a2 + 1, ktoau::IsKanjiNa((uint64_t)v9, a2 + 1, 0))
                        && !ktoau::IsKanjiNa((uint64_t)v9, a2 + 2, 0)
                        && ((uint64_t v124 = *((void *)v9 + 3)) == 0 || (v124 & 0x200) != 0)
                        && (size_t result = ktoau::TanKanji2SetSub(0, v380, a2[2], a2[3], *a2 + 1, (uint64_t)(a2 + 2)),
                            !(_DWORD)result)
                        || (!wcsncmp(a2, dword_2AA80, 2uLL) || !wcsncmp(a2, dword_2AA8C, 2uLL))
                        && (size_t result = ktoau::IsKanjiMatch((uint64_t)v9, v370, v380), (_DWORD)result)
                        || (*v10 & 2) != 0 && (size_t result = wcsncmp(a2, dword_2AA98, 2uLL), !(_DWORD)result)
                        || ktoau::IsKanjiMatch((uint64_t)v9, v370, v380)
                        && (size_t result = ktoau::IsKanjiMatch((uint64_t)v9, a2 + 3, v380), (_DWORD)result)))
                {
                  int v368 = 0;
                  int v123 = 0;
                  if (!v361) {
                    goto LABEL_258;
                  }
LABEL_242:
                  int v11 = v378;
                  if ((*(_WORD *)v378 & 0x80) == 0
                    && ((*(_WORD *)v378 & 0x200) == 0
                     || (size_t result = ktoau::IsSetubiNa((uint64_t)v9, a2, 1), !(_DWORD)result))
                    && (*v10 & 0x80) == 0
                    || (size_t result = ktoau::IsSetubiu((uint64_t)v9, a2, (uint64_t)v380), !(_DWORD)result))
                  {
                    int v123 = 1;
LABEL_258:
                    int v366 = v123;
                    if ((v13 - 11) <= 1)
                    {
                      if ((*v9 & 0x19E) == 0x9A)
                      {
                        if (!wcsncmp(a2, dword_2AACC, 2uLL)
                          || !wcsncmp(a2, dword_2AAD8, 2uLL)
                          || !wcsncmp(a2, dword_2AAE4, 2uLL)
                          || !wcsncmp(a2, dword_2AAF0, 2uLL)
                          || !wcsncmp(a2, dword_2AAFC, 2uLL)
                          || !wcsncmp(a2, dword_2AB08, 2uLL)
                          || !wcsncmp(a2, dword_2AB14, 2uLL)
                          || !wcsncmp(a2, dword_2AB20, 2uLL)
                          || (int v133 = wcsncmp(a2, (const __int32 *)&unk_2AB2C, 1uLL)) == 0
                          || (size_t result = ktoau::TanKanji2SetSub(v133, v380, *a2, a2[1], *(a2 - 1), (uint64_t)a2),
                              !(_DWORD)result))
                        {
                          size_t result = ktoau::IsSetubiu((uint64_t)v9, a2, (uint64_t)v380);
                          if ((_DWORD)result)
                          {
                            int v134 = result;
                            if ((*(_WORD *)v378 & 0x400) != 0)
                            {
                              *v6++ = 32;
                              v7->i16[0] = v12;
                              size_t v7 = (int16x4_t *)((char *)v7 + 2);
                            }

                            uint64_t v135 = *((void *)v9 + 2);
                            *((void *)v9 + 1) = v135;
                            int v136 = *a2;
                            if (*a2 == 30010
                              && ((v135 & 8) == 0
                               || (size_t result = (uint64_t)wcscpy(v380, dword_2AB34), v136 = *a2, *a2 == 30010)))
                            {
                              if ((*v10 & 0x10) != 0)
                              {
                                size_t result = (uint64_t)wcscpy(v380, dword_2AB44);
                                int v136 = *a2;
                                goto LABEL_278;
                              }
                            }

                            else
                            {
LABEL_278:
                              if (v136 == 26449)
                              {
                                if ((*v10 & 0x40) == 0 || (size_t result = (uint64_t)wcscpy(v380, dword_2AB50), *a2 == 26449))
                                {
                                  if ((*v10 & 0x20) != 0) {
                                    size_t result = (uint64_t)wcscpy(v380, dword_29324);
                                  }
                                }
                              }
                            }

                            __int32 v137 = v380[0];
                            if (v380[0])
                            {
                              int v138 = 0;
                              int v139 = 0;
                              __int32 v140 = &v380[1];
                              __int16 v141 = v12;
                              __int32 v142 = v7;
                              unsigned __int32 v143 = v6;
                              do
                              {
                                if (v137 != 32 || v138)
                                {
                                  int v138 = 0;
                                  *v143++ = v137;
                                  v142->i16[0] = v141;
                                  __int32 v142 = (int16x4_t *)((char *)v142 + 2);
                                  ++v139;
                                }

                                else
                                {
                                  ++v141;
                                  int v138 = 1;
                                }

                                __int32 v144 = *v140++;
                                __int32 v137 = v144;
                              }

                              while (v144);
                            }

                            else
                            {
                              int v139 = 0;
                              unsigned __int32 v143 = v6;
                            }

                            *unsigned __int32 v143 = 0;
                            v6 += v139;
                            size_t v7 = (int16x4_t *)((char *)v7 + 2 * v139);
                            *unsigned int v9 = *v9 & 0xFE01 | 0x9A;
                            a2 += v134;
                            v12 += v134;
                            goto LABEL_136;
                          }
                        }
                      }

                      if (v13 == 11) {
                        goto LABEL_295;
                      }
                    }

                    goto LABEL_292;
                  }

                  if ((*(_WORD *)v378 & 0x400) != 0)
                  {
                    *v6++ = 32;
                    v7->i16[0] = v12;
                    size_t v7 = (int16x4_t *)((char *)v7 + 2);
                  }

                  __int32 v125 = v380[0];
                  if (v380[0])
                  {
                    int v126 = 0;
                    int v127 = 0;
                    __int32 v128 = &v380[1];
                    __int16 v129 = v12;
                    unsigned int v130 = v7;
                    __int32 v131 = v6;
                    do
                    {
                      if (v125 != 32 || v126)
                      {
                        int v126 = 0;
                        *v131++ = v125;
                        v130->i16[0] = v129;
                        unsigned int v130 = (int16x4_t *)((char *)v130 + 2);
                        ++v127;
                      }

                      else
                      {
                        ++v129;
                        int v126 = 1;
                      }

                      __int32 v132 = *v128++;
                      __int32 v125 = v132;
                    }

                    while (v132);
                  }

                  else
                  {
                    int v127 = 0;
                    __int32 v131 = v6;
                  }

                  *__int32 v131 = 0;
                  v6 += v127;
                  size_t v7 = (int16x4_t *)((char *)v7 + 2 * v127);
                  a2 += (int)result;
                  v12 += result;
                  *unsigned int v9 = *v9 & 0xFE01 | 0x9A;
                  unsigned __int16 v181 = v9[20];
                  if ((v181 & 0x300) != 0)
                  {
                    size_t result = ktoau::IsKei(result, a2);
                    if (!(_DWORD)result)
                    {
                      unsigned __int16 v181 = *(_WORD *)v378;
                      goto LABEL_393;
                    }

                    *(void *)uint64_t v10 = 1024LL;
                    void *v378 = 0LL;
                  }

                  else
                  {
LABEL_393:
                    if ((v181 & 0x200) != 0 && (size_t result = ktoau::IsSetubiNa((uint64_t)v9, a2 + 1, 1), (_DWORD)result))
                    {
                      *(void *)uint64_t v10 = 0LL;
                      void *v378 = 512LL;
                    }

                    else
                    {
                      *(void *)uint64_t v10 = 0LL;
                      void *v378 = 0LL;
                    }
                  }
                }

                else
                {
                  size_t result = (uint64_t)wcscpy(v380, v379);
                  *((void *)v9 + 1) = *((void *)v9 + 3);
                  unsigned int v121 = *v9;
                  if ((v121 & 0x20) != 0)
                  {
                    int v11 = v378;
                  }

                  else
                  {
                    int v122 = (v121 >> 1) & 0xF;
                    int v11 = v378;
                    if (v122 != 3 && v122 != 8)
                    {
                      *v6++ = 32;
                      v7->i16[0] = v12;
                      size_t v7 = (int16x4_t *)((char *)v7 + 2);
                    }
                  }

                  __int32 v183 = v380[0];
                  if (v380[0])
                  {
                    int v184 = 0;
                    int v185 = 0;
                    __int32 v186 = &v380[1];
                    __int16 v187 = v12;
                    __int32 v188 = v7;
                    __int32 v189 = v6;
                    do
                    {
                      if (v183 != 32 || v184)
                      {
                        int v184 = 0;
                        *v189++ = v183;
                        v188->i16[0] = v187;
                        __int32 v188 = (int16x4_t *)((char *)v188 + 2);
                        ++v185;
                      }

                      else
                      {
                        ++v187;
                        int v184 = 1;
                      }

                      __int32 v190 = *v186++;
                      __int32 v183 = v190;
                    }

                    while (v190);
                  }

                  else
                  {
                    int v185 = 0;
                    __int32 v189 = v6;
                  }

                  *__int32 v189 = 0;
                  a2 += v367;
                  v12 += v367;
                  v6 += v185;
                  size_t v7 = (int16x4_t *)((char *)v7 + 2 * v185);
                  *unsigned int v9 = *v9 & 0xFE00 | 0x9B;
                  *((void *)v9 + 5) = 0LL;
                }
              }

              else
              {
                int v368 = 0;
                int v123 = 0;
                if (!v38) {
                  goto LABEL_258;
                }
LABEL_182:
                size_t result = wcsncmp(a2, dword_2AAA4, 2uLL);
                if (!(_DWORD)result) {
                  goto LABEL_242;
                }
                size_t result = wcsncmp(a2, dword_2AAB0, 2uLL);
                if (!(_DWORD)result) {
                  goto LABEL_242;
                }
                size_t result = ktoau::IsFukuKanji(result, a2, v380);
                if (!(_DWORD)result) {
                  goto LABEL_242;
                }
                size_t result = ktoau::IsMojiMode(result, a2 + 1);
                if ((_DWORD)result != 12
                  || (size_t result = ktoau::TanKanji2SetSub(12, v380, a2[1], a2[2], *a2, (uint64_t)(a2 + 1)), !(_DWORD)result)
                  || (size_t result = ktoau::IsMojiMode(result, a2 + 2), (_DWORD)result != 10))
                {
                  size_t result = ktoau::IsMojiMode(result, a2 + 1);
                  if ((_DWORD)result != 10) {
                    goto LABEL_242;
                  }
                  size_t result = ktoau::IsHiraDoushi(10, a2 + 1, v380);
                  if (!(_DWORD)result) {
                    goto LABEL_242;
                  }
                }

                if (*(_DWORD *)v9 && (*(_DWORD *)v9 & 0x20) == 0)
                {
                  *v6++ = 32;
                  v7->i16[0] = v12;
                  size_t v7 = (int16x4_t *)((char *)v7 + 2);
                }

                size_t result = ktoau::IsFukuKanji(result, a2, v380);
                if (*a2 == 22823)
                {
                  int v220 = a2[1];
                  if (v220 == 23244 || v220 == 22909) {
                    size_t result = (uint64_t)wcscpy(v380, dword_2AABC);
                  }
                }

                __int32 v221 = v380[0];
                int v11 = v378;
                if (v380[0])
                {
                  int v222 = 0;
                  int v223 = 0;
                  __int32 v224 = &v380[1];
                  __int16 v225 = v12;
                  __int32 v226 = v7;
                  __int32 v227 = v6;
                  do
                  {
                    if (v221 != 32 || v222)
                    {
                      int v222 = 0;
                      *v227++ = v221;
                      v226->i16[0] = v225;
                      __int32 v226 = (int16x4_t *)((char *)v226 + 2);
                      ++v223;
                    }

                    else
                    {
                      ++v225;
                      int v222 = 1;
                    }

                    __int32 v228 = *v224++;
                    __int32 v221 = v228;
                  }

                  while (v228);
                }

                else
                {
                  int v223 = 0;
                  __int32 v227 = v6;
                }

                *__int32 v227 = 0;
                ++v12;
                v6 += v223;
                *unsigned int v9 = *v9 & 0xFE1E | 0x121;
                size_t v7 = (int16x4_t *)((char *)v7 + 2 * v223);
                *((void *)v9 + 1) = 0LL;
                *((void *)v9 + 5) = 0LL;
                ++a2;
              }
            }
          }
        }
      }
    }
  }

  if (a5 && (*v9 & 1) != 0)
  {
    *(void *)int v6 = 0x283400002838LL;
    v6 += 2;
    v7->i16[0] = v12;
    v7->i16[1] = v12;
    size_t v7 = (int16x4_t *)((char *)v7 + 4);
  }

  *int v6 = 0;
  v7->i16[0] = 0;
  return result;
}

uint64_t IsKanaCode(int a1)
{
  uint64_t v1 = 0LL;
  int v2 = 65377;
  int v3 = &dword_2AD78;
  while (v2 != a1)
  {
    ++v1;
    int v4 = *v3;
    v3 += 2;
    int v2 = v4;
    if (v1 == 63) {
      return 0;
    }
  }

  return (v1 + 1);
}

uint64_t EChk1(char *a1)
{
  if (!aYourselves[0]) {
    return 0LL;
  }
  size_t v2 = strlen(a1);
  uint64_t v3 = 1LL;
  for (uint64_t i = (unsigned __int8 *)aYourselves; memcmp(a1, i, v2) || strlen((const char *)i) != v2; i += 40)
  {
    int v5 = i[40];
    uint64_t v3 = (v3 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v3;
}

uint64_t EChk2(char *a1)
{
  if (!byte_3EA88) {
    return 0LL;
  }
  size_t v2 = strlen(a1);
  uint64_t v3 = 1LL;
  for (uint64_t i = (unsigned __int8 *)&byte_3EA88; memcmp(a1, i, v2) || strlen((const char *)i) != v2; i += 40)
  {
    int v5 = i[40];
    uint64_t v3 = (v3 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v3;
}

uint64_t EChk3(char *a1)
{
  if (!byte_3EB14) {
    return 0LL;
  }
  uint64_t v2 = 1LL;
  for (uint64_t i = &byte_3EB14; ; i += 40)
  {
    size_t v4 = strlen(i);
    if (!memcmp(a1, i, v4) && *(_DWORD *)a1 != 1852138850) {
      break;
    }
    int v5 = i[40];
    uint64_t v2 = (v2 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v2;
}

uint64_t EChk4(char *a1)
{
  if (!byte_3EBC8) {
    return 0LL;
  }
  uint64_t v2 = 1LL;
  for (uint64_t i = &byte_3EBC8; ; i += 40)
  {
    size_t v4 = strlen(i);
    if (!memcmp(a1, i, v4) && strlen(a1) > v4) {
      break;
    }
    int v5 = i[40];
    uint64_t v2 = (v2 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v2;
}

uint64_t EChk5(char *a1)
{
  if (!aYoung[0]) {
    return 0LL;
  }
  uint64_t v2 = 1LL;
  for (uint64_t i = aYoung; ; i += 40)
  {
    size_t v4 = strlen(i);
    if (!memcmp(a1, i, v4)) {
      break;
    }
    int v5 = i[40];
    uint64_t v2 = (v2 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v2;
}

uint64_t EChk6(char *a1)
{
  if (!byte_3F500) {
    return 0LL;
  }
  uint64_t v2 = 1LL;
  for (uint64_t i = &byte_3F500; ; i += 40)
  {
    size_t v4 = strlen(i);
    if (!memcmp(a1, i, v4)) {
      break;
    }
    int v5 = i[40];
    uint64_t v2 = (v2 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v2;
}

uint64_t EChk7(char *a1)
{
  if (!byte_3F780) {
    return 0LL;
  }
  size_t v2 = strlen(a1);
  uint64_t v3 = 1LL;
  for (uint64_t i = (unsigned __int8 *)&byte_3F780; memcmp(a1, i, v2) || strlen((const char *)i) != v2; i += 40)
  {
    int v5 = i[40];
    uint64_t v3 = (v3 + 2);
    if (!v5) {
      return 0LL;
    }
  }

  return v3;
}

uint64_t IsEijiTo2(char *a1, char *a2, int a3)
{
  if (!a3)
  {
    LODWORD(result) = EChk6(a1);
    if ((_DWORD)result)
    {
      int v8 = &byte_3F500;
LABEL_15:
      uint64_t v10 = &v8[20 * (int)result];
      strcpy(a2, v10);
      int v6 = v10 - 20;
      return strlen(v6);
    }

    LODWORD(result) = EChk5(a1);
    if (!(_DWORD)result)
    {
      uint64_t result = EChk4(a1);
      if (!(_DWORD)result) {
        return result;
      }
      if (*(_WORD *)a1 == 24933 && *(_WORD *)(a1 + 1) == 29281) {
        return 0LL;
      }
      int v8 = &byte_3EBC8;
      goto LABEL_15;
    }

uint64_t Is1To2Inyou(int *a1)
{
  int v1 = *a1;
  if (!*a1) {
    return 0LL;
  }
  size_t v2 = a1 + 1;
  while (v1 < 128)
  {
    int v3 = *v2++;
    int v1 = v3;
    if (!v3) {
      return 0LL;
    }
  }

  return 1LL;
}

BOOL IsInyouTozi(const __int32 *a1)
{
  while (1)
  {
    __int32 v1 = *a1;
    if (*a1 > 0x29u || ((1LL << *a1) & 0x30100000000LL) == 0) {
      break;
    }
    ++a1;
  }

  if ((m_PinInfo & 0x80) != 0)
  {
    unsigned int v4 = v1 - 8216;
    if (v4 <= 5 && ((1 << v4) & 0x31) != 0) {
      return 0LL;
    }
  }

  memset(v5, 0, sizeof(v5));
  ZenToHan(a1, (__int32 *)v5);
  return (LODWORD(v5[0]) - 128) < 0xFFFFFFA1;
}

size_t ZenToHan(const __int32 *a1, __int32 *a2)
{
  *a2 = 0;
  if (!dword_3F8FC[0]) {
    return 0LL;
  }
  int v4 = 1;
  for (uint64_t i = dword_3F8FC; ; i += 3)
  {
    size_t v6 = wcslen(i);
    if (!wcsncmp(a1, i, v6)) {
      break;
    }
    int v7 = i[3];
    ++v4;
    if (!v7) {
      return 0LL;
    }
  }

  wcscpy(a2, &dword_3F8FC[3 * v4]);
  return wcslen(a2);
}

size_t Eiji1To2(size_t result, __int32 *a2, __int16 *a3, __int16 *a4)
{
  int v5 = *(_DWORD *)result;
  if (*(_DWORD *)result)
  {
    int v8 = (const __int32 *)result;
    uint64_t v9 = 4LL;
    int v10 = *(_DWORD *)result;
    while (v10 < 128)
    {
      int v10 = *(_DWORD *)(result + v9);
      v9 += 4LL;
      if (!v10)
      {
        int v11 = 0;
        if (!v5) {
          goto LABEL_104;
        }
LABEL_8:
        int v50 = 0;
        int v12 = (const __int32 *)result;
        size_t v49 = result;
        while (2)
        {
          if ((v5 & 0xFFFFFFDF) - 65 > 0x19)
          {
            if ((v5 <= 0x29 && ((1LL << v5) & 0x30100000000LL) != 0 || v5 >= 128) && v12 > v8 && !v11)
            {
              uint64_t result = IsInyouTozi(v12);
              if ((_DWORD)result)
              {
                *a2++ = 10292;
                *a4++ = *a3;
                int v11 = 1;
              }

              else
              {
                int v11 = 0;
              }
            }

            __int32 v47 = *v12++;
            __int32 v46 = v47;
            *a2++ = v46;
            __int16 v48 = *a3++;
            *a4++ = v48;
          }

          else
          {
            uint64_t v13 = 0LL;
            int v14 = 0;
            *(_OWORD *)__int32 v55 = 0u;
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            *(_OWORD *)__s = 0u;
            __int128 v52 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            do
            {
              __int32 v15 = v12[v13];
              if ((v15 - 65) > 0x19)
              {
                v55[v13] = v15;
              }

              else
              {
                v55[v13] = v15 + 32;
                if (v14 == 1) {
                  int v16 = 2;
                }
                else {
                  int v16 = v14;
                }
                if (v14) {
                  int v14 = v16;
                }
                else {
                  int v14 = 1;
                }
              }

              ++v13;
            }

            while (v13 != 64);
            int v17 = *(v12 - 1);
            BOOL v18 = v17 == 32 || v17 == 40 || v17 == 12288 || v12 == v8;
            uint64_t result = IsEijiTo2(v55, __s, v18);
            if ((_DWORD)result)
            {
              int v19 = result;
              int v20 = strlen(__s);
              if (v50) {
                BOOL v21 = v18;
              }
              else {
                BOOL v21 = 0;
              }
              if (v21 && v19 == strlen(v55) && EChk7(v55))
              {
                if (*(a2 - 1) == 32)
                {
                  --a2;
                  uint64_t v22 = -1LL;
                }

                else
                {
                  uint64_t v22 = 0LL;
                }

                a4 += v22;
              }

              if (v18 && v19 == strlen(v55) && EChk7(v55))
              {
                int v50 = 1;
                if (!v11)
                {
LABEL_51:
                  if (v14) {
                    BOOL v23 = v18;
                  }
                  else {
                    BOOL v23 = 0;
                  }
                  if (v23)
                  {
                    if (v14 >= 1)
                    {
                      uint64_t v24 = v14;
                      __int16 v25 = a2;
                      unsigned __int16 v26 = a4;
                      do
                      {
                        *v25++ = 10272;
                        *v26++ = *a3;
                        --v24;
                      }

                      while (v24);
                    }

                    a2 += v14;
                    a4 += v14;
                  }

                  if (v20 >= 1)
                  {
                    uint64_t v27 = v20;
                    int v28 = __s;
                    uint64_t v29 = a4;
                    __int32 v30 = (unsigned int *)a2;
                    do
                    {
                      unsigned int v32 = *v28++;
                      unsigned int v31 = v32;
                      unsigned int v33 = (v32 + 127);
                      unsigned int v34 = v32 + 10112;
                      unsigned int v35 = v32 + 10048;
                      if (v32 > 0xDF) {
                        unsigned int v31 = v35;
                      }
                      if (v33 < 0x1F) {
                        unsigned int v31 = v34;
                      }
                      *v30++ = v31;
                      *v29++ = *a3;
                      --v27;
                    }

                    while (v27);
                  }

                  a2 += v20;
                  a4 += v20;
                  uint64_t result = strlen(v55);
                  __int32 v36 = &v12[v19];
                  if (v19 <= (int)result)
                  {
                    a3 += v19;
                  }

                  else
                  {
                    int v37 = *(v36 - 1);
                    BOOL v38 = &a3[v19];
                    if (v37 != 32)
                    {
                      __int32 v36 = &v12[v19 - 1];
                      BOOL v38 = &a3[v19 - 1];
                    }

                    if (v37 == 12288)
                    {
                      __int32 v36 = &v12[v19 + 1];
                      a3 += v19 + 1;
                    }

                    else
                    {
                      a3 = v38;
                    }
                  }

                  int v8 = (const __int32 *)v49;
                  goto LABEL_98;
                }
              }

              else
              {
                int v50 = 0;
                if (!v11) {
                  goto LABEL_51;
                }
              }

              *a2++ = 10278;
              *a4++ = *a3;
              goto LABEL_51;
            }

            if (v50) {
              BOOL v39 = v18;
            }
            else {
              BOOL v39 = 0;
            }
            if (v39)
            {
              uint64_t result = strlen(v55);
              if (result == 1 && v55[0] >= 97 && v55[0] <= 122)
              {
                if ((*(a2 - 1) - 31) >= 2)
                {
                  uint64_t v40 = 0LL;
                }

                else
                {
                  --a2;
                  uint64_t v40 = -1LL;
                }

                a4 += v40;
              }
            }

            if (v11)
            {
              *a2++ = 10278;
              *a4++ = *a3;
            }

            if (v14) {
              BOOL v41 = v18;
            }
            else {
              BOOL v41 = 0;
            }
            if (v41)
            {
              if (v14 >= 1)
              {
                uint64_t v42 = v14;
                __int32 v43 = a2;
                __int16 v44 = a4;
                do
                {
                  *v43++ = 10272;
                  *v44++ = *a3;
                  --v42;
                }

                while (v42);
              }

              a2 += v14;
              a4 += v14;
            }

            int v50 = 0;
            *a2++ = *v12;
            __int16 v45 = *a3++;
            *a4++ = v45;
            __int32 v36 = v12 + 1;
LABEL_98:
            int v11 = 0;
            int v12 = v36;
          }

          int v5 = *v12;
          if (!*v12) {
            goto LABEL_104;
          }
          continue;
        }
      }
    }

    int v11 = 1;
    if (v5) {
      goto LABEL_8;
    }
  }

LABEL_104:
  *a2 = 0;
  return result;
}

uint64_t IsMoji(int *a1)
{
  int v1 = *a1;
  int v2 = 12289;
  int v3 = &dword_2AF74;
  while (v1 != v2)
  {
    int v4 = *v3++;
    int v2 = v4;
    if (!v4)
    {
      int v5 = 65380;
      size_t v6 = &dword_2AF94;
      while (v5 != v1)
      {
        int v7 = *v6++;
        int v5 = v7;
        if (!v7)
        {
          int v8 = 65288;
          uint64_t v9 = &dword_2AFEC;
          while (v1 != v8)
          {
            int v10 = *v9++;
            int v8 = v10;
            if (!v10)
            {
              int v11 = 40;
              int v12 = &dword_2B010;
              while (v11 != v1)
              {
                int v13 = *v12++;
                int v11 = v13;
                if (!v13)
                {
                  int v14 = 65289;
                  __int32 v15 = &dword_2AFB4;
                  while (v1 != v14)
                  {
                    int v16 = *v15++;
                    int v14 = v16;
                    if (!v16)
                    {
                      int v17 = 41;
                      BOOL v18 = &dword_2AFD8;
                      while (v17 != v1)
                      {
                        int v19 = *v18++;
                        int v17 = v19;
                        if (!v19)
                        {
                          uint64_t result = 4LL;
                          if (v1 > 65291)
                          {
                            if (v1 == 65292 || v1 == 65294) {
                              return result;
                            }
                          }

                          else if (v1 == 44 || v1 == 46)
                          {
                            return result;
                          }

                          unsigned int v21 = v1 - 65313;
                          unsigned int v22 = v1 - 65345;
                          unsigned int v23 = (v1 & 0xFFFFFFDF) - 65;
                          unsigned int v24 = v1 - 65296;
                          unsigned int v25 = v1 - 48;
                          if (v24 >= 0xA && v25 >= 0xA) {
                            unsigned int v27 = 0;
                          }
                          else {
                            unsigned int v27 = 6;
                          }
                          if (v22 < 0x1A) {
                            unsigned int v27 = 5;
                          }
                          if (v21 < 0x1A) {
                            unsigned int v27 = 5;
                          }
                          if (v23 >= 0x1A) {
                            return v27;
                          }
                          else {
                            return 5LL;
                          }
                        }
                      }

                      return 3LL;
                    }
                  }

                  return 3LL;
                }
              }

              return 2LL;
            }
          }

          return 2LL;
        }
      }

      return 1LL;
    }
  }

  return 1LL;
}

uint64_t IsShortLen(unsigned __int16 *a1)
{
  if (!*a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  int v3 = a1 + 1;
  while (v3[result++])
    ;
  return result;
}

uint64_t IsLap(unsigned int a1, int a2)
{
  uint64_t v3 = m_cStrBuf;
  unsigned int v4 = IsMoji((int *)(m_cStrBuf + 4LL * a1 - 4));
  uint64_t v5 = m_sPinKeyBuf;
  uint64_t v6 = m_iPinBlockCount * a2;
  if (*(_WORD *)(m_sPinKeyBuf + 2 * v6))
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    LODWORD(v7) = 0;
  }

  int v9 = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * ((int)v6 + (int)v7 - 1));
  int v10 = IsMoji((int *)(v3 + 4LL * *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * ((int)v6 + (int)v7 - 1)) - 4));
  if (v10 == 2 || (!v10 ? (BOOL v11 = (v4 & 5) == 1) : (BOOL v11 = 0), v11))
  {
    uint64_t v18 = (int)v7;
    while (v18 >= 6)
    {
      uint64_t v15 = v18 - 1;
      uint64_t v19 = *(unsigned __int16 *)(v5 + 2LL * ((int)v6 - 2 + (int)v18--));
      if (v9 != (_DWORD)v19)
      {
        uint64_t v12 = (v15 - 1);
        if ((int)v15 + 1 > 6)
        {
          uint64_t v21 = (int)v15 - 1 + 1LL;
          uint64_t v12 = (v15 - 1);
          while (*(unsigned __int16 *)(v5 + 2LL * ((int)v6 + (int)v15 - 2)) == *(unsigned __int16 *)(v5 + 2LL * ((int)v6 + (int)v12 - 1)))
          {
            --v21;
            uint64_t v12 = (v12 - 1);
            if (v21 <= 5) {
              return 0LL;
            }
          }
        }

        return v12;
      }
    }

    return 0LL;
  }

  if (v10 == 6)
  {
    if (v4 <= 6 && ((1 << v4) & 0x5A) != 0)
    {
      uint64_t v23 = (int)v7;
      uint64_t v24 = (int)v7 - 1 + 2LL;
      while (v23 >= 6)
      {
        uint64_t v12 = v23 - 1;
        uint64_t v25 = *(unsigned __int16 *)(v5 + 2LL * ((int)v6 - 2 + (int)v23));
        int v26 = IsMoji((int *)(v3 + 4 * v25 - 4));
        --v24;
        uint64_t v23 = v12;
        if (v26 != 6)
        {
          if (v26 == 2)
          {
            if ((int)v12 + 1 >= 6)
            {
              while ((_DWORD)v25 == *(unsigned __int16 *)(v5 + 2LL * ((int)v6 - 1 + (int)v12)))
              {
                --v24;
                uint64_t v12 = (v12 - 1);
                if (v24 <= 5) {
                  return 0LL;
                }
              }
            }
          }

          return v12;
        }
      }
    }

    return 0LL;
  }

  if (v10 != 5) {
    return 0LL;
  }
  uint64_t v12 = 0LL;
  if (v4 <= 5 && ((1 << v4) & 0x3A) != 0)
  {
    uint64_t v13 = (int)v7;
    uint64_t v14 = (int)v7 - 1 + 2LL;
    while (v13 >= 6)
    {
      uint64_t v15 = v13 - 1;
      uint64_t v16 = *(unsigned __int16 *)(v5 + 2LL * ((int)v6 - 2 + (int)v13));
      int v17 = IsMoji((int *)(v3 + 4 * v16 - 4));
      --v14;
      uint64_t v13 = v15;
      if (v17 != 5)
      {
        if (v17 != 2) {
          return v15;
        }
        if ((int)v15 + 1 >= 6)
        {
          while ((_DWORD)v16 == *(unsigned __int16 *)(v5 + 2LL * ((int)v6 - 1 + (int)v15)))
          {
            --v14;
            uint64_t v15 = (v15 - 1);
            if (v14 <= 5) {
              return 0LL;
            }
          }
        }

        uint64_t v12 = v15;
        return v12;
      }
    }

    return 0LL;
  }

  return v12;
}

_WORD *MyShortCpy(_WORD *result, unsigned __int16 *a2)
{
  __int16 v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = a2 + 1;
    do
    {
      *result++ = v2;
      int v4 = *v3++;
      __int16 v2 = v4;
    }

    while (v4);
  }

  *uint64_t result = 0;
  return result;
}

void SetPinDat(char *__s, __int16 a2)
{
  if ((a2 & 0x3FFF) == 0 || !*__s) {
    return;
  }
  int v4 = m_iMaxCol;
  uint64_t v5 = m_iMaxCol;
  uint64_t v6 = m_sPinStrBuf;
  int v222 = m_iPinBlockCount;
  unsigned int v223 = a2 & 0x3FFF;
  uint64_t v7 = m_iPinBlockCount * m_iMaxCol;
  int v8 = (_WORD *)(m_sPinStrBuf + 2 * v7);
  int v9 = (unsigned __int16)*v8;
  if (*v8)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    LODWORD(v10) = 0;
  }

  if (strlen(__s) + (int)v10 > m_iMaxCol)
  {
    uint64_t v12 = (int)v10;
    m_iCurFlg = 0;
    if ((v10 & 0x80000000) == 0)
    {
      while ((v8[v12] & 0x100) == 0)
      {
        BOOL v13 = v12-- < 1;
        if (v13) {
          goto LABEL_13;
        }
      }

      m_iCurFlg = 1;
      if (m_iWordLapFlg)
      {
        if (!v9) {
          goto LABEL_74;
        }
        int v18 = -2;
        uint64_t v19 = -1LL;
        uint64_t v20 = 2 * v7;
        do
        {
          int v21 = *(unsigned __int16 *)(m_sPinStrBuf + 2 + v20);
          v20 += 2LL;
          v18 += 2;
          ++v19;
        }

        while (v21);
        int v22 = v7 + v19;
        __int16 v23 = *(_WORD *)(m_sPinStrBuf + 2LL * ((int)v7 + (int)v19));
        if (v23 == 64)
        {
          int v24 = 0;
        }

        else
        {
          int v24 = 0;
          __int16 v48 = (unsigned __int16 *)(m_sPinKeyBuf + v20);
          while (1)
          {
            if (v8[v19] == 64)
            {
              int v49 = *(v48 - 1);
              if (v49 != *(v48 - 2)) {
                break;
              }
              int v50 = *v48;
              if (v49 != v50 && v50 != 0) {
                break;
              }
            }

            if ((v8[v19] & 0x100) != 0) {
              int v24 = 1;
            }
            --v48;
            BOOL v13 = v19-- <= 0;
            if (v13) {
              goto LABEL_74;
            }
          }
        }

        if ((int)v19 < 1)
        {
LABEL_74:
          m_iNextCol = v223;
LABEL_75:
          uint64_t v16 = &m_iInitErrCode;
          int v17 = 1;
          goto LABEL_76;
        }

        uint64_t v25 = v19;
        uint64_t v26 = v19;
        while ((LOBYTE(v8[v26]) | 0x80) == 0xC0)
        {
          BOOL v13 = v26-- <= 0;
          if (v13) {
            goto LABEL_74;
          }
        }

        if ((v23 & 0x1FF) == 0x140 && v223 == *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * v22))
        {
          m_iBeforeCol = v223 - 1;
          int v222 = m_iPinBlockCount + 1;
          m_iPinBlockCount = v222;
          m_iPinBlockCur = v222;
          goto LABEL_185;
        }

        if (v24)
        {
          uint64_t v143 = v19;
          while (*(unsigned __int16 *)(m_sPinKeyBuf + 2LL * ((int)v19 + (int)v7 + 1)) == *(unsigned __int16 *)(m_sPinKeyBuf + 2 * v7 + 2 * v143))
          {
            BOOL v13 = v143-- <= 1;
            if (v13)
            {
              LODWORD(v143) = 0;
              break;
            }
          }

          m_iBeforeCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * ((int)v143 + (int)v7));
          int v144 = m_iMaxCol + m_iMaxCol * m_iPinBlockCount;
          *(_WORD *)(m_sPinKeyBuf + 2LL * v144) = 0;
          *(_WORD *)(v6 + 2LL * v144) = 0;
          int v145 = &v8[v19];
          int v148 = (unsigned __int16)v145[1];
          int v146 = v145 + 1;
          __int16 v147 = v148;
          if (v148)
          {
            int v149 = (unsigned __int16 *)(2 * v7 + 2LL * v19 + v6 + 4);
            int v150 = &v224;
            do
            {
              *v150++ = v147;
              int v151 = *v149++;
              __int16 v147 = v151;
            }

            while (v151);
          }

          else
          {
            int v150 = &v224;
          }

          *int v150 = 0;
          size_t v165 = v18 - 2 * (int)v19;
          bzero(v146, v165);
          int v166 = m_iPinBlockCount;
          __int32 v167 = (_WORD *)(m_sPinStrBuf + 2LL * (v4 + v4 * m_iPinBlockCount));
          __int16 v168 = v224;
          if (v224)
          {
            int v169 = (unsigned __int16 *)v225;
            do
            {
              *v167++ = v168;
              int v170 = *v169++;
              __int16 v168 = v170;
            }

            while (v170);
          }

          *__int32 v167 = 0;
          int v171 = v166 * v5;
          uint64_t v172 = m_sPinKeyBuf + 2LL * v166 * (int)v5 + 2 * v25;
          int v175 = *(unsigned __int16 *)(v172 + 2);
          __int32 v173 = (void *)(v172 + 2);
          __int16 v174 = v175;
          if (v175)
          {
            __int32 v176 = (unsigned __int16 *)(2LL * v171 + 2 * v25 + m_sPinKeyBuf + 4);
            BOOL v177 = &v224;
            do
            {
              *v177++ = v174;
              int v178 = *v176++;
              __int16 v174 = v178;
            }

            while (v178);
          }

          else
          {
            BOOL v177 = &v224;
          }

          *BOOL v177 = 0;
          bzero(v173, v165);
          int v126 = m_iPinBlockCount + 1;
          __int32 v179 = (_WORD *)(m_sPinKeyBuf + 2LL * (m_iPinBlockCount + 1) * (int)v5);
          __int16 v180 = v224;
          if (v224)
          {
            unsigned __int16 v181 = (unsigned __int16 *)v225;
            do
            {
              *v179++ = v180;
              int v182 = *v181++;
              __int16 v180 = v182;
            }

            while (v182);
          }

          goto LABEL_292;
        }

        else {
          int v163 = v223;
        }
        m_iNextCol = v163;
        size_t v164 = v18 - 2 * (int)v19;
        bzero(&v8[v19 + 1], v164);
        __int32 v72 = (void *)(m_sPinKeyBuf + 2LL * m_iPinBlockCount * v4 + 2 * v25 + 2);
        size_t v73 = v164;
LABEL_109:
        bzero(v72, v73);
        goto LABEL_75;
      }

      unsigned int v39 = IsLap(v223, m_iMaxCol);
      if (!v39)
      {
        if (strlen(__s) == 1 && *__s == 64) {
          return;
        }
        if (v9)
        {
          uint64_t v58 = 0LL;
        }

        else
        {
          LODWORD(v58) = 0;
        }

        int v142 = v7 + v58 - 1;
        if (v223 == *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * v142))
        {
          if (*(_BYTE *)(v6 + 2LL * v142) != 64)
          {
            uint64_t v152 = (v58 - 2);
            if ((int)v58 >= 2)
            {
              while (v223 == *(unsigned __int16 *)(m_sPinKeyBuf + 2 * v7 + 2 * v152) && LOBYTE(v8[v152]) != 64)
              {
                BOOL v13 = v152-- <= 0;
                if (v13)
                {
                  LODWORD(v152) = -1;
                  break;
                }
              }
            }

            else {
              int v153 = v152;
            }
            if ((a2 & 0x4000) != 0)
            {
              m_iBeforeCol = v223 - 1;
              __int32 v156 = &v8[v153];
              __int16 v157 = *v156;
              if (*v156)
              {
                uint64_t v158 = 2 * v7;
                uint64_t v159 = v153;
                __int16 v160 = (unsigned __int16 *)(v158 + 2LL * v153 + v6 + 2);
                __int32 v161 = &v224;
                do
                {
                  *v161++ = v157;
                  int v162 = *v160++;
                  __int16 v157 = v162;
                }

                while (v162);
              }

              else
              {
                uint64_t v159 = v153;
                __int32 v161 = &v224;
              }

              *__int32 v161 = 0;
              size_t v205 = 4 * ((int)v58 - v153);
              bzero(v156, v205);
              int v206 = m_iPinBlockCount;
              __int16 v207 = (_WORD *)(m_sPinStrBuf + 2LL * (v4 + v4 * m_iPinBlockCount));
              __int16 v208 = v224;
              if (v224)
              {
                __int32 v209 = (unsigned __int16 *)v225;
                do
                {
                  *v207++ = v208;
                  int v210 = *v209++;
                  __int16 v208 = v210;
                }

                while (v210);
              }

              *__int16 v207 = 0;
              int v211 = v206 * v5;
              __int32 v212 = (__int16 *)(m_sPinKeyBuf + 2LL * v211 + 2 * v159);
              __int16 v213 = *v212;
              if (*v212)
              {
                int v214 = (unsigned __int16 *)(2LL * v211 + 2 * v159 + m_sPinKeyBuf + 2);
                __int32 v215 = &v224;
                do
                {
                  *v215++ = v213;
                  int v216 = *v214++;
                  __int16 v213 = v216;
                }

                while (v216);
              }

              else
              {
                __int32 v215 = &v224;
              }

              *__int32 v215 = 0;
              bzero(v212, v205);
              int v126 = m_iPinBlockCount + 1;
              __int32 v179 = (_WORD *)(m_sPinKeyBuf + 2LL * (m_iPinBlockCount + 1) * (int)v5);
              __int16 v217 = v224;
              if (v224)
              {
                __int32 v218 = (unsigned __int16 *)v225;
                do
                {
                  *v179++ = v217;
                  int v219 = *v218++;
                  __int16 v217 = v219;
                }

                while (v219);
              }

LABEL_292:
              *__int32 v179 = 0;
              m_iPinBlockCount = v126;
              __int32 v132 = &m_iInitErrCode;
              int v222 = v126;
LABEL_293:
              v132[6] = v126;
              goto LABEL_185;
            }

            m_iNextCol = v223;
            size_t v70 = 4 * ((int)v58 - v153);
            bzero(&v8[v153], v70);
            __int32 v72 = (void *)(m_sPinKeyBuf + 2LL * m_iPinBlockCount * v4 + 2LL * v153);
            goto LABEL_108;
          }

          if ((a2 & 0x4000) != 0)
          {
            m_iBeforeCol = v223 - 1;
            m_iPinBlockCount = ++v222;
            goto LABEL_185;
          }
        }

        m_iNextCol = v223;
        goto LABEL_75;
      }

      if (v9)
      {
        unint64_t v40 = 0LL;
        uint64_t v41 = v39;
        if (v39 <= v40)
        {
          if ((*(_WORD *)(v6 + 2 * (v7 + v39)) & 0x100) != 0)
          {
            int v47 = 1;
          }

          else
          {
            unint64_t v43 = v39 - v40;
            unint64_t v44 = v39;
            do
            {
              unint64_t v45 = v44;
              if (!v43) {
                break;
              }
              __int16 v46 = *(_WORD *)(v6 + 2 * v7 + 2 + 2 * v44);
              ++v43;
              ++v44;
            }

            while ((v46 & 0x100) == 0);
            int v47 = v45 < v40;
          }

LABEL_97:
          int v60 = 0;
          uint64_t v61 = v41;
          do
          {
            if ((*(_WORD *)(v6 + 2 * v7 - 2 + 2 * v61) & 0x100) != 0) {
              int v60 = 1;
            }
            BOOL v13 = v61-- <= 1;
          }

          while (!v13);
          if (((v60 != 0) & ~v47) == 0)
          {
            m_iBeforeCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * (int)(v7 + v39 - 1));
            int v62 = v5 + v5 * v222;
            *(_WORD *)(m_sPinKeyBuf + 2LL * v62) = 0;
            *(_WORD *)(v6 + 2LL * v62) = 0;
            __int32 v63 = &v8[v41];
            __int16 v64 = *v63;
            uint64_t v65 = 2 * v41;
            int v221 = v47;
            uint64_t v66 = v41;
            if (*v63)
            {
              __int16 v67 = (unsigned __int16 *)(v65 + 2 * v7 + v6 + 2);
              __int32 v68 = &v224;
              do
              {
                *v68++ = v64;
                int v69 = *v67++;
                __int16 v64 = v69;
              }

              while (v69);
            }

            else
            {
              __int32 v68 = &v224;
            }

            *__int32 v68 = 0;
            size_t v114 = (int)(2 * (v40 - v39));
            bzero(v63, v114);
            int v115 = m_iPinBlockCount;
            __int32 v116 = (_WORD *)(m_sPinStrBuf + 2LL * ((int)v5 + (int)v5 * m_iPinBlockCount));
            __int16 v117 = v224;
            if (v224)
            {
              __int32 v118 = (unsigned __int16 *)v225;
              do
              {
                *v116++ = v117;
                int v119 = *v118++;
                __int16 v117 = v119;
              }

              while (v119);
            }

            *__int32 v116 = 0;
            int v120 = v115 * v4;
            unsigned int v121 = (__int16 *)(m_sPinKeyBuf + 2LL * v120 + 2 * v66);
            __int16 v122 = *v121;
            if (*v121)
            {
              int v123 = (unsigned __int16 *)(v65 + 2LL * v120 + m_sPinKeyBuf + 2);
              uint64_t v124 = &v224;
              do
              {
                *v124++ = v122;
                int v125 = *v123++;
                __int16 v122 = v125;
              }

              while (v125);
            }

            else
            {
              uint64_t v124 = &v224;
            }

            *uint64_t v124 = 0;
            bzero(v121, v114);
            int v126 = m_iPinBlockCount + 1;
            int v127 = (_WORD *)(m_sPinKeyBuf + 2LL * (m_iPinBlockCount + 1) * (int)v5);
            __int16 v128 = v224;
            if (v224)
            {
              __int16 v129 = (unsigned __int16 *)v225;
              int v130 = v221;
              do
              {
                *v127++ = v128;
                int v131 = *v129++;
                __int16 v128 = v131;
              }

              while (v131);
            }

            else
            {
              int v130 = v221;
            }

            *int v127 = 0;
            m_iPinBlockCount = v126;
            int v222 = v126;
            if (!v130) {
              goto LABEL_185;
            }
            __int32 v132 = (_DWORD *)&m_iInitErrCode;
            goto LABEL_293;
          }

          m_iNextCol = *(unsigned __int16 *)(m_sPinKeyBuf + 2LL * (int)(v39 + v7));
          size_t v70 = (int)(2 * (v40 - v39));
          uint64_t v71 = v41;
          bzero(&v8[v41], v70);
          __int32 v72 = (void *)(m_sPinKeyBuf + 2LL * m_iPinBlockCount * (int)v5 + 2 * v71);
LABEL_108:
          size_t v73 = v70;
          goto LABEL_109;
        }
      }

      else
      {
        LODWORD(v40) = 0;
      }

      int v47 = 0;
      uint64_t v41 = v39;
      goto LABEL_97;
    }

LABEL_153:
      *__int32 v105 = 0;
      int v222 = v104;
      m_iPinBlockCount = v104;
      goto LABEL_185;
    }

    int v27 = m_iPinBlockCount;
    if (m_iPinBlockCount)
    {
      int v38 = dword_41400;
      if (!dword_41400)
      {
        int v220 = 0;
        goto LABEL_127;
      }
    }

    else
    {
      if (m_iMaxCol < 1)
      {
        LODWORD(v57) = 0;
      }

      else
      {
        uint64_t v57 = 0LL;
        while (LOBYTE(v8[v57]) == 64)
        {
          if (m_iMaxCol == ++v57) {
            goto LABEL_120;
          }
        }
      }

      if ((int)v57 >= m_iMaxCol - 10)
      {
LABEL_120:
        int v220 = 0;
        dword_41400 = 0;
        goto LABEL_127;
      }

      int v38 = v57 + 2;
      dword_41400 = v57 + 2;
    }

    int v74 = m_iPinBlockCount + 1;
    if (v38 < 1)
    {
      int v38 = 0;
    }

    else
    {
      uint64_t v75 = v38;
      __int32 v76 = (_WORD *)(m_sPinStrBuf + 2LL * v74 * m_iMaxCol);
      __int32 v77 = (_WORD *)(m_sPinKeyBuf + 2LL * v74 * m_iMaxCol);
      do
      {
        *v76++ = 64;
        *v77++ = v223;
        --v75;
      }

      while (v75);
    }

    if (m_cKanaBuf[v223] > 127 || m_cKanaBuf[v223 - 1] > 127)
    {
      --v38;
    }

    else
    {
      int v78 = v38 + v74 * v4;
      *(_WORD *)(v6 + 2LL * v78) = 8;
      *(_WORD *)(m_sPinKeyBuf + 2LL * v78) = v223;
    }

    int v220 = v38;
    m_iPinBlockCount = v27;
    goto LABEL_127;
  }

LABEL_185:
  if ((int)v5 < 1)
  {
    LODWORD(v133) = 0;
  }

  else
  {
    uint64_t v133 = 0LL;
    while (*(_WORD *)(m_sPinStrBuf + 2LL * v222 * v4 + 2 * v133))
    {
      if (v5 == ++v133)
      {
        LODWORD(v133) = v5;
        break;
      }
    }
  }

  if ((int)strlen(__s) >= 1)
  {
    uint64_t v134 = 0LL;
    uint64_t v135 = m_sPinStrBuf;
    uint64_t v136 = v222 * (int)v5;
    uint64_t v137 = m_sPinKeyBuf;
    int v138 = m_iPinOutMode;
    do
    {
      if (1 - (_DWORD)v133 == (_DWORD)v134)
      {
        if ((*(_WORD *)(v135 + 2 * v136) & 0x7F) == 0x40 && __s[v134] != 64)
        {
          LODWORD(v133) = v133 - (v223 == *(unsigned __int16 *)(v137 + 2 * v136));
          int v139 = v134 + v133;
        }

        else
        {
          int v139 = 1;
        }
      }

      else
      {
        int v139 = v133 + v134;
      }

      int v140 = v139 + v136;
      *(_WORD *)(v137 + 2LL * v140) = v223;
      __int16 v141 = __s[v134];
      *(_WORD *)(v135 + 2LL * v140) = v141;
      if ((a2 & 0x4000) != 0)
      {
        v141 |= 0x100u;
        *(_WORD *)(v135 + 2LL * v140) = v141;
        if (v138 == 4) {
          m_iPinBlockCur = v222;
        }
      }

      if (a2 < 0) {
        *(_WORD *)(v135 + 2LL * v140) = v141 | 0x200;
      }
      ++v134;
    }

    while (v134 < (int)strlen(__s));
  }

  m_iCurFarstFlg = 0;
}

uint64_t IsToziKako(int *a1)
{
  int v1 = *a1;
  int v2 = 12289;
  uint64_t v3 = &dword_2B024;
  while (v1 != v2)
  {
    int v4 = *v3++;
    int v2 = v4;
    if (!v4)
    {
      int v5 = 46;
      uint64_t v6 = &dword_2B068;
      while (v5 != v1)
      {
        int v7 = *v6++;
        int v5 = v7;
        if (!v7) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return 1LL;
}

uint64_t IsInyou(__int32 *a1)
{
  while (1)
  {
    __int32 v2 = *a1;
    if (*a1 != 9 && v2 != 32) {
      break;
    }
    ++a1;
  }

  if (v2)
  {
    int v5 = 0;
    int v6 = 0;
    int v4 = 0;
    while (1)
    {
      BOOL v7 = (v2 - 10241) < 0xFF && (m_PinInfo & 0x3880) == 10240;
      unsigned int v8 = v7;
      int v9 = &a1[v8];
      if (v7) {
        int v10 = v5 + 1;
      }
      else {
        int v10 = v5;
      }
      __int32 v11 = *v9;
      BOOL v3 = *v9 > 127;
      if (*v9 > 127) {
        return v4 > 1 || !v3;
      }
      if (v11 != 32 || v10 == 0)
      {
        if ((v11 - 58) <= 0xFFFFFFF5)
        {
          BOOL v13 = v11 < 33 || v10 == 0;
          if (!v13 && *(v9 - 1) > 127)
          {
            wcschr(dword_3F85C, v11);
            if (v6 > 1) {
              return v4 > 1 || !v3;
            }
            ++v6;
            goto LABEL_33;
          }
        }
      }

      else if (*(v9 - 1) != 32)
      {
        ++v4;
      }

      wcschr(dword_3F85C, v11);
LABEL_33:
      __int32 v14 = v9[1];
      a1 = v9 + 1;
      __int32 v2 = v14;
      int v5 = v10 + 1;
      if (!v14) {
        return v4 > 1 || !v3;
      }
    }
  }

  BOOL v3 = 0;
  int v4 = 0;
  return v4 > 1 || !v3;
}

uint64_t IsInyou2(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v3 = -1LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  int v4 = (int *)(a1 + 4 * v3);
  int v5 = *v4;
  if (*v4)
  {
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    do
    {
      if (a2 && v5 >= 129)
      {
        ZenToHan(v4++, v17);
        int v10 = v17[0];
      }

      else
      {
        int v10 = v5;
      }

      if ((m_PinInfo & 0x3880) == 0x2800 && (*v4 - 10241) <= 0xFE)
      {
        ++v4;
        ++v7;
      }

      if (v10 > 128) {
        break;
      }
      BOOL v12 = v2 != 32 && v10 == 32;
      int v13 = v12 && v7 != 0;
      if (v13) {
        int v9 = 0;
      }
      v8 += v13;
      wcschr(dword_3F8AC, v10);
      if (v8 > 2)
      {
        int v8 = 3;
        break;
      }

      if ((v10 & 0xFFFFFFDF) - 65 < 0x1A) {
        int v9 = 1;
      }
      int v14 = v4[1];
      ++v4;
      int v5 = v14;
      ++v7;
      int v2 = v10;
    }

    while (v14);
  }

  else
  {
    int v9 = 0;
    int v8 = 0;
  }

  BOOL v15 = v8 == 1;
  if (!v9) {
    BOOL v15 = 0;
  }
  return v8 > 1 || v15;
}

BOOL IsKugiri(_DWORD *a1)
{
  return (*a1 - 48) <= 9 && (a1[1] - 48) <= 9 && (a1[2] - 58) < 0xFFFFFFF6;
}

BOOL EijiStrSet(const __int32 *a1, _BYTE *a2, int a3)
{
  *a2 = 0;
  if (a3)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    ZenToHan(a1, (__int32 *)&v12);
    uint64_t v5 = 0LL;
    int v6 = a1 + 1;
    do
    {
      char v7 = v12;
      if ((v12 - 65) > 0x19)
      {
      }

      else
      {
        char v7 = v12 + 32;
      }

      a2[v5++] = v7;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      ZenToHan(v6++, (__int32 *)&v12);
    }

    while (v5 != 64);
    ZenToHan(a1 - 1, (__int32 *)&v12);
    int v8 = v12;
  }

  else
  {
    for (uint64_t i = 0LL; i != 64; ++i)
    {
      __int32 v10 = a1[i];
      if ((v10 - 65) > 0x19)
      {
      }

      else
      {
        LOBYTE(v10) = v10 + 32;
      }

      a2[i] = v10;
    }

    int v8 = *(a1 - 1);
  }

  return (v8 & 0xFFFFFFDF) - 91 < 0xFFFFFFE6;
}

uint64_t IsOomoji(uint64_t a1, int a2)
{
  int v2 = (_DWORD *)(a1 + 4 * (((unint64_t)m_Zen >> 4) & 1));
  uint64_t v3 = &v2[*v2 != 10242];
  int v4 = *v3;
  if (!*v3)
  {
    int v5 = 0;
    unsigned int v10 = 0;
    if (a2)
    {
LABEL_22:
      if (v5 == 1) {
        return v10 ^ 1;
      }
      else {
        return 0LL;
      }
    }

    else
    {
LABEL_26:
      if (v5) {
        return 0LL;
      }
      else {
        return v10;
      }
    }
  }

  int v5 = 0;
  while (1)
  {
    if ((v4 - 97) < 0x1A)
    {
LABEL_19:
      unsigned int v10 = 1;
      if (!a2) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }

    if (v4 == 10242) {
      break;
    }
    uint64_t v7 = 1LL;
LABEL_10:
    v3 += v7;
    int v8 = v5 + 1;
    int v4 = *v3;
    if (*v3) {
      BOOL v9 = v5 > 1;
    }
    else {
      BOOL v9 = 1;
    }
    ++v5;
    if (v9)
    {
      unsigned int v10 = 0;
      int v5 = v8;
      if (!a2) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }
  }

  int v6 = v3[1];
  if ((v6 - 96) < 0x1A)
  {
    uint64_t v7 = 2LL;
    goto LABEL_10;
  }

LABEL_25:
  unsigned int v10 = 0;
  if (!a2) {
    goto LABEL_26;
  }
LABEL_20:
  if (v5 <= 1) {
    goto LABEL_22;
  }
  return 1LL;
}

uint64_t Init(char *a1)
{
  time_t v10 = time(0LL);
  localtime(&v10);
  __dst[0] = 0;
  strcpy(__dst, a1);
  strcat(__dst, "6tenu.dat");
  int v2 = fopen(__dst, "rb");
  Ten6File = (uint64_t)v2;
  if (!v2) {
    return 15LL;
  }
  if (fread(&__ptr, 2uLL, 1uLL, v2))
  {
    if (__ptr == 255 && v9 == 254)
    {
      strcpy(__dst, a1);
      strcat(__dst, "8tenu.dat");
      uint64_t v3 = fopen(__dst, "rb");
      Ten8File = (uint64_t)v3;
      if (v3)
      {
        if (fread(&__ptr, 2uLL, 1uLL, v3))
        {
          if (__ptr == 255 && v9 == 254)
          {
            strcpy(__dst, a1);
            *(void *)&__dst[strlen(__dst)] = 0x5441442E465442LL;
            int v4 = fopen(__dst, "rb");
            if (v4)
            {
              int v5 = v4;
              if (fread(&m_pcBrDat, 0xBC7uLL, 1uLL, v4))
              {
                strcpy(__dst, a1);
                strcat(__dst, "DETAIL.TXT");
                int v6 = fopen(__dst, "rb");
                DetailFile = (uint64_t)v6;
                if (v6)
                {
                  if (fread(&__ptr, 2uLL, 1uLL, v6))
                  {
                    if (__ptr == 255 && v9 == 254)
                    {
                      uint64_t result = ktoau::Init((ktoau *)&Ktoau, a1);
                      if (!(_DWORD)result) {
                        m_IsInit = 1;
                      }
                    }

                    else
                    {
                      fclose((FILE *)Ten6File);
                      fclose((FILE *)Ten8File);
                      fclose((FILE *)DetailFile);
                      return 25LL;
                    }
                  }

                  else
                  {
                    fclose((FILE *)DetailFile);
                    fclose((FILE *)Ten8File);
                    return 24LL;
                  }
                }

                else
                {
                  fclose(0LL);
                  return 23LL;
                }
              }

              else
              {
                fclose(v5);
                return 22LL;
              }
            }

            else
            {
              fclose(0LL);
              return 21LL;
            }
          }

          else
          {
            fclose((FILE *)Ten6File);
            fclose((FILE *)Ten8File);
            return 20LL;
          }
        }

        else
        {
          fclose((FILE *)Ten6File);
          fclose((FILE *)Ten8File);
          return 19LL;
        }
      }

      else
      {
        fclose((FILE *)Ten6File);
        return 18LL;
      }
    }

    else
    {
      fclose((FILE *)Ten6File);
      return 17LL;
    }
  }

  else
  {
    fclose((FILE *)Ten6File);
    return 16LL;
  }

  return result;
}

size_t KanjiTo6Ten(int a1, _BYTE *a2)
{
  do
  {
    *a2 = 0;
    bzero(&__ptr, 0x400uLL);
    size_t result = fread(&__ptr, 2uLL, 1uLL, (FILE *)Ten6File);
    if (!result)
    {
LABEL_14:
      *a2 = 0;
      return result;
    }

    p_ptr = &__ptr;
    while (*p_ptr != 13)
    {
      size_t result = fread(++p_ptr, 2uLL, 1uLL, (FILE *)Ten6File);
      if (!result) {
        goto LABEL_14;
      }
    }

    size_t result = fread(p_ptr, 2uLL, 1uLL, (FILE *)Ten6File);
  }

  while (__ptr != a1);
  int *p_ptr = 0;
  int v6 = v10;
  if (v10)
  {
    uint64_t v7 = &v11;
    do
    {
      int v8 = *v7++;
      int v6 = v8;
      ++a2;
    }

    while (v8);
  }

  return result;
}

size_t KanjiTo8Ten(int a1, _BYTE *a2)
{
  *a2 = 0;
  do
  {
    bzero(&__ptr, 0x400uLL);
    size_t result = fread(&__ptr, 2uLL, 1uLL, (FILE *)Ten8File);
    if (!result)
    {
LABEL_21:
      *a2 = 0;
      return result;
    }

    p_ptr = &__ptr;
    while (*p_ptr != 13)
    {
      size_t result = fread(++p_ptr, 2uLL, 1uLL, (FILE *)Ten8File);
      if (!result) {
        goto LABEL_21;
      }
    }

    size_t result = fread(p_ptr, 2uLL, 1uLL, (FILE *)Ten8File);
  }

  while (__ptr != a1);
  int *p_ptr = 0;
  int v6 = v13;
  if (v13)
  {
    uint64_t v7 = &v14;
    int v8 = a2;
    do
    {
      int v9 = *v7++;
      int v6 = v9;
      ++v8;
    }

    while (v9);
  }

  if ((a1 - 19968) >> 8 <= 0xAC)
  {
    LOBYTE(v1fseek((FILE *)Ten8File, 0LL, 0) = *a2;
    if (*a2)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (!(_DWORD)v11) {
          a2[v11] = v10 | 0x40;
        }
        int v10 = a2[++v11];
      }

      while (v10);
      a2 += v11;
    }

    *(a2 - 1) |= 0x80u;
  }

  return result;
}

size_t DetialYomiSet(int a1, const __int32 *a2)
{
  *a2 = 0;
  do
  {
    bzero(&__ptr, 0x400uLL);
    if (!fread(&__ptr, 2uLL, 1uLL, (FILE *)DetailFile))
    {
LABEL_15:
      size_t result = 0LL;
      *a2 = 0;
      return result;
    }

    p_ptr = &__ptr;
    while (*p_ptr != 13)
    {
      if (!fread(++p_ptr, 2uLL, 1uLL, (FILE *)DetailFile)) {
        goto LABEL_15;
      }
    }

    fread(p_ptr, 2uLL, 1uLL, (FILE *)DetailFile);
  }

  while (__ptr != a1);
  int *p_ptr = 0;
  __int32 v5 = v13;
  if (v13)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = &v14;
    int v8 = (__int32 *)a2;
    do
    {
      __int32 v9 = *v7++;
      __int32 v5 = v9;
      v6 += 0x100000000LL;
      ++v8;
    }

    while (v9);
    uint64_t v10 = v6 >> 32;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  a2[v10] = 0;
  return wcslen(a2);
}

void DetailSet(int *a1)
{
  int v2 = *a1;
  if (*a1)
  {
    unsigned int v3 = 0;
    unsigned int v4 = 1;
    __int32 v5 = &m_cCurBuf;
    while (1)
    {
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      if ((v2 - 32) > 0x5F)
      {
        if ((v2 - 12353) <= 0x52)
        {
          if (v4 < 2 || v3 == 4)
          {
            if (v3 != 4) {
              goto LABEL_20;
            }
          }

          else
          {
            wcscat(m_cKanaBuf, dword_2B090);
            *(_WORD *)__int32 v5 = v4;
            *((_WORD *)v5 + 1) = v4;
            __int32 v5 = (__int128 *)((char *)v5 + 4);
LABEL_20:
            wcscat(m_cKanaBuf, dword_2B0B4);
            uint64_t v7 = 0LL;
            do
            {
              *(_WORD *)((char *)v5 + v7) = v4;
              v7 += 2LL;
            }

            while ((_DWORD)v7 != 12);
            __int32 v5 = (__int128 *)((char *)v5 + v7);
          }

          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          ZenToHan(a1, (__int32 *)&v26);
          wcscat(m_cKanaBuf, (const __int32 *)&v26);
          if ((_DWORD)v26)
          {
            unsigned int v8 = 1;
            do
            {
              *(_WORD *)__int32 v5 = v4;
              __int32 v5 = (__int128 *)((char *)v5 + 2);
              BOOL v9 = wcslen((const __int32 *)&v26) > v8++;
            }

            while (v9);
          }

          unsigned int v3 = 4;
          goto LABEL_45;
        }

        if ((v2 - 12449) <= 0x52)
        {
          if (v4 < 2 || v3 == 5)
          {
            if (v3 != 5) {
              goto LABEL_38;
            }
          }

          else
          {
            wcscat(m_cKanaBuf, dword_2B090);
            *(_WORD *)__int32 v5 = v4;
            *((_WORD *)v5 + 1) = v4;
            __int32 v5 = (__int128 *)((char *)v5 + 4);
LABEL_38:
            wcscat(m_cKanaBuf, dword_2B0D0);
            uint64_t v11 = 0LL;
            do
            {
              *(_WORD *)((char *)v5 + v11) = v4;
              v11 += 2LL;
            }

            while ((_DWORD)v11 != 10);
            __int32 v5 = (__int128 *)((char *)v5 + v11);
          }

          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          ZenToHan(a1, (__int32 *)&v26);
          wcscat(m_cKanaBuf, (const __int32 *)&v26);
          if ((_DWORD)v26)
          {
            unsigned int v12 = 1;
            do
            {
              *(_WORD *)__int32 v5 = v4;
              __int32 v5 = (__int128 *)((char *)v5 + 2);
              BOOL v9 = wcslen((const __int32 *)&v26) > v12++;
            }

            while (v9);
          }

          unsigned int v3 = 5;
          goto LABEL_45;
        }

        if ((v2 - 65377) <= 0x3E)
        {
          if (v4 >= 2 && v3 != 2)
          {
            wcscat(m_cKanaBuf, dword_2B090);
            *(_WORD *)__int32 v5 = v4;
            *((_WORD *)v5 + 1) = v4;
            __int32 v5 = (__int128 *)((char *)v5 + 4);
          }

          if (v3 != 5)
          {
            wcscat(m_cKanaBuf, dword_2B0E8);
            *v5++ = (__int128)vdupq_n_s16(v4);
          }

          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          ZenToHan(a1, (__int32 *)&v26);
          wcscat(m_cKanaBuf, (const __int32 *)&v26);
          if ((_DWORD)v26)
          {
            unsigned int v10 = 1;
            do
            {
              *(_WORD *)__int32 v5 = v4;
              __int32 v5 = (__int128 *)((char *)v5 + 2);
              BOOL v9 = wcslen((const __int32 *)&v26) > v10++;
            }

            while (v9);
          }

          unsigned int v3 = 2;
          goto LABEL_45;
        }

        if ((v2 - 65296) < 0xA || (v2 - 65345) < 0x1A || (v2 - 65313) <= 0x19)
        {
          if (v4 < 2 || v3 == 7)
          {
            if (v3 != 7) {
              goto LABEL_64;
            }
          }

          else
          {
            wcscat(m_cKanaBuf, dword_2B090);
            *(_WORD *)__int32 v5 = v4;
            *((_WORD *)v5 + 1) = v4;
            __int32 v5 = (__int128 *)((char *)v5 + 4);
LABEL_64:
            wcscat(m_cKanaBuf, dword_2B10C);
            uint64_t v16 = 0LL;
            do
            {
              *(_WORD *)((char *)v5 + v16) = v4;
              v16 += 2LL;
            }

            while ((_DWORD)v16 != 22);
            __int32 v5 = (__int128 *)((char *)v5 + v16);
          }

          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          ZenToHan(a1, (__int32 *)&v26);
          wcscat(m_cKanaBuf, (const __int32 *)&v26);
          if ((_DWORD)v26)
          {
            unsigned int v17 = 1;
            do
            {
              *(_WORD *)__int32 v5 = v4;
              __int32 v5 = (__int128 *)((char *)v5 + 2);
              BOOL v9 = wcslen((const __int32 *)&v26) > v17++;
              unsigned int v3 = 7;
            }

            while (v9);
          }

          else
          {
            unsigned int v3 = 7;
          }

          goto LABEL_45;
        }

        if ((v2 - 10241) > 0xFE)
        {
          int v14 = ZenToHan(a1, (__int32 *)&v26);
          int v15 = *a1;
          if (!v14)
          {
            if (DetialYomiSet(v15, (const __int32 *)&v26))
            {
              if (v4 >= 2)
              {
                wcscat(m_cKanaBuf, dword_2B090);
                *(_WORD *)__int32 v5 = v4;
                *((_WORD *)v5 + 1) = v4;
                __int32 v5 = (__int128 *)((char *)v5 + 4);
              }

              wcscat(m_cKanaBuf, (const __int32 *)&v26);
              if ((_DWORD)v26)
              {
                unsigned int v19 = 1;
                do
                {
                  *(_WORD *)__int32 v5 = v4;
                  __int32 v5 = (__int128 *)((char *)v5 + 2);
                  BOOL v9 = wcslen((const __int32 *)&v26) > v19++;
                  unsigned int v3 = 6;
                }

                while (v9);
              }

              else
              {
                unsigned int v3 = 6;
              }
            }

            else if (*a1 >= 129)
            {
              if (v4 >= 2)
              {
                wcscat(m_cKanaBuf, dword_2B090);
                *(_WORD *)__int32 v5 = v4;
                *((_WORD *)v5 + 1) = v4;
                __int32 v5 = (__int128 *)((char *)v5 + 4);
              }

              if (v3 != 9)
              {
                wcscat(m_cKanaBuf, dword_2B174);
                uint64_t v24 = 0LL;
                do
                {
                  *(_WORD *)((char *)v5 + v24) = v4;
                  v24 += 2LL;
                }

                while ((_DWORD)v24 != 14);
                __int32 v5 = (__int128 *)((char *)v5 + v24);
              }

              wcscat(m_cKanaBuf, (const __int32 *)&v26);
              if ((_DWORD)v26)
              {
                unsigned int v25 = 1;
                do
                {
                  *(_WORD *)__int32 v5 = v4;
                  __int32 v5 = (__int128 *)((char *)v5 + 2);
                  BOOL v9 = wcslen((const __int32 *)&v26) > v25++;
                  unsigned int v3 = 9;
                }

                while (v9);
              }

              else
              {
                unsigned int v3 = 9;
              }
            }

            goto LABEL_45;
          }

          if (v15 <= 12538)
          {
          }

          else if ((v15 - 12539) >= 2 && v15 != 65311 && v15 != 65281)
          {
            goto LABEL_90;
          }

          if (v3 - 3 <= 3)
          {
            wcscat(m_cKanaBuf, (const __int32 *)&v26);
            wcscat(m_cKanaBuf, (const __int32 *)&unk_2B154);
            if (wcslen((const __int32 *)&v26) != -1LL)
            {
              uint64_t v20 = 0LL;
              size_t v21 = 0LL;
              do
              {
                *((_WORD *)v5 + v21++) = v4;
                v20 += 2LL;
              }

              while (wcslen((const __int32 *)&v26) + 1 > v21);
              __int32 v5 = (__int128 *)((char *)v5 + v20);
            }

            goto LABEL_45;
          }

LABEL_90:
          if (v4 < 2 || v3 == 3)
          {
            if (v3 != 3) {
              goto LABEL_94;
            }
          }

          else
          {
            wcscat(m_cKanaBuf, dword_2B090);
            *(_WORD *)__int32 v5 = v4;
            *((_WORD *)v5 + 1) = v4;
            __int32 v5 = (__int128 *)((char *)v5 + 4);
LABEL_94:
            wcscat(m_cKanaBuf, dword_2B15C);
            uint64_t v22 = 0LL;
            do
            {
              *(_WORD *)((char *)v5 + v22) = v4;
              v22 += 2LL;
            }

            while ((_DWORD)v22 != 22);
            __int32 v5 = (__int128 *)((char *)v5 + v22);
          }

          wcscat(m_cKanaBuf, (const __int32 *)&v26);
          if ((_DWORD)v26)
          {
            unsigned int v23 = 1;
            do
            {
              *(_WORD *)__int32 v5 = v4;
              __int32 v5 = (__int128 *)((char *)v5 + 2);
              BOOL v9 = wcslen((const __int32 *)&v26) > v23++;
              unsigned int v3 = 3;
            }

            while (v9);
          }

          else
          {
            unsigned int v3 = 3;
          }

          goto LABEL_45;
        }

        if (v4 < 2 || v3 == 8)
        {
          if (v3 != 8) {
            goto LABEL_73;
          }
        }

        else
        {
          wcscat(m_cKanaBuf, dword_2B090);
          *(_WORD *)__int32 v5 = v4;
          *((_WORD *)v5 + 1) = v4;
          __int32 v5 = (__int128 *)((char *)v5 + 4);
LABEL_73:
          wcscat(m_cKanaBuf, dword_2B13C);
          uint64_t v18 = 0LL;
          do
          {
            *(_WORD *)((char *)v5 + v18) = v4;
            v18 += 2LL;
          }

          while ((_DWORD)v18 != 10);
          int v2 = *a1;
          __int32 v5 = (__int128 *)((char *)v5 + v18);
        }

        m_cKanaBuf[wcslen(m_cKanaBuf)] = v2;
        *(_WORD *)__int32 v5 = v4;
        __int32 v5 = (__int128 *)((char *)v5 + 2);
        unsigned int v3 = 8;
        goto LABEL_45;
      }

      if (v3 >= 2) {
        break;
      }
      if (v3 != 1) {
        goto LABEL_11;
      }
LABEL_14:
      m_cKanaBuf[wcslen(m_cKanaBuf)] = v2;
      *(_WORD *)__int32 v5 = v4;
      __int32 v5 = (__int128 *)((char *)v5 + 2);
      unsigned int v3 = 1;
LABEL_45:
      int v13 = a1[1];
      ++a1;
      int v2 = v13;
      ++v4;
      if (!v13) {
        return;
      }
    }

    wcscat(m_cKanaBuf, dword_2B090);
    *(_WORD *)__int32 v5 = v4;
    *((_WORD *)v5 + 1) = v4;
    __int32 v5 = (__int128 *)((char *)v5 + 4);
LABEL_11:
    wcscat(m_cKanaBuf, dword_2B09C);
    uint64_t v6 = 0LL;
    do
    {
      *(_WORD *)((char *)v5 + v6) = v4;
      v6 += 2LL;
    }

    while ((_DWORD)v6 != 10);
    int v2 = *a1;
    __int32 v5 = (__int128 *)((char *)v5 + v6);
    goto LABEL_14;
  }

uint64_t TextToBrl()
{
  uint64_t v0 = __chkstk_darwin();
  if (!m_IsInit) {
    return 1LL;
  }
  uint64_t v1 = v0;
  int v2 = *(_WORD **)(v0 + 8);
  m_cStrBuf = *(void *)v0;
  m_iMaxBuf = 8;
  m_PinInfo = 0LL;
  int v3 = *(_DWORD *)(v0 + 52);
  int v5 = *(_DWORD *)(v0 + 56);
  int v4 = *(_DWORD *)(v0 + 60);
  int v6 = (*(_DWORD *)(v0 + 48) << 14) & 0xC000 | ((v4 & 1) << 16);
  LOWORD(m_PinInfo) = *(_WORD *)(v0 + 48) << 14;
  *(_DWORD *)((char *)&m_PinInfo + 2) = v4 & 1;
  m_sPinStrBuf = (uint64_t)v2;
  uint64_t v7 = *(_WORD **)(v0 + 16);
  m_sPinKeyBuf = (uint64_t)v7;
  m_cStrBuf = *(void *)v0;
  int v8 = *(_DWORD *)(v0 + 40);
  m_iMaxCol = *(_DWORD *)(v0 + 36);
  m_iWordLapFlg = v5;
  BOOL v9 = &unk_C3000;
  m_Kan = 0;
  unsigned int v10 = v6 & 0xFFFFF9FF | ((v3 & 3) << 9);
  m_iIsListFlg = 0;
  if (v8 == 1)
  {
    int v11 = 128;
  }

  else
  {
    if (v8 != 2) {
      goto LABEL_8;
    }
    int v11 = 384;
  }

  v10 |= v11;
  m_iWordLapFlg = 0;
LABEL_8:
  switch(*(_DWORD *)(v0 + 44))
  {
    case 1:
      __int16 v13 = v10 | 0x2800;
      goto LABEL_12;
    case 2:
      __int16 v13 = v10 | 0x2000;
      goto LABEL_12;
    case 3:
      __int16 v13 = v10 | 0x3000;
LABEL_12:
      BYTE2(m_PinInfo) = BYTE2(v10);
      LOWORD(m_PinInfo) = v13;
      break;
    case 4:
      BYTE2(m_PinInfo) = BYTE2(v10);
      LOWORD(m_PinInfo) = v10 | 0x800;
      m_iWordLapFlg = 0;
      m_Kan = 4;
      break;
    default:
      LOWORD(m_PinInfo) = v10;
      BYTE2(m_PinInfo) = BYTE2(v10);
      break;
  }

  m_iPinBlockCount = 0;
  m_iPinBlockCur = 0;
  m_iLoopFlg = 0;
  m_iCurFarstFlg = 0;
  m_iCurFlg = 0;
  m_iNextCol = 0;
  m_iBeforeCol = 0;
  m_Zen = 0;
  uint64_t v14 = *(unsigned __int16 *)(v0 + 24);
  unsigned int v15 = *(unsigned __int16 *)(v0 + 28);
  unsigned int v16 = *(unsigned __int16 *)(v0 + 32);
  _WORD *v2 = 0;
  *uint64_t v7 = 0;
  *(void *)__s = 0LL;
  uint64_t v247 = 0LL;
  int v248 = 0;
  __int128 v244 = 0u;
  __int128 v245 = 0u;
  bzero(v250, 0x9600uLL);
  bzero(v249, 0x4B00uLL);
  if ((m_PinInfo & 0x680) != 0)
  {
    if ((m_PinInfo & 0x600) == 0 || (m_PinInfo & 0x80) != 0)
    {
      if ((m_PinInfo & 0x80) != 0) {
        __int32 v235 = *(__int32 **)v1;
      }
    }

    else
    {
      DetailSet(*(int **)v1);
      __int32 v235 = m_cKanaBuf;
      __int32 v230 = (int16x4_t *)&m_cCurBuf;
    }
  }

  else
  {
    __int32 v230 = v251;
    ktoau::KToA((uint64_t)&Ktoau, *(int **)v1, v251, v252, 0);
    if ((m_PinInfo & 0x3800) == 0x2800)
    {
      __int32 v230 = (int16x4_t *)v249;
      Eiji1To2((size_t)v252, v250, (__int16 *)v251, v249);
      wcscpy(v252, v250);
      m_Kan = m_Kan & 0xF9 | (2 * IsInyou(v252));
    }

    __int32 v235 = v252;
    if (*(_DWORD *)(v1 + 40) == 3)
    {
      uint64_t result = 0LL;
      *(void *)(v1 + 8fseek((FILE *)DetailFile, 0LL, 0) = v252;
      return result;
    }
  }

  int v17 = m_iLoopFlg;
  uint64_t result = 2LL;
  if (m_iLoopFlg != 2)
  {
    unsigned int v229 = v15;
    __int16 v224 = (_DWORD *)v1;
    uint64_t v18 = 0LL;
    uint64_t v227 = 0LL;
    unsigned int v232 = 0;
    unsigned int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v222 = v14 - 1;
    int v223 = v16 - 1;
    unsigned int v225 = v14 | 0x4000;
    int v226 = 0;
    unsigned int v228 = v14;
    unsigned int v231 = v16;
    while (1)
    {
      if (v17 && (_DWORD)v14)
      {
        int v211 = m_iPinBlockCount;
        m_iPinBlockCur = m_iPinBlockCount;
        int v212 = m_iPinBlockCount + 1;
        __int16 v213 = v224;
        v224[16] = m_iPinBlockCount + 1;
        v224[17] = v211;
        v224[18] = m_iNextCol;
        int v214 = m_iBeforeCol;
        __int32 v215 = &m_cKanaBuf[9203];
        int v216 = &unk_B4000;
        __int16 v217 = (unsigned __int16 *)&unk_C3000;
        goto LABEL_962;
      }

      __int16 v22 = m_PinInfo;
      if (v21)
      {
        int v23 = 0;
        int v24 = m_PinInfo & 0x80;
        int v25 = 1;
        int v26 = v21;
        if (v24) {
          goto LABEL_31;
        }
      }

      else
      {
        if ((m_PinInfo & 0x80) != 0) {
          unsigned int v31 = v18 + 1;
        }
        else {
          unsigned int v31 = v230->u16[(int)v18];
        }
        unsigned int v232 = v31;
        int v26 = *v235;
        if (!*v235)
        {
          SetPinDat(__s, v19);
          if ((_DWORD)v14) {
            m_iPinBlockCur = m_iPinBlockCount;
          }
          __int16 v213 = v224;
          __int32 v215 = m_cKanaBuf + 36812;
          int v216 = (_DWORD *)&unk_B4000;
          __int16 v217 = (_WORD *)&unk_C3000;
          if (m_iLoopFlg != 1) {
            m_iNextCol = 0xFFFF;
          }
          int v212 = m_iPinBlockCount + 1;
          int v221 = m_iPinBlockCur;
          v224[16] = m_iPinBlockCount + 1;
          v224[17] = v221;
          if ((_DWORD)v14)
          {
            v224[18] = m_iNextCol;
            int v214 = m_iBeforeCol;
          }

          else
          {
            int v214 = 0;
            v224[18] = 0;
          }

LABEL_962:
          v213[19] = v214;
          uint64_t v218 = (v212 * v216[1023]);
          if ((int)v218 >= 1)
          {
            int v219 = (_WORD *)*((void *)v215 + 203);
            do
            {
              unsigned int v220 = (unsigned __int16)*v219;
              if (*v219 == 64)
              {
                v220 ^= 0x40u;
                *int v219 = v220;
              }

              if ((~v217[440] & 0x180) == 0) {
                *int v219 = v220 & 0x300 | (2 * (v220 & 3)) & 0xE | (((v220 & 4) != 0) << 6) & 0x7E | (16 * ((v220 >> 3) & 3)) & 0x7E | (((v220 >> 5) & 1) << 7) | (v220 >> 6) & 1 | (v220 >> 4) & 8;
              }
              ++v219;
              --v218;
            }

            while (v218);
          }

          return 0LL;
        }

        int v25 = 0;
        int v24 = m_PinInfo & 0x80;
        int v23 = v20;
        if (v24)
        {
LABEL_31:
          unsigned int v27 = v26 - 65376;
          char v28 = m_Zen;
          if ((m_Zen & 0x10) != 0 && v27 <= 0x3F && (m_Zen & 2) != 0 && (_DWORD)v18) {
            *(_WORD *)&__s[strlen(__s)] = 6;
          }
          if ((v22 & 0x600) == 0 || (_DWORD)v18 == 0)
          {
            int v20 = 0;
            int v30 = 1;
            BOOL v9 = (_BYTE *)&unk_C3000;
          }

          else
          {
            int v36 = v28 & 0x10;
            if ((v26 - 48) <= 9 && (v28 & 0x10) != 0)
            {
              int v20 = 0;
              strcat(__s, "\b<");
              BOOL v9 = &unk_C3000;
              m_Kan |= 8u;
              int v30 = 1;
            }

            else
            {
              int v30 = 1;
              BOOL v9 = (_BYTE *)&unk_C3000;
              if (v27 <= 0x3F && v36)
              {
                int v20 = 0;
                strcat(__s, "\b$");
              }

              else
              {
                int v20 = 0;
              }
            }
          }

          goto LABEL_67;
        }
      }

      int v32 = v230->u16[(int)v18];
      if (!v230->i16[(int)v18])
      {
        int v20 = 0;
        int v30 = 1;
        LODWORD(v227) = 0;
LABEL_60:
LABEL_61:
        BOOL v37 = v24 != 0;
        BOOL v38 = v26 > 127;
        if (v38 && v37) {
          int v30 = 0;
        }
        else {
          int v30 = v25;
        }
        if (v38 && v37) {
          int v20 = 1;
        }
        else {
          int v20 = v23;
        }
        goto LABEL_67;
      }

      __int128 v33 = (unsigned __int16 *)v230 + (int)v18 + 1;
      do
      {
        int v35 = *v33++;
        int v34 = v35;
      }

      while (v32 == v35);
      int v20 = 0;
      if (v34) {
        int v32 = v34;
      }
      LODWORD(v227) = v32;
      int v30 = 1;
LABEL_67:
      if ((v26 - 65345) < 0x1A || (v26 - 65313) <= 0x19)
      {
        int v42 = v20;
        ZenToHan(v235, (__int32 *)&v244);
        int v26 = v244;
        __int16 v43 = m_PinInfo;
        if (m_iIsListFlg)
        {
          char v44 = m_Zen;
          if ((m_PinInfo & 0x600) != 0)
          {
            if ((m_Zen & 0x10) == 0)
            {
              v9[892] = 0;
              __int128 v45 = &__s[strlen(__s)];
              int v39 = 0;
              if ((v43 & 0x100) != 0) {
                strcpy(v45, "8\a");
              }
              else {
                *(_DWORD *)__int128 v45 = 2368056;
              }
LABEL_93:
              int v20 = v42;
              goto LABEL_139;
            }

            int v39 = 0;
            int v20 = v42;
            if (!(_DWORD)v18 || (m_Zen & 2) == 0) {
              goto LABEL_139;
            }
LABEL_118:
            v44 &= ~2u;
            v9[892] = 0;
            int v39 = 0;
            *(_WORD *)&__s[strlen(__s)] = 6;
            goto LABEL_139;
          }
        }

        else
        {
          char v44 = m_Zen;
          if ((m_PinInfo & 0x600) != 0 && (_DWORD)v18 != 0)
          {
            int v20 = v42;
            if ((m_Zen & 0x10) == 0)
            {
              int v39 = 0;
              strcat(__s, "\b4");
LABEL_138:
              v9[892] = 0;
              goto LABEL_139;
            }

            if ((m_Zen & 2) == 0)
            {
              int v39 = 0;
              goto LABEL_139;
            }

            goto LABEL_118;
          }
        }

        int v39 = 0;
        goto LABEL_93;
      }

      if ((v26 - 12353) <= 0x52)
      {
        __int128 v244 = 0u;
        __int128 v245 = 0u;
        ZenToHan(v235, (__int32 *)&v244);
        int v26 = v244;
        int v39 = DWORD1(v244);
        if (m_iIsListFlg && (m_PinInfo & 0x600) != 0)
        {
          int v40 = m_Zen;
          if ((_DWORD)v18 && (m_Zen & 0x10) == 0)
          {
            __int128 v41 = &__s[strlen(__s)];
            if ((m_PinInfo & 0x100) != 0) {
              strcpy(v41, "8\a");
            }
            else {
              *(_DWORD *)__int128 v41 = 2368056;
            }
            v9[892] = 0;
          }
        }

        else
        {
          if ((_DWORD)v18 && (m_Zen & 0x10) == 0 && (m_PinInfo & 0x600) != 0)
          {
            strcat(__s, "\b4");
            v9[892] &= 0xF8u;
          }

          char v48 = v9[892];
          if ((v48 & 6) == 2)
          {
            *(_WORD *)&__s[strlen(__s)] = 52;
            v9[892] = v48 & 0xF8;
          }

          int v40 = m_Zen;
        }

        if ((~v40 & 0x12) == 0) {
          *(_WORD *)&__s[strlen(__s)] = 6;
        }
        char v44 = v40 & 0xED;
        goto LABEL_139;
      }

      if ((v26 - 12449) <= 0x52)
      {
        __int128 v244 = 0u;
        __int128 v245 = 0u;
        ZenToHan(v235, (__int32 *)&v244);
        int v26 = v244;
        int v39 = DWORD1(v244);
        char v44 = m_Zen;
        if ((m_Zen & 0x10) == 0 && m_iIsListFlg && (m_PinInfo & 0x600) != 0)
        {
          __int128 v46 = &__s[strlen(__s)];
          if ((m_PinInfo & 0x100) != 0) {
            strcpy(v46, "8\a");
          }
          else {
            *(_DWORD *)__int128 v46 = 2368056;
          }
        }

        if ((v9[892] & 6) == 2)
        {
          *(_WORD *)&__s[strlen(__s)] = 52;
          goto LABEL_138;
        }

        goto LABEL_139;
      }

      if (v26 >= 128)
      {
        if (v26 > 12538)
        {
          if ((v26 - 65281) <= 0x1E && ((1 << (v26 - 1)) & 0x40000181) != 0
            || v26 == 12539
            || v26 == 65374)
          {
            goto LABEL_124;
          }
        }

        else if ((v26 - 12289) <= 0xC && ((1 << (v26 - 1)) & 0x1803) != 0 {
               || (v26 - 8220) < 2)
        }
        {
          goto LABEL_124;
        }

        if ((v26 - 65377) < 0x3F)
        {
          int v39 = 0;
          goto LABEL_140;
        }

        __int128 v244 = 0u;
        __int128 v245 = 0u;
        if (ZenToHan(v235, (__int32 *)&v244))
        {
          int v26 = v244;
          int v39 = DWORD1(v244);
          char v44 = m_Zen;
          if ((_DWORD)v18)
          {
            if ((m_Zen & 0x10) == 0)
            {
              if ((m_PinInfo & 0x600) != 0)
              {
                if (m_iIsListFlg)
                {
                  uint64_t v155 = &__s[strlen(__s)];
                  if ((m_PinInfo & 0x100) != 0) {
                    strcpy(v155, "8\a");
                  }
                  else {
                    *(_DWORD *)uint64_t v155 = 2368056;
                  }
                }

                else
                {
                  strcat(__s, "\b4");
                }
              }

              goto LABEL_139;
            }
          }

          else if ((m_Zen & 0x10) == 0)
          {
            goto LABEL_139;
          }

          if ((m_Zen & 2) != 0 && (_DWORD)v244 != 65392 && (_DWORD)v244 != 65381)
          {
            *(_WORD *)&__s[strlen(__s)] = 6;
            v44 &= ~2u;
          }

LABEL_139:
          m_Zen = v44 | 0x10;
          int v30 = 1;
LABEL_140:
          BOOL v49 = v30 == 0;
          goto LABEL_141;
        }
      }

LABEL_124:
      int v39 = 0;
      BOOL v49 = v30 == 0;
      if (v26 >> 8 == 40 && !v30)
      {
        SetPinDat(__s, v19);
        else {
          char v50 = v26;
        }
        __s[0] = v50;
        __s[1] = 0;
        m_Zen |= 0x10u;
        v9[892] &= 0xF6u;
        char v51 = m_PinInfo;
        unsigned int v52 = v231;
        unsigned int v19 = v232;
        int v26 = 0;
LABEL_831:
        int v197 = v18 + 1;
        if (v51 < 0)
        {
          if ((int)v18 < (int)v14 && v197 >= (int)v14)
          {
LABEL_862:
            v19 |= 0x4000u;
            if (!m_iCurFlg) {
              m_iPinBlockCur = m_iPinBlockCount;
            }
            m_iCurFlg = 1;
            m_iCurFarstFlg = 1;
          }
        }

        else
        {
          unsigned int v198 = v230->u16[(int)v18];
          if (v229 <= v198 && v52 >= v198)
          {
            v19 |= 0xFFFF8000;
            unsigned int v201 = v227;
          }

          else
          {
            unsigned int v200 = v19 | 0xFFFF8000;
            if (v52 < v198) {
              unsigned int v200 = v19;
            }
            unsigned int v201 = v227;
          }
        }

        int v21 = 0;
        ++v235;
        uint64_t v18 = (v18 + 1);
        goto LABEL_866;
      }

LABEL_141:
      int v234 = v39;
      unsigned int v53 = v26 - 65377;
      if (v49 && v26 >= 128 && v53 >= 0x3F)
      {
        char v99 = m_Zen;
        if ((_DWORD)v18 && !(m_Zen & 0x10 | m_iIsListFlg))
        {
          unsigned int v52 = v231;
          if ((m_PinInfo & 0x600) != 0) {
            strcat(__s, "\b4");
          }
        }

        else
        {
          unsigned int v52 = v231;
          if (m_iIsListFlg)
          {
            if ((m_Zen & 0x10) == 0)
            {
              uint64_t v100 = v18;
              int v101 = v20;
              if ((m_PinInfo & 0x600) != 0)
              {
                __int32 v102 = &__s[strlen(__s)];
                if ((m_PinInfo & 0x100) != 0) {
                  strcpy(v102, "8\a");
                }
                else {
                  *(_DWORD *)__int32 v102 = 2368056;
                }
              }

              unsigned int v52 = v231;
              goto LABEL_598;
            }

LABEL_463:
            uint64_t v100 = v18;
            int v101 = v20;
            if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(v26), (int32x4_t)xmmword_2AD40))) & 1) == 0
              && (v99 & 2) != 0)
            {
              *(_WORD *)&__s[strlen(__s)] = 6;
              v99 &= ~2u;
            }

LABEL_598:
            char v156 = v9[892];
            if ((v156 & 6) == 2)
            {
              int v157 = *(v235 - 1);
              if (((v157 - 8213) > 8 || ((1 << (v157 - 21)) & 0x199) == 0) && v157 != 65505)
              {
                *(_WORD *)&__s[strlen(__s)] = 52;
                v156 &= 0xF9u;
              }
            }

            m_Zen = v99 | 0x10;
            v9[892] = v156 & 0xF6;
            SetPinDat(__s, v19);
            *(void *)__s = 0LL;
            int v20 = v101;
            uint64_t v18 = v100;
            int v21 = v234;
            if ((m_PinInfo & 0x80) != 0)
            {
              if ((m_PinInfo & 0x100) != 0)
              {
                KanjiTo8Ten(v26, __s);
              }

              else
              {
                KanjiTo6Ten(v26, __s);
                if (wcschr(dword_411B0, v26) && !wcschr(dword_411B0, *(v235 - 1)))
                {
                  __s[2] = __s[0];
                  *(_WORD *)__s = 15376;
                  __s[3] = 0;
                }
              }
            }

            if (v26 <= 65280)
            {
              if ((v26 - 12289) >= 2)
              {
                int v158 = 12539;
                goto LABEL_612;
              }

              goto LABEL_613;
            }

            if (v26 == 65311) {
              goto LABEL_613;
            }
            int v158 = 65281;
LABEL_612:
            if (v26 == v158)
            {
LABEL_613:
              __int32 v159 = v235[1];
              int v160 = 12289;
              __int32 v161 = &dword_2B024;
              while (v159 != v160)
              {
                int v162 = *v161++;
                int v160 = v162;
                if (!v162)
                {
                  int v163 = 46;
                  size_t v164 = &dword_2B068;
                  while (v163 != v159)
                  {
                    int v165 = *v164++;
                    int v163 = v165;
                    if (!v165)
                    {
                      *(_WORD *)&__s[strlen(__s)] = 64;
                      goto LABEL_620;
                    }
                  }

                  break;
                }
              }
            }

LABEL_620:
            int v26 = 0;
            char v166 = m_Zen | 0x10;
            goto LABEL_816;
          }
        }

        if ((v99 & 0x10) == 0)
        {
          uint64_t v100 = v18;
          int v101 = v20;
          goto LABEL_598;
        }

        goto LABEL_463;
      }

      if (v26 == 32)
      {
        SetPinDat(__s, v19);
        __s[0] = 0;
        unsigned int v52 = v231;
        int v21 = v234;
        if ((v9[892] & 6) != 0 && !m_iIsListFlg)
        {
          int v103 = ((unsigned __int16)m_PinInfo >> 11) & 7;
          if ((v103 == 5 || !v103) && IsInyouTozi(v235))
          {
            unsigned int v104 = v9[892];
            int v105 = (v104 >> 1) & 3;
            if (v105 == 1 || (int v106 = ((unsigned __int16)m_PinInfo >> 11) & 7, v106 == 5) || !v106)
            {
              __int16 v107 = 52;
              goto LABEL_350;
            }

            if (v105 == 2)
            {
              __s[2] = 0;
              __int16 v107 = 13344;
LABEL_350:
              *(_WORD *)__s = v107;
            }

            v9[892] = v104 & 0xF9;
          }
        }

        char v108 = m_Zen;
        int v109 = (unsigned __int16)m_PinInfo | (BYTE2(m_PinInfo) << 16);
        if ((_BYTE)v20)
        {
          if ((m_Zen & 0x10) == 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0) {
            strcat(__s, "\b4");
          }
          if ((v109 & 0x10000) != 0 && !(_DWORD)v18)
          {
            strcat(__s, "@@");
            goto LABEL_450;
          }
        }

        else if ((m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
        {
          strcat(__s, "\b&");
        }

        *(_WORD *)&__s[strlen(__s)] = 64;
LABEL_450:
        char v134 = v9[892] & 0xC6;
        if ((v109 & 0x3800) == 0x1800) {
          v134 |= 0x10u;
        }
        v9[892] = v134;
        if ((_BYTE)v20)
        {
          if ((v108 & 0x10) == 0)
          {
            char v135 = v108 | 0x10;
            goto LABEL_457;
          }
        }

        else
        {
          int v20 = 0;
          if ((v108 & 0x10) != 0)
          {
            char v135 = v108 & 0xEF;
LABEL_457:
            m_Zen = v135;
          }
        }

        int v26 = 32;
        goto LABEL_817;
      }

      if (v26 == 9)
      {
        SetPinDat(__s, v19);
        __int16 v110 = m_PinInfo;
        uint64_t v111 = (unsigned __int16)m_PinInfo >> 14;
        memset(__s, 64, (v111 + 1));
        *((_BYTE *)&dword_0 + (v111 | (unint64_t)__s) + 2) = 0;
        char v112 = v9[892] & 0x86;
        if ((v110 & 0x3800) == 0x1800) {
          v112 |= 0x10u;
        }
        v9[892] = v112;
        m_Zen &= ~0x10u;
        int v26 = 9;
        unsigned int v19 = v232;
        goto LABEL_377;
      }

      if ((v26 - 10369) <= 0x7E)
      {
        __int32 v113 = *v235;
        unsigned int v52 = v231;
        int v21 = v234;
        if (*v235 == 10296)
        {
          if (v235[1] == 10292 && (m_PinInfo & 0x3800) == 0x800)
          {
            int v114 = (v9[892] >> 1) & 3;
            if (v114)
            {
              if (v114 == 1) {
                *(_WORD *)&__s[strlen(__s)] = 52;
              }
              else {
                strcat(__s, " 4");
              }
            }
          }

          __int32 v113 = *v235;
        }

        if (v113 == 10292)
        {
          if (v235[1] == 32 && (v9[892] & 6) != 0 && (m_PinInfo & 0x3800) == 0x2800)
          {
            char v173 = v9[892] & 0xF9;
LABEL_660:
            v9[892] = v173;
          }
        }

        else if (v113 == 10278 && *(v235 - 1) == 32 && (v9[892] & 6) == 0 && (m_PinInfo & 0x3800) == 0x2800)
        {
          char v173 = v9[892] & 0xF9 | 2;
          goto LABEL_660;
        }

        SetPinDat(__s, v19);
        __s[0] = v26;
        __s[1] = 0;
        char v168 = v9[892];
        goto LABEL_662;
      }

      unsigned int v54 = v26 - 33;
      if ((v26 - 33) <= 0x5D && (((unsigned __int16)m_PinInfo >> 11) & 5 | 2) == 6)
      {
        SetPinDat(__s, v19);
        else {
          unsigned int v115 = v26 - 64;
        }
        char v116 = byte_2B194[v115] & 0x3F;
        __s[0] = v116;
        __s[1] = 0;
        m_Zen &= ~2u;
LABEL_376:
        unsigned int v19 = v232;
        uint64_t v14 = v228;
LABEL_377:
        unsigned int v52 = v231;
LABEL_427:
        int v21 = v234;
        goto LABEL_818;
      }

      uint64_t v233 = v18;
      if (v26 == 63)
      {
        unsigned int v55 = (unsigned __int16)m_PinInfo | (BYTE2(m_PinInfo) << 16);
        if ((m_PinInfo & 0x3800) != 0x800)
        {
          SetPinDat(__s, v19);
          char v128 = v9[892];
          if ((v128 & 6) == 4)
          {
            uint64_t v14 = v228;
            unsigned int v52 = v231;
            int v21 = v234;
            if ((v9[892] & 0x40) != 0)
            {
              *(_DWORD *)__s = 2494480;
            }

            else
            {
              __s[2] = 0;
              *(_WORD *)__s = 9744;
            }
          }

          else
          {
            if ((HIDWORD(v227) & 0xFFFFFFDF) - 65 >= 0x1A) {
              __int16 v142 = 34;
            }
            else {
              __int16 v142 = 38;
            }
            *(_WORD *)__s = v142;
            int v143 = IsMoji(v235 + 1);
            int v144 = v235[1];
            uint64_t v14 = v228;
            unsigned int v52 = v231;
            int v21 = v234;
            if (v144 != 12288 && (v144 < 128 || v143 != 3)) {
              *(_WORD *)&__s[strlen(__s)] = 64;
            }
          }

          v9[892] = v128 & 0xBF;
          char v150 = v128 & 0x8F;
          if ((m_PinInfo & 0x3800) == 0x1800) {
            v150 |= 0x10u;
          }
          v9[892] = v150;
          int v26 = 63;
          goto LABEL_817;
        }

        BOOL v56 = 0;
        BOOL v57 = 0;
        unsigned int v58 = -34;
        unsigned int v59 = -2;
        goto LABEL_163;
      }

      unsigned int v60 = v26 - 48;
      if ((v26 - 48) <= 9 && HIDWORD(v227) == 46)
      {
        if ((v9[892] & 8) != 0 && (v9[892] & 6) != 4)
        {
          __s[0] = 2;
          SetPinDat(__s, v19);
          strcpy(__s, &m_pcBrDat[3 * v26]);
          goto LABEL_376;
        }

LABEL_416:
        if ((m_PinInfo & 0x3800) == 0x1800) {
          char v129 = v9[892] & 0xCF | 0x10;
        }
        else {
          char v129 = v9[892] & 0xCF;
        }
        v9[892] = v129;
        SetPinDat(__s, v19);
        __s[0] = 0;
        if ((m_PinInfo & 0x600) == 0) {
          goto LABEL_514;
        }
        if ((m_PinInfo & 0x80) == 0 || (_BYTE)v20)
        {
          if ((m_PinInfo & 0x80) == 0 || !(_BYTE)v20 || (m_Zen & 0x10) != 0) {
            goto LABEL_514;
          }
          strcpy(__s, "\b4<");
LABEL_513:
          char v146 = v9[892] | 8;
        }

        else
        {
          if ((m_Zen & 0x10) != 0)
          {
            strcpy(__s, "\b<");
            goto LABEL_513;
          }

LABEL_514:
          char v146 = v9[892];
          if ((v146 & 8) == 0)
          {
            v146 |= 8u;
            strcpy(__s, "<");
          }
        }

        strcat(__s, &m_pcBrDat[3 * v26]);
        v9[892] = v146 & 0xBF;
        char v147 = m_Zen;
        uint64_t v14 = v228;
        unsigned int v52 = v231;
        int v21 = v234;
        if ((_BYTE)v20) {
          goto LABEL_812;
        }
LABEL_814:
        int v20 = 0;
        if ((v147 & 0x10) == 0) {
          goto LABEL_817;
        }
        goto LABEL_815;
      }

      if (v60 <= 9 && HIDWORD(v227) == 44)
      {
        char v61 = v9[892];
        if ((v61 & 8) != 0)
        {
          if ((*v235 - 48) > 9
            || (v235[1] - 48) > 9
            || (v235[2] - 48) < 0xA
            || (int v145 = ((unsigned __int16)m_PinInfo >> 11) & 7, v145 != 5) && v145)
          {
            __s[0] = 2;
            v9[892] = v61 & 0xF7;
          }

          else
          {
            __s[0] = 4;
          }

          uint64_t v14 = v228;
          unsigned int v52 = v231;
          int v21 = v234;
          __s[1] = 0;
          SetPinDat(__s, v19);
          __s[0] = 0;
          char v148 = v9[892];
          if ((((unsigned __int16)m_PinInfo >> 11) & 7u) - 1 < 3 || (v9[892] & 8) == 0)
          {
            strcpy(__s, "<");
            v9[892] = v148 | 8;
          }

          strcat(__s, &m_pcBrDat[3 * v26]);
          goto LABEL_817;
        }
      }

      if (v60 <= 9) {
        goto LABEL_416;
      }
      if ((v26 - 65393) <= 0x2A && ((1LL << (v26 - 113)) & 0x7C00000001FLL) != 0)
      {
        if ((v9[892] & 8) != 0)
        {
          SetPinDat(__s, v19);
          __s[0] = 0;
          int v131 = (v9[892] >> 1) & 3;
          if (v131 == 2)
          {
            __s[2] = 0;
            *(_WORD *)__s = 1076;
            uint64_t v14 = v228;
            unsigned int v52 = v231;
            int v21 = v234;
          }

          else
          {
            uint64_t v14 = v228;
            unsigned int v52 = v231;
            int v21 = v234;
            if (v131 == 1)
            {
              __int16 v132 = 52;
              goto LABEL_551;
            }

            if ((*v235 - 12449) > 0x52 || (m_Zen & 2) != 0)
            {
              __int16 v132 = 36;
LABEL_551:
              *(_WORD *)__s = v132;
            }

            else
            {
              if ((m_PinInfo & 0x100) != 0)
              {
                __int16 v149 = 22;
              }

              else
              {
                __s[2] = 0;
                __int16 v149 = 9248;
              }

              *(_WORD *)__s = v149;
              m_Zen |= 2u;
            }
          }

          strcat(__s, &m_pcBrDat[3 * v26 - 195648]);
          char v151 = 64;
          goto LABEL_668;
        }

        unsigned int v58 = v26 - 97;
        BOOL v57 = 1;
      }

      else
      {
        BOOL v57 = v26 > 96;
        unsigned int v58 = v26 - 97;
        if ((v26 - 97) > 9)
        {
          BOOL v56 = v26 > 64;
          unsigned int v59 = v26 - 65;
          unsigned int v55 = (unsigned __int16)m_PinInfo | (BYTE2(m_PinInfo) << 16);
          if ((v26 - 65) <= 9 && (m_PinInfo & 0x3000) == 0x1000 && (m_Kan & 8) != 0 && (m_Kan & 7) != 0)
          {
            BOOL v9 = &unk_C3000;
            m_Kan = m_Kan & 0xC7 | 0x10;
            SetPinDat(__s, v19);
            __int16 v126 = 32;
            goto LABEL_425;
          }

          goto LABEL_163;
        }

        if ((v9[892] & 8) != 0 && (v9[892] & 7) != 0)
        {
          v9[892] &= ~8u;
          SetPinDat(__s, v19);
          else {
            strcpy(__s, "0");
          }
          uint64_t v14 = v228;
          unsigned int v52 = v231;
          uint64_t v18 = v233;
          int v21 = v234;
          strcat(__s, &m_pcBrDat[3 * v26]);
          char v151 = v9[892] & 0xBF;
          goto LABEL_668;
        }
      }

      unsigned int v59 = v26 - 65;
      unsigned int v55 = (unsigned __int16)m_PinInfo | (BYTE2(m_PinInfo) << 16);
      BOOL v56 = 1;
LABEL_163:
      if ((m_Kan & 0x30) != 0 && v57 && v26 <= 122 && (m_Kan & 7) != 0 && (v55 & 0x3000) == 0x1000)
      {
        BOOL v9 = &unk_C3000;
        m_Kan &= 0xC7u;
        SetPinDat(__s, v19);
        __int16 v126 = 48;
LABEL_425:
        *(_WORD *)__s = v126;
        strcat(__s, &m_pcBrDat[3 * v26]);
        m_Kan &= ~0x40u;
LABEL_426:
        unsigned int v52 = v231;
        unsigned int v19 = v232;
        uint64_t v14 = v228;
        uint64_t v18 = v233;
        goto LABEL_427;
      }

      int v62 = (v55 >> 11) & 7;
      if (v62 == 2)
      {
        char v63 = !v56;
        if (v26 > 90) {
          char v63 = 1;
        }
        if ((v63 & 1) == 0) {
          goto LABEL_378;
        }
      }

      else
      {
        if (v62 != 3) {
          BOOL v56 = 0;
        }
        if (v56 && v26 < 91)
        {
LABEL_378:
          BOOL v9 = &unk_C3000;
          m_Kan &= ~8u;
          SetPinDat(__s, v19);
          __s[0] = 0;
          char v117 = m_Kan;
          if ((m_Kan & 6) != 0)
          {
            uint64_t v14 = v228;
            unsigned int v52 = v231;
            uint64_t v18 = v233;
            int v21 = v234;
            if ((m_Kan & 0x46) == 0x44)
            {
              strcpy(__s, " ");
              char v117 = m_Kan & 0xCF | 0x10;
            }
          }

          else
          {
            uint64_t v14 = v228;
            unsigned int v52 = v231;
            uint64_t v18 = v233;
            int v21 = v234;
            if ((m_Kan & 1) == 0)
            {
              if ((m_PinInfo & 0x3800) == 0x1800) {
                char v136 = m_Kan & 0xCF | 0x10;
              }
              else {
                char v136 = m_Kan & 0xCF;
              }
              m_Kan = v136;
              if (IsInyou(v235))
              {
                strcpy(__s, "&");
                char v137 = m_Kan & 0xF9;
                if ((m_PinInfo & 0x3800) != 0) {
                  char v117 = v137 | 4;
                }
                else {
                  char v117 = v137 | 2;
                }
              }

              else
              {
                strcpy(__s, "0");
                char v117 = m_Kan | 1;
              }
            }
          }

          if ((v117 & 0x30) != 0)
          {
            strcat(__s, &m_pcBrDat[3 * v26]);
          }

          else
          {
            *(_WORD *)&__s[strlen(__s)] = 32;
            strcat(__s, &m_pcBrDat[3 * v26]);
            char v117 = v117 & 0xCF | 0x10;
          }

          char v151 = v117 & 0xBF;
          goto LABEL_668;
        }
      }

      if (wcschr(dword_411DC, v26) && (m_PinInfo & 0x3800) == 0x800)
      {
        SetPinDat(__s, v19);
        BOOL v9 = &unk_C3000;
        m_Kan &= 0x87u;
        __s[0] = 0;
        int v127 = wcschr(dword_411DC, v26);
        strcpy( __s,  &byte_41260[2 * (int)(v127 - dword_411DC) + (int)((unint64_t)((char *)v127 - (char *)dword_411DC) >> 2)]);
        goto LABEL_426;
      }

      if (wcschr(dword_412C4, v26))
      {
        SetPinDat(__s, v19);
        BOOL v9 = &unk_C3000;
        __s[0] = 0;
        if ((m_Kan & 6) != 0
          || (m_Kan & 1) != 0
          || v26 > 127
          || (v26 == 58 ? (BOOL v138 = (HIDWORD(v227) - 48) >= 0xA) : (BOOL v138 = 1),
              !v138
           || (v26 - 34) <= 0x3D && ((1LL << (v26 - 34)) & 0x200000001C000001LL) != 0))
        {
          char v118 = m_Kan & 0xF7;
          uint64_t v14 = v228;
          unsigned int v52 = v231;
          uint64_t v18 = v233;
          int v21 = v234;
          if ((m_Kan & 0x46) == 0x44) {
            *(_WORD *)__s = 16;
          }
        }

        else
        {
          char v139 = m_Kan & 0xC7;
          if ((m_PinInfo & 0x3800) == 0x1800) {
            v139 |= 0x10u;
          }
          m_Kan = v139;
          uint64_t v14 = v228;
          unsigned int v52 = v231;
          uint64_t v18 = v233;
          int v21 = v234;
          if (IsInyou2((uint64_t)v235, v20))
          {
            int v140 = ((unsigned __int16)m_PinInfo >> 11) & 7;
            if (v140 != 5 && v140)
            {
              strcpy(__s, "&");
              char v118 = m_Kan & 0xF9 | 4;
            }

            else
            {
              if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
              {
                __s[2] = 0;
                __int16 v141 = 9736;
              }

              else
              {
                __int16 v141 = 38;
              }

              *(_WORD *)__s = v141;
              char v118 = m_Kan & 0xF9 | 2;
            }

            m_Kan = v118;
          }

          else
          {
            strcpy(__s, "0");
            char v118 = m_Kan | 1;
            m_Kan |= 1u;
          }
        }

        char v119 = v118 & 0x8F;
        char v120 = v118 | 0x10;
        if ((m_PinInfo & 0x3800) == 0x1800) {
          char v121 = v120;
        }
        else {
          char v121 = v119;
        }
        if (v26 > 94)
        {
          switch(v26)
          {
            case '_':
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 9232;
              goto LABEL_587;
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 4368;
              goto LABEL_587;
            case '~':
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 2320;
              goto LABEL_587;
          }

LABEL_567:
          strcat(__s, &m_pcBrDat[3 * v26]);
        }

        else
        {
          switch(v26)
          {
            case ':':
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 528;
              break;
            case ';':
              goto LABEL_567;
            case '<':
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 5140;
              break;
            case '=':
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 4626;
              break;
            case '>':
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 8738;
              break;
            default:
              if (v26 != 34) {
                goto LABEL_567;
              }
              __int16 v122 = &__s[strlen(__s)];
              __int16 v123 = 1056;
              break;
          }

LABEL_587:
          *(_WORD *)__int16 v122 = v123;
          v122[2] = 0;
        }

        char v151 = v121 & 0x9F;
LABEL_668:
        v9[892] = v151;
LABEL_817:
        unsigned int v19 = v232;
        goto LABEL_818;
      }

      __int16 v64 = m_PinInfo;
      if ((m_PinInfo & 0x80) != 0 && (m_Kan & 6) == 4 && m_iIsListFlg && v26 >= 65377 && v26 <= 65439)
      {
        SetPinDat(__s, v19);
        *(void *)__s = 0LL;
        uint64_t v247 = 0LL;
        int v248 = 0;
        BOOL v9 = &unk_C3000;
        char v130 = m_Kan;
        if ((m_Kan & 0x40) == 0) {
          __s[0] = 40;
        }
        uint64_t v14 = v228;
        uint64_t v18 = v233;
        if (v26 >> 4 <= 0xFF6)
        {
          strcat(__s, &byte_412EC[3 * (v26 - 65377)]);
          goto LABEL_631;
        }

        if (v26 == 65439)
        {
          *(_WORD *)&__s[strlen(__s)] = 6;
LABEL_631:
          unsigned int v52 = v231;
          int v21 = v234;
        }

        else
        {
          unsigned int v52 = v231;
          int v21 = v234;
          if (v26 == 65438) {
            *(_WORD *)&__s[strlen(__s)] = 2;
          }
          else {
            strcat(__s, &m_pcBrDat[3 * v26 - 195648]);
          }
        }

        char v168 = v130 & 0x87;
LABEL_662:
        char v151 = v168 | 0x40;
        goto LABEL_668;
      }

      BOOL v65 = v59 >= 0x1A && v58 >= 0x1A;
      char v66 = !v65;
      if (v65 && (v26 - 65391) >= 0x2F && v53 > 5)
      {
        uint64_t v18 = v233;
        if (v54 <= 0x5D)
        {
          BOOL v9 = &unk_C3000;
          unsigned int v52 = v231;
          int v21 = v234;
          if ((_BYTE)v20 && (m_Zen & 0x10) == 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
          {
            strcat(__s, "\b4");
            m_Kan = 0;
          }

          SetPinDat(__s, v19);
          __s[0] = 0;
          char v133 = m_Kan;
          if ((m_Kan & 6) != 0)
          {
            if (!(_BYTE)v20) {
              goto LABEL_625;
            }
LABEL_748:
            if ((v133 & 0x46) == 0x44)
            {
              *(_WORD *)__s = 16;
              v133 &= ~0x40u;
              m_Kan = v133;
            }

LABEL_756:
            if ((v133 & 6) != 2)
            {
              uint64_t v14 = v228;
              if ((v133 & 6) != 4) {
                goto LABEL_766;
              }
              switch(v26)
              {
                case '+':
                  size_t v185 = strlen(__s);
                  __int16 v186 = 44;
                  break;
                case ')':
                  size_t v185 = strlen(__s);
                  __int16 v186 = 52;
                  break;
                case '(':
                  size_t v185 = strlen(__s);
                  __int16 v186 = 38;
                  break;
                default:
LABEL_766:
                  strcat(__s, &m_pcBrDat[3 * v26]);
                  goto LABEL_772;
              }

              *(_WORD *)&__s[v185] = v186;
              goto LABEL_772;
            }

            uint64_t v14 = v228;
            if ((m_PinInfo & 0x3800) != 0x2800) {
              goto LABEL_766;
            }
            if (v26 == 93)
            {
              __int16 v187 = &__s[strlen(__s)];
              __int16 v188 = 1078;
            }

            else
            {
              if (v26 != 91) {
                goto LABEL_766;
              }
              __int16 v187 = &__s[strlen(__s)];
              __int16 v188 = 13856;
            }

            *(_WORD *)__int16 v187 = v188;
            v187[2] = 0;
LABEL_772:
            char v189 = v133 & 0xCF;
            if ((m_PinInfo & 0x3800) == 0x1800) {
              char v189 = v133 & 0xCF | 0x10;
            }
            char v190 = v189 & 0x9F;
            m_Kan = v189 & 0x9F;
            if ((v189 & 1) != 0 && v26 == 41
              || (v189 & 1) != 0
              && v26 == 45
              && ((HIDWORD(v227) - 48) < 0xA
               || HIDWORD(v227) == 97
               || (HIDWORD(v227) - 65) <= 0x19))
            {
              char v190 = v189 & 0x9E;
              m_Kan = v189 & 0x9E;
            }

            if ((v190 & 8) != 0 && v26 != 46 && v26 != 44) {
              m_Kan = v190 & 0x97;
            }
            goto LABEL_811;
          }

          if (!(_BYTE)v20 && (m_Kan & 1) != 0)
          {
LABEL_625:
            if ((m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
            {
              __int32 v167 = &__s[strlen(__s)];
              if ((m_Kan & 6) != 0)
              {
                strcpy(v167, "\b&");
                goto LABEL_748;
              }

              strcpy(v167, "\b0");
            }
          }

          if ((v133 & 7) != 0) {
            goto LABEL_748;
          }
          if ((HIDWORD(v227) - 48) > 9)
          {
            if (v26 <= 0x29)
            {
              uint64_t v183 = 1LL << v26;
              uint64_t v184 = 0x30200000000LL;
              goto LABEL_755;
            }
          }

          else if (v54 <= 0x3E)
          {
            uint64_t v183 = 1LL << v54;
            uint64_t v184 = 0x4000000012007781LL;
LABEL_755:
            if ((v183 & v184) != 0) {
              goto LABEL_756;
            }
          }

          if ((m_PinInfo & 0x3800) == 0x1800) {
            char v191 = v133 & 0xCF | 0x10;
          }
          else {
            char v191 = v133 & 0xCF;
          }
          m_Kan = v191;
          if (IsInyou2((uint64_t)v235, v20))
          {
            int v192 = ((unsigned __int16)m_PinInfo >> 11) & 7;
            if (v192 != 5 && v192)
            {
              strcpy(__s, " &");
              char v133 = m_Kan & 0xF9 | 4;
            }

            else
            {
              if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
              {
                __s[2] = 0;
                __int16 v193 = 9736;
              }

              else
              {
                __int16 v193 = 38;
              }

              *(_WORD *)__s = v193;
              char v133 = m_Kan & 0xF9 | 2;
            }
          }

          else
          {
            if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
            {
              __s[2] = 0;
              __int16 v210 = 12296;
            }

            else
            {
              __int16 v210 = 48;
            }

            *(_WORD *)__s = v210;
            char v133 = m_Kan | 1;
          }

          goto LABEL_756;
        }

        BOOL v9 = (_BYTE *)&unk_C3000;
        unsigned int v52 = v231;
        int v21 = v234;
        if ((v26 - 65383) <= 4)
        {
          uint64_t v14 = v228;
          if ((HIDWORD(v227) - 65504) <= 0xFFFFFF90)
          {
            if (__s[0]) {
              SetPinDat(__s, v19);
            }
            *(void *)__s = 0LL;
            uint64_t v247 = 0LL;
            int v248 = 0;
            goto LABEL_558;
          }

          int v169 = HIDWORD(v227) - 65216;
          int v170 = HIDWORD(v227) - 64904;
          if (HIDWORD(v227) >> 4 >= 0xFFD) {
            int v170 = HIDWORD(v227);
          }
          if (HIDWORD(v227) >> 5 >= 0x7FD) {
            int v169 = v170;
          }
          uint64_t v171 = 3LL * (v169 + 40 * v26 - 2615160);
          goto LABEL_678;
        }

        uint64_t v14 = v228;
        if ((v26 - 65388) <= 2)
        {
          if (SHIDWORD(v227) <= 65392)
          {
            if (__s[0]) {
              SetPinDat(__s, v19);
            }
            __s[0] = 0;
LABEL_558:
            if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0) {
              strcpy(__s, "\b$");
            }
            if ((*v235 - 12449) <= 0x52 && (m_Zen & 2) == 0)
            {
              if ((m_PinInfo & 0x100) != 0)
              {
                __int16 v152 = 22;
              }

              else
              {
                __s[2] = 0;
                __int16 v152 = 9248;
              }

              *(_WORD *)__s = v152;
              m_Zen |= 2u;
            }

            strcat(__s, &m_pcBrDat[3 * v26 - 195648]);
LABEL_811:
            char v147 = m_Zen;
            if ((_BYTE)v20)
            {
LABEL_812:
              if ((v147 & 0x10) != 0) {
                goto LABEL_817;
              }
              char v166 = v147 | 0x10;
              goto LABEL_816;
            }

            goto LABEL_814;
          }

          else {
            int v174 = -64632;
          }
          else {
            int v175 = -64904;
          }
          uint64_t v171 = 3LL * (HIDWORD(v227) + v175 + 40 * v26 - 2615480);
LABEL_678:
          __int32 v176 = &m_pcBrDat[v171];
          if (m_pcBrDat[v171])
          {
            if (*(unsigned __int16 *)__s == 9248 || *(unsigned __int16 *)__s == 9224)
            {
              __s[2] = 0;
              strcat(__s, v176);
              unsigned int v52 = v231;
            }

            else
            {
              unsigned int v52 = v231;
              if (__s[0] == 22)
              {
                __s[1] = 0;
                strcat(__s, v176);
              }

              else
              {
                strcpy(__s, v176);
              }
            }

            if ((v64 & 0x80) != 0)
            {
              __int16 v179 = v19 | 0x8000;
              if ((_DWORD)v14)
              {
              }
            }

            else
            {
              if (v229)
              {
                if (v229 >= v230->u16[(int)v233 - 1] && v52 <= v230->u16[(int)v233])
                {
                  LOWORD(v19) = v19 | 0x8000;
                }

                else if (v229 < v227 && v52 >= v230->u16[(int)v233])
                {
                  LOWORD(v19) = v19 | 0x8000;
                }
              }

              if ((_DWORD)v14)
              {
                if (v14 >= v230->u16[(int)v233 - 1] && v14 <= v230->u16[(int)v233])
                {
                  LOWORD(v19) = v19 | 0x4000;
                }

                else if (v14 < v227 && v14 >= v230->u16[(int)v233])
                {
                  LOWORD(v19) = v19 | 0x4000;
                }
              }
            }

            SetPinDat(__s, v19);
            int v26 = 0;
            *(void *)__s = 0LL;
            uint64_t v247 = 0LL;
            int v248 = 0;
          }

          else
          {
            SetPinDat(__s, v19);
            strcpy(__s, &m_pcBrDat[3 * v26 - 195648]);
            unsigned int v52 = v231;
          }

          goto LABEL_811;
        }

        if (v26 != 65438)
        {
          if (v26 != 65439)
          {
            if ((v26 & 0xFFFFFFF8) == 0x18)
            {
              SetPinDat(__s, v19);
              switch(v26)
              {
                case 24:
                  strcpy(__s, byte_41621);
                  int v26 = 539;
                  goto LABEL_817;
                case 25:
                  strcpy(__s, byte_4162D);
                  int v26 = 543;
                  goto LABEL_817;
                case 26:
                  strcpy(__s, byte_4163C);
                  int v26 = 548;
                  goto LABEL_817;
                case 27:
                  strcpy(__s, byte_4164B);
                  int v26 = 553;
                  goto LABEL_817;
                case 28:
                  strcpy(__s, byte_41651);
                  int v26 = 555;
                  goto LABEL_817;
                case 29:
                  strcpy(__s, byte_41654);
                  int v26 = 556;
                  goto LABEL_817;
                case 30:
                  strcpy(__s, byte_41669);
                  int v26 = 563;
                  goto LABEL_817;
                case 31:
                  strcpy(__s, byte_41669);
                  int v26 = 883;
                  goto LABEL_817;
                default:
                  goto LABEL_928;
              }
            }

            if (v26 != 1)
            {
              if (v26 == 12)
              {
                SetPinDat(__s, v19);
                __int16 v182 = 88;
                goto LABEL_927;
              }

              if (v26 == 13)
              {
                SetPinDat(__s, v19);
                __int16 v182 = 184;
LABEL_927:
                *(_WORD *)__s = v182;
                m_Zen = 0;
LABEL_928:
                unsigned int v19 = v232;
              }

              int v26 = HIDWORD(v227);
              goto LABEL_818;
            }

            SetPinDat(__s, v19);
            __int16 v182 = 128;
            goto LABEL_927;
          }

          if (SHIDWORD(v227) >= 65394 && (uint64_t v172 = &m_pcBrDat[3 * HIDWORD(v227) - 193608], *v172))
          {
            if (*(unsigned __int16 *)__s == 9248 || *(unsigned __int16 *)__s == 9224)
            {
              __s[2] = 0;
LABEL_870:
              strcat(__s, v172);
            }

            else
            {
              if (__s[0] == 22)
              {
                __s[1] = 0;
                goto LABEL_870;
              }

              strcpy(__s, v172);
            }
          }

          else
          {
            if (__s[0]) {
              SetPinDat(__s, v19);
            }
            __s[0] = 0;
            if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0) {
              strcpy(__s, "\b$");
            }
            int v178 = &__s[strlen(__s)];
            *(_WORD *)int v178 = 1048;
            v178[2] = 0;
            unsigned int v19 = v232;
          }

          if ((m_PinInfo & 0x80) != 0)
          {
            unsigned int v203 = v19 | 0xFFFF8000;
            if (v228)
            {
            }
          }

          else
          {
            if (v229)
            {
              if (v229 >= v230->u16[(int)v233 - 1] && v231 <= v230->u16[(int)v233])
              {
                v19 |= 0xFFFF8000;
              }

              else if (v229 < v227 && v231 >= v230->u16[(int)v233])
              {
                v19 |= 0xFFFF8000;
              }
            }

            if (v228)
            {
              if (v228 >= v230->u16[(int)v233 - 1] && v228 <= v230->u16[(int)v233])
              {
                v19 |= 0x4000u;
              }

              else if (v228 < v227 && v228 >= v230->u16[(int)v233])
              {
                v19 |= 0x4000u;
              }
            }
          }

          int v26 = HIDWORD(v227) + 96;
          goto LABEL_818;
        }

        if (SHIDWORD(v227) < 65395)
        {
          if (__s[0]) {
            SetPinDat(__s, v19);
          }
          __s[0] = 0;
          if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0) {
            strcpy(__s, "\b$");
          }
          goto LABEL_896;
        }

        BOOL v177 = &m_pcBrDat[3 * HIDWORD(v227) - 194568];
        if (!*v177)
        {
          if (__s[0]) {
            SetPinDat(__s, v19);
          }
          __s[0] = 0;
LABEL_896:
          int v206 = &__s[strlen(__s)];
          *(_WORD *)int v206 = 536;
          v206[2] = 0;
          unsigned int v19 = v232;
          goto LABEL_897;
        }

        if (*(unsigned __int16 *)__s == 9248 || *(unsigned __int16 *)__s == 9224)
        {
          __s[2] = 0;
        }

        else
        {
          if (__s[0] != 22)
          {
            strcpy(__s, v177);
            goto LABEL_897;
          }

          __s[1] = 0;
        }

        strcat(__s, v177);
LABEL_897:
        if ((m_PinInfo & 0x80) != 0)
        {
          unsigned int v207 = v19 | 0xFFFF8000;
          if (v228)
          {
          }
        }

        else
        {
          if (v229)
          {
            if (v229 >= v230->u16[(int)v233 - 1] && v231 <= v230->u16[(int)v233])
            {
              v19 |= 0xFFFF8000;
            }

            else if (v229 < v227 && v231 >= v230->u16[(int)v233])
            {
              v19 |= 0xFFFF8000;
            }
          }

          if (v228)
          {
            if (v228 >= v230->u16[(int)v233 - 1] && v228 <= v230->u16[(int)v233])
            {
              v19 |= 0x4000u;
            }

            else if (v228 < v227 && v228 >= v230->u16[(int)v233])
            {
              v19 |= 0x4000u;
            }
          }
        }

        int v26 = HIDWORD(v227) + 48;
LABEL_818:
        char v51 = m_PinInfo;
        if (!v21) {
          goto LABEL_831;
        }
        if ((m_PinInfo & 0x80) != 0)
        {
          if ((_DWORD)v14 && (_DWORD)v14 == (_DWORD)v18)
          {
            if (!m_iCurFlg) {
              m_iPinBlockCur = m_iPinBlockCount;
            }
            m_iCurFlg = 1;
            m_iCurFarstFlg = 1;
            uint64_t v18 = v14;
          }

          goto LABEL_866;
        }

        unsigned int v194 = v230->u16[(int)v18 - 1];
        if (v229 > v194 || v52 < v194)
        {
          if (v52 >= v194) {
            unsigned int v196 = v19 | 0xFFFF8000;
          }
          else {
            unsigned int v196 = v19;
          }
          if (!(_DWORD)v14) {
            goto LABEL_866;
          }
LABEL_854:
          if (v230->u16[(int)v18] == (_DWORD)v14)
          {
            if (!m_iCurFlg) {
              m_iPinBlockCur = m_iPinBlockCount;
            }
            v19 |= 0x4000u;
            m_iCurFlg = 1;
            m_iCurFarstFlg = 1;
          }

          goto LABEL_866;
        }

        v19 |= 0xFFFF8000;
        if ((_DWORD)v14) {
          goto LABEL_854;
        }
LABEL_866:
        int v17 = m_iLoopFlg;
        HIDWORD(v227) = v26;
        if (m_iLoopFlg == 2) {
          return 2LL;
        }
      }

      else
      {
        *(_OWORD *)int v240 = 0u;
        __int128 v241 = 0u;
        __int128 v242 = 0u;
        __int128 v243 = 0u;
        *(_OWORD *)__int32 v236 = 0u;
        __int128 v237 = 0u;
        __int128 v238 = 0u;
        __int128 v239 = 0u;
        unsigned int v67 = m_Kan;
        m_Kan &= ~8u;
        int v68 = (v67 >> 1) & 3;
        if (v68 && v26 >= 65376 && v26 <= 65439 && !m_iIsListFlg)
        {
          char v69 = -15;
          if (v68 == 1)
          {
            __int16 v70 = 52;
            goto LABEL_214;
          }

          goto LABEL_215;
        }

        if ((v67 & 0x40) != 0 && (m_PinInfo & 0x80) == 0 && (m_PinInfo & 0x3800) != 0x2800)
        {
          BOOL v71 = v68 == 2 && v57;
          if (v71 && v26 < 123)
          {
            char v69 = -73;
            __int16 v70 = 48;
            goto LABEL_214;
          }
        }

        if ((v67 & 1) != 0 && v26 >= 65383 && v26 <= 65439)
        {
          char v69 = -10;
          __int16 v70 = 36;
LABEL_214:
          *(_WORD *)&__s[strlen(__s)] = v70;
LABEL_215:
          m_Kan = v67 & v69;
        }

        if ((_BYTE)v20)
        {
          if ((m_Zen & 0x10) == 0 && (v64 & 0x600) != 0 && (v64 & 0x80) != 0)
          {
            strcat(__s, "\b4");
            m_Kan = 0;
          }

          if ((v64 & 0x3880) == 0x2880) {
            char v72 = v66;
          }
          else {
            char v72 = 0;
          }
          if ((v72 & 1) == 0)
          {
            int v77 = 0;
            goto LABEL_244;
          }

          __int128 v242 = 0u;
          __int128 v243 = 0u;
          size_t v73 = v235 - 1;
          *(_OWORD *)int v240 = 0u;
          __int128 v241 = 0u;
          int v74 = 1;
        }

        else
        {
          char v75 = v66 ^ 1;
          if ((v64 & 0x3880) != 0x2880) {
            char v75 = 1;
          }
          if ((v75 & 1) != 0)
          {
            int v77 = 0;
            goto LABEL_244;
          }

          __int128 v242 = 0u;
          __int128 v243 = 0u;
          *(_OWORD *)int v240 = 0u;
          __int128 v241 = 0u;
          size_t v73 = v235;
          int v74 = 0;
        }

        BOOL v76 = EijiStrSet(v73, v240, v74);
        int v77 = IsEijiTo2(v240, v236, v76);
        if (!v77) {
          goto LABEL_244;
        }
        if (v76 && v226)
        {
          if (v77 == strlen(v240))
          {
            if (EChk7(v240))
            {
              size_t v78 = strlen(__s) - 1;
              if (__s[v78] == 64) {
                __s[v78] = 0;
              }
            }
          }
        }

        else if (!v76)
        {
          goto LABEL_243;
        }

        if (v77 == strlen(v240) && EChk7(v240))
        {
          int v226 = 1;
          goto LABEL_244;
        }

LABEL_243:
        int v226 = 0;
LABEL_244:
        if (__s[0]) {
          SetPinDat(__s, v19);
        }
        char v79 = m_Kan;
        char v80 = m_Kan & 0xF7;
        m_Kan &= ~8u;
        *(void *)__s = 0LL;
        uint64_t v247 = 0LL;
        int v248 = 0;
        if ((v79 & 6) != 0)
        {
          if ((_BYTE)v20 || v26 > 127) {
            goto LABEL_262;
          }
        }

        else if ((_BYTE)v20 || (v79 & 1) == 0 || v26 > 127)
        {
          goto LABEL_259;
        }

        if ((m_Zen & 0x10) != 0 && (v79 & 6) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
        {
          strcat(__s, "\b&");
          goto LABEL_262;
        }

        if ((v79 & 6) != 0) {
          goto LABEL_262;
        }
LABEL_259:
        if ((v79 & 1) == 0 && v26 <= 127 && (m_PinInfo & 0x3880) != 0x2800)
        {
          if (IsInyou2((uint64_t)v235, v20))
          {
            int v85 = ((unsigned __int16)m_PinInfo >> 11) & 7;
            uint64_t v18 = v233;
            if (v85 != 5 && v85)
            {
              strcpy(__s, "&");
              char v80 = m_Kan & 0xF9 | 4;
            }

            else
            {
              if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
              {
                __s[2] = 0;
                __int16 v86 = 9736;
              }

              else
              {
                __int16 v86 = 38;
              }

              *(_WORD *)__s = v86;
              char v80 = m_Kan & 0xF9 | 2;
            }
          }

          else
          {
            uint64_t v18 = v233;
            if (!(_BYTE)v20 && (m_Zen & 0x10) != 0 && (m_PinInfo & 0x600) != 0 && (m_PinInfo & 0x80) != 0)
            {
              __s[2] = 0;
              __int16 v125 = 12296;
            }

            else
            {
              __int16 v125 = 48;
            }

            *(_WORD *)__s = v125;
            char v80 = m_Kan | 1;
          }

          goto LABEL_270;
        }

LABEL_262:
        if ((v79 & 0x40) != 0 && ((v79 & 6) == 4 ? (BOOL v81 = v57) : (BOOL v81 = 0), v81))
        {
          uint64_t v18 = v233;
          if (v26 <= 122)
          {
            strcpy(__s, "0");
            char v80 = v79 & 0xB7;
LABEL_270:
            m_Kan = v80;
          }
        }

        else
        {
          uint64_t v18 = v233;
        }

        BOOL v93 = v59 > 0x19;
        BOOL v9 = &unk_C3000;
        if (!v93)
        {
          if ((m_PinInfo & 0x3000) == 0) {
            goto LABEL_277;
          }
          BOOL v82 = (m_PinInfo & 0x80) == 0;
          if ((m_PinInfo & 0x600) == 0) {
            BOOL v82 = 0;
          }
          if ((m_PinInfo & 0x3880) == 0x2880 || v82)
          {
LABEL_277:
            if ((v80 & 0x30) != 0)
            {
              if (IsOomoji((uint64_t)v235, 0))
              {
                *(_WORD *)&__s[strlen(__s)] = 32;
                v80 &= 0xCFu;
              }
            }

            else
            {
              int v83 = IsOomoji((uint64_t)v235, 1);
              size_t v84 = &__s[strlen(__s)];
              v80 &= 0xCFu;
              if (v83)
              {
                strcpy(v84, "  ");
                v80 |= 0x10u;
              }

              else
              {
                *(_WORD *)size_t v84 = 32;
              }
            }

            m_Kan = v80 & 0xBF;
          }
        }

        if (!v77)
        {
          if (!(_BYTE)v20
            && (v26 - 65440) >= 0xFFFFFFC1
            && (m_Zen & 0x10) != 0
            && (m_PinInfo & 0x600) != 0
            && (m_PinInfo & 0x80) != 0)
          {
            strcpy(__s, "\b$");
          }

          unsigned int v52 = v231;
          int v21 = v234;
          if ((*v235 - 12449) <= 0x52 && (m_Zen & 2) == 0)
          {
            if ((m_PinInfo & 0x100) != 0)
            {
              __int16 v124 = 22;
            }

            else
            {
              __s[2] = 0;
              __int16 v124 = 9248;
            }

            *(_WORD *)__s = v124;
            m_Zen |= 2u;
          }

          int v153 = 3 * v26;
          if (v26 >= 128) {
            int v153 = 3 * v26 - 195648;
          }
          strcat(__s, &m_pcBrDat[v153]);
          if ((v26 - 65377) <= 4 && ((1 << (v26 - 97)) & 0x19) != 0)
          {
            int v154 = IsMoji(v235 + 1);
          }

          char v147 = m_Zen;
          if ((_BYTE)v20)
          {
            uint64_t v14 = v228;
            goto LABEL_812;
          }

          uint64_t v14 = v228;
          if ((m_Zen & 0x10) == 0) {
            goto LABEL_817;
          }
LABEL_815:
          char v166 = v147 & 0xEF;
LABEL_816:
          m_Zen = v166;
          goto LABEL_817;
        }

        int v87 = strlen(v236);
        if (v87 >= 1)
        {
          uint64_t v88 = v87;
          uint64_t v89 = v236;
          do
          {
            unsigned int v91 = *v89++;
            uint64_t v90 = v91;
            unsigned int v92 = (v91 + 127);
            BOOL v93 = v91 <= 0xDFuLL && v92 > 0x1E;
            if (v93) {
              strcat(__s, &m_pcBrDat[3 * v90]);
            }
            else {
              __s[strlen(__s)] = v90 & 0x3F;
            }
            --v88;
          }

          while (v88);
        }

        if (*(unsigned __int16 *)v240 == 25954)
        {
          int v94 = v235 - 3;
          if (!wcsncmp(v235 - 3, dword_2B1D4, 3uLL)
            || !wcsncmp(v94, dword_2B1E4, 3uLL)
            || !wcsncmp(v94, dword_2B1F4, 3uLL)
            || !wcsncmp(v94, dword_2B204, 3uLL)
            || (__int16 v95 = v235 - 4, !wcsncmp(v235 - 4, dword_2B214, 3uLL))
            || !wcsncmp(v95, dword_2B224, 3uLL)
            || !wcsncmp(v95, dword_2B234, 3uLL)
            || !wcsncmp(v94, dword_2B244, 3uLL)
            || !wcsncmp(v94, dword_2B254, 3uLL)
            || !wcsncmp(v94, dword_2B268, 3uLL))
          {
            __s[strlen(__s) - 1] = 3;
            __s[strlen(__s)] = 17;
          }
        }

        if ((_BYTE)v20) {
          uint64_t v96 = -1LL;
        }
        else {
          uint64_t v96 = 0LL;
        }
        uint64_t v14 = v228;
        unsigned int v97 = v232;
        if (v228 == (unsigned __int16)v232)
        {
          if (!m_iCurFlg) {
            m_iPinBlockCur = m_iPinBlockCount;
          }
          m_iCurFlg = 1;
          m_iCurFarstFlg = 1;
          unsigned int v97 = v225;
        }

        v235 += v96 + v77;
        else {
          unsigned int v19 = v97;
        }
        int v17 = m_iLoopFlg;
        uint64_t v18 = (v18 + 2 * v77);
        int v21 = v234;
        if (m_iLoopFlg == 2) {
          return 2LL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_24748()
{
  return __cxa_atexit((void (*)(void *))ktoau::~ktoau, &Ktoau, &dword_0);
}

void sub_24A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_36:
        unsigned int v31 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v42,  v41));
        int v40 = -[NSMutableData initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithCapacity:",  8LL * (void)-[__CFString length](v31, "length"));
        for (j = 0LL; (unint64_t)-[__CFString length](v31, "length") > j; ++j)
        {
          v56[0] = *(unsigned __int16 *)&v57[2 * j] - 1LL;
          -[os_log_s appendBytes:length:](v40, "appendBytes:length:", v56, 8LL);
        }

        char v48 = (void *)objc_claimAutoreleasedReturnValue( +[BRLTPreprocessorHelper mergeLocationMap:withLocationMap:]( &OBJC_CLASS___BRLTPreprocessorHelper,  "mergeLocationMap:withLocationMap:",  v16,  v40));
        operator delete[](v43);
        if (v50) {
          *char v50 = v48;
        }
      }
    }

    else
    {
      unsigned int v31 = &stru_2C350;
    }
  }

  else
  {
    __int16 v22 = NBSCLog();
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    unsigned int v54 = v23;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_25A00(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    unsigned int v31 = &stru_2C350;
  }

  return v31;
}

void sub_25010( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_25440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
}

void sub_2552C(_Unwind_Exception *a1)
{
}

__CFString *NBSCTrimmedString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqual:&stru_2C350])
  {
    int v5 = &stru_2C350;
  }

  else
  {
    int v6 = (char *)[v3 length];
    do
    {
      uint64_t v7 = v6--;
      int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 characterAtIndex:v6]));
      unsigned __int8 v9 = [v4 containsObject:v8];
    }

    while ((v9 & 1) != 0);
    int v5 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:v7]);
  }

  return v5;
}

void sub_25648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NBSCTrimmedStringFrom(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    if ([v3 length])
    {
      int v5 = (char *)[v3 length];
      do
      {
        int v6 = v5--;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 characterAtIndex:v5]));
        unsigned __int8 v8 = [v4 containsObject:v7];
      }

      while ((v8 & 1) != 0);
      unsigned __int8 v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:v6]);
    }

    else
    {
      unsigned __int8 v9 = &stru_2C350;
    }
  }

  else
  {
    unsigned __int8 v9 = 0LL;
  }

  return v9;
}

void sub_25750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NBSCStringByRemovingNullCharsFrom(NSString *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = -[NSString length](v1, "length");
  if (v2 < 0) {
    size_t v3 = -1LL;
  }
  else {
    size_t v3 = 2 * v2;
  }
  id v4 = operator new[](v3);
  unint64_t v5 = 0LL;
  int v6 = 0;
  while (-[NSString length](v1, "length") > v5)
  {
    unsigned int v7 = -[NSString characterAtIndex:](v1, "characterAtIndex:", v5);
    if (v7) {
      v4[v6++] = v7;
    }
    ++v5;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v4,  v6));
  operator delete[](v4);

  return v8;
}

void sub_2581C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25838( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_25850( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_2586C()
{
}

void sub_258CC()
{
}

void sub_2592C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "NBSC Text for Braille: HanKataToZenHira.plist not found. %@",  (uint8_t *)&v2,  0xCu);
}

void sub_259A0()
{
}

void sub_25A00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25A30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_25A60()
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}