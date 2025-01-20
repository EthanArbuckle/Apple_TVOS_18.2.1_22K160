@interface ICDResponseDataParser
+ (id)_parseAuthorizedAccountTokenWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseBrowseListingWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseBulkCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseBulkCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseControlInterfacesResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseControlPromptResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseDeletedIDListingWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseDictionaryCollectionWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseEditCommandResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseErrorResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseItemIDArrayWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseItemsResponseWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5;
+ (id)_parseListingCollectionWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5;
+ (id)_parseListingItemWithBytes:(const char *)a3 length:(unsigned int)a4 usingHandler:(id)a5;
+ (id)_parseLoginResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parsePlayStatusResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unint64_t)a5 usingHandler:(id)a6;
+ (id)_parseUpdateResponseWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)_parseUpdateTypeWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)enumerateRawItemsInResponseData:(id)a3 usingHandler:(id)a4;
+ (id)parseErrorInResponseData:(id)a3;
+ (id)parseResponseData:(id)a3;
+ (unint64_t)_parseItemPropertyCountWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (unint64_t)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 valuesOut:(id *)a5 valuesCapacity:(unint64_t)a6;
+ (void)enumerateDeletedItemsInResponseData:(id)a3 usingHandler:(id)a4;
+ (void)enumerateItemsInResponseData:(id)a3 usingHandler:(id)a4;
+ (void)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5;
@end

@implementation ICDResponseDataParser

+ (id)parseErrorInResponseData:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 length];
  v6 = v5 - 8;
  v7 = v5;
  v8 = (unsigned int *)[v4 bytes];
  unsigned int v9 = bswap32(*v8);
  v10 = (char *)bswap32(v8[1]);
  if (v6 != v10)
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109632;
      v14[1] = v9;
      __int16 v15 = 2048;
      v16 = v7;
      __int16 v17 = 2048;
      v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning: Invalid response data (code: %08x, length: %lu, encodedLength: %lu)",  (uint8_t *)v14,  0x1Cu);
    }

    goto LABEL_8;
  }

  if (v9 != 1835364978)
  {
LABEL_8:
    v11 = 0LL;
    goto LABEL_9;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _parseErrorResponseWithBytes:v8 + 2 length:v10]);
LABEL_9:

  return v11;
}

+ (id)parseResponseData:(id)a3
{
  return [a1 enumerateRawItemsInResponseData:a3 usingHandler:0];
}

+ (id)enumerateRawItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (char *)[v6 length];
  unsigned int v9 = v8 - 8;
  if ((unint64_t)v8 < 8)
  {
LABEL_7:
    v14 = 0LL;
    goto LABEL_8;
  }

  v10 = v8;
  v11 = (unsigned int *)[v6 bytes];
  uint64_t v12 = bswap32(*v11);
  v13 = (char *)bswap32(v11[1]);
  if (v9 != v13)
  {
    __int16 v15 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109632;
      v17[1] = v12;
      __int16 v18 = 2048;
      v19 = v10;
      __int16 v20 = 2048;
      v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Warning: Invalid response data (code: %08x, length: %lu, encodedLength: %lu)",  (uint8_t *)v17,  0x1Cu);
    }

    goto LABEL_7;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _parseResponseCode:v12 bytes:v11 + 2 length:v13 usingHandler:v7]);
LABEL_8:

  return v14;
}

