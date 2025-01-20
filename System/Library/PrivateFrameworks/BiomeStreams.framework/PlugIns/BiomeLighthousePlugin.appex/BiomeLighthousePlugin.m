id objc_msgSend_setShouldStop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldStop:");
}
:(id *)a4;
- (void)setShouldStop:(BOOL)a3;
- (void)stop;
@end

@implementation BiomeLighthousePlugin

+ (void)initialize
{
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  return 0LL;
}

- (void)stop
{
  uint64_t v3 = __biome_log_for_category(4LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Asked to stop", v5, 2u);
  }

  -[BiomeLighthousePlugin setShouldStop:](self, "setShouldStop:", 1LL);
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
}

@end