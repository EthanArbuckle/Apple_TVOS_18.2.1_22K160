@interface SUCoreScanParam
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (NSMutableDictionary)additionalInfo;
- (NSString)note;
- (SUCoreDescriptor)descriptor;
- (SUCoreDescriptor)fallbackDescriptor;
- (SUCoreDescriptor)majorPrimaryDescriptor;
- (SUCoreDescriptor)majorSecondaryDescriptor;
- (SUCoreDescriptor)minorPrimaryDescriptor;
- (SUCoreDescriptor)minorSecondaryDescriptor;
- (SUCoreScanParam)init;
- (SUCoreScanParam)initWithCoder:(id)a3;
- (SUCoreScanParam)initWithDescriptor:(id)a3 withFallbackDescriptor:(id)a4;
- (SUCoreScanParam)initWithMajorPrimaryDescriptor:(id)a3 majorSecondaryDescriptor:(id)a4 minorPrimaryDescriptor:(id)a5 minorSecondaryDescriptor:(id)a6;
- (SUCoreScanParam)initWithNote:(id)a3;
- (SUCoreScanParam)initWithResult:(int64_t)a3 withError:(id)a4;
- (id)description;
- (id)summary;
- (int64_t)resultCode;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInfo:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setError:(id)a3;
- (void)setFallbackDescriptor:(id)a3;
- (void)setMajorPrimaryDescriptor:(id)a3;
- (void)setMajorSecondaryDescriptor:(id)a3;
- (void)setMinorPrimaryDescriptor:(id)a3;
- (void)setMinorSecondaryDescriptor:(id)a3;
- (void)setNote:(id)a3;
- (void)setResultCode:(int64_t)a3;
@end

@implementation SUCoreScanParam

- (SUCoreScanParam)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SUCoreScanParam;
  v2 = -[SUCoreScanParam init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    error = v2->_error;
    v2->_resultCode = 0LL;
    v2->_error = 0LL;

    descriptor = v3->_descriptor;
    v3->_descriptor = 0LL;

    fallbackDescriptor = v3->_fallbackDescriptor;
    v3->_fallbackDescriptor = 0LL;

    majorPrimaryDescriptor = v3->_majorPrimaryDescriptor;
    v3->_majorPrimaryDescriptor = 0LL;

    majorSecondaryDescriptor = v3->_majorSecondaryDescriptor;
    v3->_majorSecondaryDescriptor = 0LL;

    minorPrimaryDescriptor = v3->_minorPrimaryDescriptor;
    v3->_minorPrimaryDescriptor = 0LL;

    minorSecondaryDescriptor = v3->_minorSecondaryDescriptor;
    v3->_minorSecondaryDescriptor = 0LL;

    note = v3->_note;
    v3->_note = 0LL;

    uint64_t v12 = objc_opt_new();
    additionalInfo = v3->_additionalInfo;
    v3->_additionalInfo = (NSMutableDictionary *)v12;
  }

  return v3;
}

- (SUCoreScanParam)initWithResult:(int64_t)a3 withError:(id)a4
{
  id v7 = a4;
  v8 = -[SUCoreScanParam init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v8->_resultCode = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (SUCoreScanParam)initWithDescriptor:(id)a3 withFallbackDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[SUCoreScanParam init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_fallbackDescriptor, a4);
  }

  return v10;
}

- (SUCoreScanParam)initWithMajorPrimaryDescriptor:(id)a3 majorSecondaryDescriptor:(id)a4 minorPrimaryDescriptor:(id)a5 minorSecondaryDescriptor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_super v15 = -[SUCoreScanParam init](self, "init");
  v16 = v15;
  if (v15)
  {
    v15->_type = 3;
    objc_storeStrong((id *)&v15->_majorPrimaryDescriptor, a3);
    objc_storeStrong((id *)&v16->_majorSecondaryDescriptor, a4);
    objc_storeStrong((id *)&v16->_minorPrimaryDescriptor, a5);
    objc_storeStrong((id *)&v16->_minorSecondaryDescriptor, a6);
  }

  return v16;
}

- (SUCoreScanParam)initWithNote:(id)a3
{
  id v5 = a3;
  v6 = -[SUCoreScanParam init](self, "init");
  id v7 = v6;
  if (v6)
  {
    v6->_type = 4;
    objc_storeStrong((id *)&v6->_note, a3);
  }

  return v7;
}