+ (unint64_t)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 valuesOut:(id *)a5 valuesCapacity:(unint64_t)a6
{
  unint64_t result = 0LL;
  if (a4 && a6)
  {
    unint64_t result = 0LL;
    p_var2 = &a5->var2;
    while (1)
    {
      unsigned int v9 = *(_DWORD *)a3;
      unsigned int v10 = *((_DWORD *)a3 + 1);
      v8 = a3 + 8;
      int v11 = bswap32(v9);
      unint64_t v12 = bswap32(v10);
      *((_DWORD *)p_var2 - 4) = v11;
      *(p_var2 - 1) = (unint64_t)v8;
      unint64_t *p_var2 = v12;
      if (v11 > 1634358883)
      {
        if (v11 > 1634953069)
        {
          if (v11 <= 1634956128)
          {
            if (v11 > 1634954338)
            {
              if (v11 != 1634954339)
              {
                uint64_t v13 = 2LL;
                unsigned __int16 v20 = 28789;
                goto LABEL_68;
              }
            }

            else if (v11 != 1634953070)
            {
              uint64_t v13 = 2LL;
              unsigned __int16 v20 = 27513;
LABEL_68:
              int v21 = v20 | 0x61730000;
              goto LABEL_69;
            }
          }

          else
          {
            if (v11 <= 1634956651)
            {
              unsigned int v17 = v11 - 1634956129;
              if (v17 <= 0x14)
              {
                uint64_t v13 = 2LL;
                if (((1 << v17) & 0x142805) != 0) {
                  goto LABEL_72;
                }
              }

              goto LABEL_70;
            }

            if (v11 != 1634956652 && v11 != 1835366516)
            {
              uint64_t v13 = 2LL;
              int v21 = 1835626093;
              goto LABEL_69;
            }
          }
        }

        else if (v11 <= 1634952044)
        {
          if ((v11 - 1634951521) > 0x11 || ((1 << (v11 - 97)) & 0x20801) == 0)
          {
            uint64_t v13 = 2LL;
            if (v11 == 1634358884) {
              goto LABEL_72;
            }
            int v19 = 1634366060;
LABEL_59:
            if (v11 == v19) {
              goto LABEL_60;
            }
            goto LABEL_70;
          }
        }

        else
        {
          if (v11 <= 1634952307)
          {
            unsigned int v15 = v11 - 1634952045;
            if (v15 <= 7)
            {
              uint64_t v13 = 2LL;
              if (((1 << v15) & 0x8B) != 0) {
                goto LABEL_72;
              }
            }

            goto LABEL_70;
          }

          if (v11 > 1634952560)
          {
            if (v11 != 1634952561)
            {
              uint64_t v13 = 2LL;
              unsigned __int16 v20 = 26221;
              goto LABEL_68;
            }
          }

          else if (v11 != 1634952308)
          {
            uint64_t v13 = 2LL;
            unsigned __int16 v20 = 25956;
            goto LABEL_68;
          }
        }
      }

      else if (v11 > 1634030159)
      {
        if (v11 <= 1634036069)
        {
          if (v11 > 1634031683)
          {
            if (v11 != 1634031684)
            {
              uint64_t v13 = 2LL;
              if (v11 == 1634034544) {
                goto LABEL_72;
              }
              unsigned __int16 v14 = 26220;
LABEL_58:
              int v19 = v14 | 0x61650000;
              goto LABEL_59;
            }
          }

          else if (v11 != 1634030160 && v11 != 1634030192)
          {
            uint64_t v13 = 2LL;
            unsigned __int16 v18 = 21326;
LABEL_54:
            int v21 = v18 | 0x61650000;
            goto LABEL_69;
          }
        }

        else if (v11 <= 1634354516)
        {
          if (v11 == 1634036070) {
            goto LABEL_60;
          }
          if (v11 != 1634037878)
          {
            uint64_t v13 = 2LL;
            int v21 = 1634169456;
LABEL_69:
            if (v11 == v21) {
              goto LABEL_72;
            }
LABEL_70:
            uint64_t v13 = 1LL;
            goto LABEL_72;
          }
        }

        else if (v11 > 1634356832)
        {
          if (v11 != 1634356833)
          {
            uint64_t v13 = 2LL;
            unsigned __int16 v16 = 20565;
            goto LABEL_65;
          }
        }

        else if (v11 != 1634354517)
        {
          uint64_t v13 = 2LL;
          unsigned __int16 v16 = 17779;
LABEL_65:
          int v21 = v16 | 0x616A0000;
          goto LABEL_69;
        }
      }

      else
      {
        if (v11 <= 1634026829)
        {
          if ((v11 - 1634026308) <= 0x31)
          {
            uint64_t v13 = 2LL;
            if (v11 == 1634026308)
            {
LABEL_60:
              uint64_t v13 = 3LL;
              goto LABEL_72;
            }
          }

          unsigned __int16 v14 = 17483;
          goto LABEL_58;
        }

        if (v11 > 1634029133)
        {
          if (v11 != 1634029134)
          {
            if (v11 == 1634029636) {
              goto LABEL_60;
            }
            uint64_t v13 = 2LL;
            unsigned __int16 v18 = 20580;
            goto LABEL_54;
          }
        }

        else if (v11 != 1634026830)
        {
          if (v11 == 1634027347) {
            goto LABEL_60;
          }
          uint64_t v13 = 2LL;
          unsigned __int16 v18 = 19800;
          goto LABEL_54;
        }
      }

      uint64_t v13 = 2LL;
LABEL_72:
      p_var2[1] = v13;
      ++result;
      a4 = a4 - 8 - v12;
      if (a4)
      {
        a3 = &v8[v12];
        p_var2 += 4;
        if (result < a6) {
          continue;
        }
      }

      return result;
    }
  }

  return result;
}

+ (void)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  if (a5)
  {
    v8 = (void (**)(id, void *, id, char *))a5;
    id v9 = [a1 _parseItemPropertyCountWithBytes:a3 length:a4];
    id v10 = v9;
    else {
      uint64_t v11 = (uint64_t)v9;
    }
    unint64_t v12 = &v13 - 4 * v11;
    [a1 parseItemWithBytes:a3 length:a4 valuesOut:v12 valuesCapacity:v9];
    v8[2](v8, v12, v10, (char *)&v13 + 7);
  }

+ (void)enumerateItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000F3E30;
    v9[3] = &unk_1001A6268;
    id v11 = a1;
    id v10 = v6;
    id v8 = [a1 enumerateRawItemsInResponseData:a3 usingHandler:v9];
  }
}

