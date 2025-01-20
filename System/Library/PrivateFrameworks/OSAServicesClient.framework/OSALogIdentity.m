@interface OSALogIdentity
+ (BOOL)supportsSecureCoding;
- (NSString)bugType;
- (NSString)incidentID;
- (OSALogIdentity)initWithCoder:(id)a3;
- (OSALogIdentity)initWithIncidentID:(id)a3 bugType:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSALogIdentity

- (OSALogIdentity)initWithIncidentID:(id)a3 bugType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSALogIdentity;
  v9 = -[OSALogIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_incidentID, a3);
    objc_storeStrong((id *)&v10->_bugType, a4);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ (%@)", self->_incidentID, self->_bugType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  incidentID = self->_incidentID;
  id v5 = a3;
  [v5 encodeObject:incidentID forKey:@"incidentID"];
  [v5 encodeObject:self->_bugType forKey:@"bugType"];
}

- (OSALogIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"incidentID"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189607590] format:@"OSALogIdentity missing incidentID"];
  }
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bugType"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189607590] format:@"OSALogIdentity missing bugType"];
  }
  id v7 = -[OSALogIdentity initWithIncidentID:bugType:](self, "initWithIncidentID:bugType:", v5, v6);

  return v7;
}

- (NSString)incidentID
{
  return self->_incidentID;
}

- (NSString)bugType
{
  return self->_bugType;
}

- (void).cxx_destruct
{
}

@end