LABEL_51:
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_mainContentLengthInMilliseconds));
  [v4 setObject:v35 forKey:@"main_content_length_in_milliseconds"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_45:
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_mainContentPlayHeadInMilliseconds));
    [v4 setObject:v29 forKey:@"main_content_play_head_in_milliseconds"];
  }

LABEL_46:
  mainContentInfo = self->_mainContentInfo;
  if (mainContentInfo)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UWLSectionInfo dictionaryRepresentation](mainContentInfo, "dictionaryRepresentation"));
    [v4 setObject:v31 forKey:@"main_content_info"];
  }

  return v4;
}

uint64_t UWLPlayEventReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v14 = 56LL;
        goto LABEL_85;
      case 2u:
        uint64_t v15 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v15);
        uint64_t v14 = 96LL;
        goto LABEL_85;
      case 3u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0LL;
        while (2)
        {
          unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1LL || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v20 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v9 = v17++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_122;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_122:
        uint64_t v83 = 40LL;
        goto LABEL_169;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v18 = 0LL;
        while (2)
        {
          unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1LL || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v24 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
            v18 |= (unint64_t)(v24 & 0x7F) << v21;
            if (v24 < 0)
            {
              v21 += 7;
              BOOL v9 = v22++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_126;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_126:
        uint64_t v83 = 32LL;
        goto LABEL_169;
      case 5u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0LL;
        *(_WORD *)(a1 + 168) |= 0x100u;
        while (2)
        {
          unint64_t v28 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v28 == -1LL || v28 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v29 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v9 = v26++ >= 9;
              if (v9)
              {
                uint64_t v27 = 0LL;
                goto LABEL_130;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v27 = 0LL;
        }
LABEL_130:
        BOOL v84 = v27 != 0;
        uint64_t v85 = 163LL;
        goto LABEL_160;
      case 6u:
        uint64_t v30 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v30);
        uint64_t v14 = 104LL;
        goto LABEL_85;
      case 7u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v18 = 0LL;
        *(_WORD *)(a1 + 168) |= 4u;
        while (2)
        {
          unint64_t v33 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1LL || v33 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v34 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v18 |= (unint64_t)(v34 & 0x7F) << v31;
            if (v34 < 0)
            {
              v31 += 7;
              BOOL v9 = v32++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_134;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_134:
        uint64_t v83 = 24LL;
        goto LABEL_169;
      case 8u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0LL;
        *(_WORD *)(a1 + 168) |= 0x10u;
        while (2)
        {
          unint64_t v38 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v38 == -1LL || v38 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v39 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v38);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v9 = v36++ >= 9;
              if (v9)
              {
                LODWORD(v37) = 0;
                goto LABEL_138;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v37) = 0;
        }
LABEL_138:
        uint64_t v86 = 144LL;
        goto LABEL_151;
      case 9u:
        uint64_t v40 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v40);
        uint64_t v14 = 152LL;
        goto LABEL_85;
      case 0xAu:
        uint64_t v41 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v41);
        uint64_t v14 = 48LL;
        goto LABEL_85;
      case 0xBu:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0LL;
        *(_WORD *)(a1 + 168) |= 0x80u;
        while (2)
        {
          unint64_t v45 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v45 == -1LL || v45 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v46 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v45);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v45 + 1;
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              BOOL v9 = v43++ >= 9;
              if (v9)
              {
                uint64_t v44 = 0LL;
                goto LABEL_142;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v44 = 0LL;
        }
LABEL_142:
        BOOL v84 = v44 != 0;
        uint64_t v85 = 162LL;
        goto LABEL_160;
      case 0xCu:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v49 = 0LL;
        *(_WORD *)(a1 + 168) |= 0x200u;
        while (2)
        {
          unint64_t v50 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v50 == -1LL || v50 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v51 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v50);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v50 + 1;
            v49 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              BOOL v9 = v48++ >= 9;
              if (v9)
              {
                uint64_t v49 = 0LL;
                goto LABEL_146;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v49 = 0LL;
        }
LABEL_146:
        BOOL v84 = v49 != 0;
        uint64_t v85 = 164LL;
        goto LABEL_160;
      case 0xDu:
        uint64_t v52 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v52);
        uint64_t v14 = 64LL;
        goto LABEL_85;
      case 0xEu:
        uint64_t v53 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v53);
        uint64_t v14 = 80LL;
        goto LABEL_85;
      case 0xFu:
        uint64_t v54 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v54);
        uint64_t v14 = 112LL;
        goto LABEL_85;
      case 0x10u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v37 = 0LL;
        *(_WORD *)(a1 + 168) |= 8u;
        while (2)
        {
          unint64_t v57 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v57 == -1LL || v57 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v58 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v57);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
            v37 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              BOOL v9 = v56++ >= 9;
              if (v9)
              {
                LODWORD(v37) = 0;
                goto LABEL_150;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v37) = 0;
        }
LABEL_150:
        uint64_t v86 = 88LL;
LABEL_151:
        *(_DWORD *)(a1 + v86) = v37;
        goto LABEL_170;
      case 0x11u:
        uint64_t v59 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v59);
        uint64_t v14 = 72LL;
        goto LABEL_85;
      case 0x12u:
        uint64_t v60 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v60);
        uint64_t v14 = 120LL;
        goto LABEL_85;
      case 0x13u:
        uint64_t v61 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v61);
        uint64_t v14 = 128LL;