+ (void)enumerateDeletedItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = (char *)[v17 length];
    if ((unint64_t)v7 >= 9)
    {
      id v8 = v7;
      id v9 = (unsigned int *)[v17 bytes];
      unsigned int v10 = bswap32(*v9);
      if (v10 == 1634757753 || v10 == 1633968755)
      {
        unint64_t v12 = (unint64_t)(v8 - 8);
        if (v8 - 8 == (char *)bswap32(v9[1]))
        {
          if (v12 < 9)
          {
LABEL_13:
            unsigned __int16 v16 = 0LL;
          }

          else
          {
            uint64_t v13 = v9 + 2;
            while (1)
            {
              uint64_t v14 = bswap32(v13[1]);
              unsigned int v15 = v13 + 2;
              if (bswap32(*v13) == 1836409964) {
                break;
              }
              uint64_t v13 = (unsigned int *)((char *)v15 + v14);
              unint64_t v12 = v12 - v14 - 8;
              if (v12 <= 8) {
                goto LABEL_13;
              }
            }

            unsigned __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([a1 _parseDeletedIDListingWithBytes:v15 length:v14]);
          }

          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_1000F3E20;
          v18[3] = &unk_1001A6290;
          id v19 = v6;
          [v16 enumerateObjectsUsingBlock:v18];
        }
      }
    }
  }
}

+ (unint64_t)_parseItemPropertyCountWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t result = 0LL;
  if (a4)
  {
    do
    {
      uint64_t v5 = bswap32(*((_DWORD *)a3 + 1));
      ++result;
      a3 += v5 + 8;
      uint64_t v6 = a4 - v5;
      a4 = v6 - 8;
    }

    while (v6 != 8);
  }

  return result;
}

+ (id)_parseResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unint64_t)a5 usingHandler:(id)a6
{
  id v10 = a6;
  if ((int)a3 <= 1634757752)
  {
    if ((int)a3 > 1634026304)
    {
      if ((int)a3 <= 1634027330)
      {
        if (a3 == 1634026305)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseCloudArtworkInfoResponseWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        if (a3 == 1634026348)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseCloudLyricsInfoResponseWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        goto LABEL_44;
      }

      if (a3 != 1634027331)
      {
        if (a3 == 1634030667)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseAuthorizedAccountTokenWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        if (a3 == 1634356338)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseBulkCloudLyricsInfoResponseWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        goto LABEL_44;
      }

      goto LABEL_33;
    }

    if ((int)a3 > 1634025792)
    {
      if (a3 != 1634025793 && a3 != 1634025813)
      {
        if (a3 == 1634026066)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseBulkCloudArtworkInfoResponseWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        goto LABEL_44;
      }

      goto LABEL_33;
    }

    if (a3 == 1633841775) {
      goto LABEL_33;
    }
    int v12 = 1633968755;
    goto LABEL_32;
  }

  if ((int)a3 <= 1668117363)
  {
    if ((int)a3 > 1635148897)
    {
      if (a3 != 1635148898)
      {
        if (a3 == 1667326825)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseControlInterfacesResponseWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        if (a3 == 1668113264)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseControlPromptResponseWithBytes:a4 length:a5]);
          goto LABEL_34;
        }

        goto LABEL_44;
      }

      goto LABEL_33;
    }

    if (a3 == 1634757753) {
      goto LABEL_33;
    }
    int v12 = 1634759535;
LABEL_32:
    if (a3 != v12) {
      goto LABEL_44;
    }
    goto LABEL_33;
  }

  if ((int)a3 > 1835364977)
  {
    switch(a3)
    {
      case 0x6D657272u:
LABEL_47:
        uint64_t v13 = 0LL;
        goto LABEL_35;
      case 0x6D757064u:
        uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseUpdateResponseWithBytes:a4 length:a5]);
        goto LABEL_34;
      case 0x6D6C6F67u:
        uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _parseLoginResponseWithBytes:a4 length:a5]);
        goto LABEL_34;
    }

+ (id)_parseLoginResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!a4) {
    goto LABEL_14;
  }
  unint64_t v4 = a4;
  uint64_t v6 = 0LL;
  do
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1836282996) {
      goto LABEL_11;
    }
    if (v10 == 1835821412)
    {
      uint64_t v6 = bswap32(*((_DWORD *)a3 + 2));
      int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)unsigned int v20 = v6;
        uint64_t v13 = v12;
        uint64_t v14 = "Login session ID: %lu";
        uint32_t v15 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
      }
    }

    else
    {
      int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)unsigned int v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        *(_DWORD *)&v20[6] = HIWORD(v8);
        __int16 v21 = 1024;
        unsigned int v22 = v10 >> 8;
        __int16 v23 = 1024;
        int v24 = v9;
        uint64_t v13 = v12;
        uint64_t v14 = "Unhandled code in login response: %c%c%c%c";
        uint32_t v15 = 26;
        goto LABEL_9;
      }
    }

