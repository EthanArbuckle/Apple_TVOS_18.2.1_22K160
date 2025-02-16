@interface RPNearFieldContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)supportedApplicationLabels;
- (NSData)pkData;
- (NSString)applicationLabel;
- (NSUUID)bonjourListenerUUID;
- (RPNearFieldContext)initWithApplicationLabel:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5;
- (RPNearFieldContext)initWithApplicationLabel:(id)a3 supportedApplicationLabels:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6;
- (RPNearFieldContext)initWithCoder:(id)a3;
- (id)initWitApplicationLabel:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RPNearFieldContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RPNearFieldContext *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RPNearFieldContext applicationLabel](self, "applicationLabel");
      v7 = -[RPNearFieldContext applicationLabel](v5, "applicationLabel");
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }

      else
      {
        if ((v8 == 0LL) == (v9 != 0LL))
        {
          char v12 = 0;
          v17 = v9;
          id v15 = v8;
          goto LABEL_31;
        }

        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          char v12 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      v13 = -[RPNearFieldContext supportedApplicationLabels](self, "supportedApplicationLabels");
      v14 = -[RPNearFieldContext supportedApplicationLabels](v5, "supportedApplicationLabels");
      id v15 = v13;
      id v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
      }

      else
      {
        if ((v15 == 0LL) == (v16 != 0LL))
        {
          char v12 = 0;
          v23 = v16;
          id v21 = v15;
          goto LABEL_30;
        }

        int v18 = [v15 isEqual:v16];

        if (!v18)
        {
          char v12 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      v19 = -[RPNearFieldContext pkData](self, "pkData");
      v20 = -[RPNearFieldContext pkData](v5, "pkData");
      id v21 = v19;
      id v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {
      }

      else
      {
        if ((v21 == 0LL) == (v22 != 0LL))
        {
          char v12 = 0;
          id v31 = v22;
          v29 = v22;
          id v27 = v21;
LABEL_29:

          v23 = v31;
          goto LABEL_30;
        }

        int v24 = [v21 isEqual:v22];

        if (!v24)
        {
          char v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }

      id v31 = v23;
      v25 = -[RPNearFieldContext bonjourListenerUUID](self, "bonjourListenerUUID");
      v26 = -[RPNearFieldContext bonjourListenerUUID](v5, "bonjourListenerUUID");
      id v27 = v25;
      id v28 = v26;
      v29 = v28;
      if (v27 == v28)
      {
        char v12 = 1;
      }

      else if ((v27 == 0LL) == (v28 != 0LL))
      {
        char v12 = 0;
      }

      else
      {
        char v12 = [v27 isEqual:v28];
      }

      goto LABEL_29;
    }

    char v12 = 0;
  }

- (RPNearFieldContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[RPNearFieldContext init](self, "init");
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent();
  id v7 = v6;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v8 = v7;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  if (!v5->_pkData) {
    goto LABEL_5;
  }
  if (v5->_bonjourListenerUUID) {
    id v9 = v5;
  }
  else {
LABEL_5:
  }
    id v9 = 0LL;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  applicationLabel = self->_applicationLabel;
  id v9 = v4;
  if (applicationLabel)
  {
    [v4 encodeObject:applicationLabel forKey:@"applicationLabel"];
    id v4 = v9;
  }

  supportedApplicationLabels = self->_supportedApplicationLabels;
  if (supportedApplicationLabels)
  {
    [v9 encodeObject:supportedApplicationLabels forKey:@"supportedApplicationLabels"];
    id v4 = v9;
  }

  pkData = self->_pkData;
  if (pkData)
  {
    [v9 encodeObject:pkData forKey:@"pkData"];
    id v4 = v9;
  }

  bonjourListenerUUID = self->_bonjourListenerUUID;
  if (bonjourListenerUUID)
  {
    [v9 encodeObject:bonjourListenerUUID forKey:@"bonjourListenerUUID"];
    id v4 = v9;
  }
}

- (id)initWitApplicationLabel:(id)a3
{
  id v4 = a3;
  NSRandomData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607AB8] UUID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[RPNearFieldContext initWithApplicationLabel:pkData:bonjourListenerUUID:]( self,  "initWithApplicationLabel:pkData:bonjourListenerUUID:",  v4,  v5,  v6);

  return v7;
}

- (RPNearFieldContext)initWithApplicationLabel:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5
{
  return -[RPNearFieldContext initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:]( self,  "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:",  a3,  MEMORY[0x189604A58],  a4,  a5);
}

- (RPNearFieldContext)initWithApplicationLabel:(id)a3 supportedApplicationLabels:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RPNearFieldContext;
  v14 = -[RPNearFieldContext init](&v22, sel_init);
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    applicationLabel = v14->_applicationLabel;
    v14->_applicationLabel = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    supportedApplicationLabels = v14->_supportedApplicationLabels;
    v14->_supportedApplicationLabels = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    pkData = v14->_pkData;
    v14->_pkData = (NSData *)v19;

    objc_storeStrong((id *)&v14->_bonjourListenerUUID, a6);
  }

  return v14;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (NSArray)supportedApplicationLabels
{
  return self->_supportedApplicationLabels;
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (void).cxx_destruct
{
}

@end