LABEL_85:
        v62 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_170;
      case 0x14u:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v65 = 0LL;
        *(_WORD *)(a1 + 168) |= 0x40u;
        while (2)
        {
          unint64_t v66 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v66 == -1LL || v66 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v67 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v66);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v66 + 1;
            v65 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v63 += 7;
              BOOL v9 = v64++ >= 9;
              if (v9)
              {
                uint64_t v65 = 0LL;
                goto LABEL_155;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v65 = 0LL;
        }
LABEL_155:
        BOOL v84 = v65 != 0;
        uint64_t v85 = 161LL;
        goto LABEL_160;
      case 0x15u:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v70 = 0LL;
        *(_WORD *)(a1 + 168) |= 0x20u;
        while (2)
        {
          unint64_t v71 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v71 == -1LL || v71 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v72 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v71);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v71 + 1;
            v70 |= (unint64_t)(v72 & 0x7F) << v68;
            if (v72 < 0)
            {
              v68 += 7;
              BOOL v9 = v69++ >= 9;
              if (v9)
              {
                uint64_t v70 = 0LL;
                goto LABEL_159;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v70 = 0LL;
        }
LABEL_159:
        BOOL v84 = v70 != 0;
        uint64_t v85 = 160LL;
LABEL_160:
        *(_BYTE *)(a1 + v85) = v84;
        goto LABEL_170;
      case 0x16u:
        char v73 = 0;
        unsigned int v74 = 0;
        uint64_t v18 = 0LL;
        *(_WORD *)(a1 + 168) |= 1u;
        while (2)
        {
          unint64_t v75 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v75 == -1LL || v75 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v76 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v75);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v75 + 1;
            v18 |= (unint64_t)(v76 & 0x7F) << v73;
            if (v76 < 0)
            {
              v73 += 7;
              BOOL v9 = v74++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_164;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_164:
        uint64_t v83 = 8LL;
        goto LABEL_169;
      case 0x17u:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v18 = 0LL;
        *(_WORD *)(a1 + 168) |= 2u;
        while (2)
        {
          unint64_t v79 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v79 == -1LL || v79 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v80 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v79);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v79 + 1;
            v18 |= (unint64_t)(v80 & 0x7F) << v77;
            if (v80 < 0)
            {
              v77 += 7;
              BOOL v9 = v78++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_168;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_168:
        uint64_t v83 = 16LL;
LABEL_169:
        *(void *)(a1 + v83) = v18;
        goto LABEL_170;
      case 0x34u:
        v82 = objc_alloc_init(&OBJC_CLASS___UWLSectionInfo);
        objc_storeStrong((id *)(a1 + 136), v82);
        if (PBReaderPlaceMark(a2, v87) && (UWLSectionInfoReadFrom((uint64_t)v82, a2) & 1) != 0)
        {
          PBReaderRecallMark(a2, v87);

LABEL_170:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0LL;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_170;
    }
  }
}

LABEL_41:
  PBDataWriterWriteInt64Field(v18, self->_mainContentLengthInMilliseconds, 22LL);
  unint64_t v6 = v18;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    PBDataWriterWriteInt64Field(v18, self->_mainContentPlayHeadInMilliseconds, 23LL);
    unint64_t v6 = v18;
  }

  v4[1] = self->_mainContentLengthInMilliseconds;
  *((_WORD *)v4 + 84) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    v4[2] = self->_mainContentPlayHeadInMilliseconds;
    *((_WORD *)v4 + 84) |= 2u;
  }

LABEL_36:
  mainContentInfo = self->_mainContentInfo;
  if (mainContentInfo)
  {
    PBDataWriterWriteSubmessage(v18, mainContentInfo, 52LL);
    unint64_t v6 = v18;
  }
}

  if (self->_mainContentInfo)
  {
    objc_msgSend(v8, "setMainContentInfo:");
    char v4 = v8;
  }
}

LABEL_18:
  char v31 = -[UWLSectionInfo copyWithZone:](self->_mainContentInfo, "copyWithZone:", a3);
  unsigned int v32 = (void *)v5[17];
  v5[17] = v31;

  return v5;
}

LABEL_94:
    char v24 = 0;
    goto LABEL_95;
  }

  if ((v22 & 0x20) != 0) {
    goto LABEL_94;
  }
LABEL_82:
  if ((v21 & 1) != 0)
  {
    if ((v22 & 1) == 0 || self->_mainContentLengthInMilliseconds != *((void *)v4 + 1)) {
      goto LABEL_94;
    }
  }

  else if ((v22 & 1) != 0)
  {
    goto LABEL_94;
  }

  if ((v21 & 2) != 0)
  {
    if ((v22 & 2) == 0 || self->_mainContentPlayHeadInMilliseconds != *((void *)v4 + 2)) {
      goto LABEL_94;
    }
  }

  else if ((v22 & 2) != 0)
  {
    goto LABEL_94;
  }

  mainContentInfo = self->_mainContentInfo;
  else {
    char v24 = 1;
  }
LABEL_95:

  return v24;
}

