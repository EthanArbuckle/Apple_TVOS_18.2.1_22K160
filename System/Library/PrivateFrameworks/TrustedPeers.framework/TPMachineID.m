@interface TPMachineID
- (NSDate)modified;
- (NSString)machineID;
- (TPMachineID)initWithMachineID:(id)a3 status:(unint64_t)a4 modified:(id)a5;
- (id)description;
- (unint64_t)status;
@end

@implementation TPMachineID

- (TPMachineID)initWithMachineID:(id)a3 status:(unint64_t)a4 modified:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TPMachineID;
  v11 = -[TPMachineID init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_machineID, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_modified, a5);
  }

  return v12;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[TPMachineID machineID](self, "machineID");
  unint64_t v5 = -[TPMachineID status](self, "status");
  if (v5 > 5) {
    v6 = @"allowed";
  }
  else {
    v6 = off_18A22BF10[v5];
  }
  v7 = -[TPMachineID modified](self, "modified");
  [v3 stringWithFormat:@"<TPMachineID: %@ %@ %@>", v4, v6, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSDate)modified
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end