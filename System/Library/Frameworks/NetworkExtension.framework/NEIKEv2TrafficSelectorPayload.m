@interface NEIKEv2TrafficSelectorPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEIKEv2TrafficSelectorPayload

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"Traffic Selectors" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2TrafficSelectorPayload descriptionWithIndent:options:]( self,  "descriptionWithIndent:options:",  0LL,  14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2TrafficSelectorPayload *)objc_getProperty(self, a2, 24LL, 1);
  }
  return -[NEIKEv2TrafficSelectorPayload count](self, "count") != 0;
}

- (BOOL)generatePayloadData
{
  v2 = self;
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
LABEL_56:
    id Property = objc_getProperty(v2, v3, 16LL, 1);
    return Property != 0LL;
  }

  if (!-[NEIKEv2TrafficSelectorPayload hasRequiredFields](v2, "hasRequiredFields"))
  {
    ne_log_obj();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_ERROR,  "Traffic Selector payload missing required fields",  buf,  2u);
    }

    return 0;
  }

  id v5 = objc_alloc(MEMORY[0x189603FA8]);
  if (v2) {
    id v6 = objc_getProperty(v2, v4, 24LL, 1);
  }
  else {
    id v6 = 0LL;
  }
  v40 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  selfa = v2;
  if (v2) {
    id v8 = objc_getProperty(v2, v7, 24LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v10)
  {
    uint64_t v12 = 0LL;
    goto LABEL_47;
  }

  uint64_t v11 = v10;
  uint64_t v12 = 0LL;
  uint64_t v13 = *(void *)v47;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v47 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if (!-[NEIKEv2TrafficSelector type]((uint64_t)v15))
      {
        ne_log_obj();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v23 = v22;
          v24 = "Traffic selector invalid";
          goto LABEL_33;
        }

- (BOOL)parsePayloadData
{
  *(void *)((char *)&v42[3] + 4) = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42[0] = "-[NEIKEv2TrafficSelectorPayload parsePayloadData]";
      id v6 = "%s called with null self.payloadData";
      goto LABEL_44;
    }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"TS";
}

@end