LABEL_45:
  self->_mainContentLengthInMilliseconds = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 84) & 2) != 0)
  {
LABEL_39:
    self->_mainContentPlayHeadInMilliseconds = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }

LABEL_40:
  mainContentInfo = self->_mainContentInfo;
  BOOL v9 = *((void *)v4 + 17);
  if (mainContentInfo)
  {
    if (v9)
    {
      -[UWLSectionInfo mergeFrom:](mainContentInfo, "mergeFrom:");
LABEL_49:
      char v4 = v10;
    }
  }

  else if (v9)
  {
    -[UWLPlayEvent setMainContentInfo:](self, "setMainContentInfo:");
    goto LABEL_49;
  }
}

void sub_100004F24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000050CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_100005204( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005348( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000058DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005A34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005B7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005E68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000601C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000061A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100006318( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000064A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100006634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000068EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100006A90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100006D58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100007358(_Unwind_Exception *a1)
{
}

void sub_1000073CC(_Unwind_Exception *a1)
{
}

uint64_t UWLLiveActivityEventReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v14 = 32LL;
        goto LABEL_64;
      case 2u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0LL;
        *(_BYTE *)(a1 + 88) |= 4u;
        while (2)
        {
          unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1LL || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v20 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v9 = v17++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_68;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_68:
        uint64_t v42 = 24LL;
        goto LABEL_81;
      case 3u:
        uint64_t v21 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v14 = 80LL;
        goto LABEL_64;
      case 4u:
        unsigned int v22 = objc_alloc_init(&OBJC_CLASS___UWLLiveActivityEventChannel);
        objc_storeStrong((id *)(a1 + 48), v22);
        goto LABEL_34;
      case 5u:
        unsigned int v22 = objc_alloc_init(&OBJC_CLASS___UWLLiveActivityEventContent);
        objc_storeStrong((id *)(a1 + 56), v22);
        if (PBReaderPlaceMark(a2, v44)
          && (UWLLiveActivityEventContentReadFrom((uint64_t)v22, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark(a2, v44);

LABEL_87:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

LABEL_89:
        return 0LL;
      case 6u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 88) |= 8u;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1LL || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v27 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v25) = 0;
                goto LABEL_72;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v25) = 0;
        }
LABEL_72:
        uint64_t v43 = 40LL;
        goto LABEL_86;
      case 7u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v18 = 0LL;
        *(_BYTE *)(a1 + 88) |= 2u;
        while (2)
        {
          unint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1LL || v30 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v31 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v18 |= (unint64_t)(v31 & 0x7F) << v28;
            if (v31 < 0)
            {
              v28 += 7;
              BOOL v9 = v29++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_76;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_76:
        uint64_t v42 = 16LL;
        goto LABEL_81;
      case 8u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v18 = 0LL;
        *(_BYTE *)(a1 + 88) |= 1u;
        while (2)
        {
          unint64_t v34 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v34 == -1LL || v34 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v35 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v34);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v34 + 1;
            v18 |= (unint64_t)(v35 & 0x7F) << v32;
            if (v35 < 0)
            {
              v32 += 7;
              BOOL v9 = v33++ >= 9;
              if (v9)
              {
                uint64_t v18 = 0LL;
                goto LABEL_80;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0LL;
        }
LABEL_80:
        uint64_t v42 = 8LL;
LABEL_81:
        *(void *)(a1 + v42) = v18;
        goto LABEL_87;
      case 9u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 88) |= 0x10u;
        while (2)
        {
          unint64_t v38 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v38 == -1LL || v38 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v39 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v38);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
            v25 |= (unint64_t)(v39 & 0x7F) << v36;
            if (v39 < 0)
            {
              v36 += 7;
              BOOL v9 = v37++ >= 9;
              if (v9)
              {
                LODWORD(v25) = 0;
                goto LABEL_85;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v25) = 0;
        }
LABEL_85:
        uint64_t v43 = 64LL;
LABEL_86:
        *(_DWORD *)(a1 + v43) = v25;
        goto LABEL_87;
      case 0xAu:
        uint64_t v40 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v40);
        uint64_t v14 = 72LL;
LABEL_64:
        uint64_t v41 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_87;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_87;
    }
  }

LABEL_21:
  PBDataWriterWriteInt64Field(v11, self->_cleanupTimeEpochMillis, 8LL);
  char v4 = v11;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt32Field(v11, self->_contractOrTimed, 9LL);
    char v4 = v11;
  }

  *((void *)v4 + 1) = self->_cleanupTimeEpochMillis;
  *((_BYTE *)v4 + 88) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 16) = self->_contractOrTimed;
    *((_BYTE *)v4 + 88) |= 0x10u;
  }

LABEL_16:
  passThrough = self->_passThrough;
  if (passThrough)
  {
    PBDataWriterWriteStringField(v11, passThrough, 10LL);
    char v4 = v11;
  }
}

  if (self->_passThrough)
  {
    objc_msgSend(v6, "setPassThrough:");
    char v4 = v6;
  }
}
}

  uint64_t v18 = v10;

  return v18;
}

    v11 = 0;
    goto LABEL_17;
  }

  NSLog(@"WLDPlaybackManager: Feature disabled because TV app is not installed.");
  v11 = 0;
