@interface SPAKE2Verifier
+ (id)generateCodeWithError:(id *)a3;
- (BOOL)isVerified;
- (BOOL)processMsg1:(id)a3 error:(id *)a4;
- (BOOL)processMsg2:(id)a3 error:(id *)a4;
- (SPAKE2Common)common;
- (SPAKE2Verifier)initWithSalt:(id)a3 code:(id)a4 error:(id *)a5;
- (id)decryptMessage:(id)a3 error:(id *)a4;
- (id)encryptMessage:(id)a3 error:(id *)a4;
- (id)getCode;
- (id)getKey;
- (id)getMsg1WithError:(id *)a3;
- (id)getMsg2WithError:(id *)a3;
- (void)setCommon:(id)a3;
@end

@implementation SPAKE2Verifier

+ (id)generateCodeWithError:(id *)a3
{
  v4 = (void *)SecPasswordCreateWithRandomDigits();
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else if (a3)
  {
    *a3 = 0LL;
  }

  return v5;
}

- (SPAKE2Verifier)initWithSalt:(id)a3 code:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SPAKE2Verifier;
  v10 = -[SPAKE2Verifier init](&v18, sel_init);
  if (!v10) {
    goto LABEL_4;
  }
  v11 = -[SPAKE2Common initWithSalt:code:](objc_alloc(&OBJC_CLASS___SPAKE2Common), "initWithSalt:code:", v8, v9);
  -[SPAKE2Verifier setCommon:](v10, "setCommon:", v11);
  v12 = -[SPAKE2Verifier common](v10, "common");
  int v13 = [v12 generateStateWithError:a5];

  if (!v13) {
    goto LABEL_5;
  }
  v14 = -[SPAKE2Verifier common](v10, "common");
  int v15 = [v14 setupVerifier:a5];

  if (v15) {
LABEL_4:
  }
    v16 = v10;
  else {
LABEL_5:
  }
    v16 = 0LL;

  return v16;
}

- (id)getCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 code];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getMsg1WithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getMsg1WithError:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)processMsg1:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[SPAKE2Verifier common](self, "common");
  LOBYTE(a4) = [v7 processMsg1:v6 error:a4];

  return (char)a4;
}

- (id)getMsg2WithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 getMsg2WithError:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)processMsg2:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[SPAKE2Verifier common](self, "common");
  LOBYTE(a4) = [v7 processMsg2:v6 error:a4];

  return (char)a4;
}

- (BOOL)isVerified
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isVerified];

  return v3;
}

- (id)getKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 getKey];
  char v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)encryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[SPAKE2Verifier common](self, "common");
  [v7 encryptMessage:v6 error:a4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[SPAKE2Verifier common](self, "common");
  [v7 decryptMessage:v6 error:a4];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SPAKE2Common)common
{
  return (SPAKE2Common *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setCommon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end