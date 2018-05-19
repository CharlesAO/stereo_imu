
#include "trace.h"


 void Tracer::trace_init()
{
	atrace_marker_fd = -1;
	atrace_marker_fd = open("/sys/kernel/debug/tracing/trace_marker", O_WRONLY);
  if (atrace_marker_fd == -1)
  { /* do error handling */
	 printf("Error Opening Trace file");
  }
}
