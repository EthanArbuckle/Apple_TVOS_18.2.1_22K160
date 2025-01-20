uint64_t timeval.init(_:)()
{
  return Duration.components.getter();
}

void Duration.init(_:)()
{
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x18961AE58]();
}