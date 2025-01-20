@interface NEIKEv2SPI
- (NEIKEv2SPI)init;
@end

@implementation NEIKEv2SPI

- (NEIKEv2SPI)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEIKEv2SPI;
  v2 = -[NEIKEv2SPI init](&v8, sel_init);
  if (!v2)
  {
    ne_log_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)v7 = 0;
    v6 = "[super init] failed";
    goto LABEL_8;
  }

  if (!-[NEIKEv2SPI isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = v2;
    goto LABEL_6;
  }

  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    v6 = "Cannot instantiate NEIKEv2SPI directly";
LABEL_8:
    _os_log_fault_impl(&dword_1876B1000, v3, OS_LOG_TYPE_FAULT, v6, v7, 2u);
  }

@end