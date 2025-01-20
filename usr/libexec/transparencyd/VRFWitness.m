@interface VRFWitness
+ (id)descriptor;
- (NSData)message;
- (TransparencyVRFVerifier)verifier;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setMessage:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation VRFWitness

+ (id)descriptor
{
  id result = (id)qword_1002EE938;
  if (!qword_1002EE938)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___VRFWitness,  @"VRFWitness",  &unk_1002E4B60,  &off_1002E4B00,  3LL,  24LL,  v3);
    qword_1002EE938 = (uint64_t)result;
  }

  return result;
}

- (TransparencyVRFVerifier)verifier
{
  return (TransparencyVRFVerifier *)objc_getAssociatedObject(self, @"verifier");
}

- (void)setVerifier:(id)a3
{
}

- (NSData)message
{
  return (NSData *)objc_getAssociatedObject(self, @"message");
}

- (void)setMessage:(id)a3
{
}

- (id)diagnosticsJsonDictionary
{
  v12[0] = @"type";
  unint64_t v3 = VRFType_EnumDescriptor();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textFormatNameForValue:", -[VRFWitness type](self, "type")));
  v13[0] = v5;
  v12[1] = @"output";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness output](self, "output"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
  v13[1] = v7;
  v12[2] = @"proof";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness proof](self, "proof"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));

  return v10;
}

- (unint64_t)verifyWithError:(id *)a3
{
  unsigned int v5 = -[VRFWitness type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness verifier](self, "verifier"));
  unsigned int v7 = [v6 vrfType];

  if (v5 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness verifier](self, "verifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness message](self, "message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness output](self, "output"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness proof](self, "proof"));
    unsigned __int8 v12 = [v8 verifyMessage:v9 salt:0 output:v10 proof:v11 error:a3];

    if ((v12 & 1) != 0)
    {
      return 1LL;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VRFWitness verifier](self, "verifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 key]);
      unsigned int v18 = [v17 needsRefresh];

      if (v18) {
        return 2LL;
      }
      else {
        return 0LL;
      }
    }
  }

  else
  {
    if (a3)
    {
      v14 = +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -55LL,  @"Unknown VRF algorithm used for VRF witness: %d",  VRFWitness_Type_RawValue((uint64_t)self));
      *a3 = (id)objc_claimAutoreleasedReturnValue(v14);
    }

    if (qword_1002EEED0 != -1) {
      dispatch_once(&qword_1002EEED0, &stru_100289A00);
    }
    v15 = (os_log_s *)qword_1002EEED8;
    if (os_log_type_enabled((os_log_t)qword_1002EEED8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Unknown VRF algorithm used for VRF witness",  buf,  2u);
    }

    return 0LL;
  }

@end