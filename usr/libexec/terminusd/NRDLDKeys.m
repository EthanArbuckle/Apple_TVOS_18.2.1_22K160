@interface NRDLDKeys
+ (BOOL)supportsSecureCoding;
- (NRDLDKeys)initWithCoder:(id)a3;
@end

@implementation NRDLDKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDLDKeys)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"remotePublicKey"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = [v8 length];
    if (v9) {
      v10 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v8 bytes],  v9);
    }
    else {
      v10 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v11 = v10;
  }

  else
  {
    v11 = 0LL;
  }

  if (self) {
    objc_storeStrong((id *)&self->_remotePublicKey, v11);
  }
  if (v7) {

  }
  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"localPublicKey"];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
    id v16 = [v15 length];
    if (v16) {
      v17 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v15 bytes],  v16);
    }
    else {
      v17 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v18 = v17;
  }

  else
  {
    v18 = 0LL;
  }

  if (self) {
    objc_storeStrong((id *)&self->_localPublicKey, v18);
  }
  if (v14) {

  }
  id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"localPrivateKey"];
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
    id v23 = [v22 length];
    if (v23) {
      v24 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v22 bytes],  v23);
    }
    else {
      v24 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v25 = v24;
  }

  else
  {
    v25 = 0LL;
  }

  if (self) {
    objc_storeStrong((id *)&self->_localPrivateKey, v25);
  }
  if (v21) {

  }
  id v26 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"sharedSecret"];
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
    id v30 = [v29 length];
    if (v30) {
      v31 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v29 bytes],  v30);
    }
    else {
      v31 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v32 = v31;
  }

  else
  {
    v32 = 0LL;
  }

  if (self) {
    objc_storeStrong((id *)&self->_sharedSecret, v32);
  }
  if (v28) {

  }
  id v33 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"dhLocalPublic"];
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = v34;
  if (v34)
  {
    id v36 = v34;
    id v37 = [v36 length];
    if (v37) {
      v38 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v36 bytes],  v37);
    }
    else {
      v38 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v39 = v38;
  }

  else
  {
    v39 = 0LL;
  }

  if (self) {
    objc_storeStrong((id *)&self->_dhLocalPublic, v39);
  }
  if (v35) {

  }
  id v40 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"dhLocalPrivate"];
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = v41;
  if (v41)
  {
    id v43 = v41;
    id v44 = [v43 length];
    if (v44) {
      v45 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v43 bytes],  v44);
    }
    else {
      v45 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v46 = v45;
  }

  else
  {
    v46 = 0LL;
  }

  if (self) {
    objc_storeStrong((id *)&self->_dhLocalPrivate, v46);
  }
  if (v42) {

  }
  return self;
}

- (void).cxx_destruct
{
}

@end