LABEL_19:

  return v11;
}

LABEL_8:
  uint64_t v15 = -[NSString copyWithZone:](self->_passThrough, "copyWithZone:", a3);
  char v16 = (void *)v5[9];
  v5[9] = v15;

  return v5;
}

LABEL_29:
  self->_cleanupTimeEpochMillis = *((void *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
LABEL_23:
    self->_contractOrTimed = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x10u;
  }

LABEL_24:
  if (*((void *)v4 + 9))
  {
    -[UWLLiveActivityEvent setPassThrough:](self, "setPassThrough:");
    char v4 = v10;
  }
}

LABEL_9:
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wlk_dictionaryForKey:", @"aps"));
      char v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "wlk_dictionaryForKey:", @"payload"));
      uint64_t v18 = objc_msgSend((id)objc_opt_class(self, v17), "_addMercurySilentNotifOfferSource:badgeId:", v16, v12);
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      char v20 = (void *)objc_claimAutoreleasedReturnValue(+[WLKOfferManager defaultOfferManager](&OBJC_CLASS___WLKOfferManager, "defaultOfferManager"));
      [v20 saveOffer:v19 completionHandler:0];

LABEL_12:
      break;
  }
}

    NSLog(@"WLDLivePlaybackReporter: User scrubbed beyond existing schedule end date, re-fetching schedule");
    self->_scheduleAlreadyFetchedAtBoundary = 1;
LABEL_13:
    unsigned int v17 = (void *)objc_opt_class(self, v15);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = __67__WLDLivePlaybackReporter__getScheduleWithPlaybackDate_completion___block_invoke;
    v18[3] = &unk_10003CF78;
    v18[4] = self;
    unint64_t v19 = v7;
    [v17 decorateSummary:v8 completion:v18];

    goto LABEL_14;
  }

  if (v11)
  {
    scheduleAlreadyFetchedAtBoundary = self->_scheduleAlreadyFetchedAtBoundary;

    if (!scheduleAlreadyFetchedAtBoundary) {
      goto LABEL_9;
    }
  }

  else
  {
  }

  NSLog(@"WLDLivePlaybackReporter: Returning existing schedule");
  char v16 = (void *)objc_claimAutoreleasedReturnValue(-[WLDLivePlaybackReporter schedule](self, "schedule"));
  (*((void (**)(id, void *, void))v7 + 2))(v7, v16, 0LL);

LABEL_14:
}

    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[WLKNotificationCenter defaultCenter](&OBJC_CLASS___WLKNotificationCenter, "defaultCenter"));
    [v17 setBadgeNumber:v12 withCompletionHandler:0];
  }

  return 0;
}
}
}

void sub_10000A498( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

BOOL WLDConnectionHasBoolValueForEntitlement(void *a1, uint64_t a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForEntitlement:a2]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  BOOL v5 = (objc_opt_isKindOfClass(v2, v4) & 1) != 0 && ([v2 BOOLValue] & 1) != 0;

  return v5;
}

uint64_t WLDBundleHasBoolValueForEntitlement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (![v3 isEqualToString:@"com.apple.tv"]
    || ([v4 isEqualToString:WLKEntitlementPlaybackReport] & 1) == 0)
  {
    id v16 = 0LL;
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithApplicationIdentifier:error:",  v3,  &v16));
    id v7 = v16;
    if (v7)
    {

      id v15 = 0LL;
      char v8 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v3,  0LL,  &v15));
      id v9 = v15;

      if (v9)
      {
        uint64_t v5 = 0LL;
LABEL_10:

        goto LABEL_11;
      }

      unint64_t v6 = v8;
    }

    else
    {
      char v8 = v6;
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 entitlements]);
    id v12 = objc_msgSend(v10, "objectForKey:ofClass:", v4, objc_opt_class(NSNumber, v11));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    uint64_t v5 = (uint64_t)[v13 BOOLValue];
    id v9 = 0LL;
    goto LABEL_10;
  }

  uint64_t v5 = 1LL;
LABEL_11:

  return v5;
}

BOOL MapEntryReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0LL;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0LL;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0LL;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t String = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v14 = 8LL;
LABEL_21:
        id v16 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        goto LABEL_23;
      }

      if ((PBReaderSkipValueWithTag(a2) & 1) == 0) {
        return 0LL;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }

    uint64_t v15 = PBReaderReadString(a2);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v15);
    uint64_t v14 = 16LL;
    goto LABEL_21;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000B6A0(_Unwind_Exception *a1)
{
}

void sub_10000B8E4(_Unwind_Exception *a1)
{
}

void sub_10000C520(_Unwind_Exception *a1)
{
}

void sub_10000C810(_Unwind_Exception *a1)
{
}

void sub_10000CBE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000D148(_Unwind_Exception *a1)
{
}