- (SUCoreScanParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SUCoreScanParam;
  id v5 = -[SUCoreScanParam init](&v27, sel_init);
  if (v5)
  {
    v5->_resultCode = [v4 decodeInt64ForKey:@"resultCode"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612760] sharedCore];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 buildError:v5->_resultCode underlying:0 description:v6];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (SUCoreDescriptor *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackDescriptor"];
    fallbackDescriptor = v5->_fallbackDescriptor;
    v5->_fallbackDescriptor = (SUCoreDescriptor *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorPrimaryDescriptor"];
    majorPrimaryDescriptor = v5->_majorPrimaryDescriptor;
    v5->_majorPrimaryDescriptor = (SUCoreDescriptor *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorSecondaryDescriptor"];
    majorSecondaryDescriptor = v5->_majorSecondaryDescriptor;
    v5->_majorSecondaryDescriptor = (SUCoreDescriptor *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorPrimaryDescriptor"];
    minorPrimaryDescriptor = v5->_minorPrimaryDescriptor;
    v5->_minorPrimaryDescriptor = (SUCoreDescriptor *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minorSecondaryDescriptor"];
    minorSecondaryDescriptor = v5->_minorSecondaryDescriptor;
    v5->_minorSecondaryDescriptor = (SUCoreDescriptor *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"note"];
    note = v5->_note;
    v5->_note = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalInfo"];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSMutableDictionary *)v24;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreScanParam resultCode](self, "resultCode"), @"resultCode");
  id v5 = objc_alloc(NSString);
  v6 = -[SUCoreScanParam error](self, "error");
  id v15 = (id)[v5 initWithFormat:@"%@", v6];

  [v4 encodeObject:v15 forKey:@"error"];
  -[SUCoreScanParam descriptor](self, "descriptor");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"descriptor"];

  -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"fallbackDescriptor"];
  v9 = -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
  [v4 encodeObject:v9 forKey:@"majorPrimaryDescriptor"];

  -[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"majorSecondaryDescriptor"];

  -[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"minorPrimaryDescriptor"];

  -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"minorSecondaryDescriptor"];

  -[SUCoreScanParam note](self, "note");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"note"];

  -[SUCoreScanParam additionalInfo](self, "additionalInfo");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"additionalInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  switch(self->_type)
  {
    case 1:
      id v3 = objc_alloc(NSString);
      int64_t v4 = -[SUCoreScanParam resultCode](self, "resultCode");
      -[SUCoreScanParam error](self, "error");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SUCoreScanParam additionalInfo](self, "additionalInfo");
      id v7 = (void *)[v3 initWithFormat:@"\n[>>>\n                   resultCode: %ld\n                        error: %@\n               additionalInfo: %@\n<<<]", v4, v5, v6];

      break;
    case 2:
      id v8 = objc_alloc(NSString);
      v9 = -[SUCoreScanParam descriptor](self, "descriptor");
      [v9 summary];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 summary];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam additionalInfo](self, "additionalInfo");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v7 = (void *)[v8 initWithFormat:@"\n[>>>\n                   descriptor: %@\n           fallbackDescriptor: %@\n               additionalInfo: %@\n<<<]", v10, v12, v13];

      goto LABEL_7;
    case 3:
      id v25 = objc_alloc(NSString);
      -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 summary];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 summary];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 summary];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 summary];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScanParam additionalInfo](self, "additionalInfo");
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      id v7 = (void *)[v25 initWithFormat:@"\n[>>>\n       majorPrimaryDescriptor: %@\n     majorSecondaryDescriptor: %@\n       minorPrimaryDescriptor: %@\n     minorSecondaryDescriptor: %@\n               additionalInfo: %@\n<<<]", v15, v17, v19, v21, v22];

      break;
    case 4:
      id v23 = objc_alloc(NSString);
      v9 = -[SUCoreScanParam note](self, "note");
      -[SUCoreScanParam additionalInfo](self, "additionalInfo");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v7 = (void *)[v23 initWithFormat:@"\n[>>>\n          note: %@\nadditionalInfo: %@\n<<<]", v9, v10];
LABEL_7:

      break;
    default:
      id v7 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"\n[>>>\n        NO_INFO: %d\n<<<]",  self->_type);
      break;
  }

  return v7;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam error](self, "error");
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreScanParam error](self, "error");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 description];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v3 stringByAppendingFormat:@",errorDesc:%@", v6];

    id v3 = (void *)v7;
  }

  -[SUCoreScanParam descriptor](self, "descriptor");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_6:
    -[SUCoreScanParam descriptor](self, "descriptor");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 summary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 summary];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v3 stringByAppendingFormat:@",descriptor:%@,fallbackDescriptor:%@", v11, v13];

    id v3 = (void *)v14;
    goto LABEL_7;
  }
  v9 = -[SUCoreScanParam fallbackDescriptor](self, "fallbackDescriptor");
  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    || (-[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor"),
        (id v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
    || (-[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor"),
        (id v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
  }

  else
  {
    v26 = -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
    if (!v26) {
      return v3;
    }
  }

  -[SUCoreScanParam majorPrimaryDescriptor](self, "majorPrimaryDescriptor");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 summary];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam majorSecondaryDescriptor](self, "majorSecondaryDescriptor");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 summary];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam minorPrimaryDescriptor](self, "minorPrimaryDescriptor");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 summary];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam minorSecondaryDescriptor](self, "minorSecondaryDescriptor");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 summary];
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v3 stringByAppendingFormat:@",majorPrimaryDescriptor:%@,majorSecondaryDescriptor:%@,minorPrimaryDescriptor:%@,minorSecondaryDescriptor:%@", v17, v19, v21, v23];

  id v3 = (void *)v24;
  return v3;
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (SUCoreDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (SUCoreDescriptor)fallbackDescriptor
{
  return self->_fallbackDescriptor;
}

- (void)setFallbackDescriptor:(id)a3
{
}

- (SUCoreDescriptor)majorPrimaryDescriptor
{
  return self->_majorPrimaryDescriptor;
}

- (void)setMajorPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)majorSecondaryDescriptor
{
  return self->_majorSecondaryDescriptor;
}

- (void)setMajorSecondaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)minorPrimaryDescriptor
{
  return self->_minorPrimaryDescriptor;
}

- (void)setMinorPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)minorSecondaryDescriptor
{
  return self->_minorSecondaryDescriptor;
}

- (void)setMinorSecondaryDescriptor:(id)a3
{
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NSMutableDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end