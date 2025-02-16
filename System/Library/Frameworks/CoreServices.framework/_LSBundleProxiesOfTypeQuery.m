@interface _LSBundleProxiesOfTypeQuery
+ (BOOL)supportsSecureCoding;
+ (id)queryWithType:(unint64_t)a3;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)bundleUnitMeetsRequirements:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5;
- (BOOL)isEqual:(id)a3;
- (_LSBundleProxiesOfTypeQuery)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSBundleProxiesOfTypeQuery

+ (id)queryWithType:(unint64_t)a3
{
  uint64_t v6 = [objc_alloc((Class)a1) _init];
  v7 = (void *)v6;
  if (a3 == 6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"LSBundleQuery.mm", 129, @"Invalid parameter not satisfying: %@", @"type != LSBundleTypePlugInKitPlugin" object file lineNumber description];

    if (!v7) {
      return v7;
    }
    goto LABEL_3;
  }

  if (v6) {
LABEL_3:
  }
    v7[2] = a3;
  return v7;
}

- (BOOL)bundleUnitMeetsRequirements:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5
{
  LOBYTE(v5) = 0;
  if (a3 && a4 && a5)
  {
    v9 = (void *)_CSStringCopyCFString();
    if (v9)
    {
      if (-[_LSBundleProxiesOfTypeQuery type](self, "type") == 5)
      {
        BOOL v10 = a4->_clas == 13;
        goto LABEL_7;
      }

      if (-[_LSBundleProxiesOfTypeQuery type](self, "type") != 2)
      {
        unint64_t v12 = -[_LSBundleProxiesOfTypeQuery type](self, "type");
        unsigned int clas = a4->_clas;
        if (v12 == 7)
        {
          BOOL v10 = clas == 14;
LABEL_7:
          LOBYTE(v5) = v10;
          goto LABEL_12;
        }

        if (clas == 2)
        {
          LOBYTE(v5) = 0;
          switch(-[_LSBundleProxiesOfTypeQuery type](self, "type"))
          {
            case 0uLL:
              goto LABEL_24;
            case 1uLL:
              if ((*((_BYTE *)&a4->_clas + 6) & 4) != 0) {
                goto LABEL_11;
              }
              goto LABEL_24;
            case 3uLL:
              if ((*((_BYTE *)&a4->_clas + 6) & 4) == 0) {
                goto LABEL_11;
              }
              goto LABEL_24;
            case 4uLL:
              if ((*((_BYTE *)&a4->_clas + 6) & 4) != 0) {
                goto LABEL_11;
              }
              +[LSApplicationRestrictionsManager sharedInstance]();
              v14 = (id *)objc_claimAutoreleasedReturnValue();
              unsigned __int8 v15 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFeatureRestrictions:]( v14,  v9,  1);

              if ((v15 & 1) != 0) {
                goto LABEL_11;
              }
LABEL_24:
              _LSDatabaseGetNSStringFromString(a5->db);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (v16
                && (int v18 = [v16 isEqualToString:@"Hidden"], v17, (v18 & 1) != 0))
              {
                int v5 = v18 ^ 1;
              }

              else
              {
                _LSDatabaseGetNSStringFromString(a5->db);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                if (v19) {
                  int v5 = [v19 isEqualToString:@"SystemAppPlaceholder"] ^ 1;
                }
                else {
                  int v5 = 1;
                }
              }

              if (!v5) {
                goto LABEL_12;
              }
              if (-[_LSBundleProxiesOfTypeQuery type](self, "type"))
              {
                BOOL v10 = (a4->_bundleFlags & 0x200) == 0;
                goto LABEL_7;
              }

              LOBYTE(v5) = 1;
              break;
            default:
              goto LABEL_12;
          }

          goto LABEL_12;
        }
      }
    }

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v24 = 0LL;
  v21 = 0LL;
  id v22 = 0LL;
  char v23 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v8, 0LL);

  if (v9)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __65___LSBundleProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke;
    v18[3] = &unk_189D746C8;
    v18[4] = self;
    v20 = v9;
    id v10 = v7;
    id v19 = v10;
    int v11 = _LSEnumerateViableBundlesOfClass(v9, 0LL, v18);
    if (v11)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v11,  (uint64_t)"-[_LSBundleProxiesOfTypeQuery _enumerateWithXPCConnection:block:]",  273LL,  0LL);
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v12);
    }
  }

  else
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v21, v13, 0LL);

    if (v14) {
      id v15 = 0LL;
    }
    else {
      id v15 = v24;
    }
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v15);
  }

  if (v21 && v23) {
    _LSContextDestroy(v21);
  }
  id v16 = v22;
  v21 = 0LL;
  id v22 = 0LL;

  char v23 = 0;
  id v17 = v24;
  id v24 = 0LL;
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSBundleProxiesOfTypeQuery;
  if (-[_LSQuery isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 type];
    if (v6 == -[_LSBundleProxiesOfTypeQuery type](self, "type"))
    {
      int v7 = [v5 isLegacy];
      int v8 = v7 ^ -[_LSQuery isLegacy](self, "isLegacy") ^ 1;
    }

    else
    {
      LOBYTE(v8) = 0;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = -[_LSBundleProxiesOfTypeQuery type](self, "type");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSBundleProxiesOfTypeQuery;
  return -[_LSQuery hash](&v5, sel_hash) ^ (v3 << 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSBundleProxiesOfTypeQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[_LSBundleProxiesOfTypeQuery type](self, "type"), @"type");
}

- (_LSBundleProxiesOfTypeQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSBundleProxiesOfTypeQuery;
  objc_super v5 = -[_LSQuery initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

@end