void sub_10000D28C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t UWLOptOutEventReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a2);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
      uint64_t v14 = *(void **)(a1 + 8);
      *(void *)(a1 + _Block_object_dispose(va, 8) = v13;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t UWLOptInEventReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t String = PBReaderReadString(a2);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
      uint64_t v14 = *(void **)(a1 + 8);
      *(void *)(a1 + _Block_object_dispose(va, 8) = v13;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000E748( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id WLDOperationQueue()
{
  if (WLDOperationQueue_onceToken != -1) {
    dispatch_once(&WLDOperationQueue_onceToken, &__block_literal_global_2);
  }
  return (id)WLDOperationQueue___opQueue;
}

id WLDDispatchQueue()
{
  if (WLDDispatchQueue_onceToken != -1) {
    dispatch_once(&WLDDispatchQueue_onceToken, &__block_literal_global_1);
  }
  return (id)WLDDispatchQueue___queue;
}

uint64_t UWLErrorResponseReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0LL;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v14;
    }

    else
    {
      uint64_t result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL UWLLiveActivityEventChannelReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0LL;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0LL;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0LL;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v6 >> 3))
      {
        case 1u:
          uint64_t String = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v14 = 16LL;
          goto LABEL_24;
        case 2u:
          uint64_t v15 = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v15);
          uint64_t v14 = 8LL;
          goto LABEL_24;
        case 3u:
          uint64_t v16 = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v16);
          uint64_t v14 = 24LL;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadString(a2);
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v17);
          uint64_t v14 = 32LL;
LABEL_24:
          uint64_t v18 = *(void **)(a1 + v14);
          *(void *)(a1 + v14) = v13;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag(a2) & 1) == 0) {
            return 0LL;
          }
LABEL_25:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t UWLMessageWireEnvelopeReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0LL;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_45;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_47;
          }
        }

        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_47:
        *(_DWORD *)(a1 + 4_Block_object_dispose(va, 8) = v14;
        goto LABEL_42;
      case 2u:
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___UWLMessageHeaders);
        objc_storeStrong((id *)(a1 + 8), v18);
        goto LABEL_41;
      case 3u:
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___UWLPlayEvent);
        [(id)a1 addPlayEvents:v18];
        goto LABEL_41;
      case 4u:
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___UWLOptInEvent);
        [(id)a1 addOptInEvents:v18];
        goto LABEL_41;
      case 5u:
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___UWLOptOutEvent);
        [(id)a1 addOptOutEvents:v18];
        goto LABEL_41;
      case 6u:
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___UWLLiveActivityEvent);
        [(id)a1 addLiveActivityEvents:v18];
        if (PBReaderPlaceMark(a2, v19) && (UWLLiveActivityEventReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_41:
          PBReaderRecallMark(a2, v19);

LABEL_42:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

LABEL_49:
        return 0LL;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_42;
    }
  }

void sub_100011E0C(_Unwind_Exception *a1)
{
}

void sub_100012F68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

LABEL_12:
  objc_initWeak(&location, v13);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = __59__WLDPlaybackReporter__reportPlayEvent_summary_completion___block_invoke;
  v33[3] = &unk_10003D270;
  objc_copyWeak(&v36, &location);
  v33[4] = self;
  char v27 = v9;
  unint64_t v34 = v27;
  char v28 = v10;
  char v35 = v28;
  unsigned int v29 = WLKPlaybackTrackingLogObject(-[WLDPlayActivityReportOperation setCompletionBlock:](v13, "setCompletionBlock:", v33));
  unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    char v39 = self;
    uint64_t v40 = 2048;
    uint64_t v41 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackReporter - %@ Queueing activity report: %p",  buf,  0x16u);
  }

  char v31 = WLDOperationQueue();
  char v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v32 addOperation:v13];

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void sub_10001358C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100013770(_Unwind_Exception *a1)
{
}

void sub_100013860(_Unwind_Exception *a1)
{
}

void sub_100013AB4(_Unwind_Exception *a1)
{
}

void sub_10001409C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_100014A8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, char a48)
{
}

void sub_100014D48(_Unwind_Exception *a1)
{
}

void sub_1000151A8(_Unwind_Exception *a1)
{
}

void sub_100015264(_Unwind_Exception *a1)
{
}

void sub_1000152E0(_Unwind_Exception *a1)
{
}

void sub_10001537C(_Unwind_Exception *a1)
{
}

void sub_100015410(_Unwind_Exception *a1)
{
}

void sub_100015494(_Unwind_Exception *a1)
{
}

void sub_1000156B4(_Unwind_Exception *a1)
{
}

void sub_100015860(_Unwind_Exception *a1)
{
}

void sub_100015B20(_Unwind_Exception *a1)
{
}

void sub_100015C54(_Unwind_Exception *a1)
{
}

void sub_100015FA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000161C4(_Unwind_Exception *a1)
{
}

void sub_100016DC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

LABEL_13:
      int v10 = (char *)v10 + 1;
    }

    while (v8 != v10);
    char v32 = [v59 countByEnumeratingWithState:&v75 objects:v81 count:16];
    char v8 = v32;
  }

  while (v32);
