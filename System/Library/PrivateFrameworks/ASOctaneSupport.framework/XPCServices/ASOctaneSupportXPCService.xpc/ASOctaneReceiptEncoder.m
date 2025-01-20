@interface ASOctaneReceiptEncoder
- ($768B041D880118E78BC0C1763D5C08E1)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 UTF8String:(int64_t)a6;
- ($768B041D880118E78BC0C1763D5C08E1)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 data:(int64_t)a6;
- ($768B041D880118E78BC0C1763D5C08E1)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 integer:(int64_t)a6;
- ($E570233E5C131744623CAF595F5D8D88)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 IA5String:(int64_t)a6;
- (ASOctaneReceiptEncoder)initWithBundleID:(id)a3 bundleVersion:(id)a4 deviceID:(id)a5 transactions:(id)a6;
- (NSArray)transactions;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)deviceID;
- (id)_dateFormatter;
- (id)_encodePayload;
- (id)_encodePayloadForIAPReceipt:(id)a3;
- (id)_smallestInt:(int64_t)a3;
- (id)encodeAndSignWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
@end

@implementation ASOctaneReceiptEncoder

- (ASOctaneReceiptEncoder)initWithBundleID:(id)a3 bundleVersion:(id)a4 deviceID:(id)a5 transactions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ASOctaneReceiptEncoder;
  v15 = -[ASOctaneReceiptEncoder init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleID, a3);
    objc_storeStrong((id *)&v16->_bundleVersion, a4);
    objc_storeStrong((id *)&v16->_deviceID, a5);
    objc_storeStrong((id *)&v16->_transactions, a6);
  }

  return v16;
}

- (id)_dateFormatter
{
  if (qword_1002BAF30 != -1) {
    dispatch_once(&qword_1002BAF30, &stru_10026F850);
  }
  return (id)qword_1002BAF28;
}

- (id)encodeAndSignWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _encodePayload](self, "_encodePayload", a3, a4));
  CMSEncoderRef cmsEncoderOut = 0LL;
  CMSEncoderCreate(&cmsEncoderOut);
  CMSEncoderSetSignerAlgorithm(cmsEncoderOut, kCMSEncoderDigestAlgorithmSHA256);
  CMSEncoderAddSigners(cmsEncoderOut, a3);
  v6 = cmsEncoderOut;
  id v7 = v5;
  CMSEncoderUpdateContent(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  CFDataRef encodedContentOut = 0LL;
  OSStatus v8 = CMSEncoderCopyEncodedContent(cmsEncoderOut, &encodedContentOut);
  if (v8)
  {
    v9 = (__CFString *)SecCopyErrorMessageString(v8, 0LL);
    NSLog(@"Error encoding and signing content: %@", v9);
  }

  CFDataRef v10 = encodedContentOut;
  CFRelease(cmsEncoderOut);

  return v10;
}

