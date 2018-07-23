#ifndef TRACE_H
#define TRACE_H
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#define ATRACE_MESSAGE_LEN 1024


class Tracer {

public:
    inline Tracer()
    {
       Init();
    }
	static void trace_init();


	static inline void trace_begin(const char *name)
	{
	    char buf[ATRACE_MESSAGE_LEN];
	    int len = snprintf(buf, ATRACE_MESSAGE_LEN, "B|%d|%s", getpid(), name);
	    write(atrace_marker_fd, buf, len);
	}

	static inline void trace_end()
	{
	    char c = 'E';
	    write(atrace_marker_fd, &c, 1);
	}

private:
static int atrace_marker_fd;

    static inline void Init()
    {
#if ENABLE_TRACE
        const char* const traceFileName = "/sys/kernel/debug/tracing/trace_marker";
        sTraceFD = open(traceFileName, O_WRONLY);
        if (sTraceFD == -1) {
            std::cout << "error opening trace file: " << strerror(errno) << " (" << errno << ")" << std::endl;
            // sEnabledTags remains zero indicating that no tracing can occur
        }
#endif
    }
};

class ScopedTrace {
public:
    inline ScopedTrace(const char* name)
    {
#if 1
        Tracer::trace_begin(name);
#endif
    }

    inline ~ScopedTrace()
    {
#if 1
        Tracer::trace_end();
#endif
    }
};



#endif
