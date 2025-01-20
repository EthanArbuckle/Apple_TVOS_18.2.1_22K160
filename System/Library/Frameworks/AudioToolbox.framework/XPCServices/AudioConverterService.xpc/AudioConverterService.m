int main(int argc, const char **argv, const char **envp)
{
  _CFPrefsSetDirectModeEnabled(1LL, argv, envp);
  _CFPrefsSetReadOnly(1LL);
  AudioConverterServiceRun();
  return 0;
}