@interface IDSPreflightStack
- (BOOL)containsMechanisms;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesIMSI:(id)a3 PLMN:(id)a4;
- (IDSPreflightStack)initWithIMSI:(id)a3 PLMN:(id)a4 validationMechanisms:(id)a5;
- (NSArray)validationMechanisms;
- (NSString)IMSI;
- (NSString)PLMN;
- (id)description;
- (id)preflightStackByPoppingMechanism;
- (id)topMechanism;
- (unint64_t)hash;
@end

@implementation IDSPreflightStack

- (IDSPreflightStack)initWithIMSI:(id)a3 PLMN:(id)a4 validationMechanisms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IDSPreflightStack;
  v11 = -[IDSPreflightStack init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    IMSI = v11->_IMSI;
    v11->_IMSI = v12;

    v14 = (NSString *)[v9 copy];
    PLMN = v11->_PLMN;
    v11->_PLMN = v14;

    v16 = (NSArray *)[v10 copy];
    validationMechanisms = v11->_validationMechanisms;
    v11->_validationMechanisms = v16;
  }

  return v11;
}

- (BOOL)matchesIMSI:(id)a3 PLMN:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack IMSI](self, "IMSI"));
  unsigned int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack PLMN](self, "PLMN"));
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)containsMechanisms
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)topMechanism
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return v3;
}

- (id)preflightStackByPoppingMechanism
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
  id v4 = [v3 mutableCopy];

  if ([v4 count]) {
    [v4 removeFirstObject];
  }
  v5 = objc_alloc(&OBJC_CLASS___IDSPreflightStack);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack IMSI](self, "IMSI"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack PLMN](self, "PLMN"));
  id v8 = -[IDSPreflightStack initWithIMSI:PLMN:validationMechanisms:]( v5,  "initWithIMSI:PLMN:validationMechanisms:",  v6,  v7,  v4);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSPreflightStack, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack IMSI](self, "IMSI"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 IMSI]);
    if (v8 == v9)
    {
      unsigned __int8 v12 = 1;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack IMSI](self, "IMSI"));
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 IMSI]);
      unsigned __int8 v12 = [v10 isEqual:v11];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack PLMN](self, "PLMN"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 PLMN]);
    if (v14 == v15)
    {
      unsigned __int8 v18 = 1;
    }

    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack PLMN](self, "PLMN"));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 PLMN]);
      unsigned __int8 v18 = [v16 isEqual:v17];
    }

    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 validationMechanisms]);
    if (v19 == v20)
    {
      unsigned __int8 v23 = 1;
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 validationMechanisms]);
      unsigned __int8 v23 = [v21 isEqual:v22];
    }

    char v13 = v12 & v18 & v23;
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack IMSI](self, "IMSI"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack PLMN](self, "PLMN"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack IMSI](self, "IMSI"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack PLMN](self, "PLMN"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightStack validationMechanisms](self, "validationMechanisms"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IDSPreflightStack { IMSI: %@, PLMN: %@, mechanisms: %@ }",  v3,  v4,  v5));

  return v6;
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (NSString)PLMN
{
  return self->_PLMN;
}

- (NSArray)validationMechanisms
{
  return self->_validationMechanisms;
}

- (void).cxx_destruct
{
}

@end