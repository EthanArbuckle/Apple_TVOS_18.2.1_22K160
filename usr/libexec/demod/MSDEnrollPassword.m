@interface MSDEnrollPassword
+ (id)sharedInstance;
- (id)createPasswordFor:(id)a3 pairingCode:(id)a4;
- (id)encodeBase64:(char *)a3 ofLength:(unsigned int)a4;
@end

@implementation MSDEnrollPassword

+ (id)sharedInstance
{
  if (qword_1001253E0 != -1) {
    dispatch_once(&qword_1001253E0, &stru_1000F9E40);
  }
  return (id)qword_1001253D8;
}

- (id)encodeBase64:(char *)a3 ofLength:(unsigned int)a4
{
  if (a4)
  {
    unsigned int v6 = (2 * ((2863311531u * (unint64_t)(a4 + 2)) >> 32)) & 0xFFFFFFFC;
    v7 = malloc((4 * ((a4 + 2) / 3)) | 1);
    v8 = v7;
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    do
    {
      int v11 = a3[v10] << 8;
      unsigned int v12 = v10 + 1;
      if (v10 + 1 < a4) {
        v11 |= a3[v12];
      }
      unint64_t v13 = (v11 << 8);
      if (v10 + 2 >= a4)
      {
        char v15 = 61;
      }

      else
      {
        int v14 = a3[v10 + 2];
        unint64_t v13 = v13 | v14;
        char v15 = aAbcdefghijklmn[v14 & 0x3F];
      }

      *((_BYTE *)v7 + v9 + 3) = v15;
      if (v12 >= a4) {
        char v16 = 61;
      }
      else {
        char v16 = aAbcdefghijklmn[(v13 >> 6) & 0x3F];
      }
      *((_BYTE *)v7 + v9 + 2) = v16;
      *((_BYTE *)v7 + v9 + 1) = aAbcdefghijklmn[(v13 >> 12) & 0x3F];
      *((_BYTE *)v7 + v9) = aAbcdefghijklmn[(unint64_t)v13 >> 18];
      v10 += 3;
      v9 += 4;
    }

    while (v10 < a4);
    *((_BYTE *)v7 + v6) = 0;
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v7,  4LL));
    free(v8);
  }

  else
  {
    v17 = &stru_1000FB848;
  }

  return v17;
}

- (id)createPasswordFor:(id)a3 pairingCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &unk_100124CB8,  216LL));
  id v9 = v7;
  id v10 = [v9 cStringUsingEncoding:4];
  id v11 = [v9 length];

  [v8 appendBytes:v10 length:v11];
  id v12 = v6;
  id v13 = [v12 cStringUsingEncoding:4];
  id v14 = [v12 length];

  [v8 appendBytes:v13 length:v14];
  char v15 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
  id v16 = v8;
  CC_SHA1([v16 bytes], (CC_LONG)objc_msgSend(v16, "length"), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDEnrollPassword encodeBase64:ofLength:](self, "encodeBase64:ofLength:", v15, 20LL));
  free(v15);

  return v17;
}

@end