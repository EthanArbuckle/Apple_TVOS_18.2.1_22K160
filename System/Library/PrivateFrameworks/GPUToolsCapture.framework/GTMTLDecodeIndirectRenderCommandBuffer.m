@interface GTMTLDecodeIndirectRenderCommandBuffer
@end

@implementation GTMTLDecodeIndirectRenderCommandBuffer

void __GTMTLDecodeIndirectRenderCommandBuffer_block_invoke_34(id a1)
{
  if (s_logUsingOsLog)
  {
    id v1 = gt_default_log();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "warning: Cannot decode ICB mesh buffer binding, missing SPI",  buf,  2u);
    }
  }

  else
  {
    v3 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"warning: Cannot decode ICB mesh buffer binding, missing SPI"));
    fprintf(v3, "%s\n", (const char *)[v4 UTF8String]);
  }

void __GTMTLDecodeIndirectRenderCommandBuffer_block_invoke(id a1)
{
  if (s_logUsingOsLog)
  {
    id v1 = gt_default_log();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "warning: Cannot decode ICB object buffer binding, missing SPI",  buf,  2u);
    }
  }

  else
  {
    v3 = __stderrp;
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"warning: Cannot decode ICB object buffer binding, missing SPI"));
    fprintf(v3, "%s\n", (const char *)[v4 UTF8String]);
  }

@end