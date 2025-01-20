@interface NEIKEv2ConfigurationAttribute
+ (id)copyTypeDescription;
- (BOOL)validForChildlessSA;
- (id)attributeName;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initEmptyRequest;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2ConfigurationAttribute

- (unint64_t)attributeType
{
  return 0LL;
}

- (unint64_t)valueType
{
  return 0LL;
}

- (id)initEmptyRequest
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2ConfigurationAttribute;
  v2 = -[NEIKEv2ConfigurationAttribute init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }

  else
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }

  return v3;
}

- (id)attributeName
{
  if (self) {
    self = (NEIKEv2ConfigurationAttribute *)objc_getProperty(self, a2, 8LL, 1);
  }
  return self;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"Name" andIndent:v5 options:a4];

  String = (__CFString *)NEIKEv2AttributeTypeCreateString(-[NEIKEv2ConfigurationAttribute attributeType](self, "attributeType"));
  [v7 appendPrettyObject:String withName:@"Type" andIndent:v5 options:a4];

  v10 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v10 withName:@"Payload Type" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)validForChildlessSA
{
  return 0;
}

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

@end