LABEL_30:

  uint64_t v70 = 0u;
  unint64_t v71 = 0u;
  unsigned int v69 = 0u;
  char v68 = 0u;
  unsigned int v33 = v56;
  unint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v34)
  {
    char v35 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v69 != v35) {
          objc_enumerationMutation(v33);
        }
        unsigned int v37 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
        NSLog(@"WLDPlaybackManager: Deleting invalid item: %@", v37);
        unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        [v38 removeItemAtURL:v37 error:0];
      }

      unint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v80 count:16];
    }

    while (v34);
  }

  char v39 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance"));
  uint64_t v40 = [v39 isNetworkReachable];

  if (v40)
  {
    unint64_t v66 = 0u;
    char v67 = 0u;
    unsigned int v64 = 0u;
    uint64_t v65 = 0u;
    uint64_t v41 = v50;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v79 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v65;
      do
      {
        for (j = 0LL; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v65 != v43) {
            objc_enumerationMutation(v41);
          }
          unint64_t v45 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)j);
          NSLog(@"WLDPlaybackManager: Found pending playback report. Enqueuing.");
          -[WLDPlaybackManager _enqueuePlaybackSummary:sessionID:serialize:]( obj,  "_enqueuePlaybackSummary:sessionID:serialize:",  v45,  @"DefaultPlaybackSessionID",  0LL);
        }

        uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v79 count:16];
      }

      while (v42);
    }
  }

  char v46 = obj;
  objc_sync_enter(v46);
  obj->_isReportScanningHappening = 0;
  objc_sync_exit(v46);

  objc_initWeak(&location, v46);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = __44__WLDPlaybackManager__scanForPendingReports__block_invoke_2;
  v61[3] = &unk_10003D650;
  objc_copyWeak(&v62, &location);
  v61[4] = v46;
  char v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v61));
  unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager queue](v46, "queue"));
  [v48 addOperation:v47];

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);

LABEL_48:
}

  return v5;
}

void sub_100017764( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id obj, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id location)
{
}

void sub_100017848( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = objc_autoreleasePoolPush();
  char v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  dispatch_source_set_event_handler(v4, &__block_literal_global_6);
  dispatch_resume(v4);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, &__block_literal_global_4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLDServer server](&OBJC_CLASS___WLDServer, "server"));
  [v5 start];

  objc_autoreleasePoolPop(v3);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v6 run];

  return 0;
}

void __main_block_invoke(id a1)
{
}

void __main_block_invoke_2(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(a2, _xpc_event_key_name));
  id v4 = (id)objc_claimAutoreleasedReturnValue(v2);
  NSLog(@"Got notifyd launch notification: %@", v4);
  if ([v4 isEqualToString:@"com.apple.VideoSubscriberAccount.DidRegisterSubscription"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLDServer server](&OBJC_CLASS___WLDServer, "server"));
    [v3 handleSubscriptionRegistration];
  }

  else if ([v4 isEqualToString:@"com.apple.AppleMediaServices.deviceOffersChanged"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLDServer server](&OBJC_CLASS___WLDServer, "server"));
    [v3 handleAMSDeviceOffer];
  }

  else if (([v4 isEqualToString:@"com.apple.VideosUI.StoreAcquisitionCrossProcessNotification"] & 1) != 0 || (objc_msgSend( v4,  "isEqualToString:",  @"com.apple.VideosUI.UpNextRequestDidFinishNotification") & 1) != 0 || objc_msgSend( v4,  "isEqualToString:",  @"com.apple.VideosUI.PlayHistoryUpdatedNotification"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLDServer server](&OBJC_CLASS___WLDServer, "server"));
    [v3 handleVideosUIInvalidationNotification:v4];
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[WLDServer server](&OBJC_CLASS___WLDServer, "server"));
    [v3 handleUNWidgetRegistration];
  }

LABEL_10:
}

LABEL_54:
  _Block_object_dispose(&v59, 8);
}

void sub_100019CDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

LABEL_95:
  BOOL v84 = os_variant_has_internal_content(v113);
  if ((v60 & (v84 ^ 1)) == 1)
  {
    uint64_t v85 = WLKPushNotificationsLogObject(v84);
    uint64_t v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Payload lacks a known category type.",  buf,  2u);
    }

    char v67 = 0;
  }

  v147 = 0LL;
  v148 = &v147;
  v149 = 0x2020000000LL;
  v87 = (uint64_t (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v150 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v154 = &unk_10003D8A0;
    v155 = &v147;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke((uint64_t)buf);
    v87 = (uint64_t (*)(void))v148[3];
  }

  _Block_object_dispose(&v147, 8);
  if (!v87)
  {
    v98 = dlerror();
    abort_report_np("%s", v98);
    __break(1u);
  }

  v88 = v87();
  if ((_DWORD)v88)
  {
    v89 = WLKPushNotificationsLogObject(v88);
    v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Buddy/OOB has not completed. Will drop notification",  buf,  2u);
    }

    goto LABEL_109;
  }

  if (!v67)
  {
LABEL_109:
    v94 = WLKPushNotificationsLogObject(v88);
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Discarding notification with inappropriate payload.",  buf,  2u);
    }

    v93 = (void *)v142[5];
    v142[5] = 0LL;
    goto LABEL_112;
  }

  v91 = objc_msgSend(v117, "wlk_BOOLForKey:defaultValue:", @"suppressIfTunedIn", 0);
  if ((v91 & 1) != 0)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[WLDPlaybackManager sharedManager](&OBJC_CLASS___WLDPlaybackManager, "sharedManager"));
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472LL;
    v123[2] = __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke;
    v123[3] = &unk_10003D828;
    v124 = v105;
    v125 = v104;
    v126 = self;
    v127 = v119;
    v128 = v112;
    v129 = v111;
    v130 = v114;
    v131 = v116;
    v132 = &v141;
    [v92 fetchDecoratedNowPlayingSummaries:v123];

    v93 = v124;
