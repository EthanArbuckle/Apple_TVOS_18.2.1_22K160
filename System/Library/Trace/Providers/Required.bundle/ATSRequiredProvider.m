@interface ATSRequiredProvider
- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6;
- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4;
- (id)describeChunk:(ktrace_chunk *)a3;
- (void)_appendSyscallMapToFile:(ktrace_file *)a3;
- (void)configurePostprocessingWithSession:(ktrace_session *)a3;
- (void)configureWithSession:(ktrace_session *)a3;
- (void)didStartTracingToFile:(ktrace_file *)a3;
- (void)didStopTracingToFile:(ktrace_file *)a3;
- (void)emitVnodePathTracepointsIfEnabled;
- (void)postprocessingCompleteWithFile:(ktrace_file *)a3;
- (void)willFinishWithCatalog:(ktrace_catalog *)a3 file:(ktrace_file *)a4;
- (void)willStartTracingToFile:(ktrace_file *)a3;
@end

@implementation ATSRequiredProvider

- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  v9 = -[ATSIORegCapture initWithLogger:](objc_alloc(&OBJC_CLASS___ATSIORegCapture), "initWithLogger:", v8);
  ioRegCapture = self->_ioRegCapture;
  self->_ioRegCapture = v9;

  v11 = -[ATSSignpostPlistCapture initWithLogger:]( objc_alloc(&OBJC_CLASS___ATSSignpostPlistCapture),  "initWithLogger:",  v8);
  signpostPlistCapture = self->_signpostPlistCapture;
  self->_signpostPlistCapture = v11;

  v13 = -[ATSSymbolsMapCapture initWithLogger:](objc_alloc(&OBJC_CLASS___ATSSymbolsMapCapture), "initWithLogger:", v8);
  symbolsMapCapture = self->_symbolsMapCapture;
  self->_symbolsMapCapture = v13;

  return 1;
}

- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4
{
  v6 = -[ATSGraphicsCapture initWithLogger:config:]( objc_alloc(&OBJC_CLASS___ATSGraphicsCapture),  "initWithLogger:config:",  self->_logger,  a3);
  graphicsCapture = self->_graphicsCapture;
  self->_graphicsCapture = v6;

  self->_shouldEmitVnodePathNameTracepoints = ktrace_config_kdebug_get_debugid_enabled(a3, 50397328LL);
  ats_will_start_tracing(0LL);
  return 1;
}

- (void)configureWithSession:(ktrace_session *)a3
{
}

- (void)willStartTracingToFile:(ktrace_file *)a3
{
}

- (void)didStartTracingToFile:(ktrace_file *)a3
{
}

- (void)didStopTracingToFile:(ktrace_file *)a3
{
}

- (void)willFinishWithCatalog:(ktrace_catalog *)a3 file:(ktrace_file *)a4
{
}

- (void)configurePostprocessingWithSession:(ktrace_session *)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_D04C;
  v4[3] = &unk_10660;
  v4[4] = self;
  ktrace_events_single(a3, 117571592LL, v4);
  ats_configure_postprocessing_with_config(a3, 0LL);
}

- (void)postprocessingCompleteWithFile:(ktrace_file *)a3
{
  if (self->_foundLostEvents) {
    -[KTProviderLogger warnWithMessage:]( self->_logger,  "warnWithMessage:",  @"Trace has lost events. Trace may not contain full data needed to visualize in tools.");
  }
  ats_postprocessing_complete_write_processmaps(a3);
}

- (id)describeChunk:(ktrace_chunk *)a3
{
  uint64_t v4 = ktrace_chunk_tag(a3, a2);
  if ((v4 - 20584) >= 3)
  {
    uint64_t v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ATSIORegCapture describeChunkWithTag:](self->_ioRegCapture, "describeChunkWithTag:", v4));
    if (!v7) {
      v7 = (void *)objc_claimAutoreleasedReturnValue( -[ATSSignpostPlistCapture describeChunkWithTag:]( self->_signpostPlistCapture,  "describeChunkWithTag:",  v6));
    }
    id v5 = v7;
  }

  else
  {
    id v5 = *(&off_10680 + (int)v4 - 20584);
  }

  return v5;
}

- (void)_appendSyscallMapToFile:(ktrace_file *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:",  @"/usr/share/misc/syscalls.json"));
  id v7 = v5;
  if (v5)
  {
    id v6 = v5;
    ktrace_file_append_chunk(a3, 73729, 0, 0, [v6 bytes], objc_msgSend(v6, "length"));
  }

  else
  {
    -[KTProviderLogger failWithReason:]( self->_logger,  "failWithReason:",  @"Failed to capture syscall data from '/usr/share/misc/syscalls.json'");
  }
}

- (void)emitVnodePathTracepointsIfEnabled
{
  if (self->_shouldEmitVnodePathNameTracepoints)
  {
    if (sysctlbyname("vfs.generic.trace_paths", 0LL, 0LL, 0LL, 0LL)) {
      -[KTProviderLogger warnWithMessage:]( self->_logger,  "warnWithMessage:",  @"WARNING: Unable to dump full vnode-to-path mappings; some vnodes may be missing paths");
    }
  }

- (void).cxx_destruct
{
}

@end