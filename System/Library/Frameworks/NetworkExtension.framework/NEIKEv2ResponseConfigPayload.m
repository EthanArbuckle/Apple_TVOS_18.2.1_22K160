@interface NEIKEv2ResponseConfigPayload
- (BOOL)parsePayloadData;
@end

@implementation NEIKEv2ResponseConfigPayload

- (BOOL)parsePayloadData
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v57 = "-[NEIKEv2ResponseConfigPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_58;
    }

- (void).cxx_destruct
{
}

@end