LABEL_112:

    goto LABEL_113;
  }

  v96 = WLKPushNotificationsLogObject(v91);
  v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v119;
    _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "WLDPushNotificationController - Will enqueue notification with action URL: %@",  buf,  0xCu);
  }

  if (v104) {
    -[WLDPushNotificationController _reportBulletinMetrics:](self, "_reportBulletinMetrics:", v104);
  }
  -[WLDPushNotificationController _postNotificationToUser:title:body:options:]( self,  "_postNotificationToUser:title:body:options:",  v112,  v111,  v114,  v116);
LABEL_113:

  _Block_object_dispose(&v141, 8);
}

void sub_10001BF30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_10001C3E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10001C69C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  unsigned int v5 = 0LL;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    __int128 v6 = off_10003D8C0;
    uint64_t v7 = 0LL;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen(&v6, &v5);
    id v3 = v5;
    uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (SetupAssistantLibraryCore_frameworkLibrary)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      id v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t UWLLiveActivityEventContentReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v14 = 24LL;
        goto LABEL_38;
      case 2u:
        uint64_t v16 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v16);
        uint64_t v14 = 16LL;
        goto LABEL_38;
      case 3u:
        uint64_t v17 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v17);
        uint64_t v14 = 32LL;
        goto LABEL_38;
      case 4u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0LL;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1LL || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v22 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0LL;
                goto LABEL_42;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0LL;
        }
LABEL_42:
        *(void *)(a1 + _Block_object_dispose(va, 8) = v20;
        continue;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)(a1 + 52) |= 2u;
        break;
      case 6u:
        uint64_t v28 = PBReaderReadString(a2);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v28);
        uint64_t v14 = 40LL;
LABEL_38:
        unsigned int v29 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        continue;
    }

    while (1)
    {
      unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1LL || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v27 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
      v25 |= (unint64_t)(v27 & 0x7F) << v23;
      if ((v27 & 0x80) == 0) {
        goto LABEL_44;
      }
      v23 += 7;
      BOOL v9 = v24++ >= 9;
      if (v9)
      {
        uint64_t v25 = 0LL;
        goto LABEL_46;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v25 = 0LL;
    }
LABEL_46:
    *(_BYTE *)(a1 + 4_Block_object_dispose(va, 8) = v25 != 0;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10001DDD0(_Unwind_Exception *a1)
{
}

void sub_10001DF38(_Unwind_Exception *a1)
{
}

uint64_t UWLMessageHeadersReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  char v4 = &selRef_setObject_forKey_;
  unsigned int v5 = &selRef_setObject_forKey_;
  while (2)
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v6 = 0;
    unsigned int v7 = 0;
    unint64_t v8 = 0LL;
    while (1)
    {
      unint64_t v9 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v9 == -1LL || v9 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v10 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v9);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v9 + 1;
      v8 |= (unint64_t)(v10 & 0x7F) << v6;
      if ((v10 & 0x80) == 0) {
        goto LABEL_12;
      }
      v6 += 7;
      BOOL v11 = v7++ >= 9;
      if (v11)
      {
        unint64_t v8 = 0LL;
        int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_14;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
    int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v8 = 0LL;
    }
LABEL_14:
    if (v12 || (v8 & 7) == 4) {
      return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v8 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v16 = *((int *)v4 + 753);
        goto LABEL_31;
      case 2u:
        uint64_t v17 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v17);
        uint64_t v16 = *((int *)v5 + 754);
        goto LABEL_31;
      case 3u:
        uint64_t v18 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v18);
        uint64_t v16 = 40LL;
        goto LABEL_31;
      case 4u:
        uint64_t v19 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v19);
        uint64_t v16 = 56LL;
        goto LABEL_31;
      case 6u:
        uint64_t v21 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v21);
        uint64_t v16 = 72LL;
        goto LABEL_31;
      case 7u:
        uint64_t v22 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v16 = 64LL;
        goto LABEL_31;
      case 8u:
        char v23 = v5;
        unsigned int v24 = v4;
        uint64_t v25 = objc_alloc_init(&OBJC_CLASS___MapEntry);
        [(id)a1 addCookies:v25];
        if (PBReaderPlaceMark(a2, v33) && MapEntryReadFrom((uint64_t)v25, a2))
        {
          PBReaderRecallMark(a2, v33);

          char v4 = v24;
          unsigned int v5 = v23;
LABEL_32:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0LL;
      case 0xBu:
        uint64_t v26 = PBReaderReadString(a2);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v26);
        uint64_t v16 = 24LL;
LABEL_31:
        char v27 = *(void **)(a1 + v16);
        *(void *)(a1 + v16) = v15;

        goto LABEL_32;
      case 0xCu:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0LL;
        *(_BYTE *)(a1 + 80) |= 1u;
        while (2)
        {
          unint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v31 == -1LL || v31 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v32 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              BOOL v11 = v29++ >= 9;
              if (v11)
              {
                LODWORD(v30) = 0;
                goto LABEL_44;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v30) = 0;
        }