LABEL_11:
    uint64_t v16 = bswap32(v11);
    a3 += v16 + 8;
    unint64_t v4 = v4 - 8 - v16;
  }

  while (v4);
  if (!v6)
  {
LABEL_14:
    __int16 v17 = 0LL;
    return v17;
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
  return v17;
}

+ (id)_parseUpdateResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!a4) {
    goto LABEL_14;
  }
  unint64_t v4 = a4;
  uint64_t v6 = 0LL;
  do
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1836282996) {
      goto LABEL_11;
    }
    if (v10 == 1836413810)
    {
      uint64_t v6 = bswap32(*((_DWORD *)a3 + 2));
      int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = v6;
        uint64_t v13 = v12;
        uint64_t v14 = "Server revision number: %d";
        uint32_t v15 = 8;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
      }
    }

    else
    {
      int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v20 = v7;
        __int16 v21 = 1024;
        unsigned int v22 = HIWORD(v8);
        __int16 v23 = 1024;
        unsigned int v24 = v10 >> 8;
        __int16 v25 = 1024;
        int v26 = v9;
        uint64_t v13 = v12;
        uint64_t v14 = "Unhandled code in update response: %c%c%c%c";
        uint32_t v15 = 26;
        goto LABEL_9;
      }
    }

LABEL_11:
    uint64_t v16 = bswap32(v11);
    a3 += v16 + 8;
    unint64_t v4 = v4 - 8 - v16;
  }

  while (v4);
  if (!(_DWORD)v6)
  {
LABEL_14:
    __int16 v17 = 0LL;
    return v17;
  }

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  return v17;
}

+ (id)_parseAuthorizedAccountTokenWithBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      int v12 = a3 + 8;
      if (v10 <= 1634030674) {
        break;
      }
      if (v10 == 1634030675)
      {
        uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  bswap32(*((_DWORD *)a3 + 2))));
        uint64_t v14 = v6;
        uint32_t v15 = v13;
        uint64_t v16 = @"com.apple.itunes.drm-token-request-status";
LABEL_12:
        [v14 setObject:v15 forKey:v16];
        goto LABEL_13;
      }

      if (v10 != 1836282996) {
        goto LABEL_8;
      }
LABEL_14:
      a3 = &v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4) {
        return v6;
      }
    }

    if (v10 == 1634026578)
    {
      uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))
                        + *((unsigned __int8 *)a3 + 15)));
      uint64_t v14 = v6;
      uint32_t v15 = v13;
      uint64_t v16 = @"com.apple.itunes.drm-user-id";
      goto LABEL_12;
    }

    if (v10 == 1634030660)
    {
      uint64_t v13 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  a3 + 8,  v11,  0LL);
      uint64_t v14 = v6;
      uint32_t v15 = v13;
      uint64_t v16 = @"com.apple.itunes.drm-token-data";
      goto LABEL_12;
    }

+ (id)_parseBulkCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = 0LL;
  if (a4)
  {
    do
    {
      int v5 = *(unsigned __int8 *)a3;
      unsigned int v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v7 = *((unsigned __int8 *)a3 + 3);
      unsigned int v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      unsigned int v9 = *((_DWORD *)a3 + 1);
      int v10 = a3 + 8;
      unint64_t v11 = a4 - 8;
      if (v8 != 1836282996)
      {
        if (v8 == 1835819884)
        {
          int v12 = v4;
          unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:0]);
        }

        else
        {
          int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109888;
            int v17 = v5;
            __int16 v18 = 1024;
            unsigned int v19 = HIWORD(v6);
            __int16 v20 = 1024;
            unsigned int v21 = v8 >> 8;
            __int16 v22 = 1024;
            int v23 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in bulk cloud artwork info response: %c%c%c%c",  buf,  0x1Au);
          }
        }
      }

      uint64_t v13 = bswap32(v9);
      a3 = &v10[v13];
      a4 = v11 - v13;
    }

    while (v11 != v13);
  }

  return v4;
}

+ (id)_parseBulkCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = 0LL;
  if (a4)
  {
    do
    {
      int v5 = *(unsigned __int8 *)a3;
      unsigned int v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v7 = *((unsigned __int8 *)a3 + 3);
      unsigned int v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      unsigned int v9 = *((_DWORD *)a3 + 1);
      int v10 = a3 + 8;
      unint64_t v11 = a4 - 8;
      if (v8 != 1836282996)
      {
        if (v8 == 1835819884)
        {
          int v12 = v4;
          unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:0]);
        }

        else
        {
          int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109888;
            int v17 = v5;
            __int16 v18 = 1024;
            unsigned int v19 = HIWORD(v6);
            __int16 v20 = 1024;
            unsigned int v21 = v8 >> 8;
            __int16 v22 = 1024;
            int v23 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in bulk cloud lyrics info response: %c%c%c%c",  buf,  0x1Au);
          }
        }
      }

      uint64_t v13 = bswap32(v9);
      a3 = &v10[v13];
      a4 = v11 - v13;
    }

    while (v11 != v13);
  }

  return v4;
}