- (id)_encodePayload
{
  SecAsn1CoderRef coder = 0LL;
  SecAsn1CoderCreate(&coder);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder transactions](self, "transactions"));
  v4 = malloc(8 * (void)[v3 count] + 160);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder transactions](self, "transactions"));
  bzero(v4, 8 * (void)[v5 count] + 160);

  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:]( self,  "_receiptAttributeWithCoder:type:version:UTF8String:",  coder,  0LL,  1LL,  "Xcode");
  void *v4 = &v54;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:integer:]( self,  "_receiptAttributeWithCoder:type:version:integer:",  coder,  1LL,  1LL,  0LL);
  v4[1] = &v53;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:]( self,  "_receiptAttributeWithCoder:type:version:UTF8String:",  coder,  2LL,  1LL,  -[NSString UTF8String](self->_bundleID, "UTF8String"));
  v4[2] = &v50;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:]( self,  "_receiptAttributeWithCoder:type:version:UTF8String:",  coder,  3LL,  1LL,  -[NSString UTF8String](self->_bundleVersion, "UTF8String"));
  v4[3] = &v49;
  uint64_t v6 = arc4random();
  unint64_t v48 = arc4random() | (unint64_t)(16 * v6);
  uint64_t v7 = 8LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v48, 8LL));
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:data:]( self,  "_receiptAttributeWithCoder:type:version:data:",  coder,  4LL,  1LL,  v8);
  v4[4] = &v47;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder deviceID](self, "deviceID"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 stringByReplacingOccurrencesOfString:@"-" withString:&stru_100294B70]);

  v39 = (void *)v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData oct_dataWithHexString:](&OBJC_CLASS___NSMutableData, "oct_dataWithHexString:", v10));
  v40 = (void *)v8;
  [v11 appendData:v8];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v52, v51));
  [v11 appendData:v12];

  id v38 = v11;
  CC_SHA1([v38 bytes], (CC_LONG)objc_msgSend(v38, "length"), md);
  SecAsn1CoderRef v13 = coder;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL));
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:data:]( self,  "_receiptAttributeWithCoder:type:version:data:",  v13,  5LL,  1LL,  v14);

  v4[5] = &v46;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  coder,  8LL,  1LL,  "");
  v4[6] = &v45;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _dateFormatter](self, "_dateFormatter"));
  SecAsn1CoderRef v16 = coder;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v18 = objc_claimAutoreleasedReturnValue([v15 stringFromDate:v17]);
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  v16,  12,  1,  [v18 UTF8String]);

  v4[7] = &v44;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder transactions](self, "transactions"));
  v20 = malloc(48 * (void)[v19 count]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder transactions](self, "transactions"));
  id v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = 8LL;
    v24 = v20;
    do
    {
      v25 = objc_autoreleasePoolPush();
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder transactions](self, "transactions"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:v23 - 8]);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _encodePayloadForIAPReceipt:](self, "_encodePayloadForIAPReceipt:", v27));
      -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:data:]( self,  "_receiptAttributeWithCoder:type:version:data:",  coder,  17LL,  1LL,  v28);
      __int128 v29 = v43[1];
      _OWORD *v24 = v43[0];
      v24[1] = v29;
      v24[2] = v43[2];
      v4[v23] = v24;
      LODWORD(v7) = v23 + 1;

      objc_autoreleasePoolPop(v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder transactions](self, "transactions"));
      id v31 = [v30 count];

      v24 += 3;
      unint64_t v32 = v23 - 7;
      ++v23;
    }

    while ((unint64_t)v31 > v32);
    uint64_t v7 = v7;
  }

  SecAsn1CoderRef v33 = coder;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  id v35 = objc_claimAutoreleasedReturnValue([v15 stringFromDate:v34]);
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  v33,  21,  1,  [v35 UTF8String]);

  v4[v7] = v43;
  dest.Data = 0LL;
  src = v4;
  dest.Length = 0LL;
  SecAsn1EncodeItem(coder, &src, (const SecAsn1Template *)&unk_10026F870, &dest);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", dest.Data, dest.Length));
  SecAsn1CoderRelease(coder);
  if (v20) {
    free(v20);
  }
  free(v4);

  return v36;
}

- (id)_encodePayloadForIAPReceipt:(id)a3
{
  SecAsn1CoderRef coder = 0LL;
  id v4 = a3;
  SecAsn1CoderCreate(&coder);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"quantity"]);
  id v6 = [v5 integerValue];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"productID"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"transactionID"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"originalTransactionDate"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"originalTransactionID"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"purchaseDate"]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"subscriptionExpirationDate"]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"introPeriod"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"cancellationDate"]);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v44 = 0u;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:integer:]( self,  "_receiptAttributeWithCoder:type:version:integer:",  coder,  1701LL,  1LL,  v6);
  v43[0] = &v41;
  SecAsn1CoderRef v13 = coder;
  id v28 = v7;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:]( self,  "_receiptAttributeWithCoder:type:version:UTF8String:",  v13,  1702,  1,  [v28 UTF8String]);
  v43[1] = &v40;
  SecAsn1CoderRef v14 = coder;
  id v27 = v8;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:]( self,  "_receiptAttributeWithCoder:type:version:UTF8String:",  v14,  1703,  1,  [v27 UTF8String]);
  v43[2] = &v39;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _dateFormatter](self, "_dateFormatter"));
  SecAsn1CoderRef v16 = coder;
  id v17 = objc_claimAutoreleasedReturnValue([v15 stringFromDate:v9]);
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  v16,  1704,  1,  [v17 UTF8String]);

  _OWORD v43[3] = &v38;
  if (v10)
  {
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:]( self, "_receiptAttributeWithCoder:type:version:UTF8String:", coder, 1705, 1, [v10 UTF8String]);
    *(void *)&__int128 v44 = &v37;
    int v18 = 5;
  }

  else
  {
    int v18 = 4;
  }

  if (v11)
  {
    SecAsn1CoderRef v19 = coder;
    id v20 = objc_claimAutoreleasedReturnValue([v15 stringFromDate:v11]);
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  v19,  1706,  1,  [v20 UTF8String]);

    v43[v18++] = &v36;
  }

  if (v30)
  {
    SecAsn1CoderRef v21 = coder;
    id v22 = objc_claimAutoreleasedReturnValue([v15 stringFromDate:v30]);
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  v21,  1708,  1,  [v22 UTF8String]);

    v43[v18++] = &v35;
  }

  if (v12)
  {
    SecAsn1CoderRef v23 = coder;
    id v24 = objc_claimAutoreleasedReturnValue([v15 stringFromDate:v12]);
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:]( self,  "_receiptAttributeWithCoder:type:version:IA5String:",  v23,  1712,  1,  [v24 UTF8String]);

    v43[v18++] = &v34;
  }

  if (v29)
  {
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:integer:]( self,  "_receiptAttributeWithCoder:type:version:integer:",  coder,  1719,  1,  [v29 BOOLValue]);
    v43[v18] = &v33;
  }

  dest.Data = 0LL;
  src = v43;
  dest.Length = 0LL;
  SecAsn1EncodeItem(coder, &src, (const SecAsn1Template *)&unk_10026F870, &dest);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", dest.Data, dest.Length));
  SecAsn1CoderRelease(coder);

  return v25;
}