LABEL_44:
        *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v30;
        goto LABEL_32;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_32;
    }
  }

LABEL_22:
    uint64_t v14 = 0;
  }

    unsigned int v7 = 0;
    goto LABEL_23;
  }

  if ((*((_BYTE *)v4 + 36) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_10:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_playheadInMilliseconds != *((void *)v4 + 2)) {
      goto LABEL_22;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_lengthInMilliseconds != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }

  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_22;
  }

  passThrough = self->_passThrough;
  else {
    unsigned int v7 = 1;
  }
LABEL_23:

  return v7;
}

LABEL_23:
  return v14;
}

void sub_1000208D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100020FF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_100021AF0(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_1000223DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

LABEL_7:
      unsigned int v7 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPlaybackNowPlayingObserver._updateTransactionState");
      transaction = self->_transaction;
      goto LABEL_8;
    }

    if (!transaction) {
      goto LABEL_7;
    }
  }

    uint64_t v16 = v12;
    objc_sync_enter(v16);
    -[NSMutableDictionary setObject:forKey:](v12->_lastSummaryDict, "setObject:forKey:", v11, v10);
    objc_sync_exit(v16);
LABEL_8:

    goto LABEL_9;
  }

  if (v13 && [v13 playbackState] == (id)1)
  {
    uint64_t v17 = WLKPlaybackTrackingLogObject(1LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "WLDPlaybackNowPlayingObserver - Generating stopped playback event",  v20,  2u);
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v13 elapsedTimeSummaryWithPlaybackState:0 timerDerived:0]);
    -[WLDPlaybackNowPlayingObserver _updateWithInfo:sessionID:](v12, "_updateWithInfo:sessionID:", v11, v10);
    if (v11) {
      goto LABEL_7;
    }
  }

void sub_100022A34(_Unwind_Exception *a1)
{
}

void sub_100022B3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100022E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000230B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100023478( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000235A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000237AC(_Unwind_Exception *a1)
{
}

id _BagObserverLog()
{
  if (_BagObserverLog_onceToken != -1) {
    dispatch_once(&_BagObserverLog_onceToken, &__block_literal_global_10);
  }
  return (id)_BagObserverLog_log;
}

LABEL_19:
        char v6 = v28;
        unint64_t v9 = v25;
        unint64_t v8 = v26;
        char v10 = v24;
      }
    }

    else
    {
      uint64_t v17 = 0LL;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  if (v17) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v17,  @"liveActivityAutostartAction");
  }
  -[WLDSportsLiveActivityPushHandler createLiveActivityForCanonicalId:supplementaryData:completion:]( self,  "createLiveActivityForCanonicalId:supplementaryData:completion:",  v8,  v9,  v6,  v23,  v24,  v25,  v26,  v27,  v28);
}

void sub_100024800( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_5:
  passThrough = self->_passThrough;
  if (passThrough) {
    [v3 setObject:passThrough forKey:@"pass_through"];
  }
  return v3;
}

  passThrough = self->_passThrough;
  if (passThrough)
  {
    PBDataWriterWriteStringField(v7, passThrough, 4LL);
    char v4 = v7;
  }
}

  if (self->_passThrough)
  {
    char v6 = v4;
    objc_msgSend(v4, "setPassThrough:");
    char v4 = v6;
  }
}

  unint64_t v8 = -[NSString copyWithZone:](self->_passThrough, "copyWithZone:", a3);
  unint64_t v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

  if (*((void *)v4 + 3))
  {
    char v6 = v4;
    -[UWLSectionInfo setPassThrough:](self, "setPassThrough:");
    char v4 = v6;
  }
}

uint64_t UWLSectionInfoReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1LL || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0LL;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0LL;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0LL;
        *(_BYTE *)(a1 + 36) |= 4u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1LL || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_43;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0LL;
            goto LABEL_45;
          }
        }

        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0LL;
        }
LABEL_45:
        *(_BYTE *)(a1 + 32) = v14 != 0;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0LL;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1LL || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v22 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0LL;
                goto LABEL_49;
              }

              continue;
            }
          }

          break;
        }

        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0LL;
        }
LABEL_49:
        uint64_t v30 = 16LL;
        goto LABEL_54;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0LL;
        *(_BYTE *)(a1 + 36) |= 1u;
        break;
      case 4u:
        uint64_t String = PBReaderReadString(a2);
        uint64_t v28 = objc_claimAutoreleasedReturnValue(String);
        unsigned int v29 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v28;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result) {
          return result;
        }
        continue;
    }

    while (1)
    {
      unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v25 == -1LL || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v26 = *(_BYTE *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
      v20 |= (unint64_t)(v26 & 0x7F) << v23;
      if ((v26 & 0x80) == 0) {
        goto LABEL_51;
      }
      v23 += 7;
      BOOL v9 = v24++ >= 9;
      if (v9)
      {
        uint64_t v20 = 0LL;
        goto LABEL_53;
      }
    }

    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_51:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v20 = 0LL;
    }
LABEL_53:
    uint64_t v30 = 8LL;
LABEL_54:
    *(void *)(a1 + v30) = v20;
  }

  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}