+ (id)_parseCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  for (id i = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        a4;
        a4 = a4 - 8 - v11)
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    int v12 = a3 + 8;
    if (v10 != 1836282996)
    {
      if (v10 == 1835295596)
      {
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 _parseDictionaryCollectionWithBytes:v12 length:v11]);
        if (v13) {
          [i addEntriesFromDictionary:v13];
        }
      }

      else
      {
        uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          int v17 = v7;
          __int16 v18 = 1024;
          unsigned int v19 = HIWORD(v8);
          __int16 v20 = 1024;
          unsigned int v21 = v10 >> 8;
          __int16 v22 = 1024;
          int v23 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in cloud artwork info response: %c%c%c%c",  buf,  0x1Au);
        }
      }
    }

    a3 = &v12[v11];
  }

  return i;
}

+ (id)_parseCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  for (id i = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        a4;
        a4 = a4 - 8 - v11)
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    int v12 = a3 + 8;
    if (v10 != 1836282996)
    {
      if (v10 == 1835295596)
      {
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 _parseDictionaryCollectionWithBytes:v12 length:v11]);
        if (v13) {
          [i addEntriesFromDictionary:v13];
        }
      }

      else
      {
        uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          int v17 = v7;
          __int16 v18 = 1024;
          unsigned int v19 = HIWORD(v8);
          __int16 v20 = 1024;
          unsigned int v21 = v10 >> 8;
          __int16 v22 = 1024;
          int v23 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in cloud artwork info response: %c%c%c%c",  buf,  0x1Au);
        }
      }
    }

    a3 = &v12[v11];
  }

  return i;
}

+ (id)_parseControlInterfacesResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = 0LL;
  if (a4)
  {
    while (1)
    {
      int v5 = *(unsigned __int8 *)a3;
      unsigned int v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v7 = *((unsigned __int8 *)a3 + 3);
      int v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      unsigned int v9 = *((_DWORD *)a3 + 1);
      unsigned int v10 = a3 + 8;
      unint64_t v11 = a4 - 8;
      if (v8 > 1836282995) {
        break;
      }
      if (v8 == 1835819884)
      {
        uint64_t v13 = v4;
        unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( [a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:0]);
        goto LABEL_13;
      }

      if (v8 != 1836213103) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v14 = bswap32(v9);
      a3 = &v10[v14];
      a4 = v11 - v14;
      if (v11 == v14) {
        return v4;
      }
    }

    if (v8 == 1836282996 || v8 == 1836344175) {
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      int v18 = v5;
      __int16 v19 = 1024;
      unsigned int v20 = HIWORD(v6);
      __int16 v21 = 1024;
      unsigned int v22 = v8 >> 8;
      __int16 v23 = 1024;
      int v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in control interfaces response: %c%c%c%c",  buf,  0x1Au);
    }

+ (id)_parseControlPromptResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      int v12 = a3 + 8;
      if (v10 == 1835295596) {
        break;
      }
      if (v10 != 1836282996)
      {
        if (v10 == 1835624804)
        {
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
          [v6 setObject:v13 forKey:@"dmap.itemid"];
        }

        else
        {
          uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109888;
            int v17 = v7;
            __int16 v18 = 1024;
            unsigned int v19 = HIWORD(v8);
            __int16 v20 = 1024;
            unsigned int v21 = v10 >> 8;
            __int16 v22 = 1024;
            int v23 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in control prompt response: %c%c%c%c",  buf,  0x1Au);
          }
        }

+ (id)_parseDeletedIDListingWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (a4 >= 9)
  {
    do
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      unsigned int v11 = *((_DWORD *)a3 + 1);
      if (v10 == 1835625572)
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))
                + *((unsigned __int8 *)a3 + 15)));
      }

      else
      {
        if (v10 != 1835624804)
        {
          uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v16[0] = 67109888;
            v16[1] = v7;
            __int16 v17 = 1024;
            unsigned int v18 = HIWORD(v8);
            __int16 v19 = 1024;
            unsigned int v20 = v10 >> 8;
            __int16 v21 = 1024;
            int v22 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in deleted item ID listing response: %c%c%c%c",  (uint8_t *)v16,  0x1Au);
          }

          goto LABEL_7;
        }

        uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
      }

      uint64_t v13 = (os_log_s *)v12;
      [v6 addObject:v12];
LABEL_7:
      uint64_t v14 = bswap32(v11);

      a3 += v14 + 8;
      a4 = a4 - 8 - v14;
    }

    while (a4 > 8);
  }

  return v6;
}

