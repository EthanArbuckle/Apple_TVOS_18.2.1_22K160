@interface CKKSExternalKey
- (id)initWithViewName:(id)a3 tlk:(id)a4;
- (id)makeCKKSKey:(id)a3 contextID:(id)a4 error:(id *)a5;
- (id)makeFakeCKKSClassKey:(id)a3 contextID:(id)a4 zoneiD:(id)a5 error:(id *)a6;
@end

@implementation CKKSExternalKey

- (id)initWithViewName:(id)a3 tlk:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 parentKeyUUID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappedKeyData]);

  v11 = -[CKKSExternalKey initWithView:uuid:parentTLKUUID:keyData:]( self,  "initWithView:uuid:parentTLKUUID:keyData:",  v7,  v8,  v9,  v10);
  return v11;
}

- (id)makeCKKSKey:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc(&OBJC_CLASS___CKKSKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey keyData](self, "keyData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey uuid](self, "uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID"));
  if (v12)
  {
    v13 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:]( v9,  "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:",  v10,  v8,  v11,  v12,  @"tlk",  @"remote",  v7,  0LL,  0LL);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey uuid](self, "uuid"));
    v13 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:]( v9,  "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:",  v10,  v8,  v11,  v14,  @"tlk",  @"remote",  v7,  0LL,  0LL);
  }

  return v13;
}

- (id)makeFakeCKKSClassKey:(id)a3 contextID:(id)a4 zoneiD:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc(&OBJC_CLASS___CKKSKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey keyData](self, "keyData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey uuid](self, "uuid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-fake-%@",  v14,  v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSExternalKey parentKeyUUID](self, "parentKeyUUID"));
  v17 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:]( v12,  "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:",  v13,  v10,  v15,  v16,  v11,  @"remote",  v9,  0LL,  0LL);

  return v17;
}

@end