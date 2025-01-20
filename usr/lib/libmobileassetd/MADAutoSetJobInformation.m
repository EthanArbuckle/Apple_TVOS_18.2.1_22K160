@interface MADAutoSetJobInformation
+ (BOOL)supportsSecureCoding;
- (MADAutoSetDescriptor)setDescriptor;
- (MADAutoSetJobInformation)init;
- (MADAutoSetJobInformation)initWithCoder:(id)a3;
- (MANAutoAssetSetInfoDesire)clientDesire;
- (MANAutoAssetSetInfoFound)foundContent;
- (MANAutoAssetSetInfoInstance)clientInstance;
- (MANAutoAssetSetStatus)currentSetStatus;
- (NSString)assignedAutoAssetUUID;
- (id)copy;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssignedAutoAssetUUID:(id)a3;
- (void)setClientDesire:(id)a3;
- (void)setClientInstance:(id)a3;
- (void)setCurrentSetStatus:(id)a3;
- (void)setFoundContent:(id)a3;
- (void)setSetDescriptor:(id)a3;
@end

@implementation MADAutoSetJobInformation

- (MADAutoSetJobInformation)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MADAutoSetJobInformation;
  v2 = -[MADAutoSetJobInformation init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    clientInstance = v2->_clientInstance;
    v2->_clientInstance = 0LL;

    clientDesire = v3->_clientDesire;
    v3->_clientDesire = 0LL;

    foundContent = v3->_foundContent;
    v3->_foundContent = 0LL;

    setDescriptor = v3->_setDescriptor;
    v3->_setDescriptor = 0LL;

    currentSetStatus = v3->_currentSetStatus;
    v3->_currentSetStatus = 0LL;

    assignedAutoAssetUUID = v3->_assignedAutoAssetUUID;
    v3->_assignedAutoAssetUUID = 0LL;
  }

  return v3;
}

- (MADAutoSetJobInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MADAutoSetJobInformation;
  v5 = -[MADAutoSetJobInformation init](&v25, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetInfoInstance) forKey:@"clientInstance"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientInstance = v5->_clientInstance;
    v5->_clientInstance = (MANAutoAssetSetInfoInstance *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetInfoDesire) forKey:@"clientDesire"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    clientDesire = v5->_clientDesire;
    v5->_clientDesire = (MANAutoAssetSetInfoDesire *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetInfoFound) forKey:@"foundContent"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    foundContent = v5->_foundContent;
    v5->_foundContent = (MANAutoAssetSetInfoFound *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetJobInformation) forKey:@"setDescriptor"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    setDescriptor = v5->_setDescriptor;
    v5->_setDescriptor = (MADAutoSetDescriptor *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetStatus) forKey:@"currentSetStatus"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    currentSetStatus = v5->_currentSetStatus;
    v5->_currentSetStatus = (MANAutoAssetSetStatus *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assignedAutoAssetUUID"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    assignedAutoAssetUUID = v5->_assignedAutoAssetUUID;
    v5->_assignedAutoAssetUUID = (NSString *)v22;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation clientInstance](self, "clientInstance"));
  [v4 encodeObject:v5 forKey:@"clientInstance"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation clientDesire](self, "clientDesire"));
  [v4 encodeObject:v6 forKey:@"clientDesire"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation foundContent](self, "foundContent"));
  [v4 encodeObject:v7 forKey:@"foundContent"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation setDescriptor](self, "setDescriptor"));
  [v4 encodeObject:v8 forKey:@"setDescriptor"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation currentSetStatus](self, "currentSetStatus"));
  [v4 encodeObject:v9 forKey:@"currentSetStatus"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation assignedAutoAssetUUID](self, "assignedAutoAssetUUID"));
  [v4 encodeObject:v10 forKey:@"assignedAutoAssetUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___MADAutoSetJobInformation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation clientInstance](self, "clientInstance"));
  -[MADAutoSetJobInformation setClientInstance:](v3, "setClientInstance:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation clientDesire](self, "clientDesire"));
  -[MADAutoSetJobInformation setClientDesire:](v3, "setClientDesire:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation foundContent](self, "foundContent"));
  -[MADAutoSetJobInformation setFoundContent:](v3, "setFoundContent:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation setDescriptor](self, "setDescriptor"));
  id v8 = [v7 copy];
  -[MADAutoSetJobInformation setSetDescriptor:](v3, "setSetDescriptor:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation currentSetStatus](self, "currentSetStatus"));
  id v10 = [v9 copy];
  -[MADAutoSetJobInformation setCurrentSetStatus:](v3, "setCurrentSetStatus:", v10);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation assignedAutoAssetUUID](self, "assignedAutoAssetUUID"));
  -[MADAutoSetJobInformation setAssignedAutoAssetUUID:](v3, "setAssignedAutoAssetUUID:", v11);

  return v3;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation foundContent](self, "foundContent"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation clientInstance](self, "clientInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation clientDesire](self, "clientDesire"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation setDescriptor](self, "setDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
  if (!v3)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation currentSetStatus](self, "currentSetStatus"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation assignedAutoAssetUUID](self, "assignedAutoAssetUUID"));
    if (v12)
    {
      uint64_t v22 = v4;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation assignedAutoAssetUUID](self, "assignedAutoAssetUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientInstance:%@|clientDesire:%@|setDescriptor:%@|currentSetStatus:%@|UUID:%@]",  v5,  v7,  v9,  v11,  v18));

      id v4 = v22;
      goto LABEL_9;
    }

    uint64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientInstance:%@|clientDesire:%@|setDescriptor:%@|currentSetStatus:%@|UUID:%@]",  v5,  v7,  v9,  v11,  @"N");
LABEL_8:
    v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation foundContent](self, "foundContent"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation assignedAutoAssetUUID](self, "assignedAutoAssetUUID"));
  if (!v12)
  {
    uint64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientInstance:%@|clientDesire:%@|setDescriptor:%@|foundContent:%@|UUID:%@]",  v5,  v7,  v9,  v11,  @"N");
    goto LABEL_8;
  }

  id v21 = v10;
  uint64_t v13 = v8;
  v14 = v6;
  id v15 = v4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetJobInformation assignedAutoAssetUUID](self, "assignedAutoAssetUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[clientInstance:%@|clientDesire:%@|setDescriptor:%@|foundContent:%@|UUID:%@]",  v5,  v7,  v9,  v11,  v16));

  id v4 = v15;
  id v6 = v14;
  id v8 = v13;
  id v10 = v21;
LABEL_9:

  return v17;
}

- (MANAutoAssetSetInfoInstance)clientInstance
{
  return self->_clientInstance;
}

- (void)setClientInstance:(id)a3
{
}

- (MANAutoAssetSetInfoDesire)clientDesire
{
  return self->_clientDesire;
}

- (void)setClientDesire:(id)a3
{
}

- (MANAutoAssetSetInfoFound)foundContent
{
  return self->_foundContent;
}

- (void)setFoundContent:(id)a3
{
}

- (MADAutoSetDescriptor)setDescriptor
{
  return self->_setDescriptor;
}

- (void)setSetDescriptor:(id)a3
{
}

- (MANAutoAssetSetStatus)currentSetStatus
{
  return self->_currentSetStatus;
}

- (void)setCurrentSetStatus:(id)a3
{
}

- (NSString)assignedAutoAssetUUID
{
  return self->_assignedAutoAssetUUID;
}

- (void)setAssignedAutoAssetUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end