+ (id)_parseDictionaryCollectionWithBytes:(const char *)a3 length:(unint64_t)a4
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a4 >= 9)
  {
    unsigned int v6 = 0LL;
    int v7 = 0LL;
    while (1)
    {
      int v8 = *(unsigned __int8 *)a3;
      unsigned int v9 = (v8 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v10 = *((unsigned __int8 *)a3 + 3);
      int v11 = v10 | (*((unsigned __int8 *)a3 + 2) << 8) | v9;
      uint64_t v12 = bswap32(*((_DWORD *)a3 + 1));
      uint64_t v13 = a3 + 8;
      if (v11 > 1835297656)
      {
        if (v11 != 1835300460)
        {
          if (v11 != 1835297657)
          {
LABEL_16:
            uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109888;
              int v19 = v8;
              __int16 v20 = 1024;
              unsigned int v21 = HIWORD(v9);
              __int16 v22 = 1024;
              unsigned int v23 = v11 >> 8;
              __int16 v24 = 1024;
              int v25 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in dictionary collection: %c%c%c%c",  buf,  0x1Au);
            }

            goto LABEL_11;
          }

+ (id)_parseEditCommandResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      unsigned int v11 = *((_DWORD *)a3 + 1);
      if (v10 == 1835624804) {
        break;
      }
      if (v10 != 1836282996)
      {
        if (v10 == 1836413810)
        {
          uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
          uint64_t v13 = v6;
          uint64_t v14 = v12;
          id v15 = @"dmap.serverrevision";
          goto LABEL_7;
        }

        uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          __int16 v19 = 1024;
          unsigned int v20 = HIWORD(v8);
          __int16 v21 = 1024;
          unsigned int v22 = v10 >> 8;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in editing command response: %c%c%c%c",  (uint8_t *)v18,  0x1Au);
        }

+ (id)_parseUpdateTypeWithBytes:(const char *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    unsigned int v6 = 0LL;
    while (1)
    {
      unsigned int v7 = bswap32(*(_DWORD *)a3);
      uint64_t v8 = bswap32(*((_DWORD *)a3 + 1));
      int v9 = (unsigned __int8 *)(a3 + 8);
      if (v7 == 1836414073)
      {
        uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", *v9));

        unsigned int v6 = (void *)v11;
      }

      else if (v7 == 1633968755 || v7 == 1634759535)
      {
        id v12 = (id)objc_claimAutoreleasedReturnValue([a1 _parseUpdateTypeWithBytes:a3 + 8 length:v8]);
        goto LABEL_15;
      }

      a3 = (const char *)&v9[v8];
      unint64_t v4 = v4 - 8 - v8;
      if (!v4) {
        goto LABEL_14;
      }
    }
  }

  unsigned int v6 = 0LL;
LABEL_14:
  id v12 = v6;
  unsigned int v6 = v12;
LABEL_15:
  uint64_t v13 = v12;

  return v13;
}

+ (id)_parseItemsResponseWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  id v33 = a5;
  uint64_t v8 = 0LL;
  if (a4)
  {
    *(void *)&__int128 v7 = 67109120LL;
    __int128 v32 = v7;
    while (1)
    {
      int v9 = *(unsigned __int8 *)a3;
      unsigned int v10 = (v9 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v11 = *((unsigned __int8 *)a3 + 3);
      int v12 = v11 | (*((unsigned __int8 *)a3 + 2) << 8) | v10;
      unsigned int v13 = *((_DWORD *)a3 + 1);
      unint64_t v14 = a4 - 8;
      if (v12 > 1836213102)
      {
        if (v12 > 1836409963)
        {
          BOOL v17 = v12 == 1836409964 || v12 == 1836413810;
          int v18 = 1836414073;
        }

        else
        {
          if (v12 == 1836213103)
          {
            int v25 = *((unsigned __int8 *)a3 + 8);
            int v26 = *((unsigned __int8 *)a3 + 9);
            int v27 = *((unsigned __int8 *)a3 + 10);
            int v28 = *((unsigned __int8 *)a3 + 11);
            unsigned int v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v32;
              int v36 = (v25 << 24) | (v26 << 16) | (v27 << 8) | v28;
              unsigned int v22 = v20;
              __int16 v23 = "Returned count: %d";
              goto LABEL_36;
            }

            goto LABEL_38;
          }

          BOOL v17 = v12 == 1836282996;
          int v18 = 1836344175;
        }

        if (v17 || v12 == v18) {
          goto LABEL_39;
        }
        goto LABEL_30;
      }

      if (v12 <= 1633838957) {
        break;
      }
      if (v12 == 1633838958) {
        goto LABEL_20;
      }
      if (v12 != 1634025810)
      {
        if (v12 == 1835819884)
        {
          uint64_t v19 = objc_claimAutoreleasedReturnValue([a1 _parseListingCollectionWithBytes:a3 + 8 length:a4 - 8 usingHandler:v33]);
LABEL_21:
          unsigned int v20 = v8;
          uint64_t v8 = (os_log_s *)v19;
          goto LABEL_38;
        }

        goto LABEL_30;
      }

      unsigned int v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = bswap32(*((_DWORD *)a3 + 2));
        *(_DWORD *)buf = v32;
        int v36 = v29;
        unsigned int v22 = v20;
        __int16 v23 = "Authorized DSIDs revision code: %d";
LABEL_36:
        uint32_t v24 = 8;
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
      }

+ (id)_parseListingCollectionWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v20 = 0LL;
    if (!a4) {
      goto LABEL_16;
    }
  }

  else
  {
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (!a4) {
      goto LABEL_16;
    }
  }

  do
  {
    int v9 = *(unsigned __int8 *)a3;
    unsigned int v10 = (v9 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v11 = *((unsigned __int8 *)a3 + 3);
    unsigned int v12 = v11 | (*((unsigned __int8 *)a3 + 2) << 8) | v10;
    uint64_t v13 = bswap32(*((_DWORD *)a3 + 1));
    unint64_t v14 = a3 + 8;
    if (v12 == 1634025828 || v12 == 1835821428 || v12 == 1634036070)
    {
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 _parseListingItemWithBytes:v14 length:v13 usingHandler:v8]);
      if (!v8) {
        [v20 addObject:v17];
      }
    }

    else
    {
      BOOL v17 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        int v22 = v9;
        __int16 v23 = 1024;
        unsigned int v24 = HIWORD(v10);
        __int16 v25 = 1024;
        unsigned int v26 = v12 >> 8;
        __int16 v27 = 1024;
        int v28 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in listing collection response: %c%c%c%c",  buf,  0x1Au);
      }
    }

    a3 = &v14[v13];
    a4 = a4 - 8 - v13;
  }

  while (a4);
LABEL_16:

  return v20;
}

