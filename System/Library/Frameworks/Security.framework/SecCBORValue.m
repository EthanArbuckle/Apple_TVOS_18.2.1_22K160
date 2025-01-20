@interface SecCBORValue
- (int)fieldType;
- (unint64_t)getNumUintBytes:(unint64_t)a3;
- (unsigned)fieldValue;
- (void)encodeStartItems:(unint64_t)a3 output:(id)a4;
- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5;
- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5;
- (void)write:(id)a3;
@end

@implementation SecCBORValue

- (int)fieldType
{
  return -1;
}

- (unsigned)fieldValue
{
  return 32 * (-[SecCBORValue fieldType](self, "fieldType") & 7);
}

- (void)write:(id)a3
{
}

- (void)encodeStartItems:(unint64_t)a3 output:(id)a4
{
  id v6 = a4;
  -[SecCBORValue setUint:item2:output:]( self,  "setUint:item2:output:",  -[SecCBORValue fieldValue](self, "fieldValue"),  a3,  v6);
}

- (void)setAdditionalInformation:(unsigned __int8)a3 item2:(unsigned __int8)a4 output:(id)a5
{
  char v5 = a4 & 0x1F | a3;
  [a5 appendBytes:&v5 length:1];
}

- (void)setUint:(unsigned __int8)a3 item2:(unint64_t)a4 output:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  unint64_t v9 = -[SecCBORValue getNumUintBytes:](self, "getNumUintBytes:", a4);
  uint64_t v10 = 0LL;
  uint64_t v11 = 24LL;
  switch(v9)
  {
    case 0uLL:
      -[SecCBORValue setAdditionalInformation:item2:output:]( self,  "setAdditionalInformation:item2:output:",  v6,  a4,  v8);
      break;
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      uint64_t v11 = 25LL;
      uint64_t v10 = 1LL;
      goto LABEL_6;
    case 4uLL:
      uint64_t v11 = 26LL;
      uint64_t v10 = 3LL;
      goto LABEL_6;
    case 8uLL:
      uint64_t v11 = 27LL;
      uint64_t v10 = 7LL;
LABEL_6:
      -[SecCBORValue setAdditionalInformation:item2:output:]( self,  "setAdditionalInformation:item2:output:",  v6,  v11,  v8);
      uint64_t v12 = v10 + 1;
      char v13 = 8 * v10;
      do
      {
        char v15 = a4 >> (v13 & 0xF8);
        [v8 appendBytes:&v15 length:1];
        v13 -= 8;
      }

      while (v12-- > 1);
      break;
    default:
      break;
  }
}

- (unint64_t)getNumUintBytes:(unint64_t)a3
{
  unint64_t v3 = 1LL;
  uint64_t v4 = 2LL;
  uint64_t v5 = 8LL;
  if (!HIDWORD(a3)) {
    uint64_t v5 = 4LL;
  }
  if (a3 >= 0x10000) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0x100) {
    unint64_t v3 = v4;
  }
  if (a3 >= 0x18) {
    return v3;
  }
  else {
    return 0LL;
  }
}

@end