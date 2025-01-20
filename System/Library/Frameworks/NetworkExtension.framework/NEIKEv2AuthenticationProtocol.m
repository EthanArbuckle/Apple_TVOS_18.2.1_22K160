@interface NEIKEv2AuthenticationProtocol
- (BOOL)isDigitalSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonStandard;
- (BOOL)isSecurePassword;
- (BOOL)isSignature;
- (NEIKEv2AuthenticationProtocol)initWithDigitalSignature:(unint64_t)a3;
- (NEIKEv2AuthenticationProtocol)initWithMethod:(unint64_t)a3;
- (NEIKEv2AuthenticationProtocol)initWithNonStandardDigitalSignature:(unint64_t)a3;
- (NEIKEv2AuthenticationProtocol)initWithSecurePassword:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)isECDSA;
- (uint64_t)isRSA;
- (unint64_t)digitalSignatureAlgorithm;
- (unint64_t)hash;
- (unint64_t)method;
- (unint64_t)securePasswordMethod;
@end

@implementation NEIKEv2AuthenticationProtocol

- (NEIKEv2AuthenticationProtocol)initWithMethod:(unint64_t)a3
{
  v3 = (os_log_s *)self;
  if (a3 == 14)
  {
    ne_log_obj();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_11;
    }

    *(_WORD *)buf = 0;
    v7 = "Cannot [NEIKEv2AuthenticationProtocol initWithMethod:DigitalSignature], use initWithDigitalSignature instead";
LABEL_13:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v6, OS_LOG_TYPE_FAULT, v7, buf, 2u);
    goto LABEL_8;
  }

  if (a3 == 12)
  {
    ne_log_obj();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v7 = "Cannot [NEIKEv2AuthenticationProtocol initWithMethod:GenericSecurePassword], use initWithSecurePassword instead";
    goto LABEL_13;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2AuthenticationProtocol;
  result = -[NEIKEv2AuthenticationProtocol init](&v8, sel_init);
  if (result)
  {
    result->_method = a3;
    return result;
  }

  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1876B1000, v3, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
  }

- (NEIKEv2AuthenticationProtocol)initWithDigitalSignature:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIKEv2AuthenticationProtocol;
  v4 = -[NEIKEv2AuthenticationProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = 14LL;
    v4->_digitalSignatureAlgorithm = a3;
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }

  return v5;
}

- (NEIKEv2AuthenticationProtocol)initWithSecurePassword:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIKEv2AuthenticationProtocol;
  v4 = -[NEIKEv2AuthenticationProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = 12LL;
    v4->_securePasswordMethod = a3;
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }

  return v5;
}

- (NEIKEv2AuthenticationProtocol)initWithNonStandardDigitalSignature:(unint64_t)a3
{
  if (a3 - 4 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v4 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:](self, "initWithDigitalSignature:");
    if (v4) {
      v4->_isNonStandard = 1;
    }
    self = v4;
    v3 = self;
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (id)description
{
  if (-[NEIKEv2AuthenticationProtocol method](self, "method") == 14)
  {
    BOOL v3 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
    id v4 = objc_alloc(NSString);
    String = NEIKEv2DigitalSignatureAlgorithmCreateString(-[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm"));
    v6 = String;
    if (v3) {
      uint64_t v7 = [v4 initWithFormat:@"DigitalSignatureNonStandard%@", String];
    }
    else {
      uint64_t v7 = [v4 initWithFormat:@"DigitalSignature%@", String];
    }
  }

  else
  {
    if (-[NEIKEv2AuthenticationProtocol method](self, "method") != 12)
    {
      v9 = (__CFString *)NEIKEv2AuthenticationMethodCreateString(-[NEIKEv2AuthenticationProtocol method](self, "method"));
      return v9;
    }

    id v8 = objc_alloc(NSString);
    v6 = (__CFString *)NEIKEv2SecurePasswordMethodCreateString(-[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod"));
    uint64_t v7 = [v8 initWithFormat:@"SecurePassword%@", v6];
  }

  v9 = (__CFString *)v7;

  return v9;
}

- (BOOL)isSignature
{
  unint64_t v2 = -[NEIKEv2AuthenticationProtocol method](self, "method");
  return (v2 > 0xD) | (0xFFAu >> v2) & 1;
}

- (BOOL)isDigitalSignature
{
  return -[NEIKEv2AuthenticationProtocol method](self, "method") == 14;
}

- (BOOL)isSecurePassword
{
  return -[NEIKEv2AuthenticationProtocol method](self, "method") == 12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = -[NEIKEv2AuthenticationProtocol method](self, "method");
    if (v6 == [v5 method]
      && (unint64_t v7 = -[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm"),
          v7 == [v5 digitalSignatureAlgorithm])
      && (unint64_t v8 = -[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod"),
          v8 == [v5 securePasswordMethod]))
    {
      BOOL v9 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
      int v10 = v9 ^ [v5 isNonStandard] ^ 1;
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NEIKEv2AuthenticationProtocol method](self, "method");
  unint64_t v4 = v3 + 10000 * -[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm");
  unint64_t v5 = v4 + 100000 * -[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod");
  BOOL v6 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
  uint64_t v7 = 100LL;
  if (!v6) {
    uint64_t v7 = 0LL;
  }
  return v5 + v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (-[NEIKEv2AuthenticationProtocol method](self, "method") == 14)
  {
    BOOL v5 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
    BOOL v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    unint64_t v7 = -[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm");
    if (v5) {
      return (id)[v6 initWithNonStandardDigitalSignature:v7];
    }
    else {
      return (id)[v6 initWithDigitalSignature:v7];
    }
  }

  else
  {
    unint64_t v9 = -[NEIKEv2AuthenticationProtocol method](self, "method");
    int v10 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    if (v9 == 12) {
      return (id)objc_msgSend( v10,  "initWithSecurePassword:",  -[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod"));
    }
    else {
      return (id)objc_msgSend(v10, "initWithMethod:", -[NEIKEv2AuthenticationProtocol method](self, "method"));
    }
  }

- (BOOL)isNonStandard
{
  return self->_isNonStandard;
}

- (unint64_t)method
{
  return self->_method;
}

- (unint64_t)digitalSignatureAlgorithm
{
  return self->_digitalSignatureAlgorithm;
}

- (unint64_t)securePasswordMethod
{
  return self->_securePasswordMethod;
}

- (uint64_t)isRSA
{
  if (result)
  {
    v1 = (void *)result;
    result = [(id)result method];
    if (result != 1)
    {
      if (result == 14)
      {
        unint64_t v2 = [v1 digitalSignatureAlgorithm];
        if (v2 <= 6 && ((1LL << v2) & 0x62) != 0) {
          return 1LL;
        }
      }

      uint64_t v3 = [v1 method];
      if (v3 == 245) {
        return 1LL;
      }
      else {
        return v3 == 14 && (unint64_t)([v1 digitalSignatureAlgorithm] - 9) < 3;
      }
    }
  }

  return result;
}

- (uint64_t)isECDSA
{
  if (result)
  {
    v1 = (void *)result;
    uint64_t v2 = [(id)result method];
    if ((unint64_t)(v2 - 9) >= 3)
    {
      if (v2 == 14)
      {
        unint64_t v3 = [v1 digitalSignatureAlgorithm];
        if (v3 >= 9) {
          return 0LL;
        }
        else {
          return (0x184u >> v3) & 1;
        }
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

@end