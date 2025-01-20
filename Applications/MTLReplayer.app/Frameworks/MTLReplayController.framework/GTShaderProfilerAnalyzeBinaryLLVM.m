@interface GTShaderProfilerAnalyzeBinaryLLVM
@end

@implementation GTShaderProfilerAnalyzeBinaryLLVM

void __GTShaderProfilerAnalyzeBinaryLLVM_block_invoke(id a1)
{
  uint64_t v1 = LLVMInitializeAGX2TargetInfo(a1);
  uint64_t v2 = LLVMInitializeAGX2TargetMC(v1);
  uint64_t v3 = LLVMInitializeAGX2Disassembler(v2);
  LLVMInitializeAGX2ClauseAnalyzer(v3);
}

@end