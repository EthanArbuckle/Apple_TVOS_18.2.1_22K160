@interface NSAttributedStringGrammarInflection
@end

@implementation NSAttributedStringGrammarInflection

uint64_t __78___NSAttributedStringGrammarInflection_NSInflectionPresets__presetInflections__block_invoke()
{
  v1[3] = *MEMORY[0x1895F89C0];
  v1[0] =  -[_NSAttributedStringGrammarInflection _initWithGender:]( objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection),  "_initWithGender:",  2LL);
  v1[1] =  -[_NSAttributedStringGrammarInflection _initWithGender:]( objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection),  "_initWithGender:",  1LL,  v1[0]);
  v1[2] =  -[_NSAttributedStringGrammarInflection _initWithGender:]( objc_alloc(&OBJC_CLASS____NSAttributedStringGrammarInflection),  "_initWithGender:",  3LL);
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v1, 3), "copy");
  qword_18C496E50 = result;
  return result;
}

@end