- ($E570233E5C131744623CAF595F5D8D88)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 IA5String:(int64_t)a6
{
  dest.Length = 0LL;
  dest.Data = 0LL;
  v15.Length = 0LL;
  v15.Data = 0LL;
  size_t v12 = strlen(a7);
  SecAsn1AllocCopy(a4, a7, v12, &dest);
  SecAsn1EncodeItem(a4, &dest, kSecAsn1IA5StringTemplate, &v15);
  SecAsn1CoderRef v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v15.Data, v15.Length));
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:data:]( self,  "_receiptAttributeWithCoder:type:version:data:",  a4,  a5,  a6,  v13);

  return result;
}

- ($768B041D880118E78BC0C1763D5C08E1)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 UTF8String:(int64_t)a6
{
  dest.Length = 0LL;
  dest.Data = 0LL;
  v15.Length = 0LL;
  v15.Data = 0LL;
  size_t v12 = strlen(a7);
  SecAsn1AllocCopy(a4, a7, v12, &dest);
  SecAsn1EncodeItem(a4, &dest, kSecAsn1UTF8StringTemplate, &v15);
  SecAsn1CoderRef v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v15.Data, v15.Length));
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:data:]( self,  "_receiptAttributeWithCoder:type:version:data:",  a4,  a5,  a6,  v13);

  return result;
}

- ($768B041D880118E78BC0C1763D5C08E1)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 integer:(int64_t)a6
{
  dest.Length = 0LL;
  dest.Data = 0LL;
  v14.Length = 0LL;
  v14.Data = 0LL;
  id v11 = objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _smallestInt:](self, "_smallestInt:", a7));
  SecAsn1AllocCopy(a4, [v11 bytes], (size_t)objc_msgSend(v11, "length"), &dest);
  SecAsn1EncodeItem(a4, &dest, kSecAsn1IntegerTemplate, &v14);
  size_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v14.Data, v14.Length));
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:data:]( self,  "_receiptAttributeWithCoder:type:version:data:",  a4,  a5,  a6,  v12);

  return result;
}

- ($768B041D880118E78BC0C1763D5C08E1)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 data:(int64_t)a6
{
  dest.Length = 0LL;
  dest.Data = 0LL;
  v21.Length = 0LL;
  v21.Data = 0LL;
  SecAsn1Item v20 = (SecAsn1Item)0LL;
  id v12 = a7;
  id v13 = objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _smallestInt:](self, "_smallestInt:", a5));
  SecAsn1AllocCopy(a4, [v13 bytes], (size_t)objc_msgSend(v13, "length"), &dest);
  id v14 = objc_claimAutoreleasedReturnValue(-[ASOctaneReceiptEncoder _smallestInt:](self, "_smallestInt:", a6));
  SecAsn1AllocCopy(a4, [v14 bytes], (size_t)objc_msgSend(v14, "length"), &v21);
  id v15 = v12;
  id v16 = [v15 bytes];
  id v17 = [v15 length];

  SecAsn1AllocCopy(a4, v16, (size_t)v17, &v20);
  cssm_data v18 = v21;
  retstr->var0 = dest;
  retstr->var1 = v18;
  retstr->var2 = v20;

  return result;
}

- (id)_smallestInt:(int64_t)a3
{
  unint64_t v9 = bswap64(a3);
  v3 = &v9;
  unsigned int v4 = v9;
  if ((_BYTE)v9)
  {
    int v5 = 8;
LABEL_3:
    unsigned int v6 = v5 + (v4 >> 7);
    uint64_t v7 = v3;
  }

  else
  {
    unsigned int v6 = 8;
    uint64_t v7 = &v9;
    while (1)
    {
      int v5 = v6 - 1;
      if (v6 == 1) {
        break;
      }
      v3 = (unint64_t *)((char *)v7 + 1);
      unsigned int v4 = *((char *)v7 + 1);
      if ((v4 & 0x80000000) != 0) {
        return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v7,  v6));
      }
      uint64_t v7 = (unint64_t *)((char *)v7 + 1);
      --v6;
      unsigned int v4 = v4;
      if ((_BYTE)v4) {
        goto LABEL_3;
      }
    }

    uint64_t v7 = (unint64_t *)((char *)&v9 + 7);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v7,  v6));
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void).cxx_destruct
{
}

@end