+ (id)_parseBrowseListingWithBytes:(const char *)a3 length:(unint64_t)a4
{
  for (id i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        a4;
        a4 = a4 - 8 - v11)
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    unsigned int v12 = a3 + 8;
    if (v10 == 1835821428)
    {
      uint64_t v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v12,  v11,  4LL);
      [i addObject:v13];
    }

    else
    {
      uint64_t v13 = (NSString *)os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        v15[0] = 67109888;
        v15[1] = v7;
        __int16 v16 = 1024;
        unsigned int v17 = HIWORD(v8);
        __int16 v18 = 1024;
        unsigned int v19 = v10 >> 8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in browse listing response: %c%c%c%c",  (uint8_t *)v15,  0x1Au);
      }
    }

    a3 = &v12[v11];
  }

  return i;
}

+ (id)_parseItemIDArrayWithBytes:(const char *)a3 length:(unint64_t)a4
{
  for (id i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        a4;
        a4 = a4 - 8 - v13)
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    unsigned int v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1835624804)
    {
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
      [i addObject:v12];
    }

    else
    {
      unsigned int v12 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15[0] = 67109888;
        v15[1] = v7;
        __int16 v16 = 1024;
        unsigned int v17 = HIWORD(v8);
        __int16 v18 = 1024;
        unsigned int v19 = v10 >> 8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in item ID array response: %c%c%c%c",  (uint8_t *)v15,  0x1Au);
      }
    }

    uint64_t v13 = bswap32(v11);

    a3 += v13 + 8;
  }

  return i;
}

+ (id)_parsePlayStatusResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a4)
  {
    while (1)
    {
      int v7 = *(unsigned __int8 *)a3;
      unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      int v9 = *((unsigned __int8 *)a3 + 3);
      int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
      unsigned int v12 = (unsigned __int8 *)(a3 + 8);
      if (v10 <= 1667330931) {
        break;
      }
      if (v10 <= 1667584372)
      {
        if (v10 > 1667331698)
        {
          if (v10 > 1667583312)
          {
            if (v10 != 1667583313)
            {
              if (v10 == 1667583569)
              {
                uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
                unint64_t v14 = v6;
                id v15 = v13;
                __int16 v16 = &off_1001B4408;
                goto LABEL_77;
              }

              goto LABEL_62;
            }

            uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *v12));
            unint64_t v14 = v6;
            id v15 = v13;
            __int16 v16 = &off_1001B43F0;
          }

          else
          {
            if (v10 != 1667331699)
            {
              if (v10 == 1667581779)
              {
                uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *v12));
                unint64_t v14 = v6;
                id v15 = v13;
                __int16 v16 = &off_1001B4528;
                goto LABEL_77;
              }

              goto LABEL_62;
            }

            uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *v12));
            unint64_t v14 = v6;
            id v15 = v13;
            __int16 v16 = &off_1001B4348;
          }
        }

        else if (v10 > 1667331682)
        {
          if (v10 != 1667331683)
          {
            if (v10 == 1667331685)
            {
              uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *v12));
              unint64_t v14 = v6;
              id v15 = v13;
              __int16 v16 = &off_1001B43C0;
              goto LABEL_77;
            }

            goto LABEL_62;
          }

          uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", *v12));
          unint64_t v14 = v6;
          id v15 = v13;
          __int16 v16 = &off_1001B4360;
        }

        else
        {
          if (v10 != 1667330932)
          {
            if (v10 == 1667330933)
            {
              uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *v12));
              unint64_t v14 = v6;
              id v15 = v13;
              __int16 v16 = &off_1001B4510;
              goto LABEL_77;
            }

            goto LABEL_62;
          }

          uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
          unint64_t v14 = v6;
          id v15 = v13;
          __int16 v16 = &off_1001B44F8;
        }

        goto LABEL_77;
      }

      if (v10 <= 1668113011)
      {
        if (v10 > 1668113004)
        {
          if (v10 != 1668113005)
          {
            if (v10 == 1668113011)
            {
              uint64_t v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3 + 8,  v11,  4LL);
              unint64_t v14 = v6;
              id v15 = v13;
              __int16 v16 = &off_1001B4450;
              goto LABEL_77;
            }

            goto LABEL_62;
          }

          uint64_t v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3 + 8,  v11,  4LL);
          unint64_t v14 = v6;
          id v15 = v13;
          __int16 v16 = &off_1001B4480;
        }

        else
        {
          if (v10 != 1667584373)
          {
            if (v10 == 1668112996)
            {
              uint64_t v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3 + 8,  v11,  4LL);
              unint64_t v14 = v6;
              id v15 = v13;
              __int16 v16 = &off_1001B4438;
              goto LABEL_77;
            }

            goto LABEL_62;
          }

          uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", *v12));
          unint64_t v14 = v6;
          id v15 = v13;
          __int16 v16 = &off_1001B43D8;
        }

        goto LABEL_77;
      }

      if (v10 <= 1668117361)
      {
        if (v10 != 1668113012)
        {
          if (v10 == 1668115819)
          {
            uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
            unint64_t v14 = v6;
            id v15 = v13;
            __int16 v16 = &off_1001B44B0;
            goto LABEL_77;
          }

          goto LABEL_62;
        }

        uint64_t v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3 + 8,  v11,  4LL);
        unint64_t v14 = v6;
        id v15 = v13;
        __int16 v16 = &off_1001B4468;
LABEL_77:
        [v14 setObject:v15 forKey:v16];
        goto LABEL_78;
      }

      if (v10 != 1836282996)
      {
        if (v10 == 1668117362)
        {
          uint64_t v13 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
          unint64_t v14 = v6;
          id v15 = v13;
          __int16 v16 = &off_1001B4288;
          goto LABEL_77;
        }

+ (id)_parseErrorResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  for (id i = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        a4;
        a4 = a4 - 8 - v11)
  {
    int v7 = *(unsigned __int8 *)a3;
    unsigned int v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    int v9 = *((unsigned __int8 *)a3 + 3);
    unsigned int v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    uint64_t v11 = bswap32(*((_DWORD *)a3 + 1));
    unsigned int v12 = a3 + 8;
    switch(v10)
    {
      case 0x61655243u:
        uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
        unint64_t v14 = i;
        id v15 = v13;
        __int16 v16 = &off_1001B45A0;
        break;
      case 0x6D737473u:
        uint64_t v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a3 + 8,  v11,  4LL);
        unint64_t v14 = i;
        id v15 = v13;
        __int16 v16 = &off_1001B4588;
        break;
      case 0x6D737474u:
        uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  bswap32(*((_DWORD *)a3 + 2))));
        unint64_t v14 = i;
        id v15 = v13;
        __int16 v16 = &off_1001B4570;
        break;
      default:
        uint64_t v13 = (NSString *)os_log_create("com.apple.amp.itunescloudd", "Default");
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          __int16 v19 = 1024;
          unsigned int v20 = HIWORD(v8);
          __int16 v21 = 1024;
          unsigned int v22 = v10 >> 8;
          __int16 v23 = 1024;
          int v24 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Unhandled code in play status response: %c%c%c%c",  (uint8_t *)v18,  0x1Au);
        }

        goto LABEL_9;
    }

    [v14 setObject:v15 forKey:v16];
LABEL_9:

    a3 = &v12[v11];
  }

  return i;
}

+ (id)_parseListingItemWithBytes:(const char *)a3 length:(unsigned int)a4 usingHandler:(id)a5
{
  id v7 = a5;
  unsigned int v8 = v7;
  if (v7)
  {
    (*((void (**)(id, const char *, void))v7 + 2))(v7, a3, a4);
    int v9 = 0LL;
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    while (a4)
    {
      unsigned int v10 = *(_DWORD *)a3;
      unsigned int v11 = *((_DWORD *)a3 + 1);
      unsigned int v12 = (unsigned __int8 *)(a3 + 8);
      unsigned int v13 = bswap32(v11);
      __int16 v19 = 0LL;
      id v20 = 0LL;
      sub_1000F1310(bswap32(v10), v12, v13, &v20, (const __CFString **)&v19);
      id v14 = v20;
      id v15 = v19;
      __int16 v16 = (__CFString *)v15;
      if (v14) {
        BOOL v17 = v15 == 0LL;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17) {
        [v9 setObject:v14 forKey:v15];
      }
      a3 = (const char *)&v12[v13];
      a4 = a4 - 8 - v13;
    }
  }

  return v9;
}

@end